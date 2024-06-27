/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : simple_mall

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 28/06/2024 04:18:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '类别ID，自动递增，主键',
  `c_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名称',
  `c_number` int NULL DEFAULT NULL COMMENT '类别总数量',
  PRIMARY KEY (`category_id`) USING BTREE,
  CONSTRAINT `chk_cname_non_empty` CHECK (`c_name` <> _utf8mb4'')
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '类别表，存储类别信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '服装', NULL);
INSERT INTO `category` VALUES (2, '手机数码', NULL);
INSERT INTO `category` VALUES (3, '家电电器', NULL);
INSERT INTO `category` VALUES (4, '家居家装', NULL);
INSERT INTO `category` VALUES (5, '汽车用品', NULL);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `user_id` int NOT NULL COMMENT '用户',
  `u_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '产品',
  `order_time` timestamp NULL DEFAULT NULL COMMENT '下单时间',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态（1已处理，0未处理）',
  `order_id` int NOT NULL AUTO_INCREMENT,
  `operate_time` timestamp NULL DEFAULT NULL COMMENT '处理时间',
  `finish` tinyint NULL DEFAULT NULL COMMENT '是否发货（1发货，0取消）',
  `p_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`order_id`, `product_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, '1111', '1', NULL, 1, 1, NULL, 1, NULL);
INSERT INTO `order` VALUES (2, '2', '2', NULL, 1, 2, NULL, 1, NULL);
INSERT INTO `order` VALUES (3, '3', '3', NULL, 1, 3, NULL, 0, NULL);
INSERT INTO `order` VALUES (4, '4', '4', NULL, 1, 4, NULL, 0, NULL);
INSERT INTO `order` VALUES (5, '5', '5', NULL, 1, 5, NULL, 1, NULL);
INSERT INTO `order` VALUES (6, '6', '6', NULL, 1, 6, NULL, 1, NULL);
INSERT INTO `order` VALUES (7, '7', '7', NULL, 1, 7, NULL, 1, NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int NOT NULL AUTO_INCREMENT COMMENT '商品ID，自动递增，主键',
  `p_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片',
  `p_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `p_brand` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `p_price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `p_number` int NOT NULL COMMENT '商品数量',
  `p_category` int NULL DEFAULT NULL COMMENT '类别ID，逻辑外键',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品表，存储商品信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '.img', 'MLB官方老花仿牛仔学长鞋', 'MLB', 1032.00, 98, 1);
INSERT INTO `product` VALUES (2, '.img', 'Jordan男子缓震复古运动鞋', 'JORDAN乔丹', 144.20, 3, 1);
INSERT INTO `product` VALUES (3, '.img', 'SAMBA OG复古板鞋男女adidas阿迪达斯三叶草', 'adidas阿迪达斯', 799.00, 1001, 1);
INSERT INTO `product` VALUES (4, '.img', 'Unvesno (UN) 迷雾炒花短袖t恤中性风衣服潮牌情侣夏装圆领宽松', 'Unvesno（UN）', 139.00, 1001, 1);
INSERT INTO `product` VALUES (5, '.img', '范洛法式连衣裙设计感收腰小黑裙', '范洛', 249.00, 1001, 1);
INSERT INTO `product` VALUES (6, '.img', '优衣库棉麻开领衬衫短袖', '优衣库', 149.00, 1004, 1);
INSERT INTO `product` VALUES (8, '.img', '骆驼春秋抓绒内胆防风防水三合一可拆卸冲锋衣夹克外套', '骆驼', 439.00, 1000, 1);
INSERT INTO `product` VALUES (9, '.img', 'FILA KIDS斐乐童装男女大童长裤', '斐乐', 248.00, 1000, 1);
INSERT INTO `product` VALUES (10, '.img', '曜金爵士乐福鞋', '思加图', 897.00, 1000, 1);
INSERT INTO `product` VALUES (11, '.img', '森马短袖衬衫女短款纯棉修身设计感', '森马', 48.00, 1000, 1);
INSERT INTO `product` VALUES (12, '.img', 'COLLECTION女配 24年春RL 888 Box皮革顶部手柄挎包RL93332', 'RALPH LAUREN', 20300.00, 1000, 1);
INSERT INTO `product` VALUES (13, '.img', 'Apple/苹果 iPhone 15 Pro', '苹果', 6099.00, 500, 2);
INSERT INTO `product` VALUES (14, '.img', 'HUAWEI Pura 70 Pro+', '华为', 7299.00, 500, 2);
INSERT INTO `product` VALUES (15, '.img', '小米14手机', '小米', 4299.00, 500, 2);
INSERT INTO `product` VALUES (16, '.img', 'Samsung/三星 Galaxy S23 Ultra SM-S9180', '三星', 5399.00, 500, 2);
INSERT INTO `product` VALUES (17, '.img', 'vivo X100 Ultra', 'vivo', 6499.00, 500, 2);
INSERT INTO `product` VALUES (18, '.img', 'OPPO Find X7 Ultra', 'OPPO', 5299.00, 500, 2);
INSERT INTO `product` VALUES (19, '.img', 'Sony/索尼ZV-E10L 半画幅微单相机', '索尼', 4799.00, 500, 2);
INSERT INTO `product` VALUES (20, '.img', '漫步者W830NB蓝牙耳机头戴式', '漫步者', 399.00, 500, 2);
INSERT INTO `product` VALUES (21, '.img', 'HONOR/荣耀100 Pro 5G智能手机第二代', '荣耀', 3199.00, 500, 2);
INSERT INTO `product` VALUES (22, '.img', '石头自清洁扫地机器人G20S系列', '石头电器', 5399.00, 800, 3);
INSERT INTO `product` VALUES (23, '.img', '东芝真空沁米炊鲜饭煲', '东芝家电', 3299.00, 800, 3);
INSERT INTO `product` VALUES (24, '.img', '美的台式净饮机加热一体净水器', '美的', 2999.00, 800, 3);
INSERT INTO `product` VALUES (25, '.img', '松下官方洗衣机家用全自动滚筒', '松下', 3299.00, 800, 3);
INSERT INTO `product` VALUES (26, '.img', '352 X88空气消毒机', '352', 4281.00, 800, 3);
INSERT INTO `product` VALUES (27, '.img', '咖啡机进口全自动奶咖', '德龙', 4390.00, 800, 3);
INSERT INTO `product` VALUES (28, '.img', 'Dyson戴森吹风机HD15紫红色电吹风', '戴森', 3399.00, 800, 3);
INSERT INTO `product` VALUES (29, '.img', '源氏木语布艺蛋壳椅单人沙发椅摇椅大人躺椅懒人沙发阳台家用休闲', '源氏木语家居', 2163.00, 15, 4);
INSERT INTO `product` VALUES (30, '.img', '源氏木语实木转角桌书房办公学习写字桌家用橡木简约电脑桌工作台', '源氏木语家居', 1139.00, 15, 4);
INSERT INTO `product` VALUES (31, '.img', '源氏木语实木床北欧风卧室家具双人床简约黑胡桃木悬浮床家用大床', '源氏木语家居', 4088.74, 15, 4);
INSERT INTO `product` VALUES (32, '.img', '源氏木语实木床奶油风羽绒软包床日式榻榻米双人床卧室科技布床', '源氏木语家居', 2179.00, 15, 4);
INSERT INTO `product` VALUES (33, '.img', '林氏家居客厅懒人沙发椅子飘窗摇摇椅卧室小沙发单人阳台林氏木业', '林氏家居', 77.00, 15, 4);
INSERT INTO `product` VALUES (34, '.img', '林氏家居头层牛皮真皮沙发客厅钢琴键2024新款大黑牛家具林氏木业', '林氏家居', 3598.00, 15, 4);
INSERT INTO `product` VALUES (36, '.img', '林氏家居北欧原木风大床实木脚1.5米床架悬浮双人床家具林氏木业', '林氏家居', 759.00, 15, 4);
INSERT INTO `product` VALUES (37, '.img', '林氏家居卡通懒人沙发阳台可爱卧室小沙发单人椅子林氏木业LS743', '林氏家居', 261.00, 15, 4);
INSERT INTO `product` VALUES (38, '.img', '林氏家居原木奶油风橡木实木餐桌椅家用长岩板餐桌小户型林氏木业', '林氏家居', 1777.00, 15, 4);
INSERT INTO `product` VALUES (39, '.img', '林氏家居可移动卧室衣柜穿衣镜全身镜家用落地试衣玻璃镜子LS805', '林氏家居', 179.00, 15, 4);
INSERT INTO `product` VALUES (40, '.img', 'BMW 宝马 新BMW X5 汽车整车', '宝马', 615000.00, 2, 5);
INSERT INTO `product` VALUES (41, '.img', 'BMW 宝马 新BMW X6 整车', '宝马', 799000.00, 2, 5);
INSERT INTO `product` VALUES (42, '.img', 'BMW 宝马 BMW X7 M60i汽车整车', '宝马', 172000.00, 2, 5);
INSERT INTO `product` VALUES (44, '.img', 'BMW 宝马 BMW 2系四门轿跑车 汽车整车', '宝马', 272900.00, 2, 5);
INSERT INTO `product` VALUES (45, '.img', 'BMW 宝马 BMW X1汽车整车', '宝马', 288900.00, 2, 5);
INSERT INTO `product` VALUES (46, '.img', '奥迪/Audi S5 Sportback', '奥迪', 631800.00, 2, 5);
INSERT INTO `product` VALUES (47, '.img', '奥迪/Audi S5 Cabriolet', '奥迪', 300000.00, 2, 5);
INSERT INTO `product` VALUES (48, '.img', '奥迪/Audi S5 Coupe', '奥迪', 631800.00, 2, 5);
INSERT INTO `product` VALUES (49, '.img', '奥迪/Audi A7 Sportback 新车整车', '奥迪', 585800.00, 2, 5);
INSERT INTO `product` VALUES (50, '.img', '奥迪/Audi S8L', '奥迪', 2076800.00, 2, 5);
INSERT INTO `product` VALUES (51, '.img', '奥迪/Audi S6 Limousine', '奥迪', 858800.00, 2, 5);
INSERT INTO `product` VALUES (52, '.img', '奥迪/Audi RS Q8', '奥迪', 1468800.00, 2, 5);
INSERT INTO `product` VALUES (53, '.img', 'Audi/奥迪 A8L Horch 创始人版', '奥迪', 1274800.00, 2, 5);
INSERT INTO `product` VALUES (54, '.img', '奥迪/Audi RS6 Avant', '奥迪', 1453800.00, 2, 5);
INSERT INTO `product` VALUES (55, '.img', '五菱 宏光MINI EV', '五菱', 99900.00, 2, 5);
INSERT INTO `product` VALUES (56, '.img', '五菱 Nano EV', '五菱', 66800.00, 2, 5);
INSERT INTO `product` VALUES (57, '.img', '五菱 星驰', '五菱', 86800.00, 2, 5);
INSERT INTO `product` VALUES (58, '.img', '五菱 凯捷', '五菱', 125800.00, 2, 5);
INSERT INTO `product` VALUES (59, '.img', '五菱 星辰', '五菱', 109800.00, 2, 5);
INSERT INTO `product` VALUES (60, '.img', '大众 ID.4 X', '大众', 195900.00, 2, 5);
INSERT INTO `product` VALUES (61, '.img', '大众 ID.3', '大众', 162900.00, 2, 5);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID，自动递增，主键',
  `r_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `r_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述',
  `r_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，默认当前时间',
  `r_update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间，默认当前时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  CONSTRAINT `chk_rname_non_empty` CHECK (`r_name` <> _utf8mb4'')
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表，存储角色信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '拥有所有查看和操作功能', '2024-05-23 10:33:09', '2024-06-25 14:26:42');
INSERT INTO `role` VALUES (2, '商品管理员', '只能查看及操作商品', '2024-05-23 10:31:43', '2024-06-25 14:26:40');
INSERT INTO `role` VALUES (3, '普通用户', '只能查看商品', '2024-05-23 10:31:43', '2024-06-25 13:47:37');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID，自动递增，主键',
  `u_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名，非空且唯一',
  `u_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `u_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户姓名',
  `u_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `u_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `u_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，默认当前时间',
  `u_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间，默认当前时间，更新时自动更新',
  `u_role` int NULL DEFAULT NULL COMMENT '角色ID，逻辑外键',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `u_id`(`u_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 196 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表，存储用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Admin', 'Admin123456', '用户111333', NULL, 'Admin@163.com', '2024-05-23 11:32:50', '2024-06-25 14:19:39', 1);
INSERT INTO `user` VALUES (2, 'productAdmin', 'product123456', '用户222', NULL, 'product@163.com', '2024-05-23 11:34:03', '2024-05-23 16:14:52', 2);
INSERT INTO `user` VALUES (3, 'orderAdmin', 'order123456', '用户333', NULL, 'order@163.com', '2024-05-23 11:35:06', '2024-05-23 16:15:01', 3);
INSERT INTO `user` VALUES (37, 'user1', 'user123456', '用户1', NULL, 'user1@163.com', '2024-05-23 11:47:01', '2024-06-04 23:49:31', 3);
INSERT INTO `user` VALUES (38, 'user2', 'user123457', '用户2', NULL, 'user2@163.com', '2024-05-23 11:47:01', '2024-06-24 23:46:13', 3);
INSERT INTO `user` VALUES (39, 'user3', 'user123458', '用户3', NULL, 'user3@163.com', '2024-05-23 11:47:01', '2024-06-24 23:46:21', 3);
INSERT INTO `user` VALUES (40, 'user4', 'user123459', '用户4', NULL, 'user4@163.com', '2024-05-23 11:47:01', '2024-06-25 00:05:15', 3);
INSERT INTO `user` VALUES (41, 'user5', 'user123460', '用户5', NULL, 'user5@163.com', '2024-05-23 11:47:01', '2024-05-23 14:17:42', NULL);
INSERT INTO `user` VALUES (42, 'user6', 'user123461', '用户6', NULL, 'user6@163.com', '2024-05-23 11:47:01', '2024-05-23 14:17:45', NULL);
INSERT INTO `user` VALUES (43, 'user7', 'user123462', '用户7', NULL, 'user7@163.com', '2024-05-23 11:47:01', '2024-05-23 14:17:48', NULL);
INSERT INTO `user` VALUES (44, 'user8', 'user123463', '用户8', NULL, 'user8@163.com', '2024-05-23 11:47:01', '2024-05-23 14:17:51', NULL);
INSERT INTO `user` VALUES (45, 'user9', 'user123464', '用户9', NULL, 'user9@163.com', '2024-05-23 11:47:01', '2024-05-23 14:17:54', NULL);
INSERT INTO `user` VALUES (46, 'user10', 'user123465', '用户10', NULL, 'user10@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:10', NULL);
INSERT INTO `user` VALUES (47, 'user11', 'user123466', '用户11', NULL, 'user11@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:13', NULL);
INSERT INTO `user` VALUES (48, 'user12', 'user123467', '用户12', NULL, 'user12@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:16', NULL);
INSERT INTO `user` VALUES (49, 'user13', 'user123468', '用户13', NULL, 'user13@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:18', NULL);
INSERT INTO `user` VALUES (50, 'user14', 'user123469', '用户14', NULL, 'user14@163.com', '2024-05-23 11:47:01', '2024-05-23 14:19:26', NULL);
INSERT INTO `user` VALUES (51, 'user15', 'user123470', '用户15', NULL, 'user15@163.com', '2024-05-23 11:47:01', '2024-05-23 14:19:24', NULL);
INSERT INTO `user` VALUES (52, 'user16', 'user123471', '用户16', NULL, 'user16@163.com', '2024-05-23 11:47:01', '2024-05-23 14:19:21', NULL);
INSERT INTO `user` VALUES (53, 'user17', 'user123472', '用户17', NULL, 'user17@163.com', '2024-05-23 11:47:01', '2024-05-23 14:19:15', NULL);
INSERT INTO `user` VALUES (54, 'user18', 'user123473', '用户18', NULL, 'user18@163.com', '2024-05-23 11:47:01', '2024-05-23 14:19:13', NULL);
INSERT INTO `user` VALUES (55, 'user19', 'user123474', '用户19', NULL, 'user19@163.com', '2024-05-23 11:47:01', '2024-05-23 14:19:09', NULL);
INSERT INTO `user` VALUES (56, 'user20', 'user123475', '用户20', NULL, 'user20@163.com', '2024-05-23 11:47:01', '2024-05-23 14:19:03', NULL);
INSERT INTO `user` VALUES (57, 'user21', 'user123476', '用户21', NULL, 'user21@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:59', NULL);
INSERT INTO `user` VALUES (58, 'user22', 'user123477', '用户22', NULL, 'user22@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:57', NULL);
INSERT INTO `user` VALUES (59, 'user23', 'user123478', '用户23', NULL, 'user23@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:55', NULL);
INSERT INTO `user` VALUES (60, 'user24', 'user123479', '用户24', NULL, 'user24@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:52', NULL);
INSERT INTO `user` VALUES (61, 'user25', 'user123480', '用户25', NULL, 'user25@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:49', NULL);
INSERT INTO `user` VALUES (62, 'user26', 'user123481', '用户26', NULL, 'user26@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:46', NULL);
INSERT INTO `user` VALUES (63, 'user27', 'user123482', '用户27', NULL, 'user27@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:43', NULL);
INSERT INTO `user` VALUES (64, 'user28', 'user123483', '用户28', NULL, 'user28@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:40', NULL);
INSERT INTO `user` VALUES (65, 'user29', 'user123484', '用户29', NULL, 'user29@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:36', NULL);
INSERT INTO `user` VALUES (66, 'user30', 'user123485', '用户30', NULL, 'user30@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:34', NULL);
INSERT INTO `user` VALUES (67, 'user31', 'user123486', '用户31', NULL, 'user31@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:31', NULL);
INSERT INTO `user` VALUES (68, 'user32', 'user123487', '用户32', NULL, 'user32@163.com', '2024-05-23 11:47:01', '2024-05-23 14:18:28', NULL);
INSERT INTO `user` VALUES (69, 'user33', 'user123488', '用户33', NULL, 'user33@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (70, 'user34', 'user123489', '用户34', NULL, 'user34@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (71, 'user35', 'user123490', '用户35', NULL, 'user35@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (72, 'user36', 'user123491', '用户36', NULL, 'user36@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (73, 'user37', 'user123492', '用户37', NULL, 'user37@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (74, 'user38', 'user123493', '用户38', NULL, 'user38@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (75, 'user39', 'user123494', '用户39', NULL, 'user39@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (76, 'user40', 'user123495', '用户40', NULL, 'user40@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (77, 'user41', 'user123496', '用户41', NULL, 'user41@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (78, 'user42', 'user123497', '用户42', NULL, 'user42@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (79, 'user43', 'user123498', '用户43', NULL, 'user43@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (80, 'user44', 'user123499', '用户44', NULL, 'user44@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (81, 'user45', 'user123500', '用户45', NULL, 'user45@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (82, 'user46', 'user123501', '用户46', NULL, 'user46@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (83, 'user47', 'user123502', '用户47', NULL, 'user47@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (84, 'user48', 'user123503', '用户48', NULL, 'user48@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (85, 'user49', 'user123504', '用户49', NULL, 'user49@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (86, 'user50', 'user123505', '用户50', NULL, 'user50@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (87, 'user51', 'user123506', '用户51', NULL, 'user51@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (88, 'user52', 'user123507', '用户52', NULL, 'user52@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (89, 'user53', 'user123508', '用户53', NULL, 'user53@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (90, 'user54', 'user123509', '用户54', NULL, 'user54@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (91, 'user55', 'user123510', '用户55', NULL, 'user55@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (92, 'user56', 'user123511', '用户56', NULL, 'user56@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (93, 'user57', 'user123512', '用户57', NULL, 'user57@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (94, 'user58', 'user123513', '用户58', NULL, 'user58@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (95, 'user59', 'user123514', '用户59', NULL, 'user59@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (96, 'user60', 'user123515', '用户60', NULL, 'user60@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (97, 'user61', 'user123516', '用户61', NULL, 'user61@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (98, 'user62', 'user123517', '用户62', NULL, 'user62@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (99, 'user63', 'user123518', '用户63', NULL, 'user63@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (100, 'user64', 'user123519', '用户64', NULL, 'user64@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (101, 'user65', 'user123520', '用户65', NULL, 'user65@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (102, 'user66', 'user123521', '用户66', NULL, 'user66@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (103, 'user67', 'user123522', '用户67', NULL, 'user67@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (104, 'user68', 'user123523', '用户68', NULL, 'user68@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (105, 'user69', 'user123524', '用户69', NULL, 'user69@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (106, 'user70', 'user123525', '用户70', NULL, 'user70@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (107, 'user71', 'user123526', '用户71', NULL, 'user71@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (108, 'user72', 'user123527', '用户72', NULL, 'user72@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (109, 'user73', 'user123528', '用户73', NULL, 'user73@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (110, 'user74', 'user123529', '用户74', NULL, 'user74@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (111, 'user75', 'user123530', '用户75', NULL, 'user75@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (112, 'user76', 'user123531', '用户76', NULL, 'user76@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (113, 'user77', 'user123532', '用户77', NULL, 'user77@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (114, 'user78', 'user123533', '用户78', NULL, 'user78@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (115, 'user79', 'user123534', '用户79', NULL, 'user79@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (116, 'user80', 'user123535', '用户80', NULL, 'user80@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (117, 'user81', 'user123536', '用户81', NULL, 'user81@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (118, 'user82', 'user123537', '用户82', NULL, 'user82@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (119, 'user83', 'user123538', '用户83', NULL, 'user83@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (120, 'user84', 'user123539', '用户84', NULL, 'user84@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (121, 'user85', 'user123540', '用户85', NULL, 'user85@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (122, 'user86', 'user123541', '用户86', NULL, 'user86@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (123, 'user87', 'user123542', '用户87', NULL, 'user87@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (124, 'user88', 'user123543', '用户88', NULL, 'user88@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (125, 'user89', 'user123544', '用户89', NULL, 'user89@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (126, 'user90', 'user123545', '用户90', NULL, 'user90@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (127, 'user91', 'user123546', '用户91', NULL, 'user91@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (128, 'user92', 'user123547', '用户92', NULL, 'user92@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (129, 'user93', 'user123548', '用户93', NULL, 'user93@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (130, 'user94', 'user123549', '用户94', NULL, 'user94@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (131, 'user95', 'user123550', '用户95', NULL, 'user95@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (132, 'user96', 'user123551', '用户96', NULL, 'user96@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (133, 'user97', 'user123552', '用户97', NULL, 'user97@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (134, 'user98', 'user123553', '用户98', NULL, 'user98@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (135, 'user99', 'user123554', '用户99', NULL, 'user99@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (136, 'user100', 'user123555', '用户100', NULL, 'user100@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (137, 'user101', 'user123556', '用户101', NULL, 'user101@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (138, 'user102', 'user123557', '用户102', NULL, 'user102@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (139, 'user103', 'user123558', '用户103', NULL, 'user103@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (140, 'user104', 'user123559', '用户104', NULL, 'user104@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (141, 'user105', 'user123560', '用户105', NULL, 'user105@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (142, 'user106', 'user123561', '用户106', NULL, 'user106@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (143, 'user107', 'user123562', '用户107', NULL, 'user107@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (144, 'user108', 'user123563', '用户108', NULL, 'user108@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (145, 'user109', 'user123564', '用户109', NULL, 'user109@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (146, 'user110', 'user123565', '用户110', NULL, 'user110@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (147, 'user111', 'user123566', '用户111', NULL, 'user111@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (148, 'user112', 'user123567', '用户112', NULL, 'user112@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (149, 'user113', 'user123568', '用户113', NULL, 'user113@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (150, 'user114', 'user123569', '用户114', NULL, 'user114@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (151, 'user115', 'user123570', '用户115', NULL, 'user115@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (152, 'user116', 'user123571', '用户116', NULL, 'user116@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (153, 'user117', 'user123572', '用户117', NULL, 'user117@163.com', '2024-05-23 11:47:01', '2024-05-23 11:47:01', NULL);
INSERT INTO `user` VALUES (154, 'user118', 'user123573', '用户119', NULL, 'user118@163.com', '2024-05-23 11:47:01', '2024-05-27 00:35:16', 3);
INSERT INTO `user` VALUES (191, '111', 'user123456', '111', '', '', '2024-06-27 23:39:19', '2024-06-27 23:39:19', NULL);

-- ----------------------------
-- Triggers structure for table product
-- ----------------------------
DROP TRIGGER IF EXISTS `after_product_insert`;
delimiter ;;
CREATE TRIGGER `after_product_insert` AFTER INSERT ON `product` FOR EACH ROW BEGIN
    UPDATE category
    SET c_number = c_number + NEW.p_number
    WHERE category_id = NEW.p_category;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table product
-- ----------------------------
DROP TRIGGER IF EXISTS `after_product_update`;
delimiter ;;
CREATE TRIGGER `after_product_update` AFTER UPDATE ON `product` FOR EACH ROW BEGIN
    IF OLD.p_category != NEW.p_category THEN
        -- 旧类别的产品数量减去旧值
        UPDATE category
        SET c_number = c_number - OLD.p_number
        WHERE category_id = OLD.p_category;

        -- 新类别的产品数量加上新值
        UPDATE category
        SET c_number = c_number + NEW.p_number
        WHERE category_id = NEW.p_category;
    ELSE
        -- 同一类别，更新数量
        UPDATE category
        SET c_number = c_number - OLD.p_number + NEW.p_number
        WHERE category_id = NEW.p_category;
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table product
-- ----------------------------
DROP TRIGGER IF EXISTS `after_product_delete`;
delimiter ;;
CREATE TRIGGER `after_product_delete` AFTER DELETE ON `product` FOR EACH ROW BEGIN
    UPDATE category
    SET c_number = c_number - OLD.p_number
    WHERE category_id = OLD.p_category;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
