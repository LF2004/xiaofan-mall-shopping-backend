var express = require('express');
const https = require("https");
var router = express.Router();
// 导入数据库连接
var connection = require('../db/index');
const userSql = require('../db/publicSql/user/userSql');
const index = require("../db/publicSql/index/indexSql");
const axios = require('axios');
//引入支付宝配置文件
const alipaySdk = require('../db/alipay.js');
const indexSql = require("../db/publicSql/index/indexSql");
const AlipayFormData = require('alipay-sdk/lib/form').default;
/* GET users listing. */
router.get('/', function (req, res, next) {
    res.send('respond with a resource');
});
setInterval(function () {
    connection.query('SELECT 1');
}, 10000);

// 生成一个订单
// 生成订单号order_id 规则: 时间戳 + 6位随机数
function setTimeDateFmt(s) {
    return s < 10 ? '0' + s : s
}

function randomNumber() {
    const now = new Date();
    let month = now.getMonth() + 1;
    let day = now.getDate();
    let hour = now.getHours();
    let minutes = now.getMinutes();
    let seconds = now.getSeconds();
    month = setTimeDateFmt(month);
    day = setTimeDateFmt(day);
    hour = setTimeDateFmt(hour);
    minutes = setTimeDateFmt(minutes);
    seconds = setTimeDateFmt(seconds);
    let orderCode = now.getFullYear().toString() + month.toString() + day + hour + minutes + seconds + (Math.round(Math.random() * 1000000)).toString();
    return orderCode;
};

function addMinutes(minutesToAdd) {
    const dateObj = new Date();
    const updatedDateObj = new Date(dateObj.getTime() + minutesToAdd * 60000);

    const year = updatedDateObj.getFullYear();
    const month = (updatedDateObj.getMonth() + 1).toString().padStart(2, '0');
    const day = updatedDateObj.getDate().toString().padStart(2, '0');
    const hours = updatedDateObj.getHours().toString().padStart(2, '0');
    const minutes = updatedDateObj.getMinutes().toString().padStart(2, '0');
    const seconds = updatedDateObj.getSeconds().toString().padStart(2, '0');

    const formattedDate = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;

    return formattedDate;
}


// 加入购物车
router.post('/cart', (req, res, next) => {
    // 获取商品sku数据
    let skuId = req.body.skuId;
    const SelectSkuDetailSql = `SELECT * FROM xiaofan_goods_sku WHERE JSON_CONTAINS(skuId, '{"text": "${skuId}"}', '$')`;
    connection.query(SelectSkuDetailSql, (err, result) => {
        // 将skuId字符串解析为数组对象
        let item = result[0];
        const skuList = JSON.parse(item.skuId);
        // 遍历sku列表
        for (let sku of skuList) {
            if (sku.text === skuId) {
                // 根据skuId找到对应的规格
                const index = skuList.indexOf(sku);
                const name = JSON.parse(item.name)[index + 1].text;
                const price = JSON.parse(item.price)[index + 1].text;
                const size = JSON.parse(item.size)[index + 1].text;
                const inventory = JSON.parse(item.inventory)[index + 1].text;
                const picture = JSON.parse(item.picture)[index + 1].text;
                const skuName = name + size;
                // 添加商品到用户购物车列表
                connection.query(userSql.SelectGoods(), [item.goodsId], (e, r) => {
                    connection.query(userSql.addUserCart(), [req.user.uid, item.goodsId, skuId, r[0].name, skuName, picture, req.body.count, price], (e, r) => {
                        res.send({
                            code: 201,
                            msg: '添加购物车成功'
                        })
                    })
                })

                break; // 找到对应的规格后退出循环
            }
        }
    })
});

// 修改购物车商品数量
router.put('/cart/num', (req, res, next) => {
    let cartId = req.body.cartId;
    let count = Number(req.body.count);
    let inventory = 0; // sku商品所剩的库存
    connection.query(userSql.SelectUserCartIsMy(), [req.user.uid, cartId], (e, r) => {
        if (r.length === 0) {
            return res.send({
                code: 201,
                msg: '商品不存在'
            })
        } else {
            connection.query(userSql.SelectUserCart(), [cartId], (err, result) => {
                if (count < 1) {
                    return res.send({
                        code: 201,
                        msg: '数量不能少于1'
                    })
                } else {
                    // 修改用户购物车商品数量  查询商品库存数是否超过用户数量···
                    connection.query(userSql.SelectSkuGood(), [result[0].goodsId], (ee, rr) => {
                        // 将skuId字符串解析为数组对象
                        let item = rr[0];
                        const skuList = JSON.parse(item.skuId);
                        // 遍历sku列表
                        for (let sku of skuList) {
                            if (sku.text == result[0].skuId) {
                                const index = skuList.indexOf(sku); // 根据skuId找到对应的规格
                                inventory = JSON.parse(item.inventory)[index + 1].text;
                                break; // 找到对应的规格后退出循环
                            }
                        }
                        if (count > Number(inventory)) {  // 校验用户修改的商品数量是否超过商品库存
                            return res.send({
                                code: 201,
                                msg: '超过商品库存啦'
                            })
                        } else {
                            // 开始修改购物车商品数量  同时更改库存
                            connection.query(userSql.changeUserCartNum(), [req.body.count, cartId, req.user.uid], (err, result) => {
                                return res.send({
                                    code: 200,
                                    msg: '修改库存成功'
                                })
                            })
                        }
                    })
                }
            });
        }
    })


});

// 修改购物车选择状态
router.put('/cart/select', (req, res, next) => {
    let cartId = req.body.cartId;
    let select = req.body.select;
    connection.query(userSql.SelectUserCartIsMy(), [req.user.uid, cartId], (e, r) => {
        if (r.length === 0) {
            return res.send({
                code: 201,
                msg: '商品不存在'
            })
        } else {
            connection.query(userSql.changeUserCartSelect(), [select, cartId], (err, result) => {
                return res.send({
                    code: 200,
                    msg: '修改选中状态成功!'
                })
            })
        }
    })

});

// 购物车全选
router.put('/cart/allSelect', (req, res, next) => {
    connection.query(userSql.changeUserCartAllSelect(), [req.body.select, req.user.uid], (e, r) => {
        if (e) {
            return res.send({
                code: 201,
                msg: '未知错误'
            })
        } else {
            return res.send({
                code: 200,
                msg: '修改成功'
            })
        }
    })
})

// 删除购物车商品
router.delete('/cart/delete', (req, res, next) => {
    let cartId = req.body.cartId;
    connection.query(userSql.SelectUserCartIsMy(), [req.user.uid, cartId], (e, r) => {
        if (r.length === 0) {
            return res.send({
                code: 201,
                msg: '商品不存在'
            })
        } else {
            connection.query(userSql.deleteUserCart(), [cartId,req.user.uid], () => {
                return res.send({
                    code: 200,
                    msg: '删除购物车商品成功'
                })
            });
        }
    })

});

// 获取用户购物车列表
router.get('/cartList', (req, res, next) => {
    connection.query(userSql.SelectUserCartList(), [req.user.uid], (e, r) => {
        res.send({
            code: 200,
            result: {
                cartList: r
            },
            msg: '获取购物车列表成功!'
        })
    })
});

// 获取预付订单
router.get('/order/pre', (req, res, next) => {
    connection.query(userSql.SelectOrderPre(), [req.user.uid], (error, results) => {
        let allPrice = 0;
        results.forEach((v) => {
            allPrice += v.count * v.price;
        })
        res.send({
            code: 200,
            result: {
                "OrderPre": results,
                "allPrice": (allPrice).toFixed(2),
                "postFee": 5.00
            },
            msg: '获取预支付订单成功'
        })
    })
});

// 创建用户订单
router.post('/order/create', (req, res, next) => {
    let uid = req.user.uid;
    let cartId = JSON.parse(req.body.cartId);

    connection.query(userSql.SelectUserOrderData(), [cartId, uid], (error, results) => {
        // 通过用户购物车来插入用户订单数据
        let order_detail = {
            "order_id": randomNumber(),
            "goodsId": [],
            "goods_name": [],
            "goods_img": [],
            "skuId": [],
            "sku_name": [],
            "count": [],
            "price": [],
            "allPrice": '',
            "postFee": 5.00,
            "create_time": addMinutes(0),
            "over_time": addMinutes(30),
        }
        let allPrice = 0;
        for (let i = 0; i < results.length; i++) {
            order_detail.goodsId.push(`{"text":"${results[i].goodsId}"}`);
            order_detail.goods_name.push(`{"text":"${results[i].goods_name}"}`);
            order_detail.goods_img.push(`{"text":"${results[i].picture}"}`);
            order_detail.skuId.push(`{"text":"${results[i].skuId}"}`);
            order_detail.sku_name.push(`{"text":"${results[i].sku_name}"}`);
            order_detail.count.push(`{"text":"${results[i].count}"}`);
            order_detail.price.push(`{"text":"${results[i].price}"}`);
            allPrice += results[i].count * results[i].price;
            order_detail.allPrice = allPrice
        }
        order_detail.goodsId = order_detail.goodsId.map(item => JSON.parse(item));
        order_detail.goods_name = order_detail.goods_name.map(item => JSON.parse(item));
        order_detail.goods_img = order_detail.goods_img.map(item => JSON.parse(item));
        order_detail.skuId = order_detail.skuId.map(item => JSON.parse(item));
        order_detail.sku_name = order_detail.sku_name.map(item => JSON.parse(item));
        order_detail.count = order_detail.count.map(item => JSON.parse(item));
        order_detail.price = order_detail.price.map(item => JSON.parse(item));
        // 插入订单
        let o = order_detail;
        connection.query(userSql.CreateUserOrder(), [uid, o.order_id, JSON.stringify(o.goodsId), JSON.stringify(o.goods_name), JSON.stringify(o.goods_img), JSON.stringify(o.sku_name), JSON.stringify(o.skuId), JSON.stringify(o.count), JSON.stringify(o.price), o.allPrice, o.postFee, o.create_time, o.over_time], (e, r) => {
            if (e) return res.status(201).send({code: 201, msg: '订单异常'});
            // 创建用户订单之后删除用户对应购物车商品
            res.send({
                code: 200,
                result: {
                    goodsId: o.order_id
                },
                msg: '下单成功!'
            })
        })
    })

    connection.query(userSql.DeleteUserCreatOrderByCart(),[cartId,uid]); // 删除用户提交订单对应商品的购物车商品
});

// 获取用户订单
router.get('/order', (req, res, next) => {
    connection.query(userSql.SelectUserOrder(), [req.user.uid, req.query.orderId], (error, result) => {
        let item = result[0];
        if (error) return res.status(201).send({code: 201, msg: '获取订单失败'});

        // 处理订单商品
        let orderGoods = {
            "goodsId": JSON.parse(item.goodsId),
            "goodsImg": JSON.parse(item.goods_img),
            "goodsName": JSON.parse(item.goods_name),
            "goodsCount": JSON.parse(item.count),
            "goodsPrice": JSON.parse(item.price),
            "goodsSkuName": JSON.parse(item.sku_name),
        };
        // 计算商品总价
        const allPrice = orderGoods.goodsPrice.reduce((total, current) => total + current.text * current.text, 0);

        const orderGoodsArray = orderGoods.goodsName.map((item, index) => ({
            goodsId: orderGoods.goodsId[index].text,
            goodsName: item.text,
            goodsImg: orderGoods.goodsImg[index].text,
            goodsCount: orderGoods.goodsCount[index].text,
            goodsPrice: orderGoods.goodsPrice[index].text,
            goodsSkuName: orderGoods.goodsSkuName[index].text,
        }));

        const createTime = new Date(item.create_time).getTime();
        const overTime = new Date(item.over_time).getTime();

        const currentTime = new Date().getTime();

        let timeDiffInSeconds = (overTime - currentTime) / 1000;
        if (timeDiffInSeconds <= 0) {
            if(item.payStatus === 1) {
                connection.query(userSql.ChangOrderStataus(), [6, item.order_id, req.user.uid]);
            }

        }

        res.send({
            code: 200,
            result: {
                "orderGoods": orderGoodsArray,
                "orderId": item.order_id,
                "oldPrice": item.allPrice,
                "postFee": item.postFee,
                "allPrice": item.allPrice + item.postFee,
                "create_time": item.create_time,
                "countdown": timeDiffInSeconds,
                "OrderStatus": item.payStatus
            },
            msg: '获取订单成功'
        })

    })
});

// 取消用户订单
router.put('/order',(req,res) => {
    connection.query(userSql.CancelUserOrder(),[req.body.remark,req.body.orderId,req.user.uid],(err,result) =>{
        return res.send({
            code:200,
            msg:'取消订单成功'
        })
    })
});

// 再次购买
router.post('/order/againPay',(req,res) =>{
    let cartId = req.body.orderId;
    let newOrderId = randomNumber();
    // 查询原订单数据进行拷贝
    connection.query(userSql.ChangOrderPayTime(),[addMinutes(0),addMinutes(30),newOrderId,req.body.orderId,req.user.uid]); // 修改订单时间
    connection.query(userSql.ChangOrderStataus(),[1,newOrderId,req.user.uid],(err,result) =>{
        return res.send({
            code:200,
            result:{newOrderId},
            msg:'操作成功'
        })
    })
})

// 订单支付
router.post('/order/pay',(req,res) =>{
    let orderId = req.body.orderId
    // 通过订单Id查询对应的商品信息
    connection.query(userSql.SelectOrderById(),[orderId,req.user.uid],(error,result)=> {
        const item = result[0]
        const name = JSON.parse(item.goods_name)
        const goodsName = name.map(v => v.text.slice(0, 15)).join(',');
        const goodsPrice = item.allPrice
        //开始对接支付宝API
        const formData = new AlipayFormData();
        // 调用 setMethod 并传入 get，会返回可以跳转到支付页面的 url
        formData.setMethod('get');
        //支付时信息
        formData.addField('bizContent', {
            out_trade_no: orderId,//订单号
            product_code: 'FAST_INSTANT_TRADE_PAY',//写死的
            total_amount: goodsPrice,//价格
            subject: goodsName,//商品名称
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
    })

});

// 处理用户订单
router.post('/order/successpayment', (req, res, next) => {
    let out_trade_no = req.body.out_trade_no
    let trade_no = req.body.trade_no
    let uid = req.user.uid
    const updateOrderSql = 'UPDATE xiaofan_order set payStatus = replace(payStatus,1,2) WHERE order_id = ? AND uid = ?;'

    //开始对接支付宝API
    const formData = new AlipayFormData();
    formData.setMethod('get');
    formData.addField('bizContent', {
        out_trade_no,
        trade_no
    });
    const result = alipaySdk.exec(
        'alipay.trade.query',
        {},
        {formData: formData},
    );

    result.then(resData => {
        axios({
            method: 'GET',
            url: resData
        }).then(data => {
            let responseCode = data.data.alipay_trade_query_response
            if (responseCode.code == '10000') {
                switch (responseCode.trade_status) {
                    case 'WAIT_BUYER_PAY':
                        res.send({
                            code:201,
                            msg:'正在支付'
                        })
                        break;

                    case 'TRADE_CLOSED':
                        res.send({
                            code:202,
                            msg:'已取消支付'
                        })
                        break;
                    case 'TRADE_FINISHED':
                        connection.query(updateOrderSql,[out_trade_no,uid])
                        res.send({
                            code:200,
                            msg:'支付成功'
                        })

                    case 'TRADE_SUCCESS':
                        connection.query(updateOrderSql,[out_trade_no,uid])
                        res.send({
                            code:200,
                            msg:'支付成功'
                        })
                        break;
                }
            } else if (responseCode.code == '40004') {
                res.send({
                    code:201,
                    msg:'订单不存在'
                })
            }
        }).catch(err => {
            res.send({
                code:202,
                msg:'支付失败'
            })
        })
    })
});

// 立即购买
router.post('/instantly/pay', (req, res, next) => {
    // 获取商品sku数据
    let skuId = req.body.skuId;
    let count = `[{"text":"${req.body.count}"}]`;
    let orderId = randomNumber();
    let goodsName = '';

    const SelectSkuDetailSql = `SELECT * FROM xiaofan_goods_sku WHERE JSON_CONTAINS(skuId, '{"text": "${skuId}"}', '$')`;
    connection.query(SelectSkuDetailSql, (err, result) => {
        // 将skuId字符串解析为数组对象
        let item = result[0];

        const skuList = JSON.parse(item.skuId);
        // 遍历sku列表
        for (let sku of skuList) {
            if (sku.text === skuId) {
                // 根据skuId找到对应的规格
                const index = skuList.indexOf(sku);
                const name = `[{"text":"${JSON.parse(item.name)[index + 1].text}"}]`;
                const price = `[{"text":"${JSON.parse(item.price)[index + 1].text}"}]`;
                const size = `[{"text":"${JSON.parse(item.size)[index + 1].text}"}]`;
                const inventory = JSON.parse(item.inventory)[index + 1].text;
                const picture = `[{"text":"${JSON.parse(item.picture)[index + 1].text}"}]`;
                const skuName = name + size;
                const allPrice = JSON.parse(item.price)[index + 1].text * req.body.count
                skuId = `[{"text":"${skuId}"}]`;
                // 添加商品到用户购物车列表
                connection.query(userSql.SelectGoods(), [item.goodsId], (e, r) => {
                    item.goodsId = `[{"text":"${item.goodsId}"}]`;
                    connection.query(userSql.CreateUserOrder(),[req.user.uid,orderId,item.goodsId,name,picture,size,skuId,count,price,allPrice,5,addMinutes(0),addMinutes(30)],(err) =>{
                        return res.send({
                            code:200,
                            result:{orderId},
                            msg:'创建订单成功'
                        })
                    })
                })

                break; // 找到对应的规格后退出循环
            }
        }
    })
});

// 获取用户地址
router.get('/address', (req, res, next) => {
    let addressId = req.query.addressId;
    if(addressId && addressId !== 'undefined'){
        connection.query(userSql.SelectUserAddressDeatli(), [req.user.uid,addressId], (error, results) => {
            if (results.length <= 0) {
                return res.status(201).send({code: 201, msg: '暂无收货地址'});
            }
            return res.send({
                code: 200,
                results,
                msg: '获取收货地址成功'
            })
        })
    }else {
        connection.query(userSql.SelectUserAddress(), [req.user.uid], (error, results) => {
            if (results.length <= 0) {
                return res.status(201).send({code: 201, msg: '暂无收货地址'});
            }
            return res.send({
                code: 200,
                results,
                msg: '获取收货地址成功'
            })
        })
    }

});

// 添加用户地址
router.post('/add/address',(req, res, next)=>{
    let addressInfo = req.body;
    const sql = 'UPDATE xiaofan_user_address SET isDefault=0 WHERE uid = ? AND isDefault = 1;'
    if(Number(addressInfo.isDefault) === 1){
        connection.query(sql,[req.user.uid]);
    }
    connection.query(userSql.AddUserAddress(),[req.user.uid,addressInfo.receiver,addressInfo.contact,addressInfo.province,addressInfo.city,addressInfo.county,addressInfo.address,Number(addressInfo.isDefault)],(error,result)=>{
        if (error) return res.status(201).send({code: 201, msg: '未知异常请联系管理员'});
        return res.send({
            code:200,
            msg:'添加收货地址成功'
        })
    })
});

// 修改用户地址
router.put('/address', (req, res, next) => {
    let uid = req.user.uid;
    let addressId = req.body.addressId;
    let userAddressInfo = req.body;
    connection.query(userSql.UpdateUserAddress(),[userAddressInfo.receiver,userAddressInfo.contact,userAddressInfo.province,userAddressInfo.city,userAddressInfo.county,userAddressInfo.address,userAddressInfo.isDefault,uid,addressId],(error,result)=>{
        if (error) return res.status(201).send({code: 201, msg: '未知异常请联系管理员'});
        return res.send({code:200,msg:'修改收货地址成功'})
    })
})

// 删除用户收货地址
router.delete('/address',(req, res, next)=>{
    connection.query(userSql.DeleteUserAddress(),[req.body.addressId,req.user.uid],(error,result)=>{
        return res.send({
            code:200,
            msg:'删除地址成功'
        })
    })
});

// 获取用户个人信息
router.get('/info',(req, res, next)=>{
    connection.query(userSql.SelectUserInfo(),[req.user.uid],(error,result)=>{

        if (error) return res.status(201).send({code: 201, msg: '未知异常请联系管理员'});
        if(result.length !== 0){
            res.send({
                code:200,
                result:result[0],
                msg:'获取个人信息成功'
            })
        }else {
            connection.query(userSql.SelectGzhUserInfo(),[req.user.uid],(e,r)=>{
                return res.send({
                    code:200,
                    result:r[0],
                    msg:'获取个人信息成功'
                })
            })
        }

    })
});

// 修改用户信息
router.put('/info',(req, res, next)=>{
    let userInfo = req.body;
    let uid = req.user.uid;
    if(userInfo.county){
        connection.query(userSql.UpdataUserCounty(),[userInfo.county,uid])
    }
    connection.query(userSql.UpdataUserInfo(),[userInfo.NickName,userInfo.gender,userInfo.birthday,userInfo.profession,uid],(error,result)=>{
        if (error) return res.status(201).send({code: 201, msg: '未知异常请联系管理员'});
        return res.send({
            code:200,
            msg:'修改个人信息成功'
        })
    })
});

// 修改用户头像
router.put('/avatar',(req, res, next)=>{
    let avatar = req.body.avatar;
    connection.query(userSql.UpdataUserAvatar(),[avatar,req.user.uid],(error,result)=>{
        if (error) return res.status(201).send({code: 201, msg: '未知异常请联系管理员'});
        return res.send({
            code:200,
            msg:'修改用户头像成功'
        })
    })
});

// 保存用户浏览记录
router.get('/browse',(req, res)=>{
    const uid = req.user.uid;
    const goodsId = req.query.goodsId;
    // 判断浏览的商品如何存在就删除并重新保存
    connection.query(userSql.SelectUserBrowseGoodsIsOver(),[goodsId,uid],async (e,r)=>{
        if(r.length >= 0){
            // 删除该商品
            await connection.query(userSql.DeleteUserBrowseGoods(),[goodsId,uid]);
            connection.query(userSql.SaveUserBrowseGoods(),[uid,goodsId],(error,result)=>{
                res.send({
                    code:200,
                    msg:'保存历史浏览记录成功'
                })
            })
        }
    })

});

// 获取用户浏览记录
router.get('/fetch/browse',(req, res)=>{
    connection.query(userSql.SelectUserBrowse(),[req.user.uid],(error,results)=>{
        res.send({
            code:200,
            results,
            msg:'获取历史浏览记录成功'
        })
    })
});

// 获取用户收藏商品记录
router.get('/fetch/collection',(req, res)=>{
    connection.query(userSql.SelectUserCollectionList(),[req.user.uid],(error,results)=>{
        res.send({
            code:200,
            results,
            msg:'获取商品收藏记录成功'
        })
    })
});

// 获取用户总订单量及总历史记录
router.get('/allOrderAndBrowseNum',(req,res) =>{
    connection.query(userSql.SelectUserAllOrderAndBrowseByNum(),[req.user.uid,req.user.uid],(error,result) =>{
        return res.send({
            code:200,
            result:result[0],
            msg:'获取成功'
        })
    })
});

// 获取用户订单列表
router.get('/order/list',(req,res) =>{
    if(req.query.type == 0){
        connection.query(userSql.SelectUserAllOrderList(),[req.user.uid],(error,result) =>{
            let orderList = []
            for (let i = 0; i < result.length; i++) {
                let orderId = result[i].order_id;
                let goodsId = JSON.parse(result[i].goodsId).map(v => v.text);
                let goodsName = JSON.parse(result[i].goods_name).map(v => ({ name: v.text }));
                let goodsImg = JSON.parse(result[i].goods_img).map(v => ({ imgUrl: v.text }));
                let skuName = JSON.parse(result[i].sku_name).map(v => ({ name: v.text }));
                let count = JSON.parse(result[i].count).map(v => ({ count: v.text })).reduce((acc, cur) => acc + parseInt(cur.count), 0);
                let allPirce = result[i].allPrice;
                let creatTime = result[i].create_time;
                let payStatus = result[i].payStatus;
                orderList.push({
                    orderId,
                    goodsId,
                    goodsName,
                    goodsImg,
                    skuName,
                    count,
                    allPirce,
                    creatTime,
                    payStatus
                });

            }

            return res.send({
                code:200,
                result:orderList,
                msg:'获取订单列表成功'
            })

        });
    }else {
        connection.query(userSql.SelectUserOrderList(),[req.query.type,req.user.uid],(error,result) =>{
            let orderList = []
            for (let i = 0; i < result.length; i++) {
                let orderId = result[i].order_id;
                let goodsId = JSON.parse(result[i].goodsId).map(v => v.text);
                let goodsName = JSON.parse(result[i].goods_name).map(v => ({ name: v.text }));
                let goodsImg = JSON.parse(result[i].goods_img).map(v => ({ imgUrl: v.text }));
                let skuName = JSON.parse(result[i].sku_name).map(v => ({ name: v.text }));
                let count = JSON.parse(result[i].count).map(v => ({ count: v.text })).reduce((acc, cur) => acc + parseInt(cur.count), 0);
                let allPirce = result[i].allPrice;
                let creatTime = result[i].create_time;
                let payStatus = result[i].payStatus;
                orderList.push({
                    orderId,
                    goodsId,
                    goodsName,
                    goodsImg,
                    skuName,
                    count,
                    allPirce,
                    creatTime,
                    payStatus
                });
            }

            return res.send({
                code:200,
                result:orderList,
                msg:'获取订单列表成功'
            })

        });
    }

});

// 用户收藏商品
router.post('/collection',(req,res) => {
    connection.query(userSql.SelectUserIsCollection(), [req.body.goodsId, req.user.uid], (ee, rr) => {
        if (rr.length >= 1) {
            // 取消用户收藏商品
            connection.query(userSql.ChangCollectionStatus(),[req.user.uid, req.body.goodsId],() =>{
                return res.send({
                    code: 200,
                    result: {isCollectionStatus:!rr[0].collection_status ? true : false},
                    msg: '操作成功'
                })
            })
        } else {
            connection.query(userSql.UserCollectionGoods(), [req.user.uid, req.body.goodsId], (error) => {
                    return res.send({
                        code: 200,
                        result: {isCollectionStatus:1},
                        msg: '操作成功'
                    })
            })
        }
    })
});

// 查询用户是否收藏改商品
router.get('/isCollection',(req,res) =>{
    connection.query(userSql.SelectUserIsCollection(), [req.query.goodsId, req.user.uid], (ee, rr) => {
        if(rr[0]){
            return res.send({
                code: 200,
                result: {isCollectionStatus:rr[0].collection_status === 1 ? true : false},
                msg: '获取收藏状态成功'
            })
        }else {
            return res.send({
                code: 200,
                result: {isCollectionStatus:false},
                msg: '获取收藏状态成功'
            })
        }

    })
});

// 商品评论
router.post('/comments',(req,res) => {
    let userComment = req.body;
    let uid = req.user.uid;
    connection.query(userSql.GoodsComments(),[uid,userComment.goodsId,userComment.type,userComment.connents],(error,result) =>{
        return res.send({
            code: 200,
            msg: '发表评论成功'
        })
    })
});

// 商品评论回复
router.post('/comments/reply',(req,res) =>{
    let userReply = req.body;
    let uid = req.user.uid;
    connection.query(userSql.GoodsCommentsReply(),[uid,userReply.reply_commentId,userReply.goodsId,userReply.reply_uid,userReply.reply_name,userReply.reply_type,userReply.reply_connents],(error,result) =>{
        return res.send({
            code: 200,
            msg: '回复评论成功'
        })
    })
});

// 用户确认收货
router.put('/confirm/receiving',(req,res) =>{
    connection.query(userSql.ConfirmOrder(),[req.body.orderId,req.user.uid],(error,result) =>{
        return res.send({
            code: 200,
            msg: '确认收货成功'
        })
    })
});

// 用户确认评论
router.put('/confirm/comments',(req,res) =>{
    connection.query(userSql.ConfirmComment(),[req.body.orderId,req.user.uid],(error,result) =>{
        return res.send({
            code: 200,
            msg: '确认评论成功'
        })
    })
});





module.exports = router;
