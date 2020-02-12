/*
Navicat MySQL Data Transfer

Source Server         : Test
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : projectms

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-03-19 15:28:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base_customer
-- ----------------------------
DROP TABLE IF EXISTS `base_customer`;
CREATE TABLE `base_customer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROJECTID` int(11) DEFAULT NULL COMMENT '项目id',
  `NAME` varchar(255) DEFAULT NULL COMMENT '需求来源',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态：0，禁用，1启用',
  `LISTID` int(11) DEFAULT NULL COMMENT '序号',
  `CREATETIME` datetime DEFAULT NULL,
  `UPDATETIME` datetime DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_customer
-- ----------------------------
INSERT INTO `base_customer` VALUES ('1', '1', '测试环境', '1', '22', '2019-01-20 15:47:38', '2019-01-20 15:48:21', '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('2', '1', '江苏省', '1', '1', '2019-01-20 15:48:32', '2019-01-20 15:48:39', '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('3', '1', '贵州省', '1', '2', '2019-01-20 15:49:34', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('4', '2', '测试环境', '1', '1', '2019-03-09 10:11:25', '2019-03-09 10:11:44', '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('5', '1', '黔南州', '1', '1', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('6', '1', '牡丹江市', '1', '2', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('7', '1', '青海省', '1', '3', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('8', '1', '武汉市', '1', '4', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('9', '1', '毕节市', '1', '5', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('10', '1', '兵团', '1', '6', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('11', '1', '黔东南州', '1', '7', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('12', '1', '苏州市', '1', '8', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('13', '1', '无锡市', '1', '9', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('14', '1', '常州市', '1', '10', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('15', '1', '镇江市', '1', '11', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('16', '1', '南京市', '1', '12', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('17', '1', '南通市', '1', '13', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('18', '1', '泰州市', '1', '14', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('19', '1', '扬州市', '1', '15', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('20', '1', '盐城市', '1', '16', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('21', '1', '淮安市', '1', '17', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('22', '1', '宿迁市', '1', '18', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('23', '1', '连云港市', '1', '19', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('24', '1', '徐州市', '1', '20', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('25', '1', '江西省', '1', '21', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('26', '1', '萍乡市', '1', '22', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('27', '1', '赣州市', '1', '23', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('28', '1', '济南市', '1', '24', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('29', '1', '南充市', '1', '25', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('30', '1', '济宁市', '1', '26', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('31', '1', '烟台市', '1', '27', '2019-01-20 15:47:00', null, '1', '超级管理员');
INSERT INTO `base_customer` VALUES ('32', '9', '江苏省', '1', '1', '2019-03-19 11:43:19', null, '19', '张晓月');

-- ----------------------------
-- Table structure for base_filesid
-- ----------------------------
DROP TABLE IF EXISTS `base_filesid`;
CREATE TABLE `base_filesid` (
  `ID` int(11) DEFAULT NULL COMMENT '序号',
  `REQUESTDATE` varchar(8) DEFAULT NULL COMMENT '日期'
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of base_filesid
-- ----------------------------
INSERT INTO `base_filesid` VALUES ('2', '20190319');

-- ----------------------------
-- Table structure for base_modular
-- ----------------------------
DROP TABLE IF EXISTS `base_modular`;
CREATE TABLE `base_modular` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL COMMENT '模块名称',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态：0，禁用，1启用',
  `PROJECTID` int(11) NOT NULL COMMENT '项目id',
  `LISTID` int(11) DEFAULT NULL COMMENT '序号',
  `CREATETIME` datetime DEFAULT NULL,
  `UPDATETIME` datetime DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_modular
-- ----------------------------
INSERT INTO `base_modular` VALUES ('1', '信访受理', '1', '1', '1', '2019-01-20 15:48:04', null, '1', '超级管理员');
INSERT INTO `base_modular` VALUES ('2', '业务办理', '1', '1', '2', null, null, null, null);
INSERT INTO `base_modular` VALUES ('3', '查询检索', '1', '1', '3', null, null, null, null);
INSERT INTO `base_modular` VALUES ('4', '复查复核', '1', '1', '4', null, null, null, null);
INSERT INTO `base_modular` VALUES ('5', '统计分析', '1', '1', '5', null, null, null, null);
INSERT INTO `base_modular` VALUES ('6', '退休安置', '1', '2', '1', '2019-03-09 09:44:03', '2019-03-09 09:49:47', '1', '超级管理员');

-- ----------------------------
-- Table structure for base_month
-- ----------------------------
DROP TABLE IF EXISTS `base_month`;
CREATE TABLE `base_month` (
  `MONTH` varchar(255) DEFAULT NULL COMMENT '月份',
  `DATEFORMAT` varchar(255) DEFAULT NULL COMMENT '日期格式',
  `LISTID` int(11) DEFAULT NULL COMMENT '序号'
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of base_month
-- ----------------------------
INSERT INTO `base_month` VALUES ('一月', '01', '1');
INSERT INTO `base_month` VALUES ('二月', '02', '2');
INSERT INTO `base_month` VALUES ('三月', '03', '3');
INSERT INTO `base_month` VALUES ('四月', '04', '4');
INSERT INTO `base_month` VALUES ('五月', '05', '5');
INSERT INTO `base_month` VALUES ('六月', '06', '6');
INSERT INTO `base_month` VALUES ('七月', '07', '7');
INSERT INTO `base_month` VALUES ('八月', '08', '8');
INSERT INTO `base_month` VALUES ('九月', '09', '9');
INSERT INTO `base_month` VALUES ('十月', '10', '10');
INSERT INTO `base_month` VALUES ('十一月', '11', '11');
INSERT INTO `base_month` VALUES ('十二月', '12', '12');

-- ----------------------------
-- Table structure for base_project
-- ----------------------------
DROP TABLE IF EXISTS `base_project`;
CREATE TABLE `base_project` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL COMMENT '需求来源',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态：0，禁用，1启用',
  `LISTID` int(11) DEFAULT NULL COMMENT '序号',
  `CREATETIME` datetime DEFAULT NULL,
  `UPDATETIME` datetime DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_project
-- ----------------------------
INSERT INTO `base_project` VALUES ('1', '阳光信访', '1', '1', '2019-01-20 15:48:04', null, '1', '超级管理员');
INSERT INTO `base_project` VALUES ('2', '退役军人', '1', '2', '2019-03-08 20:52:39', '2019-03-08 20:56:50', '1', '超级管理员');
INSERT INTO `base_project` VALUES ('3', '人大政协', '1', '3', '2019-03-18 21:56:38', null, '19', '张晓月');
INSERT INTO `base_project` VALUES ('4', '领导包案', '1', '4', '2019-03-18 21:56:58', null, '19', '张晓月');
INSERT INTO `base_project` VALUES ('5', '信访人征信', '1', '5', '2019-03-18 21:57:23', null, '19', '张晓月');
INSERT INTO `base_project` VALUES ('6', '透明食药监', '1', '6', '2019-03-18 21:58:07', null, '19', '张晓月');
INSERT INTO `base_project` VALUES ('7', '明远项目', '1', '7', '2019-03-18 21:58:20', null, '19', '张晓月');
INSERT INTO `base_project` VALUES ('8', '人力资源', '1', '8', '2019-03-18 21:58:27', null, '19', '张晓月');
INSERT INTO `base_project` VALUES ('9', '信访项目优化', '1', '9', '2019-03-19 11:35:00', null, '19', '张晓月');

-- ----------------------------
-- Table structure for base_source
-- ----------------------------
DROP TABLE IF EXISTS `base_source`;
CREATE TABLE `base_source` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL COMMENT '需求来源',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态：0，禁用，1启用',
  `LISTID` int(11) DEFAULT NULL COMMENT '序号',
  `CREATETIME` datetime DEFAULT NULL,
  `UPDATETIME` datetime DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_source
-- ----------------------------
INSERT INTO `base_source` VALUES ('1', '黔南州', '1', '1', '2019-01-20 15:47:38', '2019-01-20 15:48:21', '1', '超级管理员');
INSERT INTO `base_source` VALUES ('2', '牡丹江市', '1', '2', '2019-01-20 15:48:32', '2019-01-20 15:48:39', '1', '超级管理员');
INSERT INTO `base_source` VALUES ('3', '青海省', '1', '3', '2019-01-20 15:49:34', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('4', '武汉市', '1', '4', '2019-03-08 21:13:54', '2019-03-08 21:14:34', '1', '超级管理员');
INSERT INTO `base_source` VALUES ('5', '毕节市', '1', '5', '2019-03-09 16:13:02', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('6', '兵团', '1', '6', '2019-03-09 16:13:11', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('7', '黔东南州', '1', '7', '2019-03-09 16:13:18', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('8', '江苏省', '1', '8', '2019-03-09 16:13:25', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('9', '苏州市', '1', '9', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('10', '无锡市', '1', '10', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('11', '常州市', '1', '11', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('12', '镇江市', '1', '12', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('13', '南京市', '1', '13', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('14', '南通市', '1', '14', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('15', '泰州市', '1', '15', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('16', '扬州市', '1', '16', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('17', '盐城市', '1', '17', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('18', '淮安市', '1', '18', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('19', '宿迁市', '1', '19', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('20', '连云港市', '1', '20', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('21', '徐州市', '1', '21', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('22', '江西省', '1', '22', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('23', '萍乡市', '1', '23', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('24', '赣州市', '1', '24', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('25', '济南市', '1', '25', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('26', '南充市', '1', '26', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('27', '贵州省', '1', '27', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('28', '济宁市', '1', '28', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('29', '烟台市', '1', '29', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('31', '产品经理', '1', '31', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('32', '市场', '1', '32', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('33', '客服', '1', '33', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('34', '测试人员', '1', '34', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('35', '李总', '1', '35', '2019-03-18 18:41:00', null, '1', '超级管理员');
INSERT INTO `base_source` VALUES ('36', '其他', '1', '36', '2019-03-18 18:41:00', null, '1', '超级管理员');

-- ----------------------------
-- Table structure for pms_bug
-- ----------------------------
DROP TABLE IF EXISTS `pms_bug`;
CREATE TABLE `pms_bug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storyid` int(11) DEFAULT NULL COMMENT '需求id',
  `taskid` int(11) DEFAULT NULL COMMENT '相关任务',
  `usecasestepid` int(11) DEFAULT NULL COMMENT '用例id',
  `project` int(11) DEFAULT NULL COMMENT '项目id',
  `type` int(11) DEFAULT NULL COMMENT 'bug类型',
  `severity` int(11) DEFAULT NULL COMMENT '严重程度',
  `assignto` int(11) DEFAULT NULL COMMENT '指派给',
  `status` int(11) DEFAULT '1' COMMENT '状态：0，删除，1，待解决，2，待审核，3，待发布，4，完成',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `step` varchar(1000) DEFAULT NULL COMMENT '步骤',
  `expect` varchar(1000) DEFAULT NULL COMMENT '期望',
  `content` blob COMMENT '内容',
  `duty` int(11) DEFAULT NULL COMMENT '责任人员id',
  `finishedby` int(11) DEFAULT NULL COMMENT '由谁完成',
  `result` int(255) DEFAULT NULL COMMENT '解决方案：1，设计如此，2，无法重现，3，解决',
  `releaseremark` blob COMMENT '发布说明',
  `sqlname` varchar(255) DEFAULT NULL COMMENT '发布sql文件',
  `sql` varchar(255) DEFAULT NULL COMMENT '发布sql附件url',
  `userid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `username` varchar(255) DEFAULT NULL COMMENT '操作人员',
  `createtime` datetime DEFAULT NULL COMMENT '创建日期',
  `finishedtime` datetime DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_bug
-- ----------------------------

-- ----------------------------
-- Table structure for pms_files
-- ----------------------------
DROP TABLE IF EXISTS `pms_files`;
CREATE TABLE `pms_files` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDERID` int(11) DEFAULT NULL COMMENT '订单ID',
  `TYPE` int(11) DEFAULT NULL COMMENT '附件类型',
  `REFERID` int(11) DEFAULT NULL COMMENT '根据附件类型关联相关业务ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态: 1：启用,0,禁用',
  `URL` varchar(255) DEFAULT NULL COMMENT '存储相对路径',
  `CREATETIME` datetime DEFAULT NULL,
  `UPDATETIME` datetime DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `lms_files_id` (`ID`),
  KEY `lms_files_orderid` (`ORDERID`),
  KEY `lms_files_referid` (`REFERID`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of pms_files
-- ----------------------------

-- ----------------------------
-- Table structure for pms_release
-- ----------------------------
DROP TABLE IF EXISTS `pms_release`;
CREATE TABLE `pms_release` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '类型：1，需求，2，bug',
  `referid` int(11) DEFAULT NULL COMMENT '关联id：需求id，bug id',
  `customerid` int(11) DEFAULT NULL COMMENT '客户id',
  `status` int(11) DEFAULT '1' COMMENT '状态：0，删除，1，待发布，2，已发布',
  `version` varchar(255) DEFAULT NULL COMMENT '发布版本',
  `userid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `username` varchar(255) DEFAULT NULL COMMENT '操作人员',
  `createtime` datetime DEFAULT NULL COMMENT '创建日期',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_release
-- ----------------------------

-- ----------------------------
-- Table structure for pms_story
-- ----------------------------
DROP TABLE IF EXISTS `pms_story`;
CREATE TABLE `pms_story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project` int(11) DEFAULT NULL COMMENT '项目id',
  `source` int(11) DEFAULT NULL COMMENT '需求来源id',
  `modular` int(11) DEFAULT NULL COMMENT '模块id',
  `pri` int(11) DEFAULT NULL COMMENT '优先级',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `status` int(11) DEFAULT '1' COMMENT '状态：0，删除，1，待分拣，2，待开发，3，待测试，4，待发布，5，已完成',
  `content` blob COMMENT '内容',
  `target` blob COMMENT '验收标准',
  `deadline` date DEFAULT NULL COMMENT '截止日期',
  `filename` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `fileurl` varchar(255) DEFAULT NULL COMMENT '附件Id',
  `attachment` varchar(255) DEFAULT NULL COMMENT '附件url',
  `openedby` int(11) DEFAULT NULL COMMENT '创建人',
  `openedbyname` varchar(255) DEFAULT NULL COMMENT '创建人姓名',
  `openeddate` datetime DEFAULT NULL COMMENT '创建日期',
  `finishdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '完成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_story
-- ----------------------------

-- ----------------------------
-- Table structure for pms_task
-- ----------------------------
DROP TABLE IF EXISTS `pms_task`;
CREATE TABLE `pms_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storyid` int(11) DEFAULT NULL COMMENT '需求id',
  `rwtype` int(11) DEFAULT NULL COMMENT '任务类型：1，设计，2，前端，3，开发，4，研究，5，事务，6，其他',
  `assignto` int(11) DEFAULT NULL COMMENT '指派给',
  `estimate` int(11) DEFAULT NULL COMMENT '预计工时',
  `deadline` date DEFAULT NULL COMMENT '截止日期',
  `status` int(11) DEFAULT '1' COMMENT '状态：0，删除，1，开发中，2，开发完成',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` blob COMMENT '内容',
  `userid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `username` varchar(255) DEFAULT NULL COMMENT '操作人员',
  `createtime` datetime DEFAULT NULL COMMENT '创建日期',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_task
-- ----------------------------

-- ----------------------------
-- Table structure for pms_taskcomplete
-- ----------------------------
DROP TABLE IF EXISTS `pms_taskcomplete`;
CREATE TABLE `pms_taskcomplete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) DEFAULT NULL COMMENT '任务id',
  `estimate` int(11) DEFAULT NULL COMMENT '实际工时',
  `codeurl` varchar(255) DEFAULT NULL COMMENT '代码截图url',
  `testremark` blob COMMENT '指派给',
  `releaseremark` blob COMMENT '发布说明',
  `sqlname` varchar(255) DEFAULT NULL COMMENT '发布sql附件名称',
  `sql` varchar(255) DEFAULT '' COMMENT '发布sql附件url',
  `overdueremark` blob COMMENT '超期说明',
  `userid` int(11) DEFAULT NULL COMMENT '完成人员ID',
  `username` varchar(255) DEFAULT NULL COMMENT '完成人员',
  `createtime` datetime DEFAULT NULL COMMENT '完成时间',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_taskcomplete
-- ----------------------------

-- ----------------------------
-- Table structure for pms_usecase
-- ----------------------------
DROP TABLE IF EXISTS `pms_usecase`;
CREATE TABLE `pms_usecase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storyid` int(11) DEFAULT NULL COMMENT '需求id',
  `type` int(11) DEFAULT NULL COMMENT '任务类型：1，功能测试，2，性能测试，3，配置相关，4，安装部署，5，安全相关，6，接口测试，9，其他',
  `stage` varchar(255) DEFAULT NULL COMMENT '适用阶段',
  `status` int(11) DEFAULT '1' COMMENT '状态：0，删除，1，正常',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `filename` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `fileurl` varchar(255) DEFAULT NULL COMMENT '附件路径',
  `userid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `username` varchar(255) DEFAULT NULL COMMENT '操作人员',
  `createtime` datetime DEFAULT NULL COMMENT '创建日期',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_usecase
-- ----------------------------

-- ----------------------------
-- Table structure for pms_usecasestep
-- ----------------------------
DROP TABLE IF EXISTS `pms_usecasestep`;
CREATE TABLE `pms_usecasestep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usecaseid` int(11) DEFAULT NULL COMMENT '用例id',
  `xh` int(11) DEFAULT NULL COMMENT '编号',
  `step` varchar(1000) DEFAULT NULL COMMENT '步骤',
  `result` int(11) DEFAULT '0' COMMENT '状态：0，失败，1，通过',
  `expect` varchar(1000) DEFAULT NULL COMMENT '预期',
  `truth` varchar(1000) DEFAULT NULL COMMENT '实际情况',
  `userid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `username` varchar(255) DEFAULT NULL COMMENT '操作人员',
  `createtime` datetime DEFAULT NULL COMMENT '创建日期',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_usecasestep
-- ----------------------------

-- ----------------------------
-- Table structure for sys_application
-- ----------------------------
DROP TABLE IF EXISTS `sys_application`;
CREATE TABLE `sys_application` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL COMMENT '应用名称',
  `TYPE` int(1) NOT NULL COMMENT '应用性质：0，分类，1，菜单',
  `STATUS` int(1) NOT NULL COMMENT '状态：0，禁用，1启用',
  `URL` varchar(255) DEFAULT NULL COMMENT '路径',
  `CSS` varchar(50) DEFAULT NULL COMMENT 'css类名',
  `ICON` varchar(50) DEFAULT NULL COMMENT '图标',
  `PARENTID` int(11) NOT NULL COMMENT '父节点，顶级为0',
  `LISTID` int(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ID`),
  KEY `IDX_SYS_APPLICATION_PARENTID` (`PARENTID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_application
-- ----------------------------
INSERT INTO `sys_application` VALUES ('1', '需求管理', '0', '1', '', '', 'fa fa-envelope-o', '0', '1');
INSERT INTO `sys_application` VALUES ('2', '任务管理', '0', '1', '', '', 'fa fa-tags', '0', '2');
INSERT INTO `sys_application` VALUES ('3', '测试管理', '0', '1', '', null, 'fa fa-send-o', '0', '3');
INSERT INTO `sys_application` VALUES ('4', 'bug管理', '0', '1', '', '', 'fa fa-bug', '0', '4');
INSERT INTO `sys_application` VALUES ('5', '基础资料', '0', '1', null, null, 'fa fa-edit', '0', '6');
INSERT INTO `sys_application` VALUES ('6', '系统设定', '0', '1', null, null, 'fa fa-cogs', '0', '7');
INSERT INTO `sys_application` VALUES ('7', '需求列表', '1', '1', '/story/story.do', '', '', '1', '1');
INSERT INTO `sys_application` VALUES ('8', '任务指派', '1', '1', '/story/sorting.do', '', '', '1', '2');
INSERT INTO `sys_application` VALUES ('9', '指派记录', '1', '1', '/task/sorted.do', '', '', '1', '3');
INSERT INTO `sys_application` VALUES ('10', '我的任务', '1', '1', '/task/todo.do', '', '', '2', '1');
INSERT INTO `sys_application` VALUES ('11', '完成记录', '1', '1', '/task/completed.do', '', '', '2', '2');
INSERT INTO `sys_application` VALUES ('12', '测试列表', '1', '1', '/test/totest.do', '', '', '3', '1');
INSERT INTO `sys_application` VALUES ('13', '用例列表', '1', '1', '/test/usecase.do', '', '', '3', '2');
INSERT INTO `sys_application` VALUES ('14', 'bug列表', '1', '1', '/bug/bug.do', '', '', '4', '1');
INSERT INTO `sys_application` VALUES ('20', '待解决bug', '1', '1', '/bug/tosolve.do', '', '', '4', '2');
INSERT INTO `sys_application` VALUES ('21', '待审核bug', '1', '1', '/bug/toapprove.do', '', '', '4', '3');
INSERT INTO `sys_application` VALUES ('22', '发布管理', '0', '1', '', '', 'fa fa-exchange', '0', '5');
INSERT INTO `sys_application` VALUES ('23', '待发布列表', '1', '1', '/release/torelease.do', '', '', '22', '1');
INSERT INTO `sys_application` VALUES ('24', '已解决bug', '1', '1', '/bug/solved.do', '', '', '4', '4');
INSERT INTO `sys_application` VALUES ('28', '已发布记录', '1', '1', '/release/released.do', '', '', '22', '2');
INSERT INTO `sys_application` VALUES ('29', '任务清单', '1', '1', '/task/tasklist.do', '', '', '2', '3');
INSERT INTO `sys_application` VALUES ('30', '项目管理', '1', '1', '/base/project.do', '', '', '5', '1');
INSERT INTO `sys_application` VALUES ('31', '菜单管理', '1', '1', '/system/application.do', null, null, '6', '1');
INSERT INTO `sys_application` VALUES ('32', '组织管理', '1', '1', '/system/organization.do', null, null, '6', '2');
INSERT INTO `sys_application` VALUES ('33', '用户管理', '1', '1', '/system/user.do', null, null, '6', '3');
INSERT INTO `sys_application` VALUES ('34', '角色管理', '1', '1', '/system/role.do', null, null, '6', '4');
INSERT INTO `sys_application` VALUES ('35', '来源管理', '1', '1', '/base/source.do', '', '', '5', '2');
INSERT INTO `sys_application` VALUES ('36', '模块管理', '1', '1', '/base/modular.do', '', '', '5', '3');
INSERT INTO `sys_application` VALUES ('38', '客户管理', '1', '1', '/base/customer.do', '', '', '5', '4');

-- ----------------------------
-- Table structure for sys_bh
-- ----------------------------
DROP TABLE IF EXISTS `sys_bh`;
CREATE TABLE `sys_bh` (
  `orderbh` varchar(255) DEFAULT NULL COMMENT '铁发订单编号',
  `ordertime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '铁发订单编号最新请求时间',
  `skbh` varchar(255) DEFAULT NULL COMMENT '收款编号',
  `sktime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '收款最新请求时间',
  `fkbh` varchar(255) DEFAULT NULL COMMENT '付款编号',
  `fktime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '付款最新请求时间',
  `djbh` varchar(255) DEFAULT NULL COMMENT '单据编号',
  `djtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '单据编号最新请求时间'
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_bh
-- ----------------------------
INSERT INTO `sys_bh` VALUES ('1', '2018-05-27 14:08:15', '1', '2018-05-27 14:08:15', '21', '2018-05-27 14:08:15', '7', '2018-05-27 14:08:15');

-- ----------------------------
-- Table structure for sys_email
-- ----------------------------
DROP TABLE IF EXISTS `sys_email`;
CREATE TABLE `sys_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STORYID` int(11) DEFAULT NULL COMMENT '需求ID',
  `STATUS` int(11) DEFAULT '0' COMMENT '状态：0，待发送，1，已发送',
  `MAILTO` int(50) DEFAULT NULL COMMENT '发送至',
  `CONTENT` varchar(4000) DEFAULT NULL COMMENT '内容',
  `CREATETIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1866 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_email
-- ----------------------------
INSERT INTO `sys_email` VALUES ('1815', '10', '1', '13', '新增需求：10&nbsp;江苏省网上信访问题，优先级：1,请及时安排开发。', '2019-03-09 20:18:33');
INSERT INTO `sys_email` VALUES ('1816', '10', '1', '1', '新增需求：10&nbsp;江苏省网上信访问题，优先级：1,请及时安排开发。', '2019-03-09 20:18:34');
INSERT INTO `sys_email` VALUES ('1817', '10', '1', '12', '您有新的任务需要处理：11&nbsp;测试任务', '2019-03-09 20:18:35');
INSERT INTO `sys_email` VALUES ('1818', '9', '1', '26', '您有新的任务需要处理：12&nbsp;测试', '2019-03-19 10:55:03');
INSERT INTO `sys_email` VALUES ('1819', '9', '1', '32', '您有新的任务需要处理：13&nbsp;测试111', '2019-03-19 10:56:01');
INSERT INTO `sys_email` VALUES ('1820', '9', '1', '50', '需求：9&nbsp;null已经完成，请及时测试。', '2019-03-19 10:56:31');
INSERT INTO `sys_email` VALUES ('1821', '9', '1', '51', '需求：9&nbsp;null已经完成，请及时测试。', '2019-03-19 10:56:32');
INSERT INTO `sys_email` VALUES ('1822', '9', '1', '52', '需求：9&nbsp;null已经完成，请及时测试。', '2019-03-19 10:56:33');
INSERT INTO `sys_email` VALUES ('1823', '9', '1', '53', '需求：9&nbsp;null已经完成，请及时测试。', '2019-03-19 10:56:35');
INSERT INTO `sys_email` VALUES ('1824', '9', '1', '50', '需求：9&nbsp;null已经完成，请及时测试。', '2019-03-19 10:57:01');
INSERT INTO `sys_email` VALUES ('1825', '9', '1', '51', '需求：9&nbsp;null已经完成，请及时测试。', '2019-03-19 10:57:03');
INSERT INTO `sys_email` VALUES ('1826', '9', '1', '52', '需求：9&nbsp;null已经完成，请及时测试。', '2019-03-19 10:57:04');
INSERT INTO `sys_email` VALUES ('1827', '9', '1', '53', '需求：9&nbsp;null已经完成，请及时测试。', '2019-03-19 10:57:05');
INSERT INTO `sys_email` VALUES ('1828', '9', '1', '20', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:01');
INSERT INTO `sys_email` VALUES ('1829', '9', '1', '21', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:07');
INSERT INTO `sys_email` VALUES ('1830', '9', '1', '54', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:08');
INSERT INTO `sys_email` VALUES ('1831', '9', '1', '55', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:11');
INSERT INTO `sys_email` VALUES ('1832', '9', '1', '56', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:13');
INSERT INTO `sys_email` VALUES ('1833', '9', '1', '57', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:17');
INSERT INTO `sys_email` VALUES ('1834', '9', '1', '58', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:22');
INSERT INTO `sys_email` VALUES ('1835', '9', '1', '59', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:27');
INSERT INTO `sys_email` VALUES ('1836', '9', '1', '60', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:30');
INSERT INTO `sys_email` VALUES ('1837', '9', '1', '61', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:31');
INSERT INTO `sys_email` VALUES ('1838', '9', '1', '22', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:34');
INSERT INTO `sys_email` VALUES ('1839', '9', '1', '25', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:36');
INSERT INTO `sys_email` VALUES ('1840', '9', '1', '37', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:38');
INSERT INTO `sys_email` VALUES ('1841', '9', '1', '43', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:39');
INSERT INTO `sys_email` VALUES ('1842', '9', '1', '44', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:41');
INSERT INTO `sys_email` VALUES ('1843', '9', '1', '49', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:42');
INSERT INTO `sys_email` VALUES ('1844', '9', '1', '1', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:45');
INSERT INTO `sys_email` VALUES ('1845', '9', '1', '18', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:46');
INSERT INTO `sys_email` VALUES ('1846', '9', '1', '19', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:47');
INSERT INTO `sys_email` VALUES ('1847', '9', '1', '20', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:51');
INSERT INTO `sys_email` VALUES ('1848', '9', '1', '21', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:53');
INSERT INTO `sys_email` VALUES ('1849', '9', '1', '54', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:56');
INSERT INTO `sys_email` VALUES ('1850', '9', '1', '55', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:57');
INSERT INTO `sys_email` VALUES ('1851', '9', '1', '56', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:15:59');
INSERT INTO `sys_email` VALUES ('1852', '9', '1', '57', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:18:34');
INSERT INTO `sys_email` VALUES ('1853', '9', '1', '58', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:25:05');
INSERT INTO `sys_email` VALUES ('1854', '9', '1', '59', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:25:11');
INSERT INTO `sys_email` VALUES ('1855', '9', '1', '60', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:25:35');
INSERT INTO `sys_email` VALUES ('1856', '9', '1', '61', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:26:05');
INSERT INTO `sys_email` VALUES ('1857', '9', '1', '22', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:26:06');
INSERT INTO `sys_email` VALUES ('1858', '9', '1', '25', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:26:07');
INSERT INTO `sys_email` VALUES ('1859', '9', '1', '37', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:26:08');
INSERT INTO `sys_email` VALUES ('1860', '9', '1', '43', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:26:09');
INSERT INTO `sys_email` VALUES ('1861', '9', '1', '44', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:26:11');
INSERT INTO `sys_email` VALUES ('1862', '9', '1', '49', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:26:12');
INSERT INTO `sys_email` VALUES ('1863', '9', '1', '1', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:26:15');
INSERT INTO `sys_email` VALUES ('1864', '9', '1', '18', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:26:16');
INSERT INTO `sys_email` VALUES ('1865', '9', '1', '19', '需求测试完成：9&nbsp;null,请及时部署。', '2019-03-19 11:26:17');

-- ----------------------------
-- Table structure for sys_errorlog
-- ----------------------------
DROP TABLE IF EXISTS `sys_errorlog`;
CREATE TABLE `sys_errorlog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(255) DEFAULT NULL COMMENT '请求路径',
  `CONTENT` varchar(4000) DEFAULT NULL COMMENT '内容',
  `CREATETIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `USERID` int(11) DEFAULT NULL COMMENT '操作人员ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作人员名称',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_errorlog
-- ----------------------------
INSERT INTO `sys_errorlog` VALUES ('1', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-02 01:24:14', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('2', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-02 01:35:55', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('3', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-02 01:37:01', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('4', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-02 01:37:25', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('5', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-02 01:43:55', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('6', '/lms/files/upload.do', 'Connection timed out: connect', '2018-04-06 00:08:58', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('7', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-20 20:41:45', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('8', '/lms/order/getDispatchePage.do', '### Error querying database.  Cause: java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'id\' in field list is ambiguous\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DispatcheMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDispatcheDao.getDispatcheCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(id)     from lms_dispatche a,lms_order b     where a.orderbh=b.orderbh            and a.loadingdate  >=  ?                  and a.loadingdate  <=  ?\r\n### Cause: java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'id\' in field list is ambiguous\"\n; SQL []; Duplicate key or integrity constraint violation message from server: \"Column \'id\' in field list is ambiguous\"; nested exception is java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'id\' in field list is ambiguous\"', '2018-04-23 21:52:17', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('9', '/lms/order/getDispatchePage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'a.loadingdate\' in \'where clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DispatcheMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDispatcheDao.getDispatcheCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(a.id)     from lms_dispatche a,lms_order b     where a.orderbh=b.orderbh            and a.loadingdate  >=  ?                  and a.loadingdate  <=  ?\r\n### Cause: java.sql.SQLException: Unknown column \'a.loadingdate\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'a.loadingdate\' in \'where clause\'', '2018-04-23 21:58:45', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('10', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-23 22:01:44', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('11', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-23 22:02:10', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('12', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-23 22:06:26', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('13', '/lms/order/getDispatchePage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'a.productname\' in \'order clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DispatcheMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDispatcheDao.getDispatchePage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      A.ID, A.ORDERBH, B.START, B.END, B.CUSTOMERID, B.CUSTOMER, B.PRODUCTID, B.PRODUCTNAME,      A.CONTAINERBH, A.SHDATE, A.YQDZDATE, A.SHQCH, A.SHYCCOST, A.SHFLEET, A.LXR,      A.PHONE, A.CREATETIME, A.UPDATETIME, A.USERID, A.USERNAME     from lms_dispatche a,lms_order b     where a.orderbh=b.orderbh            and a.shdate  >=  ?                  and a.shdate  <=  ?                                          ORDER BY a.productname asc           LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'a.productname\' in \'order clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'a.productname\' in \'order clause\'', '2018-04-23 22:13:43', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('14', '/lms/order/getDispatchePage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'a.productname\' in \'order clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DispatcheMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDispatcheDao.getDispatchePage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      A.ID, A.ORDERBH, B.START, B.END, B.CUSTOMERID, B.CUSTOMER, B.PRODUCTID, B.PRODUCTNAME,      A.CONTAINERBH, A.SHDATE, A.YQDZDATE, A.SHQCH, A.SHYCCOST, A.SHFLEET, A.LXR,      A.PHONE, A.CREATETIME, A.UPDATETIME, A.USERID, A.USERNAME     from lms_dispatche a,lms_order b     where a.orderbh=b.orderbh            and a.shdate  >=  ?                  and a.shdate  <=  ?                                          ORDER BY a.productname desc           LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'a.productname\' in \'order clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'a.productname\' in \'order clause\'', '2018-04-23 22:13:44', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('15', '/lms/order/getDispatchePage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'a.loadingdate\' in \'order clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DispatcheMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDispatcheDao.getDispatchePage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      A.ID, A.ORDERBH, B.START, B.END, B.CUSTOMERID, B.CUSTOMER, B.PRODUCTID, B.PRODUCTNAME,      A.CONTAINERBH, A.SHDATE, A.YQDZDATE, A.SHQCH, A.SHYCCOST, A.SHFLEET, A.LXR,      A.PHONE, A.CREATETIME, A.UPDATETIME, A.USERID, A.USERNAME     from lms_dispatche a,lms_order b     where a.orderbh=b.orderbh            and a.shdate  >=  ?                  and a.shdate  <=  ?                                          ORDER BY a.loadingdate asc           LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'a.loadingdate\' in \'order clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'a.loadingdate\' in \'order clause\'', '2018-04-23 22:13:45', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('16', '/lms/order/getDispatchePage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'a.end\' in \'order clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DispatcheMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDispatcheDao.getDispatchePage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      A.ID, A.ORDERBH, B.START, B.END, B.CUSTOMERID, B.CUSTOMER, B.PRODUCTID, B.PRODUCTNAME,      A.CONTAINERBH, A.SHDATE, A.YQDZDATE, A.SHQCH, A.SHYCCOST, A.SHFLEET, A.LXR,      A.PHONE, A.CREATETIME, A.UPDATETIME, A.USERID, A.USERNAME     from lms_dispatche a,lms_order b     where a.orderbh=b.orderbh            and a.shdate  >=  ?                  and a.shdate  <=  ?                                          ORDER BY a.end asc           LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'a.end\' in \'order clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'a.end\' in \'order clause\'', '2018-04-23 22:13:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('17', '/lms/order/getDispatchePage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'a.vehiclenumber\' in \'order clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DispatcheMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDispatcheDao.getDispatchePage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      A.ID, A.ORDERBH, B.START, B.END, B.CUSTOMERID, B.CUSTOMER, B.PRODUCTID, B.PRODUCTNAME,      A.CONTAINERBH, A.SHDATE, A.YQDZDATE, A.SHQCH, A.SHYCCOST, A.SHFLEET, A.LXR,      A.PHONE, A.CREATETIME, A.UPDATETIME, A.USERID, A.USERNAME     from lms_dispatche a,lms_order b     where a.orderbh=b.orderbh            and a.shdate  >=  ?                  and a.shdate  <=  ?                                          ORDER BY a.vehiclenumber asc           LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'a.vehiclenumber\' in \'order clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'a.vehiclenumber\' in \'order clause\'', '2018-04-23 22:13:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('18', '/lms/order/getDispatchePage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'a.driver\' in \'order clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DispatcheMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDispatcheDao.getDispatchePage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      A.ID, A.ORDERBH, B.START, B.END, B.CUSTOMERID, B.CUSTOMER, B.PRODUCTID, B.PRODUCTNAME,      A.CONTAINERBH, A.SHDATE, A.YQDZDATE, A.SHQCH, A.SHYCCOST, A.SHFLEET, A.LXR,      A.PHONE, A.CREATETIME, A.UPDATETIME, A.USERID, A.USERNAME     from lms_dispatche a,lms_order b     where a.orderbh=b.orderbh            and a.shdate  >=  ?                  and a.shdate  <=  ?                                          ORDER BY a.driver asc           LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'a.driver\' in \'order clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'a.driver\' in \'order clause\'', '2018-04-23 22:13:48', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('19', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-23 22:18:40', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('20', '/lms/order/getDispatchePage.do', '### Error querying database.  Cause: java.sql.SQLException: Syntax error or access violation message from server: \"Every derived table must have its own alias\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DispatcheMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDispatcheDao.getDispatchePage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      ID, ORDERBH, START, END, CUSTOMERID, CUSTOMER, PRODUCTID, PRODUCTNAME,      CONTAINERBH, SHDATE, YQDZDATE, SHQCH, SHYCCOST, SHFLEET, LXR,      PHONE, CREATETIME, UPDATETIME, USERID, USERNAME     from     (select      A.ID, A.ORDERBH, B.START, B.END, B.CUSTOMERID, B.CUSTOMER, B.PRODUCTID, B.PRODUCTNAME,      A.CONTAINERBH, A.SHDATE, A.YQDZDATE, A.SHQCH, A.SHYCCOST, A.SHFLEET, A.LXR,      A.PHONE, A.CREATETIME, A.UPDATETIME, A.USERID, A.USERNAME     from lms_dispatche a,lms_order b     where a.orderbh=b.orderbh            and a.shdate  >=  ?                  and a.shdate  <=  ?                        )            ORDER BY createtime desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Syntax error or access violation message from server: \"Every derived table must have its own alias\"\n; bad SQL grammar []; nested exception is java.sql.SQLException: Syntax error or access violation message from server: \"Every derived table must have its own alias\"', '2018-04-23 22:18:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('21', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-23 22:52:58', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('22', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-24 20:10:28', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('23', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-24 20:24:28', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('24', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-24 20:24:31', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('25', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-24 21:08:23', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('26', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-24 21:09:42', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('27', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-24 21:09:45', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('28', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-24 21:11:36', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('29', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-26 20:45:09', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('30', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-26 20:45:09', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('31', '/lms/order/getTrainPage.do', '### Error querying database.  Cause: java.sql.SQLException: Syntax error or access violation message from server: \"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'select \n    A.ID, A.ORDERBH, B.CUSTOMERID, B.CUSTOMER, B.PRODUCTID, B.PRODUCTNAM\' at line 5\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\TrainMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.ITrainDao.getTrainPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      ID, ORDERBH, CUSTOMERID, CUSTOMER, PRODUCTID, PRODUCTNAME, CONTAINERBH,      TRAINDATE, CPH, QPDATE, HPH, WEIGHT, ADDRESS, TRAINSTART, ISPAYFEES,      OTHERCOST, CREATETIME, UPDATETIME, USERID, USERNAME     (select      A.ID, A.ORDERBH, B.CUSTOMERID, B.CUSTOMER, B.PRODUCTID, B.PRODUCTNAME, A.CONTAINERBH,      A.TRAINDATE, A.CPH, A.QPDATE, A.HPH, A.WEIGHT, A.ADDRESS, A.TRAINSTART, A.ISPAYFEES,      A.OTHERCOST, A.CREATETIME, A.UPDATETIME, A.USERID, A.USERNAME     from lms_train a,lms_order b     where a.orderbh=b.orderbh                              ) P            ORDER BY createtime                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Syntax error or access violation message from server: \"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'select \n    A.ID, A.ORDERBH, B.CUSTOMERID, B.CUSTOMER, B.PRODUCTID, B.PRODUCTNAM\' at line 5\"\n; bad SQL grammar []; nested exception is java.sql.SQLException: Syntax error or access violation message from server: \"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'select \n    A.ID, A.ORDERBH, B.CUSTOMERID, B.CUSTOMER, B.PRODUCTID, B.PRODUCTNAM\' at line 5\"', '2018-04-26 20:45:20', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('32', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-26 20:49:30', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('33', '/lms/order/getTrainPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'A.TRAINSTART\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\TrainMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.ITrainDao.getTrainPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      ID, ORDERBH, CUSTOMERID, CUSTOMER, PRODUCTID, PRODUCTNAME, CONTAINERBH,      TRAINDATE, CPH, QPDATE, HPH, WEIGHT, ADDRESS, TRAINSTART, ISPAYFEES,      OTHERCOST, CREATETIME, UPDATETIME, USERID, USERNAME     from (select      A.ID, A.ORDERBH, B.CUSTOMERID, B.CUSTOMER, B.PRODUCTID, B.PRODUCTNAME, A.CONTAINERBH,      A.TRAINDATE, A.CPH, A.QPDATE, A.HPH, A.WEIGHT, A.ADDRESS, A.TRAINSTART, A.ISPAYFEES,      A.OTHERCOST, A.CREATETIME, A.UPDATETIME, A.USERID, A.USERNAME     from lms_train a,lms_order b     where a.orderbh=b.orderbh                              ) P            ORDER BY createtime                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'A.TRAINSTART\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'A.TRAINSTART\' in \'field list\'', '2018-04-26 20:49:37', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('34', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-26 21:35:35', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('35', '/lms/base/getContainerListByOrderPosition.do', '### Error querying database.  Cause: java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'ID\' in field list is ambiguous\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerDao.getContainerListByOrderPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select             ID, CONTAINERBH, TYPE, STATUS, COST, MODEL, XL, VOLUME, SOURCE, CREATETIME, UPDATETIME, USERID,      USERNAME          from base_container a,lms_dispatche b      where a.status=1 and a.containerbh=b.containerbh      and b.orderbh=?      and a.position=?      order by createtime desc\r\n### Cause: java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'ID\' in field list is ambiguous\"\n; SQL []; Duplicate key or integrity constraint violation message from server: \"Column \'ID\' in field list is ambiguous\"; nested exception is java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'ID\' in field list is ambiguous\"', '2018-04-26 22:42:53', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('36', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-26 22:54:55', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('37', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-26 23:08:14', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('38', '/lms/order/getDispatcheEntity.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'PRODUCTID\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DispatcheMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDispatcheDao.getDispatcheEntity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select            ID, ORDERBH, PRODUCTID, PRODUCTNAME, CONTAINERBH, LOADINGDATE, START, END, VEHICLENUMBER,      EXPECTED, DRIVER, PHONE, CREATETIME, UPDATETIME, USERID, USERNAME         from lms_dispatche     where orderbh=?     and containerbh=?\r\n### Cause: java.sql.SQLException: Unknown column \'PRODUCTID\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'PRODUCTID\' in \'field list\'', '2018-04-26 23:32:42', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('39', '/lms/order/getDispatcheEntity.do', 'com.jschrj.model.Dispatche cannot be cast to com.jschrj.model.Order', '2018-04-26 23:34:57', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('40', '/lms/order/getDispatcheEntity.do', 'com.jschrj.model.Dispatche cannot be cast to com.jschrj.model.Order', '2018-04-26 23:35:44', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('41', '/lms/order/insertTrain.do', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'containerbh1\' in \'class com.jschrj.model.Train\'', '2018-04-27 20:43:59', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('42', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-27 21:24:44', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('43', '/lms/container/getContainerEndPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'d.trainstart\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerReportDao.getContainerEndPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select containerbh,type,orderbh,start,end,wagonnum,arrivedate,number     from     (select c.containerbh,\'铁发\' type,a.orderbh,     d.trainstart start,d.trainend end,b.arrivenum wagonnum,b.arrivedate,\'\' number     from lms_order a,lms_delivery b,base_container c,lms_train d     where a.orderbh=b.orderbh and b.arrivenum=d.wagonnum     and (c.containerbh=b.containerbh1 or c.containerbh=b.containerbh2)            and b.arrivedate   >=  ?                  and b.arrivedate   <=  ?                 union all     select c.containerbh,\'送货\' type,a.orderbh,     d.start,d.end,\'\' wagonnum,b.arrivedate,b.arrivenum number     from lms_order a,lms_empty b,base_container c,lms_delivery d     where a.orderbh=b.orderbh and b.arrivenum=d.number     and c.containerbh=b.containerbh            and b.arrivedate   >=  ?                  and b.arrivedate   <=  ?            ) p            ORDER BY arrivedate desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'d.trainstart\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'d.trainstart\' in \'field list\'', '2018-04-27 22:41:26', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('44', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select a.orderbh,a.customer,b.containerbh1,b.containerbh2,     (a.unitprice*b.weight) shouldfk,     a.productname,a.start,a.end,b.traindate shdate,     a.unitprice price,b.weight,b.loadaddress shplace     from lms_order a,lms_train b     where a.orderbh=b.orderbh            and b.traindate   >=  ?                  and b.traindate   <=  ?                        ORDER BY b.traindate                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'', '2018-04-27 22:41:34', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('45', '/lms/order/getDispatcheEntity.do', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '2018-04-29 11:33:51', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('46', '/lms/order/getDispatcheEntity.do', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '2018-04-29 11:34:55', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('47', '/lms/order/getDeliveryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'date\' in \'where clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DeliveryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDeliveryDao.getDeliveryCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(id)     from lms_delivery     where 1=1            and date   >=  ?                  and date   <=  ?\r\n### Cause: java.sql.SQLException: Unknown column \'date\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'date\' in \'where clause\'', '2018-04-29 12:49:30', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('48', '/lms/order/getDeliveryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'date\' in \'where clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DeliveryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDeliveryDao.getDeliveryCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(id)     from lms_delivery     where 1=1            and date   >=  ?                  and date   <=  ?\r\n### Cause: java.sql.SQLException: Unknown column \'date\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'date\' in \'where clause\'', '2018-04-29 15:26:27', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('49', '/lms/order/getDeliveryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'date\' in \'where clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DeliveryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDeliveryDao.getDeliveryCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(id)     from lms_delivery     where 1=1            and date   >=  ?                  and date   <=  ?\r\n### Cause: java.sql.SQLException: Unknown column \'date\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'date\' in \'where clause\'', '2018-04-29 15:53:45', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('50', '/lms/base/getContainerListByOrderPosition.do', '### Error querying database.  Cause: java.sql.SQLException: Syntax error or access violation message from server: \"Query was empty\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerDao.getContainerListByOrderPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: \r\n### Cause: java.sql.SQLException: Syntax error or access violation message from server: \"Query was empty\"\n; bad SQL grammar []; nested exception is java.sql.SQLException: Syntax error or access violation message from server: \"Query was empty\"', '2018-04-29 16:39:07', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('51', '/lms/base/getContainerListByOrderPosition.do', '### Error querying database.  Cause: java.sql.SQLException: Syntax error or access violation message from server: \"Query was empty\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerDao.getContainerListByOrderPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: \r\n### Cause: java.sql.SQLException: Syntax error or access violation message from server: \"Query was empty\"\n; bad SQL grammar []; nested exception is java.sql.SQLException: Syntax error or access violation message from server: \"Query was empty\"', '2018-04-29 16:41:38', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('52', '/lms/base/getContainerListByOrderPosition.do', '### Error querying database.  Cause: java.sql.SQLException: Syntax error or access violation message from server: \"Query was empty\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerDao.getContainerListByOrderPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: \r\n### Cause: java.sql.SQLException: Syntax error or access violation message from server: \"Query was empty\"\n; bad SQL grammar []; nested exception is java.sql.SQLException: Syntax error or access violation message from server: \"Query was empty\"', '2018-04-29 16:43:19', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('53', '/lms/order/getTrainEntity.do', 'com.jschrj.model.Train cannot be cast to com.jschrj.model.Dispatche', '2018-04-29 17:07:13', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('54', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-29 18:44:26', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('55', '/lms/account/checkLogin.do', '密码不正确！', '2018-04-29 19:25:51', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('56', '/lms/order/getEmptyPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'openticketdate\' in \'where clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\EmptyMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IEmptyDao.getEmptyCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(id)     from lms_empty     where 1=1            and openticketdate   >=  ?                  and openticketdate   <=  ?\r\n### Cause: java.sql.SQLException: Unknown column \'openticketdate\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'openticketdate\' in \'where clause\'', '2018-04-29 22:40:34', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('57', '/lms/order/getEmptyPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'openticketdate\' in \'where clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\EmptyMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IEmptyDao.getEmptyCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(id)     from lms_empty     where 1=1            and openticketdate   >=  ?                  and openticketdate   <=  ?\r\n### Cause: java.sql.SQLException: Unknown column \'openticketdate\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'openticketdate\' in \'where clause\'', '2018-04-29 22:43:15', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('58', '/lms/order/getEmptyPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'openticketdate\' in \'where clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\EmptyMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IEmptyDao.getEmptyCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(id)     from lms_empty     where 1=1            and openticketdate   >=  ?                  and openticketdate   <=  ?\r\n### Cause: java.sql.SQLException: Unknown column \'openticketdate\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'openticketdate\' in \'where clause\'', '2018-04-29 22:44:21', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('59', '/lms/base/getContainerListByOrderPosition.do', '### Error querying database.  Cause: java.sql.SQLException: Syntax error or access violation message from server: \"Query was empty\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerDao.getContainerListByOrderPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: \r\n### Cause: java.sql.SQLException: Syntax error or access violation message from server: \"Query was empty\"\n; bad SQL grammar []; nested exception is java.sql.SQLException: Syntax error or access violation message from server: \"Query was empty\"', '2018-04-30 09:59:37', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('60', '/lms/order/trainForm.do', null, '2018-04-30 11:10:44', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('61', '/lms/order/trainForm.do', null, '2018-04-30 11:11:26', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('62', '/lms/order/trainForm.do', null, '2018-04-30 11:15:45', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('63', '/lms/order/trainForm.do', null, '2018-04-30 11:16:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('64', '/lms/order/getOrderPage.do', '### Error querying database.  Cause: java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'id\' in field list is ambiguous\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\OrderMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IOrderDao.getOrderCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(id)     from lms_order a left join lms_delivery b     on(a.orderbh=b.orderbh)     where 1=1                                    and a.status=?\r\n### Cause: java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'id\' in field list is ambiguous\"\n; SQL []; Duplicate key or integrity constraint violation message from server: \"Column \'id\' in field list is ambiguous\"; nested exception is java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'id\' in field list is ambiguous\"', '2018-04-30 13:14:31', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('65', '/lms/files/upload.do', null, '2018-04-30 20:06:35', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('66', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select a.orderbh,a.customer,b.containerbh1,b.containerbh2,     (a.unitprice*b.weight) shouldfk,     a.productname,a.start,a.end,b.traindate shdate,     a.unitprice price,b.weight,b.loadaddress shplace     from lms_order a,lms_train b     where a.orderbh=b.orderbh            and b.traindate   >=  ?                  and b.traindate   <=  ?                        ORDER BY b.traindate                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'', '2018-04-30 20:08:09', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('67', '/lms/base/contractForm.do', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'filename\' of \'class com.jschrj.model.Contract\' with value \'贵州众磊鑫商贸有限公司合同.docx\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'filename\' in \'class com.jschrj.model.Contract\'', '2018-04-30 21:30:34', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('68', '/lms/base/insertContract.do', '### Error updating database.  Cause: java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Duplicate entry \'1\' for key \'PRIMARY\'\"\r\n### The error may involve com.jschrj.dao.IContractDao.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into base_contract      ( ID,                                                          STATUS,                       QYD,                       MDD,                       QUANTITY,                       UNITPRICE,                       QYDATE,                       FILENAME,                       FILEPATH,              CREATETIME,                       USERID,                       USERNAME )       values ( ?,                                                          ?,                       ?,                       ?,                       ?,                       ?,                       ?,                       ?,                       ?,              SYSDATE(),                       ?,                       ? )\r\n### Cause: java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Duplicate entry \'1\' for key \'PRIMARY\'\"\n; SQL []; Duplicate key or integrity constraint violation message from server: \"Duplicate entry \'1\' for key \'PRIMARY\'\"; nested exception is java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Duplicate entry \'1\' for key \'PRIMARY\'\"', '2018-04-30 21:36:57', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('69', '/lms/base/getContractEntity.do', '### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: ERROR. token : WHERE, pos : 224 : select \n    ID, HTBH, CUSTOMERID, CUSTOMER, PRODUCTID, PRODUCTNAME, STATUS, QYD, MDD, QUANTITY, \n    UNITPRICE, QYDATE, FILENAME, FILEPATH, CREATETIME, UPDATETIME, USERID, USERNAME\n    from base_contract \n    where\n    where htbh=?\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContractMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContractDao.getOrderEntity\r\n### The error occurred while executing a query\r\n### SQL: select      ID, HTBH, CUSTOMERID, CUSTOMER, PRODUCTID, PRODUCTNAME, STATUS, QYD, MDD, QUANTITY,      UNITPRICE, QYDATE, FILENAME, FILEPATH, CREATETIME, UPDATETIME, USERID, USERNAME     from base_contract      where     where htbh=?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: ERROR. token : WHERE, pos : 224 : select \n    ID, HTBH, CUSTOMERID, CUSTOMER, PRODUCTID, PRODUCTNAME, STATUS, QYD, MDD, QUANTITY, \n    UNITPRICE, QYDATE, FILENAME, FILEPATH, CREATETIME, UPDATETIME, USERID, USERNAME\n    from base_contract \n    where\n    where htbh=?\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: ERROR. token : WHERE, pos : 224 : select \n    ID, HTBH, CUSTOMERID, CUSTOMER, PRODUCTID, PRODUCTNAME, STATUS, QYD, MDD, QUANTITY, \n    UNITPRICE, QYDATE, FILENAME, FILEPATH, CREATETIME, UPDATETIME, USERID, USERNAME\n    from base_contract \n    where\n    where htbh=?; nested exception is java.sql.SQLException: sql injection violation, syntax error: ERROR. token : WHERE, pos : 224 : select \n    ID, HTBH, CUSTOMERID, CUSTOMER, PRODUCTID, PRODUCTNAME, STATUS, QYD, MDD, QUANTITY, \n    UNITPRICE, QYDATE, FILENAME, FILEPATH, CREATETIME, UPDATETIME, USERID, USERNAME\n    from base_contract \n    where\n    where htbh=?', '2018-05-01 11:32:37', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('70', '/lms/account/checkLogin.do', '密码不正确！', '2018-05-01 11:42:15', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('71', '/lms/base/getCustomerPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'CONTRACTNAME\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\CustomerMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.ICustomerDao.getCustomerPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select            ID, NAME, TYPE, STATUS, YYLICENSE, KHLICENSE, KPXX, FRNAME, FRIDCARD, CONTRACTNAME,CONTRACT, KHH, YHKNUM, CONTACTS,      QQ, WEIXIN, ZFB, TEL, PHONE, FAX, POSTALCODE, ADDRESS, CREATETIME, UPDATETIME, USERID,      USERNAME         from base_customer     where 1=1            and status=?                        ORDER BY createtime                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'CONTRACTNAME\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'CONTRACTNAME\' in \'field list\'', '2018-05-01 11:46:17', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('72', '/lms/files/getFile.do', null, '2018-05-01 11:54:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('73', '/lms/files/getFile.do', null, '2018-05-01 11:54:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('74', '/lms/files/getFile.do', null, '2018-05-01 16:06:24', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('75', '/lms/files/getFile.do', null, '2018-05-01 16:07:37', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('76', '/lms/files/getFile.do', null, '2018-05-01 16:21:45', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('77', '/lms/files/getFile.do', null, '2018-05-01 16:21:54', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('78', '/lms/files/getFile.do', null, '2018-05-01 16:21:57', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('79', '/lms/container/getLocationPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'REFERID\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\LocationMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.ILocationDao.getLocationPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select           ID, CONTAINERBH, REFERID, STATUS, NUMBER, MODEL, XL, STAGE, CREATETIME, UPDATETIME, USERID, USERNAME        from     (select            ID, CONTAINERBH, REFERID, STATUS, NUMBER, MODEL, XL, STAGE, CREATETIME, UPDATETIME, USERID, USERNAME         from lms_location     where status=1            and createtime   >=  CONCAT(?,\' 00:00:00\')                  and createtime   <=  CONCAT(?,\' 23:59:59\')                        ) P            ORDER BY createtime desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'REFERID\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'REFERID\' in \'field list\'', '2018-05-01 20:00:09', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('80', '/lms/order/getDispatcheListBycontainerbh.do', '### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect BY, actual IDENTIFIER shdate : select \n    distinct orderbh\n    from lms_dispatche\n    where containerbh=?\n    and shdate >= DATE(SYSDATE())-30\n    order shdate desc\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DispatcheMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDispatcheDao.getDispatcheListBycontainerbh\r\n### The error occurred while executing a query\r\n### SQL: select      distinct orderbh     from lms_dispatche     where containerbh=?     and shdate >= DATE(SYSDATE())-30     order shdate desc\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect BY, actual IDENTIFIER shdate : select \n    distinct orderbh\n    from lms_dispatche\n    where containerbh=?\n    and shdate >= DATE(SYSDATE())-30\n    order shdate desc\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, expect BY, actual IDENTIFIER shdate : select \n    distinct orderbh\n    from lms_dispatche\n    where containerbh=?\n    and shdate >= DATE(SYSDATE())-30\n    order shdate desc; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, expect BY, actual IDENTIFIER shdate : select \n    distinct orderbh\n    from lms_dispatche\n    where containerbh=?\n    and shdate >= DATE(SYSDATE())-30\n    order shdate desc', '2018-05-01 20:04:43', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('81', '/lms/order/getDispatcheListBycontainerbh.do', '### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect BY, actual IDENTIFIER shdate : select \n    ID, ORDERBH, CONTAINERBH, SHDATE, SHQCH, \n    YQDZDATE, QFH, SHFLEET,LXR,PHONE, CREATETIME, UPDATETIME, USERID, USERNAME\n    from lms_dispatche\n    where containerbh=?\n    and shdate >= DATE(SYSDATE())-30\n    order shdate desc\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DispatcheMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDispatcheDao.getDispatcheListBycontainerbh\r\n### The error occurred while executing a query\r\n### SQL: select      ID, ORDERBH, CONTAINERBH, SHDATE, SHQCH,      YQDZDATE, QFH, SHFLEET,LXR,PHONE, CREATETIME, UPDATETIME, USERID, USERNAME     from lms_dispatche     where containerbh=?     and shdate >= DATE(SYSDATE())-30     order shdate desc\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect BY, actual IDENTIFIER shdate : select \n    ID, ORDERBH, CONTAINERBH, SHDATE, SHQCH, \n    YQDZDATE, QFH, SHFLEET,LXR,PHONE, CREATETIME, UPDATETIME, USERID, USERNAME\n    from lms_dispatche\n    where containerbh=?\n    and shdate >= DATE(SYSDATE())-30\n    order shdate desc\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, expect BY, actual IDENTIFIER shdate : select \n    ID, ORDERBH, CONTAINERBH, SHDATE, SHQCH, \n    YQDZDATE, QFH, SHFLEET,LXR,PHONE, CREATETIME, UPDATETIME, USERID, USERNAME\n    from lms_dispatche\n    where containerbh=?\n    and shdate >= DATE(SYSDATE())-30\n    order shdate desc; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, expect BY, actual IDENTIFIER shdate : select \n    ID, ORDERBH, CONTAINERBH, SHDATE, SHQCH, \n    YQDZDATE, QFH, SHFLEET,LXR,PHONE, CREATETIME, UPDATETIME, USERID, USERNAME\n    from lms_dispatche\n    where containerbh=?\n    and shdate >= DATE(SYSDATE())-30\n    order shdate desc', '2018-05-01 20:06:05', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('82', '/lms/financial/getSkPage.do', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'skfp\' of \'class com.jschrj.model.Sk\' with value \'0\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'skfp\' in \'class com.jschrj.model.Sk\'', '2018-05-02 22:27:31', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('83', '/lms/financial/getSkPage.do', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'skfp\' of \'class com.jschrj.model.Sk\' with value \'0\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'skfp\' in \'class com.jschrj.model.Sk\'', '2018-05-02 22:27:36', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('84', '/lms/financial/getSkPage.do', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'skfp\' of \'class com.jschrj.model.Sk\' with value \'0\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'skfp\' in \'class com.jschrj.model.Sk\'', '2018-05-02 22:27:41', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('85', '/lms/financial/getSkPage.do', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'skfp\' of \'class com.jschrj.model.Sk\' with value \'0\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'skfp\' in \'class com.jschrj.model.Sk\'', '2018-05-02 22:27:43', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('86', '/lms/financial/getSkPage.do', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'skkp\' of \'class com.jschrj.model.Sk\' with value \'0\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'skkp\' in \'class com.jschrj.model.Sk\'', '2018-05-02 22:30:24', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('87', '/lms/financial/getSkPage.do', 'Invalid bound statement (not found): com.jschrj.dao.ISkDao.getSkSummary', '2018-05-03 22:48:34', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('88', '/lms/financial/getOtherfkPage.do', 'Invalid bound statement (not found): com.jschrj.dao.IOtherfkDao.getOtherfkSummary', '2018-05-03 23:05:59', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('89', '/lms/financial/getOtherfkPage.do', 'Invalid bound statement (not found): com.jschrj.dao.IOtherfkDao.getOtherfkSummary', '2018-05-03 23:06:17', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('90', '/lms/financial/getOtherfkPage.do', 'Invalid bound statement (not found): com.jschrj.dao.IOtherfkDao.getOtherfkSummary', '2018-05-03 23:06:22', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('91', '/lms/account/checkLogin.do', 'Cannot create a session after the response has been committed', '2018-05-03 23:21:25', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('92', '/lms/order/orderForm.do', '### Error querying database.  Cause: java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'ID\' in where clause is ambiguous\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\OrderMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IOrderDao.selectByPrimaryKey-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      A.ID, A.ORDERBH, A.HTBH, A.CUSTOMERID, A.CUSTOMER, A.PRODUCTID, A.PRODUCTNAME,      A.STATUS, A.RECEIPTSTATUS, A.RECEIPTTYPE, A.WAYS, A.START, A.END,      B.QUANTITY, B.UNITPRICE, B.QYD, B.MDD,      CASE WHEN SUM(C.XHWEIGHT) IS NULL THEN 0 ELSE SUM(C.XHWEIGHT) END COMPLETED,      A.RECEIVEUNIT, A.RECEIVER, A.RECEIVEPHONE, A.CREATETIME, A.UPDATETIME, A.USERID, A.USERNAME     from lms_order a join base_contract b     on(a.htbh=b.htbh)     left join  lms_delivery c     on(a.orderbh=c.orderbh)     where ID = ?\r\n### Cause: java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'ID\' in where clause is ambiguous\"\n; SQL []; Duplicate key or integrity constraint violation message from server: \"Column \'ID\' in where clause is ambiguous\"; nested exception is java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'ID\' in where clause is ambiguous\"', '2018-05-04 23:07:40', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('93', '/lms/order/updateOrder.do', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'receiving\' in \'class com.jschrj.model.Order\'', '2018-05-04 23:13:58', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('94', '/lms/account/checkLogin.do', '密码不正确！', '2018-05-04 23:59:51', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('95', '/lms/financial/getSkPage.do', '### Error querying database.  Cause: java.sql.SQLException: Invalid value for getLong() - \'1000(余额 1000.00)\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\SkMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.ISkDao.getSkSummary\r\n### The error occurred while handling results\r\n### SQL: SELECT     skbh,CONCAT(SKAMOUNT,\'(余额 \',SKAMOUNT-YS+YF,\')\') SKAMOUNT,CONCAT(\'期初应收 \',YS,\',期初应付 \',YF) BILLDATE    FROM      (select \'汇总\' skbh,     CASE  WHEN SUM(A.SKAMOUNT) IS NULL THEN 0 ELSE SUM(A.SKAMOUNT) END SKAMOUNT,     CASE WHEN C.YS IS NULL THEN 0 ELSE C.YS END YS,     CASE WHEN C.YF IS NULL THEN 0 ELSE C.YS END YF     from fin_sk a join lms_order b     on (a.orderbh=b.orderbh)     left join fin_initysyf c     on(a.customerid=c.customerid)            and a.billdate   >=  ?                  and a.billdate   <=  ?                                    and a.customer=?                        ) p\r\n### Cause: java.sql.SQLException: Invalid value for getLong() - \'1000(余额 1000.00)\'\n; SQL []; Invalid value for getLong() - \'1000(余额 1000.00)\'; nested exception is java.sql.SQLException: Invalid value for getLong() - \'1000(余额 1000.00)\'', '2018-05-05 00:41:38', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('96', '/lms/financial/getSkPage.do', '### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect RPAREN, actual IDENTIFIER 汇总 : SELECT \n  	skbh,SKAMOUNT,CONCAT(\'期初 \',YS-YF,\') BILLDATE\n  	FROM \n    (select \'汇总\' skbh,\n    CASE  WHEN SUM(A.SKAMOUNT) IS NULL THEN 0 ELSE SUM(A.SKAMOUNT) END SKAMOUNT,\n    CASE WHEN C.YS IS NULL THEN 0 ELSE C.YS END YS,\n    CASE WHEN C.YF IS NULL THEN 0 ELSE C.YF END YF\n    from fin_sk a join lms_order b\n    on (a.orderbh=b.orderbh)\n    left join fin_initysyf c\n    on(a.customerid=c.customerid)\n     \n    	and a.billdate   >=  ?\n     \n     \n    	and a.billdate   <=  ?\n     \n     \n     \n     \n     \n    	and a.customer=?\n     \n     \n     \n     ) p\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\SkMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.ISkDao.getSkSummary\r\n### The error occurred while executing a query\r\n### SQL: SELECT     skbh,SKAMOUNT,CONCAT(\'期初 \',YS-YF,\') BILLDATE    FROM      (select \'汇总\' skbh,     CASE  WHEN SUM(A.SKAMOUNT) IS NULL THEN 0 ELSE SUM(A.SKAMOUNT) END SKAMOUNT,     CASE WHEN C.YS IS NULL THEN 0 ELSE C.YS END YS,     CASE WHEN C.YF IS NULL THEN 0 ELSE C.YF END YF     from fin_sk a join lms_order b     on (a.orderbh=b.orderbh)     left join fin_initysyf c     on(a.customerid=c.customerid)            and a.billdate   >=  ?                  and a.billdate   <=  ?                                    and a.customer=?                        ) p\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect RPAREN, actual IDENTIFIER 汇总 : SELECT \n  	skbh,SKAMOUNT,CONCAT(\'期初 \',YS-YF,\') BILLDATE\n  	FROM \n    (select \'汇总\' skbh,\n    CASE  WHEN SUM(A.SKAMOUNT) IS NULL THEN 0 ELSE SUM(A.SKAMOUNT) END SKAMOUNT,\n    CASE WHEN C.YS IS NULL THEN 0 ELSE C.YS END YS,\n    CASE WHEN C.YF IS NULL THEN 0 ELSE C.YF END YF\n    from fin_sk a join lms_order b\n    on (a.orderbh=b.orderbh)\n    left join fin_initysyf c\n    on(a.customerid=c.customerid)\n     \n    	and a.billdate   >=  ?\n     \n     \n    	and a.billdate   <=  ?\n     \n     \n     \n     \n     \n    	and a.customer=?\n     \n     \n     \n     ) p\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, expect RPAREN, actual IDENTIFIER 汇总 : SELECT \n  	skbh,SKAMOUNT,CONCAT(\'期初 \',YS-YF,\') BILLDATE\n  	FROM \n    (select \'汇总\' skbh,\n    CASE  WHEN SUM(A.SKAMOUNT) IS NULL THEN 0 ELSE SUM(A.SKAMOUNT) END SKAMOUNT,\n    CASE WHEN C.YS IS NULL THEN 0 ELSE C.YS END YS,\n    CASE WHEN C.YF IS NULL THEN 0 ELSE C.YF END YF\n    from fin_sk a join lms_order b\n    on (a.orderbh=b.orderbh)\n    left join fin_initysyf c\n    on(a.customerid=c.customerid)\n     \n    	and a.billdate   >=  ?\n     \n     \n    	and a.billdate   <=  ?\n     \n     \n     \n     \n     \n    	and a.customer=?\n     \n     \n     \n     ) p; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, expect RPAREN, actual IDENTIFIER 汇总 : SELECT \n  	skbh,SKAMOUNT,CONCAT(\'期初 \',YS-YF,\') BILLDATE\n  	FROM \n    (select \'汇总\' skbh,\n    CASE  WHEN SUM(A.SKAMOUNT) IS NULL THEN 0 ELSE SUM(A.SKAMOUNT) END SKAMOUNT,\n    CASE WHEN C.YS IS NULL THEN 0 ELSE C.YS END YS,\n    CASE WHEN C.YF IS NULL THEN 0 ELSE C.YF END YF\n    from fin_sk a join lms_order b\n    on (a.orderbh=b.orderbh)\n    left join fin_initysyf c\n    on(a.customerid=c.customerid)\n     \n    	and a.billdate   >=  ?\n     \n     \n    	and a.billdate   <=  ?\n     \n     \n     \n     \n     \n    	and a.customer=?\n     \n     \n     \n     ) p', '2018-05-05 00:48:10', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('97', '/lms/base/insertContract.do', '合同编号：XJLXFC20180201-5已经存在!', '2018-05-05 20:06:50', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('98', '/lms/financial/insertInitysyf.do', '客户：测试客户已经存在!', '2018-05-05 20:07:09', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('99', '/lms/financial/insertInitysyf.do', '客户：测试已经存在!', '2018-05-05 20:11:59', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('100', '/lms/container/getContainerEndPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerReportDao.getContainerEndCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)     from     (select c.containerbh,\'铁发\' type,a.orderbh,     a.start,a.end,b.arrivenum wagonnum,b.arrivedate,\'\' number     from lms_order a,lms_delivery b,base_container c     where a.orderbh=b.orderbh      and (c.containerbh=b.containerbh1 or c.containerbh=b.containerbh2)            and b.arrivedate   >=  ?                  and b.arrivedate   <=  ?                 union all     select c.containerbh,\'送货\' type,a.orderbh,     a.start,a.end,\'\' wagonnum,b.arrivedate,b.arrivenum number     from lms_order a,lms_empty b,base_container c     where a.orderbh=b.orderbh      and c.containerbh=b.containerbh            and b.arrivedate   >=  ?                  and b.arrivedate   <=  ?            ) p\r\n### Cause: java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'', '2018-05-05 20:19:15', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('101', '/lms/container/getContainerEndPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerReportDao.getContainerEndCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)     from     (select c.containerbh,\'铁发\' type,a.orderbh,     a.start,a.end,b.arrivenum wagonnum,b.arrivedate,\'\' number     from lms_order a,lms_delivery b,base_container c     where a.orderbh=b.orderbh      and (c.containerbh=b.containerbh1 or c.containerbh=b.containerbh2)            and b.arrivedate   >=  ?                  and b.arrivedate   <=  ?                 union all     select c.containerbh,\'送货\' type,a.orderbh,     a.start,a.end,\'\' wagonnum,b.arrivedate,b.arrivenum number     from lms_order a,lms_empty b,base_container c     where a.orderbh=b.orderbh      and c.containerbh=b.containerbh            and b.arrivedate   >=  ?                  and b.arrivedate   <=  ?            ) p\r\n### Cause: java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'', '2018-05-05 20:19:31', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('102', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select a.orderbh,a.customer,b.containerbh1,b.containerbh2,     (a.unitprice*b.weight) shouldfk,     a.productname,a.start,a.end,b.traindate shdate,     a.unitprice price,b.weight,b.loadaddress shplace     from lms_order a,lms_train b     where a.orderbh=b.orderbh            and b.traindate   >=  ?                  and b.traindate   <=  ?                        ORDER BY b.traindate                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'', '2018-05-05 20:28:28', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('103', '/lms/financial/getOrderhsPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'unitprice\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getOrderhsCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)     from      (select orderbh,customer,productname,     start,end,unitprice,quantity weight,(unitprice*quantity) shouldfk     from lms_order     where 1=1            and createtime   >=  ?                  and createtime   <=  ?                 ) a left join     (     select orderbh,sum(skamount) hasfk     from fin_sk     where 1=1           ) b     on(a.orderbh=b.orderbh)\r\n### Cause: java.sql.SQLException: Unknown column \'unitprice\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'unitprice\' in \'field list\'', '2018-05-05 20:28:32', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('104', '/lms/financial/getCustomerdebtsPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'unitprice\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCustomerdebtsCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)     from      (select a.orderbh,a.customer,a.productname,a.unitprice price,     a.weight,a.shouldfk,     case when b.hasfk is null then 0 else b.hasfk end hasfk,     a.start,a.end     from      (select orderbh,customer,productname,     start,end,unitprice,quantity weight,(unitprice*quantity) shouldfk,createtime     from lms_order     where 1=1           ) a left join     (     select orderbh,sum(skamount) hasfk     from fin_sk     where 1=1           ) b     on(a.orderbh=b.orderbh) ) p     where p.shouldfk > p.hasfk\r\n### Cause: java.sql.SQLException: Unknown column \'unitprice\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'unitprice\' in \'field list\'', '2018-05-05 20:28:35', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('105', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select a.orderbh,a.customer,b.containerbh1,b.containerbh2,     (a.unitprice*b.weight) shouldfk,     a.productname,a.start,a.end,b.traindate shdate,     a.unitprice price,b.weight,b.loadaddress shplace     from lms_order a,lms_train b     where a.orderbh=b.orderbh            and b.traindate   >=  ?                  and b.traindate   <=  ?                        ORDER BY b.traindate                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'', '2018-05-05 20:30:54', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('106', '/lms/container/getLocationPage.do', '### Error querying database.  Cause: java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'id\' in field list is ambiguous\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\LocationMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.ILocationDao.getLocationCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(id)     from lms_location a,lms_order b     where a.status=1 and a.orderbh=b.orderbh            and a.createtime   >=  CONCAT(?,\' 00:00:00\')                  and a.createtime   <=  CONCAT(?,\' 23:59:59\')\r\n### Cause: java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'id\' in field list is ambiguous\"\n; SQL []; Duplicate key or integrity constraint violation message from server: \"Column \'id\' in field list is ambiguous\"; nested exception is java.sql.SQLException: Duplicate key or integrity constraint violation message from server: \"Column \'id\' in field list is ambiguous\"', '2018-05-05 21:27:35', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('107', '/lms/container/getContainerEndPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerReportDao.getContainerEndCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)     from     (select c.containerbh,\'铁发\' type,a.orderbh,     a.start,a.end,b.arrivenum wagonnum,b.arrivedate,\'\' number     from lms_order a,lms_delivery b,base_container c     where a.orderbh=b.orderbh      and (c.containerbh=b.containerbh1 or c.containerbh=b.containerbh2)            and b.arrivedate   >=  ?                  and b.arrivedate   <=  ?                 union all     select c.containerbh,\'送货\' type,a.orderbh,     a.start,a.end,\'\' wagonnum,b.arrivedate,b.arrivenum number     from lms_order a,lms_empty b,base_container c     where a.orderbh=b.orderbh      and c.containerbh=b.containerbh            and b.arrivedate   >=  ?                  and b.arrivedate   <=  ?            ) p\r\n### Cause: java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'', '2018-05-05 21:31:43', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('108', '/lms/container/getContainerEndPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerReportDao.getContainerEndCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)     from     (select c.containerbh,\'铁发\' type,a.orderbh,     a.start,a.end,b.arrivenum wagonnum,b.arrivedate,\'\' number     from lms_order a,lms_delivery b,base_container c     where a.orderbh=b.orderbh      and (c.containerbh=b.containerbh1 or c.containerbh=b.containerbh2)            and b.arrivedate   >=  ?                  and b.arrivedate   <=  ?                 union all     select c.containerbh,\'送货\' type,a.orderbh,     a.start,a.end,\'\' wagonnum,b.arrivedate,b.arrivenum number     from lms_order a,lms_empty b,base_container c     where a.orderbh=b.orderbh      and c.containerbh=b.containerbh            and b.arrivedate   >=  ?                  and b.arrivedate   <=  ?            ) p\r\n### Cause: java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'', '2018-05-05 22:16:45', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('109', '/lms/container/getContainerEndPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerReportDao.getContainerEndCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)     from     (select c.containerbh,\'铁发\' type,a.orderbh,     a.start,a.end,b.arrivenum wagonnum,b.arrivedate,\'\' number     from lms_order a,lms_delivery b,base_container c     where a.orderbh=b.orderbh      and (c.containerbh=b.containerbh1 or c.containerbh=b.containerbh2)            and b.arrivedate   >=  ?                  and b.arrivedate   <=  ?                 union all     select c.containerbh,\'送货\' type,a.orderbh,     a.start,a.end,\'\' wagonnum,b.arrivedate,b.arrivenum number     from lms_order a,lms_empty b,base_container c     where a.orderbh=b.orderbh      and c.containerbh=b.containerbh            and b.arrivedate   >=  ?                  and b.arrivedate   <=  ?            ) p\r\n### Cause: java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.arrivenum\' in \'field list\'', '2018-05-05 22:39:34', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('110', '/lms/container/getContainerEndPage.do', '### Error querying database.  Cause: java.sql.SQLException: Syntax error or access violation message from server: \"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*)\n    from\n    (select orderbh,containerbh,\'调度派车\' type,shqch ch,dzdate\n\' at line 1\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerReportDao.getContainerEndCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(p.*)     from     (select orderbh,containerbh,\'调度派车\' type,shqch ch,dzdate     from lms_dispatche            and dzdate   >=  ?                  and dzdate   <=  ?                 union all     select orderbh,containerbh,\'铁发\' type,cph ch,dzdate     from lms_train            and dzdate   >=  ?                  and dzdate   <=  ?                 union all     select orderbh,containerbh,\'送货\' type,shqch ch,dzdate     from lms_delivery            and dzdate   >=  ?                  and dzdate   <=  ?                 union all     select orderbh,containerbh,\'回空\' type,cph ch,dzdate     from lms_empty            and dzdate   >=  ?                  and dzdate   <=  ?            ) P,lms_order T     where p.orderbh=t.orderbh\r\n### Cause: java.sql.SQLException: Syntax error or access violation message from server: \"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*)\n    from\n    (select orderbh,containerbh,\'调度派车\' type,shqch ch,dzdate\n\' at line 1\"\n; bad SQL grammar []; nested exception is java.sql.SQLException: Syntax error or access violation message from server: \"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*)\n    from\n    (select orderbh,containerbh,\'调度派车\' type,shqch ch,dzdate\n\' at line 1\"', '2018-05-06 00:04:01', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('111', '/lms/container/getContainerEndPage.do', '### Error querying database.  Cause: java.sql.SQLException: Syntax error or access violation message from server: \"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and dzdate   >=  \'2018-04-06\'\n     \n     \n    	and dzdate   <=  \'2018-05-06\'\n   \' at line 6\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerReportDao.getContainerEndCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(p.containerbh)     from     (select orderbh,containerbh,\'调度派车\' type,shqch ch,dzdate     from lms_dispatche            and dzdate   >=  ?                  and dzdate   <=  ?                 union all     select orderbh,containerbh,\'铁发\' type,cph ch,dzdate     from lms_train            and dzdate   >=  ?                  and dzdate   <=  ?                 union all     select orderbh,containerbh,\'送货\' type,shqch ch,dzdate     from lms_delivery            and dzdate   >=  ?                  and dzdate   <=  ?                 union all     select orderbh,containerbh,\'回空\' type,cph ch,dzdate     from lms_empty            and dzdate   >=  ?                  and dzdate   <=  ?            ) P,lms_order T     where p.orderbh=t.orderbh\r\n### Cause: java.sql.SQLException: Syntax error or access violation message from server: \"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and dzdate   >=  \'2018-04-06\'\n     \n     \n    	and dzdate   <=  \'2018-05-06\'\n   \' at line 6\"\n; bad SQL grammar []; nested exception is java.sql.SQLException: Syntax error or access violation message from server: \"You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and dzdate   >=  \'2018-04-06\'\n     \n     \n    	and dzdate   <=  \'2018-05-06\'\n   \' at line 6\"', '2018-05-06 00:07:16', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('112', '/lms/order/getDepositPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'A.DEPOSITFEE\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DepositMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDepositDao.getFkSummary-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select \'汇总\' containerbh,     CASE  WHEN SUM(DEPOSITFEE) IS NULL THEN 0 ELSE SUM(A.DEPOSITFEE) END DEPOSITFEE,     CASE  WHEN SUM(DOCKFEE) IS NULL THEN 0 ELSE SUM(A.DOCKFEE) END DOCKFEE     from lms_deposit     where 1=1            and enddate   >=  ?                  and enddate   <=  ?\r\n### Cause: java.sql.SQLException: Unknown column \'A.DEPOSITFEE\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'A.DEPOSITFEE\' in \'field list\'', '2018-05-06 00:23:56', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('113', '/lms/order/getDepositPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'A.DEPOSITFEE\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DepositMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDepositDao.getFkSummary-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select \'汇总\' containerbh,     CASE  WHEN SUM(DEPOSITFEE) IS NULL THEN 0 ELSE SUM(A.DEPOSITFEE) END DEPOSITFEE,     CASE  WHEN SUM(DOCKFEE) IS NULL THEN 0 ELSE SUM(A.DOCKFEE) END DOCKFEE     from lms_deposit     where 1=1            and enddate   >=  ?                  and enddate   <=  ?\r\n### Cause: java.sql.SQLException: Unknown column \'A.DEPOSITFEE\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'A.DEPOSITFEE\' in \'field list\'', '2018-05-06 00:24:05', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('114', '/lms/order/getDepositPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'A.DEPOSITFEE\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\DepositMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IDepositDao.getFkSummary-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select \'汇总\' containerbh,     CASE  WHEN SUM(DEPOSITFEE) IS NULL THEN 0 ELSE SUM(A.DEPOSITFEE) END DEPOSITFEE,     CASE  WHEN SUM(DOCKFEE) IS NULL THEN 0 ELSE SUM(A.DOCKFEE) END DOCKFEE     from lms_deposit     where 1=1            and enddate   >=  ?                  and enddate   <=  ?\r\n### Cause: java.sql.SQLException: Unknown column \'A.DEPOSITFEE\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'A.DEPOSITFEE\' in \'field list\'', '2018-05-06 00:25:17', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('115', '/lms/order/d_deposit.do', null, '2018-05-06 00:27:24', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('116', '/lms/financial/getJzxzjPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'a.shcost\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\OrderMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IOrderDao.getJzxzjCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      count(a.id)     from     (select      a.shdate,c.qpdate,b.start,a.containerbh,f.source,c.weight,b.end,b.customer,     a.shqch,a.shcost,i.price*(datediff(?,?)) rentcost,c.jzxcost,     c.traincost,c.ispayfees,d.shcost songhcost,c.dzzxcost,g.unitprice,     c.weight*g.unitprice yf,b.receipttype,e.servicecost,e.othercost     from lms_dispatche a      join lms_order b on(a.orderbh=b.orderbh)     left join lms_train c on(a.id=c.referid)     left join lms_delivery d on(c.id=d.referid)     left join lms_empty e on(d.id=e.referid)     join base_container f on(a.containerbh=f.containerbh)     join base_contract g on(b.htbh=g.htbh)     join lms_location h on(a.orderbh=h.orderbh and a.containerbh=h.containerbh)     left join      (select x.containerbh,y.price from base_container x,base_ctrent y     where x.id=y.id and x.status=1 and y.status=1     and y.BEGINDATE <=  SYSDATE()     and y.ENDDATE >=  SYSDATE()) i on(a.containerbh=i.containerbh)            and a.shdate   >=  ?                  and a.shdate   <=  ?                  ) P\r\n### Cause: java.sql.SQLException: Unknown column \'a.shcost\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'a.shcost\' in \'field list\'', '2018-05-06 13:03:31', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('117', '/lms/financial/getJzxzjPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'a.id\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\OrderMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IOrderDao.getJzxzjCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      count(a.id)     from     (select      a.shdate,c.qpdate,b.start,a.containerbh,f.source,c.weight,b.end,b.customer,     a.shqch,a.shyccost,i.price*(datediff(?,?)) rentcost,c.jzxcost,     c.traincost,c.ispayfees,d.shcost,c.dzzxcost,g.unitprice,     c.weight*g.unitprice yf,b.receipttype,e.servicecost,e.othercost     from lms_dispatche a      join lms_order b on(a.orderbh=b.orderbh)     left join lms_train c on(a.id=c.referid)     left join lms_delivery d on(c.id=d.referid)     left join lms_empty e on(d.id=e.referid)     join base_container f on(a.containerbh=f.containerbh)     join base_contract g on(b.htbh=g.htbh)     join lms_location h on(a.orderbh=h.orderbh and a.containerbh=h.containerbh)     left join      (select x.containerbh,y.price from base_container x,base_ctrent y     where x.id=y.id and x.status=1 and y.status=1     and y.BEGINDATE <=  SYSDATE()     and y.ENDDATE >=  SYSDATE()) i on(a.containerbh=i.containerbh)            and a.shdate   >=  ?                  and a.shdate   <=  ?                  ) P\r\n### Cause: java.sql.SQLException: Unknown column \'a.id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'a.id\' in \'field list\'', '2018-05-06 13:07:07', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('118', '/lms/financial/getJzxzjPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'a.id\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\OrderMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IOrderDao.getJzxzjCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      count(a.id)     from     (select a.id,     a.shdate,c.qpdate,b.start,a.containerbh,f.source,c.weight,b.end,b.customer,     a.shqch,a.shyccost,i.price*(datediff(?,?)) rentcost,c.jzxcost,     c.traincost,c.ispayfees,d.shcost,c.dzzxcost,g.unitprice,     c.weight*g.unitprice yf,b.receipttype,e.servicecost,e.othercost     from lms_dispatche a      join lms_order b on(a.orderbh=b.orderbh)     left join lms_train c on(a.id=c.referid)     left join lms_delivery d on(c.id=d.referid)     left join lms_empty e on(d.id=e.referid)     join base_container f on(a.containerbh=f.containerbh)     join base_contract g on(b.htbh=g.htbh)     join lms_location h on(a.orderbh=h.orderbh and a.containerbh=h.containerbh)     left join      (select x.containerbh,y.price from base_container x,base_ctrent y     where x.id=y.id and x.status=1 and y.status=1     and y.BEGINDATE <=  SYSDATE()     and y.ENDDATE >=  SYSDATE()) i on(a.containerbh=i.containerbh)            and a.shdate   >=  ?                  and a.shdate   <=  ?                  ) P\r\n### Cause: java.sql.SQLException: Unknown column \'a.id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'a.id\' in \'field list\'', '2018-05-06 13:08:06', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('119', '/lms/financial/getJzxzjPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'c.traincost\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\OrderMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IOrderDao.getJzxzjPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select      shdate,qpdate,start,containerbh,source,weight,     end,customer,shqch,shyccost,rentcost,jzxcost,c.traincost,ispayfees,     shcost,dzzxcost,unitprice,yf,receipttype,servicecost,othercost     from     (select      a.shdate,c.qpdate,b.start,a.containerbh,f.source,c.weight,b.end,b.customer,     a.shqch,a.shyccost,i.price*(datediff(?,?)) rentcost,c.jzxcost,     c.traincost,c.ispayfees,d.shcost,c.dzzxcost,g.unitprice,     c.weight*g.unitprice yf,b.receipttype,e.servicecost,e.othercost     from lms_dispatche a      join lms_order b on(a.orderbh=b.orderbh)     left join lms_train c on(a.id=c.referid)     left join lms_delivery d on(c.id=d.referid)     left join lms_empty e on(d.id=e.referid)     join base_container f on(a.containerbh=f.containerbh)     join base_contract g on(b.htbh=g.htbh)     join lms_location h on(a.orderbh=h.orderbh and a.containerbh=h.containerbh)     left join      (select x.containerbh,y.price from base_container x,base_ctrent y     where x.id=y.id and x.status=1 and y.status=1     and y.BEGINDATE <=  SYSDATE()     and y.ENDDATE >=  SYSDATE()) i on(a.containerbh=i.containerbh)            and a.shdate   >=  ?                  and a.shdate   <=  ?                  ) P            ORDER BY shdate                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'c.traincost\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'c.traincost\' in \'field list\'', '2018-05-06 13:08:35', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('120', '/lms/order/getFyhistoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'a.id\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\OrderMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IOrderDao.getFyhistoryCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(a.id)     from     (select      a.shdate,c.qpdate,c.hph,b.start,a.containerbh,f.source,c.cph,a.qfh,c.weight,d.xhweight,b.productname,     a.shqch,b.end,b.customer,a.address,c.ispayfees,c.jzxcost,c.traincost,c.fjqsdcost,     d.shfleet,d.lxr,d.phone,b.receiver,b.receivephone,g.mdd,d.shcost,c.dzzxcost,     h.stage,e.cph hkcph,e.servicecost,e.othercost     from lms_dispatche a      join lms_order b on(a.orderbh=b.orderbh)     left join lms_train c on(a.id=c.referid)     left join lms_delivery d on(c.id=d.referid)     left join lms_empty e on(d.id=e.referid)     join base_container f on(a.containerbh=f.containerbh)     join base_contract g on(b.htbh=g.htbh)     join lms_location h on(a.orderbh=h.orderbh and a.containerbh=h.containerbh)     where 1=1            and a.shdate   >=  ?                  and a.shdate   <=  ?                  ) P\r\n### Cause: java.sql.SQLException: Unknown column \'a.id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'a.id\' in \'field list\'', '2018-05-06 15:24:39', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('121', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select a.orderbh,a.customer,b.containerbh1,b.containerbh2,     (a.unitprice*b.weight) shouldfk,     a.productname,a.start,a.end,b.traindate shdate,     a.unitprice price,b.weight,b.loadaddress shplace     from lms_order a,lms_train b     where a.orderbh=b.orderbh            and b.traindate   >=  ?                  and b.traindate   <=  ?                        ORDER BY b.traindate                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'', '2018-05-06 15:34:20', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('122', '/lms/container/getContaineravailablePage.do', '### Error querying database.  Cause: java.sql.SQLException: Duplicate column name \'containerbh\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerReportDao.getContaineravailableCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(x.containerbh)     from     (select p.containerbh,t.customer,t.productname,     case when t.end is null then \'新集装箱\' else t.end end end,t.containerbh,t.trndate     from base_container p     left join      (select a.customer,a.productname,a.end,b.containerbh,max(b.dzdate) trndate     from lms_order a,lms_empty b     where a.orderbh=b.orderbh     group by a.customer,a.productname,a.end,b.containerbh) t      on(p.containerbh=t.containerbh)     where p.position=0            ) X\r\n### Cause: java.sql.SQLException: Duplicate column name \'containerbh\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Duplicate column name \'containerbh\'', '2018-05-06 16:35:09', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('123', '/lms/container/getXhjsPage.do', '### Error querying database.  Cause: java.sql.SQLException: General error message from server: \"Incorrect usage of UNION and ORDER BY\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerReportDao.getXhjsCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select     count(containerbh)    from    (select t.containerbh,p.customer,p.productname,p.htbh,p.orderbh,t.type,p.start,p.end,t.startdate,p.enddate    from lms_order p,     (select containerbh,\'调度派车\' type,shdate startdate,dzdate enddate     from lms_dispatche     where containerbh=?            ORDER BY p.dzdate desc           union all     select containerbh,\'铁发\' type,qpdate startdate,dzdate enddate     from lms_train     where containerbh=?     union all     select containerbh,\'送货\' type,shdate startdate,dzdate enddate     from lms_delivery     where containerbh=?     union all     select containerbh,\'回空\' type,qpdate startdate,dzdate enddate     from lms_empty     where containerbh=?) T     where p.orderbh=t.orderbh) X\r\n### Cause: java.sql.SQLException: General error message from server: \"Incorrect usage of UNION and ORDER BY\"\n; SQL []; General error message from server: \"Incorrect usage of UNION and ORDER BY\"; nested exception is java.sql.SQLException: General error message from server: \"Incorrect usage of UNION and ORDER BY\"', '2018-05-06 18:26:20', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('124', '/lms/container/getXhjsPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'p.enddate\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerReportDao.getXhjsCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select     count(containerbh)    from    (select t.containerbh,p.customer,p.productname,p.htbh,p.orderbh,t.type,p.start,p.end,t.startdate,p.enddate    from lms_order p,     (select containerbh,\'调度派车\' type,shdate startdate,dzdate enddate     from lms_dispatche     where containerbh=?     union all     select containerbh,\'铁发\' type,qpdate startdate,dzdate enddate     from lms_train     where containerbh=?     union all     select containerbh,\'送货\' type,shdate startdate,dzdate enddate     from lms_delivery     where containerbh=?     union all     select containerbh,\'回空\' type,qpdate startdate,dzdate enddate     from lms_empty     where containerbh=?) T     where p.orderbh=t.orderbh) X\r\n### Cause: java.sql.SQLException: Unknown column \'p.enddate\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'p.enddate\' in \'field list\'', '2018-05-06 18:27:38', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('125', '/lms/container/getXhjsPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'t.orderbh\' in \'where clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\ContainerReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IContainerReportDao.getXhjsCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select     count(containerbh)    from    (select t.containerbh,p.customer,p.productname,p.htbh,p.orderbh,t.type,p.start,p.end,t.startdate,t.enddate    from lms_order p,     (select containerbh,\'调度派车\' type,shdate startdate,dzdate enddate     from lms_dispatche     where containerbh=?     union all     select containerbh,\'铁发\' type,qpdate startdate,dzdate enddate     from lms_train     where containerbh=?     union all     select containerbh,\'送货\' type,shdate startdate,dzdate enddate     from lms_delivery     where containerbh=?     union all     select containerbh,\'回空\' type,qpdate startdate,dzdate enddate     from lms_empty     where containerbh=?) T     where p.orderbh=t.orderbh) X\r\n### Cause: java.sql.SQLException: Unknown column \'t.orderbh\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'t.orderbh\' in \'where clause\'', '2018-05-06 18:28:28', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('126', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select a.orderbh,a.customer,b.containerbh1,b.containerbh2,     (a.unitprice*b.weight) shouldfk,     a.productname,a.start,a.end,b.traindate shdate,     a.unitprice price,b.weight,b.loadaddress shplace     from lms_order a,lms_train b     where a.orderbh=b.orderbh            and b.traindate   >=  ?                  and b.traindate   <=  ?                        ORDER BY b.traindate                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'', '2018-05-06 18:59:45', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('127', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select a.orderbh,a.customer,b.containerbh1,b.containerbh2,     (a.unitprice*b.weight) shouldfk,     a.productname,a.start,a.end,b.traindate shdate,     a.unitprice price,b.weight,b.loadaddress shplace     from lms_order a,lms_train b     where a.orderbh=b.orderbh            and b.traindate   >=  ?                  and b.traindate   <=  ?                        ORDER BY b.traindate                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'', '2018-05-06 19:04:34', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('128', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select a.orderbh,a.customer,b.containerbh1,b.containerbh2,     (a.unitprice*b.weight) shouldfk,     a.productname,a.start,a.end,b.traindate shdate,     a.unitprice price,b.weight,b.loadaddress shplace     from lms_order a,lms_train b     where a.orderbh=b.orderbh            and b.traindate   >=  ?                  and b.traindate   <=  ?                        ORDER BY b.traindate                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.containerbh1\' in \'field list\'', '2018-05-06 19:04:45', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('129', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'c.weight\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select a.orderbh,a.customer,b.containerbh,     (c.unitprice*c.weight) shouldfk,     a.productname,a.start,a.end,b.shdate,     c.unitprice price,c.weight,b.address shplace     from lms_order a,lms_dispatche b,base_contract c     where a.orderbh=b.orderbh and a.htbh=c.htbh            and b.shdate   >=  ?                  and b.shdate   <=  ?                        ORDER BY b.traindate                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'c.weight\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'c.weight\' in \'field list\'', '2018-05-06 19:08:53', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('130', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'c.weight\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select a.orderbh,a.customer,b.containerbh,     (c.unitprice*c.weight) shouldfk,     a.productname,a.start,a.end,b.shdate,     c.unitprice price,c.quantity weight,b.address shplace     from lms_order a,lms_dispatche b,base_contract c     where a.orderbh=b.orderbh and a.htbh=c.htbh            and b.shdate   >=  ?                  and b.shdate   <=  ?                        ORDER BY b.traindate                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'c.weight\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'c.weight\' in \'field list\'', '2018-05-06 19:10:01', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('131', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.traindate\' in \'order clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select a.orderbh,a.customer,b.containerbh,     (c.unitprice*c.quantity) shouldfk,     a.productname,a.start,a.end,b.shdate,     c.unitprice price,c.quantity weight,b.address shplace     from lms_order a,lms_dispatche b,base_contract c     where a.orderbh=b.orderbh and a.htbh=c.htbh            and b.shdate   >=  ?                  and b.shdate   <=  ?                        ORDER BY b.traindate                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'b.traindate\' in \'order clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.traindate\' in \'order clause\'', '2018-05-06 19:10:36', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('132', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'a.unitprice\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementSummary-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select \'汇总\' productname,     case when sum(a.unitprice*b.weight) is null then 0 else sum(a.unitprice*b.weight) end shouldfk     from lms_order a,lms_train b     where a.orderbh=b.orderbh            and b.traindate   >=  ?                  and b.traindate   <=  ?\r\n### Cause: java.sql.SQLException: Unknown column \'a.unitprice\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'a.unitprice\' in \'field list\'', '2018-05-06 19:12:20', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('133', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'b.quantity\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementSummary-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select \'汇总\' productname,     case when sum(c.unitprice*c.quantity) is null then 0 else sum(c.unitprice*b.quantity) end shouldfk     from lms_order a,lms_dispatche b,base_contract c     where a.orderbh=b.orderbh and a.htbh=c.htbh            and b.shdate   >=  ?                  and b.shdate   <=  ?\r\n### Cause: java.sql.SQLException: Unknown column \'b.quantity\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'b.quantity\' in \'field list\'', '2018-05-06 19:13:57', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('134', '/lms/financial/getOrderhsPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'unitprice\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getOrderhsCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)     from      (select orderbh,customer,productname,     start,end,unitprice,quantity weight,(unitprice*quantity) shouldfk     from lms_order     where 1=1            and createtime   >=  ?                  and createtime   <=  ?                 ) a left join     (     select orderbh,sum(skamount) hasfk     from fin_sk     where 1=1           ) b     on(a.orderbh=b.orderbh)\r\n### Cause: java.sql.SQLException: Unknown column \'unitprice\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'unitprice\' in \'field list\'', '2018-05-06 19:17:22', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('135', '/lms/financial/getOrderhsPage.do', '### Error querying database.  Cause: java.sql.SQLException: Base table or view not found message from server: \"Table \'lms.lms_contract\' doesn\'t exist\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getOrderhsCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)     from      (select a.orderbh,a.customer,a.productname,     a.start,a.end,b.unitprice,b.quantity weight,(b.unitprice*b.quantity) shouldfk     from lms_order a,lms_contract b     where a.htbh=b.htbh            and a.createtime   >=  ?                  and a.createtime   <=  ?                 ) a left join     (     select orderbh,sum(skamount) hasfk     from fin_sk     where 1=1           ) b     on(a.orderbh=b.orderbh)\r\n### Cause: java.sql.SQLException: Base table or view not found message from server: \"Table \'lms.lms_contract\' doesn\'t exist\"\n; bad SQL grammar []; nested exception is java.sql.SQLException: Base table or view not found message from server: \"Table \'lms.lms_contract\' doesn\'t exist\"', '2018-05-06 19:23:33', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('136', '/lms/financial/getOrderhsPage.do', '### Error querying database.  Cause: java.sql.SQLException: Base table or view not found message from server: \"Table \'lms.lms_contract\' doesn\'t exist\"\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getOrderhsCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)     from      (select a.orderbh,a.customer,a.productname,     a.start,a.end,b.unitprice,b.quantity weight,(b.unitprice*b.quantity) shouldfk     from lms_order a,lms_contract b     where a.htbh=b.htbh            and a.createtime   >=  ?                  and a.createtime   <=  ?                 ) a left join     (     select orderbh,sum(skamount) hasfk     from fin_sk     where 1=1           ) b     on(a.orderbh=b.orderbh)\r\n### Cause: java.sql.SQLException: Base table or view not found message from server: \"Table \'lms.lms_contract\' doesn\'t exist\"\n; bad SQL grammar []; nested exception is java.sql.SQLException: Base table or view not found message from server: \"Table \'lms.lms_contract\' doesn\'t exist\"', '2018-05-06 19:24:25', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('137', '/lms/financial/getCustomerdebtsPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'unitprice\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCustomerdebtsCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)     from      (select a.orderbh,a.customer,a.productname,a.unitprice price,     a.weight,a.shouldfk,     case when b.hasfk is null then 0 else b.hasfk end hasfk,     a.start,a.end     from      (select orderbh,customer,productname,     start,end,unitprice,quantity weight,(unitprice*quantity) shouldfk,createtime     from lms_order     where 1=1           ) a left join     (     select orderbh,sum(skamount) hasfk     from fin_sk     where 1=1           ) b     on(a.orderbh=b.orderbh) ) p     where p.shouldfk > p.hasfk\r\n### Cause: java.sql.SQLException: Unknown column \'unitprice\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'unitprice\' in \'field list\'', '2018-05-06 19:25:38', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('138', '/lms/account/checkLogin.do', '密码不正确！', '2018-05-06 21:23:51', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('139', '/lms/account/checkLogin.do', '密码不正确！', '2018-05-06 21:23:51', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('140', '/lms/account/checkLogin.do', '密码不正确！', '2018-05-06 21:24:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('141', '/lms/base/insertContainer.do', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'position\' in \'class com.jschrj.model.Container\'', '2018-05-06 21:45:09', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('142', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'a.containerbh\' in \'where clause\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(b.containerbh)     from lms_order a,lms_dispatche b,base_contract c,lms_train d     where a.orderbh=b.orderbh and a.htbh=c.htbh and a.containerbh=d.containerbh            and shdate   >=  ?                  and shdate   <=  ?\r\n### Cause: java.sql.SQLException: Unknown column \'a.containerbh\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'a.containerbh\' in \'where clause\'', '2018-05-06 23:24:19', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('143', '/lms/financial/getCstatementPage.do', '### Error querying database.  Cause: java.sql.SQLException: Unknown column \'containerbh\' in \'field list\'\r\n### The error may exist in file [F:\\出差电脑内容备份\\项目\\lms\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\lms\\WEB-INF\\classes\\com\\jschrj\\mapper\\FinancialReportMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.IFinancialReportDao.getCstatementPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select orderbh,customer,containerbh,     shouldfk,productname,start,end,shdate,     price,weight,shplace     from     (select a.orderbh,a.customer,     (c.unitprice*d.weight) shouldfk,     a.productname,a.start,a.end,b.shdate,     c.unitprice price,d.weight,b.address shplace     from lms_order a,lms_dispatche b,base_contract c,lms_train d     where a.orderbh=b.orderbh and a.htbh=c.htbh and b.containerbh=d.containerbh            and b.shdate   >=  ?                  and b.shdate   <=  ?            ) P            ORDER BY shdate                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Unknown column \'containerbh\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'containerbh\' in \'field list\'', '2018-05-06 23:25:08', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('144', '/lms/order/insertTrain.do', null, '2018-05-13 08:46:59', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('145', '/lms/order/insertTrain.do', null, '2018-05-13 08:56:08', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('146', '/lms/account/checkLogin.do', '用户不存在！', '2018-05-20 00:06:42', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('147', '/lms/account/checkLogin.do', '密码不正确！', '2018-05-20 15:08:27', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('148', '/lms/files/getFile.do', null, '2018-05-20 15:42:24', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('149', '/lms/account/checkLogin.do', '密码不正确！', '2018-05-20 16:26:16', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('150', '/lms/account/checkLogin.do', '密码不正确！', '2018-05-20 16:28:49', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('151', '/lms/account/checkLogin.do', '密码不正确！', '2018-05-20 16:58:56', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('152', '/lms/system/updateOrg.do', null, '2018-05-22 20:36:36', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('153', '/lms/order/insertDispatche.do', '### Error updating database.  Cause: java.sql.SQLException: Unknown column \'REDERID\' in \'field list\'\r\n### The error may involve com.jschrj.dao.IFkDao.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into fin_fk      ( FKBH,                       ORDERBH,                       STATUS,                              REVIEWSTATUS,                       SKUNIT,                       FKAMOUNT,                       HANDMAN,                                     BILLDATE,                                     REMARK,                       SOURCE,                       REDERID,              CREATETIME )       values ( ?,                       ?,                       ?,                              ?,                       ?,                       ?,                       ?,                                     ?,                                     ?,                       ?,                       ?,              SYSDATE() )\r\n### Cause: java.sql.SQLException: Unknown column \'REDERID\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLException: Unknown column \'REDERID\' in \'field list\'', '2018-05-27 13:43:29', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('154', '/lms/order/getDispatcheEntity.do', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '2018-05-27 14:04:43', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('155', '/lms/order/getDispatcheEntity.do', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '2018-05-27 14:04:46', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('156', '/lms/base/insertCustomer.do', '### Error updating database.  Cause: java.sql.SQLException: General error message from server: \"Field \'YYLICENSE\' doesn\'t have a default value\"\r\n### The error may involve com.jschrj.dao.ICustomerDao.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into base_customer      ( NAME,                       TYPE,                       STATUS,                                            FRNAME,                       FRIDCARD,                       KHH,                       YHKNUM,                       CONTACTS,                       QQ,                       WEIXIN,                       ZFB,                       TEL,                       PHONE,                       FAX,                       POSTALCODE,                       ADDRESS,              CREATETIME,                       USERID,                       USERNAME )       values ( ?,                       ?,                       ?,                                            ?,                       ?,                       ?,                       ?,                       ?,                       ?,                       ?,                       ?,                       ?,                       ?,                       ?,                       ?,                       ?,              SYSDATE(),                       ?,                       ? )\r\n### Cause: java.sql.SQLException: General error message from server: \"Field \'YYLICENSE\' doesn\'t have a default value\"\n; SQL []; General error message from server: \"Field \'YYLICENSE\' doesn\'t have a default value\"; nested exception is java.sql.SQLException: General error message from server: \"Field \'YYLICENSE\' doesn\'t have a default value\"', '2018-05-28 20:54:30', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('157', '/lms/files/getFile.do', null, '2018-05-28 20:55:52', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('158', '/lms/files/getFile.do', null, '2018-06-03 17:15:20', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('159', '/lms/files/getFile.do', null, '2018-06-03 17:15:25', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('160', '/gw/system/insertOrg.do', null, '2018-06-09 19:21:12', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('161', '/gw/system/insertOrg.do', null, '2018-06-09 19:27:24', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('162', '/gw/system/insertOrg.do', null, '2018-06-09 19:29:21', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('163', '/gw/system/insertUser.do', '### Error updating database.  Cause: java.sql.SQLException: General error message from server: \"Field \'ORGPOWERID\' doesn\'t have a default value\"\r\n### The error may involve com.jschrj.web.system.dao.IUserDao.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user      ( NAME,                       PASSWORD,                              STATUS,                       REALNAME,                       ORGID,                       DEPTID,                                     LISTID,              CREATETIME,                       USERID,                       USERNAME )       values ( ?,                       ?,                              ?,                       ?,                       ?,                       ?,                                     ?,              SYSDATE(),                       ?,                       ? )\r\n### Cause: java.sql.SQLException: General error message from server: \"Field \'ORGPOWERID\' doesn\'t have a default value\"\n; SQL []; General error message from server: \"Field \'ORGPOWERID\' doesn\'t have a default value\"; nested exception is java.sql.SQLException: General error message from server: \"Field \'ORGPOWERID\' doesn\'t have a default value\"', '2018-06-09 20:38:24', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('164', '/story/getStoryPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: The expression \'userids\' evaluated to a null value.', '2019-01-26 10:00:18', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('165', '/story/getStoryPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: The expression \'userids\' evaluated to a null value.', '2019-01-26 10:13:53', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('166', '/system/getOrgUserTree.do', '### Error querying database.  Cause: java.sql.SQLException: Invalid value for getInt() - \'admin\'\r\n### The error may exist in URL [jar:file:/D:/SOURCES/IDEA/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/system/UserMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.system.IUserDao.getOrgUserTree\r\n### The error occurred while handling results\r\n### SQL: select id,name,0 pid,\'false\' nocheck       from sys_organization       where status=1       union ALL       select name id,realname name,deptid pid,\'false\' nocheck       from sys_user       where status=1       and deptid <> \'0\'\r\n### Cause: java.sql.SQLException: Invalid value for getInt() - \'admin\'\n; SQL []; Invalid value for getInt() - \'admin\'; nested exception is java.sql.SQLException: Invalid value for getInt() - \'admin\'', '2019-01-26 10:58:27', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('167', '/story/getStoryPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: The expression \'userids\' evaluated to a null value.', '2019-01-26 11:14:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('168', '/story/getStoryPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: The expression \'userids\' evaluated to a null value.', '2019-01-26 15:05:38', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('169', '/story/getStoryPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: The expression \'userids\' evaluated to a null value.', '2019-01-26 15:09:31', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('170', '/story/getStoryPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: The expression \'userids\' evaluated to a null value.', '2019-01-26 15:10:07', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('171', '/story/getStoryPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: The expression \'userids\' evaluated to a null value.', '2019-01-26 15:12:15', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('172', '/story/getStoryPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: The expression \'openedby\' evaluated to a null value.', '2019-01-26 15:24:20', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('173', '/story/getStoryPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: The expression \'openedby\' evaluated to a null value.', '2019-01-26 15:29:18', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('174', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ct=b.id,a.source=c.id,a.openedby=d.\',expect COMMA, actual COMMA id : select count(a.id)\n    from pms_story a,base_project b,base_source c,sys_user d\n    where a.project=b.id,a.source=c.id,a.openedby=d.id\r\n### The error may exist in URL [jar:file:/D:/SOURCES/IDEA/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryCounts\r\n### The error occurred while executing a query\r\n### SQL: select count(a.id)     from pms_story a,base_project b,base_source c,sys_user d     where a.project=b.id,a.source=c.id,a.openedby=d.id\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ct=b.id,a.source=c.id,a.openedby=d.\',expect COMMA, actual COMMA id : select count(a.id)\n    from pms_story a,base_project b,base_source c,sys_user d\n    where a.project=b.id,a.source=c.id,a.openedby=d.id\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, error in :\'ct=b.id,a.source=c.id,a.openedby=d.\',expect COMMA, actual COMMA id : select count(a.id)\n    from pms_story a,base_project b,base_source c,sys_user d\n    where a.project=b.id,a.source=c.id,a.openedby=d.id; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ct=b.id,a.source=c.id,a.openedby=d.\',expect COMMA, actual COMMA id : select count(a.id)\n    from pms_story a,base_project b,base_source c,sys_user d\n    where a.project=b.id,a.source=c.id,a.openedby=d.id', '2019-01-26 15:31:27', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('175', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ct=b.id,a.source=c.id,a.openedby=d.\',expect COMMA, actual COMMA id : select count(a.id)\n    from pms_story a,base_project b,base_source c,sys_user d\n    where a.project=b.id,a.source=c.id,a.openedby=d.id\r\n### The error may exist in URL [jar:file:/D:/SOURCES/IDEA/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryCounts\r\n### The error occurred while executing a query\r\n### SQL: select count(a.id)     from pms_story a,base_project b,base_source c,sys_user d     where a.project=b.id,a.source=c.id,a.openedby=d.id\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ct=b.id,a.source=c.id,a.openedby=d.\',expect COMMA, actual COMMA id : select count(a.id)\n    from pms_story a,base_project b,base_source c,sys_user d\n    where a.project=b.id,a.source=c.id,a.openedby=d.id\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, error in :\'ct=b.id,a.source=c.id,a.openedby=d.\',expect COMMA, actual COMMA id : select count(a.id)\n    from pms_story a,base_project b,base_source c,sys_user d\n    where a.project=b.id,a.source=c.id,a.openedby=d.id; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ct=b.id,a.source=c.id,a.openedby=d.\',expect COMMA, actual COMMA id : select count(a.id)\n    from pms_story a,base_project b,base_source c,sys_user d\n    where a.project=b.id,a.source=c.id,a.openedby=d.id', '2019-01-26 15:31:29', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('176', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ct=b.id,a.source=c.id,a.openedby=d.\',expect COMMA, actual COMMA id : select count(a.id)\n    from pms_story a,base_project b,base_source c,sys_user d\n    where a.project=b.id,a.source=c.id,a.openedby=d.id\r\n### The error may exist in URL [jar:file:/D:/SOURCES/IDEA/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryCounts\r\n### The error occurred while executing a query\r\n### SQL: select count(a.id)     from pms_story a,base_project b,base_source c,sys_user d     where a.project=b.id,a.source=c.id,a.openedby=d.id\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ct=b.id,a.source=c.id,a.openedby=d.\',expect COMMA, actual COMMA id : select count(a.id)\n    from pms_story a,base_project b,base_source c,sys_user d\n    where a.project=b.id,a.source=c.id,a.openedby=d.id\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, error in :\'ct=b.id,a.source=c.id,a.openedby=d.\',expect COMMA, actual COMMA id : select count(a.id)\n    from pms_story a,base_project b,base_source c,sys_user d\n    where a.project=b.id,a.source=c.id,a.openedby=d.id; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ct=b.id,a.source=c.id,a.openedby=d.\',expect COMMA, actual COMMA id : select count(a.id)\n    from pms_story a,base_project b,base_source c,sys_user d\n    where a.project=b.id,a.source=c.id,a.openedby=d.id', '2019-01-26 15:38:59', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('177', '/story/getStoryPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Every derived table must have its own alias\r\n### The error may exist in URL [jar:file:/D:/SOURCES/IDEA/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select     id, project,projectname, source,sourcename, pri, title, status, content, deadline, fileid,     openedby, openeddate     from(select     a.id, a.project,b.name projectname, a.source,c.name sourcename, a.pri, a.title, a.status, a.content, a.deadline,     a.fileid,     a.openedby, a.openeddate     from pms_story a,base_project b,base_source c,sys_user d     where  a.project=b.id     and a.source=c.id and a.openedby=d.id                                                )             ORDER BY openeddate desc                 LIMIT ? OFFSET ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Every derived table must have its own alias\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Every derived table must have its own alias', '2019-01-26 15:42:44', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('178', '/story/getStoryPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'m.openeddate\' in \'where clause\'\r\n### The error may exist in URL [jar:file:/D:/SOURCES/IDEA/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(a.id)     from pms_story a,base_project b,base_source c,sys_user d     where a.status=1 and a.project=b.id     and a.source=c.id and a.openedby=d.id             and m.openeddate  >=  ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'m.openeddate\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'m.openeddate\' in \'where clause\'', '2019-01-26 16:34:13', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('179', '/story/getStoryPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'m.openeddate\' in \'where clause\'\r\n### The error may exist in URL [jar:file:/D:/SOURCES/IDEA/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(a.id)     from pms_story a,base_project b,base_source c,sys_user d     where a.status=1 and a.project=b.id     and a.source=c.id and a.openedby=d.id             and m.openeddate  >=  ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'m.openeddate\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'m.openeddate\' in \'where clause\'', '2019-01-26 16:34:21', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('180', '/ueditor/config.do', 'Could not parse multipart servlet request; nested exception is org.apache.commons.fileupload.FileUploadException: Stream ended unexpectedly', '2019-02-10 17:03:53', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('181', '/ueditor/config.do', 'Could not parse multipart servlet request; nested exception is org.apache.commons.fileupload.FileUploadException: Stream ended unexpectedly', '2019-02-10 17:06:11', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('182', '/ueditor/config.do', 'Could not parse multipart servlet request; nested exception is org.apache.commons.fileupload.FileUploadException: Stream ended unexpectedly', '2019-02-10 17:07:39', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('183', '/ueditor/config.do', 'Could not parse multipart servlet request; nested exception is org.apache.commons.fileupload.FileUploadException: Stream ended unexpectedly', '2019-02-10 17:09:02', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('184', '/ueditor/config.do', 'Could not parse multipart servlet request; nested exception is org.apache.commons.fileupload.FileUploadException: Stream ended unexpectedly', '2019-02-10 17:12:27', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('185', '/ueditor/config.do', 'Could not parse multipart servlet request; nested exception is org.apache.commons.fileupload.FileUploadException: Stream ended unexpectedly', '2019-02-10 17:21:01', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('186', '/ueditor/config.do', 'Could not parse multipart servlet request; nested exception is org.apache.commons.fileupload.FileUploadException: Stream ended unexpectedly', '2019-02-10 17:29:26', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('187', '/files/upload.do', null, '2019-02-10 19:30:04', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('188', '/files/upload.do', null, '2019-02-10 19:43:58', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('189', '/files/upload.do', null, '2019-02-10 19:44:14', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('190', '/files/upload.do', null, '2019-02-10 19:44:34', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('191', '/files/upload.do', null, '2019-02-10 19:46:18', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('192', '/files/upload.do', null, '2019-02-10 19:47:07', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('193', '/files/upload.do', 'Could not parse multipart servlet request; nested exception is java.lang.IllegalStateException: ??????multi-part???????parts', '2019-02-10 20:02:07', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('194', '/files/upload.do', 'Could not parse multipart servlet request; nested exception is java.lang.IllegalStateException: ??????multi-part???????parts', '2019-02-10 20:02:16', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('195', '/files/upload.do', 'Could not parse multipart servlet request; nested exception is java.lang.IllegalStateException: ??????multi-part???????parts', '2019-02-10 20:02:23', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('196', '/files/upload.do', 'Could not parse multipart servlet request; nested exception is java.lang.IllegalStateException: ??????multi-part???????parts', '2019-02-10 20:02:30', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('197', '/files/upload.do', 'Could not parse multipart servlet request; nested exception is java.lang.IllegalStateException: ??????multi-part???????parts', '2019-02-10 20:03:03', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('198', '/files/upload.do', 'Could not parse multipart servlet request; nested exception is java.lang.IllegalStateException: ??????multi-part???????parts', '2019-02-10 20:06:10', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('199', '/files/upload.do', 'Could not parse multipart servlet request; nested exception is java.lang.IllegalStateException: ??????multi-part???????parts', '2019-02-10 20:06:29', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('200', '/files/upload.do', 'http:\\127.0.0.1:8079FILES_201902100001png\\FILES_201902100001png (????????????????)', '2019-02-10 20:10:25', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('201', '/files/upload.do', 'http:\\127.0.0.1:8079FILES_201902100002png\\FILES_201902100002png (????????????????)', '2019-02-10 20:12:56', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('202', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902100003png\\FILES_201902100003png (????????????????)', '2019-02-10 20:16:34', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('203', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902100004png (????????????????)', '2019-02-10 20:19:21', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('204', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902100005.png\\FILES_201902100005.png (????????????????)', '2019-02-10 20:21:21', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('205', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902100006.png (????????????????)', '2019-02-10 20:23:27', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('206', '/files/upload.do', null, '2019-02-10 20:28:14', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('207', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902100007.png (????????????????)', '2019-02-10 20:52:00', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('208', '/files/upload.do', null, '2019-02-10 20:54:45', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('209', '/files/upload.do', null, '2019-02-10 20:54:57', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('210', '/files/upload.do', null, '2019-02-10 20:56:17', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('211', '/files/upload.do', 'Read timed out', '2019-02-11 20:28:59', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('212', '/files/upload.do', 'Could not parse multipart servlet request; nested exception is java.lang.IllegalStateException: ??????multi-part???????parts', '2019-02-11 20:46:21', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('213', '/files/upload.do', 'Could not parse multipart servlet request; nested exception is java.lang.IllegalStateException: ??????multi-part???????parts', '2019-02-11 20:46:42', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('214', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110005.png (????????????????)', '2019-02-11 20:56:51', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('215', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110004.png (????????????????)', '2019-02-11 20:56:51', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('216', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110006.png (????????????????)', '2019-02-11 20:59:27', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('217', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110007.png (????????????????)', '2019-02-11 21:11:42', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('218', '/files/upload.do', 'http:\\127.0.0.1:8079\\file\\201902\\FILES_201902110008.png (????????????????)', '2019-02-11 21:16:31', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('219', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110009.png (????????????????)', '2019-02-11 21:26:42', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('220', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110011.png (????????????????)', '2019-02-11 21:26:49', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('221', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110012.png (????????????????)', '2019-02-11 21:27:32', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('222', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110013.png (????????????????)', '2019-02-11 21:53:50', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('223', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110014.png (????????????????)', '2019-02-11 21:54:04', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('224', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110015.png (????????????????)', '2019-02-11 22:07:03', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('225', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110016.png (????????????????)', '2019-02-11 22:07:09', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('226', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110017.png (????????????????)', '2019-02-11 22:08:10', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('227', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110019.png (????????????????)', '2019-02-11 22:10:46', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('228', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110021.png (????????????????)', '2019-02-11 22:21:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('229', '/files/upload.do', 'http:\\127.0.0.1:8079\\files\\201902\\FILES_201902110022.png (????????????????)', '2019-02-11 22:26:12', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('230', '/files/upload.do', '\\temp\\FILES_201902110024.png (???????????)', '2019-02-11 22:47:10', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('231', '/files/upload.do', 'resources\\FILES_201902110025.png (???????????)', '2019-02-11 22:51:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('232', '/files/upload.do', 'D:\\Source\\intellij idea\\2019\\ProjectMS\\pms-web\\target\\pms-web-1.0\\resource\\tempFILES_201902110026.png (???????????)', '2019-02-11 22:56:00', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('233', '/files/upload.do', 'D:\\Source\\intellij idea\\2019\\ProjectMS\\pms-web\\target\\pms-web-1.0\\temp\\FILES_201902110027.png (???????????)', '2019-02-11 22:59:01', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('234', '/account/checkLogin.do', 'Cannot create a session after the response has been committed', '2019-02-12 17:38:40', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('235', '/story/insertStory.do', '### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1\r\n### The error may involve com.jschrj.dao.story.IStoryDao.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into pms_story      ( project,                       source,                       modular,                       pri,                       title,                              deadline,                              openedby,              openeddate,                content,                       target )       values ( ?,                       ?,                       ?,                       ?,                       ?,                              ?,                              ?,              SYSDATE(),                ?,                       ? )\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1\n; SQL []; Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1', '2019-02-16 12:02:09', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('236', '/story/insertStory.do', '### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1\r\n### The error may involve com.jschrj.dao.story.IStoryDao.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into pms_story      ( project,                       source,                       modular,                       pri,                       title,                              deadline,                              openedby,              openeddate,                content,                       target )       values ( ?,                       ?,                       ?,                       ?,                       ?,                              ?,                              ?,              SYSDATE(),                ?,                       ? )\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1\n; SQL []; Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1', '2019-02-16 12:08:50', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('237', '/story/insertStory.do', '### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1\r\n### The error may involve com.jschrj.dao.story.IStoryDao.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into pms_story      ( project,                       source,                       modular,                       pri,                       title,                              deadline,                              openedby,              openeddate,                content,                       target )       values ( ?,                       ?,                       ?,                       ?,                       ?,                              ?,                              ?,              SYSDATE(),                ?,                       ? )\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1\n; SQL []; Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1', '2019-02-16 12:11:35', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('238', '/story/insertStory.do', '### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1\r\n### The error may involve com.jschrj.dao.story.IStoryDao.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into pms_story      ( project,                       source,                       modular,                       pri,                       title,                              deadline,                              openedby,              openeddate,                content,                       target )       values ( ?,                       ?,                       ?,                       ?,                       ?,                              ?,                              ?,              SYSDATE(),                ?,                       ? )\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1\n; SQL []; Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1', '2019-02-16 12:17:53', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('239', '/story/insertStory.do', '### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1\r\n### The error may involve com.jschrj.dao.story.IStoryDao.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into pms_story      ( project,                       source,                       modular,                       pri,                       title,                              deadline,                              openedby,              openeddate,                content,                       target )       values ( ?,                       ?,                       ?,                       ?,                       ?,                              ?,                              ?,              SYSDATE(),                ?,                       ? )\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1\n; SQL []; Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect date value: \'\' for column \'deadline\' at row 1', '2019-02-16 12:24:15', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('240', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryPage\r\n### The error occurred while handling results\r\n### SQL: select     id, project,projectname, source,sourcename, pri, title, `status`, content, deadline, fileid,     openedby, openeddate     from(select     a.id, a.project,b.`name` projectname, a.source,c.`name` sourcename, a.pri, a.title, a.`status`, a.content, a.deadline,     a.fileid,     d.realname openedby, a.openeddate     from pms_story a,base_project b,base_source c,sys_user d     where  a.status=1 and a.project=b.id     and a.source=c.id and a.openedby=d.id             and a.openeddate  >=  ?                                                ) m             ORDER BY openeddate desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\n; SQL []; Invalid value for getInt() - \'?????\'; nested exception is java.sql.SQLException: Invalid value for getInt() - \'?????\'', '2019-02-16 14:39:46', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('241', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryPage\r\n### The error occurred while handling results\r\n### SQL: select     id, project,projectname, source,sourcename, pri, title, `status`, content, deadline, fileid,     openedby, openeddate     from(select     a.id, a.project,b.`name` projectname, a.source,c.`name` sourcename, a.pri, a.title, a.`status`, a.content, a.deadline,     a.fileid,     d.realname openedby, a.openeddate     from pms_story a,base_project b,base_source c,sys_user d     where  a.status=1 and a.project=b.id     and a.source=c.id and a.openedby=d.id             and a.openeddate  >=  ?                                                ) m             ORDER BY openeddate desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\n; SQL []; Invalid value for getInt() - \'?????\'; nested exception is java.sql.SQLException: Invalid value for getInt() - \'?????\'', '2019-02-16 14:40:52', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('242', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryPage\r\n### The error occurred while handling results\r\n### SQL: select     id, project,projectname, source,sourcename, pri, title, `status`, content, deadline, fileid,     openedby, openeddate     from(select     a.id, a.project,b.`name` projectname, a.source,c.`name` sourcename, a.pri, a.title, a.`status`, a.content, a.deadline,     a.fileid,     d.realname openedby, a.openeddate     from pms_story a,base_project b,base_source c,sys_user d     where  a.status=1 and a.project=b.id     and a.source=c.id and a.openedby=d.id             and a.openeddate  >=  ?                                                ) m             ORDER BY openeddate desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\n; SQL []; Invalid value for getInt() - \'?????\'; nested exception is java.sql.SQLException: Invalid value for getInt() - \'?????\'', '2019-02-16 14:40:53', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('243', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryPage\r\n### The error occurred while handling results\r\n### SQL: select     id, project,projectname, source,sourcename, pri, title, `status`, content, deadline, fileid,     openedby, openeddate     from(select     a.id, a.project,b.`name` projectname, a.source,c.`name` sourcename, a.pri, a.title, a.`status`, a.content, a.deadline,     a.fileid,     d.realname openedby, a.openeddate     from pms_story a,base_project b,base_source c,sys_user d     where  a.status=1 and a.project=b.id     and a.source=c.id and a.openedby=d.id             and a.openeddate  >=  ?                                                ) m             ORDER BY openeddate desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\n; SQL []; Invalid value for getInt() - \'?????\'; nested exception is java.sql.SQLException: Invalid value for getInt() - \'?????\'', '2019-02-16 14:48:17', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('244', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryPage\r\n### The error occurred while handling results\r\n### SQL: select     id, project,projectname, source,sourcename, pri, title, `status`, content, deadline, fileid,     openedby, openeddate     from(select     a.id, a.project,b.`name` projectname, a.source,c.`name` sourcename, a.pri, a.title, a.`status`, a.content, a.deadline,     a.fileid,     d.realname openedby, a.openeddate     from pms_story a,base_project b,base_source c,sys_user d     where  a.status=1 and a.project=b.id     and a.source=c.id and a.openedby=d.id             and a.openeddate  >=  ?                                                ) m             ORDER BY openeddate desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\n; SQL []; Invalid value for getInt() - \'?????\'; nested exception is java.sql.SQLException: Invalid value for getInt() - \'?????\'', '2019-02-16 14:51:16', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('245', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryPage\r\n### The error occurred while handling results\r\n### SQL: select     id, project,projectname, source,sourcename, pri, title, `status`, content, deadline, fileid,     openedby, openeddate     from(select     a.id, a.project,b.`name` projectname, a.source,c.`name` sourcename, a.pri, a.title, a.`status`, a.content, a.deadline,     a.fileid,     d.realname openedby, a.openeddate     from pms_story a,base_project b,base_source c,sys_user d     where  a.status=1 and a.project=b.id     and a.source=c.id and a.openedby=d.id             and a.openeddate  >=  ?                                                ) m             ORDER BY openeddate desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\n; SQL []; Invalid value for getInt() - \'?????\'; nested exception is java.sql.SQLException: Invalid value for getInt() - \'?????\'', '2019-02-16 15:02:45', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('246', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryPage\r\n### The error occurred while handling results\r\n### SQL: select     id, project,projectname, source,sourcename, pri, title, `status`, content, deadline, fileid,     openedby, openeddate     from(select     a.id, a.project,b.`name` projectname, a.source,c.`name` sourcename, a.pri, a.title, a.`status`, a.content, a.deadline,     a.fileid,     d.realname openedby, a.openeddate     from pms_story a,base_project b,base_source c,sys_user d     where  a.status=1 and a.project=b.id     and a.source=c.id and a.openedby=d.id             and a.openeddate  >=  ?                                                ) m             ORDER BY openeddate desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\n; SQL []; Invalid value for getInt() - \'?????\'; nested exception is java.sql.SQLException: Invalid value for getInt() - \'?????\'', '2019-02-16 15:02:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('247', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryPage\r\n### The error occurred while handling results\r\n### SQL: select     id, project,projectname, source,sourcename, pri, title, `status`, content, deadline, fileid,     openedby, openeddate     from(select     a.id, a.project,b.`name` projectname, a.source,c.`name` sourcename, a.pri, a.title, a.`status`, a.content, a.deadline,     a.fileid,     d.realname openedby, a.openeddate     from pms_story a,base_project b,base_source c,sys_user d     where  a.status=1 and a.project=b.id     and a.source=c.id and a.openedby=d.id             and a.openeddate  >=  ?                                                ) m             ORDER BY openeddate desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\n; SQL []; Invalid value for getInt() - \'?????\'; nested exception is java.sql.SQLException: Invalid value for getInt() - \'?????\'', '2019-02-16 15:05:21', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('248', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryPage\r\n### The error occurred while handling results\r\n### SQL: select     id, project,projectname, source,sourcename, pri, title, `status`, content, deadline, fileid,     openedby, openeddate     from(select     a.id, a.project,b.`name` projectname, a.source,c.`name` sourcename, a.pri, a.title, a.`status`, a.content, a.deadline,     a.fileid,     d.realname openedby, a.openeddate     from pms_story a,base_project b,base_source c,sys_user d     where  a.status=1 and a.project=b.id     and a.source=c.id and a.openedby=d.id             and a.openeddate  >=  ?                                                ) m             ORDER BY openeddate desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\n; SQL []; Invalid value for getInt() - \'?????\'; nested exception is java.sql.SQLException: Invalid value for getInt() - \'?????\'', '2019-02-16 15:05:26', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('249', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryPage\r\n### The error occurred while handling results\r\n### SQL: select     id, project,projectname, source,sourcename, pri, title, `status`, content, deadline, fileid,     openedby, openeddate     from(select     a.id, a.project,b.`name` projectname, a.source,c.`name` sourcename, a.pri, a.title, a.`status`, a.content, a.deadline,     a.fileid,     d.realname openedby, a.openeddate     from pms_story a,base_project b,base_source c,sys_user d     where  a.status=1 and a.project=b.id     and a.source=c.id and a.openedby=d.id             and a.openeddate  >=  ?                                                ) m             ORDER BY openeddate desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\n; SQL []; Invalid value for getInt() - \'?????\'; nested exception is java.sql.SQLException: Invalid value for getInt() - \'?????\'', '2019-02-16 15:05:35', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('250', '/story/getStoryPage.do', '### Error querying database.  Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.getStoryPage\r\n### The error occurred while handling results\r\n### SQL: select     id, project,projectname, source,sourcename, pri, title, `status`, content, deadline,     openedby, openeddate     from(select     a.id, a.project,b.`name` projectname, a.source,c.`name` sourcename, a.pri, a.title, a.`status`, a.content, a.deadline,     d.realname openedby, a.openeddate     from pms_story a,base_project b,base_source c,sys_user d     where  a.status=1 and a.project=b.id     and a.source=c.id and a.openedby=d.id             and a.openeddate  >=  ?                                                ) m             ORDER BY openeddate desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Invalid value for getInt() - \'?????\'\n; SQL []; Invalid value for getInt() - \'?????\'; nested exception is java.sql.SQLException: Invalid value for getInt() - \'?????\'', '2019-02-16 15:09:28', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('251', '/story/storyForm.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.selectByPrimaryKey-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select       id, project,projectname, source,sourcename, pri, title, `status`, content, target, deadline,       openedbyname, openeddate     from(select            a.id, a.project,b.`name` projectname, a.source,c.`name` sourcename, a.pri, a.title, a.`status`, a.content, a.target, a.deadline,            d.realname openedbyname, a.openeddate          from pms_story a,base_project b,base_source c,sys_user d          where  a.project=b.id            and a.source=c.id and a.openedby=d.id            and id = ?) m\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\n; SQL []; Column \'id\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous', '2019-02-16 16:22:48', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('252', '/story/getStoryPage.do', null, '2019-02-16 17:57:22', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('253', '/story/getStoryPage.do', null, '2019-02-16 17:58:56', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('254', '/story/sortingForm.do', null, '2019-02-19 13:48:49', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('255', '/task/getSortedPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'d.realname\' in \'field list\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/task/TaskMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.task.ITaskDao.getSortedPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select     id, storyid, `status`, estimate, title, assigntoname, createtime,deadline     from(select     a.id, a.storyid, a.status, a.estimate, a.title,d.realname assigntoname, a.createtime, a.deadline     from pms_task a,pms_story b,base_project c,base_source d,sys_user e     where a.status <> 0 and a.storyid=b.id     and b.status <> 0 and b.project=c.id     and b.source=d.id and a.assignto=e.id                        ) m             ORDER BY createtime desc                 LIMIT ? OFFSET ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'d.realname\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'d.realname\' in \'field list\'', '2019-02-20 22:18:38', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('256', '/task/taskForm.do', null, '2019-02-20 22:58:32', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('257', '/task/taskForm.do', null, '2019-02-20 22:58:48', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('258', '/task/taskForm.do', null, '2019-02-20 22:59:34', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('259', '/task/taskForm.do', null, '2019-02-20 23:01:50', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('260', '/account/checkLogin.do', '密码不正确！', '2019-02-21 22:20:18', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('261', '/account/checkLogin.do', '密码不正确！', '2019-02-21 22:20:21', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('262', '/files/upload.do', null, '2019-02-22 21:36:00', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('263', '/files/upload.do', null, '2019-02-22 21:37:16', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('264', '/files/upload.do', null, '2019-02-22 22:01:38', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('265', '/files/upload.do', null, '2019-02-23 09:43:44', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('266', '/files/upload.do', null, '2019-02-23 09:44:58', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('267', '/task/insertTaskcomplete.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.storyid\' in \'where clause\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.selectIsTaskComplete-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select       count(a.id) result     from pms_story a     where a.id = ?       and exists(select * from pms_task b where a.id=b.storyid)       and not exists(select * from pms_task c where a.id=b.storyid and (c.status=1 or c.status=0))\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.storyid\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.storyid\' in \'where clause\'', '2019-02-23 15:09:22', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('268', '/task/insertTaskcomplete.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.storyid\' in \'where clause\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/story/StoryMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.story.IStoryDao.selectIsTaskComplete-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select       count(a.id) result     from pms_story a     where a.id = ?       and exists(select * from pms_task b where a.id=b.storyid)       and not exists(select * from pms_task c where a.id=b.storyid and (c.status=1 or c.status=0))\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.storyid\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.storyid\' in \'where clause\'', '2019-02-23 15:12:39', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('269', '/task/insertTaskcomplete.do', 'Invalid bound statement (not found): com.jschrj.dao.task.ITaskcompleteDao.insertSelective', '2019-02-23 15:19:31', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('270', '/task/insertTaskcomplete.do', 'Invalid bound statement (not found): com.jschrj.dao.task.ITaskcompleteDao.insertSelective', '2019-02-23 15:22:09', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('271', '/task/insertTaskcomplete.do', 'Invalid bound statement (not found): com.jschrj.dao.task.ITaskcompleteDao.insertSelective', '2019-02-23 15:27:49', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('272', '/task/insertTaskcomplete.do', '### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'sql,\n      \n      \n        userid,\n      \n      \n        username,\n      \n      \' at line 14\r\n### The error may involve com.jschrj.dao.task.ITaskcompleteDao.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into pms_taskcomplete      ( taskid,                       estimate,                       codeurl,                       sqlname,                       sql,                       userid,                       username,              createtime )       values ( ?,                       ?,                       ?,                       ?,                       ?,                       ?,                       ?,              SYSDATE() )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'sql,\n      \n      \n        userid,\n      \n      \n        username,\n      \n      \' at line 14\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'sql,\n      \n      \n        userid,\n      \n      \n        username,\n      \n      \' at line 14', '2019-02-23 15:43:55', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('273', '/story/insertStory.do', '### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'/201902/FILES_201902230072.docx\' for column \'fileurl\' at row 1\r\n### The error may involve com.jschrj.dao.story.IStoryDao.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into pms_story      ( project,                       source,                       modular,                       pri,                       title,                              deadline,                       filename,                       fileurl,                       openedby,              openeddate,                content,                       target )       values ( ?,                       ?,                       ?,                       ?,                       ?,                              ?,                       ?,                       ?,                       ?,              SYSDATE(),                ?,                       ? )\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'/201902/FILES_201902230072.docx\' for column \'fileurl\' at row 1\n; uncategorized SQLException for SQL []; SQL state [HY000]; error code [1366]; Incorrect integer value: \'/201902/FILES_201902230072.docx\' for column \'fileurl\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'/201902/FILES_201902230072.docx\' for column \'fileurl\' at row 1', '2019-02-23 16:40:11', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('274', '/task/getCompletedPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'de.id\' in \'where clause\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/task/TaskcompleteMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.task.ITaskcompleteDao.getCompletedCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(a.id)     from pms_taskcomplete a,pms_story b,pms_task c,base_project d,base_source e     where b.status <> 0     and a.taskid=c.id and c.storyid=b.id     and c.status=2 and b.project=d.id     and b.source=de.id and userid=?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'de.id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'de.id\' in \'where clause\'', '2019-02-24 12:18:08', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('275', '/task/getCompletedPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'de.id\' in \'where clause\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/task/TaskcompleteMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.task.ITaskcompleteDao.getCompletedCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(a.id)     from pms_taskcomplete a,pms_story b,pms_task c,base_project d,base_source e     where b.status <> 0     and a.taskid=c.id and c.storyid=b.id     and c.status=2 and b.project=d.id     and b.source=de.id and userid=?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'de.id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'de.id\' in \'where clause\'', '2019-02-24 12:19:23', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('276', '/task/getCompletedPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'userid\' in where clause is ambiguous\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/task/TaskcompleteMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.task.ITaskcompleteDao.getCompletedCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(a.id)     from pms_taskcomplete a,pms_story b,pms_task c,base_project d,base_source e     where b.status <> 0     and a.taskid=c.id and c.storyid=b.id     and c.status=2 and b.project=d.id     and b.source=e.id and userid=?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'userid\' in where clause is ambiguous\n; SQL []; Column \'userid\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'userid\' in where clause is ambiguous', '2019-02-24 12:20:18', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('277', '/task/getCompletedPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'userid\' in where clause is ambiguous\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/task/TaskcompleteMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.task.ITaskcompleteDao.getCompletedPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select     id, taskid, title, projectname, sourcename, createtime,deadline     from(select     a.id, a.taskid, c.title, d.name projectname, e.name sourcename, a.createtime, c.deadline     from pms_taskcomplete a,pms_story b,pms_task c,base_project d,base_source e     where b.status <> 0     and a.taskid=c.id and c.storyid=b.id     and c.status=2 and b.project=d.id     and b.source=e.id and userid=?                        ) m             ORDER BY createtime desc                 LIMIT ? OFFSET ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'userid\' in where clause is ambiguous\n; SQL []; Column \'userid\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'userid\' in where clause is ambiguous', '2019-02-24 12:21:58', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('278', '/task/taskForm.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'sql, userid, username, createtime, updatetime\n   \n    ,\n     \n      testremark, \' at line 3\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/task/TaskcompleteMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.task.ITaskcompleteDao.selectByTaskid-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select           id, taskid, estimate, codeurl, sqlname, sql, userid, username, createtime, updatetime         ,             testremark, releaseremark, overdueremark         from pms_taskcomplete     where taskid = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'sql, userid, username, createtime, updatetime\n   \n    ,\n     \n      testremark, \' at line 3\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'sql, userid, username, createtime, updatetime\n   \n    ,\n     \n      testremark, \' at line 3', '2019-02-24 16:18:37', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('279', '/task/insertTaskcomplete.do', null, '2019-02-24 18:15:15', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('280', '/task/insertTaskcomplete.do', null, '2019-02-24 18:21:02', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('281', '/task/updateTaskcomplete.do', '### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'sql\' at row 1\r\n### The error may involve com.jschrj.dao.task.ITaskcompleteDao.updateByPrimaryKeySelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update pms_taskcomplete      SET estimate = ?,                       codeurl = ?,                         sqlname = ?,                       `sql` = ?,                                   updatetime = SYSDATE(),                testremark = ?,                       releaseremark = ?,                       overdueremark = ?      where id = ?\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'sql\' at row 1\n; SQL []; Data truncation: Data too long for column \'sql\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'sql\' at row 1', '2019-02-24 18:33:25', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('282', '/task/getCompletedPage.do', null, '2019-02-24 18:41:21', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('283', '/task/getCompletedPage.do', null, '2019-02-24 18:41:28', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('284', '/account/checkLogin.do', 'Cannot create a session after the response has been committed', '2019-02-27 21:38:19', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('285', '/test/insertUsecase.do', 'syntax error, pos 30, line 1, column 31[{\"xh\":1,\"step\":111,\"expect\":wwhidhi}{\"xh\":2,\"step\":222,\"expect\":玩家hi}{\"xh\":3,\"step\":333,\"expect\":了空间哦}]', '2019-02-27 21:40:15', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('286', '/test/insertUsecase.do', 'Invalid property \'stage[]\' of bean class [com.jschrj.pojo.test.Usecase]: Property referenced in indexed property path \'stage[]\' is neither an array nor a List nor a Map; returned value was []', '2019-03-01 00:36:35', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('287', '/test/insertUsecase.do', 'Invalid property \'stage[]\' of bean class [com.jschrj.pojo.test.Usecase]: Property referenced in indexed property path \'stage[]\' is neither an array nor a List nor a Map; returned value was []', '2019-03-01 00:38:36', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('288', '/test/updateUsecase.do', 'Invalid property \'stage[]\' of bean class [com.jschrj.pojo.test.Usecase]: Property referenced in indexed property path \'stage[]\' is neither an array nor a List nor a Map; returned value was []', '2019-03-01 00:40:14', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('289', '/test/updateUsecase.do', 'Invalid property \'stage[]\' of bean class [com.jschrj.pojo.test.Usecase]: Property referenced in indexed property path \'stage[]\' is neither an array nor a List nor a Map; returned value was []', '2019-03-01 00:40:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('290', '/test/updateUsecase.do', 'Invalid property \'stage[]\' of bean class [com.jschrj.pojo.test.Usecase]: Property referenced in indexed property path \'stage[]\' is neither an array nor a List nor a Map; returned value was []', '2019-03-01 00:41:07', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('291', '/test/updateUsecase.do', 'Invalid property \'stage[]\' of bean class [com.jschrj.pojo.test.Usecase]: Property referenced in indexed property path \'stage[]\' is neither an array nor a List nor a Map; returned value was []', '2019-03-01 00:41:46', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('292', '/test/updateUsecase.do', 'Invalid property \'stage[]\' of bean class [com.jschrj.pojo.test.Usecase]: Property referenced in indexed property path \'stage[]\' is neither an array nor a List nor a Map; returned value was []', '2019-03-01 00:44:04', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('293', '/bug/getBugPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.staskid\' in \'field list\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/bug/BugMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.bug.IBugDao.getBugPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select     id, storyid, staskid, `status`, severity, title, projectname,     assigntoname, dutyname, finishedbyname, username, createtime, finishedtime     from(select     a.id, a.storyid, a.staskid, a.status, a.severity, a.title,c.name projectname,     d.realname assigntoname, e.realname dutyname, f.realname finishedbyname,     a.username, a.createtime, a.finishedtime     from pms_bug a,pms_story b,base_project c,sys_user d,sys_user e,sys_user f     where a.status <> 0 and a.storyid=b.id     and b.status <> 0 and b.project=c.id     and a.assignto=d.id and a.duty=e.id and a.finishedby=f.id                                                                               ) m             ORDER BY createtime desc                 LIMIT ? OFFSET ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.staskid\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.staskid\' in \'field list\'', '2019-03-02 14:44:15', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('294', '/bug/getBugPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.staskid\' in \'field list\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/bug/BugMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.bug.IBugDao.getBugPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select     id, storyid, staskid, `status`, severity, title, projectname,     assigntoname, dutyname, finishedbyname, username, createtime, finishedtime     from(select     a.id, a.storyid, a.staskid, a.status, a.severity, a.title,c.name projectname,     d.realname assigntoname, e.realname dutyname, f.realname finishedbyname,     a.username, a.createtime, a.finishedtime     from pms_bug a,pms_story b,base_project c,sys_user d,sys_user e,sys_user f     where a.status <> 0 and a.storyid=b.id     and b.status <> 0 and b.project=c.id     and a.assignto=d.id and a.duty=e.id and a.finishedby=f.id                                                                               ) m             ORDER BY createtime desc                 LIMIT ? OFFSET ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.staskid\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.staskid\' in \'field list\'', '2019-03-02 14:44:51', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('295', '/bug/getBugPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'userid\'.  Return value (1,admin) was not iterable.', '2019-03-02 16:21:57', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('296', '/bug/getBugPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'userid\'.  Return value (1,admin) was not iterable.', '2019-03-02 16:22:05', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('297', '/bug/getBugPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'userid\'.  Return value (1,admin) was not iterable.', '2019-03-02 16:22:06', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('298', '/bug/getBugPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'userid\'.  Return value (1,admin) was not iterable.', '2019-03-02 16:22:07', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('299', '/bug/getBugPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.project\' in \'where clause\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/bug/BugMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.bug.IBugDao.getBugPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select     id, storyid, taskid, `status`, severity, title, projectname,     assigntoname, dutyname, finishedbyname, username, createtime, finishedtime     from(select     a.id, a.storyid, a.taskid, a.status, a.severity, a.title,c.name projectname,     d.realname assigntoname, e.realname dutyname, f.realname finishedbyname,     a.username, a.createtime, a.finishedtime     FROM pms_bug a     join pms_story b on(a.storyid = b.id AND b.status  <>  0)     join base_project c on(b.project = c.id)     left join sys_user d on(a.assignto = d.id)     left join sys_user e on(a.duty = e.id)     left join sys_user f on(a.finishedby = f.id)     WHERE a.status  <>  0                                           and a.title like CONCAT(\'%\',?,\'%\')                         and a.project=?                                     ) m             ORDER BY createtime desc                 LIMIT ? OFFSET ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.project\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.project\' in \'where clause\'', '2019-03-02 16:31:10', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('300', '/bug/getBugPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.project\' in \'where clause\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/bug/BugMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.bug.IBugDao.getBugPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select     id, storyid, taskid, `status`, severity, title, projectname,     assigntoname, dutyname, finishedbyname, username, createtime, finishedtime     from(select     a.id, a.storyid, a.taskid, a.status, a.severity, a.title,c.name projectname,     d.realname assigntoname, e.realname dutyname, f.realname finishedbyname,     a.username, a.createtime, a.finishedtime     FROM pms_bug a     join pms_story b on(a.storyid = b.id AND b.status  <>  0)     join base_project c on(b.project = c.id)     left join sys_user d on(a.assignto = d.id)     left join sys_user e on(a.duty = e.id)     left join sys_user f on(a.finishedby = f.id)     WHERE a.status  <>  0                                           and a.title like CONCAT(\'%\',?,\'%\')                   and a.status=?                   and a.project=?                                     ) m             ORDER BY createtime desc                 LIMIT ? OFFSET ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.project\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.project\' in \'where clause\'', '2019-03-02 16:31:12', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('301', '/bug/getBugPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'userid\'.  Return value (1,phg) was not iterable.', '2019-03-02 16:36:18', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('302', '/bug/getBugPage.do', 'nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'userid\'.  Return value (1,phg) was not iterable.', '2019-03-02 16:36:19', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('303', '/bug/bugForm.do', 'null', '2019-03-02 17:12:41', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('304', '/bug/bugForm.do', 'null', '2019-03-02 17:16:28', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('305', '/task/getTaskList.do', 'For input string: \"\"', '2019-03-02 17:19:34', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('306', '/task/getTaskList.do', 'For input string: \"\"', '2019-03-02 17:21:02', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('307', '/bug/getBugPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.project\' in \'on clause\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/bug/BugMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.bug.IBugDao.getBugCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(a.id)     FROM pms_bug a     join base_project c on(b.project = c.id)     left join sys_user d on(a.assignto = d.id)     left join sys_user e on(a.duty = e.id)     left join sys_user f on(a.finishedby = f.id)     left join sys_user g on(a.userid = g.id)     WHERE a.status  <>  0\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.project\' in \'on clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.project\' in \'on clause\'', '2019-03-02 19:05:40', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('308', '/bug/insertBug.do', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'project\' in \'class com.jschrj.pojo.bug.Bug\'', '2019-03-02 19:40:11', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('309', '/bug/bugForm.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/bug/BugMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.bug.IBugDao.selectByPrimaryKey-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select       a.id, a.storyid, a.taskid, a.type, a.status, a.severity, a.title,c.name projectname,       a.assignto, d.realname assigntoname, a.duty, e.realname dutyname, a.finishedby, f.realname finishedbyname,       a.username, a.createtime, a.finishedtime, a.content, CONVERT(a.content USING utf8) contenthtml     FROM pms_bug a            join base_project c on(a.project = c.id)            left join sys_user d on(a.assignto = d.id)            left join sys_user e on(a.duty = e.id)            left join sys_user f on(a.finishedby = f.id)            left join sys_user g on(a.userid = g.id)     where id = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous\n; SQL []; Column \'id\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'id\' in where clause is ambiguous', '2019-03-02 20:24:42', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('310', '/bug/getToapprovePage.do', '### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'\n    d.realname finishedbyname\n    \',expect RPAREN, actual DOT d : select\n    id, severity, title, projectname, finishedbyname, finishedtime\n    from(select\n    a.id, a.severity, a.title,c.name projectname, a.finishedtime\n    d.realname finishedbyname\n    FROM pms_bug a\n    join base_project c on(a.project = c.id)\n    left join sys_user d on(a.finishedby=d.id)\n    WHERE a.status = 2\n    and a.userid=?\n    ) m\n     \n      ORDER BY finishedtime desc\n     \n     \n    LIMIT ? OFFSET ?\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/bug/BugMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.bug.IBugDao.getToapprovePage\r\n### The error occurred while executing a query\r\n### SQL: select     id, severity, title, projectname, finishedbyname, finishedtime     from(select     a.id, a.severity, a.title,c.name projectname, a.finishedtime     d.realname finishedbyname     FROM pms_bug a     join base_project c on(a.project = c.id)     left join sys_user d on(a.finishedby=d.id)     WHERE a.status = 2     and a.userid=?     ) m             ORDER BY finishedtime desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'\n    d.realname finishedbyname\n    \',expect RPAREN, actual DOT d : select\n    id, severity, title, projectname, finishedbyname, finishedtime\n    from(select\n    a.id, a.severity, a.title,c.name projectname, a.finishedtime\n    d.realname finishedbyname\n    FROM pms_bug a\n    join base_project c on(a.project = c.id)\n    left join sys_user d on(a.finishedby=d.id)\n    WHERE a.status = 2\n    and a.userid=?\n    ) m\n     \n      ORDER BY finishedtime desc\n     \n     \n    LIMIT ? OFFSET ?\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, error in :\'\n    d.realname finishedbyname\n    \',expect RPAREN, actual DOT d : select\n    id, severity, title, projectname, finishedbyname, finishedtime\n    from(select\n    a.id, a.severity, a.title,c.name projectname, a.finishedtime\n    d.realname finishedbyname\n    FROM pms_bug a\n    join base_project c on(a.project = c.id)\n    left join sys_user d on(a.finishedby=d.id)\n    WHERE a.status = 2\n    and a.userid=?\n    ) m\n     \n      ORDER BY finishedtime desc\n     \n     \n    LIMIT ? OFFSET ?; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'\n    d.realname finishedbyname\n    \',expect RPAREN, actual DOT d : select\n    id, severity, title, projectname, finishedbyname, finishedtime\n    from(select\n    a.id, a.severity, a.title,c.name projectname, a.finishedtime\n    d.realname finishedbyname\n    FROM pms_bug a\n    join base_project c on(a.project = c.id)\n    left join sys_user d on(a.finishedby=d.id)\n    WHERE a.status = 2\n    and a.userid=?\n    ) m\n     \n      ORDER BY finishedtime desc\n     \n     \n    LIMIT ? OFFSET ?', '2019-03-03 15:35:41', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('311', '/release/getReleaselistByReferid.do', 'null', '2019-03-03 23:32:00', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('312', '/release/getReleaselistByReferid.do', 'null', '2019-03-03 23:34:09', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('313', '/release/getReleaselistByReferid.do', 'null', '2019-03-03 23:35:23', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('314', '/base/getProjectcustomerList.do', 'For input string: \"\"', '2019-03-04 00:00:50', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('315', '/base/getProjectcustomerList.do', 'For input string: \"\"', '2019-03-04 00:01:34', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('316', '/bug/updateBug.do', null, '2019-03-04 00:03:40', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('317', '/bug/updateBug.do', null, '2019-03-04 00:06:06', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('318', '/bug/updateBug.do', null, '2019-03-04 00:06:43', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('319', '/bug/applyBug.do', '### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'sql = \'/201903/FILES_201903060005.png\',\n      \n      \n      \n      \n        fini\' at line 18\r\n### The error may involve com.jschrj.dao.bug.IBugDao.updateByPrimaryKeySelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update pms_bug      SET status = ?,                                                   finishedby = ?,                       result = ?,                       sqlname = ?,                       sql = ?,                                     finishedtime = SYSDATE(),                              releaseremark = ?      where id = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'sql = \'/201903/FILES_201903060005.png\',\n      \n      \n      \n      \n        fini\' at line 18\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'sql = \'/201903/FILES_201903060005.png\',\n      \n      \n      \n      \n        fini\' at line 18', '2019-03-06 20:43:05', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('320', '/account/checkLogin.do', '密码不正确！', '2019-03-06 20:51:42', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('321', '/account/checkLogin.do', '密码不正确！', '2019-03-06 20:51:44', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('322', '/account/checkLogin.do', '密码不正确！', '2019-03-06 20:51:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('323', '/account/checkLogin.do', '密码不正确！', '2019-03-06 20:51:50', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('324', '/account/checkLogin.do', '密码不正确！', '2019-03-06 20:51:53', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('325', '/release/releaseForm.do', null, '2019-03-07 00:08:01', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('326', '/release/releaseForm.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.customer\' in \'where clause\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/release/ReleaseMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.release.IReleaseDao.getReleaselistByProjectCustomer-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select storyid, id, title, releaseremarkhtml, sqlname, `sql`,createtime     from       (select 1 storyid, c.id, c.title, CONVERT(e.releaseremark USING utf8) releaseremarkhtml, e.sqlname, e.`sql`, e.createtime        from pms_release a, pms_story c, pms_task d, pms_taskcomplete e        where a.status=1 and a.type=1 and a.referid=c.id          and a.customer=? and c.status=4          and c.project=? and a.id=d.storyid and d.status=2          and d.id=e.taskid        union all        select 2 storyid, c.id, c.title, CONVERT(c.releaseremark USING utf8) releaseremarkhtml, c.sqlname, c.`sql`, c.finishedtime createtime        from pms_release a, pms_bug c        where a.status=1 and a.type=2 and a.referid=c.id          and a.customer=? and c.status=3          and c.project=? ) m     order by m.createtime\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.customer\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.customer\' in \'where clause\'', '2019-03-07 00:18:25', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('327', '/release/doRelease.do', '### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'slelect count(id)\n    from pms\',expect IDENTIFIER, actual IDENTIFIER slelect : slelect count(id)\n    from pms_release\n    where id <> ?\n      and `type`=?\n      and referid=?\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/release/ReleaseMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.release.IReleaseDao.selectOtherRelease\r\n### The error occurred while executing a query\r\n### SQL: slelect count(id)     from pms_release     where id <> ?       and `type`=?       and referid=?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'slelect count(id)\n    from pms\',expect IDENTIFIER, actual IDENTIFIER slelect : slelect count(id)\n    from pms_release\n    where id <> ?\n      and `type`=?\n      and referid=?\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, error in :\'slelect count(id)\n    from pms\',expect IDENTIFIER, actual IDENTIFIER slelect : slelect count(id)\n    from pms_release\n    where id <> ?\n      and `type`=?\n      and referid=?; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'slelect count(id)\n    from pms\',expect IDENTIFIER, actual IDENTIFIER slelect : slelect count(id)\n    from pms_release\n    where id <> ?\n      and `type`=?\n      and referid=?', '2019-03-07 19:55:35', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('328', '/release/getReleasedPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.listid\' in \'field list\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/release/ReleaseMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.release.IReleaseDao.getReleasedCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(a.id)     from (select     a.id, a.type, a.referid, b.title, c.name projectname,d.name customername,     a.version, a.username, a.updatetime,b.listid pl,d.listid cl     from pms_release a,pms_story b,base_project c,base_projectcustomer d     where a.status=2 and a.referid=b.id     and b.status <> 0 and b.project=c.id     and a.customerid=d.id                             union all     select     a.id, a.type, a.referid, b.title, c.name projectname,d.name customername,     a.version, a.username, a.updatetime,b.listid pl,d.listid cl     from pms_release a,pms_bug b,base_project c,base_projectcustomer d     where a.status=2 and a.referid=b.id     and b.status <> 0 and b.project=c.id     and a.customerid=d.id                        ) m\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.listid\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.listid\' in \'field list\'', '2019-03-07 21:34:53', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('329', '/release/getReleasedPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.id\' in \'field list\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/release/ReleaseMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.release.IReleaseDao.getReleasedCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(a.id)     from (select     a.id, a.type, a.referid, b.title, c.name projectname,d.name customername,     a.version, a.username, a.updatetime,c.listid pl,d.listid cl     from pms_release a,pms_story b,base_project c,base_projectcustomer d     where a.status=2 and a.referid=b.id     and b.status <> 0 and b.project=c.id     and a.customerid=d.id                             union all     select     a.id, a.type, a.referid, b.title, c.name projectname,d.name customername,     a.version, a.username, a.updatetime,c.listid pl,d.listid cl     from pms_release a,pms_bug b,base_project c,base_projectcustomer d     where a.status=2 and a.referid=b.id     and b.status <> 0 and b.project=c.id     and a.customerid=d.id                        ) m\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.id\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.id\' in \'field list\'', '2019-03-07 21:38:11', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('330', '/release/getReleasedPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.id\' in \'where clause\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/release/ReleaseMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.release.IReleaseDao.getReleasedCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(m.id)     from (select     distinct a.id, c.name projectname,d.name customername,     a.version, a.username, a.updatetime,c.listid pl,d.listid cl     from pms_release a,base_project c,base_projectcustomer d     where a.status=2 and a.referid=b.id     and b.status <> 0 and b.project=c.id     and a.customerid=d.id                        ) m\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.id\' in \'where clause\'', '2019-03-07 21:49:34', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('331', '/release/getReleasedPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'type\' in \'field list\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/release/ReleaseMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.release.IReleaseDao.getReleasedPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select     distinct id, `type`, referid, title, projectname, customername,version,username,updatetime     from(select     a.id, c.name projectname,d.name customername,     a.version, a.username, a.updatetime,c.listid pl,d.listid cl     from pms_release a,pms_story b,base_project c,base_projectcustomer d     where a.status=2 and a.referid=b.id     and b.status <> 0 and b.project=c.id     and a.customerid=d.id                               union all     select     a.id, c.name projectname,d.name customername,     a.version, a.username, a.updatetime,c.listid pl,d.listid cl     from pms_release a,pms_bug b,base_project c,base_projectcustomer d     where a.status=2 and a.referid=b.id     and b.status <> 0 and b.project=c.id     and a.customerid=d.id                        ) m             ORDER BY pl,cl,updatetime desc                 LIMIT ? OFFSET ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'type\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'type\' in \'field list\'', '2019-03-07 21:58:52', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('332', '/release/getReleasedPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'referid\' in \'field list\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/release/ReleaseMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.release.IReleaseDao.getReleasedPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select     distinct id, referid, title, projectname, customername,version,username,updatetime     from(select     a.id, c.name projectname,d.name customername,     a.version, a.username, a.updatetime,c.listid pl,d.listid cl     from pms_release a,pms_story b,base_project c,base_projectcustomer d     where a.status=2 and a.referid=b.id     and b.status <> 0 and b.project=c.id     and a.customerid=d.id                               union all     select     a.id, c.name projectname,d.name customername,     a.version, a.username, a.updatetime,c.listid pl,d.listid cl     from pms_release a,pms_bug b,base_project c,base_projectcustomer d     where a.status=2 and a.referid=b.id     and b.status <> 0 and b.project=c.id     and a.customerid=d.id                        ) m             ORDER BY pl,cl,updatetime desc                 LIMIT ? OFFSET ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'referid\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'referid\' in \'field list\'', '2019-03-07 22:00:04', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('333', '/release/getReleasedPage.do', '### Error querying database.  Cause: java.sql.SQLException: Expression #1 of ORDER BY clause is not in SELECT list, references column \'m.pl\' which is not in SELECT list; this is incompatible with DISTINCT\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/release/ReleaseMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.release.IReleaseDao.getReleasedPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select     distinct id,projectname,customername,version,username,updatetime     from(select     a.id, c.name projectname,d.name customername,     a.version, a.username, a.updatetime,c.listid pl,d.listid cl     from pms_release a,pms_story b,base_project c,base_projectcustomer d     where a.status=2 and a.referid=b.id     and b.status <> 0 and b.project=c.id     and a.customerid=d.id                               union all     select     a.id, c.name projectname,d.name customername,     a.version, a.username, a.updatetime,c.listid pl,d.listid cl     from pms_release a,pms_bug b,base_project c,base_projectcustomer d     where a.status=2 and a.referid=b.id     and b.status <> 0 and b.project=c.id     and a.customerid=d.id                        ) m             ORDER BY pl,cl,updatetime desc                 LIMIT ? OFFSET ?\r\n### Cause: java.sql.SQLException: Expression #1 of ORDER BY clause is not in SELECT list, references column \'m.pl\' which is not in SELECT list; this is incompatible with DISTINCT\n; uncategorized SQLException for SQL []; SQL state [HY000]; error code [3065]; Expression #1 of ORDER BY clause is not in SELECT list, references column \'m.pl\' which is not in SELECT list; this is incompatible with DISTINCT; nested exception is java.sql.SQLException: Expression #1 of ORDER BY clause is not in SELECT list, references column \'m.pl\' which is not in SELECT list; this is incompatible with DISTINCT', '2019-03-07 22:01:41', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('334', '/release/releasedList.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.project\' in \'where clause\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/release/ReleaseMapper.mysql.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select id, project, projectname, customerid, customername,            `type`, referid, title, createtime,updatetime     from       (select a.id, c.project, d.name projectname, a.customerid, b.name customername,               a.type, a.referid, c.title, c.openeddate createtime,a.createtime updatetime,b.listid cl,d.listid pl        from pms_release a, base_projectcustomer b ,pms_story c, base_project d        where a.status=2 and a.type=1 and a.referid=c.id          and b.status=1 and a.customerid=b.id and c.status=4          and c.project=d.id          and a.customerid=?          and b.project=?          and a.version=?        union all        select a.id, c.project, d.name projectname, a.customerid, b.name customername,               a.type, a.referid, c.title, c.createtime createtime,a.createtime updatetime,b.listid cl,d.listid pl        from pms_release a, base_projectcustomer b ,pms_bug c, base_project d        where a.status=2 and a.type=2 and a.referid=c.id          and b.status=1 and a.customerid=b.id and c.status=3          and c.project=d.id          and a.customerid=?          and b.project=?          and a.version=?) m     order by m.pl,m.cl,m.updatetime\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.project\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'b.project\' in \'where clause\'', '2019-03-07 22:29:38', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('335', '/release/getReleasedPage.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'m.id\' in \'field list\'\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/release/ReleaseMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.release.IReleaseDao.getReleasedCounts-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(m.id)     from (select distinct projectname,customername,version,username,updatetime     from (select     c.name projectname,d.name customername,     a.version, a.username, a.updatetime,c.listid pl,d.listid cl     from pms_release a,pms_story b,base_project c,base_projectcustomer d     where a.status=2 and a.referid=b.id     and b.status <> 0 and b.project=c.id     and a.customerid=d.id                             union all     select     c.name projectname,d.name customername,     a.version, a.username, a.updatetime,c.listid pl,d.listid cl     from pms_release a,pms_bug b,base_project c,base_projectcustomer d     where a.status=2 and a.referid=b.id     and b.status <> 0 and b.project=c.id     and a.customerid=d.id                        ) n) m\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'m.id\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'m.id\' in \'field list\'', '2019-03-07 22:47:47', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('336', '/task/getTasklistPage.do', '### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: ERROR. token : ON, pos : 225 : select count(a.id)\n    from pms_task a\n    join pms_story b on(a.storyid=b.id)\n    join base_project c on(b.project=c.id)\n    join base_source d on(b.source=d.id)\n    left join lms_taskcomplete e on(a.id=e.taskid)\n    join on sys_user f on(a.userid=f.id)\n    join on sys_user g on(a.assignto=g.id)\n    where a.status=1\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/task/TaskMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.task.ITaskDao.getTasklistCounts\r\n### The error occurred while executing a query\r\n### SQL: select count(a.id)     from pms_task a     join pms_story b on(a.storyid=b.id)     join base_project c on(b.project=c.id)     join base_source d on(b.source=d.id)     left join lms_taskcomplete e on(a.id=e.taskid)     join on sys_user f on(a.userid=f.id)     join on sys_user g on(a.assignto=g.id)     where a.status=1\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: ERROR. token : ON, pos : 225 : select count(a.id)\n    from pms_task a\n    join pms_story b on(a.storyid=b.id)\n    join base_project c on(b.project=c.id)\n    join base_source d on(b.source=d.id)\n    left join lms_taskcomplete e on(a.id=e.taskid)\n    join on sys_user f on(a.userid=f.id)\n    join on sys_user g on(a.assignto=g.id)\n    where a.status=1\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: ERROR. token : ON, pos : 225 : select count(a.id)\n    from pms_task a\n    join pms_story b on(a.storyid=b.id)\n    join base_project c on(b.project=c.id)\n    join base_source d on(b.source=d.id)\n    left join lms_taskcomplete e on(a.id=e.taskid)\n    join on sys_user f on(a.userid=f.id)\n    join on sys_user g on(a.assignto=g.id)\n    where a.status=1; nested exception is java.sql.SQLException: sql injection violation, syntax error: ERROR. token : ON, pos : 225 : select count(a.id)\n    from pms_task a\n    join pms_story b on(a.storyid=b.id)\n    join base_project c on(b.project=c.id)\n    join base_source d on(b.source=d.id)\n    left join lms_taskcomplete e on(a.id=e.taskid)\n    join on sys_user f on(a.userid=f.id)\n    join on sys_user g on(a.assignto=g.id)\n    where a.status=1', '2019-03-07 23:50:09', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('337', '/task/getTasklistPage.do', '### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: ERROR. token : ON, pos : 225 : select count(a.id)\n    from pms_task a\n    join pms_story b on(a.storyid=b.id)\n    join base_project c on(b.project=c.id)\n    join base_source d on(b.source=d.id)\n    left join lms_taskcomplete e on(a.id=e.taskid)\n    join on sys_user f on(a.userid=f.id)\n    join on sys_user g on(a.assignto=g.id)\n    where a.status=1\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/task/TaskMapper.mysql.xml]\r\n### The error may involve com.jschrj.dao.task.ITaskDao.getTasklistCounts\r\n### The error occurred while executing a query\r\n### SQL: select count(a.id)     from pms_task a     join pms_story b on(a.storyid=b.id)     join base_project c on(b.project=c.id)     join base_source d on(b.source=d.id)     left join lms_taskcomplete e on(a.id=e.taskid)     join on sys_user f on(a.userid=f.id)     join on sys_user g on(a.assignto=g.id)     where a.status=1\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: ERROR. token : ON, pos : 225 : select count(a.id)\n    from pms_task a\n    join pms_story b on(a.storyid=b.id)\n    join base_project c on(b.project=c.id)\n    join base_source d on(b.source=d.id)\n    left join lms_taskcomplete e on(a.id=e.taskid)\n    join on sys_user f on(a.userid=f.id)\n    join on sys_user g on(a.assignto=g.id)\n    where a.status=1\n; uncategorized SQLException for SQL []; SQL state [null]; error code [0]; sql injection violation, syntax error: ERROR. token : ON, pos : 225 : select count(a.id)\n    from pms_task a\n    join pms_story b on(a.storyid=b.id)\n    join base_project c on(b.project=c.id)\n    join base_source d on(b.source=d.id)\n    left join lms_taskcomplete e on(a.id=e.taskid)\n    join on sys_user f on(a.userid=f.id)\n    join on sys_user g on(a.assignto=g.id)\n    where a.status=1; nested exception is java.sql.SQLException: sql injection violation, syntax error: ERROR. token : ON, pos : 225 : select count(a.id)\n    from pms_task a\n    join pms_story b on(a.storyid=b.id)\n    join base_project c on(b.project=c.id)\n    join base_source d on(b.source=d.id)\n    left join lms_taskcomplete e on(a.id=e.taskid)\n    join on sys_user f on(a.userid=f.id)\n    join on sys_user g on(a.assignto=g.id)\n    where a.status=1', '2019-03-07 23:50:46', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('338', '/account/checkLogin.do', 'Cannot create a session after the response has been committed', '2019-03-08 08:59:24', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('339', '/story/storyForm.do', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'projectms.base_projectcustomer\' doesn\'t exist\r\n### The error may exist in URL [jar:file:/D:/Source/intellij%20idea/2019/ProjectMS/pms-web/target/pms-web-1.0/WEB-INF/lib/pms-service-1.0.jar!/com/jschrj/mapper/release/ReleaseMapper.mysql.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select       customerid,b.name customername     from pms_release a, base_projectcustomer b     where a.status <> 0 and a.referid=?       and b.status=1 and a.customerid=b.id     order by b.listid\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'projectms.base_projectcustomer\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'projectms.base_projectcustomer\' doesn\'t exist', '2019-03-09 10:18:29', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('340', '/account/checkLogin.do', '密码不正确！', '2019-03-09 10:43:50', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('341', '/account/checkLogin.do', '密码不正确！', '2019-03-09 10:43:52', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('342', '/account/checkLogin.do', '密码不正确！', '2019-03-09 10:43:57', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('343', '/account/checkLogin.do', '密码不正确！', '2019-03-09 10:43:57', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('344', '/account/checkLogin.do', '密码不正确！', '2019-03-09 10:43:57', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('345', '/account/checkLogin.do', '密码不正确！', '2019-03-09 10:43:58', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('346', '/account/checkLogin.do', '密码不正确！', '2019-03-09 10:43:58', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('347', '/account/checkLogin.do', '密码不正确！', '2019-03-09 10:47:51', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('348', '/account/checkLogin.do', '密码不正确！', '2019-03-09 11:00:52', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('349', '/account/checkLogin.do', '密码不正确！', '2019-03-09 14:18:07', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('350', '/account/checkLogin.do', 'Cannot create a session after the response has been committed', '2019-03-09 15:26:05', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('351', '/account/checkLogin.do', '密码不正确！', '2019-03-09 16:12:06', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('352', '/account/checkLogin.do', '密码不正确！', '2019-03-09 16:55:45', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('353', '/system/getUserPage.do', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'EMAIL\' of \'class com.jschrj.pojo.system.User\' with value \'2532652215@qq.com\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'EMAIL\' in \'class com.jschrj.pojo.system.User\'', '2019-03-09 17:11:30', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('354', '/system/getUserPage.do', 'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'EMAIL\' of \'class com.jschrj.pojo.system.User\' with value \'2532652215@qq.com\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'EMAIL\' in \'class com.jschrj.pojo.system.User\'', '2019-03-09 17:11:32', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('355', '/account/checkLogin.do', '密码不正确！', '2019-03-11 12:10:56', '0', '', '');
INSERT INTO `sys_errorlog` VALUES ('356', '/account/checkLogin.do', '密码不正确！', '2019-03-18 21:41:01', '0', '', '');

-- ----------------------------
-- Table structure for sys_optlog
-- ----------------------------
DROP TABLE IF EXISTS `sys_optlog`;
CREATE TABLE `sys_optlog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REFERID` varchar(50) DEFAULT NULL COMMENT '操作涉及业务id',
  `CONTENT` varchar(4000) DEFAULT NULL COMMENT '内容',
  `CREATETIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `USERID` int(11) DEFAULT NULL COMMENT '操作人员ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作人员名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1875 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_optlog
-- ----------------------------
INSERT INTO `sys_optlog` VALUES ('1', null, '新增组织：测试公司', '2018-02-15 11:26:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('2', null, '新增组织：测试公司1', '2018-02-15 11:33:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('3', null, '新增组织：测试公司3', '2018-02-15 11:34:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('4', null, '修改组织：物流公司A', '2018-02-15 16:32:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('5', null, '修改组织：物流公司A', '2018-02-15 16:32:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('6', null, '修改组织：测试公司2', '2018-02-15 16:34:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('7', null, '修改组织：测试公司7', '2018-02-15 16:37:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('8', null, '禁用组织：null', '2018-02-15 16:53:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('9', null, '禁用组织：5', '2018-02-15 16:55:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('10', null, '禁用组织：8', '2018-02-15 16:55:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('11', null, '修改组织：测试公司7', '2018-02-15 16:58:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('12', null, '禁用组织：8', '2018-02-15 16:58:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('13', null, '新增用户：测试', '2018-02-16 12:59:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('14', null, '修改用户：超级管理员', '2018-02-16 13:18:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('15', null, '修改用户：超级管理员', '2018-02-16 13:21:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('16', null, '修改用户：超级管理员', '2018-02-16 13:23:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('17', null, '禁用组织：2', '2018-02-16 13:25:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('18', null, '禁用用户：2', '2018-02-16 13:26:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('19', null, '修改用户：测试', '2018-02-16 13:26:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('20', null, '新增用户：测试', '2018-02-16 13:32:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('21', null, '新增用户：测试1', '2018-02-16 13:32:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('22', null, '新增用户：测试2', '2018-02-16 13:35:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('23', null, '新增组织：测试9', '2018-02-16 13:36:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('24', null, '新增组织：测试10', '2018-02-16 13:37:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('25', null, '新增菜单：用户管理', '2018-02-16 20:07:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('26', null, '修改菜单：组织管理1', '2018-02-16 20:36:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('27', null, '修改菜单：组织管理', '2018-02-16 20:37:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('28', null, '修改菜单：用户管理', '2018-02-16 20:38:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('29', null, '修改菜单：菜单管理', '2018-02-16 20:38:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('30', null, '禁用组织：4', '2018-02-16 20:38:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('31', null, '修改菜单：用户管理', '2018-02-16 20:38:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('32', null, '修改菜单：用户管理', '2018-02-16 20:39:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('33', null, '修改菜单：用户管理', '2018-02-16 20:39:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('34', null, '修改菜单：用户管理', '2018-02-16 20:44:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('35', null, '修改菜单：用户管理', '2018-02-16 20:46:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('36', null, '修改菜单：用户管理', '2018-02-16 20:57:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('37', null, '新增角色：超级管理员', '2018-02-17 09:54:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('38', null, '新增角色：财务', '2018-02-17 09:54:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('39', null, '修改角色：业务', '2018-02-17 10:01:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('40', null, '禁用角色：3', '2018-02-17 10:01:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('41', null, '修改角色：财务', '2018-02-17 10:01:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('42', null, '修改角色：财务', '2018-02-17 10:03:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('43', null, '新增客户：测试客户', '2018-02-19 22:19:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('44', null, '修改客户：测试客户1', '2018-02-19 22:55:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('45', null, '修改客户：测试客户', '2018-02-19 22:55:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('46', null, '禁用客户：2', '2018-02-19 22:59:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('47', null, '修改客户：测试客户', '2018-02-19 22:59:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('48', null, '新增产品：蜡油', '2018-02-20 15:23:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('49', null, '新增产品：蜡油', '2018-02-20 15:23:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('50', null, '修改产品：蜡油', '2018-02-20 15:28:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('51', null, '修改产品：蜡油', '2018-02-20 15:30:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('52', null, '禁用产品：3', '2018-02-20 15:32:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('53', null, '修改产品：蜡油', '2018-02-20 15:35:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('54', null, '新增客户：客户B', '2018-02-20 15:52:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('55', null, '修改客户：客户B', '2018-02-20 15:52:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('56', null, '禁用客户：3', '2018-02-20 15:53:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('57', null, '修改客户：客户B', '2018-02-20 15:53:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('58', null, '新增集装箱：ATUC1111111', '2018-02-22 20:20:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('59', null, '新增集装箱：AYGF2234574', '2018-02-22 20:21:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('60', null, '修改集装箱：AUTE1234567', '2018-02-22 20:45:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('61', null, '修改集装箱：AYGF2234574', '2018-02-22 20:46:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('62', null, '禁用集装箱：2', '2018-02-22 20:46:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('63', null, '修改集装箱：ATUC1111111', '2018-02-22 20:46:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('64', null, '修改集装箱：AUTE1234567', '2018-02-22 20:46:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('65', null, '修改集装箱：AUTE1234567', '2018-02-22 20:48:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('66', null, '修改集装箱：AUTE1234567', '2018-02-22 20:48:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('67', null, '修改集装箱：AUTE1234567', '2018-02-22 20:49:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('68', null, '新增集装箱：ALIKH127845', '2018-02-22 21:40:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('69', null, '修改集装箱：ATUC1111111', '2018-02-22 21:41:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('70', null, '禁用客户：3', '2018-02-22 22:27:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('71', null, '修改客户：客户B', '2018-02-22 22:27:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('72', null, '新增租赁箱价格：1', '2018-02-23 20:42:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('73', null, '修改租赁价格：1', '2018-02-23 21:04:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('74', null, '修改租赁价格：2', '2018-02-23 21:07:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('75', null, '修改租赁价格：1', '2018-02-23 21:08:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('76', null, '修改租赁价格：2', '2018-02-23 21:09:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('77', null, '修改租赁价格：1', '2018-02-23 21:10:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('78', null, '修改租赁价格：2', '2018-02-23 21:14:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('79', null, '修改租赁价格：1', '2018-02-23 21:24:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('80', null, '修改租赁价格：1', '2018-02-23 21:24:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('81', null, '修改租赁价格：1', '2018-02-23 21:25:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('82', null, '修改租赁价格：1', '2018-02-23 21:25:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('83', null, '禁用集装箱：2', '2018-02-23 21:25:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('84', null, '禁用租赁箱价格：2', '2018-02-23 21:27:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('85', null, '修改租赁价格：2', '2018-02-23 21:27:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('86', null, '新增订单：TF2018022600011', '2018-02-26 21:41:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('87', null, '取消订单：null', '2018-02-27 19:21:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('88', null, '取消订单：null', '2018-02-27 19:22:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('89', null, '取消订单：null', '2018-02-27 19:26:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('90', null, '取消订单：2', '2018-02-27 19:27:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('91', null, '取消订单：2', '2018-02-27 19:33:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('92', null, '取消订单：1', '2018-02-28 20:21:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('93', null, '新增订单：TF2018022800002', '2018-02-28 20:46:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('94', null, '新增派车：null', '2018-03-01 22:21:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('95', null, '新增派车：null', '2018-03-02 21:32:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('96', null, '新增派车：null', '2018-03-02 21:35:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('97', null, '新增铁发信息：null', '2018-03-04 00:11:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('98', null, '新增铁发信息：null', '2018-03-04 13:09:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('99', null, '新增送货信息：null', '2018-03-04 19:16:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('100', null, '新增回空信息：null', '2018-03-05 23:19:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('101', null, '新增寄存信息：null', '2018-03-06 22:38:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('102', null, '新增寄存信息：null', '2018-03-06 22:40:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('103', null, '修改产品：蜡油', '2018-03-08 15:06:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('104', null, '新增收款单：null', '2018-03-13 19:20:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('105', null, '修改收款单：null', '2018-03-13 20:03:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('106', null, '修改收款单：null', '2018-03-13 20:03:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('107', null, '作废收款单：1', '2018-03-13 20:32:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('108', null, '新增付款单：FK2018031400004', '2018-03-14 21:18:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('109', null, '修改付款单：null', '2018-03-14 21:25:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('110', null, '作废付款单：1', '2018-03-14 21:27:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('111', null, '审核付款单：null', '2018-03-14 23:16:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('112', null, '审核付款单：null', '2018-03-14 23:16:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('113', null, '审核付款单：null', '2018-03-14 23:16:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('114', null, '新增付款单：FK2018031600006', '2018-03-16 21:44:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('115', null, '修改付款单：null', '2018-03-16 21:45:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('116', null, '作废付款单：2', '2018-03-16 21:45:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('117', null, '审核付款单：null', '2018-03-16 21:49:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('118', null, '审核付款单：null', '2018-03-16 21:49:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('119', null, '禁用组织：2', '2018-03-16 23:15:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('120', null, '禁用组织：2', '2018-03-16 23:15:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('121', null, '修改菜单：菜单管理', '2018-03-16 23:16:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('122', null, '禁用组织：11', '2018-03-16 23:28:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('123', null, '修改组织：测试10', '2018-03-16 23:28:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('124', null, '禁用角色：3', '2018-03-16 23:31:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('125', null, '修改角色：财务', '2018-03-16 23:32:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('126', null, '新增现金日记账：null', '2018-03-18 23:54:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('127', null, '新增现金日记账：null', '2018-03-18 23:55:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('128', null, '新增现金日记账：null', '2018-03-18 23:57:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('129', null, '修改付款单：null', '2018-03-19 00:03:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('130', null, '修改付款单：null', '2018-03-19 00:03:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('131', null, '修改付款单：null', '2018-03-19 00:07:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('132', null, '修改现金日记账：null', '2018-03-19 00:08:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('133', null, '修改现金日记账：null', '2018-03-19 00:09:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('134', null, '修改现金日记账：null', '2018-03-19 00:10:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('135', null, '修改现金日记账：null', '2018-03-19 00:13:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('136', null, '新增现金日记账：null', '2018-03-19 01:25:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('137', null, '修改现金日记账：null', '2018-03-19 01:26:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('138', null, '新增银行日记账：DJ2018031900006', '2018-03-19 22:37:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('139', null, '修改银行日记账：null', '2018-03-19 22:38:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('140', null, '修改银行日记账：null', '2018-03-19 22:47:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('141', null, '修改银行日记账：null', '2018-03-19 22:53:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('142', null, '新增银行日记账：DJ2018031900007', '2018-03-19 22:53:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('143', null, '修改银行日记账：null', '2018-03-19 22:54:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('144', '6', '作废银行日记账：6', '2018-03-19 22:54:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('145', null, '新增期初现金银行：微信', '2018-03-21 00:18:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('146', null, '修改期初现金银行：微信1', '2018-03-21 00:26:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('147', null, '禁用期初现金银行：1', '2018-03-21 00:26:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('148', null, '修改期初现金银行：微信1', '2018-03-21 00:26:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('149', null, '新增期初应收应付：测试客户', '2018-03-21 22:00:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('150', null, '修改期初应收应付：null', '2018-03-21 22:03:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('151', null, '作废期初应收应付：2', '2018-03-21 22:03:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('152', null, '修改期初应收应付：null', '2018-03-21 22:03:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('153', null, '新增空箱调拨：null', '2018-03-23 22:05:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('154', null, '新增集装箱位置：AUTE1234567', '2018-03-25 15:49:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('155', null, '修改集装箱位置：null', '2018-03-25 16:01:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('156', null, '禁用角色：1', '2018-03-25 16:01:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('157', null, '作废集装箱位置：1', '2018-03-25 16:02:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('158', null, '新增寄存信息：null', '2018-03-28 20:24:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('159', null, '新增铁发信息：null', '2018-03-30 22:55:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('160', null, '新增送货信息：null', '2018-03-30 22:57:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('161', null, '新增回空信息：null', '2018-03-30 23:00:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('162', null, '新增铁发信息：null', '2018-03-31 00:26:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('163', null, '新增铁发信息：null', '2018-03-31 00:30:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('164', null, '禁用角色：1', '2018-04-01 10:10:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('165', null, '新增角色：集装箱管理', '2018-04-01 14:15:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('166', null, '修改角色：超级管理员', '2018-04-01 14:16:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('167', null, '修改角色：超级管理员', '2018-04-01 14:17:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('168', null, '修改角色：超级管理员', '2018-04-01 14:17:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('169', null, '修改角色：集装箱管理', '2018-04-01 14:21:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('170', null, '修改角色：集装箱管理', '2018-04-01 14:21:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('171', null, '修改角色：集装箱管理', '2018-04-01 14:22:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('172', null, '修改角色：集装箱管理', '2018-04-01 14:23:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('173', null, '修改角色：集装箱管理', '2018-04-01 14:27:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('174', null, '禁用角色：4', '2018-04-01 14:27:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('175', null, '修改角色：集装箱管理', '2018-04-01 14:27:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('176', null, '修改菜单：寄存管理', '2018-04-01 14:43:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('177', null, '修改菜单：寄存管理', '2018-04-01 14:43:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('178', null, '修改菜单：客户管理', '2018-04-01 14:45:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('179', null, '新增角色：11', '2018-04-01 14:47:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('180', null, '禁用角色：5', '2018-04-01 14:47:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('181', null, '修改组织：市场部', '2018-04-01 14:51:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('182', null, '新增组织：测试', '2018-04-01 14:51:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('183', null, '修改用户：121221', '2018-04-01 14:54:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('184', null, '新增用户：11111', '2018-04-01 14:54:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('185', null, '修改用户：11111', '2018-04-01 14:56:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('186', null, '新增用户：111', '2018-04-01 15:04:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('187', null, '修改用户：111', '2018-04-01 15:05:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('188', null, '新增集装箱：YHG67522', '2018-04-01 15:28:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('189', null, '修改集装箱：YHG67522', '2018-04-01 15:28:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('190', null, '修改集装箱：AUTE1234567', '2018-04-01 15:33:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('191', null, '修改租赁价格：2', '2018-04-01 15:42:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('192', null, '新增租赁箱价格：1', '2018-04-01 16:20:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('193', null, '修改租赁价格：1', '2018-04-01 16:28:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('194', null, '新增租赁箱价格：1', '2018-04-01 16:36:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('195', null, '修改租赁价格：2', '2018-04-01 16:37:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('196', null, '修改租赁价格：1', '2018-04-01 16:38:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('197', null, '修改租赁价格：4', '2018-04-01 16:38:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('198', null, '修改菜单：寄存管理', '2018-04-01 16:40:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('199', null, '新增客户：测试', '2018-04-01 16:47:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('200', null, '修改客户：测试', '2018-04-01 16:47:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('201', null, '新增产品：测试', '2018-04-01 16:50:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('202', null, '修改产品：测试11', '2018-04-01 16:50:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('203', null, '新增订单：FC2018040100007', '2018-04-01 17:02:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('204', null, '新增派车：null', '2018-04-01 17:04:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('205', null, '新增铁发信息：null', '2018-04-01 17:07:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('206', null, '新增送货信息：null', '2018-04-01 17:21:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('207', null, '新增回空信息：null', '2018-04-01 17:32:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('208', null, '新增空箱调拨：null', '2018-04-01 17:34:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('209', null, '新增寄存信息：null', '2018-04-01 17:36:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('210', null, '新增集装箱位置：YHG67522', '2018-04-01 17:39:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('211', null, '修改集装箱位置：null', '2018-04-01 17:39:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('212', null, '作废集装箱位置：2', '2018-04-01 17:39:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('213', null, '新增集装箱位置：YHG67522', '2018-04-01 17:40:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('214', null, '作废集装箱位置：3', '2018-04-01 17:40:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('215', null, '新增集装箱位置：YHG67522', '2018-04-01 17:41:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('216', null, '作废集装箱位置：4', '2018-04-01 17:41:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('217', null, '新增收款单：SK2018040100008', '2018-04-01 17:51:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('218', null, '修改收款单：null', '2018-04-01 17:51:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('219', null, '新增付款单：FK2018040100018', '2018-04-01 17:54:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('220', null, '修改付款单：null', '2018-04-01 18:03:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('221', null, '修改付款单：null', '2018-04-01 18:03:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('222', null, '修改付款单：null', '2018-04-01 18:05:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('223', null, '修改付款单：null', '2018-04-01 18:06:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('224', null, '新增付款单：FK2018040100022', '2018-04-01 18:09:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('225', null, '修改付款单：null', '2018-04-01 18:09:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('226', null, '新增现金日记账：DJ2018040100004', '2018-04-01 18:11:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('227', null, '修改现金日记账：null', '2018-04-01 18:11:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('228', null, '新增银行日记账：DJ2018040100005', '2018-04-01 18:12:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('229', null, '修改银行日记账：null', '2018-04-01 18:13:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('230', null, '修改用户密码：超级管理员', '2018-04-02 00:58:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('231', null, '用户登录', '2018-04-02 01:24:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('232', null, '用户登录', '2018-04-02 01:35:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('233', null, '用户登录', '2018-04-02 01:37:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('234', null, '用户登录', '2018-04-02 01:37:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('235', null, '用户登录', '2018-04-02 01:44:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('236', null, '用户登录', '2018-04-02 02:06:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('237', null, '用户登录', '2018-04-02 02:08:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('238', null, '用户登录', '2018-04-04 20:15:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('239', null, '用户登录', '2018-04-06 00:08:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('240', null, '用户登录', '2018-04-20 20:41:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('241', null, '用户登录', '2018-04-22 19:53:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('242', null, '用户登录', '2018-04-22 20:36:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('243', null, '用户登录', '2018-04-23 21:43:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('244', null, '用户登录', '2018-04-23 21:52:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('245', null, '用户登录', '2018-04-23 21:58:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('246', null, '用户登录', '2018-04-23 21:59:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('247', null, '用户登录', '2018-04-23 22:01:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('248', null, '用户登录', '2018-04-23 22:02:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('249', null, '用户登录', '2018-04-23 22:06:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('250', null, '用户登录', '2018-04-23 22:18:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('251', null, '用户登录', '2018-04-23 22:19:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('252', null, '用户登录', '2018-04-23 22:53:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('253', null, '用户登录', '2018-04-23 23:00:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('254', null, '用户登录', '2018-04-24 19:37:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('255', null, '用户登录', '2018-04-24 20:10:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('256', null, '用户登录', '2018-04-24 20:11:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('257', null, '用户登录', '2018-04-24 20:24:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('258', null, '新增派车：null', '2018-04-24 20:25:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('259', null, '用户登录', '2018-04-24 20:30:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('260', null, '用户登录', '2018-04-24 21:08:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('261', null, '用户登录', '2018-04-24 21:09:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('262', null, '用户登录', '2018-04-24 21:10:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('263', null, '用户登录', '2018-04-24 21:11:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('264', null, '用户登录', '2018-04-24 21:11:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('265', null, '修改派车信息：6', '2018-04-24 21:12:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('266', null, '用户登录', '2018-04-24 21:20:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('267', null, '用户登录', '2018-04-25 20:09:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('268', null, '用户登录', '2018-04-26 19:43:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('269', null, '用户登录', '2018-04-26 20:45:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('270', null, '用户登录', '2018-04-26 20:49:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('271', null, '用户登录', '2018-04-26 20:50:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('272', null, '用户登录', '2018-04-26 20:53:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('273', null, '用户登录', '2018-04-26 20:58:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('274', null, '用户登录', '2018-04-26 20:59:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('275', null, '用户登录', '2018-04-26 21:04:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('276', null, '用户登录', '2018-04-26 21:09:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('277', null, '用户登录', '2018-04-26 21:35:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('278', null, '用户登录', '2018-04-26 21:38:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('279', null, '用户登录', '2018-04-26 22:42:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('280', null, '用户登录', '2018-04-26 22:45:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('281', null, '用户登录', '2018-04-26 22:49:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('282', null, '用户登录', '2018-04-26 22:54:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('283', null, '用户登录', '2018-04-26 23:02:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('284', null, '用户登录', '2018-04-26 23:08:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('285', null, '用户登录', '2018-04-26 23:09:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('286', null, '用户登录', '2018-04-26 23:13:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('287', null, '用户登录', '2018-04-26 23:18:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('288', null, '用户登录', '2018-04-26 23:20:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('289', null, '用户登录', '2018-04-26 23:20:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('290', null, '用户登录', '2018-04-26 23:21:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('291', null, '用户登录', '2018-04-26 23:30:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('292', null, '用户登录', '2018-04-26 23:32:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('293', null, '用户登录', '2018-04-26 23:34:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('294', null, '用户登录', '2018-04-26 23:35:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('295', null, '用户登录', '2018-04-26 23:37:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('296', null, '用户登录', '2018-04-27 20:16:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('297', null, '用户登录', '2018-04-27 20:42:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('298', null, '用户登录', '2018-04-27 20:54:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('299', null, '新增铁发信息：null', '2018-04-27 20:55:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('300', null, '用户登录', '2018-04-27 21:24:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('301', null, '用户登录', '2018-04-27 21:39:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('302', null, '用户登录', '2018-04-27 21:46:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('303', null, '用户登录', '2018-04-27 21:49:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('304', null, '修改铁发信息：8', '2018-04-27 21:49:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('305', null, '用户登录', '2018-04-27 22:39:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('306', null, '用户登录', '2018-04-29 11:08:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('307', null, '新增派车：null', '2018-04-29 11:15:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('308', null, '用户登录', '2018-04-29 11:33:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('309', null, '新增派车：null', '2018-04-29 11:33:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('310', null, '新增派车：null', '2018-04-29 11:37:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('311', null, '新增铁发信息：null', '2018-04-29 11:37:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('312', null, '用户登录', '2018-04-29 15:26:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('313', null, '用户登录', '2018-04-29 15:53:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('314', null, '用户登录', '2018-04-29 15:57:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('315', null, '用户登录', '2018-04-29 16:15:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('316', null, '用户登录', '2018-04-29 16:18:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('317', null, '用户登录', '2018-04-29 16:38:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('318', null, '用户登录', '2018-04-29 16:41:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('319', null, '用户登录', '2018-04-29 16:42:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('320', null, '用户登录', '2018-04-29 16:44:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('321', null, '用户登录', '2018-04-29 17:04:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('322', null, '用户登录', '2018-04-29 17:05:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('323', null, '用户登录', '2018-04-29 17:07:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('324', null, '用户登录', '2018-04-29 17:08:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('325', null, '用户登录', '2018-04-29 18:08:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('326', null, '用户登录', '2018-04-29 18:27:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('327', null, '用户登录', '2018-04-29 18:32:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('328', null, '用户登录', '2018-04-29 18:41:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('329', null, '用户登录', '2018-04-29 18:43:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('330', null, '用户登录', '2018-04-29 18:44:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('331', null, '用户登录', '2018-04-29 18:46:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('332', null, '用户登录', '2018-04-29 18:49:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('333', null, '新增送货信息：null', '2018-04-29 18:49:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('334', null, '用户登录', '2018-04-29 18:54:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('335', null, '用户登录', '2018-04-29 18:55:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('336', null, '新增派车：null', '2018-04-29 18:59:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('337', null, '新增铁发信息：null', '2018-04-29 19:01:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('338', null, '用户登录', '2018-04-29 19:12:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('339', null, '用户登录', '2018-04-29 19:21:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('340', null, '用户登录', '2018-04-29 19:22:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('341', null, '用户登录', '2018-04-29 19:25:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('342', null, '新增送货信息：null', '2018-04-29 19:26:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('343', null, '用户登录', '2018-04-29 19:54:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('344', null, '用户登录', '2018-04-29 19:57:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('345', null, '用户登录', '2018-04-29 19:58:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('346', null, '用户登录', '2018-04-29 20:00:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('347', null, '用户登录', '2018-04-29 20:01:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('348', null, '用户登录', '2018-04-29 20:04:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('349', null, '修改送货信息：7', '2018-04-29 20:08:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('350', null, '用户登录', '2018-04-29 20:10:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('351', null, '用户登录', '2018-04-29 22:37:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('352', null, '用户登录', '2018-04-29 23:51:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('353', null, '用户登录', '2018-04-29 23:53:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('354', null, '用户登录', '2018-04-29 23:57:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('355', null, '用户登录', '2018-04-30 09:51:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('356', null, '用户登录', '2018-04-30 09:59:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('357', null, '用户登录', '2018-04-30 10:01:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('358', null, '用户登录', '2018-04-30 10:12:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('359', null, '用户登录', '2018-04-30 10:13:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('360', null, '用户登录', '2018-04-30 10:45:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('361', null, '新增回空信息：null', '2018-04-30 10:46:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('362', null, '用户登录', '2018-04-30 10:50:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('363', null, '用户登录', '2018-04-30 10:52:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('364', null, '新增回空信息：null', '2018-04-30 10:52:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('365', null, '用户登录', '2018-04-30 11:08:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('366', null, '修改回空信息：5', '2018-04-30 11:08:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('367', null, '用户登录', '2018-04-30 11:13:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('368', null, '用户登录', '2018-04-30 11:15:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('369', null, '用户登录', '2018-04-30 11:16:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('370', null, '用户登录', '2018-04-30 11:17:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('371', null, '用户登录', '2018-04-30 12:32:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('372', null, '用户登录', '2018-04-30 12:44:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('373', null, '用户登录', '2018-04-30 13:09:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('374', null, '用户登录', '2018-04-30 13:14:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('375', null, '用户登录', '2018-04-30 13:15:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('376', null, '用户登录', '2018-04-30 13:18:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('377', null, '用户登录', '2018-04-30 13:18:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('378', null, '用户登录', '2018-04-30 13:19:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('379', null, '用户登录', '2018-04-30 13:24:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('380', null, '用户登录', '2018-04-30 15:03:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('381', null, '修改菜单：客户管理', '2018-04-30 15:07:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('382', null, '修改菜单：产品管理', '2018-04-30 15:08:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('383', null, '修改菜单：集装箱管理', '2018-04-30 15:08:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('384', null, '新增菜单：合同管理', '2018-04-30 15:09:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('385', null, '用户登录', '2018-04-30 17:38:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('386', null, '用户登录', '2018-04-30 18:42:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('387', null, '用户登录', '2018-04-30 18:45:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('388', null, '用户登录', '2018-04-30 19:19:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('389', null, '用户登录', '2018-04-30 19:21:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('390', null, '用户登录', '2018-04-30 19:24:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('391', null, '用户登录', '2018-04-30 20:03:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('392', null, '用户登录', '2018-04-30 20:06:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('393', null, '用户登录', '2018-04-30 20:08:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('394', null, '用户登录', '2018-04-30 20:10:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('395', null, '用户登录', '2018-04-30 20:12:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('396', null, '用户登录', '2018-04-30 20:18:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('397', null, '用户登录', '2018-04-30 20:19:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('398', null, '用户登录', '2018-04-30 20:29:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('399', null, '用户登录', '2018-04-30 20:29:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('400', null, '用户登录', '2018-04-30 20:32:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('401', null, '用户登录', '2018-04-30 20:34:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('402', null, '用户登录', '2018-04-30 20:35:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('403', null, '用户登录', '2018-04-30 20:36:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('404', null, '用户登录', '2018-04-30 20:38:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('405', null, '用户登录', '2018-04-30 20:42:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('406', null, '用户登录', '2018-04-30 20:43:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('407', null, '用户登录', '2018-04-30 20:44:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('408', null, '用户登录', '2018-04-30 20:49:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('409', null, '用户登录', '2018-04-30 20:52:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('410', null, '用户登录', '2018-04-30 20:54:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('411', null, '用户登录', '2018-04-30 20:59:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('412', null, '用户登录', '2018-04-30 21:00:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('413', null, '新增合同信息：XJLXFC20180201-5', '2018-04-30 21:01:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('414', null, '用户登录', '2018-04-30 21:06:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('415', null, '用户登录', '2018-04-30 21:07:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('416', null, '用户登录', '2018-04-30 21:30:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('417', null, '用户登录', '2018-04-30 21:32:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('418', null, '用户登录', '2018-04-30 21:36:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('419', null, '用户登录', '2018-04-30 21:38:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('420', null, '修改合同信息：null', '2018-04-30 21:38:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('421', null, '用户登录', '2018-04-30 21:45:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('422', null, '禁用合同：1', '2018-04-30 21:45:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('423', null, '修改合同信息：null', '2018-04-30 21:47:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('424', null, '新增菜单：发运记录', '2018-04-30 23:14:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('425', null, '用户登录', '2018-05-01 09:17:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('426', null, '新增菜单：期初现金银行', '2018-05-01 09:41:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('427', null, '修改菜单：收款单', '2018-05-01 09:41:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('428', null, '修改菜单：银行日记账', '2018-05-01 09:41:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('429', null, '修改菜单：现金日记账', '2018-05-01 09:41:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('430', null, '修改菜单：其他付款单', '2018-05-01 09:42:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('431', null, '修改菜单：付款单', '2018-05-01 09:42:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('432', null, '新增菜单：期初应收应付', '2018-05-01 09:43:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('433', null, '用户登录', '2018-05-01 09:55:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('434', null, '用户登录', '2018-05-01 10:11:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('435', null, '用户登录', '2018-05-01 11:02:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('436', null, '用户登录', '2018-05-01 11:18:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('437', null, '用户登录', '2018-05-01 11:19:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('438', null, '用户登录', '2018-05-01 11:32:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('439', null, '用户登录', '2018-05-01 11:34:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('440', null, '用户登录', '2018-05-01 11:42:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('441', null, '新增订单：FC2018050100001', '2018-05-01 11:42:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('442', null, '用户登录', '2018-05-01 11:43:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('443', null, '新增订单：FC2018050100001', '2018-05-01 11:44:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('444', null, '用户登录', '2018-05-01 11:51:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('445', null, '用户登录', '2018-05-01 11:54:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('446', null, '修改客户：客户B', '2018-05-01 11:54:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('447', null, '用户登录', '2018-05-01 15:01:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('448', null, '用户登录', '2018-05-01 15:37:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('449', null, '用户登录', '2018-05-01 15:38:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('450', null, '用户登录', '2018-05-01 15:39:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('451', null, '用户登录', '2018-05-01 15:39:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('452', null, '用户登录', '2018-05-01 15:41:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('453', null, '用户登录', '2018-05-01 15:44:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('454', null, '用户登录', '2018-05-01 15:45:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('455', null, '用户登录', '2018-05-01 15:47:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('456', null, '用户登录', '2018-05-01 15:50:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('457', null, '用户登录', '2018-05-01 15:52:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('458', null, '用户登录', '2018-05-01 16:02:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('459', null, '新增派车：null', '2018-05-01 16:03:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('460', null, '用户登录', '2018-05-01 16:04:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('461', null, '用户登录', '2018-05-01 16:05:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('462', null, '新增铁发信息：null', '2018-05-01 16:06:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('463', null, '新增派车：null', '2018-05-01 16:12:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('464', null, '新增铁发信息：null', '2018-05-01 16:12:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('465', null, '用户登录', '2018-05-01 16:14:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('466', null, '新增铁发信息：null', '2018-05-01 16:16:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('467', null, '用户登录', '2018-05-01 16:20:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('468', null, '用户登录', '2018-05-01 16:20:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('469', null, '用户登录', '2018-05-01 16:21:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('470', null, '新增铁发信息：null', '2018-05-01 16:21:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('471', null, '修改铁发信息：14', '2018-05-01 16:22:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('472', null, '修改铁发信息：14', '2018-05-01 16:22:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('473', null, '用户登录', '2018-05-01 19:15:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('474', null, '用户登录', '2018-05-01 20:00:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('475', null, '用户登录', '2018-05-01 20:04:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('476', null, '用户登录', '2018-05-01 20:05:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('477', null, '用户登录', '2018-05-01 20:08:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('478', null, '新增集装箱位置：YHG67522', '2018-05-01 20:08:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('479', null, '用户登录', '2018-05-01 20:09:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('480', null, '用户登录', '2018-05-01 20:10:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('481', null, '新增集装箱位置：YHG67522', '2018-05-01 20:10:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('482', null, '用户登录', '2018-05-01 20:12:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('483', null, '修改集装箱位置：null', '2018-05-01 20:12:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('484', null, '用户登录', '2018-05-01 20:27:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('485', null, '用户登录', '2018-05-01 21:15:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('486', null, '用户登录', '2018-05-01 21:24:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('487', null, '用户登录', '2018-05-01 21:26:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('488', null, '修改菜单：发运记录', '2018-05-01 21:26:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('489', null, '用户登录', '2018-05-01 21:50:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('490', null, '用户登录', '2018-05-01 21:52:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('491', null, '用户登录', '2018-05-01 21:56:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('492', null, '用户登录', '2018-05-01 21:58:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('493', null, '用户登录', '2018-05-01 21:58:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('494', null, '用户登录', '2018-05-01 21:59:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('495', null, '用户登录', '2018-05-01 23:17:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('496', null, '新增菜单：汇总统计表', '2018-05-01 23:18:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('497', null, '用户登录', '2018-05-01 23:22:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('498', null, '用户登录', '2018-05-02 19:51:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('499', null, '用户登录', '2018-05-02 21:02:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('500', null, '用户登录', '2018-05-02 22:14:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('501', null, '用户登录', '2018-05-02 22:14:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('502', null, '用户登录', '2018-05-02 22:25:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('503', null, '用户登录', '2018-05-02 22:25:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('504', null, '用户登录', '2018-05-02 22:27:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('505', null, '新增收款单：SK2018050200001', '2018-05-02 22:27:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('506', null, '用户登录', '2018-05-02 22:30:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('507', null, '用户登录', '2018-05-02 22:31:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('508', null, '修改收款单：null', '2018-05-02 22:31:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('509', null, '用户登录', '2018-05-02 22:33:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('510', null, '用户登录', '2018-05-02 22:59:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('511', null, '新增付款单：FK2018050200001', '2018-05-02 23:00:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('512', null, '修改付款单：null', '2018-05-02 23:00:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('513', null, '用户登录', '2018-05-02 23:19:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('514', null, '新增付款单：FK2018050200001', '2018-05-02 23:19:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('515', null, '修改付款单：null', '2018-05-02 23:19:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('516', null, '用户登录', '2018-05-03 22:40:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('517', null, '用户登录', '2018-05-03 22:48:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('518', null, '用户登录', '2018-05-03 23:03:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('519', null, '用户登录', '2018-05-03 23:05:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('520', null, '新增付款单：FK2018050300001', '2018-05-03 23:06:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('521', null, '用户登录', '2018-05-03 23:07:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('522', null, '用户登录', '2018-05-03 23:21:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('523', null, '用户登录', '2018-05-03 23:21:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('524', null, '用户登录', '2018-05-03 23:48:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('525', null, '用户登录', '2018-05-03 23:56:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('526', null, '用户登录', '2018-05-04 00:05:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('527', null, '用户登录', '2018-05-04 20:57:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('528', null, '用户登录', '2018-05-04 22:34:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('529', null, '用户登录', '2018-05-04 23:07:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('530', null, '用户登录', '2018-05-04 23:09:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('531', null, '用户登录', '2018-05-04 23:13:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('532', null, '用户登录', '2018-05-04 23:16:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('533', null, '修改订单：6', '2018-05-04 23:16:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('534', null, '用户登录', '2018-05-04 23:16:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('535', null, '完成订单：6', '2018-05-04 23:17:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('536', null, '禁用组织：37', '2018-05-04 23:23:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('537', null, '用户登录', '2018-05-04 23:51:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('538', null, '用户登录', '2018-05-04 23:53:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('539', null, '用户登录', '2018-05-04 23:59:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('540', null, '用户登录', '2018-05-05 00:00:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('541', null, '用户登录', '2018-05-05 00:03:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('542', null, '用户登录', '2018-05-05 00:06:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('543', null, '用户登录', '2018-05-05 00:07:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('544', null, '用户登录', '2018-05-05 00:08:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('545', null, '用户登录', '2018-05-05 00:19:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('546', null, '用户登录', '2018-05-05 00:22:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('547', null, '用户登录', '2018-05-05 00:22:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('548', null, '用户登录', '2018-05-05 00:23:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('549', null, '新增期初应收应付：客户B', '2018-05-05 00:29:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('550', null, '用户登录', '2018-05-05 00:41:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('551', null, '用户登录', '2018-05-05 00:46:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('552', null, '用户登录', '2018-05-05 00:48:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('553', null, '用户登录', '2018-05-05 00:48:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('554', null, '用户登录', '2018-05-05 00:50:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('555', null, '新增收款单：SK2018050500003', '2018-05-05 00:50:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('556', null, '用户登录', '2018-05-05 00:52:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('557', null, '用户登录', '2018-05-05 00:53:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('558', null, '用户登录', '2018-05-05 19:52:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('559', null, '用户登录', '2018-05-05 19:59:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('560', null, '用户登录', '2018-05-05 20:01:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('561', null, '用户登录', '2018-05-05 20:06:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('562', null, '用户登录', '2018-05-05 20:10:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('563', null, '新增期初应收应付：测试', '2018-05-05 20:10:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('564', null, '用户登录', '2018-05-05 20:11:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('565', null, '新增期初应收应付：大有优先公司', '2018-05-05 20:12:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('566', null, '修改期初应收应付：null', '2018-05-05 20:12:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('567', null, '用户登录', '2018-05-05 21:27:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('568', null, '用户登录', '2018-05-05 21:28:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('569', null, '用户登录', '2018-05-05 22:37:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('570', null, '用户登录', '2018-05-05 23:06:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('571', null, '用户登录', '2018-05-05 23:55:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('572', null, '修改回空到站：5', '2018-05-05 23:57:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('573', null, '用户登录', '2018-05-05 23:57:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('574', null, '用户登录', '2018-05-05 23:59:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('575', null, '修改回空到站：5', '2018-05-05 23:59:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('576', null, '用户登录', '2018-05-06 00:00:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('577', null, '修改回空到站：5', '2018-05-06 00:00:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('578', null, '修改回空到站：5', '2018-05-06 00:01:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('579', null, '用户登录', '2018-05-06 00:03:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('580', null, '用户登录', '2018-05-06 00:03:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('581', null, '用户登录', '2018-05-06 00:07:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('582', null, '用户登录', '2018-05-06 00:09:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('583', null, '用户登录', '2018-05-06 00:23:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('584', null, '用户登录', '2018-05-06 00:25:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('585', null, '用户登录', '2018-05-06 00:26:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('586', null, '用户登录', '2018-05-06 00:29:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('587', null, '用户登录', '2018-05-06 09:44:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('588', null, '修改菜单：集装箱资金统计表', '2018-05-06 09:48:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('589', null, '修改菜单：集装箱资金统计表', '2018-05-06 09:49:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('590', null, '用户登录', '2018-05-06 09:57:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('591', null, '修改菜单：集装箱资金报表', '2018-05-06 09:57:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('592', null, '用户登录', '2018-05-06 12:40:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('593', null, '用户登录', '2018-05-06 13:03:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('594', null, '用户登录', '2018-05-06 13:07:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('595', null, '用户登录', '2018-05-06 13:08:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('596', null, '用户登录', '2018-05-06 13:08:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('597', null, '用户登录', '2018-05-06 13:11:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('598', null, '用户登录', '2018-05-06 13:13:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('599', null, '用户登录', '2018-05-06 13:16:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('600', null, '用户登录', '2018-05-06 13:18:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('601', null, '用户登录', '2018-05-06 13:20:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('602', null, '用户登录', '2018-05-06 13:21:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('603', null, '用户登录', '2018-05-06 13:23:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('604', null, '用户登录', '2018-05-06 13:25:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('605', null, '用户登录', '2018-05-06 15:24:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('606', null, '用户登录', '2018-05-06 15:25:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('607', null, '用户登录', '2018-05-06 16:33:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('608', null, '新增菜单：站内箱剩余报表', '2018-05-06 16:34:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('609', null, '用户登录', '2018-05-06 16:37:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('610', null, '用户登录', '2018-05-06 16:39:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('611', null, '用户登录', '2018-05-06 16:39:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('612', null, '用户登录', '2018-05-06 16:41:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('613', null, '用户登录', '2018-05-06 16:45:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('614', null, '用户登录', '2018-05-06 16:45:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('615', null, '用户登录', '2018-05-06 16:56:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('616', null, '用户登录', '2018-05-06 17:01:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('617', null, '用户登录', '2018-05-06 17:02:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('618', null, '用户登录', '2018-05-06 17:03:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('619', null, '修改菜单：空箱调拨管理', '2018-05-06 17:50:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('620', null, '修改菜单：空箱调拨管理', '2018-05-06 17:50:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('621', null, '修改菜单：调度派车', '2018-05-06 17:51:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('622', null, '修改菜单：寄存管理', '2018-05-06 17:51:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('623', null, '修改菜单：集装箱位置', '2018-05-06 17:51:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('624', null, '修改菜单：集装箱位置', '2018-05-06 17:51:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('625', null, '修改菜单：铁发管理', '2018-05-06 17:52:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('626', null, '修改菜单：送货管理', '2018-05-06 17:52:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('627', null, '修改菜单：回空管理', '2018-05-06 17:52:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('628', null, '修改菜单：发运记录', '2018-05-06 17:52:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('629', null, '修改菜单：集装箱资金报表', '2018-05-06 17:53:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('630', null, '修改菜单：集装箱资金报表', '2018-05-06 17:53:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('631', null, '修改菜单：箱回空红票费', '2018-05-06 17:53:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('632', null, '修改菜单：报表中心', '2018-05-06 17:54:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('633', null, '修改菜单：集装箱管理', '2018-05-06 17:55:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('634', null, '新增菜单：集装箱查询', '2018-05-06 18:00:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('635', null, '修改菜单：集装箱查询', '2018-05-06 18:00:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('636', null, '修改菜单：箱号检索', '2018-05-06 18:00:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('637', null, '用户登录', '2018-05-06 18:25:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('638', null, '用户登录', '2018-05-06 18:27:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('639', null, '用户登录', '2018-05-06 18:28:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('640', null, '用户登录', '2018-05-06 18:29:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('641', null, '新增空箱调拨：null', '2018-05-06 18:50:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('642', null, '用户登录', '2018-05-06 19:08:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('643', null, '用户登录', '2018-05-06 19:09:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('644', null, '用户登录', '2018-05-06 19:10:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('645', null, '用户登录', '2018-05-06 19:12:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('646', null, '用户登录', '2018-05-06 19:13:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('647', null, '用户登录', '2018-05-06 19:14:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('648', null, '用户登录', '2018-05-06 19:15:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('649', null, '用户登录', '2018-05-06 19:16:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('650', null, '用户登录', '2018-05-06 19:17:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('651', null, '用户登录', '2018-05-06 19:23:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('652', null, '用户登录', '2018-05-06 19:24:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('653', null, '用户登录', '2018-05-06 19:25:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('654', null, '用户登录', '2018-05-06 19:30:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('655', null, '用户登录', '2018-05-06 19:33:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('656', null, '用户登录', '2018-05-06 19:33:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('657', null, '用户登录', '2018-05-06 19:34:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('658', null, '用户登录', '2018-05-06 19:35:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('659', null, '用户登录', '2018-05-06 19:41:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('660', null, '用户登录', '2018-05-06 19:42:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('661', null, '新增组织：测试', '2018-05-06 20:50:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('662', null, '修改组织：测试', '2018-05-06 20:50:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('663', null, '新增用户：财务1', '2018-05-06 20:52:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('664', null, '修改用户：超级管理员', '2018-05-06 20:52:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('665', null, '修改用户：财务1', '2018-05-06 20:52:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('666', null, '新增用户：财务2', '2018-05-06 20:53:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('667', null, '新增用户：业务员1', '2018-05-06 20:54:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('668', null, '新增用户：业务员2', '2018-05-06 20:54:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('669', null, '修改用户：超级管理员', '2018-05-06 20:54:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('670', null, '修改角色：集装箱管理', '2018-05-06 20:55:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('671', null, '新增角色：测试', '2018-05-06 20:55:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('672', null, '修改角色：业务', '2018-05-06 20:56:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('673', null, '修改角色：财务', '2018-05-06 20:56:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('674', null, '修改菜单：委托单位对账单', '2018-05-06 20:57:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('675', null, '修改菜单：订单核算报表', '2018-05-06 20:57:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('676', null, '修改菜单：委托单位欠款', '2018-05-06 20:57:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('677', null, '新增角色：基础资料', '2018-05-06 21:00:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('678', null, '用户登录', '2018-05-06 21:00:49', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('679', null, '用户登录', '2018-05-06 21:01:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('680', null, '用户登录', '2018-05-06 21:01:49', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('681', null, '用户登录', '2018-05-06 21:01:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('682', null, '用户登录', '2018-05-06 21:23:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('683', null, '用户登录', '2018-05-06 21:24:33', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('684', null, '用户登录', '2018-05-06 21:24:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('685', null, '新增集装箱：AAMU2904787', '2018-05-06 21:26:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('686', null, '修改集装箱：AAMU2904787', '2018-05-06 21:26:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('687', null, '新增集装箱：AAMU2904175', '2018-05-06 21:26:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('688', null, '新增租赁箱价格：7', '2018-05-06 21:27:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('689', null, '修改租赁价格：5', '2018-05-06 21:27:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('690', null, '修改集装箱：AAMU2904787', '2018-05-06 21:27:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('691', null, '用户登录', '2018-05-06 21:29:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('692', null, '新增客户：瑞安市新龙化工原料有限公司', '2018-05-06 21:31:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('693', null, '修改客户：瑞安市新龙化工原料有限公司', '2018-05-06 21:31:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('694', null, '新增产品：减线油', '2018-05-06 21:33:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('695', null, '用户登录', '2018-05-06 21:35:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('696', null, '新增产品：白油', '2018-05-06 21:36:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('697', null, '新增产品：液奈', '2018-05-06 21:36:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('698', null, '修改合同信息：null', '2018-05-06 21:36:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('699', null, '修改合同信息：null', '2018-05-06 21:36:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('700', null, '用户登录', '2018-05-06 21:37:04', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('701', null, '用户登录', '2018-05-06 21:38:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('702', null, '新增合同信息：XJLXFC20180201-5', '2018-05-06 21:39:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('703', null, '用户登录', '2018-05-06 21:39:57', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('704', null, '新增订单：FC2018050600001', '2018-05-06 21:41:13', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('705', null, '新增空箱调拨：null', '2018-05-06 21:41:37', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('706', null, '用户登录', '2018-05-06 21:42:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('707', null, '新增集装箱：AAMU2904998', '2018-05-06 21:43:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('708', null, '用户登录', '2018-05-06 21:44:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('709', null, '用户登录', '2018-05-06 21:46:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('710', null, '新增集装箱：AAMU2904827', '2018-05-06 21:46:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('711', null, '新增租赁箱价格：9', '2018-05-06 21:46:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('712', null, '用户登录', '2018-05-06 21:47:34', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('713', null, '新增派车：null', '2018-05-06 21:47:57', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('714', null, '新增派车：null', '2018-05-06 21:48:14', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('715', null, '新增铁发信息：null', '2018-05-06 21:48:42', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('716', null, '新增送货信息：null', '2018-05-06 21:49:01', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('717', null, '新增回空信息：null', '2018-05-06 21:49:16', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('718', null, '新增寄存信息：null', '2018-05-06 21:49:26', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('719', null, '新增集装箱位置：AAMU2904827', '2018-05-06 21:49:48', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('720', null, '用户登录', '2018-05-06 21:57:47', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('721', null, '修改回空到站：8', '2018-05-06 21:58:40', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('722', null, '用户登录', '2018-05-06 22:06:28', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('723', null, '新增铁发信息：null', '2018-05-06 22:08:45', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('724', null, '新增送货信息：null', '2018-05-06 22:09:24', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('725', null, '用户登录', '2018-05-06 22:10:41', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('726', null, '用户登录', '2018-05-06 22:11:22', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('727', null, '新增回空信息：null', '2018-05-06 22:11:33', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('728', null, '用户登录', '2018-05-06 22:13:10', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('729', null, '新增送货信息：null', '2018-05-06 22:13:49', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('730', null, '用户登录', '2018-05-06 22:15:40', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('731', null, '新增回空信息：null', '2018-05-06 22:15:54', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('732', null, '用户登录', '2018-05-06 22:19:04', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('733', null, '用户登录', '2018-05-06 22:20:46', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('734', null, '用户登录', '2018-05-06 22:22:18', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('735', null, '新增回空信息：null', '2018-05-06 22:22:28', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('736', null, '修改回空到站：12', '2018-05-06 22:22:40', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('737', null, '用户登录', '2018-05-06 22:25:55', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('738', null, '用户登录', '2018-05-06 22:27:16', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('739', null, '新增派车：null', '2018-05-06 22:30:04', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('740', null, '新增铁发信息：null', '2018-05-06 22:31:51', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('741', null, '用户登录', '2018-05-06 22:33:15', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('742', null, '新增铁发信息：null', '2018-05-06 22:34:37', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('743', null, '用户登录', '2018-05-06 22:35:00', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('744', null, '新增铁发信息：null', '2018-05-06 22:40:12', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('745', null, '用户登录', '2018-05-06 22:40:42', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('746', null, '新增铁发信息：null', '2018-05-06 22:42:28', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('747', null, '用户登录', '2018-05-06 22:42:48', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('748', null, '用户登录', '2018-05-06 22:44:28', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('749', null, '用户登录', '2018-05-06 22:58:18', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('750', null, '新增派车：null', '2018-05-06 22:58:38', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('751', null, '新增铁发信息：null', '2018-05-06 22:58:54', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('752', null, '新增送货信息：null', '2018-05-06 22:59:09', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('753', null, '用户登录', '2018-05-06 23:00:25', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('754', null, '新增回空信息：null', '2018-05-06 23:00:56', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('755', null, '修改回空到站：13', '2018-05-06 23:01:14', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('756', null, '用户登录', '2018-05-06 23:01:28', '11', '业务员2');
INSERT INTO `sys_optlog` VALUES ('757', null, '用户登录', '2018-05-06 23:02:08', '8', '财务1');
INSERT INTO `sys_optlog` VALUES ('758', null, '用户登录', '2018-05-06 23:07:13', '8', '财务1');
INSERT INTO `sys_optlog` VALUES ('759', null, '新增期初应收应付：瑞安市新龙化工原料有限公司', '2018-05-06 23:07:35', '8', '财务1');
INSERT INTO `sys_optlog` VALUES ('760', null, '新增收款单：SK2018050600006', '2018-05-06 23:08:12', '8', '财务1');
INSERT INTO `sys_optlog` VALUES ('761', null, '用户登录', '2018-05-06 23:10:12', '9', '财务2');
INSERT INTO `sys_optlog` VALUES ('762', null, '用户登录', '2018-05-06 23:12:24', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('763', null, '新增派车：null', '2018-05-06 23:12:48', '10', '业务员1');
INSERT INTO `sys_optlog` VALUES ('764', null, '新增付款单：FK2018050600061', '2018-05-06 23:13:41', '9', '财务2');
INSERT INTO `sys_optlog` VALUES ('765', null, '修改付款单：null', '2018-05-06 23:13:55', '9', '财务2');
INSERT INTO `sys_optlog` VALUES ('766', null, '新增现金日记账：DJ2018050600004', '2018-05-06 23:14:04', '9', '财务2');
INSERT INTO `sys_optlog` VALUES ('767', null, '修改现金日记账：null', '2018-05-06 23:14:07', '9', '财务2');
INSERT INTO `sys_optlog` VALUES ('768', null, '新增银行日记账：DJ2018050600005', '2018-05-06 23:14:18', '9', '财务2');
INSERT INTO `sys_optlog` VALUES ('769', null, '用户登录', '2018-05-06 23:20:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('770', null, '用户登录', '2018-05-06 23:24:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('771', null, '用户登录', '2018-05-06 23:25:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('772', null, '用户登录', '2018-05-06 23:26:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('773', null, '新增铁发信息：null', '2018-05-06 23:27:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('774', null, '用户登录', '2018-05-13 08:46:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('775', null, '新增派车：null', '2018-05-13 08:46:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('776', null, '用户登录', '2018-05-13 08:50:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('777', null, '用户登录', '2018-05-13 20:35:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('778', null, '新增铁发信息：null', '2018-05-13 20:36:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('779', null, '用户登录', '2018-05-18 22:05:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('780', null, '用户登录', '2018-05-18 22:25:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('781', null, '用户登录', '2018-05-18 22:26:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('782', null, '用户登录', '2018-05-18 23:15:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('783', null, '用户登录', '2018-05-18 23:15:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('784', null, '用户登录', '2018-05-19 23:06:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('785', null, '用户登录', '2018-05-19 23:07:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('786', null, '用户登录', '2018-05-19 23:15:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('787', null, '用户登录', '2018-05-19 23:15:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('788', null, '用户登录', '2018-05-19 23:18:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('789', null, '用户登录', '2018-05-19 23:25:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('790', null, '用户登录', '2018-05-19 23:32:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('791', null, '用户登录', '2018-05-19 23:33:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('792', null, '用户登录', '2018-05-19 23:35:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('793', null, '用户登录', '2018-05-19 23:38:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('794', null, '用户登录', '2018-05-19 23:42:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('795', null, '用户登录', '2018-05-19 23:44:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('796', null, '用户登录', '2018-05-19 23:45:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('797', null, '用户登录', '2018-05-19 23:47:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('798', null, '用户登录', '2018-05-19 23:48:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('799', null, '用户登录', '2018-05-19 23:50:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('800', null, '用户登录', '2018-05-20 00:06:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('801', null, '用户登录', '2018-05-20 00:17:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('802', null, '用户登录', '2018-05-20 00:28:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('803', null, '用户登录', '2018-05-20 00:29:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('804', null, '用户登录', '2018-05-20 00:29:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('805', null, '用户登录', '2018-05-20 01:01:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('806', null, '用户登录', '2018-05-20 01:01:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('807', null, '用户登录', '2018-05-20 14:55:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('808', null, '用户登录', '2018-05-20 14:58:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('809', null, '用户登录', '2018-05-20 14:59:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('810', null, '用户登录', '2018-05-20 14:59:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('811', null, '用户登录', '2018-05-20 14:59:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('812', null, '用户登录', '2018-05-20 15:00:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('813', null, '用户登录', '2018-05-20 15:04:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('814', null, '用户登录', '2018-05-20 15:05:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('815', null, '用户登录', '2018-05-20 15:08:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('816', null, '用户登录', '2018-05-20 15:08:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('817', null, '用户登录', '2018-05-20 15:18:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('818', null, '用户登录', '2018-05-20 15:18:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('819', null, '用户登录', '2018-05-20 15:19:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('820', null, '用户登录', '2018-05-20 15:20:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('821', null, '用户登录', '2018-05-20 15:23:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('822', null, '用户登录', '2018-05-20 15:29:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('823', null, '用户登录', '2018-05-20 15:31:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('824', null, '用户登录', '2018-05-20 15:31:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('825', null, '用户登录', '2018-05-20 15:32:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('826', null, '用户登录', '2018-05-20 15:42:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('827', null, '用户登录', '2018-05-20 15:43:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('828', null, '用户登录', '2018-05-20 15:44:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('829', null, '用户登录', '2018-05-20 15:45:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('830', null, '用户登录', '2018-05-20 15:45:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('831', null, '用户登录', '2018-05-20 15:45:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('832', null, '用户登录', '2018-05-20 15:47:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('833', null, '用户登录', '2018-05-20 15:48:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('834', null, '用户登录', '2018-05-20 15:48:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('835', null, '用户登录', '2018-05-20 16:24:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('836', null, '用户登录', '2018-05-20 16:26:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('837', null, '用户登录', '2018-05-20 16:28:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('838', null, '用户登录', '2018-05-20 16:29:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('839', null, '用户登录', '2018-05-20 16:33:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('840', null, '用户登录', '2018-05-20 16:33:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('841', null, '用户登录', '2018-05-20 16:48:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('842', null, '用户登录', '2018-05-20 16:49:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('843', null, '用户登录', '2018-05-20 16:50:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('844', null, '用户登录', '2018-05-20 16:58:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('845', null, '用户登录', '2018-05-20 16:59:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('846', null, '用户登录', '2018-05-20 16:59:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('847', null, '用户登录', '2018-05-20 17:02:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('848', null, '用户登录', '2018-05-20 17:03:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('849', null, '用户登录', '2018-05-20 17:04:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('850', null, '用户登录', '2018-05-20 17:04:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('851', null, '用户登录', '2018-05-20 17:04:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('852', null, '用户登录', '2018-05-22 20:27:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('853', null, '修改产品：减线油', '2018-05-22 20:27:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('854', null, '用户登录', '2018-05-22 20:29:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('855', null, '修改产品：减线油', '2018-05-22 20:30:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('856', null, '用户登录', '2018-05-22 20:31:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('857', null, '修改产品：减线油', '2018-05-22 20:31:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('858', null, '修改产品：液奈', '2018-05-22 20:33:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('859', null, '修改产品：液奈', '2018-05-22 20:41:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('860', null, '用户登录', '2018-05-27 12:37:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('861', null, '用户登录', '2018-05-27 13:41:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('862', null, '用户登录', '2018-05-27 13:48:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('863', null, '新增派车：20', '2018-05-27 13:49:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('864', null, '用户登录', '2018-05-27 14:01:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('865', null, '新增派车：21', '2018-05-27 14:05:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('866', null, '新增铁发信息：24', '2018-05-27 14:05:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('867', null, '新增送货信息：12', '2018-05-27 14:06:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('868', null, '新增回空信息：null', '2018-05-27 14:06:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('869', null, '用户登录', '2018-05-27 14:08:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('870', null, '用户登录', '2018-05-27 14:08:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('871', null, '新增回空信息：15', '2018-05-27 14:08:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('872', null, '用户登录', '2018-05-28 20:38:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('873', null, '用户登录', '2018-05-28 20:53:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('874', null, '新增客户：11', '2018-05-28 20:55:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('875', null, '修改客户：11', '2018-05-28 20:56:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('876', null, '新增合同信息：111', '2018-05-28 20:56:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('877', null, '修改合同信息：null', '2018-05-28 20:56:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('878', null, '用户登录', '2018-06-03 17:04:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('879', null, '用户登录', '2018-06-03 17:15:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('880', null, '修改铁发信息：21', '2018-06-03 17:15:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('881', null, '用户登录', '2018-06-03 17:25:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('882', null, '用户登录', '2018-06-03 17:26:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('883', null, '用户登录', '2018-06-03 17:27:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('884', null, '用户登录', '2018-06-03 17:34:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('885', null, '用户登录', '2018-06-03 17:34:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('886', null, '修改派车信息：21', '2018-06-03 17:37:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('887', null, '修改派车信息：21', '2018-06-03 17:37:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('888', null, '用户登录', '2018-06-08 22:34:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('889', null, '用户登录', '2018-06-08 22:34:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('890', null, '用户登录', '2018-06-08 22:42:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('891', null, '用户登录', '2018-06-08 23:25:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('892', null, '用户登录', '2018-06-08 23:27:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('893', null, '用户登录', '2018-06-08 23:28:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('894', null, '用户登录', '2018-06-08 23:36:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('895', null, '用户登录', '2018-06-09 00:04:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('896', null, '用户登录', '2018-06-09 00:29:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('897', null, '用户登录', '2018-06-09 00:31:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('898', null, '用户登录', '2018-06-09 00:34:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('899', null, '用户登录', '2018-06-09 12:11:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('900', null, '用户登录', '2018-06-09 14:10:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('901', null, '用户登录', '2018-06-09 15:54:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('902', null, '用户登录', '2018-06-09 15:55:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('903', null, '用户登录', '2018-06-09 15:56:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('904', null, '用户登录', '2018-06-09 16:08:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('905', null, '用户登录', '2018-06-09 16:18:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('906', null, '用户登录', '2018-06-09 16:18:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('907', null, '用户登录', '2018-06-09 16:19:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('908', null, '用户登录', '2018-06-09 16:20:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('909', null, '用户登录', '2018-06-09 16:29:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('910', null, '用户登录', '2018-06-09 17:24:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('911', null, '用户登录', '2018-06-09 17:27:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('912', null, '用户登录', '2018-06-09 19:15:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('913', null, '用户登录', '2018-06-09 19:16:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('914', null, '用户登录', '2018-06-09 19:17:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('915', null, '用户登录', '2018-06-09 19:20:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('916', null, '用户登录', '2018-06-09 19:39:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('917', null, '用户登录', '2018-06-09 19:41:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('918', null, '新增组织：运维部', '2018-06-09 19:41:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('919', null, '用户登录', '2018-06-09 19:45:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('920', null, '用户登录', '2018-06-09 19:46:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('921', null, '修改组织：运维部1', '2018-06-09 19:46:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('922', null, '修改组织：运维部', '2018-06-09 19:47:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('923', null, '修改组织：运维部1', '2018-06-09 19:48:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('924', null, '用户登录', '2018-06-09 19:48:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('925', null, '修改组织：运维部', '2018-06-09 19:49:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('926', null, '新增组织：测试部', '2018-06-09 19:49:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('927', null, '修改组织：质保部', '2018-06-09 19:49:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('928', null, '用户登录', '2018-06-09 20:36:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('929', null, '用户登录', '2018-06-09 20:37:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('930', null, '用户登录', '2018-06-09 20:42:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('931', null, '用户登录', '2018-06-09 20:47:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('932', null, '新增用户：潘海刚', '2018-06-09 20:47:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('933', null, '用户登录', '2018-06-09 20:49:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('934', null, '用户登录', '2018-06-09 20:53:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('935', null, '用户登录', '2018-06-09 20:53:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('936', null, '用户登录', '2018-06-09 20:54:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('937', null, '用户登录', '2018-06-09 20:56:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('938', null, '用户登录', '2018-06-09 21:00:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('939', null, '用户登录', '2018-06-09 21:18:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('940', null, '修改用户：潘海刚1', '2018-06-09 21:18:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('941', null, '修改用户：潘海刚', '2018-06-09 21:19:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('942', null, '新增用户：张晓月', '2018-06-09 21:19:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('943', null, '修改用户：潘海刚', '2018-06-09 21:19:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('944', null, '用户登录', '2018-06-09 22:22:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('945', null, '用户登录', '2018-06-09 22:27:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('946', null, '修改角色：研发', '2018-06-09 22:30:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('947', null, '修改角色：研发', '2018-06-09 22:30:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('948', null, '修改角色：开发', '2018-06-09 22:30:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('949', null, '修改角色：测试', '2018-06-09 22:30:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('950', null, '修改角色：运维', '2018-06-09 22:31:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('951', null, '修改角色：质保', '2018-06-09 22:31:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('952', null, '用户登录', '2018-06-11 21:40:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('953', null, '用户登录', '2018-06-12 17:12:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('954', null, '用户登录', '2018-06-13 15:25:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('955', null, '用户登录', '2018-06-13 15:25:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('956', null, '用户登录', '2018-06-13 15:25:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('957', null, '用户登录', '2018-06-13 15:25:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('958', null, '用户登录', '2018-06-13 15:25:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('959', null, '用户登录', '2018-06-13 15:25:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('960', null, '用户登录', '2018-06-13 15:25:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('961', null, '用户登录', '2018-06-13 15:25:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('962', null, '用户登录', '2018-07-17 10:11:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('963', null, '用户登录', '2018-07-17 10:11:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('964', null, '用户登录', '2019-01-18 10:03:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('965', null, '用户登录', '2019-01-18 11:09:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('966', null, '用户登录', '2019-01-18 11:09:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('967', null, '用户登录', '2019-01-19 13:42:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('968', null, '用户登录', '2019-01-19 13:42:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('969', null, '用户登录', '2019-01-19 16:22:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('970', null, '用户登录', '2019-01-19 16:23:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('971', null, '用户登录', '2019-01-19 16:23:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('972', null, '用户登录', '2019-01-19 16:26:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('973', null, '用户登录', '2019-01-19 16:29:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('974', null, '用户登录', '2019-01-19 16:31:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('975', null, '用户登录', '2019-01-19 17:12:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('976', null, '用户登录', '2019-01-19 17:41:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('977', null, '用户登录', '2019-01-19 17:41:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('978', null, '用户登录', '2019-01-19 17:41:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('979', null, '用户登录', '2019-01-19 21:58:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('980', null, '用户登录', '2019-01-19 23:46:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('981', null, '用户登录', '2019-01-19 23:46:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('982', null, '用户登录', '2019-01-20 11:46:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('983', null, '用户登录', '2019-01-20 11:46:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('984', null, '用户登录', '2019-01-26 09:59:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('985', null, '用户登录', '2019-01-26 09:59:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('986', null, '用户登录', '2019-01-26 09:59:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('987', null, '用户登录', '2019-01-26 09:59:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('988', null, '修改菜单：需求列表', '2019-01-26 10:00:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('989', null, '用户登录', '2019-01-26 10:13:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('990', null, '用户登录', '2019-01-26 10:13:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('991', null, '用户登录', '2019-01-26 10:13:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('992', null, '用户登录', '2019-01-26 10:58:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('993', null, '用户登录', '2019-01-26 10:58:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('994', null, '用户登录', '2019-01-26 10:58:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('995', null, '用户登录', '2019-01-26 11:14:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('996', null, '用户登录', '2019-01-26 15:05:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('997', null, '用户登录', '2019-01-26 15:24:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('998', null, '用户登录', '2019-01-26 15:24:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('999', null, '用户登录', '2019-01-26 15:29:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1000', null, '用户登录', '2019-01-26 15:31:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1001', null, '用户登录', '2019-01-26 15:37:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1002', null, '用户登录', '2019-01-26 15:42:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1003', null, '用户登录', '2019-01-26 15:55:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1004', null, '用户登录', '2019-01-26 16:11:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1005', null, '用户登录', '2019-01-26 16:12:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1006', null, '用户登录', '2019-01-26 16:12:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1007', null, '用户登录', '2019-01-26 16:13:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1008', null, '用户登录', '2019-01-26 16:16:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1009', null, '用户登录', '2019-01-26 16:34:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1010', null, '用户登录', '2019-01-26 16:49:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1011', null, '用户登录', '2019-01-27 11:07:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1012', null, '用户登录', '2019-01-27 11:23:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1013', null, '用户登录', '2019-01-27 13:31:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1014', null, '用户登录', '2019-01-27 13:31:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1015', null, '用户登录', '2019-01-27 14:10:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1016', null, '用户登录', '2019-01-27 14:37:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1017', null, '用户登录', '2019-01-27 14:42:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1018', null, '用户登录', '2019-01-27 14:44:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1019', null, '????', '2019-02-01 15:20:29', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1020', null, '????', '2019-02-01 20:16:42', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1021', null, '????', '2019-02-01 20:21:10', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1022', null, '????', '2019-02-01 20:24:41', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1023', null, '????', '2019-02-01 22:10:22', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1024', null, '????', '2019-02-01 22:13:41', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1025', null, '????', '2019-02-01 22:20:02', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1026', null, '????', '2019-02-01 22:20:46', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1027', null, '????', '2019-02-01 22:22:20', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1028', null, '????', '2019-02-06 09:50:09', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1029', null, '????', '2019-02-10 16:23:44', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1030', null, '????', '2019-02-10 16:26:17', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1031', null, '????', '2019-02-10 16:26:47', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1032', null, '????', '2019-02-10 16:27:44', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1033', null, '????', '2019-02-10 16:37:08', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1034', null, '????', '2019-02-10 16:41:01', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1035', null, '????', '2019-02-10 17:04:08', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1036', null, '????', '2019-02-10 17:05:53', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1037', null, '????', '2019-02-10 17:07:19', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1038', null, '????', '2019-02-10 17:08:56', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1039', null, '????', '2019-02-10 17:24:05', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1040', null, '????', '2019-02-10 17:27:58', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1041', null, '????', '2019-02-10 18:10:11', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1042', null, '????', '2019-02-10 18:12:39', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1043', null, '????', '2019-02-10 18:23:47', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1044', null, '????', '2019-02-10 18:33:09', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1045', null, '????', '2019-02-10 18:38:23', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1046', null, '????', '2019-02-10 19:03:01', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1047', null, '????', '2019-02-10 19:05:54', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1048', null, '????', '2019-02-10 19:11:42', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1049', null, '????', '2019-02-10 19:15:00', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1050', null, '????', '2019-02-10 19:20:17', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1051', null, '????', '2019-02-10 19:29:49', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1052', null, '????', '2019-02-10 19:43:22', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1053', null, '????', '2019-02-10 19:45:52', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1054', null, '????', '2019-02-10 19:56:32', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1055', null, '????', '2019-02-10 20:02:01', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1056', null, '????', '2019-02-10 20:06:04', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1057', null, '????', '2019-02-10 20:09:56', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1058', null, '????', '2019-02-10 20:15:46', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1059', null, '????', '2019-02-10 20:18:24', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1060', null, '????', '2019-02-10 20:20:07', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1061', null, '????', '2019-02-10 20:23:01', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1062', null, '????', '2019-02-10 20:29:52', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1063', null, '????', '2019-02-10 20:53:12', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1064', null, '????', '2019-02-10 20:56:08', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1065', null, '????', '2019-02-11 19:30:47', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1066', null, '????', '2019-02-11 19:33:04', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1067', null, '????', '2019-02-11 20:28:16', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1068', null, '????', '2019-02-11 20:46:13', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1069', null, '????', '2019-02-11 20:49:03', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1070', null, '????', '2019-02-11 21:02:09', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1071', null, '????', '2019-02-11 21:15:16', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1072', null, '????', '2019-02-11 21:22:08', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1073', null, '????', '2019-02-11 22:28:29', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1074', null, '????', '2019-02-11 22:46:27', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1075', null, '????', '2019-02-11 22:50:06', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1076', null, '????', '2019-02-11 22:54:12', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1077', null, '????', '2019-02-11 22:57:14', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1078', null, '????', '2019-02-11 23:02:10', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1079', null, '????', '2019-02-11 23:10:12', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1080', null, '????', '2019-02-11 23:25:43', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1081', null, '????', '2019-02-11 23:32:05', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1082', null, '????', '2019-02-11 23:43:28', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1083', null, '????', '2019-02-11 23:53:03', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1084', null, '????', '2019-02-11 23:57:26', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1085', null, '????', '2019-02-12 00:03:59', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1086', null, '????', '2019-02-12 00:05:48', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1087', null, '????', '2019-02-12 08:36:55', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1088', null, '????', '2019-02-12 15:38:09', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1089', null, '????', '2019-02-12 17:38:40', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1090', null, '????', '2019-02-12 17:38:44', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1091', null, '????', '2019-02-12 18:09:38', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1092', null, '????', '2019-02-12 18:25:30', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1093', null, '????', '2019-02-12 18:27:12', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1094', null, '????', '2019-02-12 18:29:14', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1095', null, '????', '2019-02-12 18:33:39', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1096', null, '????', '2019-02-12 18:44:17', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1097', null, '????', '2019-02-12 18:45:03', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1098', null, '????', '2019-02-12 18:47:33', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1099', null, '????', '2019-02-12 18:58:34', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1100', null, '????', '2019-02-12 19:04:02', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1101', null, '????', '2019-02-12 19:08:27', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1102', null, '????', '2019-02-12 19:11:31', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1103', null, '????', '2019-02-12 19:12:34', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1104', null, '????', '2019-02-12 19:15:32', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1105', null, '????', '2019-02-12 19:20:00', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1106', null, '????', '2019-02-12 19:31:29', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1107', null, '????', '2019-02-12 19:33:20', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1108', null, '????', '2019-02-13 11:12:26', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1109', null, '????', '2019-02-13 11:22:19', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1110', null, '????', '2019-02-13 11:25:53', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1111', null, '????', '2019-02-13 13:52:24', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1112', null, '????', '2019-02-13 14:00:16', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1113', null, '????', '2019-02-13 14:06:09', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1114', null, '????', '2019-02-13 14:07:03', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1115', null, '????', '2019-02-13 14:14:16', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1116', null, '????', '2019-02-13 18:57:47', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1117', null, '????', '2019-02-13 18:59:03', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1118', null, '????', '2019-02-13 19:12:43', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1119', null, '????', '2019-02-13 19:41:35', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1120', null, '????', '2019-02-13 19:42:12', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1121', null, '????', '2019-02-13 20:21:36', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1122', null, '????', '2019-02-13 20:22:13', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1123', null, '????', '2019-02-13 20:22:47', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1124', null, '????', '2019-02-14 09:45:06', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1125', null, '????', '2019-02-14 11:19:03', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1126', null, '????', '2019-02-14 11:21:49', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1127', null, '????', '2019-02-14 11:33:04', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1128', null, '????', '2019-02-14 12:39:57', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1129', null, '????', '2019-02-14 13:01:03', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1130', null, '????', '2019-02-14 14:13:13', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1131', null, '????', '2019-02-14 14:13:44', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1132', null, '????', '2019-02-14 14:23:35', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1133', null, '????', '2019-02-14 14:26:21', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1134', null, '????', '2019-02-14 14:27:25', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1135', null, '????', '2019-02-14 14:47:32', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1136', null, '????', '2019-02-14 14:51:08', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1137', null, '????', '2019-02-14 15:08:23', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1138', null, '????', '2019-02-14 16:39:49', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1139', null, '????', '2019-02-15 21:04:39', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1140', null, '????', '2019-02-16 10:43:59', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1141', null, '????', '2019-02-16 10:44:25', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1142', null, '????', '2019-02-16 10:46:35', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1143', null, '????', '2019-02-16 10:49:57', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1144', null, '????', '2019-02-16 10:55:36', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1145', null, '????', '2019-02-16 12:01:48', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1146', null, '????', '2019-02-16 12:03:29', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1147', null, '????', '2019-02-16 12:10:22', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1148', null, '????', '2019-02-16 12:15:59', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1149', null, '????', '2019-02-16 12:26:20', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1150', null, '?????1111', '2019-02-16 12:27:03', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1151', null, '????', '2019-02-16 14:38:03', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1152', null, '????', '2019-02-16 14:51:14', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1153', null, '????', '2019-02-16 15:01:55', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1154', null, '????', '2019-02-16 15:04:22', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1155', null, '????', '2019-02-16 15:05:19', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1156', null, '????', '2019-02-16 15:09:25', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1157', null, '????', '2019-02-16 15:13:01', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1158', null, '????', '2019-02-16 15:15:45', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1159', null, '????', '2019-02-16 15:19:04', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1160', null, '????', '2019-02-16 15:21:40', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1161', null, '????', '2019-02-16 15:24:07', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1162', null, '????????????????????????“????”', '2019-02-16 15:25:30', '1', '?????');
INSERT INTO `sys_optlog` VALUES ('1163', null, '用户登录', '2019-02-16 15:34:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1164', null, '新增需求：苏州需求，国家共享件查询导出增加显示项“信访人数”', '2019-02-16 15:35:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1165', null, '用户登录', '2019-02-16 15:40:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1166', null, '用户登录', '2019-02-16 15:44:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1167', null, '用户登录', '2019-02-16 15:48:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1168', null, '用户登录', '2019-02-16 15:49:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1169', null, '用户登录', '2019-02-16 15:50:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1170', null, '用户登录', '2019-02-16 16:22:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1171', null, '用户登录', '2019-02-16 16:23:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1172', null, '用户登录', '2019-02-16 16:31:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1173', null, '用户登录', '2019-02-16 16:32:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1174', null, '用户登录', '2019-02-16 16:41:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1175', null, '用户登录', '2019-02-16 16:42:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1176', null, '用户登录', '2019-02-16 16:43:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1177', null, '用户登录', '2019-02-16 16:44:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1178', null, '用户登录', '2019-02-16 16:44:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1179', null, '用户登录', '2019-02-16 16:59:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1180', null, '用户登录', '2019-02-16 17:02:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1181', null, '用户登录', '2019-02-16 17:08:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1182', null, '修改需求：1', '2019-02-16 17:08:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1183', null, '修改需求：1', '2019-02-16 17:09:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1184', null, '用户登录', '2019-02-16 17:11:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1185', null, '用户登录', '2019-02-16 17:11:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1186', null, '用户登录', '2019-02-16 17:16:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1187', null, '删除需求：1', '2019-02-16 17:17:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1188', null, '删除需求：1', '2019-02-16 17:17:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1189', null, '用户登录', '2019-02-16 17:26:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1190', null, '修改需求：3', '2019-02-16 17:26:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1191', null, '用户登录', '2019-02-16 17:39:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1192', null, '用户登录', '2019-02-16 17:42:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1193', null, '用户登录', '2019-02-16 17:47:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1194', null, '用户登录', '2019-02-16 17:57:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1195', null, '用户登录', '2019-02-16 18:01:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1196', null, '用户登录', '2019-02-16 18:03:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1197', null, '用户登录', '2019-02-16 18:04:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1198', null, '用户登录', '2019-02-16 18:30:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1199', null, '用户登录', '2019-02-17 09:38:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1200', null, '用户登录', '2019-02-17 09:38:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1201', null, '用户登录', '2019-02-17 10:08:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1202', null, '用户登录', '2019-02-17 10:11:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1203', null, '用户登录', '2019-02-17 10:13:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1204', null, '用户登录', '2019-02-17 10:16:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1205', null, '用户登录', '2019-02-17 10:22:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1206', null, '用户登录', '2019-02-17 10:39:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1207', null, '用户登录', '2019-02-17 10:42:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1208', null, '用户登录', '2019-02-17 10:45:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1209', null, '用户登录', '2019-02-17 10:54:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1210', null, '用户登录', '2019-02-17 11:00:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1211', null, '用户登录', '2019-02-17 11:03:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1212', null, '用户登录', '2019-02-17 11:04:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1213', null, '用户登录', '2019-02-17 11:04:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1214', null, '用户登录', '2019-02-17 11:06:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1215', null, '用户登录', '2019-02-17 11:13:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1216', null, '用户登录', '2019-02-17 11:13:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1217', null, '用户登录', '2019-02-17 11:14:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1218', null, '用户登录', '2019-02-17 11:18:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1219', null, '用户登录', '2019-02-17 11:20:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1220', null, '用户登录', '2019-02-17 11:21:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1221', null, '用户登录', '2019-02-17 11:22:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1222', null, '用户登录', '2019-02-18 14:26:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1223', null, '用户登录', '2019-02-18 14:28:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1224', null, '用户登录', '2019-02-18 14:31:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1225', null, '用户登录', '2019-02-18 14:37:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1226', null, '用户登录', '2019-02-18 14:39:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1227', null, '用户登录', '2019-02-18 15:58:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1228', null, '用户登录', '2019-02-18 17:36:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1229', null, '用户登录', '2019-02-18 20:19:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1230', null, '用户登录', '2019-02-18 20:47:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1231', null, '用户登录', '2019-02-18 22:15:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1232', null, '用户登录', '2019-02-18 22:16:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1233', null, '用户登录', '2019-02-18 22:18:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1234', null, '用户登录', '2019-02-18 22:23:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1235', null, '用户登录', '2019-02-19 13:37:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1236', null, '用户登录', '2019-02-19 13:46:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1237', null, '用户登录', '2019-02-19 13:48:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1238', null, '用户登录', '2019-02-19 13:50:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1239', null, '用户登录', '2019-02-19 14:02:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1240', null, '用户登录', '2019-02-19 16:10:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1241', null, '用户登录', '2019-02-19 17:08:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1242', null, '用户登录', '2019-02-19 20:45:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1243', null, '用户登录', '2019-02-19 22:11:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1244', null, '用户登录', '2019-02-19 22:12:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1245', null, '用户登录', '2019-02-19 22:18:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1246', null, '用户登录', '2019-02-19 22:24:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1247', null, '用户登录', '2019-02-19 22:26:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1248', null, '用户登录', '2019-02-19 22:27:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1249', null, '任务分拣：11', '2019-02-19 22:28:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1250', null, '用户登录', '2019-02-19 22:38:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1251', null, '任务分拣：黔东南州网上信访信访系统-丹寨县县级系统', '2019-02-19 22:38:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1252', null, '用户登录', '2019-02-20 09:41:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1253', null, '用户登录', '2019-02-20 21:20:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1254', null, '用户登录', '2019-02-20 22:03:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1255', null, '用户登录', '2019-02-20 22:05:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1256', null, '用户登录', '2019-02-20 22:13:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1257', null, '用户登录', '2019-02-20 22:17:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1258', null, '用户登录', '2019-02-20 22:18:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1259', null, '用户登录', '2019-02-20 22:22:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1260', null, '任务分拣：达州：精简达州市各个县区写信网站的网址', '2019-02-20 22:23:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1261', null, '用户登录', '2019-02-20 22:24:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1262', null, '用户登录', '2019-02-20 22:24:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1263', null, '用户登录', '2019-02-20 22:58:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1264', null, '用户登录', '2019-02-20 22:58:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1265', null, '用户登录', '2019-02-20 22:59:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1266', null, '用户登录', '2019-02-20 23:00:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1267', null, '用户登录', '2019-02-20 23:06:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1268', null, '用户登录', '2019-02-20 23:12:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1269', null, '用户登录', '2019-02-21 19:13:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1270', null, '用户登录', '2019-02-21 20:22:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1271', null, '用户登录', '2019-02-21 20:28:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1272', null, '用户登录', '2019-02-21 20:29:16', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1273', null, '用户登录', '2019-02-21 20:29:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1274', null, '用户登录', '2019-02-21 20:35:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1275', null, '用户登录', '2019-02-21 20:39:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1276', null, '用户登录', '2019-02-21 20:41:30', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1277', null, '用户登录', '2019-02-21 20:47:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1278', null, '用户登录', '2019-02-21 22:20:35', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1279', null, '用户登录', '2019-02-21 22:41:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1280', null, '用户登录', '2019-02-21 22:41:54', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1281', null, '用户登录', '2019-02-22 20:21:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1282', null, '用户登录', '2019-02-22 20:22:09', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1283', null, '用户登录', '2019-02-22 21:35:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1284', null, '用户登录', '2019-02-22 21:37:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1285', null, '用户登录', '2019-02-22 21:56:31', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1286', null, '用户登录', '2019-02-22 21:59:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1287', null, '用户登录', '2019-02-22 21:59:37', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1288', null, '用户登录', '2019-02-22 22:05:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1289', null, '用户登录', '2019-02-22 22:05:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1290', null, '用户登录', '2019-02-22 22:05:41', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1291', null, '用户登录', '2019-02-23 09:40:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1292', null, '用户登录', '2019-02-23 09:40:37', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1293', null, '用户登录', '2019-02-23 09:45:14', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1294', null, '用户登录', '2019-02-23 09:48:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1295', null, '用户登录', '2019-02-23 09:48:43', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1296', null, '用户登录', '2019-02-23 10:02:44', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1297', null, '用户登录', '2019-02-23 10:04:26', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1298', null, '用户登录', '2019-02-23 10:06:54', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1299', null, '用户登录', '2019-02-23 10:26:13', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1300', null, '用户登录', '2019-02-23 10:30:03', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1301', null, '用户登录', '2019-02-23 11:26:58', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1302', null, '用户登录', '2019-02-23 11:28:27', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1303', null, '用户登录', '2019-02-23 11:30:11', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1304', null, '用户登录', '2019-02-23 11:34:30', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1305', null, '用户登录', '2019-02-23 14:40:28', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1306', null, '用户登录', '2019-02-23 14:41:22', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1307', null, '用户登录', '2019-02-23 14:48:08', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1308', null, '用户登录', '2019-02-23 14:52:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1309', null, '用户登录', '2019-02-23 14:52:33', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1310', null, '用户登录', '2019-02-23 14:56:22', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1311', null, '用户登录', '2019-02-23 15:02:52', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1312', null, '用户登录', '2019-02-23 15:06:20', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1313', null, '用户登录', '2019-02-23 15:14:11', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1314', null, '用户登录', '2019-02-23 15:21:16', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1315', null, '用户登录', '2019-02-23 15:25:15', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1316', null, '用户登录', '2019-02-23 15:43:25', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1317', null, '用户登录', '2019-02-23 15:47:05', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1318', null, '任务完成：5', '2019-02-23 15:47:42', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1319', null, '用户登录', '2019-02-23 15:53:35', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1320', null, '任务完成：4', '2019-02-23 15:54:10', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1321', null, '用户登录', '2019-02-23 15:57:29', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1322', null, '用户登录', '2019-02-23 15:57:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1323', null, '任务分拣：cesceshceshi测试', '2019-02-23 15:58:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1324', null, '用户登录', '2019-02-23 15:58:35', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1325', null, '任务完成：7', '2019-02-23 16:00:09', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1326', null, '用户登录', '2019-02-23 16:00:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1327', null, '任务分拣：cesceshceshi测试', '2019-02-23 16:00:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1328', null, '用户登录', '2019-02-23 16:00:49', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1329', null, '任务完成：8', '2019-02-23 16:01:14', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1330', null, '用户登录', '2019-02-23 16:01:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1331', null, '用户登录', '2019-02-23 16:28:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1332', null, '用户登录', '2019-02-23 16:36:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1333', null, '用户登录', '2019-02-23 16:39:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1334', null, '新增需求：guiz贵州fuffuc付出', '2019-02-23 16:41:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1335', null, '修改需求：4', '2019-02-23 16:41:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1336', null, '用户登录', '2019-02-23 16:49:55', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1337', null, '用户登录', '2019-02-23 22:32:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1338', null, '用户登录', '2019-02-23 22:33:15', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1339', null, '用户登录', '2019-02-23 22:33:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1340', null, '任务分拣：shjsdhadnskn', '2019-02-23 22:33:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1341', null, '用户登录', '2019-02-23 22:33:55', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1342', null, '用户登录', '2019-02-24 10:54:23', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1343', null, '用户登录', '2019-02-24 10:55:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1344', null, '用户登录', '2019-02-24 10:55:56', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1345', null, '用户登录', '2019-02-24 12:17:33', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1346', null, '用户登录', '2019-02-24 12:18:06', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1347', null, '用户登录', '2019-02-24 12:19:21', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1348', null, '用户登录', '2019-02-24 12:20:16', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1349', null, '用户登录', '2019-02-24 12:21:56', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1350', null, '用户登录', '2019-02-24 12:24:55', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1351', null, '用户登录', '2019-02-24 12:29:16', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1352', null, '用户登录', '2019-02-24 12:30:35', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1353', null, '用户登录', '2019-02-24 12:31:42', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1354', null, '用户登录', '2019-02-24 12:35:25', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1355', null, '用户登录', '2019-02-24 12:36:36', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1356', null, '用户登录', '2019-02-24 12:36:56', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1357', null, '用户登录', '2019-02-24 14:21:02', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1358', null, '用户登录', '2019-02-24 16:18:32', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1359', null, '用户登录', '2019-02-24 16:24:22', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1360', null, '用户登录', '2019-02-24 16:27:34', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1361', null, '用户登录', '2019-02-24 16:41:28', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1362', null, '用户登录', '2019-02-24 16:45:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1363', null, '用户登录', '2019-02-24 17:11:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1364', null, '用户登录', '2019-02-24 17:16:03', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1365', null, '用户登录', '2019-02-24 17:16:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1366', null, '用户登录', '2019-02-24 17:25:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1367', null, '用户登录', '2019-02-24 17:36:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1368', null, '用户登录', '2019-02-24 17:40:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1369', null, '用户登录', '2019-02-24 17:41:18', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1370', null, '用户登录', '2019-02-24 17:46:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1371', null, '用户登录', '2019-02-24 17:46:38', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1372', null, '用户登录', '2019-02-24 18:10:16', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1373', null, '用户登录', '2019-02-24 18:10:32', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1374', null, '用户登录', '2019-02-24 18:12:33', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1375', null, '用户登录', '2019-02-24 18:13:39', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1376', null, '用户登录', '2019-02-24 18:14:35', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1377', null, '用户登录', '2019-02-24 18:20:23', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1378', null, '用户登录', '2019-02-24 18:21:31', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1379', null, '修改任务完成：10', '2019-02-24 18:21:55', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1380', null, '用户登录', '2019-02-24 18:23:41', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1381', null, '修改任务完成：10', '2019-02-24 18:24:01', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1382', null, '用户登录', '2019-02-24 18:28:47', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1383', null, '修改任务完成：10', '2019-02-24 18:29:12', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1384', null, '用户登录', '2019-02-24 18:31:18', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1385', null, '修改任务完成：10', '2019-02-24 18:32:25', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1386', null, '修改任务完成：10', '2019-02-24 18:33:04', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1387', null, '用户登录', '2019-02-24 18:36:24', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1388', null, '用户登录', '2019-02-24 18:39:39', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1389', null, '用户登录', '2019-02-24 18:41:19', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1390', null, '用户登录', '2019-02-24 18:43:48', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1391', null, '修改任务完成：10', '2019-02-24 18:45:43', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1392', null, '用户登录', '2019-02-24 18:50:15', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1393', null, '修改任务完成：10', '2019-02-24 18:50:28', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1394', null, '用户登录', '2019-02-24 18:51:42', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1395', null, '修改任务完成：10', '2019-02-24 18:53:38', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1396', null, '用户登录', '2019-02-24 18:59:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1397', null, '用户登录', '2019-02-24 18:59:45', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1398', null, '修改任务完成：10', '2019-02-24 18:59:56', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1399', null, '用户登录', '2019-02-24 19:00:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1400', null, '用户登录', '2019-02-24 19:40:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1401', null, '用户登录', '2019-02-24 19:40:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1402', null, '用户登录', '2019-02-24 19:55:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1403', null, '用户登录', '2019-02-24 19:58:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1404', null, '修改指派任务：null', '2019-02-24 19:58:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1405', null, '修改指派任务：null', '2019-02-24 20:00:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1406', null, '用户登录', '2019-02-24 20:01:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1407', null, '修改指派任务：null', '2019-02-24 20:02:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1408', null, '用户登录', '2019-02-24 20:02:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1409', null, '修改指派任务：5', '2019-02-24 20:03:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1410', null, '删除任务：9', '2019-02-24 20:03:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1411', null, '用户登录', '2019-02-24 21:05:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1412', null, '用户登录', '2019-02-24 21:33:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1413', null, '用户登录', '2019-02-25 17:31:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1414', null, '用户登录', '2019-02-25 17:32:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1415', null, '用户登录', '2019-02-25 20:56:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1416', null, '用户登录', '2019-02-25 21:02:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1417', null, '用户登录', '2019-02-25 21:11:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1418', null, '用户登录', '2019-02-25 21:38:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1419', null, '用户登录', '2019-02-25 21:43:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1420', null, '用户登录', '2019-02-25 22:56:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1421', null, '用户登录', '2019-02-25 23:03:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1422', null, '用户登录', '2019-02-25 23:17:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1423', null, '用户登录', '2019-02-27 10:09:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1424', null, '用户登录', '2019-02-27 10:25:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1425', null, '用户登录', '2019-02-27 10:26:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1426', null, '用户登录', '2019-02-27 10:27:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1427', null, '用户登录', '2019-02-27 11:10:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1428', null, '用户登录', '2019-02-27 11:21:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1429', null, '用户登录', '2019-02-27 11:29:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1430', null, '用户登录', '2019-02-27 17:44:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1431', null, '用户登录', '2019-02-27 18:08:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1432', null, '用户登录', '2019-02-27 18:09:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1433', null, '用户登录', '2019-02-27 18:09:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1434', null, '用户登录', '2019-02-27 18:15:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1435', null, '用户登录', '2019-02-27 18:17:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1436', null, '用户登录', '2019-02-27 18:18:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1437', null, '用户登录', '2019-02-27 18:55:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1438', null, '新增需求：cesceshceshi测试biabiaot标题', '2019-02-27 18:56:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1439', null, '用户登录', '2019-02-27 18:56:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1440', null, '用户登录', '2019-02-27 18:58:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1441', null, '用户登录', '2019-02-27 19:02:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1442', null, '用户登录', '2019-02-27 19:08:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1443', null, '用户登录', '2019-02-27 19:08:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1444', null, '用户登录', '2019-02-27 19:11:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1445', null, '用户登录', '2019-02-27 19:16:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1446', null, '用户登录', '2019-02-27 19:18:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1447', null, '用户登录', '2019-02-27 19:19:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1448', null, '用户登录', '2019-02-27 19:21:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1449', null, '用户登录', '2019-02-27 19:23:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1450', null, '用户登录', '2019-02-27 21:21:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1451', null, '用户登录', '2019-02-27 21:38:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1452', null, '用户登录', '2019-02-27 21:38:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1453', null, '用户登录', '2019-02-27 21:41:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1454', null, '用户登录', '2019-02-27 21:42:33', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1455', null, '用户登录', '2019-02-27 22:35:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1456', null, '新增用例：ceshceshi测试', '2019-02-27 22:36:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1457', null, '用户登录', '2019-02-27 22:40:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1458', null, '新增用例：shidhiao', '2019-02-27 22:41:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1459', null, '用户登录', '2019-02-28 14:32:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1460', null, '用户登录', '2019-02-28 15:55:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1461', null, '用户登录', '2019-02-28 16:56:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1462', null, '用户登录', '2019-02-28 16:59:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1463', null, '用户登录', '2019-02-28 17:05:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1464', null, '用户登录', '2019-02-28 17:06:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1465', null, '用户登录', '2019-02-28 17:08:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1466', null, '用户登录', '2019-02-28 17:49:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1467', null, '用户登录', '2019-02-28 17:50:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1468', null, '用户登录', '2019-02-28 17:51:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1469', null, '用户登录', '2019-02-28 22:23:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1470', null, '用户登录', '2019-02-28 23:10:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1471', null, '用户登录', '2019-02-28 23:13:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1472', null, '用户登录', '2019-02-28 23:18:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1473', null, '用户登录', '2019-02-28 23:23:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1474', null, '用户登录', '2019-02-28 23:40:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1475', null, '用户登录', '2019-02-28 23:45:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1476', null, '用户登录', '2019-02-28 23:59:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1477', null, '用户登录', '2019-03-01 00:06:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1478', null, '用户登录', '2019-03-01 00:11:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1479', null, '用户登录', '2019-03-01 00:12:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1480', null, '用户登录', '2019-03-01 00:12:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1481', null, '用户登录', '2019-03-01 00:14:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1482', null, '用户登录', '2019-03-01 00:17:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1483', null, '用户登录', '2019-03-01 00:18:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1484', null, '修改用例：null', '2019-03-01 00:19:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1485', null, '用户登录', '2019-03-01 00:23:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1486', null, '修改用例：null', '2019-03-01 00:25:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1487', null, '用户登录', '2019-03-01 00:26:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1488', null, '修改用例：null', '2019-03-01 00:27:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1489', null, '用户登录', '2019-03-01 00:27:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1490', null, '用户登录', '2019-03-01 00:29:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1491', null, '修改用例：11', '2019-03-01 00:29:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1492', null, '修改用例：11', '2019-03-01 00:30:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1493', null, '用户登录', '2019-03-01 00:31:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1494', null, '修改用例：11', '2019-03-01 00:31:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1495', null, '修改用例：11', '2019-03-01 00:34:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1496', null, '修改用例：11', '2019-03-01 00:34:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1497', null, '用户登录', '2019-03-01 00:35:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1498', null, '修改用例：11', '2019-03-01 00:35:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1499', null, '用户登录', '2019-03-01 00:36:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1500', null, '用户登录', '2019-03-01 00:38:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1501', null, '用户登录', '2019-03-01 00:39:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1502', null, '新增用例：1212', '2019-03-01 00:40:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1503', null, '用户登录', '2019-03-01 00:43:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1504', null, '新增用例：112', '2019-03-01 00:43:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1505', null, '用户登录', '2019-03-01 00:43:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1506', null, '用户登录', '2019-03-01 00:44:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1507', null, '修改用例：12', '2019-03-01 00:44:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1508', null, '删除用例：13', '2019-03-01 00:45:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1509', null, '用户登录', '2019-03-01 17:26:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1510', null, '用户登录', '2019-03-01 17:45:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1511', null, '用户登录', '2019-03-01 19:19:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1512', null, '用户登录', '2019-03-01 19:19:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1513', null, '用户登录', '2019-03-01 21:26:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1514', null, '用户登录', '2019-03-01 21:38:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1515', null, '用户登录', '2019-03-01 21:44:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1516', null, '用户登录', '2019-03-01 21:47:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1517', null, '用户登录', '2019-03-01 21:52:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1518', null, '用户登录', '2019-03-01 22:14:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1519', null, '用户登录', '2019-03-01 22:22:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1520', null, '用户登录', '2019-03-01 22:25:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1521', null, '用户登录', '2019-03-01 23:34:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1522', null, '用户登录', '2019-03-01 23:35:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1523', null, '新增bug：测试标题', '2019-03-01 23:36:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1524', null, '用户登录', '2019-03-01 23:37:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1525', null, '用户登录', '2019-03-01 23:40:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1526', null, '用户登录', '2019-03-01 23:40:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1527', null, '用户登录', '2019-03-01 23:41:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1528', null, '新增bug：是啊混合双打', '2019-03-01 23:42:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1529', null, '用户登录', '2019-03-02 08:43:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1530', null, '用户登录', '2019-03-02 14:44:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1531', null, '用户登录', '2019-03-02 14:51:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1532', null, '用户登录', '2019-03-02 14:59:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1533', null, '用户登录', '2019-03-02 15:54:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1534', null, '用户登录', '2019-03-02 16:18:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1535', null, '用户登录', '2019-03-02 16:19:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1536', null, '用户登录', '2019-03-02 16:20:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1537', null, '用户登录', '2019-03-02 16:30:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1538', null, '用户登录', '2019-03-02 16:35:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1539', null, '用户登录', '2019-03-02 16:44:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1540', null, '用户登录', '2019-03-02 16:49:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1541', null, '用户登录', '2019-03-02 16:53:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1542', null, '用户登录', '2019-03-02 16:56:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1543', null, '用户登录', '2019-03-02 17:12:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1544', null, '用户登录', '2019-03-02 17:16:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1545', null, '用户登录', '2019-03-02 17:19:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1546', null, '用户登录', '2019-03-02 17:20:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1547', null, '用户登录', '2019-03-02 17:22:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1548', null, '用户登录', '2019-03-02 18:51:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1549', null, '用户登录', '2019-03-02 19:05:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1550', null, '用户登录', '2019-03-02 19:10:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1551', null, '用户登录', '2019-03-02 19:13:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1552', null, '用户登录', '2019-03-02 19:39:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1553', null, '用户登录', '2019-03-02 19:42:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1554', null, '新增bug：测试转送办理流程', '2019-03-02 19:42:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1555', null, '用户登录', '2019-03-02 19:46:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1556', null, '用户登录', '2019-03-02 19:47:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1557', null, '新增bug：csasasd', '2019-03-02 19:47:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1558', null, '用户登录', '2019-03-02 20:10:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1559', null, '用户登录', '2019-03-02 20:24:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1560', null, '用户登录', '2019-03-02 20:26:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1561', null, '用户登录', '2019-03-02 20:27:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1562', null, '修改bug：13', '2019-03-02 20:35:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1563', null, '删除bug：13', '2019-03-02 20:38:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1564', null, '用户登录', '2019-03-02 21:01:01', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1565', null, '用户登录', '2019-03-03 11:12:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1566', null, '用户登录', '2019-03-03 11:35:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1567', null, '用户登录', '2019-03-03 13:16:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1568', null, '用户登录', '2019-03-03 13:34:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1569', null, '申请完成bug：12', '2019-03-03 13:34:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1570', null, '用户登录', '2019-03-03 15:35:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1571', null, '用户登录', '2019-03-03 15:38:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1572', null, '审核bug(未解决)：12', '2019-03-03 15:38:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1573', null, '用户登录', '2019-03-03 15:42:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1574', null, '审核bug(未解决)：12', '2019-03-03 15:42:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1575', null, '申请完成bug：10', '2019-03-03 15:42:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1576', null, '审核bug：10', '2019-03-03 15:42:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1577', null, '用户登录', '2019-03-03 16:15:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1578', null, '用户登录', '2019-03-03 16:26:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1579', null, '用户登录', '2019-03-03 16:27:05', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1580', null, '用户登录', '2019-03-03 16:28:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1581', null, '申请完成bug：13', '2019-03-03 16:36:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1582', null, '用户登录', '2019-03-03 17:00:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1583', null, '用户登录', '2019-03-03 17:00:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1584', null, '用户登录', '2019-03-03 17:03:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1585', null, '完成测试：3', '2019-03-03 17:03:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1586', null, '用户登录', '2019-03-03 17:10:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1587', null, '用户登录', '2019-03-03 19:52:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1588', null, '用户登录', '2019-03-03 21:24:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1589', null, '用户登录', '2019-03-03 21:27:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1590', null, '用户登录', '2019-03-03 21:28:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1591', null, '用户登录', '2019-03-03 21:29:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1592', null, '用户登录', '2019-03-03 21:33:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1593', null, '用户登录', '2019-03-03 21:34:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1594', null, '用户登录', '2019-03-03 21:36:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1595', null, '用户登录', '2019-03-03 21:38:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1596', null, '用户登录', '2019-03-03 21:39:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1597', null, '用户登录', '2019-03-03 21:47:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1598', null, '用户登录', '2019-03-03 21:48:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1599', null, '用户登录', '2019-03-03 21:52:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1600', null, '用户登录', '2019-03-03 22:40:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1601', null, '新增需求：测试标题', '2019-03-03 22:40:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1602', null, '用户登录', '2019-03-03 22:42:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1603', null, '新增需求：测试标题2', '2019-03-03 22:42:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1604', null, '用户登录', '2019-03-03 22:45:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1605', null, '用户登录', '2019-03-03 22:45:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1606', null, '用户登录', '2019-03-03 22:46:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1607', null, '新增需求：吃啥子', '2019-03-03 22:47:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1608', null, '用户登录', '2019-03-03 23:31:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1609', null, '用户登录', '2019-03-03 23:34:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1610', null, '用户登录', '2019-03-03 23:35:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1611', null, '用户登录', '2019-03-03 23:36:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1612', null, '用户登录', '2019-03-03 23:38:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1613', null, '修改需求：8', '2019-03-03 23:38:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1614', null, '用户登录', '2019-03-03 23:57:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1615', null, '用户登录', '2019-03-04 00:00:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1616', null, '新增bug：测试bug', '2019-03-04 00:00:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1617', null, '用户登录', '2019-03-04 00:01:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1618', null, '用户登录', '2019-03-04 00:03:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1619', null, '用户登录', '2019-03-04 00:05:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1620', null, '用户登录', '2019-03-04 00:06:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1621', null, '用户登录', '2019-03-04 00:08:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1622', null, '修改bug：14', '2019-03-04 00:08:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1623', null, '修改bug：14', '2019-03-04 00:08:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1624', null, '修改bug：14', '2019-03-04 00:08:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1625', null, '用户登录', '2019-03-04 19:37:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1626', null, '用户登录', '2019-03-04 20:04:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1627', null, '用户登录', '2019-03-04 22:24:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1628', null, '用户登录', '2019-03-04 22:32:53', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1629', null, '用户登录', '2019-03-04 22:33:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1630', null, '用户登录', '2019-03-04 22:33:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1631', null, '用户登录', '2019-03-04 22:35:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1632', null, '用户登录', '2019-03-04 22:41:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1633', null, '用户登录', '2019-03-04 22:46:55', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1634', null, '用户登录', '2019-03-04 22:47:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1635', null, '用户登录', '2019-03-04 22:47:23', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1636', null, '申请完成bug：14', '2019-03-04 22:47:28', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1637', null, '用户登录', '2019-03-04 22:47:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1638', null, '审核bug：14', '2019-03-04 22:48:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1639', null, '审核bug：13', '2019-03-04 22:48:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1640', null, '用户登录', '2019-03-04 22:55:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1641', null, '任务分拣：无锡办信处报表错误bug', '2019-03-04 23:00:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1642', null, '用户登录', '2019-03-04 23:01:03', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1643', null, '任务完成：10', '2019-03-04 23:01:30', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1644', null, '用户登录', '2019-03-04 23:01:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1645', null, '用户登录', '2019-03-04 23:03:08', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1646', null, '用户登录', '2019-03-04 23:05:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1647', null, '完成测试：8', '2019-03-04 23:08:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1648', null, '用户登录', '2019-03-04 23:20:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1649', null, '用户登录', '2019-03-04 23:20:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1650', null, '用户登录', '2019-03-04 23:25:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1651', null, '用户登录', '2019-03-06 18:25:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1652', null, '用户登录', '2019-03-06 18:41:24', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1653', null, '用户登录', '2019-03-06 19:33:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1654', null, '用户登录', '2019-03-06 19:33:39', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1655', null, '用户登录', '2019-03-06 19:36:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1656', null, '用户登录', '2019-03-06 19:38:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1657', null, '用户登录', '2019-03-06 19:38:50', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1658', null, '用户登录', '2019-03-06 20:25:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1659', null, '用户登录', '2019-03-06 20:26:17', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1660', null, '申请完成bug：12', '2019-03-06 20:27:23', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1661', null, '用户登录', '2019-03-06 20:42:46', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1662', null, '用户登录', '2019-03-06 20:47:11', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1663', null, '申请完成bug：null', '2019-03-06 20:47:28', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1664', null, '用户登录', '2019-03-06 20:52:03', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1665', null, '申请完成bug：null', '2019-03-06 20:52:22', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1666', null, '用户登录', '2019-03-06 20:54:52', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1667', null, '用户登录', '2019-03-06 20:55:05', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1668', null, '申请完成bug：null', '2019-03-06 20:55:23', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1669', null, '用户登录', '2019-03-06 20:56:20', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1670', null, '用户登录', '2019-03-06 20:57:53', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1671', null, '申请完成bug：11', '2019-03-06 20:58:04', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1672', null, '用户登录', '2019-03-06 21:10:40', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1673', null, '用户登录', '2019-03-06 21:11:25', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1674', null, '用户登录', '2019-03-06 21:12:09', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1675', null, '修改任务完成：11', '2019-03-06 21:13:08', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1676', null, '修改任务完成：11', '2019-03-06 21:15:38', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1677', null, '用户登录', '2019-03-06 21:16:23', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1678', null, '申请完成bug：11', '2019-03-06 21:16:36', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1679', null, '用户登录', '2019-03-06 21:22:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1680', null, '审核bug：12', '2019-03-06 21:23:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1681', null, '审核bug：11', '2019-03-06 21:24:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1682', null, '用户登录', '2019-03-06 22:22:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1683', null, '用户登录', '2019-03-06 22:22:35', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1684', null, '用户登录', '2019-03-06 22:23:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1685', null, '用户登录', '2019-03-06 22:24:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1686', null, '用户登录', '2019-03-06 22:28:16', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1687', null, '用户登录', '2019-03-06 22:33:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1688', null, '用户登录', '2019-03-06 22:42:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1689', null, '用户登录', '2019-03-06 22:43:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1690', null, '用户登录', '2019-03-06 22:43:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1691', null, '用户登录', '2019-03-06 22:50:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1692', null, '用户登录', '2019-03-06 23:20:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1693', null, '用户登录', '2019-03-06 23:21:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1694', null, '用户登录', '2019-03-06 23:22:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1695', null, '用户登录', '2019-03-06 23:22:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1696', null, '用户登录', '2019-03-06 23:23:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1697', null, '用户登录', '2019-03-06 23:24:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1698', null, '用户登录', '2019-03-06 23:24:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1699', null, '用户登录', '2019-03-06 23:25:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1700', null, '用户登录', '2019-03-06 23:26:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1701', null, '用户登录', '2019-03-06 23:29:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1702', null, '用户登录', '2019-03-07 00:07:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1703', null, '用户登录', '2019-03-07 00:10:22', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1704', null, '用户登录', '2019-03-07 00:13:21', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1705', null, '用户登录', '2019-03-07 00:14:57', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1706', null, '用户登录', '2019-03-07 00:17:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1707', null, '用户登录', '2019-03-07 00:18:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1708', null, '用户登录', '2019-03-07 00:20:04', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1709', null, '用户登录', '2019-03-07 00:23:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1710', null, '用户登录', '2019-03-07 00:59:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1711', null, '用户登录', '2019-03-07 19:34:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1712', null, '用户登录', '2019-03-07 19:38:26', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1713', null, '用户登录', '2019-03-07 19:39:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1714', null, '代码发布', '2019-03-07 19:40:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1715', null, '用户登录', '2019-03-07 19:55:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1716', null, '用户登录', '2019-03-07 19:57:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1717', null, '代码发布', '2019-03-07 19:57:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1718', null, '用户登录', '2019-03-07 19:58:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1719', null, '代码发布', '2019-03-07 19:58:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1720', null, '用户登录', '2019-03-07 20:02:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1721', null, '代码发布', '2019-03-07 20:03:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1722', null, '用户登录', '2019-03-07 20:05:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1723', null, '用户登录', '2019-03-07 20:07:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1724', null, '代码发布', '2019-03-07 20:07:52', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1725', null, '代码发布', '2019-03-07 20:08:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1726', null, '用户登录', '2019-03-07 21:34:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1727', null, '用户登录', '2019-03-07 21:38:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1728', null, '用户登录', '2019-03-07 21:39:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1729', null, '用户登录', '2019-03-07 21:49:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1730', null, '用户登录', '2019-03-07 21:58:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1731', null, '用户登录', '2019-03-07 21:59:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1732', null, '用户登录', '2019-03-07 22:01:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1733', null, '用户登录', '2019-03-07 22:05:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1734', null, '用户登录', '2019-03-07 22:29:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1735', null, '用户登录', '2019-03-07 22:32:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1736', null, '用户登录', '2019-03-07 22:42:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1737', null, '代码发布', '2019-03-07 22:42:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1738', null, '用户登录', '2019-03-07 22:47:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1739', null, '用户登录', '2019-03-07 22:49:41', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1740', null, '用户登录', '2019-03-07 22:52:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1741', null, '用户登录', '2019-03-07 22:52:43', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1742', null, '用户登录', '2019-03-07 23:50:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1743', null, '用户登录', '2019-03-07 23:53:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1744', null, '用户登录', '2019-03-08 08:59:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1745', null, '用户登录', '2019-03-08 08:59:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1746', null, '用户登录', '2019-03-08 19:34:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1747', null, '用户登录', '2019-03-08 20:50:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1748', null, '用户登录', '2019-03-08 20:51:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1749', null, '新增项目：退役军人', '2019-03-08 20:52:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1750', null, '用户登录', '2019-03-08 20:56:27', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1751', null, '修改项目：退役军人1', '2019-03-08 20:56:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1752', null, '禁用项目：2', '2019-03-08 20:56:42', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1753', null, '修改项目：退役军人', '2019-03-08 20:56:50', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1754', null, '用户登录', '2019-03-08 21:13:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1755', null, '新增来源：南京市', '2019-03-08 21:13:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1756', null, '修改来源：南京市1', '2019-03-08 21:14:20', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1757', null, '修改来源：南京市', '2019-03-08 21:14:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1758', null, '禁用来源：4', '2019-03-08 21:14:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1759', null, '修改来源：南京市', '2019-03-08 21:14:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1760', null, '用户登录', '2019-03-09 08:51:08', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1761', null, '用户登录', '2019-03-09 09:43:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1762', null, '用户登录', '2019-03-09 09:43:32', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1763', null, '新增模块：退休安置', '2019-03-09 09:44:03', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1764', null, '用户登录', '2019-03-09 09:48:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1765', null, '修改模块：退休安置1', '2019-03-09 09:49:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1766', null, '修改模块：退休安置', '2019-03-09 09:49:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1767', null, '禁用模块：6', '2019-03-09 09:49:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1768', null, '修改模块：退休安置', '2019-03-09 09:49:47', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1769', null, '用户登录', '2019-03-09 10:11:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1770', null, '用户登录', '2019-03-09 10:11:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1771', null, '新增客户：烟台市', '2019-03-09 10:11:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1772', null, '修改客户：烟台市1', '2019-03-09 10:11:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1773', null, '修改客户：烟台市', '2019-03-09 10:11:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1774', null, '禁用客户：4', '2019-03-09 10:11:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1775', null, '修改客户：烟台市', '2019-03-09 10:11:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1776', null, '用户登录', '2019-03-09 10:15:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1777', null, '新增需求：测试', '2019-03-09 10:18:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1778', null, '用户登录', '2019-03-09 10:24:09', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1779', null, '新增bug：测试Bug', '2019-03-09 10:26:51', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1780', null, '用户登录', '2019-03-09 10:36:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1781', null, '修改用户密码：超级管理员', '2019-03-09 10:43:45', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1782', null, '用户登录', '2019-03-09 10:47:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1783', null, '用户登录', '2019-03-09 10:59:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1784', null, '用户登录', '2019-03-09 11:00:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1785', null, '用户登录', '2019-03-09 11:06:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1786', null, '用户登录', '2019-03-09 14:18:14', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1787', null, '用户登录', '2019-03-09 15:26:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1788', null, '用户登录', '2019-03-09 15:26:12', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1789', null, '用户登录', '2019-03-09 15:35:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1790', null, '用户登录', '2019-03-09 15:42:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1791', null, '用户登录', '2019-03-09 15:48:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1792', null, '用户登录', '2019-03-09 16:12:10', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1793', null, '新增来源：市场', '2019-03-09 16:13:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1794', null, '新增来源：运维', '2019-03-09 16:13:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1795', null, '新增来源：测试', '2019-03-09 16:13:18', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1796', null, '新增来源：李总', '2019-03-09 16:13:25', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1797', null, '用户登录', '2019-03-09 16:17:34', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1798', null, '用户登录', '2019-03-09 16:19:48', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1799', null, '用户登录', '2019-03-09 16:42:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1800', null, '用户登录', '2019-03-09 16:48:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1801', null, '用户登录', '2019-03-09 16:51:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1802', null, '用户登录', '2019-03-09 16:55:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1803', null, '用户登录', '2019-03-09 16:56:04', '13', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1804', null, '用户登录', '2019-03-09 16:56:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1805', null, '用户登录', '2019-03-09 17:09:36', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1806', null, '新增用户：王建邦', '2019-03-09 17:11:29', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1807', null, '用户登录', '2019-03-09 17:18:23', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1808', null, '修改用户：王建邦', '2019-03-09 17:18:40', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1809', null, '修改用户：王建邦', '2019-03-09 17:18:46', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1810', null, '用户登录', '2019-03-09 18:18:17', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1811', null, '新增用户：李龙', '2019-03-09 18:19:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1812', null, '修改用户：李龙', '2019-03-09 18:19:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1813', null, '修改用户：李龙', '2019-03-09 18:19:11', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1814', null, '用户登录', '2019-03-09 18:21:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1815', null, '用户登录', '2019-03-09 19:31:07', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1816', null, '修改用户：超级管理员', '2019-03-09 19:31:59', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1817', null, '修改用户：张晓月', '2019-03-09 19:32:13', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1818', null, '修改用户：潘海刚', '2019-03-09 19:32:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1819', null, '新增用户：岳红玲', '2019-03-09 19:32:56', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1820', null, '新增用户：徐静', '2019-03-09 19:33:19', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1821', null, '新增需求：江苏省网上信访问题', '2019-03-09 19:33:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1822', null, '任务分拣：测试任务', '2019-03-09 19:35:05', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1823', null, '用户登录', '2019-03-09 20:14:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1824', null, '用户登录', '2019-03-11 11:46:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1825', null, '用户登录', '2019-03-11 12:11:00', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1826', null, '用户登录', '2019-03-14 11:03:30', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1827', null, '修改组织：统计', '2019-03-14 17:25:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1828', null, '修改组织：运维', '2019-03-14 17:25:37', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1829', null, '新增组织：测试', '2019-03-14 17:25:44', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1830', null, '修改组织：统计部', '2019-03-14 17:25:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1831', null, '修改组织：运维部', '2019-03-14 17:25:54', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1832', null, '修改组织：测试部', '2019-03-14 17:25:58', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1833', null, '新增组织：管理层', '2019-03-14 17:29:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1834', null, '新增组织：市场部', '2019-03-14 17:29:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1835', null, '新增组织：综合部', '2019-03-14 17:31:28', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1836', null, '用户登录', '2019-03-18 20:28:39', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1837', null, '用户登录', '2019-03-18 21:41:06', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1838', null, '修改角色：测试', '2019-03-18 21:41:24', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1839', null, '新增角色：统计', '2019-03-18 21:41:31', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1840', null, '新增角色：管理', '2019-03-18 21:41:49', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1841', null, '新增角色：市场', '2019-03-18 21:41:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1842', null, '新增角色：综合', '2019-03-18 21:42:02', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1843', null, '新增角色：项目经理', '2019-03-18 21:47:38', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1844', null, '用户登录', '2019-03-18 21:52:20', '37', '王建邦');
INSERT INTO `sys_optlog` VALUES ('1845', null, '用户登录', '2019-03-18 21:52:44', '50', '徐静');
INSERT INTO `sys_optlog` VALUES ('1846', null, '用户登录', '2019-03-18 21:53:15', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1847', null, '用户登录', '2019-03-18 21:53:46', '46', '唐健');
INSERT INTO `sys_optlog` VALUES ('1848', null, '用户登录', '2019-03-18 21:54:33', '60', '张雪影');
INSERT INTO `sys_optlog` VALUES ('1849', null, '用户登录', '2019-03-18 21:56:09', '60', '张雪影');
INSERT INTO `sys_optlog` VALUES ('1850', null, '用户登录', '2019-03-18 21:56:18', '19', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1851', null, '新增项目：人大政协', '2019-03-18 21:56:39', '19', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1852', null, '新增项目：领导包案', '2019-03-18 21:56:58', '19', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1853', null, '新增项目：信访人征信', '2019-03-18 21:57:23', '19', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1854', null, '新增项目：透明食药监', '2019-03-18 21:58:07', '19', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1855', null, '新增项目：明远项目', '2019-03-18 21:58:20', '19', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1856', null, '新增项目：人力资源', '2019-03-18 21:58:27', '19', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1857', null, '用户登录', '2019-03-18 22:00:03', '60', '张雪影');
INSERT INTO `sys_optlog` VALUES ('1858', null, '用户登录', '2019-03-19 10:40:55', '1', '超级管理员');
INSERT INTO `sys_optlog` VALUES ('1859', null, '用户登录', '2019-03-19 10:50:22', '19', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1860', null, '任务分拣：测试', '2019-03-19 10:54:33', '19', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1861', null, '任务分拣：测试111', '2019-03-19 10:55:39', '19', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1862', null, '用户登录', '2019-03-19 10:55:56', '26', '潘海刚');
INSERT INTO `sys_optlog` VALUES ('1863', null, '任务完成：12', '2019-03-19 10:56:13', '26', '潘海刚');
INSERT INTO `sys_optlog` VALUES ('1864', null, '用户登录', '2019-03-19 10:56:30', '50', '徐静');
INSERT INTO `sys_optlog` VALUES ('1865', null, '用户登录', '2019-03-19 10:56:45', '32', '佟鹏');
INSERT INTO `sys_optlog` VALUES ('1866', null, '任务完成：13', '2019-03-19 10:56:55', '32', '佟鹏');
INSERT INTO `sys_optlog` VALUES ('1867', null, '用户登录', '2019-03-19 10:57:12', '50', '徐静');
INSERT INTO `sys_optlog` VALUES ('1868', null, '用户登录', '2019-03-19 11:14:07', '50', '徐静');
INSERT INTO `sys_optlog` VALUES ('1869', null, '新增用例：csaca', '2019-03-19 11:14:23', '50', '徐静');
INSERT INTO `sys_optlog` VALUES ('1870', null, '完成测试：9', '2019-03-19 11:14:42', '50', '徐静');
INSERT INTO `sys_optlog` VALUES ('1871', null, '完成测试：9', '2019-03-19 11:14:43', '50', '徐静');
INSERT INTO `sys_optlog` VALUES ('1872', null, '用户登录', '2019-03-19 11:14:56', '19', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1873', null, '新增项目：信访项目优化', '2019-03-19 11:35:00', '19', '张晓月');
INSERT INTO `sys_optlog` VALUES ('1874', null, '新增客户：江苏省', '2019-03-19 11:43:19', '19', '张晓月');

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) NOT NULL COMMENT '机构名称',
  `TYPE` int(1) DEFAULT NULL COMMENT '机构类型:0：单位。\r\n1：部门、处室。2：分类等。\r\n',
  `STATUS` int(1) NOT NULL COMMENT '状态: 1：启用。\r\n0：停用。',
  `CJ` int(1) DEFAULT NULL COMMENT '机构层级:0：国家。\r\n1：省。\r\n2：市。\r\n3：县。\r\n4：乡镇/街道。\r\n5：社区/村。',
  `XZQHDM` varchar(6) DEFAULT NULL COMMENT '行政区划代码:见业务数据交换规范中的行政区划代码表。',
  `TEL` varchar(13) DEFAULT NULL COMMENT '固定电话',
  `PARENTID` int(11) DEFAULT NULL COMMENT '父节点编号',
  `LISTID` int(10) DEFAULT NULL COMMENT '排序编号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间:yyyy/MM/dd hh:mm:ss',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间:yyyy/MM/dd hh:mm:ss',
  `USERID` int(11) DEFAULT NULL COMMENT '操作人员ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作人员名称',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_SYS_ORGANIZATION_NAME` (`NAME`),
  KEY `IDX_SYS_ORGANIZATION_PARENTID` (`PARENTID`),
  KEY `sys_organization_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES ('1', '研发部', '0', '1', '1', '', '0517-83130911', '0', '1', '2018-06-09 19:18:02', '2018-06-09 19:18:02', '1', '超级管理员', null);
INSERT INTO `sys_organization` VALUES ('2', '统计部', null, '1', null, null, null, null, '2', '2018-06-09 19:46:39', '2019-03-14 17:25:49', '1', '超级管理员', null);
INSERT INTO `sys_organization` VALUES ('3', '运维部', null, '1', null, null, null, null, '3', '2018-06-09 19:49:18', '2019-03-14 17:25:54', '1', '超级管理员', null);
INSERT INTO `sys_organization` VALUES ('4', '测试部', null, '1', null, null, null, null, '4', '2019-03-14 17:25:44', '2019-03-14 17:25:58', '1', '超级管理员', null);
INSERT INTO `sys_organization` VALUES ('5', '管理层', null, '1', null, null, null, null, '5', '2019-03-14 17:29:15', null, '1', '超级管理员', null);
INSERT INTO `sys_organization` VALUES ('6', '市场部', null, '1', null, null, null, null, '6', '2019-03-14 17:29:38', null, '1', '超级管理员', null);
INSERT INTO `sys_organization` VALUES ('7', '综合部', null, '1', null, null, null, null, '7', '2019-03-14 17:31:28', null, '1', '超级管理员', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL COMMENT '角色名称',
  `STATUS` int(1) NOT NULL COMMENT '状态: 1：启用。\r\n0：停用。',
  `LISTID` int(10) DEFAULT NULL COMMENT '排序',
  `CREATETIME` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间:yyyy/MM/dd hh:mm:ss',
  `UPDATETIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间:yyyy/MM/dd hh:mm:ss',
  `USERID` int(11) NOT NULL COMMENT '操作人员ID',
  `USERNAME` varchar(50) NOT NULL COMMENT '操作人员',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`),
  KEY `sys_role_roleid` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '1', '1', '2018-04-01 10:10:21', '2018-04-01 10:10:21', '1', '超级管理员', null);
INSERT INTO `sys_role` VALUES ('2', '运维', '1', '3', '2018-06-09 22:31:02', '2018-06-09 22:31:02', '1', '超级管理员', null);
INSERT INTO `sys_role` VALUES ('3', '研发', '1', '2', '2018-06-09 22:30:24', '2018-06-09 22:30:24', '1', '超级管理员', null);
INSERT INTO `sys_role` VALUES ('7', '测试', '1', '4', '2019-03-18 21:41:24', '2019-03-18 21:41:24', '1', '超级管理员', null);
INSERT INTO `sys_role` VALUES ('8', '统计', '1', '5', '2019-03-18 21:41:31', null, '1', '超级管理员', null);
INSERT INTO `sys_role` VALUES ('9', '管理', '1', '6', '2019-03-18 21:41:49', null, '1', '超级管理员', null);
INSERT INTO `sys_role` VALUES ('10', '市场', '1', '7', '2019-03-18 21:41:55', null, '1', '超级管理员', null);
INSERT INTO `sys_role` VALUES ('11', '综合', '1', '8', '2019-03-18 21:42:02', null, '1', '超级管理员', null);
INSERT INTO `sys_role` VALUES ('12', '项目经理', '1', '9', '2019-03-18 21:47:38', null, '1', '超级管理员', null);

-- ----------------------------
-- Table structure for sys_rolepower
-- ----------------------------
DROP TABLE IF EXISTS `sys_rolepower`;
CREATE TABLE `sys_rolepower` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLEID` int(11) NOT NULL COMMENT '角色ID',
  `APPID` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`ID`),
  KEY `sys_rolepower_roleid` (`ROLEID`),
  KEY `sys_rolepower_appid` (`APPID`)
) ENGINE=InnoDB AUTO_INCREMENT=892 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_rolepower
-- ----------------------------
INSERT INTO `sys_rolepower` VALUES ('700', '1', '1');
INSERT INTO `sys_rolepower` VALUES ('701', '1', '2');
INSERT INTO `sys_rolepower` VALUES ('702', '1', '3');
INSERT INTO `sys_rolepower` VALUES ('703', '1', '4');
INSERT INTO `sys_rolepower` VALUES ('704', '1', '22');
INSERT INTO `sys_rolepower` VALUES ('705', '1', '5');
INSERT INTO `sys_rolepower` VALUES ('706', '1', '6');
INSERT INTO `sys_rolepower` VALUES ('707', '1', '7');
INSERT INTO `sys_rolepower` VALUES ('708', '1', '8');
INSERT INTO `sys_rolepower` VALUES ('709', '1', '9');
INSERT INTO `sys_rolepower` VALUES ('710', '1', '10');
INSERT INTO `sys_rolepower` VALUES ('711', '1', '11');
INSERT INTO `sys_rolepower` VALUES ('712', '1', '29');
INSERT INTO `sys_rolepower` VALUES ('713', '1', '12');
INSERT INTO `sys_rolepower` VALUES ('714', '1', '13');
INSERT INTO `sys_rolepower` VALUES ('715', '1', '14');
INSERT INTO `sys_rolepower` VALUES ('716', '1', '20');
INSERT INTO `sys_rolepower` VALUES ('717', '1', '21');
INSERT INTO `sys_rolepower` VALUES ('718', '1', '24');
INSERT INTO `sys_rolepower` VALUES ('719', '1', '23');
INSERT INTO `sys_rolepower` VALUES ('720', '1', '28');
INSERT INTO `sys_rolepower` VALUES ('721', '1', '30');
INSERT INTO `sys_rolepower` VALUES ('722', '1', '35');
INSERT INTO `sys_rolepower` VALUES ('723', '1', '36');
INSERT INTO `sys_rolepower` VALUES ('724', '1', '38');
INSERT INTO `sys_rolepower` VALUES ('725', '1', '31');
INSERT INTO `sys_rolepower` VALUES ('726', '1', '32');
INSERT INTO `sys_rolepower` VALUES ('727', '1', '33');
INSERT INTO `sys_rolepower` VALUES ('728', '1', '34');
INSERT INTO `sys_rolepower` VALUES ('729', '3', '2');
INSERT INTO `sys_rolepower` VALUES ('730', '3', '4');
INSERT INTO `sys_rolepower` VALUES ('731', '3', '22');
INSERT INTO `sys_rolepower` VALUES ('732', '3', '10');
INSERT INTO `sys_rolepower` VALUES ('733', '3', '11');
INSERT INTO `sys_rolepower` VALUES ('734', '3', '20');
INSERT INTO `sys_rolepower` VALUES ('735', '3', '24');
INSERT INTO `sys_rolepower` VALUES ('736', '3', '23');
INSERT INTO `sys_rolepower` VALUES ('737', '3', '28');
INSERT INTO `sys_rolepower` VALUES ('757', '8', '2');
INSERT INTO `sys_rolepower` VALUES ('758', '8', '4');
INSERT INTO `sys_rolepower` VALUES ('759', '8', '22');
INSERT INTO `sys_rolepower` VALUES ('760', '8', '10');
INSERT INTO `sys_rolepower` VALUES ('761', '8', '11');
INSERT INTO `sys_rolepower` VALUES ('762', '8', '20');
INSERT INTO `sys_rolepower` VALUES ('763', '8', '24');
INSERT INTO `sys_rolepower` VALUES ('764', '8', '23');
INSERT INTO `sys_rolepower` VALUES ('765', '8', '28');
INSERT INTO `sys_rolepower` VALUES ('795', '9', '1');
INSERT INTO `sys_rolepower` VALUES ('796', '9', '2');
INSERT INTO `sys_rolepower` VALUES ('797', '9', '3');
INSERT INTO `sys_rolepower` VALUES ('798', '9', '4');
INSERT INTO `sys_rolepower` VALUES ('799', '9', '22');
INSERT INTO `sys_rolepower` VALUES ('800', '9', '5');
INSERT INTO `sys_rolepower` VALUES ('801', '9', '6');
INSERT INTO `sys_rolepower` VALUES ('802', '9', '7');
INSERT INTO `sys_rolepower` VALUES ('803', '9', '8');
INSERT INTO `sys_rolepower` VALUES ('804', '9', '9');
INSERT INTO `sys_rolepower` VALUES ('805', '9', '10');
INSERT INTO `sys_rolepower` VALUES ('806', '9', '11');
INSERT INTO `sys_rolepower` VALUES ('807', '9', '29');
INSERT INTO `sys_rolepower` VALUES ('808', '9', '12');
INSERT INTO `sys_rolepower` VALUES ('809', '9', '13');
INSERT INTO `sys_rolepower` VALUES ('810', '9', '14');
INSERT INTO `sys_rolepower` VALUES ('811', '9', '20');
INSERT INTO `sys_rolepower` VALUES ('812', '9', '21');
INSERT INTO `sys_rolepower` VALUES ('813', '9', '24');
INSERT INTO `sys_rolepower` VALUES ('814', '9', '23');
INSERT INTO `sys_rolepower` VALUES ('815', '9', '28');
INSERT INTO `sys_rolepower` VALUES ('816', '9', '30');
INSERT INTO `sys_rolepower` VALUES ('817', '9', '35');
INSERT INTO `sys_rolepower` VALUES ('818', '9', '36');
INSERT INTO `sys_rolepower` VALUES ('819', '9', '38');
INSERT INTO `sys_rolepower` VALUES ('820', '9', '32');
INSERT INTO `sys_rolepower` VALUES ('821', '9', '33');
INSERT INTO `sys_rolepower` VALUES ('822', '9', '34');
INSERT INTO `sys_rolepower` VALUES ('823', '10', '1');
INSERT INTO `sys_rolepower` VALUES ('824', '10', '22');
INSERT INTO `sys_rolepower` VALUES ('825', '10', '7');
INSERT INTO `sys_rolepower` VALUES ('826', '10', '8');
INSERT INTO `sys_rolepower` VALUES ('827', '10', '9');
INSERT INTO `sys_rolepower` VALUES ('828', '10', '23');
INSERT INTO `sys_rolepower` VALUES ('829', '10', '28');
INSERT INTO `sys_rolepower` VALUES ('846', '7', '3');
INSERT INTO `sys_rolepower` VALUES ('847', '7', '4');
INSERT INTO `sys_rolepower` VALUES ('848', '7', '12');
INSERT INTO `sys_rolepower` VALUES ('849', '7', '13');
INSERT INTO `sys_rolepower` VALUES ('850', '7', '14');
INSERT INTO `sys_rolepower` VALUES ('851', '7', '21');
INSERT INTO `sys_rolepower` VALUES ('852', '2', '1');
INSERT INTO `sys_rolepower` VALUES ('853', '2', '2');
INSERT INTO `sys_rolepower` VALUES ('854', '2', '22');
INSERT INTO `sys_rolepower` VALUES ('855', '2', '5');
INSERT INTO `sys_rolepower` VALUES ('856', '2', '7');
INSERT INTO `sys_rolepower` VALUES ('857', '2', '8');
INSERT INTO `sys_rolepower` VALUES ('858', '2', '9');
INSERT INTO `sys_rolepower` VALUES ('859', '2', '29');
INSERT INTO `sys_rolepower` VALUES ('860', '2', '14');
INSERT INTO `sys_rolepower` VALUES ('861', '2', '21');
INSERT INTO `sys_rolepower` VALUES ('862', '2', '23');
INSERT INTO `sys_rolepower` VALUES ('863', '2', '28');
INSERT INTO `sys_rolepower` VALUES ('864', '2', '30');
INSERT INTO `sys_rolepower` VALUES ('865', '2', '35');
INSERT INTO `sys_rolepower` VALUES ('866', '2', '36');
INSERT INTO `sys_rolepower` VALUES ('867', '2', '38');
INSERT INTO `sys_rolepower` VALUES ('868', '12', '1');
INSERT INTO `sys_rolepower` VALUES ('869', '12', '2');
INSERT INTO `sys_rolepower` VALUES ('870', '12', '3');
INSERT INTO `sys_rolepower` VALUES ('871', '12', '4');
INSERT INTO `sys_rolepower` VALUES ('872', '12', '22');
INSERT INTO `sys_rolepower` VALUES ('873', '12', '5');
INSERT INTO `sys_rolepower` VALUES ('874', '12', '7');
INSERT INTO `sys_rolepower` VALUES ('875', '12', '8');
INSERT INTO `sys_rolepower` VALUES ('876', '12', '9');
INSERT INTO `sys_rolepower` VALUES ('877', '12', '10');
INSERT INTO `sys_rolepower` VALUES ('878', '12', '11');
INSERT INTO `sys_rolepower` VALUES ('879', '12', '29');
INSERT INTO `sys_rolepower` VALUES ('880', '12', '12');
INSERT INTO `sys_rolepower` VALUES ('881', '12', '13');
INSERT INTO `sys_rolepower` VALUES ('882', '12', '14');
INSERT INTO `sys_rolepower` VALUES ('883', '12', '20');
INSERT INTO `sys_rolepower` VALUES ('884', '12', '21');
INSERT INTO `sys_rolepower` VALUES ('885', '12', '24');
INSERT INTO `sys_rolepower` VALUES ('886', '12', '23');
INSERT INTO `sys_rolepower` VALUES ('887', '12', '28');
INSERT INTO `sys_rolepower` VALUES ('888', '12', '30');
INSERT INTO `sys_rolepower` VALUES ('889', '12', '35');
INSERT INTO `sys_rolepower` VALUES ('890', '12', '36');
INSERT INTO `sys_rolepower` VALUES ('891', '12', '38');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(50) NOT NULL COMMENT '用户密码',
  `TYPE` int(1) DEFAULT '1' COMMENT '1， 开发人员，2，测试人员，3，项目经理，4，需求组（运维），5，管理人员',
  `STATUS` int(1) NOT NULL COMMENT '状态:1：启用。\r\n0：停用。',
  `REALNAME` varchar(50) NOT NULL COMMENT '真实姓名',
  `ORGID` int(11) NOT NULL COMMENT '机构编号',
  `DEPTID` int(11) unsigned zerofill DEFAULT NULL COMMENT '部门编号',
  `ORGPOWERID` int(11) DEFAULT NULL COMMENT '机构权限ID：控制用户能看到的机构',
  `EMAIL` varchar(255) DEFAULT NULL COMMENT '邮箱地址',
  `LISTID` int(10) DEFAULT NULL COMMENT '排序编号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间:yyyy/MM/dd hh:mm:ss',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '更新时间:yyyy/MM/dd hh:mm:ss',
  `USERID` int(11) NOT NULL COMMENT '操作人员ID',
  `USERNAME` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人员',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`),
  KEY `IDX_SYS_USER_NAME` (`NAME`),
  KEY `IDX_SYS_USER_REALNAME` (`REALNAME`),
  KEY `IDX_SYS_USER_ORGID` (`ORGID`),
  KEY `IDX_SYS_USER_DEPTID` (`DEPTID`),
  KEY `IDX_SYS_USER_ORGPOWERID` (`ORGPOWERID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '123456', '5', '1', '超级管理员', '1', '00000000001', '1', '2532652215@qq.com', '1', '2018-05-06 20:54:34', '2019-03-09 19:31:59', '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('18', 'zl1', '123456', '5', '1', '张璐', '5', null, null, '383183137@qq.com', '1', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('19', 'zxy', '123456', '5', '1', '张晓月', '5', null, null, '2532652215@qq.com', '2', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('20', 'ykd', '123456', '4', '1', '叶凯冬', '6', null, null, '530397862@qq.com', '3', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('21', 'lcw', '123456', '4', '1', '王成亮', '6', null, null, '843191982@qq.com', '4', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('22', 'gqj', '123456', '3', '1', '高齐军', '1', null, null, '410329159@qq.com', '5', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('23', 'wxm', '123456', '1', '1', '王新民', '1', null, null, '1310086676@qq.com', '6', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('24', 'mp1', '123456', '1', '1', '马平', '1', null, null, '635423943@qq.com', '7', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('25', 'zw1', '123456', '3', '1', '周伟', '1', null, null, '49384112@qq.com', '8', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('26', 'phg', '123456', '1', '1', '潘海刚', '1', null, null, '348562297@qq.com', '9', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('27', 'lyf', '123456', '1', '1', '罗衍飞', '1', null, null, '1224327243@qq.com', '10', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('28', 'zxc', '123456', '1', '1', '朱春旭', '1', null, null, '986476864@qq.com', '11', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('29', 'smd', '123456', '1', '1', '邵梦丹', '1', null, null, '1119547864@qq.com', '12', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('30', 'hy1', '123456', '1', '1', '黄杨', '1', null, null, '785948270@qq.com', '13', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('31', 'wt1', '123456', '1', '1', '王婷', '1', null, null, '295115616@qq.com', '14', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('32', 'tp1', '123456', '1', '1', '佟鹏', '1', null, null, '992486558@qq.com', '15', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('33', 'cjb', '123456', '1', '1', '陈进宝', '1', null, null, '3327879797@qq.com', '16', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('34', 'zhanghai', '123456', '1', '1', '张海', '1', null, null, '971855532@qq.com', '17', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('35', 'ym1', '123456', '1', '1', '于猛', '1', null, null, '1174424913@qq.com', '18', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('36', 'xsx', '123456', '1', '1', '徐守宣', '1', null, null, '1534214912@qq.com', '19', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('37', 'wjb', '123456', '3', '1', '王建邦', '1', null, null, '595566953@qq.com', '20', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('38', 'll1', '123456', '1', '1', '李龙', '1', null, null, '68196945@qq.com', '21', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('39', 'fbt', '123456', '1', '1', '伏宝同', '1', null, null, '956444268@qq.com', '22', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('40', 'lipeng', '123456', '1', '1', '李鹏', '1', null, null, '849698393@qq.com', '23', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('41', 'gws', '123456', '1', '1', '桂文生', '1', null, null, '609621251@qq.com', '24', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('42', 'xyh', '123456', '1', '1', '薛煜辉', '1', null, null, '1282407847@qq.com', '25', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('43', 'ql1', '123456', '3', '1', '乔磊', '1', null, null, '1431620378@qq.com', '26', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('44', 'pk1', '123456', '3', '1', '彭凯', '1', null, null, '1431620378@qq.com', '27', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('45', 'litao', '123456', '1', '1', '李涛', '1', null, null, '1037961200@qq.com', '28', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('46', 'tj1', '123456', '1', '1', '唐健', '1', null, null, '120867559@qq.com', '29', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('47', 'lyh', '123456', '1', '1', '李沂航', '1', null, null, '616628406@qq.com', '30', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('48', 'wj1', '123456', '1', '1', '王军', '2', null, null, '353829551@qq.com', '31', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('49', 'dsq', '123456', '3', '1', '丁士青', '2', null, null, '2357081225@qq.com', '32', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('50', 'xj1', '123456', '2', '1', '徐静', '4', null, null, '1822550185@qq.com', '33', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('51', 'yx1', '123456', '2', '1', '杨旭', '4', null, null, '1336590682@qq.com', '34', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('52', 'zs1', '123456', '2', '1', '周松', '4', null, null, '253815156@qq.com', '35', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('53', 'tt1', '123456', '2', '1', '滕腾', '4', null, null, 'tengteng0820@qq.com', '36', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('54', 'zdl', '123456', '4', '1', '周东林', '3', null, null, '120231708@qq.com', '37', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('55', 'yhl', '123456', '4', '1', '岳红玲', '3', null, null, '1023779908@qq.com', '38', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('56', 'xyl', '123456', '4', '1', '薛云龙', '3', null, null, '2034926972@qq.com', '39', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('57', 'dng', '123456', '4', '1', '杜乃光', '3', null, null, '965635008@qq.com', '40', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('58', 'gg1', '123456', '4', '1', '顾工', '3', null, null, '153065217@qq.com', '41', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('59', 'yb1', '123456', '4', '1', '殷兵', '3', null, null, '330628136@qq.com', '42', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('60', 'zxy1', '123456', '4', '1', '张雪影', '3', null, null, '1850559723@qq.com', '43', '2019-03-18 18:41:00', null, '1', '超级管理员', null);
INSERT INTO `sys_user` VALUES ('61', 'gjb', '123456', '4', '1', '郭家斌', '3', null, null, '835010130@qq.com', '44', '2019-03-18 18:41:00', null, '1', '超级管理员', null);

-- ----------------------------
-- Table structure for sys_userlogin
-- ----------------------------
DROP TABLE IF EXISTS `sys_userlogin`;
CREATE TABLE `sys_userlogin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL COMMENT '用户名ID',
  `REALNAME` varchar(50) NOT NULL COMMENT '真实姓名',
  `IP` varchar(20) DEFAULT NULL COMMENT '登录IP地址',
  `MAC` varchar(50) DEFAULT NULL COMMENT 'mac地址',
  `HOST` varchar(50) DEFAULT NULL COMMENT '主机名',
  `LOGINTIME` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`ID`),
  KEY `IDX_SYS_USERLOGIN_USERID` (`USERID`),
  KEY `sys_userlogin_userid` (`USERID`),
  KEY `sys_userlogin_realname` (`REALNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_userlogin
-- ----------------------------

-- ----------------------------
-- Table structure for sys_userrole
-- ----------------------------
DROP TABLE IF EXISTS `sys_userrole`;
CREATE TABLE `sys_userrole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL COMMENT '用户ID',
  `ROLEID` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID`),
  KEY `sys_userrole_userid` (`USERID`),
  KEY `sys_userrole_roleid` (`ROLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of sys_userrole
-- ----------------------------
INSERT INTO `sys_userrole` VALUES ('1', '1', '1');
INSERT INTO `sys_userrole` VALUES ('12', '18', '9');
INSERT INTO `sys_userrole` VALUES ('13', '19', '9');
INSERT INTO `sys_userrole` VALUES ('15', '20', '10');
INSERT INTO `sys_userrole` VALUES ('16', '21', '10');
INSERT INTO `sys_userrole` VALUES ('18', '1', '3');
INSERT INTO `sys_userrole` VALUES ('20', '23', '3');
INSERT INTO `sys_userrole` VALUES ('21', '24', '3');
INSERT INTO `sys_userrole` VALUES ('23', '26', '3');
INSERT INTO `sys_userrole` VALUES ('24', '27', '3');
INSERT INTO `sys_userrole` VALUES ('25', '28', '3');
INSERT INTO `sys_userrole` VALUES ('26', '29', '3');
INSERT INTO `sys_userrole` VALUES ('27', '30', '3');
INSERT INTO `sys_userrole` VALUES ('28', '31', '3');
INSERT INTO `sys_userrole` VALUES ('29', '32', '3');
INSERT INTO `sys_userrole` VALUES ('30', '33', '3');
INSERT INTO `sys_userrole` VALUES ('31', '34', '3');
INSERT INTO `sys_userrole` VALUES ('32', '35', '3');
INSERT INTO `sys_userrole` VALUES ('33', '36', '3');
INSERT INTO `sys_userrole` VALUES ('35', '38', '3');
INSERT INTO `sys_userrole` VALUES ('36', '39', '3');
INSERT INTO `sys_userrole` VALUES ('37', '40', '3');
INSERT INTO `sys_userrole` VALUES ('38', '41', '3');
INSERT INTO `sys_userrole` VALUES ('39', '42', '3');
INSERT INTO `sys_userrole` VALUES ('40', '43', '3');
INSERT INTO `sys_userrole` VALUES ('41', '44', '3');
INSERT INTO `sys_userrole` VALUES ('42', '45', '3');
INSERT INTO `sys_userrole` VALUES ('43', '46', '3');
INSERT INTO `sys_userrole` VALUES ('44', '47', '3');
INSERT INTO `sys_userrole` VALUES ('49', '48', '8');
INSERT INTO `sys_userrole` VALUES ('52', '50', '7');
INSERT INTO `sys_userrole` VALUES ('53', '51', '7');
INSERT INTO `sys_userrole` VALUES ('54', '52', '7');
INSERT INTO `sys_userrole` VALUES ('55', '53', '7');
INSERT INTO `sys_userrole` VALUES ('59', '54', '2');
INSERT INTO `sys_userrole` VALUES ('60', '55', '2');
INSERT INTO `sys_userrole` VALUES ('61', '56', '2');
INSERT INTO `sys_userrole` VALUES ('62', '57', '2');
INSERT INTO `sys_userrole` VALUES ('63', '58', '2');
INSERT INTO `sys_userrole` VALUES ('64', '59', '2');
INSERT INTO `sys_userrole` VALUES ('65', '60', '2');
INSERT INTO `sys_userrole` VALUES ('66', '61', '2');
INSERT INTO `sys_userrole` VALUES ('74', '22', '3');
INSERT INTO `sys_userrole` VALUES ('75', '22', '12');
INSERT INTO `sys_userrole` VALUES ('76', '25', '3');
INSERT INTO `sys_userrole` VALUES ('77', '25', '12');
INSERT INTO `sys_userrole` VALUES ('78', '37', '3');
INSERT INTO `sys_userrole` VALUES ('79', '37', '12');
INSERT INTO `sys_userrole` VALUES ('80', '49', '8');
INSERT INTO `sys_userrole` VALUES ('81', '49', '12');

-- ----------------------------
-- Function structure for func_getDjbh
-- ----------------------------
DROP FUNCTION IF EXISTS `func_getDjbh`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_getDjbh`() RETURNS varchar(17) CHARSET gb2312
BEGIN
	DECLARE v_now VARCHAR(20);  
	DECLARE v_requesttime VARCHAR(20);  
	DECLARE v_orderbh VARCHAR(17);  
	
	set v_now=DATE_FORMAT(NOW(),'%Y%m%d');
	select DATE_FORMAT(djtime,'%Y%m%d') into v_requesttime from sys_bh;
	IF v_requesttime=v_now THEN
		update sys_bh set djbh=djbh+1,djtime=SYSDATE();
	ELSE
		update sys_bh set djbh=1,djtime=SYSDATE();
	END IF;

	select concat('DJ',v_now,LPAD(djbh,5,0)) into v_orderbh from sys_bh;

	RETURN v_orderbh;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_getFkbh
-- ----------------------------
DROP FUNCTION IF EXISTS `func_getFkbh`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_getFkbh`() RETURNS varchar(17) CHARSET gb2312
BEGIN
	DECLARE v_now VARCHAR(20);  
	DECLARE v_requesttime VARCHAR(20);  
	DECLARE v_orderbh VARCHAR(17);  
	
	set v_now=DATE_FORMAT(NOW(),'%Y%m%d');
	select DATE_FORMAT(fktime,'%Y%m%d') into v_requesttime from sys_bh;
	IF v_requesttime=v_now THEN
		update sys_bh set fkbh=fkbh+1,fktime=SYSDATE();
	ELSE
		update sys_bh set fkbh=1,fktime=SYSDATE();
	END IF;

	select concat('FK',v_now,LPAD(fkbh,5,0)) into v_orderbh from sys_bh;

	RETURN v_orderbh;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_getOrderbh
-- ----------------------------
DROP FUNCTION IF EXISTS `func_getOrderbh`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_getOrderbh`() RETURNS varchar(17) CHARSET gb2312
BEGIN
	DECLARE v_now VARCHAR(20);  
	DECLARE v_requesttime VARCHAR(20);  
	DECLARE v_orderbh VARCHAR(17);  
	
	set v_now=DATE_FORMAT(NOW(),'%Y%m%d');
	select DATE_FORMAT(ordertime,'%Y%m%d') into v_requesttime from sys_bh;
	IF v_requesttime=v_now THEN
		update sys_bh set orderbh=orderbh+1,ordertime=SYSDATE();
	ELSE
		update sys_bh set orderbh=1,ordertime=SYSDATE();
	END IF;

	select concat('FC',v_now,LPAD(orderbh,5,0)) into v_orderbh from sys_bh;

	RETURN v_orderbh;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_getOrgChildList
-- ----------------------------
DROP FUNCTION IF EXISTS `func_getOrgChildList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_getOrgChildList`(rootid INT) RETURNS varchar(2000) CHARSET gb2312
BEGIN
  DECLARE pTemp VARCHAR(1000);  
  DECLARE cTemp VARCHAR(1000);
	SET pTemp = '';  
	SET cTemp =CONVERT(rootid, CHAR);  
	WHILE cTemp is not null DO  
		 IF cTemp = rootid then
			 SET pTemp = rootid;
		 ELSE
			 SET pTemp = concat(pTemp,',',cTemp); 
		 END IF;
		 SELECT group_concat(id) INTO cTemp FROM sys_organization   
				WHERE FIND_IN_SET(parentid,cTemp)>0; 
  END WHILE;  
	RETURN pTemp;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_getSkbh
-- ----------------------------
DROP FUNCTION IF EXISTS `func_getSkbh`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_getSkbh`() RETURNS varchar(17) CHARSET gb2312
BEGIN
	DECLARE v_now VARCHAR(20);  
	DECLARE v_requesttime VARCHAR(20);  
	DECLARE v_orderbh VARCHAR(17);  
	
	set v_now=DATE_FORMAT(NOW(),'%Y%m%d');
	select DATE_FORMAT(sktime,'%Y%m%d') into v_requesttime from sys_bh;
	IF v_requesttime=v_now THEN
		update sys_bh set skbh=skbh+1,sktime=SYSDATE();
	ELSE
		update sys_bh set skbh=1,sktime=SYSDATE();
	END IF;

	select concat('SK',v_now,LPAD(skbh,5,0)) into v_orderbh from sys_bh;

	RETURN v_orderbh;
END
;;
DELIMITER ;
