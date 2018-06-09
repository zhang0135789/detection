/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : db_detection

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-06-09 23:12:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_analyze
-- ----------------------------
DROP TABLE IF EXISTS `t_analyze`;
CREATE TABLE `t_analyze` (
  `dataId` varchar(60) NOT NULL,
  `rsxn` varchar(255) DEFAULT NULL COMMENT '燃烧性能',
  `yhwz` varchar(255) DEFAULT NULL COMMENT '有害物质',
  `sld` varchar(255) DEFAULT NULL COMMENT '色牢度',
  `zwql` varchar(255) DEFAULT NULL COMMENT '织物强力',
  `ccwd` varchar(255) DEFAULT NULL COMMENT '尺寸稳定性',
  `kqqqm` varchar(255) DEFAULT NULL COMMENT '抗起球起毛性',
  `mcld` varchar(255) DEFAULT NULL COMMENT '摩擦牢度',
  `fsx` varchar(255) DEFAULT NULL COMMENT '防水性',
  PRIMARY KEY (`dataId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分析结果表';

-- ----------------------------
-- Records of t_analyze
-- ----------------------------

-- ----------------------------
-- Table structure for t_analyzemonth
-- ----------------------------
DROP TABLE IF EXISTS `t_analyzemonth`;
CREATE TABLE `t_analyzemonth` (
  `dataId` varchar(60) NOT NULL,
  `dataType` varchar(255) DEFAULT NULL COMMENT '产品类型',
  `dataMonth` varchar(255) DEFAULT NULL COMMENT '产品月份',
  `dataXishu` varchar(255) DEFAULT NULL COMMENT '产品系数',
  PRIMARY KEY (`dataId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='月合格率关系表';

-- ----------------------------
-- Records of t_analyzemonth
-- ----------------------------

-- ----------------------------
-- Table structure for t_anayzecontrast
-- ----------------------------
DROP TABLE IF EXISTS `t_anayzecontrast`;
CREATE TABLE `t_anayzecontrast` (
  `dataId` varchar(60) NOT NULL,
  `dataType` varchar(255) DEFAULT NULL,
  `rsxn` varchar(255) DEFAULT NULL COMMENT '燃烧性能所占比例',
  `yhwz` varchar(255) DEFAULT NULL COMMENT '有害物质所占比例',
  `sld` varchar(255) DEFAULT NULL COMMENT '色牢度所占比例',
  `zwql` varchar(255) DEFAULT NULL COMMENT '织物强力所占比例',
  `ccwd` varchar(255) DEFAULT NULL COMMENT '尺寸稳定性所占比例',
  `kqqqm` varchar(255) DEFAULT NULL COMMENT '抗起球起毛性所占比例',
  `mcld` varchar(255) DEFAULT NULL COMMENT '摩擦牢度所占比例',
  `fsx` varchar(255) DEFAULT NULL COMMENT '防水性所占比例',
  PRIMARY KEY (`dataId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_anayzecontrast
-- ----------------------------

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
-- Table structure for t_checkdata
-- ----------------------------
DROP TABLE IF EXISTS `t_checkdata`;
CREATE TABLE `t_checkdata` (
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='asa';

-- ----------------------------
-- Records of t_checkdata
-- ----------------------------
INSERT INTO `t_checkdata` VALUES ('1', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '4', '3', '4', '4', '4', '4', '4', '4');
INSERT INTO `t_checkdata` VALUES ('2', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkdata` VALUES ('3', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkdata` VALUES ('4', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkdata` VALUES ('5', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkdata` VALUES ('6', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkdata` VALUES ('7', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkdata` VALUES ('8', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkdata` VALUES ('9', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkdata` VALUES ('10', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkdata` VALUES ('11', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');
INSERT INTO `t_checkdata` VALUES ('12', '222222', 'A', 'B', 'C', '1', '2', '3', '4', '5', '4', '2', '1');
INSERT INTO `t_checkdata` VALUES ('13', '26feff0f-747f-443a-b48a-49183c3bd549', 'A', 'B', 'C', '1', '2', '3', '4', '5', '4', '3', '1');
INSERT INTO `t_checkdata` VALUES ('14', 'd82b77a2-b1d9-41ff-a044-f78942e14253', 'A', 'B', 'C', '1', '2', '3', '4', '4', '3', '2', '1');

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

-- ----------------------------
-- Table structure for t_databaseinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_databaseinfo`;
CREATE TABLE `t_databaseinfo` (
  `dataId` varchar(60) NOT NULL,
  `dataType` varchar(255) DEFAULT NULL COMMENT '产品类型',
  `dataInfo` varchar(255) DEFAULT NULL COMMENT '样本信息',
  `dataUser` varchar(255) DEFAULT NULL COMMENT '记录人员',
  `dataMounth` varchar(60) DEFAULT NULL COMMENT '记录月份',
  `createDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updateDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dataId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_databaseinfo
-- ----------------------------

-- ----------------------------
-- Table structure for t_forecast
-- ----------------------------
DROP TABLE IF EXISTS `t_forecast`;
CREATE TABLE `t_forecast` (
  `dataId` varchar(60) NOT NULL,
  `rsxn` varchar(255) DEFAULT NULL COMMENT '燃烧性能',
  `yhwz` varchar(255) DEFAULT NULL COMMENT '有害物质',
  `sld` varchar(255) DEFAULT NULL COMMENT '色牢度',
  `zwql` varchar(255) DEFAULT NULL COMMENT '织物强力',
  `ccwd` varchar(255) DEFAULT NULL COMMENT '尺寸稳定性',
  `kqqqm` varchar(255) DEFAULT NULL COMMENT '抗起球起毛性',
  `mcld` varchar(255) DEFAULT NULL COMMENT '摩擦牢度',
  `fsx` varchar(255) DEFAULT NULL COMMENT '防水性',
  PRIMARY KEY (`dataId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='预测结果表';

-- ----------------------------
-- Records of t_forecast
-- ----------------------------

-- ----------------------------
-- Table structure for t_forecastmonth
-- ----------------------------
DROP TABLE IF EXISTS `t_forecastmonth`;
CREATE TABLE `t_forecastmonth` (
  `dataId` varchar(60) NOT NULL,
  `dataType` varchar(255) DEFAULT NULL COMMENT '产品类型',
  `dataMonth` varchar(255) DEFAULT NULL COMMENT '产品月份',
  `dataXishu` varchar(255) DEFAULT NULL COMMENT '产品系数',
  PRIMARY KEY (`dataId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='按月预测合格率表';

-- ----------------------------
-- Records of t_forecastmonth
-- ----------------------------

-- ----------------------------
-- Table structure for t_module
-- ----------------------------
DROP TABLE IF EXISTS `t_module`;
CREATE TABLE `t_module` (
  `module_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `ctype` varchar(255) DEFAULT NULL COMMENT '类型',
  `order_no` int(11) DEFAULT NULL COMMENT '排序号',
  `remark` varchar(255) DEFAULT NULL COMMENT '说明',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_module
-- ----------------------------

-- ----------------------------
-- Table structure for t_rolemodule
-- ----------------------------
DROP TABLE IF EXISTS `t_rolemodule`;
CREATE TABLE `t_rolemodule` (
  `module_id` varchar(50) NOT NULL COMMENT '模块id',
  `role_id` varchar(50) NOT NULL COMMENT '角色id(用户id)',
  PRIMARY KEY (`module_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户模块关联表';

-- ----------------------------
-- Records of t_rolemodule
-- ----------------------------
