/*
Navicat MySQL Data Transfer

Source Server         : my_bs
Source Server Version : 50616
Source Host           : 47.104.209.118:3306
Source Database       : db_detection

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2018-05-13 19:00:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_blogger
-- ----------------------------
DROP TABLE IF EXISTS `t_blogger`;
CREATE TABLE `t_blogger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `profile` text,
  `nickName` varchar(50) DEFAULT NULL,
  `sign` varchar(100) DEFAULT NULL,
  `imageName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blogger
-- ----------------------------
INSERT INTO `t_blogger` VALUES ('1', 'java1234', '269445a31ab8ae63b866fb2cdb037ad9', '<p><br/></p><p><img src=\"http://img.baidu.com/hi/tsj/t_0009.gif\"/>&nbsp;本屌出身贫寒，从小学习努力，勤奋刻苦；</p><p><img src=\"http://img.baidu.com/hi/tsj/t_0013.gif\"/> &nbsp;功夫不负有心人；</p><p><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/> &nbsp;座右铭&nbsp;“知识改变命运，技术改变世界” ；</p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p>', '甲乙丙', '知识改变命运，技术改变世界', '20180501091643.jpg');

-- ----------------------------
-- Table structure for t_checkData
-- ----------------------------
DROP TABLE IF EXISTS `t_checkData`;
CREATE TABLE `t_checkData` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dataId` varchar(60) NOT NULL DEFAULT '',
  `scgy` varchar(10) DEFAULT NULL COMMENT '生产工艺',
  `yljg` varchar(10) DEFAULT NULL COMMENT '原料结构',
  `cpzl` varchar(10) DEFAULT NULL COMMENT '产品种类',
  `rsxn` int(10) DEFAULT NULL COMMENT '燃烧性能',
  `yhwz` int(10) DEFAULT NULL COMMENT '有害物质',
  `sld` int(10) DEFAULT NULL COMMENT '色牢度',
  `zwql` int(10) DEFAULT NULL COMMENT '织物强力',
  `ccwd` int(10) DEFAULT NULL COMMENT '尺寸稳定性',
  `kqqqm` int(10) DEFAULT NULL COMMENT '抗起球起毛性',
  `mcld` int(10) DEFAULT NULL COMMENT '摩擦牢度',
  `fsx` int(10) DEFAULT NULL COMMENT '防水性',
  PRIMARY KEY (`id`,`dataId`),
  KEY `dataId` (`dataId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='asa';

-- ----------------------------
-- Records of t_checkData
-- ----------------------------
INSERT INTO `t_checkData` VALUES ('0', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkData` VALUES ('1', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '4', '3', '4', '4', '4', '4', '4', '4');
INSERT INTO `t_checkData` VALUES ('2', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkData` VALUES ('3', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkData` VALUES ('4', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkData` VALUES ('5', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkData` VALUES ('6', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkData` VALUES ('7', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkData` VALUES ('8', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkData` VALUES ('9', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkData` VALUES ('10', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkData` VALUES ('11', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkData` VALUES ('12', '222222', 'A', 'B', 'C', '1', '2', '3', '4', '5', '4', '2', '1');
INSERT INTO `t_checkData` VALUES ('13', '26feff0f-747f-443a-b48a-49183c3bd549', 'A', 'B', 'C', '1', '2', '3', '4', '5', '4', '3', '1');

-- ----------------------------
-- Table structure for t_database
-- ----------------------------
DROP TABLE IF EXISTS `t_database`;
CREATE TABLE `t_database` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `dataId` varchar(60) NOT NULL,
  `dataName` varchar(40) DEFAULT NULL COMMENT '采集数据名字',
  `fileName` varchar(30) DEFAULT NULL,
  `filePath` varchar(30) DEFAULT NULL COMMENT '文件存放路径',
  `createDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上传时间',
  `stateAnalyze` int(1) DEFAULT '0' COMMENT '分析状态-0未完成   -1完成',
  `rst` varchar(60) DEFAULT NULL,
  `anDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '分析时间',
  `anResult` varchar(10) DEFAULT NULL COMMENT '分析结果',
  `stateForecast` int(1) DEFAULT '0' COMMENT '预测状态-0未完成   -1完成',
  `rst2` varchar(60) DEFAULT NULL,
  `foDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '预测时间',
  `foResult` varchar(10) DEFAULT NULL COMMENT '预测结果',
  `downloadPath` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`,`dataId`),
  KEY `dataId` (`dataId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_database
-- ----------------------------
INSERT INTO `t_database` VALUES ('2', '222222', 'wwwww', null, null, '2018-05-13 18:19:13', '1', '[2.75,1.0,1.0,1.0,1.0,1.0,1.0,1.0]', '2018-05-13 18:19:13', '合格', '1', '[22]', '2018-05-13 18:19:13', '合格百分率为0%', null);
INSERT INTO `t_database` VALUES ('4', 'd82b77a2-b1d9-41ff-a044-f78942e14253', '11', 'zzz.txt', null, '2018-05-13 15:31:03', '0', '[1,2,3,4,5,4,3,2]', '2018-05-13 15:31:03', '不合格', '0', null, '2018-05-13 15:31:03', null, null);
INSERT INTO `t_database` VALUES ('5', '26feff0f-747f-443a-b48a-49183c3bd549', '123456', '工作室安排.txt', null, '2018-05-13 18:07:08', '1', '[2.875,1.0,1.0,1.0,1.0,1.0,1.0,1.0]', '2018-05-13 18:07:08', '合格', '1', null, '2018-05-13 18:07:08', null, null);
INSERT INTO `t_database` VALUES ('6', '53315504-e2fe-4b58-80d7-8a0b7b006a5b', 'lll', 'zzz.txt', null, '2018-05-13 18:38:04', '1', '[1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0]', '2018-05-13 18:38:04', '不合格', '1', '[]', '2018-05-13 18:38:04', '合格百分率为�%', null);
