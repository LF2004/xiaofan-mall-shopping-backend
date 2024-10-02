// 导入数据库连接
var connection = require('../../index')
//验证数据库中的用户相关内容
const IndexSql = {
    // 获取公告通知
    SelectAnnouncementNotice() {
        return 'SELECT n.notice_content,n.type,n.notice_time FROM notice_content n WHERE type = ?'
    },
    // 获取首页分类图标信息
    SelectGoodsCategory(){
        return 'SELECT id AS classifyId,title,toUrl,imgUrl FROM xiaofan_goods_classify_icon'
    },
    // 获取首页轮播图信息
    SelectGoodsBanner(){
        return 'SELECT id AS banner_id,banner_content,banner_img FROM xiaofan_banner'
    },
    // 获取商品列表
    SelectGoodsList(){
        return 'SELECT g.id AS goodsId,g.name,g.goodsType,g.price,g.oldPrice,g.picture,g.stock,g.isEffective,g.isLimited,g.limited_time FROM xiaofan_goods g ORDER BY create_time DESC LIMIT ?,?'
    },
    // 获取商品详情
    SelectGoodsDetail(){
        return 'SELECT g.id AS goodsId, g.name, g.price, g.oldPrice, g.isEffective, g.isLimited, g.limited_time, d.detail_img,s.skuId,s.name as sName,s.spec_list,s.price as priceList,s.size,s.organization_name,s.inventory,s.picture FROM xiaofan_goods g LEFT JOIN xiaofan_goods_detail d ON g.id = d.goodsId LEFT JOIN xiaofan_goods_sku s ON s.goodsId = g.id HAVING g.id = ?;'
    },
    // 查询商品
    SelectGoodsInfo() {
        return 'SELECT * FROM xiaofan_goods WHERE id = ?;'
    },
    // 分类列表
    SelectClassfyGoods(){
        return 'SELECT c.classify_parent_name,c.classify_child_name,g.id AS goodsId,g.name,g.price,g.picture FROM xiaofan_goods_classify c,xiaofan_goods g WHERE c.classify_parent = g.goodsType AND c.classify_child = g.id AND g.goodsType = ? ORDER BY c.classify_child_name;'
    },
    // 分类名称
    SelectClassfyTitle(){
        return 'SELECT * FROM xiaofan_goods_classify'
    },
    // 获取商品名称图片
    SelectGoodsNameAndPicture(){
        return 'SELECT g.name AS goodsName,g.picture FROM xiaofan_goods g WHERE g.id = ?;'
    }


}
exports = module.exports = IndexSql;


