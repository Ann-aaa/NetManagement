/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50540
Source Host           : 127.0.0.1:3306
Source Database       : xiaomi5

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2019-12-30 19:16:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_menu
-- ----------------------------
DROP TABLE IF EXISTS `cms_menu`;
CREATE TABLE `cms_menu` (
  `menu_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级编号',
  `menu_type` tinyint(2) DEFAULT NULL COMMENT '权限类型 1=菜单/2=功能/3=子功能/0=操作',
  `menu_code` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '权限代码',
  `menu_name` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '权限名称',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `href` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '链接地址',
  `icon` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '图标名称',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态 0=隐藏/1=显示',
  `permission` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '权限标识',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='目录表';

-- ----------------------------
-- Records of cms_menu
-- ----------------------------
INSERT INTO `cms_menu` VALUES ('1', '0', null, '', '功能菜单', null, '', '', '1', '', null, null, '主页');
INSERT INTO `cms_menu` VALUES ('2', '1', '1', 'administrator', '管理员管理', '100', '/administrator', 'user', '1', null, null, null, '');
INSERT INTO `cms_menu` VALUES ('3', '2', '2', 'list', '管理员列表', '20', '/administrator/list/view', 'users', '1', '', null, null, '');
INSERT INTO `cms_menu` VALUES ('4', '3', '0', 'list_view', '查看', '1', '/administrator/list/view', '', '1', 'administrator:list:view', null, null, '');
INSERT INTO `cms_menu` VALUES ('5', '3', '0', 'list_edit', '编辑', '2', '/administrator/list/edit', '', '1', 'administrator:list:edit', null, null, '');
INSERT INTO `cms_menu` VALUES ('6', '3', '0', 'list_delete', '删除', '3', '/administrator/list/delete', null, '1', 'administrator:list:delete', null, null, null);
INSERT INTO `cms_menu` VALUES ('7', '3', '0', 'list_create', '添加', '4', '/administrator/list/create', null, '1', 'administrator:list:create', null, null, null);
INSERT INTO `cms_menu` VALUES ('8', '2', '2', 'info', '个人信息', '10', '/administrator/info/view', 'user-times', '1', '', null, null, '');
INSERT INTO `cms_menu` VALUES ('9', '8', '0', 'info_view', '查看', '1', '/administrator/info/view', '', '1', 'administrator:info:view', null, null, '');
INSERT INTO `cms_menu` VALUES ('10', '8', '0', 'info_edit', '编辑', '2', '/administrator/info/edit', '', '1', 'administrator:info:edit', null, null, '');
INSERT INTO `cms_menu` VALUES ('11', '2', '2', 'role', '角色管理', '30', '/administrator/role/view', 'user-secret', '1', '', null, null, '');
INSERT INTO `cms_menu` VALUES ('12', '11', '0', 'role_view', '查看', '1', '/administrator/role/view', '', '1', 'administrator:role:view', null, null, '');
INSERT INTO `cms_menu` VALUES ('13', '11', '0', 'role_edit', '编辑', '2', '/administrator/role/edit', '', '1', 'administrator:role:edit', null, null, '');
INSERT INTO `cms_menu` VALUES ('14', '11', '0', 'role_delete', '删除', '3', '/administrator/role/delete', '', '1', 'administrator:role:delete', null, null, '');
INSERT INTO `cms_menu` VALUES ('15', '11', '0', 'role_create', '添加', '4', '/administrator/role/create', '', '1', 'administrator:role:create', null, null, '');
INSERT INTO `cms_menu` VALUES ('16', '1', '1', 'user', '会员管理', '300', '/system/user', 'users', '1', null, null, null, null);
INSERT INTO `cms_menu` VALUES ('17', '16', '2', 'list', '会员列表', '10', '/system/user/list/view', 'user', '1', '', null, null, '');
INSERT INTO `cms_menu` VALUES ('18', '17', '0', 'list_view', '查看', '1', '/system/user/list/view', null, '1', 'user:list:view', null, null, null);
INSERT INTO `cms_menu` VALUES ('19', '17', '0', 'list_edit', '编辑', '2', '/system/user/list/edit', null, '1', 'user:list:edit', null, null, null);
INSERT INTO `cms_menu` VALUES ('20', '17', '0', 'list_delete', '删除', '3', '/system/user/list/delete', null, '1', 'user:list:delete', null, null, null);
INSERT INTO `cms_menu` VALUES ('21', '17', '0', 'list_add', '添加', '4', '/system/user/list/add', null, '1', 'user:list:add', null, null, null);
INSERT INTO `cms_menu` VALUES ('22', '16', '2', 'grade', '等级管理', '20', '/system/user/grade/view', '', '1', '', null, null, null);
INSERT INTO `cms_menu` VALUES ('23', '22', '0', 'grade_view', '查看', '1', '/system/user/grade/view', null, '1', 'user:grade:view', null, null, null);
INSERT INTO `cms_menu` VALUES ('24', '22', '0', 'grade_edit', '编辑', '2', '/system/user/grade/edit', null, '1', 'user:grade:edit', null, null, null);
INSERT INTO `cms_menu` VALUES ('25', '16', '2', 'record', '会员记录管理', '30', '/system/user/record/view', '', '1', '', null, null, null);
INSERT INTO `cms_menu` VALUES ('26', '25', '0', 'record_view', '查看', '1', '/system/user/record/view', '', '1', 'user:record:view', null, null, null);
INSERT INTO `cms_menu` VALUES ('27', '1', '1', 'product', '产品管理', '400', '/product', 'product-hunt', '1', null, null, null, '');
INSERT INTO `cms_menu` VALUES ('28', '27', '2', 'list', '产品列表', '10', '/product/list/view', 'fax', '1', '', null, null, '');
INSERT INTO `cms_menu` VALUES ('29', '28', '0', 'list_view', '查看', '1', '/product/list/view', null, '1', 'product:list:view', null, null, null);
INSERT INTO `cms_menu` VALUES ('30', '28', '0', 'list_edit', '编辑', '2', '/product/list/edit', null, '1', 'product:list:edit', null, null, null);
INSERT INTO `cms_menu` VALUES ('31', '28', '0', 'list_delete', '删除', '3', '/product/list/delete', null, '1', 'product:list:delete', null, null, null);
INSERT INTO `cms_menu` VALUES ('32', '28', '0', 'list_add', '添加', '4', '/product/list/add', null, '1', 'product:list:add', null, null, null);
INSERT INTO `cms_menu` VALUES ('33', '27', '2', 'category', '分类管理', '20', '/product/category/view', 'object-ungroup', '1', '', null, null, '');
INSERT INTO `cms_menu` VALUES ('34', '33', '0', 'category_view', '查看', '1', '/product/category/view', null, '1', 'product:category:view', null, null, null);
INSERT INTO `cms_menu` VALUES ('35', '33', '0', 'category_edit', '编辑', '2', '/product/category/edit', null, '1', 'product:category:edit', null, null, null);
INSERT INTO `cms_menu` VALUES ('36', '33', '0', 'category_delete', '删除', '3', '/product/category/delete', null, '1', 'product:category:delete', null, null, null);
INSERT INTO `cms_menu` VALUES ('37', '33', '0', 'category_create', '添加', '4', '/product/category/create', '', '1', 'product:category:create', null, null, '');
INSERT INTO `cms_menu` VALUES ('38', '27', '2', 'query', '问答管理', '30', '/system/goods/query', '', '1', '', null, null, null);
INSERT INTO `cms_menu` VALUES ('39', '38', '0', 'query_view', '查看', '1', '/system/goods/query/view', null, '1', 'goods:query:view', null, null, null);
INSERT INTO `cms_menu` VALUES ('40', '38', '0', 'query_edit', '编辑', '2', '/system/goods/query/edit', null, '1', 'goods:query:edit', null, null, null);
INSERT INTO `cms_menu` VALUES ('41', '38', '0', 'query_delete', '删除', '3', '/system/goods/query/delete', null, '1', 'goods:query:delete', null, null, null);
INSERT INTO `cms_menu` VALUES ('42', '38', '0', 'query_add', '添加', '4', '/system/goods/query/add', null, '1', 'goods:query:add', null, null, null);
INSERT INTO `cms_menu` VALUES ('43', '1', '1', 'order', '交易管理', '500', '/system/order', 'money', '1', null, null, null, null);
INSERT INTO `cms_menu` VALUES ('44', '43', '2', 'list', '订单管理', '10', '/system/order/list', '', '1', '', null, null, null);
INSERT INTO `cms_menu` VALUES ('45', '44', '0', 'list_view', '查看', '1', '/system/order/list/view', null, '1', 'order:list:view', null, null, null);
INSERT INTO `cms_menu` VALUES ('46', '44', '0', 'list_edit', '编辑', '2', '/system/order/list/edit', null, '1', 'order:list:edit', null, null, null);
INSERT INTO `cms_menu` VALUES ('47', '44', '0', 'list_delete', '删除', '3', '/system/order/list/delete', null, '1', 'order:list:delete', null, null, null);
INSERT INTO `cms_menu` VALUES ('48', '44', '0', 'list_add', '添加', '4', '/system/order/list/add', null, '1', 'order:list:add', null, null, null);
INSERT INTO `cms_menu` VALUES ('49', '43', '2', 'info', '交易信息', '10', '/system/order/info', '', '0', '', null, null, null);
INSERT INTO `cms_menu` VALUES ('50', '49', '0', 'info_view', '查看', '1', '/system/order/info/view', null, '0', 'goods:info:view', null, null, null);
INSERT INTO `cms_menu` VALUES ('51', '43', '2', 'reviews', '评论管理', '10', '/system/order/reviews', '', '0', '', null, null, null);
INSERT INTO `cms_menu` VALUES ('52', '51', '0', 'reviews_view', '查看', '1', '/system/order/reviews/view', null, '0', 'goods:reviews:view', null, null, null);
INSERT INTO `cms_menu` VALUES ('53', '51', '0', 'reviews_edit', '编辑', '2', '/system/order/reviews/edit', null, '0', 'goods:reviews:edit', null, null, null);
INSERT INTO `cms_menu` VALUES ('54', '51', '0', 'reviews_delete', '删除', '3', '/system/order/reviews/delete', null, '0', 'goods:reviews:delete', null, null, null);
INSERT INTO `cms_menu` VALUES ('55', '51', '0', 'reviews_add', '添加', '4', '/system/order/reviews/add', null, '0', 'goods:reviews:add', null, null, null);
INSERT INTO `cms_menu` VALUES ('65', '1', '1', 'system', '系统管理', '700', '/system', 'universal-access', '1', null, null, null, '');
INSERT INTO `cms_menu` VALUES ('66', '65', '2', 'menu', '菜单管理', '10', '/system/menu/view', 'file-text', '1', '', null, null, '');
INSERT INTO `cms_menu` VALUES ('69', '3', '0', 'list_audit', '审查', '5', '/administrator/list/audit', '', '1', 'administrator:list:audit', null, null, '');
INSERT INTO `cms_menu` VALUES ('70', '17', '0', 'list_audit', '审查', '5', '/system/user/list/audit', null, '1', 'user:list:audit', null, null, null);
INSERT INTO `cms_menu` VALUES ('72', '28', '0', 'list_audit', '审查', '5', '/product/list/audit', null, '1', 'product:list:audit', null, null, null);
INSERT INTO `cms_menu` VALUES ('74', '66', '0', 'menu_view', '查看', '1', '/system/menu/view', null, '1', 'system:menu:view', null, null, null);
INSERT INTO `cms_menu` VALUES ('75', '66', '0', 'menu_edit', '编辑', '2', '/system/menu/edit', '', '1', 'system:menu:edit', null, null, '');
INSERT INTO `cms_menu` VALUES ('76', '66', '0', 'menu_delete', '删除', '3', '/system/menu/delete', null, '1', 'system:menu:delete', null, null, null);
INSERT INTO `cms_menu` VALUES ('77', '66', '0', 'menu_create', '添加', '4', '/system/menu/create', '', '1', 'system:menu:create', null, null, '');
INSERT INTO `cms_menu` VALUES ('78', '66', '0', 'menu_audit', '审查', '5', '/system/menu/audit', null, '1', 'system:menu:audit', null, null, null);
INSERT INTO `cms_menu` VALUES ('83', '11', '0', 'role_audit', '审查', '5', '/administrator/role/audit', '', '1', 'administrator:role:audit', null, null, '');
INSERT INTO `cms_menu` VALUES ('84', '65', '2', 'version', '版本日志', '20', '/system/version/view', 'file-text-o', '1', null, null, null, '系统版本日志');
INSERT INTO `cms_menu` VALUES ('85', '84', '0', 'version_view', '查看', '1', '/system/version/view', '', '1', 'system:version:view', null, null, '');
INSERT INTO `cms_menu` VALUES ('86', '2', '2', 'organization', '组织管理', '40', '/administrator/organization/view', 'coffee', '1', null, null, null, '组织管理');
INSERT INTO `cms_menu` VALUES ('87', '86', '0', 'organization_view', '查看', '1', '/administrator/organization/view', '', '1', 'administrator:organization:view', null, null, '');
INSERT INTO `cms_menu` VALUES ('88', '86', '0', 'organization_edit', '编辑', '2', '/administrator/organization/edit', '', '1', 'administrator:organization:edit', null, null, '');
INSERT INTO `cms_menu` VALUES ('89', '86', '0', 'organization_delete', '删除', '3', '/administrator/organization/delete', '', '1', 'administrator:organization:delete', null, null, '');
INSERT INTO `cms_menu` VALUES ('90', '86', '0', 'organization_audit', '审查', '5', '/administrator/organization/audit', '', '1', 'administrator:organization:audit', null, null, '');
INSERT INTO `cms_menu` VALUES ('91', '86', '0', 'organization_create', '添加', '4', '/administrator/organization/create', '', '1', 'administrator:organization:create', null, null, '');
INSERT INTO `cms_menu` VALUES ('93', '65', '2', 'swagger', 'Swagger', '30', '/swagger-ui.html', 'black-tie', '1', null, null, null, 'swagger API');
INSERT INTO `cms_menu` VALUES ('94', '1', '1', 'online', '内容管理', '600', 'online', 'bars', '1', null, null, null, '电子商城内容管理模块');
INSERT INTO `cms_menu` VALUES ('95', '94', '2', 'navigation', '导航管理', '10', '/online/navigation/view', 'line-chart', '1', null, null, null, '电子商城内容管理模块导航管理');
INSERT INTO `cms_menu` VALUES ('96', '95', '0', 'navigation_view', '查看', '1', '/online/navigation/view', '', '1', 'online:navigation:view', null, null, '');
INSERT INTO `cms_menu` VALUES ('97', '95', '0', 'navigation_edit', '编辑', '2', '/online/navigation/edit', '', '1', 'online:navigation:edit', null, null, '');
INSERT INTO `cms_menu` VALUES ('98', '95', '0', 'navigation_delete', '删除', '3', '/online/navigation/delete', '', '1', 'online:navigation:delete', null, null, '');
INSERT INTO `cms_menu` VALUES ('99', '95', '0', 'navigation_add', '添加', '4', '/online/navigation/create', '', '1', 'online:navigation:create', null, null, '');
INSERT INTO `cms_menu` VALUES ('100', '95', '0', 'navigation_audit', '审查', '5', '/online/navigation/audit', '', '1', 'online:navigation:audit', null, null, '');
INSERT INTO `cms_menu` VALUES ('101', '94', '2', 'advert', '广告管理', '20', '/online/advert/view', 'black-tie', '1', null, null, null, '');
INSERT INTO `cms_menu` VALUES ('102', '101', '0', 'advert_view', '查看', '1', '/online/advert/view', '', '1', 'online:advert:view', null, null, '');
INSERT INTO `cms_menu` VALUES ('103', '101', '0', 'advert_edit', '编辑', '2', '/online/advert/edit', '', '1', 'online:advert:edit', null, null, '');
INSERT INTO `cms_menu` VALUES ('104', '101', '0', 'advert_delete', '删除', '3', '/online/advert/delete', '', '1', 'online:advert:delete', null, null, '');
INSERT INTO `cms_menu` VALUES ('105', '101', '0', 'advert_add', '添加', '4', '/online/advert/create', '', '1', 'online:advert:create', null, null, '');
INSERT INTO `cms_menu` VALUES ('106', '101', '0', 'advert_audit', '审查', '5', '/online/advert/audit', '', '1', 'online:advert:audit', null, null, '');
INSERT INTO `cms_menu` VALUES ('107', '33', '0', 'category_audit', '审查', '5', '/product/category/audit', '', '1', 'product:category:audit', null, null, '');
INSERT INTO `cms_menu` VALUES ('108', '65', '2', 'druid', '数据监控', '40', '/druid', 'cc-jcb', '1', null, null, null, '');
INSERT INTO `cms_menu` VALUES ('109', '65', '2', 'log', '日志记录', '50', '/system/log/view', 'file-text', '1', '', null, null, '');
INSERT INTO `cms_menu` VALUES ('110', '109', '0', 'log_view', '查看', '1', '/system/log/view', '', '1', 'system:log:view', null, null, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='收获地址表';

-- ----------------------------
-- Records of os_address
-- ----------------------------
INSERT INTO `os_address` VALUES ('3', '1', '陈星星', '家', '18857105127', '海曙路58号', '111111', '2019-11-16 18:48:14', '2019-11-16 18:48:18');
INSERT INTO `os_address` VALUES ('25', '1', '陈星星', '学校', '18857105127', '杭州师范大学仓前校区', '123456', '2019-12-10 02:16:48', '2019-12-10 15:39:11');
INSERT INTO `os_address` VALUES ('26', '1', 'kjkjk', 'home', '11111111111', '我的天那那那', '444444', null, null);
INSERT INTO `os_address` VALUES ('27', '31', '司法', 'jia', '17853242597', '非机动车龙骑', '222111', null, null);
INSERT INTO `os_address` VALUES ('28', '32', '分众传媒', '家', '17853242555', '奇马上发财', '222333', null, null);
INSERT INTO `os_address` VALUES ('29', '29', '健康', '家', '17853242100', '山东省济南市', '200100', null, null);
INSERT INTO `os_address` VALUES ('30', '35', '胡雪珂', '学校', '17853242222', '山东省青岛市青岛大学', '256543', null, null);
INSERT INTO `os_address` VALUES ('31', '36', '小老虎', '家', '17853240000', '山东省滨州市博兴县', '256500', null, null);
INSERT INTO `os_address` VALUES ('32', '12', '陈星星', '学校', '17856432345', '山东省青岛市青岛大学', '256432', null, null);
INSERT INTO `os_address` VALUES ('33', '37', 'huxueke', '学校', '17853249111', '山东省青岛市青岛大学', '123456', null, null);
INSERT INTO `os_address` VALUES ('34', '37', '胡雪珂', '家', '17853241011', '山东省滨州市', '256506', null, null);
INSERT INTO `os_address` VALUES ('35', '34', '林林林', '家', '17853241111', '山东省滨州市', '256543', null, null);
INSERT INTO `os_address` VALUES ('36', '28', '陈星星', '学校', '17865432222', '山东省青岛市青岛大学', '256543', null, null);
INSERT INTO `os_address` VALUES ('37', '38', '小老虎', '学校', '17853241234', '山东省青岛市青岛大学师范学院', '123456', null, null);
INSERT INTO `os_address` VALUES ('39', '39', '第三方', 'def', '17853242107', '人的丰富vgdffgbf', '12923', null, null);
INSERT INTO `os_address` VALUES ('40', '33', 'dfssd', '都是', '17853242104', '的vfvfdvc地方', '220111', null, null);
INSERT INTO `os_address` VALUES ('42', '41', '小老虎', '学校', '17863255555', '山东省青岛市青岛大学', '254311', null, null);
INSERT INTO `os_address` VALUES ('43', '42', '马若宸', '学校', '17853242108', '山东省青岛市青岛大学', '200100', null, null);

-- ----------------------------
-- Table structure for os_category
-- ----------------------------
DROP TABLE IF EXISTS `os_category`;
CREATE TABLE `os_category` (
  `category_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父分类ID',
  `name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `type` tinyint(2) DEFAULT NULL COMMENT '目录类型 2=二级目录/1=一级目录/0=总目录',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `page_title` varchar(64) DEFAULT NULL COMMENT '页面标题',
  `page_description` varchar(64) DEFAULT NULL COMMENT '页面描述',
  `page_keyword` varchar(64) DEFAULT NULL COMMENT '页面关键词',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of os_category
-- ----------------------------
INSERT INTO `os_category` VALUES ('1', '0', '全部商品', null, '0', null, null, '全部商品', null, null, null);
INSERT INTO `os_category` VALUES ('2', '1', '全部手机', '100', '1', null, null, '手机', '小米手机,超乎你的想象,性能超级棒;小米手机,超乎你的想象,性能超级棒.', '小米手机,超乎你的想象,性能超级棒', '小米手机');
INSERT INTO `os_category` VALUES ('3', '1', '智能硬件', '200', '1', null, null, '智能硬件', null, null, '');
INSERT INTO `os_category` VALUES ('4', '1', '笔记本  平板', '300', '1', null, null, '笔记本/平板', null, null, null);
INSERT INTO `os_category` VALUES ('5', '1', '路由器  移动电源', '400', '1', null, null, '路由器/移动电源', null, null, null);
INSERT INTO `os_category` VALUES ('6', '1', '周边配件', '500', '1', null, null, '周边配件', null, null, null);
INSERT INTO `os_category` VALUES ('7', '1', '耳机  音响', '600', '1', null, null, '耳机/音响', null, null, null);
INSERT INTO `os_category` VALUES ('8', '1', '保护套  贴膜', '700', '1', null, null, '保护套/贴膜', null, null, null);
INSERT INTO `os_category` VALUES ('9', '1', '生活周边', '800', '1', null, null, '生活周边', null, null, null);
INSERT INTO `os_category` VALUES ('10', '3', '手环及配件', '10', '2', null, null, '手环及配件', '手环及配件', '手环及配件', '手环及配件');
INSERT INTO `os_category` VALUES ('11', '3', '智能灯', '20', '2', null, null, '智能健康', null, null, null);
INSERT INTO `os_category` VALUES ('12', '3', '智能家居', '30', '2', null, null, '智能家居', null, null, null);
INSERT INTO `os_category` VALUES ('13', '3', '智能健康', '40', '2', null, null, '智能出行', null, null, null);
INSERT INTO `os_category` VALUES ('15', '4', '笔记本电脑', '10', '2', null, null, '笔记本电脑', null, null, null);
INSERT INTO `os_category` VALUES ('16', '4', '平板电脑', '20', '2', null, null, '平板电脑', null, null, null);
INSERT INTO `os_category` VALUES ('17', '5', '路由器', '10', '2', null, null, '路由器', null, null, null);
INSERT INTO `os_category` VALUES ('18', '5', '移动电源', '20', '2', null, null, '移动电源', null, null, null);
INSERT INTO `os_category` VALUES ('19', '5', '路由器配件', '30', '2', null, null, '路由器配件', null, null, null);
INSERT INTO `os_category` VALUES ('20', '6', '插线板', '10', '2', null, null, '插线板', null, null, null);
INSERT INTO `os_category` VALUES ('21', '6', '存储卡', '20', '2', null, null, '存储卡', null, null, null);
INSERT INTO `os_category` VALUES ('22', '6', '移动硬盘', '30', '2', null, null, '移动硬盘', null, null, null);
INSERT INTO `os_category` VALUES ('23', '7', '头戴式耳机', '10', '2', null, null, '头戴式耳机', null, null, null);
INSERT INTO `os_category` VALUES ('24', '7', '活塞耳机', '20', '2', null, null, '活塞耳机', null, null, null);
INSERT INTO `os_category` VALUES ('25', '7', '蓝牙耳机', '30', '2', null, null, '蓝牙耳机', null, null, null);
INSERT INTO `os_category` VALUES ('26', '7', '音响', '40', '2', null, null, '音响', null, null, null);
INSERT INTO `os_category` VALUES ('27', '8', '贴膜', '10', '2', null, null, '贴膜', null, null, null);
INSERT INTO `os_category` VALUES ('28', '8', '保护套  保护壳', '20', '2', null, null, '保护套/保护壳', null, null, null);
INSERT INTO `os_category` VALUES ('29', '8', '移动电源保护套', '30', '2', null, null, '移动电源保护套', null, null, null);
INSERT INTO `os_category` VALUES ('30', '9', '箱包', '10', '2', null, null, '箱包', null, null, null);
INSERT INTO `os_category` VALUES ('31', '9', '服装', '20', '2', null, null, '服装', null, null, '');
INSERT INTO `os_category` VALUES ('32', '1', '智能家电', '900', '1', null, null, '智能家电', '智能家电', '智能家电', '智能家电');
INSERT INTO `os_category` VALUES ('33', '2', '小米手机', '5', '2', null, null, '小米手机', '小米手机', '小米手机', '小米手机');
INSERT INTO `os_category` VALUES ('34', '2', '手机', '6', null, null, null, '其他类型手机', null, null, null);

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
  `shipment_type` tinyint(2) DEFAULT '0' COMMENT '配送方式 0=快递配送（免运费），1=快递配送（运费）',
  `shipment_amount` decimal(10,0) DEFAULT '0' COMMENT '快递费',
  `invoice_type` tinyint(2) DEFAULT NULL COMMENT '支付方式 1=不开发票，2=电子发票，3=普通发票',
  `invoice_title` varchar(64) DEFAULT NULL COMMENT '发票抬头',
  `order_status` tinyint(2) DEFAULT NULL COMMENT '订单状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `order_amount` decimal(10,0) DEFAULT '0' COMMENT '订单金额',
  `order_score` int(11) DEFAULT '0' COMMENT '订单积分',
  `pay_amount` decimal(10,0) DEFAULT NULL COMMENT '支付金额 = 订单金额 + 快递费',
  `buy_number` int(11) DEFAULT NULL COMMENT '商品总数量',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of os_order
-- ----------------------------
INSERT INTO `os_order` VALUES ('1', '14907102171468493', '1', '1', '1', '1', '0', '1', null, '1', null, null, '24985', '25000', '24985', '15');
INSERT INTO `os_order` VALUES ('2', '14907103498114457', '1', '1', '1', '1', '0', '1', null, '3', null, null, '24985', '25000', '24985', '15');
INSERT INTO `os_order` VALUES ('3', '14907105253442098', '1', '1', '1', '1', '0', '1', null, '6', null, null, '24985', '25000', '24985', '15');
INSERT INTO `os_order` VALUES ('4', '14907114706600918', '1', '1', '1', '1', '0', '1', null, '12', null, null, '24985', '25000', '24985', '15');
INSERT INTO `os_order` VALUES ('5', '14944359894082287', '1', '1', '1', '1', '0', '1', null, '1', null, null, '14591', '14600', '14591', '9');
INSERT INTO `os_order` VALUES ('6', '14944360987092400', '1', '1', '1', '1', '0', '1', null, '1', null, null, '1599', '1600', '1599', '1');
INSERT INTO `os_order` VALUES ('7', '14944361196869580', '1', '1', '1', '1', '0', '1', null, '12', null, null, '1599', '1600', '1599', '1');
INSERT INTO `os_order` VALUES ('8', '14944369120266217', '1', '1', '1', '1', '0', '1', null, '12', null, null, '3198', '3200', '3198', '2');
INSERT INTO `os_order` VALUES ('9', '14944376560186831', '1', '1', '1', '1', '0', '1', null, '12', null, null, '1599', '1600', '1599', '1');
INSERT INTO `os_order` VALUES ('10', '14944390772967434', '1', '1', '1', '1', '0', '1', null, '1', null, null, '9843', '9848', '9843', '7');
INSERT INTO `os_order` VALUES ('11', '14944392556221620', '1', '1', '1', '1', '0', '1', null, '12', null, null, '1599', '1600', '1599', '1');
INSERT INTO `os_order` VALUES ('12', '14944739317304562', '1', '1', '3', '1', '0', '2', '陈星星', '1', null, null, '1828', '1829', '1828', '2');
INSERT INTO `os_order` VALUES ('13', '14944841433444157', '1', '1', '1', '1', '0', '1', null, '3', null, null, '5270', '5273', '5270', '5');
INSERT INTO `os_order` VALUES ('14', '14947730414380630', '1', '1', '1', '1', '0', '1', null, '1', null, null, '1599', '1600', '1599', '1');
INSERT INTO `os_order` VALUES ('18', '15025180252292837', '1', '1', '1', '1', '0', '1', '', '1', null, null, '1599', '0', '1599', '1');
INSERT INTO `os_order` VALUES ('19', '15025181769174369', '1', '1', '1', '1', '0', '1', '', '1', null, null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('20', '15025183123016651', '1', '1', '1', '1', '0', '1', '', '1', null, null, '1699', '0', '1699', '1');
INSERT INTO `os_order` VALUES ('21', '15025183964457327', '1', '1', '1', '1', '0', '1', '', '1', null, null, '1699', '0', '1699', '1');
INSERT INTO `os_order` VALUES ('22', '15025184390653472', '1', '1', '1', '1', '0', '1', '', '1', null, null, '1699', '0', '1699', '1');
INSERT INTO `os_order` VALUES ('23', '15025185087906518', '1', '1', '1', '1', '0', '1', '', '1', null, null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('24', '15025185287718511', '1', '1', '1', '1', '0', '1', '', '1', null, null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('25', '15025187148087712', '1', '1', '1', '1', '0', '1', '', '1', null, null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('26', '15025188773332167', '1', '1', '1', '1', '0', '1', '', '1', null, null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('27', '15025190011807402', '1', '1', '1', '1', '0', '1', '', '1', null, null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('29', '15025191375923310', '1', '1', '1', '1', '0', '1', '', '2', null, null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('30', '15025899883793633', '1', '1', '1', '1', '0', '1', '', '2', null, null, '1997', '0', '1997', '3');
INSERT INTO `os_order` VALUES ('31', '15026075571077021', '1', '1', '1', '1', '0', '1', '', '2', null, null, '1599', '0', '1599', '1');
INSERT INTO `os_order` VALUES ('32', '15730126373195607', '31', '1', '1', '1', '0', '1', '', '2', '2019-11-06 11:57:17', null, '1699', '0', '1699', '1');
INSERT INTO `os_order` VALUES ('33', '15730896722468932', '32', '1', '2', '1', '0', '1', '', '2', '2019-11-07 09:21:12', null, '1699', '0', '1699', '1');
INSERT INTO `os_order` VALUES ('34', '15730983058648554', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-07 11:45:05', null, '3347', '0', '3347', '3');
INSERT INTO `os_order` VALUES ('35', '15736241406095459', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 13:49:00', null, '4726', '0', '4726', '4');
INSERT INTO `os_order` VALUES ('36', '15736259042248219', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:24', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('37', '15736259078515602', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:27', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('38', '15736259167408679', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:36', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('39', '15736259193768133', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:39', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('40', '15736259196715970', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:39', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('41', '15736259197928971', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:39', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('42', '15736259201225898', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:40', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('43', '15736259202229039', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:40', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('44', '15736259205837719', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:40', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('45', '15736259206927880', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:40', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('46', '15736259316234322', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:51', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('47', '15736259332655299', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:53', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('48', '15736259341217106', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:54', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('49', '15736259349237108', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:54', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('50', '15736259351991027', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:55', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('51', '15736259353378605', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:55', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('52', '15736259355689316', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:55', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('53', '15736259358761889', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:55', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('54', '15736259359883735', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:55', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('55', '15736259362622095', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:56', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('56', '15736259364729008', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-13 14:18:56', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('57', '15736259762717024', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:19:36', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('58', '15736259774171313', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:19:37', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('59', '15736259777013523', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:19:37', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('60', '15736259778255437', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:19:37', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('61', '15736259780834677', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:19:38', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('62', '15736259896689105', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:19:49', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('63', '15736259902273130', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:19:50', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('64', '15736259903462044', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:19:50', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('65', '15736259906044321', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:19:50', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('66', '15736259907329772', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:19:50', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('67', '15736259909818648', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:19:50', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('68', '15736267095317568', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:49', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('69', '15736267119278781', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:51', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('70', '15736267122414873', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:52', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('71', '15736267123627217', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:52', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('72', '15736267126589090', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:52', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('73', '15736267127822035', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:52', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('74', '15736267131026826', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:53', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('75', '15736267132272517', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:53', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('76', '15736267135631667', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:53', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('77', '15736267136706391', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:53', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('78', '15736267168233205', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:56', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('79', '15736267171242408', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:57', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('80', '15736267172456507', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:57', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('81', '15736267175263704', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:57', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('82', '15736267176495939', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:57', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('83', '15736267180061011', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:58', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('84', '15736267181063291', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:58', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('85', '15736267184561934', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:58', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('86', '15736267185573563', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:58', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('87', '15736267189123316', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:58', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('88', '15736267190289214', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:59', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('89', '15736267192917593', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:59', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('90', '15736267195434901', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:59', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('91', '15736267197914057', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:31:59', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('92', '15736267201151066', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:00', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('93', '15736267202338280', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:00', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('94', '15736267204934024', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:00', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('95', '15736267208434152', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:00', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('96', '15736267209714423', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:00', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('97', '15736267213551163', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:01', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('98', '15736267214741193', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:01', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('99', '15736267217881535', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:01', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('100', '15736267221524894', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:02', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('101', '15736267222636812', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:02', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('102', '15736267226665057', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:02', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('103', '15736267227835555', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:02', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('104', '15736267231942776', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:03', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('105', '15736267233177156', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:03', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('106', '15736267237161018', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:03', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('107', '15736267238253824', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:03', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('108', '15736267242405639', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:04', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('109', '15736267243623692', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:04', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('110', '15736267247891513', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:04', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('111', '15736267249056588', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:04', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('112', '15736267252674116', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:05', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('113', '15736267253947271', '32', '1', '1', '1', '0', '1', '', '1', '2019-11-13 14:32:05', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('114', '15736267256739945', '32', '1', '1', '1', '0', '1', '', '4', '2019-11-13 14:32:05', null, '2028', '0', '2028', '2');
INSERT INTO `os_order` VALUES ('115', '15736278169622993', '32', '1', '1', '1', '0', '1', '', '3', '2019-11-13 14:50:16', null, '1828', '0', '1828', '2');
INSERT INTO `os_order` VALUES ('116', '15737020805297818', '32', '1', '1', '1', '0', '1', '', '4', '2019-11-14 11:28:00', null, '2698', '0', '2698', '2');
INSERT INTO `os_order` VALUES ('117', '15748537703619279', '32', '1', '1', '1', '0', '1', '', '3', '2019-11-27 19:22:50', null, '30008', '0', '30008', '4');
INSERT INTO `os_order` VALUES ('118', '15749389508199440', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-28 19:02:30', null, '6666', '0', '6666', '1');
INSERT INTO `os_order` VALUES ('119', '15750106772052973', '32', '1', '1', '1', '0', '1', '', '2', '2019-11-29 14:57:57', null, '16148', '0', '16148', '2');
INSERT INTO `os_order` VALUES ('120', '15750121528342434', '29', '1', '1', '1', '0', '1', '', '2', '2019-11-29 15:22:32', null, '20454', '0', '20454', '2');
INSERT INTO `os_order` VALUES ('121', '15760314733796993', '35', '1', '2', '1', '0', '3', '青岛大学', '2', '2019-12-11 10:31:13', null, '3598', '0', '3598', '2');
INSERT INTO `os_order` VALUES ('122', '15760315243851827', '35', '1', '1', '1', '0', '1', '青岛大学', '2', '2019-12-11 10:32:04', null, '3598', '0', '3598', '2');
INSERT INTO `os_order` VALUES ('123', '15760315679815392', '35', '1', '1', '1', '0', '1', '', '2', '2019-12-11 10:32:47', null, '3598', '0', '3598', '2');
INSERT INTO `os_order` VALUES ('124', '15760328612375914', '35', '1', '1', '1', '0', '1', '', '6', '2019-12-11 10:54:21', null, '295', '0', '295', '1');
INSERT INTO `os_order` VALUES ('125', '15760332022366683', '35', '1', '1', '1', '0', '2', '青岛大学', '2', '2019-12-11 11:00:02', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('126', '15760338168184545', '36', '1', '1', '1', '0', '1', '', '2', '2019-12-11 11:10:16', null, '179', '0', '179', '1');
INSERT INTO `os_order` VALUES ('127', '15764639463272681', '12', '1', '2', '1', '0', '1', '', '2', '2019-12-16 10:39:06', null, '1799', '0', '1799', '1');
INSERT INTO `os_order` VALUES ('128', '15764657827834893', '37', '1', '3', '1', '0', '1', '', '2', '2019-12-16 11:09:42', null, '557', '0', '557', '3');
INSERT INTO `os_order` VALUES ('129', '15764851539641079', '37', '1', '1', '1', '0', '3', '青岛大学', '2', '2019-12-16 16:32:33', null, '10709', '0', '10709', '3');
INSERT INTO `os_order` VALUES ('130', '15765493979792560', '34', '1', '3', '1', '0', '2', '青岛大学', '2', '2019-12-17 10:23:17', null, '1848', '0', '1848', '2');
INSERT INTO `os_order` VALUES ('131', '15766297348907035', '37', '1', '1', '1', '0', '1', '', '2', '2019-12-18 08:42:14', null, '2416', '0', '2416', '1');
INSERT INTO `os_order` VALUES ('132', '15766301414419142', '37', '1', '1', '1', '0', '1', '', '2', '2019-12-18 08:49:01', null, '169', '0', '169', '1');
INSERT INTO `os_order` VALUES ('133', '15766305667598505', '37', '1', '1', '1', '0', '1', '', '2', '2019-12-18 08:56:06', null, '169', '0', '169', '1');
INSERT INTO `os_order` VALUES ('134', '15766311589735680', '37', '1', '1', '1', '0', '1', '', '2', '2019-12-18 09:05:58', null, '149', '0', '149', '1');
INSERT INTO `os_order` VALUES ('135', '15766314553844971', '34', '1', '1', '1', '0', '2', '青岛大学', '2', '2019-12-18 09:10:52', null, '4376', '0', '4376', '2');
INSERT INTO `os_order` VALUES ('136', '15766584491103035', '35', '1', '1', '1', '0', '1', '', '2', '2019-12-18 16:40:49', null, '1599', '0', '1599', '1');
INSERT INTO `os_order` VALUES ('137', '15769198762109715', '37', '1', '1', '1', '0', '1', '', '2', '2019-12-21 17:17:56', null, '124', '0', '124', '1');
INSERT INTO `os_order` VALUES ('138', '15769208087077645', '28', '1', '3', '1', '0', '2', '青岛大学陈星星', '2', '2019-12-21 17:33:28', null, '4376', '0', '4376', '2');
INSERT INTO `os_order` VALUES ('139', '15769217810476925', '38', '1', '3', '1', '0', '3', '青岛大学', '2', '2019-12-21 17:49:41', null, '2018', '0', '2018', '2');
INSERT INTO `os_order` VALUES ('140', '15769223849988323', '38', '1', '1', '1', '0', '1', '', '2', '2019-12-21 17:59:44', null, '4974', '0', '4974', '1');
INSERT INTO `os_order` VALUES ('141', '15769226501997289', '38', '1', '1', '1', '0', '1', '', '5', '2019-12-21 18:04:10', null, '229', '0', '229', '1');
INSERT INTO `os_order` VALUES ('142', '15770956070421902', '38', '1', '1', '1', '0', '1', '', '2', '2019-12-23 18:06:47', null, '1699', '0', '1699', '1');
INSERT INTO `os_order` VALUES ('143', '15772373689266074', '38', '1', '1', '1', '0', '1', '', '3', '2019-12-25 09:29:28', null, '295', '0', '295', '1');
INSERT INTO `os_order` VALUES ('144', '15772431225124077', '38', '1', '1', '1', '0', '1', '', '2', '2019-12-25 11:05:22', null, '149', '0', '149', '1');
INSERT INTO `os_order` VALUES ('145', '15772452120791640', '39', '1', '1', '1', '0', '1', '', '2', '2019-12-25 11:40:12', null, '3000', '0', '3000', '1');
INSERT INTO `os_order` VALUES ('146', '15772593221568690', '29', '1', '1', '1', '0', '1', '', '6', '2019-12-25 15:35:22', null, '2877', '0', '2877', '3');
INSERT INTO `os_order` VALUES ('147', '15772613682503509', '32', '1', '1', '1', '0', '1', '', '6', '2019-12-25 16:09:28', null, '20198', '0', '20198', '2');
INSERT INTO `os_order` VALUES ('148', '15772618406164994', '29', '1', '1', '1', '0', '1', '', '6', '2019-12-25 16:17:20', null, '249', '0', '249', '1');
INSERT INTO `os_order` VALUES ('149', '15773525724722746', '33', '1', '1', '1', '0', '1', '', '2', '2019-12-26 17:29:32', null, '3900', '0', '3900', '1');
INSERT INTO `os_order` VALUES ('150', '15773526292992576', '33', '1', '1', '1', '0', '1', '', '2', '2019-12-26 17:30:29', null, '7899', '0', '7899', '2');
INSERT INTO `os_order` VALUES ('151', '15774445153348199', '33', '1', '1', '1', '0', '1', '', '5', '2019-12-27 19:01:55', null, '3999', '0', '3999', '1');
INSERT INTO `os_order` VALUES ('152', '15774448844699767', '33', '1', '1', '1', '0', '1', '', '3', '2019-12-27 19:08:04', null, '11997', '0', '11997', '3');
INSERT INTO `os_order` VALUES ('153', '15774457772816538', '33', '1', '1', '1', '0', '1', '', '6', '2019-12-27 19:22:57', null, '249', '0', '249', '1');
INSERT INTO `os_order` VALUES ('154', '15776455897416378', '33', '1', '1', '1', '0', '1', '', '2', '2019-12-30 02:53:09', null, '3198', '0', '3198', '2');
INSERT INTO `os_order` VALUES ('155', '15776558592933918', '33', '1', '1', '1', '0', '1', '', '2', '2019-12-30 05:44:19', null, '2000', '0', '2000', '2');
INSERT INTO `os_order` VALUES ('156', '15776558691956626', '33', '1', '1', '1', '0', '1', '', '2', '2019-12-30 05:44:29', null, '2000', '0', '2000', '2');
INSERT INTO `os_order` VALUES ('157', '15776565134393336', '33', '1', '1', '1', '0', '1', '', '2', '2019-12-30 05:55:13', null, '2000', '0', '2000', '2');
INSERT INTO `os_order` VALUES ('158', '15776566762054514', '33', '1', '1', '1', '0', '1', '', '2', '2019-12-30 05:57:56', null, '2000', '0', '2000', '2');
INSERT INTO `os_order` VALUES ('159', '15776570939472261', '33', '1', '1', '1', '0', '1', '', '5', '2019-12-30 06:04:53', null, '2000', '0', '2000', '2');
INSERT INTO `os_order` VALUES ('162', '15777015710757702', '35', '1', '1', '1', '0', '1', '', '5', '2019-12-30 18:26:11', null, '2798', '0', '2798', '2');
INSERT INTO `os_order` VALUES ('163', '15777035072454869', '42', '1', '1', '1', '0', '1', '', '5', '2019-12-30 18:58:27', null, '3000', '0', '3000', '2');
INSERT INTO `os_order` VALUES ('164', '15777035635489948', '42', '1', '1', '1', '0', '1', '', '6', '2019-12-30 18:59:23', null, '249', '0', '249', '1');
INSERT INTO `os_order` VALUES ('165', '15777036374751227', '42', '1', '1', '1', '0', '1', '', '2', '2019-12-30 19:00:37', null, '1300', '0', '1300', '1');

-- ----------------------------
-- Table structure for os_order_product
-- ----------------------------
DROP TABLE IF EXISTS `os_order_product`;
CREATE TABLE `os_order_product` (
  `order_product_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单商品ID',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '订单ID',
  `product_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品编号',
  `name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `product_spec_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品规格编号',
  `product_spec_name` varchar(64) DEFAULT NULL COMMENT '商品规格名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `score` int(11) DEFAULT NULL COMMENT '积分',
  `buy_number` int(11) DEFAULT NULL COMMENT '商品总数量',
  `product_score` int(11) DEFAULT NULL COMMENT '商品总积分',
  `product_amount` decimal(10,0) DEFAULT NULL COMMENT '商品总金额',
  `comment_status` tinyint(2) DEFAULT '0' COMMENT '评论状态 0=未评论，1=已评论',
  `seller_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='订单明细表';

-- ----------------------------
-- Records of os_order_product
-- ----------------------------
INSERT INTO `os_order_product` VALUES ('1', '1', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '9', '14400', '14391', '0', '1');
INSERT INTO `os_order_product` VALUES ('2', '1', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207483', '白色 64G ', '1799.00', '1800', '5', '9000', '8995', '0', '1');
INSERT INTO `os_order_product` VALUES ('3', '1', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207484', '金色 16G ', '1599.00', '1600', '1', '1600', '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('4', '2', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '9', '14400', '14391', '0', '1');
INSERT INTO `os_order_product` VALUES ('5', '2', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207483', '白色 64G ', '1799.00', '1800', '5', '9000', '8995', '0', '1');
INSERT INTO `os_order_product` VALUES ('6', '2', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207484', '金色 16G ', '1599.00', '1600', '1', '1600', '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('7', '3', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '9', '14400', '14391', '0', '1');
INSERT INTO `os_order_product` VALUES ('8', '3', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207483', '白色 64G ', '1799.00', '1800', '5', '9000', '8995', '0', '1');
INSERT INTO `os_order_product` VALUES ('9', '3', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207484', '金色 16G ', '1599.00', '1600', '1', '1600', '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('10', '4', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '9', '14400', '14391', '0', '1');
INSERT INTO `os_order_product` VALUES ('11', '4', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207483', '白色 64G ', '1799.00', '1800', '5', '9000', '8995', '0', '1');
INSERT INTO `os_order_product` VALUES ('12', '5', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '8', '12800', '12792', '0', '1');
INSERT INTO `os_order_product` VALUES ('13', '5', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207483', '白色 64G ', '1799.00', '1800', '1', '1800', '1799', '0', '1');
INSERT INTO `os_order_product` VALUES ('14', '6', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '1', '1600', '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('15', '7', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '1', '1600', '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('16', '8', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '2', '3200', '3198', '0', '1');
INSERT INTO `os_order_product` VALUES ('17', '9', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '1', '1600', '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('18', '10', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '2', '3200', '3198', '0', '1');
INSERT INTO `os_order_product` VALUES ('19', '10', '1472581245880', '小米MIX', 'images/goods/20170226/1471798364441.jpg', '14725812458801', ' ', '1799.00', '1800', '3', '5400', '5397', '0', '1');
INSERT INTO `os_order_product` VALUES ('20', '10', '1472581300305', '魅蓝 Note5', 'images/goods/20170226/1471798388806.jpg', '1472581300305', ' ', '1099.00', '1099', '1', '1099', '1099', '0', '2');
INSERT INTO `os_order_product` VALUES ('21', '10', '1472583774201', '小米手环 2', 'images/goods/20170226/1471798568000.jpg', '1472583774201', ' ', '149.00', '149', '1', '149', '149', '0', '1');
INSERT INTO `os_order_product` VALUES ('22', '11', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '1', '1600', '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('23', '12', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '1', '1600', '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('24', '12', '1472583831117', '魅族手环', 'images/goods/20170226/1471798587971.jpg', '1472583831117', ' ', '229.00', '229', '1', '229', '229', '0', '2');
INSERT INTO `os_order_product` VALUES ('25', '13', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '2', '3200', '3198', '0', '1');
INSERT INTO `os_order_product` VALUES ('26', '13', '1472581245880', '小米MIX', 'images/goods/20170226/1471798364441.jpg', '14725812458801', ' ', '1799.00', '1800', '1', '1800', '1799', '0', '1');
INSERT INTO `os_order_product` VALUES ('27', '13', '1472583774201', '小米手环 2', 'images/goods/20170226/1471798568000.jpg', '1472583774201', ' ', '149.00', '149', '1', '149', '149', '0', '1');
INSERT INTO `os_order_product` VALUES ('28', '13', '1475353918562', '测试商品名称4', 'images/goods/20170226/1471797894441.jpg', '1475353918562', ' ', '124.00', '124', '1', '124', '124', '0', '3');
INSERT INTO `os_order_product` VALUES ('29', '14', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '1', '1600', '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('33', '18', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G', '1599.00', null, '1', null, '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('34', '19', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207483', '白色 64G', '1799.00', null, '1', null, '1799', '0', '1');
INSERT INTO `os_order_product` VALUES ('35', '20', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207482', '白色 32G', '1699.00', null, '1', null, '1699', '0', '1');
INSERT INTO `os_order_product` VALUES ('36', '21', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207482', '白色 32G', '1699.00', null, '1', null, '1699', '0', '1');
INSERT INTO `os_order_product` VALUES ('37', '22', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207482', '白色 32G', '1699.00', null, '1', null, '1699', '0', '1');
INSERT INTO `os_order_product` VALUES ('38', '26', '1472581245880', '小米MIX', 'images/goods/20170226/1471798364441.jpg', '14725812458801', '', '1799.00', null, '1', null, '1799', '0', '1');
INSERT INTO `os_order_product` VALUES ('39', '27', '1472581245880', '小米MIX', 'images/goods/20170226/1471798364441.jpg', '14725812458801', '', '1799.00', null, '1', null, '1799', '0', '1');
INSERT INTO `os_order_product` VALUES ('42', '29', '1472581245880', '小米MIX', 'images/goods/20170226/1471798364441.jpg', '14725812458801', '', '1799.00', null, '1', null, '1799', '0', '1');
INSERT INTO `os_order_product` VALUES ('43', '30', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207486', '金色 64G', '1799.00', null, '1', null, '1799', '0', '1');
INSERT INTO `os_order_product` VALUES ('44', '30', '1473318741286', 'Yeelight LED智能灯泡', 'images/goods/20170226/1471798581451.jpg', '1473318741286', '', '99.00', null, '2', null, '198', '0', '3');
INSERT INTO `os_order_product` VALUES ('45', '31', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G', '1599.00', null, '1', null, '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('46', '32', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207485', '金色 32G', '1699.00', null, '1', null, '1699', '0', '1');
INSERT INTO `os_order_product` VALUES ('47', '33', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207482', '白色 32G', '1699.00', null, '1', null, '1699', '0', '1');
INSERT INTO `os_order_product` VALUES ('48', '34', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G', '1599.00', null, '2', null, '3198', '0', '1');
INSERT INTO `os_order_product` VALUES ('49', '34', '1472583774201', '小米手环 2', 'images/goods/20170226/1471798568000.jpg', '1472583774201', '', '149.00', null, '1', null, '149', '0', '1');
INSERT INTO `os_order_product` VALUES ('50', '35', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207482', '白色 32G', '1699.00', null, '2', null, '3398', '0', '1');
INSERT INTO `os_order_product` VALUES ('51', '35', '1472581300305', '魅蓝 Note5', 'images/goods/20170226/1471798388806.jpg', '1472581300305', '', '1099.00', null, '1', null, '1099', '0', '2');
INSERT INTO `os_order_product` VALUES ('52', '35', '1472583831117', '魅族手环', 'images/goods/20170226/1471798587971.jpg', '1472583831117', '', '229.00', null, '1', null, '229', '0', '5');
INSERT INTO `os_order_product` VALUES ('53', '115', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G', '1599.00', null, '1', null, '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('54', '115', '1472583831117', '魅族手环', 'images/goods/20170226/1471798587971.jpg', '1472583831117', '', '229.00', null, '1', null, '229', '0', '2');
INSERT INTO `os_order_product` VALUES ('55', '116', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G', '1599.00', null, '1', null, '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('56', '116', '1472581300305', '魅蓝 Note5', 'images/goods/20170226/1471798388806.jpg', '1472581300305', '', '1099.00', null, '1', null, '1099', '0', '2');
INSERT INTO `os_order_product` VALUES ('57', '117', '1478611468679', '华为手机mate30', 'images/goods/20170226/002.jpg', '1478611468679', '', '4455.00', null, '1', null, '4455', '0', '4');
INSERT INTO `os_order_product` VALUES ('58', '117', '15748435098902409', 'Macbook Pro', 'images/goods/20170226/001.jpg', '1574843509890', '', '8888.00', null, '1', null, '8888', '0', '2');
INSERT INTO `os_order_product` VALUES ('59', '117', '1478689468673', 'Macbook Pro', 'images/goods/20170226/001.jpg', '1478689468673', '', '6666.00', null, '1', null, '6666', '0', '4');
INSERT INTO `os_order_product` VALUES ('60', '117', '1478682268679', 'Macbook Pro', 'images/goods/20170226/004.jpg', '1478682268679', '', '9999.00', null, '1', null, '9999', '0', '1');
INSERT INTO `os_order_product` VALUES ('61', '118', '9183118414334', '小米9', 'images/goods/20170226/003.jpg', '91831184143341', '蓝色 128G', '6666.00', null, '1', null, '6666', '0', '5');
INSERT INTO `os_order_product` VALUES ('62', '119', '9194869856711', 'Galaxy Fold SM-F9000', 'images/goods/20170226/005.jpg', '91948698567111', '金色 64G', '15999.00', null, '1', null, '15999', '0', '4');
INSERT INTO `os_order_product` VALUES ('63', '119', '1472583774201', '小米手环 2', 'images/goods/20170226/1471798568000.jpg', '1472583774201', '', '149.00', null, '1', null, '149', '0', '1');
INSERT INTO `os_order_product` VALUES ('64', '120', '9194869856711', 'Galaxy Fold SM-F9000', 'images/goods/20170226/005.jpg', '91948698567111', '金色 64G', '15999.00', null, '1', null, '15999', '0', '4');
INSERT INTO `os_order_product` VALUES ('65', '120', '1903333197673', '三星SM-W2018', 'images/goods/20170226/008.jpg', '19033331976731', '金色 16G', '4455.00', null, '1', null, '4455', '0', '5');
INSERT INTO `os_order_product` VALUES ('66', '121', '1472581245880', '小米MIX', 'images/goods/201901/1471798364441.jpg', '1472581245880', '', '1799.00', null, '2', null, '3598', '0', '1');
INSERT INTO `os_order_product` VALUES ('67', '122', '1472581245880', '小米MIX', 'images/goods/201901/1471798364441.jpg', '1472581245880', '', '1799.00', null, '2', null, '3598', '0', '1');
INSERT INTO `os_order_product` VALUES ('68', '123', '1472581245880', '小米MIX', 'images/goods/201901/1471798364441.jpg', '1472581245880', '', '1799.00', null, '2', null, '3598', '0', '1');
INSERT INTO `os_order_product` VALUES ('69', '124', '1478682831935', 'Golden Field/M16电脑音响', 'images/goods/201901/045.jpg', '1478682831935', '', '295.00', null, '1', null, '295', '0', '6');
INSERT INTO `os_order_product` VALUES ('70', '125', '1472581220748', '小米手机5', 'images/goods/201901/1471798318820.png', '14725812207483', '白色 64G', '1799.00', null, '1', null, '1799', '0', '1');
INSERT INTO `os_order_product` VALUES ('71', '126', '1478527872182', 'WD/西数移动硬盘', 'images/goods/201901/041.jpg', '1478527872182', '', '179.00', null, '1', null, '179', '0', '7');
INSERT INTO `os_order_product` VALUES ('72', '127', '1472581220748', '小米手机5', 'images/goods/201901/1471798318820.png', '14725812207483', '白色 64G', '1799.00', null, '1', null, '1799', '0', '1');
INSERT INTO `os_order_product` VALUES ('73', '128', '1478683468279', '双肩包男士', 'images/goods/201901/051.jpg', '1478683468279', '', '259.00', null, '1', null, '259', '0', '7');
INSERT INTO `os_order_product` VALUES ('74', '128', '1472583774201', '小米手环 2', 'images/goods/201901/1471798568000.jpg', '1472583774201', '', '149.00', null, '2', null, '298', '0', '1');
INSERT INTO `os_order_product` VALUES ('75', '129', '1472581220748', '小米手机5', 'images/goods/201901/1471798318820.png', '14725812207483', '白色 64G', '1799.00', null, '1', null, '1799', '0', '1');
INSERT INTO `os_order_product` VALUES ('76', '129', '2290649693816', '华为', 'images/goods/201901/004.jpg', '14786114686791', '白色 32G', '4455.00', null, '2', null, '8910', '0', '7');
INSERT INTO `os_order_product` VALUES ('77', '130', '1472581220748', '小米手机5', 'images/goods/201901/1471798318820.png', '14725812207482', '白色 32G', '1699.00', null, '1', null, '1699', '0', '1');
INSERT INTO `os_order_product` VALUES ('78', '130', '1472583774201', '小米手环 2', 'images/goods/201901/1471798568000.jpg', '1472583774201', '', '149.00', null, '1', null, '149', '0', '1');
INSERT INTO `os_order_product` VALUES ('79', '131', '1478682438293', '万魔活塞耳机', 'images/goods/201901/043.jpg', '1478682438293', '', '2416.00', null, '1', null, '2416', '0', '2');
INSERT INTO `os_order_product` VALUES ('80', '132', '1472628630086', 'LED 智能台灯', 'images/goods/201901/1471798587451.jpg', '1472628630086', '', '169.00', null, '1', null, '169', '0', '3');
INSERT INTO `os_order_product` VALUES ('81', '133', '1472628630086', 'LED 智能台灯', 'images/goods/201901/1471798587451.jpg', '1472628630086', '', '169.00', null, '1', null, '169', '0', '3');
INSERT INTO `os_order_product` VALUES ('82', '134', '1472583774201', '小米手环 2', 'images/goods/201901/1471798568000.jpg', '1472583774201', '', '149.00', null, '1', null, '149', '0', '1');
INSERT INTO `os_order_product` VALUES ('83', '135', '1477472951669', '荣耀路由器', 'images/goods/201901/038.jpg', '1477472951669', '', '2188.00', null, '2', null, '4376', '0', '3');
INSERT INTO `os_order_product` VALUES ('84', '136', '1472581220748', '小米手机5', 'images/goods/201901/1471798318820.png', '14725812207481', '白色 16G', '1599.00', null, '1', null, '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('85', '137', '1475353918562', '戴尔笔记本', 'images/goods/201901/033.jpg', '1475353918562', '', '124.00', null, '1', null, '124', '0', '5');
INSERT INTO `os_order_product` VALUES ('86', '138', '1477472951669', '荣耀路由器', 'images/goods/201901/038.jpg', '1477472951669', '', '2188.00', null, '2', null, '4376', '0', '7');
INSERT INTO `os_order_product` VALUES ('87', '139', '1475407186147', '戴尔酷睿', 'images/goods/201901/035.jpg', '1475407186147', '', '219.00', null, '1', null, '219', '0', '8');
INSERT INTO `os_order_product` VALUES ('88', '139', '1472581220748', '小米手机5', 'images/goods/201901/1471798318820.png', '14725812207486', '金色 64G', '1799.00', null, '1', null, '1799', '0', '1');
INSERT INTO `os_order_product` VALUES ('89', '140', '1478683468241', '行李箱拉杆箱', 'images/goods/201901/049.jpg', '1478683468241', '', '4974.00', null, '1', null, '4974', '0', '4');
INSERT INTO `os_order_product` VALUES ('90', '141', '1472583831117', '魅族手环', 'images/goods/201901/1471798587971.jpg', '1472583831117', '', '229.00', null, '1', null, '229', '0', '2');
INSERT INTO `os_order_product` VALUES ('91', '142', '1472581220748', '小米手机5', 'images/goods/201901/1471798318820.png', '14725812207482', '白色 32G', '1699.00', null, '1', null, '1699', '0', '1');
INSERT INTO `os_order_product` VALUES ('92', '143', '1478682831935', 'Golden Field/M16电脑音响', 'images/goods/201901/045.jpg', '1478682831935', '', '295.00', null, '1', null, '295', '0', '2');
INSERT INTO `os_order_product` VALUES ('93', '144', '1472583774201', '小米手环 2', 'images/goods/201901/1471798568000.jpg', '1472583774201', '', '149.00', null, '1', null, '149', '0', '1');
INSERT INTO `os_order_product` VALUES ('94', '145', '2887655072582', '小米0', 'images/goods/201901/002.jpg', '28876550725824', '金色 128G', '3000.00', null, '1', null, '3000', '0', '7');
INSERT INTO `os_order_product` VALUES ('95', '146', '1472581300305', '魅蓝 Note5', 'images/goods/201901/1471798388806.jpg', '1472581300305', '', '1099.00', null, '1', null, '1099', '0', '2');
INSERT INTO `os_order_product` VALUES ('96', '146', '1478527872182', 'WD/西数移动硬盘', 'images/goods/201901/041.jpg', '1478527872182', '', '179.00', null, '1', null, '179', '0', null);
INSERT INTO `os_order_product` VALUES ('97', '146', '1472581220748', '小米手机5', 'images/goods/201901/1471798318820.png', '14725812207481', '白色 16G', '1599.00', null, '1', null, '1599', '0', '1');
INSERT INTO `os_order_product` VALUES ('98', '147', '7419884025588', '华为nova5', 'images/goods/201901/003.jpg', '21700737872371', '白色 16G', '10099.00', null, '2', null, '20198', '0', '8');
INSERT INTO `os_order_product` VALUES ('99', '148', '1475354006972', '游戏本笔记本', 'images/goods/201901/034.jpg', '1475354006972', '', '249.00', null, '1', null, '249', '0', null);
INSERT INTO `os_order_product` VALUES ('100', '149', '4122353663354', '小米plus', 'images/goods/201901/003.jpg', '41223536633541', '黑色 128G', '3900.00', null, '1', null, '3900', '0', '7');
INSERT INTO `os_order_product` VALUES ('101', '150', '4122353663354', '小米plus', 'images/goods/201901/003.jpg', '41223536633541', '黑色 128G', '3900.00', null, '1', null, '3900', '0', '7');
INSERT INTO `os_order_product` VALUES ('102', '150', '88083451393', '华为nova5', 'images/goods/201901/005.jpg', '76503100572861', '白色 64G', '3999.00', null, '1', null, '3999', '0', '7');
INSERT INTO `os_order_product` VALUES ('103', '151', '8932741868166', '小米', 'images/goods/201901/005.jpg', '89327418681664', '白色 256G', '3999.00', null, '1', null, '3999', '0', '8');
INSERT INTO `os_order_product` VALUES ('104', '152', '8932741868166', '小米', 'images/goods/201901/005.jpg', '89327418681664', '白色 256G', '3999.00', null, '3', null, '11997', '0', '8');
INSERT INTO `os_order_product` VALUES ('105', '153', '1472736931796', 'Yeelight床头灯', 'images/goods/201901/1471799887971.jpg', '1472736931796', '', '249.00', null, '1', null, '249', '0', '3');
INSERT INTO `os_order_product` VALUES ('106', '154', '1472581220748', '小米手机5', 'images/goods/201901/1471798318820.png', '14725812207481', '白色 16G', '1599.00', null, '2', null, '3198', '0', '1');
INSERT INTO `os_order_product` VALUES ('107', '159', '8069207060956', '三星SM-W2018', 'images/goods/201901/008.jpg', '80692070609563', '白色 16G', '1000.00', null, '2', null, '2000', '0', '11');
INSERT INTO `os_order_product` VALUES ('110', '162', '1472581300305', '魅蓝 Note5', 'images/goods/201901/1471798388806.jpg', '1472581300305', '金色 16G', '1099.00', null, '1', null, '1099', '0', '2');
INSERT INTO `os_order_product` VALUES ('111', '162', '1472581220748', '小米手机5', 'images/goods/201901/1471798318820.png', '14725812207482', '白色 32G', '1699.00', null, '1', null, '1699', '0', '1');
INSERT INTO `os_order_product` VALUES ('112', '163', '1376307045991', '商务智能手机', 'images/goods/201901/006.jpg', '13763070459911', '黑色 16G', '1500.00', null, '2', null, '3000', '0', '11');
INSERT INTO `os_order_product` VALUES ('113', '164', '1475354006972', '游戏本笔记本', 'images/goods/201901/034.jpg', '1475354006972', '', '249.00', null, '1', null, '249', '0', '1');
INSERT INTO `os_order_product` VALUES ('114', '165', '1478522533460', '闪迪sd卡', 'images/goods/201901/040.jpg', '1478522533460', '', '1300.00', null, '1', null, '1300', '0', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='订单配送表';

-- ----------------------------
-- Records of os_order_shipment
-- ----------------------------
INSERT INTO `os_order_shipment` VALUES ('1', '1', '陈星星', '18857105127', '发烧发到斯蒂芬斯蒂芬', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('2', '2', '陈星星', '18857105127', '发烧发到斯蒂芬斯蒂芬', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('3', '3', '陈星星', '18857105127', '发烧发到斯蒂芬斯蒂芬', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('4', '4', '陈星星', '18857105127', '发烧发到斯蒂芬斯蒂芬', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('5', '5', '陈星星', '18857105127', '海曙路58号', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('6', '6', '陈星星', '18857105127', '大撒旦3d大苏打', '321231', null);
INSERT INTO `os_order_shipment` VALUES ('7', '7', '陈星星', '18857105127', '海曙路58号', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('8', '8', '陈星星', '18857105127', '海曙路58号', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('9', '9', '陈星星', '18857105127', '海曙路58号', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('10', '10', '陈星星', '18857105127', '海曙路58号', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('11', '11', '陈星星', '18857105127', '海曙路58号', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('12', '12', '陈星星陈星星', '18857105127', '海曙路58号', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('13', '13', '陈星星', '18857105127', '大撒旦3d大苏打', '321231', null);
INSERT INTO `os_order_shipment` VALUES ('14', '14', '陈星星', '18857105127', '大撒旦3d大苏打', '321231', null);
INSERT INTO `os_order_shipment` VALUES ('18', '18', '陈星星', '18857105127', '大撒旦3d大苏打', '321231', null);
INSERT INTO `os_order_shipment` VALUES ('19', '19', '陈星星', '18857105127', '杭州师范大学仓前校区', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('20', '20', '陈星星', '18857105127', '杭州师范大学仓前校区', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('21', '21', '陈星星', '18857105127', '大撒旦3d大苏打', '321231', null);
INSERT INTO `os_order_shipment` VALUES ('22', '22', '陈星星', '18857105127', '杭州师范大学仓前校区', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('23', '26', '陈星星', '18857105127', '杭州师范大学仓前校区', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('24', '27', '陈星星', '18857105127', '杭州师范大学仓前校区', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('26', '29', '陈星星', '18857105127', '杭州师范大学仓前校区', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('27', '30', '陈星星', '18857105127', '杭州师范大学仓前校区', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('28', '31', '陈星星', '18857105127', '杭州师范大学仓前校区', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('29', '32', '司法', '17853242597', '非机动车龙骑', '222111', null);
INSERT INTO `os_order_shipment` VALUES ('30', '33', '分众传媒', '17853242555', '奇马上发财', '222201', null);
INSERT INTO `os_order_shipment` VALUES ('31', '34', '分众传媒', '17853242555', '奇马上发财', '222333', null);
INSERT INTO `os_order_shipment` VALUES ('32', '35', '分众传媒', '17853242555', '奇马上发财', '222333', null);
INSERT INTO `os_order_shipment` VALUES ('33', '115', '分众传媒', '17853242555', '奇马上发财', '222333', null);
INSERT INTO `os_order_shipment` VALUES ('34', '116', '分众传媒', '17853242555', '奇马上发财', '222333', null);
INSERT INTO `os_order_shipment` VALUES ('35', '117', '分众传媒', '17853242555', '奇马上发财', '222333', null);
INSERT INTO `os_order_shipment` VALUES ('36', '118', '分众传媒', '17853242555', '奇马上发财', '222333', null);
INSERT INTO `os_order_shipment` VALUES ('37', '119', '分众传媒', '17853242555', '奇马上发财', '222333', null);
INSERT INTO `os_order_shipment` VALUES ('38', '120', '健康', '17853242100', '山东省济南市', '200100', null);
INSERT INTO `os_order_shipment` VALUES ('39', '121', '胡雪珂', '17853241111', '山东省青岛市青岛大学', '256543', null);
INSERT INTO `os_order_shipment` VALUES ('40', '122', '胡雪珂', '17853241111', '山东省青岛市青岛大学', '256543', null);
INSERT INTO `os_order_shipment` VALUES ('41', '123', '胡雪珂', '17853241111', '山东省青岛市青岛大学', '256543', null);
INSERT INTO `os_order_shipment` VALUES ('42', '124', '胡雪珂', '17853241111', '山东省青岛市青岛大学', '256543', null);
INSERT INTO `os_order_shipment` VALUES ('43', '125', '胡雪珂', '17853241111', '山东省青岛市青岛大学', '256543', null);
INSERT INTO `os_order_shipment` VALUES ('44', '126', '小老虎', '17853240000', '山东省滨州市博兴县', '256500', null);
INSERT INTO `os_order_shipment` VALUES ('45', '127', '陈星星', '17856432345', '山东省青岛市青岛大学', '256432', null);
INSERT INTO `os_order_shipment` VALUES ('46', '128', 'huxueke', '17853249111', '山东省青岛市青岛大学', '256544', null);
INSERT INTO `os_order_shipment` VALUES ('47', '129', 'huxueke', '17853249111', '山东省青岛市青岛大学', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('48', '130', '林林林', '17853241111', '山东省滨州市', '256543', null);
INSERT INTO `os_order_shipment` VALUES ('49', '131', '胡雪珂', '17853241011', '山东省滨州市', '256506', null);
INSERT INTO `os_order_shipment` VALUES ('50', '132', '胡雪珂', '17853241011', '山东省滨州市', '256506', null);
INSERT INTO `os_order_shipment` VALUES ('51', '133', '胡雪珂', '17853241011', '山东省滨州市', '256506', null);
INSERT INTO `os_order_shipment` VALUES ('52', '134', '胡雪珂', '17853241011', '山东省滨州市', '256506', null);
INSERT INTO `os_order_shipment` VALUES ('53', '135', '林林林', '17853241111', '山东省滨州市', '256543', null);
INSERT INTO `os_order_shipment` VALUES ('54', '136', '胡雪珂', '17853241111', '山东省青岛市青岛大学', '256543', null);
INSERT INTO `os_order_shipment` VALUES ('55', '137', '胡雪珂', '17853241011', '山东省滨州市', '256506', null);
INSERT INTO `os_order_shipment` VALUES ('56', '138', '陈星星', '17865432222', '山东省青岛市青岛大学', '256543', null);
INSERT INTO `os_order_shipment` VALUES ('57', '139', '小老虎', '17853241234', '山东省青岛市青岛大学', '256506', null);
INSERT INTO `os_order_shipment` VALUES ('58', '140', '小老虎', '17853241234', '山东省青岛市青岛大学', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('59', '141', '小老虎', '17853241234', '山东省青岛市青岛大学', '256545', null);
INSERT INTO `os_order_shipment` VALUES ('60', '142', '小老虎', '17853241234', '山东省青岛市青岛大学', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('61', '143', '小老虎', '17853241234', '山东省青岛市青岛大学师范学院', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('62', '144', '小老虎', '17853241234', '山东省青岛市青岛大学师范学院', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('63', '145', '第三方', '17853242107', '人的丰富vgdffgbf', '12923', null);
INSERT INTO `os_order_shipment` VALUES ('64', '146', '健康', '17853242100', '山东省济南市', '200100', null);
INSERT INTO `os_order_shipment` VALUES ('65', '147', '分众传媒', '17853242555', '奇马上发财', '222333', null);
INSERT INTO `os_order_shipment` VALUES ('66', '148', '健康', '17853242100', '山东省济南市', '200100', null);
INSERT INTO `os_order_shipment` VALUES ('67', '149', 'dfssd', '17853242104', '的vfvfdvc地方', '220111', null);
INSERT INTO `os_order_shipment` VALUES ('68', '150', 'dfssd', '17853242104', '的vfvfdvc地方', '220111', null);
INSERT INTO `os_order_shipment` VALUES ('69', '151', 'dfssd', '17853242104', '的vfvfdvc地方', '220111', null);
INSERT INTO `os_order_shipment` VALUES ('70', '152', 'dfssd', '17853242104', '的vfvfdvc地方', '220111', null);
INSERT INTO `os_order_shipment` VALUES ('71', '153', 'dfssd', '17853242104', '的vfvfdvc地方', '220111', null);
INSERT INTO `os_order_shipment` VALUES ('72', '154', 'dfssd', '17853242104', '的vfvfdvc地方', '220111', null);
INSERT INTO `os_order_shipment` VALUES ('73', '159', 'dfssd', '17853242104', '的vfvfdvc地方', '220111', null);
INSERT INTO `os_order_shipment` VALUES ('76', '162', '胡雪珂', '17853242222', '山东省青岛市青岛大学', '256543', null);
INSERT INTO `os_order_shipment` VALUES ('77', '163', '马若宸', '17853242108', '山东省青岛市青岛大学', '200100', null);
INSERT INTO `os_order_shipment` VALUES ('78', '164', '马若宸', '17853242108', '山东省青岛市青岛大学', '200100', null);
INSERT INTO `os_order_shipment` VALUES ('79', '165', '马若宸', '17853242108', '山东省青岛市青岛大学', '200100', null);

-- ----------------------------
-- Table structure for os_order_status
-- ----------------------------
DROP TABLE IF EXISTS `os_order_status`;
CREATE TABLE `os_order_status` (
  `order_status_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单状态ID',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '订单ID',
  `order_status` tinyint(2) DEFAULT NULL COMMENT '订单状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_status` tinyint(2) DEFAULT NULL COMMENT '操作类型 0=会员，1=后台管理人员，2=异常通知',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='订单状态表';

-- ----------------------------
-- Records of os_order_status
-- ----------------------------
INSERT INTO `os_order_status` VALUES ('1', '1', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('2', '2', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('3', '3', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('9', '4', '6', null, '0', '已收货');
INSERT INTO `os_order_status` VALUES ('15', '5', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('16', '6', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('17', '7', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('18', '8', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('20', '10', '2', null, '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('22', '11', '12', null, '0', '手动取消订单');
INSERT INTO `os_order_status` VALUES ('23', '9', '12', null, '0', '手动取消订单');
INSERT INTO `os_order_status` VALUES ('26', '12', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('27', '13', '3', null, '0', '商家打包发货');
INSERT INTO `os_order_status` VALUES ('29', '14', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('30', '18', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('31', '19', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('32', '20', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('33', '21', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('34', '22', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('35', '26', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('36', '27', '1', null, '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('38', '29', '2', null, '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('39', '30', '2', null, '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('40', '31', '2', null, '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('41', '32', '2', '2019-11-06 11:57:17', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('42', '33', '2', '2019-11-07 09:21:12', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('43', '34', '2', '2019-11-07 11:45:06', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('44', '35', '4', '2019-11-13 13:49:00', '0', '等待快递揽收');
INSERT INTO `os_order_status` VALUES ('45', '115', '3', '2019-11-13 14:50:17', '0', '商家打包发货');
INSERT INTO `os_order_status` VALUES ('46', '116', '4', '2019-11-14 11:28:01', '0', '等待快递揽收');
INSERT INTO `os_order_status` VALUES ('47', '117', '3', '2019-11-27 19:22:50', '0', '商家打包发货');
INSERT INTO `os_order_status` VALUES ('48', '118', '2', '2019-11-28 19:02:31', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('49', '119', '2', '2019-11-29 14:57:57', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('50', '120', '2', '2019-11-29 15:22:32', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('51', '121', '2', '2019-12-11 10:31:13', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('52', '122', '2', '2019-12-11 10:32:04', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('53', '123', '2', '2019-12-11 10:32:48', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('54', '124', '6', '2019-12-11 10:54:21', '0', '已收货');
INSERT INTO `os_order_status` VALUES ('55', '125', '2', '2019-12-11 11:00:02', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('56', '126', '2', '2019-12-11 11:10:16', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('57', '127', '2', '2019-12-16 10:39:06', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('58', '128', '2', '2019-12-16 11:09:42', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('59', '129', '2', '2019-12-16 16:32:34', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('60', '130', '2', '2019-12-17 10:23:18', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('61', '131', '2', '2019-12-18 08:42:15', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('62', '132', '2', '2019-12-18 08:49:01', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('63', '133', '2', '2019-12-18 08:56:06', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('64', '134', '2', '2019-12-18 09:05:59', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('65', '135', '2', '2019-12-18 09:10:55', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('66', '136', '2', '2019-12-18 16:40:49', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('67', '137', '2', '2019-12-21 17:17:56', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('68', '138', '2', '2019-12-21 17:33:28', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('69', '139', '2', '2019-12-21 17:49:41', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('70', '140', '2', '2019-12-21 17:59:45', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('71', '141', '5', '2019-12-21 18:04:10', '0', '快递运输途中');
INSERT INTO `os_order_status` VALUES ('72', '142', '2', '2019-12-23 18:06:47', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('73', '143', '3', '2019-12-25 09:29:29', '0', '商家打包发货');
INSERT INTO `os_order_status` VALUES ('74', '144', '2', '2019-12-25 11:05:22', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('75', '145', '2', '2019-12-25 11:40:12', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('76', '146', '6', '2019-12-25 15:35:22', '0', '已收货');
INSERT INTO `os_order_status` VALUES ('77', '147', '6', '2019-12-25 16:09:28', '0', '已收货');
INSERT INTO `os_order_status` VALUES ('78', '148', '6', '2019-12-25 16:17:20', '0', '已收货');
INSERT INTO `os_order_status` VALUES ('79', '149', '2', '2019-12-26 17:29:32', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('80', '150', '2', '2019-12-26 17:30:29', '0', '付款成功');
INSERT INTO `os_order_status` VALUES ('81', '151', '5', '2019-12-27 19:01:55', '0', '快递运输途中');
INSERT INTO `os_order_status` VALUES ('82', '152', '3', '2019-12-27 19:08:04', '0', '商家打包发货');
INSERT INTO `os_order_status` VALUES ('83', '153', '6', '2019-12-27 19:22:57', '0', '已收货');
INSERT INTO `os_order_status` VALUES ('84', '154', '6', '2019-12-30 02:53:10', '0', '已收货');
INSERT INTO `os_order_status` VALUES ('85', '159', '5', '2019-12-30 06:04:54', '0', '快递运输途中');
INSERT INTO `os_order_status` VALUES ('88', '162', '5', '2019-12-30 18:26:11', '0', '快递运输途中');
INSERT INTO `os_order_status` VALUES ('89', '163', '5', '2019-12-30 18:58:27', '0', '快递运输途中');
INSERT INTO `os_order_status` VALUES ('90', '164', '6', '2019-12-30 18:59:23', '0', '已收货');
INSERT INTO `os_order_status` VALUES ('91', '165', '2', '2019-12-30 19:00:37', '0', '付款成功');

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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of os_product
-- ----------------------------
INSERT INTO `os_product` VALUES ('1', '1472581220748', '小米手机5', '2299.00', '支持手机分身，能刷公交卡、银行卡', 'images/goods/201901/1471798318820.png', null, null, '小米手机5', '小米手机5 十余项黑科技，很轻狠快。骁龙820处理器，最大可选4GB内存+128GB闪存，4轴防抖相机，3D陶瓷/玻璃机身。', null, '1');
INSERT INTO `os_product` VALUES ('2', '1472581245880', '小米MIX', '3499.00', '全面屏概念手机', 'images/goods/201901/1471798364441.jpg', null, null, '小米MIX', '小米MIX 全面屏概念手机，开创性的在6.4寸超大屏幕上，做到了惊人的91.3%。当你点亮屏幕的一瞬间，200多万颗像素的色彩，开满了整个屏幕。', null, '3');
INSERT INTO `os_product` VALUES ('3', '1472581300305', '魅蓝 Note5', '1099.00', '快的更漂亮，薄的更持久', 'images/goods/201901/1471798388806.jpg', null, null, '魅蓝 Note5', '魅蓝 Note5，正品行货，另有魅蓝 Note5详细介绍、图片、价格、参数、售前咨询等，购买魅蓝 Note5上魅族商城，全场包邮，7天无理由退货，15天换货保障。', null, '2');
INSERT INTO `os_product` VALUES ('4', '1472583774201', '小米手环 2', '149.00', '看得见的时刻，和你的每一步', 'images/goods/201901/1471798568000.jpg', null, null, '小米手环2', '全新的小米手环 2，加入了 OLED 显示屏，通过轻触圆形按键，即可显示当前时间、步数、心率，甚至里程、热量等更多数据。当不方便触控操作时，抬起手腕，手环便可自动显示当前时间，轻松便捷。', null, '1');
INSERT INTO `os_product` VALUES ('5', '1472583831117', '魅族手环', '229.00', '腕间流动的心率专家', 'images/goods/201901/1471798587971.jpg', null, null, '魅族手环', '魅族手环，腕间流动的心率专家，正品行货，另有魅族手环详细介绍、图片、价格、参数、售前咨询等，购买魅族手环上魅族商城，全场包邮，7天无理由退货，15天换货保障。', null, '2');
INSERT INTO `os_product` VALUES ('6', '1472628630086', 'LED 智能台灯', '169.00', '照明之上，光的艺术品', 'images/goods/201901/1471798587451.jpg', null, null, 'LED 智能台灯', '米家LED智能台灯的色温与亮度可以无级调节，几乎可以满足用户对光线的所有需求。还针对最常见的四种使用场景单独做了光线优化，专注保护用户的双眼。', null, '3');
INSERT INTO `os_product` VALUES ('7', '1472736931796', 'Yeelight床头灯', '249.00', '触摸式操作 给卧室1600万种颜色', 'images/goods/201901/1471799887971.jpg', null, null, 'Yeelight床头灯', '官网正品智能灯推荐，Yeelight床头灯最新价格249元，有多种颜色可选，另有Yeelight床头灯详细介绍及图片，还有用户评价，售前咨询等。', null, '3');
INSERT INTO `os_product` VALUES ('8', '1473318741286', 'Yeelight LED智能灯泡', '99.00', '亮度自由调节 WIFI远程操作', 'images/goods/201901/1471798581451.jpg', null, null, 'Yeelight LED智能灯泡', 'Yeelight LED 智能灯泡,亮度自由调节 WIFI远程操作', null, '3');
INSERT INTO `os_product` VALUES ('9', '1473685327798', '空气监测仪', '166.00', '全自动空气监测', 'images/goods/201901/029.jpg', null, null, '测试商品名称1', '测试商品页面描述,测试商品页面描述', '', '1');
INSERT INTO `os_product` VALUES ('10', '1474910562755', '智能电子秤', '223.00', '便利你的体质监测', 'images/goods/201901/031.jpg', null, null, '测试商品名称2', '测试商品页面描述,测试商品页面描述', '', '1');
INSERT INTO `os_product` VALUES ('11', '1475353900453', '智能婴儿称', '166.00', '无伤害监测婴儿的体制健康', 'images/goods/201901/032.jpg', null, null, '测试商品名称3', '测试商品页面描述,测试商品页面描述', '', '1');
INSERT INTO `os_product` VALUES ('12', '1475353918562', '戴尔笔记本', '3999.00', 'Dell/戴尔成就3000十代4核i5/i7Pcle固态盘2年服务多用笔记本电脑', 'images/goods/201901/033.jpg', null, null, '测试商品名称4', '测试商品页面描述,测试商品页面描述', '', '1');
INSERT INTO `os_product` VALUES ('13', '1475354006972', '游戏本笔记本', '4999.00', 'dell/戴尔灵越2019款新9代i5游匣G3吃鸡电竞游戏本办公轻薄便携手提学生笔记本电脑女生款3590窄边框高色域', 'images/goods/201901/034.jpg', null, null, '测试商品名称5', '测试商品页面描述,测试商品页面描述', '', '1');
INSERT INTO `os_product` VALUES ('14', '1475407186147', '戴尔酷睿', '5999.00', '酷睿13.3小屏512G大容量', 'images/goods/201901/035.jpg', null, null, '测试商品名称6', '测试商品页面描述,测试商品页面描述', '', '1');
INSERT INTO `os_product` VALUES ('15', '1475947762038', '心电图智能手表', '349.00', '喜荷心电图智能手表血压心率监测仪运动手环男多功能测高精度器老年人血氧健康心脏心跳量电子女华为小米通用', 'images/goods/201901/036.jpg', null, null, '测试商品名称7', '测试商品页面描述,测试商品页面描述', '', '2');
INSERT INTO `os_product` VALUES ('16', '1475996329018', '科智大功率移动电源', '129.00', '科智60000毫安超大容量聚合物充电宝双向快充自带线户外钓鱼移动电源适用苹果vivo华为oppo手机通用移动电源', 'images/goods/201901/037.jpg', null, null, '测试商品名称8', '测试商品页面描述,测试商品页面描述', '', '2');
INSERT INTO `os_product` VALUES ('17', '1477472951669', '荣耀路由器', '599.00', '华为旗下荣耀路由器Pro2全千兆家用无线双频Wifi智能上网5G信号双千兆端口穿墙王IPV6', 'images/goods/201901/038.jpg', null, null, '测试商品名称9', '测试商品页面描述,测试商品页面描述', '', '2');
INSERT INTO `os_product` VALUES ('18', '1478099883634', '公牛插座', '59.00', '公牛插座转换器无线插排家用多用功能一转多孔面板不带线插板插头', 'images/goods/201901/039.jpg', null, null, '测试商品名称10', '测试商品页面描述,测试商品页面描述', '', '2');
INSERT INTO `os_product` VALUES ('19', '1478522533460', '闪迪sd卡', '129.00', '手机相机行车仪128G大容量', 'images/goods/201901/040.jpg', null, null, '测试商品名称11', '测试商品页面描述,测试商品页面描述', '', '2');
INSERT INTO `os_product` VALUES ('20', '1478527872182', 'WD/西数移动硬盘', '399.00', '加密 智能备份 三年换新 兼容苹果 一键还原', 'images/goods/201901/041.jpg', null, null, '测试商品名称12', '测试商品页面描述,测试商品页面描述', '', '2');
INSERT INTO `os_product` VALUES ('21', '1478680540669', '蛇圣耳机', '223.00', '一机3用；镀银振膜；HIFI音质；轻便易携带', 'images/goods/201901/042.jpg', null, null, '测试商品名称13', '测试商品页面描述,测试商品页面描述', '', '2');
INSERT INTO `os_product` VALUES ('22', '1478682438293', '万魔活塞耳机', '2416.00', '活塞入耳式双系统线控耳机重低音', 'images/goods/201901/043.jpg', null, null, '测试商品名称14', '测试商品页面描述,测试商品页面描述', '', '2');
INSERT INTO `os_product` VALUES ('23', '1478682709405', '无线运动蓝牙耳机', '219.00', '石墨烯喇叭 金属腔体 24H无痛佩戴 狂甩不掉', 'images/goods/201901/044.jpg', null, null, '测试商品名称15', '测试商品页面描述,测试商品页面描述', '', '2');
INSERT INTO `os_product` VALUES ('24', '1478682831935', 'Golden Field/M16电脑音响', '295.00', '隐藏式不占空间/重低音/炫酷独立开关', 'images/goods/201901/045.jpg', null, null, '测试商品名称16', '测试商品页面描述,测试商品页面描述', '', '3');
INSERT INTO `os_product` VALUES ('25', '1478682893916', '笔记本小音响', '2164.00', '迷你桌面音箱便携即插即用声音大低音震', 'images/goods/201901/046.jpg', null, null, '测试商品名称17', '测试商品页面描述,测试商品页面描述', '', '3');
INSERT INTO `os_product` VALUES ('26', '1478683391099', '小米手机保护套', '20.90', '内置软套防摔 支架功能 送皮挂绳+贴膜', 'images/goods/201901/047.jpg', null, null, '测试商品名称18', '测试商品页面描述,测试商品页面描述', '', '3');
INSERT INTO `os_product` VALUES ('27', '1478683407372', '移动电源保护套', '26.00', '防刮 防尘 防摔 环保硅胶', 'images/goods/201901/048.jpg', null, null, '测试商品名称19', '测试商品页面描述,测试商品页面描述', '', '3');
INSERT INTO `os_product` VALUES ('28', '1478683468241', '行李箱拉杆箱', '399.00', '行李箱登机皮箱密码拉杆箱旅行箱子小型20女男24轻便万向轮大容量', 'images/goods/201901/049.jpg', null, null, '测试商品名称20', '测试商品页面描述,测试商品页面描述', '', '4');
INSERT INTO `os_product` VALUES ('29', '1478683468246', '商务拉杆箱', '265.00', '轻便商务经典设计防水耐磨正品专柜终身维修', 'images/goods/201901/050.jpg', null, null, '测试商品名称21', '测试商品页面描述,测试商品页面描述', '', '4');
INSERT INTO `os_product` VALUES ('30', '1478683468279', '双肩包男士', '200.00', '扩容双肩包男士背包商务休闲大容量出差旅行李包17寸笔记本电脑包\r\n扩容后变20寸拉杆箱大容量　防泼水面料', 'images/goods/201901/051.jpg', null, null, '测试商品名称22', '测试商品页面描述,测试商品页面描述', '', '4');
INSERT INTO `os_product` VALUES ('31', '1478689468277', '卫衣', '122.00', '长袖外套头卫衣定制diy同学聚会工作班服装来图定做圆领印字logo', 'images/goods/201901/052.jpg', null, null, '测试商品名称23', '测试商品页面描述,测试商品页面描述', '', '4');
INSERT INTO `os_product` VALUES ('32', '1478689468979', '测试商品名称24', '456.00', '测试描述，测试商品描述', 'images/goods/201901/1471797894441.jpg', null, null, '测试商品名称24', '测试商品页面描述,测试商品页面描述', '', '5');
INSERT INTO `os_product` VALUES ('33', '1478689448279', '测试商品名称25', '7845.00', '测试描述，测试商品描述', 'images/goods/201901/1471797894441.jpg', null, null, '测试商品名称25', '测试商品页面描述,测试商品页面描述', '', '5');
INSERT INTO `os_product` VALUES ('34', '1478689468679', '测试商品名称26', '1548.00', '测试描述，测试商品描述', 'images/goods/201901/1471797894441.jpg', null, null, '测试商品名称26', '测试商品页面描述,测试商品页面描述', '', '5');
INSERT INTO `os_product` VALUES ('72', '8374140706131', '华为nova5', '3999.00', '华为手机', 'images/goods/201901/1.jpg', null, null, '华为手机', '华为超大屏全面屏', null, '6');
INSERT INTO `os_product` VALUES ('73', '1376307045991', '商务智能手机', '2999.00', '高端轻奢手机原名威图手机', 'images/goods/201901/006.jpg', null, null, '高端轻奢手机原名威图手机', '前置：2400万像素 后置:4000万像', null, '11');
INSERT INTO `os_product` VALUES ('74', '9758685902520', '小米9', '5000.00', '前置：2000万像素 后置:4800万像', 'images/goods/201901/003.jpg', null, null, '2019小米新品', '前置：2000万像素 后置:4800万像', null, '11');
INSERT INTO `os_product` VALUES ('75', '2469943324940', '小米活塞耳机', '299.00', '基础版清新版入耳式女生通用可爱耳麦手机线', 'images/goods/201901/016.jpg', null, null, '小米活塞耳机', '基础版清新版入耳式女生通用可爱耳麦手机线', null, '11');

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='商品分类关联表';

-- ----------------------------
-- Records of os_product_category
-- ----------------------------
INSERT INTO `os_product_category` VALUES ('1', '1', '33', null);
INSERT INTO `os_product_category` VALUES ('2', '2', '33', null);
INSERT INTO `os_product_category` VALUES ('3', '3', '34', null);
INSERT INTO `os_product_category` VALUES ('4', '4', '10', null);
INSERT INTO `os_product_category` VALUES ('5', '5', '10', null);
INSERT INTO `os_product_category` VALUES ('6', '6', '11', null);
INSERT INTO `os_product_category` VALUES ('7', '7', '11', null);
INSERT INTO `os_product_category` VALUES ('8', '8', '11', null);
INSERT INTO `os_product_category` VALUES ('9', '9', '12', null);
INSERT INTO `os_product_category` VALUES ('10', '10', '13', null);
INSERT INTO `os_product_category` VALUES ('11', '11', '13', null);
INSERT INTO `os_product_category` VALUES ('12', '12', '15', null);
INSERT INTO `os_product_category` VALUES ('13', '13', '15', null);
INSERT INTO `os_product_category` VALUES ('14', '14', '16', null);
INSERT INTO `os_product_category` VALUES ('15', '15', '13', null);
INSERT INTO `os_product_category` VALUES ('16', '16', '18', null);
INSERT INTO `os_product_category` VALUES ('17', '17', '19', null);
INSERT INTO `os_product_category` VALUES ('18', '18', '20', null);
INSERT INTO `os_product_category` VALUES ('19', '19', '21', null);
INSERT INTO `os_product_category` VALUES ('20', '20', '22', null);
INSERT INTO `os_product_category` VALUES ('21', '21', '23', null);
INSERT INTO `os_product_category` VALUES ('22', '22', '24', null);
INSERT INTO `os_product_category` VALUES ('23', '23', '25', null);
INSERT INTO `os_product_category` VALUES ('24', '24', '26', null);
INSERT INTO `os_product_category` VALUES ('25', '25', '26', null);
INSERT INTO `os_product_category` VALUES ('26', '26', '28', null);
INSERT INTO `os_product_category` VALUES ('27', '27', '29', null);
INSERT INTO `os_product_category` VALUES ('28', '28', '30', null);
INSERT INTO `os_product_category` VALUES ('29', '29', '30', null);
INSERT INTO `os_product_category` VALUES ('30', '30', '30', null);
INSERT INTO `os_product_category` VALUES ('31', '31', '31', null);
INSERT INTO `os_product_category` VALUES ('32', '39', '15', null);
INSERT INTO `os_product_category` VALUES ('62', '44', '34', null);
INSERT INTO `os_product_category` VALUES ('63', '45', '34', null);
INSERT INTO `os_product_category` VALUES ('64', '46', '34', null);
INSERT INTO `os_product_category` VALUES ('65', '47', '34', null);
INSERT INTO `os_product_category` VALUES ('66', '48', '34', null);
INSERT INTO `os_product_category` VALUES ('67', '49', '34', null);
INSERT INTO `os_product_category` VALUES ('68', '50', '34', null);
INSERT INTO `os_product_category` VALUES ('69', '51', '34', null);
INSERT INTO `os_product_category` VALUES ('70', '52', '34', null);
INSERT INTO `os_product_category` VALUES ('71', '53', '34', null);
INSERT INTO `os_product_category` VALUES ('72', '54', '34', null);
INSERT INTO `os_product_category` VALUES ('73', '55', '34', null);
INSERT INTO `os_product_category` VALUES ('74', '57', '34', null);
INSERT INTO `os_product_category` VALUES ('75', '58', '34', null);
INSERT INTO `os_product_category` VALUES ('76', '59', '34', null);
INSERT INTO `os_product_category` VALUES ('77', '61', '34', null);
INSERT INTO `os_product_category` VALUES ('78', '62', '34', null);
INSERT INTO `os_product_category` VALUES ('79', '63', '34', null);
INSERT INTO `os_product_category` VALUES ('80', '64', '34', null);
INSERT INTO `os_product_category` VALUES ('81', '65', '34', null);
INSERT INTO `os_product_category` VALUES ('82', '66', '15', null);
INSERT INTO `os_product_category` VALUES ('83', '67', '15', null);
INSERT INTO `os_product_category` VALUES ('84', '68', '34', null);
INSERT INTO `os_product_category` VALUES ('85', '69', '15', null);
INSERT INTO `os_product_category` VALUES ('86', '70', '33', null);
INSERT INTO `os_product_category` VALUES ('87', '72', '34', null);
INSERT INTO `os_product_category` VALUES ('88', '73', '34', null);
INSERT INTO `os_product_category` VALUES ('89', '74', '33', null);
INSERT INTO `os_product_category` VALUES ('90', '75', '24', null);

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
INSERT INTO `os_product_detail` VALUES ('1', '1', '<p><img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_01.jpg\" src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_01.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_03.jpg\" src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_03.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_05.jpg\" src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_05.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_07.jpg\" src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_07.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_09.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_11.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_13.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_15.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_17.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_19.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_21.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_23.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_25.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_27.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_29.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_31.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_33.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_35.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_37.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_39.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_41.jpg\"></p>', '2017-04-14 02:16:57', '2019-12-21 17:55:54');

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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='商品图片表';

-- ----------------------------
-- Records of os_product_image
-- ----------------------------
INSERT INTO `os_product_image` VALUES ('1', '1', 'images/goods/201902/1471797894441.jpg', '1', '1', null);
INSERT INTO `os_product_image` VALUES ('2', '1', 'images/goods/201902/1471798318820.jpg', '2', '1', null);
INSERT INTO `os_product_image` VALUES ('3', '1', 'images/goods/201902/1471798364441.jpg', '3', '1', null);
INSERT INTO `os_product_image` VALUES ('4', '1', 'images/goods/201902/1471798581451.png', '4', '1', null);
INSERT INTO `os_product_image` VALUES ('5', '1', 'images/goods/201902/14717983642141.jpg', '5', '1', null);
INSERT INTO `os_product_image` VALUES ('6', '1', 'images/goods/201902/14717983642141.jpg', '6', '1', null);
INSERT INTO `os_product_image` VALUES ('7', '2', 'images/goods/201902/01.jpg', '7', '1', null);
INSERT INTO `os_product_image` VALUES ('8', '2', 'images/goods/201902/02.jpg', '8', '1', null);
INSERT INTO `os_product_image` VALUES ('9', '3', 'images/goods/201902/03.jpg', '9', '1', null);
INSERT INTO `os_product_image` VALUES ('10', '3', 'images/goods/201902/04.jpg', '10', '1', null);
INSERT INTO `os_product_image` VALUES ('11', '4', 'images/goods/201902/05.jpg', '11', '1', null);
INSERT INTO `os_product_image` VALUES ('12', '5', 'images/goods/201902/06.jpg', '12', '1', null);
INSERT INTO `os_product_image` VALUES ('13', '6', 'images/goods/201902/07.jpg', '13', '1', null);
INSERT INTO `os_product_image` VALUES ('14', '7', 'images/goods/201902/08.jpg', '14', '1', null);
INSERT INTO `os_product_image` VALUES ('15', '8', 'images/goods/201902/09.jpg', '15', '1', null);
INSERT INTO `os_product_image` VALUES ('16', '9', 'images/goods/201902/10.jpg', '16', '1', null);
INSERT INTO `os_product_image` VALUES ('17', '10', 'images/goods/201902/11.jpg', '17', '1', null);
INSERT INTO `os_product_image` VALUES ('18', '11', 'images/goods/201902/12.jpg', '18', '1', null);
INSERT INTO `os_product_image` VALUES ('19', '12', 'images/goods/201902/13.jpg', '19', '1', null);
INSERT INTO `os_product_image` VALUES ('20', '13', 'images/goods/201902/14.jpg', '20', '1', null);
INSERT INTO `os_product_image` VALUES ('21', '14', 'images/goods/201902/15.jpg', '21', '1', null);
INSERT INTO `os_product_image` VALUES ('22', '15', 'images/goods/201902/16.jpg', '22', '1', null);
INSERT INTO `os_product_image` VALUES ('23', '16', 'images/goods/201902/17.jpg', '23', '1', null);
INSERT INTO `os_product_image` VALUES ('24', '17', 'images/goods/201902/18.jpg', '24', '1', null);
INSERT INTO `os_product_image` VALUES ('25', '18', 'images/goods/201902/19.jpg', '25', '1', null);
INSERT INTO `os_product_image` VALUES ('26', '19', 'images/goods/201902/20.jpg', '26', '1', null);
INSERT INTO `os_product_image` VALUES ('27', '20', 'images/goods/201902/21.jpg', '27', '1', null);
INSERT INTO `os_product_image` VALUES ('28', '21', 'images/goods/201902/22.jpg', '28', '1', null);
INSERT INTO `os_product_image` VALUES ('29', '22', 'images/goods/201902/23.jpg', '29', '1', null);
INSERT INTO `os_product_image` VALUES ('30', '23', 'images/goods/201902/24.jpg', '30', '1', null);
INSERT INTO `os_product_image` VALUES ('31', '24', 'images/goods/201902/25.jpg', '31', '1', null);
INSERT INTO `os_product_image` VALUES ('32', '25', 'images/goods/201902/26.jpg', '32', '1', null);
INSERT INTO `os_product_image` VALUES ('33', '26', 'images/goods/201902/27.jpg', '33', '1', null);
INSERT INTO `os_product_image` VALUES ('34', '27', 'images/goods/201902/28.jpg', '34', '1', null);
INSERT INTO `os_product_image` VALUES ('35', '28', 'images/goods/201902/29.jpg', '35', '1', null);
INSERT INTO `os_product_image` VALUES ('36', '29', 'images/goods/201902/30.jpg', '36', '1', null);
INSERT INTO `os_product_image` VALUES ('37', '30', 'images/goods/201902/31.jpg', '37', '1', null);
INSERT INTO `os_product_image` VALUES ('38', '31', 'images/goods/201902/32.jpg', '38', '1', null);
INSERT INTO `os_product_image` VALUES ('39', '43', 'images/goods/201902/001.jpg', '1', '1', null);
INSERT INTO `os_product_image` VALUES ('40', '44', 'images/goods/201902/002.jpg', '2', '1', null);
INSERT INTO `os_product_image` VALUES ('41', '44', 'images/goods/201902/002.jpg', '2', '1', null);
INSERT INTO `os_product_image` VALUES ('42', '46', 'images/goods/201902/002.jpg', '2', '1', null);
INSERT INTO `os_product_image` VALUES ('43', '44', 'images/goods/201902/003.jpg', '3', '1', null);
INSERT INTO `os_product_image` VALUES ('44', '52', 'images/goods/201902/005.jpg', '5', '1', null);
INSERT INTO `os_product_image` VALUES ('45', '55', 'images/goods/201902/003.jpg', '3', '1', null);
INSERT INTO `os_product_image` VALUES ('49', '52', 'images/goods/201902/02.jpg', '2', '1', null);
INSERT INTO `os_product_image` VALUES ('50', '4', 'images/goods/201902/12.jpg', '2', '1', null);
INSERT INTO `os_product_image` VALUES ('51', '64', 'images/goods/201902/002.jpg', '2', '1', null);
INSERT INTO `os_product_image` VALUES ('52', '64', 'images/goods/201902/004.jpg', '4', '1', null);
INSERT INTO `os_product_image` VALUES ('53', '65', 'images/goods/201902/01.jpg', '1', '1', null);
INSERT INTO `os_product_image` VALUES ('54', '67', 'images/goods/201902/02.jpg', '1', '1', null);
INSERT INTO `os_product_image` VALUES ('55', '50', 'images/goods/201902/03.jpg', '3', '1', null);
INSERT INTO `os_product_image` VALUES ('56', '68', 'images/goods/201902/08.jpg', '8', '1', null);
INSERT INTO `os_product_image` VALUES ('57', '68', 'images/goods/201902/05.jpg', '5', '1', null);
INSERT INTO `os_product_image` VALUES ('58', '69', 'images/goods/201902/12.jpg', '1', '1', null);
INSERT INTO `os_product_image` VALUES ('59', '70', 'images/goods/201902/003.jpg', '3', '1', null);
INSERT INTO `os_product_image` VALUES ('60', '71', 'images/goods/201902/005.jpg', '5', '1', null);
INSERT INTO `os_product_image` VALUES ('61', '70', 'images/goods/201902/05.jpg', '5', '1', null);
INSERT INTO `os_product_image` VALUES ('62', '70', 'images/goods/201902/03.jpg', '3', '1', null);
INSERT INTO `os_product_image` VALUES ('63', '69', 'images/goods/201902/05.jpg', '2', '1', null);
INSERT INTO `os_product_image` VALUES ('64', '68', 'images/goods/201902/05.jpg', '5', '1', null);
INSERT INTO `os_product_image` VALUES ('65', '72', 'images/goods/201902/1.jpg', '1', '1', null);
INSERT INTO `os_product_image` VALUES ('66', '72', 'images/goods/201902/2.jpg', '2', '1', null);
INSERT INTO `os_product_image` VALUES ('67', '3', 'images/goods/201902/03.jpg', '3', '1', null);
INSERT INTO `os_product_image` VALUES ('68', '16', 'images/goods/201902/09.jpg', '2', '1', null);
INSERT INTO `os_product_image` VALUES ('69', '73', 'images/goods/201902/006.jpg', '6', '1', null);
INSERT INTO `os_product_image` VALUES ('70', '73', 'images/goods/201902/005.jpg', '5', '1', null);
INSERT INTO `os_product_image` VALUES ('71', '74', 'images/goods/201902/003.jpg', '3', '1', null);
INSERT INTO `os_product_image` VALUES ('72', '75', 'images/goods/201902/016.jpg', '1', '1', null);
INSERT INTO `os_product_image` VALUES ('73', '75', 'images/goods/201902/015.jpg', '2', '1', null);

-- ----------------------------
-- Table structure for os_product_parameter
-- ----------------------------
DROP TABLE IF EXISTS `os_product_parameter`;
CREATE TABLE `os_product_parameter` (
  `product_parameter_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '参数ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `name` varchar(64) DEFAULT NULL COMMENT '参数名',
  `value` varchar(64) DEFAULT NULL COMMENT '参数值',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`product_parameter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商品参数表';

-- ----------------------------
-- Records of os_product_parameter
-- ----------------------------
INSERT INTO `os_product_parameter` VALUES ('1', '1', '处理器', '骁龙820', '1', null, null);
INSERT INTO `os_product_parameter` VALUES ('2', '1', '电池容量', '3000mAh', '2', null, null);
INSERT INTO `os_product_parameter` VALUES ('3', '1', '主屏尺寸', '5.15英寸', '3', null, null);
INSERT INTO `os_product_parameter` VALUES ('4', '1', '主屏分辨率', '1920x1080像素', '4', null, null);
INSERT INTO `os_product_parameter` VALUES ('5', '1', '后置摄像头', '1600万像素', '5', null, null);
INSERT INTO `os_product_parameter` VALUES ('6', '1', '前置摄像头', '400万像素', '6', null, null);
INSERT INTO `os_product_parameter` VALUES ('7', '1', '内存', '3GB', '7', null, null);
INSERT INTO `os_product_parameter` VALUES ('8', '1', '介绍', '前置：2000万像素 后置:4800万像 屏幕：6.39英寸2340x1080像素', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('10', '70', '介绍', '小米手机', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('11', '44', '介绍', '小米手机', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('12', '46', '介绍', '小米手机', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('13', '52', '介绍', '小米手机', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('14', '55', '介绍', '华为畅享', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('15', '2', '介绍', '全面屏概念手机', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('16', '64', '介绍', '手机', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('17', '65', '介绍', '手机', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('18', '50', '介绍', '华为手机', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('19', '68', '介绍', '2019新品 三星2018+闪送Samsung', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('20', '71', '介绍', '所产生的', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('21', '72', '介绍', '华为手机', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('22', '3', '介绍', '快的更漂亮，薄的更持久', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('23', '73', '介绍', '高端轻奢手机原名威图手机', '0', null, null);
INSERT INTO `os_product_parameter` VALUES ('24', '74', '介绍', '前置：2000万像素 后置:4800万像', '0', null, null);

-- ----------------------------
-- Table structure for os_product_specification
-- ----------------------------
DROP TABLE IF EXISTS `os_product_specification`;
CREATE TABLE `os_product_specification` (
  `product_spec_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品规格ID',
  `product_spec_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品规格编号',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `spec` varchar(64) DEFAULT NULL COMMENT '规格：规格ID，以“,”相隔',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `sales_volume` int(11) DEFAULT '0' COMMENT '销售量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `score` int(11) DEFAULT NULL COMMENT '积分',
  `default_status` tinyint(2) DEFAULT '1' COMMENT '是否默认状态：0,不默认；1,默认',
  `status` tinyint(2) DEFAULT '1' COMMENT '商品状态：0,新增；1,上架；2,下架',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`product_spec_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='商品规格表';

-- ----------------------------
-- Records of os_product_specification
-- ----------------------------
INSERT INTO `os_product_specification` VALUES ('1', '14725812207481', '1', '1,3', '40', '10', '1599.00', '1600', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('2', '14725812207482', '1', '1,4', '79', '21', '1699.00', '1700', '0', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('3', '14725812207483', '1', '1,5', '100', '30', '1799.00', '1800', '0', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('4', '14725812207484', '1', '2,3', '45', '45', '1599.00', '1600', '0', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('5', '14725812207485', '1', '2,4', '12', '45', '1699.00', '1700', '0', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('6', '14725812207486', '1', '2,5', '72', '75', '1799.00', '1800', '0', '0', null, null);
INSERT INTO `os_product_specification` VALUES ('7', '1472581245880', '2', '', '72', '75', '1799.00', '1800', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('8', '14725813003051', '3', '2,3', '221', '4', '1099.00', '1099', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('9', '1472583774201', '4', null, '4', '4', '149.00', '149', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('10', '1472583831117', '5', null, '554', '6', '229.00', '229', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('11', '1472628630086', '6', null, '6', '6', '169.00', '169', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('12', '1472736931796', '7', null, '7', '7', '249.00', '249', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('13', '1473318741286', '8', null, '8', '8', '99.00', '99', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('14', '1473685327798', '9', null, '9', '9', '166.00', '166', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('15', '1474910562755', '10', null, '10', '10', '223.00', '223', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('16', '1475353900453', '11', null, '11', '11', '166.00', '166', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('17', '1475353918562', '12', null, '12', '12', '124.00', '124', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('18', '1475354006972', '13', null, '12', '14', '249.00', '249', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('19', '1475407186147', '14', null, '14', '14', '219.00', '219', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('20', '1475947762038', '15', null, '15', '15', '2366.00', '2366', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('21', '1475996329018', '16', null, '16', '16', '2499.00', '2499', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('22', '1477472951669', '17', null, '17', '17', '2188.00', '2188', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('23', '1478099883634', '18', null, '18', '18', '249.00', '249', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('24', '1478522533460', '19', null, '18', '20', '1300.00', '1300', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('25', '1478527872182', '20', null, '20', '20', '179.00', '179', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('26', '1478680540669', '21', null, '20', '22', '6429.00', '6429', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('27', '1478682438293', '22', null, '22', '22', '2416.00', '2416', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('28', '1478682709405', '23', null, '23', '23', '219.00', '219', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('29', '1478682831935', '24', null, '24', '24', '295.00', '295', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('30', '1478682893916', '25', null, '25', '25', '2164.00', '2164', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('31', '1478683391099', '26', null, '26', '26', '146.00', '146', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('32', '1478683407372', '27', null, '27', '27', '26.00', '26', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('33', '1478683468241', '28', null, '28', '28', '4974.00', '4974', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('34', '1478683468246', '29', null, '900', '29', '265.00', '265', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('35', '1478683468279', '30', null, '30', '30', '259.00', '259', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('36', '1478689468277', '31', null, '31', '31', '789.00', '789', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('37', '1478689468979', '32', null, '32', '32', '456.00', '456', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('38', '1478689448279', '33', null, '33', '33', '7845.00', '7845', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('39', '1478689468679', '34', null, '34', '34', '1548.00', '1548', '1', '1', null, null);
INSERT INTO `os_product_specification` VALUES ('40', '1478689468673', '39', null, '8888', null, '6666.00', '6666', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('45', '14786893336791', '45', '1,3', '4444', null, '2999.00', '2000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('47', '1478682268679', '47', null, '3333', null, '9999.00', '5555', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('48', '14786114686791', '48', '1,4', '666', null, '4455.00', '7777', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('49', '1574843509890', '49', null, '999', null, '8888.00', '9999', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('51', '76503100572861', '51', '1,5', '10000', null, '3999.00', '5000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('52', '91948698567111', '50', '2,5', '2000', null, '15999.00', '20000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('53', '19033331976731', '53', '2,3', '666', null, '4455.00', '2000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('54', '21700737872371', '54', '1,3', '666', null, '10099.00', '20000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('56', '91831184143341', '56', '6,8', '4444', null, '6666.00', '6666', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('61', '14786893336792', '45', '1,8', '666', null, '4666.00', '5000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('63', '6320622171559', '57', null, '666', null, '10099.00', '20000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('64', '65933803851961', '58', '10,8', '333', null, '4899.00', '5000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('71', '36257408823181', '59', '1,3', '666', null, '2899.00', '3000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('72', '36257408823182', '59', '1,4', '1000', null, '2000.00', '2000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('73', '5295487874093', '60', null, '3000', null, '699.00', '1000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('74', '6302445128748', '61', null, '6000', null, '499.00', '500', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('75', '48315392295451', '63', '10,3', '666', null, '3344.00', '3344', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('76', '36257408823183', '59', '1,5', '666', null, '4455.00', '5000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('77', '36257408823184', '59', '1,8', '1100', null, '4500.00', '5000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('79', '36257408823185', '59', '12,3', '1000', null, '1999.00', '2000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('82', '36257408823186', '59', '12,4', '1000', null, '2999.00', '4000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('86', '47165951500501', '66', '10,3', '666', null, '699.00', '700', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('87', '898192643867', '67', null, '2000', null, '10099.00', '15000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('89', '28876550725821', '44', '10,', '900', null, '3900.00', '90', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('90', '28876550725822', '44', '10,', '900', null, '3900.00', '90', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('91', '41223536633541', '46', '10,8', '90', null, '3900.00', '10', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('92', '28876550725823', '44', '10,9', '200', null, '2999.00', '9', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('93', '28876550725824', '44', '2,8', '300', null, '3000.00', '9', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('94', '89327418681661', '52', '10,8', '2000', null, '3999.00', '12', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('95', '89327418681662', '52', '10,9', '2000', null, '3900.00', '12', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('96', '33176448255101', '55', '1,8', '1000', null, '2899.00', '9', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('97', '33176448255102', '55', '1,9', '900', null, '3999.00', '9', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('98', '89327418681663', '52', '10,8', '200', null, '2999.00', '10', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('99', '89327418681664', '52', '1,9', '1000', null, '3999.00', '20', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('100', '14725812458802', '2', '2,8', '1000', null, '3999.00', '12', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('101', '31478939850201', '64', '10,8', '2000', null, '2999.00', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('102', '31478939850202', '64', '1,8', '123', null, '3999.00', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('103', '50557675408681', '65', '2,9', '1000', null, '3000.00', '13', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('104', '8794675045139', '66', null, '1000', null, '5000.00', '12', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('105', '8651981496818', '67', null, '2000', null, '5000.00', '123', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('106', '39555032869752', '50', '10,8', '2000', null, '3999.00', '11', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('107', '80692070609561', '68', '10,3', '666', null, '3999.00', '4000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('108', '80692070609562', '68', '10,4', '8888', null, '4999.00', '5000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('109', '4295652391760', '69', null, '777', null, '11999.00', '12000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('110', '73200693917491', '70', '10,3', '120', null, '1999.00', '2000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('111', '73200693917492', '70', '1,4', '21', null, '2999.00', '3000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('113', '73200693917493', '70', '1,3', '1100', null, '2000.00', '3000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('114', '73200693917494', '70', '1,5', '100', null, '2333.00', '2500', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('115', '73200693917495', '70', '1,8', '666', null, '2000.00', '2000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('116', '80692070609563', '68', '1,3', '96', '2', '1000.00', '2000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('117', '83741407061311', '72', '12,8', '3000', null, '3800.00', '9', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('118', '83741407061312', '72', '12,9', '1000', null, '3899.00', '11', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('119', '14725813003052', '3', '10,3', '100', null, '1000.00', '1000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('120', '13763070459911', '73', '10,3', '18', '2', '1500.00', '2000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('121', '13763070459912', '73', '10,4', '30', null, '2000.00', '2000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('122', '97586859025201', '74', '6,3', '30', null, '1200.00', '1000', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('123', '2469943324940', '75', null, '200', null, '299.00', '300', null, null, null, null);

-- ----------------------------
-- Table structure for os_specification
-- ----------------------------
DROP TABLE IF EXISTS `os_specification`;
CREATE TABLE `os_specification` (
  `specification_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格ID',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `name` varchar(64) DEFAULT NULL COMMENT '规格名称',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态：1.显示；0.隐藏',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`specification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='规格表\r\n';

-- ----------------------------
-- Records of os_specification
-- ----------------------------
INSERT INTO `os_specification` VALUES ('1', '2', '颜色', '1', '1', null, null);
INSERT INTO `os_specification` VALUES ('2', '2', '内存容量', '1', '2', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='规格属性表';

-- ----------------------------
-- Records of os_specification_attribute
-- ----------------------------
INSERT INTO `os_specification_attribute` VALUES ('1', '1', '白色', null);
INSERT INTO `os_specification_attribute` VALUES ('2', '1', '金色', null);
INSERT INTO `os_specification_attribute` VALUES ('3', '2', '16G', null);
INSERT INTO `os_specification_attribute` VALUES ('4', '2', '32G', null);
INSERT INTO `os_specification_attribute` VALUES ('5', '2', '64G', null);
INSERT INTO `os_specification_attribute` VALUES ('6', '1', '蓝色', null);
INSERT INTO `os_specification_attribute` VALUES ('7', '1', '粉色', null);
INSERT INTO `os_specification_attribute` VALUES ('8', '2', '128G', null);
INSERT INTO `os_specification_attribute` VALUES ('9', '2', '256G', null);
INSERT INTO `os_specification_attribute` VALUES ('10', '1', '黑色', null);
INSERT INTO `os_specification_attribute` VALUES ('11', '1', '红色', null);
INSERT INTO `os_specification_attribute` VALUES ('12', '1', '紫色', null);
INSERT INTO `os_specification_attribute` VALUES ('13', '1', '橙色', null);
INSERT INTO `os_specification_attribute` VALUES ('14', '1', '银色', null);
INSERT INTO `os_specification_attribute` VALUES ('15', '1', '绿色', null);

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
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0=冻结/1=正常',
  `telephone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `regeist_time` datetime DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of os_user
-- ----------------------------
INSERT INTO `os_user` VALUES ('1', '14875975007231277', '穿鞋子的猫', '123456', '陈星星', '0', '0', 'default/avatar/avatar_8.jpg', '1', '18857105127', '2019-11-21 15:19:07', '2019-11-24 01:53:02');
INSERT INTO `os_user` VALUES ('8', '148777295260796', '陈星星', '123456', '陈星星', '0', '0', 'default/avatar/avatar_4.jpg', '1', '18857105120', '2019-11-22 22:15:53', null);
INSERT INTO `os_user` VALUES ('12', '148777481346536', '陈星星', '123456', '陈星星', '0', '0', 'default/avatar/avatar_5.jpg', '1', '18857105137', '2019-11-22 22:46:53', null);
INSERT INTO `os_user` VALUES ('28', '149165425386333', '陈星星', '123456', '陈星星', '0', '0', 'default/avatar/avatar_7.jpg', '1', '18857105165', '2019-12-08 12:24:14', '2019-12-18 08:05:39');
INSERT INTO `os_user` VALUES ('29', '149165425386388', '康健', 'mm123456', null, '0', '0', null, '1', '17853242100', null, null);
INSERT INTO `os_user` VALUES ('30', '15588711558055888', '??999_mt', 'mm123456', null, '0', '0', null, '1', '17853242101', null, null);
INSERT INTO `os_user` VALUES ('31', '15736171415355919', '刘刘刘', 'mm123456', null, '0', '0', null, '1', '17853242102', null, null);
INSERT INTO `os_user` VALUES ('32', '15736183981983794', '在那个', 'mm123456', null, '0', '0', null, '1', '17853242103', null, null);
INSERT INTO `os_user` VALUES ('33', '15742177943785797', 'ii', 'mm123456', null, '0', '0', null, '1', '17853242104', null, null);
INSERT INTO `os_user` VALUES ('34', '15742181436138717', '林林林', 'mm123456', null, '0', '0', null, '1', '17853242105', null, null);
INSERT INTO `os_user` VALUES ('35', '15743164559671452', '小小小', 'mm123456', null, '0', '0', null, '1', '17853242106', null, null);
INSERT INTO `os_user` VALUES ('36', '15760337448993429', '小虎hu', 'mm123456', null, '0', '0', null, '1', '17853242107', null, null);
INSERT INTO `os_user` VALUES ('42', '15777024300855706', '汐汐汐', 'mm123456', null, '0', '0', null, '1', '17853242108', null, null);

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `seller_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家id',
  `seller_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `telephone` varchar(11) DEFAULT NULL COMMENT '编号',
  `login_password` varchar(32) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('1', '王王王', '17853242333', 'mm123456', '4948.00');
INSERT INTO `seller` VALUES ('2', '李李李', '17853242444', 'mm123456', '13057.00');
INSERT INTO `seller` VALUES ('3', '马马马', '17853242555', 'mm123456', '5000.00');
INSERT INTO `seller` VALUES ('4', '飞飞飞', '17853242001', 'mm123456', '5000.00');
INSERT INTO `seller` VALUES ('5', '西西西', '17853242002', 'mm123456', '1000.00');
INSERT INTO `seller` VALUES ('6', '新新新', '17853242003', 'mm123456', '90000.00');
INSERT INTO `seller` VALUES ('7', '东东东', '17853242004', 'mm123456', '1000.00');
INSERT INTO `seller` VALUES ('8', '小老鼠', '17853241111', 'hxk111', '2000.00');
INSERT INTO `seller` VALUES ('9', '百度111', '17853249999', 'hxk999', '10000.00');
INSERT INTO `seller` VALUES ('10', 'hhhhh', '17853247777', 'hxk777', '1000.00');
INSERT INTO `seller` VALUES ('11', '慧慧慧', '17853242005', 'mm123456', '35000.00');
