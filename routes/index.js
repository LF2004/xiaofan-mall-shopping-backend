const express = require('express');
const router = express.Router();
// 导入数据库连接
var connection = require('../db/index')
// 用于对敏感数据进行加密
const bcrypt = require('bcryptjs');
const bcrypter = require("crypto-js");
const indexSql = require('../db/publicSql/index/indexSql')
const userSql = require('../db/publicSql/user/userSql')
// 用于生成token
const jwt = require('jsonwebtoken')
// 导入全局配置文件
const config = require('../config')
const path = require("path");
const fs = require("fs");

const QcloudSms = require("qcloudsms_js");
setInterval(function () {
    connection.query('SELECT 1');
}, 5000);


const redis = require('redis')
const nodemailer = require("nodemailer");
const axios = require("axios");
const {default: AlipayFormData} = require("alipay-sdk/lib/form");
const alipaySdk = require("../db/alipay"); // 引入 redis


// 创建 Redis 客户端实例
const redisClient = redis.createClient({
  url: 'redis://127.0.0.1:6379',
  retry_strategy: (options) => {
    if (options.total_retry_time > 1000 * 60 * 60) {
      // End retrying after a specific timeout and emit error
      return new Error('Retry time exhausted');
    }
    if (options.attempt > 10) {
      // End retrying with a maximum number of attempts
      return undefined;
    }
    // Retry with exponential backoff
    return Math.min(options.attempt * 100, 2000);
  },
});

// 监听 'ready' 事件
redisClient.on('ready', () => {
  console.log('Redis is ready...');
});

// 监听 'error' 事件
redisClient.on('error', (err) => {
  console.error('Redis error:', err);
});

// 连接 Redis 服务器
redisClient.connect().catch((error) => {
  console.error('Failed to connect to Redis:', error);
});


function setTimeDateFmt(s) {
    return s < 10 ? '0' + s : s
}

// 文件预览
router.get('/api/load/:fileName', (req, res, next) => {
    let fileName = req.params.fileName; // 访问的文件名
    const baseDir = path.resolve(__dirname, '.', '..'); // 向上两级目录
    let filePath = path.join(baseDir, "images/" + fileName); // 当前项目中文件的存储地址，filePath打印出来应该能访问到上传上去的文件地址路径才是正确的
    console.log(filePath)
    let stats = fs.statSync(filePath);
    if (stats.isFile()) {
        res.set({
            'Content-Type': 'application/octet-stream;', // 告诉浏览器，返回的是一个二进制文件
            'Content-Disposition': 'attachment;filename=' + encodeURIComponent(fileName), // 返回的文件名，如果不加encodeURIComponent，中文文件名的文件是访问不了也下载不了的
            'Content-Length': stats.size // 告诉浏览器，返回的文件大小
        });
        fs.createReadStream(filePath).pipe(res); // 返回一个二进制流
    } else {
        res.send(400);
    }
})


router.get('/api/order/pay',(req,res) =>{
    //开始对接支付宝API
    const formData = new AlipayFormData();
    // 调用 setMethod 并传入 get，会返回可以跳转到支付页面的 url
    formData.setMethod('get');
    //支付时信息
    formData.addField('bizContent', {
        out_trade_no: '202405010223912331',//订单号
        product_code: 'FAST_INSTANT_TRADE_PAY',//写死的
        total_amount: '0.01',//价格
        subject: '小帆测试商品',//商品名称
        // 支付时间为 5分钟
        timeout_express: '5m',
    });
    //支付成功或者失败跳转的链接
    // formData.addField('returnUrl', `http://localhost:5173/#/pagesOrder/detail/detail?id=${orderId}`);
    //返回promise
    const r = alipaySdk.exec(
        'alipay.trade.page.pay',
        {},
        {formData: formData},
    );
    //对接支付宝成功，支付宝方返回的数据
    r.then(resp => {
        res.send({
            code:200,
            msg:'正在支付',
            paymentUrl: resp
        })
    })
});

router.get('/api/zfb/login',async (req,res) =>{
    const result = await alipaySdk.exec("alipay.system.oauth.token", {
        refresh_token: "201208134b203fe6c11548bcabd8da5bb087a83b",
        code: req.query.auth_code,
        grant_type: "authorization_code",
    }); // 获取用户登录后的授权信息
    console.log(result)
});

function getRandomString(len) {
    let _charStr = 'abacdefghjklmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789',
        min = 0,
        max = _charStr.length - 1,
        _str = '';                    //定义随机字符串 变量
    //判断是否指定长度，否则默认长度为15
    len = len || 15;
    //循环生成字符串
    for (var i = 0, index; i < len; i++) {
        index = (function (randomIndexFunc, i) {
            return randomIndexFunc(min, max, i, randomIndexFunc);
        })(function (min, max, i, _self) {
            let indexTemp = Math.floor(Math.random() * (max - min + 1) + min),
                numStart = _charStr.length - 10;
            if (i == 0 && indexTemp >= numStart) {
                indexTemp = _self(min, max, i, _self);
            }
            return indexTemp;
        }, i);
        _str += _charStr[index];
    }
    return _str;
}

function randomNumber() {
    const now = new Date();
    let uid = now.getFullYear().toString() + (Math.round(Math.random() * 1000000)).toString();
    return uid;
};
// 发送qq邮箱
const postEmailYzm = async (user, yamCode) => {
    let codeInfo = {
        user,
        yamCode
    }
    const transporter = nodemailer.createTransport({
        host: "smtp.qq.com",
        port: 587,
        secure: false,
        auth: {
            user: "2217898929@qq.com", //我的邮箱
            pass: "fuwdnxkfwfdpebdc", //授权码
        },
    });

    const info = await transporter.sendMail({
        from: "2217898929@qq.com",//发送人邮箱
        to: `${user}`,//发送给谁
        subject: "小帆购物验证码",//标题
        html: `
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>小帆购物邮箱验证</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        .container {
            width: 450px;
            margin: 100px auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }

        .qr-code {
            width: 220px;
            height: 200px;
            margin: 0 auto;
        }

        .qr-code img {
            width: 100%;
            height: 100%;
        }

        .verification-code {
            margin-top: 50px;
        }

        .verification-code h1 {
            font-size: 24px;
            margin: 0;
        }

        .verification-code span {
            display: inline-block;
            color: crimson;
            animation: pulse 1s infinite;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="qr-code">
        <h4>公众微信公众号领取优惠券</h4>
        <img src="https://www.z4a.net/images/2024/01/06/qrcode_for_gh_994d57b6897e_430.jpg" alt="QR Code">
    </div>
    <div class="verification-code">
        <h1>您的验证码是：<span class="yzmCode">${yamCode}</span></h1>
    </div>
</div>
</body>
</html>
`,
    });

    return codeInfo;
};

// 用户登录
router.post('/api/login', (req, res, next) => {
    const userInfo = req.body;
    connection.query(userSql.SelectUserIsEsxistByUname(), userInfo.uName, (err, results) => {
        if (err) return res.send({code: 202, msg: err.message})
        if (results.length !== 1) {
            return res.send({code: 202, msg: '登录失败,用户名不存在!'})
        }
        // 用于解析加密后的用户密码
        const decryptPwd = bcrypter.SHA256(userInfo.uPwd + results[0].uSign, 10);
        if (decryptPwd == results[0].xiaofan_pwd) {
            // 登录成功后生成token
            // 对用户信息进行加密生成token
            const userTokenStr = jwt.sign({uid: results[0].uid}, config.jwtSecretKey, {expiresIn: config.expiresIn})
            // 给客户端header携带token
            res.header('set-Cookie', userTokenStr)
            res.send({
                code: 200,
                result: {
                    token: 'Bearer ' + userTokenStr,
                    userInfo: {
                        NickName: results[0].NickName,
                        uid:results[0].uid,
                        avatar: results[0].avatar,
                        enrollTime: results[0].create_time
                    }
                },
                msg: '登录成功!'
            });
            // 登录成功后修改用户toekn
            connection.query(userSql.ReviseUserToken(), [userTokenStr, results[0].uid]);
        } else {
            return res.send({code: 202, msg: '密码错误!'});
        }
    })
});

// 用户注册
router.post('/api/enroll', (req, res, next) => {
    const userInfo = req.body;
    if (userInfo.uPhone.trim().length == 0 || userInfo.uPwd.trim().length == 0) {
        return res.send({code: 202, msg: '用户名或密码不能为空!'});
    }
    connection.query(userSql.SelectUserIsEsxistByUname(), [userInfo.uPhone], (err, results) => {
        if (results.length > 0) {
            return res.send({code: 202, msg: '该账号已存在请更换!'});
        } else {
            if (err) {
                return res.send({code: 202, msg: err.message});
            }
            // 加盐
            const uSign = getRandomString(10);
            const uPwd = bcrypter.SHA256(userInfo.uPwd + uSign, 10);
            const uid = randomNumber();
            connection.query(userSql.enrollUser(), [uid, userInfo.uPhone, `${uPwd}`, uSign], (e, r) => {
                if (e) return res.send({code: 202, msg: e.message});
                res.send({
                    code: 200,
                    msg: '注册成功!'
                })
            })
        }

    })
});

// 发送qq邮箱验证码
router.post('/api/code', async (req, res, next) => {
    let code = req.body.code;
    let yamCode = Math.round(Math.random() * 1000000); // 随机生成6位数验证码
    const codeData = await postEmailYzm(code, yamCode);
    // 保存用户code进行校验
    redisClient.set('userCode', JSON.stringify({user: codeData.user, code: codeData.yamCode}), 'EX', 60);
    res.send({
        code: 200,
        msg: '获取邮箱验证码成功'
    })
});

// 校验邮箱验证码
router.post('/api/verifyYxCode', async (req, res, next) => {
    // 开始校验邮箱
    let skyCode = await redisClient.get('userCode');
    skyCode = JSON.parse(skyCode);
    let userName = req.body.uEmail;
    let userCode = req.body.code;
    let userPwd = req.body.uPwd;
    if (!skyCode) {
        return res.send({code: 201, msg: '验证码已过期'});
    }
    connection.query(userSql.SelectUserIsEsxistByUname(), [userName], (e, r) => {
        if (r.length === 0) {
            if (skyCode.user == userCode || skyCode.code == userCode) {
                // 加盐
                const uSign = getRandomString(10);
                const uPwd = bcrypter.SHA256(userPwd + uSign, 10);
                const uid = randomNumber();
                const userTokenStr = jwt.sign({uid: uid}, config.jwtSecretKey, {expiresIn: config.expiresIn})
                connection.query(userSql.enrollUser(), [uid, userName, `${uPwd}`, uSign], async (err, result) => {
                    // 通过QQ调用获取用户昵称头像
                    let qq = userName.replace(/\D/g, "");
                    const u = await axios(`https://api.usuuu.com/qq/${qq}`);
                    const userInfo = u.data.data;
                    connection.query(userSql.InsertUserInfo(), [uid, userInfo.name, '未知', '未知', '未知', '未知', userInfo.avatar, 'Bearer ' + userTokenStr]);
                    redisClient.del('userCode');
                    return res.send({
                        code: 200,
                        msg: '注册成功'
                    })
                })
            } else {
                return res.send({
                    code: 201,
                    msg: '验证码错误'
                })
            }
        } else {
            return res.send({
                code: 201,
                msg: '该用户已注册'
            })
        }
    })


});


// 邮箱登录
router.post('/api/email/login', async (req, res, next) => {
    // 开始校验邮箱
    let skyCode = await redisClient.get('userCode');
    skyCode = JSON.parse(skyCode);
    let userName = req.body.uEmail;
    let userCode = Number(req.body.code);
    if (!skyCode) {
        return res.send({code: 201, msg: '验证码已过期'});
    }
    if (userCode !== skyCode.code) {
        return res.send({code: 201, msg: '验证码错误'});
    }
    connection.query(userSql.SelectUserIsEsxistByUname(), [userName], (e, results) => {
        if (e) return res.send({msg: e.message});
        if (results.length === 0 || skyCode.code == userCode) {
            // 登录成功
            const userTokenStr = jwt.sign({uid: results[0].uid}, config.jwtSecretKey, {expiresIn: config.expiresIn})
            res.send({
                code: 200,
                result: {
                    token: 'Bearer ' + userTokenStr,
                    userInfo: {
                        NickName: results[0].NickName,
                        avatar: results[0].avatar,
                        enrollTime: results[0].create_time
                    }
                },
                msg: '登录成功!'
            });
            redisClient.del('userCode');
            // 登录成功后修改用户toekn
            connection.query(userSql.ReviseUserToken(), [userTokenStr, results[0].uid]);

        } else {
            return res.send({code: 201, msg: '该邮箱用户不存在'})
        }
    })
});

// 开始进行公众号用户注册
router.get('/api/Gzh/start', (req, res, next) => {
    const sql = 'INSERT INTO xiaofan_gzh_user (uid,FromUserName,create_time) VALUES (?,?,NOW())';
    const uid = randomNumber();
    connection.query(sql, [uid, ''], (err, result) => {
        res.send({
            code: 200,
            verifyCode: uid,
            msg: '开始校验公众号注册用户'
        })
    })
});

// 进行公众号用户注册
router.post('/api/getGzh/enroll', async (req, res, next) => {
    const userInfo = req.body;
    const uid = userInfo.verifyCode;
    const sql = 'UPDATE xiaofan_gzh_user SET FromUserName=?,create_time=NOW() WHERE uid = ?';
    const isUserUidEnrollSql = 'SELECT * FROM xiaofan_gzh_user WHERE uid = ?';
    const isUserFromUserNameEnrollSql = 'SELECT * FROM xiaofan_gzh_user WHERE FromUserName = ?';
    if (userInfo.FromUserName) {
        const uuid = await redisClient.get('uid');
        connection.query(isUserFromUserNameEnrollSql, [userInfo.FromUserName], async (e, r) => {
            if (r.length > 0) {
                return res.send({
                    code: 201,
                    msg: '该用户已注册'
                })

            } else {
                const userTokenStr = jwt.sign({uid: uuid}, config.jwtSecretKey, {expiresIn: config.expiresIn})
                connection.query(userSql.InsertUserInfo(), [uuid, userInfo.NickName, '未知', '未知', '未知', '未知', userInfo.avatar, 'Bearer ' + userTokenStr]);
                connection.query(sql, [userInfo.FromUserName, uuid], (err, result) => {
                    redisClient.del('uid')
                    return res.send({
                        code: 200,
                        msg: '公众号用户注册成功!'
                    })
                })
            }
        })

    } else {
        connection.query(isUserUidEnrollSql, [uid], async (erro, rr) => {
            if (!rr[0].FromUserName) {
                await redisClient.del('uid')
                await redisClient.set('uid', uid);
                return res.send({
                    code: 200,
                    msg: '获取用户id成功!'
                })
            } else {
                return res.send({
                    code: 201,
                    msg: '该用户已注册'
                })
            }
        })

    }
});

// 查询公众号用户是否注册
router.get('/api/getGzh/isEnroll', (req, res, next) => {
    const sql = 'SELECT * FROM xiaofan_gzh_user WHERE uid = ?';
    const userInfoSql = 'SELECT * FROM xiaofan_user_info WHERE uid = ?';
    connection.query(sql, [req.query.verifyCode], (err, result) => {
        if (result[0].FromUserName) {
            connection.query(userInfoSql, [req.query.verifyCode], (e, r) => {
                return res.send({
                    code: 200,
                    data: {
                        token: r[0].user_token,
                        userInfo: {
                            NickName: r[0].NickName,
                            avatar: r[0].avatar
                        }
                    },
                    msg: '注册成功!'
                })
            })
        } else {
            return res.send({
                code: 201,
                msg: '该用户正在注册'
            })
        }
    })
});

// 公众号预登录
router.post('/api/Gzg/login/verify', (req, res, next) => {
    const userInfo = req.body;
    const sql = 'SELECT * FROM xiaofan_gzh_user WHERE FromUserName = ?';
    connection.query(sql, [userInfo.FromUserName], async (err, result) => {
        if (result.length > 0) {
            await redisClient.set('FromUserName', userInfo.FromUserName);
            return res.send({
                code: 200,
                msg: '开始校验登录!'
            })

        } else {
            return res.send({
                code: 201,
                msg: '用户不存在需关注公众号注册!'
            })
        }
    })
});

router.get('/api/Gzg/login/FromUserName', async (req, res, next) => {
    const FromUserName = await redisClient.get('FromUserName');
    if (FromUserName) {
        redisClient.del('FromUserName')
        return res.send({
            code: 200,
            FromUserName: FromUserName,
            msg: '获取FromUserName成功!'
        })
    } else {
        return res.send({
            code: 201,
            msg: '正在登录!'
        })
    }
})

// 查询公众号用户登录
router.get('/api/Gzh/login', async (req, res, next) => {
    // 查询用户是否存在
    const UserIsLogin = 'SELECT * FROM xiaofan_gzh_user u,xiaofan_user_info i WHERE u.FromUserName = ? AND i.uid = u.uid';
    connection.query(UserIsLogin, [req.query.FromUserName], (err, result) => {
        if (result.length > 0) {
            const uid = randomNumber();
            const userTokenStr = jwt.sign({uid: result[0].uid}, config.jwtSecretKey, {expiresIn: config.expiresIn})
            // 开始登录
            redisClient.del('FromUserName');
            // 登录成功后修改用户toekn
            connection.query(userSql.ReviseUserToken(), [userTokenStr, result[0].uid]);
            return res.send({
                code: 200,
                data: {
                    token: 'Bearer ' + userTokenStr,
                    userInfo: {
                        NickName: result[0].NickName,
                        uid:result[0].uid,
                        avatar: result[0].avatar,
                        enrollTime: result[0].create_time
                    }
                },
                msg: '登录成功!'
            })
        } else {
            return res.send({
                code: 201,
                msg: '已登录!'
            })
        }
    })
});


// 管理员登录
router.post('/api/root/login', (req, res, next) => {
    const userInfo = req.body;
    connection.query(userSql.SelectUserIsEsxistByUname(), userInfo.uName, (err, results) => {
        if (err) return res.send({code: 202, msg: err.message})
        if (results.length !== 1) {
            return res.send({code: 202, msg: '登录失败,用户名不存在!'})
        }
        if(results[0].identity !== 1) return res.send({code: 202, msg: '该用户不是管理员身份'});
        // 用于解析加密后的用户密码
        const decryptPwd = bcrypter.SHA256(userInfo.uPwd + results[0].uSign, 10);
        if (decryptPwd == results[0].xiaofan_pwd) {
            // 登录成功后生成token
            // 对用户信息进行加密生成token
            const userTokenStr = jwt.sign({uid: results[0].uid}, config.jwtSecretKey, {expiresIn: config.expiresIn})
            // 给客户端header携带token
            res.header('set-Cookie', userTokenStr)
            res.send({
                code: 200,
                result: {
                    token: 'Bearer ' + userTokenStr,
                    userInfo: {
                        NickName: results[0].NickName,
                        avatar: results[0].avatar,
                        enrollTime: results[0].create_time
                    }
                },
                msg: '登录成功!'
            });
            // 登录成功后修改用户toekn
            connection.query(userSql.ReviseUserToken(), [userTokenStr, results[0].uid]);
        } else {
            return res.send({code: 202, msg: '密码错误!'});
        }
    })
});


// 获取首页商品分类图标信息
router.get('/api/goods/category', (req, res, next) => {
    connection.query(indexSql.SelectGoodsCategory(), (err, results) => {
        if (err) return res.send({code: 201, msg: err.message})
        if (results.length <= 0) return res.send({code: 201, msg: '暂无数据'})
        res.send({
            code: 200,
            result: results,
            msg: '获取商品分类图标成功!'
        })
    })
})

// 获取首页轮播图信息
router.get('/api/goods/banner', (req, res, next) => {
    connection.query(indexSql.SelectGoodsBanner(), (err, results) => {
        if (err) return res.send({code: 201, msg: err.message})
        if (results.length <= 0) {
            return res.send({code: 201, msg: '暂无数据'})
        }else {
            res.send({
                code: 200,
                result: results,
                msg: '获取轮播图信息成功!'
            })
        }
    })
})

// 获取商品列表
router.get('/api/goods', (req, res, next) => {
    if (req.query.pageNum <= 0) return res.send({msg: '页数不能小于0'})
    const offset = parseInt((req.query.pageNum - 1) * req.query.pageSize);
    const pageNum = offset
    const pageSize = parseInt(req.query.pageSize || 1)
    if (pageNum === undefined) return res.send({msg: '页码参数错误'})
    if (pageSize === undefined) return res.send({msg: '页码数量参数错误'})
    connection.query(indexSql.SelectGoodsList(), [pageNum, pageSize], (err, results) => {
        if (err) return res.sendStatus(201).send({msg: err.message});
        if (results.length <= 0) {
            return res.send({code: 201, msg: '到底啦!!'})
        }
        res.send({
            code: 200,
            result: results,
            msg: '获取商品列表成功!'
        })
    })
});



// 获取商品详情
router.get('/api/goods/detail', (req, res, next) => {
    connection.query(indexSql.SelectGoodsDetail(), [req.query.goodId], (err, result) => {
        if (err) return res.sendStatus(201).send({msg: err.message});
        let parsedResult = null;
        let pictrue = '';
        let hasError = false;
        try {
            const item = result[0]; // 假设只需要处理第一条数据
            item.detail_img = JSON.parse(item.detail_img);
            item.picture = JSON.parse(item.picture);
            // 使用 map 方法遍历数据，去掉 title 属性并将 text 属性改为 imgUrl
            const modifiedData = item.picture.filter(item => Object.keys(item).length !== 0 && item.text !== undefined)
                .map(item => ({imgUrl: item.text}));
            item.goods_swiper_img = modifiedData;
            item.skuId = JSON.parse(item.skuId);
            item.sName = JSON.parse(item.sName);
            item.size = JSON.parse(item.size);
            item.priceList = JSON.parse(item.priceList);
            item.spec_list = JSON.parse(item.spec_list);
            item.inventory = JSON.parse(item.inventory);
            // 转换数据
            const convertedData = {
                // 商品ID
                "_id": "002",
                // 商品名称
                "name": item.name,
                // 商品头像
                "goods_thumb": item.picture[1].text,
                // 该商品对应的sku列表
                "sku_list": [],
                // 商品规格列表
                "spec_list": []
            };
            // 遍历SKU列表
            for (let i = 1; i < item.priceList.length; i++) {
                const skuId = item.skuId[i - 1].text;
                const goodsName = item.name;
                const image = item.picture[i].text;
                const price = item.priceList[i].text;
                const skuNameArr = [item.sName[i].text, item.size[i].text];
                const stock = item.inventory.map(v => v.text).filter(item => item !== undefined);
                convertedData.sku_list.push({
                    "_id": skuId,
                    "goods_id": item.goodsId.toString(),
                    "goods_name": goodsName,
                    "image": image,
                    "price": price,
                    "sku_name_arr": skuNameArr,
                    "stock": parseInt(stock[i - 1])
                });
            }

            // 遍历规格列表
            for (let i = 0; i < convertedData.sku_list[0].sku_name_arr.length; i++) {
                const specGroup = {
                    list: [],
                    name: ''
                };

                for (let j = 0; j < convertedData.sku_list.length; j++) {
                    const skuName = convertedData.sku_list[j].sku_name_arr[i];
                    specGroup.list.push({name: skuName});
                }
                let itemName = item.spec_list.map(v => v.text).filter(item => item !== undefined);
                specGroup.name = itemName[i];

                convertedData.spec_list.push(specGroup);
                // 如果数据格式正确，则将其设置为要返回的数据
                parsedResult = {
                    goodsId: item.goodsId,
                    name: item.name,
                    price: result[0].price,
                    oldPrice: item.oldPrice,
                    goods_swiper_img: item.goods_swiper_img,
                    detail_img: item.detail_img,
                    // 商品头像
                    convertedData: convertedData
                };
            }
        } catch (error) {
            return connection.query(indexSql.SelectGoodsInfo(),[req.query.goodId],(a,b) =>{
                return res.send({
                    code: 200,
                    result: {
                        goods_swiper_img:[
                            {
                                imgUrl:b[0].picture
                            }
                        ],
                        name:b[0].name,
                        price:b[0].price,
                        oldPrice: b[0].oldPrice
                    },
                    msg: '获取商品详情成功!'
                });
            })

            hasError = true;
        }

        if (hasError) {
            res.status(201).send({code: 201, msg: '解析 JSON 数据时出现错误'});
        } else if (parsedResult) {
            res.send({
                code: 200,
                result: parsedResult,
                msg: '获取商品详情成功!'
            });
        } else {
            res.status(404).send({code: 404, msg: '未找到符合条件的数据'});
        }

    })
});

// 查询商品列表
router.get('/api/goods/search',(req,res) =>{
    let type = req.query.type;
    if(type == 0 || type == 'undefined') {
        connection.query(userSql.SearchGoods(),[req.query.name],(error,results)=>{
            if(results.length === 0) {
                return res.send({code:200,msg:'暂无商品数据'})
            }else {
                return res.send({
                    code:200,
                    results,
                    msg:'查询商品数据成功'
                })
            }
        })
    }else if(type == 1){
        connection.query(userSql.SearchGoodsOrderByPriceSortASC(),[req.query.name],(error,results)=>{
            if(results.length === 0) {
                return res.send({code:200,msg:'暂无商品数据'})
            }else {
                return res.send({
                    code:200,
                    results,
                    msg:'查询商品数据成功'
                })
            }
        })
    }else if(type == undefined){
        connection.query(userSql.SearchGoods(),[req.query.name],(error,results)=>{
            if(results.length === 0) {
                return res.send({code:200,msg:'暂无商品数据'})
            }else {
                return res.send({
                    code:200,
                    results,
                    msg:'查询商品数据成功'
                })
            }
        })
    }else {
        connection.query(userSql.SearchGoodsOrderByPriceSortDESC(),[req.query.name],(error,results)=>{
            if(results.length === 0) {
                return res.send({code:200,msg:'暂无商品数据'})
            }else {
                return res.send({
                    code:200,
                    results,
                    msg:'查询商品数据成功'
                })
            }
        })
    }

});

// 搜索商品
router.get('/api/search/goods',(req,res) =>{
    connection.query(userSql.GoodsSearch(),[`%${req.query.name}%`],(error,results)=>{
        console.log(error)
        if(results.length === 0) {
            return res.send({code:200,msg:'暂无商品数据'})
        }else {
            return res.send({
                code:200,
                results,
                msg:'搜索商品数据成功'
            })
        }
    })
});

// 获取推荐商品
router.get('/api/recommend/goods',(req,res)=>{
    connection.query(userSql.RecommendGoods(),(error,results)=>{
        res.send({
            code:200,
            results,
            msg:'获取推荐商品成功'
        })
    })
});

// 获取详情页相关商品
router.get('/api/correlationl',(req,res) =>{
    connection.query(userSql.GoodsDetaiCorrelationl(),[req.query.goodsId],(err,result) =>{
        if(result.length === 0) {
            return res.send({code:200,msg:'暂无商品数据'})
        }else {
            return res.send({
                code:200,
                result,
                msg:'获取相关商品数据成功'
            })
        }
    })
})

// 获取分类商品
router.get('/api/goods/classfyGoods',(req, res) =>{
    connection.query(indexSql.SelectClassfyGoods(),[req.query.type],(err,result) =>{
        connection.query(indexSql.SelectClassfyTitle(),(e,r) =>{
            const classifyName = r.map(v => v.classify_parent_name);
            const uniqueArr = [...new Set(classifyName)]
            const classifiedGoods = {
                children: []
            };

            result.forEach((item) => {
                const parentName = item.classify_parent_name;
                const childName = item.classify_child_name;

                let parentCategory = classifiedGoods.children.find(
                    (category) => category.name === parentName
                );

                if (!parentCategory) {
                    parentCategory = {
                        name: parentName,
                        goods: []
                    };
                    classifiedGoods.children.push(parentCategory);
                }

                let childCategory = parentCategory.goods.find(
                    (category) => category.name === childName
                );

                if (!childCategory) {
                    childCategory = {
                        name: childName,
                        goods: []
                    };
                    parentCategory.goods.push(childCategory);
                }

                childCategory.goods.push(item);
            });

            if (classifiedGoods.children.length > 0) {
                classifiedGoods.children = classifiedGoods.children[0].goods;
            } else {
                classifiedGoods.children = [];
            }



            return res.send({
                code:200,
                msg:'获取分类商品成功',
                result:{
                    classfyGoods:classifiedGoods,
                    classfyGoodsTitle:uniqueArr
                }
            })
        })
    })
});

// 获取商品评论
router.get('/api/comments',(req,res) =>{
    connection.query(userSql.SelectGoodsComments(),[req.query.goodsId],(err,result) =>{
        if(result.length === 0) {
            return res.send({code:200,msg:'暂无商品评论数据'})
        }else {
            let commentsList = [];
            let allTotal = result.reduce((a, b) => a + b.total_comments, 0);
            result.forEach(v => {
                commentsList.push({
                    "comment_id": v.comment_id,
                    "comment_uid": v.comment_uid,
                    "comment_user_name": v.comment_user_name,
                    "avatar": v.avatar,
                    "comment_goodsId": v.comment_goodsId,
                    "comment_type": v.comment_type,
                    "comment_content": v.comment_content,
                    "comment_time": v.comment_time
                });
            });

            let commentsReplyList = result.map(v => JSON.parse(v.replies));

            commentsReplyList = commentsReplyList.map(replyList => replyList.filter(item => item.reply_id !== null));
            return res.send({
                code: 200,
                result:{
                    commentsList,
                    commentsReplyList,
                    allTotal
                },
                msg: '获取相关商品评论数据成功'
            })
        }
    })
});

// 获取商品名称与图片
router.get('/api/goodsInfo',(req,res) =>{
    connection.query(indexSql.SelectGoodsNameAndPicture(),[req.query.goodsId],(err,result) =>{
        return res.send({
            code:200,
            result:result[0],
            msg:'获取相关商品数据成功'
        })
    })
});



module.exports = router;
