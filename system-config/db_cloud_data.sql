/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : db_cloud_data

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 21/12/2018 04:00:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_container
-- ----------------------------
DROP TABLE IF EXISTS `tb_container`;
CREATE TABLE `tb_container`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `api` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `field` int(11) NOT NULL,
  `data` bigint(20) NOT NULL,
  `buildtime` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_container
-- ----------------------------
INSERT INTO `tb_container` VALUES (35, 'test1', 'test1_cd', 4, 1, 0, 1545335950006);

-- ----------------------------
-- Table structure for tb_container_privilege
-- ----------------------------
DROP TABLE IF EXISTS `tb_container_privilege`;
CREATE TABLE `tb_container_privilege`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `privilege` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_container_privilege
-- ----------------------------
INSERT INTO `tb_container_privilege` VALUES (33, 11, 35, 1);

-- ----------------------------
-- Table structure for tb_field
-- ----------------------------
DROP TABLE IF EXISTS `tb_field`;
CREATE TABLE `tb_field`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isnull` int(11) NOT NULL,
  `key` int(11) NOT NULL,
  `defaultdata` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_field
-- ----------------------------
INSERT INTO `tb_field` VALUES (3, 35, 'aWQ=', '2', 0, 0, 'TlVMTA==');

-- ----------------------------
-- Table structure for tb_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_record`;
CREATE TABLE `tb_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` bigint(20) NOT NULL,
  `position` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_record
-- ----------------------------
INSERT INTO `tb_record` VALUES (8, 11, 'MTExLjIwMS4yNDMuMTkw', 1539672890926, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (9, 11, 'MTExLjIwMS4yNDMuMTkw', 1539675185985, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (11, 11, 'MTExLjIwMS4yNDMuMTkw', 1539675627557, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (12, 11, 'MTExLjIwMS4yNDMuMTkw', 1539675641727, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (13, 11, 'MTExLjIwMS4yNDMuMTkw', 1539754810253, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (14, 11, 'MTExLjIwMS4yNDMuMTkw', 1539755464472, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (15, 11, 'MTExLjIwMS4yNDMuMTkw', 1539759191987, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (16, 11, 'MTExLjIwMS4yNDMuMTkw', 1539759211469, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (17, 11, 'MTExLjIwMS4yNDMuMTkw', 1539759263949, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (18, 11, 'MTExLjIwMS4yNDMuMTkw', 1539759447005, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (19, 11, 'MTExLjIwMS4yNDMuMTkw', 1539759494942, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (20, 11, 'MTExLjIwMS4yNDMuMTkw', 1539759548130, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (21, 11, 'MTExLjIwMS4yNDMuMTkw', 1539759613832, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (22, 11, 'MTExLjIwMS4yNDMuMTkw', 1539759727990, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (23, 11, 'MTExLjIwMS4yNDMuMTkw', 1539759764728, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (24, 11, 'MTExLjIwMS4yNDMuMTkw', 1539762870694, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (25, 11, 'MTExLjIwMS4yNDMuMTkw', 1539768637614, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (26, 11, 'MTExLjIwMS4yNDMuMTkw', 1539768826429, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (27, 11, 'MTExLjIwMS4yNDMuMTkw', 1539770890965, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (28, 11, 'MTExLjIwMS4yNDMuMTkw', 1539772526224, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (29, 11, 'MTExLjIwMS4yNDMuMTkw', 1539772687621, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (30, 11, 'MTExLjIwMS4yNDMuMTkw', 1539772848627, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (31, 11, 'MTExLjIwMS4yNDMuMTkw', 1539772926706, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (32, 11, 'MTExLjIwMS4yNDMuMTkw', 1539785934609, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (33, 11, 'MTExLjIwMS4yNDMuMTkw', 1539788614324, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (34, 11, 'MTExLjIwMS4yNDMuMTkw', 1539791211907, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (35, 11, 'MTExLjIwMS4yNDMuMTkw', 1539794488039, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (36, 11, 'MTExLjIwMS4yNDMuMTkw', 1539794516302, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (37, 11, 'MTExLjIwMS4yNDMuMTkw', 1539800757994, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (38, 11, 'MTExLjIwMS4yNDMuMTkw', 1539839011278, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (39, 11, 'MTExLjIwMS4yNDMuMTkw', 1539839389975, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (40, 11, 'MTExLjIwMS4yNDMuMTkw', 1539842961738, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (41, 11, 'MTExLjIwMS4yNDMuMTkw', 1539846273937, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (42, 11, 'MTExLjIwMS4yNDMuMTkw', 1539846889399, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (43, 11, 'MTExLjIwMS4yNDMuMTkw', 1539847041651, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (44, 11, 'MTExLjIwMS4yNDMuMTkw', 1539850727795, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (45, 11, 'MTExLjIwMS4yNDMuMTkw', 1539854899969, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (46, 11, 'MTExLjIwMS4yNDMuMTkw', 1539859701193, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (47, 11, 'MTExLjIwMS4yNDMuMTkw', 1539859967873, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (48, 11, 'MTExLjIwMS4yNDMuMTkw', 1539860265564, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (49, 11, 'MTExLjIwMS4yNDMuMTkw', 1539860548722, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (50, 11, 'MTExLjIwMS4yNDMuMTkw', 1539861118675, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (51, 11, 'MTExLjIwMS4yNDMuMTkw', 1539864758498, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (52, 11, 'MTExLjIwMS4yNDMuMTkw', 1539865746508, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (53, 11, 'MTExLjIwMS4yNDMuMTkw', 1539866160380, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (54, 11, 'MTExLjIwMS4yNDMuMTkw', 1539869418032, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (55, 11, 'MTExLjIwMS4yNDMuMTkw', 1539872130471, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (56, 11, 'MTExLjIwMS4yNDMuMTkw', 1539873003628, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (57, 11, 'MTExLjIwMS4yNDMuMTkw', 1539873150983, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (58, 11, 'MTExLjIwMS4yNDMuMTkw', 1539879766814, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (59, 11, 'MTExLjIwMS4yNDMuMTkw', 1539895639981, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (60, 11, 'MTExLjIwMS4yNDMuMTkw', 1539940307835, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (61, 11, 'MTExLjIwMS4yNDMuMTkw', 1539940359660, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (62, 11, 'MTExLjIwMS4yNDMuMTkw', 1539940392637, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (63, 11, 'MTExLjIwMS4yNDMuMTkw', 1539940643416, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (64, 11, 'MTExLjIwMS4yNDMuMTkw', 1539941894276, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (65, 11, 'MTExLjIwMS4yNDMuMTkw', 1539943985267, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (66, 11, 'MTExLjIwMS4yNDMuMTkw', 1539944120004, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (67, 11, 'MTExLjIwMS4yNDMuMTkw', 1539944850232, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (68, 11, 'MTExLjIwMS4yNDMuMTkw', 1539945514332, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (69, 11, 'MTExLjIwMS4yNDMuMTkw', 1539951771906, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (70, 11, 'MTE5LjU0Ljg5LjI=', 1539952338460, 'vKrB1sqhIMvExr3K0CDM+s73x/g=');
INSERT INTO `tb_record` VALUES (71, 11, 'MTE5LjU0Ljg5LjE2NQ==', 1539952383335, 'vKrB1sqhIMvExr3K0CDM+s73x/g=');
INSERT INTO `tb_record` VALUES (72, 11, 'MTE5LjU0Ljg5LjE2NQ==', 1539952516978, 'vKrB1sqhIMvExr3K0CDM+s73x/g=');
INSERT INTO `tb_record` VALUES (73, 11, 'MTExLjIwMS4yNDMuMTkw', 1539952534423, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (74, 11, 'MTExLjIwMS4yNDMuMTkw', 1539955837806, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (75, 11, 'MTExLjIwMS4yNDMuMTkw', 1539956023637, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (76, 11, 'MTExLjIwMS4yNDMuMTkw', 1539977590993, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (77, 11, 'MTExLjIwMS4yNDMuMTkw', 1539977944271, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (78, 11, 'MTExLjIwMS4yNDMuMTkw', 1540026997940, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (79, 11, 'MTExLjIwMS4yNDMuMTkw', 1540027069488, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (80, 11, 'MTExLjIwMS4yNDMuMTkw', 1540030890991, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (81, 11, 'MTExLjIwMS4yNDMuMTkw', 1540041006474, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (82, 11, 'MTExLjIwMS4yNDMuMTkw', 1540041026163, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (83, 11, 'MTExLjIwMS4yNDMuMTkw', 1540110837254, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (84, 11, 'MTExLjIwMS4yNDMuMTkw', 1540110884538, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (85, 11, 'MTExLjIwMS4yNDMuMTkw', 1540114552464, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (86, 11, 'MTExLjIwMS4yNDMuMTkw', 1540115313232, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (87, 11, 'MTExLjIwMS4yNDMuMTkw', 1540115869734, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (88, 11, 'MTExLjIwMS4yNDMuMTkw', 1540117613084, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (89, 11, 'MTExLjIwMS4yNDMuMTkw', 1540140004831, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (90, 11, 'MTExLjIwMS4yNDMuMTkw', 1540140038837, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (91, 11, 'MTExLjIwMS4yNDMuMTkw', 1540140547119, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (92, 11, 'MTExLjIwMS4yNDMuMTkw', 1540141034268, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (93, 11, 'MTExLjIwMS4yNDMuMTkw', 1540141123141, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (94, 11, 'MTExLjIwMS4yNDMuMTkw', 1540141180056, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (95, 11, 'MTExLjIwMS4yNDMuMTkw', 1540141360242, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (96, 11, 'MTExLjIwMS4yNDMuMTkw', 1540141550517, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (97, 11, 'MTExLjIwMS4yNDMuMTkw', 1540141679085, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (98, 11, 'MTExLjIwMS4yNDMuMTkw', 1540141777791, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (99, 11, 'MTExLjIwMS4yNDQuMTMz', 1540194889628, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (100, 11, 'MTExLjIwMS4yNDQuMTMz', 1540203072483, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (101, 11, 'dW5rbm93bg==', 1540205631415, 'dW5rbm93bg==');
INSERT INTO `tb_record` VALUES (102, 11, 'MTExLjIwMS4yNDQuMTMz', 1540205691970, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (103, 11, 'MTExLjIwMS4yNDQuMTMz', 1540212106744, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (104, 11, 'MTExLjIwMS4yNDQuMTMz', 1540212424362, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (105, 11, 'MTExLjIwMS4yNDQuMTMz', 1540213793590, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (106, 11, 'MTExLjIwMS4yNDQuMTMz', 1540213866466, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (107, 11, 'MTExLjIwMS4yNDQuMTMz', 1540214144686, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (108, 11, 'MTExLjIwMS4yNDQuMTMz', 1540259869582, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (109, 11, 'MTExLjIwMS4yNDQuMTMz', 1540260505614, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (110, 11, 'MTExLjIwMS4yNDQuMTMz', 1540261324294, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (111, 11, 'MTExLjIwMS4yNDQuMTMz', 1540271571667, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (112, 11, 'MTExLjIwMS4yNDQuMTMz', 1540628127921, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (113, 11, 'MTExLjIwMS4yNDQuMTMz', 1540631834095, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (114, 11, 'MTExLjIwMS4yNDQuMTMz', 1540639452504, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (115, 11, 'MTExLjIwMS4yNDYuNTI=', 1540812294707, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (116, 11, 'MTExLjIwMS4yNDYuNTI=', 1540814660359, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (117, 11, 'MTExLjIwMS4yNDYuNTI=', 1540814714419, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (118, 11, 'MTExLjIwMS4yNDYuNTI=', 1540817765492, 'sbG+qcrQILGxvqnK0CDNqNbdx/g=');
INSERT INTO `tb_record` VALUES (119, 11, 'MTExLjE5Ni4yNDUuMTU3', 1541864978219, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (120, 11, 'MTExLjE5Ni4yNDUuMTU3', 1542032191805, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (121, 11, 'MTExLjE5Ni4yNDUuMTU3', 1542037571461, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (122, 11, 'MTExLjE5Ni4yNDMuODA=', 1542206968337, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (123, 11, 'MTExLjE5Ni4yNDMuODA=', 1542287695569, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (124, 11, 'MTExLjE5Ni4yNDMuODA=', 1542289304156, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (125, 11, 'MTExLjE5Ni4yNDMuODA=', 1542387507558, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (126, 11, 'MTExLjE5Ni4yNDMuODA=', 1542390598739, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (127, 11, 'MTExLjE5Ni4yNDMuODA=', 1542390963935, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (128, 11, 'MTExLjE5Ni4yNDMuODA=', 1542391116269, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (129, 11, 'MTExLjE5Ni4yNDMuODA=', 1542391239327, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (130, 11, 'MTExLjE5Ni4yNDMuODA=', 1542391606962, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (131, 11, 'MTExLjE5Ni4yNDMuODA=', 1542430864856, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (132, 11, 'MTExLjE5Ni4yNDMuODA=', 1542457416023, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (133, 11, 'MTExLjE5Ni4yNDMuODA=', 1542461382088, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (134, 11, 'MTExLjE5Ni4yNDMuODA=', 1542463191754, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (135, 11, 'MTExLjE5Ni4yNDMuODA=', 1542467066053, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (136, 11, 'MTExLjE5Ni4yNDMuODA=', 1542472672242, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (137, 11, 'MTExLjE5Ni4yNDMuODA=', 1542477561207, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (138, 11, 'MTExLjE5Ni4yNDMuODA=', 1542478050215, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (139, 11, 'MTExLjE5Ni4yNDMuODA=', 1542525322215, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (140, 11, 'MTExLjE5Ni4yNDMuODA=', 1542542318002, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (141, 11, 'MTExLjE5Ni4yNDMuODA=', 1542554815418, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (142, 11, 'MTExLjE5Ni4yNDMuODA=', 1542555187362, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (143, 11, 'MTExLjE5Ni4yNDMuODA=', 1542556788268, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (144, 11, 'MTExLjE5Ni4yNDAuMjEx', 1543825659161, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (145, 11, 'MTExLjE5Ni4yNDAuNA==', 1544173516986, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (146, 11, 'MTExLjE5Ni4yNDAuNA==', 1544173837631, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (147, 11, 'MTExLjE5Ni4yNDAuNA==', 1544173988523, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (148, 11, 'MTExLjE5Ni4yNDAuNA==', 1544174979159, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (151, 11, 'NDcuNzQuMS42OQ==', 1544189452174, 'uv7Ez8qhIM/mzLbK0CA=');
INSERT INTO `tb_record` VALUES (152, 11, 'MTExLjE5Ni4yNDAuNA==', 1544189505628, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (153, 11, 'MTExLjE5Ni4yNDAuNA==', 1544189650950, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (154, 11, 'MTExLjE5Ni4yNDAuNA==', 1544204525470, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (155, 11, 'MTExLjE5Ni4yNDAuNA==', 1544242104906, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (156, 11, 'MTExLjE5Ni4yNDAuNA==', 1544244772105, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (157, 11, 'MTExLjE5Ni4yNDAuNA==', 1544245388180, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (158, 11, 'MTExLjE5Ni4yNDAuNA==', 1544252021131, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (159, 11, 'MTExLjE5Ni4yNDAuNA==', 1544254588675, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (160, 11, 'MTExLjE5Ni4yNDAuNA==', 1544342122210, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (161, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544607158841, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (162, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544610380260, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (163, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544610795548, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (164, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544610922463, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (165, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544611076960, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (166, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544627254015, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (167, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544627672534, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (168, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544628453855, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (169, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544629523183, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (170, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544708194146, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (171, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544708641694, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (172, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544708822966, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (173, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544708899632, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (174, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544709031002, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (175, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544709045127, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (176, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544711692905, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (177, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544713913132, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (178, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544716427421, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (179, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544737381983, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (180, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544739093025, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (181, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544739557902, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (182, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544741088615, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (183, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544742568873, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (184, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544742788864, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (185, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544745179380, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (186, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544766586556, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (187, 12, 'MTExLjE5Ni4yNDUuOTI=', 1544766661460, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (188, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544766998246, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (189, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544767499684, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (190, 11, 'MTExLjE5Ni4yNDUuOTI=', 1544856051713, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (191, 11, 'MTE3LjEzNi4wLjE4Nw==', 1544880236978, 'sbG+qcrQILGxvqnK0CA=');
INSERT INTO `tb_record` VALUES (192, 11, 'MTE3LjEzNi4wLjE4Nw==', 1544881810183, 'sbG+qcrQILGxvqnK0CA=');
INSERT INTO `tb_record` VALUES (193, 11, 'MTExLjE5Ni4yNDEuMTk0', 1544893450583, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (194, 11, 'MTExLjE5Ni4yNDEuMTk0', 1544900126231, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (195, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545034356840, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (196, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545035462637, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (197, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545036375693, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (198, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545036494673, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (199, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545107003631, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (200, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545114224892, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (201, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545118979520, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (202, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545124775987, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (203, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545124836636, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (204, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545132496556, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (205, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545139032511, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (206, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545140340415, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (207, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545196750863, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (208, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545201656815, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (209, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545227679833, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (210, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545282669882, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (212, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545288499469, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (213, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545313000997, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (214, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545313035586, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (215, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545313729924, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (216, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545314054479, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (217, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545330824322, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');
INSERT INTO `tb_record` VALUES (218, 11, 'MTExLjE5Ni4yNDEuMTk0', 1545335855662, 'sbG+qcrQILGxvqnK0CCy/ca9x/g=');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `regtime` bigint(20) NOT NULL,
  `first_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (11, 'Mjc4ODQ0NzY2MEBxcS5jb20=', 'TL8UVtVZiGO0HkZZDctyDGDoX6k=', 1540213752015, 'suLK1GE=', 'ztLKxw==', 'vKrB1sqmt7a089Gn', '5d(g~SO,zTQ$ToUF');
INSERT INTO `tb_user` VALUES (12, 'c3VucmlzZTAxMEB2aXAucXEuY29t', 'JZaty/8OJJOjCKojkQw4zp1OhJU=', 1544766482737, 'suLK1GI=', 'ztLKxw==', 'vKrB1sqmt7a089Gn', 'akV=tAezymOkvKFf');

-- ----------------------------
-- Table structure for zb_cyea8czkv+g9hwlqp1v6oa==
-- ----------------------------
DROP TABLE IF EXISTS `zb_cyea8czkv+g9hwlqp1v6oa==`;
CREATE TABLE `zb_cyea8czkv+g9hwlqp1v6oa==`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;