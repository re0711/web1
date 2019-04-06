/*
Navicat MySQL Data Transfer

Source Server         : mysql1
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-04-06 21:57:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `gender` int(2) NOT NULL DEFAULT '1',
  `age` int(4) DEFAULT NULL,
  `signature` varchar(128) DEFAULT '',
  `photo` varchar(100) DEFAULT 'f.jpg',
  `fanCount` int(6) NOT NULL DEFAULT '0',
  `followCount` int(6) NOT NULL DEFAULT '0',
  `roleId` int(2) unsigned zerofill NOT NULL DEFAULT '03',COMMENT '1:forum adminstrator 2:category adminstrator 3:general user',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'aaa', '123456', '1', '24', '', 'f.jpg', '0', '0', '03');
INSERT INTO `user` VALUES ('2', 'bbb', '123456', '1', '24', '', 'f.jpg', '0', '0', '02');
INSERT INTO `user` VALUES ('3', 'admin', '123456', '1', '24', '', 'f.jpg', '0', '0', '01');


-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `administratorId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `app1_category_a68d6894` (`administratorId`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`administratorId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Java', '1');
INSERT INTO `category` VALUES ('2', 'Algorithmic', '1');
INSERT INTO `category` VALUES ('3', 'Python', '1');
INSERT INTO `category` VALUES ('4', 'Other', '1');

-- ----------------------------
-- Table structure for bbs
-- ----------------------------
DROP TABLE IF EXISTS `bbs`;
CREATE TABLE `bbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `summary` varchar(256) DEFAULT NULL,
  `content` longtext NOT NULL,
  `createdAt` datetime NOT NULL,
  `authorId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `commentCount` int(11) NOT NULL DEFAULT '0',
  `lastReply` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app1_bbs_4f331e2f` (`authorId`),
  KEY `app1_bbs_b583a629` (`categoryId`),
  CONSTRAINT `bbs_ibfk_1` FOREIGN KEY (`authorId`) REFERENCES `user` (`id`),
  CONSTRAINT `bbs_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `date` datetime NOT NULL,
  `bbsId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `replyId` int(11) DEFAULT '0',
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `b` (`userId`),
  KEY `c` (`replyId`),
  KEY `s` (`username`),
  KEY `a` (`bbsId`),
  CONSTRAINT `a` FOREIGN KEY (`bbsId`) REFERENCES `bbs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `b` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `s` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `q` (`bid`),
  KEY `w` (`aid`),
  CONSTRAINT `q` FOREIGN KEY (`bid`) REFERENCES `user` (`id`),
  CONSTRAINT `w` FOREIGN KEY (`aid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL,
  `recipientId` int(11) NOT NULL,
  `sponsorId` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `bbsId` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `readType` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `z` (`recipientId`),
  KEY `az` (`sponsorId`),
  KEY `za` (`categoryId`),
  KEY `sd` (`bbsId`),
  CONSTRAINT `az` FOREIGN KEY (`sponsorId`) REFERENCES `user` (`id`),
  CONSTRAINT `sd` FOREIGN KEY (`bbsId`) REFERENCES `bbs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `z` FOREIGN KEY (`recipientId`) REFERENCES `user` (`id`),
  CONSTRAINT `za` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;



