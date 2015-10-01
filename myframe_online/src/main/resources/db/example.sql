/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50622
Source Host           : 127.0.0.1:3306
Source Database       : example

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2015-09-28 21:54:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pub_authorities
-- ----------------------------
DROP TABLE IF EXISTS `pub_authorities`;
CREATE TABLE `pub_authorities` (
  `authority_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `authority_name` varchar(40) COLLATE utf8_bin NOT NULL,
  `authority_desc` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `enabled` int(10) NOT NULL,
  `issys` int(10) NOT NULL,
  PRIMARY KEY (`authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pub_authorities
-- ----------------------------
INSERT INTO `pub_authorities` VALUES ('1', 'ROLE_ADMIN', '超级管理员', '1', '0');
INSERT INTO `pub_authorities` VALUES ('2', 'ROLE_USER', '普通用户', '1', '0');

-- ----------------------------
-- Table structure for pub_authorities_resources
-- ----------------------------
DROP TABLE IF EXISTS `pub_authorities_resources`;
CREATE TABLE `pub_authorities_resources` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `authority_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `resource_id` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_res_aut` (`authority_id`),
  KEY `fk_res` (`resource_id`),
  CONSTRAINT `fk_res` FOREIGN KEY (`resource_id`) REFERENCES `pub_resources` (`resource_id`),
  CONSTRAINT `fk_res_aut` FOREIGN KEY (`authority_id`) REFERENCES `pub_authorities` (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pub_authorities_resources
-- ----------------------------
INSERT INTO `pub_authorities_resources` VALUES ('1', '1', 'system');
INSERT INTO `pub_authorities_resources` VALUES ('2', '1', 'user');
INSERT INTO `pub_authorities_resources` VALUES ('3', '2', 'system');
INSERT INTO `pub_authorities_resources` VALUES ('4', '2', 'user');
INSERT INTO `pub_authorities_resources` VALUES ('5', '2', 'role');
INSERT INTO `pub_authorities_resources` VALUES ('6', '1', '[B@3d5c0514');
INSERT INTO `pub_authorities_resources` VALUES ('7', '1', '[B@5d28345a');
INSERT INTO `pub_authorities_resources` VALUES ('8', '1', '[B@318c6f79');
INSERT INTO `pub_authorities_resources` VALUES ('9', '1', '[B@13007191');
INSERT INTO `pub_authorities_resources` VALUES ('10', '1', '[B@630afe0d');
INSERT INTO `pub_authorities_resources` VALUES ('18', '1', 'role');
INSERT INTO `pub_authorities_resources` VALUES ('19', '2', '[B@3be441c8');
INSERT INTO `pub_authorities_resources` VALUES ('20', '2', '[B@6d6865d');
INSERT INTO `pub_authorities_resources` VALUES ('21', '2', '[B@38aca36d');
INSERT INTO `pub_authorities_resources` VALUES ('22', '2', '[B@7d32391c');
INSERT INTO `pub_authorities_resources` VALUES ('23', '2', '[B@788cc1d7');
INSERT INTO `pub_authorities_resources` VALUES ('24', '2', '[B@1af1e7fa');
INSERT INTO `pub_authorities_resources` VALUES ('25', '2', '[B@3d5c0514');
INSERT INTO `pub_authorities_resources` VALUES ('26', '2', '[B@630afe0d');
INSERT INTO `pub_authorities_resources` VALUES ('27', '2', '[B@61429ead');
INSERT INTO `pub_authorities_resources` VALUES ('28', '2', '[B@645b5c7f');

-- ----------------------------
-- Table structure for pub_resources
-- ----------------------------
DROP TABLE IF EXISTS `pub_resources`;
CREATE TABLE `pub_resources` (
  `resource_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `resource_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `resource_type` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT 'action',
  `priority` int(10) NOT NULL DEFAULT '0',
  `resource_string` varchar(200) COLLATE utf8_bin NOT NULL,
  `resource_desc` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `enabled` int(10) NOT NULL DEFAULT '1',
  `issys` int(10) NOT NULL DEFAULT '0',
  `pid` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `FK_pub_resources` (`pid`),
  CONSTRAINT `FK_pub_resources` FOREIGN KEY (`pid`) REFERENCES `pub_resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pub_resources
-- ----------------------------
INSERT INTO `pub_resources` VALUES ('[B@13007191', '图表数据', 'jsp', '0', '/user/echarts.htm', '图表数据', '1', '0', '[B@3d5c0514');
INSERT INTO `pub_resources` VALUES ('[B@1af1e7fa', '柱形图与线形图', 'jsp', '0', '/user/bar1.htm', '柱形图表数据', '1', '0', '[B@3d5c0514');
INSERT INTO `pub_resources` VALUES ('[B@318c6f79', '角色资源管理', 'jsp', '2', '/admin/authoritiesResources.htm', '角色资源权限', '1', '0', 'system');
INSERT INTO `pub_resources` VALUES ('[B@38aca36d', '发展计划效果', 'jsp', '0', '/user/removeaddress.htm', '发展计划效果', '1', '0', '[B@3d5c0514');
INSERT INTO `pub_resources` VALUES ('[B@3be441c8', '百度地图', 'jsp', '0', '/user/map.htm', '地图', '1', '0', '[B@630afe0d');
INSERT INTO `pub_resources` VALUES ('[B@3d5c0514', '图表', 'jsp', '0', '/', '图表', '1', '0', 'menu');
INSERT INTO `pub_resources` VALUES ('[B@5d28345a', '权限管理', 'jsp', '0', '/admin/authority.htm', '权限管理', '1', '0', 'system');
INSERT INTO `pub_resources` VALUES ('[B@61429ead', '天气预报', 'jsp', '0', '/user/weather.htm', '简单天气预报', '1', '0', '[B@630afe0d');
INSERT INTO `pub_resources` VALUES ('[B@630afe0d', '接口调用', 'jsp', '2', '/', '其他功能效果', '1', '1', 'menu');
INSERT INTO `pub_resources` VALUES ('[B@645b5c7f', '美女图片', 'jsp', '0', '/user/girlpage.htm', '美女图片页面', '1', '0', '[B@630afe0d');
INSERT INTO `pub_resources` VALUES ('[B@6d6865d', 'makepoint特效', 'jsp', '0', '/user/makepoint.htm', 'makepoint特效', '1', '0', '[B@3d5c0514');
INSERT INTO `pub_resources` VALUES ('[B@788cc1d7', '发邮件', 'jsp', '0', '/user/email.htm', '发邮件', '1', '0', '[B@7d32391c');
INSERT INTO `pub_resources` VALUES ('[B@7d32391c', '邮箱', 'jsp', '0', '/', '邮箱功能', '1', '0', 'menu');
INSERT INTO `pub_resources` VALUES ('index', '主页', 'index', '0', '/index.jsp', '主页', '1', '0', null);
INSERT INTO `pub_resources` VALUES ('menu', '主菜单', 'jsp', '0', '/', '主菜单', '1', '0', null);
INSERT INTO `pub_resources` VALUES ('role', '角色管理', 'jsp', '0', '/', '角色管理', '1', '0', 'system');
INSERT INTO `pub_resources` VALUES ('system', '系统管理', 'jsp', '1', '/', '系统管理', '1', '0', 'menu');
INSERT INTO `pub_resources` VALUES ('user', '菜单资源管理', 'jsp', '1', '/admin/resource.htm', '资源管理', '1', '0', 'system');

-- ----------------------------
-- Table structure for pub_roles
-- ----------------------------
DROP TABLE IF EXISTS `pub_roles`;
CREATE TABLE `pub_roles` (
  `role_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `role_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `role_desc` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `enabled` int(10) NOT NULL,
  `issys` int(10) NOT NULL COMMENT '角色表',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pub_roles
-- ----------------------------
INSERT INTO `pub_roles` VALUES ('1', 'ROLE_ADMIN', '系统管理员', '1', '0');
INSERT INTO `pub_roles` VALUES ('2', 'ROLE_USER', '营业员', '1', '0');

-- ----------------------------
-- Table structure for pub_roles_authorities
-- ----------------------------
DROP TABLE IF EXISTS `pub_roles_authorities`;
CREATE TABLE `pub_roles_authorities` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `role_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `authority_id` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aut_role` (`role_id`),
  KEY `fk_aut` (`authority_id`),
  CONSTRAINT `fk_aut` FOREIGN KEY (`authority_id`) REFERENCES `pub_authorities` (`authority_id`),
  CONSTRAINT `fk_aut_role` FOREIGN KEY (`role_id`) REFERENCES `pub_roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pub_roles_authorities
-- ----------------------------
INSERT INTO `pub_roles_authorities` VALUES ('1', '1', '1');
INSERT INTO `pub_roles_authorities` VALUES ('2', '1', '2');
INSERT INTO `pub_roles_authorities` VALUES ('3', '2', '2');

-- ----------------------------
-- Table structure for pub_users
-- ----------------------------
DROP TABLE IF EXISTS `pub_users`;
CREATE TABLE `pub_users` (
  `user_id` int(10) NOT NULL,
  `user_account` varchar(30) COLLATE utf8_bin NOT NULL,
  `user_name` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_password` varchar(100) COLLATE utf8_bin NOT NULL,
  `enabled` int(10) NOT NULL,
  `issys` int(10) NOT NULL,
  `user_desc` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户表',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pub_users
-- ----------------------------
INSERT INTO `pub_users` VALUES ('1', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', '1', '系统管理员');
INSERT INTO `pub_users` VALUES ('2', 'super', 'super', '3205f64462d77d8f98ef329dec55e668', '1', '1', '系统管理员');
INSERT INTO `pub_users` VALUES ('3', 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', '1', '1', '营业员');

-- ----------------------------
-- Table structure for pub_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `pub_users_roles`;
CREATE TABLE `pub_users_roles` (
  `id` int(10) NOT NULL,
  `user_id` int(32) NOT NULL,
  `role_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '角色和用户中间表',
  PRIMARY KEY (`id`),
  KEY `fk_user` (`user_id`),
  KEY `fk_role` (`role_id`),
  CONSTRAINT `FK_pub_users_roles` FOREIGN KEY (`user_id`) REFERENCES `pub_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `pub_roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pub_users_roles
-- ----------------------------
INSERT INTO `pub_users_roles` VALUES ('1', '1', '1');
INSERT INTO `pub_users_roles` VALUES ('2', '2', '2');
INSERT INTO `pub_users_roles` VALUES ('3', '3', '2');

-- ----------------------------
-- Table structure for tmenu
-- ----------------------------
DROP TABLE IF EXISTS `tmenu`;
CREATE TABLE `tmenu` (
  `ID` varchar(36) NOT NULL,
  `ICONCLS` varchar(50) DEFAULT NULL,
  `TEXT` varchar(100) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `PID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `FK4C3C3B3BD1ECCF7` (`PID`),
  CONSTRAINT `FK4C3C3B3BD1ECCF7` FOREIGN KEY (`PID`) REFERENCES `tmenu` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tmenu
-- ----------------------------

-- ----------------------------
-- Table structure for tuser
-- ----------------------------
DROP TABLE IF EXISTS `tuser`;
CREATE TABLE `tuser` (
  `ID` varchar(36) NOT NULL,
  `CREATEDATETIME` datetime DEFAULT NULL,
  `MODIFYDATETIME` datetime DEFAULT NULL,
  `NAME` varchar(100) NOT NULL,
  `PWD` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `NAME_2` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tuser
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '测试', null, null);
INSERT INTO `user` VALUES ('2', '测试2', null, null);
INSERT INTO `user` VALUES ('3', '测试3', null, null);
INSERT INTO `user` VALUES ('4', '测试3', null, null);
