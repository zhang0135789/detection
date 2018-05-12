/*
Navicat MySQL Data Transfer

Source Server         : my_bs
Source Server Version : 50616
Source Host           : 47.104.209.118:3306
Source Database       : db_detection

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2018-05-12 20:49:00
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
  `rsxn` varchar(10) DEFAULT NULL COMMENT '燃烧性能',
  `yhwz` varchar(10) DEFAULT NULL COMMENT '有害物质',
  `sld` varchar(10) DEFAULT NULL COMMENT '色牢度',
  `zwql` varchar(10) DEFAULT NULL COMMENT '织物强力',
  `ccwd` varchar(10) DEFAULT NULL COMMENT '尺寸稳定性',
  `kqqqm` varchar(10) DEFAULT NULL COMMENT '抗起球起毛性',
  `mcld` varchar(10) DEFAULT NULL COMMENT '摩擦牢度',
  `fsx` varchar(10) DEFAULT NULL COMMENT '防水性',
  PRIMARY KEY (`id`,`dataId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='asa';

-- ----------------------------
-- Records of t_checkData
-- ----------------------------

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
  `anDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '分析时间',
  `anResult` varchar(10) DEFAULT NULL COMMENT '分析结果',
  `stateForecast` int(1) DEFAULT '0' COMMENT '预测状态-0未完成   -1完成',
  `foDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '预测时间',
  `foResult` varchar(10) DEFAULT NULL COMMENT '预测结果',
  `downloadPath` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`,`dataId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_database
-- ----------------------------
INSERT INTO `t_database` VALUES ('1', '23454123', 'zwsad', null, 'c:/sda/as.xwex', '2018-05-09 17:02:49', '0', null, null, '0', null, null, null);
INSERT INTO `t_database` VALUES ('2', '222222', 'wwwww', null, null, null, '1', null, null, '0', null, null, null);
INSERT INTO `t_database` VALUES ('3', '23333', '333333', null, null, null, '1', null, null, '1', null, null, null);
