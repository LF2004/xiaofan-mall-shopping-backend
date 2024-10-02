// 导入数据库连接
var connection = require('../../index')
//验证数据库中的用户相关内容
const UserSql = {
    // 通过账号查询用户是否存在
    SelectUserIsEsxistByUname() {
        return 'SELECT * FROM xiaofan_user u,xiaofan_user_info i WHERE u.uid = i.uid and u.xiaofan_name = ?;'
    },
    // 注册保存用户信息
    InsertUserInfo(){
        return 'INSERT INTO xiaofan_user_info (uid, NickName, gender, birthday, fullLocation, profession, avatar, user_token) VALUES (?,?,?,?,?,?,?,?)';
    },
    // 添加购物车
    addUserCart(){
        return 'INSERT INTO xiaofan_user_cart (uid, goodsId, skuId, goods_name,sku_name,picture, count, price, selected, create_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 0, NOW());'
    },
    // 查询购物车商品是否为自己所有
    SelectUserCartIsMy(){
        return 'SELECT * FROM xiaofan_user_cart c WHERE c.uid = ? AND c.id = ?;'
    },
    // 修改购物车商品数量
    changeUserCartNum(){
        return 'UPDATE xiaofan_user_cart SET count=? WHERE id = ?'
    },
    // 修改购物车选中状态
    changeUserCartSelect(){
        return 'UPDATE xiaofan_user_cart SET selected=? WHERE id = ?'
    },
    // 购物车全选
    changeUserCartAllSelect(){
        return 'UPDATE xiaofan_user_cart SET selected = ? WHERE uid = ?;'
    },
    // 删除购物车商品
    deleteUserCart(){
        return 'DELETE FROM xiaofan_user_cart WHERE id = ? AND uid = ?'
    },
    // 查询历史浏览数据是否存在
    SelectUserBrowseGoodsIsOver(){
        return 'SELECT * FROM xiaofan_user_browse WHERE browse_goods_id = ? AND uid = ?'
    },
    // 删除历史浏览数据
    DeleteUserBrowseGoods(){
        return 'DELETE FROM xiaofan_user_browse WHERE browse_goods_id = ? AND uid = ?'
    },
    // 保存用户历史浏览数据
    SaveUserBrowseGoods(){
        return 'INSERT INTO xiaofan_user_browse(uid,browse_goods_id,browse_time) VALUES(?,?,NOW())';
    },
    // 获取用户历史浏览记录数据
    SelectUserBrowse(){
        return 'SELECT b.browse_goods_id,g.name AS goodsName,g.price,g.picture,b.browse_time FROM xiaofan_user_browse b,xiaofan_goods g WHERE b.browse_goods_id = g.id AND b.uid = ? ORDER BY b.browse_time DESC;'
    },
    // 获取用户购物车列表
    SelectUserCartList(){
        return 'SELECT id AS cartId,goodsId,skuId,goods_name,sku_name,picture,count,price,selected,create_time FROM xiaofan_user_cart WHERE uid = ?;'
    },
    // 获取用户当个购物车商品
    SelectUserCart(){
        return 'SELECT * FROM xiaofan_user_cart WHERE id = ?'
    },
    // 查询商品数据
    SelectGoods(){
        return 'SELECT * FROM xiaofan_goods WHERE id = ?;'
    },
    // 通过订单Id查询对应的商品信息
    SelectOrderById(){
        return 'SELECT * FROM xiaofan_order WHERE order_id = ? AND uid = ?'
    },
    // 搜索商品
    SearchGoods(){
        return 'SELECT * FROM xiaofan_goods WHERE name REGEXP  ?';
    },
    SearchGoodsOrderByPriceSortDESC(){
        return 'SELECT * FROM xiaofan_goods WHERE name REGEXP ? ORDER BY price DESC;'
    },
    SearchGoodsOrderByPriceSortASC(){
        return 'SELECT * FROM xiaofan_goods WHERE name REGEXP ? ORDER BY price ASC;'
    },
    GoodsSearch(){
        return 'SELECT id AS goodsId,name FROM xiaofan_goods WHERE name LIKE ?';
    },
    // 商品详情页相关商品
    GoodsDetaiCorrelationl(){
        return "SELECT id AS goodsId, name, price, picture FROM xiaofan_goods WHERE name LIKE (SELECT CONCAT('%', c.classify_child_name, '%') FROM xiaofan_goods g, xiaofan_goods_classify c WHERE g.goodsType = c.classify_parent AND c.classify_child = ? LIMIT 1) ORDER BY RAND() LIMIT 3;"
    },
    // 推荐商品
    RecommendGoods(){
        return 'SELECT id AS goodsId,name FROM xiaofan_goods ORDER BY RAND() LIMIT 5';
    },
    // 查询sku商品
    SelectSkuGood(){
        return 'SELECT * FROM xiaofan_goods_sku WHERE goodsId = ?;'
    },
    // 获取预支付订单
    SelectOrderPre(){
        return 'SELECT id AS cartId,goodsId,skuId,goods_name,sku_name,picture,count,price FROM xiaofan_user_cart WHERE uid = ? AND selected = 1;'
    },
    // 获取用户要创建的订单数据
    SelectUserOrderData(){
        return 'SELECT * FROM xiaofan_user_cart WHERE id in(?) AND uid = ?;'
    },
    // 用户提交订单后删除购物车商品
    DeleteUserCreatOrderByCart(){
        return 'DELETE FROM xiaofan_user_cart WHERE id in(?) AND uid = ?'
    },
    // 创建用户订单
    CreateUserOrder(){
        return 'INSERT INTO xiaofan_order (uid, order_id, goodsId, goods_name, goods_img, sku_name, skuId, count, price, allPrice, postFee, create_time, over_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
    },
    // 获取用户订单
    SelectUserOrder(){
        return 'SELECT * FROM xiaofan_order WHERE uid = ? and order_id = ?'
    },
    // 修改订单状态
    ChangOrderStataus(){
        return 'UPDATE xiaofan_order SET payStatus= ? WHERE order_id = ? AND uid = ?;'
    },
    // 修改订单支付时间
    ChangOrderPayTime(){
        return 'UPDATE xiaofan_order SET create_time= ?,over_time= ?, order_id= ? WHERE order_id = ? AND uid = ?;'
    },
    // 取消订单
    CancelUserOrder(){
        return 'UPDATE xiaofan_order SET payStatus=6,remark = ? WHERE order_id = ? AND uid = ?;'
    },
    // 新增用户收货地址
    AddUserAddress(){
        return 'INSERT INTO xiaofan_user_address (uid, receiver,contact,province,city,county,address,isDefault) VALUES (?,?,?,?,?,?,?,?)';
    },
    // 修改用户地址
    UpdateUserAddress(){
        return 'UPDATE xiaofan_user_address SET receiver=?,contact=?,province=?,city=?,county=?,address=?,isDefault=? WHERE uid = ? AND id = ?'
    },
    // 获取收货地址
    SelectUserAddress(){
        return 'SELECT id AS addressId,receiver,contact,province,city,county,address,isDefault FROM xiaofan_user_address WHERE uid = ?';
    },
    // 获取收货地址详情
    SelectUserAddressDeatli(){
        return 'SELECT id AS addressId,receiver,contact,province,city,county,address,isDefault FROM xiaofan_user_address WHERE uid = ? AND id = ?';
    },
    // 删除收货地址
    DeleteUserAddress(){
        return 'DELETE FROM xiaofan_user_address WHERE id = ? AND uid = ?'
    },
    // 查询用户信息
    SelectUserInfo(){
        return 'SELECT i.NickName,i.avatar,i.telPhone,i.gender, i.birthday, i.profession, a.county FROM xiaofan_user_info i JOIN xiaofan_user u ON i.uid = u.uid LEFT JOIN xiaofan_user_address a ON a.uid = i.uid WHERE i.uid = ?;'
    },
    // 查询公众号用户的信息
    SelectGzhUserInfo(){
        return 'SELECT i.NickName,i.avatar,i.telPhone,i.gender, i.birthday, i.profession, a.county FROM xiaofan_user_info i JOIN xiaofan_gzh_user u ON i.uid = u.uid LEFT JOIN xiaofan_user_address a ON a.uid = i.uid WHERE i.uid = ?;'
    },
    // 修改用户信息
    UpdataUserInfo(){
        return 'UPDATE xiaofan_user_info SET NickName=?,gender=?,birthday=?,profession=? WHERE uid = ?;'
    },
    // 修改用户地址城市信息
    UpdataUserCounty(){
        return 'UPDATE xiaofan_user_address SET county=? WHERE uid =?;'
    },
    // 修改用户头像
    UpdataUserAvatar(){
        return 'UPDATE xiaofan_user_info SET avatar=? WHERE uid =?;'
    },
    // 获取用户总订单量及总历史记录
    SelectUserAllOrderAndBrowseByNum(){
        return 'SELECT(SELECT COUNT(*) FROM xiaofan_user_collection WHERE uid = ? AND collection_status = 1) AS collectionNum,COUNT(DISTINCT o.order_id) AS orderNum, COUNT(DISTINCT b.browse_goods_id) AS browseNum FROM xiaofan_order o LEFT JOIN xiaofan_user_browse b ON o.uid = b.uid WHERE o.uid = ? GROUP BY o.uid;'
    },
    // 获取用户订单列表
    SelectUserOrderList(){
        return 'SELECT o.order_id,o.goodsId,o.goods_name,o.goods_img,o.sku_name,o.count,o.allPrice,o.create_time,o.payStatus FROM xiaofan_order o WHERE o.payStatus = ? AND o.uid = ? ORDER BY o.create_time DESC;'
    },
    // 用户确认收货
    ConfirmOrder(){
        return 'UPDATE xiaofan_order SET payStatus=4 WHERE order_id = ? AND uid = ?;'
    },
    // 用户确认评论
    ConfirmComment(){
        return 'UPDATE xiaofan_order SET payStatus=5 WHERE order_id = ? AND uid = ?;'
    },
    SelectUserAllOrderList(){
        return 'SELECT o.order_id,o.goodsId,o.goods_name,o.goods_img,o.sku_name,o.count,o.allPrice,o.create_time,o.payStatus FROM xiaofan_order o WHERE o.uid = ? ORDER BY o.create_time DESC;'
    },
    SelectUserAllOrderListByRoot(){
        return 'SELECT i.NickName, i.telPhone, o.order_id, o.goodsId, o.goods_name, o.goods_img, o.sku_name, o.count, o.price, o.allPrice, o.remark, o.create_time, o.payStatus FROM xiaofan_order o INNER JOIN xiaofan_user_info i ON o.uid = i.uid ORDER BY o.create_time DESC;'
    },
    // 用户收藏商品
    UserCollectionGoods(){
        return 'INSERT INTO xiaofan_user_collection VALUES(id,?,?,1,NOW())'
    },
    // 获取用户收藏记录
    SelectUserCollectionList(){
        return 'SELECT c.collection_goodsId AS collectionId,g.id AS goodsId,g.name AS goodsName,g.price,g.picture,c.collection_time FROM xiaofan_user_collection c,xiaofan_goods g WHERE c.uid = ? AND collection_status = 1 AND c.collection_goodsId = g.id order by c.collection_time'
    },
    // 查询用户是否收藏该商品
    SelectUserIsCollection(){
        return 'SELECT collection_status FROM xiaofan_user_collection WHERE collection_goodsId = ? AND uid = ?;'
    },
    // 取消收藏商品
    ChangCollectionStatus(){
        return 'UPDATE xiaofan_user_collection SET collection_status = NOT collection_status WHERE uid = ? AND collection_goodsId = ?;'
    },
    // 商品评论
    GoodsComments(){
        return 'INSERT INTO xiaofan_user_comments VALUES(id,?, ?,?,?,NOW())'
    },
    // 商品评论回复
    GoodsCommentsReply(){
        return 'INSERT INTO xiaofan_user_reply VALUES(id,?,?,?,?,?,?,?,NOW())'
    },
    // 获取商品评论
    SelectGoodsComments(){
        return `SELECT c.id AS comment_id, c.uid AS comment_uid, i.NickName AS comment_user_name, i.avatar,
       c.topic_goodsId AS comment_goodsId, c.topic_type AS comment_type, c.content AS comment_content,
       DATE_FORMAT(c.comments_time, '%Y-%m-%d %H:%i:%s') AS comment_time,
       JSON_ARRAYAGG(
           JSON_OBJECT('reply_commentId',r.reply_commentId,'reply_id', r.id, 'reply_uid', r.uid, 'reply_user_name', i2.NickName, 'reply_user_avatar', i2.avatar, 'reply_goodsId', r.reply_goodsId, 'reply_type', r.reply_type, 'content',r.reply_content,'reply_content', CONCAT('@', r.reply_name, '说:', r.reply_content), 'reply_time', DATE_FORMAT(r.reply_time, '%Y-%m-%d %H:%i:%s'))
       ) AS replies,
       (SELECT COUNT(*) FROM xiaofan_user_comments WHERE topic_goodsId = c.topic_goodsId AND id = c.id) +
       (SELECT COUNT(*) FROM xiaofan_user_reply WHERE reply_goodsId = c.topic_goodsId AND reply_commentId = c.id) AS total_comments
    FROM xiaofan_user_comments c
    LEFT JOIN xiaofan_user_reply r ON c.id = r.reply_commentId
    LEFT JOIN xiaofan_user_info i ON c.uid = i.uid
    LEFT JOIN xiaofan_user_info i2 ON r.uid = i2.uid
    WHERE c.topic_goodsId = ?
    GROUP BY c.id, c.uid, i.NickName, i.avatar, c.topic_goodsId, c.topic_type, c.content, c.comments_time;

`;
    },
    // 注册用户
    enrollUser() {
        return 'insert into xiaofan_user(uid,xiaofan_name,xiaofan_pwd,uSign,identity,enrollTime) values (?,?,?,?,0,now())';
    },
    //修改用户toekn
    ReviseUserToken() {
        return 'UPDATE xiaofan_user_info set user_token = "Bearer " ? where uid = ?'
    },
    // 校验token
    VerifyUserToken() {
        return 'select uid from xiaofan_user_info where uid = ? and ? = user_token'
    }
}
exports = module.exports = UserSql;


