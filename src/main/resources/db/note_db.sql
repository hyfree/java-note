/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : note_db

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-08-22 19:07:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `noteinfo`
-- ----------------------------
DROP TABLE IF EXISTS `noteinfo`;
CREATE TABLE `noteinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n_title` varchar(200) DEFAULT NULL,
  `n_address` varchar(255) DEFAULT NULL,
  `n_mdtext` varchar(10000) DEFAULT NULL,
  `n_content` varchar(255) DEFAULT NULL,
  `n_noteid` varchar(255) DEFAULT NULL,
  `n_typeid` varchar(255) DEFAULT NULL,
  `n_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of noteinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `typeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `typeinfo`;
CREATE TABLE `typeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(255) DEFAULT NULL,
  `t_pid` varchar(255) DEFAULT NULL,
  `t_userid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123583 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typeinfo
-- ----------------------------
INSERT INTO `typeinfo` VALUES ('123567', 'Java', '1', '1');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `upwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', '10000', 'admin', 'admin');
