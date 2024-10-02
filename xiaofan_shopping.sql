/*
 Navicat Premium Data Transfer

 Source Server         : xiaofan-db
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : xiaofan_shopping

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 16/05/2024 09:14:10
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xiaofan_banner
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_banner`;
CREATE TABLE `xiaofan_banner`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `banner_content` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告内容',
  `banner_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小帆购物网首页轮播图广告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_banner
-- ----------------------------
INSERT INTO `xiaofan_banner` VALUES (1, '潮玩手办节', 'https://bpic.588ku.com/templet_pic/21/06/25/0f67438e0623ec5a8f692664eacda902.jpg!/fw/750/quality/90/unsharp/true/compress/true');
INSERT INTO `xiaofan_banner` VALUES (2, '阿米娜预售开启', 'https://bpic.588ku.com/templet_pic/21/06/29/21e28241a532eeeb2940e71104ef9bdb.jpg!/fw/750/quality/90/unsharp/true/compress/true');
INSERT INTO `xiaofan_banner` VALUES (3, '热球开售', 'https://img.zcool.cn/community/01694d5f2a8ff5a801215aa093965e.jpg');

-- ----------------------------
-- Table structure for xiaofan_busines_info
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_busines_info`;
CREATE TABLE `xiaofan_busines_info`  (
  `id` int NOT NULL,
  `uid` int NULL DEFAULT NULL COMMENT '商家id',
  `business_shop_score` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商家店铺评分',
  `business_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商家地址',
  `contact_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商家联系电话',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '店铺描述',
  `created_at` datetime NULL DEFAULT NULL COMMENT '店铺创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商家店铺信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_busines_info
-- ----------------------------

-- ----------------------------
-- Table structure for xiaofan_goods
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_goods`;
CREATE TABLE `xiaofan_goods`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '商品Id',
  `goodsType` int NULL DEFAULT NULL COMMENT '商品类型',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `price` decimal(8, 2) NULL DEFAULT NULL COMMENT '当前价格',
  `oldPrice` decimal(8, 2) NULL DEFAULT NULL COMMENT '原价',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `stock` int NULL DEFAULT NULL COMMENT '库存',
  `isEffective` int NULL DEFAULT NULL COMMENT '是否为有效商品',
  `isLimited` int NULL DEFAULT NULL COMMENT '是否为限时抢购商品',
  `limited_time` datetime NULL DEFAULT NULL COMMENT '抢购开始时间',
  `limited_over_time` datetime NULL DEFAULT NULL COMMENT '抢购结束时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '商品创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小帆购物网商品列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_goods
-- ----------------------------
INSERT INTO `xiaofan_goods` VALUES (2, 0, 'Apple/苹果 iPhone 15 Pro Max 官方正品旗舰店5G手机直降新款14Pro 国行max官网', 9999.00, 10300.00, 'https://gw.alicdn.com/bao/uploaded/i4/1917047079/O1CN01qgWz9S22AEcwf1Sqq_!!1917047079.jpg_Q75.jpg_.webp', 105, 0, 1, '2023-12-25 20:08:49', '2024-03-21 20:08:52', '2023-12-29 12:15:17');
INSERT INTO `xiaofan_goods` VALUES (3, 0, '自然堂雪润多重防晒美白隔离霜妆前乳保湿遮瑕打底紫绿清爽服帖', 79.00, 109.00, 'https://gw.alicdn.com/bao/upload/O1CN01q66DAO1t8YbNxaN2p_!!6000000005857-0-yinhe.jpg_220x10000Q75.jpg_.webp', 45, 0, 0, NULL, NULL, '2023-12-29 11:15:29');
INSERT INTO `xiaofan_goods` VALUES (4, 0, '品胜 PISEN 新世纪福音战士 初号机 EV5W 一拖三2C+1A手机笔记本快充套装', 199.00, 97.00, 'https://i0.hdslb.com/bfs/mall/vendor/49/33/4933781e05854a78f770bc539b3e9e1a.png', 180, 0, 1, NULL, NULL, '2024-01-07 12:15:43');
INSERT INTO `xiaofan_goods` VALUES (5, 0, '【国行】Sony/索尼  Xperia 1 IV XQ-CG微单摄影摄像手机12+256GB', 3999.00, 67.00, 'https://i0.hdslb.com/bfs/mall/mall/21/14/a838b8693bd1ab84514a0125a0acc4f3.jpg', 38, 0, 1, NULL, NULL, '2024-01-02 12:15:47');
INSERT INTO `xiaofan_goods` VALUES (6, 1, '碧蓝航线AzurLane学院制服滴胶亚克力', 83.00, 89.00, 'https://i0.hdslb.com/bfs/mall/mall/36/74/3674b156f3d1c974117f5ff7ca70b221.png', 197, 0, 1, NULL, NULL, '2024-01-03 12:15:52');
INSERT INTO `xiaofan_goods` VALUES (7, 0, '水墨画小羊皮手机壳适用苹果iphone华为荣耀VIVO小米OPPO手机保护壳套', 29.90, 65.00, 'https://i0.hdslb.com/bfs/mall/mall/3d/15/2bc559707f0e1c3c1f3f28f484bae154.png', 194, 0, 1, NULL, NULL, '2024-01-04 12:15:55');
INSERT INTO `xiaofan_goods` VALUES (8, 1, '万代 CSM 假面骑士555 假面骑士KAIXA 成品模型', 1319.00, 16.00, 'https://i0.hdslb.com/bfs/mall/mall/b2/bd/b2bd9244090744f9db7a88345b197362.png', 32, 0, 1, NULL, NULL, '2024-01-12 12:16:04');
INSERT INTO `xiaofan_goods` VALUES (9, 1, 'Lenovo/联想ANC主动降噪耳机头戴式包\r\n耳隔音男女款游戏耳麦笔记本台式机苹果安卓华为小米VIVO手机电脑通用款', 299.00, 16.00, 'https://i0.hdslb.com/bfs/mall/mall/1a/a2/8e02acfa945d7e5e12d3be43b9fea555.PNG', 112, 0, 1, NULL, NULL, '2024-01-19 12:16:07');
INSERT INTO `xiaofan_goods` VALUES (10, 1, '品胜 VOCALOID 初音未来 PD30W快速充 电器 手机充电器 苹果手机快速充电头 Type-C接口', 74.90, 116.00, 'https://i0.hdslb.com/bfs/mall/vendor/6d/dc/6ddcc15654b9f7b7657a3bcde93e98f1.png', 151, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (11, 0, '中文在线 罗小黑战记 罗小黑-伴你同行列硅胶手机保护壳-勾勾手', 79.00, 30.00, 'https://i0.hdslb.com/bfs/mall/vendor/71/8a/718a142784c41dd4f90290a6b7e7d8b8.png', 35, 0, 1, NULL, NULL, '2024-01-19 12:16:13');
INSERT INTO `xiaofan_goods` VALUES (12, 1, '万代 DX 假面骑士GEATS 蜘蛛手机 成品型', 169.00, 41.00, 'https://i0.hdslb.com/bfs/mall/mall/51/02/f8be3b70026db0849f268bfc40d04920.png', 11, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (13, 0, 'Sony/索尼 XQ-DE72 Xperia 5 V 小尺寸性能Vlog拍摄 智能5G手机', 6999.00, 2.00, 'https://i0.hdslb.com/bfs/mall/mall/cb/19/76d9723b913b6db4eeafc6c71ea8ec2a.jpg', 33, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (14, 0, '品胜 初音未来VOCALOID联名120W氮化镓电器笔记本苹果华为手机充电器一拖四充电头', 269.00, 4.00, 'https://i0.hdslb.com/bfs/mall/vendor/33/7b/337ba9061dbb4c828c44647ebf2d3d02.png', 188, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (15, 0, '哔哩哔哩 2233娘机械姬手机壳 周边', 59.00, 100.00, 'https://i0.hdslb.com/bfs/davinci-platform/img/55519afdf32cd950cfdc7ac27a4a0a63ac0c9595.png', 148, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (17, 0, '金士顿（Kingston）TF（MicroSD）手机储卡行车记录仪内存卡读速100MB/s 高品质拍摄', 23.90, 22.00, 'https://i0.hdslb.com/bfs/mall/mall/65/91/ccec7e298222ffa6ba13f7e53b43f8fb.png', 87, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (18, 0, '哔哩哔哩 板件里的33娘 手机保护壳（6/6S ） 周边', 49.00, 172.00, 'https://i0.hdslb.com/bfs/davinci-platform/img/abb16ed6c23a82dfd83dcf348e04d7ffbb7bc1df.png', 111, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (19, 0, 'XQZ-CBDQ XPERIA 1 V支架原装手机壳  保护套', 299.00, 115.00, 'https://i0.hdslb.com/bfs/mall/mall/47/ad/62cb8c3b857b5988e8610907368c2cf8.jpeg', 190, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (20, 0, '索尼（SONY）WH-CH520 头戴式无线蓝牙机 舒适佩戴 音乐耳机 高音质立体声电脑手机耳机 CH510升级版', 499.00, 135.00, 'https://i0.hdslb.com/bfs/mall/mall/f8/93/2e835b67e1f88b7eda5bab15d065b082.jpg', 62, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (21, 0, '手机散热器直播温控数显风冷半导体制 冷磁吸平板降温手机背夹', 79.00, 57.00, 'https://i0.hdslb.com/bfs/mall/mall/46/18/903431df7c90a93f264d2ae43cbfe4b3.png', 31, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (22, 0, '动漫卡通二次元手机壳适用苹果华为荣 耀小米OPPO彩绘防尘全包菲林壳', 69.90, 23.00, 'https://i0.hdslb.com/bfs/mall/mall/82/83/dd6b3fe7c60b900a437fed4942c8f8c9.png', 186, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (24, 2, '哔哩哔哩 小电视彩色玻璃风卫衣 周边', 128.15, 233.00, 'https://i0.hdslb.com/bfs/davinci-platform/img/2886d0fd3854f4ec075eff962c3d2cef2c3debe2.png', 87, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (25, 2, '天羽川 初音未来 音域少女 毛绒外套 ', 749.00, 799.00, 'https://i0.hdslb.com/bfs/mall/mall/c8/f3/98bf48a6fe51fbc3c536d2731d69e8cf.png', 199, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (26, 2, 'moeyu 名侦探柯南M26黑铁的鱼影卫衣灰', 218.00, 238.00, 'https://i0.hdslb.com/bfs/mall/vendor/bc/0c/bc0c3833d2cf7f21f43c63d3e718a4bb.png', 95, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (27, 2, '天羽川  初音未来 新年款龙年限定 云\r\n螭套装    限时限定 限时权益', 59.00, 76.00, 'https://i0.hdslb.com/bfs/mall/mall/04/0e/9bb3ab3d1a09fd8dfc259529dd6c8351.png', 5, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (28, 2, 'ANIPLEX+ 孤独摇滚！ 开衫卫衣', 210.00, 210.00, 'https://i0.hdslb.com/bfs/mall/mall/7a/bb/7abb1f3afba46a1eac821fe7d37ba8b0.png', 200, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (29, 2, '天羽川  初音未来 16周年镭射羽绒服   ', 749.00, 56.00, 'https://i0.hdslb.com/bfs/mall/mall/0b/de/085243827de2989ecde2a7b43803a9c8.png', 112, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (30, 2, '天羽川  初音未来  圣诞套装  ', 99.00, 68.00, 'https://i0.hdslb.com/bfs/mall/mall/61/2a/e0520a5213cdeaa65de058989ce634a2.png', 131, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (31, 1, '幸运石 VOCALOID 初音未来16周年主题\r\n披风毯', 119.00, 180.00, 'https://i0.hdslb.com/bfs/mall/vendor/cc/c7/ccc7602068e24cdfc879f287eb4e35b1.png', 185, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (32, 3, 'moeyu VOCALOID 初音未来 2023机能系\r\n列 游骑主题休闲鞋', 279.00, 153.00, 'https://i0.hdslb.com/bfs/mall/vendor/e8/65/e865c319042600866e3463d8a461f54b.png', 17, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (33, 2, 'ANIPLEX+ 孤独摇滚！ 纽带乐队卫衣', 342.00, 17.00, 'https://i0.hdslb.com/bfs/mall/mall/8b/a6/8ba630a726c34df76ce9d8f840986ecd.png', 40, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (34, 1, '天羽川  初音未来  音域少女  套头毛\r\n衣', 168.00, 175.00, 'https://i0.hdslb.com/bfs/mall/mall/63/c8/466b2b299461d9a44da0eb924acaf4a7.png', 110, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (35, 1, 'moeyu VOCALOID 初音未来16周年纪念卫', 179.10, 173.00, 'https://i0.hdslb.com/bfs/mall/vendor/70/9d/709da01ac852819e51b46accb559c259.png', 57, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (36, 1, '大英博物馆 盖亚·安德森猫系列 创意编女生通勤包', 149.00, 88.00, 'https://i0.hdslb.com/bfs/mall/mall/ea/c9/38c9d8eb98dbfeea2c2ab094d3f46a74.png', 96, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (37, 1, '天羽川 初音未来 连裤袜  纯色短裙   老爹鞋   限时权益', 45.00, 154.00, 'https://i0.hdslb.com/bfs/mall/mall/1a/6b/a6a335d82408f8823c9eea5869ff5b46.png', 37, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (38, 1, '大英博物馆 盖亚·安德森猫和她的朋友\r\n们系列 波士顿包PU手拎斜挎包', 259.00, 104.00, 'https://i0.hdslb.com/bfs/mall/mall/c2/df/b7c8693511a4de97e4cce5b9e5f723f0.png', 190, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (39, 1, 'BEMOE《天官赐福》动画 谢怜印象风 手', 116.10, 86.00, 'https://i0.hdslb.com/bfs/mall/mall/d5/2e/d52e51972370b83332291850862d5263.png', 183, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (40, 1, '【“学过石油的语文老师”杨佳奇推荐】2', 55.90, 148.00, 'https://i0.hdslb.com/bfs/mall/mall/ec/82/a06ac664636ab689bbc6da5d7c340fa9.jpg', 9, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (41, 1, '【B站“王羽物理”推荐】24版解题觉醒新', 29.00, 18.00, 'https://i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png', 31, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (42, 1, '【B站“高考政治马宇轩”推荐】24版解题', 5.90, 134.00, 'https://i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png', 30, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (43, 1, '【B站“李林生物”推荐】24版解题觉醒新法', 55.90, 30.00, 'https://i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png', 34, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (44, 1, '【B站“一化儿”老师推荐】24版解题觉醒高考版解题方法', 55.90, 98.00, 'https://i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png', 31, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (45, 1, '飞之翔 DIY定制专拍链接补差专拍链接\r\n拍前联系客服', 1.00, 62.00, 'https://i0.hdslb.com/bfs/mall/mall/36/23/def63a7cc053804547758eb8d0028eee.png', 155, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (46, 1, '真无线游戏蓝牙耳机2023年吃鸡手游低\r\n延迟长续航降噪推荐性价比高', 39.90, 96.00, 'https://i0.hdslb.com/bfs/mall/mall/7c/c7/4bc7fb917682b295430443dadd2854c5.png', 168, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (47, 1, '【B站“清华数学系坑老师”推荐】24版解觉醒新高考版解题方法', 55.90, 124.00, 'https://i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png', 75, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (48, 1, '【B站“英语盖老师”推荐】24版解题觉醒高考版解题方法', 55.90, 121.00, 'https://i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png', 153, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (49, 1, 'DIY订制主机优质推荐、升级、补差，下前请查看详情页正品保证，未联系客服前单拍不发货', 1.00, 106.00, 'https://i0.hdslb.com/bfs/mall/mall/56/c5/33d69e29a4ee6acbac4356f5a1675aa5.png', 115, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (50, 1, '真无线游戏蓝牙耳机2023年吃鸡手游低\r\n延迟长续航降噪推荐性价比高', 39.90, 16.00, 'https://i0.hdslb.com/bfs/mall/mall/7c/c7/9dd701dd9f6a742f95d90e06a2aaefaa.png', 182, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (51, 1, '【B站“李说地理”推荐】24版解题觉醒新考版理解题方法', 55.90, 40.00, 'https://i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png', 37, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (52, 1, '开车推荐配置 13490F+影驰RTX4060TI大', 5599.00, 98.00, 'https://i0.hdslb.com/bfs/mall/mall/b5/09/11e7dd9e6c2b6e293a2acc63e4298778.png', 76, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (53, 1, '【B站“历史老师思思”推荐】24版解题觉新高考版解题方法', 55.90, 75.00, 'https://i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png', 101, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (54, 1, '良机1木 i5-13400F/RTX 3060ti 8G  英尔13代酷睿 DIY组装台式电脑主机电竞游戏整机 ', 5899.00, 69.00, 'https://i0.hdslb.com/bfs/mall/mall/9c/0c/4af5d682a3d83f90bb72b831b853a1c2.jpg', 133, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (55, 1, '3K配置推荐i3 12100F/16G/500G/RX6500 4G畅玩主流游戏', 2899.00, 31.00, 'https://i0.hdslb.com/bfs/mall/mall/db/23/f8c11248565d17e5d7487d25156f8547.png', 181, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (56, 1, '【小红书推荐】绿巨能Z85笔记本电脑支悬空可升降增高架散热站立式桌面便携折叠手提架子托游戏本平板支撑', 79.00, 153.00, 'https://i0.hdslb.com/bfs/mall/mall/bc/a5/e740136c3834ceafc9552127c5e96505.jpg', 198, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (57, 1, '无线蓝牙耳机2023年新款夹耳式骨传导\r\n不入耳运动久戴不痛超长续航', 89.00, 121.00, 'https://i0.hdslb.com/bfs/mall/mall/9a/12/7bb3e93d1620aa339619976224210f1e.png', 62, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (58, 1, 'POVOS奔腾 老罗推荐网红甜甜圈电动剃\r\n须刀 小飞碟 小巧便携刮胡须刀须刨智能情人节纪念日礼物送男友 T000', 289.00, 66.00, 'https://i0.hdslb.com/bfs/mall/mall/5e/b7/51ba75e47d2f76211f7487b7b6f6428d.jpg', 75, 0, 1, NULL, NULL, '2024-01-19 12:16:09');
INSERT INTO `xiaofan_goods` VALUES (59, 1, '测试商品', 0.01, 0.01, 'https://www.z4a.net/images/2024/01/19/test-good.jpg', 100, 0, 1, NULL, NULL, '2024-01-19 12:17:23');
INSERT INTO `xiaofan_goods` VALUES (64, 0, 'HuaWei Mate 60 Pro', 6999.00, 7999.00, 'http://xiaofanya.oss-cn-beijing.aliyuncs.com/642358-mate60pro.png', 2312, 0, 1, '2024-02-22 12:50:27', '2024-02-29 12:50:27', '2024-02-22 12:50:50');
INSERT INTO `xiaofan_goods` VALUES (66, 0, '仁坤', 213.00, 123.00, 'http://xiaofanya.oss-cn-beijing.aliyuncs.com/444475-4.jpg', 1, 0, 0, NULL, NULL, '2024-02-28 15:31:04');
INSERT INTO `xiaofan_goods` VALUES (72, 0, '测试', 2.00, 2.00, 'http://xiaofanya.oss-cn-beijing.aliyuncs.com/239866-%C3%A6%C2%88%C2%91%C3%A6%C2%8E%C2%A8%C3%A7%C2%9A%C2%84.png', 3, 0, 0, NULL, NULL, '2024-03-22 10:20:09');
INSERT INTO `xiaofan_goods` VALUES (73, 3, '测试', 9.90, 19.90, 'http://xiaofanya.oss-cn-beijing.aliyuncs.com/61512-20200128165823_lttrb.jpg', 1, 0, 0, NULL, NULL, '2024-05-15 09:53:39');
INSERT INTO `xiaofan_goods` VALUES (74, 0, '需要什么', 2320.00, 4.00, 'http://xiaofanya.oss-cn-beijing.aliyuncs.com/487733-v2-cf5e2c374ca2344c8f2fb1a3a0043990_r.jpg', 3, 0, 0, NULL, NULL, '2024-05-15 16:06:37');
INSERT INTO `xiaofan_goods` VALUES (75, 3, '需要什么打撒', 2320.00, 4.00, 'http://xiaofanya.oss-cn-beijing.aliyuncs.com/814656-%C3%A5%C2%BE%C2%AE%C3%A4%C2%BF%C2%A1%C3%A5%C2%9B%C2%BE%C3%A7%C2%89%C2%87_20240217221743.jpg', 3, 0, 0, NULL, NULL, '2024-05-15 16:07:40');
INSERT INTO `xiaofan_goods` VALUES (76, 1, '需要什么打撒', 2320.00, 4.00, 'http://xiaofanya.oss-cn-beijing.aliyuncs.com/857359-%C3%A5%C2%BE%C2%AE%C3%A4%C2%BF%C2%A1%C3%A5%C2%9B%C2%BE%C3%A7%C2%89%C2%87_20240515135540.jpg', 3, 1, 0, NULL, NULL, '2024-05-15 16:10:16');

-- ----------------------------
-- Table structure for xiaofan_goods_classify
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_goods_classify`;
CREATE TABLE `xiaofan_goods_classify`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `classify_parent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主商品分类如数码,服装,家用等...',
  `classify_parent_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主商品分类名称',
  `classify_child` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主商品子分类如数码里面的手机,耳机,电脑等等...',
  `classify_child_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主商品子分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_goods_classify
-- ----------------------------
INSERT INTO `xiaofan_goods_classify` VALUES (1, '0', '数码', '2', '手机');
INSERT INTO `xiaofan_goods_classify` VALUES (2, '0', '数码', '4', '充电器');
INSERT INTO `xiaofan_goods_classify` VALUES (3, '0', '数码', '5', '手机');
INSERT INTO `xiaofan_goods_classify` VALUES (4, '1', '周边', '6', '立牌');
INSERT INTO `xiaofan_goods_classify` VALUES (5, '0', '数码', '7', '手机壳');
INSERT INTO `xiaofan_goods_classify` VALUES (6, '1', '周边', '8', '模型');
INSERT INTO `xiaofan_goods_classify` VALUES (7, '0', '数码', '9', '耳机');
INSERT INTO `xiaofan_goods_classify` VALUES (8, '0', '数码', '10', '充电器');
INSERT INTO `xiaofan_goods_classify` VALUES (9, '0', '数码', '11', '手机壳');
INSERT INTO `xiaofan_goods_classify` VALUES (10, '1', '周边', '12', '模型');
INSERT INTO `xiaofan_goods_classify` VALUES (11, '0', '数码', '13', '手机');
INSERT INTO `xiaofan_goods_classify` VALUES (12, '0', '数码', '14', '充电器');
INSERT INTO `xiaofan_goods_classify` VALUES (13, '0', '数码', '15', '手机壳周边');
INSERT INTO `xiaofan_goods_classify` VALUES (14, '0', '数码', '17', '内存卡');
INSERT INTO `xiaofan_goods_classify` VALUES (15, '0', '数码', '18', '手机壳周边');
INSERT INTO `xiaofan_goods_classify` VALUES (16, '0', '数码', '19', '手机壳');
INSERT INTO `xiaofan_goods_classify` VALUES (17, '0', '数码', '20', '耳机');
INSERT INTO `xiaofan_goods_classify` VALUES (18, '0', '数码', '21', '散热器');
INSERT INTO `xiaofan_goods_classify` VALUES (19, '0', '数码', '22', '手机壳');
INSERT INTO `xiaofan_goods_classify` VALUES (20, '2', '服装', '24', '卫衣');
INSERT INTO `xiaofan_goods_classify` VALUES (21, '2', '服装', '25', '外套');
INSERT INTO `xiaofan_goods_classify` VALUES (22, '2', '服装', '26', '卫衣');
INSERT INTO `xiaofan_goods_classify` VALUES (23, '2', '服装', '27', '棉衣');
INSERT INTO `xiaofan_goods_classify` VALUES (24, '2', '服装', '28', '卫衣');
INSERT INTO `xiaofan_goods_classify` VALUES (25, '2', '服装', '29', '羽绒服');
INSERT INTO `xiaofan_goods_classify` VALUES (26, '2', '服装', '30', '外套');
INSERT INTO `xiaofan_goods_classify` VALUES (27, '1', '周边', '31', '毛毯');
INSERT INTO `xiaofan_goods_classify` VALUES (28, '3', '潮鞋', '32', '休闲鞋');
INSERT INTO `xiaofan_goods_classify` VALUES (29, '2', '服装', '33', '卫衣');
INSERT INTO `xiaofan_goods_classify` VALUES (32, '0', '数码', '72', '手机');
INSERT INTO `xiaofan_goods_classify` VALUES (33, '3', '潮鞋', '73', '休闲鞋');
INSERT INTO `xiaofan_goods_classify` VALUES (34, '0', '数码', '74', '手机');
INSERT INTO `xiaofan_goods_classify` VALUES (35, '3', '潮鞋', '75', '休闲鞋');
INSERT INTO `xiaofan_goods_classify` VALUES (36, '1', '周边', '76', '模型');

-- ----------------------------
-- Table structure for xiaofan_goods_classify_icon
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_goods_classify_icon`;
CREATE TABLE `xiaofan_goods_classify_icon`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `toUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xiaofan_goods_classify_icon
-- ----------------------------
INSERT INTO `xiaofan_goods_classify_icon` VALUES (1, '手办', '/pages/category/category?id=1', 'https://i0.hdslb.com/bfs/mall/mall/1e/32/1e3279abc97c8581bdc8be16cb5589d7.png');
INSERT INTO `xiaofan_goods_classify_icon` VALUES (2, '周边', '/pages/category/category?id=1', '//i0.hdslb.com/bfs/mall/mall/59/28/5928f9dec0928bf4c92fbbb224582573.png');
INSERT INTO `xiaofan_goods_classify_icon` VALUES (3, '今日上新', '/sx', '//i0.hdslb.com/bfs/mall/mall/17/bf/17bf0936d7ba30ff968740f43e094b7e.png');
INSERT INTO `xiaofan_goods_classify_icon` VALUES (4, '图书漫画', '/ts', '//i0.hdslb.com/bfs/mall/mall/e4/c8/e4c8d4bad5606373dc261fb4fcda28c6.png');
INSERT INTO `xiaofan_goods_classify_icon` VALUES (5, '数码', '/pages/category/category?id=0', 'https://i0.hdslb.com/bfs/mall/mall/a5/9a/a59a438ee66f088e71d949a886cbbc7d.png');
INSERT INTO `xiaofan_goods_classify_icon` VALUES (6, '全部分类', '/all', '//i0.hdslb.com/bfs/mall/mall/5e/81/5e81407b4c75a330deead13addc4ebda.png');
INSERT INTO `xiaofan_goods_classify_icon` VALUES (7, '图书漫画', '/ts', '//i0.hdslb.com/bfs/mall/mall/e4/c8/e4c8d4bad5606373dc261fb4fcda28c6.png');
INSERT INTO `xiaofan_goods_classify_icon` VALUES (8, '周边', '/pages/category/category?id=1', '//i0.hdslb.com/bfs/mall/mall/59/28/5928f9dec0928bf4c92fbbb224582573.png');
INSERT INTO `xiaofan_goods_classify_icon` VALUES (9, '潮鞋', '/pages/category/category?id=3', '//i0.hdslb.com/bfs/mall/mall/17/bf/17bf0936d7ba30ff968740f43e094b7e.png');
INSERT INTO `xiaofan_goods_classify_icon` VALUES (10, '全部分类', '/pages/category/category?id=0', '//i0.hdslb.com/bfs/mall/mall/5e/81/5e81407b4c75a330deead13addc4ebda.png');

-- ----------------------------
-- Table structure for xiaofan_goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_goods_detail`;
CREATE TABLE `xiaofan_goods_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `goodsId` int NULL DEFAULT NULL COMMENT '商品id',
  `detail_img` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '商品详情图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_goods_detail
-- ----------------------------
INSERT INTO `xiaofan_goods_detail` VALUES (1, 2, '[{\"imgUrl\":\"https://gw.alicdn.com/bao/uploaded/i4/1917047079/O1CN01qgWz9S22AEcwf1Sqq_!!1917047079.jpg_Q75.jpg_.webp\"},{\"imgUrl\":\"https://pacomoby.ba/wp-content/uploads/2022/11/czcs_iphone14promax_q422_deep-purple_pdp-images_position-1a_t_4_4-2-1.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (3, 3, '[{\"imgUrl\":\"https://gw.alicdn.com/imgextra/i4/1652554937/O1CN01ry8mjH1mLC9FpfhG2_!!1652554937.jpg_468x468Q75.jpg_.webp\"},{\"imgUrl\":\"https://gw.alicdn.com/imgextra/i1/1652554937/O1CN01t7XEsg1mLCGbaqOXE_!!1652554937.jpg_468x468Q75.jpg_.webp\"},{\"imgUrl\":\"https://gw.alicdn.com/imgextra/i3/1652554937/O1CN01dCoupE1mLCHfOU1Lr_!!1652554937.jpg_468x468Q75.jpg_.webp\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/e0/07/e0077dea900bb68f1b8fcbf1a14cf794.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (4, 4, '[{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/vendor/9c/c5/9cc5961992e155de6c9de391317774ac.jpg@750w_.webp\"}, {\"imgUrl\": \"//i0.hdslb.com/bfs/mall/vendor/6c/b9/6cb93d2e6e0864f7d736da3d3c999005.jpg@750w_.webp\"}, {\"imgUrl\": \"//i0.hdslb.com/bfs/mall/vendor/45/06/450671d5046635136bba79218a009d9d.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (5, 5, '[{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/85/4e/aaed7385f98ded44af84e60cbb3ccb1b.jpg@750w_.webp\"}, {\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/f2/80/2780bbd6da4f9d600d90e81b74addd98.jpg@750w_.webp\"}, {\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/0f/39/13169377c0c9c0dbe0a3c0ad89e42abb.jpg@750w_.webp\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (6, 6, '[{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/vendor/f3/ff/f3ff0b77af99a9c958358db15ad78c46.png@750w_.webp\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/vendor/f3/ff/f3ff0b77af99a9c958358db15ad78c46.png@750w_.webp\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (7, 7, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/36/74/3674b156f3d1c974117f5ff7ca70b221.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/ac/cc/acccafd9a3777b8e6619c54b9b15557c.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/8e/0d/8e0dc92289a6ff9bc928d4675ce88203.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/33/3f/333f9dbd5662e1f493162e57610a0196.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/00/7d/007db7c9d54463790c506eed8095cfcb.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (8, 8, '\r\n\r\n[{\"imgUrl\":\"https://i0.hdslb.com/bfs/mall/mall/27/ab/27abd3a0aa4d22b87288330879afb2bc.jpg@800w_800h.webp\"},{\"imgUrl\":\"https://i0.hdslb.com/bfs/mall/mall/6b/ac/6baca961a1db21ef1e7ad4b5040a7415.jpg@750w_.webp\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (9, 9, '[{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/1a/a2/8e02acfa945d7e5e12d3be43b9fea555.PNG\"}, {\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/d9/9e/f5a8af270c93cce2d61d288d5a74ab83.png\"}, {\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/aa/42/b216181d0f4ea7636cea3e0273c7dd66.jpg\"}, {\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/7c/63/147caed0081ae620ccd614b389be3036.jpg\"}, {\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/f2/5b/5e9537f48a99b626d598578dc8fa2648.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (10, 10, '[{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/vendor/d2/be/d2be9d592abb469b30a96c577ed199ca.jpg@750w_.webp\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/vendor/fe/ac/feac8d4d9bbd16b90427979b463335cc.jpg@750w_.webp\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/vendor/83/02/83027926fa26462ca3f73e0066721258.jpg@750w_.webp\"}]\r\n');
INSERT INTO `xiaofan_goods_detail` VALUES (11, 11, '[{\"imgUrl\": \"https://i0.hdslb.com/bfs/mall/vendor/71/8a/718a142784c41dd4f90290a6b7e7d8b8.png\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/vendor/1b/df/1bdfa4997019cd9871365901db881eb2.png\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/vendor/8e/46/8e46c6d350a44259d72eca55550f977f.png\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/vendor/46/c8/46c8c24105b8a18ff5c9ae04570929cd.png\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/vendor/0a/35/0a35a3d84ed0af9bf22a064852ce1e3f.png\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (12, 12, '[{\"imgUrl\": \"https://i0.hdslb.com/bfs/mall/mall/e5/3e/627e0afb7a9443ed6a90226b49b20feb.jpg\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/03/72/c717811f6a945de7d3e4f4822f365122.jpg\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/de/76/3ab645842f7cbc080eec91d2d616feaf.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (13, 13, '[{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/21/14/a838b8693bd1ab84514a0125a0acc4f3.jpg\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/e8/62/0f337deb712ab7a84edbf837782f1c37.jpg\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/f0/e0/3c3bc14ad72d9f64af4b032d7c91805c.jpg\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/2b/0a/e3f050d6fd63e95b40be74735bcedf73.jpg\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/18/d7/600155ca700a5c839501443f4f719dbb.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (14, 14, '[\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/6d/dc/6ddcc15654b9f7b7657a3bcde93e98f1.png\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/86/ec/86ec30d64d2c7dc59d40fbbaf1a095b5.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/3e/7a/3e7a90a5365191c780f6143e83ed629a.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/e1/00/e1004671137dab5da557fd4291565351.jpg\"}\r\n]');
INSERT INTO `xiaofan_goods_detail` VALUES (15, 15, '[{\"imgUrl\": \"https://i0.hdslb.com/bfs/mall/mall/e5/25/e5252fdcd671a9752560add6fcb51563.jpg\"},{\"imgUrl\": \"https://i0.hdslb.com/bfs/mall/mall/89/f4/89f41b88a3c8c8946a372ea810efa61d.jpg\"},{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/43/1f/431f435b4838e180a8275d7333718a25.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (17, 17, '[\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/65/91/ccec7e298222ffa6ba13f7e53b43f8fb.png\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/f2/22/ee4eef179fb6cdff66090d38dd8692db.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/16/b8/0d5f610c7e8807f50614daa1795ff065.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/60/6c/7f4c330c627f00dd386df0d9cb19e6b2.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/97/69/ea05e5698ee85a14e072a8178519b463.jpg\"}\r\n]');
INSERT INTO `xiaofan_goods_detail` VALUES (18, 18, '[{\"imgUrl\": \"https://i0.hdslb.com/bfs/mall/mall/c3/6c/c36c6a47525817bc65f1faab8179d269.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (19, 19, '[{\"imgUrl\": \"https://i0.hdslb.com/bfs/mall/mall/c3/6c/c36c6a47525817bc65f1faab8179d269.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (20, 20, '[{\"imgUrl\": \"https://i0.hdslb.com/bfs/mall/mall/a0/3a/9d57f95f8da21a4d8beecae8d7c65a4c.jpg\"},{\"imgUrl\": \"https://i0.hdslb.com/bfs/mall/mall/2f/22/8687b18095dc7434591b03865914785f.jpg\"},{\"imgUrl\": \"https://i0.hdslb.com/bfs/mall/mall/8c/db/573f6662023b6abcd802510272683093.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (21, 21, '[{\"imgUrl\": \"https://i0.hdslb.com/bfs/mall/mall/fd/ee/55f732a5ffcc0a5dff123539986c32ee.jpg\"},{\"imgUrl\": \"https://i0.hdslb.com/bfs/mall/mall/85/a5/b05c743552a5768ed1f88cf57e07246a.jpg\"},{\"imgUrl\": \"https://i0.hdslb.com/bfs/mall/mall/25/4d/ece3e48b7ff33f13ce7b5ee5e88c0fe9.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (22, 22, '[{\"imgUrl\":\"https://i0.hdslb.com/bfs/mall/mall/f7/95/dbba962773a385147f5964fb99706831.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/90/97/a20c2\\n50934a81970114e2a3b13598d95.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/82/15/cc84ef5bf1a4965fc5154c223c6421c2.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/0d/ab/60f0acc3aed34b2e59bb5ce203486ef5.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/28/37/cecd7c6a840ba27cfe0c1e85d02675f8.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (24, 25, '[{\"imgUrl\":\"https://i0.hdslb.com/bfs/mall/mall/e6/21/2356085e210bbd2bf60dfa06618afc7c.jpg\"},{\"imgUrl\":\"https://i0.hdslb.com/bfs/mall/mall/c1/47/98020a16f14eb72e6522e3807f8453e6.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (25, 24, '[\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/dd/9c/dd9c75863c0bc623cb51390ada115aab.png\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/0b/72/0b7255cc418d9b43b977ea4a023092c7.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/b1/e2/b1e27b70c2decd00324ceb0d56d884a2.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/5e/89/5e89402f6a60c82b35a3efb27832b75e.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/ea/b0/eab04028c661a616da92c8a222fce16d.jpg\"}\r\n]');
INSERT INTO `xiaofan_goods_detail` VALUES (26, 26, '[\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/bc/0c/bc0c3833d2cf7f21f43c63d3e718a4bb.png\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/00/00/00004f208b09da7193ebe5c8a0eeb179.png\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/58/aa/58aa9d532e27dc152da8933472b55c37.png\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/b7/8a/b78acdcbee0859bc17105189008f952f.png\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/50/f2/50f29b51ac9b4aec5ed54c4b9d7f156c.png\"}\r\n]');
INSERT INTO `xiaofan_goods_detail` VALUES (27, 27, '[\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/04/0e/9bb3ab3d1a09fd8dfc259529dd6c8351.png\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/ef/a0/688b77bcc4734f0f7d9893a1026faac0.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/5f/e8/f456a3853cb49d024e0e966afc5e5c24.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/80/ea/a7669f4dfe1f5b4b92b761ac71e364a9.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/2d/c6/b9d56e02e184d19b8591459b6d228448.jpg\"}\r\n]');
INSERT INTO `xiaofan_goods_detail` VALUES (28, 28, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/7a/bb/7abb1f3afba46a1eac821fe7d37ba8b0.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/da/49/da49e6b9a00e6e2392243d7f53db1b5e.png\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (29, 29, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/0b/de/085243827de2989ecde2a7b43803a9c8.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/35/ad/6c5e62325cb2e2af6fcf960ae6102407.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/a4/57/6dbede7285f54e412088f26927c19fd2.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/e0/ff/5bf5ad207b069d5f128270335221f72f.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/7a/bf/14d15cb70b13a1d9ca8c4d2831a6cb23.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (30, 30, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/61/2a/e0520a5213cdeaa65de058989ce634a2.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/41/bc/dbd44fb53776c97393e56f08c0f1b2a0.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/2c/38/92117b92928f354c523c37bcaab34a2a.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/f6/a6/d98e846b56e748521763618f5a30f26f.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/cc/81/f457fde16539f40772cdf7f893226b70.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (31, 34, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/63/c8/466b2b299461d9a44da0eb924acaf4a7.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/d8/93/ebe4570baba0ca698949273232ceb744.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/75/e8/bf63dfbd191c4bc273f1f8eed92cfa08.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/8f/51/b18a82f3f698f94c9d9a9d8abcd57b83.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/7e/46/c4b1fe3bd5cffe2dfd56428a54e737bb.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (32, 32, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/e8/65/e865c319042600866e3463d8a461f54b.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/f9/80/f980e2dbd1ca150d9d76d5b08a872d79.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/6e/c4/6ec49e9726ce9452a20addaa2484267d.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/ca/fd/cafdf5ee2ac920abc70b7708f6828f72.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/14/81/1481ebfdafd84ae34c1869c7f0eb22cb.png\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (33, 35, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/70/9d/709da01ac852819e51b46accb559c259.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/e5/e3/e5e300528178b3afc1ba117c0227f4a2.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/02/cf/02cf08edc96f0d412739a1e4dca622da.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/2d/8b/2d8bbd059033ffb426def0e217bfd2c8.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/9b/a1/9ba10e0034b5a47dabb5e2a7204dbf8d.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (34, 33, '[{\"imgUrl\": \"//i0.hdslb.com/bfs/mall/mall/8b/a6/8ba630a726c34df76ce9d8f840986ecd.png\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (35, 31, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/cc/c7/ccc7602068e24cdfc879f287eb4e35b1.png\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/9c/f9/9\\ncf9c51a795ed47d01ef77ceddcd36ec.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/9c/d0/9cd066c4ae339b10c6ace889ffe35ef6.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/99/4a/994a44e3ec691fb6771659772b1aa769.jpg\"},\r\n{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/vendor/78/35/78359c348cf9c0edd2db4e13764adaca.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (36, 36, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/ea/c9/38c9d8eb98dbfeea2c2ab094d3f46a74.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/74/78/756f7\\nfa20212e9fac16e3d78a656be9d.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/fd/3b/3594bb059187bc8dd64dfb5b0beeee02.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/fd/aa/42115abd2d5d6750269658adfb54fda3.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/02/31/53c7e3895ddd0a14f52f2a932f5b01be.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (37, 38, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/c2/df/b7c8693511a4de97e4cce5b9e5f723f0.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/c2/7d/1e3fa\\n4bbe04bdcc7a819b843f9dd4b8a.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/9f/f7/1e5550e0ba5d4040221d86d0d976ddff.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/c9/e2/b153e2d19dc5905e2b0711f2d5522b1b.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/1f/bb/c2bd8ddf75d94844cafc0eee77471cfd.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (38, 39, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/d5/2e/d52e51972370b83332291850862d5263.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/5d/c9/5dc95\\nd27937efcd568dbf4b30220833e.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/23/ae/23aee1c12900e6e9382bbc5e9d93b308.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/65/cc/65cca1fd89f853690577bd9afd94d4fe.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/f6/d5/f6d5423eedb59f747e979c348b7187f5.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (40, 40, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/06/c3/e8859894823de1d5bb086a93073b72f7.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/62/89/55a96927909f8d0c0930ea5ed82ed09c.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4c/4c/9c155293365dffe492f8dbd8003d19aa.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4e/27/8c8ad57215c88871d3ce08ba9f71e7ee.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (41, 41, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/06/c3/44242660970a8a770716e7e77a2eeb39.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/62/89/adca1d512fe7ca246490d21b321d0081.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/f7/d9/ccc70539ee40bbbf7efbcf650e77d68c.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4c/4c/65a80935f5bc1709e47a28909051b538.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (42, 42, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/06/c3/44242660970a8a770716e7e77a2eeb39.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/62/89/adca1d512fe7ca246490d21b321d0081.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/f7/d9/ccc70539ee40bbbf7efbcf650e77d68c.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4c/4c/65a80935f5bc1709e47a28909051b538.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (43, 43, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/06/c3/b17055a88363ee0dcf0131eed00efbb3.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/62/89/316717b058d59c9a2b0b4de41139dde0.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4c/4c/eb85b81d3b86341602475482fda971b5.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4e/27/cd631eadda2a65ee92de754802b8a3ea.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (44, 44, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/06/c3/f480a1d3a96ff0ab5abb83b1844a5a5b.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/62/89/956ef5629fa557901d364245c8161860.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4c/4c/c5a332ceffe584296a553a2a679ddffc.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4e/27/b4105a6e7b81879b5ef1e026eb1b8120.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (45, 45, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/36/23/def63a7cc053804547758eb8d0028eee.png\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/f8/ec/cf003f08fd377d02a57484551be0e5d0.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/e9/e8/bd2e8846d74b955d5be0ae401dd794ee.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4f/b1/1d48db00af7db2a9f08cdbbbbc384198.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/61/20/64af639f4e11ff4a80bfe45fd49f6a8d.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (46, 46, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/7c/c7/4bc7fb917682b295430443dadd2854c5.png\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/92/af/41ca7513828765e34c6f540745feb294.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/73/4c/f1bb9ec88a5d75f4234a3934503c152d.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/65/4f/2a0a0644fc6b05e000501daf7a82b7e0.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/6f/f6/2cebf80e3ed3b60a72b0e6c2120383f8.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (47, 47, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/06/c3/772da59bcfa3254cdfa4fb6dd7b281cc.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/62/89/e1f2c361dc81272ec63d6831d961db33.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4c/4c/7cbbf0eea890bd889c497093d9eb1263.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4e/27/838a157c1cf35cbee3d895d752a17ccc.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (48, 48, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/06/c3/d6b4f897b7b1e44fdf6c93e3709e07d4.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/62/89/6aa99248295017e345977b7a9a95b685.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4c/4c/b202f5d742e46bed4645517e68c22bfe.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4e/27/db19b16237722b1b853d5ece5115d728.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (49, 49, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/56/c5/33d69e29a4ee6acbac4356f5a1675aa5.png\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/34/92/78996699faf2f51f451194b8bfaf3079.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/c6/c4/5727898f91619c0ff47a2c038f7fb61e.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/02/d7/1b52dbbbe2f53b9dc9987ce86a9e2bad.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/17/60/ae2717edd86cb188d3a00bd98514b006.png\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (50, 50, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/7c/c7/9dd701dd9f6a742f95d90e06a2aaefaa.png\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/73/4c/a377630ec9584d128a2e2959fe1c1904.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/65/4f/265c0b7399cafd433ae1ab128362696d.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/6f/f6/20f8d6d759c01d5a262f789fa21ab688.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (51, 51, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/06/c3/44242660970a8a770716e7e77a2eeb39.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/62/89/adca1d512fe7ca246490d21b321d0081.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/f7/d9/ccc70539ee40bbbf7efbcf650e77d68c.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4c/4c/65a80935f5bc1709e47a28909051b538.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (52, 52, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/b5/09/11e7dd9e6c2b6e293a2acc63e4298778.png\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (53, 53, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/3f/cd/3e2ecd151d08003349f16f469987711a.png\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/06/c3/44242660970a8a770716e7e77a2eeb39.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/62/89/adca1d512fe7ca246490d21b321d0081.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/f7/d9/ccc70539ee40bbbf7efbcf650e77d68c.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4c/4c/65a80935f5bc1709e47a28909051b538.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (54, 54, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/9c/0c/4af5d682a3d83f90bb72b831b853a1c2.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/32/d2/88f69130fd8911a24cd6c8e6ae77950d.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/27/bd/f1e3e305eee1a289ebcc286a67605707.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/d5/13/ede36da335145e0e5dc2fd6f57a0508e.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/51/a2/1e70a1cfd89f8be611712f28c7d2817f.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (55, 55, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/db/23/f8c11248565d17e5d7487d25156f8547.png\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/ef/a1/06b555c39a27edfb06ae5bc437e1341c.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/40/4f/142a1047308b58e5f57a0d0a3d5aa136.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/bf/ff/6cb0f27281b565c1465adb928af762c3.png\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (56, 56, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/bc/a5/e740136c3834ceafc9552127c5e96505.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/ff/1b/952990be4d071a169f8b9d60d6e59a81.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/4b/9e/65af83e38cdbb1d4e198b0606f36cd1e.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/65/43/db03d189f3af2e0a03d5f85f4fefb640.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/9b/ca/715047618616e3e735aff47df12072fb.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (57, 57, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/9a/12/7bb3e93d1620aa339619976224210f1e.png\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/2f/f2/ea88d3f1aef79dba5a0b8f8d8ae59ec4.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/dd/99/6a1d45b947463d01d41815f09beffc00.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/27/b3/ccdbd4948986a6416576466f1e2f3be3.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/08/51/07143ae07a221d7fce8d8ce6ca5dd9d4.jpg\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (58, 58, '[{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/5e/b7/51ba75e47d2f76211f7487b7b6f6428d.jpg\"},{\"imgUrl\":\"//i0.hdslb.com/b\r\nfs/mall/mall/14/6f/15fa78e11bc3cb64e34e9da904a0f4a1.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/13/b1/04e9c6060ae29ab0b5c80e8b304d3984.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/a2/a2/a8541fd2ba4686ac56b01fd4e7a3c041.png\"},{\"imgUrl\":\"//i0.hdslb.com/bfs/mall/mall/05/36/cfd218a828edbf3807962db8a39810e7.png\"}]');
INSERT INTO `xiaofan_goods_detail` VALUES (59, 59, '[{\"imgUrl\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"},{\"imgUrl\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]');

-- ----------------------------
-- Table structure for xiaofan_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_goods_sku`;
CREATE TABLE `xiaofan_goods_sku`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '商品的规格Id',
  `goodsId` int NOT NULL COMMENT '商品归属Id',
  `skuId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'skuId',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `spec_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格属性名称',
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品价格',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品尺寸',
  `organization_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名称如个,瓶,件,箱,只,条...',
  `inventory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库存',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'sku图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小帆购物网商品规格' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_goods_sku
-- ----------------------------
INSERT INTO `xiaofan_goods_sku` VALUES (1, 1, NULL, '[{\"title\":\"商品规格名称\"},{\"text\":\"机身颜色\"},{\"text\":\"存储容量\"}]', NULL, NULL, 'XL', NULL, '30', '[{\"title\":\"商品图片\"},{\"text\":\"https://gw.alicdn.com/bao/uploaded/i4/1917047079/O1CN01qgWz9S22AEcwf1Sqq_!!1917047079.jpg_Q75.jpg_.webp\"},{\"text\":\"https://gw.alicdn.com/bao/uploaded/i3/1917047079/O1CN01jAzQCF22AEcus6LGh_!!1917047079.jpg_Q75.jpg_.webp\"},{\"text\":\"https://gw.alicdn.com/bao/uploaded/i3/1917047079/O1CN010C3yYX22AEcreWimg_!!1917047079.jpg_Q75.jpg_.webp\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (2, 2, '[{\"text\":\"1001\"},{\"text\":\"1002\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"暗夜紫\"},{\"text\":\"黑\"}]', '[{\"title\":\"规格名称\"},{\"text\":\"手机颜色\"},{\"text\":\"内存\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"7699\"},{\"text\":\"8999\"}]', '[{\"title\":\"手机内存\"},{\"text\":\"128GB\"},{\"text\":\"256GB\"}]', '台', '[{\"title\":\"库存\"},{\"text\":\"100\"},{\"text\":\"21\"},{\"text\":\"50\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://pacomoby.ba/wp-content/uploads/2022/11/czcs_iphone14promax_q422_deep-purple_pdp-images_position-1a_t_4_4-2-1.jpg\"},{\"text\":\"https://gw.alicdn.com/bao/uploaded/i4/1917047079/O1CN01qgWz9S22AEcwf1Sqq_!!1917047079.jpg_Q75.jpg_.webp\"}]\r\n');
INSERT INTO `xiaofan_goods_sku` VALUES (3, 3, '[{\"text\":\"1003\"},{\"text\":\"1004\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"【修饰泛红】绿隔（适合泛红痘印肌）\"},{\"text\":\"【提亮肤色】隔离#紫（适合偏黄暗沉肌）\"}]', '[{\"title\":\"规格名称\"},{\"text\":\"产品颜色\"},{\"text\":\"容量\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"19.9\"},{\"text\":\"29.9\"}]', '[{\"title\":\"容量\"},{\"text\":\"125ml\"},{\"text\":\"250ml\"}]', '瓶', '[{\"title\":\"库存\"},{\"text\":\"100\"},{\"text\":\"21\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://gw.alicdn.com/imgextra/i4/1652554937/O1CN01ry8mjH1mLC9FpfhG2_!!1652554937.jpg_468x468Q75.jpg_.webp\"},{\"text\":\"https://gw.alicdn.com/imgextra/i1/1652554937/O1CN01t7XEsg1mLCGbaqOXE_!!1652554937.jpg_468x468Q75.jpg_.webp\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (4, 4, '[{\"text\":\"1005\"},{\"text\":\"1006\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"65W 一拖三2C+1A手机笔记本快充套装\"},{\"text\":\"125W 一拖三3C+1A手机笔记本快充套装\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"名称\"},{\"text\":\"充电速率\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"19.9\"},{\"text\":\"29.9\"}]', '[{\"title\":\"充电速率\"},{\"text\":\"75w\"},{\"text\":\"125w\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"461\"},{\"text\":\"312\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/80/b8/80b8b41a9caeece935f54bbe8f5f0561.png@480w_85q.webp\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/42/bc/42bcbca9df55913637eb931d4304cbef.png@480w_85q.webp\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (5, 5, '[{\"text\":\"1007\"},{\"text\":\"1008\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"Sony/索尼 Xperia 1 IV XQ-CT72智能5G微单摄影摄像手机\"},{\"text\":\"Sony/索尼 Xperia 2 IV XQ-CT82智能5G微多摄影摄像手机\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"名称\"},{\"text\":\"存储\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"3999\"},{\"text\":\"4999\"}]', '[{\"title\":\"内存\"},{\"text\":\"128GB\"},{\"text\":\"256GB\"}]', '台', '[{\"title\":\"库存\"},{\"text\":\"3124\"},{\"text\":\"1124\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/f0/e0/3c3bc14ad72d9f64af4b032d7c91805c.jpg@800w_800h.webp\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/2b/0a/e3f050d6fd63e95b40be74735bcedf73.jpg@800w_800h.webp\"}]\r\n');
INSERT INTO `xiaofan_goods_sku` VALUES (6, 6, '[{\"text\":\"1009\"},{\"text\":\"1010\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"怨仇\"},{\"text\":\"百眼巨人\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"名称\"},{\"text\":\"尺寸\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"12.5\"},{\"text\":\"4.5\"}]', '[{\"title\":\"尺寸\"},{\"text\":\"3×3cm\"},{\"text\":\"3×5cm\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"12364\"},{\"text\":\"28651\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/36/74/3674b156f3d1c974117f5ff7ca70b221.png@800w_800h.webp\"},{\"text\":\"//i0.hdslb.com/bfs/mall/mall/11/e8/11e8a5bf1d1289827e0e649330d386e7.png@1000w.webp\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (7, 7, '[{\"text\":\"1011\"},{\"text\":\"1012\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"苹果iphone\"},{\"text\":\"安卓\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"型号\"},{\"text\":\"图案\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"29.9\"},{\"text\":\"16.5\"}]', '[{\"title\":\"图案\"},{\"text\":\"一条好龙\"},{\"text\":\"没钳了我\"}]', '个', '[{\"title\":\"库存\"},{\"text\":\"192812\"},{\"text\":\"281651\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/32/f0/03d6a4798e6fdd9cdada1d54bb4ed0a2.jpg@800w_800h.webp\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/66/62/010a4bb15fcb2da917b13c6bdb56474f.jpg@800w_800h.webp\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (8, 8, '[{\"text\":\"1013\"}]', '[{\"title\":\"品牌\"},{\"text\":\"万代\"}]', '[{\"title\":\"sku名称\"},{\"text\":\"品牌\"},{\"text\":\"名称\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"197.85\"}]', '[{\"title\":\"名称\"},{\"text\":\"假面骑士555成品模型\"}]\r\n', '条', '[{\"title\":\"库存\"},{\"text\":\"415\"}]', '\r\n\r\n[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/27/ab/27abd3a0aa4d22b87288330879afb2bc.jpg@800w_800h.webp\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/6b/ac/6baca961a1db21ef1e7ad4b5040a7415.jpg@750w_.webp\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (9, 9, '[{\"text\":\"1014\"},{\"text\":\"1015\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"【ANC降噪+AUX音频线+电脑USB蓝牙接收器】\"},{\"text\":\"【ANC降噪+AUX音频线+电脑USB蓝牙接收器】\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"名称\"},{\"text\":\"颜色\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"179\"},{\"text\":\"169\"}]', '[{\"title\":\"颜色\"},{\"text\":\"白色\"},{\"text\":\"黑灰色\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"5115\"},{\"text\":\"21235\"}]', '\r\n\r\n[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/1a/a2/8e02acfa945d7e5e12d3be43b9fea555.PNG@800w_800h.webp\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/aa/42/b216181d0f4ea7636cea3e0273c7dd66.jpg@800w_800h.webp\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (10, 10, '[{\"text\":\"1016\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"初音未来VOCALOID联名氮化镓充电器笔记本苹果华为手机充电器一拖四充电头\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"名称\"},{\"text\":\"功率\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"179\"}]', '[{\"title\":\"充电速率\"},{\"text\":\"125w\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"415\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/33/7b/337ba9061dbb4c828c44647ebf2d3d02.png@800w_800h.webp\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/ac/d0/acd0f80dab06b4bf4206b9cca092722e.jpg@800w_800h.webp\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/44/69/44698bd25b11210416e8def7ce68b902.jpg@800w_800h.webp\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (11, 59, '[{\"text\":\"1017\"}]', '[{\"title\":\"测试商品勿拍\"},{\"text\":\"测试商品勿拍\"}]', '[{\"title\":\"测试\"},{\"text\":\"测试\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"0.01\"}]', '[{\"title\":\"测试\"},{\"text\":\"测试\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"100\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (12, 11, '[{\"text\":\"1018\"}]', '[{\"title\":\"机型\"},{\"text\":\"iphone14pro\"}]', '[{\"title\":\"手机型号\"},{\"text\":\"机型\"},{\"text\":\"参数\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"79.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"罗小黑-伴你同行系列硅胶手机壳-勾勾手\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"230\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/71/8a/718a142784c41dd4f90290a6b7e7d8b8.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/1b/df/1bdfa4997019cd9871365901db881eb2.png\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (13, 12, '[{\"text\":\"1019\"}]', '[{\"title\":\"品牌\"},{\"text\":\"万代\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"品牌\"},{\"text\":\"名称\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"169.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"DX 假面骑士GEATS 蜘蛛手机 成品型\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"50\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/51/02/f8be3b70026db0849f268bfc40d04920.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/03/72/4446904cc6ca5d237f02c0c8a413c184.jpg\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (14, 13, '[{\"text\":\"1020\"}]', '[{\"title\":\"品牌\"},{\"text\":\"Sony/索尼\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"品牌\"},{\"text\":\"名称\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"5699.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"XQ-DE72 Xperia 5 V 小尺寸高性能Vlog拍摄 智能5G手机\"}]', '台', '[{\"title\":\"库存\"},{\"text\":\"124\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/cb/19/76d9723b913b6db4eeafc6c71ea8ec2a.jpg\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/51/ce/5b405dc67274f3786524b997c50ecbd4.jpg\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (15, 14, '[{\"text\":\"1021\"}]', '[{\"title\":\"品牌\"},{\"text\":\"品胜\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"品牌\"},{\"text\":\"名称\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"269.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"初音未来VOCALOID联名120W氮化镓充电器笔记本苹果华为手机充电器一拖四充电头\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"1224\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/33/7b/337ba9061dbb4c828c44647ebf2d3d02.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/ac/d0/acd0f80dab06b4bf4206b9cca092722e.jpg\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (16, 15, '[{\"text\":\"1022\"}]', '[{\"title\":\"品牌\"},{\"text\":\"哔哩哔哩\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"品牌\"},{\"text\":\"名称\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"59.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"2233娘机械姬手机壳 周边\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"124\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/b6/c4/b6c445f9549477ffb0e93c0409abd63d.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/88/fa/88fa37a200bbe0ea8997c5bec4eed796.jpg\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (17, 17, '[{\"text\":\"1023\"}]', '[{\"title\":\"品牌\"},{\"text\":\"金士顿\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"品牌\"},{\"text\":\"名称\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"29.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"手机存储卡行车记录仪内存卡读速\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"524\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/65/91/ccec7e298222ffa6ba13f7e53b43f8fb.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/f2/22/ee4eef179fb6cdff66090d38dd8692db.jpg\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (18, 18, '[{\"text\":\"1024\"}]', '[{\"title\":\"品牌\"},{\"text\":\"哔哩哔哩\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"品牌\"},{\"text\":\"名称\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"49.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"板件里的33娘 手机壳（6/6S)\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"224\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/61/d2/61d2d2e0769dc85dda7ce6ccde8d9f72.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/2d/4e/2d4e388937e893bbad0e7b5f8e1909e4.jpg\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/7f/1c/7f1ca1aeeb3a9d0e60a5b8a2aaf301cf.jpg\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (19, 19, '[{\"text\":\"1025\"},{\"text\":\"1026\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"墨黑\"},{\"text\":\"苍绿\"}]', '[{\"title\":\"规格名称\"},{\"text\":\"手机颜色\"},{\"text\":\"名称\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"299\"},{\"text\":\"299\"}]', '[{\"title\":\"规格\"},{\"text\":\"支架原装手机壳  保护套\"},{\"text\":\"支架原装手机壳  保护套\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"100\"},{\"text\":\"21\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/46/04/7de489003cbb8b79b07915292560da0d.jpg\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/87/02/4efca6e303c6fb6e22105c8fb47adfc4.jpeg\"}]\r\n');
INSERT INTO `xiaofan_goods_sku` VALUES (20, 20, '[{\"text\":\"1027\"},{\"text\":\"1028\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"白色\"},{\"text\":\"黑色\"}]', '[{\"title\":\"规格名称\"},{\"text\":\"耳机颜色\"},{\"text\":\"名称\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"399\"},{\"text\":\"369\"}]', '[{\"title\":\"规格\"},{\"text\":\"头戴式无线蓝牙耳机\"},{\"text\":\"头戴式无线蓝牙耳机\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"120\"},{\"text\":\"121\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/99/5f/11ea60b0300a8e5e4ef6e8f3ce87a596.jpg\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/5c/cf/f506b3914436b20f29d1b194cd50a42b.jpg\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/54/3b/3e848e8d39415418138193b97eef133b.jpg\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (21, 21, '[{\"text\":\"1029\"}]', '[{\"title\":\"品牌\"},{\"text\":\"规格\"}]', '[{\"title\":\"商品名称\"},{\"text\":\"名称\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"79.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"K10极地白\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"264\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/46/18/903431df7c90a93f264d2ae43cbfe4b3.png\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (22, 22, '[{\"text\":\"1030\"}]', '[{\"title\":\"名称\"},{\"text\":\"安卓手机通用\"},{\"text\":\"BCHYCH001\"}]', '[{\"title\":\"名称\"},{\"text\":\"规格\"},{\"text\":\"图案\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"69.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"图案\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"464\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/e9/39/7f09817d967a986a766f279fbad86459.jpg\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (23, 24, '[{\"text\":\"1031\"}]', '[{\"title\":\"名称\"},{\"text\":\"小电视彩色玻璃风卫衣\"},{\"text\":\"尺码\"}]', '[{\"title\":\"名称\"},{\"text\":\"规格\"},{\"text\":\"尺码\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"233.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"M码\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"464\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/dd/9c/dd9c75863c0bc623cb51390ada115aab.png\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (24, 25, '[{\"text\":\"1032\"}]', '[{\"title\":\"名称\"},{\"text\":\"毛绒外套\"},{\"text\":\"尺码\"}]', '[{\"title\":\"名称\"},{\"text\":\"规格\"},{\"text\":\"尺码\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"289.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"XL码\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"164\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/c8/f3/98bf48a6fe51fbc3c536d2731d69e8cf.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/28/b0/fbbae5ca6979ab14147ddc5386a09117.jpg\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (25, 26, '[{\"text\":\"1033\"}]', '[{\"title\":\"名称\"},{\"text\":\"毛绒外套\"},{\"text\":\"尺码\"}]', '[{\"title\":\"名称\"},{\"text\":\"规格\"},{\"text\":\"尺码\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"238.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"XL码\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"224\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/bc/0c/bc0c3833d2cf7f21f43c63d3e718a4bb.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/00/00/00004f208b09da7193ebe5c8a0eeb179.png\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (26, 27, '[{\"text\":\"1034\"}]', '[{\"title\":\"名称\"},{\"text\":\"毛绒外套\"},{\"text\":\"尺码\"}]', '[{\"title\":\"名称\"},{\"text\":\"规格\"},{\"text\":\"尺码\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"69.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"XL码\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"624\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/a2/bf/a2d9c183dd851875a9a0ef04daccb6bc.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/ef/a0/688b77bcc4734f0f7d9893a1026faac0.jpg\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (27, 28, '[{\"text\":\"1035\"}]', '[{\"title\":\"名称\"},{\"text\":\"开衫卫衣\"},{\"text\":\"尺码\"}]', '[{\"title\":\"名称\"},{\"text\":\"规格\"},{\"text\":\"尺码\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"380.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"XL码\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"424\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/8b/a6/8ba630a726c34df76ce9d8f840986ecd.png\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (28, 29, '[{\"text\":\"1036\"}]', '[{\"title\":\"名称\"},{\"text\":\"镭射羽绒服\"},{\"text\":\"尺码\"}]', '[{\"title\":\"名称\"},{\"text\":\"规格\"},{\"text\":\"尺码\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"380.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"XL码\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"424\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/0b/de/085243827de2989ecde2a7b43803a9c8.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/35/ad/6c5e62325cb2e2af6fcf960ae6102407.jpg\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (29, 30, '[{\"text\":\"1037\"}]', '[{\"title\":\"名称\"},{\"text\":\"毛绒外套\"},{\"text\":\"尺码\"}]', '[{\"title\":\"名称\"},{\"text\":\"规格\"},{\"text\":\"尺码\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"329.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"XL码\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"74\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/61/2a/e0520a5213cdeaa65de058989ce634a2.png\"},{\"text\":\"//i0.hdslb.com/bfs/mall/mall/41/bc/dbd44fb53776c97393e56f08c0f1b2a0.jpg\"}]');
INSERT INTO `xiaofan_goods_sku` VALUES (30, 31, '[{\"text\":\"1038\"}]', '[{\"title\":\"名称\"},{\"text\":\"披风毯\"},{\"text\":\"尺码\"}]', '[{\"title\":\"名称\"},{\"text\":\"规格\"},{\"text\":\"尺码\"}]', '[{\"title\":\"商品价格\"},{\"text\":\"129.00\"}]', '[{\"title\":\"规格\"},{\"text\":\"长约150cm宽约75cm\"}]', '件', '[{\"title\":\"库存\"},{\"text\":\"1274\"}]', '[{\"title\":\"商品图片\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/cc/c7/ccc7602068e24cdfc879f287eb4e35b1.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/9c/f9/9cf9c51a795ed47d01ef77ceddcd36ec.jpg\"}]');

-- ----------------------------
-- Table structure for xiaofan_gzh_user
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_gzh_user`;
CREATE TABLE `xiaofan_gzh_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户唯一表示',
  `FromUserName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信公众号注册的用户名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_gzh_user
-- ----------------------------
INSERT INTO `xiaofan_gzh_user` VALUES (1, '20244809', 'oJfs16YF86khgPg8WcLHOkMXA1tY', '2024-01-01 17:45:10');
INSERT INTO `xiaofan_gzh_user` VALUES (2, '2024491302', 'oJfs16bJuUtoqA7E_F32jmm7CMh8', '2024-01-01 19:48:18');
INSERT INTO `xiaofan_gzh_user` VALUES (3, '2024234273', 'oJfs16R2u2UaEsd3FsJP7nXm4Eus', '2024-01-01 23:06:19');
INSERT INTO `xiaofan_gzh_user` VALUES (4, '2202321234', NULL, NULL);
INSERT INTO `xiaofan_gzh_user` VALUES (15, '2024217393', 'oJfs16bM_Wrd8dUp-m9AAuOtJnjA', '2024-01-09 13:10:36');

-- ----------------------------
-- Table structure for xiaofan_order
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_order`;
CREATE TABLE `xiaofan_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL COMMENT '用户id',
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `address_id` int NULL DEFAULT NULL COMMENT '用户地址',
  `goodsId` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品id',
  `goods_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `skuId` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规格id',
  `sku_name` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `count` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数量',
  `price` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '单价',
  `allPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品总价',
  `postFee` decimal(10, 2) NULL DEFAULT NULL COMMENT '邮费',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '暂无' COMMENT '订单说明',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建预支付订单时间',
  `over_time` datetime NULL DEFAULT NULL COMMENT '预支付订结束单时间',
  `payStatus` int NULL DEFAULT 1 COMMENT '订单状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_order
-- ----------------------------
INSERT INTO `xiaofan_order` VALUES (1, 2023903840, '2024011820221980439', 21, '[{\"text\":\"6\"}]', '[{\"text\":\"碧蓝航线AzurLane学院制服滴胶亚克力\"}]', '[{\"text\":\"//i0.hdslb.com/bfs/mall/mall/11/e8/11e8a5bf1d1289827e0e649330d386e7.png@1000w.webp\"}]', '[{\"text\":\"1010\"}]', '[{\"text\":\"百眼巨人3×5cm\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"4.5\"}]', 4.50, 5.00, NULL, '2024-01-22 22:53:31', '2024-01-22 23:23:31', 1);
INSERT INTO `xiaofan_order` VALUES (2, 2023903840, '20240118205524271969', 21, '[{\"text\":\"10\"}]', '[{\"text\":\"品胜 VOCALOID 初音未来 PD30W快速充 电器 手机充电器 苹果手机快速充电头 Type-C接口\"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/33/7b/337ba9061dbb4c828c44647ebf2d3d02.png@800w_800h.webp\"}]', '[{\"text\":\"1016\"}]', '[{\"text\":\"初音未来VOCALOID联名氮化镓充电器笔记本苹果华为手机充电器一拖四充电头125w\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"179\"}]', 179.00, 5.00, NULL, '2024-01-22 22:54:13', '2024-01-22 23:24:13', 2);
INSERT INTO `xiaofan_order` VALUES (3, 2023903840, '20240118212610850064', 21, '[{\"text\":\"6\"}]', '[{\"text\":\"碧蓝航线AzurLane学院制服滴胶亚克力\"}]', '[{\"text\":\"//i0.hdslb.com/bfs/mall/mall/11/e8/11e8a5bf1d1289827e0e649330d386e7.png@1000w.webp\"}]', '[{\"text\":\"1010\"}]', '[{\"text\":\"百眼巨人3×5cm\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"4.5\"}]', 4.50, 5.00, NULL, '2024-01-22 22:54:25', '2024-01-22 23:24:25', 1);
INSERT INTO `xiaofan_order` VALUES (4, 2023903840, '20240122113714592792', 21, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品勿拍\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试商品勿拍\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, NULL, '2024-01-22 22:54:28', '2024-01-22 23:24:28', 2);
INSERT INTO `xiaofan_order` VALUES (5, 2023903840, '20240122114140227156', 21, '[{\"text\":\"10\"}]', '[{\"text\":\"初音未来VOCALOID联名氮化镓充电器笔记本苹果华为手机充电器一拖四充电头\"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/33/7b/337ba9061dbb4c828c44647ebf2d3d02.png@800w_800h.webp\"}]', '[{\"text\":\"1016\"}]', '[{\"text\":\"125w\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"179\"}]', 179.00, 5.00, NULL, '2024-01-22 22:54:52', '2024-01-22 23:24:52', 1);
INSERT INTO `xiaofan_order` VALUES (6, 2023903840, '20240122114241114911', 21, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品勿拍\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, NULL, '2024-01-22 11:42:41', '2024-01-22 12:12:41', 6);
INSERT INTO `xiaofan_order` VALUES (7, 2023903840, '20240122120117148894', 21, '[{\"text\":\"10\"}]', '[{\"text\":\"初音未来VOCALOID联名氮化镓充电器笔记本苹果华为手机充电器一拖四充电头\"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/33/7b/337ba9061dbb4c828c44647ebf2d3d02.png@800w_800h.webp\"}]', '[{\"text\":\"1016\"}]', '[{\"text\":\"125w\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"179\"}]', 179.00, 5.00, NULL, '2024-01-22 12:01:17', '2024-01-22 12:31:17', 2);
INSERT INTO `xiaofan_order` VALUES (8, 2023903840, '20240122120436539338', 21, '[{\"text\":\"10\"}]', '[{\"text\":\"品胜 VOCALOID 初音未来 PD30W快速充 电器 手机充电器 苹果手机快速充电头 Type-C接口\"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/33/7b/337ba9061dbb4c828c44647ebf2d3d02.png@800w_800h.webp\"}]', '[{\"text\":\"1016\"}]', '[{\"text\":\"初音未来VOCALOID联名氮化镓充电器笔记本苹果华为手机充电器一拖四充电头125w\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"179\"}]', 179.00, 5.00, '不想要了', '2024-01-22 12:47:05', '2024-01-22 13:17:05', 2);
INSERT INTO `xiaofan_order` VALUES (9, 2023903840, '20240122205812952190', 21, '[{\"text\":\"6\"},{\"text\":\"7\"}]', '[{\"text\":\"碧蓝航线AzurLane学院制服滴胶亚克力\"},{\"text\":\"水墨画小羊皮手机壳适用苹果iphone华为荣耀VIVO小米OPPO手机保护壳套\"}]', '[{\"text\":\"//i0.hdslb.com/bfs/mall/mall/11/e8/11e8a5bf1d1289827e0e649330d386e7.png@1000w.webp\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/66/62/010a4bb15fcb2da917b13c6bdb56474f.jpg@800w_800h.webp\"}]', '[{\"text\":\"1010\"},{\"text\":\"1012\"}]', '[{\"text\":\"百眼巨人3×5cm\"},{\"text\":\"安卓没钳了我\"}]', '[{\"text\":\"1\"},{\"text\":\"1\"}]', '[{\"text\":\"4.5\"},{\"text\":\"16.5\"}]', 16.50, 5.00, '', '2024-01-22 20:58:12', '2024-01-22 21:28:12', 2);
INSERT INTO `xiaofan_order` VALUES (10, 2023903840, '20240122213230702645', 21, '[{\"text\":\"10\"},{\"text\":\"6\"}]', '[{\"text\":\"品胜 VOCALOID 初音未来 PD30W快速充 电器 手机充电器 苹果手机快速充电头 Type-C接口\"},{\"text\":\"碧蓝航线AzurLane学院制服滴胶亚克力\"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/33/7b/337ba9061dbb4c828c44647ebf2d3d02.png@800w_800h.webp\"},{\"text\":\"//i0.hdslb.com/bfs/mall/mall/11/e8/11e8a5bf1d1289827e0e649330d386e7.png@1000w.webp\"}]', '[{\"text\":\"1016\"},{\"text\":\"1010\"}]', '[{\"text\":\"初音未来VOCALOID联名氮化镓充电器笔记本苹果华为手机充电器一拖四充电头125w\"},{\"text\":\"百眼巨人3×5cm\"}]', '[{\"text\":\"1\"},{\"text\":\"1\"}]', '[{\"text\":\"179\"},{\"text\":\"4.5\"}]', 183.50, 5.00, '', '2024-01-22 21:32:30', '2024-01-22 22:02:30', 2);
INSERT INTO `xiaofan_order` VALUES (11, 2023903840, '20240122225304983288', 21, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品勿拍\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, '', '2024-01-22 22:53:04', '2024-01-22 23:23:04', 2);
INSERT INTO `xiaofan_order` VALUES (12, 2023903840, '20240123115956204672', 21, '[{\"text\":\"11\"}]', '[{\"text\":\"中文在线 罗小黑战记 罗小黑-伴你同行列硅胶手机保护壳-勾勾手\"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/71/8a/718a142784c41dd4f90290a6b7e7d8b8.png\"}]', '[{\"text\":\"1018\"}]', '[{\"text\":\"iphone14pro罗小黑-伴你同行系列硅胶手机壳-勾勾手\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"79\"}]', 79.00, 5.00, '不想要了', '2024-01-23 11:59:56', '2024-01-23 12:29:56', 2);
INSERT INTO `xiaofan_order` VALUES (13, 2024672709, '20240318105517184475', 21, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品勿拍\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, '其它', '2024-03-18 10:55:17', '2024-03-18 11:25:17', 2);
INSERT INTO `xiaofan_order` VALUES (14, 2023903840, '20240123131916461344', 21, '[{\"text\":\"21\"},{\"text\":\"22\"},{\"text\":\"24\"},{\"text\":\"25\"},{\"text\":\"26\"}]', '[{\"text\":\"手机散热器直播温控数显风冷半导体制 冷磁吸平板降温手机背夹\"},{\"text\":\"动漫卡通二次元手机壳适用苹果华为荣 耀小米OPPO彩绘防尘全包菲林壳\"},{\"text\":\"哔哩哔哩 小电视彩色玻璃风卫衣 周边\"},{\"text\":\"天羽川 初音未来 音域少女 毛绒外套 \"},{\"text\":\"moeyu 名侦探柯南M26黑铁的鱼影卫衣灰\"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/46/18/903431df7c90a93f264d2ae43cbfe4b3.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/e9/39/7f09817d967a986a766f279fbad86459.jpg\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/dd/9c/dd9c75863c0bc623cb51390ada115aab.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/c8/f3/98bf48a6fe51fbc3c536d2731d69e8cf.png\"},{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/bc/0c/bc0c3833d2cf7f21f43c63d3e718a4bb.png\"}]', '[{\"text\":\"1029\"},{\"text\":\"1030\"},{\"text\":\"1031\"},{\"text\":\"1032\"},{\"text\":\"1033\"}]', '[{\"text\":\"规格K10极地白\"},{\"text\":\"安卓手机通用图案\"},{\"text\":\"小电视彩色玻璃风卫衣M码\"},{\"text\":\"毛绒外套XL码\"},{\"text\":\"毛绒外套XL码\"}]', '[{\"text\":\"1\"},{\"text\":\"1\"},{\"text\":\"1\"},{\"text\":\"1\"},{\"text\":\"1\"}]', '[{\"text\":\"79\"},{\"text\":\"69\"},{\"text\":\"233\"},{\"text\":\"289\"},{\"text\":\"238\"}]', 908.00, 5.00, '', '2024-01-23 13:19:16', '2024-01-23 13:49:16', 2);
INSERT INTO `xiaofan_order` VALUES (15, 2023903840, '20240127144641334146', 21, '[{\"text\":\"11\"}]', '[{\"text\":\"中文在线 罗小黑战记 罗小黑-伴你同行列硅胶手机保护壳-勾勾手\"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/71/8a/718a142784c41dd4f90290a6b7e7d8b8.png\"}]', '[{\"text\":\"1018\"}]', '[{\"text\":\"iphone14pro罗小黑-伴你同行系列硅胶手机壳-勾勾手\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"79\"}]', 79.00, 5.00, '商品无货', '2024-01-27 14:46:50', '2024-01-27 15:16:50', 6);
INSERT INTO `xiaofan_order` VALUES (16, 2023903840, '20240127192102529', 21, '[{\"text\":\"25\"}]', '[{\"text\":\"毛绒外套\"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/c8/f3/98bf48a6fe51fbc3c536d2731d69e8cf.png\"}]', '[{\"text\":\"1032\"}]', '[{\"text\":\"XL码\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"289.00\"}]', 289.00, 5.00, '商品降价', '2024-02-02 19:20:49', '2024-02-02 19:50:49', 2);
INSERT INTO `xiaofan_order` VALUES (17, 2023903840, '20240209220745898519', 21, '[{\"text\":\"11\"}]', '[{\"text\":\"中文在线 罗小黑战记 罗小黑-伴你同行列硅胶手机保护壳-勾勾手\"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/71/8a/718a142784c41dd4f90290a6b7e7d8b8.png\"}]', '[{\"text\":\"1018\"}]', '[{\"text\":\"iphone14pro罗小黑-伴你同行系列硅胶手机壳-勾勾手\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"79\"}]', 79.00, 5.00, '商品无货', '2024-02-09 22:07:51', '2024-02-09 22:37:51', 6);
INSERT INTO `xiaofan_order` VALUES (18, 2023903840, '20240306204135399704', 21, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品勿拍\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, '', '2024-03-06 20:41:35', '2024-03-06 21:11:35', 5);
INSERT INTO `xiaofan_order` VALUES (19, 2024672709, '20240328005833368288', 21, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试商品勿拍测试\"}]', '[{\"text\":\"4\"}]', '[{\"text\":\"0.01\"}]', 0.04, 5.00, '商品信息填错了', '2024-03-28 00:58:33', '2024-03-28 01:28:33', 1);
INSERT INTO `xiaofan_order` VALUES (20, 202422990, '20240317214825637607', 21, '[{\"text\":\"14\"}]', '[{\"text\":\"品胜 初音未来VOCALOID联名120W氮化镓电器笔记本苹果华为手机充电器一拖四充电头\"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/33/7b/337ba9061dbb4c828c44647ebf2d3d02.png\"}]', '[{\"text\":\"1021\"}]', '[{\"text\":\"品胜初音未来VOCALOID联名120W氮化镓充电器笔记本苹果华为手机充电器一拖四充电头\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"269\"}]', 269.00, 5.00, '暂无', '2024-03-17 21:48:25', '2024-03-17 22:18:25', 6);
INSERT INTO `xiaofan_order` VALUES (21, 2023903840, '20240318101551136759', 21, '[{\"text\":\"25\"}]', '[{\"text\":\"天羽川 初音未来 音域少女 毛绒外套 \"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/mall/c8/f3/98bf48a6fe51fbc3c536d2731d69e8cf.png\"}]', '[{\"text\":\"1032\"}]', '[{\"text\":\"毛绒外套XL码\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"289\"}]', 289.00, 5.00, '商品降价', '2024-03-18 10:15:51', '2024-03-18 10:45:51', 6);
INSERT INTO `xiaofan_order` VALUES (22, 2024672709, '20240318110118891994', 21, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品勿拍\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, '商品信息填错了', '2024-03-18 11:01:18', '2024-03-18 11:31:18', 2);
INSERT INTO `xiaofan_order` VALUES (23, 2023903840, '2024032516380361505', 21, '[{\"text\":\"26\"}]', '[{\"text\":\"moeyu 名侦探柯南M26黑铁的鱼影卫衣灰\"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/bc/0c/bc0c3833d2cf7f21f43c63d3e718a4bb.png\"}]', '[{\"text\":\"1033\"}]', '[{\"text\":\"毛绒外套XL码\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"238\"}]', 238.00, 5.00, '暂无', '2024-03-25 16:38:03', '2024-03-25 17:08:03', 6);
INSERT INTO `xiaofan_order` VALUES (24, 2023903840, '20240515090215408599', NULL, '[{\"text\":\"11\"}]', '[{\"text\":\"中文在线 罗小黑战记 罗小黑-伴你同行列硅胶手机保护壳-勾勾手\"}]', '[{\"text\":\"https://i0.hdslb.com/bfs/mall/vendor/71/8a/718a142784c41dd4f90290a6b7e7d8b8.png\"}]', '[{\"text\":\"1018\"}]', '[{\"text\":\"iphone14pro罗小黑-伴你同行系列硅胶手机壳-勾勾手\"}]', '[{\"text\":\"4\"}]', '[{\"text\":\"79\"}]', 316.00, 5.00, '暂无', '2024-05-15 09:02:15', '2024-05-15 09:32:15', 1);
INSERT INTO `xiaofan_order` VALUES (25, 2023903840, '2024051511082951628', NULL, '[{\"text\":\"2\"}]', '[{\"text\":\"Apple/苹果 iPhone 15 Pro Max 官方正品旗舰店5G手机直降新款14Pro 国行max官网\"}]', '[{\"text\":\"https://pacomoby.ba/wp-content/uploads/2022/11/czcs_iphone14promax_q422_deep-purple_pdp-images_position-1a_t_4_4-2-1.jpg\"}]', '[{\"text\":\"1001\"}]', '[{\"text\":\"暗夜紫128GB\"}]', '[{\"text\":\"3\"}]', '[{\"text\":\"7699\"}]', 23097.00, 5.00, '暂无', '2024-05-15 11:08:29', '2024-05-15 11:38:29', 1);
INSERT INTO `xiaofan_order` VALUES (26, 2023903840, '20240515111931471897', NULL, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试商品勿拍测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, '暂无', '2024-05-15 11:19:31', '2024-05-15 11:49:31', 1);
INSERT INTO `xiaofan_order` VALUES (27, 2023903840, '20240515114911283024', NULL, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试商品勿拍测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, '暂无', '2024-05-15 11:49:11', '2024-05-15 12:19:11', 6);
INSERT INTO `xiaofan_order` VALUES (28, 2023903840, '2024051514020073273', NULL, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试商品勿拍测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, '暂无', '2024-05-15 14:02:00', '2024-05-15 14:32:00', 1);
INSERT INTO `xiaofan_order` VALUES (29, 2023903840, '20240515140356185943', NULL, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试商品勿拍测试\"}]', '[{\"text\":\"2\"}]', '[{\"text\":\"0.01\"}]', 0.02, 5.00, '暂无', '2024-05-15 14:03:56', '2024-05-15 14:33:56', 1);
INSERT INTO `xiaofan_order` VALUES (30, 2023903840, '20240515141752359589', NULL, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试商品勿拍测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, '暂无', '2024-05-15 14:17:52', '2024-05-15 14:47:52', 1);
INSERT INTO `xiaofan_order` VALUES (31, 2023903840, '20240515142440512756', NULL, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试商品勿拍测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, '暂无', '2024-05-15 14:24:40', '2024-05-15 14:54:40', 1);
INSERT INTO `xiaofan_order` VALUES (32, 2023903840, '20240515142555589775', NULL, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试商品勿拍测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, '暂无', '2024-05-15 14:25:55', '2024-05-15 14:55:55', 1);
INSERT INTO `xiaofan_order` VALUES (33, 2023903840, '20240515143226491698', NULL, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试商品勿拍测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, '暂无', '2024-05-15 14:32:26', '2024-05-15 15:02:26', 1);
INSERT INTO `xiaofan_order` VALUES (34, 2023903840, '2024051514334894230', NULL, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试商品勿拍测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, '商品信息填错了', '2024-05-15 14:33:48', '2024-05-15 15:03:48', 6);
INSERT INTO `xiaofan_order` VALUES (35, 2023903840, '20240515153117855912', NULL, '[{\"text\":\"59\"}]', '[{\"text\":\"测试商品\"}]', '[{\"text\":\"https://www.z4a.net/images/2024/01/19/test-good.jpg\"}]', '[{\"text\":\"1017\"}]', '[{\"text\":\"测试商品勿拍测试\"}]', '[{\"text\":\"1\"}]', '[{\"text\":\"0.01\"}]', 0.01, 5.00, '暂无', '2024-05-15 15:31:17', '2024-05-15 16:01:17', 1);

-- ----------------------------
-- Table structure for xiaofan_user
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_user`;
CREATE TABLE `xiaofan_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL COMMENT '用户唯一标识',
  `xiaofan_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `xiaofan_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `uSign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密密钥',
  `identity` int NULL DEFAULT 0 COMMENT '用户身份',
  `enrollTime` datetime NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小帆购物网用户列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_user
-- ----------------------------
INSERT INTO `xiaofan_user` VALUES (1, 2023903840, 'xiaofan', 'f068468a94a1ded8be23e293d5cb53e61c3b29e83aa8a6df74365186de346103', 't8mGuc1nvc', 1, '2023-12-25 12:42:57');
INSERT INTO `xiaofan_user` VALUES (2, 2023570165, '13974512963', 'aba9b1abf983561761a96099850f17419b25f9710216a16417cad6224316791e', 'Wt5HbF7Jr6', 0, '2023-12-25 18:23:07');
INSERT INTO `xiaofan_user` VALUES (15, 2024672709, '2217898929@qq.com', 'ab0f638f6d5195ed6b5d5d3261349dc5c4d0199d113ef8f23c2bd3de23e768be', 'lbhWJoazrF', 0, '2024-01-06 16:06:32');
INSERT INTO `xiaofan_user` VALUES (17, 2024166808, '3257828078@qq.com', '48d141016e5f10d81a192ad95641b36e2448007e90269b0ebd6b3374311bdcf9', 'jBWTuFkeYY', 0, '2024-01-06 22:52:21');
INSERT INTO `xiaofan_user` VALUES (18, 2024730932, '3381886703@qq.com', '954959553cf51283ce673e6204e61e3eaf161b321803fe0d03696420b25e60e8', 'xDyxzQl7Eo', 0, '2024-01-13 20:28:54');
INSERT INTO `xiaofan_user` VALUES (19, 202422990, '3501165736@qq.com', 'a150a168afcb313722ef6743b92a13a895c596a4decc8a7aaec0c2aee0089398', 'XhVyPwMkro', 0, '2024-03-17 21:46:22');
INSERT INTO `xiaofan_user` VALUES (20, 2023903841, '123456', 'f068468a94a1ded8be23e293d5cb53e61c3b29e83aa8a6df74365186de346103', 't8mGuc1nvc', 1, '2024-05-16 08:50:12');

-- ----------------------------
-- Table structure for xiaofan_user_address
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_user_address`;
CREATE TABLE `xiaofan_user_address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区/县',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `isDefault` int NULL DEFAULT 0 COMMENT '默认地址，1为是，0为否 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小帆购物网用户地址信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_user_address
-- ----------------------------
INSERT INTO `xiaofan_user_address` VALUES (22, 2024672709, '小帆鸭', '13974512631', '湖南省', '永州市', '冷水滩', '永州职业技术学院', 1);
INSERT INTO `xiaofan_user_address` VALUES (23, 202422990, 'cmr', '110', 'klj', '', '', 'lj', 1);
INSERT INTO `xiaofan_user_address` VALUES (25, 2023903840, '李帆', '13974512963', '湖南省', '怀化市', '成为', '3213', 1);
INSERT INTO `xiaofan_user_address` VALUES (26, 2023903840, '小帆', '15171411414', '湖南省', '撒打算', '231', '21321', 0);

-- ----------------------------
-- Table structure for xiaofan_user_browse
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_user_browse`;
CREATE TABLE `xiaofan_user_browse`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '浏览id',
  `uid` int NULL DEFAULT NULL,
  `browse_goods_id` int NULL DEFAULT NULL COMMENT '浏览的商品id',
  `browse_time` datetime NULL DEFAULT NULL COMMENT '用户浏览记录的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 757 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小帆购物网用户浏览商品历史记录列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_user_browse
-- ----------------------------
INSERT INTO `xiaofan_user_browse` VALUES (170, 2023903840, 21, '2024-01-23 12:57:53');
INSERT INTO `xiaofan_user_browse` VALUES (204, 2024672709, 14, '2024-01-23 13:16:25');
INSERT INTO `xiaofan_user_browse` VALUES (213, 2023903840, 28, '2024-01-23 13:25:59');
INSERT INTO `xiaofan_user_browse` VALUES (225, 2023903840, 29, '2024-01-23 13:30:35');
INSERT INTO `xiaofan_user_browse` VALUES (249, 2023903840, 12, '2024-01-27 13:15:28');
INSERT INTO `xiaofan_user_browse` VALUES (255, 2023903840, 27, '2024-01-27 13:28:41');
INSERT INTO `xiaofan_user_browse` VALUES (256, 2023903840, 30, '2024-01-27 13:30:59');
INSERT INTO `xiaofan_user_browse` VALUES (293, 2023903840, 22, '2024-01-28 12:07:07');
INSERT INTO `xiaofan_user_browse` VALUES (299, 2023903840, 19, '2024-01-28 12:07:21');
INSERT INTO `xiaofan_user_browse` VALUES (371, 2023903840, 15, '2024-02-02 19:22:35');
INSERT INTO `xiaofan_user_browse` VALUES (405, 2023903840, 8, '2024-02-09 23:26:55');
INSERT INTO `xiaofan_user_browse` VALUES (455, 2023903840, 13, '2024-02-20 19:24:03');
INSERT INTO `xiaofan_user_browse` VALUES (457, 2023903840, 6, '2024-02-20 19:27:18');
INSERT INTO `xiaofan_user_browse` VALUES (484, 2023903840, 20, '2024-02-20 20:07:16');
INSERT INTO `xiaofan_user_browse` VALUES (517, 2023903840, 7, '2024-02-20 20:42:07');
INSERT INTO `xiaofan_user_browse` VALUES (528, 2023903840, 5, '2024-02-21 11:26:03');
INSERT INTO `xiaofan_user_browse` VALUES (569, 2024672709, 11, '2024-03-10 12:48:49');
INSERT INTO `xiaofan_user_browse` VALUES (575, 2024672709, 2, '2024-03-13 15:57:00');
INSERT INTO `xiaofan_user_browse` VALUES (576, 202422990, 14, '2024-03-17 21:46:57');
INSERT INTO `xiaofan_user_browse` VALUES (577, 2023903840, 31, '2024-03-18 09:57:32');
INSERT INTO `xiaofan_user_browse` VALUES (583, 2023903840, 10, '2024-03-18 10:00:55');
INSERT INTO `xiaofan_user_browse` VALUES (584, 2023903840, 18, '2024-03-18 10:00:57');
INSERT INTO `xiaofan_user_browse` VALUES (593, 2023903840, 25, '2024-03-18 10:15:36');
INSERT INTO `xiaofan_user_browse` VALUES (596, 2024672709, 59, '2024-03-18 10:29:39');
INSERT INTO `xiaofan_user_browse` VALUES (614, 2023903840, 17, '2024-03-27 08:07:32');
INSERT INTO `xiaofan_user_browse` VALUES (626, 2024672709, 72, '2024-03-28 00:38:52');
INSERT INTO `xiaofan_user_browse` VALUES (628, 2024672709, 66, '2024-03-28 00:42:52');
INSERT INTO `xiaofan_user_browse` VALUES (630, 2023903840, 46, '2024-05-13 07:35:55');
INSERT INTO `xiaofan_user_browse` VALUES (640, 2023903840, 14, '2024-05-13 10:43:22');
INSERT INTO `xiaofan_user_browse` VALUES (676, 2023903840, 3, '2024-05-13 13:36:35');
INSERT INTO `xiaofan_user_browse` VALUES (753, 2023903840, 1, '2024-05-13 14:11:41');
INSERT INTO `xiaofan_user_browse` VALUES (756, 2023903840, 4, '2024-05-15 10:17:12');
INSERT INTO `xiaofan_user_browse` VALUES (778, 2023903840, 66, '2024-05-15 14:26:59');
INSERT INTO `xiaofan_user_browse` VALUES (837, 2023903840, 9, '2024-05-15 15:17:00');
INSERT INTO `xiaofan_user_browse` VALUES (841, 2023903840, 26, '2024-05-15 15:29:51');
INSERT INTO `xiaofan_user_browse` VALUES (843, 2023903840, 24, '2024-05-15 15:30:31');
INSERT INTO `xiaofan_user_browse` VALUES (844, 2023903840, 64, '2024-05-15 15:30:38');
INSERT INTO `xiaofan_user_browse` VALUES (845, 2023903840, 72, '2024-05-15 15:30:48');
INSERT INTO `xiaofan_user_browse` VALUES (846, 2023903840, 73, '2024-05-15 15:30:52');
INSERT INTO `xiaofan_user_browse` VALUES (848, 2023903840, 59, '2024-05-15 15:31:05');
INSERT INTO `xiaofan_user_browse` VALUES (849, 2023903840, 74, '2024-05-15 20:39:50');
INSERT INTO `xiaofan_user_browse` VALUES (850, 2023903840, 11, '2024-05-15 20:39:53');
INSERT INTO `xiaofan_user_browse` VALUES (853, 2023903840, 76, '2024-05-16 09:04:14');
INSERT INTO `xiaofan_user_browse` VALUES (854, 2023903840, 2, '2024-05-16 09:06:19');

-- ----------------------------
-- Table structure for xiaofan_user_cart
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_user_cart`;
CREATE TABLE `xiaofan_user_cart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL COMMENT '用户Id',
  `goodsId` int NULL DEFAULT NULL COMMENT '商品Id',
  `skuId` int NULL DEFAULT NULL COMMENT '商品规格id',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `sku_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格名称',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `count` int NULL DEFAULT NULL COMMENT '数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '加入时价格',
  `selected` int NULL DEFAULT NULL COMMENT '是否选中',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小帆购物网用户购物车列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_user_cart
-- ----------------------------
INSERT INTO `xiaofan_user_cart` VALUES (65, 2023903840, 11, 1018, '中文在线 罗小黑战记 罗小黑-伴你同行列硅胶手机保护壳-勾勾手', 'iphone14pro罗小黑-伴你同行系列硅胶手机壳-勾勾手', 'https://i0.hdslb.com/bfs/mall/vendor/71/8a/718a142784c41dd4f90290a6b7e7d8b8.png', 1, 79.00, 0, '2024-05-15 20:39:55');

-- ----------------------------
-- Table structure for xiaofan_user_collection
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_user_collection`;
CREATE TABLE `xiaofan_user_collection`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `collection_goodsId` int NULL DEFAULT NULL,
  `collection_status` int NULL DEFAULT NULL COMMENT '收藏状态,0未收藏,1已收藏',
  `collection_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小帆购物网用户收藏商品列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_user_collection
-- ----------------------------
INSERT INTO `xiaofan_user_collection` VALUES (1, 2023903840, 4, 0, '2024-02-03 18:50:07');
INSERT INTO `xiaofan_user_collection` VALUES (2, 2023903840, 11, 1, '2024-02-07 18:50:00');
INSERT INTO `xiaofan_user_collection` VALUES (3, 2023903840, 59, 0, '2024-02-02 18:49:58');
INSERT INTO `xiaofan_user_collection` VALUES (4, 2023903840, 25, 0, '2024-02-01 18:50:02');
INSERT INTO `xiaofan_user_collection` VALUES (5, 2023903840, 14, 0, '2024-02-07 18:49:55');
INSERT INTO `xiaofan_user_collection` VALUES (6, 2023903840, 15, 0, '2024-02-06 18:49:47');
INSERT INTO `xiaofan_user_collection` VALUES (7, 2023903840, 18, 1, '2024-02-03 01:49:50');
INSERT INTO `xiaofan_user_collection` VALUES (8, 2023903840, 10, 1, '2024-02-03 18:49:42');
INSERT INTO `xiaofan_user_collection` VALUES (9, 2023903840, 2, 1, '2024-02-08 13:33:24');
INSERT INTO `xiaofan_user_collection` VALUES (10, 2023903840, 6, 0, '2024-02-20 19:27:21');
INSERT INTO `xiaofan_user_collection` VALUES (11, 2023903840, 66, 0, '2024-02-29 13:40:40');
INSERT INTO `xiaofan_user_collection` VALUES (12, 2024672709, 2, 1, '2024-03-13 15:56:02');
INSERT INTO `xiaofan_user_collection` VALUES (13, 2024217393, 2, 1, '2024-03-23 14:02:58');
INSERT INTO `xiaofan_user_collection` VALUES (14, 2023903840, 3, 0, '2024-05-13 13:15:21');
INSERT INTO `xiaofan_user_collection` VALUES (15, 2023903840, 1, 0, '2024-05-13 14:10:19');

-- ----------------------------
-- Table structure for xiaofan_user_comments
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_user_comments`;
CREATE TABLE `xiaofan_user_comments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `topic_goodsId` int NULL DEFAULT NULL COMMENT '评论的商品id',
  `topic_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论类型,0为文本,1为图片',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `comments_time` datetime NULL DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小帆购物网用户评论' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_user_comments
-- ----------------------------
INSERT INTO `xiaofan_user_comments` VALUES (1, 2023903840, 2, '0', '测试评论', '2023-12-20 10:05:00');
INSERT INTO `xiaofan_user_comments` VALUES (2, 2024166808, 2, '0', '这个商品太好了', '2024-02-15 13:37:07');
INSERT INTO `xiaofan_user_comments` VALUES (3, 2024166808, 2, '0', '好评送上', '2024-02-10 17:18:50');
INSERT INTO `xiaofan_user_comments` VALUES (4, 2024166808, 2, '0', '一键三连', '2024-02-10 18:41:09');
INSERT INTO `xiaofan_user_comments` VALUES (5, 2023903840, 2, '0', '感觉不如华为', '2024-02-11 11:23:56');
INSERT INTO `xiaofan_user_comments` VALUES (7, 2023903840, 14, '0', '二刺螈蒸恶芯', '2024-02-18 21:53:13');
INSERT INTO `xiaofan_user_comments` VALUES (8, 2023903840, 2, '0', '感觉不如华为Mate 60 Pro', '2024-02-18 21:54:51');
INSERT INTO `xiaofan_user_comments` VALUES (9, 2023903840, 59, '0', '测试一下评论', '2024-03-27 20:39:11');
INSERT INTO `xiaofan_user_comments` VALUES (10, 2023903840, 59, '0', '1231', '2024-03-27 20:46:01');
INSERT INTO `xiaofan_user_comments` VALUES (11, 2023903840, 2, '0', '22132112312312', '2024-05-15 15:07:25');
INSERT INTO `xiaofan_user_comments` VALUES (12, 2023903840, 9, '0', 'cs acsa ', '2024-05-15 15:17:04');
INSERT INTO `xiaofan_user_comments` VALUES (13, 2023903840, 73, '0', 'asdfsadfasdfsdfasdf', '2024-05-15 15:29:17');

-- ----------------------------
-- Table structure for xiaofan_user_info
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_user_info`;
CREATE TABLE `xiaofan_user_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL COMMENT '用户唯一标识',
  `gender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未知' COMMENT '性别',
  `NickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `birthday` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生日',
  `fullLocation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省市区',
  `profession` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `telPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `user_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户登录凭证',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小帆购物网用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_user_info
-- ----------------------------
INSERT INTO `xiaofan_user_info` VALUES (1, 2023903840, '女', '波奇酱', '2004-03-06', '湖南省永州市冷水滩', '学生', '13974512963', 'http://xiaofanya.oss-cn-beijing.aliyuncs.com/391998-20201218143716_931a6.jpg', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjIwMjM5MDM4NDAsImlhdCI6MTcxNTgyMTQ0OCwiZXhwIjoxNzE1OTk0MjQ4fQ.S2aKmKXqK1R0oJHgghDQgDbF7g8pG3AV9kUNgUFrylE');
INSERT INTO `xiaofan_user_info` VALUES (12, 2024672709, '男', '鹤扰.(接毕设)', '未知', '未知', '未知', NULL, 'https://q1.qlogo.cn/g?b=qq&nk=2217898929&s=100', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjIwMjQ2NzI3MDksImlhdCI6MTcxNTc2MDM2OCwiZXhwIjoxNzE1OTMzMTY4fQ.e1bRt0jEB1xxEGenS5nOYSs-r7XADe9lNZA-6P1nCrY');
INSERT INTO `xiaofan_user_info` VALUES (14, 2024166808, '男', 'me', '未知', '未知', '未知', NULL, 'https://q1.qlogo.cn/g?b=qq&nk=3257828078&s=100', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjIwMjQxNjY4MDgsImlhdCI6MTcwNDU1Mjc0MiwiZXhwIjoxNzA0NzI1NTQyfQ.MjwttBYAajUuHFm38OM9kszCjbgUaO2FoubIDBbW6ds');
INSERT INTO `xiaofan_user_info` VALUES (19, 2024217393, '男', 'select * from earth where you', '未知', '未知', '未知', NULL, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBJNEXibd1CV2ZSTJauNa8a06jckK2nw4ziceKLl5QoUVuwndrib2N45Xp8Oib3AwvhAQ9Wo38spk6fxM6xibqC2lRdPqhkGI1P3Tdic6koCngicRnUQ4sFLKZnibQ6/0', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjIwMjQyMTczOTMsImlhdCI6MTcwNDc3NzA2MSwiZXhwIjoxNzA0OTQ5ODYxfQ.EQ0TkI-3OpP4vLZD-ORXRAoZyqpCRcTn0QxeL7BX_kk');
INSERT INTO `xiaofan_user_info` VALUES (20, 202422990, '未知', '旧剑', '未知', '未知', '未知', NULL, 'https://q1.qlogo.cn/g?b=qq&nk=3501165736&s=100', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjIwMjQyMjk5MCwiaWF0IjoxNzEwNjgzMTgyLCJleHAiOjE3MTA4NTU5ODJ9.50n_4moWDAFbC7YD5IqrcnbcTUpwNl2qAVtlCNEX_Xo');
INSERT INTO `xiaofan_user_info` VALUES (21, 2023903841, '未知', '管理员', '未知', '未知', '未知', NULL, 'https://tse4-mm.cn.bing.net/th/id/OIP-C.rsYKWDFV3eiEOQEz0t4RwwAAAA?rs=1&pid=ImgDetMain', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjIwMjM5MDM4NDEsImlhdCI6MTcxNTgyMDcyOSwiZXhwIjoxNzE1OTkzNTI5fQ.6wcCLaGFqYjCDdP_SWPesB_Vcov_fEe8RKpYfwGAdE0');

-- ----------------------------
-- Table structure for xiaofan_user_purse
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_user_purse`;
CREATE TABLE `xiaofan_user_purse`  (
  `id` int NOT NULL,
  `uid` int NULL DEFAULT NULL COMMENT '用户id',
  `balance` decimal(8, 2) NULL DEFAULT NULL COMMENT '用户钱包余额',
  `coupons` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户优惠券',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_user_purse
-- ----------------------------

-- ----------------------------
-- Table structure for xiaofan_user_reply
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_user_reply`;
CREATE TABLE `xiaofan_user_reply`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `reply_commentId` int NULL DEFAULT NULL,
  `reply_goodsId` int NULL DEFAULT NULL,
  `reply_uid` int NULL DEFAULT NULL,
  `reply_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_user_reply
-- ----------------------------
INSERT INTO `xiaofan_user_reply` VALUES (1, 2024672709, 1, 2, 2023903840, '波奇酱', '0', '测试回复', '2024-02-08 12:04:42');
INSERT INTO `xiaofan_user_reply` VALUES (2, 2023903840, 1, 2, 2023903840, '波奇酱', '0', '测试回复的回复', '2024-02-08 12:06:30');
INSERT INTO `xiaofan_user_reply` VALUES (3, 2024672709, 1, 2, 2023903840, '波奇酱', '0', '测试回复的回复的回复', '2024-02-08 12:29:51');
INSERT INTO `xiaofan_user_reply` VALUES (4, 2024672709, 2, 2, 2024166808, 'me', '0', '我也怎么觉得', '2024-02-08 13:38:32');
INSERT INTO `xiaofan_user_reply` VALUES (6, 2024672709, 3, 2, 2024166808, 'me', '0', '啊对对对', '2024-02-10 17:39:45');
INSERT INTO `xiaofan_user_reply` VALUES (7, 2024166808, 3, 2, 2024672709, '鹤扰.(接毕设)', '0', '?', '2024-02-10 17:40:24');
INSERT INTO `xiaofan_user_reply` VALUES (8, 2024672709, 3, 2, 2024166808, 'me', '0', '怎么了', '2024-02-10 17:51:00');
INSERT INTO `xiaofan_user_reply` VALUES (9, 2024166808, 3, 2, 2024672709, '鹤扰.(接毕设)', '0', '没怎么', '2024-02-10 17:51:28');
INSERT INTO `xiaofan_user_reply` VALUES (10, 2024166808, 3, 2, 2024166808, 'me', '0', '测试', '2024-02-10 19:18:59');
INSERT INTO `xiaofan_user_reply` VALUES (11, 2024166808, 4, 2, 2024166808, 'me', '0', '测试', '2024-02-10 19:19:13');
INSERT INTO `xiaofan_user_reply` VALUES (21, 2023903840, 1, 2, 2024672709, '鹤扰.(接毕设)', '0', '1312', '2024-02-17 21:35:08');
INSERT INTO `xiaofan_user_reply` VALUES (22, 2023903840, 3, 2, 2024166808, 'me', '0', '你好', '2024-02-17 21:53:46');
INSERT INTO `xiaofan_user_reply` VALUES (27, 2023903840, 3, 2, 2024672709, '鹤扰.(接毕设)', '0', '啊顶顶顶顶', '2024-02-17 21:57:13');
INSERT INTO `xiaofan_user_reply` VALUES (28, 2023903840, 2, 2, 2024672709, '鹤扰.(接毕设)', '0', '我也是啊', '2024-02-17 22:06:40');
INSERT INTO `xiaofan_user_reply` VALUES (29, 2023903840, 1, 2, 2024672709, '鹤扰.(接毕设)', '0', '测试回复的回复的回复的回复', '2024-02-17 22:11:19');
INSERT INTO `xiaofan_user_reply` VALUES (30, 2023903840, 3, 2, 2024166808, 'me', '0', '哇', '2024-02-18 21:54:32');
INSERT INTO `xiaofan_user_reply` VALUES (31, 2023903840, NULL, NULL, NULL, NULL, NULL, '123', '2024-02-18 21:54:58');
INSERT INTO `xiaofan_user_reply` VALUES (32, 2023903840, NULL, NULL, NULL, NULL, NULL, '12', '2024-02-18 21:55:04');
INSERT INTO `xiaofan_user_reply` VALUES (33, 2023903840, 2, 2, 2024672709, '鹤扰.(接毕设)', '0', '我来了', '2024-02-20 20:42:33');
INSERT INTO `xiaofan_user_reply` VALUES (34, 2023903840, 4, 2, 2024166808, 'me', '0', '仁坤', '2024-02-28 19:54:25');
INSERT INTO `xiaofan_user_reply` VALUES (35, 2023903840, 1, 2, 2024672709, '鹤扰.(接毕设)', '0', '仁坤', '2024-02-29 13:06:46');
INSERT INTO `xiaofan_user_reply` VALUES (36, 2024672709, NULL, NULL, NULL, NULL, NULL, '？', '2024-03-13 15:56:25');
INSERT INTO `xiaofan_user_reply` VALUES (37, 2024672709, NULL, NULL, NULL, NULL, NULL, '？', '2024-03-13 15:56:36');

-- ----------------------------
-- Table structure for xiaofan_user_returned
-- ----------------------------
DROP TABLE IF EXISTS `xiaofan_user_returned`;
CREATE TABLE `xiaofan_user_returned`  (
  `id` int NOT NULL,
  `uid` int NULL DEFAULT NULL,
  `returned_order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户退订的订单id',
  `returned_goods_id` int NULL DEFAULT NULL COMMENT '用户退订商品id',
  `returned_status` int NULL DEFAULT NULL COMMENT '用户退订商品状态',
  `returned_time` datetime NULL DEFAULT NULL COMMENT '用户退订商品的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小帆购物网用户退购订单列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiaofan_user_returned
-- ----------------------------

-- ----------------------------
-- Triggers structure for table xiaofan_goods
-- ----------------------------
DROP TRIGGER IF EXISTS `Delete_classifly`;
delimiter ;;
CREATE TRIGGER `Delete_classifly` BEFORE DELETE ON `xiaofan_goods` FOR EACH ROW BEGIN
    DELETE FROM xiaofan_goods_classify WHERE classify_child = old.id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table xiaofan_goods
-- ----------------------------
DROP TRIGGER IF EXISTS `Delete_sku`;
delimiter ;;
CREATE TRIGGER `Delete_sku` BEFORE DELETE ON `xiaofan_goods` FOR EACH ROW BEGIN
    DELETE FROM xiaofan_goods_sku WHERE goodsId = old.id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table xiaofan_goods
-- ----------------------------
DROP TRIGGER IF EXISTS `Delete_detali`;
delimiter ;;
CREATE TRIGGER `Delete_detali` BEFORE DELETE ON `xiaofan_goods` FOR EACH ROW BEGIN
    DELETE FROM xiaofan_goods_detail WHERE goodsId = old.id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table xiaofan_goods
-- ----------------------------
DROP TRIGGER IF EXISTS `Delete_comments`;
delimiter ;;
CREATE TRIGGER `Delete_comments` BEFORE DELETE ON `xiaofan_goods` FOR EACH ROW BEGIN
    DELETE FROM xiaofan_user_comments WHERE topic_goodsId = old.id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table xiaofan_goods
-- ----------------------------
DROP TRIGGER IF EXISTS `Delete_reply`;
delimiter ;;
CREATE TRIGGER `Delete_reply` BEFORE DELETE ON `xiaofan_goods` FOR EACH ROW BEGIN
    DELETE FROM xiaofan_user_reply WHERE reply_goodsId = old.id;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table xiaofan_user
-- ----------------------------
DROP TRIGGER IF EXISTS `Delete_user_info`;
delimiter ;;
CREATE TRIGGER `Delete_user_info` BEFORE DELETE ON `xiaofan_user` FOR EACH ROW BEGIN
    DELETE FROM xiaofan_user_info WHERE uid = old.uid;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
