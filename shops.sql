/*
Navicat MySQL Data Transfer

Source Server         : hxk
Source Server Version : 50540
Source Host           : 127.0.0.1:3306
Source Database       : shops

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2019-11-14 18:31:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_menu
-- ----------------------------
DROP TABLE IF EXISTS `cms_menu`;
CREATE TABLE `cms_menu` (
  `menu_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `menu_type` tinyint(2) DEFAULT NULL,
  `menu_code` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL,
  `menu_name` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL,
  `sort` int(9) DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='目录表';

-- ----------------------------
-- Records of cms_menu
-- ----------------------------

-- ----------------------------
-- Table structure for os_address
-- ----------------------------
DROP TABLE IF EXISTS `os_address`;
CREATE TABLE `os_address` (
  `address_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '收获地址ID',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `user_tag` varchar(64) DEFAULT NULL COMMENT '地址标签',
  `user_phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `user_adress` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `user_zipcode` int(6) DEFAULT NULL COMMENT '邮政编码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='收获地址表';

-- ----------------------------
-- Records of os_address
-- ----------------------------

-- ----------------------------
-- Table structure for os_category
-- ----------------------------
DROP TABLE IF EXISTS `os_category`;
CREATE TABLE `os_category` (
  `category_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `type` tinyint(2) DEFAULT NULL COMMENT '目录',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `page_title` varchar(64) DEFAULT NULL,
  `page_description` varchar(64) DEFAULT NULL,
  `page_keyword` varchar(64) DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of os_category
-- ----------------------------

-- ----------------------------
-- Table structure for os_order
-- ----------------------------
DROP TABLE IF EXISTS `os_order`;
CREATE TABLE `os_order` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_number` bigint(20) DEFAULT NULL COMMENT '订单编号,系统生成',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pay_type` tinyint(2) DEFAULT '1' COMMENT '支付方式 0=线下支付，1=在线支付',
  `shipment_time` tinyint(2) DEFAULT NULL COMMENT '配送时间 1=不限送货时间，2=工作日送货，3=双休日、假日送货',
  `shipment_type` tinyint(2) DEFAULT '0' COMMENT '配送',
  `shipment_amount` decimal(10,0) DEFAULT '0' COMMENT '快递费',
  `invoice_type` tinyint(2) DEFAULT NULL COMMENT '支付方式 ',
  `invoice_title` varchar(64) DEFAULT NULL COMMENT '发票抬头',
  `order_status` tinyint(2) DEFAULT NULL COMMENT '订单状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `order_amount` decimal(10,0) DEFAULT '0' COMMENT '订单金额',
  `order_score` int(11) DEFAULT '0' COMMENT '订单积分',
  `pay_amount` decimal(10,0) DEFAULT NULL COMMENT '支付金额 = 订单金额 + 快递费',
  `buy_number` int(11) DEFAULT NULL COMMENT '商品总数量',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of os_order
-- ----------------------------

-- ----------------------------
-- Table structure for os_order_product
-- ----------------------------
DROP TABLE IF EXISTS `os_order_product`;
CREATE TABLE `os_order_product` (
  `order_product_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单商品ID',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '订单ID',
  `product_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品编号',
  `name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '图片',
  `product_spec_number` bigint(20) unsigned DEFAULT NULL COMMENT '规格编号',
  `product_spec_name` varchar(64) DEFAULT NULL COMMENT '规格名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `score` int(11) DEFAULT NULL,
  `buy_number` int(11) DEFAULT NULL COMMENT '数量',
  `product_score` int(11) DEFAULT NULL,
  `product_amount` decimal(10,0) DEFAULT NULL COMMENT '商品总金额',
  `comment_status` tinyint(2) DEFAULT '0',
  `seller_id` bigint(20) unsigned DEFAULT NULL COMMENT '商家id',
  PRIMARY KEY (`order_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='订单明细表';

-- ----------------------------
-- Records of os_order_product
-- ----------------------------

-- ----------------------------
-- Table structure for os_order_shipment
-- ----------------------------
DROP TABLE IF EXISTS `os_order_shipment`;
CREATE TABLE `os_order_shipment` (
  `order_shipment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '配送ID',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '订单ID',
  `user_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `user_phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `user_adress` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `user_zipcode` int(6) DEFAULT NULL COMMENT '邮政编码',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`order_shipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='订单配送表';

-- ----------------------------
-- Records of os_order_shipment
-- ----------------------------

-- ----------------------------
-- Table structure for os_order_status
-- ----------------------------
DROP TABLE IF EXISTS `os_order_status`;
CREATE TABLE `os_order_status` (
  `order_status_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单状态ID',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '订单ID',
  `order_status` tinyint(2) DEFAULT NULL COMMENT '订单状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_status` tinyint(2) DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='订单状态表';

-- ----------------------------
-- Records of os_order_status
-- ----------------------------

-- ----------------------------
-- Table structure for os_product
-- ----------------------------
DROP TABLE IF EXISTS `os_product`;
CREATE TABLE `os_product` (
  `product_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `product_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品编号',
  `name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `show_price` decimal(10,2) DEFAULT NULL COMMENT '显示价格',
  `introduce` varchar(64) DEFAULT NULL COMMENT '商品简介',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `page_title` varchar(64) DEFAULT NULL COMMENT '页面标题',
  `page_description` varchar(255) DEFAULT NULL COMMENT '页面描述',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `seller_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of os_product
-- ----------------------------
INSERT INTO `os_product` VALUES ('1', '1472581220748', '小米手机5', '2299.00', '支持手机分身，能刷公交卡、银行卡', 'images/goods/20191101/1471798318820.png', null, null, '小米手机5', null, null, '1');

-- ----------------------------
-- Table structure for os_product_category
-- ----------------------------
DROP TABLE IF EXISTS `os_product_category`;
CREATE TABLE `os_product_category` (
  `product_category_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='商品分类关联表';

-- ----------------------------
-- Records of os_product_category
-- ----------------------------

-- ----------------------------
-- Table structure for os_product_detail
-- ----------------------------
DROP TABLE IF EXISTS `os_product_detail`;
CREATE TABLE `os_product_detail` (
  `product_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品描述ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `description` text COMMENT '商品描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`product_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品描述表';

-- ----------------------------
-- Records of os_product_detail
-- ----------------------------

-- ----------------------------
-- Table structure for os_product_image
-- ----------------------------
DROP TABLE IF EXISTS `os_product_image`;
CREATE TABLE `os_product_image` (
  `pic_img_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品图片ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `sort` tinyint(2) DEFAULT NULL COMMENT '排序',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态：1.显示；0.隐藏',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`pic_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品图片表';

-- ----------------------------
-- Records of os_product_image
-- ----------------------------

-- ----------------------------
-- Table structure for os_product_parameter
-- ----------------------------
DROP TABLE IF EXISTS `os_product_parameter`;
CREATE TABLE `os_product_parameter` (
  `product_parameter_id` bigint(20) NOT NULL COMMENT '参数ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `name` varchar(64) DEFAULT NULL COMMENT '参数名',
  `value` varchar(64) DEFAULT NULL COMMENT '参数值',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`product_parameter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品参数表';

-- ----------------------------
-- Records of os_product_parameter
-- ----------------------------
INSERT INTO `os_product_parameter` VALUES ('1', '1', '处理器', '骁龙820', '1', '2019-11-04 18:55:19', '2019-11-04 18:55:29');
INSERT INTO `os_product_parameter` VALUES ('2', '1', '电池容量', '3000mAh', '2', '2019-11-04 18:55:19', '2019-11-04 18:55:29');
INSERT INTO `os_product_parameter` VALUES ('3', '1', '主屏尺寸', '5.15英寸', '3', '2019-11-04 18:55:19', '2019-11-04 18:55:29');
INSERT INTO `os_product_parameter` VALUES ('4', '1', '主屏分辨率', '1920x1080像素', '4', '2019-11-04 18:55:19', '2019-11-04 18:55:29');
INSERT INTO `os_product_parameter` VALUES ('5', '1', '后置摄像头', '1600万像素', '5', '2019-11-04 18:55:19', '2019-11-04 18:55:29');
INSERT INTO `os_product_parameter` VALUES ('6', '1', '前置摄像头', '400万像素', '6', '2019-11-04 18:55:19', '2019-11-04 18:55:29');
INSERT INTO `os_product_parameter` VALUES ('7', '1', '内存', '3GB', '7', '2019-11-04 18:55:19', '2019-11-04 18:55:29');

-- ----------------------------
-- Table structure for os_product_specification
-- ----------------------------
DROP TABLE IF EXISTS `os_product_specification`;
CREATE TABLE `os_product_specification` (
  `product_spec_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格ID',
  `product_spec_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品规格编号',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `spec` varchar(64) DEFAULT NULL COMMENT '规格',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `sales_volume` int(11) DEFAULT '0' COMMENT '销售量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `score` int(11) DEFAULT NULL COMMENT '积分',
  `default_status` tinyint(2) DEFAULT '0' COMMENT '是否默认状态',
  `status` tinyint(2) DEFAULT '0' COMMENT '商品状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`product_spec_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='商品规格表';

-- ----------------------------
-- Records of os_product_specification
-- ----------------------------

-- ----------------------------
-- Table structure for os_specification
-- ----------------------------
DROP TABLE IF EXISTS `os_specification`;
CREATE TABLE `os_specification` (
  `specification_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格ID',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `name` varchar(64) DEFAULT NULL COMMENT '规格名称',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 显示默认',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`specification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='规格表\r\n';

-- ----------------------------
-- Records of os_specification
-- ----------------------------

-- ----------------------------
-- Table structure for os_specification_attribute
-- ----------------------------
DROP TABLE IF EXISTS `os_specification_attribute`;
CREATE TABLE `os_specification_attribute` (
  `spec_attr_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格属性ID',
  `specification_id` bigint(20) DEFAULT NULL COMMENT '规格ID',
  `name` varchar(64) DEFAULT NULL COMMENT '规格属性名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`spec_attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='规格属性表';

-- ----------------------------
-- Records of os_specification_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for os_user
-- ----------------------------
DROP TABLE IF EXISTS `os_user`;
CREATE TABLE `os_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_number` bigint(20) unsigned DEFAULT NULL COMMENT '用户编号',
  `user_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `login_password` varchar(32) DEFAULT NULL COMMENT '登录密码',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别 0=保密/1=男/2=女',
  `age` tinyint(4) DEFAULT '0' COMMENT '年龄',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `telephone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `regeist_time` datetime DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of os_user
-- ----------------------------

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `seller_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家id',
  `seller_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `telephone` varchar(11) DEFAULT NULL COMMENT '编号',
  `login_password` varchar(32) DEFAULT NULL COMMENT '密码',
  `price` decimal(10,2) DEFAULT NULL COMMENT '账户金额',
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('1', '王王王', '17853242333', '123456', '3000.00');
INSERT INTO `seller` VALUES ('2', '李李李', '17853242444', '123456', '4000.00');
INSERT INTO `seller` VALUES ('3', '马马马', '17853242555', '123456', '5000.00');
