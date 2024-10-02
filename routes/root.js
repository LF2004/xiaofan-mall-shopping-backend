var express = require('express');
const https = require("https");
var router = express.Router();
// 导入数据库连接
var connection = require('../db/index');
const axios = require('axios');
const rootSql = require("../db/publicSql/user/rootSql");
const userSql = require("../db/publicSql/user/userSql");


// 获取用户列表
router.get('/userInfo',(req, res) =>{
    connection.query(rootSql.SelectAllUserInfo(),(error,result) =>{
        res.send({
            code:200,
            msg:'获取用户信息成功!',
            result
        })
    })
})

// 获取商品列表
router.get('/goods',(req, res) =>{
    if (req.query.pageNum <= 0) return res.send({msg: '页数不能小于0'})
    const offset = parseInt((req.query.pageNum - 1) * req.query.pageSize);
    const pageNum = offset
    const pageSize = parseInt(req.query.pageSize || 1)
    if (pageNum === undefined) return res.send({msg: '页码参数错误'})
    if (pageSize === undefined) return res.send({msg: '页码数量参数错误'})
    connection.query(rootSql.SelectAllGoodsInfo(),[pageNum, pageSize],(error,result) =>{
        if (result.length <= 0) {
            return res.send({code: 201, msg: '到底啦!!'})
        }
        res.send({
            code:200,
            msg:'获取商品信息成功!',
            result
        })
    })
});

// 获取商品分类
router.get('/goods/classify',(req, res) =>{
    connection.query(rootSql.goodsClassify(),(error,result) =>{
        res.send({
            code:200,
            msg:'获取商品分类信息成功!',
            result
        })
    })
});

// 添加商品
router.post('/goods/add',(req,res) =>{
    const g = req.body;
    // 判断该商品是否为预售商品,通过 limitedStatus 状态
    if(g.limitedStatus) {
        connection.query(rootSql.AddGoods(),[g.goodsType,g.gooodsName,g.price,g.oldPrice,g.picture,g.stock,0,1,g.limted_time,g.limted_over_time],(error,result) =>{
            console.log(error)
            if (error) return res.status(201).send({code: 201, msg: '未知异常请联系开发者'});
            res.send({
                code:200,
                msg:'添加商品成功!'
            })
            connection.query(rootSql.SelectMaxGoodsId(),(ee,rr) =>{
                const goodsId = rr[0].id;
                connection.query(rootSql.AddGoodsClassify(),[g.goodsType,g.goodsClassify[0],goodsId,g.goodsClassify[1]],(e,r))
            })
        })
    }else {
        connection.query(rootSql.AddGoods(),[g.goodsType,g.gooodsName,g.price,g.oldPrice,g.picture,g.stock,0,0,null,null],(e,r) =>{
            if (e) return res.status(201).send({code: 201, msg: '未知异常请联系开发者'});
            res.send({
                code:200,
                msg:'添加商品成功!'
            })
            connection.query(rootSql.SelectMaxGoodsId(),(ee,rr) =>{
                const goodsId = rr[0].id;
                connection.query(rootSql.AddGoodsClassify(),[g.goodsType,g.goodsClassify[0],goodsId,g.goodsClassify[1]])
            })
        })
    }
});

// 上架或下架商品
router.post('/goods/ShelvesOrUnShelves',(req,res) =>{
    connection.query(rootSql.ChangeShelvesOrUnShelvesGoodsStatus(),[req.body.orderId],(error,result)=>{
        res.send({
            code:200,
            msg:'修改成功'
        })
    })
})

// 添加商品sku规格
router.post('/goods/add/sku',(req,res) =>{
    let skuItem = req.body;
    console.log(`[{"title":"商品名称"},{"text":"暗夜紫"},{"text":"黑"}]`)
})

router.get('/goods/order/list',(req, res) =>{
    connection.query(userSql.SelectUserAllOrderListByRoot(),(error,result) =>{
        let orderList = []
        for (let i = 0; i < result.length; i++) {
            let orderId = result[i].order_id;
            let goodsId = JSON.parse(result[i].goodsId).map(v => v.text);
            let goodsName = JSON.parse(result[i].goods_name).map(v => ({ name: v.text }));
            let goodsImg = JSON.parse(result[i].goods_img).map(v => ({ imgUrl: v.text }));
            let skuName = JSON.parse(result[i].sku_name).map(v => ({ name: v.text }));
            let price = JSON.parse(result[i].price).map(v => ({ name: v.text }));
            let count = JSON.parse(result[i].count).map(v => ({ name: v.text }));
            // 计算总数量 let count = JSON.parse(result[i].count).map(v => ({ count: v.text })).reduce((acc, cur) => acc + parseInt(cur.count), 0);
            let allPirce = result[i].allPrice;
            let creatTime = result[i].create_time;
            let remark = result[i].remark;
            let payStatus = result[i].payStatus;
            let NickName = result[i].NickName;
            let telPhone = result[i].telPhone;
            orderList.push({
                NickName,
                telPhone,
                orderId,
                goodsId,
                goodsName,
                goodsImg,
                skuName,
                price,
                count,
                allPirce,
                creatTime,
                remark,
                payStatus
            });

        }

        return res.send({
            code:200,
            result:orderList,
            msg:'获取订单列表成功'
        })

    });
});

// 商品订单发货
router.post('/goods/order/shipments',(req, res) =>{
    connection.query(rootSql.OrderShipments(),[req.body.orderId],(error,result) =>{
        res.send({
            code:200,
            msg:'更新订单状态成功'
        })
    })
})

router.get('/order/dataAnalysis',(req, res) =>{
    connection.query(rootSql.SelectOrdersDataAnalysis(),(error,result) =>{
        res.send({
            code:200,
            result,
            msg:'获取订单分析数据成功'
        })
    })
})


module.exports = router;
