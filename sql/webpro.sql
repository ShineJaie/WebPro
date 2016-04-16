/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50628
Source Host           : 127.0.0.1:3306
Source Database       : webpro

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2016-04-16 14:33:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `authoritycolumnid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------

-- ----------------------------
-- Table structure for authoritycolumn
-- ----------------------------
DROP TABLE IF EXISTS `authoritycolumn`;
CREATE TABLE `authoritycolumn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authoritycolumn
-- ----------------------------

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(255) DEFAULT NULL,
  `pubuser` char(20) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `clicknum` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '最高法:汲取\"陈满杀人案\"等冤错案件教训', 'shinejaie', '2016-03-14 01:16:54', '6', '反腐|提周永康泄国家秘密案 清除队伍害群之马 \"老虎\"量刑不单看涉案金额\r\n法院|司法公开倒逼法官提高能力 实现审判执行全程留痕 解决人才流失问题\r\n典型|北京昌平女法官事迹写入报告 避群众受伤勇斗持枪歹徒牺牲 年仅38岁');
INSERT INTO `news` VALUES ('2', '人机大战第四局李世石首次获胜', 'shinejaie', '2016-03-14 01:16:54', '1', '2016-03-14 01:13:54');
INSERT INTO `news` VALUES ('3', '程序员被聘用的13个开发技能', 'shinejaie', '2016-03-14 01:16:54', '1', '程序员被聘用的13个开发技能');
INSERT INTO `news` VALUES ('4', '教你成为优秀程序员的8个方法', 'shinejaie', '2016-03-14 01:16:54', '1', '教你成为优秀程序员的8个方法');
INSERT INTO `news` VALUES ('5', '2016 年 3 月 TIOBE 编程语言排行榜', 'shinejaie', '2016-03-14 01:16:54', '6', '2016 年 3 月 TIOBE 编程语言排行榜');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `depth` int(8) DEFAULT NULL,
  `treedeep1id` int(11) DEFAULT NULL,
  `treedeep2id` int(11) DEFAULT NULL,
  `treedeep3id` int(11) DEFAULT NULL,
  `treedeep4id` int(11) DEFAULT NULL,
  `treedeep5id` int(11) DEFAULT NULL,
  `treedeep6id` int(11) DEFAULT NULL,
  `treedeep7id` int(11) DEFAULT NULL,
  `treedeep8id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------

-- ----------------------------
-- Table structure for user2usergroup
-- ----------------------------
DROP TABLE IF EXISTS `user2usergroup`;
CREATE TABLE `user2usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `usergroupid` int(11) DEFAULT NULL,
  `usergroupname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user2usergroup
-- ----------------------------
INSERT INTO `user2usergroup` VALUES ('1', '2016-03-24 15:55:09', '2016-03-24 15:55:09', '1', 'su', '1', 'ROLE_SUPER');
INSERT INTO `user2usergroup` VALUES ('2', '2016-03-24 15:55:50', '2016-03-24 15:55:50', '1', 'su', '2', 'ROLE_ADMIN');
INSERT INTO `user2usergroup` VALUES ('3', '2016-03-24 15:56:18', '2016-03-24 15:56:18', '1', 'su', '3', 'ROLE_USER');
INSERT INTO `user2usergroup` VALUES ('4', '2016-03-24 15:57:07', '2016-03-24 15:57:07', '2', 'qwe', '2', 'ROLE_ADMIN');
INSERT INTO `user2usergroup` VALUES ('5', '2016-03-24 15:57:20', '2016-03-24 15:57:20', '2', 'qwe', '3', 'ROLE_USER');
INSERT INTO `user2usergroup` VALUES ('6', '2016-03-24 15:57:34', '2016-03-24 15:57:34', '3', 'asd', '3', 'ROLE_USER');

-- ----------------------------
-- Table structure for usergroup
-- ----------------------------
DROP TABLE IF EXISTS `usergroup`;
CREATE TABLE `usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `groupname` varchar(20) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usergroup
-- ----------------------------
INSERT INTO `usergroup` VALUES ('1', '2016-03-24 15:51:57', '2016-03-24 15:51:57', 'ROLE_SUPER', '超级管理员');
INSERT INTO `usergroup` VALUES ('2', '2016-03-24 15:52:18', '2016-03-24 15:52:18', 'ROLE_ADMIN', '管理员');
INSERT INTO `usergroup` VALUES ('3', '2016-03-24 15:52:47', '2016-03-24 15:52:47', 'ROLE_USER', '用户');

-- ----------------------------
-- Table structure for usergroup2authority
-- ----------------------------
DROP TABLE IF EXISTS `usergroup2authority`;
CREATE TABLE `usergroup2authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `authorityname` varchar(20) DEFAULT NULL,
  `usergroupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usergroup2authority
-- ----------------------------

-- ----------------------------
-- Table structure for usergroup2permission
-- ----------------------------
DROP TABLE IF EXISTS `usergroup2permission`;
CREATE TABLE `usergroup2permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `usergroupid` int(11) DEFAULT NULL,
  `permissionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usergroup2permission
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdate` datetime DEFAULT NULL,
  `modifydate` datetime DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `enable` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '2016-03-24 15:48:30', '2016-03-24 15:48:30', 'su', '$2a$10$Pm8fY11yGq2NY/CbM667tekJ7C/V7v9k3LSxO8w10DExSwwFBrUh6', 'shinejaie@gmail.com', '1', '1');
INSERT INTO `users` VALUES ('2', '2016-03-24 15:49:25', '2016-03-24 15:49:25', 'asd', '$2a$10$Pm8fY11yGq2NY/CbM667tekJ7C/V7v9k3LSxO8w10DExSwwFBrUh6', 'shinejaie@gmail.com', '0', '1');
INSERT INTO `users` VALUES ('3', '2016-03-24 15:50:05', '2016-03-24 15:50:05', 'qwe', '$2a$10$Pm8fY11yGq2NY/CbM667tekJ7C/V7v9k3LSxO8w10DExSwwFBrUh6', 'shinejaie@gmail.com', '0', '1');
INSERT INTO `users` VALUES ('4', '2016-03-26 16:40:03', '2016-03-26 16:40:03', 'qq', '$2a$10$rC.lGM1pB13hBiZeJQlNeeET4WQAWA9iSZkZEVY8oBQAX9Qoc0PKK', 'qq@qq.com', '1', '1');
INSERT INTO `users` VALUES ('5', '2016-03-26 16:45:45', '2016-03-26 16:45:45', 'qqq', '$2a$10$ZwS3NVlJ4ZzejDXEfIeIXeNRj64Eiu0fmGdYAX/9JoODDVueq54MK', 'qq@qq.com', '1', '1');
INSERT INTO `users` VALUES ('6', '2016-03-26 16:46:48', '2016-03-26 16:46:48', 'qqqq', '$2a$10$ssTI/6LrestGEirKdhBhreKKmCUURfKwLQCu5YihrrLDpawaLuxp2', 'qq@qq.com', '1', '0');
