/*
 Navicat Premium Dump SQL

 Source Server         : 【0.9】mysql
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44)
 Source Host           : 192.168.0.36:3306
 Source Schema         : aeotrade

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44)
 File Encoding         : 65001

 Date: 13/03/2025 15:33:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for atci_lend
-- ----------------------------
DROP TABLE IF EXISTS `atci_lend`;
CREATE TABLE `atci_lend` (
  `id` bigint(100) NOT NULL,
  `accept_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '接收方名称',
  `accept_sign` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '接收方标识   ',
  `biz_sign` varchar(500) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '借出文件标识',
  `document_status` int(50) DEFAULT NULL COMMENT '借出状态（1借出 2失效  3到期)',
  `document_name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '借出文件名称',
  `lender` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '借出人',
  `lend_member` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '借出公司',
  `lend_time` datetime DEFAULT NULL COMMENT '借出时间',
  `lend_uscc` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '借出公司统一社会信用代码',
  `look_count` int(50) DEFAULT NULL COMMENT '浏览次数',
  `useful_life` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '借出截止时间（有效期）',
  `start_time` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '结束时间',
  `accept_document_type` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '借出文件类型',
  `accept_type` int(50) DEFAULT NULL COMMENT '借出类型（1 内部借阅  2外部借阅）',
  `is_preview` int(50) DEFAULT NULL COMMENT '是否可以预览0否1是',
  `is_download` int(50) DEFAULT NULL COMMENT '是否可以下载0否1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='档案记录借阅表';

-- ----------------------------
-- Records of atci_lend
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for client_version
-- ----------------------------
DROP TABLE IF EXISTS `client_version`;
CREATE TABLE `client_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_name` varchar(100) DEFAULT NULL COMMENT '版本名称',
  `version_number` varchar(50) DEFAULT NULL COMMENT '版本号',
  `is_coerce_update` int(10) DEFAULT NULL COMMENT '是否强制更新0否1是',
  `version_content` text COMMENT '版本更新内容',
  `version_remark` varchar(255) DEFAULT NULL COMMENT '版本备注',
  `download_oss` varchar(255) DEFAULT NULL COMMENT 'oss下载地址',
  `status` int(10) DEFAULT NULL COMMENT '删除',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_mode` int(11) DEFAULT NULL COMMENT '更新方式1全量更新2增量更新',
  `is_public` int(11) DEFAULT NULL COMMENT '是否是公开版本0否1是',
  `is_update` int(11) DEFAULT NULL COMMENT '是否可以更新0否1是',
  `app_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='慧贸客户端下载版本信息表';

-- ----------------------------
-- Records of client_version
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for open_register_config
-- ----------------------------
DROP TABLE IF EXISTS `open_register_config`;
CREATE TABLE `open_register_config` (
  `id` bigint(20) NOT NULL,
  `client_id` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `tenant_type` varchar(60) DEFAULT NULL COMMENT '注册类型  auto_create_all->自动创建企业和员工',
  `register_function` varchar(60) DEFAULT NULL COMMENT '功能 ',
  `default_app` varchar(60) DEFAULT NULL COMMENT '默认开通应用',
  `role` varchar(255) DEFAULT NULL COMMENT '角色权限',
  `white_list_ip` varchar(255) DEFAULT NULL COMMENT '白名单Ip',
  `request_current_limit` varchar(255) DEFAULT NULL COMMENT 'ip限流,',
  `create_member_id` bigint(20) DEFAULT NULL COMMENT '创建企业ID',
  `create_by` varchar(60) DEFAULT NULL COMMENT '创建人',
  `create_staff_id` bigint(255) DEFAULT NULL COMMENT '创建员工ID',
  `create_staff_name` varchar(60) DEFAULT NULL COMMENT '创建员工名称',
  `status` int(1) unsigned NOT NULL COMMENT '删除',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `revision` int(11) NOT NULL COMMENT '乐观锁',
  `create_way` int(1) DEFAULT NULL COMMENT '创建方式 0->运营,1->企业,2->用户',
  `docking_name` varchar(255) DEFAULT NULL COMMENT '对接平台名称',
  `workbench_id` bigint(20) DEFAULT NULL COMMENT '工作台ID',
  `workbench_code` varchar(255) DEFAULT NULL COMMENT '工作台标识',
  `docking_way` int(255) DEFAULT NULL COMMENT '对接方式,0->作为应用接入第三方平台, 1->第三方应用接入本平台',
  `oauth_way` varchar(60) DEFAULT NULL COMMENT '授权方式',
  `workbench_name` varchar(255) DEFAULT NULL COMMENT '工作台名称',
  `oauth_addr` varchar(1000) DEFAULT NULL COMMENT '授权地址',
  `workbench_vip_classid` bigint(20) DEFAULT NULL COMMENT '工作台会员等级ID',
  `workbench_vip_typeid` bigint(20) DEFAULT NULL COMMENT '工作会员类型ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='百川迅捷单点登录表';

-- ----------------------------
-- Records of open_register_config
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for public_field
-- ----------------------------
DROP TABLE IF EXISTS `public_field`;
CREATE TABLE `public_field` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `member_name` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '企业名称',
  `staff_id` bigint(20) DEFAULT NULL COMMENT '企业联系人',
  `staff_name` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '企业联系人名称',
  `revision` int(11) DEFAULT NULL COMMENT '乐观锁',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(11) NOT NULL COMMENT '删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公共字段表';

-- ----------------------------
-- Records of public_field
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sgs_apply
-- ----------------------------
DROP TABLE IF EXISTS `sgs_apply`;
CREATE TABLE `sgs_apply` (
  `id` bigint(20) NOT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `user_type` int(255) DEFAULT NULL COMMENT '0:员工, 1: 企业',
  `sgs_type` int(255) DEFAULT NULL COMMENT '认证类型',
  `sgs_type_name` varchar(255) DEFAULT NULL COMMENT '认证方式名称',
  `sgs_status` int(65) DEFAULT NULL COMMENT '认证状态(0:未认证,1:认证中,2:认证成功)',
  `revision` int(1) unsigned zerofill DEFAULT NULL COMMENT '乐观锁',
  `created_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(1) unsigned zerofill NOT NULL COMMENT '删除',
  `member_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `uscc` varchar(255) DEFAULT NULL COMMENT '企业统一社会信用代码',
  `remark` text COMMENT '备注（不通过理由）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='认证信息表';

-- ----------------------------
-- Records of sgs_apply
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sgs_bank_info
-- ----------------------------
DROP TABLE IF EXISTS `sgs_bank_info`;
CREATE TABLE `sgs_bank_info` (
  `id` bigint(20) NOT NULL,
  `member_id` bigint(20) DEFAULT NULL COMMENT '企业ID',
  `sgs_status` int(65) DEFAULT NULL COMMENT '认证状态(0:未认证,1:认证中,2:认证成功)',
  `revision` int(1) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `created_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(1) unsigned zerofill NOT NULL COMMENT '删除',
  `member_name` varchar(100) DEFAULT NULL COMMENT '企业名称',
  `uscc` varchar(18) DEFAULT NULL COMMENT 'uscc',
  `sgs_apply_id` bigint(255) DEFAULT NULL COMMENT '认证信息ID',
  `user_type` int(1) DEFAULT NULL COMMENT '0:个人1:企业',
  `deduction` varchar(20) DEFAULT NULL COMMENT '打款金额',
  `bank_of_deposit` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '开户行',
  `bank_account` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '银行账号',
  `bank_sub` varchar(255) DEFAULT NULL COMMENT '开户支行',
  `bank_account_name` varchar(255) DEFAULT NULL COMMENT '银行开户名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='银行认证';

-- ----------------------------
-- Records of sgs_bank_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sgs_cert_info
-- ----------------------------
DROP TABLE IF EXISTS `sgs_cert_info`;
CREATE TABLE `sgs_cert_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL COMMENT '企业ID',
  `sgs_status` int(65) DEFAULT NULL COMMENT '认证状态(0:未认证,1:认证中,2:认证成功)',
  `revision` int(1) unsigned zerofill DEFAULT NULL COMMENT '乐观锁',
  `created_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(1) unsigned zerofill NOT NULL COMMENT '删除',
  `member_name` varchar(100) DEFAULT NULL COMMENT '企业名称',
  `uscc` varchar(18) DEFAULT NULL COMMENT 'uscc',
  `sgs_apply_id` bigint(255) DEFAULT NULL COMMENT '认证信息ID',
  `member_papers_type` varchar(100) DEFAULT NULL COMMENT '企业证件类型',
  `member_papers_img` varchar(1000) DEFAULT NULL COMMENT '企业证件附件',
  `identity` varchar(65) DEFAULT NULL COMMENT '认证人身份',
  `legal_person` varchar(65) DEFAULT NULL COMMENT '法人',
  `person_id` varchar(50) DEFAULT NULL COMMENT '法人身份证号',
  `appendix` varchar(1000) DEFAULT NULL COMMENT '授权书附件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业认证';

-- ----------------------------
-- Records of sgs_cert_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sgs_configuration
-- ----------------------------
DROP TABLE IF EXISTS `sgs_configuration`;
CREATE TABLE `sgs_configuration` (
  `id` bigint(20) NOT NULL,
  `sgs_name` varchar(40) DEFAULT NULL COMMENT '认证方式名称',
  `ico` varchar(600) DEFAULT NULL COMMENT '认证方式图标',
  `description` varchar(255) DEFAULT NULL COMMENT '认证说明',
  `sort` int(255) DEFAULT NULL COMMENT '排序',
  `sgs_status` int(255) DEFAULT NULL COMMENT '启用状态0:禁用1:启用',
  `user_type` int(255) DEFAULT NULL COMMENT '1企业,0个人',
  `revision` int(1) unsigned zerofill DEFAULT NULL COMMENT '乐观锁',
  `created_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(1) unsigned zerofill NOT NULL COMMENT '删除',
  `sgs_type` int(255) DEFAULT NULL COMMENT '认证类型标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台认证列表';

-- ----------------------------
-- Records of sgs_configuration
-- ----------------------------
BEGIN;
INSERT INTO `sgs_configuration` (`id`, `sgs_name`, `ico`, `description`, `sort`, `sgs_status`, `user_type`, `revision`, `created_time`, `updated_time`, `status`, `sgs_type`) VALUES (768411588603412480, '单一窗口认证', 'http://aeotrade-launch-advisor.oss-cn-zhangjiakou.aliyuncs.com/141e1efa-2de7-474a-8e29-a2bcbd7f999d.png', '单一窗口登录通过后即可完成认证', NULL, 1, 1, 2, '2024-03-20 06:51:47', '2023-08-17 14:43:55', 0, 3);
INSERT INTO `sgs_configuration` (`id`, `sgs_name`, `ico`, `description`, `sort`, `sgs_status`, `user_type`, `revision`, `created_time`, `updated_time`, `status`, `sgs_type`) VALUES (768414024873279488, '银行卡对公账户认证', 'http://aeotrade-launch-advisor.oss-cn-zhangjiakou.aliyuncs.com/3df527f5-4eb8-46e4-92aa-86c0ed4b5523.png', '认证最快1个工作日', NULL, 1, 1, 2, '2024-03-20 06:51:50', '2020-11-17 14:37:25', 0, 2);
INSERT INTO `sgs_configuration` (`id`, `sgs_name`, `ico`, `description`, `sort`, `sgs_status`, `user_type`, `revision`, `created_time`, `updated_time`, `status`, `sgs_type`) VALUES (768414157883047936, '组织证件认证', 'http://aeotrade-launch-advisor.oss-cn-zhangjiakou.aliyuncs.com/71d22461-f8b8-4e44-a66c-88a79abdd74c.png', '认证最快1个工作日 ', NULL, 1, 1, 2, '2024-03-20 06:51:56', '2023-09-04 15:50:41', 0, 4);
COMMIT;

-- ----------------------------
-- Table structure for sgs_sw_info
-- ----------------------------
DROP TABLE IF EXISTS `sgs_sw_info`;
CREATE TABLE `sgs_sw_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NOT NULL,
  `sgs_status` int(65) DEFAULT NULL COMMENT '认证状态(0:未认证,1:认证中,2:认证成功)',
  `revision` int(1) unsigned zerofill DEFAULT NULL COMMENT '乐观锁',
  `created_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(1) unsigned zerofill NOT NULL COMMENT '删除',
  `member_name` varchar(100) DEFAULT NULL COMMENT '企业名称',
  `uscc` varchar(18) DEFAULT NULL COMMENT 'uscc',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `pass_word` varchar(100) DEFAULT NULL COMMENT '密码',
  `sgs_apply_id` bigint(255) DEFAULT NULL COMMENT '认证信息ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单一窗口认证表';

-- ----------------------------
-- Records of sgs_sw_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_theme
-- ----------------------------
DROP TABLE IF EXISTS `sys_theme`;
CREATE TABLE `sys_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `type` int(11) NOT NULL COMMENT '类型（1全局、2企业、3个人）',
  `enabling` int(11) NOT NULL DEFAULT '1' COMMENT '启用状态（0 false、1 true）',
  `customizer` varchar(20) DEFAULT NULL COMMENT '自定义者标识ID',
  `theme` varchar(60) DEFAULT NULL COMMENT '主题',
  `theme_content` text NOT NULL COMMENT '主题配置内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_theme
-- ----------------------------
BEGIN;
INSERT INTO `sys_theme` (`id`, `create_time`, `type`, `enabling`, `customizer`, `theme`, `theme_content`) VALUES (5, '2025-02-10 17:53:12', 1, 1, NULL, '门户及工作台配置', '{\"loginBackgroundImageUrl\":\"\",\"loginLogoImageUrl\":\"\",\"loginDescription\":\"\",\"loginTitle\":\"\",\"loginGuideIntro\":\"\",\"loginEnv\":\"\",\"loginWxSupport\":true,\"companyManageLogoImageUrl\":\"\",\"companyManageEditInfoBtn\":true,\"appCenterCategory\":true,\"appCenterCreateBtn\":true,\"realNameAuthStatus\":false,\"realNameAuthRule\":\"disable\",\"platformAgreementVisible\":false,\"platformAgreementUrl\":\"\",\"privacyPolicyUrl\":\"\",\"wxAccountSupport\":false,\"wxAccountAppId\":\"\",\"baiduStatisticsSupport\":false,\"baiduStatisticsAppId\":\"\",\"loginMethods\":[\"second\",\"third\"],\"appCenter\":true,\"clientDownLoad\":false,\"helpDoc\":false,\"wxKeFu\":true,\"helpCenter\":true,\"vip\":true,\"showOtherLogin\":false,\"addStaffType\":\"add\",\"iframeTheme\":\"#3d5afe\",\"menuBackGround\":\"#ffffff\",\"workbenchHeadBackground\":\"#ffffff\",\"portalWxSupport\":true,\"portalWxImage\":\"http://192.168.0.33/aeoapi/img/show/1739209989313.png\",\"portalTelSupport\":true,\"portalTel\":\"1231\",\"portalOnlineSupport\":true,\"portalOnlineAddress\":\"www.baidu.com\",\"portalAppDownloadSupport\":true,\"portalAppDownloadAddress\":\"www.baidu.com\"}');
COMMIT;

-- ----------------------------
-- Table structure for uac_admin
-- ----------------------------
DROP TABLE IF EXISTS `uac_admin`;
CREATE TABLE `uac_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int(11) DEFAULT '1' COMMENT '帐号启用状态：0->禁用；1->启用',
  `staff_id` bigint(20) DEFAULT NULL COMMENT '员工ID',
  `mobile` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '电话',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_tab` int(11) DEFAULT NULL COMMENT '标签1慧贸贸2运营中心',
  `SECURECONF` varchar(255) CHARACTER SET utf8mb4 DEFAULT '5' COMMENT '安全级别',
  `orgi` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '租户ID',
  `passupdatetime` datetime DEFAULT NULL COMMENT '最后 一次密码修改时间',
  `del` tinyint(4) DEFAULT '0' COMMENT '是否已删除',
  `agent` tinyint(4) DEFAULT NULL COMMENT '工号',
  `datastatus` tinyint(4) DEFAULT NULL COMMENT '数据状态',
  `callcenter` tinyint(4) DEFAULT NULL COMMENT '启用呼叫中心坐席',
  `superadmin` tinyint(4) DEFAULT NULL COMMENT '系统管理员',
  `admin` tinyint(4) DEFAULT NULL COMMENT '管理员',
  `maxuser` int(11) DEFAULT '0' COMMENT '最大接入访客数量',
  `fans` int(11) DEFAULT NULL COMMENT '关注人数',
  `follows` int(11) DEFAULT NULL COMMENT '被关注次数',
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `login` tinyint(11) DEFAULT NULL COMMENT '是否登录',
  `single_res` varchar(100) DEFAULT NULL COMMENT '北京单一窗口用户唯一标识',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8163002868238516435 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户登录信息表';

-- ----------------------------
-- Records of uac_admin
-- ----------------------------
BEGIN;
INSERT INTO `uac_admin` (`id`, `username`, `password`, `icon`, `email`, `nick_name`, `note`, `create_time`, `login_time`, `status`, `staff_id`, `mobile`, `update_time`, `is_tab`, `SECURECONF`, `orgi`, `passupdatetime`, `del`, `agent`, `datastatus`, `callcenter`, `superadmin`, `admin`, `maxuser`, `fans`, `follows`, `integral`, `login`, `single_res`, `user_id`) VALUES (666, 'admin', '$2a$10$g2GugpRtpL7PjKcgN3TeX.V6DIKuxoLq3vRgNweklVobH2aP61q8W', NULL, '965893795@qq.com', '超级管理员', '0', '2020-12-21 18:55:57', '2025-03-06 18:35:25', 1, NULL, NULL, NULL, 2, '5', 'cskefu', NULL, 0, 1, 0, 0, 1, 1, 0, 2, 1, 0, 1, NULL, NULL);
INSERT INTO `uac_admin` (`id`, `username`, `password`, `icon`, `email`, `nick_name`, `note`, `create_time`, `login_time`, `status`, `staff_id`, `mobile`, `update_time`, `is_tab`, `SECURECONF`, `orgi`, `passupdatetime`, `del`, `agent`, `datastatus`, `callcenter`, `superadmin`, `admin`, `maxuser`, `fans`, `follows`, `integral`, `login`, `single_res`, `user_id`) VALUES (816634711924277248, 'zhangsan', '$2a$10$g2GugpRtpL7PjKcgN3TeX.V6DIKuxoLq3vRgNweklVobH2aP61q8W', NULL, NULL, '慧贸os初始用户', NULL, '2021-03-03 11:34:48', NULL, 1, 628284536009392127, '18108231349', '2024-06-26 14:54:13', 1, '5', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for uac_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `uac_admin_role`;
CREATE TABLE `uac_admin_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `admin_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `orgi` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '工作台id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建人',
  `member_id` bigint(20) DEFAULT NULL COMMENT '企业id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1187706310171296110 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户和角色关系表';

-- ----------------------------
-- Records of uac_admin_role
-- ----------------------------
BEGIN;
INSERT INTO `uac_admin_role` (`id`, `role_id`, `admin_id`, `orgi`, `create_time`, `creater`, `member_id`) VALUES (260, 1, 666, 'cskefu', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for uac_bankName
-- ----------------------------
DROP TABLE IF EXISTS `uac_bankName`;
CREATE TABLE `uac_bankName` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(50) DEFAULT NULL COMMENT '银行名称',
  `revision` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='银行类型';

-- ----------------------------
-- Records of uac_bankName
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for uac_dept
-- ----------------------------
DROP TABLE IF EXISTS `uac_dept`;
CREATE TABLE `uac_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `member_id` bigint(20) DEFAULT NULL COMMENT '关联企业id',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `dept_description` varchar(255) DEFAULT NULL COMMENT '部门描述',
  `dept_count` bigint(50) DEFAULT NULL COMMENT '部门下员工数量',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1059342051772076033 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='企业部门表';

-- ----------------------------
-- Records of uac_dept
-- ----------------------------
BEGIN;
INSERT INTO `uac_dept` (`id`, `dept_name`, `member_id`, `created_time`, `update_time`, `dept_description`, `dept_count`, `parent_id`) VALUES (1039396109920899072, 'dep01', 1039337575518703616, '2025-01-15 14:35:54', '2025-01-15 14:35:54', NULL, 1, 1039337575518703616);
INSERT INTO `uac_dept` (`id`, `dept_name`, `member_id`, `created_time`, `update_time`, `dept_description`, `dept_count`, `parent_id`) VALUES (1059342051772076032, '测试部门', 1056780671198040064, '2025-03-11 15:33:57', '2025-03-11 15:33:57', NULL, 1, 1056780671198040064);
COMMIT;

-- ----------------------------
-- Table structure for uac_dept_staff
-- ----------------------------
DROP TABLE IF EXISTS `uac_dept_staff`;
CREATE TABLE `uac_dept_staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  `staff_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1059342123591143425 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='部门用户关联表';

-- ----------------------------
-- Records of uac_dept_staff
-- ----------------------------
BEGIN;
INSERT INTO `uac_dept_staff` (`id`, `dept_id`, `staff_id`) VALUES (1047372772340273152, 1039396109920899072, 1040064697715527680);
INSERT INTO `uac_dept_staff` (`id`, `dept_id`, `staff_id`) VALUES (1059342123591143424, 1059342051772076032, 1039396322995736576);
COMMIT;

-- ----------------------------
-- Table structure for uac_erp
-- ----------------------------
DROP TABLE IF EXISTS `uac_erp`;
CREATE TABLE `uac_erp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `staff_name` varchar(60) DEFAULT NULL COMMENT '企业联系人名称',
  `member_name` varchar(128) NOT NULL COMMENT '企业名称',
  `member_id` bigint(20) DEFAULT NULL COMMENT '企业联系人',
  `role` int(255) DEFAULT NULL COMMENT 'python规定  0：管理员 1：员工',
  `status` int(11) NOT NULL COMMENT '删除',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `revision` int(11) DEFAULT NULL COMMENT '乐观锁',
  `staff_id` bigint(20) NOT NULL COMMENT '企业联系人',
  `member_status` int(255) DEFAULT NULL COMMENT '企业状态',
  `code` varchar(255) DEFAULT NULL COMMENT '标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='ERP同步信息记录表';

-- ----------------------------
-- Records of uac_erp
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for uac_h4a_user
-- ----------------------------
DROP TABLE IF EXISTS `uac_h4a_user`;
CREATE TABLE `uac_h4a_user` (
  `id` int(19) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` varchar(255) DEFAULT NULL COMMENT 'h4a客户端标识',
  `login_name` varchar(255) DEFAULT NULL COMMENT 'h4a账户',
  `org_id` varchar(255) DEFAULT NULL COMMENT 'h4a中组织标识',
  `user_id` varchar(255) DEFAULT NULL COMMENT 'h4a账户标识',
  `user_info` varchar(1024) DEFAULT NULL COMMENT 'h4a用户详细信息',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uac_h4a_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for uac_institution_publicity
-- ----------------------------
DROP TABLE IF EXISTS `uac_institution_publicity`;
CREATE TABLE `uac_institution_publicity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `institution_status` varchar(50) DEFAULT NULL COMMENT '制度状态',
  `institution_url` varchar(255) DEFAULT NULL COMMENT '制度公式文件地址',
  `institution_name` varchar(255) DEFAULT NULL COMMENT '制度公式文件名称',
  `release_dept_id` varchar(255) DEFAULT NULL COMMENT '发布部门id',
  `release_dept_name` varchar(100) DEFAULT NULL COMMENT '发布部门名称',
  `visible_range` varchar(255) DEFAULT NULL COMMENT '可见范围、角色id',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间、上传时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of uac_institution_publicity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for uac_member
-- ----------------------------
DROP TABLE IF EXISTS `uac_member`;
CREATE TABLE `uac_member` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `member_name` varchar(128) DEFAULT NULL COMMENT '企业名称',
  `kind_id` bigint(20) DEFAULT NULL COMMENT '企业类型',
  `member_status` int(11) DEFAULT NULL COMMENT '企业状态',
  `staff_id` bigint(20) DEFAULT NULL COMMENT '企业联系人',
  `staff_name` varchar(60) DEFAULT NULL COMMENT '企业联系人名称',
  `revision` int(11) DEFAULT NULL COMMENT '乐观锁',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(11) NOT NULL COMMENT '删除',
  `stasf_tel` varchar(30) DEFAULT NULL COMMENT '企业联系人电话',
  `atpw_status` int(11) NOT NULL COMMENT '下次不再提示,0为未勾选,1为已勾选',
  `usc_code` varchar(60) DEFAULT NULL COMMENT '统一社会信用代码',
  `remark` varchar(60) NOT NULL DEFAULT '1' COMMENT '备注（是否大屏数据展示0否1是）',
  `logo_img` varchar(300) DEFAULT NULL COMMENT '企业LOGO图片',
  `email` varchar(64) DEFAULT NULL COMMENT '企业邮箱',
  `qr_code` varchar(255) DEFAULT NULL COMMENT '企业二维码',
  `date_time` datetime DEFAULT NULL COMMENT '企业成立时间',
  `legal_person` varchar(30) DEFAULT NULL COMMENT '法人',
  `person_id` bigint(50) DEFAULT NULL COMMENT '法人身份证号',
  `legal_person_email` varchar(40) DEFAULT NULL COMMENT '法人邮箱',
  `legal_person_mobile` varchar(30) DEFAULT NULL COMMENT '法人移动电话',
  `legal_person_tel` varchar(20) DEFAULT NULL COMMENT '法人座机',
  `subscriber_code` varchar(20) DEFAULT NULL COMMENT '用户码',
  `sgs_status` int(1) NOT NULL DEFAULT '0' COMMENT '认证状态',
  `address` varchar(255) DEFAULT NULL COMMENT '企业地址',
  `member_clientId` varchar(50) DEFAULT NULL,
  `is_test` int(1) unsigned zerofill DEFAULT '0' COMMENT '是否参与灰度测试',
  `jump_address` varchar(255) DEFAULT NULL COMMENT '灰度测试跳转地址',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `staff_id` (`staff_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='企业表';

-- ----------------------------
-- Records of uac_member
-- ----------------------------
BEGIN;
INSERT INTO `uac_member` (`id`, `member_name`, `kind_id`, `member_status`, `staff_id`, `staff_name`, `revision`, `created_by`, `created_time`, `updated_by`, `updated_time`, `status`, `stasf_tel`, `atpw_status`, `usc_code`, `remark`, `logo_img`, `email`, `qr_code`, `date_time`, `legal_person`, `person_id`, `legal_person_email`, `legal_person_mobile`, `legal_person_tel`, `subscriber_code`, `sgs_status`, `address`, `member_clientId`, `is_test`, `jump_address`) VALUES (776399085769850881, NULL, 99, NULL, 628284536009392127, NULL, 1, NULL, '2020-11-12 10:52:47.000', NULL, '2020-11-12 10:52:47', 0, NULL, 0, NULL, '1', 'http://aeotrade-launch-advisor.oss-cn-zhangjiakou.aliyuncs.com/00f4222f-9860-4ec7-997c-7fb5076ccfb2.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 'https://train.aeotrade.com/connectNew/#/index');
INSERT INTO `uac_member` (`id`, `member_name`, `kind_id`, `member_status`, `staff_id`, `staff_name`, `revision`, `created_by`, `created_time`, `updated_by`, `updated_time`, `status`, `stasf_tel`, `atpw_status`, `usc_code`, `remark`, `logo_img`, `email`, `qr_code`, `date_time`, `legal_person`, `person_id`, `legal_person_email`, `legal_person_mobile`, `legal_person_tel`, `subscriber_code`, `sgs_status`, `address`, `member_clientId`, `is_test`, `jump_address`) VALUES (1039337575518703616, '慧贸OS初始企业', 1, NULL, 628284536009392127, '慧贸OS初始用户', 0, 927371248940486656, '2025-01-15 10:43:18.101', NULL, NULL, 0, '18230105832', 0, '98632514753215648L', '1', 'http://aeotrade-launch-advisor.oss-cn-zhangjiakou.aliyuncs.com/e71120c3-0102-4e4d-8120-8c413e869633.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '北京市朝阳区', NULL, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for uac_member_staff
-- ----------------------------
DROP TABLE IF EXISTS `uac_member_staff`;
CREATE TABLE `uac_member_staff` (
  `id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `is_admin` int(1) unsigned zerofill DEFAULT NULL COMMENT '是否是子管理员0->不是1->是',
  `created_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `kind_id` bigint(20) DEFAULT NULL COMMENT '企业类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `staff_id` (`staff_id`) USING BTREE,
  KEY `is_admin` (`is_admin`) USING BTREE,
  KEY `creatTime` (`created_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='企业和用户关联信息表';

-- ----------------------------
-- Records of uac_member_staff
-- ----------------------------
BEGIN;
INSERT INTO `uac_member_staff` (`id`, `member_id`, `staff_id`, `is_admin`, `created_time`, `kind_id`) VALUES (1039337575891996672, 776399085769850881, 628284536009392127, 0, '2025-03-13 15:31:17', 1);
INSERT INTO `uac_member_staff` (`id`, `member_id`, `staff_id`, `is_admin`, `created_time`, `kind_id`) VALUES (1039396323016708096, 1039337575518703616, 628284536009392127, 1, '2025-03-13 15:31:15', NULL);
COMMIT;

-- ----------------------------
-- Table structure for uac_member_staff_select
-- ----------------------------
DROP TABLE IF EXISTS `uac_member_staff_select`;
CREATE TABLE `uac_member_staff_select` (
  `id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) NOT NULL,
  `created_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_select` varchar(500) DEFAULT NULL COMMENT '是否勾选0否1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户在某个企业操作页面引导记录表';

-- ----------------------------
-- Records of uac_member_staff_select
-- ----------------------------
BEGIN;
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1039073854011609088, 776399085769850880, 927371248940486656, '2025-01-14 17:15:22', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1039073854015803392, 776399085769850880, 927371248940486656, '2025-01-14 17:15:22', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1039389776102428672, 1039337575518703616, 927371248940486656, '2025-01-15 14:10:44', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"welcomeUseBoxDialog20231018\":1,\"client\":0,\"firstUseBoxCollectTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1039396872713801728, 1039337575518703616, 1039396322995736576, '2025-01-15 14:38:56', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1039396872860602368, 1039337575518703616, 1039396322995736576, '2025-01-15 14:38:56', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1039399132344750080, 1039337575518703616, 1039398412786733056, '2025-01-15 14:47:54', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1039399132353138688, 1039337575518703616, 1039398412786733056, '2025-01-15 14:47:54', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1040064798894723072, 1039337575518703616, 1040064697715527680, '2025-01-17 10:53:02', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"welcomeUseBoxDialog20231018\":1,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1040064798894723073, 1039337575518703616, 1040064697715527680, '2025-01-17 10:53:02', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"welcomeUseBoxDialog20231018\":1,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1040068403597021184, 776399085769850881, 628284536009392127, '2025-01-17 11:07:21', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1040138543801962496, 1040138498918715392, 628284536009392127, '2025-01-17 15:46:04', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"welcomeUseBoxDialog20231018\":1,\"client\":0,\"firstUseBoxCollectTip\":1,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1040138543801962497, 1040138498918715392, 628284536009392127, '2025-01-17 15:46:04', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"welcomeUseBoxDialog20231018\":1,\"client\":0,\"firstUseBoxCollectTip\":1,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1041230657742835712, 1041229666553303040, 628284536009392127, '2025-01-20 16:05:44', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1041230657742835713, 1041229666553303040, 628284536009392127, '2025-01-20 16:05:44', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1041233503917838336, 1041233495923494912, 1039398412786733056, '2025-01-20 16:17:03', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1041233503922032640, 1041233495923494912, 1039398412786733056, '2025-01-20 16:17:03', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1052854168424943616, 1052854015114743808, 628284536009392127, '2025-02-21 17:53:25', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1052854168441720832, 1052854015114743808, 628284536009392127, '2025-02-21 17:53:25', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053818746528993280, 1052855798956429312, 628284536009392127, '2025-02-24 09:46:18', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053818746541576192, 1052855798956429312, 628284536009392127, '2025-02-24 09:46:18', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053820041235140608, 1053819863996436480, 628284536009392127, '2025-02-24 09:51:27', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053832904624443392, 1053824770455506944, 628284536009392127, '2025-02-24 10:42:34', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053845769758576640, 1053844910236635136, 628284536009392127, '2025-02-24 11:33:41', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053888212990300160, 1053888138780479488, 628284536009392127, '2025-02-24 14:22:20', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053888212990300161, 1053888138780479488, 628284536009392127, '2025-02-24 14:22:20', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053904497702735872, 1053904319553867776, 628284536009392127, '2025-02-24 15:27:03', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053904497778233344, 1053904319553867776, 628284536009392127, '2025-02-24 15:27:03', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053905123371257856, 1053905048964304896, 628284536009392127, '2025-02-24 15:29:32', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"welcomeUseBoxDialog20231018\":1,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1,\"firstUseBoxSwitchTip\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053905123371257857, 1053905048964304896, 628284536009392127, '2025-02-24 15:29:32', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"welcomeUseBoxDialog20231018\":1,\"client\":0,\"personCreateOrgTip\":1,\"webVideo\":1,\"firstUseBoxSwitchTip\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053940209676324864, 1053940203129016320, 1039396322995736576, '2025-02-24 17:48:57', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053940209680519168, 1053940203129016320, 1039396322995736576, '2025-02-24 17:48:57', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053940582923243520, 1053940514195378176, 628284536009392127, '2025-02-24 17:50:26', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053940582931632128, 1053940514195378176, 628284536009392127, '2025-02-24 17:50:26', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053940674447151104, 1053940626548199424, 1039396322995736576, '2025-02-24 17:50:48', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1053940674451345408, 1053940626548199424, 1039396322995736576, '2025-02-24 17:50:48', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1056431452058685440, 1056431402112913408, 628284536009392127, '2025-03-03 14:48:16', '{\"clientVideo\":0,\"webNew\":1,\"clientNew\":0,\"web\":0,\"welcomeUseBoxDialog20231018\":1,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1056431452062879744, 1056431402112913408, 628284536009392127, '2025-03-03 14:48:16', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"welcomeUseBoxDialog20231018\":1,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1056780717717065728, 1056780671198040064, 628284536009392127, '2025-03-04 13:56:07', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1056780717721260032, 1056780671198040064, 628284536009392127, '2025-03-04 13:56:07', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1057206278411128832, 1052854912691605504, 628284536009392127, '2025-03-05 18:07:09', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1057206278411128833, 1052854912691605504, 628284536009392127, '2025-03-05 18:07:09', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1057575981696552960, 1057575903896408064, 628284536009392127, '2025-03-06 18:36:13', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1057575981696552961, 1057575903896408064, 628284536009392127, '2025-03-06 18:36:13', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":1}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1060066442948513792, 1039337575518703616, 628284536009392127, '2025-03-13 15:32:25', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":0}');
INSERT INTO `uac_member_staff_select` (`id`, `member_id`, `staff_id`, `created_time`, `is_select`) VALUES (1060066442948513793, 1039337575518703616, 628284536009392127, '2025-03-13 15:32:25', '{\"clientVideo\":0,\"webNew\":0,\"clientNew\":0,\"web\":0,\"client\":0,\"webVideo\":0}');
COMMIT;

-- ----------------------------
-- Table structure for uac_member_synchronization
-- ----------------------------
DROP TABLE IF EXISTS `uac_member_synchronization`;
CREATE TABLE `uac_member_synchronization` (
  `id` bigint(20) NOT NULL,
  `member_id` bigint(50) DEFAULT NULL COMMENT '同步企业id',
  `member_naem` varchar(50) DEFAULT NULL COMMENT '同步企业名',
  `member_uscc` varchar(100) DEFAULT NULL COMMENT '同步企业uscc',
  `synchronous_status` int(10) DEFAULT NULL COMMENT '同步状态0失败1成功',
  `return_result` varchar(100) DEFAULT NULL COMMENT '同步结果',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='企业同步体检智囊日志记录表';

-- ----------------------------
-- Records of uac_member_synchronization
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for uac_member_tag
-- ----------------------------
DROP TABLE IF EXISTS `uac_member_tag`;
CREATE TABLE `uac_member_tag` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `atf_id` bigint(20) DEFAULT NULL COMMENT '企业表_ID',
  `member_id` bigint(20) DEFAULT NULL COMMENT '企业',
  `biz_dict_id` bigint(20) DEFAULT NULL COMMENT '字典',
  `biz_dict_item_id` bigint(20) DEFAULT NULL COMMENT '字典项',
  `biz_dict_item_name` varchar(32) DEFAULT NULL COMMENT '特点',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(11) NOT NULL COMMENT '删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='企业特点';

-- ----------------------------
-- Records of uac_member_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for uac_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `uac_oauth_client_details`;
CREATE TABLE `uac_oauth_client_details` (
  `client_id` varchar(100) NOT NULL,
  `resource_ids` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `authorized_grant_types` varchar(255) DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `access_token_validity` bigint(20) DEFAULT NULL,
  `refresh_token_validity` bigint(20) DEFAULT NULL,
  `additional_information` varchar(255) DEFAULT NULL,
  `autoapprove` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='oauth2配置表';

-- ----------------------------
-- Records of uac_oauth_client_details
-- ----------------------------
BEGIN;
INSERT INTO `uac_oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES ('208ee338c', 'oautn2-resource', '$2a$10$Zm4n/mrh2KHy0D86kx294eJ9kacJsSXnR1UNSnh8bT56Ev7naTIc6', 'read', 'authorization_code', '1', 'ROLE_MEMBER', 60, 60, NULL, 'true');
INSERT INTO `uac_oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES ('74db51f3a', 'oautn2-resource', '$2a$10$BFB6YbOnS6SSB63Z4F/7g.Goi/r.GGaWgG3cK88HuIoV2ldVBbsyC', 'read', 'authorization_code', '1', 'ROLE_MEMBER', 60, 60, NULL, 'true');
INSERT INTO `uac_oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES ('dedbc9a03', 'oautn2-resource', '$2a$10$LedeH8XAHn7/U8NMeoGxxOOZUGNfQdSFcXBpVgTBr8Ib7PwasFBLC', 'read', 'authorization_code', '1', 'ROLE_MEMBER', 60, 60, NULL, 'true');
INSERT INTO `uac_oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES ('mobile', 'oauth2-resource', '$2a$10$0xnE7KLKhTQY36lgLZQeN.bEM2yTarSotNrpK2SXCo46CEZ5nA8Ka', 'read', 'cms_code,refresh_token', 'http://www.newbee.cn:8052/oauth2-client/thirdLogin/WeChat', 'ROLE_MEMBER', 7776000, 2592000, NULL, 'false');
INSERT INTO `uac_oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES ('password_code', 'oauth2-resource', '$2a$10$0xnE7KLKhTQY36lgLZQeN.bEM2yTarSotNrpK2SXCo46CEZ5nA8Ka', 'read', 'password_code,refresh_token', 'http://www.newbee.cn:8052/oauth2-client/thirdLogin/WeChat', 'ROLE_MEMBER', 7776000, 2592000, NULL, 'false');
INSERT INTO `uac_oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES ('wechat', 'oauth2-resource', '$2a$10$WydWTT.y90J15Jya4MHzouQzwRbajETH1U974/oulfZOChVV6xUzO', 'read', 'password,refresh_token', 'http://www.newbee.cn:8052/oauth2-client/thirdLogin/WeChat', 'ROLE_MEMBER', 7776000, 2592000, NULL, 'false');
INSERT INTO `uac_oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES ('wx', 'oauth2-resource', '$2a$10$nUF.UOAFg0Nrq/jcI5YgmucUdUAv8injFN4ETadIx1DwATtiHwrMq', 'read', 'openId,refresh_token', 'http://www.newbee.cn:8052/oauth2-client/thirdLogin/WeChat', 'ROLE_MEMBER', 7776000, 2592000, NULL, 'false');
COMMIT;

-- ----------------------------
-- Table structure for uac_resource
-- ----------------------------
DROP TABLE IF EXISTS `uac_resource`;
CREATE TABLE `uac_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) DEFAULT NULL COMMENT '资源URL',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `category_id` bigint(20) DEFAULT NULL COMMENT '资源分类ID',
  `dicid` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '权限ID',
  `dicvalue` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '权限代码',
  `orgi` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '租户ID',
  `update_time` datetime DEFAULT NULL COMMENT '创建时间',
  `role_id` bigint(32) DEFAULT NULL COMMENT '角色ID',
  `creater` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='慧贸资源表';

-- ----------------------------
-- Records of uac_resource
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for uac_resource_category
-- ----------------------------
DROP TABLE IF EXISTS `uac_resource_category`;
CREATE TABLE `uac_resource_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='资源分类表';

-- ----------------------------
-- Records of uac_resource_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for uac_role
-- ----------------------------
DROP TABLE IF EXISTS `uac_role`;
CREATE TABLE `uac_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `admin_count` int(11) DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT '1' COMMENT '启用状态：0->禁用；1->启用',
  `sort` int(11) DEFAULT '0',
  `code` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '代码',
  `creater` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建人',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `orgi` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '租户ID',
  `orgid` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '企业ID',
  `username` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '用户名',
  `organ` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '部门',
  `platform` int(20) DEFAULT NULL COMMENT '所属平台1服务平台2运营平台3独立应用4erp',
  `is_model` int(11) DEFAULT NULL COMMENT '是否为模板',
  `platform_id` bigint(20) DEFAULT NULL COMMENT '所属工作台id',
  `is_default` int(11) DEFAULT NULL COMMENT '是否是默认角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
-- Records of uac_role
-- ----------------------------
BEGIN;
INSERT INTO `uac_role` (`id`, `name`, `description`, `admin_count`, `create_time`, `status`, `sort`, `code`, `creater`, `updatetime`, `orgi`, `orgid`, `username`, `organ`, `platform`, `is_model`, `platform_id`, `is_default`) VALUES (1, '超级管理员', '拥有所有权限', 1, '2020-12-22 08:56:35', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, NULL);
INSERT INTO `uac_role` (`id`, `name`, `description`, `admin_count`, `create_time`, `status`, `sort`, `code`, `creater`, `updatetime`, `orgi`, `orgid`, `username`, `organ`, `platform`, `is_model`, `platform_id`, `is_default`) VALUES (122, 'role01', '', NULL, '2025-01-15 14:36:25', 1, 0, NULL, NULL, NULL, NULL, '1039337575518703616', NULL, NULL, 1, 0, 775784301441581056, 0);
INSERT INTO `uac_role` (`id`, `name`, `description`, `admin_count`, `create_time`, `status`, `sort`, `code`, `creater`, `updatetime`, `orgi`, `orgid`, `username`, `organ`, `platform`, `is_model`, `platform_id`, `is_default`) VALUES (123, '客户管理', NULL, 0, '2025-01-17 14:12:59', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1, NULL);
INSERT INTO `uac_role` (`id`, `name`, `description`, `admin_count`, `create_time`, `status`, `sort`, `code`, `creater`, `updatetime`, `orgi`, `orgid`, `username`, `organ`, `platform`, `is_model`, `platform_id`, `is_default`) VALUES (124, '默认角色', ' ', NULL, '2025-02-24 16:22:10', 1, 0, NULL, NULL, '2025-02-24 16:22:47', NULL, '0', NULL, '99', 3, 1, 925322469965824000, 1);
INSERT INTO `uac_role` (`id`, `name`, `description`, `admin_count`, `create_time`, `status`, `sort`, `code`, `creater`, `updatetime`, `orgi`, `orgid`, `username`, `organ`, `platform`, `is_model`, `platform_id`, `is_default`) VALUES (125, '默认角色', '', NULL, '2025-02-24 16:25:09', 1, 0, NULL, NULL, NULL, NULL, '0', NULL, NULL, 1, 1, 775784301441581056, 1);
INSERT INTO `uac_role` (`id`, `name`, `description`, `admin_count`, `create_time`, `status`, `sort`, `code`, `creater`, `updatetime`, `orgi`, `orgid`, `username`, `organ`, `platform`, `is_model`, `platform_id`, `is_default`) VALUES (126, 'default', '', NULL, '2025-03-11 15:33:49', 1, 0, NULL, NULL, NULL, NULL, '1056780671198040064', NULL, NULL, 1, 0, 775786629070585856, 0);
COMMIT;

-- ----------------------------
-- Table structure for uac_role_docment
-- ----------------------------
DROP TABLE IF EXISTS `uac_role_docment`;
CREATE TABLE `uac_role_docment` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `document_type_id` bigint(20) DEFAULT NULL COMMENT '文件单证类型id',
  `document_type_name` varchar(100) DEFAULT NULL COMMENT '文件单证类型名称',
  `document_type_name_en` varchar(100) DEFAULT NULL COMMENT '文件单证类型标识',
  `visible_range` varchar(255) DEFAULT NULL COMMENT '可见范围',
  `visible_field` varchar(255) DEFAULT NULL COMMENT '可见字段',
  `is_uploading` int(10) DEFAULT NULL COMMENT '是否可以上传',
  `is_download` int(10) DEFAULT NULL COMMENT '是否可以下载',
  `is_delete` int(10) DEFAULT NULL COMMENT '是否可以删除',
  `is_export` int(10) DEFAULT NULL COMMENT '是否可以导出',
  `is_look` int(10) DEFAULT NULL COMMENT '是否可见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色与单证文件关联表';

-- ----------------------------
-- Records of uac_role_docment
-- ----------------------------
BEGIN;
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919622052581376, 124, 1021836787829440512, '熏蒸证书', 'dec_attachment_20000017', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919622409097216, 124, 1057389178603438080, '会计凭证', 'i_certificate_account', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919622732058624, 124, 1029489054053302272, '运输工具安全检查记录', 'atci_archive_file_document_49', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919623084380160, 124, 1009127662376976384, '特许权使用费其他材料', 'dec_attachment_00000016', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919623298289664, 124, 1131587647123226624, '抑制剂或稳定剂情况说明', 'dec_attachment_80000002', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919624770490368, 124, 1009127533964165120, '代扣代缴税款纳税凭证', 'dec_attachment_00000015', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919624980205568, 124, 1029488187308769280, '场所设施设备检查维修记录', 'atci_archive_file_document_35', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919625198309376, 124, 1037083957314715648, '园区服务成效证明材料', 'atci_archive_file_document_59', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919625412218880, 124, 1029485971273416704, '追责与改进制度', 'atci_archive_file_document_24', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919625743568896, 124, 1021832167837138944, '型式试验报告', 'dec_attachment_20000024', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919626066530304, 124, 1029488256347013120, '人员车辆进出安全制度', 'atci_archive_file_document_36', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919626280439808, 124, 1009124502371565568, '化学品进出口环境管理登记证明', 'dec_attachment_60000011', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919626490155008, 124, 1029484464243212288, '组织架构图', 'atci_archive_file_document_12', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919626704064512, 124, 1009127255563042816, '特许权使用费发票', 'dec_attachment_00000013', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919626917974016, 124, 1029489102875000832, '危机管理制度', 'atci_archive_file_document_50', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919627131883520, 124, 1029486457242255360, '数据管理制度', 'atci_archive_file_document_28', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919627589062656, 124, 1040318510858764288, '人事任命文件', 'atci_archive_file_document_61', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919627836526592, 124, 1021832885734211584, 'TCK检验证书（美国小麦）', 'dec_attachment_20000016', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919628050436096, 124, 1021828625176985600, '军品出口许可证', 'dec_attachment_60000003', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919628264345600, 124, 1029484868456677376, '单证复核及纠错制度', 'atci_archive_file_document_14', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919628474060800, 124, 1063149917540712448, '增值税数电发票', 'a_type_e_invoice', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919628692164608, 124, 1029486182934773760, '系统手册', 'atci_archive_file_document_26', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919628906074112, 124, 1021828737450115072, '民用爆炸品出口审批单', 'dec_attachment_60000002', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919629119983616, 124, 1029485753773588480, '内审记录', 'atci_archive_file_document_21', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919629472305152, 124, 1131588212381188096, '检疫处理结果报告单', 'dec_attachment_20000028', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919629702991872, 124, 1009126943758483456, '特许权使用费涉及的原进口货物报关单海关编号', 'dec_attachment_00000011', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919629984010240, 124, 1131588311635197952, '出口证明信', 'dec_attachment_00000017', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919630197919744, 124, 1029489216913932288, '贸易及供应链安全培训记录', 'atci_archive_file_document_52', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919630411829248, 124, 1021828537503449088, '人类遗传资源材料出口、出境证明', 'dec_attachment_60000004', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919630659293184, 124, 1029488959937314816, '集装箱检查记录封条发放记录', 'atci_archive_file_document_47', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919630873202688, 124, 1037083458565832704, '参评园区承诺书', 'atci_archive_file_document_55', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919631087112192, 124, 1021829212215967744, '特殊用途销售包装化妆品成品应当提供相应的卫生许可批件或者具有相关资质的机构出具的是否存在安全性风险物质的有关安全性评估资料(仅限首次出口时提供)', 'dec_attachment_50000014', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919631301021696, 124, 1029488637848322048, '商业伙伴安全监控检查记录', 'atci_archive_file_document_42', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919631519125504, 124, 1040318617062735872, '印章证件及证书管理制度', 'atci_archive_file_document_62', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919631749812224, 124, 1029488578138210304, '商业伙伴安全制度', 'atci_archive_file_document_41', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919631980498944, 124, 1029488698430849024, '商业伙伴清单', 'atci_archive_file_document_43', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919632211185664, 124, 1021833718123200512, '水果预检验证书', 'dec_attachment_20000020', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919632441872384, 124, 1021832691860897792, '危险特性分类鉴别报告', 'dec_attachment_20000023', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919632672559104, 124, 1029484382609473536, '海关法律法规培训记录', 'atci_archive_file_document_11', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919632903245824, 124, 1024366920687681536, '项目申报单位承诺书', 'atci_archive_file_document_06', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919633226207232, 124, 1021831262240768000, '引进种子、苗木检疫审批单', 'dec_attachment_50000006', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919633456893952, 124, 1021828436152287232, '古生物化石出口、出境批件', 'dec_attachment_60000005', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919633754689536, 124, 1021831356964929536, '农业转基因生物安全证书', 'dec_attachment_50000005', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919633985376256, 124, 1024365542372278272, '资金申请表', 'atci_archive_file_document_01', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919634220257280, 124, 1024367174476627968, '项目单位近两年财务报表、纳税申报表及完税证明', 'atci_archive_file_document_08', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919634467721216, 124, 1029488764231090176, '货物出入库管理制度', 'atci_archive_file_document_44', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919634719379456, 124, 1040318704857907200, '印章证件及证书使用记录', 'atci_archive_file_document_63', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919635075895296, 124, 1040318829428736000, '系统单证数据比对记录', 'atci_archive_file_document_64', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919635319164928, 124, 1029486398173872128, '系统截屏', 'atci_archive_file_document_27', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919635570823168, 124, 1029485071079309312, '复核记录', 'atci_archive_file_document_16', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919635822481408, 124, 1040319117493534720, '员工证件发放回收记录', 'atci_archive_file_document_67', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919636074139648, 124, 1040319710299684864, '应急处置模拟演练记录', 'atci_archive_file_document_73', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919636564873216, 124, 1029488829460905984, '货物物品安全记录', 'atci_archive_file_document_45', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919636812337152, 124, 1029487846148276224, '系统故障应急处置记录', 'atci_archive_file_document_30', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919637072384000, 124, 1045096908386729984, '银行回单', 'i_bank_receipt', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919637311459328, 124, 1029484629368766464, '岗位职责分工', 'atci_archive_file_document_13', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919637563117568, 124, 1024367038547623936, '项目单位法人证明文件复印件', 'atci_archive_file_document_07', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919637886078976, 124, 1029485213886971904, '进出口货物安全管理制度', 'atci_archive_file_document_18', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919638200651776, 124, 1021833300152418304, '植物检疫证书', 'dec_attachment_20000013', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919638523613184, 124, 1021828369651597312, '密码出口许可证', 'dec_attachment_60000006', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919638842380288, 124, 1021833515693506560, '放射性物质检测合格证明', 'dec_attachment_20000018', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919639110815744, 124, 1021831870737809408, '微生物检测报告（沙门氏菌、产志贺毒素大肠杆菌、金黄色葡萄球菌、单增李斯特菌）', 'dec_attachment_20000026', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919639358279680, 124, 1021832785582620672, '检测报告', 'dec_attachment_20000022', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919639651880960, 124, 1021829332529577984, '化妆品生产许可证(仅限首次出口时提供)', 'dec_attachment_50000013', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919639828041728, 124, 1021829422757445632, '捕捞船舶登记证和捕捞许可证（野生捕捞水生动物）', 'dec_attachment_50000012', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919640008396800, 124, 1009124952495882240, '医疗用毒性药品进出口批件', 'dec_attachment_60000008', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919640184557568, 124, 1021833606206586880, '木材发货检验码单', 'dec_attachment_20000019', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919640364912640, 124, 1029485150624284672, '单证保管制度', 'atci_archive_file_document_17', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919640541073408, 124, 1131587419599011840, '安全数据单', 'dec_attachment_80000004', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919640717234176, 124, 1037083222749478912, '北京市跨境电商园区总体评价表', 'atci_archive_file_document_54', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919640893394944, 124, 1029488316149399552, '人员车辆进出登记记录', 'atci_archive_file_document_37', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919641069555712, 124, 1029487921012408320, '信息安全培训制度', 'atci_archive_file_document_31', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919641249910784, 124, 1037083858454970368, '园区运营情况证明材料', 'atci_archive_file_document_58', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919641426071552, 124, 1009127985145446400, '减免税货物税款担保证明', 'dec_attachment_10000002', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919641602232320, 124, 1021833838487142400, '中转进境确认证明文件（经港澳地区中转入境水果）', 'dec_attachment_20000021', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919641782587392, 124, 1021831459360473088, '重量证书', 'dec_attachment_20000015', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919641954553856, 124, 1021834014866014208, '进口化妆品卫生许可批件', 'dec_attachment_50000009', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919642134908928, 124, 1029488084674150400, '场所安全制度', 'atci_archive_file_document_34', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919642311069696, 124, 1024366452221673472, '项目申报书', 'atci_archive_file_document_03', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919642487230464, 124, 1029488029057679360, '人员守法记录', 'atci_archive_file_document_33', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919642667585536, 124, 1009125129562619904, '援外项目任务通知单', 'dec_attachment_60000007', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919642843746304, 124, 1029488892480323584, '集装箱安全制度', 'atci_archive_file_document_46', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919643019907072, 124, 1029483858929647616, '海关法律法规培训制度', 'atci_archive_file_document_10', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919643196067840, 124, 1029485504086671360, '内审制度', 'atci_archive_file_document_20', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919643372228608, 124, 1021831954170904576, '动物检疫合格证明（国产原料）；进境货物检疫证明、原产国检验证书（进口原料）', 'dec_attachment_20000025', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919643812630528, 124, 1029486122880729088, '追责与改进记录', 'atci_archive_file_document_25', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919643988791296, 124, 1029487974145851392, '审计报告', 'atci_archive_file_document_32', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919644169146368, 124, 1037083744118243328, '园区服务规模证明材料', 'atci_archive_file_document_57', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919644345307136, 124, 1037084062063263744, '园区创新能力证明材料', 'atci_archive_file_document_60', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919644521467904, 124, 1131587773799596032, '企业符合性声明', 'dec_attachment_80000001', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919644701822976, 124, 1021831787556372480, '出口水产品成品检验报告', 'dec_attachment_20000027', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919644877983744, 124, 1024366544261480448, '项目已发生费用明细表', 'atci_archive_file_document_04', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919645049950208, 124, 1009128116309721088, '减免税货物税款担保延期证明', 'dec_attachment_10000003', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919645230305280, 124, 1029484977248534528, '复核岗位人员名单', 'atci_archive_file_document_15', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919645406466048, 124, 1021833196691521536, '装运前检验证书', 'dec_attachment_20000014', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919645586821120, 124, 1021830405654839296, '保健食品注册证书/备案凭证', 'dec_attachment_50000011', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919645779759104, 124, 1024366729905569792, '项目申请情况表', 'atci_archive_file_document_05', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919645972697088, 124, 1024366201641369600, '项目情况介绍书', 'atci_archive_file_document_02', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919646169829376, 124, 1131587552193544192, '危险公示标签', 'dec_attachment_80000003', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919646366961664, 124, 1029485816130306048, '质量管理制度', 'atci_archive_file_document_22', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919646559899648, 124, 1009127396537794560, '特许权使用费支付凭证', 'dec_attachment_00000014', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919646757031936, 124, 1029485447132217344, '进出口活动流程图', 'atci_archive_file_document_19', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919646949969920, 124, 1040319579479343104, '信息安全培训记录', 'atci_archive_file_document_72', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919647428120576, 124, 1040319201924874240, '货物装运及异常处置记录', 'atci_archive_file_document_68', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919647784636416, 124, 1009864997813092352, '远洋自捕水产品的确认通知（文件）和远洋渔业项目确认表、农业部远洋渔业企业资格证书', 'dec_attachment_50000007', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919647981768704, 124, 1021830690850734080, '特殊医学用途配方食品注册证书', 'dec_attachment_50000010', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919648195678208, 124, 1029489158873153536, '应急处置记录', 'atci_archive_file_document_51', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919648409587712, 124, 1131587897468649472, '质量安全符合性声明', 'dec_attachment_20000030', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919648619302912, 124, 1009124820698267648, '放射性药品进出口批件', 'dec_attachment_60000009', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919648833212416, 124, 1024367260300476416, '其他与项目相关的证明材料', 'atci_archive_file_document_09', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919650158612480, 124, 1029487720310767616, '信息安全制度', 'atci_archive_file_document_29', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919650414465024, 124, 1029489004522766336, '运输工具安全制度', 'atci_archive_file_document_48', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919650624180224, 124, 1040318936542871552, '场所监控照明分布图', 'atci_archive_file_document_65', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919650838089728, 124, 1029489279669108736, '贸易及供应链安全培训记录', 'atci_archive_file_document_53', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919651278491648, 124, 1040319499552686080, '商业伙伴合同协议记录', 'atci_archive_file_document_71', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919651744059392, 124, 1040319400818769920, '运输过程监控及异常处置记录', 'atci_archive_file_document_70', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919652155101184, 124, 1040319040125403136, '场所进入授权及出入记录', 'atci_archive_file_document_66', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919652369010688, 124, 1037083572676067328, '跨境电商产业园区介绍', 'atci_archive_file_document_56', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919652578725888, 124, 1021831572711538688, '企业提供的标签标识', 'dec_attachment_50000003', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919652792635392, 124, 1029485909042528256, '质量管理记录', 'atci_archive_file_document_23', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919653006544896, 124, 1021828815661301760, '民用爆炸品进口审批单', 'dec_attachment_60000001', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919653220454400, 124, 1029488520533639168, '员工清单', 'atci_archive_file_document_40', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919653430169600, 124, 1029488460571869184, '入职离职员工档案', 'atci_archive_file_document_39', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919653644079104, 124, 1040319294367334400, '集装箱及存放场所检查记录', 'atci_archive_file_document_69', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919653862182912, 124, 1009124702100127744, '血液出口批件', 'dec_attachment_60000010', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919654076092416, 124, 1029488391902724096, '人员招聘入职及离职管理制度', 'atci_archive_file_document_38', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919654285807616, 124, 1021826183366443008, '特种设备制造许可证', 'dec_attachment_50000008', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919654499717120, 124, 977792143743651840, '数字提单', 'i_digital_bill_of_lading', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919654713626624, 124, 961104025841963008, '修撤单', 'i_dec_mod_message', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919654927536128, 124, 1008787066961526784, '报关单', 'a_type_dec_message', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919655137251328, 124, 1008779597375864832, '退税单', 'i_cto_message', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919655351160832, 124, 1008785062038077440, '核注清单', 'check_register', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919655816728576, 124, 1008784899122921472, '税费单', 'i_tax-message', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919656169050112, 124, 1008785220763123712, '跨境进出口清单', 'ceb_export_inventory', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919656382959616, 124, 1008785379035185152, '增值税普通发票', 'zengzhishui', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919656596869120, 124, 1008786301110976512, '发票', 'dec_attachment_00000001', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919656814972928, 124, 1008786654468505600, '合同', 'dec_attachment_00000004', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919657024688128, 124, 1008795929970475008, '代理报关委托协议（纸质）', 'dec_attachment_00000008', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919657238597632, 124, 1009111514713423872, '代理报关委托协议（电子）', 'dec_attachment_10000001', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919657452507136, 124, 1009115606907092992, '兽医(卫生)证书', 'dec_attachment_20000011', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919657666416640, 124, 1009111750076792832, '载货清单（舱单）', 'dec_attachment_00000010', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919658014543872, 124, 1009128279627530240, '跨境B2B出口单证', 'dec_attachment_10000004', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919658228453376, 124, 1008786410519396352, '装箱单', 'dec_attachment_00000002', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919658442362880, 124, 1009127109857116160, '特许权使用费合同/协议', 'dec_attachment_00000012', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919658656272384, 124, 1008785763422175232, '采购订单', 'i_purchase_order_message', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919658865987584, 124, 1009120912638738432, '企业提供的证明材料', 'dec_attachment_50000001', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919659079897088, 124, 1008785527651958784, '销售订单', 'i_sales_order_message', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919659298000896, 124, 1008786190842724352, '报关单标准版式', 'i_dec_pdf', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919659511910400, 124, 1009120615551991808, '企业提供的其他', 'dec_attachment_50000004', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919660006838272, 124, 1009126727911211008, '报关单回执', 'i_dec_result', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919660417880064, 124, 1009120332939788288, '企业提供的声明', 'dec_attachment_50000002', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919660631789568, 124, 1009113730002190336, '原产地证据文件', 'dec_attachment_00000009', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919660845699072, 124, 1009128449375207424, '动物检疫证书', 'dec_attachment_20000012', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919661076385792, 124, 1008786535685816320, '提/运单', 'dec_attachment_00000003', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `uac_role_docment` (`id`, `role_id`, `document_type_id`, `document_type_name`, `document_type_name_en`, `visible_range`, `visible_field`, `is_uploading`, `is_download`, `is_delete`, `is_export`, `is_look`) VALUES (1053919661307072512, 124, 1008786008814125056, '物流工单', 'i_work_sheet_message', NULL, NULL, NULL, NULL, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for uac_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `uac_role_menu`;
CREATE TABLE `uac_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `menu_id` (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1096170660985588743 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色与菜单关联表';

-- ----------------------------
-- Records of uac_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588003, 123, 32);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588004, 123, 43);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588005, 123, 44);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588006, 123, 46);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588007, 123, 172);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588008, 123, 48);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588009, 123, 70);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588010, 123, 71);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588011, 123, 72);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588012, 123, 73);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588013, 123, 74);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588014, 123, 55);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588015, 123, 56);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588016, 123, 57);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588017, 123, 118);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588018, 123, 58);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588019, 123, 59);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588020, 123, 60);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588021, 123, 171);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588504, 124, 925327809017020416);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588505, 124, 925329521425514496);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588506, 124, 925350660700897280);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588507, 124, 1050352813357400064);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588508, 124, 1005071560093990912);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588509, 124, 1054795283839320064);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588510, 124, 1004066102575104000);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588511, 124, 1004066415600205824);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588512, 124, 1004066749525524480);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588513, 124, 925351909995315200);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588514, 124, 1054799381087125504);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588515, 124, 1003629631259017216);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588516, 124, 1003631185181540352);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588517, 124, 1006584261878218752);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588518, 124, 1079826807844241408);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588519, 124, 1003687246479491072);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588520, 124, 1055147245055246336);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588521, 124, 1054801061631492096);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588522, 124, 1023909539142959104);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588523, 124, 1023910117197742080);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588524, 124, 1175035460578181170);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588525, 124, 1175035460578181171);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588526, 124, 925349296939728896);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588527, 124, 925385993823977472);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588528, 124, 925386116268294144);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588529, 124, 925386363132444672);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588530, 124, 1126810898783010816);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588531, 124, 1126811244091670528);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588532, 124, 1126811503559704576);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588533, 124, 1054803593313386496);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588534, 124, 925348536881512448);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588535, 124, 925385264518397952);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588536, 124, 1054804220194062336);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588537, 124, 925385443334160384);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588538, 124, 1054806100815118336);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588539, 124, 925348365581942784);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588540, 124, 925385043122061312);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588541, 124, 1054806619692466176);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588542, 124, 925384591009644544);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588543, 124, 933678909508026368);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588544, 124, 933679597923336192);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588545, 124, 1054808561462280192);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588546, 124, 978693330697191424);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588547, 124, 978693982823383040);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588548, 124, 1054809445063720960);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588549, 124, 1054809786664615936);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588550, 124, 1050353737010249728);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588551, 124, 926119649869824000);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588552, 124, 926120300381208576);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588553, 124, 926122113574633472);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588554, 124, 926120453360058368);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588555, 124, 926122348573097984);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588556, 124, 1007225877030764544);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588557, 124, 1007226046853939200);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588558, 124, 1007226438673235968);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588559, 124, 1007226568759574528);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588560, 124, 1007222032678518784);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588561, 124, 1007222314669965312);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588562, 124, 1170039115438096384);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588563, 124, 1035555661812858880);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588564, 124, 1035552746519920640);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588565, 124, 1035552920591925248);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588566, 124, 1035552989927964672);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588567, 124, 1035553882786234368);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588568, 124, 1035554098528649216);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588569, 124, 1035554191923216384);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588570, 124, 1035554628013391872);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588571, 124, 1035554721282129920);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588572, 124, 1036662675062390784);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588573, 124, 1035555323013758976);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588574, 124, 1035555963974713344);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588575, 124, 1035554837900558336);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588576, 124, 1035555223025745920);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588577, 124, 1035555438331953152);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588578, 124, 1035555090053726208);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588579, 124, 1035563830790324224);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588580, 124, 1035563975246348288);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588581, 124, 1035564128241975296);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588582, 124, 1035564251470626816);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588583, 124, 1035564421465767936);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588584, 124, 1035564744779497472);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588585, 124, 1035564881140514816);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588586, 124, 1035564992205684736);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588587, 124, 1035565303561453568);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588588, 124, 1035565618767593472);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588589, 124, 1055147615206768640);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588590, 124, 1035555815534100480);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588591, 124, 1035556232577941504);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588592, 124, 1035566299486355456);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588593, 124, 1035552971456249856);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588594, 124, 1035556737018494976);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588595, 124, 1035553088301170688);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588596, 124, 1037333245101867008);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588597, 124, 1035553927929528320);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588598, 124, 1035554819344957440);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588599, 124, 1035558459392655360);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588600, 124, 1035553603416227840);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588601, 124, 1035553744374202368);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588602, 124, 1035558570592043008);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588603, 124, 1035557977815252992);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588604, 124, 1035555187223166976);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588605, 124, 1035558093326385152);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588606, 124, 1035558228194230272);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588607, 124, 1036674131732463616);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588608, 124, 1035556949409660928);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588609, 124, 1035558655262457856);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588610, 124, 1035558772237402112);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588611, 124, 1035557183892226048);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588612, 1, 32);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588613, 1, 43);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588614, 1, 44);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588615, 1, 46);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588616, 1, 172);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588617, 1, 48);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588618, 1, 70);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588619, 1, 71);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588620, 1, 72);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588621, 1, 73);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588622, 1, 74);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588623, 1, 55);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588624, 1, 56);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588625, 1, 57);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588626, 1, 118);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588627, 1, 58);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588628, 1, 59);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588629, 1, 60);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588630, 1, 171);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588631, 1, 14);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588632, 1, 1096169804550635520);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588633, 1, 1096170042694828032);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588634, 1, 41);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588635, 1, 42);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588636, 1, 61);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588637, 1, 62);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588638, 1, 63);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588639, 1, 28);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588640, 1, 30);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588641, 1, 29);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588642, 1, 84);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588643, 1, 85);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588644, 1, 86);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588645, 1, 88);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588646, 1, 90);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588647, 1, 96);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588648, 1, 97);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588649, 1, 98);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588650, 1, 107);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588651, 1, 1096170247376863232);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588652, 1, 1096170424275828736);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588653, 1, 1096170561169522688);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588654, 1, 1175035460578181146);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588655, 1, 1175035460578181147);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588656, 1, 1175035460578181148);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588657, 1, 1175035460578181149);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588658, 1, 1175035460578181150);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588659, 1, 1175035460578181151);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588660, 1, 31);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588661, 1, 33);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588662, 1, 34);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588663, 1, 1175035460578181281);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588664, 1, 1175035460578181283);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588665, 1, 1096166410985406464);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588666, 1, 1096166932903624704);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588667, 1, 1096167103683100672);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588668, 1, 1175035460578181164);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588669, 1, 119);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588670, 1, 161);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588671, 1, 162);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588672, 1, 163);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588673, 1, 164);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588674, 1, 165);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588675, 1, 120);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588676, 1, 121);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588677, 1, 122);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588678, 1, 166);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588679, 1, 168);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588680, 1, 1175035460578181249);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588681, 1, 1175035460578181250);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588682, 1, 1175035460578181251);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588683, 1, 1175035460578181252);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588684, 1, 1175035460578181253);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588685, 1, 1175035460578181254);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588686, 1, 1175035460578181255);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588687, 1, 1175035460578181258);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588688, 1, 1175035460578181257);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588689, 1, 1175035460578181261);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588690, 1, 1175035460578181262);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588691, 1, 1175035460578181256);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588692, 1, 1175035460578181259);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588693, 1, 1175035460578181264);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588694, 1, 1175035460578181267);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588695, 1, 1175035460578181270);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588696, 1, 1175035460578181271);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588697, 1, 1175035460578181272);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588698, 1, 1175035460578181273);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588699, 1, 1175035460578181274);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588700, 1, 1175035460578181275);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588701, 1, 1175035460578181268);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588702, 1, 1175035460578181276);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588703, 1, 1175035460578181277);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588704, 1, 1175035460578181278);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588705, 1, 1175035460578181269);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588706, 1, 1175035460578181279);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588707, 1, 1175035460578181280);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588708, 1, 1175035460578181260);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588709, 1, 1175035460578181263);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588710, 1, 1175035460578181265);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588711, 1, 1175035460578181266);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588712, 1, 256);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588713, 1, 928614148273602560);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588714, 1, 928614997594996736);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588715, 1, 928615122610421760);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588716, 1, 928615224280350720);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588717, 1, 931548478578884608);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588718, 1, 928615334020120576);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588719, 1, 928615795825573888);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588720, 1, 257);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588721, 1, 12);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588722, 1, 13);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588723, 1, 76);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588724, 1, 79);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588725, 1, 80);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588726, 1, 81);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588727, 1, 82);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588728, 1, 258);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588729, 1, 77);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588730, 1, 927963804698935296);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588731, 1, 921333817862520832);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588732, 1, 262);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588733, 1, 263);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588734, 1, 928364343811112960);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588735, 1, 921334221933379584);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588736, 1, 1013810070858760192);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588737, 1, 1088102581248458752);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588738, 1, 1088103152164536320);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588739, 1, 1088104503116300288);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588740, 1, 1175035460578181137);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588741, 1, 1175035460578181138);
INSERT INTO `uac_role_menu` (`id`, `role_id`, `menu_id`) VALUES (1096170660985588742, 1, 1175035460578181139);
COMMIT;

-- ----------------------------
-- Table structure for uac_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `uac_role_resource`;
CREATE TABLE `uac_role_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `resource_id` bigint(20) DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台角色资源关系表';

-- ----------------------------
-- Records of uac_role_resource
-- ----------------------------
BEGIN;
INSERT INTO `uac_role_resource` (`id`, `role_id`, `resource_id`) VALUES (1, 1, 1);
INSERT INTO `uac_role_resource` (`id`, `role_id`, `resource_id`) VALUES (2, 1, 2);
INSERT INTO `uac_role_resource` (`id`, `role_id`, `resource_id`) VALUES (3, 1, 3);
COMMIT;

-- ----------------------------
-- Table structure for uac_staff
-- ----------------------------
DROP TABLE IF EXISTS `uac_staff`;
CREATE TABLE `uac_staff` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `member_id` bigint(20) DEFAULT NULL COMMENT '企业ID',
  `staff_name` varchar(64) DEFAULT NULL COMMENT '客服名称',
  `staff_status` varchar(32) DEFAULT NULL COMMENT '个人实名认证状态0未绑定1绑定',
  `login_account` varchar(1000) DEFAULT NULL COMMENT '登录帐号',
  `login_paswd` varchar(128) DEFAULT NULL COMMENT '登录密码',
  `wx_openid` varchar(128) DEFAULT NULL COMMENT '微信OpenId',
  `wx_logo` varchar(300) DEFAULT NULL COMMENT '头像',
  `revision` int(11) DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(11) DEFAULT NULL COMMENT '删除',
  `dept` varchar(60) DEFAULT NULL COMMENT '部门',
  `role` varchar(60) DEFAULT NULL COMMENT '角色 管理员 :admin 普通员工:user',
  `sgs_status` int(11) NOT NULL COMMENT '绑定微信状态 未绑定 0 ;已绑定 1',
  `tel` varchar(32) DEFAULT NULL COMMENT '手机号',
  `wx_unionid` varchar(255) DEFAULT NULL COMMENT '微信unionid',
  `contact_email` varchar(255) DEFAULT NULL COMMENT '联系人邮箱',
  `contact_qq` varchar(255) DEFAULT NULL COMMENT '联系人QQ',
  `contact_weixin` varchar(255) DEFAULT NULL COMMENT '联系人微信ID',
  `contact_weixinqr` varchar(255) DEFAULT NULL COMMENT '联系人微信二维码',
  `staff_type` int(11) DEFAULT NULL COMMENT '0:个人；1：企业',
  `auth_status` int(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '认证状态',
  `channel_mark` varchar(100) DEFAULT NULL COMMENT '渠道0单证网盘',
  `source_mark` varchar(100) DEFAULT NULL COMMENT '来源0慧贸贸1北京单一窗口',
  `is_login` int(10) NOT NULL DEFAULT '0' COMMENT '是否第一次登录0否1是',
  `last_workbench_id` bigint(20) DEFAULT NULL COMMENT '用户最后访问工作台id',
  `last_member_id` bigint(20) DEFAULT NULL COMMENT '用户最后访问企业id',
  `channel_columns_id` bigint(50) DEFAULT NULL COMMENT '频道栏目id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='企业员工';

-- ----------------------------
-- Records of uac_staff
-- ----------------------------
BEGIN;
INSERT INTO `uac_staff` (`id`, `member_id`, `staff_name`, `staff_status`, `login_account`, `login_paswd`, `wx_openid`, `wx_logo`, `revision`, `created_by`, `created_time`, `updated_by`, `updated_time`, `status`, `dept`, `role`, `sgs_status`, `tel`, `wx_unionid`, `contact_email`, `contact_qq`, `contact_weixin`, `contact_weixinqr`, `staff_type`, `auth_status`, `channel_mark`, `source_mark`, `is_login`, `last_workbench_id`, `last_member_id`, `channel_columns_id`) VALUES (628284536009392127, 776399085769850881, '慧贸os初始用户', '', NULL, '', NULL, NULL, 1, '', '2020-07-02 16:22:44', '', '2023-12-15 16:31:16', 0, '', '', 0, '18108231349', 'oX7qnt6GHH6vYqVpcTZxaP-FfOzk', '', NULL, NULL, '', 0, 0, NULL, '慧贸贸PC端扫码注册', 1, 775784301441581056, 1039337575518703616, 62);
COMMIT;

-- ----------------------------
-- Table structure for uac_user_connection
-- ----------------------------
DROP TABLE IF EXISTS `uac_user_connection`;
CREATE TABLE `uac_user_connection` (
  `user_id` bigint(20) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `provider_user_id` varchar(255) DEFAULT NULL,
  `ranks` bigint(20) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `profile_url` text,
  `image_url` text,
  `access_token` text,
  `secret` text,
  `refresh_token` text,
  `unionid` varchar(100) DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL COMMENT '员工ID',
  `id` bigint(20) NOT NULL COMMENT '唯一标识',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `expire_time` datetime DEFAULT NULL COMMENT 'TOKEN过期时间',
  `provider_mp_id` varchar(255) DEFAULT NULL COMMENT '公众平台openid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户微信信息记录表';

-- ----------------------------
-- Records of uac_user_connection
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for uac_validate_code
-- ----------------------------
DROP TABLE IF EXISTS `uac_validate_code`;
CREATE TABLE `uac_validate_code` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `phone` varchar(30) DEFAULT NULL COMMENT '手机号',
  `code` varchar(30) DEFAULT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) NOT NULL COMMENT '删除，1为删除',
  `code_type` varchar(60) DEFAULT NULL COMMENT '验证种类',
  `sms_biz_id` varchar(60) DEFAULT NULL COMMENT '短信回执ID',
  `sms_code` varchar(30) DEFAULT NULL COMMENT '短信回执状态码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户接收短信验证码记录表';

-- ----------------------------
-- Records of uac_validate_code
-- ----------------------------
BEGIN;
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039074735889190912, '18230105832', '265758', '2025-01-14 17:23:52', '2025-01-14 17:18:52', 0, 'staff_bind', '691317036846332186^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039328092205748224, '18190872587', '479131', '2025-01-15 10:10:37', '2025-01-15 10:05:37', 0, 'staff_bind', '790720336906737002^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039332735015063552, '18230105832', '983050', '2025-01-15 10:29:04', '2025-01-15 10:24:04', 0, 'staff_bind', '893823636907843913^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039337032876429312, '18230105832', '679117', '2025-01-15 10:46:09', '2025-01-15 10:41:09', 0, 'staff_bind', '902915036908868569^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039337504202952704, '18230105832', '451728', '2025-01-15 10:48:01', '2025-01-15 10:43:01', 0, 'staff_bind', '467111536908981032^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039389337332092928, '15700357822', '084974', '2025-01-15 14:13:59', '2025-01-15 14:08:59', 0, 'staff_bind', '324922036921338953^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039396799321870336, '18757793550', '119128', '2025-01-15 14:43:38', '2025-01-15 14:38:38', 0, 'staff_bind', '111411836923118008^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039399036655898624, '15700357822', '286584', '2025-01-15 14:52:32', '2025-01-15 14:47:32', 0, 'staff_bind', '843802036923651534^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039402355872894976, '15700357822', '771618', '2025-01-15 15:05:43', '2025-01-15 15:00:43', 0, 'staff_bind', '889309036924442833^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039408232721944576, '15700357822', '595452', '2025-01-15 15:29:04', '2025-01-15 15:24:04', 0, 'staff_bind', '417222036925844003^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039412202026700800, '15700357822', '672268', '2025-01-15 15:44:51', '2025-01-15 15:39:51', 0, 'staff_bind', '238002336926790327^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039412530952409088, '15700357822', '458636', '2025-01-15 15:46:09', '2025-01-15 15:41:09', 0, 'staff_bind', '978814436926868823^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039452109151539200, '18757793550', '002875', '2025-01-15 18:23:25', '2025-01-15 18:18:25', 0, 'staff_bind', '837307036936304957^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1039681599442128896, '15700357822', '410941', '2025-01-16 09:35:20', '2025-01-16 09:30:20', 0, 'staff_bind', '127809336991019690^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1040062402533658624, '18108231349', '813034', '2025-01-17 10:48:30', '2025-01-17 10:43:30', 0, 'staff_bind', '662200237081810231^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1040062836790923264, '18108231349', '217881', '2025-01-17 10:50:14', '2025-01-17 10:45:14', 0, 'staff_bind', '983315037081913821^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1040063706777653248, '18190872587', '778230', '2025-01-17 10:53:41', '2025-01-17 10:48:41', 0, 'staff_bind', '146904937082121214^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1040064735304880128, '18190872587', '271571', '2025-01-17 10:57:47', '2025-01-17 10:52:47', 0, 'staff_bind', '668303937082366460^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1040065109734592512, '18108231349', '747485', '2025-01-17 10:59:16', '2025-01-17 10:54:16', 0, 'staff_bind', '900313537082455701^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1040066829642502144, '18108231349', '798752', '2025-01-17 11:06:06', '2025-01-17 11:01:06', 0, 'staff_bind', '191104737082865717^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1040068513974325248, '18108231349', '643649', '2025-01-17 11:12:47', '2025-01-17 11:07:47', 0, 'staff_bind', '529623237083267341^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1040069364629508096, '18190872587', '674659', '2025-01-17 11:16:10', '2025-01-17 11:11:10', 0, 'staff_bind', '606010037083470177^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1040128620825284608, '18190872587', '211768', '2025-01-17 15:11:38', '2025-01-17 15:06:38', 0, 'staff_bind', '161417737097597875^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1040137065779564544, '18190872587', '791170', '2025-01-17 15:45:12', '2025-01-17 15:40:12', 0, 'staff_bind', '491425237099611266^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1040138437702848512, '18108231349', '724072', '2025-01-17 15:50:39', '2025-01-17 15:45:39', 0, 'staff_bind', '736202137099938469^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1041229575406882816, '18108231349', '687609', '2025-01-20 16:06:26', '2025-01-20 16:01:26', 0, 'staff_bind', '630211637360085916^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1041233413916463104, '15700357822', '937506', '2025-01-20 16:21:41', '2025-01-20 16:16:41', 0, 'staff_bind', '445724837361001099^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1041238145263341568, '15700357822', '228455', '2025-01-20 16:40:29', '2025-01-20 16:35:29', 0, 'staff_bind', '198005637362129131^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1041244556441554944, '18190872587', '955598', '2025-01-20 17:05:58', '2025-01-20 17:00:58', 0, 'staff_bind', '522811637363657660^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1041855084713086976, '15700357822', '265419', '2025-01-22 09:31:59', '2025-01-22 09:26:59', 0, 'staff_bind', '905224037509218907^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1041857424891449344, '15700357822', '941142', '2025-01-22 09:41:17', '2025-01-22 09:36:17', 0, 'staff_bind', '726123737509776942^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1047372818284679168, '18190872587', '184231', '2025-02-06 14:57:29', '2025-02-06 14:52:29', 0, 'staff_bind', '578604738824749190^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1052853914627608576, '18108231349', '365775', '2025-02-21 17:57:25', '2025-02-21 17:52:25', 0, 'staff_bind', '178617940131544381^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1052854845175894016, '18108231349', '911062', '2025-02-21 18:01:06', '2025-02-21 17:56:06', 0, 'staff_bind', '239418040131766224^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1052855745994952704, '18108231349', '545131', '2025-02-21 18:04:41', '2025-02-21 17:59:41', 0, 'staff_bind', '887502040131981038^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1053819750616010752, '18601148392', '895416', '2025-02-24 09:55:18', '2025-02-24 09:50:18', 0, 'staff_bind', '785515940361817631^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1053823761045917696, '18601148392', '571827', '2025-02-24 10:11:14', '2025-02-24 10:06:14', 0, 'staff_bind', '448718640362773766^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1053824630189592576, '18601148392', '413770', '2025-02-24 10:14:41', '2025-02-24 10:09:41', 0, 'staff_bind', '679800240362981069^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1053887443947884544, '18108231349', '484193', '2025-02-24 14:24:17', '2025-02-24 14:19:17', 0, 'staff_bind', '862418040377956944^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1053887787255861248, '18108231349', '717650', '2025-02-24 14:25:39', '2025-02-24 14:20:39', 0, 'staff_bind', '263813140378038862^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1053888064939757568, '18601148392', '979494', '2025-02-24 14:26:45', '2025-02-24 14:21:45', 0, 'staff_bind', '483318940378105073^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1053904221453291520, '18108231349', '915780', '2025-02-24 15:30:57', '2025-02-24 15:25:57', 0, 'staff_bind', '747305340381957013^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1053904968010043392, '18108231349', '654296', '2025-02-24 15:33:55', '2025-02-24 15:28:55', 0, 'staff_bind', '736718640382135066^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1053940432440004608, '18601148392', '839946', '2025-02-24 17:54:51', '2025-02-24 17:49:51', 0, 'staff_bind', '239013940390590366^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1053940476828323840, '15700357822', '659299', '2025-02-24 17:55:01', '2025-02-24 17:50:01', 0, 'staff_bind', '928816440390601023^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1056431342667042816, '18190872587', '124228', '2025-03-03 14:52:50', '2025-03-03 14:47:50', 0, 'staff_bind', '890121440984469651^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1056780611341127680, '18108231349', '717169', '2025-03-04 14:00:42', '2025-03-04 13:55:42', 0, 'staff_bind', '683004041067741810^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1057575844475703296, '18108231349', '522524', '2025-03-06 18:40:40', '2025-03-06 18:35:40', 0, 'staff_bind', '366511541257340143^0', NULL);
INSERT INTO `uac_validate_code` (`id`, `phone`, `code`, `expire_time`, `create_time`, `status`, `code_type`, `sms_biz_id`, `sms_code`) VALUES (1059342193115926528, '18757793550', '876217', '2025-03-11 15:39:31', '2025-03-11 15:34:31', 0, 'staff_bind', '631321441678470455^0', NULL);
COMMIT;

-- ----------------------------
-- Table structure for uac_white_list
-- ----------------------------
DROP TABLE IF EXISTS `uac_white_list`;
CREATE TABLE `uac_white_list` (
  `id` bigint(20) NOT NULL,
  `ip` varchar(1000) DEFAULT NULL COMMENT 'ip地址',
  `status` int(10) DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='运营平台白名单';

-- ----------------------------
-- Records of uac_white_list
-- ----------------------------
BEGIN;
INSERT INTO `uac_white_list` (`id`, `ip`, `status`) VALUES (1, '192.168.0.108', 0);
COMMIT;

-- ----------------------------
-- Table structure for uac_yisu_info
-- ----------------------------
DROP TABLE IF EXISTS `uac_yisu_info`;
CREATE TABLE `uac_yisu_info` (
  `id` bigint(100) NOT NULL,
  `user_id` varchar(1000) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(1000) DEFAULT NULL COMMENT '用户名称',
  `user_phone` varchar(1000) DEFAULT NULL COMMENT '用户电话',
  `user_email` varchar(1000) DEFAULT NULL COMMENT '用户邮箱',
  `ic_code` varchar(1000) DEFAULT NULL COMMENT '单窗ic卡号',
  `sw_log_nm` varchar(1000) DEFAULT NULL COMMENT '单窗账号',
  `sw_log_pw` varchar(1000) DEFAULT NULL COMMENT '单窗密码',
  `trade_name` varchar(1000) DEFAULT NULL COMMENT '企业名称',
  `trade_code` varchar(1000) DEFAULT NULL COMMENT '企业海关代码',
  `trade_code_scc` varchar(1000) DEFAULT NULL COMMENT '企业社会信用代码',
  `type` int(20) DEFAULT NULL COMMENT '1注册2登录3同步',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_success` int(10) DEFAULT NULL COMMENT '是否同步erp成功',
  `error_info` text COMMENT '错误日志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='易速登录注册同步信息表';

-- ----------------------------
-- Records of uac_yisu_info
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
