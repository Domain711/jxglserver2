/*
Navicat MySQL Data Transfer

Source Server         : jxgl
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : renren_fast

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-04-08 22:33:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-80Q30CP1523189909625', '1523197996864', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1521289800000', '-1', '5', 'PAUSED', 'CRON', '1521289729000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1521289800000', '-1', '5', 'PAUSED', 'CRON', '1521289729000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'renren', '0 0/30 * * * ?', '1', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('2', 'testTask', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'renren', '0', null, '1040', '2018-03-17 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'test', 'renren', '0', null, '1033', '2018-03-17 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2018-03-17 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-03-17 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'test', 'renren', '0', null, '1034', '2018-03-18 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-03-18 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'test', 'renren', '0', null, '1021', '2018-03-18 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'test', 'renren', '0', null, '1022', '2018-03-18 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2018-03-18 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'test', 'renren', '0', null, '1041', '2018-03-18 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'test', 'renren', '0', null, '1082', '2018-03-19 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'test', 'renren', '0', null, '1016', '2018-03-19 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'test', 'renren', '0', null, '1088', '2018-03-19 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'test', 'renren', '0', null, '1074', '2018-03-20 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'test', 'renren', '0', null, '1068', '2018-03-22 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'test', 'renren', '0', null, '1572', '2018-03-23 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'test', 'renren', '0', null, '1034', '2018-03-23 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'test', 'renren', '0', null, '1070', '2018-03-24 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-03-24 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'test', 'renren', '0', null, '1063', '2018-03-24 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'test', 'renren', '0', null, '1068', '2018-03-24 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'testTask', 'test', 'renren', '0', null, '1041', '2018-03-24 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'testTask', 'test', 'renren', '0', null, '1065', '2018-03-25 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'testTask', 'test', 'renren', '0', null, '1043', '2018-03-25 19:00:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('3c683ebe-bd56-4602-81e8-a4dd37cf9dc2', 'c2ady', '2018-03-25 21:29:39');
INSERT INTO `sys_captcha` VALUES ('4aca070b-148f-47e9-8e0d-1faa0a4343f8', '8afep', '2018-03-26 20:04:00');
INSERT INTO `sys_captcha` VALUES ('8ec09b26-ce92-42fe-8477-d95c9dccd0c3', '7bb3f', '2018-03-26 20:54:53');
INSERT INTO `sys_captcha` VALUES ('a6c43e7e-9c71-49bc-8f37-fe0dd5cb0b90', 'we36n', '2018-03-24 19:36:23');
INSERT INTO `sys_captcha` VALUES ('b447f9d3-bb19-454a-88c4-c784cc5afc48', 'f7fc4', '2018-03-24 19:36:15');
INSERT INTO `sys_captcha` VALUES ('e985bcee-fca1-48e2-80f7-d4704f4c9943', 'eyapc', '2018-03-18 22:38:45');
INSERT INTO `sys_captcha` VALUES ('eeef4822-372c-4a93-899d-9fa951c7ce37', 'n37an', '2018-03-26 20:07:11');
INSERT INTO `sys_captcha` VALUES ('f24ff2cc-2350-45ca-8008-43d1f52d121e', 'w6a83', '2018-03-18 22:40:47');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"2549928596@qq.com\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}', '80', '127.0.0.1', '2018-03-18 12:54:06');
INSERT INTO `sys_log` VALUES ('2', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":2,\"username\":\"domain\",\"password\":\"b53e32e734fbf5c971fe8e56d794f4b09939d51b7f5527e369211a4dc9a34cba\",\"salt\":\"GZkh1eDcxd4wkUgy71dA\",\"email\":\"691386631@qq.com\",\"mobile\":\"13645368414\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Mar 18, 2018 12:57:47 PM\"}', '30', '127.0.0.1', '2018-03-18 12:57:48');
INSERT INTO `sys_log` VALUES ('3', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"管理员\",\"remark\":\"拥有所有权限\",\"createUserId\":1,\"menuIdList\":[-666666],\"createTime\":\"Mar 18, 2018 1:22:02 PM\"}', '45', '127.0.0.1', '2018-03-18 13:22:03');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":2,\"roleName\":\"教学督导\",\"remark\":\"配置相应的权限\",\"createUserId\":1,\"menuIdList\":[-666666],\"createTime\":\"Mar 18, 2018 1:25:01 PM\"}', '19', '127.0.0.1', '2018-03-18 13:25:01');
INSERT INTO `sys_log` VALUES ('5', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":3,\"roleName\":\"教师\",\"remark\":\"配置相应权限\",\"createUserId\":1,\"menuIdList\":[-666666],\"createTime\":\"Mar 18, 2018 1:25:17 PM\"}', '18', '127.0.0.1', '2018-03-18 13:25:17');
INSERT INTO `sys_log` VALUES ('6', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":4,\"roleName\":\"学生\",\"remark\":\"配置相应权限\",\"createUserId\":1,\"menuIdList\":[-666666],\"createTime\":\"Mar 18, 2018 1:25:32 PM\"}', '20', '127.0.0.1', '2018-03-18 13:25:33');
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"2549928596@qq.com\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}', '24', '127.0.0.1', '2018-03-18 14:37:55');
INSERT INTO `sys_log` VALUES ('8', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":2,\"username\":\"supe\",\"password\":\"b53e32e734fbf5c971fe8e56d794f4b09939d51b7f5527e369211a4dc9a34cba\",\"salt\":\"GZkh1eDcxd4wkUgy71dA\",\"email\":\"691386631@qq.com\",\"mobile\":\"13645368414\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}', '37', '127.0.0.1', '2018-03-18 14:38:23');
INSERT INTO `sys_log` VALUES ('9', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":3,\"username\":\"teacher\",\"password\":\"cfb6865ea3827238372df84404a24ab1c88d17f9d976ac41509ac13305f8577b\",\"salt\":\"DwMwG0YOrYjZ2f3C3OFz\",\"email\":\"2549928596@qq.com\",\"mobile\":\"15856912345\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Mar 18, 2018 2:39:22 PM\"}', '21', '127.0.0.1', '2018-03-18 14:39:22');
INSERT INTO `sys_log` VALUES ('10', 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{\"userId\":4,\"username\":\"student\",\"password\":\"afd8a5b1c9b99c367de44307c90228014bbc1f5c792c3f80385fe322612f5fb0\",\"salt\":\"FxmiopsCJ82OEBQhj3E9\",\"email\":\"135467823@qq.com\",\"mobile\":\"13645368415\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"createTime\":\"Mar 18, 2018 2:39:55 PM\"}', '21', '127.0.0.1', '2018-03-18 14:39:56');
INSERT INTO `sys_log` VALUES ('11', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '31', '0', '127.0.0.1', '2018-03-19 22:42:30');
INSERT INTO `sys_log` VALUES ('12', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":36,\"parentId\":0,\"name\":\"测试\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '45', '127.0.0.1', '2018-03-19 22:58:57');
INSERT INTO `sys_log` VALUES ('13', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":31,\"parentId\":36,\"name\":\"教师测试\",\"url\":\"modules/teacher/teacherform.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '283', '127.0.0.1', '2018-03-19 22:59:58');
INSERT INTO `sys_log` VALUES ('14', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '31', '0', '127.0.0.1', '2018-03-19 23:00:26');
INSERT INTO `sys_log` VALUES ('15', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '31', '0', '127.0.0.1', '2018-03-19 23:00:31');
INSERT INTO `sys_log` VALUES ('16', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":72,\"parentId\":1,\"name\":\"教师信息\",\"url\":\"modules/teachers/teachers.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '32', '0:0:0:0:0:0:0:1', '2018-03-25 19:11:55');
INSERT INTO `sys_log` VALUES ('17', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":92,\"parentId\":1,\"name\":\"学院信息\",\"url\":\"modules/college/college.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '45', '0:0:0:0:0:0:0:1', '2018-03-25 19:12:12');
INSERT INTO `sys_log` VALUES ('18', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":97,\"parentId\":1,\"name\":\"课程信息\",\"url\":\"modules/course/course.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '30', '0:0:0:0:0:0:0:1', '2018-03-25 19:12:27');
INSERT INTO `sys_log` VALUES ('19', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":102,\"parentId\":1,\"name\":\"专业信息\",\"url\":\"modules/major/major.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '94', '0:0:0:0:0:0:0:1', '2018-03-25 19:12:39');
INSERT INTO `sys_log` VALUES ('20', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":112,\"parentId\":1,\"name\":\"考试成绩\",\"url\":\"modules/exam/exam.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '27', '0:0:0:0:0:0:0:1', '2018-03-25 19:12:52');
INSERT INTO `sys_log` VALUES ('21', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":107,\"parentId\":1,\"name\":\"班级信息\",\"url\":\"modules/grade/grade.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '35', '0:0:0:0:0:0:0:1', '2018-03-25 19:13:05');
INSERT INTO `sys_log` VALUES ('22', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":122,\"parentId\":1,\"name\":\"题目类型\",\"url\":\"modules/questiontype/questiontype.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '18', '0:0:0:0:0:0:0:1', '2018-03-25 19:13:20');
INSERT INTO `sys_log` VALUES ('23', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":127,\"parentId\":1,\"name\":\"教师评价\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '20', '0:0:0:0:0:0:0:1', '2018-03-25 19:13:32');
INSERT INTO `sys_log` VALUES ('24', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":132,\"parentId\":1,\"name\":\"教务管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '28', '0:0:0:0:0:0:0:1', '2018-03-25 19:15:09');
INSERT INTO `sys_log` VALUES ('25', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":132,\"parentId\":0,\"name\":\"教务管理\",\"type\":0,\"orderNum\":0}', '12', '0:0:0:0:0:0:0:1', '2018-03-25 19:15:58');
INSERT INTO `sys_log` VALUES ('26', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":133,\"parentId\":0,\"name\":\"教师管理\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '12', '0:0:0:0:0:0:0:1', '2018-03-25 19:16:54');
INSERT INTO `sys_log` VALUES ('27', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":134,\"parentId\":0,\"name\":\"学生管理\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '21', '0:0:0:0:0:0:0:1', '2018-03-25 19:17:04');
INSERT INTO `sys_log` VALUES ('28', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":135,\"parentId\":0,\"name\":\"教学督导\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '13', '0:0:0:0:0:0:0:1', '2018-03-25 19:17:17');
INSERT INTO `sys_log` VALUES ('29', 'admin', '暂停定时任务', 'io.renren.modules.job.controller.ScheduleJobController.pause()', '[1]', '69', '0:0:0:0:0:0:0:1', '2018-03-25 19:17:41');
INSERT INTO `sys_log` VALUES ('30', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":136,\"parentId\":132,\"name\":\"用户管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '18', '0:0:0:0:0:0:0:1', '2018-03-25 19:19:29');
INSERT INTO `sys_log` VALUES ('31', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":137,\"parentId\":132,\"name\":\"课程管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '17', '0:0:0:0:0:0:0:1', '2018-03-25 19:19:55');
INSERT INTO `sys_log` VALUES ('32', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":138,\"parentId\":132,\"name\":\"题库管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '26', '0:0:0:0:0:0:0:1', '2018-03-25 19:20:05');
INSERT INTO `sys_log` VALUES ('33', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":139,\"parentId\":132,\"name\":\"考试管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '27', '0:0:0:0:0:0:0:1', '2018-03-25 19:20:14');
INSERT INTO `sys_log` VALUES ('34', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":140,\"parentId\":132,\"name\":\"成绩管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '19', '0:0:0:0:0:0:0:1', '2018-03-25 19:20:27');
INSERT INTO `sys_log` VALUES ('35', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":141,\"parentId\":132,\"name\":\"自动组卷\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '23', '0:0:0:0:0:0:0:1', '2018-03-25 19:20:49');
INSERT INTO `sys_log` VALUES ('36', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":142,\"parentId\":133,\"name\":\"教案上传\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '21', '0:0:0:0:0:0:0:1', '2018-03-25 19:22:53');
INSERT INTO `sys_log` VALUES ('37', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":143,\"parentId\":133,\"name\":\"教学计划\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '21', '0:0:0:0:0:0:0:1', '2018-03-25 19:23:14');
INSERT INTO `sys_log` VALUES ('38', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":144,\"parentId\":133,\"name\":\"科研成果\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '124', '0:0:0:0:0:0:0:1', '2018-03-25 19:23:31');
INSERT INTO `sys_log` VALUES ('39', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":145,\"parentId\":133,\"name\":\"教师互评\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '20', '0:0:0:0:0:0:0:1', '2018-03-25 19:23:48');
INSERT INTO `sys_log` VALUES ('40', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":146,\"parentId\":145,\"name\":\"待评价教师\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '29', '0:0:0:0:0:0:0:1', '2018-03-25 19:24:15');
INSERT INTO `sys_log` VALUES ('41', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":147,\"parentId\":145,\"name\":\"综合查询\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '21', '0:0:0:0:0:0:0:1', '2018-03-25 19:24:26');
INSERT INTO `sys_log` VALUES ('42', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":148,\"parentId\":145,\"name\":\"已评价教师\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '33', '0:0:0:0:0:0:0:1', '2018-03-25 19:24:37');
INSERT INTO `sys_log` VALUES ('43', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":149,\"parentId\":133,\"name\":\"考试测评\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '18', '0:0:0:0:0:0:0:1', '2018-03-25 19:24:58');
INSERT INTO `sys_log` VALUES ('44', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":150,\"parentId\":149,\"name\":\"考试计划\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '31', '0:0:0:0:0:0:0:1', '2018-03-25 19:25:20');
INSERT INTO `sys_log` VALUES ('45', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":151,\"parentId\":149,\"name\":\"成绩查询\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '20', '0:0:0:0:0:0:0:1', '2018-03-25 19:25:37');
INSERT INTO `sys_log` VALUES ('46', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":152,\"parentId\":134,\"name\":\"课题体验\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '26', '0:0:0:0:0:0:0:1', '2018-03-25 19:26:23');
INSERT INTO `sys_log` VALUES ('47', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":153,\"parentId\":134,\"name\":\"考试\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '28', '0:0:0:0:0:0:0:1', '2018-03-25 19:26:36');
INSERT INTO `sys_log` VALUES ('48', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":154,\"parentId\":134,\"name\":\"教学评价\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '20', '0:0:0:0:0:0:0:1', '2018-03-25 19:26:45');
INSERT INTO `sys_log` VALUES ('49', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":155,\"parentId\":134,\"name\":\"待评价教师\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '16', '0:0:0:0:0:0:0:1', '2018-03-25 19:27:02');
INSERT INTO `sys_log` VALUES ('50', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":155,\"parentId\":152,\"name\":\"待评价教师\",\"url\":\"/\",\"type\":1,\"orderNum\":0}', '21', '0:0:0:0:0:0:0:1', '2018-03-25 19:27:17');
INSERT INTO `sys_log` VALUES ('51', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":156,\"parentId\":152,\"name\":\"综合查询\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '12', '0:0:0:0:0:0:0:1', '2018-03-25 19:27:33');
INSERT INTO `sys_log` VALUES ('52', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":157,\"parentId\":152,\"name\":\"已评价教师\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '23', '0:0:0:0:0:0:0:1', '2018-03-25 19:27:42');
INSERT INTO `sys_log` VALUES ('53', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":158,\"parentId\":153,\"name\":\"考试\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '18', '0:0:0:0:0:0:0:1', '2018-03-25 19:28:13');
INSERT INTO `sys_log` VALUES ('54', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":158,\"parentId\":153,\"name\":\"考试计划\",\"type\":0,\"orderNum\":0}', '15', '0:0:0:0:0:0:0:1', '2018-03-25 19:28:27');
INSERT INTO `sys_log` VALUES ('55', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":159,\"parentId\":153,\"name\":\"成绩查询\",\"url\":\"/\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '13', '0:0:0:0:0:0:0:1', '2018-03-25 19:28:40');
INSERT INTO `sys_log` VALUES ('56', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":160,\"parentId\":154,\"name\":\"待评价教师\",\"url\":\"/\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '21', '0:0:0:0:0:0:0:1', '2018-03-25 19:29:14');
INSERT INTO `sys_log` VALUES ('57', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":161,\"parentId\":154,\"name\":\"综合查询\",\"url\":\"/\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '15', '0:0:0:0:0:0:0:1', '2018-03-25 19:29:28');
INSERT INTO `sys_log` VALUES ('58', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":162,\"parentId\":154,\"name\":\"已评价教师\",\"url\":\"/\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '120', '0:0:0:0:0:0:0:1', '2018-03-25 19:29:46');
INSERT INTO `sys_log` VALUES ('59', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":163,\"parentId\":135,\"name\":\"课题体验\",\"url\":\"/\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '28', '0:0:0:0:0:0:0:1', '2018-03-25 19:30:14');
INSERT INTO `sys_log` VALUES ('60', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":164,\"parentId\":135,\"name\":\"教学审查\",\"url\":\"/\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '18', '0:0:0:0:0:0:0:1', '2018-03-25 19:30:27');
INSERT INTO `sys_log` VALUES ('61', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":73,\"parentId\":146,\"name\":\"查看\",\"perms\":\"teachers:teachers:list,teachers:teachers:info\",\"type\":2,\"orderNum\":6}', '27', '0:0:0:0:0:0:0:1', '2018-03-25 19:36:01');
INSERT INTO `sys_log` VALUES ('62', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":72,\"parentId\":136,\"name\":\"教师信息\",\"url\":\"modules/teachers/teachers.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '18', '0:0:0:0:0:0:0:1', '2018-03-25 19:40:38');
INSERT INTO `sys_log` VALUES ('63', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":165,\"parentId\":136,\"name\":\"学生信息表\",\"url\":\"modules/students/students.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '73', '0:0:0:0:0:0:0:1', '2018-03-25 19:47:40');
INSERT INTO `sys_log` VALUES ('64', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":165,\"parentId\":136,\"name\":\"学生管理\",\"url\":\"modules/students/students.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '23', '0:0:0:0:0:0:0:1', '2018-03-25 19:49:14');
INSERT INTO `sys_log` VALUES ('65', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":72,\"parentId\":136,\"name\":\"教师管理\",\"url\":\"modules/teachers/teachers.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '227', '0:0:0:0:0:0:0:1', '2018-03-25 19:49:29');
INSERT INTO `sys_log` VALUES ('66', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":117,\"parentId\":138,\"name\":\"题库管理\",\"url\":\"modules/question/question.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '13', '0:0:0:0:0:0:0:1', '2018-03-25 19:53:25');
INSERT INTO `sys_log` VALUES ('67', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":170,\"parentId\":139,\"name\":\"考试计划\",\"url\":\"modules/testplan/testplan.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '55', '0:0:0:0:0:0:0:1', '2018-03-25 19:57:32');
INSERT INTO `sys_log` VALUES ('68', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":112,\"parentId\":140,\"name\":\"考试成绩\",\"url\":\"modules/exam/exam.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '20', '0:0:0:0:0:0:0:1', '2018-03-25 19:58:50');
INSERT INTO `sys_log` VALUES ('69', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":112,\"parentId\":140,\"name\":\"学生成绩管理\",\"url\":\"modules/exam/exam.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '19', '0:0:0:0:0:0:0:1', '2018-03-25 20:03:01');
INSERT INTO `sys_log` VALUES ('70', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":175,\"parentId\":140,\"name\":\"班级成绩管理\",\"url\":\"modules/exam/exam.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '19', '0:0:0:0:0:0:0:1', '2018-03-25 20:04:54');
INSERT INTO `sys_log` VALUES ('71', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":180,\"parentId\":140,\"name\":\"专业成绩管理\",\"url\":\"modules/exam/exam.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '23', '0:0:0:0:0:0:0:1', '2018-03-25 20:05:19');
INSERT INTO `sys_log` VALUES ('72', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":127,\"parentId\":140,\"name\":\"学生评价成绩管理\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '22', '0:0:0:0:0:0:0:1', '2018-03-25 20:06:46');
INSERT INTO `sys_log` VALUES ('73', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":185,\"parentId\":140,\"name\":\"教师评价管理\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '19', '0:0:0:0:0:0:0:1', '2018-03-25 20:07:56');
INSERT INTO `sys_log` VALUES ('74', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":112,\"parentId\":140,\"name\":\"学生成绩管理\",\"url\":\"modules/exam/exam.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":1}', '291', '0:0:0:0:0:0:0:1', '2018-03-25 20:09:12');
INSERT INTO `sys_log` VALUES ('75', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":175,\"parentId\":140,\"name\":\"班级成绩管理\",\"url\":\"modules/exam/exam.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":2}', '19', '0:0:0:0:0:0:0:1', '2018-03-25 20:09:29');
INSERT INTO `sys_log` VALUES ('76', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":180,\"parentId\":140,\"name\":\"专业成绩管理\",\"url\":\"modules/exam/exam.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":3}', '13', '0:0:0:0:0:0:0:1', '2018-03-25 20:09:51');
INSERT INTO `sys_log` VALUES ('77', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":127,\"parentId\":140,\"name\":\"学生评价成绩管理\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":4}', '27', '0:0:0:0:0:0:0:1', '2018-03-25 20:10:05');
INSERT INTO `sys_log` VALUES ('78', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":185,\"parentId\":140,\"name\":\"教师评价成绩管理\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":5}', '19', '0:0:0:0:0:0:0:1', '2018-03-25 20:10:57');
INSERT INTO `sys_log` VALUES ('79', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":97,\"parentId\":137,\"name\":\"课程信息\",\"url\":\"modules/course/course.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '15', '0:0:0:0:0:0:0:1', '2018-03-25 20:11:50');
INSERT INTO `sys_log` VALUES ('80', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '137', '6', '0:0:0:0:0:0:0:1', '2018-03-25 20:12:38');
INSERT INTO `sys_log` VALUES ('81', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '137', '1', '0:0:0:0:0:0:0:1', '2018-03-25 20:13:01');
INSERT INTO `sys_log` VALUES ('82', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":97,\"parentId\":132,\"name\":\"课程信息\",\"url\":\"modules/course/course.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '22', '0:0:0:0:0:0:0:1', '2018-03-25 20:13:53');
INSERT INTO `sys_log` VALUES ('83', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '137', '48', '0:0:0:0:0:0:0:1', '2018-03-25 20:14:02');
INSERT INTO `sys_log` VALUES ('84', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":97,\"parentId\":132,\"name\":\"课程管理\",\"url\":\"modules/course/course.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '14', '0:0:0:0:0:0:0:1', '2018-03-25 20:14:39');
INSERT INTO `sys_log` VALUES ('85', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":190,\"parentId\":141,\"name\":\"题库查询\",\"url\":\"modules/question/question.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '99', '0:0:0:0:0:0:0:1', '2018-03-25 20:23:33');
INSERT INTO `sys_log` VALUES ('86', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":195,\"parentId\":141,\"name\":\"组卷策略\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '32', '0:0:0:0:0:0:0:1', '2018-03-25 20:23:58');
INSERT INTO `sys_log` VALUES ('87', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":196,\"parentId\":136,\"name\":\"教学督导管理\",\"url\":\"/\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '23', '0:0:0:0:0:0:0:1', '2018-03-25 20:25:00');
INSERT INTO `sys_log` VALUES ('88', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":122,\"parentId\":138,\"name\":\"题目类型\",\"url\":\"modules/questiontype/questiontype.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '74', '0:0:0:0:0:0:0:1', '2018-03-26 20:05:00');
INSERT INTO `sys_log` VALUES ('89', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":92,\"parentId\":132,\"name\":\"学院管理\",\"url\":\"modules/college/college.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '21', '0:0:0:0:0:0:0:1', '2018-03-26 20:06:35');
INSERT INTO `sys_log` VALUES ('90', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":102,\"parentId\":132,\"name\":\"专业管理\",\"url\":\"modules/major/major.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '30', '0:0:0:0:0:0:0:1', '2018-03-26 20:07:31');
INSERT INTO `sys_log` VALUES ('91', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":107,\"parentId\":132,\"name\":\"班级管理\",\"url\":\"modules/grade/grade.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '36', '0:0:0:0:0:0:0:1', '2018-03-26 20:08:09');
INSERT INTO `sys_log` VALUES ('92', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '160', '106', '0:0:0:0:0:0:0:1', '2018-03-26 20:11:47');
INSERT INTO `sys_log` VALUES ('93', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '162', '20', '0:0:0:0:0:0:0:1', '2018-03-26 20:11:59');
INSERT INTO `sys_log` VALUES ('94', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":197,\"parentId\":154,\"name\":\"待评价教师\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '22', '0:0:0:0:0:0:0:1', '2018-03-26 20:13:11');
INSERT INTO `sys_log` VALUES ('95', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":202,\"parentId\":154,\"name\":\"已评价教师\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '22', '0:0:0:0:0:0:0:1', '2018-03-26 20:13:27');
INSERT INTO `sys_log` VALUES ('96', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":207,\"parentId\":154,\"name\":\"综合查询\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '25', '0:0:0:0:0:0:0:1', '2018-03-26 20:13:41');
INSERT INTO `sys_log` VALUES ('97', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '155', '28', '0:0:0:0:0:0:0:1', '2018-03-26 20:15:04');
INSERT INTO `sys_log` VALUES ('98', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":212,\"parentId\":152,\"name\":\"待评价教师\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '23', '0:0:0:0:0:0:0:1', '2018-03-26 20:15:54');
INSERT INTO `sys_log` VALUES ('99', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":217,\"parentId\":152,\"name\":\"已评价教师\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '26', '0:0:0:0:0:0:0:1', '2018-03-26 20:16:07');
INSERT INTO `sys_log` VALUES ('100', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":222,\"parentId\":152,\"name\":\"综合查询\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '33', '0:0:0:0:0:0:0:1', '2018-03-26 20:16:17');
INSERT INTO `sys_log` VALUES ('101', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '73', '23', '0:0:0:0:0:0:0:1', '2018-03-26 20:17:24');
INSERT INTO `sys_log` VALUES ('102', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":227,\"parentId\":145,\"name\":\"待评价教师\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '20', '0:0:0:0:0:0:0:1', '2018-03-26 20:18:56');
INSERT INTO `sys_log` VALUES ('103', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":232,\"parentId\":145,\"name\":\"已评价教师\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '40', '0:0:0:0:0:0:0:1', '2018-03-26 20:19:08');
INSERT INTO `sys_log` VALUES ('104', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":237,\"parentId\":145,\"name\":\"综合查询\",\"url\":\"modules/teacherass/teacherass.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '16', '0:0:0:0:0:0:0:1', '2018-03-26 20:19:20');
INSERT INTO `sys_log` VALUES ('105', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '150', '104', '0:0:0:0:0:0:0:1', '2018-03-26 20:23:21');
INSERT INTO `sys_log` VALUES ('106', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '151', '233', '0:0:0:0:0:0:0:1', '2018-03-26 20:23:31');
INSERT INTO `sys_log` VALUES ('107', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":242,\"parentId\":149,\"name\":\"考试计划\",\"url\":\"modules/testplan/testplan.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '37', '0:0:0:0:0:0:0:1', '2018-03-26 20:23:49');
INSERT INTO `sys_log` VALUES ('108', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":247,\"parentId\":149,\"name\":\"成绩查询\",\"url\":\"modules/exam/exam.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '25', '0:0:0:0:0:0:0:1', '2018-03-26 20:24:37');
INSERT INTO `sys_log` VALUES ('109', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":252,\"parentId\":153,\"name\":\"成绩查询\",\"url\":\"modules/exam/exam.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '222', '0:0:0:0:0:0:0:1', '2018-03-26 20:26:18');
INSERT INTO `sys_log` VALUES ('110', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":257,\"parentId\":153,\"name\":\"考试计划\",\"url\":\"modules/testplan/testplan.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '23', '0:0:0:0:0:0:0:1', '2018-03-26 20:26:57');
INSERT INTO `sys_log` VALUES ('111', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '142', '76', '0:0:0:0:0:0:0:1', '2018-03-28 06:04:22');
INSERT INTO `sys_log` VALUES ('112', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '143', '17', '0:0:0:0:0:0:0:1', '2018-03-28 06:04:28');
INSERT INTO `sys_log` VALUES ('113', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '144', '13', '0:0:0:0:0:0:0:1', '2018-03-28 06:04:36');
INSERT INTO `sys_log` VALUES ('114', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":262,\"parentId\":133,\"name\":\"教案上传\",\"url\":\"modules/teachplan/teachplan.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '22', '0:0:0:0:0:0:0:1', '2018-03-28 06:05:09');
INSERT INTO `sys_log` VALUES ('115', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":267,\"parentId\":133,\"name\":\"教学计划\",\"url\":\"modules/lessonplan/lessonplan.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '41', '0:0:0:0:0:0:0:1', '2018-03-28 06:16:00');
INSERT INTO `sys_log` VALUES ('116', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":272,\"parentId\":133,\"name\":\"科研成果\",\"url\":\"modules/achievements/achievements.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '16', '0:0:0:0:0:0:0:1', '2018-03-28 06:16:27');
INSERT INTO `sys_log` VALUES ('117', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":4,\"username\":\"student\",\"salt\":\"FxmiopsCJ82OEBQhj3E9\",\"email\":\"135467823@qq.com\",\"mobile\":\"13645368415\",\"status\":0,\"roleIdList\":[4],\"createUserId\":1}', '240', '0:0:0:0:0:0:0:1', '2018-03-29 22:25:21');
INSERT INTO `sys_log` VALUES ('118', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":4,\"username\":\"student\",\"password\":\"afd8a5b1c9b99c367de44307c90228014bbc1f5c792c3f80385fe322612f5fb0\",\"salt\":\"FxmiopsCJ82OEBQhj3E9\",\"email\":\"135467823@qq.com\",\"mobile\":\"13645368415\",\"status\":0,\"roleIdList\":[4],\"createUserId\":1}', '125', '0:0:0:0:0:0:0:1', '2018-03-30 14:30:47');
INSERT INTO `sys_log` VALUES ('119', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":4,\"username\":\"student\",\"salt\":\"FxmiopsCJ82OEBQhj3E9\",\"email\":\"135467823@qq.com\",\"mobile\":\"13645368415\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1}', '20', '0:0:0:0:0:0:0:1', '2018-03-30 14:30:53');
INSERT INTO `sys_log` VALUES ('120', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":4,\"username\":\"student\",\"password\":\"afd8a5b1c9b99c367de44307c90228014bbc1f5c792c3f80385fe322612f5fb0\",\"salt\":\"FxmiopsCJ82OEBQhj3E9\",\"email\":\"776989980@qq.com\",\"mobile\":\"15555510431\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1}', '18', '0:0:0:0:0:0:0:1', '2018-03-30 14:31:14');
INSERT INTO `sys_log` VALUES ('121', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":3,\"username\":\"teacher\",\"password\":\"cfb6865ea3827238372df84404a24ab1c88d17f9d976ac41509ac13305f8577b\",\"salt\":\"DwMwG0YOrYjZ2f3C3OFz\",\"email\":\"zkp0113@qq.com\",\"mobile\":\"15555510431\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1}', '18', '0:0:0:0:0:0:0:1', '2018-03-30 14:31:37');
INSERT INTO `sys_log` VALUES ('122', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":2,\"username\":\"supe\",\"password\":\"b53e32e734fbf5c971fe8e56d794f4b09939d51b7f5527e369211a4dc9a34cba\",\"salt\":\"GZkh1eDcxd4wkUgy71dA\",\"email\":\"zkp0113@qq.com\",\"mobile\":\"15908990206\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}', '21', '0:0:0:0:0:0:0:1', '2018-03-30 14:32:11');
INSERT INTO `sys_log` VALUES ('123', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"password\":\"9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"776989980@qq.com\",\"mobile\":\"15555510431\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}', '27', '0:0:0:0:0:0:0:1', '2018-03-30 14:32:43');
INSERT INTO `sys_log` VALUES ('124', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"教学督导\",\"remark\":\"配置相应的权限\",\"createUserId\":1,\"menuIdList\":[138,117,118,119,120,121,122,123,124,125,126,139,170,171,172,173,174,112,113,114,115,116,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,133,145,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,149,242,243,244,245,246,247,248,249,250,251,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,-666666,132,140]}', '54', '0:0:0:0:0:0:0:1', '2018-03-30 14:38:24');
INSERT INTO `sys_log` VALUES ('125', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"教学督导\",\"remark\":\"配置相应的权限\",\"createUserId\":1,\"menuIdList\":[138,117,118,119,120,121,122,123,124,125,126,139,170,171,172,173,174,112,113,114,115,116,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,133,145,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,149,242,243,244,245,246,247,248,249,250,251,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,135,163,164,-666666,132,140]}', '47', '0:0:0:0:0:0:0:1', '2018-03-30 14:38:30');
INSERT INTO `sys_log` VALUES ('126', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":4,\"roleName\":\"学生\",\"remark\":\"配置相应权限\",\"createUserId\":1,\"menuIdList\":[171,113,128,129,130,152,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,253,258,198,203,208,-666666,132,139,170,140,112,127,134,153,252,257,154,197,202,207]}', '32', '0:0:0:0:0:0:0:1', '2018-03-30 14:42:08');
INSERT INTO `sys_log` VALUES ('127', 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"教学督导\",\"remark\":\"配置相应的权限\",\"createUserId\":1,\"menuIdList\":[135,163,164,-666666]}', '17', '0:0:0:0:0:0:0:1', '2018-03-30 14:42:34');
INSERT INTO `sys_log` VALUES ('128', 'student', '修改密码', 'io.renren.modules.sys.controller.SysUserController.password()', '{\"password\":\"admin\",\"newPassword\":\"123456789\"}', '104', '0:0:0:0:0:0:0:1', '2018-03-30 22:37:12');
INSERT INTO `sys_log` VALUES ('129', 'student', '修改密码', 'io.renren.modules.sys.controller.SysUserController.password()', '{\"password\":\"123456\",\"newPassword\":\"123456789\"}', '14', '0:0:0:0:0:0:0:1', '2018-03-30 22:37:18');
INSERT INTO `sys_log` VALUES ('130', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":5,\"username\":\"张坤鹏\",\"password\":\"8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92\",\"salt\":\"\",\"email\":\"776989980@qq.com\",\"mobile\":\"15555510431\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}', '59', '0:0:0:0:0:0:0:1', '2018-03-30 22:46:05');
INSERT INTO `sys_log` VALUES ('131', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":5,\"username\":\"张坤鹏\",\"password\":\"8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92\",\"salt\":\"\",\"email\":\"776989980@qq.com\",\"mobile\":\"15555510431\",\"status\":1,\"roleIdList\":[1,2,3,4],\"createUserId\":1}', '22', '0:0:0:0:0:0:0:1', '2018-03-30 22:47:21');
INSERT INTO `sys_log` VALUES ('132', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '195', '279', '0:0:0:0:0:0:0:1', '2018-04-08 20:35:27');
INSERT INTO `sys_log` VALUES ('133', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":277,\"parentId\":141,\"name\":\"组卷策略\",\"url\":\"modules/tactics/tactics.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '19', '0:0:0:0:0:0:0:1', '2018-04-08 20:36:21');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` VALUES ('72', '136', '教师管理', 'modules/teachers/teachers.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('74', '72', '新增', null, 'teachers:teachers:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('75', '72', '修改', null, 'teachers:teachers:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('76', '72', '删除', null, 'teachers:teachers:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('77', '72', '查询', null, 'teachers:teachers:list', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('92', '132', '学院管理', 'modules/college/college.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('93', '92', '查看', null, 'college:college:list,college:college:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('94', '92', '新增', null, 'college:college:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('95', '92', '修改', null, 'college:college:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('96', '92', '删除', null, 'college:college:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('97', '132', '课程管理', 'modules/course/course.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('98', '97', '查看', null, 'course:course:list,course:course:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('99', '97', '新增', null, 'course:course:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('100', '97', '修改', null, 'course:course:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('101', '97', '删除', null, 'course:course:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('102', '132', '专业管理', 'modules/major/major.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('103', '102', '查看', null, 'major:major:list,major:major:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('104', '102', '新增', null, 'major:major:save,college:college:select', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('105', '102', '修改', null, 'major:major:update,college:college:select', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('106', '102', '删除', null, 'major:major:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('107', '132', '班级管理', 'modules/grade/grade.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('108', '107', '查看', null, 'grade:grade:list,grade:grade:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('109', '107', '新增', null, 'grade:grade:save,major:major:select', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('110', '107', '修改', null, 'grade:grade:update,major:major:select', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('111', '107', '删除', null, 'grade:grade:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('112', '140', '学生成绩管理', 'modules/exam/exam.html', null, '1', 'fa fa-file-code-o', '1');
INSERT INTO `sys_menu` VALUES ('113', '112', '查看', null, 'exam:exam:list,exam:exam:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('114', '112', '新增', null, 'exam:exam:save,grade:grade:select,course:course:select', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('115', '112', '修改', null, 'exam:exam:update,grade:grade:select,course:course:select', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('116', '112', '删除', null, 'exam:exam:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('117', '138', '题库管理', 'modules/question/question.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('118', '117', '查看', null, 'question:question:list,question:question:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('119', '117', '新增', null, 'question:question:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('120', '117', '修改', null, 'question:question:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('121', '117', '删除', null, 'question:question:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('122', '138', '题目类型', 'modules/questiontype/questiontype.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('123', '122', '查看', null, 'questiontype:questiontype:list,questiontype:questiontype:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('124', '122', '新增', null, 'questiontype:questiontype:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('125', '122', '修改', null, 'questiontype:questiontype:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('126', '122', '删除', null, 'questiontype:questiontype:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('127', '140', '学生评价成绩管理', 'modules/teacherass/teacherass.html', null, '1', 'fa fa-file-code-o', '4');
INSERT INTO `sys_menu` VALUES ('128', '127', '查看', null, 'teacherass:teacherass:list,teacherass:teacherass:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('129', '127', '新增', null, 'teacherass:teacherass:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('130', '127', '修改', null, 'teacherass:teacherass:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('131', '127', '删除', null, 'teacherass:teacherass:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('132', '0', '教务管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('133', '0', '教师管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('134', '0', '学生管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('135', '0', '教学督导', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('136', '132', '用户管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('138', '132', '题库管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('139', '132', '考试管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('140', '132', '成绩管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('141', '132', '自动组卷', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('145', '133', '教师互评', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('149', '133', '考试测评', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('152', '134', '课题体验', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('153', '134', '考试', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('154', '134', '教学评价', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('163', '135', '课题体验', '/', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('164', '135', '教学审查', '/', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('165', '136', '学生管理', 'modules/students/students.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('166', '165', '查看', null, 'students:students:list,students:students:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('167', '165', '新增', null, 'students:students:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('168', '165', '修改', null, 'students:students:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('169', '165', '删除', null, 'students:students:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('170', '139', '考试计划', 'modules/testplan/testplan.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('171', '170', '查看', null, 'testplan:testplan:list,testplan:testplan:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('172', '170', '新增', null, 'testplan:testplan:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('173', '170', '修改', null, 'testplan:testplan:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('174', '170', '删除', null, 'testplan:testplan:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('175', '140', '班级成绩管理', 'modules/exam/exam.html', null, '1', 'fa fa-file-code-o', '2');
INSERT INTO `sys_menu` VALUES ('176', '175', '查看', null, 'exam:exam:list,exam:exam:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('177', '175', '新增', null, 'exam:exam:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('178', '175', '修改', null, 'exam:exam:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('179', '175', '删除', null, 'exam:exam:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('180', '140', '专业成绩管理', 'modules/exam/exam.html', null, '1', 'fa fa-file-code-o', '3');
INSERT INTO `sys_menu` VALUES ('181', '180', '查看', null, 'exam:exam:list,exam:exam:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('182', '180', '新增', null, 'exam:exam:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('183', '180', '修改', null, 'exam:exam:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('184', '180', '删除', null, 'exam:exam:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('185', '140', '教师评价成绩管理', 'modules/teacherass/teacherass.html', null, '1', 'fa fa-file-code-o', '5');
INSERT INTO `sys_menu` VALUES ('186', '185', '查看', null, 'teacherass:teacherass:list,teacherass:teacherass:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('187', '185', '新增', null, 'teacherass:teacherass:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('188', '185', '修改', null, 'teacherass:teacherass:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('189', '185', '删除', null, 'teacherass:teacherass:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('190', '141', '题库查询', 'modules/question/question.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('191', '190', '查看', null, 'question:question:list,question:question:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('192', '190', '新增', null, 'question:question:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('193', '190', '修改', null, 'question:question:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('194', '190', '删除', null, 'question:question:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('196', '136', '教学督导管理', '/', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('197', '154', '待评价教师', 'modules/teacherass/teacherass.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('198', '197', '查看', null, 'teacherass:teacherass:list,teacherass:teacherass:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('199', '197', '新增', null, 'teacherass:teacherass:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('200', '197', '修改', null, 'teacherass:teacherass:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('201', '197', '删除', null, 'teacherass:teacherass:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('202', '154', '已评价教师', 'modules/teacherass/teacherass.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('203', '202', '查看', null, 'teacherass:teacherass:list,teacherass:teacherass:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('204', '202', '新增', null, 'teacherass:teacherass:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('205', '202', '修改', null, 'teacherass:teacherass:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('206', '202', '删除', null, 'teacherass:teacherass:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('207', '154', '综合查询', 'modules/teacherass/teacherass.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('208', '207', '查看', null, 'teacherass:teacherass:list,teacherass:teacherass:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('209', '207', '新增', null, 'teacherass:teacherass:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('210', '207', '修改', null, 'teacherass:teacherass:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('211', '207', '删除', null, 'teacherass:teacherass:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('212', '152', '待评价教师', 'modules/teacherass/teacherass.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('213', '212', '查看', null, 'teacherass:teacherass:list,teacherass:teacherass:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('214', '212', '新增', null, 'teacherass:teacherass:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('215', '212', '修改', null, 'teacherass:teacherass:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('216', '212', '删除', null, 'teacherass:teacherass:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('217', '152', '已评价教师', 'modules/teacherass/teacherass.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('218', '217', '查看', null, 'teacherass:teacherass:list,teacherass:teacherass:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('219', '217', '新增', null, 'teacherass:teacherass:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('220', '217', '修改', null, 'teacherass:teacherass:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('221', '217', '删除', null, 'teacherass:teacherass:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('222', '152', '综合查询', 'modules/teacherass/teacherass.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('223', '222', '查看', null, 'teacherass:teacherass:list,teacherass:teacherass:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('224', '222', '新增', null, 'teacherass:teacherass:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('225', '222', '修改', null, 'teacherass:teacherass:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('226', '222', '删除', null, 'teacherass:teacherass:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('227', '145', '待评价教师', 'modules/teacherass/teacherass.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('228', '227', '查看', null, 'teacherass:teacherass:list,teacherass:teacherass:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('229', '227', '新增', null, 'teacherass:teacherass:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('230', '227', '修改', null, 'teacherass:teacherass:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('231', '227', '删除', null, 'teacherass:teacherass:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('232', '145', '已评价教师', 'modules/teacherass/teacherass.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('233', '232', '查看', null, 'teacherass:teacherass:list,teacherass:teacherass:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('234', '232', '新增', null, 'teacherass:teacherass:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('235', '232', '修改', null, 'teacherass:teacherass:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('236', '232', '删除', null, 'teacherass:teacherass:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('237', '145', '综合查询', 'modules/teacherass/teacherass.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('238', '237', '查看', null, 'teacherass:teacherass:list,teacherass:teacherass:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('239', '237', '新增', null, 'teacherass:teacherass:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('240', '237', '修改', null, 'teacherass:teacherass:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('241', '237', '删除', null, 'teacherass:teacherass:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('242', '149', '考试计划', 'modules/testplan/testplan.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('243', '242', '查看', null, 'testplan:testplan:list,testplan:testplan:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('244', '242', '新增', null, 'testplan:testplan:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('245', '242', '修改', null, 'testplan:testplan:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('246', '242', '删除', null, 'testplan:testplan:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('247', '149', '成绩查询', 'modules/exam/exam.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('248', '247', '查看', null, 'exam:exam:list,exam:exam:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('249', '247', '新增', null, 'exam:exam:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('250', '247', '修改', null, 'exam:exam:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('251', '247', '删除', null, 'exam:exam:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('252', '153', '成绩查询', 'modules/exam/exam.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('253', '252', '查看', null, 'exam:exam:list,exam:exam:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('254', '252', '新增', null, 'exam:exam:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('255', '252', '修改', null, 'exam:exam:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('256', '252', '删除', null, 'exam:exam:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('257', '153', '考试计划', 'modules/testplan/testplan.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('258', '257', '查看', null, 'testplan:testplan:list,testplan:testplan:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('259', '257', '新增', null, 'testplan:testplan:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('260', '257', '修改', null, 'testplan:testplan:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('261', '257', '删除', null, 'testplan:testplan:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('262', '133', '教案上传', 'modules/teachplan/teachplan.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('263', '262', '查看', null, 'teachplan:teachplan:list,teachplan:teachplan:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('264', '262', '新增', null, 'teachplan:teachplan:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('265', '262', '修改', null, 'teachplan:teachplan:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('266', '262', '删除', null, 'teachplan:teachplan:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('267', '133', '教学计划', 'modules/lessonplan/lessonplan.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('268', '267', '查看', null, 'lessonplan:lessonplan:list,lessonplan:lessonplan:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('269', '267', '新增', null, 'lessonplan:lessonplan:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('270', '267', '修改', null, 'lessonplan:lessonplan:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('271', '267', '删除', null, 'lessonplan:lessonplan:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('272', '133', '科研成果', 'modules/achievements/achievements.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('273', '272', '查看', null, 'achievements:achievements:list,achievements:achievements:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('274', '272', '新增', null, 'achievements:achievements:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('275', '272', '修改', null, 'achievements:achievements:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('276', '272', '删除', null, 'achievements:achievements:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('277', '141', '组卷策略', 'modules/tactics/tactics.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('278', '277', '查看', null, 'tactics:tactics:list,tactics:tactics:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('279', '277', '新增', null, 'tactics:tactics:save,questiontype:questiontype:select', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('280', '277', '修改', null, 'tactics:tactics:update,questiontype:questiontype:select', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('281', '277', '删除', null, 'tactics:tactics:delete', '2', null, '6');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '拥有所有权限', '1', '2018-03-18 13:22:03');
INSERT INTO `sys_role` VALUES ('2', '教学督导', '配置相应的权限', '1', '2018-03-18 13:25:01');
INSERT INTO `sys_role` VALUES ('3', '教师', '配置相应权限', '1', '2018-03-18 13:25:17');
INSERT INTO `sys_role` VALUES ('4', '学生', '配置相应权限', '1', '2018-03-18 13:25:33');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '-666666');
INSERT INTO `sys_role_menu` VALUES ('3', '3', '-666666');
INSERT INTO `sys_role_menu` VALUES ('174', '4', '171');
INSERT INTO `sys_role_menu` VALUES ('175', '4', '113');
INSERT INTO `sys_role_menu` VALUES ('176', '4', '128');
INSERT INTO `sys_role_menu` VALUES ('177', '4', '129');
INSERT INTO `sys_role_menu` VALUES ('178', '4', '130');
INSERT INTO `sys_role_menu` VALUES ('179', '4', '152');
INSERT INTO `sys_role_menu` VALUES ('180', '4', '212');
INSERT INTO `sys_role_menu` VALUES ('181', '4', '213');
INSERT INTO `sys_role_menu` VALUES ('182', '4', '214');
INSERT INTO `sys_role_menu` VALUES ('183', '4', '215');
INSERT INTO `sys_role_menu` VALUES ('184', '4', '216');
INSERT INTO `sys_role_menu` VALUES ('185', '4', '217');
INSERT INTO `sys_role_menu` VALUES ('186', '4', '218');
INSERT INTO `sys_role_menu` VALUES ('187', '4', '219');
INSERT INTO `sys_role_menu` VALUES ('188', '4', '220');
INSERT INTO `sys_role_menu` VALUES ('189', '4', '221');
INSERT INTO `sys_role_menu` VALUES ('190', '4', '222');
INSERT INTO `sys_role_menu` VALUES ('191', '4', '223');
INSERT INTO `sys_role_menu` VALUES ('192', '4', '224');
INSERT INTO `sys_role_menu` VALUES ('193', '4', '225');
INSERT INTO `sys_role_menu` VALUES ('194', '4', '226');
INSERT INTO `sys_role_menu` VALUES ('195', '4', '253');
INSERT INTO `sys_role_menu` VALUES ('196', '4', '258');
INSERT INTO `sys_role_menu` VALUES ('197', '4', '198');
INSERT INTO `sys_role_menu` VALUES ('198', '4', '203');
INSERT INTO `sys_role_menu` VALUES ('199', '4', '208');
INSERT INTO `sys_role_menu` VALUES ('200', '4', '-666666');
INSERT INTO `sys_role_menu` VALUES ('201', '4', '132');
INSERT INTO `sys_role_menu` VALUES ('202', '4', '139');
INSERT INTO `sys_role_menu` VALUES ('203', '4', '170');
INSERT INTO `sys_role_menu` VALUES ('204', '4', '140');
INSERT INTO `sys_role_menu` VALUES ('205', '4', '112');
INSERT INTO `sys_role_menu` VALUES ('206', '4', '127');
INSERT INTO `sys_role_menu` VALUES ('207', '4', '134');
INSERT INTO `sys_role_menu` VALUES ('208', '4', '153');
INSERT INTO `sys_role_menu` VALUES ('209', '4', '252');
INSERT INTO `sys_role_menu` VALUES ('210', '4', '257');
INSERT INTO `sys_role_menu` VALUES ('211', '4', '154');
INSERT INTO `sys_role_menu` VALUES ('212', '4', '197');
INSERT INTO `sys_role_menu` VALUES ('213', '4', '202');
INSERT INTO `sys_role_menu` VALUES ('214', '4', '207');
INSERT INTO `sys_role_menu` VALUES ('215', '2', '135');
INSERT INTO `sys_role_menu` VALUES ('216', '2', '163');
INSERT INTO `sys_role_menu` VALUES ('217', '2', '164');
INSERT INTO `sys_role_menu` VALUES ('218', '2', '-666666');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', '776989980@qq.com', '15555510431', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'supe', 'b53e32e734fbf5c971fe8e56d794f4b09939d51b7f5527e369211a4dc9a34cba', 'GZkh1eDcxd4wkUgy71dA', 'zkp0113@qq.com', '15908990206', '1', '1', '2018-03-18 12:57:48');
INSERT INTO `sys_user` VALUES ('3', 'teacher', 'cfb6865ea3827238372df84404a24ab1c88d17f9d976ac41509ac13305f8577b', 'DwMwG0YOrYjZ2f3C3OFz', 'zkp0113@qq.com', '15555510431', '1', '1', '2018-03-18 14:39:22');
INSERT INTO `sys_user` VALUES ('4', 'student', '852f19739e4f2d1ec97fe6e11b11e1aa7bc17b2ddbf33f1b0fd579588a007c32', 'FxmiopsCJ82OEBQhj3E9', '776989980@qq.com', '15555510431', '1', '1', '2018-03-18 14:39:56');
INSERT INTO `sys_user` VALUES ('5', '张坤鹏', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '776989980@qq.com', '15555510431', '1', '1', null);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('8', '4', '4');
INSERT INTO `sys_user_role` VALUES ('9', '3', '3');
INSERT INTO `sys_user_role` VALUES ('10', '2', '2');
INSERT INTO `sys_user_role` VALUES ('11', '1', '1');
INSERT INTO `sys_user_role` VALUES ('13', '5', '1');
INSERT INTO `sys_user_role` VALUES ('14', '5', '2');
INSERT INTO `sys_user_role` VALUES ('15', '5', '3');
INSERT INTO `sys_user_role` VALUES ('16', '5', '4');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', 'c7f6aa5b106fe6b05a7f004d789a7fd2', '2018-04-09 08:23:36', '2018-04-08 20:23:36');
INSERT INTO `sys_user_token` VALUES ('4', 'a13c8ec28e62885e7e0ee8a7c36d4817', '2018-03-31 10:37:38', '2018-03-30 22:37:38');
INSERT INTO `sys_user_token` VALUES ('5', '6b7ab38940b051287cd43582c636bec4', '2018-03-31 10:50:15', '2018-03-30 22:50:15');

-- ----------------------------
-- Table structure for tb_achievements
-- ----------------------------
DROP TABLE IF EXISTS `tb_achievements`;
CREATE TABLE `tb_achievements` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `achievementsname` varchar(100) DEFAULT NULL COMMENT '科研名称',
  `achievementsdesc` varchar(100) DEFAULT NULL COMMENT '科研简介',
  `attachname` varchar(50) DEFAULT NULL COMMENT '附件名称',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='科研成果表';

-- ----------------------------
-- Records of tb_achievements
-- ----------------------------
INSERT INTO `tb_achievements` VALUES ('1', '土木交流大会论文发表成功', '土木领域的一次大会', '201801231786454.pdf', '1', '2018-03-28 06:50:42', null);

-- ----------------------------
-- Table structure for tb_college
-- ----------------------------
DROP TABLE IF EXISTS `tb_college`;
CREATE TABLE `tb_college` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `collegenum` varchar(8) DEFAULT NULL COMMENT '学院编号',
  `collegename` varchar(50) DEFAULT NULL COMMENT '学院名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建人',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_collegenum_index` (`collegenum`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='学院信息表';

-- ----------------------------
-- Records of tb_college
-- ----------------------------
INSERT INTO `tb_college` VALUES ('1', '01', '电气与计算机学院', '2018-03-25 11:23:11', 'admin', '计算机');
INSERT INTO `tb_college` VALUES ('2', '02', '土木工程学院', '2018-03-26 21:38:31', 'admin', '土木');
INSERT INTO `tb_college` VALUES ('3', '03', '经济与管理学院', '2018-03-26 21:41:45', 'admin', '经管');
INSERT INTO `tb_college` VALUES ('5', '04', '测绘与勘察学院', '2018-03-30 14:25:29', 'admin', '测勘');
INSERT INTO `tb_college` VALUES ('6', '05', '建筑与规划学院', '2018-03-30 14:25:51', 'admin', '建筑');
INSERT INTO `tb_college` VALUES ('7', '06', '艺术设计学院', '2018-03-30 18:28:46', 'admin', '艺术');
INSERT INTO `tb_college` VALUES ('8', '07', '材料科学与工程学院', '2018-03-30 18:29:31', 'admin', '材料');
INSERT INTO `tb_college` VALUES ('9', '08', '马克思学院', '2018-03-30 18:29:35', 'admin', '马克思');
INSERT INTO `tb_college` VALUES ('10', '09', '市政与环境工程学院', '2018-03-30 18:29:56', 'admin', '市政');
INSERT INTO `tb_college` VALUES ('11', '10', '书法学院', '2018-03-30 18:30:26', 'admin', '书法');
INSERT INTO `tb_college` VALUES ('12', '11', '交通科学与工程学院', '2018-03-30 18:31:13', 'admin', '交通');

-- ----------------------------
-- Table structure for tb_course
-- ----------------------------
DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `coursenum` varchar(8) DEFAULT NULL COMMENT '课程编号',
  `coursename` varchar(8) DEFAULT NULL COMMENT '课程名称',
  `collegenum` varchar(8) DEFAULT NULL COMMENT '学院编号',
  `majornum` varchar(8) DEFAULT NULL COMMENT '专业编号',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建人',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_coursenum_index` (`coursenum`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='课程信息表';

-- ----------------------------
-- Records of tb_course
-- ----------------------------
INSERT INTO `tb_course` VALUES ('1', '01', '计算机组成原理', '01', '0101', '2018-03-25 12:23:12', 'admin', '计算机硬件课');
INSERT INTO `tb_course` VALUES ('2', '02', '离散数学', '01', '0102', '2018-03-26 22:26:38', 'admin', '计算机基础课');
INSERT INTO `tb_course` VALUES ('3', '03', '操作系统', '01', '0103', '2018-03-05 14:26:13', 'admin', '计算机专业课');
INSERT INTO `tb_course` VALUES ('4', '04', '土木工程', '02', '0201', '2018-03-05 18:35:43', 'admin', '地下专业课');
INSERT INTO `tb_course` VALUES ('5', '05', '工程制图', '02', '0202', '2018-03-05 18:35:45', 'admin', '土木专业课');
INSERT INTO `tb_course` VALUES ('6', '06', '工程力学', '02', '0203', '2018-03-05 18:35:48', 'admin', '工学基础课');
INSERT INTO `tb_course` VALUES ('7', '07', '不动产设施管理', '03', '0301', '2018-03-05 18:44:58', 'admin', '管理基础课');
INSERT INTO `tb_course` VALUES ('8', '08', 'FIDC合同', '03', '0302', '2018-03-05 18:45:01', 'admin', '管理专业课');
INSERT INTO `tb_course` VALUES ('9', '09', '硬笔书法', '10', '0901', '2018-03-05 18:45:40', 'admin', '书法基础课');
INSERT INTO `tb_course` VALUES ('10', '10', '管道设计', '09', '1001', '2018-03-13 18:46:00', 'admin', '暖通专业课');
INSERT INTO `tb_course` VALUES ('11', '11', '计算机网络', '01', '0103', '2018-01-17 12:05:37', 'admin', '计算机专业课');

-- ----------------------------
-- Table structure for tb_exam
-- ----------------------------
DROP TABLE IF EXISTS `tb_exam`;
CREATE TABLE `tb_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `collegenum` varchar(8) DEFAULT NULL COMMENT '学院编号',
  `majornum` varchar(8) DEFAULT NULL COMMENT '专业编号',
  `coursenum` varchar(8) DEFAULT NULL COMMENT '课程编号',
  `gradenum` varchar(8) DEFAULT NULL COMMENT '班级编号',
  `studentnum` varchar(8) DEFAULT NULL COMMENT '学生学号',
  `score` varchar(8) DEFAULT '0' COMMENT '考试成绩',
  `createtime` datetime DEFAULT NULL COMMENT '录入时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_collegenum_index` (`collegenum`),
  KEY `idx_majornum_index` (`majornum`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='考试成绩信息表';

-- ----------------------------
-- Records of tb_exam
-- ----------------------------
INSERT INTO `tb_exam` VALUES ('1', '01', '0103', '03', '010301', '01030101', '86', '2018-03-25 14:23:11', '1');
INSERT INTO `tb_exam` VALUES ('2', '01', '0103', '03', '010301', '01030102', '95', '2018-03-29 22:04:36', null);
INSERT INTO `tb_exam` VALUES ('3', '01', '0103', '03', '010301', '01030103', '92', '2010-06-23 09:43:37', null);
INSERT INTO `tb_exam` VALUES ('4', '01', '0103', '11', '010301', '01030101', '89', '2018-01-01 12:13:40', null);
INSERT INTO `tb_exam` VALUES ('5', '01', '0103', '11', '010301', '01030102', '92', '2018-04-02 12:13:47', null);
INSERT INTO `tb_exam` VALUES ('6', '01', '0103', '11', '010301', '01030102', '95', '2018-01-09 12:13:51', null);

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `goods_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '商品名',
  `intro` varchar(500) DEFAULT NULL COMMENT '介绍',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品管理';

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('2', 'APPLE', 'PURPLE', '10.00', '1');

-- ----------------------------
-- Table structure for tb_grade
-- ----------------------------
DROP TABLE IF EXISTS `tb_grade`;
CREATE TABLE `tb_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `gradenum` varchar(8) DEFAULT NULL COMMENT '班级编号',
  `gradename` varchar(8) DEFAULT NULL COMMENT '班级名称',
  `collegenum` varchar(8) DEFAULT NULL COMMENT '学院编号',
  `majornum` varchar(8) DEFAULT NULL COMMENT '专业编号',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建人',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_collegenum_index` (`collegenum`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='班级信息表';

-- ----------------------------
-- Records of tb_grade
-- ----------------------------
INSERT INTO `tb_grade` VALUES ('1', '010101', '计算机111', '01', '0101', '2018-03-25 12:23:11', 'admin', '计算机111班');
INSERT INTO `tb_grade` VALUES ('2', '010102', '计算机112', '01', '0101', '2018-03-26 22:19:32', 'admin', '计算机112班');
INSERT INTO `tb_grade` VALUES ('3', '010201', '软件111', '01', '0102', '2018-03-15 19:07:39', 'admin', '软件111班');
INSERT INTO `tb_grade` VALUES ('4', '010202', '软件112', '01', '0102', '2018-03-14 19:07:43', 'admin', '软件112班');
INSERT INTO `tb_grade` VALUES ('5', '010301', '网络111', '01', '0103', '2018-03-07 19:08:24', 'admin', '网络111班');
INSERT INTO `tb_grade` VALUES ('6', '010302', '网络112', '01', '0103', '2018-03-06 19:08:48', 'admin', '网络112班');
INSERT INTO `tb_grade` VALUES ('7', '020101', '地下111', '02', '0201', '2018-03-05 19:12:23', 'admin', '地下111');
INSERT INTO `tb_grade` VALUES ('8', '020201', '土木111', '02', '0202', '2018-03-07 19:12:28', 'admin', '土木111');
INSERT INTO `tb_grade` VALUES ('9', '020301', '机械111', '02', '0203', '2018-03-15 19:12:31', 'admin', '机械111');
INSERT INTO `tb_grade` VALUES ('10', '030101', '造价111', '03', '0301', '2018-03-06 19:17:07', 'admin', '造价111');
INSERT INTO `tb_grade` VALUES ('11', '030201', '程管111', '03', '0302', '2018-03-03 19:17:11', 'admin', '程管111');

-- ----------------------------
-- Table structure for tb_lessonplan
-- ----------------------------
DROP TABLE IF EXISTS `tb_lessonplan`;
CREATE TABLE `tb_lessonplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `lessonplanname` varchar(100) DEFAULT NULL COMMENT '计划名称',
  `attachname` varchar(50) DEFAULT NULL COMMENT '附件名称',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='教案信息表';

-- ----------------------------
-- Records of tb_lessonplan
-- ----------------------------
INSERT INTO `tb_lessonplan` VALUES ('1', '2018年英语教学计划', '201801.word', '1', '2018-03-28 06:44:11', null);

-- ----------------------------
-- Table structure for tb_major
-- ----------------------------
DROP TABLE IF EXISTS `tb_major`;
CREATE TABLE `tb_major` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `majornum` varchar(8) DEFAULT NULL COMMENT '专业编号',
  `majorname` varchar(8) DEFAULT NULL COMMENT '专业名称',
  `collegenum` varchar(8) DEFAULT NULL COMMENT '学院编号',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建人',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_collegenum_index` (`collegenum`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='专业信息表';

-- ----------------------------
-- Records of tb_major
-- ----------------------------
INSERT INTO `tb_major` VALUES ('1', '0103', '网络工程', '01', '2018-03-25 12:34:12', 'admin', '计算机');
INSERT INTO `tb_major` VALUES ('2', '0101', '计算机科学与技术', '01', '2018-03-24 18:48:19', 'admin', '计算机');
INSERT INTO `tb_major` VALUES ('3', '0102', '软件工程', '01', '2018-03-24 18:48:24', 'admin', '计算机');
INSERT INTO `tb_major` VALUES ('4', '0201', '土木工程', '02', '2018-03-15 18:50:55', 'admin', '土木');
INSERT INTO `tb_major` VALUES ('5', '0202', '地下空间', '02', '2018-03-22 18:50:58', 'admin', '土木');
INSERT INTO `tb_major` VALUES ('6', '0203', '机械工程', '02', '2018-03-14 18:51:29', 'admin', '土木');
INSERT INTO `tb_major` VALUES ('7', '0301', '工程造价', '03', '2018-03-16 18:52:12', 'admin', '管理');
INSERT INTO `tb_major` VALUES ('8', '0302', '工程管理', '03', '2018-03-08 18:52:47', 'admin', '管理');
INSERT INTO `tb_major` VALUES ('9', '0901', '书法', '09', '2018-03-07 18:53:25', 'admin', '书法');
INSERT INTO `tb_major` VALUES ('10', '1001', '暖通', '10', '2018-03-08 18:53:58', 'admin', '市政');

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `collegenum` varchar(8) DEFAULT NULL COMMENT '学院编号',
  `majornum` varchar(8) DEFAULT NULL COMMENT '专业编号',
  `coursenum` varchar(8) DEFAULT NULL COMMENT '课程编号',
  `gradenum` varchar(8) DEFAULT NULL COMMENT '班级编号',
  `questionnum` varchar(8) DEFAULT NULL COMMENT '题目编号',
  `questiontype` varchar(8) DEFAULT NULL COMMENT '题目类型编号',
  `questioncotent` longtext COMMENT '题目内容',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_collegenum_index` (`collegenum`),
  KEY `idx_majornum_index` (`majornum`)
) ENGINE=InnoDB AUTO_INCREMENT=945 DEFAULT CHARSET=utf8 COMMENT='考试成绩信息表';

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES ('1', '01', '0103', '03', '010301', '001', '02', '尽管磁盘是一种可共享设备，但（）仍只有一个作业能启动磁盘。', '填空');
INSERT INTO `tb_question` VALUES ('2', '01', '0103', '03', '010301', '002', '02', '操作系统为用户提供三种类型的使用接口，它们是命令方式和系统调用和图形用户界面。', '填空');
INSERT INTO `tb_question` VALUES ('3', '01', '0103', '03', '010301', '003', '02', '主存储器与外围设备之间的数据传送控制方式有程序直接控制、中断驱动方式、DMA方式和通道控制方式。', '填空');
INSERT INTO `tb_question` VALUES ('4', '01', '0103', '03', '010301', '004', '02', '在响应比最高者优先的作业调度算法中，当各个作业等待时间相同时，运行时间短的作业将得到优先调度；当各个作业要求运行的时间相同时，等待时间长的作业得到优先调度。', '填空');
INSERT INTO `tb_question` VALUES ('5', '01', '0103', '03', '010301', '005', '02', '当一个进程独占处理器顺序执行时，具有两个特性：封闭性和可再现性。', '填空');
INSERT INTO `tb_question` VALUES ('6', '01', '0103', '03', '010301', '006', '02', '程序经编译或汇编以后形成目标程序，其指令的顺序都是以零作为参考地址，这些地址称为逻辑地址。', '填空');
INSERT INTO `tb_question` VALUES ('7', '01', '0103', '03', '010301', '007', '02', '文件的逻辑结构分流式文件和记录式文件二种。', '填空');
INSERT INTO `tb_question` VALUES ('8', '01', '0103', '03', '010301', '008', '02', '进程由程度、数据和FCB组成。', '填空');
INSERT INTO `tb_question` VALUES ('9', '01', '0103', '03', '010301', '009', '02', '对信号量S的操作只能通过原语操作进行，对应每一个信号量设置了一个等待队列。', '填空');
INSERT INTO `tb_question` VALUES ('10', '01', '0103', '03', '010301', '010', '02', '操作系统是运行在计算机裸机系统上的最基本的系统软件。', '填空');
INSERT INTO `tb_question` VALUES ('11', '01', '0103', '03', '010301', '011', '02', '虚拟设备是指采用SPOOLING技术，将某个独享设备改进为供多个用户使用的的共享设备。', '填空');
INSERT INTO `tb_question` VALUES ('12', '01', '0103', '03', '010301', '012', '02', '文件系统中，用于文件的描述和控制并与文件一一对应的是文件控制块。', '填空');
INSERT INTO `tb_question` VALUES ('13', '01', '0103', '03', '010301', '013', '02', '段式管理中，以段为单位 ，每段分配一个连续区。由于各段长度不同，所以这些存储区的大小不一，而且同一进程的各段之间不要求连续。', '填空');
INSERT INTO `tb_question` VALUES ('14', '01', '0103', '03', '010301', '014', '02', '逻辑设备表（LUT）的主要功能是实现设备独立性。', '填空');
INSERT INTO `tb_question` VALUES ('15', '01', '0103', '03', '010301', '015', '02', '在采用请求分页式存储管理的系统中，地址变换过程可能会因为缺页和越界等原因而产生中断。', '填空');
INSERT INTO `tb_question` VALUES ('16', '01', '0103', '03', '010301', '016', '02', '文件的物理结构分为顺序文件、索引文件和索引顺序文件。', '填空');
INSERT INTO `tb_question` VALUES ('17', '01', '0103', '03', '010301', '017', '02', '段的共享是通过共享段表实现的。', '填空');
INSERT INTO `tb_question` VALUES ('18', '01', '0103', '03', '010301', '018', '02', '文件的物理结构分为顺序文件、索引文件和索引顺序文件。', '填空');
INSERT INTO `tb_question` VALUES ('19', '01', '0103', '03', '010301', '019', '02', '所谓设备控制器，是一块能控制一台或多台外围设备与CPU并行工作的硬件。', '填空');
INSERT INTO `tb_question` VALUES ('20', '01', '0103', '03', '010301', '020', '02', 'UNIX的文件系统空闲空间的管理是采用成组链接法。', '填空');
INSERT INTO `tb_question` VALUES ('21', '01', '0103', '03', '010301', '021', '02', '分页管理储管理方式能使存储碎片尽可能少，而且使内存利用率较高，管理开销小。', '填空');
INSERT INTO `tb_question` VALUES ('22', '01', '0103', '03', '010301', '022', '02', '计算机操作系统是方便用户、管理和控制计算机软硬件资源的系统软件。', '填空');
INSERT INTO `tb_question` VALUES ('23', '01', '0103', '03', '010301', '023', '02', '操作系统目前有五大类型：批处理操作系统、分时操作系统、实时操作系统、网络操作系统和分布式操作系统。', '填空');
INSERT INTO `tb_question` VALUES ('24', '01', '0103', '03', '010301', '024', '02', '按文件的逻辑存储结构分，文件分为有结构文件，又称为记录式文件和无结构文件，又称流式文件。', '填空');
INSERT INTO `tb_question` VALUES ('25', '01', '0103', '03', '010301', '025', '02', '主存储器与外围设备之间的信息传送操作称为输入输出操作。', '填空');
INSERT INTO `tb_question` VALUES ('26', '01', '0103', '03', '010301', '026', '02', '在设备管理中，为了克服独占设备速度较慢、降低设备资源利用率的缺点，引入了虚拟分配技术，即用共享设备模拟独占设备。', '填空');
INSERT INTO `tb_question` VALUES ('27', '01', '0103', '03', '010301', '027', '02', '常用的内存管理方法有分区管理、页式管理、段式管理和段页式管理。', '填空');
INSERT INTO `tb_question` VALUES ('28', '01', '0103', '03', '010301', '028', '02', '动态存储分配时，要靠硬件地址变换机构实现重定位。', '填空');
INSERT INTO `tb_question` VALUES ('29', '01', '0103', '03', '010301', '029', '02', '在存储管理中常用虚拟存储器方式来摆脱主存容量的限制。', '填空');
INSERT INTO `tb_question` VALUES ('30', '01', '0103', '03', '010301', '030', '02', '在请求页式管理中，当硬件变换机构发现所需的页不在内存时，产生缺页中断信号，中断处理程序作相应的处理。', '填空');
INSERT INTO `tb_question` VALUES ('31', '01', '0103', '03', '010301', '031', '02', '置换算法是在内存中没有空闲页面时被调用的，它的目的是选出一个被淘汰的页面。如果内存中有足够的空闲页面存放所调入的页，则不必使用置换算法。', '填空');
INSERT INTO `tb_question` VALUES ('32', '01', '0103', '03', '010301', '032', '02', '在段页式存储管理系统中，面向用户的地址空间是段式划分，面向物理实现的地址空间是页式划分。', '填空');
INSERT INTO `tb_question` VALUES ('33', '01', '0103', '03', '010301', '033', '02', '文件的存储器是分成大小相等的物理块，并以它为单位交换信息。', '填空');
INSERT INTO `tb_question` VALUES ('34', '01', '0103', '03', '010301', '034', '02', '虚拟设备是通过SPOOLing技术把独占设备变成能为若干用户共享的设备。', '填空');
INSERT INTO `tb_question` VALUES ('35', '01', '0103', '03', '010301', '035', '02', '缓冲区的设置可分为单缓冲、双缓冲、多缓冲和缓冲池。', '填空');
INSERT INTO `tb_question` VALUES ('36', '01', '0103', '03', '010301', '036', '02', '在多道程序环境中，用户程序的相对地址与装入内存后的实际物理地址不同，把相对地址转换为物理地址，这是操作系统的地址重地位功能。', '填空');
INSERT INTO `tb_question` VALUES ('37', '01', '0103', '03', '010301', '037', '02', ' 在操作系统中，进程是一个资源分配的基本单位，也是一个独立运行和调度', '填空');
INSERT INTO `tb_question` VALUES ('38', '01', '0103', '03', '010301', '038', '02', '的基本单位。', '填空');
INSERT INTO `tb_question` VALUES ('39', '01', '0103', '03', '010301', '039', '02', '在信号量机制中，信号量S > 0时的值表示可用资源数目；若S < 0，则表示等待该资源的进程数，此时进程应阻塞。', '填空');
INSERT INTO `tb_question` VALUES ('40', '01', '0103', '03', '010301', '040', '02', '操作系统提供给编程人员的唯一接口是系统调用。', '填空');
INSERT INTO `tb_question` VALUES ('41', '01', '0103', '03', '010301', '041', '02', '设备从资源分配角度可分为独占设备，共享设备和虚拟设备。', '填空');
INSERT INTO `tb_question` VALUES ('42', '01', '0103', '03', '010301', '042', '02', '设备管理的主要任务是控制设备和CPU之间进行I/O操作。', '填空');
INSERT INTO `tb_question` VALUES ('43', '01', '0103', '03', '010301', '043', '02', '常用的文件存取方法有顺序存取法，随机存取法和按键存取法。 ', '填空');
INSERT INTO `tb_question` VALUES ('44', '01', '0103', '03', '010301', '044', '02', '在页面置换算法中最有效的一种称为LRU算法。', '填空');
INSERT INTO `tb_question` VALUES ('45', '01', '0103', '03', '010301', '045', '02', '地址变换机构的基本任务是将虚地址空间中的逻辑地址变换为内存中的物理地址。', '填空');
INSERT INTO `tb_question` VALUES ('46', '01', '0103', '03', '010301', '046', '02', '在 UNIX 系统中采用的页面置换算法是页面缓冲算法。', '填空');
INSERT INTO `tb_question` VALUES ('47', '01', '0103', '03', '010301', '047', '02', '现代操作系统的两个重要特征是并发和共享。', '填空');
INSERT INTO `tb_question` VALUES ('48', '01', '0103', '03', '010301', '048', '02', '为文件 file.c 的同组用户增加修改权限的 UNIX 命令为chmod  g+w  file.c。', '填空');
INSERT INTO `tb_question` VALUES ('49', '01', '0103', '03', '010301', '049', '02', '显示目录 mydir 中文件的详细信息的 UNIX 命令为Ls –l  mydir。', '填空');
INSERT INTO `tb_question` VALUES ('50', '01', '0103', '03', '010301', '050', '02', '操作系统的基本类型有批处理操作系统，分时操作系统和实时操作系统三种。', '填空');
INSERT INTO `tb_question` VALUES ('51', '01', '0103', '03', '010301', '051', '02', '采用对换方式在将进程换出时，应首先选择处于阻塞且优先权低的进程换出内存。', '填空');
INSERT INTO `tb_question` VALUES ('52', '01', '0103', '03', '010301', '052', '02', '能方便实现信息共享的存储管理办法有段式和段页式。', '填空');
INSERT INTO `tb_question` VALUES ('53', '01', '0103', '03', '010301', '053', '02', '选择距当前磁头最近，且方向一致的磁盘调度算法循环扫描算法。', '填空');
INSERT INTO `tb_question` VALUES ('54', '01', '0103', '03', '010301', '054', '02', '在页面置换算法中可实现的最有效的一种称为LRU。', '填空');
INSERT INTO `tb_question` VALUES ('55', '01', '0103', '03', '010301', '055', '02', 'UNIX 系统向用户提供的用于创建新进程的系统调用是fork()。', '填空');
INSERT INTO `tb_question` VALUES ('56', '01', '0103', '03', '010301', '056', '02', 'UNIX 系统中用于建立无名管道的系统调用是pipe()。', '填空');
INSERT INTO `tb_question` VALUES ('57', '01', '0103', '03', '010301', '057', '02', '在成组链结法中，将第一组的空闲块号和该组的空闲块数目  记入到                内存的工作栈中，作为当前可供分配的空闲盘块号。', '填空');
INSERT INTO `tb_question` VALUES ('58', '01', '0103', '03', '010301', '058', '02', '现代操作系统的两个重要特征是并发和共享。', '填空');
INSERT INTO `tb_question` VALUES ('59', '01', '0103', '03', '010301', '059', '02', '为文件 file 增加执行权限的 UNIX 命令为chmod  +x  file。', '填空');
INSERT INTO `tb_question` VALUES ('60', '01', '0103', '03', '010301', '060', '02', '显示目录 mydir 中文件的详细信息的 UNIX 命令为ls –l  mydir。', '填空');
INSERT INTO `tb_question` VALUES ('61', '01', '0103', '03', '010301', '061', '02', '在动态分区式内存分配算法中，倾向于优先使用低地址部分空闲区的算法是首次适应算法  ；能使内存空间中空闲区分布较均匀的算法是循环首次适应算法。', '填空');
INSERT INTO `tb_question` VALUES ('62', '01', '0103', '03', '010301', '062', '02', '在分时系统中，当用户数目为100时，为保证响应时间不超过2秒，此时时间片最大应为20ms。分时系统采用的调度方法是时间片轮转调度算法。', '填空');
INSERT INTO `tb_question` VALUES ('63', '01', '0103', '03', '010301', '063', '02', '常用的进程通信方式有管道、共享存储区、消息机制和邮箱机制。', '填空');
INSERT INTO `tb_question` VALUES ('64', '01', '0103', '03', '010301', '064', '02', '正在执行的进程等待I/O操作，其状态将由执行状态变为阻塞状态。', '填空');
INSERT INTO `tb_question` VALUES ('65', '01', '0103', '03', '010301', '065', '02', '页是信息的物理单位，进行分页是出于系统管理  的需要；段是信息的逻辑单位，分段是出于用户  的需要。', '填空');
INSERT INTO `tb_question` VALUES ('66', '01', '0103', '03', '010301', '066', '02', '存储管理中的快表是指联想存储器。', '填空');
INSERT INTO `tb_question` VALUES ('67', '01', '0103', '03', '010301', '067', '02', '分段保护中的越界检查是通过段表寄存器  中存放的段表长度  和段表中的段长                 等数据项。', '填空');
INSERT INTO `tb_question` VALUES ('68', '01', '0103', '03', '010301', '068', '02', '在请求调页系统中的调页策略有预调入策略，它是以预测为基础的；另一种是请求调入，由于较易实现，故目前使用较多。', '填空');
INSERT INTO `tb_question` VALUES ('69', '01', '0103', '03', '010301', '069', '02', '若干个事件在同一时刻发生称为并行，若干个事件在同一时间间隔内发生称为并发。', '填空');
INSERT INTO `tb_question` VALUES ('70', '01', '0103', '03', '010301', '070', '02', '使用缓冲区能有效地缓和I/O设备和CPU之间速度不匹配的矛盾。', '填空');
INSERT INTO `tb_question` VALUES ('71', '01', '0103', '03', '010301', '071', '02', '用户编写的程序与实际使用的物理设备无关，而由操作系统负责地址的重定位，我们称之为设备无关性（设备独立性）。', '填空');
INSERT INTO `tb_question` VALUES ('72', '01', '0103', '03', '010301', '072', '02', '用户是通过命令方式或者程序接口向计算机发出请求的。', '填空');
INSERT INTO `tb_question` VALUES ('73', '01', '0103', '03', '010301', '073', '02', '在操作系统中的异步性主要是指在系统中进程推进的顺序是走走停停。', '填空');
INSERT INTO `tb_question` VALUES ('74', '01', '0103', '03', '010301', '074', '02', '进程间通信的方式有管道、共享存储区和消息传递方式。', '填空');
INSERT INTO `tb_question` VALUES ('75', '01', '0103', '03', '010301', '075', '02', '计算机操作系统是方便用户、管理和控制计算机系统资源的系统软件。', '填空');
INSERT INTO `tb_question` VALUES ('76', '01', '0103', '03', '010301', '076', '02', '在多道程序环境中，用户程序的相对地址与装入内存后的实际物理地址不同，把相对地址转换为物理地址，这是操作系统的地址重地位功能。', '填空');
INSERT INTO `tb_question` VALUES ('77', '01', '0103', '03', '010301', '077', '02', '操作系的动态分区管理内存分配算法有首次适应算法、循环首次适应算法、和最佳适应算法。', '填空');
INSERT INTO `tb_question` VALUES ('78', '01', '0103', '03', '010301', '078', '02', '动态存储分配时，要靠硬件地址变换机构实现重定位。', '填空');
INSERT INTO `tb_question` VALUES ('79', '01', '0103', '03', '010301', '079', '02', '在存储管理中常用虚拟存储器方式来摆脱主存容量的限制。', '填空');
INSERT INTO `tb_question` VALUES ('80', '01', '0103', '03', '010301', '080', '02', '在请求页式管理中，当硬件变换机构发现所需的页不在内存时，产生缺页中断信号，中断处理程序作相应的处理。', '填空');
INSERT INTO `tb_question` VALUES ('81', '01', '0103', '03', '010301', '081', '02', '置换算法是在内存中没有空闲页面时被调用的，它的目的是选出一个被淘汰的页面。如果内存中有足够的空闲页面存放所调入的页，则不必使用置换算法。', '填空');
INSERT INTO `tb_question` VALUES ('82', '01', '0103', '03', '010301', '082', '02', '在段页式存储管理系统中，面向用户的地址空间是段式划分，面向物理实现的地址空间是页式划分。', '填空');
INSERT INTO `tb_question` VALUES ('83', '01', '0103', '03', '010301', '083', '02', '文件的存储器是分成大小相等的物理块，并以它为单位交换信息。', '填空');
INSERT INTO `tb_question` VALUES ('84', '01', '0103', '03', '010301', '084', '02', '通道是一个独立于CPU的专管I/O的处理机，它控制 设备与内存之间的信息交换。', '填空');
INSERT INTO `tb_question` VALUES ('85', '01', '0103', '03', '010301', '085', '02', '缓冲区的设置可分为单缓冲 、双缓冲、循环缓冲和缓冲池。 其中关于缓冲池的操作有提取输入、提取输出、收容输入和收容输出。', '填空');
INSERT INTO `tb_question` VALUES ('86', '01', '0103', '03', '010301', '086', '02', '操作系统为用户编程所提供的接口是系统调用。', '填空');
INSERT INTO `tb_question` VALUES ('87', '01', '0103', '03', '010301', '087', '02', '文件的逻辑结构分为流式文件、顺序文件、索引文件和索引顺序文件。', '填空');
INSERT INTO `tb_question` VALUES ('88', '01', '0103', '03', '010301', '088', '02', '进程由程序、数据和PCB组成。', '填空');
INSERT INTO `tb_question` VALUES ('89', '01', '0103', '03', '010301', '089', '02', '一张1.44M的软盘，其FAT表占的空间为2.16K。', '填空');
INSERT INTO `tb_question` VALUES ('90', '01', '0103', '03', '010301', '090', '02', '缓冲池包括空白缓冲队列、装满输入数据的缓冲队列和装满输出数据的缓冲队列三种队列。', '填空');
INSERT INTO `tb_question` VALUES ('91', '01', '0103', '03', '010301', '091', '02', '在生产者—消费者问题中，消费者进程的两个wait原语的正确顺序为', '填空');
INSERT INTO `tb_question` VALUES ('92', '01', '0103', '03', '010301', '092', '02', 'Wait(full)；和wait(mutex);。', '填空');
INSERT INTO `tb_question` VALUES ('93', '01', '0103', '03', '010301', '093', '02', '段式管理中，提供二维维的地址结构。以段为单位进行空间分配，每段分配一个连续内存区。', '填空');
INSERT INTO `tb_question` VALUES ('94', '01', '0103', '03', '010301', '094', '02', '逻辑设备表（LUT）的主要功能是实现逻辑设备到物理设备的映射。', '填空');
INSERT INTO `tb_question` VALUES ('95', '01', '0103', '03', '010301', '095', '02', '在一个请求分页系统中，假如系统分配给一个作业的物理块数为3，且此作业的页面走向为2，3，2，1，5，2，4，5，3，2，5，2。OTP算法的页面置换次数为3  ，LRU算法的页面置换次数为4，CLOCK算法的页面置换次数为5	。', '填空');
INSERT INTO `tb_question` VALUES ('96', '01', '0103', '03', '010301', '096', '02', '进程间通信的类型有：共享存储区、管道机制、消息队列和信箱机制。', '填空');
INSERT INTO `tb_question` VALUES ('97', '01', '0103', '03', '010301', '097', '02', '在响应比最高者优先的作业调度算法中，当各个作业等待时间相同时，运行时间短的作业将得到优先调度；当各个作业要求运行的时间相同时，等待时间长的作业得到优先调度。', '填空');
INSERT INTO `tb_question` VALUES ('98', '01', '0103', '03', '010301', '098', '02', '有三个同时到达的作业J1，J2和J3，它们的执行时间分别是T1，T2和T3，且T1<T2<T3。系统按单道方式运行且采用短作业优先算法，则平均周转时间是(3*T1+2*T2+T3)/3。　', '填空');
INSERT INTO `tb_question` VALUES ('99', '01', '0103', '03', '010301', '099', '02', '位示图是利用二进制的一个位来表示磁盘中一个盘块的使用情况。', '填空');
INSERT INTO `tb_question` VALUES ('100', '01', '0103', '03', '010301', '100', '02', '在SPOOLing系统中，进程执行输出的过程是：将进程产生的数据送到磁盘的输出井，输出程序再将数据提出，通过内存的输出缓冲区送往输出设备。', '填空');
INSERT INTO `tb_question` VALUES ('101', '01', '0103', '03', '010301', '101', '02', 'I/O控制的方式有程序直接控制方式、中断控制方式、DMA方式和通道方式。', '填空');
INSERT INTO `tb_question` VALUES ('102', '01', '0103', '03', '010301', '102', '02', '在首次适应算法中，要求空闲分区按地址递增顺序链接成空闲分区链；在最佳适应算法中是按空闲分区从小到大顺序形成空闲分区链。', '填空');
INSERT INTO `tb_question` VALUES ('103', '01', '0103', '03', '010301', '103', '02', '文件的物理结构有顺序文件、链接文件文件和索引文件三种。', '填空');
INSERT INTO `tb_question` VALUES ('104', '01', '0103', '03', '010301', '104', '02', '现代操作系统的特征是并发、共享、虚拟和异步性。', '填空');
INSERT INTO `tb_question` VALUES ('105', '01', '0103', '03', '010301', '105', '02', '产生死锁的四个必要条件是互斥条件和请求和保持，不剥夺条件和环路条件。', '填空');
INSERT INTO `tb_question` VALUES ('106', '01', '0103', '03', '010301', '106', '02', '操作系统的五大功能是CPU管理、存储管理、设备管理、文件系统和用户接口。', '填空');
INSERT INTO `tb_question` VALUES ('107', '01', '0103', '03', '010301', '107', '02', '在操作系统中进程和线程的区别是：拥有资源。', '填空');
INSERT INTO `tb_question` VALUES ('108', '01', '0103', '03', '010301', '108', '02', '文件系统的基本任务是实现按名存取。', '填空');
INSERT INTO `tb_question` VALUES ('109', '01', '0103', '03', '010301', '109', '02', '静态链接是在程序编译时进行，动态链接是在执行时进行。', '填空');
INSERT INTO `tb_question` VALUES ('110', '01', '0103', '03', '010301', '110', '02', '文件的保护是通过存取控制表来实现的。', '填空');
INSERT INTO `tb_question` VALUES ('111', '01', '0103', '03', '010301', '111', '02', '文件共享的方式有基于索引结点的方式和利用符号链。', '填空');
INSERT INTO `tb_question` VALUES ('112', '01', '0103', '03', '010301', '112', '02', '．UNIX系统对空闲空间的管理方式采用__成组链接法__。', '填空');
INSERT INTO `tb_question` VALUES ('113', '01', '0103', '03', '010301', '113', '02', '一次只允许一个进程访问的资源叫临界资源。', '填空');
INSERT INTO `tb_question` VALUES ('114', '01', '0103', '03', '010301', '114', '02', '在操作系统中进程是一个拥有资源的单位，也是一个调度和执行的基本单位。', '填空');
INSERT INTO `tb_question` VALUES ('115', '01', '0103', '03', '010301', '115', '02', '在批处理兼分时的系统中，往往由分时系统控制的作业称为前台作业，而由批处理系统控制的作业称为后台作业。', '填空');
INSERT INTO `tb_question` VALUES ('116', '02', '0104', '04', '010302', '116', '02', '操作系统为用户提供两种类型的使用接口，它们是操作员（或用户）接口和程序员（或程序）接口。', '填空');
INSERT INTO `tb_question` VALUES ('117', '03', '0105', '05', '010303', '117', '02', '操作系统中，进程可以分为系统进程和用户进程两类。', '填空');
INSERT INTO `tb_question` VALUES ('118', '04', '0106', '06', '010304', '118', '02', '用户调用建立和打开（可交换次序）文件操作来申请对文件的使用权。', '填空');
INSERT INTO `tb_question` VALUES ('119', '05', '0107', '07', '010305', '119', '02', '主存储器与外围设备之间的信息传送操作称为输入输出操作。', '填空');
INSERT INTO `tb_question` VALUES ('120', '06', '0108', '08', '010306', '120', '02', '当一个进程独占处理器顺序执行时，具有两个特性：封闭性和可再现性。', '填空');
INSERT INTO `tb_question` VALUES ('121', '07', '0109', '09', '010307', '121', '02', 'UNIX的shell有两层含义，一是指由shell命令组成的Shell命令语言；二是指该命令的解释程序。', '填空');
INSERT INTO `tb_question` VALUES ('122', '08', '0110', '10', '010308', '122', '02', '操作系统是运行在计算机基本硬件（或：硬件）系统上的最基本的系统软件。', '填空');
INSERT INTO `tb_question` VALUES ('123', '09', '0111', '11', '010309', '123', '02', '程序经编译或汇编以后形成目标程序，其指令的顺序都是以零作为参考地址，这些地址称为相对地址（或：逻辑地址、虚拟地址）。', '填空');
INSERT INTO `tb_question` VALUES ('124', '10', '0112', '12', '010310', '124', '02', '文件的逻辑结构分字符流式文件和记录式文件二种。', '填空');
INSERT INTO `tb_question` VALUES ('125', '11', '0113', '13', '010311', '125', '02', '一个作业从进入系统到运行结束，一般要经历“后备”、“执行”和“完成”三个不同状态。', '填空');
INSERT INTO `tb_question` VALUES ('126', '12', '0114', '14', '010312', '126', '02', 'Windows NT操作系统结构由两个部分构成：一是保护子系统，另一是执行体。', '填空');
INSERT INTO `tb_question` VALUES ('127', '13', '0115', '15', '010313', '127', '02', '目前硬盘中最常使用的两种接口是IDE接口和SCSI接口。', '填空');
INSERT INTO `tb_question` VALUES ('128', '14', '0116', '16', '010314', '128', '02', '用户要求计算机系统所做的工作的集合称为作业。', '填空');
INSERT INTO `tb_question` VALUES ('129', '15', '0117', '17', '010315', '129', '02', '在存贮器可变式分区管理中，对内存状态的记录和分配管理通常可采用表格法、位图法和链表法。', '填空');
INSERT INTO `tb_question` VALUES ('130', '16', '0118', '18', '010316', '130', '02', '进程由程度、数据集合、进程控制块及相关表格组成。', '填空');
INSERT INTO `tb_question` VALUES ('131', '17', '0119', '19', '010317', '131', '02', '对信号量S的操作只能通过P、V操作进行，对应每一个信号量设置了一个等待队列。', '填空');
INSERT INTO `tb_question` VALUES ('132', '18', '0120', '20', '010318', '132', '02', '虚拟设备是指采用某种I／O技术，将某个独占设备改进为多个用户可共享的设备。', '填空');
INSERT INTO `tb_question` VALUES ('133', '19', '0121', '21', '010319', '133', '02', '文件系统中，用于文件的描述和控制并与文件一一对应的是文件控制块（或：FCB）。', '填空');
INSERT INTO `tb_question` VALUES ('134', '20', '0122', '22', '010320', '134', '02', '所谓通道，是一块能控制一台或多台外围设备与CPU并行工作的硬件。', '填空');
INSERT INTO `tb_question` VALUES ('135', '21', '0123', '23', '010321', '135', '02', '用户是通过命令接口或者程序接口向计算机发出请求的。', '填空');
INSERT INTO `tb_question` VALUES ('136', '22', '0124', '24', '010322', '136', '02', '在所有主机操作系统都是UNIX系统的TCP／IP网络中，进行远程注册的命令是rlogin。', '填空');
INSERT INTO `tb_question` VALUES ('137', '23', '0125', '25', '010323', '137', '02', '在TCP／IP网络中，UNIX操作系统下发送电子邮件的命令是Mail。', '填空');
INSERT INTO `tb_question` VALUES ('138', '24', '0126', '26', '010324', '138', '02', '操作系统的主要设计目标是方便用户使用或界面友好和系统能高效工作或资源利用率高。', '填空');
INSERT INTO `tb_question` VALUES ('139', '25', '0127', '27', '010325', '139', '02', '当一个进程完成了特定的任务后，系统收回这个进程所占的工作区或主存空间或资源和取消该进程的进程控制块(PCB)就撤消了该进程。', '填空');
INSERT INTO `tb_question` VALUES ('140', '26', '0128', '28', '010326', '140', '02', '单个分区存储管理仅适用于个人计算机(单用户)和专用计算机(单道，单作业)系统。', '填空');
INSERT INTO `tb_question` VALUES ('141', '27', '0129', '29', '010327', '141', '02', '每个索引文件都必须有一张索引表，其中每个登记项用来指出一个逻辑记录的存放位置 或指针 或首地址。', '填空');
INSERT INTO `tb_question` VALUES ('142', '28', '0130', '30', '010328', '142', '02', '实现SPOOL系统时必须在磁盘上辟出称为输入井和输出井 (可交换次序)的专门区域，以存放作业信息和作业执行结果。', '填空');
INSERT INTO `tb_question` VALUES ('143', '29', '0131', '31', '010329', '143', '02', '一个理想的作业调度算法应该是既能提高系统效率或吞吐量高 及时得到计算结果又能使进入系统的作业周转时间短等_。', '填空');
INSERT INTO `tb_question` VALUES ('144', '30', '0132', '32', '010330', '144', '01', '（  D     ）不是基本的操作系统。  A、批处理操作系统       B、分时操作系统  C、实时操作系统         D、网络操作系统 ', '选择');
INSERT INTO `tb_question` VALUES ('145', '31', '0133', '33', '010331', '145', '01', '（ C     ）不是分时系统的基本特征：       A、同时性       B、独立性 C、实时性       D、交互性 ', '选择');
INSERT INTO `tb_question` VALUES ('146', '32', '0134', '34', '010332', '146', '01', '进程所请求的一次打印输出结束后，将使进程状态从（A）A、运行态变为就绪态B、运行态变为等待态C、就绪态变为运行态D、等待态变为就绪态', '选择');
INSERT INTO `tb_question` VALUES ('147', '33', '0135', '35', '010333', '147', '01', '采用动态重定位方式装入的作业，在执行中允许（C）将其移动。A、用户有条件地	B、用户无条件地C、操作系统有条件地D、操作系统无条件地', '选择');
INSERT INTO `tb_question` VALUES ('148', '34', '0136', '36', '010334', '148', '01', '分页式存储管理中，地址转换工作是由（A）完成的。A、硬件		B、地址转换程序C、用户程序	D、装入程序', '选择');
INSERT INTO `tb_question` VALUES ('149', '35', '0137', '37', '010335', '149', '01', '如果允许不同用户的文件可以具有相同的文件名，通常采用（D）来保证按名存取的安全。A、重名翻译机构	B、建立索引表C、建立指针	D、多级目录结构', '选择');
INSERT INTO `tb_question` VALUES ('150', '36', '0138', '38', '010336', '150', '01', '对记录式文件，操作系统为用户存取文件信息的最小单位是（B）。A、字符		B、数据项C、记录		D、文件', '选择');
INSERT INTO `tb_question` VALUES ('151', '37', '0139', '39', '010337', '151', '01', '为了提高设备分配的灵活性，用户申请设备时应指定（A）号。A、设备类相对	B、设备类绝对C、相对		D、绝对', '选择');
INSERT INTO `tb_question` VALUES ('152', '38', '0140', '40', '010338', '152', '01', '一作业进入内存后，则所属该作业的进程初始时处于（C）状态。A、运行		B、等待C、就绪		D、收容', '选择');
INSERT INTO `tb_question` VALUES ('153', '39', '0141', '41', '010339', '153', '01', '共享变量是指（D）访问的变量。A、只能被系统进程B、只能被多个进程互斥C、只能被用户进程D、可被多个进程', '选择');
INSERT INTO `tb_question` VALUES ('154', '40', '0142', '42', '010340', '154', '01', '临界区是指并发进程中访问共享变量的（D）段。A、管理信息		B、信息存储C、数据		D、程序', '选择');
INSERT INTO `tb_question` VALUES ('155', '41', '0143', '43', '010341', '155', '01', '若系统中有五台绘图仪，有多个进程均需要使用两台，规定每个进程一次仅允许申请一台，则至多允许（D）个进程参于竞争，而不会发生死锁。A、5	B、2  C、3 D、4', '选择');
INSERT INTO `tb_question` VALUES ('156', '42', '0144', '44', '010342', '156', '01', '产生系统死锁的原因可能是由于（C）。A、进程释放资源			B、一个进程进入死循环C、多个进程竞争，资源出现了循环等待D、多个进程竞争共享型设备', '选择');
INSERT INTO `tb_question` VALUES ('157', '43', '0145', '45', '010343', '157', '01', '地址重定位的结果是得到（B）A．源程序B．编译程序C．目标程序D．执行程序', '选择');
INSERT INTO `tb_question` VALUES ('158', '44', '0146', '46', '010344', '158', '01', '为了对文件系统中的文件进行安全管理，任何一个用户在进入系统时都必须进行注册，这一级管理是＿＿＿＿安全管理。（A）A．系统级B．用户级C．目录级D．文件级', '选择');
INSERT INTO `tb_question` VALUES ('159', '45', '0147', '47', '010345', '159', '01', '运行时间最短的作业被优先调度，这种企业调度算法是（C）A．优先级调度B．响应比高者优先C．短作业优先D．先来先服务', '选择');
INSERT INTO `tb_question` VALUES ('160', '46', '0148', '48', '010346', '160', '01', '产生死锁的主要原因是进程运行推进的顺序不合适（D）\nA．系统资源不足和系统中的进程太多B．资源的独占性和系统中的进程太多\nC．进程调度不当和资源的独占性D．资源分配不当和系统资源不足', '选择');
INSERT INTO `tb_question` VALUES ('161', '47', '0149', '49', '010347', '161', '01', '实时操作系统追求的目标是（C）。A.高吞吐率B.充分利用内存C.快速响应D.减少系统开销', '选择');
INSERT INTO `tb_question` VALUES ('162', '48', '0150', '50', '010348', '162', '01', '批处理系统的主要缺点是（B）。A.CPU的利用率不高B.失去了交互性C.不具备并行性D.以上都不是', '选择');
INSERT INTO `tb_question` VALUES ('163', '49', '0151', '51', '010349', '163', '01', '批处理系统的主要缺点是（B）。A.CPU的利用率不高B.失去了交互性C.不具备并行性D.以上都不是', '选择');
INSERT INTO `tb_question` VALUES ('164', '50', '0152', '52', '010350', '164', '01', '如果文件系统中有两个文件重名，不应采用（A）。A.一级目录结构B.树型目录结构C.二级目录结构   D.A和C', '选择');
INSERT INTO `tb_question` VALUES ('165', '51', '0153', '53', '010351', '165', '01', ' 树型目录结构的第一级称为目录树的（B）。A.分支节点B.根节点C.叶节点D.终节点', '选择');
INSERT INTO `tb_question` VALUES ('166', '52', '0154', '54', '010352', '166', '01', '虚拟内存的容量只受（D  ）的限制。A.物理内存的大小B.磁盘空间的大小 C.数据存放的实际地址D.计算机地址位数', '选择');
INSERT INTO `tb_question` VALUES ('167', '53', '0155', '55', '010353', '167', '01', '分段管理提供（B）维的地址结构。A.1    B.2 C.3  D.4', '选择');
INSERT INTO `tb_question` VALUES ('168', '54', '0156', '56', '010354', '168', '01', '（D   ）实现了段式、页式两种存储方式的优势互补。A.请求分页管理  B.可变式分区管理 C.段式管理D.段页式管理', '选择');
INSERT INTO `tb_question` VALUES ('169', '55', '0157', '57', '010355', '169', '01', '以下存储管理技术中，支持虚拟存储器的技术是（C ）。A．动态分区法   B．可重定位分区法C．请求分页技术   D．对换技术', '选择');
INSERT INTO `tb_question` VALUES ('170', '56', '0158', '58', '010356', '170', '01', '操作系统中采用缓冲技术的目的是为了增强系统（ D   ）的能力。A.串行操作     B.控制操作C.重执操作D.并行操作', '选择');
INSERT INTO `tb_question` VALUES ('171', '57', '0159', '59', '010357', '171', '01', 'B是指从作业进入系统到作业完成所经过的时间间隔；D是从作业进入后备队列起，到被调度程序选中时的时间间隔。A：响应时间；B：周转时间； C：运行时间；D：等待时间；F：触发时间。', '选择');
INSERT INTO `tb_question` VALUES ('172', '58', '0160', '60', '010358', '172', '01', '在UNIX系统中获取帮助信息的命令为B。A：help		B：man		C：cat', '选择');
INSERT INTO `tb_question` VALUES ('173', '59', '0161', '61', '010359', '173', '01', 'CPU的调度分为高级、中级和低级三种，其中低级调度是指C调度。A：作业  B：交换  C：进程', '选择');
INSERT INTO `tb_question` VALUES ('174', '60', '0162', '62', '010360', '174', '01', '在请求调页中可采用多种置换算法，其中LRU是B置换算法。A：最佳			B：最近最久未用		C：最近未用			D：最少使用', '选择');
INSERT INTO `tb_question` VALUES ('175', '61', '0163', '63', '010361', '175', '01', '对打印机进行I/O控制时，通常采用B方式；对硬盘的I/O控制采用C方式。A：程序直接控制			B：中断驱动		C：DMA			D：通道', '选择');
INSERT INTO `tb_question` VALUES ('176', '62', '0164', '64', '010362', '176', '01', '在UNIX系统中采用的页面置换算法是A。A：CLOCK				B：OPT		C：NRU			D：LRU', '选择');
INSERT INTO `tb_question` VALUES ('177', '63', '0165', '65', '010363', '177', '01', '在磁盘调度算法中，选择与当前磁头移动方向一致、磁头单向移动且距离最近的进程的算法为C。A：FIFO				B：SCAN		C：CSCAN			D：FSCAN', '选择');
INSERT INTO `tb_question` VALUES ('178', '64', '0166', '66', '010364', '178', '01', '在UNIX系统中的mv命令表示D。A：删除文件	B：移动文件或对文件换名	C：复制文件', '选择');
INSERT INTO `tb_question` VALUES ('179', '65', '0167', '67', '010365', '179', '01', '现代操作系统的两个基本特征是（C）和资源共享。A.多道程序设计B.中断处理C.程序的并发执行D.实现分时与实时处理', '选择');
INSERT INTO `tb_question` VALUES ('180', '66', '0168', '68', '010366', '180', '01', ' 以下（C）项功能不是操作系统具备的主要功能。A．内存管理B．中断处理C．文档编辑D．CPU调度', '选择');
INSERT INTO `tb_question` VALUES ('181', '67', '0169', '69', '010367', '181', '01', '批处理系统的主要缺点是（B）。A.CPU的利用率不高B.失去了交互性C.不具备并行性D.以上都不是', '选择');
INSERT INTO `tb_question` VALUES ('182', '68', '0170', '70', '010368', '182', '01', '引入多道程序的目的在于（A）。A.   充分利用CPU，减少CPU等待时间B.    提高实时响应速度C.   有利于代码共享，减少主、辅存信息交换量,充分利用存储器', '选择');
INSERT INTO `tb_question` VALUES ('183', '69', '0171', '71', '010369', '183', '01', ' 在分时系统中，时间片一定，（B），响应时间越长。A.内存越多B.用户数越多C.后备队列D.用户数越少', '选择');
INSERT INTO `tb_question` VALUES ('184', '70', '0172', '72', '010370', '184', '01', '系统调用是由操作系统提供的内部调用，它（B）。A.直接通过键盘交互方式使用B.只能通过用户程序间接使用C.是命令接口中的命令使用D.与系统的命令一样', '选择');
INSERT INTO `tb_question` VALUES ('185', '71', '0173', '73', '010371', '185', '01', '为了对紧急进程或重要进程进行调度，调度算法应采用（B）。A.先进先出调度算法B.优先数法C.最短作业优先调度D.定时轮转法', '选择');
INSERT INTO `tb_question` VALUES ('186', '72', '0174', '74', '010372', '186', '01', '若一个系统内存有64MB，处理器是32位地址，则它的虚拟地址空间为（  B ）字节。A.2GB         B.4GB C.100KBD.64MB', '选择');
INSERT INTO `tb_question` VALUES ('187', '73', '0175', '75', '010373', '187', '01', '外存（如磁盘）上存放的程序和数据（B ）。A．可由CPU 	   B．必须在CPU访问之前移入内存C．是必须由文件系统管理的   D．必须由进程调度程序管理 ', '选择');
INSERT INTO `tb_question` VALUES ('188', '74', '0176', '76', '010374', '188', '01', '一个40G的硬盘，块的大小为１Ｋ，其FAT要占（　　　）空间。A.100M  B.120M C.140M D.160M', '选择');
INSERT INTO `tb_question` VALUES ('189', '75', '0177', '77', '010375', '189', '01', ' 文件系统在创建一个文件时，为它建立一个（A）。A.文件目录B.目录文件C.逻辑结构D.逻辑空间', '选择');
INSERT INTO `tb_question` VALUES ('190', '76', '0178', '78', '010376', '190', '01', ' 文件的存储方法依赖于（C）。A.文件的物理结构B.存放文件的存储设备的特性 C.A和B  D.文件的逻辑', '选择');
INSERT INTO `tb_question` VALUES ('191', '77', '0179', '79', '010377', '191', '01', '使用绝对路径名访问文件是从（C）开始按目录结构访问某个文件。A.当前目录B.用户主目录C.根目录D.父目录', '选择');
INSERT INTO `tb_question` VALUES ('192', '78', '0180', '80', '010378', '192', '01', '目录文件所存放的信息是（D）。A.某一文件存放的数据信息B.某一文件的文件目录C.该目录中所有数据文件目录D.该目录中所有子目录文件和数据文件的目录', '选择');
INSERT INTO `tb_question` VALUES ('193', '79', '0181', '81', '010379', '193', '01', '由字符序列组成，文件内的信息不再划分结构，这是指（A）。A.流式文件B.记录式文件C.顺序文件D.有序文件', '选择');
INSERT INTO `tb_question` VALUES ('194', '80', '0182', '82', '010380', '194', '01', '数据库文件的逻辑结构形式是（C）。A.字符流式文件B.档案文件C.记录式文件D.只读文件', '选择');
INSERT INTO `tb_question` VALUES ('195', '81', '0183', '83', '010381', '195', '01', ' 逻辑文件是（B）的文件组织形式。A.在外部设备上B.从用户观点看C.虚拟存储D.目录', '选择');
INSERT INTO `tb_question` VALUES ('196', '82', '0184', '84', '010382', '196', '01', '存储管理的目的是（ C  ）。A.方便用户B.提高内存利用率C.方便用户和提高内存利用率D.增加内存实际容量', '选择');
INSERT INTO `tb_question` VALUES ('197', '83', '0185', '85', '010383', '197', '01', '在请求页式存储管理中，若所需页面不在内存中，则会引起（ D）。A.输入输出中断    B.时钟中断C.越界中断        D.缺页中断；', '选择');
INSERT INTO `tb_question` VALUES ('198', '84', '0186', '86', '010384', '198', '01', '若处理器有32位地址，则它的虚拟地址空间为（B   ）字节。A.2GB    B.4GB C.100KB  D.640KB', '选择');
INSERT INTO `tb_question` VALUES ('199', '85', '0187', '87', '010385', '199', '01', '虚拟存储技术是（B ）。A.补充内存物理空间的技术 B.补充相对地址空间的技术C.扩充外存空间的技术D.扩充输入输出缓冲区的技术', '选择');
INSERT INTO `tb_question` VALUES ('200', '86', '0188', '88', '010386', '200', '01', '外存（如磁盘）上存放的程序和数据（B ）。A．可由CPU B．必须在CPU访问之前移入内存 C．是必须由文件系统管理的 D．必须由进程调度程序管理', '选择');
INSERT INTO `tb_question` VALUES ('201', '87', '0189', '89', '010387', '201', '01', '段页式存储管理汲取了页式管理和段式管理的长处，其实现原理结合了页式和段式管理的基本思想，即（B）。A、用分段方法来分配和管理物理存储空间，用分页方法来管理用户地址空间。B、用分段方法来分配和管理用户地址空间，用分页方法来管理物理存储空间。C、用分段方法来分配和管理主存空间，用分页方法来管理辅存空间。D、用分段方法来分配和管理辅存空间，用分页方法来管理主存空间。', '选择');
INSERT INTO `tb_question` VALUES ('202', '88', '0190', '90', '010388', '202', '01', '（C）存储管理支持多道程序设计，算法简单，但存储碎片多。A.段式 B.页式 C.固定分区D.段页式', '选择');
INSERT INTO `tb_question` VALUES ('203', '89', '0191', '91', '010389', '203', '01', '（ C  ）存储管理方式提供一维地址结构。A.固定分区B.分段 C.分页D.分段和段页式', '选择');
INSERT INTO `tb_question` VALUES ('204', '90', '0192', '92', '010390', '204', '01', '在请求分页系统中，LRU算法是指（  B）。A、最早进入内存的页先淘汰B、近期最长时间以来没被访问的页先淘汰C、近期被访问次数最少的页先淘汰D、以后再也不用的也先淘汰', '选择');
INSERT INTO `tb_question` VALUES ('205', '91', '0193', '93', '010391', '205', '01', '请求分页存储管理中，若把页面尺寸增加一倍，在程序顺序执行时，则一般缺页中断次数会（B ）。A．增加    B．减少    C．不变    D．可能增加也可能减少', '选择');
INSERT INTO `tb_question` VALUES ('206', '92', '0194', '94', '010392', '206', '01', '碎片现象的存在使得（A）。A.内存空间利用率降低B.内存空间利用率提高C.内存空间利用率得以改善D.内存空间利用率不影响', '选择');
INSERT INTO `tb_question` VALUES ('207', '93', '0195', '95', '010393', '207', '01', '当内存碎片容量大于某一作业所申请的内存容量时，（ D ）。A、可以为这一作业分配内存B、不可以为这一作业分配内存C、拼接后，可以为这一作业分配内存D、一定能够为这一作业分配内存', '选择');
INSERT INTO `tb_question` VALUES ('208', '94', '0196', '96', '010394', '208', '01', '通道是一种（C）。A.I/O端口B.数据通道C.I/O专用处理机D.软件工具', '选择');
INSERT INTO `tb_question` VALUES ('209', '95', '0197', '97', '010395', '209', '01', '缓冲技术用于（A）。A、提高主机和设备交换信息的速度B、提供主、辅存接口C、提高设备利用率D、扩充相对地址空间', '选择');
INSERT INTO `tb_question` VALUES ('210', '96', '0198', '98', '010396', '210', '01', '采用SPOOLing技术的目的是（  A）。A.提高独占设备的利用率B.提高主机效率C.减轻用户编程负担D.提高程序的运行速度', '选择');
INSERT INTO `tb_question` VALUES ('211', '97', '0199', '99', '010397', '211', '01', '在设备管理中为了提高I/O速度和设备利用率，是通过B功能实现的。A：设备分配B：缓冲管理C：设备独立性D：虚拟设备', '选择');
INSERT INTO `tb_question` VALUES ('212', '98', '0200', '100', '010398', '212', '01', '在UNIX系统中对空闲磁盘空间管理的方法是C。A：位示图B：空闲空间链C：成组链接法D：空闲表', '选择');
INSERT INTO `tb_question` VALUES ('213', '99', '0201', '101', '010399', '213', '01', '实现虚拟存储器最关键的技术是C。A：内存分配B：置换算法C：请求调页(段)D：对换空间管理', '选择');
INSERT INTO `tb_question` VALUES ('214', '100', '0202', '102', '010400', '214', '01', '在UNIX系统中，复制文件采用的命令为A。A：cp		B：mv		C：rm		D：copy', '选择');
INSERT INTO `tb_question` VALUES ('215', '101', '0203', '103', '010401', '215', '01', '对于一个文件的访问，常由A共同限制。A．用户访问权限和文件属性		B．用户访问权限和文件优先级C．优先级和文件属性				D．	文件属性和口令', '选择');
INSERT INTO `tb_question` VALUES ('216', '102', '0204', '104', '010402', '216', '01', '一作业8：00到达系统，估计运行时间为1小时，若10：00开始执行该作业，其响应比是C。A.2　       B.1　C.3　      D.0.5', '选择');
INSERT INTO `tb_question` VALUES ('217', '103', '0205', '105', '010403', '217', '01', '在动态分区分配方案中，某一作业完成后，系统收回其主存空间，并与相邻空闲区合并，为此需修改空闲区表，造成空闲区数减1的情况是D。A.无上邻空闲区，也无下邻空闲区　　\nB.有上邻空闲区，但无下邻空闲区　　C.有下邻空闲区，但无上邻空闲区　　D.有上邻空闲区，也有下邻空闲区', '选择');
INSERT INTO `tb_question` VALUES ('218', '104', '0206', '106', '010404', '218', '01', '如果进程需要读取磁盘上的多个连续的数据块，D数据传送方式的效率最高。A．程序直接控制方式B．中断控制方式C．DMA方式		D．通道方式', '选择');
INSERT INTO `tb_question` VALUES ('219', '105', '0207', '107', '010405', '219', '01', '使用文件之前必须先B文件。A．命名	B．打开C．建立	D．备份', '选择');
INSERT INTO `tb_question` VALUES ('220', '106', '0208', '108', '010406', '220', '01', '如果一个磁盘的容量为40G，盘块的大小为4K，那么该磁盘的FAT大小为：。A．20M	B．25MC．30M	D．35M', '选择');
INSERT INTO `tb_question` VALUES ('221', '107', '0209', '109', '010407', '221', '03', '（×）1．并发性是指若干事件在同一时刻发生。', '判断');
INSERT INTO `tb_question` VALUES ('222', '108', '0210', '110', '010408', '222', '03', '（√）2．虚存容量的扩大是以牺牲CPU工作时间以及内、外存交换时间为代价的', '判断');
INSERT INTO `tb_question` VALUES ('223', '109', '0211', '111', '010409', '223', '03', '（×）3．用户为每个自己的进程创建PCB，并控制进程的执行过程。', '判断');
INSERT INTO `tb_question` VALUES ('224', '110', '0212', '112', '010410', '224', '03', '（√）4．树型目录结构能够解决文件重名问题。', '判断');
INSERT INTO `tb_question` VALUES ('225', '111', '0213', '113', '010411', '225', '03', '（√）5．原语是一种不可分割的操作。', '判断');
INSERT INTO `tb_question` VALUES ('226', '112', '0214', '114', '010412', '226', '03', '（√）6．通道一旦被启动就能独立于CPU运行，这样可使CPU和通道并行操作。', '判断');
INSERT INTO `tb_question` VALUES ('227', '113', '0215', '115', '010413', '227', '03', '（√）7．页式的地址是一维的，段式的地址是二维的', '判断');
INSERT INTO `tb_question` VALUES ('228', '114', '0216', '116', '010414', '228', '03', '（×）8．位示图方法可用于磁盘的调度管理。', '判断');
INSERT INTO `tb_question` VALUES ('229', '115', '0217', '117', '010415', '229', '03', '（×）9．虚拟设备是指把一个物理设备变换成多个对应的逻辑设备，它通过逻辑设备表来实现的。', '判断');
INSERT INTO `tb_question` VALUES ('230', '116', '0218', '118', '010416', '230', '03', '（×）10．页式管理易于实现不同进程间的信息共享。', '判断');
INSERT INTO `tb_question` VALUES ('231', '117', '0219', '119', '010417', '231', '03', '（√）１1．在虚拟存储方式下，程序员编制程序时不必考虑主存的容量，但系统的吞吐量在很大程度上依赖于主存储器的容量；', '判断');
INSERT INTO `tb_question` VALUES ('232', '118', '0220', '120', '010418', '232', '03', '（×）1２．可重定位分区管理可以对作业分配不连续的内存单元；', '判断');
INSERT INTO `tb_question` VALUES ('233', '119', '0221', '121', '010419', '233', '03', '（√）1３．采用动态重定位技术的系统，目标程序可以不经任何改动，而装入物理内存；', '判断');
INSERT INTO `tb_question` VALUES ('234', '120', '0222', '122', '010420', '234', '03', '（×）1４．页式存储管理中，一个作业可以占用不连续的内存空间，而段式存储管理，一个作业则是占用连续的内存空间。', '判断');
INSERT INTO `tb_question` VALUES ('235', '121', '0223', '123', '010421', '235', '03', '（×）1５．线程是最小的拥有资源的单位。', '判断');
INSERT INTO `tb_question` VALUES ('236', '122', '0224', '124', '010422', '236', '03', '（√）1６．文件系统最基本的功能是实现按名存取。', '判断');
INSERT INTO `tb_question` VALUES ('237', '123', '0225', '125', '010423', '237', '03', '（×）17．存取控制表是每个用户一张，表明该用户对不同文件的存取权限。', '判断');
INSERT INTO `tb_question` VALUES ('238', '124', '0226', '126', '010424', '238', '03', '（×）18．SPOOLing技术可以解决进程使用设备死锁问题。', '判断');
INSERT INTO `tb_question` VALUES ('239', '125', '0227', '127', '010425', '239', '03', '（×）19．对于一个具有三级索引表的文件，存取一个记录需要访问三次磁盘。', '判断');
INSERT INTO `tb_question` VALUES ('240', '126', '0228', '128', '010426', '240', '03', '（√）20．在I/O控制的多种方式中，传输速率高，对主机影响少的方式最好。', '判断');
INSERT INTO `tb_question` VALUES ('241', '127', '0229', '129', '010427', '241', '03', '（×）21．进程可以删除自己的PCB表。', '判断');
INSERT INTO `tb_question` VALUES ('242', '128', '0230', '130', '010428', '242', '03', '（×）22．可重定位分区法能够支持虚拟存储器的技术。', '判断');
INSERT INTO `tb_question` VALUES ('243', '129', '0231', '131', '010429', '243', '03', '（×）23．单级目录结构能够解决文件重名问题。', '判断');
INSERT INTO `tb_question` VALUES ('244', '130', '0232', '132', '010430', '244', '03', '（×）24．分页式存储管理中，页的大小是可以不相等的。', '判断');
INSERT INTO `tb_question` VALUES ('245', '131', '0233', '133', '010431', '245', '03', '（√）25．执行原语时不会响应任何中断。', '判断');
INSERT INTO `tb_question` VALUES ('246', '132', '0234', '134', '010432', '246', '03', '（√）26．段页式管理实现了段式、页式两种存储方式的优势互补。', '判断');
INSERT INTO `tb_question` VALUES ('247', '133', '0235', '135', '010433', '247', '03', '（√）27．对临界资源应采取互斥访问方式来实现共享。', '判断');
INSERT INTO `tb_question` VALUES ('248', '134', '0236', '136', '010434', '248', '03', '（×）28．文件系统中分配存储空间的基本单位是记录。', '判断');
INSERT INTO `tb_question` VALUES ('249', '135', '0237', '137', '010435', '249', '03', '（×）29．外存对换空间保存的是虚拟内存管理系统调出的程序。', '判断');
INSERT INTO `tb_question` VALUES ('250', '136', '0238', '138', '010436', '250', '03', '（√）30．虚存容量的扩大是以牺牲CPU工作时间以及内、外存交换时间为代价的。', '判断');
INSERT INTO `tb_question` VALUES ('251', '137', '0239', '139', '010437', '251', '04', '1．在单处理机环境下，进程间有哪几种通信方式，是如何实现的？\n1. 作业调度：从一批后备作业中选择一个或几个作业，给它们分配资源，建立进程，挂入就绪队列。执行完后，回收资源。\n进程调度：从就绪进程队列中根据某个策略选取一个进程，使之占用CPU。\n交换调度：按照给定的原则和策略，将外存交换区中的进程调入内存，把内存中的非执行进程交换到外存交换区中。', '简答题');
INSERT INTO `tb_question` VALUES ('252', '138', '0240', '140', '010438', '252', '04', '2.设备管理中的数据传送控制方式有哪几种？分别简述如何实现的。\n2. 程序直接控制：由用户进程来直接控制内存或CPU和外设间的信息传送。\n中断方式：进程通过CPU发出指令启动外设，该进程阻塞。当输入完成时，I/O控制器通过中断请求线向CPU发出中断信号，CPU进行中断处理。\nDMA方式：在外设和内存之间开辟直接的数据交换通路。\n通道控制方式：CPU发出启动指令，指出通道相应的操作和I/O 设备，该指令就可启动通道并使该通道从内存中调出相应的通道指令执行。', '简答题');
INSERT INTO `tb_question` VALUES ('253', '139', '0241', '141', '010439', '253', '04', '3.简述进程的几种状态和引起状态转换的典型原因，以及相关的操作原语。\n进程的基本状态有：新、就绪，阻塞，执行、挂起和终止六种。\n新到就绪：交换，创建原语\n     就绪到执行：进程调度\n     执行到阻塞：I/O请求，阻塞原语\n阻塞到就绪：I/O完成，唤醒原语\n执行到就绪：时间片完\n阻塞到挂起：挂起原语\n挂起到就绪：唤醒原语\n     执行到终止：进程执行完毕', '简答题');
INSERT INTO `tb_question` VALUES ('254', '140', '0242', '142', '010440', '254', '04', '4.什么是段式存储管理？它从逻辑地址到物理地址是怎么变换的？\n4.把程序按内容或构成关系分成段，每段有自己的名字。一个用户作业或进程包含的段对应于一个二维虚拟储存器。以段为单位分配内存，然后通过地址映射机构把逻辑地址转换成物理地址。只将那些经常访问的段驻留内存，其他的段放在外存，待需要时自动调入。\n地址变换过程：由虚地址中的段号为索引，查段表。找出该段在内存的起始地址，并将其和段内地址相加，从而得到物理地址。', '简答题');
INSERT INTO `tb_question` VALUES ('255', '141', '0243', '143', '010441', '255', '04', '5.什么是请求页式管理？能满足用户哪些需要？\n答：请求页式管理的基本原理是将逻辑地址空间分成大小相同的页，将存储地址空间分块，页和块的大小相等，通过页表进行管理。页式系统的逻辑地址分为页号和页内位移量。页表包括页号和块号数据项，它们一一对应。根据逻辑空间的页号，查找页表对应项找到对应的块号，块号乘以块长，加上位移量就形成存储空间的物理地址。每个作业的逻辑地址空间是连续的，重定位到内存空间后就不一定连续了。\n此外，页表中还包括特征位（指示该页面是否在内存中）、外存地址、修改位（该页的内容在内存中是否修改过）等。\n页式存储管理在动态地址转换过程中需要确定某一页是否已经调入主存。若调入主存，则可直接将虚地址转换为实地址，如果该页未调入主存，则产生缺页中断，以装入所需的页。\n页式存储管理将不常用的页面调出内存，使内存的利用率高；虚拟的容量大，用户不必担心内存不够；不要求作业连续存放，有效地解决了“碎片”问题。', '简答题');
INSERT INTO `tb_question` VALUES ('256', '142', '0244', '144', '010442', '256', '04', '6．在段页式虚拟存储系统中，不同进程之间是如何实现程序共享的？\n6.在系统内设置有系统段表，用户段表指向系统段表，系统段表内有当前共享的用户数。当用户进程调入一个程序段之前，先查找系统段表，如果所需段存在，则将共享用户数加一，在将此段登记在用户进程段表中。当进程退出时，共享计数减一，最后一个用户删除共享代码段。', '简答题');
INSERT INTO `tb_question` VALUES ('257', '143', '0245', '145', '010443', '257', '04', '7.试比较内存管理和外存管理的异同点.\n答：主要任务：内存管理的主要任务是为多道程序的运行，提供良好的环境；而外存管理的主要任务则是为文件提供存储空间。\n基本功能：内存管理的基本功能包含了内存空间的分配、回收、内存保护、对换、内存扩充等方面；而对外存管理的基本功能则只是对外存空间的分配和回收。\n分配方式：它们都可采用连续分配或离散分配方式，且都以离散分配方式为主。\n分配算法或机制：对于连续分配方式，内存与外存管理中的分配和回收算法类似，主要有首次适应算法、循环首次适应算法等；在离散分配方式中，两者采用的机制不同，内存管理主要是利用页（段）表；而在外存管理中，则主要利用文件分配表FAT。', '简答题');
INSERT INTO `tb_question` VALUES ('258', '144', '0246', '146', '010444', '258', '04', '8.SPOOLing的含义是什么？试述SPOOLing系统的特点、功能以及控制过程。\n答：SPOOLing是Simultaneous Peripheral Operation On-Line （即外部设备联机并行操作）的缩写，它是关于慢速字符设备如何与计算机主机交换信息的一种技术，通常称为“假脱机技术”。\nSPOOLing技术是在通道技术和多道程序设计基础上产生的，它由主机和相应的通道共同承担作业的输入输出工作，利用磁盘作为后援存储器，实现外围设备同时联机操作。\nSPOOLing系统由专门负责I/O的常驻内存的进程以及输入井、输出井组成；它将独占设备改造为共享设备，实现了虚拟设备功能。', '简答题');
INSERT INTO `tb_question` VALUES ('259', '145', '0247', '147', '010445', '259', '04', '9．在生产者—消费者问题中，能否将生产者进程的wait(empty)和wait(mutex)语句互换，为什么？\n不能。（2分）\n因为这样可能导致系统死锁。当系统中没有空缓冲时，生产者进程的wait(mutex)操作获取了缓冲队列的控制权，而wait(empty) 导致生产者进程阻塞，这时消费者进程也无法执行。（3分）', '简答题');
INSERT INTO `tb_question` VALUES ('260', '146', '0248', '148', '010446', '260', '04', '10．进程的基本状态有哪些？这些状态之间是如何转换的？\n进程的基本状态有：就绪，阻塞，执行三种。（2分）\n       就绪到执行：进程调度\n       执行到就绪：时间片完\n       执行到阻塞：I/O请求或等待事件发生\n       阻塞到就绪：I/O完成或事件已发生   （3分）', '简答题');
INSERT INTO `tb_question` VALUES ('262', '148', '0250', '150', '010448', '262', '04', '11．什么是快表？它在地址转换中起什么作用？\n快表是一个高速、具有并行查询能力的联想存储器，用于存放正运行的进程的当前页号和块号，或者段号和段起始地址。（2分）\n加入快表后,在地址转换时，首先在快表中查找，若找到就直接进行地址转换；未找到，则在主存页表继续查找，并把查到的页号和块号放入联想存储器中。快表的命中率很高，有效地提高了地址转换的速度。 （3分）', '简答题');
INSERT INTO `tb_question` VALUES ('263', '149', '0251', '151', '010449', '263', '04', '12．什么是设备独立性，它是如何实现的？\n设备独立性即应用程序独立于使用的物理设备，在应用程序中使用逻辑设备名称来请求使用某类设备。系统在执行时，是使用物理设备名称。（3分）\n要实现设备独立性必须由设备独立性软件完成，包括执行所有设备的公有操作软件提供统一的接口，其中逻辑设备到物理设备的映射是由逻辑设备表LUT完成的。  （2分）', '简答题');
INSERT INTO `tb_question` VALUES ('264', '150', '0252', '152', '010450', '264', '04', '13．文件的物理结构有哪几类，那种结构能支持大型文件？\n文件的物理结构有：顺序文件、链接文件和索引文件。（4分）\n其中索引文件能支持大型文件。（1分）', '简答题');
INSERT INTO `tb_question` VALUES ('265', '151', '0253', '153', '010451', '265', '04', '14.试说明和比较几种文件共享的方法\n绕弯路法：\n连访法：\n利用基本文件目录实现文件共享：\n基于索引节点的共享方法：\n利用符号链实现文件共享：', '简答题');
INSERT INTO `tb_question` VALUES ('266', '152', '0254', '154', '010452', '266', '04', '15.处理机调度分为哪三级？各自的主要任务是什么？\n答：作业调度：从一批后备作业中选择一个或几个作业，给它们分配资源，建立进程，挂入就绪队列。执行完后，回收资源。\n进程调度：从就绪进程队列中根据某个策略选取一个进程，使之占用CPU。\n交换调度：按照给定的原则和策略，将外存交换区中的进程调入内存，把内存中的非执行进程交换到外存交换区中。', '简答题');
INSERT INTO `tb_question` VALUES ('267', '153', '0255', '155', '010453', '267', '04', '16．什么是高级调度、中级调度和低级调度？\n答：作业调度：从一批后备作业中选择一个或几个作业，给它们分配资源，建立进程，挂入就绪队列。执行完后，回收资源。\n进程调度：从就绪进程队列中根据某个策略选取一个进程，使之占用CPU。\n交换调度：按照给定的原则和策略，将外存交换区中的进程调入内存，把内存中的非执行进程交换到外存交换区中。', '简答题');
INSERT INTO `tb_question` VALUES ('268', '154', '0256', '156', '010454', '268', '04', '18.目前操作系统采用的目录结构是什么？它具有什么优点？\n为了给用户提供对文件的存取控制及保护功能，而按一定规则对系统中的文件名，(亦可包含文件属性)进行组织所形成的表，称为目录表或文件目录。目前操作系统采用的目录结构是树型目录结构，它的优点有：\n（1）有效地提高对目录的检索速度；\n（2）允许文件重名；\n（3）便于实现文件共享。', '简答题');
INSERT INTO `tb_question` VALUES ('269', '155', '0257', '157', '010455', '269', '04', '19．什么是死锁？产生死锁的四个必要条件是什么？\n死锁：当某进程提出资源申请后，使得系统中一些进程处于无休止的阻塞状态，在无外力作用下，永远不能再继续前进。\n产生死锁的必要条件：互斥条件：某段时间内某资源只能由一个进程使用。不剥夺条件：资源在未使用完前，不能被剥夺，由使用进程释放。部分分配（请求和保持）：进程因请求资源而阻塞时，对已分配给它的资源保持不放。环路条件：发生死锁时，有向图必构成一环路。', '简答题');
INSERT INTO `tb_question` VALUES ('270', '156', '0258', '158', '010456', '270', '04', '20.什么是内存分页存储管理？它有什么特点？\n分页存储管理是将各进程的地址空间分成大小相等的页，把内存的存储空间也分成与页大小相同的片，称为物理块。在分配存储空间时，以块为单位来分配。\n优点：有效解决存储器的零头问题，能在更高的程度上进行多道程序设计，从而相应提高了存储器和CPU 的利用率。\n缺点：采用动态地址变换为增加计算机成本和降低CPU 的速度。表格占内存空间，费时来管理表格。存在页内碎片。作业动态的地址空间受内存容量限制。', '简答题');
INSERT INTO `tb_question` VALUES ('271', '157', '0259', '159', '010457', '271', '04', '21．说明进程的结构、特征和基本状态。\n答：结构：PCB (进程控制块)+程序+数据集合。\n特征：动态性、并发性、独立性、制约性、结构性。\n基本状态：就绪态、执行态、等待态。', '简答题');
INSERT INTO `tb_question` VALUES ('272', '158', '0260', '160', '010458', '272', '04', '24．在哲学家算法中，是否能防止或解除死锁？为什么？\n答：银行家算法部分防止和解除死锁，因为它只能根据安全状态防止部分死锁，没有防止和解除所有死锁的能力。', '简答题');
INSERT INTO `tb_question` VALUES ('273', '159', '0261', '161', '010459', '273', '04', '25．在原语执行期间，是否可以响应中断？为什么？\n答：原语执行期间可以响应中断，只是不能进行进程切换。', '简答题');
INSERT INTO `tb_question` VALUES ('274', '160', '0262', '162', '010460', '274', '04', '26．不同用户的不同任务之间的进程是有临界区？为什么？请举例说明。\n答：完全可能有临界区，如打印程序是可以由不同用户的不同进程使用，但是只能有一个进程在某一时刻进入。', '简答题');
INSERT INTO `tb_question` VALUES ('275', '161', '0263', '163', '010461', '275', '04', '27．文件目录有何作用？\n答：实现文件目录到物理地址的转换。', '简答题');
INSERT INTO `tb_question` VALUES ('276', '162', '0264', '164', '010462', '276', '04', '28.什么是文件的逻辑结构和物理结构？\n文件的逻辑结构（文件的组织）：从用户角度看到的文件的全貌，也就是它的记录结构，包括流式文件、顺序文件、索引文件和索引顺序文件。\n文件的物理结构（文件的存储结构）：文件在外存上的存储组织形式，包括连续文件、串联文件和索引文件。', '简答题');
INSERT INTO `tb_question` VALUES ('277', '163', '0265', '165', '010463', '277', '04', '30．什么是虚拟存储器，它有什么特点？\n答：虚拟存储器是一种存储管理技术，用以完成用小的内存实现在大的虚空间中程序的运行工作。它是由操作系统提供的一个假想的特大存储器。但是虚拟存储器的容量并不是无限的，它由计算机的地址结构长度所确定，另外虚存容量的扩大是以牺牲CPU工作时间以及内、外存交换时间为代价的。', '简答题');
INSERT INTO `tb_question` VALUES ('278', '164', '0266', '166', '010464', '278', '04', '31．比较基于索引节点和基于符号链的文件共享方法。（8分）\n答：基于索引节点的文件共享是在文件的目录中填上需要共享文件的索引节点的序号，在索引节点中加上用户计数。基于符号链的文件共享是建立一种特殊的链接文件，内容为需要共享的文件的路径和名字，访问该文件时，根据路径找到共享的文件。基于索引节点的文件共享访问速度快，但可能使索引节点指针悬空；基于符号链的文件共享安全，但访问速度慢，要占用索引节点。', '简答题');
INSERT INTO `tb_question` VALUES ('279', '165', '0267', '167', '010465', '279', '05', '1. 这是一个从键盘输入到打印机输出的数据处理流图，其中键盘输入进程通过缓冲区 buf1 把输入数据传送给计算进程，计算进程把处理结果通过缓冲 buf2 传送给打印进程。buf1 和 buf2 为临界资源，试写出键盘输入进程，计算进程及打印进程间的同步算法。（10分）\n    输入进程 → buf1 → 计算进程 → buf2 → 打印进程\n解答：从键盘输入到打印机输出的数据传送过程，可以看作是由键盘输入进程到计算进程，以及由计算进程到打印输出进程这两个数据传送进程所组成。其中，对键盘输入进程而言，计算进程是消费者进程；而对打印输出进程而言，计算进程又是生产者进程。据此可将它们之间的同步问题描述如下：\n    var：mutex1，mutex2，empty1，empty2，full1，full2：=1，1，1，1，0，0；\nIP:begin\n    repeat\n      P(empty);\n      P(mutex1);\n      input a charcter from keyboard;\nAdd to buffer;\nV(mutex1);\nV(full);\nuntil false\n    end\nCP:begin\n      repeat\nP(full);\nP(mutex1);\nTake a charactor form buffer1;\nAdd to ch1;\nV(mutex1);\nV(empty1);\nP(empty2);\nP(mutex2);\nTake a charactor form ch1;\nAdd to buffer2;\nV(mutex2);\nV(full2);\n  until false\nend\nOP:begin\n      repeat \np(full2);\nP(mutex2);\nTake a charactor from buffer2;\nAdd to printer controler;\nstart printer;\nV(mutex2);\nV(empty2);\n    until false\nend', '计算题');
INSERT INTO `tb_question` VALUES ('280', '166', '0268', '168', '010466', '280', '05', '3．设系统有三种类型的资源，数量为(4，2，2)，系统中有进程A，B，C按如下顺序请求资源：\n　　　　 进程A申请(3，2，1)\n　　　　 进程B申请(1，0，1)\n　　　　 进程A申请(0，1，0)\n　　　　 进程C申请(2，0，0)\n　　请你给出一和防止死锁的资源剥夺分配策略，完成上述请求序列，并列出资源分配过程，指明哪些进程需要等待，哪些资源被剥夺。(10分)\n解：(10分)\n① 分配策略为：当进程Pi申请ri类资源时，检查ri中有无可分配的资源：有则分配给Pi；否则将Pi占有的资源全部释放而进入等待状态。(Pi等待原占有的所有资源和新申请的资源)　\n② 资源分配过程：　　　　　　　剩余资源\n　进程A：(3，2，1)　　　　　　(1，0，1)\n　进程B：(1，0，1)　　　　　　(0，0，0)\n　进程A：(0，1，0)(不满足)　　(3，2，1)\n　A的所有资源被剥夺，A处于等待\n进程C：(2，0，0)　　　　　　(1，2，1)\nC，B完成之后，A可完成。', '计算题');
INSERT INTO `tb_question` VALUES ('281', '167', '0269', '169', '010467', '281', '05', '4．设公共汽车上，司机和售票员的活动分别是：\n   司机： 启动车辆    售票员： 上乘客\n  正常行车    关车门\n  到站停车    售票\n       开车门\n       `下乘客\n在汽车不断地到站，停车，行使过程中，这两个活动有什么同步关系？并用 wait和signal 原语操作实现它们的同步。  \n解：BEGIN  integer  stop,run;\nStop:=0;\nRun:=0;\nCOBEGIN\nDriver:  BEGIN\n             L1:  wait(run);\n   启动车辆；\n正常行车；\n到站停车；\n        signal(stop);\n         Goto  L1;\n  END\n\nConductor: BEGIN\n   L2： 上乘客；\n    关车门；\n    signal(run);\n    售票；\nwait(stop);\n开车门；\n下乘客；\nGoto  L2;\nEND\nCOEND\nEND', '计算题');
INSERT INTO `tb_question` VALUES ('282', '168', '0270', '170', '010468', '282', '05', '5、某虚拟存储器的用户编程空间共321KB，内存为16KB。假定某时刻一用户页表中已调入内存的页面的页号和物理块号的对照表如下：\n页号 物理块号\n1 5\n2 10\n3 4\n4 7\n则逻辑地址0A5C（H）所对应的物理地址是什么？\n答：逻辑地址0A5CH）所对应的二进制表示形式是：0000 1010 0101 1100 ，由于1K=210，下划线部分前的编码为000010，表示该逻辑地址对应的页号为3查页表，得到物理块号是4（十进制），即物理块地址为：0001 0010 0000 0000 ，拼接块内地址0000 0000 0101 1100，得0001 0010 0101 1100，即125C（H）。', '计算题');
INSERT INTO `tb_question` VALUES ('283', '169', '0271', '171', '010469', '283', '05', '6、某段表内容如下：\n段号 段首地址 段长度\n0 120K 40K\n1 760K 30K\n2 480K 20K\n3 370K 20K\n   一逻辑地址为（2，154）的实际物理地址为多少？\n答：逻辑地址（2154）表示段号为2，即段首地址为480K，154为单元号，则实际物理地址为480K+154。', '计算题');
INSERT INTO `tb_question` VALUES ('284', '170', '0272', '172', '010470', '284', '05', '7、设系统中有三种类型的资源（A，B，C）和五个进程（P1，P2，P3，P4，P5），A资源的数量为17，B资源的数量为5，C资源的数量为20。在T0时刻系统状态如表1和表2所示。（共10分）\n       系统采用银行家算法实施死锁避免策略。\n  ① T0时刻是否为安全状态？若是，请给出安全序列。\n  ② 在T0时刻若进程P2请求资源（0，3，4），是否能实施资源分配？为什么？\n  ③ 在②的基础上，若进程P4请求资源（2，0，1），是否能实施资源分配？为什么？\n  ④ 在③的基础上，若进程P1请求资源（0，2，0），是否能实施资源分配？为什么？\n    表1                                T0时刻系统状态\n   最大资源需求量 已分配资源数量\n A B C A B C\nP1 5 5 9 2 1 2\nP2 5 3 6 4 0 2\nP3 4 0 11 4 0 5\nP4 4 2 5 2 0 4\nP5 4 2 4 3 1 4\n表2                                T0时刻系统状态\n   A B C\n剩余资源数 2 3 3', '计算题');
INSERT INTO `tb_question` VALUES ('285', '171', '0273', '173', '010471', '285', '05', '8．系统中有五个进程P1、P2、P3、P4、P5，有三种类型的资源：R1、R2、和R3。在T0时刻系统状态如表所示。若采用银行家算法实施死锁避免策略，回答下列问题：    （共9分，每小题3分）\n1．T0时刻是否为安全状态？为什么？\n2．若这时P4请求资源（1，2，0），是否能实施资源分配？为什么？\n3．在上面的基础上，若进程P3请求资源（0，1，0），是否能实施资源分配？为什么？  \nT0时刻系统状态\n 已分配资源数量 最大资源需求量\n R1 R2 R3 R1 R2 R3\nP1 0 0 1 0 0 1\nP2 2 0 0 2 7 5\nP3 0 0 3 6 6 5\nP4 1 1 5 4 3 5\nP5 0 3 3 0 6 5\n\n   R1 R2 R3\n剩余资源数 3 3 0\n\n解：（共9分，每小题3分）\n1．T0时刻是安全的，安全序列为：P1，P4，P5，P2，P3\n2．P4请求资源（1，2，0），根据银行家算法，预分配后系统是安全的，安全序列为：P1，P4，P5，P2，P3\nP3请求资源（1，1，0），根据银行家算法，预分配后系统不安全，所以不', '计算题');
INSERT INTO `tb_question` VALUES ('286', '172', '0274', '174', '010472', '286', '05', '9．一个进程的大小占5个页面，每页的大小为1K，系统为它分配了3个物理块。当前进程的页表如图所示：（共8分）\n\n  块号   存在位P  访问位R  修改位M\n0x1C 1 1 0\n0x3F 1 1 1\n- 0 0 0\n0x5D 1 0 0\n- 0 0 0\n\n1．有那些页面不在内存？（2分）\n2．请分别计算进程中虚地址为0x3B7、0x12A5、0x1432单元的物理地址（用十六进制表示），并说明理由。    （6分）\n解：（共8分）\n不在内存的是第2和4页（按页号），或第3和5页（按序号）。  （2分）\n0x3B7的物理地址=0x 73 B7  （2分）\n0x12 A5的物理地址=0x 176 A5，缺页，换出第三页。  （2分）\n0x1432地址越界，出错。  （2分）', '计算题');
INSERT INTO `tb_question` VALUES ('287', '173', '0275', '175', '010473', '287', '05', '10．系统运行有三个进程：输入进程、计算进程和打印进程，它们协同完成工作。输入进程和计算进程之间共用缓冲区buffer1,计算进程和打印进程之间共用缓冲区buffer2。输入进程接收外部数据放入buffer1中；计算进程从buffer1中取出数据进行计算，然后将结果放入buffer2；打印进程从buffer2取出数据打印输出。\n用算法描述这三个进程的工作情况，并用wait和signal原语实现其同步操作。（共8分）\n解：（共8分）\n解答：输入进程、计算进程和打印进程之间的同步问题描述如下：\nvar：mutex1，mutex2，empty1，empty2，full1，full2：=1，1，1，1，0，0；\nInP:begin\n    repeat\n      wait(empty1);\n      wait(mutex1);\n      input a data from keyboard;\nAdd to buffer1;\nsignal(mutex1);\nsignal(full1);\nuntil false\nend\nCalP:begin\n      repeat\nwait(full1);\nwait(mutex1);\nTake a data form buffer1;\nAdd to ch1;\nsignal(mutex1);\nsignal(empty1);\ncalculate  ch1;\nwait (empty2);\nwait(mutex2);\nTake a data form ch1;\nAdd to buffer2;\nsignal (mutex2);\nsignal (full2);\n  until false\nend\nOutP:begin\n      repeat \nwait(full2);\nwait(mutex2);\nTake a data from buffer2;\nAdd to printer controler;\nsignal(mutex2);\nsignal(empty2);\nstart printer;\n    until false\nend\n\n（评分标准：信号量设置2分，输入进程、计算进程、打印进程各2分）', '计算题');
INSERT INTO `tb_question` VALUES ('288', '174', '0276', '176', '010474', '288', '05', '11．在一个请求分页系统中，有一个长度为 5 页的进程，假如系统为它分配 3 个物理块 ，并且此进程的页面走向为 2，3，2，1，5，2，4，5，3，2，5，2。试用 FIFO 和 LRU 两种算法分别计算出程序访问过程中所发生的缺页次数。（10分）\n解：FIFO：\n        2    3    2    1    5    2    4    5    3    2    5    2\n第1页   2    2         2    5    5    5         3         3    3\n第2页        3         3    3    2    2         2         5    5\n第3页                  1    1    1    4         4         4    2\n\n缺页中断次数 = 6\n\nLUR：\n        2    3    2    1    5    2    4    5    3    2    5    2\n第1页   2    2         2    2         5         5    5         3\n第2页        3         3    5         2         3    3         5\n第3页                  1    1         4         4    2         2\n\n缺页中断次数 = 5', '计算题');
INSERT INTO `tb_question` VALUES ('289', '175', '0277', '177', '010475', '289', '05', '12. 进程 A1，A2，…，An 通过 K 个缓冲区向进程 B1，B2，…，Bm  不断地发送消息。发送和接收工作遵循如下规则：\n1．每个发送进程一次发送一个消息，写入缓冲区，缓冲区大小与消息长度一致；\n2．对每个消息，B1，B2，…，Bm 都需接收一次，读入各自的数据区内；\n3．K 个缓冲区都满时，发送进程等待，没有可读的消息时，接收进程等待。\n试用 wait 和 signal 原语操作组织正确的发送和接收操作。（10分）\n解：\nBEGIN\n  Integer Mutex, Avail[n], Full[m];\n  Integer I;\n\nMutex:=1;\nFOR i:=1  TO  m  DO\nBEGIN\n  Avail[I] := k;\n  Full[I] := 0;\nEND\n\nPROCEDURE  Send(K)\nInteger  I;\nBEGIN', '计算题');
INSERT INTO `tb_question` VALUES ('290', '176', '0278', '178', '010476', '290', '05', '13．一个进程的大小为5个页面，为它分配了四个物理块。当前每个块的情况如下表所示（都为十进制数，且从0开始计数。）。当虚页4发生缺页时，使用下列的页面置换算法，哪一个物理块将被换出？并解释原因．（10分）\n页号  块号  加载时间 访问时间 访问位R 修改位M\n2  0  60  161  0  1\n1  1  130  160  0  0\n0  2  26  162  1  0\n3  3  20  163  1  1\n    \n１．IFO算法\n２．LRU算法\n３．CLOCK算法\n４．当页面的访问串为：“4，0，0，0，2，4，2，1，0，3，2”的OPT算法\n解：1．换出第3号虚页，因为它加载的时间最早；\n2．换出第1号虚页，因为它最近最久没被访问；\n3．换出第1号虚页，因为它最近既没被访问，又没被修改；\n4．换出第3号虚页，因为它离访问点最远。', '计算题');
INSERT INTO `tb_question` VALUES ('291', '177', '0279', '179', '010477', '291', '05', '14. 用整型信号量描述在哲学家进餐问题中，至多允许4个哲学家同时进餐的算法。（10分）\n解：public class diningphilosophers {\nsemaphore [] fork = new semaphore [5] (1);\nsemaphore room = new semaphore (4);\nint i;\nvoid philosopher (int i) {\nwhile (true)\nthink();\nwait (room);\nwait (fork[i]);\nwait (fork [(i+1) % 5]);\neat();\nsignal (fork [(i+1) % 5]);\nsignal (fork[i]);\nsignal (room);  }\nvoid main() {\nparbegin (philosopher (0), philosopher (1), philosopher (2),\nphilosopher (3), philosopher (4));  }  }', '计算题');
INSERT INTO `tb_question` VALUES ('292', '178', '0280', '180', '010478', '292', '05', '15．考虑一个有150个存储器单元的系统，如下分配给三个进程：\n进程   最大   占有\n————————————————————\n1   70   45\n2   60   40\n3   60   15\n\n使用银行家算法，以确定下面的任何一个请求是否安全：\na．第4个进程到达，最多需要60个存储单元，最初需要25个单元；\nb．第4个进程到达，最多需要60个存储单元，最初需要35个单元；\n如果安全给出安全序列；若不安全给出结果分配简表。（10分）\n解：进程  最大  占有  尚需  可用\n————————————————————————\n1   70   45   25   25 \n2   60   40   20\n3   60   15   45\n4   60   25   35\n安全序列为：1、2、3、4\n所以系统是安全的，可以进行分配。\nb．\n进程  最大  占有  尚需  可用\n————————————————————————\n1   70   45   25   15 \n2   60   40   20\n3   60   15   45\n4   60   35   25\n当前可用的资源不够任何一个进程运行完毕，所以不安全。', '计算题');
INSERT INTO `tb_question` VALUES ('293', '179', '0281', '181', '010479', '293', '05', '16. Jruassic 公园有一个恐龙博物馆和一个公园.有m个旅客和n辆车,每辆车只能容纳一个旅客。旅客在博物馆逛了一会儿，然后排队乘坐旅行车。当一辆车可用时，它载入一个旅客，然后绕公园行驶任意长的时间。如果n辆车都已被旅客乘坐游玩，则想坐车的旅客需要等待；如果一辆车已经就绪，但没有旅客等待，那么这辆车等待。使用信号量同步m个旅客和n辆车的进程。（10分）\n解：\nvisitors=m;  cars=n;  mutex=1;\nPvi()       Pci()\n{ repeat      { repeat \n   wait(cars);      wait(visitors);\n   wait(mutex);      wait(mutex);\n   get on;       start;\n   travell;       run;\n   get off;       stop;\n   signal(cars);      signal(visitors);\n   wait(mutex);      wait(mutex);\n until false;       until false;\n}       }', '计算题');
INSERT INTO `tb_question` VALUES ('294', '180', '0282', '182', '010480', '294', '05', '17.读者与写者问题 (reader -- writer  problems )    （10分）\n   在计算机体系中，对一个共享文件进行操作的进程可分为两类：读操作和写操作，它们分别被称为读者和写者。访问该文件时读者和写者，写者和写者间必须实现互斥。只有在没有读者访问文件时，写者才允许修改文件。或者写者在修改文件时不允许读者去读，否则会造成读出的文件内容不正确。试写出算法描述读者和写者的问题。\n解： 为了实现读者与写者的同步和互斥，我们设置一个信号量S，用于读者与写者之间或写者与读者之间的互斥，初值为“1”。用一个变量rc 表示当前正在读的读者个数，当进程可以去读或读结束后都要改变rc 的值，因此rc 又成为若干读进程的共享变量，它们必须互斥地修改rc。故必须定义另一个用于互斥的信号量Sr，初值也是“1”。读者--写者问题可描述如下：\n  S, Sr：semaphore；   int rc = 0;      S=Sr=1;\nprocess Reader I (i=1,2,...,m)            process Writer j (j=1,2,...,k)\nbegin                                 begin\n  P(Sr);   rc = rc+1;                      P(S);\n  if  (rc==1)  P(S);                       Write file F;\n  V(Sr);                                  V(S);\n  read file F;                            end  \n  P(Sr);    rc = tc-1;\n  if  (rc==0)  V(S);\n  V(Sr);\nend\n', '计算题');
INSERT INTO `tb_question` VALUES ('295', '181', '0283', '183', '010481', '295', '05', '18、若干个等待访问磁盘者依次要访问的磁道为20，44，40，4，80，12，76，假设每移动一个磁道需要3毫秒时间，移动臂当前位于40号柱面，请按下列算法分别写出访问序列并计算为完成上述各次访问总共花费的寻道时间。 \n      （1）先来先服务算法； \n（2）最短寻道时间优先算法。\n（3）扫描算法（当前磁头移动的方向为磁道递增）（10分）\n解：\n（1）磁道访问顺序为：20，44，40，4，80，12，76\n寻道时间=（20+24+4+36+76+68+64）*3=292*3=876\n（2）磁道访问顺序为：40，44，20，12，4，76，80\n寻道时间=（0+4+24+8+8+72+4）*3=120*3=360\n（3）磁道访问顺序为：40，44，76，80，20，12，4\n寻道时间=（0+4+32+4+60+8+8）*3=116*3=348', '计算题');
INSERT INTO `tb_question` VALUES ('296', '182', '0284', '184', '010482', '296', '05', '19、生产者和消费者问题    （10分）\n有一组生产者P1，P2，……，PM和一组消费者C1，C2，……，CK，他们通过由n个环形缓冲区构成的缓冲池进行通信，生产者把产品放入缓冲区，消费者从缓冲区取产品来消费。请用wait和signal原语实现他们的同步操作。\n解：生产者和消费者问题\nbegin\n        Var  mutex,empty,full:semaphore:=1,n,0;\n    buffer:array[0,…,n-1] of item;\n    in,out:integer := 0,0;\nparbegin\n             producer:   begin\n   repeat\n    produce  next  product ;\n    wait (empty);\n    wait (mutex);\n    buffer(in):=nextp ;\n    in := (in+1) mod n ;\n    signal (full);\n    signal (mutex);\n   until false ;\n   end\nconsumer: begin\n        repeat\n   wait (full);\n   wait (mutex);\n   nextc := buffer(out);\n   out := (out+1) mod n;\n   signal (empty);\n   signal (mutex);\n   consume the item in nextc;\n   until false ;\n  end\n parend  end', '计算题');
INSERT INTO `tb_question` VALUES ('297', '183', '0285', '185', '010483', '297', '05', '20、请用信号量描述哲学家进餐问题。（15分）\n解：哲学家进餐问题（15分）\npublic void philosopher (int i) {\n  while (true) {\n   think();\n   wait (fork[i]);\n   wait (fork [(i+1) % 5]);\n   eat();\n   signal(fork [(i+1) % 5]);\n   signal(fork[i]);\n   }  }', '计算题');
INSERT INTO `tb_question` VALUES ('298', '184', '0286', '186', '010484', '298', '05', '21．今有三个并发进程R，M，P，它们共享了一个可循环使用的缓冲区B，缓冲区B共有N个单元。进程R负责从输入设备读信息，每读一个字符后，把它存放在缓冲区B的一个单元中；进程M负责处理读入的字符，若发现读入的字符中有空格符，则把它改成“，”；进程P负责把处理后的字符取出并打印输出。当缓冲区单元中的字符被进程P取出后，则又可用来存放下一次读入的字符。请用PV操作为同步机制写出它们能正确并发执行的程序。   （10分）\n解：（10分）\nbegin\n        Var  mutex,input,calculate,output:semaphore:=1,n,0,0;\n    buffer:array[0,…,n-1] of item;\n    in,mid,out:integer := 0,0,0;\nproR()  { do  {\n    wait (input);\n    wait (mutex);\n    buffer(in):=input data;\n    in := (in+1) mod n ;\n    signal (calculate);\n    signal (mutex);\n   while true ;   }\nproM()  { do  {\n    wait (calculate);\n    wait (mutex);\n    buffer(middle):=calculate data ;\n    mid := (mid+1) mod n ;\n    signal (output);\n    signal (mutex);\n    }  while true ;   }\nproP()  { do  {\n    wait (output);\n    wait (mutex);\n    buffer(out):=calculate data ;\n    out := (out+1) mod n ;\n    signal (input);\n    signal (mutex);\n            }  while true ;   }', '计算题');
INSERT INTO `tb_question` VALUES ('299', '185', '0287', '187', '010485', '299', '05', '22.理发店里有一位理发师、一把理发椅子和五把供等候理发的顾客坐的椅子。如果没有顾客，理发师便在理发椅上睡觉。当一个顾客到来时，他必须先叫醒理发师，如果理发师正在理发时又有顾客来到，而如果有空椅子可坐，他们就坐下来等，如果没有空椅子，他就离开。这里的问题是为理发师和顾客各编写一段程序来描述他们行为，并用wait和signal原语操作实现其同步。（10分）\n解：理发师问题\n    #define CHAIRS 5                 /*为等候的顾客准备椅子数*/\n    typedef int semaphore;           /* 运用你的想像力*/\n    semphore customers=0;            /*等候服务的顾客数*/\n    semaphore barbers=0              /*等候服务的理发师数*/\n    semaphore mutex=1;               /*用于互斥*/\nint waiting=0;                   /*还没理发的等候顾客*/\n    void  barber  (void) {\n      while(TRUE)       {\n      wait(customers);                 /*如果顾客数是0，则睡觉*/\n      wait(mutex);                     /*要求进程等候*/\n      waiting=waiting-1;               /*等候顾客数减1*/ \n      signal(barbers);                     /*一个理发师现在开始理发*/\n      signal(mutex);                       /*释放等候*/\ncut_hair();                      /*理发（非临界区操作）*/\n}\n    void  customers (void)    {\n     wait(mutex);\nif (waiting<CHAIRS)  {\nwaiting=waiting+1;\nsignal(customers);\nsignal(mutex);\nwait(barbers);\n}  else  {\n    signal(mutex);\n}   }', '计算题');
INSERT INTO `tb_question` VALUES ('300', '186', '0288', '188', '010486', '300', '05', '24、在公共汽车上，乘客上完后，售票员关门，驾驶员开车，售票员售票，到站汽车停稳后，售票员开门，乘客上下车，售票员和驾驶员之间密切配合，直到下班。请用信号量描述公共汽车上售票员与驾驶员的工作过程。（10分）\n解：建立驾驶员和售票员两进程，驾驶员进程执行过程如下：\n（1）判售票员关门没有\n（2）开车\n（3）到站后停车\n（4）重复（1）－（3）\n售票员执行过程如下：\n（1）判断乘客上完没有\n（2）关门\n（3）售票\n（4）判车停稳没有\n（5）开门\n（6）重复（1）－（5）\n评分标准：执行过程完善3分，\n     驾驶员与售票员合作消息正确3分\n     售票员与驾驶员合作消息正确3分\n     书写格式1分', '计算题');
INSERT INTO `tb_question` VALUES ('301', '187', '0289', '189', '010487', '301', '05', '25、设某作业占有7个页面，如果在主存中只允许装入4个工作页面(即工作集为4)，作业运行时，实际访问页面的顺序是：1， 2， 3， 6， 4， 7， 3， 2， 1， 4， 7， 5， 6， 5， 2， 1。试用FIFO、LRU和CLOCK页面置换算法，列出各自的页面淘汰顺序和页面置换次数。     (10分)\n解：FIFO：\n1， 2， 3， 6， 4， 7， 3， 2， 1， 4， 7， 5， 6， 5， 2， 1\n1   1   1   1   4   4       4   4           5   5\n    2   2   2   2   7       7   7           7   6\n3 3   3   3       2   2           2   2\n6   6   6       6   1           1   1\n页面置换次数为：6次\nLRU：\n1， 2， 3， 6， 4， 7， 3， 2， 1， 4， 7， 5， 6， 5， 2， 1\n1   1   1   1   4   4       4   1   1   1   1   6       6   6\n    2   2   2   2   7       7   7   4   4   4   4       2   2\n3   3   3   3       3   3   3   7   7   7       7   1\n6   6   6       2   2   2   2   5   5       5   5\n页面置换次数为：10次\nCLOCK：\n1， 2， 3， 6， 4， 7， 3， 2， 1， 4， 7， 5， 6， 5， 2， 1\n1   1   1   1   4   4       4   1   1   1   1   6       6   6\n    2   2   2   2   7       7   7   4   4   4   4       2   2\n3   3   3   3       3   3   3   7   7   7       7   1\n6   6   6       2   2   2   2   5   5       5   5\n页面置换次数为：10次', '计算题');
INSERT INTO `tb_question` VALUES ('302', '188', '0290', '190', '010488', '302', '05', '26、某车站售票厅，任何时刻最多可容纳20名购票者进入，当售票厅中少于20名购票者时，则厅外的购票者可立即进入，否则需在外面等待。若把一个购票者看作一个进程，请回答下列问题：\n(1)用wait和signal操作管理这些并发进程时，应怎样定义信号量，写出信号量的初值以及信号量各种取值的含义。\n(2)根据所定义的信号量，加上wait和signal原语，写出购票者进程的算法，以保证进程能够正确地并发执行。\n (3)若欲购票者最多为n个人，写出信号量可能的变化范围(最大值和最小值)。\n解：(1)定义一信号量S，初始值为20。　\n　　意义：\n　　S>0　S的值表示可继续进入售票厅的人数　\n　　S=0　表示售票厅中已有20名顾客(购票者)　 \n　　S<0　|S|的值为等待进入售票厅的人数　\n　　(2) int S=20;\n      　COBEGIN　PROCESS　PI(I=1，2，……)\n　　    begin　　　　\n　进入售票厅；\n　          wait(S)；\n购票；\nsignal(S);\n退出；\n　　     end；\n　      COEND\n　　(3)S的最大值为20　\n　　　 S的最小值为20－n　', '计算题');
INSERT INTO `tb_question` VALUES ('303', '189', '0291', '191', '010489', '303', '05', '28、假定系统有三个并发进程read, move和print共享缓冲器B1和B2。进程read负责从输入设备上读信息，每读出一个记录后把它存放到缓冲器B1中。进程move从缓冲器B1中取出一记录，加工后存入缓冲器B2。进程print将B2中的记录取出打印输出。缓冲器B1和B2每次只能存放一个记录。要求三个进程协调完成任务，使打印出来的与读入的记录的个数，次序完全一样。请用wait和signal原语写出它们的并发程序。（10分）\n\n解：begin SR,SM1,SM2,SP:semaphore;\nB1,B2:record;\nSR:=1;SM1:=0;SM2:=1;SP:=0\nCobegin\nprocess read\nX:record;\nbegin R: (接收来自输入设备上一个记录)\nX:=接收的一个记录；\nwaiut(SR)；\nB1:=X;\nsignal(SM1);\ngoto R;\nend;\nProcess move\nY:record;\nBegin\nM:wait(SM1);\nY:=B1;\nsignal(SR)\n加工 Y\nwait(SM2)；\nB2:=Y;\nsignal(SP);\ngoto M;\nend;\nProcess print\nZ:record;\nBegin\nP:wait(SP);\nZ:=B2;\nsignal(SM2)\n打印Z\ngoto P;\nend;\ncoend;\nend;', '计算题');
INSERT INTO `tb_question` VALUES ('304', '190', '0292', '192', '010490', '304', '05', '29、考虑下述页面走向：\n     12，3，42，1，56，2，12，3，76，3，21，2，36\n当内存块数量分别为3时，试问FIFO、LRU、OPT\n答：所有内存块最初都是空的，所以第一次用到的页面都产生一次缺页。\n3时：\n   FIFO    1，23，4，21，5，6，2，12，3，76，3，21，2，36\n        1  1  1  4     4  4  6  6  6     3  3  3     2  2     2  6\n           2  2  2     1  1  1  2  2     2  7  7     7  1     1  1\n   3  3     3  5  5  5  1     1  1  6     6  6     3  3\n发生缺页中断的次数为16在FIFO64、1、56之前调入的页面，分别为5、1、24，可见4为最先进入内存的，本次应换出，然后把页6    LRU    1，23，4，21，5，6，2，12，3，76，3，21，2，36\n           1  1  1  4     4  5  5  5  1     1  7  7     2  2        2\n   2  2  2     2  2  6  6  6     3  3  3     3  3        3\n      3  3     1  1  1  2  2     2  2  6     6  1        6\n发生缺页中断的次数为15在LRU65、2、16之前调入的页面，分别为5、1、22为最近一段时间内使用最少的，本次应换出，然后把页6调入内存。\n   OPT    1，23，4，21，5，6，2，12，3，76，3，21，2，36\n           1  1  1  1        1  1           3  3        3  3        6\n   2  2  2        2  2           2  7        2  2        2\n      3  4        5  6           6  6        6  1        1\n发生缺页中断的次数为11在OPT61、2、56后面要调入的页面，分别为2、1、2…，可见5为最近一段时间内使用最少的，本次应换出，然后把页64、答：引入缓冲技术的主要目的是：（123）使得一次输入的信息能多次使用。　', '计算题');
INSERT INTO `tb_question` VALUES ('305', '191', '0293', '193', '010491', '305', '05', '30．若干个等待访问磁盘的进程依次要访问的磁道为27，63，57，24，107，35，106当前磁头的位置为57号磁道，根据下面的磁盘调度算法，请给出调度的顺序，并计算平均寻道长度。（10分）\n1. 先来先服务算法\n2. 最短寻道时间优先\n3. 扫描算法（当前磁头移动的方向为磁道递增）\n4. 循环扫描算法（当前磁头移动的方向为磁道递增）\n解：一系统中具有S类资源150个，在T0时刻按下表所示分配给3个进程：\n进程 Maximum demand Current allocation\nP1 70 25\nP2 60 40\nP3 60 45\n对下列请求应用银行家算法逐步分别分析判定是否安全, 如果是安全的，请给出一个可能的进程安全执行序列；如果不是安全的，请说明原因。（10分）\n1. 第4个进程P4到达，对资源S的最大需求为60个，当前请求分配25个；\n2．第4个进程P4到达，对资源S的最大需求50个，当前请求分配35个。', '计算题');
INSERT INTO `tb_question` VALUES ('306', '192', '0294', '194', '010492', '306', '05', '31．一个采用请求式存储管理的计算机系统，其主存（实存）容量为256M字节，虚存容量（给用户的最大地址空间）为4G字节，页面大小为4K字节，试问：（10分）\n1. 主存物理地址应设为多少位？\n2. 主存中有多少物理块？\n3. 虚拟地址应该设多少位？\n4. 虚拟地址空间最多可以有多少页？\n5. 页内最大和最小偏移量是多少？\n', '计算题');
INSERT INTO `tb_question` VALUES ('307', '193', '0295', '195', '010493', '307', '06', '1.原语：它是由若干条机器指令所构成，用以完成特定功能的一段程序，为保证其操作的  正确性，它应当是原子操作，即原语是一个不可分割的操作。', '证明题');
INSERT INTO `tb_question` VALUES ('308', '194', '0296', '196', '010494', '308', '06', '2.设备独立性：指用户设备独立于所使用的具体物理设备。即在用户程序中要执行I/O操作时，只需用逻辑设备名提出I/O请求，而不必局限于某特定的物理设备。', '证明题');
INSERT INTO `tb_question` VALUES ('309', '195', '0297', '197', '010495', '309', '06', '3.文件的逻辑结构：又称为文件逻辑组织，是指从用户观点看到的文件组织形式。它可分为两类：记录式文件结构，由若干相关的记录构成；流式文件结构，由字符流构成。', '证明题');
INSERT INTO `tb_question` VALUES ('310', '196', '0298', '198', '010496', '310', '06', '4.树形结构目录：利用树形结构的形式，描述各目录之间的关系。上级目录与相邻下级目录的关系是1对n。树形结构目录能够较好地满足用户和系统的要求。', '证明题');
INSERT INTO `tb_question` VALUES ('311', '197', '0299', '199', '010497', '311', '06', '5.操作系统：操作系统是控制和管理计算机硬件和软件资源，合理地组织计算机的工作流程，以及方便用户的程序的集合。其主要功能是实现处理机管理、内存管理、I/O设备管理、文件管理和用户接口。', '证明题');
INSERT INTO `tb_question` VALUES ('312', '198', '0300', '200', '010498', '312', '06', '6.位示图：它是利用一个向量来描述自由块使用情况的一张表。表中的每个元素表示一个盘块的使用情况，0表示该块为空闲块，1表示已分配。', '证明题');
INSERT INTO `tb_question` VALUES ('313', '199', '0301', '201', '010499', '313', '06', '7.置换策略：虚拟式存储管理中的一种策略。用于确定应选择内存中的哪一页(段) 换出到磁盘对换区，以便腾出内存。通常采用的置换算法都是基于把那些在最近的将来，最少可能被访问的页(段)从内存换出到盘上。', '证明题');
INSERT INTO `tb_question` VALUES ('314', '200', '0302', '202', '010500', '314', '06', '8.用户接口：操作系统提供给用户和编程人员的界面和接口。包括程序接口、命令行方式和图形用户界面。', '证明题');
INSERT INTO `tb_question` VALUES ('315', '201', '0303', '203', '010501', '315', '06', '9. 死锁：指多个进程因竞争资源而造成的一种僵局，若无外力的作用，这些进程将永远不能再向前推进。', '证明题');
INSERT INTO `tb_question` VALUES ('316', '202', '0304', '204', '010502', '316', '06', '10.文件系统:OS中负责管理和存取文件信息的软件机构。负责文件的建立，撤消，存入，续写，修改和复制，还负责完成对文件的按名存取和进行存取控制。', '证明题');
INSERT INTO `tb_question` VALUES ('317', '203', '0305', '205', '010503', '317', '06', '11.进程:进程是程序在一个数据集合上的运行过程，是系统进行资源分配和调度的一个独立的基本单位。', '证明题');
INSERT INTO `tb_question` VALUES ('318', '204', '0306', '206', '010504', '318', '06', '12.wait(s)原语\nwait(s) ：Begin\n Lock  out  interrupts;\n s = s – 1;\n If  s < 0  then Begin\n   Status(q) = blocked;\n   Insert(WL, q);\n   Unlock  interrupts;     Scheduler;\n   End\n Else  unlock  interrupts;\nEnd', '证明题');
INSERT INTO `tb_question` VALUES ('319', '205', '0307', '207', '010505', '319', '06', '13.链接文件\n逻辑文件中的不同记录可以存储在离散的磁盘块中。每个盘块中都设置了一个指向下一个盘块的链接指针，用这些指针可将一个文件中的所有盘块拉成一条链，而在文件控制块中的“文件地址指针”便指向存放该文件的第一个盘块的编号。', '证明题');
INSERT INTO `tb_question` VALUES ('320', '206', '0308', '208', '010506', '320', '06', '14.快表 \n 采用联想存储器加快查表速度 ,在地址变换机构中，加入一个高速，小容量、具有并行查询能力的联想存储器，构成快表,存放正运行的作业的当前页号和块号。        在快表中找到，直接进行地址转换；未找到，则在主存页表继续查找，并把查到的页号和块号放入联想存储器的空闲单元中，如没有，淘汰最先装入的页号。    ', '证明题');
INSERT INTO `tb_question` VALUES ('321', '207', '0309', '209', '010507', '321', '06', '15．虚拟存储器  \n指具有请求调入功能和置换功能，能从逻辑上对内存容量进行扩充的一种存储器系统。从用户观点看，虚拟存储器具有比实际内存大得多的容量。这既方便了用户，又提高了内存的利用率和系统的吞吐量。      ', '证明题');
INSERT INTO `tb_question` VALUES ('322', '208', '0310', '210', '010508', '322', '06', '16．文件目录\n为了项用户提供对文件的存取控制及保护功能，而按一定规则对系统中的文件名，(亦可包含文件属性)进行组织所形成的表，称为目录表或文件目录。', '证明题');
INSERT INTO `tb_question` VALUES ('323', '209', '0311', '211', '010509', '323', '06', '17．I/O控制：\n我们把从用户进程的输入/输出请求开始，给用户进程分配设备和启动有关设备   进行I /O操作，以及在I /O 操作完成之后响应中断，进行善后处理为止的整个系统控制过程称为I /O 控制。', '证明题');
INSERT INTO `tb_question` VALUES ('324', '210', '0312', '212', '010510', '324', '06', '18. 缓冲池：\n 这是具有多个缓冲区的公用缓冲器，其中的各个缓冲区可供多个进程或设备共享。为便于管理，通常把缓冲池中的缓冲区，按其性质的不同而构成若干个链表或队列，如空缓冲队列，输入缓冲队列等。', '证明题');
INSERT INTO `tb_question` VALUES ('325', '211', '0313', '213', '010511', '325', '06', '19. SPOOLING：\n 即同时联机外围操作，又称脱机操作。在多道程序环境下，可利用多道程序中的一道程序，来模拟脱机的输入输出功能。即在联机条件下，将数据从输入设备传送到磁盘，或从磁盘传送到输出设备。', '证明题');
INSERT INTO `tb_question` VALUES ('326', '212', '0314', '214', '010512', '326', '06', '20.逻辑地址与物理地址:\n在具有地址变换机构的计算机中，允许程序中编排的地址和信息实际存放在内存中的地址有所不同。逻辑地址是指用户程序经编译后，每个目标模块以0为基地址进行的顺序编址。逻辑地址又称相对地址。物理地址是指内存中各物理存储单元的地址从统一的基地址进行的顺序编址。物理地址又称绝对地址，它是数据在内存中的实际存储地址。', '证明题');
INSERT INTO `tb_question` VALUES ('327', '213', '0315', '215', '010513', '327', '06', '21虚拟存储器:\n答：虚拟存储器是一种存储管理技术，用以完成用小的内存实现在大的虚空间中程序的运行工作。它是由操作系统提供的一个假想的特大存储器。但是虚拟存储器的容量并不是无限的，它由计算机的地址结构长度所确定，另外虚存容量的扩大是以牺牲CPU工作时间以及内、外存交换时间为代价的。', '证明题');
INSERT INTO `tb_question` VALUES ('328', '01', '0103', '11', '010301', '328', '01', '1.1以下属于物理层的设备是（A）\nA. 中继器   B. 以太网交换机  C. 桥  D. 网关 ', '选择');
INSERT INTO `tb_question` VALUES ('329', '02', '0104', '12', '010302', '329', '01', '1.2在以太网中是根据_B_地址来区分不同的设备的. \nA. LLC地址   B. MAC地址\nC. IP地址     D. IPX地址', '选择');
INSERT INTO `tb_question` VALUES ('330', '03', '0105', '13', '010303', '330', '01', '1.3IEEE802.3u标准是指（B）\nA. 以太网      B. 快速以太网\nC. 令牌环网    D. FDDI网', '选择');
INSERT INTO `tb_question` VALUES ('331', '04', '0106', '14', '010304', '331', '01', '1.4下面哪种LAN 是应用CSMA/CD协议的（C）\nA、令牌环       B、FDDI\nC、ETHERNET   D、NOVELL', '选择');
INSERT INTO `tb_question` VALUES ('332', '05', '0107', '15', '010305', '332', '01', '1.5FDDI 使用的是___局域网技术。 （C）\nA、以太网     B、快速以太网\nC、令牌环     D、令牌总线', '选择');
INSERT INTO `tb_question` VALUES ('333', '06', '0108', '16', '010306', '333', '01', '1.6TCP和UDP协议的相似之处是 （C）\nA、面向连接的协议   B、面向非连接的协议\nC、传输层协议       D、以上均不对', '选择');
INSERT INTO `tb_question` VALUES ('334', '07', '0109', '17', '010307', '334', '01', '1.7应用程序PING 发出的是_（C）_报文。 \nA、TCP 请求报文    B、TCP 应答报文\nC、ICMP 请求报文   D、ICMP 应答报文', '选择');
INSERT INTO `tb_question` VALUES ('335', '08', '0110', '18', '010308', '335', '01', '1.8小于___的TCP/UDP端口号已保留与现有服务一一对应，此数字以上的端口号可自由分配。（C）\nA、199  B、100   C、1024   D、2048', '选择');
INSERT INTO `tb_question` VALUES ('336', '09', '0111', '19', '010309', '336', '01', '1.9当一台主机从一个网络移到另一个网络时，以下说法正确的是 （B）\nA、必须改变它的IP 地址和MAC 地址\nB、必须改变它的IP 地址，但不需改动MAC 地址\nC、必须改变它的MAC 地址，但不需改动IP 地址\nD、MAC 地址、IP 地址都不需改动', '选择');
INSERT INTO `tb_question` VALUES ('337', '10', '0112', '20', '010310', '337', '01', '1.10IEEE802.5 标准是指 （C）\nA、以太网  B、令牌总线网C、令牌环网 D、FDDI 网', '选择');
INSERT INTO `tb_question` VALUES ('338', '11', '0113', '21', '010311', '338', '01', '1.11ARP 协议的作用是 （D）\nA、将端口号映射到IP 地址\nB、连接IP 层和TCP 层\nC、广播IP 地址\nD、将IP 地址映射到第二层地址', '选择');
INSERT INTO `tb_question` VALUES ('339', '12', '0114', '22', '010312', '339', '01', '1.1210BASE-T是指 （C）\nA、粗同轴电缆    B、细同轴电缆\nC、双绞线        D、光纤', '选择');
INSERT INTO `tb_question` VALUES ('340', '13', '0115', '23', '010313', '340', '01', '1.13帧中继的使用链路层协议是 （C）\nA、LAPB   B、LAPD  C、LAPF   D、HDLC', '选择');
INSERT INTO `tb_question` VALUES ('341', '14', '0116', '24', '010314', '341', '01', '1.14与10.110.12.29 mask 255.255.255.224 属于同一网段的主机IP 地址是 （B）\nA、10.110.12.0      B、10.110.12.30\nC、10.110.12.31     D、10.110.12.32', '选择');
INSERT INTO `tb_question` VALUES ('342', '15', '0117', '25', '010315', '342', '01', '1.15某公司申请到一个C 类IP 地址，但要连接6 个的子公司，最大的一个子公司有26 台计算机，每个子公司在一个网段中，则子网掩码应设为 （D）\nA、255.255.255.0        B、255.255.255.128\nC、255.255.255.192      D、255.255.255.224', '选择');
INSERT INTO `tb_question` VALUES ('343', '16', '0118', '26', '010316', '343', '01', '1.16224.0.0.5 代表的是___地址。 （C）\nA、主机地址    B、网络地址\nC、组播地址    D、广播地址', '选择');
INSERT INTO `tb_question` VALUES ('344', '17', '0119', '27', '010317', '344', '01', '1.17路由选择协议位于（C） 。\nA. 物理层 B. 数据链路层 C. 网络层 D. 应用层 ', '选择');
INSERT INTO `tb_question` VALUES ('345', '18', '0120', '28', '010318', '345', '01', '1.18在局域网中，MAC指的是（ B）。\nA. 逻辑链路控制子层   B. 介质访问控制子层\nC. 物理层             D. 数据链路层', '选择');
INSERT INTO `tb_question` VALUES ('346', '19', '0121', '29', '010319', '346', '01', '1.19255.255.255.224可能代表的是（ C）。\nA. 一个B类网络号  B. 一个C类网络中的广播\nC. 一个具有子网的网络掩码   D. 以上都不是', '选择');
INSERT INTO `tb_question` VALUES ('347', '20', '0122', '30', '010320', '347', '01', '1.20传输层可以通过（ B ）标识不同的应用。\nA. 物理地址B. 端口号C. IP地址D. 逻辑地址', '选择');
INSERT INTO `tb_question` VALUES ('348', '21', '0123', '31', '010321', '348', '01', '1.21第二代计算机网络的主要特点是 （ A）。\nA. 计算机-计算机网络B. 以单机为中心的联机系统\nC. 国际网络体系结构标准化\nD. 各计算机制造厂商网络结构标准化', '选择');
INSERT INTO `tb_question` VALUES ('349', '22', '0124', '32', '010322', '349', '01', '1.22IP地址为 140.111.0.0 的B类网络，若要切割为9个子网，子网掩码应设为（ D）。\n　　A. 255.0.0.0        B. 255.255.0.0\n　　C. 255.255.128.0    D. 255.255.240.0', '选择');
INSERT INTO `tb_question` VALUES ('350', '23', '0125', '33', '010323', '350', '01', '1.23在Internet上浏览时，浏览器和WWW服务器之间传输网页使用的协议是（ B）。\nA. IP    B. HTTP    C. FTP   D. Telnet', '选择');
INSERT INTO `tb_question` VALUES ('351', '24', '0126', '34', '010324', '351', '01', '1.24在数据通信中，当发送数据出现差错时，发送端无需进行数据重发的差错控制方法为 （B ）。\n　A. ARQ  B. FEC  C. BEC  D. CRC', '选择');
INSERT INTO `tb_question` VALUES ('352', '25', '0127', '35', '010325', '352', '01', '1.25计算机通信子网技术发展的顺序是（ C）。\nA. ATM->帧中继->电路交换->报文组交换\nB. 电路交换->报文组交换->ATM->帧中继\nC. 电路交换->报文分组交换->帧中继->ATM\nD. 电路交换->帧中继->ATM->报文组交换', '选择');
INSERT INTO `tb_question` VALUES ('353', '26', '0128', '36', '010326', '353', '01', '1.26浏览器与Web服务器之间使用的协议是（ C ）。\nA  DNS   B. SNMP   C. HTTP   D. SMTP', '选择');
INSERT INTO `tb_question` VALUES ('354', '27', '0129', '37', '010327', '354', '01', '1.27相邻层间交换的数据单元称之为服务数据单元，其英文缩写为（ A ）。\nA. SDU   B. IDU    C. PDU    D . ICI', '选择');
INSERT INTO `tb_question` VALUES ('355', '28', '0130', '38', '010328', '355', '01', '1.28如果一个C类网络用掩码255.255.255.192划分子网，那么会有（A）个可用的子网。\nA. 2　　B. 4　 C. 6　 D. 8', '选择');
INSERT INTO `tb_question` VALUES ('356', '29', '0131', '39', '010329', '356', '01', '1.29能从数据信号波形中提取同步信号的典型编码是（ D ）。\nA.归零码　B.不归零码　C.定比码　D.曼彻斯特编码', '选择');
INSERT INTO `tb_question` VALUES ('357', '30', '0132', '40', '010330', '357', '01', '1.30世界上很多国家都相继组建了自己国家的公用数据网，现有的公用数据网大多采用（ A ）。\nA.分组交换方式　　B.报文交换方式　　\nC.电路交换方式  　D.空分交换方式', '选择');
INSERT INTO `tb_question` VALUES ('358', '31', '0133', '41', '010331', '358', '01', '1.31在IP地址方案中，159.226.181.1是一个（ B ）。\nA. A类地址 B. B类地址　C. C类地址　D. D类地址', '选择');
INSERT INTO `tb_question` VALUES ('359', '32', '0134', '42', '010332', '359', '01', '1.32在TCP/IP中，解决计算机到计算机之间通信问题的层次是（ B ）。\nA. 网络接口层 　B.网际层　C.传输层　D. 应用层', '选择');
INSERT INTO `tb_question` VALUES ('360', '33', '0135', '43', '010333', '360', '01', '1.33三次握手方法用于（ A ）。\nA. 传输层连接的建立　B. 数据链路层的流量控制\nC. 传输层的重复检测　D. 传输层的流量控制', '选择');
INSERT INTO `tb_question` VALUES ('361', '34', '0136', '44', '010334', '361', '01', '1.34在计算机网络中，所有的计算机均连接到一条通信传输线路上，在线路两端连有防止信号反射的装置。 这种连接结构被称为（ A ）。\nA.总线结构　B.环型结构　C.星型结构　D.网状结构', '选择');
INSERT INTO `tb_question` VALUES ('362', '35', '0137', '45', '010335', '362', '01', '1.35以下属于广域网技术的是（ C）。\nA. 以太网 　B. 令牌环网　C. 帧中继　D. FDDI', '选择');
INSERT INTO `tb_question` VALUES ('363', '36', '0138', '46', '010336', '363', '01', '1.36TCP的协议数据单元被称为（ C ）。\n　　A. 比特　　B. 帧　　C. 分段　　D. 字符', '选择');
INSERT INTO `tb_question` VALUES ('364', '37', '0139', '47', '010337', '364', '01', '1.37下面提供FTP服务的默认TCP端口号是（ A ）。\n　　A. 21　　B. 25　　 C. 23　　D. 80', '选择');
INSERT INTO `tb_question` VALUES ('365', '38', '0140', '48', '010338', '365', '01', '1.38在同一个信道上的同一时刻，能够进行双向数据传送的通信方式是（ C ）。\nA. 单工 B.半双工　C. 全双工　D. 上述三种均不是', '选择');
INSERT INTO `tb_question` VALUES ('366', '39', '0141', '49', '010339', '366', '01', '1.39某部门申请到一个C类IP地址,若要分成8个子网,其掩码应为（ C ）。\nA. 255.255.255.255　 B.255.255.255.0\nC.255.255.255.224　 D.255.255.255.192', '选择');
INSERT INTO `tb_question` VALUES ('367', '40', '0142', '50', '010340', '367', '01', '1.40以下的网络分类方法中，哪一组分类方法有误B\nA. 局域网/广域网   B. 对等网/城域网\nC. 环型网/星型网   D. 有线网/无线网', '选择');
INSERT INTO `tb_question` VALUES ('368', '41', '0143', '51', '010341', '368', '01', '1.41在OSI的七层参考模型中，工作在第三层以上的网间连接设备是（ C ）。\nA. 集线器　　 B. 网关　　C. 网桥　　D. 中继器', '选择');
INSERT INTO `tb_question` VALUES ('369', '42', '0144', '52', '010342', '369', '01', '1.42世界上第一个计算机网络是 （A）。\nA. ARPANET  B. ChinaNet　C.Internet　D.CERNET', '选择');
INSERT INTO `tb_question` VALUES ('370', '43', '0145', '53', '010343', '370', '01', '1.43以太网媒体访问控制技术CSMA/CD的机制是（A）。\nA. 争用带宽       B. 预约带宽\nC. 循环使用带宽　 D. 按优先级分配带宽', '选择');
INSERT INTO `tb_question` VALUES ('371', '44', '0146', '54', '010344', '371', '01', '1.44以下关于100BASE-T的描述中错误的是（C）。\n　　A. 数据传输速率为100Mbit/S \n　　B. 信号类型为基带信号\n　　C. 采用5 类UTP，其最大传输距离为185M\n　　D. 支持共享式和交换式两种组网方式', '选择');
INSERT INTO `tb_question` VALUES ('372', '45', '0147', '55', '010345', '372', '01', '1.45www.tsinghua.edu.cn这个完整名称（FQDN）里，（ D ）是主机名.\nA.edu.cn　　B.tsinghua　C. tsinghua.edu.cn  D. www', '选择');
INSERT INTO `tb_question` VALUES ('373', '46', '0148', '56', '010346', '373', '01', '1.46一般来说，用户上网要通过因特网服务提供商，其英文缩写为(  D  )\nA．IDC   B．ICP    C．ASP     D．ISP  ', '选择');
INSERT INTO `tb_question` VALUES ('374', '47', '0149', '57', '010347', '374', '01', '1.47使用双绞线作为传输介质，适用于下列哪种类型的以太网(  B  )\nA．10Base-5  B．10/100Base-T  \nC．10/100Base-F  D．10Base-2', '选择');
INSERT INTO `tb_question` VALUES ('375', '48', '0150', '58', '010348', '375', '01', '1.48PPP协议是哪一层的协议(   B )\nA．物理层  B．数据链路层  C．网络层  D．高层', '选择');
INSERT INTO `tb_question` VALUES ('376', '49', '0151', '59', '010349', '376', '01', '1.49在以下传输介质中，带宽最宽，抗干扰能力最强的是( D)\nA、双绞线  B、无线信道   C、同轴电缆  D、光纤', '选择');
INSERT INTO `tb_question` VALUES ('377', '50', '0152', '60', '010350', '377', '01', '1.50目前网络应用系统采用的主要模型是( C )\nA．离散个人计算模型   B．主机计算模型   \nC客户/服务器计算模型 D网络/文件服务器计算模型', '选择');
INSERT INTO `tb_question` VALUES ('378', '51', '0153', '61', '010351', '378', '01', '1.51IP协议是无连接的，其信息传输方式是( B )\nA．点对点   B．数据报    C．广播    D．虚电路', '选择');
INSERT INTO `tb_question` VALUES ('379', '52', '0154', '62', '010352', '379', '01', '1.52域名www.pku.edu.cn与www.cam.ac.uk哪部分是相同的？ ( C )\nA．最高层域  B．子域   C．主机域  D．都不相同', '选择');
INSERT INTO `tb_question` VALUES ('380', '53', '0155', '63', '010353', '380', '01', '1.53一座大楼内的一个计算机网络系统，属于（B）\nA、PAN   B、LAN   C、MAN   D、WAN', '选择');
INSERT INTO `tb_question` VALUES ('381', '54', '0156', '64', '010354', '381', '01', '1.54网络协议主要要素为（ C ）\nA、数据格式、编码、信号电平\nB、数据格式、控制信息、速度匹配\nC、语法、语义、时序\nD、编码、控制信息、同步', '选择');
INSERT INTO `tb_question` VALUES ('382', '55', '0157', '65', '010355', '382', '01', '1.55采用专用线路通信时，可以省去的通信阶段是A\nA、建立通信线路      B、建立数据传输链路\nC、传送通信控制信号和数据 D、双方确认通信结束', '选择');
INSERT INTO `tb_question` VALUES ('383', '56', '0158', '66', '010356', '383', '01', '1.56通信系统必须具备的三个基本要素是（ C ）\nA、终端、电缆、计算机\nB、信号发生器、通信线路、信号接收设备\nC、信源、通信媒体、信宿\nD、终端、通信设施、接收设备', '选择');
INSERT INTO `tb_question` VALUES ('384', '57', '0159', '67', '010357', '384', '01', '1.57计算机网络通信系统是（ D ）\nA、电信号传输系统    B、文字通信系统\nC、信号通信系统      D、数据通信系统', '选择');
INSERT INTO `tb_question` VALUES ('385', '58', '0160', '68', '010358', '385', '01', '1.58在TCP/IP协议簇的层次中，解决计算机之间通信问题是在（ B ）\nA、网络接口层 B、网际层 C、传输层 D、应用层', '选择');
INSERT INTO `tb_question` VALUES ('386', '59', '0161', '69', '010359', '386', '01', '1.59在中继系统中，中继器处于（ A ）\nA、物理层 B、数据链路层 C、网络层 D、高层', '选择');
INSERT INTO `tb_question` VALUES ('387', '60', '0162', '70', '010360', '387', '01', '1.60对于带宽为6MHz的信道，若用8种不同的状态来表示数据，在不考虑热噪声的情况下，该信道每秒最多能传送的位数为（ A ）\nA 36×106  B 18×106  C 48×106  D 96×106', '选择');
INSERT INTO `tb_question` VALUES ('388', '61', '0163', '71', '010361', '388', '01', '1.61就交换技术而言，局域网中的以太网采用的是A\nA 分组交换技术  B 电路交换技术\nC 报文交换技术  D 分组交换与电路交换结合技术', '选择');
INSERT INTO `tb_question` VALUES ('389', '62', '0164', '72', '010362', '389', '01', '1.62一个VLAN可以看作是一个 （B） \nA、冲突域  B、广播域  C、管理域  D、阻塞域', '选择');
INSERT INTO `tb_question` VALUES ('390', '63', '0165', '73', '010363', '390', '01', '1.63在internet的基本服务功能中，远程登录所使用的命令是（B）。\nA、 ftp    B、 telnet   C、 mail    D、open', '选择');
INSERT INTO `tb_question` VALUES ('391', '64', '0166', '74', '010364', '391', '01', '1.64TCP/IP协议规定为（A）。\nA、 4层    B、 5层   C、 6层    D、7层', '选择');
INSERT INTO `tb_question` VALUES ('392', '65', '0167', '75', '010365', '392', '01', '1.65Internet网络是一种（D）结构的网络。\nA、 星型    B、 环型   C、 树型    D、网型', '选择');
INSERT INTO `tb_question` VALUES ('393', '66', '0168', '76', '010366', '393', '01', '1.66下列有关集线器的说法正确的是（B）。\nA、集线器只能和工作站相连   \nB、利用集线器可将总线型网络转换为星型拓扑\nC、集线器只对信号起传递作用\nD、集线器不能实现网段的隔离', '选择');
INSERT INTO `tb_question` VALUES ('394', '67', '0169', '77', '010367', '394', '01', '1.67 以太网交换机的每一个端口可以看做一个（A）\nA. 冲突域    B. 广播域   C. 管理域   D. 阻塞域', '选择');
INSERT INTO `tb_question` VALUES ('395', '68', '0170', '78', '010368', '395', '01', '1.68请判断下述中正确的是（ C ）\nA、 时分多路复用是将物理信道的总带宽分割成若干个子信道，该物理信道同时传输各子信道的信号；\nB、 虚电路传输方式类似于邮政信箱服务，数据报服务类似于长途电话服务；\nC、 多路复用的方法中，从性质上来说，频分多路复用较适用于模拟信号传输，而时分多路复用较适用于数字信号传输 \nD、 即使采用数字通信方式，也还需要同模拟通信方式一样，必须使用调制解调器。', '选择');
INSERT INTO `tb_question` VALUES ('396', '69', '0171', '79', '010369', '396', '01', '1.69IP电话使用的数据交换技术是（C）\nA电路交换   B报文交换  C分组交换   D包交换', '选择');
INSERT INTO `tb_question` VALUES ('397', '70', '0172', '80', '010370', '397', '01', '1.70在OSI环境中，不同开放系统对等实体之间的通信，需要（N）实体向相邻的上一层（N+1）实体提供一种能力，这种能力称为（B）\nA、协议   B、服务  C、用户   D、功能', '选择');
INSERT INTO `tb_question` VALUES ('398', '71', '0173', '81', '010371', '398', '01', '1.72下列只能简单再生信号的设备是。\nA. 网卡　　B. 网桥　　C. 中继器 　D. 路由器', '选择');
INSERT INTO `tb_question` VALUES ('399', '72', '0174', '82', '010372', '399', '01', '1.73网卡是完成( C )功能的 .\nA. 物理层            B. 数据链路层\nC. 物理和数据链路层  D. 数据链路层和网络层     ', '选择');
INSERT INTO `tb_question` VALUES ('400', '73', '0175', '83', '010373', '400', '01', '1.74当数据由计算机A传送至计算机B时，不参与数据封装工作的是(A).\nA. 物理层  B. 数据链路层  C. 应用层 D. 网络层           ', '选择');
INSERT INTO `tb_question` VALUES ('401', '74', '0176', '84', '010374', '401', '01', '1.75CSMA/CD是IEEE802.3所定义的协议标准，它适用于 ( D ).\nA.令牌环网  B.令牌总线网  C. 网络互连 D.以太网     ', '选择');
INSERT INTO `tb_question` VALUES ('402', '75', '0177', '85', '010375', '402', '01', '1.76100BASE-TX中，所用的传输介质是( B ).    \nA. 3类双绞线          B. 5类双绞线          \nC. 1类屏蔽双绞线      D. 任意双绞线', '选择');
INSERT INTO `tb_question` VALUES ('403', '76', '0178', '86', '010376', '403', '01', '1.77随着电信和信息技术的发展，国际上出现了所谓“三网融合”的趋势，下列不属于三网之一的是(D)\n　A.传统电信网　　 B．计算机网(主要指互联网)\n　C.有线电视网　　 D．卫星通信网', '选择');
INSERT INTO `tb_question` VALUES ('404', '77', '0179', '87', '010377', '404', '01', '1.78世界上第一个网络是在( B )年诞生。\nA、1946  B、1969  C、1977  D、1973', '选择');
INSERT INTO `tb_question` VALUES ('405', '78', '0180', '88', '010378', '405', '01', '1.79电话交换系统采用的是( A )技术\nA.线路交换 B.报文交换 C.分组交换D.信号交换', '选择');
INSERT INTO `tb_question` VALUES ('406', '79', '0181', '89', '010379', '406', '01', '1.80以下属于低层协议的是( B )\nA、FTP  B、IP  C、UDP  D、TCP', '选择');
INSERT INTO `tb_question` VALUES ('407', '80', '0182', '90', '010380', '407', '01', '1.81TCP/IP层的网络接口层对应OSI的(D)。\nA.物理层  B.链路层  C.网络层  D.物理层和链路层', '选择');
INSERT INTO `tb_question` VALUES ('408', '81', '0183', '91', '010381', '408', '01', '1.82若网络形状是由站点和连接站点的链路组成的一个闭合环，则称这种拓扑结构为( C )\nA.星形拓扑    B.总线拓扑  C.环形拓扑     D.树形拓扑', '选择');
INSERT INTO `tb_question` VALUES ('409', '82', '0184', '92', '010382', '409', '01', '1.83以下各项中，不是数据报操作特点的是(  C  )\nA.每个分组自身携带有足够的信息，它的传送是被单独处理的  B.在整个传送过程中，不需建立虚电路\nC.使所有分组按顺序到达目的端系统\nD.网络节点要为每个分组做出路由选择', '选择');
INSERT INTO `tb_question` VALUES ('410', '83', '0185', '93', '010383', '410', '01', '1.84对于基带CSMA/CD而言，为了确保发送站点在传输时能检测到可能存在的冲突，数据帧的传输时延至少要等于信号传播时延的(    B  )\n  A. 1倍       B. 2倍     C. 4倍        D. 2.5倍', '选择');
INSERT INTO `tb_question` VALUES ('411', '84', '0186', '94', '010384', '411', '01', '1.85以下哪一个设置不是上互联网所必须的（ ）\nA、IP 地址  B、工作组  C、子网掩码  D、网关', '选择');
INSERT INTO `tb_question` VALUES ('412', '85', '0187', '95', '010385', '412', '01', '1.86 IP电话、电报和专线电话分别使用的数据交换技术是（ B ）\nA、电路交换技术、报文交换技术和分组交换技术\nB、分组交换技术、报文交换技术和电路交换技术\nC、报文交换技术、分组交换技术和电路交换技术\nD、电路交换技术、分组交换技术和报文交换技术', '选择');
INSERT INTO `tb_question` VALUES ('413', '86', '0188', '96', '010386', '413', '01', '1.87下列交换技术中，节点不采用“存储—转发”方式的是（ A ）。\nA、电路交换技术   B、报文交换技术\nC、虚电路交换技术 D、数据报交换技术', '选择');
INSERT INTO `tb_question` VALUES ('414', '87', '0189', '97', '010387', '414', '01', '1.88采用虚电路分组交换方式时，可以省去的阶段是（D）。纠错\nA、建立逻辑连接  B、结束本次连接\nC、传输数据      D、建立物理连接', '选择');
INSERT INTO `tb_question` VALUES ('415', '88', '0190', '98', '010388', '415', '01', '1.89下面关于域名的说法正确的是（D ）\nA、域名专指一个服务器的名字\nB、域名就是网址  C、域名可以自己任意取\nD、域名系统按地理域或机构域分层采用层次结构', '选择');
INSERT INTO `tb_question` VALUES ('416', '89', '0191', '99', '010389', '416', '01', '1.90因特网中完成域名地址和IP地址转换的是（B）\nA、POP   B、DNS   C、SLIP   D、Usenet', '选择');
INSERT INTO `tb_question` VALUES ('417', '90', '0192', '100', '010390', '417', '01', '1.91IPv6 将32位地址空间扩展到（ B ）。\nA、64 位   B、128 位   C、256 位   D、1024 位', '选择');
INSERT INTO `tb_question` VALUES ('418', '91', '0193', '101', '010391', '418', '01', '1.92双绞线由两根具有绝缘保护层的铜导线按一定密度互相绞在一起组成，这样可以（A ）。\nA、降低信号干扰的程度    B、降低成本\nC、提高传输速度          D、没有任何作用', '选择');
INSERT INTO `tb_question` VALUES ('419', '92', '0194', '102', '010392', '419', '01', '1.93在下列传输介质中，那种传输介质的抗电磁干扰性最好？ C\nA)双绞线  B)同轴电缆  C)光缆  D)无线介质', '选择');
INSERT INTO `tb_question` VALUES ('420', '93', '0195', '103', '010393', '420', '01', '1.94决定局域网特性的三个主要技术是（ A ），（ B ）和（ C ）。其中最为重要（ C ），它对网络特性起着十分重要的作用。\nA）拓扑结构           B）传输介质\nC）介质访问控制方法   D）链路距离', '选择');
INSERT INTO `tb_question` VALUES ('421', '94', '0196', '104', '010394', '421', '01', '1.95局域网常用的拓扑结构有（A），（C）和（D）。\n（A）星型（B）不规则型（C）总线型（D）环型', '选择');
INSERT INTO `tb_question` VALUES ('422', '95', '0197', '105', '010395', '422', '01', '1.96局域网互连主要有（A）和（D）两种形式。\nA）LAN-LAN   B）LAN-WAN\nC）WAN-WAN  D）LAN-WAN-LAN', '选择');
INSERT INTO `tb_question` VALUES ('423', '96', '0198', '106', '010396', '423', '01', '1.97常见的网络互连设备有（A），（B）和（C）。\nA）集线器  B）路由器  C）网桥  D）网关', '选择');
INSERT INTO `tb_question` VALUES ('424', '97', '0199', '107', '010397', '424', '01', '1.98决定使用哪条途径通过子网，应属于下列OSI 的哪一层处理？D\nA）物理层 B）数据链路层 C）传输层 D）网络层', '选择');
INSERT INTO `tb_question` VALUES ('425', '98', '0200', '108', '010398', '425', '01', '1.99将传输比特流划分为帧，应属于下列OSI 的哪一层处理？  B\nA）物理层 B）数据链路层 C）传输层 D）网络层', '选择');
INSERT INTO `tb_question` VALUES ('426', '99', '0201', '109', '010399', '426', '01', '1.100两端用户传输文件，应属于下列OSI 的哪一层处理？（D）\n（A）表示层（B）会话层（C）传输层（D）应用层', '选择');
INSERT INTO `tb_question` VALUES ('427', '100', '0202', '110', '010400', '427', '01', '1.101在OSI 模型中，一个层N 与它的上层（第N+1 层）的关系是什么？ A\nA)第N 层为第N+1 层提供服务。\nB)第N+1 层把从第N 层接收到的信息添一个报头。\nC）第N 层使用第N+1 层第通的服务。\nD）第N 层与第N+1 层相互没有影响。', '选择');
INSERT INTO `tb_question` VALUES ('428', '101', '0203', '111', '010401', '428', '01', '1.102两个不同的计算机类型能通信，需要（C）。\nA) 它们符合OSI 模型  \nB）它们都使用TCP/IP\nC）它们都是兼容的协议组\nD）它们一个是Macintosh，一个是Unix 工作站', '选择');
INSERT INTO `tb_question` VALUES ('429', '102', '0204', '112', '010402', '429', '01', '1.103OSI/RM 模型中，哪个层次用来在设备的进程间传递报文?  B\n（A）网络层（B）传输层（C）会话层（D）表示层', '选择');
INSERT INTO `tb_question` VALUES ('430', '103', '0205', '113', '010403', '430', '01', '1.104关于协议组，下列（C）、（D）叙述正确。\nA)一给定的协议组能在仅仅一种计算机类型上运行。\nB)每层为从协议组较高层接收的分组加报头。\nC)协议组是协议的层次集合。\nD)每层为下一个最高层提供服务。', '选择');
INSERT INTO `tb_question` VALUES ('431', '104', '0206', '114', '010404', '431', '01', '1.105下列语句（A）、（C）叙述正确。\nA)数据链路层处理设备到设备的通信。\nB)网络层处理高层进程间的通信\nC)传输层处理端结点间的通信\nD)上述所有的都对。', '选择');
INSERT INTO `tb_question` VALUES ('432', '105', '0207', '115', '010405', '432', '01', '1.106下列说法中哪些正确？C\n(1)虚电路与电路交换中的电路没有实质不同\n(2)在通信的两站间只能建立一条虚电路\n(3)虚电路也有连接建立、数据传输、连接释放三阶段\n(4)虚电路各个结点不需要为每个分组作路径选择判定\nA) (1),(2)  B) (2),(3)  C) (3),(4)  D) (1),(4)', '选择');
INSERT INTO `tb_question` VALUES ('433', '106', '0208', '116', '010406', '433', '01', '1.107下列有关计算机网络叙述错误的是_D_。\nA.利用Internet网可以使用远程的超级计算中心的计算机资源\nB.计算机网络是在通信协议控制下实现的计算机互联\nC.建立计算机网络的最主要目的是实现资源共享\nD.以接入的计算机多少可以将网络划分为广域网、城域网和局域网', '选择');
INSERT INTO `tb_question` VALUES ('434', '107', '0209', '117', '010407', '434', '01', '1.108TCP/IP协议是Internet中计算机之间通信所必须共同遵循的一种__B__。\nA.信息资源  B.通信规定  C.软件  D.硬件', '选择');
INSERT INTO `tb_question` VALUES ('435', '108', '0210', '118', '010408', '435', '01', '1.109下面__C__命令用于测试网络是否连通。\nA.telnet   B.nslookup  C.ping  D.ftp', '选择');
INSERT INTO `tb_question` VALUES ('436', '109', '0211', '119', '010409', '436', '01', '1.110在Internet中，用于文件传输的协议是_C__。\nA.HTML  B.SMTP  C.FTP  D.POP', '选择');
INSERT INTO `tb_question` VALUES ('437', '110', '0212', '120', '010410', '437', '01', '1.111下列说法错误的是__D__。\nA.电子邮件是Internet提供的一项最基本的服务\nB.电子邮件具有快速、高效、方便、价廉等特点\nC.通过电子邮件，可向世界上任何一个角落的网上用户发送信息\nD.可发送的多媒体信息只有文字和图像', '选择');
INSERT INTO `tb_question` VALUES ('438', '111', '0213', '121', '010411', '438', '01', '1.112在拓扑结构中，关于环型的叙述正确的是_C_。\nA环中的数据沿着环的两个方向绕环传输\nB环型拓扑中各结点首尾相连形成一个永不闭合的环\nC环型拓扑的抗故障性能好\nD网络中的任意一个结点或一条传输介质出现故障都不会导致整个网络的故障', '选择');
INSERT INTO `tb_question` VALUES ('439', '112', '0214', '122', '010412', '439', '01', '1.113系统可靠性最高的网络拓扑结构是__B_。\nA.总线型   B.网状型  C.星型   D.树型', '选择');
INSERT INTO `tb_question` VALUES ('440', '113', '0215', '123', '010413', '440', '01', '1.114下列关于广域网的叙述，错误的是__B__。\nA广域网能连接多个城市或国家并能提供远距离通信\nB广域网一般可以包含OSI参考模型的7个层次\nC大部分广域网都采用存储转发方式进行数据交换\nD广域网可以提供面向连接和无连接两种服务模式', '选择');
INSERT INTO `tb_question` VALUES ('441', '114', '0216', '124', '010414', '441', '01', '1.115广域网提供两种服务模式，对应于这两种服务模式，广域网的组网方式有_C__。\nA.虚电路方式和总线型方式\nB.总线型方式和星型方式\nC.虚电路方式和数据报方式\nD.数据报方式和总线型方式', '选择');
INSERT INTO `tb_question` VALUES ('442', '115', '0217', '125', '010415', '442', '01', '1.116Internet 是由__B__发展而来的。\nA．局域网 B．ARPANET  C．标准网 D．WAN', '选择');
INSERT INTO `tb_question` VALUES ('443', '116', '0218', '126', '010416', '443', '01', '1.117对于下列说法，错误的是___D___。\nA.TCP协议可以提供可靠的数据流传输服务\nB.TCP协议可以提供面向连接的数据流传输服务\nC.TCP协议可以提供全双工的数据流传输服务\nD.TCP协议可以提供面向非连接的数据流传输服务', '选择');
INSERT INTO `tb_question` VALUES ('444', '117', '0219', '127', '010417', '444', '01', '1.118以下关于TCP/IP协议的描述中，错误的是 A 。\nA.TCP/IP协议属于应用层\nB.TCP、UDP协议都要通过IP协议来发送、接收数据\nC.TCP协议提供可靠的面向连接服务\nD.UDP协议提供简单的无连接服务', '选择');
INSERT INTO `tb_question` VALUES ('445', '118', '0220', '128', '010418', '445', '01', '1.119下列关于IP地址的说法中错误的是_C_。\nA.一个IP地址只能标识网络中的唯一的一台计算机\nB.IP地址一般用点分十进制表示\nC.地址205.106.286.36是一个非法的IP地址\nD.同一个网络中不能有两台计算机的IP地址相同', '选择');
INSERT INTO `tb_question` VALUES ('446', '119', '0221', '129', '010419', '446', '01', '1.120一个IP地址包含网络地址与__C__。\nA.广播地址   B.多址地址   \nC.主机地址   D.子网掩码', '选择');
INSERT INTO `tb_question` VALUES ('447', '120', '0222', '130', '010420', '447', '01', '1.121在以下四个WWW网址中，哪一个网址不符合WWW网址书写规则__B__。\nA.www.163.com     B.www.nk.cn.edu\nC.www.863.org.cn   D.www.tj.net.jp', '选择');
INSERT INTO `tb_question` VALUES ('448', '121', '0223', '131', '010421', '448', '01', '1.122OSPF协议是   A     。\nA．域内路由协议    B．域间路由协议 \nC．无域路由协议  D．应用层协议', '选择');
INSERT INTO `tb_question` VALUES ('449', '122', '0224', '132', '010422', '449', '01', '1.123在虚电路服务中分组的顺序   A    。\nA．总是按发送顺序到达目的站   \nB. 总是与发送顺序相反到达目的站\nC. 到达目的站时可能不按发送顺序\nD. 到达顺序是任意的', '选择');
INSERT INTO `tb_question` VALUES ('450', '123', '0225', '133', '010423', '450', '01', '1.124下面属于路由选择协议的是  B   。\nA．TCP/IP B．RIP C．IPX/SPX D．AppleTalk', '选择');
INSERT INTO `tb_question` VALUES ('451', '124', '0226', '134', '010424', '451', '01', '1.125在OSI参考模型中能实现路由选择、拥塞控制与互联功能的层是  C  。\nA．传输层 B．应用层 C．网络层 D．物理层', '选择');
INSERT INTO `tb_question` VALUES ('452', '125', '0227', '135', '010425', '452', '01', '1.126协议是  D  之间进行通信的规则或约定。\nA．同一结点上下层  B．不同结点\nC.相邻实体          D．不同结点对等实体', '选择');
INSERT INTO `tb_question` VALUES ('453', '126', '0228', '136', '010426', '453', '01', '1.127电子邮件服务器之间相互传递邮件通常使用的协议是__B___。\nA)PPP    B)SMTP   C)FTP   D)EMAIL', '选择');
INSERT INTO `tb_question` VALUES ('454', '127', '0229', '137', '010427', '454', '01', '1.128下列哪种连接方式采用上、下行不对称的高速数据调制技术___C_.\nA) ISDN   B)Cable Modem   C) ADSL   D) UML', '选择');
INSERT INTO `tb_question` VALUES ('455', '128', '0230', '138', '010428', '455', '01', '1.129在TCP/IP协议簇中，__A__协议属于网络层的无连接协议。\nA．IP　　B．SMTP　　C．UDP　　D．TCP', '选择');
INSERT INTO `tb_question` VALUES ('456', '129', '0231', '139', '010429', '456', '01', '1.130在TCP/IP协议簇中，__C__属于自上而下的第二层。\nA．ICMP　　B．SNMP　C．UDP　　 D．IP', '选择');
INSERT INTO `tb_question` VALUES ('457', '130', '0232', '140', '010430', '457', '01', '1.131在B类网络中，可以分配的主机地址是多?__D__\nA．1022　　B．4094　　C．32766　　 D．65534 ', '选择');
INSERT INTO `tb_question` VALUES ('458', '131', '0233', '141', '010431', '458', '01', '1.132以下网络地址中属于私网地址的是__C__　　    \nA．172.15.22.1　　　B．128.168.22.1\nC．172.16.22.1　　　D．192.158.22.1 ', '选择');
INSERT INTO `tb_question` VALUES ('459', '132', '0234', '142', '010432', '459', '01', '1.133设有2条路由21.1.193.0/24和21.1.194.0/24，如果进行路由汇聚，覆盖这2条路由的地址是_C_。\nA．21.1.200.0/22　　　B．21.1.192.0/23\nC．21.1.192.0/21　　　D．21.1.224.0/20 ', '选择');
INSERT INTO `tb_question` VALUES ('460', '133', '0235', '143', '010433', '460', '01', '1.134下面关于IPv6协议优点的描述中，准确的是B\n1.135RARP协议用于__C__。\nA．根据IP地址查询对应的MAC地址\nB．IP协议运行中的差错控制\nC．把MAC地址转换成对应的IP地址\nD．根据交换的路由信息动态生成路由表 \nB．IPv6协议解决了IP地址短缺的问题\nC．IPv6协议支持通过卫星链路的Intemet连接\nD．IPv6协议支持光纤通信 ', '选择');
INSERT INTO `tb_question` VALUES ('461', '134', '0236', '144', '010434', '461', '01', '1.136下面关于ICMP协议的描述中，正确的是(C)。\nA．ICMP协议根据MAC地址查找对应的IP地址\nB．ICMP协议把公网的IP地址转换为私网的IP地址\nC．ICMP协议用于控制数据报传送中的差错情况\nD．ICMP协议集中管理网络中的IP地址分配 ', '选择');
INSERT INTO `tb_question` VALUES ('462', '135', '0237', '145', '010435', '462', '01', '1.137某公司的几个分部在市内的不同地点办公，各分部联网的最好解决方案是  D  。\nA．公司使用统一的网络地址块，各分部之间用以太网相连\nB．公司使用统一的网络地址块，各分部之间用网桥相连\nC．各分部分别申请一个网络地址块，用集线器相连\nD．把公司的网络地址块划分为几个子网，各分部之间用路由器相连', '选择');
INSERT INTO `tb_question` VALUES ('463', '136', '0238', '146', '010436', '463', '01', '1.138下面对三层交换机的描述中最准确的是_C_。\nA．使用X.25交换机\nB．用路由器代替交换机\nC．二层交换，三层转发\nD．由交换机识别MAC地址进行交换', '选择');
INSERT INTO `tb_question` VALUES ('464', '137', '0239', '147', '010437', '464', '01', '1.139在Windows操作系统中可以通过安装_A_组件创建FTP站点。\nA．IIS　　　B．IE　　　C．WWW　　 D．DNS', '选择');
INSERT INTO `tb_question` VALUES ('465', '138', '0240', '148', '010438', '465', '01', '1.140TCP/IP网络中常用的距离矢量路由协议是 D\nA. ARP  B. ICMP  C. OSPF  D. RIP', '选择');
INSERT INTO `tb_question` VALUES ('466', '139', '0241', '149', '010439', '466', '01', '1.141下面有关VLAN的说法正确的是  (A) 。\nA. 一个VLAN组成一个广播域 \nB. 一个VLAN是一个冲突域  \nC. 各个VLAN之间不能通信  \nD. VLAN之间必须通过服务器交换信息', '选择');
INSERT INTO `tb_question` VALUES ('467', '140', '0242', '150', '010440', '467', '01', '1.142在OSI层次体系结构中,实际的通信是在( A )实体间进行的 .\nA 物理层   B 数据链路层  C 网络层  D 传输层', '选择');
INSERT INTO `tb_question` VALUES ('468', '141', '0243', '151', '010441', '468', '01', '1.143下面关于CSMA/CD网络的叙述正确的是（A）\nA 任何一个节点的通信数据要通过整个网络，并且每—个节点都接收并检验该数据\nB 如果源节点知道目的地的IP和MAC地址的话，信号是直接送往目的地\nC —个节点的数据发往最近的路由器，路由器将数据直接发到目的地\nD 信号都是以广播方式发送的', '选择');
INSERT INTO `tb_question` VALUES ('469', '142', '0244', '152', '010442', '469', '01', '1.144关于路由器，下列说法中正确的是 （ C）。 \nA. 路由器处理的信息量比交换机少，因而转发速度比交换机快 \nB. 对于同一目标，路由器只提供延迟最小的最佳路由 \nC. 通常的路由器可以支持多种网络层协议，并提供不同协议之间的分组转换 \nD. 路由器不但能够根据逻辑地址进行转发，而且可以根据物理地址进行转发', '选择');
INSERT INTO `tb_question` VALUES ('470', '143', '0245', '153', '010443', '470', '01', '1.146下列有关虚电路服务的叙述中不正确的是【C】\nA.OSI中面向连接的网络服务就是虚电路服务\nB.SNA采用的是虚电路操作支持虚电路服务的方式\nC.以数据报方式操作的网络中不提供虚电路服务\nD.在ARPANET内部使用数据报操作方式，但可以向端系统提供数据报和虚电路两种服务', '选择');
INSERT INTO `tb_question` VALUES ('471', '144', '0246', '154', '010444', '471', '01', '1.147使用双绞线作为传输介质，适用于下列哪种类型的以太网( B)\nA．10Base-5        B．10/100Base-T \nC．10/100Base-F    D．10Base-2  ', '选择');
INSERT INTO `tb_question` VALUES ('472', '145', '0247', '155', '010445', '472', '01', '1.148用TCP／IP协议的网络在传输信息时，如果出了错误需要报告，采用的协议是( A ) \nA．ICMP   B．HTTP C．TCP    D．SMTP', '选择');
INSERT INTO `tb_question` VALUES ('473', '146', '0248', '156', '010446', '473', '01', '1.149采用半双工通信方式，数据传输的方向为( C ) \nA．可以在两个方向上同时传输 \nB．只能在一个方向上传输 \nC．可以在两个方向上传输，但不能同时进行\nD．以上均不对', '选择');
INSERT INTO `tb_question` VALUES ('474', '147', '0249', '157', '010447', '474', '01', '1.150采用全双工通信方式，数据传输的方向为(A )\nA．可以在两个方向上同时传输 \nB．只能在一个方向上传输 \nC．可以在两个方向上传输，但不能同时进行 \nD．以上均不对', '选择');
INSERT INTO `tb_question` VALUES ('475', '148', '0250', '158', '010448', '475', '01', '1.151以下各项中，不是IP数据报操作特点的是( C ) \nA．每个分组自身携带有足够的信息，它的传送是被单独处理的 \nB．在整个传送过程中，不需建立虚电路 \nC．使所有分组按顺序到达目的端系统 \nD．网络节点要为每个分组做出路由选择', '选择');
INSERT INTO `tb_question` VALUES ('476', '149', '0251', '159', '010449', '476', '01', '1.152对IP数据报分片的重组通常发生在（ B）上。\nA．源主机                 B．目的主机\nC．IP数据报经过的路由器  D．目的主机或路由器', '选择');
INSERT INTO `tb_question` VALUES ('477', '150', '0252', '160', '010450', '477', '01', '1.153下面接入方式中哪种传输速率最快（  E）。\nA．电话拨号    B．DDN专线\nC．ADSLD光纤同轴混合（HFC）\nE．光纤接入    F．无线接入', '选择');
INSERT INTO `tb_question` VALUES ('478', '151', '0253', '161', '010451', '478', '01', '1.154关于路由器，下列说法中错误的是   D  . \nA．路由器可以隔离子网，抑制广播风暴      　   \nB．路由器可以实现网络地址转换\nC．路由器可以提供可靠性不同的多条路由选择  　\nD．路由器只能实现点对点的传输', '选择');
INSERT INTO `tb_question` VALUES ('479', '152', '0254', '162', '010452', '479', '01', '1.155在HFC网络中，Cable Modem的作用是 B。\nA．用于调制解调和拨号上网    　         \nB．用于调制解调以及作为以太网接口\nC．用于连接电话线和用户终端计算机    　  \nD．连接ISDN接口和用户终端计算机', '选择');
INSERT INTO `tb_question` VALUES ('480', '153', '0255', '163', '010453', '480', '01', '1.156关于ARP表，以下描述中正确的是   B . \nA．提供常用目标地址的快捷方式来减少网络流量\nB．用于建立IP地址到MAC地址的映射\nC．用于在各个子网之间进行路由选择      　\nD．用于进行应用层信息的转换', '选择');
INSERT INTO `tb_question` VALUES ('481', '154', '0256', '164', '010454', '481', '01', '1.157当一个以太网中的一台源主机要发送数据给同一网络中的另一台目的主机时，以太帧头部的目的地址是          ，IP包头部的目的地址         。                                                 \n A．路由器的IP地址      B．路由器的MAC地址\n C．目的主机的MAC地址  D．目的主机的IP地址', '选择');
INSERT INTO `tb_question` VALUES ('482', '155', '0257', '165', '010455', '482', '01', '1.158下列关于IPv4地址的描述中错误是   D   \nA．IP地址的总长度为32位  \nB．每一个IP地址都由网络地址和主机地址组成 \nC．一个C类地址拥有8位主机地址，可给254台主机分配地址 \nD．A类地址拥有最多的网络数', '选择');
INSERT INTO `tb_question` VALUES ('483', '156', '0258', '166', '010456', '483', '01', '1.159通信信道的每一端可以是发送端，也可以是接受端，信息可由这一端传输到另一端，也可以从那一端传输到这一端，在同一时刻，信息可以每一端进行收发的通信方式为    C           \nA单工通信    B半双工  C全双工   D模拟', '选择');
INSERT INTO `tb_question` VALUES ('484', '157', '0259', '167', '010457', '484', '01', '1.160在缺省情况下，交换机的所有端口       ，连接在不同交换机上的，属于同一VLAN的数据帧必须通过       传输。\nA．处于直通状态　 B．属于同一VLAN　\nC．属于不同VLAN 　D．Trunk链路', '选择');
INSERT INTO `tb_question` VALUES ('485', '158', '0260', '168', '010458', '485', '01', '1.161以太网100BASE-FX标准规定的传输介质是D\nA．3类UTP　B．5类UTP　C．无线介质　D．光纤', '选择');
INSERT INTO `tb_question` VALUES ('486', '159', '0261', '169', '010459', '486', '01', '1.162路由器在两个网段之间转发数据包时，读取其中的   A  地址来确定下一跳的转发路径。                                                   \nA. 目标IP     B. MAC     C. 源IP    D. ARP', '选择');
INSERT INTO `tb_question` VALUES ('487', '160', '0262', '170', '010460', '487', '01', '1.163以下对IP地址分配中描述不正确的是（ B ）.\nA、网络ID不能全为1或全为0   \nB、同一网络上每台主机必须有不同的网络ID\nC、网络ID不能以127开头    \nD、同一网络上每台主机必须分配唯一的主机ID', '选择');
INSERT INTO `tb_question` VALUES ('488', '161', '0263', '171', '010461', '488', '01', '1.164对网际控制协议（ICMP）描述错误的是（ B ）.\nA、ICMP封装在IP数据报的数据部分  \nB、ICMP消息的传输是可靠的\nC、ICMP是IP协议的必需的一个部分  \nD、ICMP可用来进行拥塞控制', '选择');
INSERT INTO `tb_question` VALUES ('489', '162', '0264', '172', '010462', '489', '01', '1.165802.3以太网最大可传送的帧（数据）长度为_D_个8位组。\nA、64  B、32  C、256  D、1500', '选择');
INSERT INTO `tb_question` VALUES ('490', '163', '0265', '173', '010463', '490', '01', '1.166在IP协议中用来进行组播的IP地址是  C  .\nA. A类     B. C类      C. D类     D. E类', '选择');
INSERT INTO `tb_question` VALUES ('491', '164', '0266', '174', '010464', '491', '01', '1.167随着微型计算机的广泛应用，大量的微型计算机是通过局域网连入到广域网的，而局域网与广域网的互联一般是通过(_B_)设备实现的。\nA.Ethernet交换机B.路由器C.网桥D.电话交换机', '选择');
INSERT INTO `tb_question` VALUES ('492', '165', '0267', '175', '010465', '492', '01', '1.168IPv4版本的因特网总共有C个A类地址网络。\nA．65000  B．200万   C．126  D．128', '选择');
INSERT INTO `tb_question` VALUES ('493', '166', '0268', '176', '010466', '493', '01', '1.169在下列各项中，一个计算机网络的3个主要组成部分是__B__。\n1、若干数据库2、一个通信子网 3、一系列通信协议 \n4、若干主机  5、电话网   6、大量终端\nA.1、2、3  B.2、3、4  C.3、4、5  D.2、4、6', '选择');
INSERT INTO `tb_question` VALUES ('494', '167', '0269', '177', '010467', '494', '01', '1.170下面对应用层协议说法正确的有（B ）\nA.DNS 协议支持域名解析服务，其服务端口号为80。\nB.TELNET 协议支持远程登陆应用。\nC.电子邮件系统中，发送电子邮件和接收电子邮件均采用SMTP 协议。\nD.FTP 协议提供文件传输服务，并仅使用一个端口。', '选择');
INSERT INTO `tb_question` VALUES ('495', '168', '0270', '178', '010468', '495', '01', '1.171在TCP 协议中，建立连接时需要将（ ）字段中的（ ）标志位位置1。    D\nA.保留 ACK B.保留 SYN  C.偏移 ACK  D.控制 SYN', '选择');
INSERT INTO `tb_question` VALUES ('496', '169', '0271', '179', '010469', '496', '01', '1.172一台主机正在检测所收到的帧的校验和，这个动作发生在OSI模型的哪一层？\nA、物理层 B、数据链路层C、网络层 D、传输层', '选择');
INSERT INTO `tb_question` VALUES ('497', '170', '0272', '180', '010470', '497', '01', '1.173数据解封装的过程是   B  .\nA段—包—帧—流—数据  B流—帧—包—段—数据\nC数据—包—段—帧—流 D数据—段—包—帧—流', '选择');
INSERT INTO `tb_question` VALUES ('498', '171', '0273', '181', '010471', '498', '01', '1.174一台十六口交换机，每端口均为10/100M全双工自适应，则该交换机的总线带宽为   D  .\nA、10M  B、100M C、1.6G  D、3.2G', '选择');
INSERT INTO `tb_question` VALUES ('499', '172', '0274', '182', '010472', '499', '01', '1.174一台十六口交换机，每端口均为10/100M全双工自适应，则该交换机的总线带宽为   D  .\nA、10M  B、100M C、1.6G  D、3.2G', '选择');
INSERT INTO `tb_question` VALUES ('500', '173', '0275', '183', '010473', '500', '01', '1.176当路由器接收的IP报文中的目标网络不在路由表中时，将采取的策略是   A   .\nA、丢掉该报文\nB、将该报文以广播的形式从该路由器的所有端口发出\nC、将报文退还给上级设备\nD、向某个特定的路由器请求路由', '选择');
INSERT INTO `tb_question` VALUES ('501', '174', '0276', '184', '010474', '501', '01', '1.177收音机的信号传输属于   A   .\nA、单工  B、半双工  C、全双工', '选择');
INSERT INTO `tb_question` VALUES ('502', '175', '0277', '185', '010475', '502', '01', '1.178出于安全的考试，管理员希望阻止由外网进入的PING嗅探，那么管理员需要阻止哪一类协议？（D）\nA、TCP  B、UDP  C、IP D、ICMP', '选择');
INSERT INTO `tb_question` VALUES ('503', '176', '0278', '186', '010476', '503', '01', '1.179当数据在网络层时，称之为  B   .\nA、Segment  B、Packet C、Bit D、Frame', '选择');
INSERT INTO `tb_question` VALUES ('504', '177', '0279', '187', '010477', '504', '01', '1.180交换机收到一个帧，但该帧的目标地址在其MAC地址表中找不到对应，交换机将   C  .\nA、丢弃  B、退回  C、洪泛  D、转发给网关', '选择');
INSERT INTO `tb_question` VALUES ('505', '178', '0280', '188', '010478', '505', '01', '1.181以下有关以太网MAC地址说法正确的是  A .\nA、MAC地址全球唯一 B、MAC地址56位\nC、MAC地址中前八位十六进制数由IEEE统一分配，后八位十六制数由厂商自行分配\nD、Internet中每个设备都有MAC地址', '选择');
INSERT INTO `tb_question` VALUES ('506', '179', '0281', '189', '010479', '506', '01', '1.182下列地址中哪些是私有地址    C   .\nA、172.32.0.1      B、172.0.0.1\nC、172.16.0.255  D、172.15.255.255', '选择');
INSERT INTO `tb_question` VALUES ('507', '180', '0282', '190', '010480', '507', '02', '计算机网络的发展和演变可概括为   面向终端的计算机网络    .   计算机—计算机网络   和开放式标准化网络三个阶段。', '填空');
INSERT INTO `tb_question` VALUES ('508', '181', '0283', '191', '010481', '508', '02', '收发电子邮件，属于ISO/OSI RM中 ___ 应用 __层的功能。', '填空');
INSERT INTO `tb_question` VALUES ('509', '182', '0284', '192', '010482', '509', '02', '在TCP/IP层次模型中与OSI参考模型第四层相对应的主要协议有  TCP（传输控制协议） 和  UDP（用户数据报协议） ，其中后者提供无连接的不可靠传输服。', '填空');
INSERT INTO `tb_question` VALUES ('510', '183', '0285', '193', '010483', '510', '02', '常见的实用网络协议有TCP/IP、IPX/SPX和NetBEUI。', '填空');
INSERT INTO `tb_question` VALUES ('511', '184', '0286', '194', '010484', '511', '02', '计算机网络中常用的三种有线媒体是 同轴电缆. 双绞线  和 光纤。', '填空');
INSERT INTO `tb_question` VALUES ('512', '185', '0287', '195', '010485', '512', '02', '计算机网络系统由负责_信息传递__的通信子网和负责信息处理的__资源__子网组成', '填空');
INSERT INTO `tb_question` VALUES ('513', '186', '0288', '196', '010486', '513', '02', 'OSI模型有_物理层___._数据链路层___._网络层___. 运输层. 会话层. 表示层和应用层七个层次', '填空');
INSERT INTO `tb_question` VALUES ('514', '187', '0289', '197', '010487', '514', '02', '在局域网参考模型中，__ LLC __与媒体无关，_ MAC ___则依赖于物理媒体和拓扑结构', '填空');
INSERT INTO `tb_question` VALUES ('515', '188', '0290', '198', '010488', '515', '02', '国内最早的四大网络包括原邮电部的ChinaNet. 原电子部的ChinaGBN. 教育部的__ CERnet (或中国教育科研网)___和中科院的CSTnet。', '填空');
INSERT INTO `tb_question` VALUES ('516', '189', '0291', '199', '010489', '516', '02', '复盖一个国家，地区或几个洲的计算机网络称为  广域网，在同一建筑或复盖几公里内范围的网络称为       局域网   ，而介于两者之间的是城域网。', '填空');
INSERT INTO `tb_question` VALUES ('517', '190', '0292', '200', '010490', '517', '02', '现行解决“最后一公里”问题的接入技术有  综合业务数字网 、  高速数字接入设备  、  同轴电缆宽调制解调器  、 局域网  、  无线接入  。  ', '填空');
INSERT INTO `tb_question` VALUES ('518', '191', '0293', '201', '010491', '518', '02', 'OSI参考模型从高到低分别是  应用层、 表示层、 会话层 、传输层 、网络层、 数据链路层 和物理层。', '填空');
INSERT INTO `tb_question` VALUES ('519', '192', '0294', '202', '010492', '519', '02', '串行数据通信的方向性结构有三种，即单工、  半双工  和  全双工  。   ', '填空');
INSERT INTO `tb_question` VALUES ('520', '193', '0295', '203', '010493', '520', '02', '在 TCP/IP 层次模型的第三层 ( 网络层 ) 中包括的协议主要有 IP 、 ICMP 、 ARP  及  RARP  。', '填空');
INSERT INTO `tb_question` VALUES ('521', '194', '0296', '204', '010494', '521', '02', '最常用的两种多路复用技术为 _频分多路复用 FDM _和 _时分多路复用 TDM _ ，其中，前者是同一时间同时传送多路信号，而后者是将一条物理信道按时间分成若干个时间片轮流分配给多个信号使用。', '填空');
INSERT INTO `tb_question` VALUES ('522', '195', '0297', '205', '010495', '522', '02', '计算机网络系统由通信子网和___资源____子网组成。', '填空');
INSERT INTO `tb_question` VALUES ('523', '196', '0298', '206', '010496', '523', '02', '通信系统中，称调制前的电信号为____基带____信号，调制后的信号为调制信号。', '填空');
INSERT INTO `tb_question` VALUES ('524', '197', '0299', '207', '010497', '524', '02', 'ISP是掌握Internet____接口____的机构。', '填空');
INSERT INTO `tb_question` VALUES ('525', '198', '0300', '208', '010498', '525', '02', '.数据传输有两种同步的方法：同步传输和异步传输。其中异步传输采用的是____群___同步技术。', '填空');
INSERT INTO `tb_question` VALUES ('526', '199', '0301', '209', '010499', '526', '02', '常用的IP地址有A、B、C三类，128.11.3.31是一个__ B __类IP地址，其网络标识netID.为__128.11___，主机标识hostID为___3.31___。', '填空');
INSERT INTO `tb_question` VALUES ('527', '200', '0302', '210', '010500', '527', '02', '有两种基本的差错控制编码，即检错码和____纠错码____，在计算机网络和数据通信中广泛使用的一种检错码为___循环冗余码（或CRC码）____。', '填空');
INSERT INTO `tb_question` VALUES ('528', '201', '0303', '211', '010501', '528', '02', '按照IPV4标准,IP地址205.3.127.13属于___C____ 类地址。', '填空');
INSERT INTO `tb_question` VALUES ('529', '202', '0304', '212', '010502', '529', '02', 'IP地址 11011011，00001101，00000101，11101ll0用点分10进制表示可写为_219.13.5.238__ 。', '填空');
INSERT INTO `tb_question` VALUES ('530', '203', '0305', '213', '010503', '530', '02', '计算机网络是发展经历了（面向终端的计算机通信系统）、（计算机-计算机通信网络）和（计算机网络）三个阶段。', '填空');
INSERT INTO `tb_question` VALUES ('531', '204', '0306', '214', '010504', '531', '02', '计算机网络的主要功能包括（数据交换和通信）、（资源共享）、（提高系统的可靠性）、（分布式网络处理和均衡负荷）。', '填空');
INSERT INTO `tb_question` VALUES ('532', '205', '0307', '215', '010505', '532', '02', '计算机网络在逻辑功能上可以划分为（资源）子网和（通信）子网两个部份。', '填空');
INSERT INTO `tb_question` VALUES ('533', '206', '0308', '216', '010506', '533', '02', '资源子网主要包括（主机）、（终端控制器和终端）、（计算机外设）等。', '填空');
INSERT INTO `tb_question` VALUES ('534', '207', '0309', '217', '010507', '534', '02', '通信子网主要包括（网络结点）、（通信链路）、（信号变换设备）等', '填空');
INSERT INTO `tb_question` VALUES ('535', '208', '0310', '218', '010508', '535', '02', '计算机网络中的主要拓扑结构有：（星形）、（环形）、（树形）、（线形）、（网型）等', '填空');
INSERT INTO `tb_question` VALUES ('536', '209', '0311', '219', '010509', '536', '02', '按照网络的分布地理范围，可以将计算机网络分为（局域网）、（城域网）和（广域网）三种。', '填空');
INSERT INTO `tb_question` VALUES ('537', '210', '0312', '220', '010510', '537', '02', '计算机内传输的信号是（数字信号），而公用电话系统的传输系统只能传输（模拟信号）。', '填空');
INSERT INTO `tb_question` VALUES ('538', '211', '0313', '221', '010511', '538', '02', '在计算机通过线路控制器与远程终端直接相连的系统中，计算机既要进行（数据处理），又要承担（各终端间的通信），主计算机负荷加重，实际工作效率下降，而且分散的终端都要单独战用一条通信线路，通信线路利用率低，费用高。', '填空');
INSERT INTO `tb_question` VALUES ('539', '212', '0314', '222', '010512', '539', '02', '在系统的主计算机前增设前端处理机FEP或通信控制器CCP，这些设备用来专门负责（通信工作）。', '填空');
INSERT INTO `tb_question` VALUES ('540', '213', '0315', '223', '010513', '540', '02', '从本质上讲，在联机多用户系统中，不论主机上连接多少台计算机终端或计算机，主计算机与其连接的计算机或计算机之间之间都是（支配与被支配）的关系。', '填空');
INSERT INTO `tb_question` VALUES ('541', '214', '0316', '224', '010514', '541', '02', '1993年底，我国提出建设网络“三金”工程分别是：（金桥工程）、（金关工程）、（金卡工程）。', '填空');
INSERT INTO `tb_question` VALUES ('542', '215', '0317', '225', '010515', '542', '02', '在数据通信系统中，信源和信宿是各种类型计算机和终，它被称为（数据终端设备）、简称（DTE）。一个DTE通常既是信源又是信宿。由于在数据通信系统中以DTE发出和接收的都是（数据），所以，把DTE之间的通信称为（数据电路）。', '填空');
INSERT INTO `tb_question` VALUES ('543', '216', '0318', '226', '010516', '543', '02', '数据从发出端出发到数据被接收端接收的整个过程称为（通信过程），通信过程中每次通信包含（传输数据）和（通信控制 ）两个内容。', '填空');
INSERT INTO `tb_question` VALUES ('544', '217', '0319', '227', '010517', '544', '02', '通信系统中，称调制前的电信号为（基带信号），调制后的信号叫（调制信号）。', '填空');
INSERT INTO `tb_question` VALUES ('545', '218', '0320', '228', '010518', '545', '02', '模拟通信中通过信道的信号频谱通常比较（窄），因此信道的利用率（高），但干扰能力（差）。', '填空');
INSERT INTO `tb_question` VALUES ('546', '219', '0321', '229', '010519', '546', '02', '一般网络中的各个结点通过通信线路相互连接的方式大致有以下几种：（点-点连接）、（分支式连接）、（集线式连接）。', '填空');
INSERT INTO `tb_question` VALUES ('547', '220', '0322', '230', '010520', '547', '02', '在数据通信中（串行通信），通信线路的通信方式有三种基本形式，即（单工通信）、（半双工通信）和（全双工通信）。', '填空');
INSERT INTO `tb_question` VALUES ('548', '221', '0323', '231', '010521', '548', '02', '数据通信的主要技术指标包括：（传输速率）、（信道带宽）、（信道容量）、（出错率）、（延迟）以及（吞吐量）。', '填空');
INSERT INTO `tb_question` VALUES ('549', '222', '0324', '232', '010522', '549', '02', '将数字信号调制为模拟信号有三种方式，即（调幅）、（调频）、（调相）。', '填空');
INSERT INTO `tb_question` VALUES ('550', '223', '0325', '233', '010523', '550', '02', '宽带通常是指通过给定的通信线路发送的（数据量）。从技术的角度年，宽带是通信信道的宽度，即为传输信道的（最高频率与最低频率）之差，单位为赫兹（HZ）。', '填空');
INSERT INTO `tb_question` VALUES ('551', '224', '0326', '234', '010524', '551', '02', '二进制数据编码技术中的三种主要编码方案是：（非归零编码）、（曼彻斯特编码）和（差分曼彻斯特编码）。', '填空');
INSERT INTO `tb_question` VALUES ('552', '225', '0327', '235', '010525', '552', '02', 'PCM编码过程为（采样）、（量化）和（编码）。', '填空');
INSERT INTO `tb_question` VALUES ('553', '226', '0328', '236', '010526', '553', '02', '觉的数据传输方式有（异步传输）和（同步传输）。两者都是为解决数据传输过程中同步问题的相关技术，其中（同步传输）方式的效率高，速度快。', '填空');
INSERT INTO `tb_question` VALUES ('554', '227', '0329', '237', '010527', '554', '02', '多路复用技术又分为（频分多路复用）和（时分多路复用）两种。', '填空');
INSERT INTO `tb_question` VALUES ('555', '228', '0330', '238', '010528', '555', '02', '时分多路复用技术又分为（同步时分多路复用）和（统计时分多路复用），其中（统计时分多路复用）技术的效率高。', '填空');
INSERT INTO `tb_question` VALUES ('556', '229', '0331', '239', '010529', '556', '02', '交换是网络实现（数据传输）的一种手段。实现数据交换的三种技术是（线路交换），（报文交换）和（分组交换）。', '填空');
INSERT INTO `tb_question` VALUES ('557', '230', '0332', '240', '010530', '557', '02', '线路交换是一种直接交换方式，是多个输入线和多个输出线之间直接形成传输信息的（物理链路），线路交换分（建立线路）、（传输数据）和（拆除线路）三个阶段。', '填空');
INSERT INTO `tb_question` VALUES ('558', '231', '0333', '241', '010531', '558', '02', '报文交换方式中，（报文）是交换的单位，主要包括报文的正文信息，指明发和收节点的地址以及各种控制信息。由于报文一般者比较长，所以，该方式要求网络上每个结点包括转接中心者要有较大的（存储容量），以备暂存报文。报文传输要等目的线路有（空闲）时转发，所以，（延时性强）。', '填空');
INSERT INTO `tb_question` VALUES ('559', '232', '0334', '242', '010532', '559', '02', '报文分组交换方式是把长的报文分成若干个（较短）的报文组，（报文分组）是交换单位。它与报文交换方式不同的是，交换要包括（分组编号），各组报文可按不同的路径进行传输，不各组报文都有到达目的节点后，目的节点按报文分组编号重组报文。', '填空');
INSERT INTO `tb_question` VALUES ('560', '233', '0335', '243', '010533', '560', '02', '分组交换也存在一些缺点，如：分组交换在各节点存储转发时因排队而造成一定的（延时），由于分组数据中必须携带一些控制信息而产生一定的（额外开销），分组交换网的（管理）和（控制）比较复杂。', '填空');
INSERT INTO `tb_question` VALUES ('561', '234', '0336', '244', '010534', '561', '02', '分组交换的主要任务就是负责系统中分组数据的（存储）、（转发）、和（选择合适的分组传输路径）。', '填空');
INSERT INTO `tb_question` VALUES ('562', '235', '0337', '245', '010535', '562', '02', '在计算机网络中目前常用的传输媒体有（双绞线）、（同轴电缆）、（光导纤维电缆）、（无线电传输媒体）等。', '填空');
INSERT INTO `tb_question` VALUES ('563', '236', '0338', '246', '010536', '563', '02', '调制解调器是同时具有调制和解调两种功能的设备，它是一种（信号交换）设备。', '填空');
INSERT INTO `tb_question` VALUES ('564', '237', '0339', '247', '010537', '564', '02', '双绞线抗干扰作用（较短）。双绞线可以用于（模拟）或（数字）传输，传输信号时，双绞线可以在几公里之内不用对信号进行放大。', '填空');
INSERT INTO `tb_question` VALUES ('565', '238', '0340', '248', '010538', '565', '02', '基带同轴电缆是指（50）Ω的同轴电缆。它主要用于（数字）传输系统。基带同轴电缆的抗干扰性能优于（双绞线），它被广泛用于（局域网）。', '填空');
INSERT INTO `tb_question` VALUES ('566', '239', '0341', '249', '010539', '566', '02', '差错控制技术常采用冗余编码方案，常用的两种校验码是（奇偶校验）和（循环冗余码校验）。', '填空');
INSERT INTO `tb_question` VALUES ('567', '240', '0342', '250', '010540', '567', '02', '计算机网络系统是非常复杂的系统，计算机之间相互通信涉及到许多复杂的技术问题，为实现计算机网络通信，实现网络资源共享，计算机网络采用的是对解决复杂问题十分有效的（分层解决问题）的方法。', '填空');
INSERT INTO `tb_question` VALUES ('568', '241', '0343', '251', '010541', '568', '02', '协议就是为实现网络中的数据交换而建立的（规则）或（标准）。', '填空');
INSERT INTO `tb_question` VALUES ('569', '242', '0344', '252', '010542', '569', '02', '一般来说，协议由（语义）、语法和（交换规则）三部份组成。', '填空');
INSERT INTO `tb_question` VALUES ('570', '243', '0345', '253', '010543', '570', '02', '物理层并不是指连接计算机的具体的物理（设备），或具体的（传输媒体），而是指在物理媒体之上的为上一层（数据链路层）提供一个传输原始比特流的物理（连接）。', '填空');
INSERT INTO `tb_question` VALUES ('571', '244', '0346', '254', '010544', '571', '02', '物理层协议是为了把信号一方经过（物理媒体）传到另一方，物理层所关心的是把通信双方连接起来，为数据链路层实现（无差错）的数据传输创造环境。物理层不负责（检错）和（纠错）服务。', '填空');
INSERT INTO `tb_question` VALUES ('572', '245', '0347', '255', '010545', '572', '02', 'ISO组织提出的物理层四个技术特性是（机械特性）、（电气特性）、（功能特性）和（规程特性）。', '填空');
INSERT INTO `tb_question` VALUES ('573', '246', '0348', '256', '010546', '573', '02', '数据链路层的功能包括（链路的建立与释放）、（以帧为单位传送接收数据）、（差错控制功能）、（流量控制功能）。', '填空');
INSERT INTO `tb_question` VALUES ('574', '247', '0349', '257', '010547', '574', '02', '数据链路层向高层提供的服务可分为三种（无应答无连接服务）、（有应答无连接服务）、（面向连接服务）。', '填空');
INSERT INTO `tb_question` VALUES ('575', '248', '0350', '258', '010548', '575', '02', '数据链路层协议有（异步终端协议）、（同步的面向字符协议）、（同步的面向位协议），现在最常用的是（同步的面向位协议）。', '填空');
INSERT INTO `tb_question` VALUES ('576', '249', '0351', '259', '010549', '576', '02', '网络层是（通信子网）的最高层，它在（数据链路层）提供服务的基础上，向（资源）子网提供服务。', '填空');
INSERT INTO `tb_question` VALUES ('577', '250', '0352', '260', '010550', '577', '02', '网络层向传输层提供的服务包括（网络地址）、（网络连接）及其服务。', '填空');
INSERT INTO `tb_question` VALUES ('578', '251', '0353', '261', '010551', '578', '02', '网络层的功能包括（路由选择和中继功能），对数据传输过程实施（流量控制）、（差错控制）、（顺序控制）、（多路复用）以及对非正常发问的恢复处理。', '填空');
INSERT INTO `tb_question` VALUES ('579', '252', '0354', '262', '010552', '579', '02', '虚电路服务和数据报服务是（网络层）向（传输层）提供的服务，其中虚电路又分为（永久虚电路）和（呼叫虚电路）两大类。', '填空');
INSERT INTO `tb_question` VALUES ('580', '253', '0355', '263', '010553', '580', '02', 'X.25协议是（CCITT）组织推出的一个协议建议，分为三个协议层，即（物理层），（链路层）和（分组层）。', '填空');
INSERT INTO `tb_question` VALUES ('581', '254', '0356', '264', '010554', '581', '02', '传输层是（通信）子网与（资源）子网间的桥梁，其作用就是在网络层的基础上完成（端对端）的（差错控制）和（流量控制），实现两个终端系统间传送的分组无差错、无丢失、无重复、分组顺序无误。', '填空');
INSERT INTO `tb_question` VALUES ('582', '255', '0357', '265', '010555', '582', '02', '传输层以上各层协议统称为高层协议，它们主要考虑的问题是（主机与主机）之间的协议问题。', '填空');
INSERT INTO `tb_question` VALUES ('583', '256', '0358', '266', '010556', '583', '02', 'TCP/IP协议成功地（不同网络）之间难以互联的问题，实现了异网互联通信。', '填空');
INSERT INTO `tb_question` VALUES ('584', '257', '0359', '267', '010557', '584', '02', '事实上，局域网（LAN）是在（广域网）的基础上发展起来的。', '填空');
INSERT INTO `tb_question` VALUES ('585', '258', '0360', '268', '010558', '585', '02', '局域网的层次结构中，通信子网只有相当于OSI/RM中的下三层中的（物理层）与（数据链路层），而且高层功能一般由（网络操作系统）实现。', '填空');
INSERT INTO `tb_question` VALUES ('586', '259', '0361', '269', '010559', '586', '02', '局域网中物理层的信号编码采用的是（曼彻期特编码）。', '填空');
INSERT INTO `tb_question` VALUES ('587', '260', '0362', '270', '010560', '587', '02', '局域网中数据链路层又分为（逻辑链路控制）子层与（媒体访问控制子层）子层，其中（LLC）子层与硬件无关。', '填空');
INSERT INTO `tb_question` VALUES ('588', '261', '0363', '271', '010561', '588', '02', '载体侦听多路访问技术，是为了减少（碰撞），它是在源结点发送报文之前，侦听信道是否（忙（有冲突）），如果侦听到信道上有信号，则（推迟）发送报文。', '填空');
INSERT INTO `tb_question` VALUES ('589', '262', '0364', '272', '010562', '589', '02', 'CSMA/CD技术包含（载体侦听多路访问（CSMA））和（冲突检测（CD））两个方面的内容。', '填空');
INSERT INTO `tb_question` VALUES ('590', '263', '0365', '273', '010563', '590', '02', '在网络环境中，工作站是网络的（前端窗口），用户通过工作站来访问网络的（共享资源）。', '填空');
INSERT INTO `tb_question` VALUES ('591', '264', '0366', '274', '010564', '591', '02', '对局域网来说网络服务器是网络控制的（核心），一个局域网至少需有一个服务器，特别是一个局域网至少配备一个（文件服务器），没有服务器控制的通信局域，则为（对等网）。', '填空');
INSERT INTO `tb_question` VALUES ('592', '265', '0367', '275', '010565', '592', '02', '在局域网中，从功能的角度上来说，网卡起着（通信控制处理机）的作用，工作站或服务器连接到网络上，实现资源共享和相互通信都是通过（网卡）实现的。', '填空');
INSERT INTO `tb_question` VALUES ('593', '266', '0368', '276', '010566', '593', '02', '10BASE5 Ethernet表示使用粗同轴电缆的以太网络，其中“10”代表（传输速率为10M），“BASE”代表（基带传输），“5”代表（最大传输距离为500M）。', '填空');
INSERT INTO `tb_question` VALUES ('594', '267', '0369', '277', '010567', '594', '02', '令牌访问技术可用于（环形）和（总线型）两种拓扑结构网，这种访问方式在环形和总线形网中建立起来的（“环”）是一种（逻辑环）。', '填空');
INSERT INTO `tb_question` VALUES ('595', '268', '0370', '278', '010568', '595', '02', 'FDDI是一种（高速令牌环）网，是1982年ANSI组织X3T9.5委员会制订的（高速环形局域网）标准，该标准和IEEE802.5十分相似，以（ 光纤）作为传输媒体。', '填空');
INSERT INTO `tb_question` VALUES ('596', '269', '0371', '279', '010569', '596', '02', '快速以太网是指速度在（100Mbps）以上的以太网，采用的是（IEEE802.3μ）标准。', '填空');
INSERT INTO `tb_question` VALUES ('597', '270', '0372', '280', '010570', '597', '02', '千兆以太网标准是现行（IEEE802.3）标准的扩展，经过修改的MAC子层仍然使用（CSMA/CD）协议，支持（全双工）和（半双工）通信。', '填空');
INSERT INTO `tb_question` VALUES ('598', '271', '0373', '281', '010571', '598', '02', '网络互联的目的是实现更广泛的（资源共享）。', '填空');
INSERT INTO `tb_question` VALUES ('599', '272', '0374', '282', '010572', '599', '02', '目前用于网络互连的设备主要有（中继器）、（集线器）、（网桥）、（路由器）等。', '填空');
INSERT INTO `tb_question` VALUES ('600', '273', '0375', '283', '010573', '600', '02', '中继器是运行在OSI模型的（物理）层上的。它扩展了网络传输的（长度），是最简单的网络互连产品。', '填空');
INSERT INTO `tb_question` VALUES ('601', '274', '0376', '284', '010574', '601', '02', '网桥也称桥接器，它是（数据链路）层上局域网之间的互连设备。网桥同中继器不同，网桥处理的是一个完整的（帧），并使用和计算机相同的（接口）设备。', '填空');
INSERT INTO `tb_question` VALUES ('602', '275', '0377', '285', '010575', '602', '02', 'IP地址是INTERNET中识别主机的唯一标识。为了便于记忆，在INTERNET中报IP地址分成（4）组，每组（8）位，组与组之间用（.）分隔开。', '填空');
INSERT INTO `tb_question` VALUES ('603', '276', '0378', '286', '010576', '603', '02', 'IP地址分（网络号）和（主机号）两个部分。', '填空');
INSERT INTO `tb_question` VALUES ('604', '277', '0379', '287', '010577', '604', '02', '互连网中，域名是对IP地址的命名，它采用（ 层次）结构，通常最高域名为（国家名）。如CN代表（中国）；次高域名常用于标识行业，如COM代表（商业），EDU代表（教育）。', '填空');
INSERT INTO `tb_question` VALUES ('605', '278', '0380', '288', '010578', '605', '02', 'IP地址协议作网间网中（网络）层协议，提供无连接的数据报传输机制，IP数据报也分为（报头）和（数据区）两个部分。', '填空');
INSERT INTO `tb_question` VALUES ('606', '279', '0381', '289', '010579', '606', '02', 'Internet网所采用的协议是（TCP/IP），其前身是（ARPANET）。', '填空');
INSERT INTO `tb_question` VALUES ('607', '280', '0382', '290', '010580', '607', '02', 'Internet的管理分为（技术管理）和（运行管理）两大部分。', '填空');
INSERT INTO `tb_question` VALUES ('608', '281', '0383', '291', '010581', '608', '02', 'Internet的应用分为两大类，即（通信）、（使用网络资源）。', '填空');
INSERT INTO `tb_question` VALUES ('609', '282', '0384', '292', '010582', '609', '02', 'Internet广泛使用的电子邮件传送协议是（SMTP）。', '填空');
INSERT INTO `tb_question` VALUES ('610', '283', '0385', '293', '010583', '610', '02', '应用层是向网络的使用者提供一个有效和方便的（网络应用环境）。', '填空');
INSERT INTO `tb_question` VALUES ('611', '284', '0386', '294', '010584', '611', '02', '电子邮件的传递都是要通过（邮件网关）来完成的。', '填空');
INSERT INTO `tb_question` VALUES ('612', '285', '0387', '295', '010585', '612', '02', '局域网使用的三种典型拓朴结构是（星型 ）、（环形 ）和（总线型 ）。', '填空');
INSERT INTO `tb_question` VALUES ('613', '286', '0388', '296', '010586', '613', '02', '一般的BBS站点都提供两种浏览方式：WWW和   Telnet 。', '填空');
INSERT INTO `tb_question` VALUES ('614', '287', '0389', '297', '010587', '614', '02', '网络协议的三个要素是___语义____、___语法___与____时序_____。', '填空');
INSERT INTO `tb_question` VALUES ('615', '288', '0390', '298', '010588', '615', '02', '在数据链路层，数据的传送单位是（  帧 ）。', '填空');
INSERT INTO `tb_question` VALUES ('616', '289', '0391', '299', '010589', '616', '02', 'Internet 中使用得最广泛的数据链路层协议是(SLIP)协议和(PPP)协议。', '填空');
INSERT INTO `tb_question` VALUES ('617', '290', '0392', '300', '010590', '617', '02', '定义TCP/IP 标准的文档被称为(RFC)。', '填空');
INSERT INTO `tb_question` VALUES ('618', '291', '0393', '301', '010591', '618', '02', ' (TELNET)是一个简单的远程终端协议。', '填空');
INSERT INTO `tb_question` VALUES ('619', '292', '0394', '302', '010592', '619', '02', '根据IP头部的结构，一个IP分组（包括头部）最大可以有   65535（即216-1）  字节。', '填空');
INSERT INTO `tb_question` VALUES ('620', '293', '0395', '303', '010593', '620', '02', 'ICMP通常被认为是  网络   层的协议。', '填空');
INSERT INTO `tb_question` VALUES ('621', '294', '0396', '304', '010594', '621', '02', '在OSI环境中发送方的应用进程依次从应用层逐层传至物理层，其中传输层的数据传输单元称为         ，网络层的数据传输单元称为         ，数据链路层的数据传输单元称为         ，物理层的数据传输单元称为        。', '填空');
INSERT INTO `tb_question` VALUES ('622', '295', '0397', '305', '010595', '622', '02', '数据链路层在局域网参考模型中被分成：_逻辑链路控制（LLC）子层与_媒体接入控制（MAC）子层。', '填空');
INSERT INTO `tb_question` VALUES ('623', '296', '0398', '306', '010596', '623', '02', 'WWW采用的是  客户机/服务器__的工作模式。', '填空');
INSERT INTO `tb_question` VALUES ('624', '297', '0399', '307', '010597', '624', '02', '［解析］WWW采用的客户机/服务器的工作模式。具体的工作流程如下：（1）在客户端，建立连接，用户使用浏览器向服务器发送浏览信息请求。（2）服务器接收到请求，并向浏览器返回请求的信息。（3）关闭连接。', '填空');
INSERT INTO `tb_question` VALUES ('625', '298', '0400', '308', '010598', '625', '02', '一个IP数据报由一个头部和_数据__部分构成。', '填空');
INSERT INTO `tb_question` VALUES ('626', '299', '0401', '309', '010599', '626', '02', '信号一般有模拟信号和数字信号两种表示方式。其中数字信号是一种离散的信号，而模拟信号是一种连续变化的信号。', '填空');
INSERT INTO `tb_question` VALUES ('627', '300', '0402', '310', '010600', '627', '02', '在同一个系统内，相邻层之间交换信息的连接点称之为接口，而低层模块向高层提供功能性的支持称之为服务。', '填空');
INSERT INTO `tb_question` VALUES ('628', '301', '0403', '311', '010601', '628', '02', '信道复用技术主要有频分多路复用 、时分多路复用 、波分多路复用 和码分多路复用四类。', '填空');
INSERT INTO `tb_question` VALUES ('629', '302', '0404', '312', '010602', '629', '02', '在TCP/IP层次模型的第三层网络层中包括的协议主要有IP、ICMP、ARP及 RARP。', '填空');
INSERT INTO `tb_question` VALUES ('630', '303', '0405', '313', '010603', '630', '02', '计算机网络采用分组交换技术，而传统电话网络则采用电路交换技术。', '填空');
INSERT INTO `tb_question` VALUES ('631', '304', '0406', '314', '010604', '631', '02', '在计算机网络中数据的交换按交换方式来分类，可以分为电路交换、报文交换和报文分组交换三种。', '填空');
INSERT INTO `tb_question` VALUES ('632', '305', '0407', '315', '010605', '632', '02', '802.3以太网最小传送的帧长度为   64  个8位bit。', '填空');
INSERT INTO `tb_question` VALUES ('633', '306', '0408', '316', '010606', '633', '03', '网络域名地址便于用户记忆，通俗易懂，可以采用英文也可以用中文名称命名。（R）', '判断');
INSERT INTO `tb_question` VALUES ('634', '307', '0409', '317', '010607', '634', '03', 'RIP（Routing Information Protocol）是一种路由协议。（ R ）', '判断');
INSERT INTO `tb_question` VALUES ('635', '308', '0410', '318', '010608', '635', '03', '传输控制协议（TCP）属于传输层协议，而用户数据报协议（UDP）属于网络层协议。（E）', '判断');
INSERT INTO `tb_question` VALUES ('636', '309', '0411', '319', '010609', '636', '03', '网络中机器的标准名称包括域名和主机名，采取多段表示方法，各段间用圆点分开。 (R )', '判断');
INSERT INTO `tb_question` VALUES ('637', '310', '0412', '320', '010610', '637', '03', '网络域名地址一般都通俗易懂，大多采用英文名称的缩写来命名。(R )', '判断');
INSERT INTO `tb_question` VALUES ('638', '311', '0413', '321', '010611', '638', '03', 'ISO划分网络层次的基本原则是：不同节点具有不同的层次，不同节点的相同层次有相同的功能。 (R)', '判断');
INSERT INTO `tb_question` VALUES ('639', '312', '0414', '322', '010612', '639', '03', '目前使用的广域网基本都采用星型拓扑结构。( E)', '判断');
INSERT INTO `tb_question` VALUES ('640', '313', '0415', '323', '010613', '640', '03', '在TCP/IP 体系中，ARP 属于网络层协议。（R）', '判断');
INSERT INTO `tb_question` VALUES ('641', '314', '0416', '324', '010614', '641', '03', 'PPP (Point-to-Point Protocol，点到点的协议)是一种在同步或异步线路上对数据包进行封装的数据链路协议，早期的家庭拨号上网主要采用SLIP 协议，而现在更多的是用PPP 协议。（R）', '判断');
INSERT INTO `tb_question` VALUES ('642', '315', '0417', '325', '010615', '642', '03', 'IP层是TCP/IP实现网络互连的关键，但IP层不提供可靠性保障，所以TCP/IP网络中没有可靠性机制。（×）', '判断');
INSERT INTO `tb_question` VALUES ('643', '316', '0418', '326', '010616', '643', '03', 'TCP/IP可以用于同一主机上不同进程之间的通信。 （√）', '判断');
INSERT INTO `tb_question` VALUES ('644', '317', '0419', '327', '010617', '644', '03', 'ICMP协议是IP协议的一部分。（T）', '判断');
INSERT INTO `tb_question` VALUES ('645', '318', '0420', '328', '010618', '645', '03', '波分多路复用WDM就相当于TDM在光纤介质上的应用。（F）', '判断');
INSERT INTO `tb_question` VALUES ('646', '319', '0421', '329', '010619', '646', '03', '在因特网的层次体系结构中，网络层的作用是在收发双方主机中的应用进程之间传输数据。（F）', '判断');
INSERT INTO `tb_question` VALUES ('647', '320', '0422', '330', '010620', '647', '03', '正确1：在因特网的层次体系结构中，运输层的作用是在收发双方主机中的应用进程之间传输数据。', '判断');
INSERT INTO `tb_question` VALUES ('648', '321', '0423', '331', '010621', '648', '03', ' 正确2：在因特网的层次体系结构中，网络层的作用是在收发双方主机中之间传输数据。', '判断');
INSERT INTO `tb_question` VALUES ('649', '322', '0424', '332', '010622', '649', '03', '通过引入CRC校验以及确认和重传机制，使得网络可实现可靠的数据传输。（F）', '判断');
INSERT INTO `tb_question` VALUES ('650', '323', '0425', '333', '010623', '650', '03', '正确：通过引入CRC校验以及确认和重传机制，网络不一定能够实现可靠的数据传输。', '判断');
INSERT INTO `tb_question` VALUES ('651', '324', '0426', '334', '010624', '651', '03', '由于TCP为用户提供的是可靠的、面向连接的服务，因此该协议对于一些实时应用，如IP电话、视频会议等比较适合。（F）', '判断');
INSERT INTO `tb_question` VALUES ('652', '325', '0427', '335', '010625', '652', '03', '正确：由于TCP为用户提供的是可靠的、面向连接的服务，因此该协议对于一些实时应用，如IP电话、视频会议等不适合。', '判断');
INSERT INTO `tb_question` VALUES ('653', '326', '0428', '336', '010626', '653', '03', '因特网路由器在选路时不仅要考虑目的站IP地址，而且还要考虑目的站的物理地址。（F）', '判断');
INSERT INTO `tb_question` VALUES ('654', '327', '0429', '337', '010627', '654', '03', '正确：因特网路由器在选路时仅需考虑目的站IP地址，而不需要考虑目的站的物理地址。', '判断');
INSERT INTO `tb_question` VALUES ('655', '328', '0430', '338', '010628', '655', '03', 'OSPF是一种基于距离向量的内部网关协议。正确：OSPF是一种基于链路状态的内部网关协议', '判断');
INSERT INTO `tb_question` VALUES ('656', '329', '0431', '339', '010629', '656', '04', 'ARP的请求和应答报文都是一对一的，这样可以进行正确解析。正确：ARP的请求报文是广播报文，应答报文是一对一的（单播）。', '判断');
INSERT INTO `tb_question` VALUES ('657', '330', '0432', '340', '010630', '657', '05', '可以根据网卡的MAC地址判断安装该网卡的主机所在的网络位置。正确：根据网卡的IP地址可以判断安装该网卡的主机所在的网络位置。', '判断');
INSERT INTO `tb_question` VALUES ('658', '331', '0433', '341', '010631', '658', '06', '5.1某网络上连接的所有主机，都得到“Request time out”的显示输出，检查本地主机配置和IP地址：202.117.34.35，子网掩码为255.255.0.0，默认网关为202.117.34.1，请问问题可能出在哪里？\n答：因为由ip地址202.117.34.35得知网络是C类网络，子网掩码的问题（255.255.255.0）。子网掩码应为255.255.255.0。按原配置，本地主机会被网关认为不在同一子网中，这样网关将不会转发任何发送给本地主机的信息。', '简答题');
INSERT INTO `tb_question` VALUES ('659', '332', '0434', '342', '010632', '659', '07', '5.2简述共享式集线器（HUB）与交换机（SWITCH）的异同点。\n答: （1）在OSI参考模型中工作的层次不同：HUB一般工作在物理层，交换机工作在数据链路层或网络层。\n（2）数据传输方式不同：HUB的所有设备在同一冲突域和同一广播域，采用的数据传输方式是广播方式，容易产生广播风暴；交换机的数据传输是有目的的，数据在发送方与接受方之间进行掂对点的传送，数据传输效率提高，不会出现广播风暴，在安全性方面也不会出现其他节点侦听的现象。\n（3）带宽占用方式不同：HUB的所有端口共享总带宽，而交换机的每个端口都有自己的带宽。\n（4）传输模式不同：HUB只能采用半双工方式进行传输，交换机既可采用半双工也可采用全双工。', '简答题');
INSERT INTO `tb_question` VALUES ('660', '333', '0435', '343', '010633', '660', '08', '5.3找出下列不能分配给主机的IP地址，并说明原因。\nA．131.107.256.80　　B．231.222.0.11  C．126.1.0.0　　D．198.121.254.255  E．202.117.34.32\n答：A．第三个数256是非法值，每个数字都不能大于255\nB．第一个数231是保留给组播的地址，不能用于主机地址\nC．以全0结尾的IP地址是网络地址，不能用于主机地址\nD．以全1结尾的IP地址是广播地址，不能用于主机地址', '简答题');
INSERT INTO `tb_question` VALUES ('661', '334', '0436', '344', '010634', '661', '09', '5.4简要说明TCP／IP参考模型五个层次的名称(从下往上)?各层的信息传输格式?各层使用的设备是什么?(最低三层)\n答：A．物理层    链路层    网络层    运输层    应用层\nB．比特流  帧  包(报文分组)    报文\nC．中继器    网桥    路由器    网关', '简答题');
INSERT INTO `tb_question` VALUES ('662', '335', '0437', '345', '010635', '662', '10', '5.5组建一个小型对等局域网的物理连接过程中，需要哪些硬件？用五类UTP制作直通线和交叉线时，连线顺序有什么不同？两种线各有什么用处？\n答：计算机，带有RJ-45接口的网卡，5类UTP，RJ-45水晶头，压线钳，通断测试仪，集线器或交换机。直通线两头接线顺序都用568B标准：橙白，橙，绿白，蓝，蓝白，绿，棕白，棕。交叉线两头一边用568A标准另一边用568B标准，1 2和3 6有交叉。直通线用于计算机与集线器或交换机相连，而交叉线用于集线器与集线器或集线器与交换机相连。', '简答题');
INSERT INTO `tb_question` VALUES ('663', '336', '0438', '346', '010636', '663', '11', '5.6ARP协议的功能是什么？假设主机1和主机2处于同一局域网（主机1的IP地址是172.16.22.101，主机2的IP地址是172.16.22.110），简述主机1使用ARP协议解析主机2的物理地址的工作过程。\n答：（2分）当主机1要向主机2发送数据之前，必须解析出主机2的物理地址，解析过程如下：主机1发送一个广播帧（带有ARP报文）到以太网，该ARP报文大致意思是：“我的IP地址是172.16.22.101，谁的IP地址为172.16.22.110？请告诉我你的物理地址。”（2分）这个广播帧会传到以太网的所有机器，每个机器在收到广播帧后，都会去查看自己的IP地址。（2分）但是只有IP地址为172.16.22.110的主机2会返回主机1一个ARP响应报文，其中包含了主机2的物理地址（设为E2）。这样主机1就知道了IP地址为172.16.22.110的主机所对应的物理地址为E2.随后就可以向主机2发送数据。', '简答题');
INSERT INTO `tb_question` VALUES ('664', '337', '0439', '347', '010637', '664', '12', '5.7简述CSMA/CD的工作原理。\n答：发送前先监听信道是否空闲，若空闲则立即发送；如果信道忙，则继续监听，一旦空闲就立即发送；在发送过程中，仍需继续监听。若监听到冲突，则立即停止发送数据，然后发送一串干扰信号（Jam）；发送Jam信号的目的是强化冲突，以便使所有的站点都能检测到发生了冲突。等待一段随机时间（称为退避）以后，再重新尝试。归结为四句话：发前先听，空闲即发送，边发边听，冲突时退避。', '简答题');
INSERT INTO `tb_question` VALUES ('665', '338', '0440', '348', '010638', '665', '13', '5.8把十六进制的IP地址C22F1588转换成用点分割的十进制形式，并说明该地址属于哪类网络地址，以及该种类型地址的每个子网最多可能包含多少台主机。  \n（1）194.47.21.136 ;（2）C型（3）254台主机。', '简答题');
INSERT INTO `tb_question` VALUES ('666', '339', '0441', '349', '010639', '666', '14', '5.9写出现代计算机网络的五个方面的应用。  \n答：万维网(WWW)信息浏览、电子邮件(E-mail)、文件传输(FTP)、远程登录(Telnet)、电子公告牌(bulletin broad system，BBS以及Netnews)、电子商务、远程教育。', '简答题');
INSERT INTO `tb_question` VALUES ('667', '340', '0442', '350', '010640', '667', '15', '5.10简要说明电路交换和存储器转发交换这两面种交换方式，并加以比较。  \nA. 电路交换是一种直接的交换方式，它为一对需要进行通信的装置（站）之间提供一条临时的专用通道，即提供一条专用的传输通道，即可是物理通道又可是逻辑通道（使用时分或频分复用技术）。这条通道是由节点内部电路对节点间传输路径经过适当选择、连接而完成的，由多个节点和多条节点间传输路径组成的链路，例如，目前公用电话网广泛使用的交换方式是电路交换。（2分）\nB．存储转发交换方式又可以分为报文存储转发交换与报文分组存储转发交换，报文分组存储转发交换方式又可以分为数据报与虚电路方式。分组交换属于“存储转发”交换方式，但它不像报文交换那样以报文为单位进行交换、传输，而是以更短的、标准的“报文分组”（packet）为单位进行交换传输。分组经过通信网络到达终点有2种方法：虚电路和数据报。（2分）\nC．与电路交换相比，报文交换方式不要求交换网为通信双方预先建立，条专用的数据通路，因此就不存在建立电路和拆除电路的过程。', '简答题');
INSERT INTO `tb_question` VALUES ('668', '341', '0443', '351', '010641', '668', '16', '5.11TCP/IP的核心思想(理念)是什么？\n答：TCP/IP的核心思想就是“网络互联”，将使用不同低层协议的异构网络，在传输层、网络层建立一个统一的虚拟逻辑网络，以此来屏蔽所有物理网络的硬件差异，从而实现网络的互联', '简答题');
INSERT INTO `tb_question` VALUES ('669', '342', '0444', '352', '010642', '669', '17', '5.12 物理层的接口有哪几个方面的特性？各包含些什么内容？(第二章物理层知识点:物理层的主要任务)\n答案：物理层的接口主要有四个方面的特性，即机械特性-说明接口所用接线器的形状和尺寸、引线数目和排列、固定和锁定装置等等。例如对各种规格的电源插头的尺寸都有严格的规定。\n电气特性-说明在接口电缆的哪条线上出现的电压应为什么范围，即什么样的电压表示1 或0。\n功能特性-说明某条线上出现的某一电平的电压表示何种意义。\n规程特性-说明对于不同功能的各种可能事件的出现顺序。', '简答题');
INSERT INTO `tb_question` VALUES ('670', '343', '0445', '353', '010643', '670', '18', '5.13传播时延、发送时延和重发时延各自的物理意义是什么？(第二章物理层知识点:卫星通信)\n答案：传播时延是指电磁波在信道中传输所需要的时间。它取决于电磁波在信道上的传输速率以及所传播的距离。发送时延是发送数据所需要的时间。它取决于数据块的长度和数据在信道上的发送速率。重发时延是因为数据在传输中出了差错就要重新传送，因而增加了总的数据传输时间。', '简答题');
INSERT INTO `tb_question` VALUES ('671', '344', '0446', '354', '010644', '671', '19', '5.14简述CSMA/CD 的工作过程。(第四章信道共享技术知识点随机接入技术)\n答案：（1）发送站发送时首先侦听载波（载波检测）。\n（2）如果网络（总线）空闲，发送站开始发送它的帧。\n（3）如果网络（总线）被占用，发送站继续侦听载波并推迟发送直至网络空闲。\n（4）发送站在发送过程中侦听碰撞（碰撞检测）。\n（5）如果检测到碰撞，发送站立即停止发送，这意味着所有卷入碰撞的站都停止发送。\n（6）每个卷入碰撞的站都进入退避周期，即按照一定的退避算法等一段随机时间后进行重发，亦即重复上述1-6 步骤，直至发送成功。', '简答题');
INSERT INTO `tb_question` VALUES ('672', '345', '0447', '355', '010645', '672', '20', '5.15交换式局域网和共享式局域网的区别在哪？(第五章局域网知识点: IEEE802.3 标准)\n答案：传统的局域网一般是共享总线带宽，若是共享10M 的局域网，有5 个用户，则每个用户平均分得的带宽最多为2M。这样，对于带宽要求比较高的多媒体应用，如视频会议、视频点播等，这种网络将难以胜任。交换式局域网则改变了这种状况，它利用中央交换器，使得每个接入的链路都能得到带宽保证，典型的交换器总频带可达千兆位，比现有的共享介质局域网的速度提高2 个数量级，可充分保证达数据量多媒体应用的带宽要求。', '简答题');
INSERT INTO `tb_question` VALUES ('673', '346', '0448', '356', '010646', '673', '21', '5.16什么是全双工以太网？(第五章局域网知识点: IEEE802.3 标准)\n答案：全双工以太网可以双向传输数据，不需要冲突检查功能，允许同时发送和接收，由全双工以太网开关实施网络通信管理，比传统的10BASE-T 的吞吐量大一倍。', '简答题');
INSERT INTO `tb_question` VALUES ('674', '347', '0449', '357', '010647', '674', '22', '5.17地址解析协议(ARP)的用途是什么？\n(第七章网络互连知识点:地址解析协议的作用)\n答案:针对一台具体的主机，把一个IP 地址映射成网络适配器的硬件地址。', '简答题');
INSERT INTO `tb_question` VALUES ('675', '348', '0450', '358', '010648', '675', '23', '5.18TCP 的用途和功能是什么？\n(第八章运输层知识点: TCP 的用途)\n答案:将数据流从一台主机可靠地传输到另一台主机。', '简答题');
INSERT INTO `tb_question` VALUES ('676', '349', '0451', '359', '010649', '676', '24', '5.19判定下列IP 地址的类型。\n131.109.54.1   78.34.6.90   220.103.9.56   240.9.12.2   19.5.91.245   129.9.234.52   125.78.6.2\n答案: B、A、C、C、A、B、A', '简答题');
INSERT INTO `tb_question` VALUES ('677', '350', '0452', '360', '010650', '677', '25', '5.20判定下列IP 地址中哪些是无效的，并说明其无效的原因。\n131.255.255.18  127.21.19.109   220.103.256.56  240.9.12.12   192.5.91.255  129.9.255.254  10.255.255.254\n答案:\n131.255.255.18 (有效）  127.21.19.109（无效-127 为测试保留） 220.103.256.56（无效-八位组的最高值为255）\n240.9.12.12（无效-C 类地址的最高值为223）  192.5.91.255（无效- 255 用于广播地址）\n129.9.255.254（有效）  10.255.255.254（有效）', '简答题');
INSERT INTO `tb_question` VALUES ('678', '351', '0453', '361', '010651', '678', '26', '5.21假设有两台主机A的IP地址为208.17.16.165，主机B的IP地址为208.17.16.185，它们的子网掩码255.255.255.224，默认网关为208.17.16.160。试问：\n（1）主机A和主机B能否直接通信？\n（2）主机B不能和IP地址为208.17.16.34的DNS服务器通信。为什么？', '简答题');
INSERT INTO `tb_question` VALUES ('679', '352', '0454', '362', '010652', '679', '27', '5.30假定一个ISP拥有形为101.101.100.0/23的地址块，要分配给四个单位使用，A单位需要115个IP地址，B单位需要238个地址，C单位需要50个IP地址，D单位需要29个IP地址。请提供满足四个单位需要的地址块划分（形式为a.b.c.d/x）。\n一个可能的答案：\nA单位：101.101.101.0/25         B单位：101.101.100.0/24\nC单位：101.101.101.128/26       D单位：101.101.101.192/26    评分标准：每个单位2.5分。', '简答题');
INSERT INTO `tb_question` VALUES ('680', '353', '0455', '363', '010653', '680', '28', '5.29简述Link-State路由算法的工作过程及其特点。\n答：工作过程：（1）发现邻居结点（2）测量线路开销（3）构造L-S报文（4）广播L-S报文（5）重新计算路由。\n特点：1）考虑了线路的带宽；2）算法的收敛性得到保证；3）算法的对路由器的要求比较高。', '简答题');
INSERT INTO `tb_question` VALUES ('681', '354', '0456', '364', '010654', '681', '29', '5.28简述以太网CSMA/CD协议的工作过程，并说明以太网的特点。\n答：CSMA/CD协议的工作过程：某站点想要发送数据，必须首先侦听信道，如果信道空闲，立即发送数据并进行冲突检测；如果信道忙，继续侦听信道，直到信道变为空闲，发送数据并进行冲突检测。如果站点在发送数据过程中检测到冲突，立即停止发送数据并等待一随机长的时间，重复上述过程。\n  特点：轻负载性能比较好，重负载时性能急剧变坏，不适合实时应用环境。', '简答题');
INSERT INTO `tb_question` VALUES ('682', '355', '0457', '365', '010655', '682', '30', '6.1在Internet网中，某计算机的IP地址是 11001010.01100000.00101100.01011000 ，请回答下列问题：\n1)用十进制数表示上述IP地址？\n2)该IP地址是属于A类，B类，还是C类地址？\n3)写出该IP地址在没有划分子网时的子网掩码？\n4)写出该IP地址在没有划分子网时计算机的主机号？\n5)将该IP地址划分为四个子网(包括全0和全1的子网)，写出子网掩码，并写出四个子网的IP地址区间（如：192.168.1.1~192.168.1.254） \n答：1. 202.96.44.88\n2. C类\n3. 255.255.255.0\n4. 88\n5. 255.255.255.192\n  202.96.44.1~202.96.44.63\n  202.96.44.65~202.96.44.127\n  202.96.44.129~202.96.44.191\n网络/掩码长度 下一跳\nC4.5E.2.0/23 A\nC4.5E.4.0/22 B\nC4.5E.C0.0/19 C\nC4.5E.40.0/18 D\nC4.4C.0.0/14 E\nC0.0.0.0/2 F\n80.0.0.0/1 G\n  202.96.44.193~202.96.44.254  ', '证明题');
INSERT INTO `tb_question` VALUES ('683', '356', '0458', '366', '010656', '683', '31', '6.3某一网络地址块202.101.102.0中有5台主机A、B、C、D和E，它们的IP地址及子网掩码如下表所示。\n　　　　　主机 IP地址 子网掩码\nA 202.101.102.18 255.255.255.240\nB 202.101.102.146 255.255.255.240\nC 202.101.102.158 255.255.255.240\nD 202.101.102.161 255.255.255.240\nE 202.101.102.173 255.255.255.240\n240（D）=11110000（B）  18（D）=00010010（B）  146（D）=10010010（B）158（D）=10011110（B）\n161（D）=10100001（B）  173（D）=10101101（B） 164（D）=10100100（B）\n[问题1](2分)　5台主机A、B、C、D、E分属几个网段？哪些主机位于同一网段？\n分成了3个网段，A一个，B和C一个，D和E一个\n[问题2](2分)　主机E的网络地址为多少？\n202.101.102.160\n[问题3](2分)　若要加入第六台主机F，使它能与主机B属于同一网段，其IP地址范围是多少？\n202.101.102.144——202.101.102.159\n[问题4](2分)若在网络中另加入一台主机，其IP地址设为202.101.102.164,它的广播地址是多少？哪些主机能够收到？\n广播地址：202.101.102.175  D和E可以接收到\n[问题5](2分)若在该网络地址块中采用VLAN技术划分子网，何种设备能实现VLAN之间的数据转发？\n网桥可以实现vlan之间的数据转发或者是交换机', '证明题');
INSERT INTO `tb_question` VALUES ('684', '357', '0459', '367', '010657', '684', '32', '6.4办公室内有一台计算机，IP地址为202.45.165.243，子网掩码为255.255.255.160，则该机所在的网络属于哪类网络？其网络是否进行了子网划分？若划分，则分为几个子网？该机的子网号和主机号分别是多少？', '证明题');
INSERT INTO `tb_question` VALUES ('685', '358', '0460', '368', '010658', '685', '33', '6.5阅读以下说明，回答问题1至问题2，将解答填入答题纸对应的解答栏内。\n【说明】　某公司租用了一段C类地址203.12.11.0/24～203.12.14.0/24，如图5-1所示。其网间地址是172.11.5.14/24。要求网内所有PC都能上网。', '证明题');
INSERT INTO `tb_question` VALUES ('686', '359', '0461', '369', '010659', '686', '34', '1.1 某公司申请了一个C类212．45．5．0的IP地址空间，该公司大约有110名员工在销售部工作，大约有60名员工在财务部工作，另有大约50名员工在设计部工作。要求为销售部、财务部和设计部分别组建子网。请给出各子网的网络号及子网掩码，并标明相应允许联网的主机数目。', '证明题');
INSERT INTO `tb_question` VALUES ('687', '360', '0462', '370', '010660', '687', '35', ' 6.12一名学生A 希望访问网站www.google.com。学生A 在其浏览器中输入\nhttp://www.google.com 并按回车，直到Google 的网站首页显示在其浏览器中，请问：\n(1) 在此过程中，按照TCP/IP 参考模型，从应用层（包括应用层）到网络接口层\n（包括网络接口层）都用到了哪些协议，每个协议所起的作用是什么？\n(2) 简要描述该过程的流程（可用流程图描述）。\n答题要点：\n(1) 协议及其功能如下：\n应用层：\nHTTP：WWW 访问协议。\nDNS：域名解析。\n传输层：\nTCP：在客户和服务器之间建立连接，提供可靠的数据传输。\n网络层：\nIP：进行路由选择。\nICMP：提供网络传输中的差错检测。\nARP：将目的IP 地址映射成物理MAC 地址。\n网络接口层：\nLLC 和MAC.提供数据链路层的功能，实现可靠的数据链路。\n(2) 过程描述如下：\n● 利用DNS，查询到WWW.GOOGLE.COM 对应的IP 地址。\n● 浏览器与GOOGLE 的服务器利用TCP 协议建立连接。\n● 浏览器利用HTTP 的GET 方法向GOOGLE 服务器发送资源请求。\n● GOOGLE 发送回应信息。\n● 浏览器解释回应信息，并以图形化的方式显示。', '证明题');
INSERT INTO `tb_question` VALUES ('806', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('807', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('808', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('809', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('810', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('811', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('812', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('813', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('814', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('815', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('816', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('817', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('818', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('819', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('906', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('907', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('908', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('909', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('910', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('911', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('912', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('913', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('914', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('915', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('916', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('917', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('918', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('919', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('920', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('921', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('922', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('923', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('924', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('925', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('926', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('927', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('928', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('929', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('930', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('931', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('932', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('933', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('934', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('935', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('936', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('937', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('938', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('939', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('940', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('941', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('942', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('943', '', '', '', '', '', '', '', '');
INSERT INTO `tb_question` VALUES ('944', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for tb_questiontype
-- ----------------------------
DROP TABLE IF EXISTS `tb_questiontype`;
CREATE TABLE `tb_questiontype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `questiontype` varchar(8) DEFAULT NULL COMMENT '题目类型编号',
  `questiontypename` varchar(50) DEFAULT NULL COMMENT '题目类型名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_questiontype_index` (`questiontype`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='题目类型表';

-- ----------------------------
-- Records of tb_questiontype
-- ----------------------------
INSERT INTO `tb_questiontype` VALUES ('1', '01', '选择题', '选择题');
INSERT INTO `tb_questiontype` VALUES ('2', '02', '填空题', '填空题');
INSERT INTO `tb_questiontype` VALUES ('3', '03', '判断题', '判断题');
INSERT INTO `tb_questiontype` VALUES ('4', '04', '简答', '简答');
INSERT INTO `tb_questiontype` VALUES ('5', '05', '计算题', '计算题');
INSERT INTO `tb_questiontype` VALUES ('6', '06', '证明题', '证明题');

-- ----------------------------
-- Table structure for tb_students
-- ----------------------------
DROP TABLE IF EXISTS `tb_students`;
CREATE TABLE `tb_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `studentnum` char(8) DEFAULT NULL COMMENT '学号',
  `collegenum` varchar(20) DEFAULT NULL COMMENT '学院编号',
  `majornum` varchar(20) DEFAULT NULL COMMENT '专业编号',
  `gradenum` varchar(20) DEFAULT NULL COMMENT '班级编号',
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `type` varchar(4) DEFAULT NULL COMMENT '类型',
  `term` varchar(8) DEFAULT NULL COMMENT '学期',
  PRIMARY KEY (`id`),
  KEY `idx_collegenum_index` (`collegenum`),
  KEY `idx_majornum_index` (`majornum`),
  KEY `idx_gradenum_index` (`gradenum`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='学生信息表';

-- ----------------------------
-- Records of tb_students
-- ----------------------------
INSERT INTO `tb_students` VALUES ('1', '1001', '01', '01', '01', '张三', '01', '1');
INSERT INTO `tb_students` VALUES ('2', '1002', '01', '01', '01', '李四', '01', '1');
INSERT INTO `tb_students` VALUES ('3', '1003', '01', '01', '01', '徐坤', '01', '1');

-- ----------------------------
-- Table structure for tb_tactics
-- ----------------------------
DROP TABLE IF EXISTS `tb_tactics`;
CREATE TABLE `tb_tactics` (
  `tacid` bigint(20) NOT NULL AUTO_INCREMENT,
  `tacname` varchar(200) DEFAULT NULL COMMENT '试卷名称',
  `collegenum` varchar(20) DEFAULT NULL COMMENT '学院编号',
  `collegename` varchar(200) DEFAULT NULL COMMENT '学院',
  `majornum` varchar(20) DEFAULT NULL COMMENT '专业编号',
  `majorname` varchar(100) DEFAULT NULL COMMENT '专业名称',
  `coursenum` varchar(20) DEFAULT NULL COMMENT '课程编号',
  `coursename` varchar(20) DEFAULT NULL COMMENT '课程名称',
  `content` longtext COMMENT '试卷内容',
  `createid` bigint(20) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `qtype` varchar(100) DEFAULT NULL COMMENT '题型',
  `weight` varchar(20) DEFAULT NULL COMMENT '权重',
  PRIMARY KEY (`tacid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='组卷策略';

-- ----------------------------
-- Records of tb_tactics
-- ----------------------------
INSERT INTO `tb_tactics` VALUES ('19', '2018040423074703', '02', null, '0201', null, '04', null, '{\"01\":[{\"questioncotent\":\"1．（       ）不是基本的操作系统。        A、批处理操作系统       B、分时操作系统  C、实时操作系统         D、网络操作系统 \"},{\"questioncotent\":\"2．（    ）不是分时系统的基本特征：        A、同时性       B、独立性  C、实时性       D、交互性 \"}],\"02\":[{\"questioncotent\":\"1．操作系统为用户提供三种类型的使用接口，它们是_____和_______和图形用户界面。\"},{\"questioncotent\":\"2．主存储器与外围设备之间的数据传送控制方式有程序直接控制、_______、_______和通道控制方式。\"}],\"03\":[{\"questioncotent\":\"（）1．并发性是指若干事件在同一时刻发生。\"},{\"questioncotent\":\"（）2、虚存容量的扩大是以牺牲CPU工作时间以及内、外存交换时间为代价的。\"},{\"questioncotent\":\"（）3．用户为每个自己的进程创建PCB，并控制进程的执行过程。\"},{\"questioncotent\":\"（）4．树型目录结构能够解决文件重名问题。 \"},{\"questioncotent\":\"（）5．原语是一种不可分割的操作。\"}]}', '1', '2018-04-04 23:07:47', '01,02,03', '1');
INSERT INTO `tb_tactics` VALUES ('20', '2018040821561404', '02', null, '0201', null, '04', null, '{\"01\":[{\"questioncotent\":\"（  D     ）不是基本的操作系统。  A、批处理操作系统       B、分时操作系统  C、实时操作系统         D、网络操作系统 \"},{\"questioncotent\":\"（ C     ）不是分时系统的基本特征：       A、同时性       B、独立性 C、实时性       D、交互性 \"},{\"questioncotent\":\"进程所请求的一次打印输出结束后，将使进程状态从（A）A、运行态变为就绪态B、运行态变为等待态C、就绪态变为运行态D、等待态变为就绪态\"},{\"questioncotent\":\"采用动态重定位方式装入的作业，在执行中允许（C）将其移动。A、用户有条件地\\tB、用户无条件地C、操作系统有条件地D、操作系统无条件地\"},{\"questioncotent\":\"分页式存储管理中，地址转换工作是由（A）完成的。A、硬件\\t\\tB、地址转换程序C、用户程序\\tD、装入程序\"},{\"questioncotent\":\"如果允许不同用户的文件可以具有相同的文件名，通常采用（D）来保证按名存取的安全。A、重名翻译机构\\tB、建立索引表C、建立指针\\tD、多级目录结构\"},{\"questioncotent\":\"对记录式文件，操作系统为用户存取文件信息的最小单位是（B）。A、字符\\t\\tB、数据项C、记录\\t\\tD、文件\"},{\"questioncotent\":\"为了提高设备分配的灵活性，用户申请设备时应指定（A）号。A、设备类相对\\tB、设备类绝对C、相对\\t\\tD、绝对\"},{\"questioncotent\":\"一作业进入内存后，则所属该作业的进程初始时处于（C）状态。A、运行\\t\\tB、等待C、就绪\\t\\tD、收容\"},{\"questioncotent\":\"共享变量是指（D）访问的变量。A、只能被系统进程B、只能被多个进程互斥C、只能被用户进程D、可被多个进程\"},{\"questioncotent\":\"临界区是指并发进程中访问共享变量的（D）段。A、管理信息\\t\\tB、信息存储C、数据\\t\\tD、程序\"},{\"questioncotent\":\"若系统中有五台绘图仪，有多个进程均需要使用两台，规定每个进程一次仅允许申请一台，则至多允许（D）个进程参于竞争，而不会发生死锁。A、5\\tB、2  C、3 D、4\"},{\"questioncotent\":\"产生系统死锁的原因可能是由于（C）。A、进程释放资源\\t\\t\\tB、一个进程进入死循环C、多个进程竞争，资源出现了循环等待D、多个进程竞争共享型设备\"},{\"questioncotent\":\"地址重定位的结果是得到（B）A．源程序B．编译程序C．目标程序D．执行程序\"},{\"questioncotent\":\"为了对文件系统中的文件进行安全管理，任何一个用户在进入系统时都必须进行注册，这一级管理是＿＿＿＿安全管理。（A）A．系统级B．用户级C．目录级D．文件级\"},{\"questioncotent\":\"运行时间最短的作业被优先调度，这种企业调度算法是（C）A．优先级调度B．响应比高者优先C．短作业优先D．先来先服务\"},{\"questioncotent\":\"产生死锁的主要原因是进程运行推进的顺序不合适（D）\\nA．系统资源不足和系统中的进程太多B．资源的独占性和系统中的进程太多\\nC．进程调度不当和资源的独占性D．资源分配不当和系统资源不足\"},{\"questioncotent\":\"实时操作系统追求的目标是（C）。A.高吞吐率B.充分利用内存C.快速响应D.减少系统开销\"},{\"questioncotent\":\"批处理系统的主要缺点是（B）。A.CPU的利用率不高B.失去了交互性C.不具备并行性D.以上都不是\"},{\"questioncotent\":\"批处理系统的主要缺点是（B）。A.CPU的利用率不高B.失去了交互性C.不具备并行性D.以上都不是\"},{\"questioncotent\":\"如果文件系统中有两个文件重名，不应采用（A）。A.一级目录结构B.树型目录结构C.二级目录结构   D.A和C\"},{\"questioncotent\":\" 树型目录结构的第一级称为目录树的（B）。A.分支节点B.根节点C.叶节点D.终节点\"},{\"questioncotent\":\"虚拟内存的容量只受（D  ）的限制。A.物理内存的大小B.磁盘空间的大小 C.数据存放的实际地址D.计算机地址位数\"},{\"questioncotent\":\"分段管理提供（B）维的地址结构。A.1    B.2 C.3  D.4\"},{\"questioncotent\":\"（D   ）实现了段式、页式两种存储方式的优势互补。A.请求分页管理  B.可变式分区管理 C.段式管理D.段页式管理\"},{\"questioncotent\":\"以下存储管理技术中，支持虚拟存储器的技术是（C ）。A．动态分区法   B．可重定位分区法C．请求分页技术   D．对换技术\"},{\"questioncotent\":\"操作系统中采用缓冲技术的目的是为了增强系统（ D   ）的能力。A.串行操作     B.控制操作C.重执操作D.并行操作\"},{\"questioncotent\":\"B是指从作业进入系统到作业完成所经过的时间间隔；D是从作业进入后备队列起，到被调度程序选中时的时间间隔。A：响应时间；B：周转时间； C：运行时间；D：等待时间；F：触发时间。\"},{\"questioncotent\":\"在UNIX系统中获取帮助信息的命令为B。A：help\\t\\tB：man\\t\\tC：cat\"},{\"questioncotent\":\"CPU的调度分为高级、中级和低级三种，其中低级调度是指C调度。A：作业  B：交换  C：进程\"},{\"questioncotent\":\"在请求调页中可采用多种置换算法，其中LRU是B置换算法。A：最佳\\t\\t\\tB：最近最久未用\\t\\tC：最近未用\\t\\t\\tD：最少使用\"},{\"questioncotent\":\"对打印机进行I/O控制时，通常采用B方式；对硬盘的I/O控制采用C方式。A：程序直接控制\\t\\t\\tB：中断驱动\\t\\tC：DMA\\t\\t\\tD：通道\"},{\"questioncotent\":\"在UNIX系统中采用的页面置换算法是A。A：CLOCK\\t\\t\\t\\tB：OPT\\t\\tC：NRU\\t\\t\\tD：LRU\"},{\"questioncotent\":\"在磁盘调度算法中，选择与当前磁头移动方向一致、磁头单向移动且距离最近的进程的算法为C。A：FIFO\\t\\t\\t\\tB：SCAN\\t\\tC：CSCAN\\t\\t\\tD：FSCAN\"},{\"questioncotent\":\"在UNIX系统中的mv命令表示D。A：删除文件\\tB：移动文件或对文件换名\\tC：复制文件\"},{\"questioncotent\":\"现代操作系统的两个基本特征是（C）和资源共享。A.多道程序设计B.中断处理C.程序的并发执行D.实现分时与实时处理\"},{\"questioncotent\":\" 以下（C）项功能不是操作系统具备的主要功能。A．内存管理B．中断处理C．文档编辑D．CPU调度\"},{\"questioncotent\":\"批处理系统的主要缺点是（B）。A.CPU的利用率不高B.失去了交互性C.不具备并行性D.以上都不是\"},{\"questioncotent\":\"引入多道程序的目的在于（A）。A.   充分利用CPU，减少CPU等待时间B.    提高实时响应速度C.   有利于代码共享，减少主、辅存信息交换量,充分利用存储器\"},{\"questioncotent\":\" 在分时系统中，时间片一定，（B），响应时间越长。A.内存越多B.用户数越多C.后备队列D.用户数越少\"},{\"questioncotent\":\"系统调用是由操作系统提供的内部调用，它（B）。A.直接通过键盘交互方式使用B.只能通过用户程序间接使用C.是命令接口中的命令使用D.与系统的命令一样\"},{\"questioncotent\":\"为了对紧急进程或重要进程进行调度，调度算法应采用（B）。A.先进先出调度算法B.优先数法C.最短作业优先调度D.定时轮转法\"},{\"questioncotent\":\"若一个系统内存有64MB，处理器是32位地址，则它的虚拟地址空间为（  B ）字节。A.2GB         B.4GB C.100KBD.64MB\"},{\"questioncotent\":\"外存（如磁盘）上存放的程序和数据（B ）。A．可由CPU \\t   B．必须在CPU访问之前移入内存C．是必须由文件系统管理的   D．必须由进程调度程序管理 \"},{\"questioncotent\":\"一个40G的硬盘，块的大小为１Ｋ，其FAT要占（　　　）空间。A.100M  B.120M C.140M D.160M\"},{\"questioncotent\":\" 文件系统在创建一个文件时，为它建立一个（A）。A.文件目录B.目录文件C.逻辑结构D.逻辑空间\"},{\"questioncotent\":\" 文件的存储方法依赖于（C）。A.文件的物理结构B.存放文件的存储设备的特性 C.A和B  D.文件的逻辑\"},{\"questioncotent\":\"使用绝对路径名访问文件是从（C）开始按目录结构访问某个文件。A.当前目录B.用户主目录C.根目录D.父目录\"},{\"questioncotent\":\"目录文件所存放的信息是（D）。A.某一文件存放的数据信息B.某一文件的文件目录C.该目录中所有数据文件目录D.该目录中所有子目录文件和数据文件的目录\"},{\"questioncotent\":\"由字符序列组成，文件内的信息不再划分结构，这是指（A）。A.流式文件B.记录式文件C.顺序文件D.有序文件\"},{\"questioncotent\":\"数据库文件的逻辑结构形式是（C）。A.字符流式文件B.档案文件C.记录式文件D.只读文件\"},{\"questioncotent\":\" 逻辑文件是（B）的文件组织形式。A.在外部设备上B.从用户观点看C.虚拟存储D.目录\"},{\"questioncotent\":\"存储管理的目的是（ C  ）。A.方便用户B.提高内存利用率C.方便用户和提高内存利用率D.增加内存实际容量\"},{\"questioncotent\":\"在请求页式存储管理中，若所需页面不在内存中，则会引起（ D）。A.输入输出中断    B.时钟中断C.越界中断        D.缺页中断；\"},{\"questioncotent\":\"若处理器有32位地址，则它的虚拟地址空间为（B   ）字节。A.2GB    B.4GB C.100KB  D.640KB\"},{\"questioncotent\":\"虚拟存储技术是（B ）。A.补充内存物理空间的技术 B.补充相对地址空间的技术C.扩充外存空间的技术D.扩充输入输出缓冲区的技术\"},{\"questioncotent\":\"外存（如磁盘）上存放的程序和数据（B ）。A．可由CPU B．必须在CPU访问之前移入内存 C．是必须由文件系统管理的 D．必须由进程调度程序管理\"},{\"questioncotent\":\"段页式存储管理汲取了页式管理和段式管理的长处，其实现原理结合了页式和段式管理的基本思想，即（B）。A、用分段方法来分配和管理物理存储空间，用分页方法来管理用户地址空间。B、用分段方法来分配和管理用户地址空间，用分页方法来管理物理存储空间。C、用分段方法来分配和管理主存空间，用分页方法来管理辅存空间。D、用分段方法来分配和管理辅存空间，用分页方法来管理主存空间。\"},{\"questioncotent\":\"（C）存储管理支持多道程序设计，算法简单，但存储碎片多。A.段式 B.页式 C.固定分区D.段页式\"},{\"questioncotent\":\"（ C  ）存储管理方式提供一维地址结构。A.固定分区B.分段 C.分页D.分段和段页式\"},{\"questioncotent\":\"在请求分页系统中，LRU算法是指（  B）。A、最早进入内存的页先淘汰B、近期最长时间以来没被访问的页先淘汰C、近期被访问次数最少的页先淘汰D、以后再也不用的也先淘汰\"},{\"questioncotent\":\"请求分页存储管理中，若把页面尺寸增加一倍，在程序顺序执行时，则一般缺页中断次数会（B ）。A．增加    B．减少    C．不变    D．可能增加也可能减少\"},{\"questioncotent\":\"碎片现象的存在使得（A）。A.内存空间利用率降低B.内存空间利用率提高C.内存空间利用率得以改善D.内存空间利用率不影响\"},{\"questioncotent\":\"当内存碎片容量大于某一作业所申请的内存容量时，（ D ）。A、可以为这一作业分配内存B、不可以为这一作业分配内存C、拼接后，可以为这一作业分配内存D、一定能够为这一作业分配内存\"},{\"questioncotent\":\"通道是一种（C）。A.I/O端口B.数据通道C.I/O专用处理机D.软件工具\"},{\"questioncotent\":\"缓冲技术用于（A）。A、提高主机和设备交换信息的速度B、提供主、辅存接口C、提高设备利用率D、扩充相对地址空间\"},{\"questioncotent\":\"采用SPOOLing技术的目的是（  A）。A.提高独占设备的利用率B.提高主机效率C.减轻用户编程负担D.提高程序的运行速度\"},{\"questioncotent\":\"在设备管理中为了提高I/O速度和设备利用率，是通过B功能实现的。A：设备分配B：缓冲管理C：设备独立性D：虚拟设备\"},{\"questioncotent\":\"在UNIX系统中对空闲磁盘空间管理的方法是C。A：位示图B：空闲空间链C：成组链接法D：空闲表\"},{\"questioncotent\":\"实现虚拟存储器最关键的技术是C。A：内存分配B：置换算法C：请求调页(段)D：对换空间管理\"},{\"questioncotent\":\"在UNIX系统中，复制文件采用的命令为A。A：cp\\t\\tB：mv\\t\\tC：rm\\t\\tD：copy\"},{\"questioncotent\":\"对于一个文件的访问，常由A共同限制。A．用户访问权限和文件属性\\t\\tB．用户访问权限和文件优先级C．优先级和文件属性\\t\\t\\t\\tD．\\t文件属性和口令\"},{\"questioncotent\":\"一作业8：00到达系统，估计运行时间为1小时，若10：00开始执行该作业，其响应比是C。A.2　       B.1　C.3　      D.0.5\"},{\"questioncotent\":\"在动态分区分配方案中，某一作业完成后，系统收回其主存空间，并与相邻空闲区合并，为此需修改空闲区表，造成空闲区数减1的情况是D。A.无上邻空闲区，也无下邻空闲区　　\\nB.有上邻空闲区，但无下邻空闲区　　C.有下邻空闲区，但无上邻空闲区　　D.有上邻空闲区，也有下邻空闲区\"},{\"questioncotent\":\"如果进程需要读取磁盘上的多个连续的数据块，D数据传送方式的效率最高。A．程序直接控制方式B．中断控制方式C．DMA方式\\t\\tD．通道方式\"},{\"questioncotent\":\"使用文件之前必须先B文件。A．命名\\tB．打开C．建立\\tD．备份\"},{\"questioncotent\":\"如果一个磁盘的容量为40G，盘块的大小为4K，那么该磁盘的FAT大小为：。A．20M\\tB．25MC．30M\\tD．35M\"},{\"questioncotent\":\"1.1以下属于物理层的设备是（A）\\nA. 中继器   B. 以太网交换机  C. 桥  D. 网关 \"},{\"questioncotent\":\"1.2在以太网中是根据_B_地址来区分不同的设备的. \\nA. LLC地址   B. MAC地址\\nC. IP地址     D. IPX地址\"},{\"questioncotent\":\"1.3IEEE802.3u标准是指（B）\\nA. 以太网      B. 快速以太网\\nC. 令牌环网    D. FDDI网\"},{\"questioncotent\":\"1.4下面哪种LAN 是应用CSMA/CD协议的（C）\\nA、令牌环       B、FDDI\\nC、ETHERNET   D、NOVELL\"},{\"questioncotent\":\"1.5FDDI 使用的是___局域网技术。 （C）\\nA、以太网     B、快速以太网\\nC、令牌环     D、令牌总线\"},{\"questioncotent\":\"1.6TCP和UDP协议的相似之处是 （C）\\nA、面向连接的协议   B、面向非连接的协议\\nC、传输层协议       D、以上均不对\"},{\"questioncotent\":\"1.7应用程序PING 发出的是_（C）_报文。 \\nA、TCP 请求报文    B、TCP 应答报文\\nC、ICMP 请求报文   D、ICMP 应答报文\"},{\"questioncotent\":\"1.8小于___的TCP/UDP端口号已保留与现有服务一一对应，此数字以上的端口号可自由分配。（C）\\nA、199  B、100   C、1024   D、2048\"},{\"questioncotent\":\"1.9当一台主机从一个网络移到另一个网络时，以下说法正确的是 （B）\\nA、必须改变它的IP 地址和MAC 地址\\nB、必须改变它的IP 地址，但不需改动MAC 地址\\nC、必须改变它的MAC 地址，但不需改动IP 地址\\nD、MAC 地址、IP 地址都不需改动\"},{\"questioncotent\":\"1.10IEEE802.5 标准是指 （C）\\nA、以太网  B、令牌总线网C、令牌环网 D、FDDI 网\"},{\"questioncotent\":\"1.11ARP 协议的作用是 （D）\\nA、将端口号映射到IP 地址\\nB、连接IP 层和TCP 层\\nC、广播IP 地址\\nD、将IP 地址映射到第二层地址\"},{\"questioncotent\":\"1.1210BASE-T是指 （C）\\nA、粗同轴电缆    B、细同轴电缆\\nC、双绞线        D、光纤\"},{\"questioncotent\":\"1.13帧中继的使用链路层协议是 （C）\\nA、LAPB   B、LAPD  C、LAPF   D、HDLC\"},{\"questioncotent\":\"1.14与10.110.12.29 mask 255.255.255.224 属于同一网段的主机IP 地址是 （B）\\nA、10.110.12.0      B、10.110.12.30\\nC、10.110.12.31     D、10.110.12.32\"},{\"questioncotent\":\"1.15某公司申请到一个C 类IP 地址，但要连接6 个的子公司，最大的一个子公司有26 台计算机，每个子公司在一个网段中，则子网掩码应设为 （D）\\nA、255.255.255.0        B、255.255.255.128\\nC、255.255.255.192      D、255.255.255.224\"},{\"questioncotent\":\"1.16224.0.0.5 代表的是___地址。 （C）\\nA、主机地址    B、网络地址\\nC、组播地址    D、广播地址\"},{\"questioncotent\":\"1.17路由选择协议位于（C） 。\\nA. 物理层 B. 数据链路层 C. 网络层 D. 应用层 \"},{\"questioncotent\":\"1.18在局域网中，MAC指的是（ B）。\\nA. 逻辑链路控制子层   B. 介质访问控制子层\\nC. 物理层             D. 数据链路层\"},{\"questioncotent\":\"1.19255.255.255.224可能代表的是（ C）。\\nA. 一个B类网络号  B. 一个C类网络中的广播\\nC. 一个具有子网的网络掩码   D. 以上都不是\"},{\"questioncotent\":\"1.20传输层可以通过（ B ）标识不同的应用。\\nA. 物理地址B. 端口号C. IP地址D. 逻辑地址\"},{\"questioncotent\":\"1.21第二代计算机网络的主要特点是 （ A）。\\nA. 计算机-计算机网络B. 以单机为中心的联机系统\\nC. 国际网络体系结构标准化\\nD. 各计算机制造厂商网络结构标准化\"},{\"questioncotent\":\"1.22IP地址为 140.111.0.0 的B类网络，若要切割为9个子网，子网掩码应设为（ D）。\\n　　A. 255.0.0.0        B. 255.255.0.0\\n　　C. 255.255.128.0    D. 255.255.240.0\"},{\"questioncotent\":\"1.23在Internet上浏览时，浏览器和WWW服务器之间传输网页使用的协议是（ B）。\\nA. IP    B. HTTP    C. FTP   D. Telnet\"},{\"questioncotent\":\"1.24在数据通信中，当发送数据出现差错时，发送端无需进行数据重发的差错控制方法为 （B ）。\\n　A. ARQ  B. FEC  C. BEC  D. CRC\"},{\"questioncotent\":\"1.25计算机通信子网技术发展的顺序是（ C）。\\nA. ATM-\\u003e帧中继-\\u003e电路交换-\\u003e报文组交换\\nB. 电路交换-\\u003e报文组交换-\\u003eATM-\\u003e帧中继\\nC. 电路交换-\\u003e报文分组交换-\\u003e帧中继-\\u003eATM\\nD. 电路交换-\\u003e帧中继-\\u003eATM-\\u003e报文组交换\"},{\"questioncotent\":\"1.26浏览器与Web服务器之间使用的协议是（ C ）。\\nA  DNS   B. SNMP   C. HTTP   D. SMTP\"},{\"questioncotent\":\"1.27相邻层间交换的数据单元称之为服务数据单元，其英文缩写为（ A ）。\\nA. SDU   B. IDU    C. PDU    D . ICI\"},{\"questioncotent\":\"1.28如果一个C类网络用掩码255.255.255.192划分子网，那么会有（A）个可用的子网。\\nA. 2　　B. 4　 C. 6　 D. 8\"},{\"questioncotent\":\"1.29能从数据信号波形中提取同步信号的典型编码是（ D ）。\\nA.归零码　B.不归零码　C.定比码　D.曼彻斯特编码\"},{\"questioncotent\":\"1.30世界上很多国家都相继组建了自己国家的公用数据网，现有的公用数据网大多采用（ A ）。\\nA.分组交换方式　　B.报文交换方式　　\\nC.电路交换方式  　D.空分交换方式\"},{\"questioncotent\":\"1.31在IP地址方案中，159.226.181.1是一个（ B ）。\\nA. A类地址 B. B类地址　C. C类地址　D. D类地址\"},{\"questioncotent\":\"1.32在TCP/IP中，解决计算机到计算机之间通信问题的层次是（ B ）。\\nA. 网络接口层 　B.网际层　C.传输层　D. 应用层\"},{\"questioncotent\":\"1.33三次握手方法用于（ A ）。\\nA. 传输层连接的建立　B. 数据链路层的流量控制\\nC. 传输层的重复检测　D. 传输层的流量控制\"},{\"questioncotent\":\"1.34在计算机网络中，所有的计算机均连接到一条通信传输线路上，在线路两端连有防止信号反射的装置。 这种连接结构被称为（ A ）。\\nA.总线结构　B.环型结构　C.星型结构　D.网状结构\"},{\"questioncotent\":\"1.35以下属于广域网技术的是（ C）。\\nA. 以太网 　B. 令牌环网　C. 帧中继　D. FDDI\"},{\"questioncotent\":\"1.36TCP的协议数据单元被称为（ C ）。\\n　　A. 比特　　B. 帧　　C. 分段　　D. 字符\"},{\"questioncotent\":\"1.37下面提供FTP服务的默认TCP端口号是（ A ）。\\n　　A. 21　　B. 25　　 C. 23　　D. 80\"},{\"questioncotent\":\"1.38在同一个信道上的同一时刻，能够进行双向数据传送的通信方式是（ C ）。\\nA. 单工 B.半双工　C. 全双工　D. 上述三种均不是\"},{\"questioncotent\":\"1.39某部门申请到一个C类IP地址,若要分成8个子网,其掩码应为（ C ）。\\nA. 255.255.255.255　 B.255.255.255.0\\nC.255.255.255.224　 D.255.255.255.192\"},{\"questioncotent\":\"1.40以下的网络分类方法中，哪一组分类方法有误B\\nA. 局域网/广域网   B. 对等网/城域网\\nC. 环型网/星型网   D. 有线网/无线网\"},{\"questioncotent\":\"1.41在OSI的七层参考模型中，工作在第三层以上的网间连接设备是（ C ）。\\nA. 集线器　　 B. 网关　　C. 网桥　　D. 中继器\"},{\"questioncotent\":\"1.42世界上第一个计算机网络是 （A）。\\nA. ARPANET  B. ChinaNet　C.Internet　D.CERNET\"},{\"questioncotent\":\"1.43以太网媒体访问控制技术CSMA/CD的机制是（A）。\\nA. 争用带宽       B. 预约带宽\\nC. 循环使用带宽　 D. 按优先级分配带宽\"},{\"questioncotent\":\"1.44以下关于100BASE-T的描述中错误的是（C）。\\n　　A. 数据传输速率为100Mbit/S \\n　　B. 信号类型为基带信号\\n　　C. 采用5 类UTP，其最大传输距离为185M\\n　　D. 支持共享式和交换式两种组网方式\"},{\"questioncotent\":\"1.45www.tsinghua.edu.cn这个完整名称（FQDN）里，（ D ）是主机名.\\nA.edu.cn　　B.tsinghua　C. tsinghua.edu.cn  D. www\"},{\"questioncotent\":\"1.46一般来说，用户上网要通过因特网服务提供商，其英文缩写为(  D  )\\nA．IDC   B．ICP    C．ASP     D．ISP  \"},{\"questioncotent\":\"1.47使用双绞线作为传输介质，适用于下列哪种类型的以太网(  B  )\\nA．10Base-5  B．10/100Base-T  \\nC．10/100Base-F  D．10Base-2\"},{\"questioncotent\":\"1.48PPP协议是哪一层的协议(   B )\\nA．物理层  B．数据链路层  C．网络层  D．高层\"},{\"questioncotent\":\"1.49在以下传输介质中，带宽最宽，抗干扰能力最强的是( D)\\nA、双绞线  B、无线信道   C、同轴电缆  D、光纤\"},{\"questioncotent\":\"1.50目前网络应用系统采用的主要模型是( C )\\nA．离散个人计算模型   B．主机计算模型   \\nC客户/服务器计算模型 D网络/文件服务器计算模型\"},{\"questioncotent\":\"1.51IP协议是无连接的，其信息传输方式是( B )\\nA．点对点   B．数据报    C．广播    D．虚电路\"},{\"questioncotent\":\"1.52域名www.pku.edu.cn与www.cam.ac.uk哪部分是相同的？ ( C )\\nA．最高层域  B．子域   C．主机域  D．都不相同\"},{\"questioncotent\":\"1.53一座大楼内的一个计算机网络系统，属于（B）\\nA、PAN   B、LAN   C、MAN   D、WAN\"},{\"questioncotent\":\"1.54网络协议主要要素为（ C ）\\nA、数据格式、编码、信号电平\\nB、数据格式、控制信息、速度匹配\\nC、语法、语义、时序\\nD、编码、控制信息、同步\"},{\"questioncotent\":\"1.55采用专用线路通信时，可以省去的通信阶段是A\\nA、建立通信线路      B、建立数据传输链路\\nC、传送通信控制信号和数据 D、双方确认通信结束\"},{\"questioncotent\":\"1.56通信系统必须具备的三个基本要素是（ C ）\\nA、终端、电缆、计算机\\nB、信号发生器、通信线路、信号接收设备\\nC、信源、通信媒体、信宿\\nD、终端、通信设施、接收设备\"},{\"questioncotent\":\"1.57计算机网络通信系统是（ D ）\\nA、电信号传输系统    B、文字通信系统\\nC、信号通信系统      D、数据通信系统\"},{\"questioncotent\":\"1.58在TCP/IP协议簇的层次中，解决计算机之间通信问题是在（ B ）\\nA、网络接口层 B、网际层 C、传输层 D、应用层\"},{\"questioncotent\":\"1.59在中继系统中，中继器处于（ A ）\\nA、物理层 B、数据链路层 C、网络层 D、高层\"},{\"questioncotent\":\"1.60对于带宽为6MHz的信道，若用8种不同的状态来表示数据，在不考虑热噪声的情况下，该信道每秒最多能传送的位数为（ A ）\\nA 36×106  B 18×106  C 48×106  D 96×106\"},{\"questioncotent\":\"1.61就交换技术而言，局域网中的以太网采用的是A\\nA 分组交换技术  B 电路交换技术\\nC 报文交换技术  D 分组交换与电路交换结合技术\"},{\"questioncotent\":\"1.62一个VLAN可以看作是一个 （B） \\nA、冲突域  B、广播域  C、管理域  D、阻塞域\"},{\"questioncotent\":\"1.63在internet的基本服务功能中，远程登录所使用的命令是（B）。\\nA、 ftp    B、 telnet   C、 mail    D、open\"},{\"questioncotent\":\"1.64TCP/IP协议规定为（A）。\\nA、 4层    B、 5层   C、 6层    D、7层\"},{\"questioncotent\":\"1.65Internet网络是一种（D）结构的网络。\\nA、 星型    B、 环型   C、 树型    D、网型\"},{\"questioncotent\":\"1.66下列有关集线器的说法正确的是（B）。\\nA、集线器只能和工作站相连   \\nB、利用集线器可将总线型网络转换为星型拓扑\\nC、集线器只对信号起传递作用\\nD、集线器不能实现网段的隔离\"},{\"questioncotent\":\"1.67 以太网交换机的每一个端口可以看做一个（A）\\nA. 冲突域    B. 广播域   C. 管理域   D. 阻塞域\"},{\"questioncotent\":\"1.68请判断下述中正确的是（ C ）\\nA、 时分多路复用是将物理信道的总带宽分割成若干个子信道，该物理信道同时传输各子信道的信号；\\nB、 虚电路传输方式类似于邮政信箱服务，数据报服务类似于长途电话服务；\\nC、 多路复用的方法中，从性质上来说，频分多路复用较适用于模拟信号传输，而时分多路复用较适用于数字信号传输 \\nD、 即使采用数字通信方式，也还需要同模拟通信方式一样，必须使用调制解调器。\"},{\"questioncotent\":\"1.69IP电话使用的数据交换技术是（C）\\nA电路交换   B报文交换  C分组交换   D包交换\"},{\"questioncotent\":\"1.70在OSI环境中，不同开放系统对等实体之间的通信，需要（N）实体向相邻的上一层（N+1）实体提供一种能力，这种能力称为（B）\\nA、协议   B、服务  C、用户   D、功能\"},{\"questioncotent\":\"1.72下列只能简单再生信号的设备是。\\nA. 网卡　　B. 网桥　　C. 中继器 　D. 路由器\"},{\"questioncotent\":\"1.73网卡是完成( C )功能的 .\\nA. 物理层            B. 数据链路层\\nC. 物理和数据链路层  D. 数据链路层和网络层     \"},{\"questioncotent\":\"1.74当数据由计算机A传送至计算机B时，不参与数据封装工作的是(A).\\nA. 物理层  B. 数据链路层  C. 应用层 D. 网络层           \"},{\"questioncotent\":\"1.75CSMA/CD是IEEE802.3所定义的协议标准，它适用于 ( D ).\\nA.令牌环网  B.令牌总线网  C. 网络互连 D.以太网     \"},{\"questioncotent\":\"1.76100BASE-TX中，所用的传输介质是( B ).    \\nA. 3类双绞线          B. 5类双绞线          \\nC. 1类屏蔽双绞线      D. 任意双绞线\"},{\"questioncotent\":\"1.77随着电信和信息技术的发展，国际上出现了所谓“三网融合”的趋势，下列不属于三网之一的是(D)\\n　A.传统电信网　　 B．计算机网(主要指互联网)\\n　C.有线电视网　　 D．卫星通信网\"},{\"questioncotent\":\"1.78世界上第一个网络是在( B )年诞生。\\nA、1946  B、1969  C、1977  D、1973\"},{\"questioncotent\":\"1.79电话交换系统采用的是( A )技术\\nA.线路交换 B.报文交换 C.分组交换D.信号交换\"},{\"questioncotent\":\"1.80以下属于低层协议的是( B )\\nA、FTP  B、IP  C、UDP  D、TCP\"},{\"questioncotent\":\"1.81TCP/IP层的网络接口层对应OSI的(D)。\\nA.物理层  B.链路层  C.网络层  D.物理层和链路层\"},{\"questioncotent\":\"1.82若网络形状是由站点和连接站点的链路组成的一个闭合环，则称这种拓扑结构为( C )\\nA.星形拓扑    B.总线拓扑  C.环形拓扑     D.树形拓扑\"},{\"questioncotent\":\"1.83以下各项中，不是数据报操作特点的是(  C  )\\nA.每个分组自身携带有足够的信息，它的传送是被单独处理的  B.在整个传送过程中，不需建立虚电路\\nC.使所有分组按顺序到达目的端系统\\nD.网络节点要为每个分组做出路由选择\"},{\"questioncotent\":\"1.84对于基带CSMA/CD而言，为了确保发送站点在传输时能检测到可能存在的冲突，数据帧的传输时延至少要等于信号传播时延的(    B  )\\n  A. 1倍       B. 2倍     C. 4倍        D. 2.5倍\"},{\"questioncotent\":\"1.85以下哪一个设置不是上互联网所必须的（ ）\\nA、IP 地址  B、工作组  C、子网掩码  D、网关\"},{\"questioncotent\":\"1.86 IP电话、电报和专线电话分别使用的数据交换技术是（ B ）\\nA、电路交换技术、报文交换技术和分组交换技术\\nB、分组交换技术、报文交换技术和电路交换技术\\nC、报文交换技术、分组交换技术和电路交换技术\\nD、电路交换技术、分组交换技术和报文交换技术\"},{\"questioncotent\":\"1.87下列交换技术中，节点不采用“存储—转发”方式的是（ A ）。\\nA、电路交换技术   B、报文交换技术\\nC、虚电路交换技术 D、数据报交换技术\"},{\"questioncotent\":\"1.88采用虚电路分组交换方式时，可以省去的阶段是（D）。纠错\\nA、建立逻辑连接  B、结束本次连接\\nC、传输数据      D、建立物理连接\"},{\"questioncotent\":\"1.89下面关于域名的说法正确的是（D ）\\nA、域名专指一个服务器的名字\\nB、域名就是网址  C、域名可以自己任意取\\nD、域名系统按地理域或机构域分层采用层次结构\"},{\"questioncotent\":\"1.90因特网中完成域名地址和IP地址转换的是（B）\\nA、POP   B、DNS   C、SLIP   D、Usenet\"},{\"questioncotent\":\"1.91IPv6 将32位地址空间扩展到（ B ）。\\nA、64 位   B、128 位   C、256 位   D、1024 位\"},{\"questioncotent\":\"1.92双绞线由两根具有绝缘保护层的铜导线按一定密度互相绞在一起组成，这样可以（A ）。\\nA、降低信号干扰的程度    B、降低成本\\nC、提高传输速度          D、没有任何作用\"},{\"questioncotent\":\"1.93在下列传输介质中，那种传输介质的抗电磁干扰性最好？ C\\nA)双绞线  B)同轴电缆  C)光缆  D)无线介质\"},{\"questioncotent\":\"1.94决定局域网特性的三个主要技术是（ A ），（ B ）和（ C ）。其中最为重要（ C ），它对网络特性起着十分重要的作用。\\nA）拓扑结构           B）传输介质\\nC）介质访问控制方法   D）链路距离\"},{\"questioncotent\":\"1.95局域网常用的拓扑结构有（A），（C）和（D）。\\n（A）星型（B）不规则型（C）总线型（D）环型\"},{\"questioncotent\":\"1.96局域网互连主要有（A）和（D）两种形式。\\nA）LAN-LAN   B）LAN-WAN\\nC）WAN-WAN  D）LAN-WAN-LAN\"},{\"questioncotent\":\"1.97常见的网络互连设备有（A），（B）和（C）。\\nA）集线器  B）路由器  C）网桥  D）网关\"},{\"questioncotent\":\"1.98决定使用哪条途径通过子网，应属于下列OSI 的哪一层处理？D\\nA）物理层 B）数据链路层 C）传输层 D）网络层\"},{\"questioncotent\":\"1.99将传输比特流划分为帧，应属于下列OSI 的哪一层处理？  B\\nA）物理层 B）数据链路层 C）传输层 D）网络层\"},{\"questioncotent\":\"1.100两端用户传输文件，应属于下列OSI 的哪一层处理？（D）\\n（A）表示层（B）会话层（C）传输层（D）应用层\"},{\"questioncotent\":\"1.101在OSI 模型中，一个层N 与它的上层（第N+1 层）的关系是什么？ A\\nA)第N 层为第N+1 层提供服务。\\nB)第N+1 层把从第N 层接收到的信息添一个报头。\\nC）第N 层使用第N+1 层第通的服务。\\nD）第N 层与第N+1 层相互没有影响。\"},{\"questioncotent\":\"1.102两个不同的计算机类型能通信，需要（C）。\\nA) 它们符合OSI 模型  \\nB）它们都使用TCP/IP\\nC）它们都是兼容的协议组\\nD）它们一个是Macintosh，一个是Unix 工作站\"},{\"questioncotent\":\"1.103OSI/RM 模型中，哪个层次用来在设备的进程间传递报文?  B\\n（A）网络层（B）传输层（C）会话层（D）表示层\"},{\"questioncotent\":\"1.104关于协议组，下列（C）、（D）叙述正确。\\nA)一给定的协议组能在仅仅一种计算机类型上运行。\\nB)每层为从协议组较高层接收的分组加报头。\\nC)协议组是协议的层次集合。\\nD)每层为下一个最高层提供服务。\"},{\"questioncotent\":\"1.105下列语句（A）、（C）叙述正确。\\nA)数据链路层处理设备到设备的通信。\\nB)网络层处理高层进程间的通信\\nC)传输层处理端结点间的通信\\nD)上述所有的都对。\"},{\"questioncotent\":\"1.106下列说法中哪些正确？C\\n(1)虚电路与电路交换中的电路没有实质不同\\n(2)在通信的两站间只能建立一条虚电路\\n(3)虚电路也有连接建立、数据传输、连接释放三阶段\\n(4)虚电路各个结点不需要为每个分组作路径选择判定\\nA) (1),(2)  B) (2),(3)  C) (3),(4)  D) (1),(4)\"},{\"questioncotent\":\"1.107下列有关计算机网络叙述错误的是_D_。\\nA.利用Internet网可以使用远程的超级计算中心的计算机资源\\nB.计算机网络是在通信协议控制下实现的计算机互联\\nC.建立计算机网络的最主要目的是实现资源共享\\nD.以接入的计算机多少可以将网络划分为广域网、城域网和局域网\"},{\"questioncotent\":\"1.108TCP/IP协议是Internet中计算机之间通信所必须共同遵循的一种__B__。\\nA.信息资源  B.通信规定  C.软件  D.硬件\"},{\"questioncotent\":\"1.109下面__C__命令用于测试网络是否连通。\\nA.telnet   B.nslookup  C.ping  D.ftp\"},{\"questioncotent\":\"1.110在Internet中，用于文件传输的协议是_C__。\\nA.HTML  B.SMTP  C.FTP  D.POP\"},{\"questioncotent\":\"1.111下列说法错误的是__D__。\\nA.电子邮件是Internet提供的一项最基本的服务\\nB.电子邮件具有快速、高效、方便、价廉等特点\\nC.通过电子邮件，可向世界上任何一个角落的网上用户发送信息\\nD.可发送的多媒体信息只有文字和图像\"},{\"questioncotent\":\"1.112在拓扑结构中，关于环型的叙述正确的是_C_。\\nA环中的数据沿着环的两个方向绕环传输\\nB环型拓扑中各结点首尾相连形成一个永不闭合的环\\nC环型拓扑的抗故障性能好\\nD网络中的任意一个结点或一条传输介质出现故障都不会导致整个网络的故障\"},{\"questioncotent\":\"1.113系统可靠性最高的网络拓扑结构是__B_。\\nA.总线型   B.网状型  C.星型   D.树型\"},{\"questioncotent\":\"1.114下列关于广域网的叙述，错误的是__B__。\\nA广域网能连接多个城市或国家并能提供远距离通信\\nB广域网一般可以包含OSI参考模型的7个层次\\nC大部分广域网都采用存储转发方式进行数据交换\\nD广域网可以提供面向连接和无连接两种服务模式\"},{\"questioncotent\":\"1.115广域网提供两种服务模式，对应于这两种服务模式，广域网的组网方式有_C__。\\nA.虚电路方式和总线型方式\\nB.总线型方式和星型方式\\nC.虚电路方式和数据报方式\\nD.数据报方式和总线型方式\"},{\"questioncotent\":\"1.116Internet 是由__B__发展而来的。\\nA．局域网 B．ARPANET  C．标准网 D．WAN\"},{\"questioncotent\":\"1.117对于下列说法，错误的是___D___。\\nA.TCP协议可以提供可靠的数据流传输服务\\nB.TCP协议可以提供面向连接的数据流传输服务\\nC.TCP协议可以提供全双工的数据流传输服务\\nD.TCP协议可以提供面向非连接的数据流传输服务\"},{\"questioncotent\":\"1.118以下关于TCP/IP协议的描述中，错误的是 A 。\\nA.TCP/IP协议属于应用层\\nB.TCP、UDP协议都要通过IP协议来发送、接收数据\\nC.TCP协议提供可靠的面向连接服务\\nD.UDP协议提供简单的无连接服务\"},{\"questioncotent\":\"1.119下列关于IP地址的说法中错误的是_C_。\\nA.一个IP地址只能标识网络中的唯一的一台计算机\\nB.IP地址一般用点分十进制表示\\nC.地址205.106.286.36是一个非法的IP地址\\nD.同一个网络中不能有两台计算机的IP地址相同\"},{\"questioncotent\":\"1.120一个IP地址包含网络地址与__C__。\\nA.广播地址   B.多址地址   \\nC.主机地址   D.子网掩码\"},{\"questioncotent\":\"1.121在以下四个WWW网址中，哪一个网址不符合WWW网址书写规则__B__。\\nA.www.163.com     B.www.nk.cn.edu\\nC.www.863.org.cn   D.www.tj.net.jp\"},{\"questioncotent\":\"1.122OSPF协议是   A     。\\nA．域内路由协议    B．域间路由协议 \\nC．无域路由协议  D．应用层协议\"},{\"questioncotent\":\"1.123在虚电路服务中分组的顺序   A    。\\nA．总是按发送顺序到达目的站   \\nB. 总是与发送顺序相反到达目的站\\nC. 到达目的站时可能不按发送顺序\\nD. 到达顺序是任意的\"},{\"questioncotent\":\"1.124下面属于路由选择协议的是  B   。\\nA．TCP/IP B．RIP C．IPX/SPX D．AppleTalk\"},{\"questioncotent\":\"1.125在OSI参考模型中能实现路由选择、拥塞控制与互联功能的层是  C  。\\nA．传输层 B．应用层 C．网络层 D．物理层\"},{\"questioncotent\":\"1.126协议是  D  之间进行通信的规则或约定。\\nA．同一结点上下层  B．不同结点\\nC.相邻实体          D．不同结点对等实体\"},{\"questioncotent\":\"1.127电子邮件服务器之间相互传递邮件通常使用的协议是__B___。\\nA)PPP    B)SMTP   C)FTP   D)EMAIL\"},{\"questioncotent\":\"1.128下列哪种连接方式采用上、下行不对称的高速数据调制技术___C_.\\nA) ISDN   B)Cable Modem   C) ADSL   D) UML\"},{\"questioncotent\":\"1.129在TCP/IP协议簇中，__A__协议属于网络层的无连接协议。\\nA．IP　　B．SMTP　　C．UDP　　D．TCP\"},{\"questioncotent\":\"1.130在TCP/IP协议簇中，__C__属于自上而下的第二层。\\nA．ICMP　　B．SNMP　C．UDP　　 D．IP\"},{\"questioncotent\":\"1.131在B类网络中，可以分配的主机地址是多?__D__\\nA．1022　　B．4094　　C．32766　　 D．65534 \"},{\"questioncotent\":\"1.132以下网络地址中属于私网地址的是__C__　　    \\nA．172.15.22.1　　　B．128.168.22.1\\nC．172.16.22.1　　　D．192.158.22.1 \"},{\"questioncotent\":\"1.133设有2条路由21.1.193.0/24和21.1.194.0/24，如果进行路由汇聚，覆盖这2条路由的地址是_C_。\\nA．21.1.200.0/22　　　B．21.1.192.0/23\\nC．21.1.192.0/21　　　D．21.1.224.0/20 \"},{\"questioncotent\":\"1.134下面关于IPv6协议优点的描述中，准确的是B\\n1.135RARP协议用于__C__。\\nA．根据IP地址查询对应的MAC地址\\nB．IP协议运行中的差错控制\\nC．把MAC地址转换成对应的IP地址\\nD．根据交换的路由信息动态生成路由表 \\nB．IPv6协议解决了IP地址短缺的问题\\nC．IPv6协议支持通过卫星链路的Intemet连接\\nD．IPv6协议支持光纤通信 \"},{\"questioncotent\":\"1.136下面关于ICMP协议的描述中，正确的是(C)。\\nA．ICMP协议根据MAC地址查找对应的IP地址\\nB．ICMP协议把公网的IP地址转换为私网的IP地址\\nC．ICMP协议用于控制数据报传送中的差错情况\\nD．ICMP协议集中管理网络中的IP地址分配 \"},{\"questioncotent\":\"1.137某公司的几个分部在市内的不同地点办公，各分部联网的最好解决方案是  D  。\\nA．公司使用统一的网络地址块，各分部之间用以太网相连\\nB．公司使用统一的网络地址块，各分部之间用网桥相连\\nC．各分部分别申请一个网络地址块，用集线器相连\\nD．把公司的网络地址块划分为几个子网，各分部之间用路由器相连\"},{\"questioncotent\":\"1.138下面对三层交换机的描述中最准确的是_C_。\\nA．使用X.25交换机\\nB．用路由器代替交换机\\nC．二层交换，三层转发\\nD．由交换机识别MAC地址进行交换\"},{\"questioncotent\":\"1.139在Windows操作系统中可以通过安装_A_组件创建FTP站点。\\nA．IIS　　　B．IE　　　C．WWW　　 D．DNS\"},{\"questioncotent\":\"1.140TCP/IP网络中常用的距离矢量路由协议是 D\\nA. ARP  B. ICMP  C. OSPF  D. RIP\"},{\"questioncotent\":\"1.141下面有关VLAN的说法正确的是  (A) 。\\nA. 一个VLAN组成一个广播域 \\nB. 一个VLAN是一个冲突域  \\nC. 各个VLAN之间不能通信  \\nD. VLAN之间必须通过服务器交换信息\"},{\"questioncotent\":\"1.142在OSI层次体系结构中,实际的通信是在( A )实体间进行的 .\\nA 物理层   B 数据链路层  C 网络层  D 传输层\"},{\"questioncotent\":\"1.143下面关于CSMA/CD网络的叙述正确的是（A）\\nA 任何一个节点的通信数据要通过整个网络，并且每—个节点都接收并检验该数据\\nB 如果源节点知道目的地的IP和MAC地址的话，信号是直接送往目的地\\nC —个节点的数据发往最近的路由器，路由器将数据直接发到目的地\\nD 信号都是以广播方式发送的\"},{\"questioncotent\":\"1.144关于路由器，下列说法中正确的是 （ C）。 \\nA. 路由器处理的信息量比交换机少，因而转发速度比交换机快 \\nB. 对于同一目标，路由器只提供延迟最小的最佳路由 \\nC. 通常的路由器可以支持多种网络层协议，并提供不同协议之间的分组转换 \\nD. 路由器不但能够根据逻辑地址进行转发，而且可以根据物理地址进行转发\"},{\"questioncotent\":\"1.146下列有关虚电路服务的叙述中不正确的是【C】\\nA.OSI中面向连接的网络服务就是虚电路服务\\nB.SNA采用的是虚电路操作支持虚电路服务的方式\\nC.以数据报方式操作的网络中不提供虚电路服务\\nD.在ARPANET内部使用数据报操作方式，但可以向端系统提供数据报和虚电路两种服务\"},{\"questioncotent\":\"1.147使用双绞线作为传输介质，适用于下列哪种类型的以太网( B)\\nA．10Base-5        B．10/100Base-T \\nC．10/100Base-F    D．10Base-2  \"},{\"questioncotent\":\"1.148用TCP／IP协议的网络在传输信息时，如果出了错误需要报告，采用的协议是( A ) \\nA．ICMP   B．HTTP C．TCP    D．SMTP\"},{\"questioncotent\":\"1.149采用半双工通信方式，数据传输的方向为( C ) \\nA．可以在两个方向上同时传输 \\nB．只能在一个方向上传输 \\nC．可以在两个方向上传输，但不能同时进行\\nD．以上均不对\"},{\"questioncotent\":\"1.150采用全双工通信方式，数据传输的方向为(A )\\nA．可以在两个方向上同时传输 \\nB．只能在一个方向上传输 \\nC．可以在两个方向上传输，但不能同时进行 \\nD．以上均不对\"},{\"questioncotent\":\"1.151以下各项中，不是IP数据报操作特点的是( C ) \\nA．每个分组自身携带有足够的信息，它的传送是被单独处理的 \\nB．在整个传送过程中，不需建立虚电路 \\nC．使所有分组按顺序到达目的端系统 \\nD．网络节点要为每个分组做出路由选择\"},{\"questioncotent\":\"1.152对IP数据报分片的重组通常发生在（ B）上。\\nA．源主机                 B．目的主机\\nC．IP数据报经过的路由器  D．目的主机或路由器\"},{\"questioncotent\":\"1.153下面接入方式中哪种传输速率最快（  E）。\\nA．电话拨号    B．DDN专线\\nC．ADSLD光纤同轴混合（HFC）\\nE．光纤接入    F．无线接入\"},{\"questioncotent\":\"1.154关于路由器，下列说法中错误的是   D  . \\nA．路由器可以隔离子网，抑制广播风暴      　   \\nB．路由器可以实现网络地址转换\\nC．路由器可以提供可靠性不同的多条路由选择  　\\nD．路由器只能实现点对点的传输\"},{\"questioncotent\":\"1.155在HFC网络中，Cable Modem的作用是 B。\\nA．用于调制解调和拨号上网    　         \\nB．用于调制解调以及作为以太网接口\\nC．用于连接电话线和用户终端计算机    　  \\nD．连接ISDN接口和用户终端计算机\"},{\"questioncotent\":\"1.156关于ARP表，以下描述中正确的是   B . \\nA．提供常用目标地址的快捷方式来减少网络流量\\nB．用于建立IP地址到MAC地址的映射\\nC．用于在各个子网之间进行路由选择      　\\nD．用于进行应用层信息的转换\"},{\"questioncotent\":\"1.157当一个以太网中的一台源主机要发送数据给同一网络中的另一台目的主机时，以太帧头部的目的地址是          ，IP包头部的目的地址         。                                                 \\n A．路由器的IP地址      B．路由器的MAC地址\\n C．目的主机的MAC地址  D．目的主机的IP地址\"},{\"questioncotent\":\"1.158下列关于IPv4地址的描述中错误是   D   \\nA．IP地址的总长度为32位  \\nB．每一个IP地址都由网络地址和主机地址组成 \\nC．一个C类地址拥有8位主机地址，可给254台主机分配地址 \\nD．A类地址拥有最多的网络数\"},{\"questioncotent\":\"1.159通信信道的每一端可以是发送端，也可以是接受端，信息可由这一端传输到另一端，也可以从那一端传输到这一端，在同一时刻，信息可以每一端进行收发的通信方式为    C           \\nA单工通信    B半双工  C全双工   D模拟\"},{\"questioncotent\":\"1.160在缺省情况下，交换机的所有端口       ，连接在不同交换机上的，属于同一VLAN的数据帧必须通过       传输。\\nA．处于直通状态　 B．属于同一VLAN　\\nC．属于不同VLAN 　D．Trunk链路\"},{\"questioncotent\":\"1.161以太网100BASE-FX标准规定的传输介质是D\\nA．3类UTP　B．5类UTP　C．无线介质　D．光纤\"},{\"questioncotent\":\"1.162路由器在两个网段之间转发数据包时，读取其中的   A  地址来确定下一跳的转发路径。                                                   \\nA. 目标IP     B. MAC     C. 源IP    D. ARP\"},{\"questioncotent\":\"1.163以下对IP地址分配中描述不正确的是（ B ）.\\nA、网络ID不能全为1或全为0   \\nB、同一网络上每台主机必须有不同的网络ID\\nC、网络ID不能以127开头    \\nD、同一网络上每台主机必须分配唯一的主机ID\"},{\"questioncotent\":\"1.164对网际控制协议（ICMP）描述错误的是（ B ）.\\nA、ICMP封装在IP数据报的数据部分  \\nB、ICMP消息的传输是可靠的\\nC、ICMP是IP协议的必需的一个部分  \\nD、ICMP可用来进行拥塞控制\"},{\"questioncotent\":\"1.165802.3以太网最大可传送的帧（数据）长度为_D_个8位组。\\nA、64  B、32  C、256  D、1500\"},{\"questioncotent\":\"1.166在IP协议中用来进行组播的IP地址是  C  .\\nA. A类     B. C类      C. D类     D. E类\"},{\"questioncotent\":\"1.167随着微型计算机的广泛应用，大量的微型计算机是通过局域网连入到广域网的，而局域网与广域网的互联一般是通过(_B_)设备实现的。\\nA.Ethernet交换机B.路由器C.网桥D.电话交换机\"},{\"questioncotent\":\"1.168IPv4版本的因特网总共有C个A类地址网络。\\nA．65000  B．200万   C．126  D．128\"},{\"questioncotent\":\"1.169在下列各项中，一个计算机网络的3个主要组成部分是__B__。\\n1、若干数据库2、一个通信子网 3、一系列通信协议 \\n4、若干主机  5、电话网   6、大量终端\\nA.1、2、3  B.2、3、4  C.3、4、5  D.2、4、6\"},{\"questioncotent\":\"1.170下面对应用层协议说法正确的有（B ）\\nA.DNS 协议支持域名解析服务，其服务端口号为80。\\nB.TELNET 协议支持远程登陆应用。\\nC.电子邮件系统中，发送电子邮件和接收电子邮件均采用SMTP 协议。\\nD.FTP 协议提供文件传输服务，并仅使用一个端口。\"},{\"questioncotent\":\"1.171在TCP 协议中，建立连接时需要将（ ）字段中的（ ）标志位位置1。    D\\nA.保留 ACK B.保留 SYN  C.偏移 ACK  D.控制 SYN\"},{\"questioncotent\":\"1.172一台主机正在检测所收到的帧的校验和，这个动作发生在OSI模型的哪一层？\\nA、物理层 B、数据链路层C、网络层 D、传输层\"},{\"questioncotent\":\"1.173数据解封装的过程是   B  .\\nA段—包—帧—流—数据  B流—帧—包—段—数据\\nC数据—包—段—帧—流 D数据—段—包—帧—流\"},{\"questioncotent\":\"1.174一台十六口交换机，每端口均为10/100M全双工自适应，则该交换机的总线带宽为   D  .\\nA、10M  B、100M C、1.6G  D、3.2G\"},{\"questioncotent\":\"1.174一台十六口交换机，每端口均为10/100M全双工自适应，则该交换机的总线带宽为   D  .\\nA、10M  B、100M C、1.6G  D、3.2G\"},{\"questioncotent\":\"1.176当路由器接收的IP报文中的目标网络不在路由表中时，将采取的策略是   A   .\\nA、丢掉该报文\\nB、将该报文以广播的形式从该路由器的所有端口发出\\nC、将报文退还给上级设备\\nD、向某个特定的路由器请求路由\"},{\"questioncotent\":\"1.177收音机的信号传输属于   A   .\\nA、单工  B、半双工  C、全双工\"},{\"questioncotent\":\"1.178出于安全的考试，管理员希望阻止由外网进入的PING嗅探，那么管理员需要阻止哪一类协议？（D）\\nA、TCP  B、UDP  C、IP D、ICMP\"},{\"questioncotent\":\"1.179当数据在网络层时，称之为  B   .\\nA、Segment  B、Packet C、Bit D、Frame\"},{\"questioncotent\":\"1.180交换机收到一个帧，但该帧的目标地址在其MAC地址表中找不到对应，交换机将   C  .\\nA、丢弃  B、退回  C、洪泛  D、转发给网关\"},{\"questioncotent\":\"1.181以下有关以太网MAC地址说法正确的是  A .\\nA、MAC地址全球唯一 B、MAC地址56位\\nC、MAC地址中前八位十六进制数由IEEE统一分配，后八位十六制数由厂商自行分配\\nD、Internet中每个设备都有MAC地址\"},{\"questioncotent\":\"1.182下列地址中哪些是私有地址    C   .\\nA、172.32.0.1      B、172.0.0.1\\nC、172.16.0.255  D、172.15.255.255\"}],\"02\":[{\"questioncotent\":\"尽管磁盘是一种可共享设备，但（）仍只有一个作业能启动磁盘。\"},{\"questioncotent\":\"操作系统为用户提供三种类型的使用接口，它们是命令方式和系统调用和图形用户界面。\"},{\"questioncotent\":\"主存储器与外围设备之间的数据传送控制方式有程序直接控制、中断驱动方式、DMA方式和通道控制方式。\"},{\"questioncotent\":\"在响应比最高者优先的作业调度算法中，当各个作业等待时间相同时，运行时间短的作业将得到优先调度；当各个作业要求运行的时间相同时，等待时间长的作业得到优先调度。\"},{\"questioncotent\":\"当一个进程独占处理器顺序执行时，具有两个特性：封闭性和可再现性。\"},{\"questioncotent\":\"程序经编译或汇编以后形成目标程序，其指令的顺序都是以零作为参考地址，这些地址称为逻辑地址。\"},{\"questioncotent\":\"文件的逻辑结构分流式文件和记录式文件二种。\"},{\"questioncotent\":\"进程由程度、数据和FCB组成。\"},{\"questioncotent\":\"对信号量S的操作只能通过原语操作进行，对应每一个信号量设置了一个等待队列。\"},{\"questioncotent\":\"操作系统是运行在计算机裸机系统上的最基本的系统软件。\"},{\"questioncotent\":\"虚拟设备是指采用SPOOLING技术，将某个独享设备改进为供多个用户使用的的共享设备。\"},{\"questioncotent\":\"文件系统中，用于文件的描述和控制并与文件一一对应的是文件控制块。\"},{\"questioncotent\":\"段式管理中，以段为单位 ，每段分配一个连续区。由于各段长度不同，所以这些存储区的大小不一，而且同一进程的各段之间不要求连续。\"},{\"questioncotent\":\"逻辑设备表（LUT）的主要功能是实现设备独立性。\"},{\"questioncotent\":\"在采用请求分页式存储管理的系统中，地址变换过程可能会因为缺页和越界等原因而产生中断。\"},{\"questioncotent\":\"文件的物理结构分为顺序文件、索引文件和索引顺序文件。\"},{\"questioncotent\":\"段的共享是通过共享段表实现的。\"},{\"questioncotent\":\"文件的物理结构分为顺序文件、索引文件和索引顺序文件。\"},{\"questioncotent\":\"所谓设备控制器，是一块能控制一台或多台外围设备与CPU并行工作的硬件。\"},{\"questioncotent\":\"UNIX的文件系统空闲空间的管理是采用成组链接法。\"},{\"questioncotent\":\"分页管理储管理方式能使存储碎片尽可能少，而且使内存利用率较高，管理开销小。\"},{\"questioncotent\":\"计算机操作系统是方便用户、管理和控制计算机软硬件资源的系统软件。\"},{\"questioncotent\":\"操作系统目前有五大类型：批处理操作系统、分时操作系统、实时操作系统、网络操作系统和分布式操作系统。\"},{\"questioncotent\":\"按文件的逻辑存储结构分，文件分为有结构文件，又称为记录式文件和无结构文件，又称流式文件。\"},{\"questioncotent\":\"主存储器与外围设备之间的信息传送操作称为输入输出操作。\"},{\"questioncotent\":\"在设备管理中，为了克服独占设备速度较慢、降低设备资源利用率的缺点，引入了虚拟分配技术，即用共享设备模拟独占设备。\"},{\"questioncotent\":\"常用的内存管理方法有分区管理、页式管理、段式管理和段页式管理。\"},{\"questioncotent\":\"动态存储分配时，要靠硬件地址变换机构实现重定位。\"},{\"questioncotent\":\"在存储管理中常用虚拟存储器方式来摆脱主存容量的限制。\"},{\"questioncotent\":\"在请求页式管理中，当硬件变换机构发现所需的页不在内存时，产生缺页中断信号，中断处理程序作相应的处理。\"},{\"questioncotent\":\"置换算法是在内存中没有空闲页面时被调用的，它的目的是选出一个被淘汰的页面。如果内存中有足够的空闲页面存放所调入的页，则不必使用置换算法。\"},{\"questioncotent\":\"在段页式存储管理系统中，面向用户的地址空间是段式划分，面向物理实现的地址空间是页式划分。\"},{\"questioncotent\":\"文件的存储器是分成大小相等的物理块，并以它为单位交换信息。\"},{\"questioncotent\":\"虚拟设备是通过SPOOLing技术把独占设备变成能为若干用户共享的设备。\"},{\"questioncotent\":\"缓冲区的设置可分为单缓冲、双缓冲、多缓冲和缓冲池。\"},{\"questioncotent\":\"在多道程序环境中，用户程序的相对地址与装入内存后的实际物理地址不同，把相对地址转换为物理地址，这是操作系统的地址重地位功能。\"},{\"questioncotent\":\" 在操作系统中，进程是一个资源分配的基本单位，也是一个独立运行和调度\"},{\"questioncotent\":\"的基本单位。\"},{\"questioncotent\":\"在信号量机制中，信号量S \\u003e 0时的值表示可用资源数目；若S \\u003c 0，则表示等待该资源的进程数，此时进程应阻塞。\"},{\"questioncotent\":\"操作系统提供给编程人员的唯一接口是系统调用。\"},{\"questioncotent\":\"设备从资源分配角度可分为独占设备，共享设备和虚拟设备。\"},{\"questioncotent\":\"设备管理的主要任务是控制设备和CPU之间进行I/O操作。\"},{\"questioncotent\":\"常用的文件存取方法有顺序存取法，随机存取法和按键存取法。 \"},{\"questioncotent\":\"在页面置换算法中最有效的一种称为LRU算法。\"},{\"questioncotent\":\"地址变换机构的基本任务是将虚地址空间中的逻辑地址变换为内存中的物理地址。\"},{\"questioncotent\":\"在 UNIX 系统中采用的页面置换算法是页面缓冲算法。\"},{\"questioncotent\":\"现代操作系统的两个重要特征是并发和共享。\"},{\"questioncotent\":\"为文件 file.c 的同组用户增加修改权限的 UNIX 命令为chmod  g+w  file.c。\"},{\"questioncotent\":\"显示目录 mydir 中文件的详细信息的 UNIX 命令为Ls –l  mydir。\"},{\"questioncotent\":\"操作系统的基本类型有批处理操作系统，分时操作系统和实时操作系统三种。\"},{\"questioncotent\":\"采用对换方式在将进程换出时，应首先选择处于阻塞且优先权低的进程换出内存。\"},{\"questioncotent\":\"能方便实现信息共享的存储管理办法有段式和段页式。\"},{\"questioncotent\":\"选择距当前磁头最近，且方向一致的磁盘调度算法循环扫描算法。\"},{\"questioncotent\":\"在页面置换算法中可实现的最有效的一种称为LRU。\"},{\"questioncotent\":\"UNIX 系统向用户提供的用于创建新进程的系统调用是fork()。\"},{\"questioncotent\":\"UNIX 系统中用于建立无名管道的系统调用是pipe()。\"},{\"questioncotent\":\"在成组链结法中，将第一组的空闲块号和该组的空闲块数目  记入到                内存的工作栈中，作为当前可供分配的空闲盘块号。\"},{\"questioncotent\":\"现代操作系统的两个重要特征是并发和共享。\"},{\"questioncotent\":\"为文件 file 增加执行权限的 UNIX 命令为chmod  +x  file。\"},{\"questioncotent\":\"显示目录 mydir 中文件的详细信息的 UNIX 命令为ls –l  mydir。\"},{\"questioncotent\":\"在动态分区式内存分配算法中，倾向于优先使用低地址部分空闲区的算法是首次适应算法  ；能使内存空间中空闲区分布较均匀的算法是循环首次适应算法。\"},{\"questioncotent\":\"在分时系统中，当用户数目为100时，为保证响应时间不超过2秒，此时时间片最大应为20ms。分时系统采用的调度方法是时间片轮转调度算法。\"},{\"questioncotent\":\"常用的进程通信方式有管道、共享存储区、消息机制和邮箱机制。\"},{\"questioncotent\":\"正在执行的进程等待I/O操作，其状态将由执行状态变为阻塞状态。\"},{\"questioncotent\":\"页是信息的物理单位，进行分页是出于系统管理  的需要；段是信息的逻辑单位，分段是出于用户  的需要。\"},{\"questioncotent\":\"存储管理中的快表是指联想存储器。\"},{\"questioncotent\":\"分段保护中的越界检查是通过段表寄存器  中存放的段表长度  和段表中的段长                 等数据项。\"},{\"questioncotent\":\"在请求调页系统中的调页策略有预调入策略，它是以预测为基础的；另一种是请求调入，由于较易实现，故目前使用较多。\"},{\"questioncotent\":\"若干个事件在同一时刻发生称为并行，若干个事件在同一时间间隔内发生称为并发。\"},{\"questioncotent\":\"使用缓冲区能有效地缓和I/O设备和CPU之间速度不匹配的矛盾。\"},{\"questioncotent\":\"用户编写的程序与实际使用的物理设备无关，而由操作系统负责地址的重定位，我们称之为设备无关性（设备独立性）。\"},{\"questioncotent\":\"用户是通过命令方式或者程序接口向计算机发出请求的。\"},{\"questioncotent\":\"在操作系统中的异步性主要是指在系统中进程推进的顺序是走走停停。\"},{\"questioncotent\":\"进程间通信的方式有管道、共享存储区和消息传递方式。\"},{\"questioncotent\":\"计算机操作系统是方便用户、管理和控制计算机系统资源的系统软件。\"},{\"questioncotent\":\"在多道程序环境中，用户程序的相对地址与装入内存后的实际物理地址不同，把相对地址转换为物理地址，这是操作系统的地址重地位功能。\"},{\"questioncotent\":\"操作系的动态分区管理内存分配算法有首次适应算法、循环首次适应算法、和最佳适应算法。\"},{\"questioncotent\":\"动态存储分配时，要靠硬件地址变换机构实现重定位。\"},{\"questioncotent\":\"在存储管理中常用虚拟存储器方式来摆脱主存容量的限制。\"},{\"questioncotent\":\"在请求页式管理中，当硬件变换机构发现所需的页不在内存时，产生缺页中断信号，中断处理程序作相应的处理。\"},{\"questioncotent\":\"置换算法是在内存中没有空闲页面时被调用的，它的目的是选出一个被淘汰的页面。如果内存中有足够的空闲页面存放所调入的页，则不必使用置换算法。\"},{\"questioncotent\":\"在段页式存储管理系统中，面向用户的地址空间是段式划分，面向物理实现的地址空间是页式划分。\"},{\"questioncotent\":\"文件的存储器是分成大小相等的物理块，并以它为单位交换信息。\"},{\"questioncotent\":\"通道是一个独立于CPU的专管I/O的处理机，它控制 设备与内存之间的信息交换。\"},{\"questioncotent\":\"缓冲区的设置可分为单缓冲 、双缓冲、循环缓冲和缓冲池。 其中关于缓冲池的操作有提取输入、提取输出、收容输入和收容输出。\"},{\"questioncotent\":\"操作系统为用户编程所提供的接口是系统调用。\"},{\"questioncotent\":\"文件的逻辑结构分为流式文件、顺序文件、索引文件和索引顺序文件。\"},{\"questioncotent\":\"进程由程序、数据和PCB组成。\"},{\"questioncotent\":\"一张1.44M的软盘，其FAT表占的空间为2.16K。\"},{\"questioncotent\":\"缓冲池包括空白缓冲队列、装满输入数据的缓冲队列和装满输出数据的缓冲队列三种队列。\"},{\"questioncotent\":\"在生产者—消费者问题中，消费者进程的两个wait原语的正确顺序为\"},{\"questioncotent\":\"Wait(full)；和wait(mutex);。\"},{\"questioncotent\":\"段式管理中，提供二维维的地址结构。以段为单位进行空间分配，每段分配一个连续内存区。\"},{\"questioncotent\":\"逻辑设备表（LUT）的主要功能是实现逻辑设备到物理设备的映射。\"},{\"questioncotent\":\"在一个请求分页系统中，假如系统分配给一个作业的物理块数为3，且此作业的页面走向为2，3，2，1，5，2，4，5，3，2，5，2。OTP算法的页面置换次数为3  ，LRU算法的页面置换次数为4，CLOCK算法的页面置换次数为5\\t。\"},{\"questioncotent\":\"进程间通信的类型有：共享存储区、管道机制、消息队列和信箱机制。\"},{\"questioncotent\":\"在响应比最高者优先的作业调度算法中，当各个作业等待时间相同时，运行时间短的作业将得到优先调度；当各个作业要求运行的时间相同时，等待时间长的作业得到优先调度。\"},{\"questioncotent\":\"有三个同时到达的作业J1，J2和J3，它们的执行时间分别是T1，T2和T3，且T1\\u003cT2\\u003cT3。系统按单道方式运行且采用短作业优先算法，则平均周转时间是(3*T1+2*T2+T3)/3。　\"},{\"questioncotent\":\"位示图是利用二进制的一个位来表示磁盘中一个盘块的使用情况。\"},{\"questioncotent\":\"在SPOOLing系统中，进程执行输出的过程是：将进程产生的数据送到磁盘的输出井，输出程序再将数据提出，通过内存的输出缓冲区送往输出设备。\"},{\"questioncotent\":\"I/O控制的方式有程序直接控制方式、中断控制方式、DMA方式和通道方式。\"},{\"questioncotent\":\"在首次适应算法中，要求空闲分区按地址递增顺序链接成空闲分区链；在最佳适应算法中是按空闲分区从小到大顺序形成空闲分区链。\"},{\"questioncotent\":\"文件的物理结构有顺序文件、链接文件文件和索引文件三种。\"},{\"questioncotent\":\"现代操作系统的特征是并发、共享、虚拟和异步性。\"},{\"questioncotent\":\"产生死锁的四个必要条件是互斥条件和请求和保持，不剥夺条件和环路条件。\"},{\"questioncotent\":\"操作系统的五大功能是CPU管理、存储管理、设备管理、文件系统和用户接口。\"},{\"questioncotent\":\"在操作系统中进程和线程的区别是：拥有资源。\"},{\"questioncotent\":\"文件系统的基本任务是实现按名存取。\"},{\"questioncotent\":\"静态链接是在程序编译时进行，动态链接是在执行时进行。\"},{\"questioncotent\":\"文件的保护是通过存取控制表来实现的。\"},{\"questioncotent\":\"文件共享的方式有基于索引结点的方式和利用符号链。\"},{\"questioncotent\":\"．UNIX系统对空闲空间的管理方式采用__成组链接法__。\"},{\"questioncotent\":\"一次只允许一个进程访问的资源叫临界资源。\"},{\"questioncotent\":\"在操作系统中进程是一个拥有资源的单位，也是一个调度和执行的基本单位。\"},{\"questioncotent\":\"在批处理兼分时的系统中，往往由分时系统控制的作业称为前台作业，而由批处理系统控制的作业称为后台作业。\"},{\"questioncotent\":\"操作系统为用户提供两种类型的使用接口，它们是操作员（或用户）接口和程序员（或程序）接口。\"},{\"questioncotent\":\"操作系统中，进程可以分为系统进程和用户进程两类。\"},{\"questioncotent\":\"用户调用建立和打开（可交换次序）文件操作来申请对文件的使用权。\"},{\"questioncotent\":\"主存储器与外围设备之间的信息传送操作称为输入输出操作。\"},{\"questioncotent\":\"当一个进程独占处理器顺序执行时，具有两个特性：封闭性和可再现性。\"},{\"questioncotent\":\"UNIX的shell有两层含义，一是指由shell命令组成的Shell命令语言；二是指该命令的解释程序。\"},{\"questioncotent\":\"操作系统是运行在计算机基本硬件（或：硬件）系统上的最基本的系统软件。\"},{\"questioncotent\":\"程序经编译或汇编以后形成目标程序，其指令的顺序都是以零作为参考地址，这些地址称为相对地址（或：逻辑地址、虚拟地址）。\"},{\"questioncotent\":\"文件的逻辑结构分字符流式文件和记录式文件二种。\"},{\"questioncotent\":\"一个作业从进入系统到运行结束，一般要经历“后备”、“执行”和“完成”三个不同状态。\"},{\"questioncotent\":\"Windows NT操作系统结构由两个部分构成：一是保护子系统，另一是执行体。\"},{\"questioncotent\":\"目前硬盘中最常使用的两种接口是IDE接口和SCSI接口。\"},{\"questioncotent\":\"用户要求计算机系统所做的工作的集合称为作业。\"},{\"questioncotent\":\"在存贮器可变式分区管理中，对内存状态的记录和分配管理通常可采用表格法、位图法和链表法。\"},{\"questioncotent\":\"进程由程度、数据集合、进程控制块及相关表格组成。\"},{\"questioncotent\":\"对信号量S的操作只能通过P、V操作进行，对应每一个信号量设置了一个等待队列。\"},{\"questioncotent\":\"虚拟设备是指采用某种I／O技术，将某个独占设备改进为多个用户可共享的设备。\"},{\"questioncotent\":\"文件系统中，用于文件的描述和控制并与文件一一对应的是文件控制块（或：FCB）。\"},{\"questioncotent\":\"所谓通道，是一块能控制一台或多台外围设备与CPU并行工作的硬件。\"},{\"questioncotent\":\"用户是通过命令接口或者程序接口向计算机发出请求的。\"},{\"questioncotent\":\"在所有主机操作系统都是UNIX系统的TCP／IP网络中，进行远程注册的命令是rlogin。\"},{\"questioncotent\":\"在TCP／IP网络中，UNIX操作系统下发送电子邮件的命令是Mail。\"},{\"questioncotent\":\"操作系统的主要设计目标是方便用户使用或界面友好和系统能高效工作或资源利用率高。\"},{\"questioncotent\":\"当一个进程完成了特定的任务后，系统收回这个进程所占的工作区或主存空间或资源和取消该进程的进程控制块(PCB)就撤消了该进程。\"},{\"questioncotent\":\"单个分区存储管理仅适用于个人计算机(单用户)和专用计算机(单道，单作业)系统。\"},{\"questioncotent\":\"每个索引文件都必须有一张索引表，其中每个登记项用来指出一个逻辑记录的存放位置 或指针 或首地址。\"},{\"questioncotent\":\"实现SPOOL系统时必须在磁盘上辟出称为输入井和输出井 (可交换次序)的专门区域，以存放作业信息和作业执行结果。\"},{\"questioncotent\":\"一个理想的作业调度算法应该是既能提高系统效率或吞吐量高 及时得到计算结果又能使进入系统的作业周转时间短等_。\"},{\"questioncotent\":\"计算机网络的发展和演变可概括为   面向终端的计算机网络    .   计算机—计算机网络   和开放式标准化网络三个阶段。\"},{\"questioncotent\":\"收发电子邮件，属于ISO/OSI RM中 ___ 应用 __层的功能。\"},{\"questioncotent\":\"在TCP/IP层次模型中与OSI参考模型第四层相对应的主要协议有  TCP（传输控制协议） 和  UDP（用户数据报协议） ，其中后者提供无连接的不可靠传输服。\"},{\"questioncotent\":\"常见的实用网络协议有TCP/IP、IPX/SPX和NetBEUI。\"},{\"questioncotent\":\"计算机网络中常用的三种有线媒体是 同轴电缆. 双绞线  和 光纤。\"},{\"questioncotent\":\"计算机网络系统由负责_信息传递__的通信子网和负责信息处理的__资源__子网组成\"},{\"questioncotent\":\"OSI模型有_物理层___._数据链路层___._网络层___. 运输层. 会话层. 表示层和应用层七个层次\"},{\"questioncotent\":\"在局域网参考模型中，__ LLC __与媒体无关，_ MAC ___则依赖于物理媒体和拓扑结构\"},{\"questioncotent\":\"国内最早的四大网络包括原邮电部的ChinaNet. 原电子部的ChinaGBN. 教育部的__ CERnet (或中国教育科研网)___和中科院的CSTnet。\"},{\"questioncotent\":\"复盖一个国家，地区或几个洲的计算机网络称为  广域网，在同一建筑或复盖几公里内范围的网络称为       局域网   ，而介于两者之间的是城域网。\"},{\"questioncotent\":\"现行解决“最后一公里”问题的接入技术有  综合业务数字网 、  高速数字接入设备  、  同轴电缆宽调制解调器  、 局域网  、  无线接入  。  \"},{\"questioncotent\":\"OSI参考模型从高到低分别是  应用层、 表示层、 会话层 、传输层 、网络层、 数据链路层 和物理层。\"},{\"questioncotent\":\"串行数据通信的方向性结构有三种，即单工、  半双工  和  全双工  。   \"},{\"questioncotent\":\"在 TCP/IP 层次模型的第三层 ( 网络层 ) 中包括的协议主要有 IP 、 ICMP 、 ARP  及  RARP  。\"},{\"questioncotent\":\"最常用的两种多路复用技术为 _频分多路复用 FDM _和 _时分多路复用 TDM _ ，其中，前者是同一时间同时传送多路信号，而后者是将一条物理信道按时间分成若干个时间片轮流分配给多个信号使用。\"},{\"questioncotent\":\"计算机网络系统由通信子网和___资源____子网组成。\"},{\"questioncotent\":\"通信系统中，称调制前的电信号为____基带____信号，调制后的信号为调制信号。\"},{\"questioncotent\":\"ISP是掌握Internet____接口____的机构。\"},{\"questioncotent\":\".数据传输有两种同步的方法：同步传输和异步传输。其中异步传输采用的是____群___同步技术。\"},{\"questioncotent\":\"常用的IP地址有A、B、C三类，128.11.3.31是一个__ B __类IP地址，其网络标识netID.为__128.11___，主机标识hostID为___3.31___。\"},{\"questioncotent\":\"有两种基本的差错控制编码，即检错码和____纠错码____，在计算机网络和数据通信中广泛使用的一种检错码为___循环冗余码（或CRC码）____。\"},{\"questioncotent\":\"按照IPV4标准,IP地址205.3.127.13属于___C____ 类地址。\"},{\"questioncotent\":\"IP地址 11011011，00001101，00000101，11101ll0用点分10进制表示可写为_219.13.5.238__ 。\"},{\"questioncotent\":\"计算机网络是发展经历了（面向终端的计算机通信系统）、（计算机-计算机通信网络）和（计算机网络）三个阶段。\"},{\"questioncotent\":\"计算机网络的主要功能包括（数据交换和通信）、（资源共享）、（提高系统的可靠性）、（分布式网络处理和均衡负荷）。\"},{\"questioncotent\":\"计算机网络在逻辑功能上可以划分为（资源）子网和（通信）子网两个部份。\"},{\"questioncotent\":\"资源子网主要包括（主机）、（终端控制器和终端）、（计算机外设）等。\"},{\"questioncotent\":\"通信子网主要包括（网络结点）、（通信链路）、（信号变换设备）等\"},{\"questioncotent\":\"计算机网络中的主要拓扑结构有：（星形）、（环形）、（树形）、（线形）、（网型）等\"},{\"questioncotent\":\"按照网络的分布地理范围，可以将计算机网络分为（局域网）、（城域网）和（广域网）三种。\"},{\"questioncotent\":\"计算机内传输的信号是（数字信号），而公用电话系统的传输系统只能传输（模拟信号）。\"},{\"questioncotent\":\"在计算机通过线路控制器与远程终端直接相连的系统中，计算机既要进行（数据处理），又要承担（各终端间的通信），主计算机负荷加重，实际工作效率下降，而且分散的终端都要单独战用一条通信线路，通信线路利用率低，费用高。\"},{\"questioncotent\":\"在系统的主计算机前增设前端处理机FEP或通信控制器CCP，这些设备用来专门负责（通信工作）。\"},{\"questioncotent\":\"从本质上讲，在联机多用户系统中，不论主机上连接多少台计算机终端或计算机，主计算机与其连接的计算机或计算机之间之间都是（支配与被支配）的关系。\"},{\"questioncotent\":\"1993年底，我国提出建设网络“三金”工程分别是：（金桥工程）、（金关工程）、（金卡工程）。\"},{\"questioncotent\":\"在数据通信系统中，信源和信宿是各种类型计算机和终，它被称为（数据终端设备）、简称（DTE）。一个DTE通常既是信源又是信宿。由于在数据通信系统中以DTE发出和接收的都是（数据），所以，把DTE之间的通信称为（数据电路）。\"},{\"questioncotent\":\"数据从发出端出发到数据被接收端接收的整个过程称为（通信过程），通信过程中每次通信包含（传输数据）和（通信控制 ）两个内容。\"},{\"questioncotent\":\"通信系统中，称调制前的电信号为（基带信号），调制后的信号叫（调制信号）。\"},{\"questioncotent\":\"模拟通信中通过信道的信号频谱通常比较（窄），因此信道的利用率（高），但干扰能力（差）。\"},{\"questioncotent\":\"一般网络中的各个结点通过通信线路相互连接的方式大致有以下几种：（点-点连接）、（分支式连接）、（集线式连接）。\"},{\"questioncotent\":\"在数据通信中（串行通信），通信线路的通信方式有三种基本形式，即（单工通信）、（半双工通信）和（全双工通信）。\"},{\"questioncotent\":\"数据通信的主要技术指标包括：（传输速率）、（信道带宽）、（信道容量）、（出错率）、（延迟）以及（吞吐量）。\"},{\"questioncotent\":\"将数字信号调制为模拟信号有三种方式，即（调幅）、（调频）、（调相）。\"},{\"questioncotent\":\"宽带通常是指通过给定的通信线路发送的（数据量）。从技术的角度年，宽带是通信信道的宽度，即为传输信道的（最高频率与最低频率）之差，单位为赫兹（HZ）。\"},{\"questioncotent\":\"二进制数据编码技术中的三种主要编码方案是：（非归零编码）、（曼彻斯特编码）和（差分曼彻斯特编码）。\"},{\"questioncotent\":\"PCM编码过程为（采样）、（量化）和（编码）。\"},{\"questioncotent\":\"觉的数据传输方式有（异步传输）和（同步传输）。两者都是为解决数据传输过程中同步问题的相关技术，其中（同步传输）方式的效率高，速度快。\"},{\"questioncotent\":\"多路复用技术又分为（频分多路复用）和（时分多路复用）两种。\"},{\"questioncotent\":\"时分多路复用技术又分为（同步时分多路复用）和（统计时分多路复用），其中（统计时分多路复用）技术的效率高。\"},{\"questioncotent\":\"交换是网络实现（数据传输）的一种手段。实现数据交换的三种技术是（线路交换），（报文交换）和（分组交换）。\"},{\"questioncotent\":\"线路交换是一种直接交换方式，是多个输入线和多个输出线之间直接形成传输信息的（物理链路），线路交换分（建立线路）、（传输数据）和（拆除线路）三个阶段。\"},{\"questioncotent\":\"报文交换方式中，（报文）是交换的单位，主要包括报文的正文信息，指明发和收节点的地址以及各种控制信息。由于报文一般者比较长，所以，该方式要求网络上每个结点包括转接中心者要有较大的（存储容量），以备暂存报文。报文传输要等目的线路有（空闲）时转发，所以，（延时性强）。\"},{\"questioncotent\":\"报文分组交换方式是把长的报文分成若干个（较短）的报文组，（报文分组）是交换单位。它与报文交换方式不同的是，交换要包括（分组编号），各组报文可按不同的路径进行传输，不各组报文都有到达目的节点后，目的节点按报文分组编号重组报文。\"},{\"questioncotent\":\"分组交换也存在一些缺点，如：分组交换在各节点存储转发时因排队而造成一定的（延时），由于分组数据中必须携带一些控制信息而产生一定的（额外开销），分组交换网的（管理）和（控制）比较复杂。\"},{\"questioncotent\":\"分组交换的主要任务就是负责系统中分组数据的（存储）、（转发）、和（选择合适的分组传输路径）。\"},{\"questioncotent\":\"在计算机网络中目前常用的传输媒体有（双绞线）、（同轴电缆）、（光导纤维电缆）、（无线电传输媒体）等。\"},{\"questioncotent\":\"调制解调器是同时具有调制和解调两种功能的设备，它是一种（信号交换）设备。\"},{\"questioncotent\":\"双绞线抗干扰作用（较短）。双绞线可以用于（模拟）或（数字）传输，传输信号时，双绞线可以在几公里之内不用对信号进行放大。\"},{\"questioncotent\":\"基带同轴电缆是指（50）Ω的同轴电缆。它主要用于（数字）传输系统。基带同轴电缆的抗干扰性能优于（双绞线），它被广泛用于（局域网）。\"},{\"questioncotent\":\"差错控制技术常采用冗余编码方案，常用的两种校验码是（奇偶校验）和（循环冗余码校验）。\"},{\"questioncotent\":\"计算机网络系统是非常复杂的系统，计算机之间相互通信涉及到许多复杂的技术问题，为实现计算机网络通信，实现网络资源共享，计算机网络采用的是对解决复杂问题十分有效的（分层解决问题）的方法。\"},{\"questioncotent\":\"协议就是为实现网络中的数据交换而建立的（规则）或（标准）。\"},{\"questioncotent\":\"一般来说，协议由（语义）、语法和（交换规则）三部份组成。\"},{\"questioncotent\":\"物理层并不是指连接计算机的具体的物理（设备），或具体的（传输媒体），而是指在物理媒体之上的为上一层（数据链路层）提供一个传输原始比特流的物理（连接）。\"},{\"questioncotent\":\"物理层协议是为了把信号一方经过（物理媒体）传到另一方，物理层所关心的是把通信双方连接起来，为数据链路层实现（无差错）的数据传输创造环境。物理层不负责（检错）和（纠错）服务。\"},{\"questioncotent\":\"ISO组织提出的物理层四个技术特性是（机械特性）、（电气特性）、（功能特性）和（规程特性）。\"},{\"questioncotent\":\"数据链路层的功能包括（链路的建立与释放）、（以帧为单位传送接收数据）、（差错控制功能）、（流量控制功能）。\"},{\"questioncotent\":\"数据链路层向高层提供的服务可分为三种（无应答无连接服务）、（有应答无连接服务）、（面向连接服务）。\"},{\"questioncotent\":\"数据链路层协议有（异步终端协议）、（同步的面向字符协议）、（同步的面向位协议），现在最常用的是（同步的面向位协议）。\"},{\"questioncotent\":\"网络层是（通信子网）的最高层，它在（数据链路层）提供服务的基础上，向（资源）子网提供服务。\"},{\"questioncotent\":\"网络层向传输层提供的服务包括（网络地址）、（网络连接）及其服务。\"},{\"questioncotent\":\"网络层的功能包括（路由选择和中继功能），对数据传输过程实施（流量控制）、（差错控制）、（顺序控制）、（多路复用）以及对非正常发问的恢复处理。\"},{\"questioncotent\":\"虚电路服务和数据报服务是（网络层）向（传输层）提供的服务，其中虚电路又分为（永久虚电路）和（呼叫虚电路）两大类。\"},{\"questioncotent\":\"X.25协议是（CCITT）组织推出的一个协议建议，分为三个协议层，即（物理层），（链路层）和（分组层）。\"},{\"questioncotent\":\"传输层是（通信）子网与（资源）子网间的桥梁，其作用就是在网络层的基础上完成（端对端）的（差错控制）和（流量控制），实现两个终端系统间传送的分组无差错、无丢失、无重复、分组顺序无误。\"},{\"questioncotent\":\"传输层以上各层协议统称为高层协议，它们主要考虑的问题是（主机与主机）之间的协议问题。\"},{\"questioncotent\":\"TCP/IP协议成功地（不同网络）之间难以互联的问题，实现了异网互联通信。\"},{\"questioncotent\":\"事实上，局域网（LAN）是在（广域网）的基础上发展起来的。\"},{\"questioncotent\":\"局域网的层次结构中，通信子网只有相当于OSI/RM中的下三层中的（物理层）与（数据链路层），而且高层功能一般由（网络操作系统）实现。\"},{\"questioncotent\":\"局域网中物理层的信号编码采用的是（曼彻期特编码）。\"},{\"questioncotent\":\"局域网中数据链路层又分为（逻辑链路控制）子层与（媒体访问控制子层）子层，其中（LLC）子层与硬件无关。\"},{\"questioncotent\":\"载体侦听多路访问技术，是为了减少（碰撞），它是在源结点发送报文之前，侦听信道是否（忙（有冲突）），如果侦听到信道上有信号，则（推迟）发送报文。\"},{\"questioncotent\":\"CSMA/CD技术包含（载体侦听多路访问（CSMA））和（冲突检测（CD））两个方面的内容。\"},{\"questioncotent\":\"在网络环境中，工作站是网络的（前端窗口），用户通过工作站来访问网络的（共享资源）。\"},{\"questioncotent\":\"对局域网来说网络服务器是网络控制的（核心），一个局域网至少需有一个服务器，特别是一个局域网至少配备一个（文件服务器），没有服务器控制的通信局域，则为（对等网）。\"},{\"questioncotent\":\"在局域网中，从功能的角度上来说，网卡起着（通信控制处理机）的作用，工作站或服务器连接到网络上，实现资源共享和相互通信都是通过（网卡）实现的。\"},{\"questioncotent\":\"10BASE5 Ethernet表示使用粗同轴电缆的以太网络，其中“10”代表（传输速率为10M），“BASE”代表（基带传输），“5”代表（最大传输距离为500M）。\"},{\"questioncotent\":\"令牌访问技术可用于（环形）和（总线型）两种拓扑结构网，这种访问方式在环形和总线形网中建立起来的（“环”）是一种（逻辑环）。\"},{\"questioncotent\":\"FDDI是一种（高速令牌环）网，是1982年ANSI组织X3T9.5委员会制订的（高速环形局域网）标准，该标准和IEEE802.5十分相似，以（ 光纤）作为传输媒体。\"},{\"questioncotent\":\"快速以太网是指速度在（100Mbps）以上的以太网，采用的是（IEEE802.3μ）标准。\"},{\"questioncotent\":\"千兆以太网标准是现行（IEEE802.3）标准的扩展，经过修改的MAC子层仍然使用（CSMA/CD）协议，支持（全双工）和（半双工）通信。\"},{\"questioncotent\":\"网络互联的目的是实现更广泛的（资源共享）。\"},{\"questioncotent\":\"目前用于网络互连的设备主要有（中继器）、（集线器）、（网桥）、（路由器）等。\"},{\"questioncotent\":\"中继器是运行在OSI模型的（物理）层上的。它扩展了网络传输的（长度），是最简单的网络互连产品。\"},{\"questioncotent\":\"网桥也称桥接器，它是（数据链路）层上局域网之间的互连设备。网桥同中继器不同，网桥处理的是一个完整的（帧），并使用和计算机相同的（接口）设备。\"},{\"questioncotent\":\"IP地址是INTERNET中识别主机的唯一标识。为了便于记忆，在INTERNET中报IP地址分成（4）组，每组（8）位，组与组之间用（.）分隔开。\"},{\"questioncotent\":\"IP地址分（网络号）和（主机号）两个部分。\"},{\"questioncotent\":\"互连网中，域名是对IP地址的命名，它采用（ 层次）结构，通常最高域名为（国家名）。如CN代表（中国）；次高域名常用于标识行业，如COM代表（商业），EDU代表（教育）。\"},{\"questioncotent\":\"IP地址协议作网间网中（网络）层协议，提供无连接的数据报传输机制，IP数据报也分为（报头）和（数据区）两个部分。\"},{\"questioncotent\":\"Internet网所采用的协议是（TCP/IP），其前身是（ARPANET）。\"},{\"questioncotent\":\"Internet的管理分为（技术管理）和（运行管理）两大部分。\"},{\"questioncotent\":\"Internet的应用分为两大类，即（通信）、（使用网络资源）。\"},{\"questioncotent\":\"Internet广泛使用的电子邮件传送协议是（SMTP）。\"},{\"questioncotent\":\"应用层是向网络的使用者提供一个有效和方便的（网络应用环境）。\"},{\"questioncotent\":\"电子邮件的传递都是要通过（邮件网关）来完成的。\"},{\"questioncotent\":\"局域网使用的三种典型拓朴结构是（星型 ）、（环形 ）和（总线型 ）。\"},{\"questioncotent\":\"一般的BBS站点都提供两种浏览方式：WWW和   Telnet 。\"},{\"questioncotent\":\"网络协议的三个要素是___语义____、___语法___与____时序_____。\"},{\"questioncotent\":\"在数据链路层，数据的传送单位是（  帧 ）。\"},{\"questioncotent\":\"Internet 中使用得最广泛的数据链路层协议是(SLIP)协议和(PPP)协议。\"},{\"questioncotent\":\"定义TCP/IP 标准的文档被称为(RFC)。\"},{\"questioncotent\":\" (TELNET)是一个简单的远程终端协议。\"},{\"questioncotent\":\"根据IP头部的结构，一个IP分组（包括头部）最大可以有   65535（即216-1）  字节。\"},{\"questioncotent\":\"ICMP通常被认为是  网络   层的协议。\"},{\"questioncotent\":\"在OSI环境中发送方的应用进程依次从应用层逐层传至物理层，其中传输层的数据传输单元称为         ，网络层的数据传输单元称为         ，数据链路层的数据传输单元称为         ，物理层的数据传输单元称为        。\"},{\"questioncotent\":\"数据链路层在局域网参考模型中被分成：_逻辑链路控制（LLC）子层与_媒体接入控制（MAC）子层。\"},{\"questioncotent\":\"WWW采用的是  客户机/服务器__的工作模式。\"},{\"questioncotent\":\"［解析］WWW采用的客户机/服务器的工作模式。具体的工作流程如下：（1）在客户端，建立连接，用户使用浏览器向服务器发送浏览信息请求。（2）服务器接收到请求，并向浏览器返回请求的信息。（3）关闭连接。\"},{\"questioncotent\":\"一个IP数据报由一个头部和_数据__部分构成。\"},{\"questioncotent\":\"信号一般有模拟信号和数字信号两种表示方式。其中数字信号是一种离散的信号，而模拟信号是一种连续变化的信号。\"},{\"questioncotent\":\"在同一个系统内，相邻层之间交换信息的连接点称之为接口，而低层模块向高层提供功能性的支持称之为服务。\"},{\"questioncotent\":\"信道复用技术主要有频分多路复用 、时分多路复用 、波分多路复用 和码分多路复用四类。\"},{\"questioncotent\":\"在TCP/IP层次模型的第三层网络层中包括的协议主要有IP、ICMP、ARP及 RARP。\"},{\"questioncotent\":\"计算机网络采用分组交换技术，而传统电话网络则采用电路交换技术。\"},{\"questioncotent\":\"在计算机网络中数据的交换按交换方式来分类，可以分为电路交换、报文交换和报文分组交换三种。\"},{\"questioncotent\":\"802.3以太网最小传送的帧长度为   64  个8位bit。\"}],\"03\":[{\"questioncotent\":\"（×）1．并发性是指若干事件在同一时刻发生。\"},{\"questioncotent\":\"（√）2．虚存容量的扩大是以牺牲CPU工作时间以及内、外存交换时间为代价的\"},{\"questioncotent\":\"（×）3．用户为每个自己的进程创建PCB，并控制进程的执行过程。\"},{\"questioncotent\":\"（√）4．树型目录结构能够解决文件重名问题。\"},{\"questioncotent\":\"（√）5．原语是一种不可分割的操作。\"},{\"questioncotent\":\"（√）6．通道一旦被启动就能独立于CPU运行，这样可使CPU和通道并行操作。\"},{\"questioncotent\":\"（√）7．页式的地址是一维的，段式的地址是二维的\"},{\"questioncotent\":\"（×）8．位示图方法可用于磁盘的调度管理。\"},{\"questioncotent\":\"（×）9．虚拟设备是指把一个物理设备变换成多个对应的逻辑设备，它通过逻辑设备表来实现的。\"},{\"questioncotent\":\"（×）10．页式管理易于实现不同进程间的信息共享。\"},{\"questioncotent\":\"（√）１1．在虚拟存储方式下，程序员编制程序时不必考虑主存的容量，但系统的吞吐量在很大程度上依赖于主存储器的容量；\"},{\"questioncotent\":\"（×）1２．可重定位分区管理可以对作业分配不连续的内存单元；\"},{\"questioncotent\":\"（√）1３．采用动态重定位技术的系统，目标程序可以不经任何改动，而装入物理内存；\"},{\"questioncotent\":\"（×）1４．页式存储管理中，一个作业可以占用不连续的内存空间，而段式存储管理，一个作业则是占用连续的内存空间。\"},{\"questioncotent\":\"（×）1５．线程是最小的拥有资源的单位。\"},{\"questioncotent\":\"（√）1６．文件系统最基本的功能是实现按名存取。\"},{\"questioncotent\":\"（×）17．存取控制表是每个用户一张，表明该用户对不同文件的存取权限。\"},{\"questioncotent\":\"（×）18．SPOOLing技术可以解决进程使用设备死锁问题。\"},{\"questioncotent\":\"（×）19．对于一个具有三级索引表的文件，存取一个记录需要访问三次磁盘。\"},{\"questioncotent\":\"（√）20．在I/O控制的多种方式中，传输速率高，对主机影响少的方式最好。\"},{\"questioncotent\":\"（×）21．进程可以删除自己的PCB表。\"},{\"questioncotent\":\"（×）22．可重定位分区法能够支持虚拟存储器的技术。\"},{\"questioncotent\":\"（×）23．单级目录结构能够解决文件重名问题。\"},{\"questioncotent\":\"（×）24．分页式存储管理中，页的大小是可以不相等的。\"},{\"questioncotent\":\"（√）25．执行原语时不会响应任何中断。\"},{\"questioncotent\":\"（√）26．段页式管理实现了段式、页式两种存储方式的优势互补。\"},{\"questioncotent\":\"（√）27．对临界资源应采取互斥访问方式来实现共享。\"},{\"questioncotent\":\"（×）28．文件系统中分配存储空间的基本单位是记录。\"},{\"questioncotent\":\"（×）29．外存对换空间保存的是虚拟内存管理系统调出的程序。\"},{\"questioncotent\":\"（√）30．虚存容量的扩大是以牺牲CPU工作时间以及内、外存交换时间为代价的。\"},{\"questioncotent\":\"网络域名地址便于用户记忆，通俗易懂，可以采用英文也可以用中文名称命名。（R）\"},{\"questioncotent\":\"RIP（Routing Information Protocol）是一种路由协议。（ R ）\"},{\"questioncotent\":\"传输控制协议（TCP）属于传输层协议，而用户数据报协议（UDP）属于网络层协议。（E）\"},{\"questioncotent\":\"网络中机器的标准名称包括域名和主机名，采取多段表示方法，各段间用圆点分开。 (R )\"},{\"questioncotent\":\"网络域名地址一般都通俗易懂，大多采用英文名称的缩写来命名。(R )\"},{\"questioncotent\":\"ISO划分网络层次的基本原则是：不同节点具有不同的层次，不同节点的相同层次有相同的功能。 (R)\"},{\"questioncotent\":\"目前使用的广域网基本都采用星型拓扑结构。( E)\"},{\"questioncotent\":\"在TCP/IP 体系中，ARP 属于网络层协议。（R）\"},{\"questioncotent\":\"PPP (Point-to-Point Protocol，点到点的协议)是一种在同步或异步线路上对数据包进行封装的数据链路协议，早期的家庭拨号上网主要采用SLIP 协议，而现在更多的是用PPP 协议。（R）\"},{\"questioncotent\":\"IP层是TCP/IP实现网络互连的关键，但IP层不提供可靠性保障，所以TCP/IP网络中没有可靠性机制。（×）\"},{\"questioncotent\":\"TCP/IP可以用于同一主机上不同进程之间的通信。 （√）\"},{\"questioncotent\":\"ICMP协议是IP协议的一部分。（T）\"},{\"questioncotent\":\"波分多路复用WDM就相当于TDM在光纤介质上的应用。（F）\"},{\"questioncotent\":\"在因特网的层次体系结构中，网络层的作用是在收发双方主机中的应用进程之间传输数据。（F）\"},{\"questioncotent\":\"正确1：在因特网的层次体系结构中，运输层的作用是在收发双方主机中的应用进程之间传输数据。\"},{\"questioncotent\":\" 正确2：在因特网的层次体系结构中，网络层的作用是在收发双方主机中之间传输数据。\"},{\"questioncotent\":\"通过引入CRC校验以及确认和重传机制，使得网络可实现可靠的数据传输。（F）\"},{\"questioncotent\":\"正确：通过引入CRC校验以及确认和重传机制，网络不一定能够实现可靠的数据传输。\"},{\"questioncotent\":\"由于TCP为用户提供的是可靠的、面向连接的服务，因此该协议对于一些实时应用，如IP电话、视频会议等比较适合。（F）\"},{\"questioncotent\":\"正确：由于TCP为用户提供的是可靠的、面向连接的服务，因此该协议对于一些实时应用，如IP电话、视频会议等不适合。\"},{\"questioncotent\":\"因特网路由器在选路时不仅要考虑目的站IP地址，而且还要考虑目的站的物理地址。（F）\"},{\"questioncotent\":\"正确：因特网路由器在选路时仅需考虑目的站IP地址，而不需要考虑目的站的物理地址。\"},{\"questioncotent\":\"OSPF是一种基于距离向量的内部网关协议。正确：OSPF是一种基于链路状态的内部网关协议\"}]}', '1', '2018-04-08 21:56:15', '01,02,03', null);

-- ----------------------------
-- Table structure for tb_teacherass
-- ----------------------------
DROP TABLE IF EXISTS `tb_teacherass`;
CREATE TABLE `tb_teacherass` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `teachernum` char(8) DEFAULT NULL COMMENT '被评价教师工号',
  `asstype` char(8) DEFAULT NULL COMMENT '人员类型 学生、老师',
  `asslevel` varchar(20) DEFAULT NULL COMMENT '评价等级 优秀、良好、可接受',
  `assvalue` int(11) DEFAULT '0' COMMENT '评价分值',
  `assnum` int(11) DEFAULT '0' COMMENT '评价工号/学号',
  `asstime` datetime DEFAULT NULL COMMENT '评价时间',
  `term` varchar(10) DEFAULT NULL COMMENT '学期',
  `assremark` varchar(100) DEFAULT NULL COMMENT '评价备注',
  PRIMARY KEY (`id`),
  KEY `idx_asstype_index` (`asstype`),
  KEY `idx_asstime_index` (`asstime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='教师评价信息表';

-- ----------------------------
-- Records of tb_teacherass
-- ----------------------------
INSERT INTO `tb_teacherass` VALUES ('1', '2', '1', '1', '1', '1', '2017-08-12 12:12:12', '1', '不接受');

-- ----------------------------
-- Table structure for tb_teachers
-- ----------------------------
DROP TABLE IF EXISTS `tb_teachers`;
CREATE TABLE `tb_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `num` char(8) DEFAULT NULL COMMENT '工号',
  `collegenum` varchar(20) DEFAULT NULL COMMENT '学院编号',
  `majornum` varchar(20) DEFAULT NULL COMMENT '专业编号',
  `gradenum` varchar(20) DEFAULT NULL COMMENT '教课班级编号',
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `coursenum` varchar(30) DEFAULT NULL COMMENT '教授课程编号',
  `type` varchar(4) DEFAULT NULL COMMENT '类型',
  `period` varchar(3) DEFAULT NULL COMMENT '学时',
  `credit` varchar(6) DEFAULT NULL COMMENT '学分',
  PRIMARY KEY (`id`),
  KEY `idx_collegenum_index` (`collegenum`),
  KEY `idx_majornum_index` (`majornum`),
  KEY `idx_gradenum_index` (`gradenum`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='教师信息表';

-- ----------------------------
-- Records of tb_teachers
-- ----------------------------
INSERT INTO `tb_teachers` VALUES ('1', '1001', '01', '0101', '010101', '郭秀娟', '1001', '1', '120', '3');
INSERT INTO `tb_teachers` VALUES ('2', '1002', '01', '0101', '010101', '孙广维', '01', '03', '60', '2');

-- ----------------------------
-- Table structure for tb_teachplan
-- ----------------------------
DROP TABLE IF EXISTS `tb_teachplan`;
CREATE TABLE `tb_teachplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `teachplanname` varchar(100) DEFAULT NULL COMMENT '教案名称',
  `attachname` varchar(50) DEFAULT NULL COMMENT '附件名称',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='教案信息表';

-- ----------------------------
-- Records of tb_teachplan
-- ----------------------------
INSERT INTO `tb_teachplan` VALUES ('1', '2018年上班学期教案', '201803280638.word', '1', '2018-03-28 06:38:32', null);

-- ----------------------------
-- Table structure for tb_testplan
-- ----------------------------
DROP TABLE IF EXISTS `tb_testplan`;
CREATE TABLE `tb_testplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `term` varchar(10) DEFAULT NULL COMMENT '学期',
  `collegenum` varchar(8) DEFAULT NULL COMMENT '学院编号',
  `majornum` varchar(8) DEFAULT NULL COMMENT '专业编号',
  `gradenum` varchar(8) DEFAULT NULL COMMENT '班级编号',
  `coursenum` varchar(30) DEFAULT NULL COMMENT '课程编号',
  `starttime` datetime DEFAULT NULL COMMENT '考试开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '考试结束时间',
  `addr` varchar(300) DEFAULT NULL COMMENT '考试地点',
  `createtime` datetime DEFAULT NULL COMMENT '计划创建时间',
  `createuser` varchar(50) DEFAULT NULL COMMENT '计划创建人',
  `remark` varchar(100) DEFAULT NULL COMMENT '计划备注',
  PRIMARY KEY (`id`),
  KEY `idx_college_index` (`collegenum`),
  KEY `idx_term_index` (`term`),
  KEY `idx_grade_index` (`gradenum`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='考试计划信息表';

-- ----------------------------
-- Records of tb_testplan
-- ----------------------------
INSERT INTO `tb_testplan` VALUES ('1', '1', '01', '01', '01', '01', '2018-03-28 12:30:30', '2018-03-28 14:30:30', '土木教学楼401左', null, null, null);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
