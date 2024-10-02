// 导入数据库连接
var connection = require('../../index')
const rootSql = {
    // 获取所有用户信息
    SelectAllUserInfo() {
        return 'SELECT u.uid, u.xiaofan_name, u.identity, u.enrollTime AS enrollTime,i.gender, i.NickName, i.birthday, i.fullLocation, i.profession, i.telPhone, i.avatar FROM xiaofan_user u JOIN xiaofan_user_info i ON u.uid = i.uid UNION ALL SELECT g.uid, \'\', \'\', g.create_time AS enrollTime,i.gender, i.NickName, i.birthday, i.fullLocation, i.profession, i.telPhone, i.avatar FROM xiaofan_gzh_user g JOIN xiaofan_user_info i ON g.uid = i.uid;'
    },
    // 获取所有商品信息
    SelectAllGoodsInfo() {
        return 'SELECT g.id AS goodsId, g.goodsType, g.name AS goodsName, g.price, g.picture, g.stock, g.isEffective,g.create_time, total.total_count FROM xiaofan_goods g,(SELECT COUNT(*) AS total_count FROM xiaofan_goods) AS total ORDER BY g.create_time DESC LIMIT ?,?;'
    },
    // 商品分类
    goodsClassify() {
        return 'SELECT DISTINCT c.classify_parent,c.classify_parent_name,c.classify_child_name FROM xiaofan_goods_classify c';
    },
    // 添加商品
    AddGoods() {
        return 'INSERT INTO xiaofan_goods VALUES(id,?,?,?,?,?,?,?,?,?,?,NOW())'
    },
    // 添加到分类
    AddGoodsClassify(){
        return 'INSERT INTO xiaofan_goods_classify VALUES(id,?,?,?,?)'
    },
    // 获取商品最大id
    SelectMaxGoodsId(){
        return 'SELECT id FROM xiaofan_goods ORDER BY id DESC LIMIT 0,1'
    },
    ChangeShelvesOrUnShelvesGoodsStatus(){
        return 'UPDATE xiaofan_goods SET isEffective=NOT isEffective WHERE id = ?;'
    },
    // 获取订单分析数据
    SelectOrdersDataAnalysis(){
        return 'SELECT MONTH(`create_time`) AS month,SUBSTRING_INDEX(SUBSTRING_INDEX(`goodsId`, \'\\"text\\":\\"\', -1), \'\\"\', 1) AS goods_id,SUBSTRING_INDEX(SUBSTRING_INDEX(`goods_name`, \'\\"text\\":\\"\', -1), \'\\"\', 1) AS goods_name,SUM(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(`count`, \'\\"text\\":\\"\', -1), \'\\"\', 1) AS UNSIGNED)) AS total_sales_amount,SUM(CAST(`allPrice` AS DECIMAL(10, 2))) AS total_sales_price FROM `xiaofan_order` WHERE `payStatus` NOT IN (1, 6) GROUP BY month, goods_id, goods_name ORDER BY month;'
    },
    // 订单发货
    OrderShipments(){
        return 'UPDATE xiaofan_order SET payStatus = 3 WHERE order_id = ?'
    }
}

exports = module.exports = rootSql;
