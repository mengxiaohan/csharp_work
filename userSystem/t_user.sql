/*
Navicat MySQL Data Transfer

Source Server         : local_mysql
Source Server Version : 50619
Source Host           : localhost:3306
Source Database       : userdb

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2016-10-17 08:01:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) DEFAULT NULL COMMENT '登陆名',
  `login_pwd` varchar(255) DEFAULT NULL COMMENT '登陆密码',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `descripiton` varchar(255) DEFAULT NULL COMMENT '用户描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'a', '管理员', '我是管理员，我最大');
INSERT INTO `t_user` VALUES ('2', '1', '2', '用户1', 'xxxxx');
