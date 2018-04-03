/*
Navicat MySQL Data Transfer

Source Server         : jxgl
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : renren_fast

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-04-03 10:01:47
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
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-80Q30CP1522719274043', '1522720903594', '15000');

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
INSERT INTO `sys_captcha` VALUES ('7d6795b7-2b95-4894-83cd-6c5d24718ab0', 'mndnb', '2018-04-03 10:01:19');
INSERT INTO `sys_captcha` VALUES ('8ec09b26-ce92-42fe-8477-d95c9dccd0c3', '7bb3f', '2018-03-26 20:54:53');
INSERT INTO `sys_captcha` VALUES ('a6c43e7e-9c71-49bc-8f37-fe0dd5cb0b90', 'we36n', '2018-03-24 19:36:23');
INSERT INTO `sys_captcha` VALUES ('a87d6a56-bde2-40c5-879a-994a0ea27a46', 'f4wyy', '2018-04-01 21:24:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='系统日志';

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
INSERT INTO `sys_log` VALUES ('118', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '195', '60', '0:0:0:0:0:0:0:1', '2018-04-02 12:30:54');
INSERT INTO `sys_log` VALUES ('119', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":277,\"parentId\":141,\"name\":\"组卷策略\",\"url\":\"modules/tactics/tactics.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '27', '0:0:0:0:0:0:0:1', '2018-04-02 12:31:23');

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
INSERT INTO `sys_menu` VALUES ('77', '72', '查看', null, 'teachers:teachers:list,teachers:teachers:info', '2', null, '6');
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
INSERT INTO `sys_menu` VALUES ('119', '117', '新增', null, 'question:question:save,questiontype:questiontype:select', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('120', '117', '修改', null, 'question:question:update,questiontype:questiontype:select', '2', null, '6');
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
INSERT INTO `sys_menu` VALUES ('279', '277', '新增', null, 'tactics:tactics:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('280', '277', '修改', null, 'tactics:tactics:update', '2', null, '6');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '-666666');
INSERT INTO `sys_role_menu` VALUES ('2', '2', '-666666');
INSERT INTO `sys_role_menu` VALUES ('3', '3', '-666666');
INSERT INTO `sys_role_menu` VALUES ('4', '4', '-666666');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', '2549928596@qq.com', '13612345678', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'supe', 'b53e32e734fbf5c971fe8e56d794f4b09939d51b7f5527e369211a4dc9a34cba', 'GZkh1eDcxd4wkUgy71dA', '691386631@qq.com', '13645368414', '1', '1', '2018-03-18 12:57:48');
INSERT INTO `sys_user` VALUES ('3', 'teacher', 'cfb6865ea3827238372df84404a24ab1c88d17f9d976ac41509ac13305f8577b', 'DwMwG0YOrYjZ2f3C3OFz', '2549928596@qq.com', '15856912345', '1', '1', '2018-03-18 14:39:22');
INSERT INTO `sys_user` VALUES ('4', 'student', 'afd8a5b1c9b99c367de44307c90228014bbc1f5c792c3f80385fe322612f5fb0', 'FxmiopsCJ82OEBQhj3E9', '135467823@qq.com', '13645368415', '0', '1', '2018-03-18 14:39:56');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '3', '3');
INSERT INTO `sys_user_role` VALUES ('5', '4', '4');

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
INSERT INTO `sys_user_token` VALUES ('1', 'aea9418ecd93aee7ab818d3135cdc4d4', '2018-04-02 20:46:42', '2018-04-02 08:46:42');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='学院信息表';

-- ----------------------------
-- Records of tb_college
-- ----------------------------
INSERT INTO `tb_college` VALUES ('1', '01', '计算机学院', '2018-03-25 11:23:11', 'admin', '计算机');
INSERT INTO `tb_college` VALUES ('2', '02', '土木工程学院', '2018-03-26 21:38:31', '1', null);
INSERT INTO `tb_college` VALUES ('3', '03', '电气学院', '2018-03-26 21:41:45', 'admin', null);
INSERT INTO `tb_college` VALUES ('4', '04', '汽修学院', '2018-03-29 20:50:50', 'admin', null);

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
  `collegename` varchar(100) DEFAULT NULL,
  `majorname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_coursenum_index` (`coursenum`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='课程信息表';

-- ----------------------------
-- Records of tb_course
-- ----------------------------
INSERT INTO `tb_course` VALUES ('1', '01', '计算机组成原理', '02', '001', '2018-03-25 12:23:12', 'admin', '计算机硬件', null, null);
INSERT INTO `tb_course` VALUES ('2', '02', '离散数学', '01', '002', '2018-03-26 22:26:38', 'admin', null, null, null);
INSERT INTO `tb_course` VALUES ('3', '03', '计算机操作系统', '01', '002', '2018-04-02 10:45:55', 'admin', null, null, null);

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
  `gradename` varchar(100) DEFAULT NULL,
  `coursename` varchar(100) DEFAULT NULL,
  `majorname` varchar(100) DEFAULT NULL,
  `collegename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_collegenum_index` (`collegenum`),
  KEY `idx_majornum_index` (`majornum`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='考试成绩信息表';

-- ----------------------------
-- Records of tb_exam
-- ----------------------------
INSERT INTO `tb_exam` VALUES ('3', '02', '001', '01', '01', '1001', '99', '2018-04-01 07:06:49', null, null, null, null, null);

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
INSERT INTO `tb_goods` VALUES ('2', '苹果', '葡萄', '10.00', '1');

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
  `collegename` varchar(100) DEFAULT NULL,
  `majorname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_collegenum_index` (`collegenum`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='班级信息表';

-- ----------------------------
-- Records of tb_grade
-- ----------------------------
INSERT INTO `tb_grade` VALUES ('1', '01', '计算机111', '01', '002', '2018-03-25 12:23:11', 'admin', '计算机1班', null, null);
INSERT INTO `tb_grade` VALUES ('2', '02', '计算机112班', '02', '003', '2018-03-26 22:19:32', 'admin', null, null, null);

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
  `collegename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_collegenum_index` (`collegenum`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='专业信息表';

-- ----------------------------
-- Records of tb_major
-- ----------------------------
INSERT INTO `tb_major` VALUES ('1', '002', '网络工程', '01', '2018-03-25 12:34:12', 'admin', '计算机', null);
INSERT INTO `tb_major` VALUES ('2', '001', '计算机科学与技术', '02', null, null, '计算机', null);
INSERT INTO `tb_major` VALUES ('3', '003', '软件工程', '02', null, null, '计算机', null);

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
  `remark` longtext COMMENT '备注',
  `collegename` varchar(100) DEFAULT NULL,
  `majorname` varchar(100) DEFAULT NULL,
  `coursename` varchar(100) DEFAULT NULL,
  `gradename` varchar(100) DEFAULT NULL,
  `questiontypename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_collegenum_index` (`collegenum`),
  KEY `idx_majornum_index` (`majornum`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='考试成绩信息表';

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES ('3', '01', '002', '03', '01', '01', '03', '（）1．并发性是指若干事件在同一时刻发生。', null, null, null, null, null, null);
INSERT INTO `tb_question` VALUES ('4', '01', '002', '03', '01', '02', '03', '（）2、虚存容量的扩大是以牺牲CPU工作时间以及内、外存交换时间为代价的。', null, null, null, null, null, null);
INSERT INTO `tb_question` VALUES ('5', '01', '002', '03', '01', '03', '03', '（）3．用户为每个自己的进程创建PCB，并控制进程的执行过程。', null, null, null, null, null, null);
INSERT INTO `tb_question` VALUES ('6', '01', '002', '03', '01', '04', '03', '（）4．树型目录结构能够解决文件重名问题。 ', null, null, null, null, null, null);
INSERT INTO `tb_question` VALUES ('7', '01', '002', '03', '01', '06', '03', '（）5．原语是一种不可分割的操作。', null, null, null, null, null, null);
INSERT INTO `tb_question` VALUES ('8', '01', '002', '03', '01', '07', '02', '1．操作系统为用户提供三种类型的使用接口，它们是_____和_______和图形用户界面。', null, null, null, null, null, null);
INSERT INTO `tb_question` VALUES ('9', '01', '002', '03', '01', '07', '02', '2．主存储器与外围设备之间的数据传送控制方式有程序直接控制、_______、_______和通道控制方式。', null, null, null, null, null, null);
INSERT INTO `tb_question` VALUES ('10', '01', '002', '03', '01', '09', '04', '1．在单处理机环境下，进程间有哪几种通信方式，是如何实现的？', '1. 作业调度：从一批后备作业中选择一个或几个作业，给它们分配资源，建立进程，挂入就绪队列。执行完后，回收资源。 进程调度：从就绪进程队列中根据某个策略选取一个进程，使之占用CPU。 交换调度：按照给定的原则和策略，将外存交换区中的进程调入内存，把内存中的非执行进程交换到外存交换区中。', null, null, null, null, null);
INSERT INTO `tb_question` VALUES ('11', '01', '002', '03', '01', '10', '04', '2.设备管理中的数据传送控制方式有哪几种？分别简述如何实现的。', '2. 程序直接控制：由用户进程来直接控制内存或CPU和外设间的信息传送。 中断方式：进程通过CPU发出指令启动外设，该进程阻塞。当输入完成时，I/O控制器通过中断请求线向CPU发出中断信号，CPU进行中断处理。 DMA方式：在外设和内存之间开辟直接的数据交换通路。 通道控制方式：CPU发出启动指令，指出通道相应的操作和I/O 设备，该指令就可启动通道并使该通道从内存中调出相应的通道指令执行。', null, null, null, null, null);
INSERT INTO `tb_question` VALUES ('12', '01', '002', '03', '01', '11', '01', '1．（       ）不是基本的操作系统。        A、批处理操作系统       B、分时操作系统  C、实时操作系统         D、网络操作系统 ', 'D', null, null, null, null, null);
INSERT INTO `tb_question` VALUES ('13', '01', '002', '03', '01', '12', '01', '2．（    ）不是分时系统的基本特征：        A、同时性       B、独立性  C、实时性       D、交互性 ', 'c', null, null, null, null, null);

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
INSERT INTO `tb_questiontype` VALUES ('6', '06', '证明题', '证明题类型');

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
  `collegename` varchar(100) DEFAULT NULL,
  `majorname` varchar(100) DEFAULT NULL,
  `gradename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_collegenum_index` (`collegenum`),
  KEY `idx_majornum_index` (`majornum`),
  KEY `idx_gradenum_index` (`gradenum`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='学生信息表';

-- ----------------------------
-- Records of tb_students
-- ----------------------------
INSERT INTO `tb_students` VALUES ('1', '1001', '02', '001', '01', '张三', '01', '1', null, null, null);
INSERT INTO `tb_students` VALUES ('2', '1002', '01', '003', '02', '李四', '01', '1', null, null, null);

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
  PRIMARY KEY (`tacid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='组卷策略';

-- ----------------------------
-- Records of tb_tactics
-- ----------------------------

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
  `assnum` mediumtext COMMENT '评价工号/学号',
  `asstime` datetime DEFAULT NULL COMMENT '评价时间',
  `term` varchar(10) DEFAULT NULL COMMENT '学期',
  `assremark` varchar(100) DEFAULT NULL COMMENT '评价备注',
  PRIMARY KEY (`id`),
  KEY `idx_asstype_index` (`asstype`),
  KEY `idx_asstime_index` (`asstime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='教师评价信息表';

-- ----------------------------
-- Records of tb_teacherass
-- ----------------------------
INSERT INTO `tb_teacherass` VALUES ('1', '1001', '1', '1', '1', '1', '2017-08-12 12:12:12', '2', '不接受');
INSERT INTO `tb_teacherass` VALUES ('2', '1001', '3', '3', '1', '1', '2018-04-01 22:17:22', '1', '讲课不好');
INSERT INTO `tb_teacherass` VALUES ('3', '1001', '3', '2', '1', '1', '2018-04-01 22:26:29', '1', '1');
INSERT INTO `tb_teacherass` VALUES ('4', '1001', '3', '2', '1', '1', '2018-04-01 22:27:42', '1', '1');
INSERT INTO `tb_teacherass` VALUES ('5', '1002', '3', '2', '0', '1', '2018-04-01 22:38:44', '1', '还行啊');

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
  `collegename` varchar(100) DEFAULT NULL,
  `majorname` varchar(100) DEFAULT NULL,
  `gradename` varchar(100) DEFAULT NULL,
  `coursename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_collegenum_index` (`collegenum`),
  KEY `idx_majornum_index` (`majornum`),
  KEY `idx_gradenum_index` (`gradenum`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='教师信息表';

-- ----------------------------
-- Records of tb_teachers
-- ----------------------------
INSERT INTO `tb_teachers` VALUES ('1', '1001', '01', '002', '01', '张三', '02', '1', '120', '3', null, null, null, null);
INSERT INTO `tb_teachers` VALUES ('2', '1002', '01', '01', '01', '王大锤', '01', '03', '60', '2', null, null, null, null);

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
  `collegename` varchar(100) DEFAULT NULL,
  `majorname` varchar(100) DEFAULT NULL,
  `gradename` varchar(100) DEFAULT NULL,
  `coursename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_college_index` (`collegenum`),
  KEY `idx_term_index` (`term`),
  KEY `idx_grade_index` (`gradenum`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='考试计划信息表';

-- ----------------------------
-- Records of tb_testplan
-- ----------------------------
INSERT INTO `tb_testplan` VALUES ('1', '2', '02', '001', '01', '01', '2018-03-28 12:30:30', '2018-03-28 14:30:30', '土木教学楼401左', null, null, null, null, null, null, null);

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
