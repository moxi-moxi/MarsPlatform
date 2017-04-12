/*
Navicat MySQL Data Transfer

Source Server         : MySQL@127.0.0.1:3306
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : mars-platform

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-04-12 17:41:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for proj_xmjbxx
-- ----------------------------
DROP TABLE IF EXISTS `proj_xmjbxx`;
CREATE TABLE `proj_xmjbxx` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `xmmc` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `xmlx` tinyint(4) DEFAULT NULL COMMENT '项目类型  0：研制  1：集成  2：论证  99：其它',
  `xmxz` tinyint(4) DEFAULT NULL COMMENT '项目性质  0：正式启动  1：前期跟踪',
  `yjhte` int(10) DEFAULT NULL COMMENT '预计合同额',
  `fzr_id` bigint(20) DEFAULT NULL COMMENT '负责人  ref@sys_user.user_id',
  `qsrq` date DEFAULT NULL COMMENT '起始日期',
  `jzrq` date DEFAULT NULL COMMENT '截止日期',
  `xmzt` tinyint(4) DEFAULT NULL COMMENT '项目状态  0：未开始  1：进行中 2：已暂停 3：已完成',
  `xmms` varchar(500) DEFAULT NULL COMMENT '项目描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='项目基本信息';

-- ----------------------------
-- Records of proj_xmjbxx
-- ----------------------------
INSERT INTO `proj_xmjbxx` VALUES ('1', '南部本级系统', '0', '0', '200', '1', '2016-10-31', '2017-05-31', '1', null);
INSERT INTO `proj_xmjbxx` VALUES ('3', 'fad', null, null, null, null, null, null, null, null);

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
INSERT INTO `qrtz_cron_triggers` VALUES ('MarsPlatformScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('MarsPlatformScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

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
INSERT INTO `qrtz_job_details` VALUES ('MarsPlatformScheduler', 'TASK_1', 'DEFAULT', null, 'org.marsplatform.extend.system.schedule.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B4559737200366F72672E6D617273706C6174666F726D2E657874656E642E73797374656D2E6D6F64656C2E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B78707400087461736B546573747372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000D6D6172732D706C6174666F726D74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('MarsPlatformScheduler', 'TASK_2', 'DEFAULT', null, 'org.marsplatform.extend.system.schedule.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B4559737200366F72672E6D617273706C6174666F726D2E657874656E642E73797374656D2E6D6F64656C2E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B78707400087461736B546573747372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

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
INSERT INTO `qrtz_locks` VALUES ('MarsPlatformScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('MarsPlatformScheduler', 'TRIGGER_ACCESS');

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
INSERT INTO `qrtz_scheduler_state` VALUES ('MarsPlatformScheduler', 'MOX-WNB1491958608288', '1491989978853', '15000');

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
INSERT INTO `qrtz_triggers` VALUES ('MarsPlatformScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1491991200000', '1491989400000', '5', 'WAITING', 'CRON', '1490318755000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B4559737200366F72672E6D617273706C6174666F726D2E657874656E642E73797374656D2E6D6F64656C2E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B78707400087461736B546573747372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000D6D6172732D706C6174666F726D74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_triggers` VALUES ('MarsPlatformScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1490319000000', '-1', '5', 'PAUSED', 'CRON', '1490318756000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B4559737200366F72672E6D617273706C6174666F726D2E657874656E642E73797374656D2E6D6F64656C2E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B78707400087461736B546573747372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

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
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'taskTest', 'test', 'mars-platform', '0 0/30 * * * ?', '0', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('2', 'taskTest', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');

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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1016', '2017-03-24 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1090', '2017-03-24 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1018', '2017-03-24 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1006', '2017-03-24 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1006', '2017-03-24 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1045', '2017-03-24 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1015', '2017-03-24 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1041', '2017-03-24 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1031', '2017-03-24 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1011', '2017-03-24 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1039', '2017-03-24 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1039', '2017-03-25 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1023', '2017-03-25 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1053', '2017-03-27 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-03-27 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-03-27 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1019', '2017-03-27 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1021', '2017-03-27 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1015', '2017-03-27 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-03-27 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1042', '2017-03-27 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1008', '2017-03-27 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1009', '2017-03-27 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1034', '2017-03-27 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1017', '2017-03-28 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('26', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1045', '2017-03-28 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1032', '2017-03-29 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('28', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-03-29 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('29', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1035', '2017-03-29 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('30', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1070', '2017-03-29 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('31', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1031', '2017-03-29 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('32', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1017', '2017-03-30 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('33', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1028', '2017-03-30 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('34', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1054', '2017-03-31 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('35', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1018', '2017-03-31 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('36', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1006', '2017-03-31 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('37', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-03-31 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('38', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-03-31 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('39', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1098', '2017-04-01 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('40', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-04-01 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('41', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1006', '2017-04-01 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('42', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1005', '2017-04-01 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('43', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-04-01 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('44', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1008', '2017-04-01 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('45', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-01 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('46', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-01 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('47', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-01 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('48', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1006', '2017-04-01 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('49', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1012', '2017-04-01 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('50', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1078', '2017-04-05 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('51', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-04-05 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('52', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1010', '2017-04-05 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('53', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-04-05 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('54', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-05 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('55', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1006', '2017-04-05 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('56', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1005', '2017-04-05 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('57', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-05 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('58', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-05 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('59', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-05 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('60', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1031', '2017-04-06 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('61', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-04-06 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('62', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-04-06 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('63', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-04-06 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('64', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1048', '2017-04-07 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('65', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1006', '2017-04-07 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('66', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1020', '2017-04-07 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('67', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-07 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('68', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-07 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('69', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1019', '2017-04-07 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('70', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1002', '2017-04-07 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('71', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1002', '2017-04-07 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('72', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1002', '2017-04-07 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('73', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1078', '2017-04-10 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('74', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-04-10 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('75', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1068', '2017-04-10 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('76', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1057', '2017-04-10 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('77', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1050', '2017-04-10 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('78', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1155', '2017-04-11 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('79', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1019', '2017-04-11 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('80', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1033', '2017-04-11 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('81', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1005', '2017-04-11 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('82', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-11 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('83', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-11 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('84', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-11 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('85', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-11 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('86', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1005', '2017-04-11 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('87', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1002', '2017-04-11 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('88', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-11 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('89', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1002', '2017-04-11 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('90', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-04-11 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('91', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1005', '2017-04-11 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('92', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1077', '2017-04-12 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('93', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-12 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('94', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-04-12 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('95', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1005', '2017-04-12 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('96', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-12 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('97', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-04-12 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('98', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-04-12 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('99', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1004', '2017-04-12 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('100', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1005', '2017-04-12 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('101', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-12 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('102', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1002', '2017-04-12 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('103', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-12 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('104', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1002', '2017-04-12 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('105', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-12 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('106', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1002', '2017-04-12 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('107', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1002', '2017-04-12 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('108', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-12 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('109', '1', 'taskTest', 'test', 'mars-platform', '0', null, '1003', '2017-04-12 17:30:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '3');
INSERT INTO `sys_menu` VALUES ('2', '1', '用户列表', 'sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'sys/schedule.html', null, '1', 'fa fa-tasks', '5');
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
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('28', '1', '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', '1', 'fa fa-rocket', '7');
INSERT INTO `sys_menu` VALUES ('29', '0', '项目管理', '', null, '0', 'fa fa-calendar-check-o', '1');
INSERT INTO `sys_menu` VALUES ('30', '0', '统计分析', 'app/proj/.html', null, '0', 'fa fa-pie-chart', '2');
INSERT INTO `sys_menu` VALUES ('31', '32', '查看', null, 'proj:xmjbxx:list,proj:xmjbxx:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('32', '29', '项目列表', 'proj/xmjbxx/xmjbxx.html', null, '1', 'fa fa-list-alt', '1');
INSERT INTO `sys_menu` VALUES ('33', '29', '任务分派', 'proj/', null, '1', 'fa fa-list-ol', '2');
INSERT INTO `sys_menu` VALUES ('34', '29', '团队管理', 'proj', null, '1', 'fa fa-users', '3');
INSERT INTO `sys_menu` VALUES ('35', '32', '新增', null, 'proj:xmjbxx:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '32', '修改', null, 'proj:xmjbxx:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('37', '32', '删除', null, 'proj:xmjbxx:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '0', '开发示例', null, null, '0', 'fa fa-briefcase', '4');
INSERT INTO `sys_menu` VALUES ('39', '38', '统计图表', 'demo/chart.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('40', '38', '地图应用', 'demo/map.html', null, '1', null, '1');
INSERT INTO `sys_menu` VALUES ('41', '38', 'Bootstrap组件', 'demo/bootstrap.html', null, '1', null, '3');
INSERT INTO `sys_menu` VALUES ('42', '38', 'LayUI组件', 'demo/layui.html', null, '1', null, '4');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', null, '2017-03-24 10:41:37');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('96', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('97', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('98', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('99', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('100', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('101', '1', '37');
INSERT INTO `sys_role_menu` VALUES ('102', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('103', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('104', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('105', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('106', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('107', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('108', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('109', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('110', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('111', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('112', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('113', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('114', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('115', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('116', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('117', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('118', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('119', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('120', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('121', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('122', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('123', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('124', '1', '8');
INSERT INTO `sys_role_menu` VALUES ('125', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('126', '1', '10');
INSERT INTO `sys_role_menu` VALUES ('127', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('128', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('129', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('130', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('131', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('132', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('133', '1', '38');
INSERT INTO `sys_role_menu` VALUES ('134', '1', '39');
INSERT INTO `sys_role_menu` VALUES ('135', '1', '40');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'moxi-moxi@hotmail.com', '13810031128', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'mox', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'moxi-moxi@hotmail.com', '13810031128', '1', '2017-03-24 10:40:55');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('2', '2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '1', '1');
