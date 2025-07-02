/*
 Navicat Premium Dump SQL

 Source Server         : 【0.9】mysql
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44)
 Source Host           : 192.168.0.36:3306
 Source Schema         : wx

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44)
 File Encoding         : 65001

 Date: 10/03/2025 11:49:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wx_auto_reply
-- ----------------------------
DROP TABLE IF EXISTS `wx_auto_reply`;
CREATE TABLE `wx_auto_reply` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '主键',
  `create_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `del_flag` char(2) CHARACTER SET utf8 DEFAULT '0' COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `type` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型（1、关注时回复；2、消息回复；3、关键词回复）',
  `req_key` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关键词',
  `req_type` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求消息类型（text：文本；image：图片；voice：语音；video：视频；shortvideo：小视频；location：地理位置）',
  `rep_type` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复消息类型（text：文本；image：图片；voice：语音；video：视频；music：音乐；news：图文）',
  `rep_mate` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复类型文本匹配类型（1、全匹配，2、半匹配）',
  `rep_content` text COLLATE utf8mb4_unicode_ci COMMENT '回复类型文本保存文字',
  `rep_media_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复类型imge、voice、news、video的mediaID或音乐缩略图的媒体id',
  `rep_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复的素材名、视频和音乐的标题',
  `rep_desc` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频和音乐的描述',
  `rep_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '链接',
  `rep_hq_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '高质量链接',
  `rep_thumb_media_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缩略图的媒体id',
  `rep_thumb_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缩略图url',
  `content` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '图文消息的内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='微信自动回复';

-- ----------------------------
-- Records of wx_auto_reply
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wx_cat
-- ----------------------------
DROP TABLE IF EXISTS `wx_cat`;
CREATE TABLE `wx_cat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  `name` varchar(50) DEFAULT NULL COMMENT '类目名称',
  `status` int(1) DEFAULT '1' COMMENT '状态。可选值:1(正常),2(删除)',
  `sort_order` int(4) DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  `is_parent` tinyint(1) DEFAULT '1' COMMENT '该类目是否为父类目，1为true，0为false',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_id` (`parent_id`,`status`) USING BTREE,
  KEY `sort_order` (`sort_order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品类目';

-- ----------------------------
-- Records of wx_cat
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `wx_menu`;
CREATE TABLE `wx_menu` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单ID（click、scancode_push、scancode_waitmsg、pic_sysphoto、pic_photo_or_album、pic_weixin、location_select：保存key）',
  `del_flag` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort` int(11) DEFAULT '1' COMMENT '排序值',
  `parent_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '父菜单ID',
  `type` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单类型click、view、miniprogram、scancode_push、scancode_waitmsg、pic_sysphoto、pic_photo_or_album、pic_weixin、location_select、media_id、view_limited等',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单名',
  `url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'view、miniprogram保存链接',
  `ma_app_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序的appid',
  `ma_page_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '小程序的页面路径',
  `rep_type` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复消息类型（text：文本；image：图片；voice：语音；video：视频；music：音乐；news：图文）',
  `rep_content` text COLLATE utf8mb4_unicode_ci COMMENT 'Text:保存文字',
  `rep_media_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imge、voice、news、video：mediaID',
  `rep_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '素材名、视频和音乐的标题',
  `rep_desc` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频和音乐的描述',
  `rep_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '链接',
  `rep_hq_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '高质量链接',
  `rep_thumb_media_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缩略图的媒体id',
  `rep_thumb_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缩略图url',
  `content` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '图文消息的内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='自定义菜单表';

-- ----------------------------
-- Records of wx_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wx_msg
-- ----------------------------
DROP TABLE IF EXISTS `wx_msg`;
CREATE TABLE `wx_msg` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '主键',
  `create_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `del_flag` char(2) CHARACTER SET utf8 DEFAULT '0' COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `app_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公众号名称',
  `app_logo` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公众号logo',
  `wx_user_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '微信用户ID',
  `nick_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信用户昵称',
  `headimg_url` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信用户头像',
  `type` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息分类（1、用户发给公众号；2、公众号发给用户；）',
  `rep_type` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '消息类型（text：文本；image：图片；voice：语音；video：视频；shortvideo：小视频；location：地理位置；music：音乐；news：图文；event：推送事件）',
  `rep_event` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '事件类型（subscribe：关注；unsubscribe：取关；CLICK、VIEW：菜单事件）',
  `rep_content` text COLLATE utf8mb4_unicode_ci COMMENT '回复类型文本保存文字、地理位置信息',
  `rep_media_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复类型imge、voice、news、video的mediaID或音乐缩略图的媒体id',
  `rep_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回复的素材名、视频和音乐的标题',
  `rep_desc` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频和音乐的描述',
  `rep_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '链接',
  `rep_hq_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '高质量链接',
  `content` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '图文消息的内容',
  `rep_thumb_media_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缩略图的媒体id',
  `rep_thumb_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缩略图url',
  `rep_location_x` double DEFAULT NULL COMMENT '地理位置维度',
  `rep_location_y` double DEFAULT NULL COMMENT '地理位置经度',
  `rep_scale` double DEFAULT NULL COMMENT '地图缩放大小',
  `read_flag` char(2) CHARACTER SET utf8 DEFAULT '1' COMMENT '已读标记（1：是；0：否）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='微信消息';

-- ----------------------------
-- Records of wx_msg
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wx_ucd
-- ----------------------------
DROP TABLE IF EXISTS `wx_ucd`;
CREATE TABLE `wx_ucd` (
  `media_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '要获取的素材的media_id\r\n要获取的素材的media_id',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图文消息的标题',
  `thumb_media_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图文消息的封面图片素材id（必须是永久mediaID）',
  `show_cover_pic` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否显示封面，0为false，即不显示，1为true，即显示',
  `author` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作者',
  `digest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图文消息的摘要，仅有单图文消息才有摘要，多图文此处为空',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '图文消息的具体内容，支持HTML标签，必须少于2万字符，小于1M，且此处会去除JS',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图文页的URL',
  `content_source_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图文消息的原文地址，即点击“阅读原文”后的URL',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图文类型1为图文素材 ,2为其他素材',
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频描述',
  `down_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频下载地址',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `cid` bigint(10) NOT NULL COMMENT '所属类目，叶子类目'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wx_ucd
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '主键',
  `create_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户备注',
  `del_flag` char(2) CHARACTER SET utf8 DEFAULT '0' COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `app_type` char(2) CHARACTER SET utf8 DEFAULT NULL COMMENT '应用类型(1:小程序，2:公众号)',
  `subscribe` char(2) CHARACTER SET utf8 DEFAULT NULL COMMENT '是否订阅（1：是；0：否；2：网页授权用户）',
  `subscribe_scene` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '返回用户关注的渠道来源，ADD_SCENE_SEARCH 公众号搜索，ADD_SCENE_ACCOUNT_MIGRATION 公众号迁移，ADD_SCENE_PROFILE_CARD 名片分享，ADD_SCENE_QR_CODE 扫描二维码，ADD_SCENEPROFILE LINK 图文页内名称点击，ADD_SCENE_PROFILE_ITEM 图文页右上角菜单，ADD_SCENE_PAID 支付后关注，ADD_SCENE_OTHERS 其他',
  `subscribe_time` datetime DEFAULT NULL COMMENT '关注时间',
  `subscribe_num` int(11) DEFAULT NULL COMMENT '关注次数',
  `cancel_subscribe_time` datetime DEFAULT NULL COMMENT '取消关注时间',
  `open_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户标识',
  `nick_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `sex` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别（1：男，2：女，0：未知）',
  `city` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所在城市',
  `country` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所在国家',
  `province` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所在省份',
  `phone` varchar(15) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号码',
  `language` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户语言',
  `headimg_url` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `union_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'union_id',
  `group_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户组',
  `tagid_list` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签列表',
  `qr_scene_str` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '二维码扫码场景',
  `latitude` double DEFAULT NULL COMMENT '地理位置纬度',
  `longitude` double DEFAULT NULL COMMENT '地理位置经度',
  `precision` double DEFAULT NULL COMMENT '地理位置精度',
  `session_key` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '会话密钥',
  `mall_user_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商城用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='微信用户';

-- ----------------------------
-- Records of wx_user
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
