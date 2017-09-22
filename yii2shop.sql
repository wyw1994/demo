/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : yii2shop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-09-22 20:03:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '所属用户',
  `name` varchar(100) NOT NULL COMMENT '收货人',
  `province` varchar(100) NOT NULL COMMENT '省',
  `city` varchar(100) NOT NULL COMMENT '市',
  `county` varchar(100) NOT NULL COMMENT '县',
  `detail` varchar(255) NOT NULL COMMENT '详细地址',
  `tel` char(11) NOT NULL COMMENT '手机号码',
  `is_default` smallint(1) DEFAULT NULL COMMENT '是否默认地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '1', '张三丰', '四川', '成都', '武侯区', '华山之巅', '18512315076', '0');
INSERT INTO `address` VALUES ('2', '1', '张三丰', '江西', '景德镇', '珠山区', '华盛顿', '18512315076', '1');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `last_login_time` int(11) NOT NULL,
  `last_login_ip` char(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '_4BfIF2luHaTbhBFLhPHQxXxglfRUMa7', '$2y$13$/ZkMZt1fbncH/9TxkF7Y5eNq4bFmd/tfyecvIH/MoLOzR9wsHQRvu', null, '2251568313@qq.com', '1', '1497781453', '0', '0', '127.0.0.1');
INSERT INTO `admin` VALUES ('10', 'admin123', 'qTwasJnnb99jISERb3YtIneWCzKQ4cRC', '$2y$13$AaR3c5pgNeWpNH9pVcJZIOo4gYqPXs1IribQZqMUIM1k.XKdZ7EiC', null, '2251586313@qq.com', '1', '1501895435', '0', '0', '127.0.0.1');
INSERT INTO `admin` VALUES ('11', '123456', 'PLPH9pKt1Bnmi7r3ZdVx9A8SKJ4HgY8T', '$2y$13$Ctx.74vxU2NKgKyVYw2r6uQuWEmxbZrSIB356HJSE0UMFF7TRI93a', null, '312312@ccc.com', '1', '1501896257', '0', '0', '127.0.0.1');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名',
  `intro` text NOT NULL COMMENT '简介',
  `article_category_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章分类ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `article_category_id` (`article_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '原子弹', '2222', '5', '1111', '-1', '2017-06-13 19:19:59');
INSERT INTO `article` VALUES ('2', '天下', '分隔符', '3', '1111', '0', '2017-06-13 19:22:01');
INSERT INTO `article` VALUES ('3', '原子弹', '11111', '5', '1111', '1', '2017-06-13 20:11:38');
INSERT INTO `article` VALUES ('15', '雄霸天下', '风云大陆最艰难的一段历史。', '1', '3', '1', '2017-06-13 20:30:20');

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名',
  `intro` text NOT NULL COMMENT '简介',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `is_help` int(1) NOT NULL DEFAULT '0' COMMENT '是否帮助类书籍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_category
-- ----------------------------
INSERT INTO `article_category` VALUES ('1', '毒品', '描述电器的神书', '0', '0', '1');
INSERT INTO `article_category` VALUES ('2', '书籍', '好书', '0', '0', '0');
INSERT INTO `article_category` VALUES ('3', '健身', '很好的方案', '0', '1', '0');
INSERT INTO `article_category` VALUES ('4', '杀手', '可以请杀手', '0', '0', '0');
INSERT INTO `article_category` VALUES ('5', '军火', '国际先进武器', '0', '1', '0');
INSERT INTO `article_category` VALUES ('6', '药品', '国医馆', '0', '1', '0');

-- ----------------------------
-- Table structure for article_detail
-- ----------------------------
DROP TABLE IF EXISTS `article_detail`;
CREATE TABLE `article_detail` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `content` text NOT NULL COMMENT '文章详细内容',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_detail
-- ----------------------------
INSERT INTO `article_detail` VALUES ('12', '很好啊');
INSERT INTO `article_detail` VALUES ('13', '柔柔弱弱');
INSERT INTO `article_detail` VALUES ('14', '很不错');
INSERT INTO `article_detail` VALUES ('15', '风云大陆最艰难的一段历史。');

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('超级管理员', '1', '1497857446');
INSERT INTO `auth_assignment` VALUES ('超级管理员', '10', '1497857446');
INSERT INTO `auth_assignment` VALUES ('超级管理员', '11', '1501896380');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES (' brand/delete', '2', '品牌删除', null, null, '1497873691', '1497873691');
INSERT INTO `auth_item` VALUES ('add-permission', '2', '添加权限', null, null, '1497873580', '1497873580');
INSERT INTO `auth_item` VALUES ('admin/add', '2', '管理员添加', null, null, '1497769615', '1497769615');
INSERT INTO `auth_item` VALUES ('admin/del', '2', '管理员删除', null, null, '1497756077', '1497756077');
INSERT INTO `auth_item` VALUES ('admin/edit', '2', '管理员编辑', null, null, '1497755901', '1497755901');
INSERT INTO `auth_item` VALUES ('admin/index', '2', '管理员列表', null, null, '1497755831', '1497755852');
INSERT INTO `auth_item` VALUES ('admin/login', '2', '管理员登录', null, null, '1497755725', '1497755725');
INSERT INTO `auth_item` VALUES ('article-category/create', '2', '文章分类增加', null, null, '1497846517', '1497846517');
INSERT INTO `auth_item` VALUES ('article-category/index', '2', '文章分类列表', null, null, '1497845811', '1497846213');
INSERT INTO `auth_item` VALUES ('article/create', '2', '文章创建', null, null, '1497758420', '1497758420');
INSERT INTO `auth_item` VALUES ('article/delete', '2', '文章删除', null, null, '1497758471', '1497758471');
INSERT INTO `auth_item` VALUES ('article/update', '2', '文章编辑', null, null, '1497758453', '1497758453');
INSERT INTO `auth_item` VALUES ('article/view', '2', '文章详情查看', null, null, '1497758509', '1497758525');
INSERT INTO `auth_item` VALUES ('brand/create', '2', '创建品牌', null, null, '1497757082', '1497757082');
INSERT INTO `auth_item` VALUES ('brand/index', '2', '品牌查看', null, null, '1497757470', '1497757470');
INSERT INTO `auth_item` VALUES ('brand/s-upload', '2', '品牌七牛图片上传', null, null, '1497873326', '1497873326');
INSERT INTO `auth_item` VALUES ('brand/update', '2', '品牌编辑', null, null, '1497757206', '1497757206');
INSERT INTO `auth_item` VALUES ('brand/view', '2', '商品详情', null, null, '1498316522', '1498316522');
INSERT INTO `auth_item` VALUES ('goods-category/add', '2', '商品类型添加', null, null, '1497758048', '1497758048');
INSERT INTO `auth_item` VALUES ('goods-category/delete', '2', '商品种类删除', null, null, '1497758358', '1497758358');
INSERT INTO `auth_item` VALUES ('goods-category/edit', '2', '商品种类编辑', null, null, '1497758316', '1497758316');
INSERT INTO `auth_item` VALUES ('goods-category/index', '2', '商品类别列表', null, null, '1497758225', '1497758225');
INSERT INTO `auth_item` VALUES ('goods/add', '2', '商品添加', null, null, '1497733652', '1497755637');
INSERT INTO `auth_item` VALUES ('goods/del', '2', '商品删除', null, null, '1497755585', '1497755646');
INSERT INTO `auth_item` VALUES ('goods/del-gallery', '2', '商品相册删除', null, null, '1497758711', '1497758711');
INSERT INTO `auth_item` VALUES ('goods/edit', '2', '商品编辑', null, null, '1497755624', '1497755660');
INSERT INTO `auth_item` VALUES ('goods/gallery', '2', '商品相册查看', null, null, '1497758659', '1497758659');
INSERT INTO `auth_item` VALUES ('goods/index', '2', '商品列表', null, null, '1497857033', '1497857033');
INSERT INTO `auth_item` VALUES ('goods/s-upload', '2', '商品图片七牛上传', null, null, '1497872134', '1497872134');
INSERT INTO `auth_item` VALUES ('goods/upload', '2', '商品上传', null, null, '1497871183', '1497871183');
INSERT INTO `auth_item` VALUES ('menu/add', '2', '导航菜单添加', null, null, '1497852166', '1497852166');
INSERT INTO `auth_item` VALUES ('menu/del', '2', '菜单删除', null, null, '1497858343', '1497858343');
INSERT INTO `auth_item` VALUES ('menu/edit', '2', '菜单编辑', null, null, '1497858382', '1497858382');
INSERT INTO `auth_item` VALUES ('menu/index', '2', '导航菜单列表', null, null, '1497852132', '1497852132');
INSERT INTO `auth_item` VALUES ('rabc/permission-index', '2', '权限列表', null, null, '1497873633', '1497873633');
INSERT INTO `auth_item` VALUES ('rbac/add-permission', '2', '增加权限', null, null, '1497758778', '1497758778');
INSERT INTO `auth_item` VALUES ('rbac/add-role', '2', '添加角色', null, null, '1497758896', '1497758896');
INSERT INTO `auth_item` VALUES ('rbac/del-permission', '2', '删除权限', null, null, '1497758866', '1497758866');
INSERT INTO `auth_item` VALUES ('rbac/edit-permission', '2', '编辑权限', null, null, '1497758804', '1497758804');
INSERT INTO `auth_item` VALUES ('rbac/edit-role', '2', '编辑角色', null, null, '1497758914', '1497758914');
INSERT INTO `auth_item` VALUES ('rbac/permission-index', '2', '查看权限列表', null, null, '1497758840', '1497758840');
INSERT INTO `auth_item` VALUES ('rbac/role-del', '2', '删除角色', null, null, '1497758949', '1497758949');
INSERT INTO `auth_item` VALUES ('rbac/role-index', '2', '查看角色列表', null, null, '1497758996', '1497758996');
INSERT INTO `auth_item` VALUES ('管理员', '1', '管理员', null, null, '1497767053', '1497857182');
INSERT INTO `auth_item` VALUES ('职员', '1', '职员', null, null, '1497767233', '1497857249');
INSERT INTO `auth_item` VALUES ('超级管理员', '1', '超级管理员', null, null, '1497763910', '1498316659');
INSERT INTO `auth_item` VALUES ('顾客', '1', '顾客', null, null, '1497770529', '1497857387');
INSERT INTO `auth_item` VALUES ('高管', '1', '公司高管', null, null, '1497769615', '1497857312');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('超级管理员', ' brand/delete');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'add-permission');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'admin/add');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'admin/del');
INSERT INTO `auth_item_child` VALUES ('高管', 'admin/del');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'admin/edit');
INSERT INTO `auth_item_child` VALUES ('高管', 'admin/edit');
INSERT INTO `auth_item_child` VALUES ('职员', 'admin/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'admin/index');
INSERT INTO `auth_item_child` VALUES ('高管', 'admin/index');
INSERT INTO `auth_item_child` VALUES ('管理员', 'admin/login');
INSERT INTO `auth_item_child` VALUES ('职员', 'admin/login');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'admin/login');
INSERT INTO `auth_item_child` VALUES ('高管', 'admin/login');
INSERT INTO `auth_item_child` VALUES ('管理员', 'article-category/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'article-category/create');
INSERT INTO `auth_item_child` VALUES ('高管', 'article-category/create');
INSERT INTO `auth_item_child` VALUES ('管理员', 'article-category/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'article-category/index');
INSERT INTO `auth_item_child` VALUES ('高管', 'article-category/index');
INSERT INTO `auth_item_child` VALUES ('管理员', 'article/create');
INSERT INTO `auth_item_child` VALUES ('职员', 'article/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'article/create');
INSERT INTO `auth_item_child` VALUES ('高管', 'article/create');
INSERT INTO `auth_item_child` VALUES ('管理员', 'article/delete');
INSERT INTO `auth_item_child` VALUES ('职员', 'article/delete');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'article/delete');
INSERT INTO `auth_item_child` VALUES ('高管', 'article/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', 'article/update');
INSERT INTO `auth_item_child` VALUES ('职员', 'article/update');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'article/update');
INSERT INTO `auth_item_child` VALUES ('高管', 'article/update');
INSERT INTO `auth_item_child` VALUES ('管理员', 'article/view');
INSERT INTO `auth_item_child` VALUES ('职员', 'article/view');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'article/view');
INSERT INTO `auth_item_child` VALUES ('高管', 'article/view');
INSERT INTO `auth_item_child` VALUES ('管理员', 'brand/create');
INSERT INTO `auth_item_child` VALUES ('职员', 'brand/create');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'brand/create');
INSERT INTO `auth_item_child` VALUES ('高管', 'brand/create');
INSERT INTO `auth_item_child` VALUES ('管理员', 'brand/index');
INSERT INTO `auth_item_child` VALUES ('职员', 'brand/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'brand/index');
INSERT INTO `auth_item_child` VALUES ('高管', 'brand/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'brand/s-upload');
INSERT INTO `auth_item_child` VALUES ('管理员', 'brand/update');
INSERT INTO `auth_item_child` VALUES ('职员', 'brand/update');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'brand/update');
INSERT INTO `auth_item_child` VALUES ('高管', 'brand/update');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'brand/view');
INSERT INTO `auth_item_child` VALUES ('管理员', 'goods-category/add');
INSERT INTO `auth_item_child` VALUES ('职员', 'goods-category/add');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'goods-category/add');
INSERT INTO `auth_item_child` VALUES ('高管', 'goods-category/add');
INSERT INTO `auth_item_child` VALUES ('管理员', 'goods-category/delete');
INSERT INTO `auth_item_child` VALUES ('职员', 'goods-category/delete');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'goods-category/delete');
INSERT INTO `auth_item_child` VALUES ('高管', 'goods-category/delete');
INSERT INTO `auth_item_child` VALUES ('管理员', 'goods-category/edit');
INSERT INTO `auth_item_child` VALUES ('职员', 'goods-category/edit');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'goods-category/edit');
INSERT INTO `auth_item_child` VALUES ('高管', 'goods-category/edit');
INSERT INTO `auth_item_child` VALUES ('管理员', 'goods-category/index');
INSERT INTO `auth_item_child` VALUES ('职员', 'goods-category/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'goods-category/index');
INSERT INTO `auth_item_child` VALUES ('高管', 'goods-category/index');
INSERT INTO `auth_item_child` VALUES ('管理员', 'goods/add');
INSERT INTO `auth_item_child` VALUES ('职员', 'goods/add');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'goods/add');
INSERT INTO `auth_item_child` VALUES ('高管', 'goods/add');
INSERT INTO `auth_item_child` VALUES ('管理员', 'goods/del');
INSERT INTO `auth_item_child` VALUES ('职员', 'goods/del');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'goods/del');
INSERT INTO `auth_item_child` VALUES ('高管', 'goods/del');
INSERT INTO `auth_item_child` VALUES ('管理员', 'goods/del-gallery');
INSERT INTO `auth_item_child` VALUES ('职员', 'goods/del-gallery');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'goods/del-gallery');
INSERT INTO `auth_item_child` VALUES ('高管', 'goods/del-gallery');
INSERT INTO `auth_item_child` VALUES ('管理员', 'goods/edit');
INSERT INTO `auth_item_child` VALUES ('职员', 'goods/edit');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'goods/edit');
INSERT INTO `auth_item_child` VALUES ('高管', 'goods/edit');
INSERT INTO `auth_item_child` VALUES ('管理员', 'goods/gallery');
INSERT INTO `auth_item_child` VALUES ('职员', 'goods/gallery');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'goods/gallery');
INSERT INTO `auth_item_child` VALUES ('高管', 'goods/gallery');
INSERT INTO `auth_item_child` VALUES ('管理员', 'goods/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'goods/index');
INSERT INTO `auth_item_child` VALUES ('顾客', 'goods/index');
INSERT INTO `auth_item_child` VALUES ('高管', 'goods/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'goods/s-upload');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'goods/upload');
INSERT INTO `auth_item_child` VALUES ('管理员', 'menu/add');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'menu/add');
INSERT INTO `auth_item_child` VALUES ('高管', 'menu/add');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'menu/del');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'menu/edit');
INSERT INTO `auth_item_child` VALUES ('管理员', 'menu/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'menu/index');
INSERT INTO `auth_item_child` VALUES ('高管', 'menu/index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'rabc/permission-index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'rbac/add-permission');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'rbac/add-role');
INSERT INTO `auth_item_child` VALUES ('高管', 'rbac/add-role');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'rbac/del-permission');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'rbac/edit-permission');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'rbac/edit-role');
INSERT INTO `auth_item_child` VALUES ('管理员', 'rbac/permission-index');
INSERT INTO `auth_item_child` VALUES ('职员', 'rbac/permission-index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'rbac/permission-index');
INSERT INTO `auth_item_child` VALUES ('高管', 'rbac/permission-index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'rbac/role-del');
INSERT INTO `auth_item_child` VALUES ('管理员', 'rbac/role-index');
INSERT INTO `auth_item_child` VALUES ('职员', 'rbac/role-index');
INSERT INTO `auth_item_child` VALUES ('超级管理员', 'rbac/role-index');
INSERT INTO `auth_item_child` VALUES ('高管', 'rbac/role-index');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌名',
  `intro` text NOT NULL COMMENT '简介',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT 'LOGO图片',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '起点中文网', '很牛的网站.hhhh', 'http://or9rc9kfq.bkt.clouddn.com//upload/30/48/3048e9c352db3b077dfb9491bc63174b418dd068.jpg', '1', '1');
INSERT INTO `brand` VALUES ('2', '纵横中文网', '纵横中文网', 'http://or9rc9kfq.bkt.clouddn.com//upload/fc/5c/fc5cbe987d629e4d44d419e37a763d18babb8ecf.jpg', '1', '1');
INSERT INTO `brand` VALUES ('3', '腾讯文学', '腾讯文学', 'http://or9rc9kfq.bkt.clouddn.com//upload/ae/b3/aeb35552ceea8fff300308cfbbabac4de1d22928.jpg', '1', '1');
INSERT INTO `brand` VALUES ('4', '百度文学', '百度文学', 'http://or9rc9kfq.bkt.clouddn.com//upload/cb/9b/cb9ba76ac2a20afc5302678a2c2bccec9ee59073.jpg', '1', '1');
INSERT INTO `brand` VALUES ('5', '创世中文网', '创世中文网', 'http://or9rc9kfq.bkt.clouddn.com//upload/e7/03/e7039ed1d73980ae01c98a7f611597e9f2d1b35b.jpg', '1', '1');
INSERT INTO `brand` VALUES ('6', '铁血网', '铁血网', 'http://or9rc9kfq.bkt.clouddn.com//upload/83/2c/832cd123736a3e72fa8479b63f58526ae10e357d.jpg', '1', '1');
INSERT INTO `brand` VALUES ('7', '潇湘书院', '潇湘书院', 'http://or9rc9kfq.bkt.clouddn.com//upload/35/93/3593f779c4b6253f4fa914e713cc583a2c4c2eec.jpg', '1', '1');
INSERT INTO `brand` VALUES ('8', '红袖添香', '红袖添香', 'http://or9rc9kfq.bkt.clouddn.com//upload/64/97/6497acd275cb4f89b43a7ccd5cf0a0d945723318.jpg', '1', '1');
INSERT INTO `brand` VALUES ('9', 'TCL王牌彩电', 'TCL王牌彩电', 'http://or9rc9kfq.bkt.clouddn.com//upload/f4/b3/f4b31013ac2c5ffb073a7d03b79cfe2b0e3d40f0.jpg', '1', '1');
INSERT INTO `brand` VALUES ('10', '创维电视', '创维电视', 'http://or9rc9kfq.bkt.clouddn.com//upload/38/93/38933e71f2cedc2b40a3e0878c7f13eb28522242.jpg', '1', '0');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '商品名称',
  `sn` varchar(20) NOT NULL COMMENT '货号',
  `logo` varchar(255) NOT NULL,
  `goods_category_id` int(11) unsigned NOT NULL COMMENT '商品分类',
  `brand_id` int(11) unsigned NOT NULL COMMENT '品牌分类',
  `market_price` decimal(10,2) NOT NULL COMMENT '市场价格',
  `shop_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `stock` int(11) unsigned NOT NULL COMMENT '库存',
  `is_on_sale` smallint(6) unsigned NOT NULL DEFAULT '1' COMMENT '1在售  0下架',
  `status` smallint(6) NOT NULL DEFAULT '1' COMMENT '1正常 0回收站',
  `sort` int(11) unsigned DEFAULT NULL COMMENT '排序',
  `create_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '永夜君王', '201706250001', 'upload/logo/594e806ec6ab6jpg', '14', '1', '33.00', '33.00', '9999', '1', '2', '1', '1498358567');
INSERT INTO `goods` VALUES ('2', '《诛仙》', '201706250009', 'upload/logo/594fe9691d421jpg', '13', '1', '33.00', '33.00', '9999', '1', '3', '1', '1498409321');
INSERT INTO `goods` VALUES ('3', '《全职高手》', '201706250004', 'upload/logo/594e831c0c700jpg', '15', '1', '33.00', '33.00', '9999', '1', '3', '1', '1498358870');
INSERT INTO `goods` VALUES ('4', '《昆仑》', '201706240008', 'upload/logo/594e84ce083e6jpg', '17', '3', '33.00', '33.00', '9999', '1', '1', '1', '1498318030');
INSERT INTO `goods` VALUES ('5', '《易经》', '201706240006', 'upload/logo/594e8378ed1fajpg', '17', '4', '33.00', '33.00', '9999', '1', '1', '1', '1498317689');
INSERT INTO `goods` VALUES ('6', '《回到明朝当王爷》', '201706240007', 'upload/logo/594e846044b91jpg', '18', '7', '33.00', '33.00', '9999', '1', '1', '1', '1498317920');
INSERT INTO `goods` VALUES ('7', '《不朽凡人》', '201706250003', 'upload/logo/594e853248a1djpg', '14', '5', '33.00', '33.00', '9999', '1', '3', '1', '1498358756');
INSERT INTO `goods` VALUES ('8', '《悲伤逆流成河》', '201706240010', 'upload/logo/594e85f34efd5jpg', '16', '8', '24.00', '24.00', '9999', '1', '1', '1', '1498318323');
INSERT INTO `goods` VALUES ('9', '《间客》', '201706240011', 'upload/logo/594e86afc0b49jpg', '14', '1', '43.00', '30.00', '9999', '1', '1', '1', '1498318511');
INSERT INTO `goods` VALUES ('10', '《将夜》', '201706240012', 'upload/logo/594e8732b2aa2jpg', '18', '2', '55.00', '55.00', '9999', '1', '1', '1', '1498318642');
INSERT INTO `goods` VALUES ('12', '《神雕侠侣》', '201706240013', 'upload/logo/594e8ad77efe3jpg', '17', '5', '55.00', '55.00', '9999', '1', '1', '1', '1498319575');
INSERT INTO `goods` VALUES ('13', '《大话西游》', '201706240014', 'upload/logo/594e8e5f304dajpg', '16', '5', '33.00', '30.00', '9999', '1', '1', '1', '1498320479');
INSERT INTO `goods` VALUES ('14', '《圣墟》', '201706250005', 'upload/logo/594f246a855d9jpg', '14', '1', '55.00', '55.00', '9999', '1', '2', '1', '1498358890');
INSERT INTO `goods` VALUES ('15', '《雪鹰领主》', '201706250006', 'upload/logo/594f259a11f9ajpg', '14', '1', '66.00', '66.00', '9999', '1', '2', '1', '1498359194');
INSERT INTO `goods` VALUES ('16', '《坏蛋是怎样练成的》', '201706250007', 'upload/logo/594f2636647b0jpg', '14', '6', '66.00', '66.00', '9999', '1', '3', '1', '1498359350');
INSERT INTO `goods` VALUES ('17', 'TCL纤薄金属 智能语音 40英寸', '201706250008', 'upload/logo/594fe3f61c553jpg', '31', '9', '2888.00', '2888.00', '9999', '1', '2', '1', '1498407926');

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tree` int(11) NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `intro` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES ('1', '1', '1', '38', '0', '数字商品', '0', '数字商品');
INSERT INTO `goods_category` VALUES ('2', '2', '1', '24', '0', '家用电器', '0', '');
INSERT INTO `goods_category` VALUES ('3', '3', '1', '4', '0', '手机', '0', '手机');
INSERT INTO `goods_category` VALUES ('4', '4', '1', '2', '0', '电脑', '0', '电脑');
INSERT INTO `goods_category` VALUES ('5', '5', '1', '2', '0', '家居、家具', '0', '家居、家具');
INSERT INTO `goods_category` VALUES ('6', '6', '1', '2', '0', '个护化妆', '0', '个护化妆');
INSERT INTO `goods_category` VALUES ('7', '7', '1', '2', '0', '礼品箱包、钟表、珠宝', '0', '礼品箱包、钟表、珠宝');
INSERT INTO `goods_category` VALUES ('8', '8', '1', '2', '0', '运动健康', '0', '运动健康');
INSERT INTO `goods_category` VALUES ('9', '9', '1', '2', '0', '汽车用品', '0', '汽车用品');
INSERT INTO `goods_category` VALUES ('10', '10', '1', '2', '0', '母婴、玩具乐器', '0', '母婴、玩具乐器');
INSERT INTO `goods_category` VALUES ('11', '11', '1', '2', '0', '彩票、旅行、充值、票务', '0', '彩票、旅行、充值、票务');
INSERT INTO `goods_category` VALUES ('12', '1', '24', '37', '1', '电子书', '1', '电子书');
INSERT INTO `goods_category` VALUES ('13', '1', '35', '36', '2', '免费', '12', '免费');
INSERT INTO `goods_category` VALUES ('14', '1', '33', '34', '2', '小说', '12', '小说');
INSERT INTO `goods_category` VALUES ('15', '1', '31', '32', '2', '励志与成功', '12', '励志与成功');
INSERT INTO `goods_category` VALUES ('16', '1', '29', '30', '2', '婚恋/两性', '12', '婚恋/两性');
INSERT INTO `goods_category` VALUES ('17', '1', '27', '28', '2', '文学', '12', '文学');
INSERT INTO `goods_category` VALUES ('18', '1', '25', '26', '2', '畅读VIP', '12', '畅读VIP');
INSERT INTO `goods_category` VALUES ('19', '1', '16', '23', '1', '数字音乐', '1', '数字音乐');
INSERT INTO `goods_category` VALUES ('20', '1', '21', '22', '2', '通俗流行', '19', '通俗流行');
INSERT INTO `goods_category` VALUES ('21', '1', '19', '20', '2', '乡村民谣', '19', '乡村民谣');
INSERT INTO `goods_category` VALUES ('22', '1', '17', '18', '2', '有声读物', '19', '有声读物');
INSERT INTO `goods_category` VALUES ('23', '1', '10', '15', '1', '文艺', '1', '文艺');
INSERT INTO `goods_category` VALUES ('24', '1', '13', '14', '2', '青春文学', '23', '青春文学');
INSERT INTO `goods_category` VALUES ('25', '1', '11', '12', '2', '经管', '23', '经管');
INSERT INTO `goods_category` VALUES ('26', '1', '4', '9', '1', '生活', '1', '生活');
INSERT INTO `goods_category` VALUES ('27', '1', '7', '8', '2', '娱乐/休闲', '26', '娱乐/休闲');
INSERT INTO `goods_category` VALUES ('28', '1', '5', '6', '2', '体育/运动', '26', '体育/运动');
INSERT INTO `goods_category` VALUES ('29', '1', '2', '3', '1', '科技', '1', '科技');
INSERT INTO `goods_category` VALUES ('30', '2', '16', '23', '1', '大家电', '2', '大家电');
INSERT INTO `goods_category` VALUES ('31', '2', '21', '22', '2', '平板电视', '30', '平板电视');
INSERT INTO `goods_category` VALUES ('32', '2', '19', '20', '2', '空调', '30', '空调');
INSERT INTO `goods_category` VALUES ('33', '2', '17', '18', '2', '洗衣机', '30', '洗衣机');
INSERT INTO `goods_category` VALUES ('34', '2', '8', '15', '1', '生活电器', '2', '生活电器');
INSERT INTO `goods_category` VALUES ('35', '2', '13', '14', '2', '净化器', '34', '净化器');
INSERT INTO `goods_category` VALUES ('36', '2', '11', '12', '2', '电风扇', '34', '电风扇');
INSERT INTO `goods_category` VALUES ('37', '2', '9', '10', '2', '饮水机', '34', '饮水机');
INSERT INTO `goods_category` VALUES ('38', '2', '2', '7', '1', '厨房电器', '2', '厨房电器');
INSERT INTO `goods_category` VALUES ('39', '2', '5', '6', '2', '豆浆机', '38', '豆浆机');
INSERT INTO `goods_category` VALUES ('40', '2', '3', '4', '2', '微波炉', '38', '微波炉');
INSERT INTO `goods_category` VALUES ('41', '3', '2', '3', '1', '苹果', '3', '苹果');

-- ----------------------------
-- Table structure for goods_day_count
-- ----------------------------
DROP TABLE IF EXISTS `goods_day_count`;
CREATE TABLE `goods_day_count` (
  `day` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '商品数',
  PRIMARY KEY (`day`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_day_count
-- ----------------------------
INSERT INTO `goods_day_count` VALUES ('2017-06-17', '17');
INSERT INTO `goods_day_count` VALUES ('2017-06-16', '7');
INSERT INTO `goods_day_count` VALUES ('2017-06-19', '5');
INSERT INTO `goods_day_count` VALUES ('2017-06-20', '1');
INSERT INTO `goods_day_count` VALUES ('2017-06-24', '14');
INSERT INTO `goods_day_count` VALUES ('2017-06-25', '9');

-- ----------------------------
-- Table structure for goods_gallery
-- ----------------------------
DROP TABLE IF EXISTS `goods_gallery`;
CREATE TABLE `goods_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned DEFAULT NULL COMMENT '商品id',
  `path` varchar(255) NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_gallery
-- ----------------------------
INSERT INTO `goods_gallery` VALUES ('32', '20', '/upload/logo//8787878f17f2148255fb660bba760da89a6cf4407c3b.jpg');
INSERT INTO `goods_gallery` VALUES ('38', '24', '/upload/logo//aeaeae4d50188bdc36fc6ccf872420a8c9ea42a0b394.jpg');
INSERT INTO `goods_gallery` VALUES ('36', '23', '/upload/logo//626262af5745560d64100c1231f5fc9384bcceedc1f6.jpg');
INSERT INTO `goods_gallery` VALUES ('37', '23', '/upload/logo//1d1d1d7861961477ca088cb570889e87bf673446ff87.jpg');
INSERT INTO `goods_gallery` VALUES ('39', '25', '/upload/logo//3030308a0bf75e20938c5da60ebe4eb2698146224e13.jpg');
INSERT INTO `goods_gallery` VALUES ('41', '17', '/upload/logo//7a7a7a208b6c9984d506e95b7990bf4d120e811a7a13.jpg');

-- ----------------------------
-- Table structure for goods_intro
-- ----------------------------
DROP TABLE IF EXISTS `goods_intro`;
CREATE TABLE `goods_intro` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '商品详情',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_intro
-- ----------------------------
INSERT INTO `goods_intro` VALUES ('21', '<p>很不错</p>');
INSERT INTO `goods_intro` VALUES ('22', '<p>很好</p>');
INSERT INTO `goods_intro` VALUES ('23', '<p>很前方</p>');
INSERT INTO `goods_intro` VALUES ('24', '<p>很前方</p>');
INSERT INTO `goods_intro` VALUES ('25', '<p>好家伙</p>');
INSERT INTO `goods_intro` VALUES ('10', '<p>很厉害</p>');
INSERT INTO `goods_intro` VALUES ('27', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">魔前一叩三千年，回首凡尘不做仙，只为她……掌缘生灭请看耳根作品《</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">求魔</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">》...</span></p>');
INSERT INTO `goods_intro` VALUES ('12', '<p>很厉害</p>');
INSERT INTO `goods_intro` VALUES ('20', '<p>很暴力</p>');
INSERT INTO `goods_intro` VALUES ('14', '<p>很厉害</p>');
INSERT INTO `goods_intro` VALUES ('1', '<p><span style=\"color: rgb(130, 129, 129); font-family: arial, SimSun, helvetica; font-size: 12px; background-color: rgb(255, 255, 255);\">千夜自困苦中崛起，在背叛中坠落。 自此一个人，一把枪，行在永夜与黎明之间，却走出一段传奇。 若永夜注定是他的命运，那他也要成为主宰的王。</span></p>');
INSERT INTO `goods_intro` VALUES ('2', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">《</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">诛仙</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">》是由毕业于福建工程学院的当代作家萧鼎写作的长篇武侠（古典仙侠）小说，全书共八册，被新浪网誉为“后金庸武侠圣经”。书中反复探究的一个问题是“何为正道”。“天地不仁，以万物为刍狗”是小说的主题思想。</span></p>');
INSERT INTO `goods_intro` VALUES ('3', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">《</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">全职高手</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">》连载于起点中文网，作者是蝴蝶蓝。该</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">小说</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">讲述了网游顶尖高手叶修，遭到俱乐部的驱逐，而后在荣耀新开的第十区重新投入了游戏，召集一群志同道合的伙伴，重返巅峰之路的故事。</span></p>');
INSERT INTO `goods_intro` VALUES ('4', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">《</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">昆仑小说</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">》是新武侠系列代表作品,以宋末元初为历史背景,《</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">昆仑小说</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">》通过主人公梁萧由一个江湖浪子成长为一代大侠的传奇经历,给读者展开了一幅气势磅礴的江湖画卷。</span></p>');
INSERT INTO `goods_intro` VALUES ('5', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">《</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">易经</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">》指夏代的《连山》、商代的《归藏》及周代的《周易》，这三部经卦书统称为</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">易经</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">。其中《连山》、《归藏》已失传，传世的只有《周易》一本。从本质上来讲，《</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">易经</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">》是阐述关于变化之书，长期被用作“卜筮”。“卜筮”就是对未来事态的发展进行预测，而《</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">易经</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">》便是总结这些预测的规律理论的书。</span></p>');
INSERT INTO `goods_intro` VALUES ('6', '<p><span style=\"color: rgb(38, 38, 38); font-family: PingFangSC-Regular, -apple-system, Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp;&nbsp;阴差阳错间，乌龙九世善人郑少鹏回到了大明正德年间。</span><br/><span style=\"color: rgb(38, 38, 38); font-family: PingFangSC-Regular, -apple-system, Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\">　　那是一个多姿多彩的时代，既有京师八虎的邪恶，又有江南四大才子的风流，还有大儒王阳明的心学，再加上荒诞不经的正德皇帝朱厚照。浑浑噩噩中踏进这个世界的主角，不得不为了自己的命运，周旋在这形形色色的人物之中。</span><br/><span style=\"color: rgb(38, 38, 38); font-family: PingFangSC-Regular, -apple-system, Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\">　　东厂、西厂、内厂、外廷之间的纷争；代天巡狩清除贪官的故事；剿倭寇、驱鞑靼、灭都掌蛮、大战佛郎机；开海禁、移民西伯利亚……，精彩的故事纷至沓来……</span><br/><span style=\"color: rgb(38, 38, 38); font-family: PingFangSC-Regular, -apple-system, Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\">　　国家和个人的命运，就象历史长河中的一条船，因为他的意外出现，这艘原本注定驶向没落的巨轮，会不会偏移它的方向呢？</span></p>');
INSERT INTO `goods_intro` VALUES ('7', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">我,只有凡根,一介凡人! 我,叫莫无忌! 我,要不朽!&nbsp;</span></p>');
INSERT INTO `goods_intro` VALUES ('8', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">悲伤</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">逆流成河</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">》是当代著名作家郭敬明的第四部长篇</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">小说</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">。</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">小说</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">讲述上海弄堂里一起长大的一对年轻人在校园内外纠葛的爱情故事。</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">小说</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">文笔细腻，格调语言深沉冷静，较作者以往的作品风格有极为明显的变化，被作者视为个人的转型之作。</span></p>');
INSERT INTO `goods_intro` VALUES ('9', '<p><span style=\"color: rgb(38, 38, 38); font-family: PingFangSC-Regular, -apple-system, Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\">　世界上有两件东西能够深深地震撼人们的心灵，一件是我们心中崇高的道德准则，另一件是我们头顶上灿烂的星空——康德</span><br/><span style=\"color: rgb(38, 38, 38); font-family: PingFangSC-Regular, -apple-system, Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\">　　当许乐从这行字上收回目光，第一次真正看到尘埃后方那繁若芝麻的群星时，并没有被震撼，相反他怒了：大区天空外面的星星这么刺眼，谁能受得了？天天被这些光晃着，只怕会变成矿道上那些被大灯照成痴呆的野猫！</span></p>');
INSERT INTO `goods_intro` VALUES ('26', '<p><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">孙子兵法</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">》又称《孙武兵法》、《吴</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">孙子兵法</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">》、《孙子兵书》《孙武兵书》等，是中国现存最早的兵书，也是世界上最早的军事著作，被誉为“兵学圣典”。共有六千字左右，一共十三篇。《</span><span style=\"color: rgb(204, 0, 0); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">孙子兵法</span><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; background-color: rgb(255, 255, 255);\">》是中国古代军事文化遗产中的璀璨瑰宝。</span></p>');
INSERT INTO `goods_intro` VALUES ('13', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial; font-size: 13px; text-indent: -39px; background-color: rgb(255, 255, 255);\">至尊宝被月光宝盒带回到五百年前，遇见紫霞仙子，被对方打上烙印成为对方的人，并发觉自己已变成孙悟空。 紫霞与青霞本是如来佛祖座前日月神灯的灯..</span></p>');
INSERT INTO `goods_intro` VALUES ('28', '<p><span style=\"color: rgb(38, 38, 38); font-family: PingFangSC-Regular, -apple-system, Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\">一念成沧海，一念化桑田。一念斩千魔，一念诛万仙。</span><br/><span style=\"color: rgb(38, 38, 38); font-family: PingFangSC-Regular, -apple-system, Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\">　　唯我念……永恒</span></p>');
INSERT INTO `goods_intro` VALUES ('15', '<p><span style=\"color: rgb(38, 38, 38); font-family: PingFangSC-Regular, -apple-system, Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\">在夏族的安阳行省，有一个很小很不起眼的领地，叫——雪鹰领！</span><br/><span style=\"color: rgb(38, 38, 38); font-family: PingFangSC-Regular, -apple-system, Simsun; font-size: 14px; background-color: rgb(255, 255, 255);\">　　故事，就从这里开始！</span></p>');
INSERT INTO `goods_intro` VALUES ('16', '<p>该小说讲述了主人公谢文东由原本文弱、本分、听话、成绩优秀但被人欺负的好学生“成长”为杀人不眨眼的<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E9%BB%91%E7%A4%BE%E4%BC%9A/9553746\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">黑社会</a>老大的故事。</p><ul class=\"basicInfo-block basicInfo-left list-paddingleft-2\" style=\"margin: 0px; padding: 0px; width: 395px; float: left;\"></ul><p><br/></p>');
INSERT INTO `goods_intro` VALUES ('17', '<p><span style=\"color: rgb(153, 153, 153); font-family: &quot;Microsoft Yahei&quot;, Arial; font-size: 12px; background-color: rgb(255, 255, 255);\">TCL 40A730U遥控器智能语音控制/全金属机身,底座/航空铝材边框/4K+HDR,清晰、层次感强的新体验</span></p>');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) DEFAULT NULL,
  `password_hash` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `tel` char(11) DEFAULT NULL COMMENT '电话',
  `last_login_time` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` int(11) DEFAULT NULL COMMENT '最后登录ip',
  `status` int(11) DEFAULT NULL COMMENT 'status',
  `created_at` int(11) DEFAULT NULL COMMENT '添加时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '张三丰', 'hZNqE95w5SUcr5OkNsur6l-MMwpKqg28', '$2y$13$gdc.3bu2JiTf3KEIdUGDj.ovr31kbDgh8O9Wz5tYDvQTvr0nDtaDG', '2251586313@qq.com', '18512315076', null, '2130706433', '1', '1498697708', null);
INSERT INTO `member` VALUES ('3', '陈元霸', 'iJGucwaz0Y-u6nKvtTFj9-BzLYNXSzNZ', '$2y$13$h5EstKFqORQG0Y3UPofM6O7fXBdYBQkrxDyFEGM..KXUPFUiy896O', '2251586313@qq.com', '18512315076', null, '2130706433', '1', '1499169860', null);
INSERT INTO `member` VALUES ('4', '千夜', '6OTCsl5oDp3QsYqfG15zO8wwIWAE7H0L', '$2y$13$XsBroYj1/YcaWZsLIMDIIekJ1UAlz8sQ02OzPxbnBlbnKhW/eomLq', '2251586313@qq.com', '18512315076', null, '2130706433', '1', '1499184791', null);
INSERT INTO `member` VALUES ('5', '少侠', 'lw-0WFfiG7h7d5qpBDgIg3C_0DtY_gL2', '$2y$13$NDkC8kydq0AspD5QwBwXhOWMOGIoRulwbz1V7E1BV243MT1GP4rpW', '2251586313@qq.com', '18512315076', null, '2130706433', '1', '1499185328', null);
INSERT INTO `member` VALUES ('6', 'test', '3pVVpvFjeD3bEN5r8-_sVaqUHQKB-V3V', '$2y$13$F5nJE0C82KHuLP9d1pIUtOXuh4SVlvoXh7v4DBeZWBJJcZl/B/Eku', '234567890@qq.com', '18111251826', null, '2130706433', '1', '1499658922', null);
INSERT INTO `member` VALUES ('7', '周星驰', 'FrykzcOCxd5c2YIutP6oSLQuxUG0l_8s', '$2y$13$yCGMGm/PX4wZetxwUSoOhuFSdc3JUHoSQafUBGywCSkPc1niYjaZO', '2251586313@qq.com', '18512315076', null, '2130706433', '1', '1499666272', null);
INSERT INTO `member` VALUES ('8', '陈元霸', 'dC6RwBxstkKB9Cfdakoc-QFNcv0af3Xw', '$2y$13$jjzh2m2cM7eh6sZsSzrNNuHVe.8s5IzchFZVeheiZCPvZ33hDXacK', '2251586313@qq.com', '18512315076', null, '2130706433', '1', '1499663047', null);
INSERT INTO `member` VALUES ('9', 'xww', 'TmMZfs4TFqCZkLPrH2DA9KlCaJz8-HZa', '$2y$2y$13$YnEq.VZ5STDFh.s4GdvKtOyL9WLhwBl27.bGuyLu2tVJLddvn18Vq', '123@123.com', '18190774612', null, '2130706433', '1', '1501465955', null);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(20) NOT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '地址/路由',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级菜单',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '管理员管理', null, '0', '1');
INSERT INTO `menu` VALUES ('2', '管理员查看', 'admin/index', '1', '1');
INSERT INTO `menu` VALUES ('19', '导航菜单列表', 'menu/index', '18', '1');
INSERT INTO `menu` VALUES ('4', '管理员添加', 'admin/add', '1', '3');
INSERT INTO `menu` VALUES ('6', '品牌管理', null, '0', '1');
INSERT INTO `menu` VALUES ('7', '品牌添加', 'brand/create', '6', '1');
INSERT INTO `menu` VALUES ('8', '品牌详情', 'brand/view', '6', '2');
INSERT INTO `menu` VALUES ('18', '菜单管理', null, '0', '1');
INSERT INTO `menu` VALUES ('10', '角色增加', 'rbac/add-role', '9', '1');
INSERT INTO `menu` VALUES ('9', '角色管理', null, '0', '1');
INSERT INTO `menu` VALUES ('16', '品牌列表', 'brand/index', '6', '3');
INSERT INTO `menu` VALUES ('11', '文章分类管理', null, '0', '1');
INSERT INTO `menu` VALUES ('12', '文章详情查看', 'article-category/view', '11', '1');
INSERT INTO `menu` VALUES ('13', '文章分类列表', 'article-category/index', '11', '2');
INSERT INTO `menu` VALUES ('14', '文章分类添加', 'article-category/create', '11', '3');
INSERT INTO `menu` VALUES ('15', '文章分类删除', 'article-category/delete', '11', '4');
INSERT INTO `menu` VALUES ('17', '文章分类编辑', 'article-category/edit', '11', '5');
INSERT INTO `menu` VALUES ('20', '导航菜单添加', 'menu/add', '18', '2');
INSERT INTO `menu` VALUES ('21', '商品管理', null, '0', '1');
INSERT INTO `menu` VALUES ('22', '商品列表', 'goods/index', '21', '1');
INSERT INTO `menu` VALUES ('23', '商品添加', 'goods/add', '21', '2');
INSERT INTO `menu` VALUES ('24', '管理员删除', 'admin/del', '1', '2');
INSERT INTO `menu` VALUES ('27', '角色列表', 'rbac/role-index', '9', '2');
INSERT INTO `menu` VALUES ('28', '权限管理', null, '0', '3');
INSERT INTO `menu` VALUES ('29', '权限添加', 'rbac/add-permission', '28', '1');
INSERT INTO `menu` VALUES ('30', '权限删除', 'rbac/del-permission', '28', '2');
INSERT INTO `menu` VALUES ('31', '商品类型管理', null, '0', '1');
INSERT INTO `menu` VALUES ('32', '商品类型添加', 'goods-category/add', '31', '1');
INSERT INTO `menu` VALUES ('33', '商品类型列表', 'goods-category/index', '31', '2');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1497370593');
INSERT INTO `migration` VALUES ('m130524_201442_init', '1497370614');
INSERT INTO `migration` VALUES ('m170613_155813_create_goods_category_table', '1497370614');
INSERT INTO `migration` VALUES ('m170614_171530_create_goods_table', '1497461148');
INSERT INTO `migration` VALUES ('m170614_173237_create_goods_day_count_table', '1497461723');
INSERT INTO `migration` VALUES ('m170615_231135_create_admin_table', '1497568492');
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', '1497733504');
INSERT INTO `migration` VALUES ('m170618_223623_create_menu_table', '1497825617');
INSERT INTO `migration` VALUES ('m170620_042602_create_member_table', '1497933446');
INSERT INTO `migration` VALUES ('m170623_021426_create_address_table', '1498188378');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `province` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `area` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `tel` char(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `delivery_name` varchar(100) NOT NULL DEFAULT '',
  `delivery_price` decimal(10,2) DEFAULT '0.00',
  `payment_id` int(11) DEFAULT NULL,
  `payment_name` varchar(50) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT '0.00',
  `status` tinyint(4) DEFAULT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('21', '1', '张三丰', '江西', '景德镇', '珠山区', '华盛顿', '18512315076', '1', '顺丰快递', '25.00', '2', '在线支付', '0.00', '1', null, '1498708734');
INSERT INTO `order` VALUES ('22', '1', '张三丰', '江西', '景德镇', '珠山区', '华盛顿', '18512315076', '1', '顺丰快递', '25.00', '2', '在线支付', '0.00', '1', null, '1498709008');
INSERT INTO `order` VALUES ('23', '1', '张三丰', '江西', '景德镇', '珠山区', '华盛顿', '18512315076', '1', '顺丰快递', '25.00', '2', '在线支付', '0.00', '1', null, '1498709126');
INSERT INTO `order` VALUES ('24', '1', '张三丰', '江西', '景德镇', '珠山区', '华盛顿', '18512315076', '1', '顺丰快递', '25.00', '2', '在线支付', '0.00', '1', null, '1498709186');
INSERT INTO `order` VALUES ('25', '1', '张三丰', '江西', '景德镇', '珠山区', '华盛顿', '18512315076', '1', '顺丰快递', '25.00', '2', '在线支付', '0.00', '1', null, '1498709543');
INSERT INTO `order` VALUES ('26', '1', '张三丰', '江西', '景德镇', '珠山区', '华盛顿', '18512315076', '1', '顺丰快递', '25.00', '2', '在线支付', '0.00', '1', null, '1498709621');
INSERT INTO `order` VALUES ('27', '1', '张三丰', '江西', '景德镇', '珠山区', '华盛顿', '18512315076', '1', '顺丰快递', '25.00', '2', '在线支付', '0.00', '1', null, '1498709684');
INSERT INTO `order` VALUES ('28', '1', '张三丰', '江西', '景德镇', '珠山区', '华盛顿', '18512315076', '1', '顺丰快递', '25.00', '2', '在线支付', '0.00', '1', null, '1498709706');
INSERT INTO `order` VALUES ('29', '1', '张三丰', '江西', '景德镇', '珠山区', '华盛顿', '18512315076', '1', '顺丰快递', '25.00', '2', '在线支付', '0.00', '1', null, '1498709741');
INSERT INTO `order` VALUES ('30', '1', '张三丰', '四川', '成都', '武侯区', '华山之巅', '18512315076', '1', '顺丰快递', '25.00', '2', '在线支付', '0.00', '1', null, '1498709824');
INSERT INTO `order` VALUES ('31', '1', '张三丰', '江西', '景德镇', '珠山区', '华盛顿', '18512315076', '1', '顺丰快递', '25.00', '2', '在线支付', '0.00', '1', null, '1498709957');
INSERT INTO `order` VALUES ('32', '1', '张三丰', '江西', '景德镇', '珠山区', '华盛顿', '18512315076', '1', '顺丰快递', '25.00', '2', '在线支付', '0.00', '1', null, '1498722403');

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_name` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES ('2', '26', '2', '', 'upload/logo/594fe9691d421jpg', '33.00', '2', '66.00');
INSERT INTO `order_goods` VALUES ('3', '27', '2', '', 'upload/logo/594fe9691d421jpg', '33.00', '2', '66.00');
INSERT INTO `order_goods` VALUES ('4', '28', '2', '', 'upload/logo/594fe9691d421jpg', '33.00', '2', '66.00');
INSERT INTO `order_goods` VALUES ('5', '29', '2', '', 'upload/logo/594fe9691d421jpg', '33.00', '2', '66.00');
INSERT INTO `order_goods` VALUES ('6', '30', '1', '', 'upload/logo/594e806ec6ab6jpg', '33.00', '2', '66.00');
INSERT INTO `order_goods` VALUES ('7', '30', '14', '', 'upload/logo/594f246a855d9jpg', '55.00', '1', '55.00');
INSERT INTO `order_goods` VALUES ('8', '30', '3', '', 'upload/logo/594e831c0c700jpg', '33.00', '1', '33.00');
INSERT INTO `order_goods` VALUES ('9', '31', '2', '', 'upload/logo/594fe9691d421jpg', '33.00', '3', '99.00');
INSERT INTO `order_goods` VALUES ('10', '32', '16', '', 'upload/logo/594f2636647b0jpg', '66.00', '1', '66.00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
