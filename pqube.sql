/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : pqube-admin-api

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 29/02/2024 10:50:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary`  (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典id',
  `dict_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典标识',
  `dict_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除, 0否, 1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES (1, 'sex', '性别', 1, NULL, 0, '2020-03-15 13:04:39', '2022-03-11 22:46:15');
INSERT INTO `sys_dictionary` VALUES (2, 'organization_type', '机构类型', 2, NULL, 0, '2020-03-16 00:32:36', '2022-03-11 22:46:17');

-- ----------------------------
-- Table structure for sys_dictionary_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary_data`;
CREATE TABLE `sys_dictionary_data`  (
  `dict_data_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典项id',
  `dict_id` int(11) NOT NULL COMMENT '字典id',
  `dict_data_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项标识',
  `dict_data_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项名称',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除, 0否, 1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`dict_data_id`) USING BTREE,
  INDEX `dict_id`(`dict_id`) USING BTREE,
  CONSTRAINT `sys_dictionary_data_ibfk_1` FOREIGN KEY (`dict_id`) REFERENCES `sys_dictionary` (`dict_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dictionary_data
-- ----------------------------
INSERT INTO `sys_dictionary_data` VALUES (1, 1, '1', '男', 1, NULL, 0, '2020-03-15 13:07:28', '2022-03-11 22:46:24');
INSERT INTO `sys_dictionary_data` VALUES (2, 1, '2', '女', 2, NULL, 0, '2020-03-15 13:07:41', '2022-03-11 22:46:25');
INSERT INTO `sys_dictionary_data` VALUES (3, 2, '1', '公司', 1, NULL, 0, '2020-03-16 00:34:32', '2022-03-11 22:46:27');
INSERT INTO `sys_dictionary_data` VALUES (4, 2, '2', '子公司', 2, NULL, 0, '2020-03-16 00:35:02', '2022-03-11 22:46:28');
INSERT INTO `sys_dictionary_data` VALUES (5, 2, '3', '部门', 3, NULL, 0, '2020-03-16 00:35:18', '2022-03-11 22:46:30');
INSERT INTO `sys_dictionary_data` VALUES (6, 2, '4', '小组', 4, NULL, 0, '2020-03-16 00:35:36', '2022-03-11 22:46:31');

-- ----------------------------
-- Table structure for sys_email_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_email_record`;
CREATE TABLE `sys_email_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮件标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '邮件内容',
  `receiver` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件邮箱',
  `sender` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发件邮箱',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` int(11) NOT NULL DEFAULT 1 COMMENT '租户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_user_id`(`create_user_id`) USING BTREE,
  INDEX `tenant_id`(`tenant_id`) USING BTREE,
  CONSTRAINT `sys_email_record_ibfk_1` FOREIGN KEY (`create_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_email_record_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `sys_tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邮件发送记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_email_record
-- ----------------------------

-- ----------------------------
-- Table structure for sys_file_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_record`;
CREATE TABLE `sys_file_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件存储路径',
  `length` int(11) NULL DEFAULT NULL COMMENT '文件大小',
  `content_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除, 0否, 1是',
  `tenant_id` int(11) NOT NULL DEFAULT 1 COMMENT '租户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_user_id`(`create_user_id`) USING BTREE,
  INDEX `tenant_id`(`tenant_id`) USING BTREE,
  CONSTRAINT `sys_file_record_ibfk_1` FOREIGN KEY (`create_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_file_record_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `sys_tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 193 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件上传记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file_record
-- ----------------------------
INSERT INTO `sys_file_record` VALUES (1, 'avatar.jpg', '20220722/19b623b787514f8eb7d1e8edf2e9ff15.jpg', 12805, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 11:28:16', '2022-07-22 16:15:47');
INSERT INTO `sys_file_record` VALUES (2, 'logo.svg', '20220722/e77995c100de46409cce84e848a63f7d.svg', 1605, 'image/svg+xml', NULL, 1, 0, 1, '2022-07-22 11:28:21', '2022-07-22 16:15:48');
INSERT INTO `sys_file_record` VALUES (3, 'favicon.ico', '20220722/acb31ddb5ce44530933c48741c3bbfe2.ico', 4286, 'image/vnd.microsoft.icon', NULL, 1, 0, 1, '2022-07-22 11:29:11', '2022-07-22 16:15:49');
INSERT INTO `sys_file_record` VALUES (4, '用户导入模板.xlsx', '20220722/b4fa501bf6084f2e8bed971e68462ce3.xlsx', 10221, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', NULL, 1, 0, 1, '2022-07-22 11:29:24', '2022-07-22 16:15:50');
INSERT INTO `sys_file_record` VALUES (5, 'classes.json', '20220722/8d59c7d48453444d9ee84bd2b4c27a12.json', 6789, 'application/json', NULL, 1, 0, 1, '2022-07-22 11:29:28', '2022-07-22 16:15:50');
INSERT INTO `sys_file_record` VALUES (6, 'pro202012301.png', '20220722/4cbac74d9c5c45858854b24ee5db8e87.png', 59257, 'image/png', NULL, 1, 0, 1, '2022-07-22 11:34:39', '2022-07-22 16:15:51');
INSERT INTO `sys_file_record` VALUES (7, 'pro202012302.png', '20220722/24ba2b0906f64394ae0fb5e8f813cb30.png', 64832, 'image/png', NULL, 1, 0, 1, '2022-07-22 11:34:43', '2022-07-22 16:15:51');
INSERT INTO `sys_file_record` VALUES (8, 'pro202012303.png', '20220722/9d269d1fe7294ea4b5ca6f11c6ac8a95.png', 74518, 'image/png', NULL, 1, 0, 1, '2022-07-22 11:34:47', '2022-07-22 16:15:52');
INSERT INTO `sys_file_record` VALUES (9, 'eleadmin20201020172822.png', '20220722/45c686ab54264822963bc40716222591.png', 103558, 'image/png', NULL, 1, 0, 1, '2022-07-22 13:02:52', '2022-07-22 16:15:53');
INSERT INTO `sys_file_record` VALUES (10, 'RZ8FQmZfHkcffMlTBCJllBFjEhEsObVo.jpg', '20220722/099d2f77dfad41c7af776ad81af7aab5.jpg', 38206, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:34:41', '2022-07-22 16:15:54');
INSERT INTO `sys_file_record` VALUES (11, 'WLXm7gp1EbLDtvVQgkeQeyq5OtDm00Jd.jpg', '20220722/faf7fec118824f309fb66961866d9712.jpg', 60365, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:34:49', '2022-07-22 16:15:54');
INSERT INTO `sys_file_record` VALUES (12, '4Z0QR2L0J1XStxBh99jVJ8qLfsGsOgjU.jpg', '20220722/d845f1a4e91143dc81ec9fa96ce6f074.jpg', 50118, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:34:54', '2022-07-22 16:15:55');
INSERT INTO `sys_file_record` VALUES (13, 'ttkIjNPlVDuv4lUTvRX8GIlM2QqSe0jg.jpg', '20220722/4fc98decedcb4029bc954369c5e8c294.jpg', 29948, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:35:03', '2022-07-22 16:15:56');
INSERT INTO `sys_file_record` VALUES (14, 'fAenQ8nvRjL7x0i0jEfuDBZHvJfHf3v6.jpg', '20220722/9787d2f5b37d4813a48b72e950d00395.jpg', 48228, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:35:08', '2022-07-22 16:15:56');
INSERT INTO `sys_file_record` VALUES (15, 'LrCTN2j94lo9N7wEql7cBr1Ux4rHMvmZ.jpg', '20220722/9dacd9d48efa483ab204ae8ad0b60864.jpg', 37320, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:35:11', '2022-07-22 16:15:57');
INSERT INTO `sys_file_record` VALUES (16, 'yeKvhT20lMU0f1T3Y743UlGEOLLnZSnp.jpg', '20220722/f74da7fd19524bc0a4e75e6159d041ac.jpg', 29040, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:35:17', '2022-07-22 16:15:57');
INSERT INTO `sys_file_record` VALUES (17, 'CyrCNmTJfv7D6GFAg39bjT3eRkkRm5dI.jpg', '20220722/7539f0f90c4749cbbb56b111e2b8d6af.jpg', 39560, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:35:26', '2022-07-22 16:15:58');
INSERT INTO `sys_file_record` VALUES (18, 'faa0202700ee455b90fe77d8bef98bc0.jpg', '20220722/5079a6bc43b64bf2b86b87275dfaf7a2.jpg', 10250, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:36:21', '2022-07-22 16:15:59');
INSERT INTO `sys_file_record` VALUES (19, 'fe9196dd091e438fba115205c1003ee7.jpg', '20220722/db6740d4bb6e4938a8ce502a6af4554d.jpg', 10726, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:36:34', '2022-07-22 16:15:59');
INSERT INTO `sys_file_record` VALUES (20, '21222950dc174485b2ec5088435a46a3.jpg', '20220722/ef84d66c378549e7807b98b64282d222.jpg', 15201, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:37:49', '2022-07-22 16:16:00');
INSERT INTO `sys_file_record` VALUES (21, 'adb3ad5e05614fd2a59cf886ffc37f74.jpg', '20220722/c326e31373084a83a99387ac7929ecc7.jpg', 12782, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:37:53', '2022-07-22 16:16:01');
INSERT INTO `sys_file_record` VALUES (22, 'b3ce64e10db7497b8b9f5a31df1b4eb2.jpg', '20220722/2f5d639d26e0478ea50935edde4fd229.jpg', 13086, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:37:56', '2022-07-22 16:16:01');
INSERT INTO `sys_file_record` VALUES (23, 'b6a811873e704db49db994053a5019b2.jpg', '20220722/8da9136eed1f41cb8d4907cb77199ca5.jpg', 12591, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:38:00', '2022-07-22 16:16:02');
INSERT INTO `sys_file_record` VALUES (24, 'be7dc0c24fc342fda44e12a2c2a2b7bb.jpg', '20220722/2576207113104107935e743b5d5cd52a.jpg', 13554, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:38:09', '2022-07-22 16:16:03');
INSERT INTO `sys_file_record` VALUES (25, 'c184eef391ae48dba87e3057e70238fb.jpg', '20220722/15528efcdd1042ad8fce23d0f36905df.jpg', 17857, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:38:15', '2022-07-22 16:16:04');
INSERT INTO `sys_file_record` VALUES (26, 'd3519518b00d42d3936b2ab5ce3a4cc3.jpg', '20220722/6b8cfc0ee93144d680375a5c588da1e4.jpg', 10333, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:38:22', '2022-07-22 16:16:04');
INSERT INTO `sys_file_record` VALUES (27, '8931360b593040238d894a542c9037bc.jpg', '20220722/0e88d170dc284263898422dba5de257c.jpg', 10377, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:38:26', '2022-07-22 16:16:05');
INSERT INTO `sys_file_record` VALUES (28, 'e36594e7423147748b2592ccb720ae9e.jpg', '20220722/14a5f30c639b450c9ac7c01bb18b26b5.jpg', 12451, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:39:16', '2022-07-22 16:16:05');
INSERT INTO `sys_file_record` VALUES (29, 'f6bc05af944a4f738b54128717952107.jpg', '20220722/d67c079e3f41407c826ef9a110145d49.jpg', 11724, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:39:20', '2022-07-22 16:16:06');
INSERT INTO `sys_file_record` VALUES (30, '0568caaf0a7e41dda2d901d4ac2f3243.jpg', '20220722/b8f43e929d6048a7b6354b0fe4fae440.jpg', 24290, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:39:24', '2022-07-22 16:16:06');
INSERT INTO `sys_file_record` VALUES (31, '0bfaa58e801b47fb9f56dcb128206d94.jpg', '20220722/ebc5a81452694c6787b4e77ea579a12f.jpg', 4578, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:39:28', '2022-07-22 16:16:12');
INSERT INTO `sys_file_record` VALUES (32, '12b3d575a2a24e0789a014bd6ce7585b.jpg', '20220722/1ba37747d5014a5e9f6f0de5771326c9.jpg', 20909, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:39:32', '2022-07-22 16:16:13');
INSERT INTO `sys_file_record` VALUES (33, '2d98970a51b34b6b859339c96b240dcd.jpg', '20220722/6389dd41857b499a93ce3c5ce050da45.jpg', 11855, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:39:36', '2022-07-22 16:16:13');
INSERT INTO `sys_file_record` VALUES (34, '3cc0f65fefbe448191aa728d80f6b97e.jpg', '20220722/bc90af738f2641abb497092781055030.jpg', 15237, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:39:40', '2022-07-22 16:16:14');
INSERT INTO `sys_file_record` VALUES (35, '41d81834e87546f49d3ff48c3806ea92.jpg', '20220722/d08de988712a40e2b315ddbff750e730.jpg', 10983, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:39:45', '2022-07-22 16:16:14');
INSERT INTO `sys_file_record` VALUES (36, '4e60a84551fa48439bf42ecdb9673331.jpg', '20220722/5f5d6d56e4a74744906c542685770c28.jpg', 12075, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:39:49', '2022-07-22 16:16:14');
INSERT INTO `sys_file_record` VALUES (37, '66e6f6c60cfa44b288d6343027b544d0.jpg', '20220722/da9cb7ee91c04dedb462aebaa9321e15.jpg', 8346, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:39:53', '2022-07-22 16:16:15');
INSERT INTO `sys_file_record` VALUES (38, 'd6442cfa99b64b51aabfc470055b05dc.jpg', '20220722/b4fa02e6f1834586a05cede521394960.jpg', 14678, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:39:58', '2022-07-22 16:16:15');
INSERT INTO `sys_file_record` VALUES (39, '948344a2a77c47a7a7b332fe12ff749a.jpg', '20220722/a9e7971f1b084cf1a69544ae984ee9f7.jpg', 14334, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:40:04', '2022-07-22 16:16:16');
INSERT INTO `sys_file_record` VALUES (40, '20200708230820.png', '20220722/530578a3237745d791106053856f162f.png', 3799, 'image/png', NULL, 1, 0, 1, '2022-07-22 13:52:55', '2022-07-22 16:16:16');
INSERT INTO `sys_file_record` VALUES (41, 'china-provinces.geo.json', '20220722/74fc77a305f341f0a40d2448efaa047d.json', 54238, 'application/json', NULL, 1, 0, 1, '2022-07-22 13:55:46', '2022-07-22 16:16:17');
INSERT INTO `sys_file_record` VALUES (42, 'word.geo.json', '20220722/6f4b5f19e7754120868c810c5fcbeeb6.json', 1504924, 'application/json', NULL, 1, 0, 1, '2022-07-22 13:55:51', '2022-07-22 16:16:17');
INSERT INTO `sys_file_record` VALUES (43, '20200708224450.pdf', '20220722/21a93c2641b5486aae6d29b46a353073.pdf', 839977, 'application/pdf', NULL, 1, 0, 1, '2022-07-22 13:55:55', '2022-07-22 16:16:18');
INSERT INTO `sys_file_record` VALUES (44, '20200708224450.docx', '20220722/4a4f2df9ba4249e9b00df0427691ce57.docx', 2586229, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL, 1, 0, 1, '2022-07-22 13:55:58', '2022-07-22 16:16:18');
INSERT INTO `sys_file_record` VALUES (45, 'document.json', '20220722/e988a1140259460095dd154a0ab54ff0.json', 1675, 'application/json', NULL, 1, 0, 1, '2022-07-22 13:57:16', '2022-07-22 16:16:19');
INSERT INTO `sys_file_record` VALUES (46, 'archive.json', '20220722/fab7f40d28c44000b104205bd6d9e227.json', 1998, 'application/json', NULL, 1, 0, 1, '2022-07-22 13:57:19', '2022-07-22 16:16:19');
INSERT INTO `sys_file_record` VALUES (47, 'eleadmin-copyright.jpg', '20220722/881ef0f83ef347a18177ee26ccb33d1a.jpg', 79297, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:57:23', '2022-07-22 16:16:20');
INSERT INTO `sys_file_record` VALUES (48, 'eleadmin-pro-copyright.jpg', '20220722/b7bac0f9abdb4b0f94b911940a77ad3b.jpg', 151976, 'image/jpeg', NULL, 1, 0, 1, '2022-07-22 13:57:25', '2022-07-22 16:16:22');
INSERT INTO `sys_file_record` VALUES (49, 'avatar.jpg', '20220722/19b623b787514f8eb7d1e8edf2e9ff15.jpg', 12805, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 11:28:16', '2022-07-22 11:28:16');
INSERT INTO `sys_file_record` VALUES (50, 'logo.svg', '20220722/e77995c100de46409cce84e848a63f7d.svg', 1605, 'image/svg+xml', NULL, 14, 0, 2, '2022-07-22 11:28:21', '2022-07-22 11:28:21');
INSERT INTO `sys_file_record` VALUES (51, 'favicon.ico', '20220722/acb31ddb5ce44530933c48741c3bbfe2.ico', 4286, 'image/vnd.microsoft.icon', NULL, 14, 0, 2, '2022-07-22 11:29:11', '2022-07-22 11:29:11');
INSERT INTO `sys_file_record` VALUES (52, '用户导入模板.xlsx', '20220722/b4fa501bf6084f2e8bed971e68462ce3.xlsx', 10221, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', NULL, 14, 0, 2, '2022-07-22 11:29:24', '2022-07-22 11:29:24');
INSERT INTO `sys_file_record` VALUES (53, 'classes.json', '20220722/8d59c7d48453444d9ee84bd2b4c27a12.json', 6789, 'application/json', NULL, 14, 0, 2, '2022-07-22 11:29:28', '2022-07-22 11:29:28');
INSERT INTO `sys_file_record` VALUES (54, 'pro202012301.png', '20220722/4cbac74d9c5c45858854b24ee5db8e87.png', 59257, 'image/png', NULL, 14, 0, 2, '2022-07-22 11:34:39', '2022-07-22 11:34:39');
INSERT INTO `sys_file_record` VALUES (55, 'pro202012302.png', '20220722/24ba2b0906f64394ae0fb5e8f813cb30.png', 64832, 'image/png', NULL, 14, 0, 2, '2022-07-22 11:34:43', '2022-07-22 11:34:43');
INSERT INTO `sys_file_record` VALUES (56, 'pro202012303.png', '20220722/9d269d1fe7294ea4b5ca6f11c6ac8a95.png', 74518, 'image/png', NULL, 14, 0, 2, '2022-07-22 11:34:47', '2022-07-22 11:34:47');
INSERT INTO `sys_file_record` VALUES (57, 'eleadmin20201020172822.png', '20220722/45c686ab54264822963bc40716222591.png', 103558, 'image/png', NULL, 14, 0, 2, '2022-07-22 13:02:52', '2022-07-22 13:02:52');
INSERT INTO `sys_file_record` VALUES (58, 'RZ8FQmZfHkcffMlTBCJllBFjEhEsObVo.jpg', '20220722/099d2f77dfad41c7af776ad81af7aab5.jpg', 38206, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:34:41', '2022-07-22 13:34:41');
INSERT INTO `sys_file_record` VALUES (59, 'WLXm7gp1EbLDtvVQgkeQeyq5OtDm00Jd.jpg', '20220722/faf7fec118824f309fb66961866d9712.jpg', 60365, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:34:49', '2022-07-22 13:34:49');
INSERT INTO `sys_file_record` VALUES (60, '4Z0QR2L0J1XStxBh99jVJ8qLfsGsOgjU.jpg', '20220722/d845f1a4e91143dc81ec9fa96ce6f074.jpg', 50118, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:34:54', '2022-07-22 13:34:54');
INSERT INTO `sys_file_record` VALUES (61, 'ttkIjNPlVDuv4lUTvRX8GIlM2QqSe0jg.jpg', '20220722/4fc98decedcb4029bc954369c5e8c294.jpg', 29948, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:35:03', '2022-07-22 13:35:03');
INSERT INTO `sys_file_record` VALUES (62, 'fAenQ8nvRjL7x0i0jEfuDBZHvJfHf3v6.jpg', '20220722/9787d2f5b37d4813a48b72e950d00395.jpg', 48228, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:35:08', '2022-07-22 13:35:08');
INSERT INTO `sys_file_record` VALUES (63, 'LrCTN2j94lo9N7wEql7cBr1Ux4rHMvmZ.jpg', '20220722/9dacd9d48efa483ab204ae8ad0b60864.jpg', 37320, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:35:11', '2022-07-22 13:35:11');
INSERT INTO `sys_file_record` VALUES (64, 'yeKvhT20lMU0f1T3Y743UlGEOLLnZSnp.jpg', '20220722/f74da7fd19524bc0a4e75e6159d041ac.jpg', 29040, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:35:17', '2022-07-22 13:35:17');
INSERT INTO `sys_file_record` VALUES (65, 'CyrCNmTJfv7D6GFAg39bjT3eRkkRm5dI.jpg', '20220722/7539f0f90c4749cbbb56b111e2b8d6af.jpg', 39560, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:35:26', '2022-07-22 13:35:26');
INSERT INTO `sys_file_record` VALUES (66, 'faa0202700ee455b90fe77d8bef98bc0.jpg', '20220722/5079a6bc43b64bf2b86b87275dfaf7a2.jpg', 10250, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:36:21', '2022-07-22 13:36:21');
INSERT INTO `sys_file_record` VALUES (67, 'fe9196dd091e438fba115205c1003ee7.jpg', '20220722/db6740d4bb6e4938a8ce502a6af4554d.jpg', 10726, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:36:34', '2022-07-22 13:36:34');
INSERT INTO `sys_file_record` VALUES (68, '21222950dc174485b2ec5088435a46a3.jpg', '20220722/ef84d66c378549e7807b98b64282d222.jpg', 15201, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:37:49', '2022-07-22 13:37:49');
INSERT INTO `sys_file_record` VALUES (69, 'adb3ad5e05614fd2a59cf886ffc37f74.jpg', '20220722/c326e31373084a83a99387ac7929ecc7.jpg', 12782, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:37:53', '2022-07-22 13:37:53');
INSERT INTO `sys_file_record` VALUES (70, 'b3ce64e10db7497b8b9f5a31df1b4eb2.jpg', '20220722/2f5d639d26e0478ea50935edde4fd229.jpg', 13086, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:37:56', '2022-07-22 13:37:56');
INSERT INTO `sys_file_record` VALUES (71, 'b6a811873e704db49db994053a5019b2.jpg', '20220722/8da9136eed1f41cb8d4907cb77199ca5.jpg', 12591, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:38:00', '2022-07-22 13:38:00');
INSERT INTO `sys_file_record` VALUES (72, 'be7dc0c24fc342fda44e12a2c2a2b7bb.jpg', '20220722/2576207113104107935e743b5d5cd52a.jpg', 13554, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:38:09', '2022-07-22 13:38:09');
INSERT INTO `sys_file_record` VALUES (73, 'c184eef391ae48dba87e3057e70238fb.jpg', '20220722/15528efcdd1042ad8fce23d0f36905df.jpg', 17857, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:38:15', '2022-07-22 13:38:15');
INSERT INTO `sys_file_record` VALUES (74, 'd3519518b00d42d3936b2ab5ce3a4cc3.jpg', '20220722/6b8cfc0ee93144d680375a5c588da1e4.jpg', 10333, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:38:22', '2022-07-22 13:38:22');
INSERT INTO `sys_file_record` VALUES (75, '8931360b593040238d894a542c9037bc.jpg', '20220722/0e88d170dc284263898422dba5de257c.jpg', 10377, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:38:26', '2022-07-22 13:38:26');
INSERT INTO `sys_file_record` VALUES (76, 'e36594e7423147748b2592ccb720ae9e.jpg', '20220722/14a5f30c639b450c9ac7c01bb18b26b5.jpg', 12451, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:39:16', '2022-07-22 13:39:16');
INSERT INTO `sys_file_record` VALUES (77, 'f6bc05af944a4f738b54128717952107.jpg', '20220722/d67c079e3f41407c826ef9a110145d49.jpg', 11724, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:39:20', '2022-07-22 13:39:20');
INSERT INTO `sys_file_record` VALUES (78, '0568caaf0a7e41dda2d901d4ac2f3243.jpg', '20220722/b8f43e929d6048a7b6354b0fe4fae440.jpg', 24290, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:39:24', '2022-07-22 13:39:24');
INSERT INTO `sys_file_record` VALUES (79, '0bfaa58e801b47fb9f56dcb128206d94.jpg', '20220722/ebc5a81452694c6787b4e77ea579a12f.jpg', 4578, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:39:28', '2022-07-22 13:39:28');
INSERT INTO `sys_file_record` VALUES (80, '12b3d575a2a24e0789a014bd6ce7585b.jpg', '20220722/1ba37747d5014a5e9f6f0de5771326c9.jpg', 20909, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:39:32', '2022-07-22 13:39:32');
INSERT INTO `sys_file_record` VALUES (81, '2d98970a51b34b6b859339c96b240dcd.jpg', '20220722/6389dd41857b499a93ce3c5ce050da45.jpg', 11855, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:39:36', '2022-07-22 13:39:36');
INSERT INTO `sys_file_record` VALUES (82, '3cc0f65fefbe448191aa728d80f6b97e.jpg', '20220722/bc90af738f2641abb497092781055030.jpg', 15237, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:39:40', '2022-07-22 13:39:40');
INSERT INTO `sys_file_record` VALUES (83, '41d81834e87546f49d3ff48c3806ea92.jpg', '20220722/d08de988712a40e2b315ddbff750e730.jpg', 10983, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:39:45', '2022-07-22 13:39:45');
INSERT INTO `sys_file_record` VALUES (84, '4e60a84551fa48439bf42ecdb9673331.jpg', '20220722/5f5d6d56e4a74744906c542685770c28.jpg', 12075, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:39:49', '2022-07-22 13:39:49');
INSERT INTO `sys_file_record` VALUES (85, '66e6f6c60cfa44b288d6343027b544d0.jpg', '20220722/da9cb7ee91c04dedb462aebaa9321e15.jpg', 8346, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:39:53', '2022-07-22 13:39:53');
INSERT INTO `sys_file_record` VALUES (86, 'd6442cfa99b64b51aabfc470055b05dc.jpg', '20220722/b4fa02e6f1834586a05cede521394960.jpg', 14678, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:39:58', '2022-07-22 13:39:58');
INSERT INTO `sys_file_record` VALUES (87, '948344a2a77c47a7a7b332fe12ff749a.jpg', '20220722/a9e7971f1b084cf1a69544ae984ee9f7.jpg', 14334, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:40:04', '2022-07-22 13:40:04');
INSERT INTO `sys_file_record` VALUES (88, '20200708230820.png', '20220722/530578a3237745d791106053856f162f.png', 3799, 'image/png', NULL, 14, 0, 2, '2022-07-22 13:52:55', '2022-07-22 13:52:55');
INSERT INTO `sys_file_record` VALUES (89, 'china-provinces.geo.json', '20220722/74fc77a305f341f0a40d2448efaa047d.json', 54238, 'application/json', NULL, 14, 0, 2, '2022-07-22 13:55:46', '2022-07-22 13:55:46');
INSERT INTO `sys_file_record` VALUES (90, 'word.geo.json', '20220722/6f4b5f19e7754120868c810c5fcbeeb6.json', 1504924, 'application/json', NULL, 14, 0, 2, '2022-07-22 13:55:51', '2022-07-22 13:55:51');
INSERT INTO `sys_file_record` VALUES (91, '20200708224450.pdf', '20220722/21a93c2641b5486aae6d29b46a353073.pdf', 839977, 'application/pdf', NULL, 14, 0, 2, '2022-07-22 13:55:55', '2022-07-22 13:55:55');
INSERT INTO `sys_file_record` VALUES (92, '20200708224450.docx', '20220722/4a4f2df9ba4249e9b00df0427691ce57.docx', 2586229, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL, 14, 0, 2, '2022-07-22 13:55:58', '2022-07-22 13:55:58');
INSERT INTO `sys_file_record` VALUES (93, 'document.json', '20220722/e988a1140259460095dd154a0ab54ff0.json', 1675, 'application/json', NULL, 14, 0, 2, '2022-07-22 13:57:16', '2022-07-22 13:57:16');
INSERT INTO `sys_file_record` VALUES (94, 'archive.json', '20220722/fab7f40d28c44000b104205bd6d9e227.json', 1998, 'application/json', NULL, 14, 0, 2, '2022-07-22 13:57:19', '2022-07-22 13:57:19');
INSERT INTO `sys_file_record` VALUES (95, 'eleadmin-copyright.jpg', '20220722/881ef0f83ef347a18177ee26ccb33d1a.jpg', 79297, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:57:23', '2022-07-22 13:57:23');
INSERT INTO `sys_file_record` VALUES (96, 'eleadmin-pro-copyright.jpg', '20220722/b7bac0f9abdb4b0f94b911940a77ad3b.jpg', 151976, 'image/jpeg', NULL, 14, 0, 2, '2022-07-22 13:57:25', '2022-07-22 13:57:25');
INSERT INTO `sys_file_record` VALUES (97, 'avatar.jpg', '20220722/19b623b787514f8eb7d1e8edf2e9ff15.jpg', 12805, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 11:28:16', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (98, 'logo.svg', '20220722/e77995c100de46409cce84e848a63f7d.svg', 1605, 'image/svg+xml', NULL, 27, 0, 3, '2022-07-22 11:28:21', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (99, 'favicon.ico', '20220722/acb31ddb5ce44530933c48741c3bbfe2.ico', 4286, 'image/vnd.microsoft.icon', NULL, 27, 0, 3, '2022-07-22 11:29:11', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (100, '用户导入模板.xlsx', '20220722/b4fa501bf6084f2e8bed971e68462ce3.xlsx', 10221, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', NULL, 27, 0, 3, '2022-07-22 11:29:24', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (101, 'classes.json', '20220722/8d59c7d48453444d9ee84bd2b4c27a12.json', 6789, 'application/json', NULL, 27, 0, 3, '2022-07-22 11:29:28', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (102, 'pro202012301.png', '20220722/4cbac74d9c5c45858854b24ee5db8e87.png', 59257, 'image/png', NULL, 27, 0, 3, '2022-07-22 11:34:39', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (103, 'pro202012302.png', '20220722/24ba2b0906f64394ae0fb5e8f813cb30.png', 64832, 'image/png', NULL, 27, 0, 3, '2022-07-22 11:34:43', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (104, 'pro202012303.png', '20220722/9d269d1fe7294ea4b5ca6f11c6ac8a95.png', 74518, 'image/png', NULL, 27, 0, 3, '2022-07-22 11:34:47', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (105, 'eleadmin20201020172822.png', '20220722/45c686ab54264822963bc40716222591.png', 103558, 'image/png', NULL, 27, 0, 3, '2022-07-22 13:02:52', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (106, 'RZ8FQmZfHkcffMlTBCJllBFjEhEsObVo.jpg', '20220722/099d2f77dfad41c7af776ad81af7aab5.jpg', 38206, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:34:41', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (107, 'WLXm7gp1EbLDtvVQgkeQeyq5OtDm00Jd.jpg', '20220722/faf7fec118824f309fb66961866d9712.jpg', 60365, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:34:49', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (108, '4Z0QR2L0J1XStxBh99jVJ8qLfsGsOgjU.jpg', '20220722/d845f1a4e91143dc81ec9fa96ce6f074.jpg', 50118, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:34:54', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (109, 'ttkIjNPlVDuv4lUTvRX8GIlM2QqSe0jg.jpg', '20220722/4fc98decedcb4029bc954369c5e8c294.jpg', 29948, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:35:03', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (110, 'fAenQ8nvRjL7x0i0jEfuDBZHvJfHf3v6.jpg', '20220722/9787d2f5b37d4813a48b72e950d00395.jpg', 48228, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:35:08', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (111, 'LrCTN2j94lo9N7wEql7cBr1Ux4rHMvmZ.jpg', '20220722/9dacd9d48efa483ab204ae8ad0b60864.jpg', 37320, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:35:11', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (112, 'yeKvhT20lMU0f1T3Y743UlGEOLLnZSnp.jpg', '20220722/f74da7fd19524bc0a4e75e6159d041ac.jpg', 29040, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:35:17', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (113, 'CyrCNmTJfv7D6GFAg39bjT3eRkkRm5dI.jpg', '20220722/7539f0f90c4749cbbb56b111e2b8d6af.jpg', 39560, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:35:26', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (114, 'faa0202700ee455b90fe77d8bef98bc0.jpg', '20220722/5079a6bc43b64bf2b86b87275dfaf7a2.jpg', 10250, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:36:21', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (115, 'fe9196dd091e438fba115205c1003ee7.jpg', '20220722/db6740d4bb6e4938a8ce502a6af4554d.jpg', 10726, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:36:34', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (116, '21222950dc174485b2ec5088435a46a3.jpg', '20220722/ef84d66c378549e7807b98b64282d222.jpg', 15201, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:37:49', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (117, 'adb3ad5e05614fd2a59cf886ffc37f74.jpg', '20220722/c326e31373084a83a99387ac7929ecc7.jpg', 12782, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:37:53', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (118, 'b3ce64e10db7497b8b9f5a31df1b4eb2.jpg', '20220722/2f5d639d26e0478ea50935edde4fd229.jpg', 13086, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:37:56', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (119, 'b6a811873e704db49db994053a5019b2.jpg', '20220722/8da9136eed1f41cb8d4907cb77199ca5.jpg', 12591, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:38:00', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (120, 'be7dc0c24fc342fda44e12a2c2a2b7bb.jpg', '20220722/2576207113104107935e743b5d5cd52a.jpg', 13554, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:38:09', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (121, 'c184eef391ae48dba87e3057e70238fb.jpg', '20220722/15528efcdd1042ad8fce23d0f36905df.jpg', 17857, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:38:15', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (122, 'd3519518b00d42d3936b2ab5ce3a4cc3.jpg', '20220722/6b8cfc0ee93144d680375a5c588da1e4.jpg', 10333, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:38:22', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (123, '8931360b593040238d894a542c9037bc.jpg', '20220722/0e88d170dc284263898422dba5de257c.jpg', 10377, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:38:26', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (124, 'e36594e7423147748b2592ccb720ae9e.jpg', '20220722/14a5f30c639b450c9ac7c01bb18b26b5.jpg', 12451, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:39:16', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (125, 'f6bc05af944a4f738b54128717952107.jpg', '20220722/d67c079e3f41407c826ef9a110145d49.jpg', 11724, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:39:20', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (126, '0568caaf0a7e41dda2d901d4ac2f3243.jpg', '20220722/b8f43e929d6048a7b6354b0fe4fae440.jpg', 24290, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:39:24', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (127, '0bfaa58e801b47fb9f56dcb128206d94.jpg', '20220722/ebc5a81452694c6787b4e77ea579a12f.jpg', 4578, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:39:28', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (128, '12b3d575a2a24e0789a014bd6ce7585b.jpg', '20220722/1ba37747d5014a5e9f6f0de5771326c9.jpg', 20909, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:39:32', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (129, '2d98970a51b34b6b859339c96b240dcd.jpg', '20220722/6389dd41857b499a93ce3c5ce050da45.jpg', 11855, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:39:36', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (130, '3cc0f65fefbe448191aa728d80f6b97e.jpg', '20220722/bc90af738f2641abb497092781055030.jpg', 15237, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:39:40', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (131, '41d81834e87546f49d3ff48c3806ea92.jpg', '20220722/d08de988712a40e2b315ddbff750e730.jpg', 10983, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:39:45', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (132, '4e60a84551fa48439bf42ecdb9673331.jpg', '20220722/5f5d6d56e4a74744906c542685770c28.jpg', 12075, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:39:49', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (133, '66e6f6c60cfa44b288d6343027b544d0.jpg', '20220722/da9cb7ee91c04dedb462aebaa9321e15.jpg', 8346, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:39:53', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (134, 'd6442cfa99b64b51aabfc470055b05dc.jpg', '20220722/b4fa02e6f1834586a05cede521394960.jpg', 14678, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:39:58', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (135, '948344a2a77c47a7a7b332fe12ff749a.jpg', '20220722/a9e7971f1b084cf1a69544ae984ee9f7.jpg', 14334, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:40:04', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (136, '20200708230820.png', '20220722/530578a3237745d791106053856f162f.png', 3799, 'image/png', NULL, 27, 0, 3, '2022-07-22 13:52:55', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (137, 'china-provinces.geo.json', '20220722/74fc77a305f341f0a40d2448efaa047d.json', 54238, 'application/json', NULL, 27, 0, 3, '2022-07-22 13:55:46', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (138, 'word.geo.json', '20220722/6f4b5f19e7754120868c810c5fcbeeb6.json', 1504924, 'application/json', NULL, 27, 0, 3, '2022-07-22 13:55:51', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (139, '20200708224450.pdf', '20220722/21a93c2641b5486aae6d29b46a353073.pdf', 839977, 'application/pdf', NULL, 27, 0, 3, '2022-07-22 13:55:55', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (140, '20200708224450.docx', '20220722/4a4f2df9ba4249e9b00df0427691ce57.docx', 2586229, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL, 27, 0, 3, '2022-07-22 13:55:58', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (141, 'document.json', '20220722/e988a1140259460095dd154a0ab54ff0.json', 1675, 'application/json', NULL, 27, 0, 3, '2022-07-22 13:57:16', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (142, 'archive.json', '20220722/fab7f40d28c44000b104205bd6d9e227.json', 1998, 'application/json', NULL, 27, 0, 3, '2022-07-22 13:57:19', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (143, 'eleadmin-copyright.jpg', '20220722/881ef0f83ef347a18177ee26ccb33d1a.jpg', 79297, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:57:23', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (144, 'eleadmin-pro-copyright.jpg', '20220722/b7bac0f9abdb4b0f94b911940a77ad3b.jpg', 151976, 'image/jpeg', NULL, 27, 0, 3, '2022-07-22 13:57:25', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (145, 'avatar.jpg', '20220722/19b623b787514f8eb7d1e8edf2e9ff15.jpg', 12805, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 11:28:16', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (146, 'logo.svg', '20220722/e77995c100de46409cce84e848a63f7d.svg', 1605, 'image/svg+xml', NULL, 40, 0, 4, '2022-07-22 11:28:21', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (147, 'favicon.ico', '20220722/acb31ddb5ce44530933c48741c3bbfe2.ico', 4286, 'image/vnd.microsoft.icon', NULL, 40, 0, 4, '2022-07-22 11:29:11', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (148, '用户导入模板.xlsx', '20220722/b4fa501bf6084f2e8bed971e68462ce3.xlsx', 10221, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', NULL, 40, 0, 4, '2022-07-22 11:29:24', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (149, 'classes.json', '20220722/8d59c7d48453444d9ee84bd2b4c27a12.json', 6789, 'application/json', NULL, 40, 0, 4, '2022-07-22 11:29:28', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (150, 'pro202012301.png', '20220722/4cbac74d9c5c45858854b24ee5db8e87.png', 59257, 'image/png', NULL, 40, 0, 4, '2022-07-22 11:34:39', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (151, 'pro202012302.png', '20220722/24ba2b0906f64394ae0fb5e8f813cb30.png', 64832, 'image/png', NULL, 40, 0, 4, '2022-07-22 11:34:43', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (152, 'pro202012303.png', '20220722/9d269d1fe7294ea4b5ca6f11c6ac8a95.png', 74518, 'image/png', NULL, 40, 0, 4, '2022-07-22 11:34:47', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (153, 'eleadmin20201020172822.png', '20220722/45c686ab54264822963bc40716222591.png', 103558, 'image/png', NULL, 40, 0, 4, '2022-07-22 13:02:52', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (154, 'RZ8FQmZfHkcffMlTBCJllBFjEhEsObVo.jpg', '20220722/099d2f77dfad41c7af776ad81af7aab5.jpg', 38206, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:34:41', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (155, 'WLXm7gp1EbLDtvVQgkeQeyq5OtDm00Jd.jpg', '20220722/faf7fec118824f309fb66961866d9712.jpg', 60365, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:34:49', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (156, '4Z0QR2L0J1XStxBh99jVJ8qLfsGsOgjU.jpg', '20220722/d845f1a4e91143dc81ec9fa96ce6f074.jpg', 50118, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:34:54', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (157, 'ttkIjNPlVDuv4lUTvRX8GIlM2QqSe0jg.jpg', '20220722/4fc98decedcb4029bc954369c5e8c294.jpg', 29948, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:35:03', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (158, 'fAenQ8nvRjL7x0i0jEfuDBZHvJfHf3v6.jpg', '20220722/9787d2f5b37d4813a48b72e950d00395.jpg', 48228, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:35:08', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (159, 'LrCTN2j94lo9N7wEql7cBr1Ux4rHMvmZ.jpg', '20220722/9dacd9d48efa483ab204ae8ad0b60864.jpg', 37320, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:35:11', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (160, 'yeKvhT20lMU0f1T3Y743UlGEOLLnZSnp.jpg', '20220722/f74da7fd19524bc0a4e75e6159d041ac.jpg', 29040, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:35:17', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (161, 'CyrCNmTJfv7D6GFAg39bjT3eRkkRm5dI.jpg', '20220722/7539f0f90c4749cbbb56b111e2b8d6af.jpg', 39560, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:35:26', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (162, 'faa0202700ee455b90fe77d8bef98bc0.jpg', '20220722/5079a6bc43b64bf2b86b87275dfaf7a2.jpg', 10250, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:36:21', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (163, 'fe9196dd091e438fba115205c1003ee7.jpg', '20220722/db6740d4bb6e4938a8ce502a6af4554d.jpg', 10726, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:36:34', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (164, '21222950dc174485b2ec5088435a46a3.jpg', '20220722/ef84d66c378549e7807b98b64282d222.jpg', 15201, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:37:49', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (165, 'adb3ad5e05614fd2a59cf886ffc37f74.jpg', '20220722/c326e31373084a83a99387ac7929ecc7.jpg', 12782, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:37:53', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (166, 'b3ce64e10db7497b8b9f5a31df1b4eb2.jpg', '20220722/2f5d639d26e0478ea50935edde4fd229.jpg', 13086, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:37:56', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (167, 'b6a811873e704db49db994053a5019b2.jpg', '20220722/8da9136eed1f41cb8d4907cb77199ca5.jpg', 12591, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:38:00', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (168, 'be7dc0c24fc342fda44e12a2c2a2b7bb.jpg', '20220722/2576207113104107935e743b5d5cd52a.jpg', 13554, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:38:09', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (169, 'c184eef391ae48dba87e3057e70238fb.jpg', '20220722/15528efcdd1042ad8fce23d0f36905df.jpg', 17857, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:38:15', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (170, 'd3519518b00d42d3936b2ab5ce3a4cc3.jpg', '20220722/6b8cfc0ee93144d680375a5c588da1e4.jpg', 10333, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:38:22', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (171, '8931360b593040238d894a542c9037bc.jpg', '20220722/0e88d170dc284263898422dba5de257c.jpg', 10377, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:38:26', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (172, 'e36594e7423147748b2592ccb720ae9e.jpg', '20220722/14a5f30c639b450c9ac7c01bb18b26b5.jpg', 12451, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:39:16', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (173, 'f6bc05af944a4f738b54128717952107.jpg', '20220722/d67c079e3f41407c826ef9a110145d49.jpg', 11724, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:39:20', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (174, '0568caaf0a7e41dda2d901d4ac2f3243.jpg', '20220722/b8f43e929d6048a7b6354b0fe4fae440.jpg', 24290, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:39:24', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (175, '0bfaa58e801b47fb9f56dcb128206d94.jpg', '20220722/ebc5a81452694c6787b4e77ea579a12f.jpg', 4578, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:39:28', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (176, '12b3d575a2a24e0789a014bd6ce7585b.jpg', '20220722/1ba37747d5014a5e9f6f0de5771326c9.jpg', 20909, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:39:32', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (177, '2d98970a51b34b6b859339c96b240dcd.jpg', '20220722/6389dd41857b499a93ce3c5ce050da45.jpg', 11855, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:39:36', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (178, '3cc0f65fefbe448191aa728d80f6b97e.jpg', '20220722/bc90af738f2641abb497092781055030.jpg', 15237, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:39:40', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (179, '41d81834e87546f49d3ff48c3806ea92.jpg', '20220722/d08de988712a40e2b315ddbff750e730.jpg', 10983, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:39:45', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (180, '4e60a84551fa48439bf42ecdb9673331.jpg', '20220722/5f5d6d56e4a74744906c542685770c28.jpg', 12075, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:39:49', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (181, '66e6f6c60cfa44b288d6343027b544d0.jpg', '20220722/da9cb7ee91c04dedb462aebaa9321e15.jpg', 8346, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:39:53', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (182, 'd6442cfa99b64b51aabfc470055b05dc.jpg', '20220722/b4fa02e6f1834586a05cede521394960.jpg', 14678, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:39:58', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (183, '948344a2a77c47a7a7b332fe12ff749a.jpg', '20220722/a9e7971f1b084cf1a69544ae984ee9f7.jpg', 14334, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:40:04', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (184, '20200708230820.png', '20220722/530578a3237745d791106053856f162f.png', 3799, 'image/png', NULL, 40, 0, 4, '2022-07-22 13:52:55', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (185, 'china-provinces.geo.json', '20220722/74fc77a305f341f0a40d2448efaa047d.json', 54238, 'application/json', NULL, 40, 0, 4, '2022-07-22 13:55:46', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (186, 'word.geo.json', '20220722/6f4b5f19e7754120868c810c5fcbeeb6.json', 1504924, 'application/json', NULL, 40, 0, 4, '2022-07-22 13:55:51', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (187, '20200708224450.pdf', '20220722/21a93c2641b5486aae6d29b46a353073.pdf', 839977, 'application/pdf', NULL, 40, 0, 4, '2022-07-22 13:55:55', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (188, '20200708224450.docx', '20220722/4a4f2df9ba4249e9b00df0427691ce57.docx', 2586229, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', NULL, 40, 0, 4, '2022-07-22 13:55:58', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (189, 'document.json', '20220722/e988a1140259460095dd154a0ab54ff0.json', 1675, 'application/json', NULL, 40, 0, 4, '2022-07-22 13:57:16', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (190, 'archive.json', '20220722/fab7f40d28c44000b104205bd6d9e227.json', 1998, 'application/json', NULL, 40, 0, 4, '2022-07-22 13:57:19', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (191, 'eleadmin-copyright.jpg', '20220722/881ef0f83ef347a18177ee26ccb33d1a.jpg', 79297, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:57:23', '2023-02-07 09:13:53');
INSERT INTO `sys_file_record` VALUES (192, 'eleadmin-pro-copyright.jpg', '20220722/b7bac0f9abdb4b0f94b911940a77ad3b.jpg', 151976, 'image/jpeg', NULL, 40, 0, 4, '2022-07-22 13:57:25', '2023-02-07 09:13:53');

-- ----------------------------
-- Table structure for sys_login_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_record`;
CREATE TABLE `sys_login_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `os` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `device` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备名',
  `browser` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `login_type` int(11) NOT NULL COMMENT '操作类型, 0登录成功, 1登录失败, 2退出登录, 3续签token',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` int(11) NOT NULL DEFAULT 1 COMMENT '租户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tenant_id`(`tenant_id`) USING BTREE,
  CONSTRAINT `sys_login_record_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `sys_tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_record
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级id, 0是顶级',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单路由地址',
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单组件地址, 目录可为空',
  `menu_type` int(11) NULL DEFAULT 0 COMMENT '类型, 0菜单, 1按钮',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `authority` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `hide` int(11) NOT NULL DEFAULT 0 COMMENT '是否隐藏, 0否, 1是(仅注册路由不显示在左侧菜单)',
  `meta` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它路由元信息',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除, 0否, 1是',
  `tenant_id` int(11) NOT NULL DEFAULT 1 COMMENT '租户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `tenant_id`(`tenant_id`) USING BTREE,
  CONSTRAINT `sys_menu_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `sys_tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', '/system', NULL, 0, 1, NULL, 'el-icon-setting', 0, '{\"badge\": \"New\", \"badgeColor\": \"warning\"}', 0, 1, '2020-02-26 12:51:23', '2023-12-06 15:06:55');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', '/system/user', '/system/user', 0, 1, NULL, 'el-icon-_user-group', 0, NULL, 0, 1, '2020-02-26 12:51:55', '2021-05-21 17:56:28');
INSERT INTO `sys_menu` VALUES (3, 2, '查询用户', NULL, NULL, 1, 1, 'sys:user:list', NULL, 0, NULL, 0, 1, '2020-02-26 12:52:06', '2020-09-16 11:05:35');
INSERT INTO `sys_menu` VALUES (4, 2, '添加用户', NULL, NULL, 1, 2, 'sys:user:save', NULL, 0, NULL, 0, 1, '2020-02-26 12:52:26', '2020-03-21 18:45:29');
INSERT INTO `sys_menu` VALUES (5, 2, '修改用户', NULL, NULL, 1, 3, 'sys:user:update', NULL, 0, NULL, 0, 1, '2020-02-26 12:52:50', '2020-03-21 18:45:30');
INSERT INTO `sys_menu` VALUES (6, 2, '删除用户', NULL, NULL, 1, 4, 'sys:user:remove', NULL, 0, NULL, 0, 1, '2020-02-26 12:53:13', '2020-03-21 18:45:32');
INSERT INTO `sys_menu` VALUES (7, 1, '角色管理', '/system/role', '/system/role', 0, 2, NULL, 'el-icon-postcard', 0, NULL, 0, 1, '2020-03-13 13:29:08', '2021-05-21 17:56:34');
INSERT INTO `sys_menu` VALUES (8, 7, '查询角色', NULL, NULL, 1, 1, 'sys:role:list', NULL, 0, NULL, 0, 1, '2020-03-13 13:30:41', '2020-03-21 18:45:34');
INSERT INTO `sys_menu` VALUES (9, 7, '添加角色', NULL, NULL, 1, 2, 'sys:role:save', NULL, 0, NULL, 0, 1, '2020-03-15 13:02:07', '2020-03-21 18:45:35');
INSERT INTO `sys_menu` VALUES (10, 7, '修改角色', NULL, NULL, 1, 3, 'sys:role:update', NULL, 0, NULL, 0, 1, '2020-03-15 13:02:49', '2020-03-21 18:45:36');
INSERT INTO `sys_menu` VALUES (11, 7, '删除角色', NULL, NULL, 1, 4, 'sys:role:remove', NULL, 0, NULL, 0, 1, '2020-03-20 17:58:51', '2020-03-21 18:45:38');
INSERT INTO `sys_menu` VALUES (12, 1, '菜单管理', '/system/menu', '/system/menu', 0, 3, NULL, 'el-icon-s-operation', 0, NULL, 0, 1, '2020-03-21 01:07:13', '2021-05-21 17:56:39');
INSERT INTO `sys_menu` VALUES (13, 12, '查询菜单', NULL, NULL, 1, 1, 'sys:menu:list', NULL, 0, NULL, 0, 1, '2020-03-21 16:43:30', '2020-03-21 18:45:40');
INSERT INTO `sys_menu` VALUES (14, 12, '添加菜单', NULL, NULL, 1, 2, 'sys:menu:save', NULL, 0, NULL, 0, 1, '2020-03-21 16:43:54', '2020-03-21 18:45:41');
INSERT INTO `sys_menu` VALUES (15, 12, '修改菜单', NULL, NULL, 1, 3, 'sys:menu:update', NULL, 0, NULL, 0, 1, '2020-03-21 18:24:17', '2020-03-21 18:45:43');
INSERT INTO `sys_menu` VALUES (16, 12, '删除菜单', NULL, NULL, 1, 4, 'sys:menu:remove', NULL, 0, NULL, 0, 1, '2020-03-21 18:24:18', '2020-03-21 18:45:44');
INSERT INTO `sys_menu` VALUES (17, 1, '机构管理', '/system/organization', '/system/organization', 0, 4, NULL, 'el-icon-office-building', 0, NULL, 0, 1, '2020-03-21 18:24:20', '2021-11-05 16:13:26');
INSERT INTO `sys_menu` VALUES (18, 17, '查询机构', NULL, NULL, 1, 1, 'sys:org:list', NULL, 0, NULL, 0, 1, '2020-03-21 18:24:21', '2020-03-21 18:44:36');
INSERT INTO `sys_menu` VALUES (19, 17, '添加机构', NULL, NULL, 1, 2, 'sys:org:save', NULL, 0, NULL, 0, 1, '2020-03-21 18:24:22', '2020-03-21 18:45:51');
INSERT INTO `sys_menu` VALUES (20, 17, '修改机构', NULL, NULL, 1, 3, 'sys:org:update', NULL, 0, NULL, 0, 1, '2020-03-21 18:24:24', '2020-03-21 18:45:52');
INSERT INTO `sys_menu` VALUES (21, 17, '删除机构', NULL, NULL, 1, 4, 'sys:org:remove', NULL, 0, NULL, 0, 1, '2020-03-21 18:24:25', '2020-03-21 18:45:54');
INSERT INTO `sys_menu` VALUES (22, 1, '字典管理', '/system/dictionary', '/system/dictionary', 0, 5, NULL, 'el-icon-notebook-2', 0, NULL, 0, 1, '2020-03-21 18:24:26', '2021-11-05 16:13:30');
INSERT INTO `sys_menu` VALUES (23, 22, '查询字典', NULL, NULL, 1, 1, 'sys:dict:list', NULL, 0, NULL, 0, 1, '2020-03-21 18:24:27', '2020-03-21 18:44:42');
INSERT INTO `sys_menu` VALUES (24, 22, '添加字典', NULL, NULL, 1, 2, 'sys:dict:save', NULL, 0, NULL, 0, 1, '2020-03-21 18:24:28', '2020-03-21 18:45:59');
INSERT INTO `sys_menu` VALUES (25, 22, '修改字典', NULL, NULL, 1, 3, 'sys:dict:update', NULL, 0, NULL, 0, 1, '2020-03-21 18:24:29', '2020-03-21 18:46:01');
INSERT INTO `sys_menu` VALUES (26, 22, '删除字典', NULL, NULL, 1, 4, 'sys:dict:remove', NULL, 0, NULL, 0, 1, '2020-03-21 18:24:31', '2020-03-21 18:46:02');
INSERT INTO `sys_menu` VALUES (27, 1, '登录日志', '/system/login-record', '/system/login-record', 0, 7, 'sys:login-record:list', 'el-icon-date', 0, NULL, 0, 1, '2020-03-21 18:24:33', '2021-11-05 17:28:53');
INSERT INTO `sys_menu` VALUES (28, 1, '操作日志', '/system/operation-record', '/system/operation-record', 0, 8, 'sys:operation-record:list', 'el-icon-_retrieve', 0, NULL, 0, 1, '2020-03-21 18:24:34', '2021-11-05 17:28:56');
INSERT INTO `sys_menu` VALUES (29, 1, '文件管理', '/system/file', '/system/file', 0, 6, NULL, 'el-icon-folder', 0, NULL, 0, 1, '2020-09-17 23:19:43', '2023-09-06 08:49:09');
INSERT INTO `sys_menu` VALUES (30, 29, '上传文件', NULL, NULL, 1, 1, 'sys:file:upload', NULL, 0, NULL, 0, 1, '2020-09-17 23:21:04', '2022-07-20 16:40:21');
INSERT INTO `sys_menu` VALUES (31, 29, '删除文件', NULL, NULL, 1, 2, 'sys:file:remove', NULL, 0, NULL, 0, 1, '2020-09-17 23:21:53', '2022-07-20 16:40:23');
INSERT INTO `sys_menu` VALUES (32, 29, '查看记录', NULL, NULL, 1, 3, 'sys:file:list', NULL, 0, NULL, 0, 1, '2020-09-17 23:20:29', '2022-07-20 16:40:24');
INSERT INTO `sys_menu` VALUES (33, 2, '用户详情', '/system/user/details', '/system/user/details', 0, 5, NULL, 'el-icon-user', 1, '{\"active\": \"/system/user\"}', 0, 1, '2021-05-21 11:07:54', '2022-07-20 16:39:29');
INSERT INTO `sys_menu` VALUES (34, 1, '修改个人密码', NULL, NULL, 1, 9, 'sys:auth:password', NULL, 0, NULL, 0, 1, '2020-09-17 23:22:45', '2023-04-19 08:40:53');
INSERT INTO `sys_menu` VALUES (35, 1, '修改个人资料', NULL, NULL, 1, 10, 'sys:auth:user', NULL, 0, NULL, 0, 1, '2020-09-17 23:23:24', '2023-04-19 08:40:54');
INSERT INTO `sys_menu` VALUES (36, 0, 'Dashboard', '/dashboard', NULL, 0, 0, NULL, 'el-icon-house', 0, NULL, 0, 1, '2021-02-02 20:00:34', '2021-11-05 16:37:00');
INSERT INTO `sys_menu` VALUES (37, 36, '工作台', '/dashboard/workplace', '/dashboard/workplace', 0, 1, NULL, 'el-icon-monitor', 0, NULL, 0, 1, '2021-02-02 20:00:37', '2021-11-05 16:36:59');
INSERT INTO `sys_menu` VALUES (38, 36, '分析页', '/dashboard/analysis', '/dashboard/analysis', 0, 2, NULL, 'el-icon-data-analysis', 0, '{\"badge\": 1}', 0, 1, '2021-02-02 20:00:40', '2022-03-11 16:45:44');
INSERT INTO `sys_menu` VALUES (39, 36, '监控页', '/dashboard/monitor', '/dashboard/monitor', 0, 3, NULL, 'el-icon-odometer', 0, NULL, 0, 1, '2021-02-02 20:03:12', '2021-11-05 16:36:56');
INSERT INTO `sys_menu` VALUES (40, 0, '表单页面', '/form', NULL, 0, 2, NULL, 'el-icon-tickets', 0, NULL, 0, 1, '2021-02-02 20:03:28', '2023-12-06 15:07:08');
INSERT INTO `sys_menu` VALUES (41, 40, '基础表单', '/form/basic', '/form/basic', 0, 1, NULL, 'el-icon-_feedback', 0, NULL, 0, 1, '2021-02-02 20:03:51', '2021-11-05 16:36:53');
INSERT INTO `sys_menu` VALUES (42, 40, '复杂表单', '/form/advanced', '/form/advanced', 0, 2, NULL, 'el-icon-_visa', 0, NULL, 0, 1, '2021-02-02 20:03:56', '2021-11-05 16:36:52');
INSERT INTO `sys_menu` VALUES (43, 40, '分步表单', '/form/step', '/form/step', 0, 3, NULL, 'el-icon-c-scale-to-original', 0, NULL, 0, 1, '2021-02-02 20:04:06', '2021-11-05 16:36:50');
INSERT INTO `sys_menu` VALUES (44, 0, '列表页面', '/list', NULL, 0, 3, NULL, 'el-icon-_table', 0, NULL, 0, 1, '2021-02-02 20:05:07', '2021-11-05 16:36:49');
INSERT INTO `sys_menu` VALUES (45, 44, '基础列表', '/list/basic', '/list/basic', 0, 1, NULL, 'el-icon-document', 0, NULL, 0, 1, '2021-02-02 20:05:10', '2021-11-05 16:36:48');
INSERT INTO `sys_menu` VALUES (46, 44, '复杂列表', '/list/advanced', '/list/advanced', 0, 2, NULL, 'el-icon-_cols', 0, NULL, 0, 1, '2021-02-02 20:05:26', '2021-11-05 16:36:47');
INSERT INTO `sys_menu` VALUES (47, 44, '卡片列表', '/list/card', '/list/card', 0, 3, NULL, 'el-icon-_menu', 0, NULL, 0, 1, '2021-02-02 20:05:30', '2021-11-05 16:36:45');
INSERT INTO `sys_menu` VALUES (48, 47, '项目列表', '/list/card/project', '/list/card/project', 0, 1, NULL, 'el-icon-_menu', 0, NULL, 0, 1, '2021-02-02 20:06:35', '2021-11-05 16:36:44');
INSERT INTO `sys_menu` VALUES (49, 47, '应用列表', '/list/card/application', '/list/card/application', 0, 2, NULL, 'el-icon-_menu', 0, NULL, 0, 1, '2021-02-02 20:06:39', '2021-11-05 16:36:42');
INSERT INTO `sys_menu` VALUES (50, 47, '文章列表', '/list/card/article', '/list/card/article', 0, 3, NULL, 'el-icon-_menu', 0, NULL, 0, 1, '2021-02-02 20:06:48', '2021-11-05 16:36:41');
INSERT INTO `sys_menu` VALUES (51, 45, '添加用户', '/list/basic/add', '/list/basic/add', 0, 1, NULL, 'el-icon-user', 1, '{\"active\": \"/list/basic\"}', 0, 1, '2022-03-11 21:56:38', '2022-07-20 16:42:25');
INSERT INTO `sys_menu` VALUES (52, 45, '修改用户', '/list/basic/edit', '/list/basic/edit', 0, 2, NULL, 'el-icon-user', 1, '{\"active\": \"/list/basic\"}', 0, 1, '2022-03-11 21:56:38', '2022-07-20 16:42:26');
INSERT INTO `sys_menu` VALUES (53, 45, '用户详情', '/list/basic/details/:id', '/list/basic/details', 0, 3, NULL, 'el-icon-user', 1, '{\"active\": \"/list/basic\"}', 0, 1, '2022-03-11 21:56:38', '2022-07-20 16:42:27');
INSERT INTO `sys_menu` VALUES (54, 0, '结果页面', '/result', NULL, 0, 4, NULL, 'el-icon-circle-check', 0, NULL, 0, 1, '2021-02-02 20:07:33', '2021-11-05 16:36:40');
INSERT INTO `sys_menu` VALUES (55, 54, '成功页', '/result/success', '/result/success', 0, 1, NULL, 'el-icon-circle-check', 0, NULL, 0, 1, '2021-02-02 20:07:40', '2021-11-05 16:36:38');
INSERT INTO `sys_menu` VALUES (56, 54, '失败页', '/result/fail', '/result/fail', 0, 2, NULL, 'el-icon-circle-close', 0, NULL, 0, 1, '2021-02-02 20:07:41', '2021-11-05 16:36:37');
INSERT INTO `sys_menu` VALUES (57, 0, '异常页面', '/exception', NULL, 0, 5, NULL, 'el-icon-document-delete', 0, NULL, 0, 1, '2021-02-02 20:08:44', '2021-11-05 16:36:36');
INSERT INTO `sys_menu` VALUES (58, 57, '403', '/exception/403', '/exception/403', 0, 1, NULL, 'el-icon-document-checked', 0, NULL, 0, 1, '2021-02-02 20:08:47', '2021-11-05 16:36:35');
INSERT INTO `sys_menu` VALUES (59, 57, '404', '/exception/404', '/exception/404', 0, 2, NULL, 'el-icon-document-remove', 0, NULL, 0, 1, '2021-02-02 20:08:49', '2021-11-05 16:36:34');
INSERT INTO `sys_menu` VALUES (60, 57, '500', '/exception/500', '/exception/500', 0, 3, NULL, 'el-icon-document-delete', 0, NULL, 0, 1, '2021-02-02 20:08:52', '2021-11-05 16:36:33');
INSERT INTO `sys_menu` VALUES (61, 0, '个人中心', '/user', NULL, 0, 6, NULL, 'el-icon-set-up', 0, NULL, 0, 1, '2021-02-02 20:09:54', '2021-11-05 16:36:31');
INSERT INTO `sys_menu` VALUES (62, 61, '我的资料', '/user/profile', '/user/profile', 0, 1, NULL, 'el-icon-user', 0, NULL, 0, 1, '2021-02-02 20:09:58', '2021-11-05 16:36:30');
INSERT INTO `sys_menu` VALUES (63, 61, '我的消息', '/user/message', '/user/message', 0, 2, NULL, 'el-icon-chat-dot-round', 0, NULL, 0, 1, '2021-02-02 20:10:03', '2021-11-05 16:36:27');
INSERT INTO `sys_menu` VALUES (64, 0, '扩展组件', '/extension', NULL, 0, 7, NULL, 'el-icon-open', 0, NULL, 0, 1, '2021-02-02 20:10:52', '2021-11-05 16:36:26');
INSERT INTO `sys_menu` VALUES (65, 64, '图标扩展', '/extension/icon', '/extension/icon', 0, 1, NULL, 'el-icon-_heart', 0, NULL, 0, 1, '2021-02-02 20:10:55', '2022-03-11 21:36:27');
INSERT INTO `sys_menu` VALUES (66, 64, '标签组件', '/extension/tag', '/extension/tag', 0, 2, NULL, 'el-icon-price-tag', 0, NULL, 0, 1, '2021-10-05 11:13:35', '2022-03-11 21:42:50');
INSERT INTO `sys_menu` VALUES (67, 64, '弹窗扩展', '/extension/dialog', '/extension/dialog', 0, 3, NULL, 'el-icon-copy-document', 0, NULL, 0, 1, '2021-10-05 11:32:12', '2022-03-11 21:42:52');
INSERT INTO `sys_menu` VALUES (68, 64, '文件列表', '/extension/file', '/extension/file', 0, 4, NULL, 'el-icon-folder', 0, NULL, 0, 1, '2021-02-02 20:10:58', '2022-03-11 21:37:16');
INSERT INTO `sys_menu` VALUES (69, 64, '图片上传', '/extension/upload', '/extension/upload', 0, 5, NULL, 'el-icon-picture-outline', 0, NULL, 0, 1, '2021-02-02 20:10:58', '2022-07-20 16:49:27');
INSERT INTO `sys_menu` VALUES (70, 64, '拖拽排序', '/extension/dragsort', '/extension/dragsort', 0, 6, NULL, 'el-icon-rank', 0, NULL, 0, 1, '2021-02-02 20:11:48', '2022-07-20 16:43:38');
INSERT INTO `sys_menu` VALUES (71, 64, '消息提示', '/extension/message', '/extension/message', 0, 7, NULL, 'el-icon-chat-line-square', 0, NULL, 0, 1, '2021-10-05 11:14:28', '2022-07-20 16:43:39');
INSERT INTO `sys_menu` VALUES (72, 64, '城市选择', '/extension/regions', '/extension/regions', 0, 8, NULL, 'el-icon-office-building', 0, NULL, 0, 1, '2021-10-05 11:25:15', '2022-07-20 16:43:40');
INSERT INTO `sys_menu` VALUES (73, 64, '打印插件', '/extension/printer', '/extension/printer', 0, 9, NULL, 'el-icon-printer', 0, NULL, 0, 1, '2021-02-02 20:11:00', '2022-07-20 16:43:42');
INSERT INTO `sys_menu` VALUES (74, 64, 'excel插件', '/extension/excel', '/extension/excel', 0, 10, NULL, 'el-icon-_table', 0, NULL, 0, 1, '2021-02-02 20:11:03', '2022-07-20 16:43:43');
INSERT INTO `sys_menu` VALUES (75, 64, '滚动数字', '/extension/count-up', '/extension/count-up', 0, 11, NULL, 'el-icon-more', 0, NULL, 0, 1, '2021-10-05 11:29:03', '2022-07-20 16:43:45');
INSERT INTO `sys_menu` VALUES (76, 64, '空状态', '/extension/empty', '/extension/empty', 0, 12, NULL, 'el-icon-receiving', 0, NULL, 0, 1, '2021-10-05 11:20:35', '2022-07-20 16:43:47');
INSERT INTO `sys_menu` VALUES (77, 64, '步骤条', '/extension/steps', '/extension/steps', 0, 13, NULL, 'el-icon-_timeline', 0, NULL, 0, 1, '2021-10-05 11:16:39', '2022-07-20 16:43:49');
INSERT INTO `sys_menu` VALUES (78, 64, '菜单导航', '/extension/menu', '/extension/menu', 0, 14, NULL, 'el-icon-s-operation', 0, NULL, 0, 1, '2021-10-05 11:18:35', '2022-07-20 16:43:51');
INSERT INTO `sys_menu` VALUES (79, 64, '树形下拉', '/extension/tree-select', '/extension/tree-select', 0, 15, NULL, 'el-icon-_condition', 0, NULL, 0, 1, '2021-10-10 16:21:12', '2022-07-20 16:43:52');
INSERT INTO `sys_menu` VALUES (80, 64, '表格下拉', '/extension/table-select', '/extension/table-select', 0, 16, NULL, 'el-icon-_table', 0, NULL, 0, 1, '2021-10-10 16:21:45', '2022-07-20 16:43:54');
INSERT INTO `sys_menu` VALUES (81, 64, '分割布局', '/extension/split-layout', '/extension/split-layout', 0, 17, NULL, NULL, 0, NULL, 1, 1, '2021-10-10 16:21:45', '2022-07-20 16:45:04');
INSERT INTO `sys_menu` VALUES (82, 64, '视频播放', '/extension/player', '/extension/player', 0, 18, NULL, 'el-icon-_video', 0, NULL, 0, 1, '2021-02-02 20:13:49', '2022-07-20 16:44:01');
INSERT INTO `sys_menu` VALUES (83, 64, '地图组件', '/extension/map', '/extension/map', 0, 19, NULL, 'el-icon-map-location', 0, NULL, 0, 1, '2021-02-02 20:11:49', '2022-07-20 16:44:03');
INSERT INTO `sys_menu` VALUES (84, 64, '二维码', '/extension/qr-code', '/extension/qr-code', 0, 20, NULL, 'el-icon-_qrcode', 0, NULL, 0, 1, '2021-10-05 11:29:56', '2022-07-20 16:44:04');
INSERT INTO `sys_menu` VALUES (85, 64, '条形码', '/extension/bar-code', '/extension/bar-code', 0, 21, NULL, 'el-icon-_barcode', 0, NULL, 0, 1, '2021-10-05 11:29:56', '2022-07-20 16:49:58');
INSERT INTO `sys_menu` VALUES (86, 64, '富文本框', '/extension/editor', '/extension/editor', 0, 22, NULL, 'el-icon-_font-family', 0, NULL, 0, 1, '2021-02-02 20:13:57', '2022-07-20 16:44:07');
INSERT INTO `sys_menu` VALUES (87, 64, 'markdown', '/extension/markdown', '/extension/markdown', 0, 23, NULL, 'el-icon-_feedback', 0, NULL, 0, 1, '2022-03-11 21:58:13', '2022-07-20 16:44:40');
INSERT INTO `sys_menu` VALUES (88, 64, '仪表盘', '/extension/dashboard', '/extension/dashboard', 0, 24, NULL, 'el-icon-_menu', 0, NULL, 0, 1, '2022-03-11 21:58:13', '2023-04-21 22:35:55');
INSERT INTO `sys_menu` VALUES (89, 64, '引导组件', '/extension/tour', '/extension/tour', 0, 25, NULL, 'el-icon-_menu', 0, NULL, 0, 1, '2022-03-11 21:58:13', '2023-04-21 22:35:56');
INSERT INTO `sys_menu` VALUES (90, 0, '常用实例', '/example', NULL, 0, 8, NULL, 'el-icon-_integral', 0, NULL, 0, 1, '2021-02-02 20:15:01', '2021-11-05 16:52:47');
INSERT INTO `sys_menu` VALUES (91, 90, '表格实例', '/example/table', '/example/table', 0, 1, NULL, 'el-icon-_table', 0, NULL, 0, 1, '2021-10-06 22:26:55', '2022-03-11 21:53:34');
INSERT INTO `sys_menu` VALUES (92, 90, '菜单徽章', '/example/menu-badge', '/example/menu-badge', 0, 2, NULL, 'el-icon-_menu', 0, NULL, 0, 1, '2022-03-11 21:57:35', '2023-04-21 22:32:42');
INSERT INTO `sys_menu` VALUES (93, 90, '内嵌页面', '/example/pqadmin', 'https://www.baidu.com', 0, 3, NULL, 'el-icon-connection', 0, NULL, 0, 1, '2021-05-21 11:11:57', '2022-07-20 16:45:55');
INSERT INTO `sys_menu` VALUES (94, 90, '内嵌文档', '/example/pqadmin-doc', 'https://zcn16diyhiu4.feishu.cn/wiki/UPDcw6LyviB7brk4ClKcfKNNnz6', 0, 4, NULL, 'el-icon-connection', 0, NULL, 0, 1, '2021-05-21 11:11:57', '2022-07-20 16:45:56');
INSERT INTO `sys_menu` VALUES (95, 90, '批量选择', '/example/choose', '/example/choose', 0, 5, NULL, 'el-icon-finished', 0, NULL, 0, 1, '2021-02-02 20:15:11', '2022-07-20 16:45:57');
INSERT INTO `sys_menu` VALUES (96, 90, '案卷调整', '/example/document', '/example/document', 0, 6, NULL, 'el-icon-files', 0, NULL, 0, 1, '2021-02-02 20:15:03', '2022-07-20 16:45:59');
INSERT INTO `sys_menu` VALUES (97, 64, '水印组件', '/extension/watermark', '/extension/watermark', 0, 26, NULL, 'el-icon-_menu', 0, NULL, 0, 1, '2021-02-02 20:15:03', '2023-04-21 22:35:58');
INSERT INTO `sys_menu` VALUES (98, 64, '分割面板', '/extension/split', '/extension/split', 0, 27, NULL, 'el-icon-_menu', 0, NULL, 0, 1, '2021-02-02 20:15:03', '2023-04-21 22:35:59');
INSERT INTO `sys_menu` VALUES (101, 0, '系统管理', '/system', NULL, 0, 1, NULL, 'setting-outlined', 0, '{\"badge\": \"New\", \"badgeColor\": \"#faad14\"}', 0, 2, '2020-02-26 12:51:23', '2022-03-11 16:47:36');
INSERT INTO `sys_menu` VALUES (102, 101, '用户管理', '/system/user', '/system/user', 0, 1, NULL, 'team-outlined', 0, NULL, 0, 2, '2020-02-26 12:51:55', '2021-11-05 17:32:50');
INSERT INTO `sys_menu` VALUES (103, 102, '查询用户', NULL, NULL, 1, 1, 'sys:user:list', NULL, 0, NULL, 0, 2, '2020-02-26 12:52:06', '2020-09-16 11:05:35');
INSERT INTO `sys_menu` VALUES (104, 102, '添加用户', NULL, NULL, 1, 2, 'sys:user:save', NULL, 0, NULL, 0, 2, '2020-02-26 12:52:26', '2020-03-21 18:45:29');
INSERT INTO `sys_menu` VALUES (105, 102, '修改用户', NULL, NULL, 1, 3, 'sys:user:update', NULL, 0, NULL, 0, 2, '2020-02-26 12:52:50', '2020-03-21 18:45:30');
INSERT INTO `sys_menu` VALUES (106, 102, '删除用户', NULL, NULL, 1, 4, 'sys:user:remove', NULL, 0, NULL, 0, 2, '2020-02-26 12:53:13', '2020-03-21 18:45:32');
INSERT INTO `sys_menu` VALUES (107, 101, '角色管理', '/system/role', '/system/role', 0, 2, NULL, 'idcard-outlined', 0, NULL, 0, 2, '2020-03-13 13:29:08', '2021-11-05 17:32:55');
INSERT INTO `sys_menu` VALUES (108, 107, '查询角色', NULL, NULL, 1, 1, 'sys:role:list', NULL, 0, NULL, 0, 2, '2020-03-13 13:30:41', '2020-03-21 18:45:34');
INSERT INTO `sys_menu` VALUES (109, 107, '添加角色', NULL, NULL, 1, 2, 'sys:role:save', NULL, 0, NULL, 0, 2, '2020-03-15 13:02:07', '2020-03-21 18:45:35');
INSERT INTO `sys_menu` VALUES (110, 107, '修改角色', NULL, NULL, 1, 3, 'sys:role:update', NULL, 0, NULL, 0, 2, '2020-03-15 13:02:49', '2020-03-21 18:45:36');
INSERT INTO `sys_menu` VALUES (111, 107, '删除角色', NULL, NULL, 1, 4, 'sys:role:remove', NULL, 0, NULL, 0, 2, '2020-03-20 17:58:51', '2020-03-21 18:45:38');
INSERT INTO `sys_menu` VALUES (112, 101, '菜单管理', '/system/menu', '/system/menu', 0, 3, NULL, 'appstore-outlined', 0, NULL, 0, 2, '2020-03-21 01:07:13', '2022-03-11 15:37:11');
INSERT INTO `sys_menu` VALUES (113, 112, '查询菜单', NULL, NULL, 1, 1, 'sys:menu:list', NULL, 0, NULL, 0, 2, '2020-03-21 16:43:30', '2020-03-21 18:45:40');
INSERT INTO `sys_menu` VALUES (114, 112, '添加菜单', NULL, NULL, 1, 2, 'sys:menu:save', NULL, 0, NULL, 0, 2, '2020-03-21 16:43:54', '2020-03-21 18:45:41');
INSERT INTO `sys_menu` VALUES (115, 112, '修改菜单', NULL, NULL, 1, 3, 'sys:menu:update', NULL, 0, NULL, 0, 2, '2020-03-21 18:24:17', '2020-03-21 18:45:43');
INSERT INTO `sys_menu` VALUES (116, 112, '删除菜单', NULL, NULL, 1, 4, 'sys:menu:remove', NULL, 0, NULL, 0, 2, '2020-03-21 18:24:18', '2020-03-21 18:45:44');
INSERT INTO `sys_menu` VALUES (117, 101, '机构管理', '/system/organization', '/system/organization', 0, 5, NULL, 'bank-outlined', 0, NULL, 0, 2, '2020-03-21 18:24:20', '2022-03-11 17:08:48');
INSERT INTO `sys_menu` VALUES (118, 117, '查询机构', NULL, NULL, 1, 1, 'sys:org:list', NULL, 0, NULL, 0, 2, '2020-03-21 18:24:21', '2020-03-21 18:44:36');
INSERT INTO `sys_menu` VALUES (119, 117, '添加机构', NULL, NULL, 1, 2, 'sys:org:save', NULL, 0, NULL, 0, 2, '2020-03-21 18:24:22', '2020-03-21 18:45:51');
INSERT INTO `sys_menu` VALUES (120, 117, '修改机构', NULL, NULL, 1, 3, 'sys:org:update', NULL, 0, NULL, 0, 2, '2020-03-21 18:24:24', '2020-03-21 18:45:52');
INSERT INTO `sys_menu` VALUES (121, 117, '删除机构', NULL, NULL, 1, 4, 'sys:org:remove', NULL, 0, NULL, 0, 2, '2020-03-21 18:24:25', '2020-03-21 18:45:54');
INSERT INTO `sys_menu` VALUES (122, 101, '字典管理', '/system/dictionary', '/system/dictionary', 0, 4, NULL, 'profile-outlined', 0, NULL, 0, 2, '2020-03-21 18:24:26', '2022-03-11 17:08:47');
INSERT INTO `sys_menu` VALUES (123, 122, '查询字典', NULL, NULL, 1, 1, 'sys:dict:list', NULL, 0, NULL, 0, 2, '2020-03-21 18:24:27', '2020-03-21 18:44:42');
INSERT INTO `sys_menu` VALUES (124, 122, '添加字典', NULL, NULL, 1, 2, 'sys:dict:save', NULL, 0, NULL, 0, 2, '2020-03-21 18:24:28', '2020-03-21 18:45:59');
INSERT INTO `sys_menu` VALUES (125, 122, '修改字典', NULL, NULL, 1, 3, 'sys:dict:update', NULL, 0, NULL, 0, 2, '2020-03-21 18:24:29', '2020-03-21 18:46:01');
INSERT INTO `sys_menu` VALUES (126, 122, '删除字典', NULL, NULL, 1, 4, 'sys:dict:remove', NULL, 0, NULL, 0, 2, '2020-03-21 18:24:31', '2020-03-21 18:46:02');
INSERT INTO `sys_menu` VALUES (127, 101, '登录日志', '/system/login-record', '/system/login-record', 0, 7, 'sys:login-record:list', 'calendar-outlined', 0, NULL, 0, 2, '2020-03-21 18:24:33', '2022-07-20 17:23:18');
INSERT INTO `sys_menu` VALUES (128, 101, '操作日志', '/system/operation-record', '/system/operation-record', 0, 8, 'sys:operation-record:list', 'file-search-outlined', 0, NULL, 0, 2, '2020-03-21 18:24:34', '2022-07-20 17:23:22');
INSERT INTO `sys_menu` VALUES (129, 101, '文件管理', '/system/file', '/system/file', 0, 6, NULL, 'folder-outlined', 0, NULL, 0, 2, '2020-09-17 23:19:43', '2022-07-20 22:27:22');
INSERT INTO `sys_menu` VALUES (130, 129, '上传文件', NULL, NULL, 1, 1, 'sys:file:upload', NULL, 0, NULL, 0, 2, '2020-09-17 23:21:04', '2022-07-20 17:27:58');
INSERT INTO `sys_menu` VALUES (131, 129, '删除文件', NULL, NULL, 1, 2, 'sys:file:remove', NULL, 0, NULL, 0, 2, '2020-09-17 23:21:53', '2022-07-20 17:27:59');
INSERT INTO `sys_menu` VALUES (132, 129, '查看记录', NULL, NULL, 1, 3, 'sys:file:list', NULL, 0, NULL, 0, 2, '2020-09-17 23:20:29', '2022-07-20 17:28:00');
INSERT INTO `sys_menu` VALUES (133, 102, '用户详情', '/system/user/details', '/system/user/details', 0, 5, NULL, 'team-outlined', 1, '{\"active\": \"/system/user\"}', 0, 2, '2021-05-21 11:07:54', '2022-07-20 23:05:19');
INSERT INTO `sys_menu` VALUES (134, 101, '修改个人密码', NULL, NULL, 1, 10, 'sys:auth:password', NULL, 0, NULL, 0, 2, '2020-09-17 23:22:45', '2023-04-19 08:40:56');
INSERT INTO `sys_menu` VALUES (135, 101, '修改个人资料', NULL, NULL, 1, 11, 'sys:auth:user', NULL, 0, NULL, 0, 2, '2020-09-17 23:23:24', '2023-04-19 08:40:57');
INSERT INTO `sys_menu` VALUES (136, 0, 'Dashboard', '/dashboard', NULL, 0, 0, NULL, 'home-outlined', 0, NULL, 0, 2, '2021-02-02 20:00:34', '2021-11-05 17:33:42');
INSERT INTO `sys_menu` VALUES (137, 136, '工作台', '/dashboard/workplace', '/dashboard/workplace', 0, 1, NULL, 'desktop-outlined', 0, NULL, 0, 2, '2021-02-02 20:00:37', '2021-11-05 17:34:32');
INSERT INTO `sys_menu` VALUES (138, 136, '分析页', '/dashboard/analysis', '/dashboard/analysis', 0, 2, NULL, 'bar-chart-outlined', 0, '{\"badge\": 1}', 0, 2, '2021-02-02 20:00:40', '2022-03-11 16:47:54');
INSERT INTO `sys_menu` VALUES (139, 136, '监控页', '/dashboard/monitor', '/dashboard/monitor', 0, 3, NULL, 'dashboard-outlined', 0, NULL, 0, 2, '2021-02-02 20:03:12', '2021-11-05 17:34:41');
INSERT INTO `sys_menu` VALUES (140, 0, '表单页面', '/form', NULL, 0, 2, NULL, 'file-text-outlined', 0, NULL, 0, 2, '2021-02-02 20:03:28', '2021-11-05 17:34:53');
INSERT INTO `sys_menu` VALUES (141, 140, '基础表单', '/form/basic', '/form/basic', 0, 1, NULL, 'file-text-outlined', 0, NULL, 0, 2, '2021-02-02 20:03:51', '2022-03-11 15:40:07');
INSERT INTO `sys_menu` VALUES (142, 140, '复杂表单', '/form/advanced', '/form/advanced', 0, 2, NULL, 'audit-outlined', 0, NULL, 0, 2, '2021-02-02 20:03:56', '2021-11-05 17:35:07');
INSERT INTO `sys_menu` VALUES (143, 140, '分步表单', '/form/step', '/form/step', 0, 3, NULL, 'one-to-one-outlined', 0, NULL, 0, 2, '2021-02-02 20:04:06', '2021-11-05 17:35:17');
INSERT INTO `sys_menu` VALUES (144, 0, '列表页面', '/list', NULL, 0, 3, NULL, 'table-outlined', 0, NULL, 0, 2, '2021-02-02 20:05:07', '2021-11-05 17:35:24');
INSERT INTO `sys_menu` VALUES (145, 144, '基础列表', '/list/basic', '/list/basic', 0, 1, NULL, 'table-outlined', 0, NULL, 0, 2, '2021-02-02 20:05:10', '2022-03-11 15:40:17');
INSERT INTO `sys_menu` VALUES (146, 144, '复杂列表', '/list/advanced', '/list/advanced', 0, 2, NULL, 'profile-outlined', 0, NULL, 0, 2, '2021-02-02 20:05:26', '2022-03-11 21:21:33');
INSERT INTO `sys_menu` VALUES (147, 144, '卡片列表', '/list/card', '/list/card', 0, 3, NULL, 'appstore-outlined', 0, NULL, 0, 2, '2021-02-02 20:05:30', '2021-11-05 17:35:45');
INSERT INTO `sys_menu` VALUES (148, 147, '项目列表', '/list/card/project', '/list/card/project', 0, 1, NULL, 'appstore-outlined', 0, NULL, 0, 2, '2021-02-02 20:06:35', '2021-11-05 17:35:53');
INSERT INTO `sys_menu` VALUES (149, 147, '应用列表', '/list/card/application', '/list/card/application', 0, 2, NULL, 'appstore-outlined', 0, NULL, 0, 2, '2021-02-02 20:06:39', '2021-11-05 17:35:54');
INSERT INTO `sys_menu` VALUES (150, 147, '文章列表', '/list/card/article', '/list/card/article', 0, 3, NULL, 'appstore-outlined', 0, NULL, 0, 2, '2021-02-02 20:06:48', '2021-11-05 17:35:56');
INSERT INTO `sys_menu` VALUES (151, 145, '添加用户', '/list/basic/add', '/list/basic/add', 0, 4, NULL, 'team-outlined', 1, '{\"active\": \"/list/basic\"}', 0, 2, '2021-02-02 20:05:26', '2022-03-11 17:03:11');
INSERT INTO `sys_menu` VALUES (152, 145, '修改用户', '/list/basic/edit', '/list/basic/edit', 0, 4, NULL, 'team-outlined', 1, '{\"active\": \"/list/basic\"}', 0, 2, '2021-02-02 20:05:26', '2022-03-11 17:03:11');
INSERT INTO `sys_menu` VALUES (153, 145, '用户详情', '/list/basic/details/:id', '/list/basic/details', 0, 4, NULL, 'team-outlined', 1, '{\"active\": \"/list/basic\"}', 0, 2, '2021-02-02 20:05:26', '2022-03-11 17:03:11');
INSERT INTO `sys_menu` VALUES (154, 0, '结果页面', '/result', NULL, 0, 4, NULL, 'check-circle-outlined', 0, NULL, 0, 2, '2021-02-02 20:07:33', '2021-11-05 17:36:06');
INSERT INTO `sys_menu` VALUES (155, 154, '成功页', '/result/success', '/result/success', 0, 1, NULL, 'check-circle-outlined', 0, NULL, 0, 2, '2021-02-02 20:07:40', '2021-11-05 17:36:12');
INSERT INTO `sys_menu` VALUES (156, 154, '失败页', '/result/fail', '/result/fail', 0, 2, NULL, 'close-circle-outlined', 0, NULL, 0, 2, '2021-02-02 20:07:41', '2021-11-05 17:36:20');
INSERT INTO `sys_menu` VALUES (157, 0, '异常页面', '/exception', NULL, 0, 5, NULL, 'warning-outlined', 0, NULL, 0, 2, '2021-02-02 20:08:44', '2021-11-05 17:36:36');
INSERT INTO `sys_menu` VALUES (158, 157, '403', '/exception/403', '/exception/403', 0, 1, NULL, 'exclamation-circle-outlined', 0, NULL, 0, 2, '2021-02-02 20:08:47', '2021-11-05 17:36:43');
INSERT INTO `sys_menu` VALUES (159, 157, '404', '/exception/404', '/exception/404', 0, 2, NULL, 'question-circle-outlined', 0, NULL, 0, 2, '2021-02-02 20:08:49', '2021-11-05 17:36:52');
INSERT INTO `sys_menu` VALUES (160, 157, '500', '/exception/500', '/exception/500', 0, 3, NULL, 'close-circle-outlined', 0, NULL, 0, 2, '2021-02-02 20:08:52', '2021-11-05 17:36:59');
INSERT INTO `sys_menu` VALUES (161, 0, '个人中心', '/user', NULL, 0, 6, NULL, 'control-outlined', 0, NULL, 0, 2, '2021-02-02 20:09:54', '2021-11-05 17:37:11');
INSERT INTO `sys_menu` VALUES (162, 161, '我的资料', '/user/profile', '/user/profile', 0, 1, NULL, 'user-outlined', 0, NULL, 0, 2, '2021-02-02 20:09:58', '2021-11-05 17:37:17');
INSERT INTO `sys_menu` VALUES (163, 161, '我的消息', '/user/message', '/user/message', 0, 2, NULL, 'sound-outlined', 0, NULL, 0, 2, '2021-02-02 20:10:03', '2021-11-05 17:37:19');
INSERT INTO `sys_menu` VALUES (164, 0, '扩展组件', '/extension', NULL, 0, 7, NULL, 'appstore-add-outlined', 0, NULL, 0, 2, '2021-02-02 20:10:52', '2021-11-05 17:37:51');
INSERT INTO `sys_menu` VALUES (165, 164, '标签组件', '/extension/tag', '/extension/tag', 0, 1, NULL, 'tag-outlined', 0, NULL, 0, 2, '2021-10-05 11:13:35', '2022-03-11 21:32:21');
INSERT INTO `sys_menu` VALUES (166, 164, '弹窗扩展', '/extension/dialog', '/extension/dialog', 0, 2, NULL, 'block-outlined', 0, NULL, 0, 2, '2021-10-05 11:32:12', '2022-03-11 21:32:08');
INSERT INTO `sys_menu` VALUES (167, 164, '文件列表', '/extension/file', '/extension/file', 0, 3, NULL, 'folder-outlined', 0, NULL, 0, 2, '2021-02-02 20:10:58', '2022-03-11 20:57:04');
INSERT INTO `sys_menu` VALUES (168, 164, '图片上传', '/extension/upload', '/extension/upload', 0, 4, NULL, 'picture-outlined', 0, NULL, 0, 2, '2021-02-02 20:10:58', '2022-07-20 17:34:08');
INSERT INTO `sys_menu` VALUES (169, 164, '拖拽排序', '/extension/dragsort', '/extension/dragsort', 0, 5, NULL, 'drag-outlined', 0, NULL, 0, 2, '2021-02-02 20:11:48', '2022-07-20 17:27:15');
INSERT INTO `sys_menu` VALUES (170, 164, '颜色选择', '/extension/color-picker', '/extension/color-picker', 0, 6, NULL, 'bg-colors-outlined', 0, NULL, 0, 2, '2021-10-05 11:16:39', '2022-07-20 17:27:16');
INSERT INTO `sys_menu` VALUES (171, 164, '城市选择', '/extension/regions', '/extension/regions', 0, 7, NULL, 'apartment-outlined', 0, NULL, 0, 2, '2021-10-05 11:25:15', '2022-07-20 17:27:17');
INSERT INTO `sys_menu` VALUES (172, 164, '打印插件', '/extension/printer', '/extension/printer', 0, 8, NULL, 'printer-outlined', 0, NULL, 0, 2, '2021-02-02 20:11:00', '2022-07-20 17:27:18');
INSERT INTO `sys_menu` VALUES (173, 164, 'excel插件', '/extension/excel', '/extension/excel', 0, 9, NULL, 'table-outlined', 0, NULL, 0, 2, '2021-02-02 20:11:03', '2022-07-20 17:27:19');
INSERT INTO `sys_menu` VALUES (174, 164, '滚动数字', '/extension/count-up', '/extension/count-up', 0, 10, NULL, 'ellipsis-outlined', 0, NULL, 0, 2, '2021-10-05 11:29:03', '2022-07-20 17:27:20');
INSERT INTO `sys_menu` VALUES (175, 164, '无限滚动', '/extension/infinite-scroll', '/extension/infinite-scroll', 0, 11, NULL, NULL, 0, NULL, 1, 2, '2021-10-10 16:21:45', '2022-07-20 17:27:21');
INSERT INTO `sys_menu` VALUES (176, 164, '表格下拉', '/extension/table-select', '/extension/table-select', 0, 12, NULL, 'table-outlined', 0, NULL, 0, 2, '2021-10-10 16:21:45', '2022-07-20 17:27:22');
INSERT INTO `sys_menu` VALUES (177, 164, '分割布局', '/extension/split-layout', '/extension/split-layout', 0, 13, NULL, NULL, 0, NULL, 1, 2, '2021-10-10 16:21:45', '2022-07-20 17:27:23');
INSERT INTO `sys_menu` VALUES (178, 164, '视频播放', '/extension/player', '/extension/player', 0, 14, NULL, 'youtube-outlined', 0, NULL, 0, 2, '2021-02-02 20:13:49', '2022-07-20 17:27:24');
INSERT INTO `sys_menu` VALUES (179, 164, '地图组件', '/extension/map', '/extension/map', 0, 15, NULL, 'environment-outlined', 0, NULL, 0, 2, '2021-02-02 20:11:49', '2022-07-20 17:27:28');
INSERT INTO `sys_menu` VALUES (180, 164, '二维码', '/extension/qr-code', '/extension/qr-code', 0, 16, NULL, 'qrcode-outlined', 0, NULL, 0, 2, '2021-10-05 11:29:56', '2022-07-20 17:27:29');
INSERT INTO `sys_menu` VALUES (181, 164, '条形码', '/extension/bar-code', '/extension/bar-code', 0, 17, NULL, 'barcode-outlined', 0, NULL, 0, 2, '2021-10-05 11:29:56', '2022-07-20 17:34:50');
INSERT INTO `sys_menu` VALUES (182, 164, '富文本框', '/extension/editor', '/extension/editor', 0, 18, NULL, 'font-size-outlined', 0, NULL, 0, 2, '2021-02-02 20:13:57', '2022-07-20 17:27:31');
INSERT INTO `sys_menu` VALUES (183, 164, 'markdown', '/extension/markdown', '/extension/markdown', 0, 19, NULL, 'picLeft-outlined', 0, NULL, 0, 2, '2021-10-10 16:21:45', '2022-07-20 17:27:32');
INSERT INTO `sys_menu` VALUES (184, 164, '仪表盘', '/extension/dashboard', '/extension/dashboard', 0, 20, NULL, 'appstore-outlined', 0, NULL, 0, 2, '2021-10-05 11:14:28', '2023-04-17 18:00:25');
INSERT INTO `sys_menu` VALUES (185, 164, '引导组件', '/extension/tour', '/extension/tour', 0, 21, NULL, 'appstore-outlined', 0, NULL, 0, 2, '2021-10-05 11:18:35', '2023-04-17 18:00:26');
INSERT INTO `sys_menu` VALUES (186, 164, '水印组件', '/extension/watermark', '/extension/watermark', 0, 22, NULL, 'appstore-outlined', 0, NULL, 0, 2, '2021-02-02 20:10:55', '2023-04-17 18:00:27');
INSERT INTO `sys_menu` VALUES (187, 164, '分割面板', '/extension/split', '/extension/split', 0, 23, NULL, 'appstore-outlined', 0, NULL, 0, 2, '2021-02-02 20:10:55', '2023-04-17 18:00:37');
INSERT INTO `sys_menu` VALUES (188, 0, '常用实例', '/example', NULL, 0, 8, NULL, 'compass-outlined', 0, NULL, 0, 2, '2021-02-02 20:15:01', '2021-11-05 17:39:02');
INSERT INTO `sys_menu` VALUES (189, 188, '表格实例', '/example/table', '/example/table', 0, 1, NULL, 'table-outlined', 0, NULL, 0, 2, '2021-10-06 22:26:55', '2022-03-11 21:32:10');
INSERT INTO `sys_menu` VALUES (190, 188, '菜单徽章', '/example/menu-badge', '/example/menu-badge', 0, 5, NULL, 'appstore-outlined', 0, NULL, 0, 2, '2021-02-02 20:05:26', '2022-07-20 21:36:51');
INSERT INTO `sys_menu` VALUES (191, 188, '内嵌页面', '/example/pqadmin', 'https://www.baidu.com', 0, 2, NULL, 'link-outlined', 0, NULL, 0, 2, '2021-05-21 11:11:57', '2022-07-20 21:36:45');
INSERT INTO `sys_menu` VALUES (192, 188, '内嵌文档', '/example/pqadmin-doc', 'https://zcn16diyhiu4.feishu.cn/wiki/UPDcw6LyviB7brk4ClKcfKNNnz6?from=from_copylink', 0, 3, NULL, 'link-outlined', 0, NULL, 0, 2, '2021-05-21 11:11:57', '2023-05-11 10:51:05');
INSERT INTO `sys_menu` VALUES (193, 188, '批量选择', '/example/choose', '/example/choose', 0, 4, NULL, 'check-square-outlined', 0, NULL, 0, 2, '2021-02-02 20:15:11', '2022-07-20 21:36:40');
INSERT INTO `sys_menu` VALUES (194, 188, '案卷调整', '/example/document', '/example/document', 0, 6, NULL, 'interaction-outlined', 0, NULL, 0, 2, '2021-02-02 20:15:03', '2022-07-20 17:26:57');
INSERT INTO `sys_menu` VALUES (195, 188, '预留1', NULL, NULL, 0, 7, NULL, NULL, 0, NULL, 1, 2, '2021-10-05 11:20:35', '2022-07-20 17:26:59');
INSERT INTO `sys_menu` VALUES (196, 188, '预留2', NULL, NULL, 0, 8, NULL, NULL, 0, NULL, 1, 2, '2021-10-10 16:21:12', '2022-07-20 17:27:01');
INSERT INTO `sys_menu` VALUES (197, 188, '预留3', NULL, NULL, 0, 9, NULL, NULL, 0, NULL, 1, 2, '2021-10-10 16:21:12', '2022-07-20 17:27:02');
INSERT INTO `sys_menu` VALUES (198, 188, '预留4', NULL, NULL, 0, 10, NULL, NULL, 0, NULL, 1, 2, '2021-10-10 16:21:12', '2022-07-20 17:27:03');
INSERT INTO `sys_menu` VALUES (201, 0, '系统管理', 'javascript:;', NULL, 0, 1, NULL, 'layui-icon layui-icon-set', 0, NULL, 0, 3, '2020-02-26 12:51:23', '2022-03-11 13:11:06');
INSERT INTO `sys_menu` VALUES (202, 201, '用户管理', '#/system/user', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2020-02-26 12:51:55', '2022-03-11 13:12:19');
INSERT INTO `sys_menu` VALUES (203, 202, '查询用户', NULL, NULL, 1, 1, 'sys:user:list', NULL, 0, NULL, 0, 3, '2020-02-26 12:52:06', '2022-03-11 13:12:24');
INSERT INTO `sys_menu` VALUES (204, 202, '添加用户', NULL, NULL, 1, 2, 'sys:user:save', NULL, 0, NULL, 0, 3, '2020-02-26 12:52:26', '2022-03-11 13:12:25');
INSERT INTO `sys_menu` VALUES (205, 202, '修改用户', NULL, NULL, 1, 3, 'sys:user:update', NULL, 0, NULL, 0, 3, '2020-02-26 12:52:50', '2022-03-11 13:12:26');
INSERT INTO `sys_menu` VALUES (206, 202, '删除用户', NULL, NULL, 1, 4, 'sys:user:remove', NULL, 0, NULL, 0, 3, '2020-02-26 12:53:13', '2022-03-11 13:12:26');
INSERT INTO `sys_menu` VALUES (207, 201, '角色管理', '#/system/role', NULL, 0, 2, NULL, NULL, 0, NULL, 0, 3, '2020-03-13 13:29:08', '2022-03-11 13:13:39');
INSERT INTO `sys_menu` VALUES (208, 207, '查询角色', NULL, NULL, 1, 1, 'sys:role:list', NULL, 0, NULL, 0, 3, '2020-03-13 13:30:41', '2022-03-11 13:12:53');
INSERT INTO `sys_menu` VALUES (209, 207, '添加角色', NULL, NULL, 1, 2, 'sys:role:save', NULL, 0, NULL, 0, 3, '2020-03-15 13:02:07', '2022-03-11 13:12:54');
INSERT INTO `sys_menu` VALUES (210, 207, '修改角色', NULL, NULL, 1, 3, 'sys:role:update', NULL, 0, NULL, 0, 3, '2020-03-15 13:02:49', '2022-03-11 13:12:55');
INSERT INTO `sys_menu` VALUES (211, 207, '删除角色', NULL, NULL, 1, 4, 'sys:role:remove', NULL, 0, NULL, 0, 3, '2020-03-20 17:58:51', '2022-03-11 13:12:55');
INSERT INTO `sys_menu` VALUES (212, 201, '菜单管理', '#/system/authorities', NULL, 0, 3, NULL, NULL, 0, NULL, 0, 3, '2020-03-21 01:07:13', '2022-03-11 13:13:40');
INSERT INTO `sys_menu` VALUES (213, 212, '查询菜单', NULL, NULL, 1, 1, 'sys:menu:list', NULL, 0, NULL, 0, 3, '2020-03-21 16:43:30', '2022-03-11 13:12:57');
INSERT INTO `sys_menu` VALUES (214, 212, '添加菜单', NULL, NULL, 1, 2, 'sys:menu:save', NULL, 0, NULL, 0, 3, '2020-03-21 16:43:54', '2022-03-11 13:12:58');
INSERT INTO `sys_menu` VALUES (215, 212, '修改菜单', NULL, NULL, 1, 3, 'sys:menu:update', NULL, 0, NULL, 0, 3, '2020-03-21 18:24:17', '2022-03-11 13:12:58');
INSERT INTO `sys_menu` VALUES (216, 212, '删除菜单', NULL, NULL, 1, 4, 'sys:menu:remove', NULL, 0, NULL, 0, 3, '2020-03-21 18:24:18', '2022-03-11 13:12:59');
INSERT INTO `sys_menu` VALUES (217, 201, '机构管理', '#/system/organization', NULL, 0, 4, NULL, NULL, 0, NULL, 0, 3, '2020-03-21 18:24:20', '2022-03-11 13:13:42');
INSERT INTO `sys_menu` VALUES (218, 217, '查询机构', NULL, NULL, 1, 1, 'sys:org:list', NULL, 0, NULL, 0, 3, '2020-03-21 18:24:21', '2022-03-11 13:13:01');
INSERT INTO `sys_menu` VALUES (219, 217, '添加机构', NULL, NULL, 1, 2, 'sys:org:save', NULL, 0, NULL, 0, 3, '2020-03-21 18:24:22', '2022-03-11 13:13:02');
INSERT INTO `sys_menu` VALUES (220, 217, '修改机构', NULL, NULL, 1, 3, 'sys:org:update', NULL, 0, NULL, 0, 3, '2020-03-21 18:24:24', '2022-03-11 13:13:02');
INSERT INTO `sys_menu` VALUES (221, 217, '删除机构', NULL, NULL, 1, 4, 'sys:org:remove', NULL, 0, NULL, 0, 3, '2020-03-21 18:24:25', '2022-03-11 13:13:03');
INSERT INTO `sys_menu` VALUES (222, 201, '字典管理', '#/system/dictionary', NULL, 0, 5, NULL, NULL, 0, NULL, 0, 3, '2020-03-21 18:24:26', '2022-03-11 13:13:43');
INSERT INTO `sys_menu` VALUES (223, 222, '查询字典', NULL, NULL, 1, 1, 'sys:dict:list', NULL, 0, NULL, 0, 3, '2020-03-21 18:24:27', '2022-03-11 13:13:05');
INSERT INTO `sys_menu` VALUES (224, 222, '添加字典', NULL, NULL, 1, 2, 'sys:dict:save', NULL, 0, NULL, 0, 3, '2020-03-21 18:24:28', '2022-03-11 13:13:05');
INSERT INTO `sys_menu` VALUES (225, 222, '修改字典', NULL, NULL, 1, 3, 'sys:dict:update', NULL, 0, NULL, 0, 3, '2020-03-21 18:24:29', '2022-03-11 13:13:06');
INSERT INTO `sys_menu` VALUES (226, 222, '删除字典', NULL, NULL, 1, 4, 'sys:dict:remove', NULL, 0, NULL, 0, 3, '2020-03-21 18:24:31', '2022-03-11 13:13:07');
INSERT INTO `sys_menu` VALUES (227, 201, '登录日志', '#/system/login-record', NULL, 0, 7, 'sys:login-record:list', NULL, 0, NULL, 0, 3, '2020-03-21 18:24:33', '2022-07-29 14:35:58');
INSERT INTO `sys_menu` VALUES (228, 201, '操作日志', '#/system/oper-record', NULL, 0, 8, 'sys:operation-record:list', NULL, 0, NULL, 0, 3, '2020-03-21 18:24:34', '2022-07-29 14:36:00');
INSERT INTO `sys_menu` VALUES (229, 201, '上传文件', NULL, NULL, 1, 9, 'sys:file:upload', NULL, 0, NULL, 0, 3, '2020-09-17 23:21:04', '2022-07-20 22:14:23');
INSERT INTO `sys_menu` VALUES (230, 201, '修改个人密码', NULL, NULL, 1, 10, 'sys:auth:password', NULL, 0, NULL, 0, 3, '2020-09-17 23:22:45', '2022-03-11 13:12:40');
INSERT INTO `sys_menu` VALUES (231, 201, '修改个人资料', NULL, NULL, 1, 11, 'sys:auth:user', NULL, 0, NULL, 0, 3, '2020-09-17 23:23:24', '2022-03-11 13:12:41');
INSERT INTO `sys_menu` VALUES (232, 0, 'Dashboard', 'javascript:;', NULL, 0, 0, NULL, 'layui-icon layui-icon-home', 0, NULL, 0, 3, '2021-02-02 20:00:34', '2022-03-11 13:11:23');
INSERT INTO `sys_menu` VALUES (233, 232, '工作台', '#/console/workplace', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:00:37', '2022-03-11 13:16:13');
INSERT INTO `sys_menu` VALUES (234, 232, '控制台', '#/console/console', NULL, 0, 2, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:00:40', '2022-03-11 13:16:14');
INSERT INTO `sys_menu` VALUES (235, 232, '分析页', '#/console/dashboard', NULL, 0, 3, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:03:12', '2022-03-11 13:16:15');
INSERT INTO `sys_menu` VALUES (236, 0, '模板页面', 'javascript:;', NULL, 0, 2, NULL, 'layui-icon layui-icon-template', 0, NULL, 0, 3, '2021-02-02 20:03:12', '2022-03-11 13:19:11');
INSERT INTO `sys_menu` VALUES (237, 236, '表单页', 'javascript:;', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:03:28', '2022-03-11 13:19:17');
INSERT INTO `sys_menu` VALUES (238, 237, '基础表单', '#/template/form/form-basic', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:03:51', '2022-03-11 13:19:34');
INSERT INTO `sys_menu` VALUES (239, 237, '复杂表单', '#/template/form/form-advance', NULL, 0, 2, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:03:56', '2022-03-11 13:19:34');
INSERT INTO `sys_menu` VALUES (240, 237, '分步表单', '#/template/form/form-step', NULL, 0, 3, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:04:06', '2022-03-11 13:19:35');
INSERT INTO `sys_menu` VALUES (241, 236, '表格页', 'javascript:;', NULL, 0, 2, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:05:07', '2022-03-11 13:19:19');
INSERT INTO `sys_menu` VALUES (242, 241, '数据表格', '#/template/table/table-basic', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:05:10', '2022-03-11 13:19:37');
INSERT INTO `sys_menu` VALUES (243, 241, '复杂表格', '#/template/table/table-advance', NULL, 0, 2, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:05:26', '2022-03-11 13:19:38');
INSERT INTO `sys_menu` VALUES (244, 241, '图片表格', '#/template/table/table-img', NULL, 0, 3, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:05:30', '2022-03-11 13:19:38');
INSERT INTO `sys_menu` VALUES (245, 241, '卡片列表', '#/template/table/table-card', NULL, 0, 4, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:06:35', '2022-03-11 13:19:39');
INSERT INTO `sys_menu` VALUES (246, 236, '错误页', 'javascript:;', NULL, 0, 3, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:08:44', '2022-03-11 13:19:20');
INSERT INTO `sys_menu` VALUES (247, 246, '500', '#/template/error/error-500', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:08:47', '2022-03-11 13:19:41');
INSERT INTO `sys_menu` VALUES (248, 246, '404', '#/template/error/error-404', NULL, 0, 2, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:08:49', '2022-03-11 13:19:42');
INSERT INTO `sys_menu` VALUES (249, 246, '403', '#/template/error/error-403', NULL, 0, 3, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:08:52', '2022-03-11 13:19:42');
INSERT INTO `sys_menu` VALUES (250, 236, '登录页', 'javascript:;', NULL, 0, 4, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:09:54', '2022-03-11 13:19:25');
INSERT INTO `sys_menu` VALUES (251, 250, '登录页', 'login.html', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:09:58', '2022-03-11 13:26:56');
INSERT INTO `sys_menu` VALUES (252, 250, '注册页', 'components/template/login/reg.html', NULL, 0, 2, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:10:03', '2022-03-11 13:26:54');
INSERT INTO `sys_menu` VALUES (253, 250, '忘记密码', 'components/template/login/forget.html', NULL, 0, 3, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:06:39', '2022-03-11 13:26:52');
INSERT INTO `sys_menu` VALUES (254, 236, '个人中心', '#/template/user-info', NULL, 0, 5, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:06:48', '2022-03-11 13:19:27');
INSERT INTO `sys_menu` VALUES (255, 0, '扩展组件', 'javascript:;', NULL, 0, 3, NULL, 'layui-icon layui-icon-component', 0, NULL, 0, 3, '2021-02-02 20:10:52', '2022-03-11 13:20:43');
INSERT INTO `sys_menu` VALUES (256, 255, '常用组件', 'javascript:;', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:10:55', '2022-03-11 13:20:49');
INSERT INTO `sys_menu` VALUES (257, 256, '弹窗扩展', '#/plugin/basic/dialog', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:10:58', '2022-03-11 13:24:20');
INSERT INTO `sys_menu` VALUES (258, 256, '下拉菜单', '#/plugin/basic/dropdown', NULL, 0, 2, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:11:00', '2022-07-29 14:38:27');
INSERT INTO `sys_menu` VALUES (259, 256, '消息通知', '#/plugin/basic/notice', NULL, 0, 3, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:11:03', '2022-07-29 14:38:29');
INSERT INTO `sys_menu` VALUES (260, 256, '标签输入', '#/plugin/basic/tagsInput', NULL, 0, 4, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:11:48', '2022-07-29 14:38:30');
INSERT INTO `sys_menu` VALUES (261, 256, '级联选择', '#/plugin/basic/cascader', NULL, 0, 5, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:11:49', '2022-07-29 14:38:32');
INSERT INTO `sys_menu` VALUES (262, 256, '步骤条', '#/plugin/basic/steps', NULL, 0, 6, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:13:49', '2022-07-29 14:38:34');
INSERT INTO `sys_menu` VALUES (263, 255, '进阶组件', 'javascript:;', NULL, 0, 2, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:13:57', '2022-03-11 13:24:29');
INSERT INTO `sys_menu` VALUES (264, 263, '打印插件', '#/plugin/advance/printer', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-10-05 11:25:15', '2022-03-11 13:28:43');
INSERT INTO `sys_menu` VALUES (265, 263, '分割面板', '#/plugin/advance/split', NULL, 0, 2, NULL, NULL, 0, NULL, 0, 3, '2021-10-05 11:32:12', '2022-03-11 13:28:44');
INSERT INTO `sys_menu` VALUES (266, 263, '表单扩展', '#/plugin/advance/formX', NULL, 0, 3, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:15:01', '2022-03-11 13:24:33');
INSERT INTO `sys_menu` VALUES (267, 263, '表格扩展', '#/plugin/advance/tableX', NULL, 0, 4, NULL, NULL, 0, NULL, 0, 3, '2021-10-06 22:26:55', '2022-03-11 13:28:45');
INSERT INTO `sys_menu` VALUES (268, 263, '数据列表', '#/plugin/advance/dataGrid', NULL, 0, 5, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:15:03', '2022-03-11 13:24:36');
INSERT INTO `sys_menu` VALUES (269, 263, '鼠标右键', '#/plugin/advance/contextMenu', NULL, 0, 6, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:15:11', '2022-03-11 13:24:37');
INSERT INTO `sys_menu` VALUES (270, 255, '其他组件', 'javascript:;', NULL, 0, 3, NULL, NULL, 0, NULL, 0, 3, '2021-05-21 11:11:57', '2022-03-11 13:24:44');
INSERT INTO `sys_menu` VALUES (271, 270, '圆形进度条', '#/plugin/other/circleProgress', '', 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-02-02 20:15:18', '2022-03-11 13:24:45');
INSERT INTO `sys_menu` VALUES (272, 270, '富文本编辑', '#/plugin/other/editor', NULL, 0, 2, NULL, NULL, 0, NULL, 0, 3, '2021-10-05 11:14:28', '2022-03-11 13:28:47');
INSERT INTO `sys_menu` VALUES (273, 270, '鼠标滚轮', '#/plugin/other/mousewheel', NULL, 0, 3, NULL, NULL, 0, NULL, 0, 3, '2021-10-05 11:16:39', '2022-03-11 13:28:51');
INSERT INTO `sys_menu` VALUES (274, 270, '更多组件', '#/plugin/other/other', NULL, 0, 4, NULL, NULL, 0, NULL, 0, 3, '2021-10-05 11:18:35', '2022-03-11 13:28:53');
INSERT INTO `sys_menu` VALUES (275, 255, '更多扩展', '#/plugin/more', NULL, 0, 4, NULL, NULL, 0, NULL, 0, 3, '2021-10-05 11:20:35', '2022-03-11 13:28:54');
INSERT INTO `sys_menu` VALUES (276, 0, '经典实例', 'javascript:;', NULL, 0, 4, NULL, 'layui-icon layui-icon-app', 0, NULL, 0, 3, '2021-10-05 11:13:35', '2022-03-11 13:28:56');
INSERT INTO `sys_menu` VALUES (277, 276, '弹窗实例', '#/example/dialog', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-10-05 11:29:03', '2022-03-11 13:28:57');
INSERT INTO `sys_menu` VALUES (278, 276, '课程管理', '#/example/course', NULL, 0, 2, NULL, NULL, 0, NULL, 0, 3, '2021-10-05 11:29:56', '2022-03-11 13:28:59');
INSERT INTO `sys_menu` VALUES (279, 276, '排课管理', '#/example/calendar', NULL, 0, 3, NULL, NULL, 0, NULL, 0, 3, '2021-10-10 16:21:12', '2022-03-11 13:29:01');
INSERT INTO `sys_menu` VALUES (280, 276, '添加试题', '#/example/question', NULL, 0, 4, NULL, NULL, 0, NULL, 0, 3, '2021-10-10 16:21:45', '2022-03-11 13:29:02');
INSERT INTO `sys_menu` VALUES (281, 276, '文件管理', '#/example/file', NULL, 0, 5, NULL, NULL, 0, NULL, 0, 3, '2021-10-10 16:21:45', '2022-03-11 13:29:04');
INSERT INTO `sys_menu` VALUES (282, 276, '表格CRUD', '#/example/table-crud', NULL, 0, 6, NULL, NULL, 0, NULL, 0, 3, '2021-10-10 16:21:45', '2022-03-11 13:29:06');
INSERT INTO `sys_menu` VALUES (283, 276, '路由传参', '#/example/router-demo', NULL, 0, 7, NULL, NULL, 0, NULL, 0, 3, '2021-10-10 16:21:45', '2022-03-11 13:29:07');
INSERT INTO `sys_menu` VALUES (284, 276, '多系统模式', 'side-more.html', NULL, 0, 8, NULL, NULL, 0, NULL, 0, 3, '2021-10-10 16:21:45', '2022-03-11 13:29:09');
INSERT INTO `sys_menu` VALUES (285, 0, 'LayUI组件', 'javascript:;', NULL, 0, 5, NULL, 'layui-icon layui-icon-release', 0, NULL, 0, 3, '2021-10-05 11:13:35', '2022-03-11 13:29:11');
INSERT INTO `sys_menu` VALUES (286, 285, '组件演示', '#/plugin/other/layui', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-10-05 11:29:03', '2022-03-11 13:29:12');
INSERT INTO `sys_menu` VALUES (287, 285, '开发文档', '#/layui/doc', 'https://eleadmin.com/doc/spa/', 0, 2, NULL, NULL, 0, NULL, 0, 3, '2021-10-05 11:29:56', '2022-08-01 23:44:18');
INSERT INTO `sys_menu` VALUES (288, 0, '多级菜单', 'javascript:;', NULL, 0, 6, NULL, 'layui-icon layui-icon-unlink', 0, NULL, 0, 3, '2021-10-10 16:21:45', '2022-03-11 13:29:19');
INSERT INTO `sys_menu` VALUES (289, 288, '二级菜单', 'javascript:;', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-10-10 16:21:45', '2022-03-11 14:07:48');
INSERT INTO `sys_menu` VALUES (290, 289, '内嵌官网', '#/baidu', 'https://www.eleadmin.com', 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-10-10 16:21:45', '2022-08-01 23:44:34');
INSERT INTO `sys_menu` VALUES (291, 289, '三级菜单', 'javascript:;', NULL, 0, 2, NULL, NULL, 0, NULL, 0, 3, '2021-10-10 16:21:45', '2022-07-20 22:15:26');
INSERT INTO `sys_menu` VALUES (292, 291, '四级菜单', 'javascript:;', NULL, 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-10-10 16:21:45', '2022-03-11 13:29:45');
INSERT INTO `sys_menu` VALUES (293, 292, '五级菜单', '#/eleadmin-doc', 'https://eleadmin.com/goods/2', 0, 1, NULL, NULL, 0, NULL, 0, 3, '2021-10-10 16:21:45', '2022-08-01 23:45:16');
INSERT INTO `sys_menu` VALUES (294, 0, '一级菜单', '#/eleadmin', 'https://eleadmin.com/goods/3', 0, 7, NULL, 'layui-icon layui-icon-unlink', 0, NULL, 0, 3, '2021-10-05 11:13:35', '2022-08-01 23:45:14');
INSERT INTO `sys_menu` VALUES (295, 0, '路由传参', '#/example/router-param', NULL, 0, 8, NULL, NULL, 1, NULL, 0, 3, '2021-10-05 11:13:35', '2022-03-11 13:29:52');
INSERT INTO `sys_menu` VALUES (301, 0, '系统管理', '/system', NULL, 0, 1, NULL, 'SettingOutlined', 0, '{\"props\": {\"badge\": {\"value\": \"New\", \"type\": \"warning\"}}, \"lang\": {\"zh_TW\": \"系統管理\", \"en\": \"System\"}}', 0, 4, '2020-02-26 12:51:23', '2024-02-25 13:59:21');
INSERT INTO `sys_menu` VALUES (302, 301, '用户管理', '/system/user', '/system/user', 0, 1, NULL, 'UserOutlined', 0, '{\"lang\": {\"zh_TW\": \"用戶管理\", \"en\": \"User\"}}', 0, 4, '2020-02-26 12:51:55', '2024-02-25 13:59:26');
INSERT INTO `sys_menu` VALUES (303, 302, '查询用户', NULL, NULL, 1, 1, 'sys:user:list', NULL, 0, NULL, 0, 4, '2020-02-26 12:52:06', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (304, 302, '添加用户', NULL, NULL, 1, 2, 'sys:user:save', NULL, 0, NULL, 0, 4, '2020-02-26 12:52:26', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (305, 302, '修改用户', NULL, NULL, 1, 3, 'sys:user:update', NULL, 0, NULL, 0, 4, '2020-02-26 12:52:50', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (306, 302, '删除用户', NULL, NULL, 1, 4, 'sys:user:remove', NULL, 0, NULL, 0, 4, '2020-02-26 12:53:13', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (307, 301, '角色管理', '/system/role', '/system/role', 0, 2, NULL, 'IdcardOutlined', 0, '{\"lang\": {\"zh_TW\": \"角色管理\", \"en\": \"Role\"}}', 0, 4, '2020-03-13 13:29:08', '2024-02-25 13:59:34');
INSERT INTO `sys_menu` VALUES (308, 307, '查询角色', NULL, NULL, 1, 1, 'sys:role:list', NULL, 0, NULL, 0, 4, '2020-03-13 13:30:41', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (309, 307, '添加角色', NULL, NULL, 1, 2, 'sys:role:save', NULL, 0, NULL, 0, 4, '2020-03-15 13:02:07', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (310, 307, '修改角色', NULL, NULL, 1, 3, 'sys:role:update', NULL, 0, NULL, 0, 4, '2020-03-15 13:02:49', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (311, 307, '删除角色', NULL, NULL, 1, 4, 'sys:role:remove', NULL, 0, NULL, 0, 4, '2020-03-20 17:58:51', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (312, 301, '菜单管理', '/system/menu', '/system/menu', 0, 3, NULL, 'AppstoreOutlined', 0, '{\"lang\": {\"zh_TW\": \"選單管理\", \"en\": \"Menu\"}}', 0, 4, '2020-03-21 01:07:13', '2024-02-25 13:59:39');
INSERT INTO `sys_menu` VALUES (313, 312, '查询菜单', NULL, NULL, 1, 1, 'sys:menu:list', NULL, 0, NULL, 0, 4, '2020-03-21 16:43:30', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (314, 312, '添加菜单', NULL, NULL, 1, 2, 'sys:menu:save', NULL, 0, NULL, 0, 4, '2020-03-21 16:43:54', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (315, 312, '修改菜单', NULL, NULL, 1, 3, 'sys:menu:update', NULL, 0, NULL, 0, 4, '2020-03-21 18:24:17', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (316, 312, '删除菜单', NULL, NULL, 1, 4, 'sys:menu:remove', NULL, 0, NULL, 0, 4, '2020-03-21 18:24:18', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (317, 301, '机构管理', '/system/organization', '/system/organization', 0, 4, NULL, 'CityOutlined', 0, '{\"hideFooter\":true, \"lang\": {\"zh_TW\": \"機构管理\", \"en\": \"Organization\"}}', 0, 4, '2020-03-21 18:24:20', '2024-02-25 13:59:40');
INSERT INTO `sys_menu` VALUES (318, 317, '查询机构', NULL, NULL, 1, 1, 'sys:org:list', NULL, 0, NULL, 0, 4, '2020-03-21 18:24:21', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (319, 317, '添加机构', NULL, NULL, 1, 2, 'sys:org:save', NULL, 0, NULL, 0, 4, '2020-03-21 18:24:22', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (320, 317, '修改机构', NULL, NULL, 1, 3, 'sys:org:update', NULL, 0, NULL, 0, 4, '2020-03-21 18:24:24', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (321, 317, '删除机构', NULL, NULL, 1, 4, 'sys:org:remove', NULL, 0, NULL, 0, 4, '2020-03-21 18:24:25', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (322, 301, '字典管理', '/system/dictionary', '/system/dictionary', 0, 5, NULL, 'BookOutlined', 0, '{\"hideFooter\":true, \"lang\": {\"zh_TW\": \"字典管理\", \"en\": \"Dictionary\"}}', 0, 4, '2020-03-21 18:24:26', '2024-02-25 13:59:44');
INSERT INTO `sys_menu` VALUES (323, 322, '查询字典', NULL, NULL, 1, 1, 'sys:dict:list', NULL, 0, NULL, 0, 4, '2020-03-21 18:24:27', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (324, 322, '添加字典', NULL, NULL, 1, 2, 'sys:dict:save', NULL, 0, NULL, 0, 4, '2020-03-21 18:24:28', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (325, 322, '修改字典', NULL, NULL, 1, 3, 'sys:dict:update', NULL, 0, NULL, 0, 4, '2020-03-21 18:24:29', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (326, 322, '删除字典', NULL, NULL, 1, 4, 'sys:dict:remove', NULL, 0, NULL, 0, 4, '2020-03-21 18:24:31', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (327, 301, '登录日志', '/system/login-record', '/system/login-record', 0, 7, 'sys:login-record:list', 'CalendarOutlined', 0, '{\"lang\": {\"zh_TW\": \"登入日誌\", \"en\": \"LoginRecord\"}}', 0, 4, '2020-03-21 18:24:33', '2024-02-25 14:00:00');
INSERT INTO `sys_menu` VALUES (328, 301, '操作日志', '/system/operation-record', '/system/operation-record', 0, 8, 'sys:operation-record:list', 'LogOutlined', 0, '{\"lang\": {\"zh_TW\": \"操作日誌\", \"en\": \"OperationRecord\"}}', 0, 4, '2020-03-21 18:24:34', '2024-02-25 14:00:05');
INSERT INTO `sys_menu` VALUES (329, 301, '文件管理', '/system/file', '/system/file', 0, 6, NULL, 'FolderOutlined', 0, '{\"lang\": {\"zh_TW\": \"檔案管理\", \"en\": \"File\"}}', 0, 4, '2020-09-17 23:19:43', '2024-02-25 14:00:10');
INSERT INTO `sys_menu` VALUES (330, 329, '上传文件', NULL, NULL, 1, 1, 'sys:file:upload', NULL, 0, NULL, 0, 4, '2020-09-17 23:21:04', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (331, 329, '删除文件', NULL, NULL, 1, 2, 'sys:file:remove', NULL, 0, NULL, 0, 4, '2020-09-17 23:21:53', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (332, 329, '查看记录', NULL, NULL, 1, 3, 'sys:file:list', NULL, 0, NULL, 0, 4, '2020-09-17 23:20:29', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (333, 302, '用户详情', '/system/user/details/:id', '/system/user/details', 0, 5, NULL, 'UserOutlined', 1, '{\"active\": \"/system/user\", \"lang\": {\"zh_TW\": \"用戶詳情\", \"en\": \"UserDetails\"}}', 0, 4, '2021-05-21 11:07:54', '2024-02-25 14:00:16');
INSERT INTO `sys_menu` VALUES (334, 301, '修改个人密码', NULL, NULL, 1, 10, 'sys:auth:password', NULL, 0, NULL, 0, 4, '2020-09-17 23:22:45', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (335, 301, '修改个人资料', NULL, NULL, 1, 11, 'sys:auth:user', NULL, 0, NULL, 0, 4, '2020-09-17 23:23:24', '2023-05-24 11:59:06');
INSERT INTO `sys_menu` VALUES (336, 0, 'Dashboard', '/dashboard', NULL, 0, 0, NULL, 'HomeOutlined', 0, NULL, 0, 4, '2021-02-02 20:00:34', '2024-02-25 14:00:21');
INSERT INTO `sys_menu` VALUES (337, 336, '工作台', '/dashboard/workplace', '/dashboard/workplace', 0, 1, NULL, 'DesktopOutlined', 0, '{\"lang\": {\"zh_TW\": \"工作臺\", \"en\": \"Workplace\"}}', 0, 4, '2021-02-02 20:00:37', '2024-02-25 14:00:26');
INSERT INTO `sys_menu` VALUES (338, 336, '分析页', '/dashboard/analysis', '/dashboard/analysis', 0, 2, NULL, 'AnalysisOutlined', 0, '{\"props\": {\"badge\": {\"value\": 1}}, \"lang\": {\"zh_TW\": \"分析頁\", \"en\": \"Analysis\"}}', 0, 4, '2021-02-02 20:00:40', '2024-02-25 14:00:30');
INSERT INTO `sys_menu` VALUES (339, 336, '监控页', '/dashboard/monitor', '/dashboard/monitor', 0, 3, NULL, 'DashboardOutlined', 0, '{\"lang\": {\"zh_TW\": \"監控頁\", \"en\": \"Monitor\"}}', 0, 4, '2021-02-02 20:03:12', '2024-02-25 14:00:36');
INSERT INTO `sys_menu` VALUES (340, 0, '表单页面', '/form', NULL, 0, 2, NULL, 'FormOutlined', 0, '{\"lang\": {\"zh_TW\": \"表單頁面\", \"en\": \"Form\"}}', 0, 4, '2021-02-02 20:03:28', '2024-02-25 14:00:40');
INSERT INTO `sys_menu` VALUES (341, 340, '基础表单', '/form/basic', '/form/basic', 0, 1, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"基礎表單\", \"en\": \"Basic Form\"}}', 0, 4, '2021-02-02 20:03:51', '2024-02-25 14:00:43');
INSERT INTO `sys_menu` VALUES (342, 340, '复杂表单', '/form/advanced', '/form/advanced', 0, 2, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"複雜表單\", \"en\": \"Advanced Form\"}}', 0, 4, '2021-02-02 20:03:56', '2024-02-25 14:00:44');
INSERT INTO `sys_menu` VALUES (343, 340, '分步表单', '/form/step', '/form/step', 0, 3, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"分步表單\", \"en\": \"Step Form\"}}', 0, 4, '2021-02-02 20:04:06', '2024-02-25 14:00:44');
INSERT INTO `sys_menu` VALUES (344, 0, '列表页面', '/list', NULL, 0, 3, NULL, 'TableOutlined', 0, '{\"props\": {\"hideTimeout\": 450}, \"lang\": {\"zh_TW\": \"清單頁面\", \"en\": \"List\"}}', 0, 4, '2021-02-02 20:05:07', '2024-02-25 14:03:16');
INSERT INTO `sys_menu` VALUES (345, 344, '基础列表', '/list/basic', '/list/basic', 0, 1, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"基礎清單\", \"en\": \"Basic List\"}}', 0, 4, '2021-02-02 20:05:10', '2024-02-25 14:00:45');
INSERT INTO `sys_menu` VALUES (346, 344, '复杂列表', '/list/advanced', '/list/advanced', 0, 2, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"複雜清單\", \"en\": \"Advanced List\"}}', 0, 4, '2021-02-02 20:05:26', '2024-02-25 14:00:46');
INSERT INTO `sys_menu` VALUES (347, 344, '卡片列表', '/list/card', '/list/card', 0, 3, NULL, 'LinkOutlined', 0, '{\"props\": {\"hideTimeout\": 100}, \"lang\": {\"zh_TW\": \"卡片清單\", \"en\": \"Card List\"}}', 0, 4, '2021-02-02 20:05:30', '2024-02-25 14:00:47');
INSERT INTO `sys_menu` VALUES (348, 347, '项目列表', '/list/card/project', '/list/card/project', 0, 1, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"項目清單\", \"en\": \"Project\"}}', 0, 4, '2021-02-02 20:06:35', '2024-02-25 14:00:48');
INSERT INTO `sys_menu` VALUES (349, 347, '应用列表', '/list/card/application', '/list/card/application', 0, 2, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"應用清單\", \"en\": \"Application\"}}', 0, 4, '2021-02-02 20:06:39', '2024-02-25 14:00:51');
INSERT INTO `sys_menu` VALUES (350, 347, '文章列表', '/list/card/article', '/list/card/article', 0, 3, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"文章清單\", \"en\": \"Article\"}}', 0, 4, '2021-02-02 20:06:48', '2024-02-25 14:00:52');
INSERT INTO `sys_menu` VALUES (351, 345, '添加用户', '/list/basic/add', '/list/basic/add', 0, 4, NULL, 'LinkOutlined', 1, '{\"active\": \"/list/basic\", \"lang\": {\"zh_TW\": \"添加用戶\", \"en\": \"Add User\"}}', 0, 4, '2021-02-02 20:05:26', '2024-02-25 14:00:52');
INSERT INTO `sys_menu` VALUES (352, 345, '修改用户', '/list/basic/edit/:id', '/list/basic/edit', 0, 4, NULL, 'LinkOutlined', 1, '{\"active\": \"/list/basic\", \"lang\": {\"zh_TW\": \"編輯用戶\", \"en\": \"Edit User\"}}', 0, 4, '2021-02-02 20:05:26', '2024-02-25 14:00:53');
INSERT INTO `sys_menu` VALUES (353, 340, '表单构建', '/form/build', '/form/build', 0, 4, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"表單構建\", \"en\": \"Form Build\"}}', 0, 4, '2021-02-02 20:05:26', '2024-02-25 14:57:33');
INSERT INTO `sys_menu` VALUES (354, 0, '结果页面', '/result', NULL, 0, 4, NULL, 'CheckCircleOutlined', 0, '{\"lang\": {\"zh_TW\": \"結果頁面\", \"en\": \"Result\"}}', 0, 4, '2021-02-02 20:07:33', '2024-02-25 14:02:32');
INSERT INTO `sys_menu` VALUES (355, 354, '成功页', '/result/success', '/result/success', 0, 1, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"成功頁\", \"en\": \"Success\"}}', 0, 4, '2021-02-02 20:07:40', '2024-02-25 14:00:55');
INSERT INTO `sys_menu` VALUES (356, 354, '失败页', '/result/fail', '/result/fail', 0, 2, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"失敗頁\", \"en\": \"Fail\"}}', 0, 4, '2021-02-02 20:07:41', '2024-02-25 14:00:56');
INSERT INTO `sys_menu` VALUES (357, 0, '异常页面', '/exception', NULL, 0, 5, NULL, 'WarningOutlined', 0, '{\"lang\": {\"zh_TW\": \"异常頁面\", \"en\": \"Exception\"}}', 0, 4, '2021-02-02 20:08:44', '2024-02-25 14:03:57');
INSERT INTO `sys_menu` VALUES (358, 357, '403', '/exception/403', '/exception/403', 0, 1, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:08:47', '2024-02-25 14:00:57');
INSERT INTO `sys_menu` VALUES (359, 357, '404', '/exception/404', '/exception/404', 0, 2, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:08:49', '2024-02-25 14:00:58');
INSERT INTO `sys_menu` VALUES (360, 357, '500', '/exception/500', '/exception/500', 0, 3, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:08:52', '2024-02-25 14:00:59');
INSERT INTO `sys_menu` VALUES (361, 0, '个人中心', '/user', NULL, 0, 6, NULL, 'ControlOutlined', 0, '{\"lang\": {\"zh_TW\": \"個人中心\", \"en\": \"User\"}}', 0, 4, '2021-02-02 20:09:54', '2024-02-25 14:02:19');
INSERT INTO `sys_menu` VALUES (362, 361, '我的资料', '/user/profile', '/user/profile', 0, 1, NULL, 'UserOutlined', 0, '{\"lang\": {\"zh_TW\": \"個人資料\", \"en\": \"Profile\"}}', 0, 4, '2021-02-02 20:09:58', '2024-02-25 14:02:18');
INSERT INTO `sys_menu` VALUES (363, 361, '我的消息', '/user/message', '/user/message', 0, 2, NULL, 'MessageOutlined', 0, '{\"lang\": {\"zh_TW\": \"我的消息\", \"en\": \"Message\"}}', 0, 4, '2021-02-02 20:10:03', '2024-02-25 14:02:07');
INSERT INTO `sys_menu` VALUES (364, 0, '扩展组件', '/extension', NULL, 0, 7, NULL, 'AppstoreAddOutlined', 0, NULL, 0, 4, '2021-02-02 20:10:52', '2024-02-25 14:04:19');
INSERT INTO `sys_menu` VALUES (365, 364, '标签输入', '/extension/tag', '/extension/tag', 0, 3, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-05 11:13:35', '2024-02-25 14:01:02');
INSERT INTO `sys_menu` VALUES (366, 364, '高级弹窗', '/extension/modal', '/extension/modal', 0, 4, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-05 11:32:12', '2024-02-25 14:01:03');
INSERT INTO `sys_menu` VALUES (367, 364, '文件列表', '/extension/file', '/extension/file', 0, 5, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:10:58', '2024-02-25 14:01:04');
INSERT INTO `sys_menu` VALUES (368, 364, '图片上传', '/extension/upload', '/extension/upload', 0, 6, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:10:58', '2024-02-25 14:01:04');
INSERT INTO `sys_menu` VALUES (369, 364, '拖拽排序', '/extension/dragsort', '/extension/dragsort', 0, 24, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:11:48', '2024-02-25 14:01:05');
INSERT INTO `sys_menu` VALUES (370, 364, '消息提示', '/extension/message', '/extension/message', 0, 1, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-05 11:16:39', '2024-02-25 14:01:06');
INSERT INTO `sys_menu` VALUES (371, 364, '城市选择', '/extension/regions', '/extension/regions', 0, 26, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-05 11:25:15', '2024-02-25 14:01:06');
INSERT INTO `sys_menu` VALUES (372, 364, '打印组件', '/extension/printer', '/extension/printer', 0, 11, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:11:00', '2024-02-25 14:01:07');
INSERT INTO `sys_menu` VALUES (373, 364, '导入导出', '/extension/excel', '/extension/excel', 0, 27, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:11:03', '2024-02-25 14:01:08');
INSERT INTO `sys_menu` VALUES (374, 364, '下拉树', '/extension/tree-select', '/extension/tree-select', 0, 18, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-05 11:29:03', '2024-02-25 14:01:09');
INSERT INTO `sys_menu` VALUES (375, 364, '可选卡片', '/extension/check-card', '/extension/check-card', 0, 21, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-10 16:21:45', '2024-02-25 14:01:11');
INSERT INTO `sys_menu` VALUES (376, 364, '下拉表格', '/extension/table-select', '/extension/table-select', 0, 10, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-10 16:21:45', '2024-02-25 14:01:30');
INSERT INTO `sys_menu` VALUES (377, 364, '分割面板', '/extension/split', '/extension/split', 0, 7, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-10 16:21:45', '2024-02-25 14:01:31');
INSERT INTO `sys_menu` VALUES (378, 364, '视频播放', '/extension/player', '/extension/player', 0, 28, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:13:49', '2024-02-25 14:01:31');
INSERT INTO `sys_menu` VALUES (379, 364, '地图组件', '/extension/map', '/extension/map', 0, 25, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:11:49', '2024-02-25 14:01:28');
INSERT INTO `sys_menu` VALUES (380, 364, '二维码', '/extension/qr-code', '/extension/qr-code', 0, 20, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-05 11:29:56', '2024-02-25 14:01:27');
INSERT INTO `sys_menu` VALUES (381, 364, '条形码', '/extension/bar-code', '/extension/bar-code', 0, 19, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-05 11:29:56', '2024-02-25 14:01:26');
INSERT INTO `sys_menu` VALUES (382, 364, '富文本框', '/extension/editor', '/extension/editor', 0, 29, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:13:57', '2024-02-25 14:01:26');
INSERT INTO `sys_menu` VALUES (383, 364, 'markdown', '/extension/markdown', '/extension/markdown', 0, 30, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-10 16:21:45', '2024-02-25 14:01:25');
INSERT INTO `sys_menu` VALUES (384, 364, '头像组合', '/extension/avatar', '/extension/avatar', 0, 2, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-05 11:14:28', '2024-02-25 14:01:24');
INSERT INTO `sys_menu` VALUES (385, 364, '图标选择', '/extension/icon', '/extension/icon', 0, 8, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-05 11:18:35', '2024-02-25 14:01:23');
INSERT INTO `sys_menu` VALUES (386, 364, '文本组件', '/extension/text', '/extension/text', 0, 12, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:10:55', '2024-02-25 14:01:22');
INSERT INTO `sys_menu` VALUES (387, 364, '高级表格', '/extension/table', '/extension/table', 0, 9, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:10:55', '2024-02-25 14:01:21');
INSERT INTO `sys_menu` VALUES (388, 364, '状态文本', '/extension/circle-wave', '/extension/circle-wave', 0, 31, NULL, 'LinkOutlined', 0, NULL, 1, 4, '2021-02-02 20:15:01', '2024-02-25 14:01:21');
INSERT INTO `sys_menu` VALUES (389, 364, '标签页', '/extension/tabs', '/extension/tabs', 0, 16, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-10-06 22:26:55', '2024-02-25 14:01:20');
INSERT INTO `sys_menu` VALUES (390, 364, '步骤条', '/extension/steps', '/extension/steps', 0, 15, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:05:26', '2024-02-25 14:01:19');
INSERT INTO `sys_menu` VALUES (391, 364, '导航菜单', '/extension/menu', '/extension/menu', 0, 14, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-05-21 11:11:57', '2024-02-25 14:01:18');
INSERT INTO `sys_menu` VALUES (392, 364, '水印组件', '/extension/watermark', '/extension/watermark', 0, 22, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-05-21 11:11:57', '2024-02-25 14:01:17');
INSERT INTO `sys_menu` VALUES (393, 364, '引导组件', '/extension/tour', '/extension/tour', 0, 13, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:15:11', '2024-02-25 14:01:17');
INSERT INTO `sys_menu` VALUES (394, 364, '分段器', '/extension/segmented', '/extension/segmented', 0, 17, NULL, 'LinkOutlined', 0, NULL, 0, 4, '2021-02-02 20:15:03', '2024-02-25 14:01:16');
INSERT INTO `sys_menu` VALUES (395, 0, '内嵌页面', '/iframe', NULL, 0, 8, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"內嵌頁面\", \"en\": \"IFrame\"}}', 0, 4, '2021-10-05 11:20:35', '2024-02-25 14:01:15');
INSERT INTO `sys_menu` VALUES (396, 395, '官网', '/iframe/pqadmin', 'https://www.baidu.com', 0, 1, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"官網\", \"en\": \"Website\"}}', 0, 4, '2021-10-10 16:21:12', '2024-02-25 14:01:14');
INSERT INTO `sys_menu` VALUES (397, 395, '文档', '/iframe/pqadmin-doc', 'https://zcn16diyhiu4.feishu.cn/wiki/UPDcw6LyviB7brk4ClKcfKNNnz6', 0, 2, NULL, 'LinkOutlined', 0, '{\"lang\": {\"zh_TW\": \"檔案\", \"en\": \"Document\"}}', 0, 4, '2021-10-10 16:21:12', '2024-02-25 14:01:13');
INSERT INTO `sys_menu` VALUES (398, 0, '功能演示', '/example', '/example', 0, 9, NULL, 'CompassOutlined', 0, '{\"lang\": {\"zh_TW\": \"功能演示\", \"en\": \"Demo\"}}', 0, 4, '2021-10-10 16:21:12', '2024-02-25 14:01:47');

-- ----------------------------
-- Table structure for sys_operation_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_record`;
CREATE TABLE `sys_operation_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `module` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作模块',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作功能',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `request_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用方法',
  `params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `result` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回结果',
  `error` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `spend_time` int(11) NULL DEFAULT NULL COMMENT '消耗时间, 单位毫秒',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `device` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态, 0成功, 1异常',
  `tenant_id` int(11) NOT NULL DEFAULT 1 COMMENT '租户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `tenant_id`(`tenant_id`) USING BTREE,
  CONSTRAINT `sys_operation_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_operation_record_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `sys_tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_operation_record
-- ----------------------------

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization`  (
  `organization_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '机构id',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级id, 0是顶级',
  `organization_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构名称',
  `organization_full_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构全称',
  `organization_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构代码',
  `organization_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构类型',
  `leader_id` int(11) NULL DEFAULT NULL COMMENT '负责人id',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除, 0否, 1是',
  `tenant_id` int(11) NOT NULL DEFAULT 1 COMMENT '租户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`organization_id`) USING BTREE,
  INDEX `leader_id`(`leader_id`) USING BTREE,
  INDEX `tenant_id`(`tenant_id`) USING BTREE,
  CONSTRAINT `sys_organization_ibfk_1` FOREIGN KEY (`leader_id`) REFERENCES `sys_user` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `sys_organization_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `sys_tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织机构' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES (1, 0, 'XXX公司', '武汉易云智科技有限公司', '91420111MA49EPRW0A', '1', NULL, 1, NULL, 0, 1, '2020-03-15 13:14:55', '2022-03-11 22:47:18');
INSERT INTO `sys_organization` VALUES (2, 1, '研发部', '研发部', NULL, '3', NULL, 2, NULL, 0, 1, '2020-03-15 13:15:16', '2022-03-11 22:47:19');
INSERT INTO `sys_organization` VALUES (3, 2, '研发一组', '研发一组', NULL, '4', NULL, 3, NULL, 0, 1, '2020-03-15 13:15:45', '2022-07-20 15:10:43');
INSERT INTO `sys_organization` VALUES (4, 2, '研发二组', '研发二组', NULL, '4', NULL, 4, NULL, 0, 1, '2020-03-15 13:16:15', '2022-07-20 15:10:45');
INSERT INTO `sys_organization` VALUES (5, 2, '研发三组', '研发三组', NULL, '4', NULL, 5, NULL, 0, 1, '2020-03-15 13:16:37', '2022-07-20 15:10:48');
INSERT INTO `sys_organization` VALUES (6, 2, '研发四组', '研发四组', NULL, '4', NULL, 6, NULL, 0, 1, '2020-03-15 13:16:57', '2022-07-20 15:10:50');
INSERT INTO `sys_organization` VALUES (7, 1, '测试部', '测试部', NULL, '3', NULL, 7, NULL, 0, 1, '2020-03-15 13:17:19', '2022-03-11 22:47:27');
INSERT INTO `sys_organization` VALUES (8, 1, '设计部', '设计部', NULL, '3', NULL, 8, NULL, 0, 1, '2020-03-15 13:17:56', '2022-07-20 15:10:55');
INSERT INTO `sys_organization` VALUES (9, 1, '市场部', '市场部', NULL, '3', NULL, 9, NULL, 0, 1, '2020-03-15 13:18:15', '2022-03-11 22:47:30');
INSERT INTO `sys_organization` VALUES (10, 1, '运维部', '运维部', NULL, '3', NULL, 10, NULL, 0, 1, '2021-10-15 16:34:05', '2021-10-15 16:34:05');
INSERT INTO `sys_organization` VALUES (11, 0, 'XXX公司', '武汉易云智科技有限公司', NULL, '1', NULL, 1, NULL, 0, 2, '2020-03-15 13:14:55', '2022-03-11 22:47:32');
INSERT INTO `sys_organization` VALUES (12, 11, '研发部', '研发部', NULL, '3', NULL, 2, NULL, 0, 2, '2020-03-15 13:15:16', '2022-03-11 22:47:35');
INSERT INTO `sys_organization` VALUES (13, 12, '研发一组', '研发一组', NULL, '4', NULL, 3, NULL, 0, 2, '2020-03-15 13:15:45', '2022-07-20 15:11:06');
INSERT INTO `sys_organization` VALUES (14, 12, '研发二组', '研发二组', NULL, '4', NULL, 4, NULL, 0, 2, '2020-03-15 13:16:15', '2022-07-20 15:11:10');
INSERT INTO `sys_organization` VALUES (15, 12, '研发三组', '研发三组', NULL, '4', NULL, 5, NULL, 0, 2, '2020-03-15 13:16:37', '2022-07-20 15:11:13');
INSERT INTO `sys_organization` VALUES (16, 12, '研发四组', '研发四组', NULL, '4', NULL, 6, NULL, 0, 2, '2020-03-15 13:16:57', '2022-07-20 15:11:16');
INSERT INTO `sys_organization` VALUES (17, 11, '测试部', '测试部', NULL, '3', NULL, 7, NULL, 0, 2, '2020-03-15 13:17:19', '2022-03-11 22:47:43');
INSERT INTO `sys_organization` VALUES (18, 11, '设计部', '设计部', NULL, '3', NULL, 8, NULL, 0, 2, '2020-03-15 13:17:56', '2022-03-11 22:47:44');
INSERT INTO `sys_organization` VALUES (19, 11, '市场部', '市场部', NULL, '3', NULL, 9, NULL, 0, 2, '2020-03-15 13:18:15', '2022-03-11 22:47:46');
INSERT INTO `sys_organization` VALUES (20, 11, '运维部', '运维部', NULL, '3', NULL, 10, NULL, 0, 2, '2021-10-15 16:35:15', '2022-03-11 22:47:49');
INSERT INTO `sys_organization` VALUES (21, 0, 'XXX公司', '武汉易云智科技有限公司', '91420111MA49EPRW0A', '1', NULL, 1, NULL, 0, 3, '2020-03-15 13:14:55', '2022-03-11 22:47:50');
INSERT INTO `sys_organization` VALUES (22, 21, '研发部', '研发部', NULL, '3', NULL, 2, NULL, 0, 3, '2020-03-15 13:15:16', '2022-03-11 22:47:52');
INSERT INTO `sys_organization` VALUES (23, 22, '研发一组', '研发一组', NULL, '4', NULL, 3, NULL, 0, 3, '2020-03-15 13:15:45', '2022-07-20 15:11:26');
INSERT INTO `sys_organization` VALUES (24, 22, '研发二组', '研发二组', NULL, '4', NULL, 4, NULL, 0, 3, '2020-03-15 13:16:15', '2022-07-20 15:11:30');
INSERT INTO `sys_organization` VALUES (25, 22, '研发三组', '研发三组', NULL, '4', NULL, 5, NULL, 0, 3, '2020-03-15 13:16:37', '2022-07-20 15:11:34');
INSERT INTO `sys_organization` VALUES (26, 22, '研发四组', '研发四组', NULL, '4', NULL, 6, NULL, 0, 3, '2020-03-15 13:16:57', '2022-07-20 15:12:05');
INSERT INTO `sys_organization` VALUES (27, 21, '测试部', '测试部', NULL, '3', NULL, 7, NULL, 0, 3, '2020-03-15 13:17:19', '2022-03-11 22:48:02');
INSERT INTO `sys_organization` VALUES (28, 21, '设计部', 'UI设计部门', NULL, '3', NULL, 8, NULL, 0, 3, '2020-03-15 13:17:56', '2022-03-11 22:48:03');
INSERT INTO `sys_organization` VALUES (29, 21, '市场部', '市场部', NULL, '3', NULL, 9, NULL, 0, 3, '2020-03-15 13:18:15', '2022-03-11 22:48:04');
INSERT INTO `sys_organization` VALUES (30, 21, '运维部', '运维部', NULL, '3', NULL, 10, NULL, 0, 3, '2021-10-15 16:34:05', '2021-10-15 16:34:05');
INSERT INTO `sys_organization` VALUES (31, 0, 'XXX公司', '武汉易云智科技有限公司', '91420111MA49EPRW0A', '1', NULL, 1, NULL, 0, 4, '2020-03-15 13:14:55', '2022-03-11 22:47:50');
INSERT INTO `sys_organization` VALUES (32, 31, '研发部', '研发部', NULL, '3', NULL, 2, NULL, 0, 4, '2020-03-15 13:15:16', '2022-03-11 22:47:52');
INSERT INTO `sys_organization` VALUES (33, 32, '研发一组', '研发一组', NULL, '4', NULL, 3, NULL, 0, 4, '2020-03-15 13:15:45', '2022-07-20 15:11:26');
INSERT INTO `sys_organization` VALUES (34, 32, '研发二组', '研发二组', NULL, '4', NULL, 4, NULL, 0, 4, '2020-03-15 13:16:15', '2022-07-20 15:11:30');
INSERT INTO `sys_organization` VALUES (35, 32, '研发三组', '研发三组', NULL, '4', NULL, 5, NULL, 0, 4, '2020-03-15 13:16:37', '2022-07-20 15:11:34');
INSERT INTO `sys_organization` VALUES (36, 32, '研发四组', '研发四组', NULL, '4', NULL, 6, NULL, 0, 4, '2020-03-15 13:16:57', '2022-07-20 15:12:05');
INSERT INTO `sys_organization` VALUES (37, 31, '测试部', '测试部', NULL, '3', NULL, 7, NULL, 0, 4, '2020-03-15 13:17:19', '2022-03-11 22:48:02');
INSERT INTO `sys_organization` VALUES (38, 31, '设计部', 'UI设计部门', NULL, '3', NULL, 8, NULL, 0, 4, '2020-03-15 13:17:56', '2022-03-11 22:48:03');
INSERT INTO `sys_organization` VALUES (39, 31, '市场部', '市场部', NULL, '3', NULL, 9, NULL, 0, 4, '2020-03-15 13:18:15', '2022-03-11 22:48:04');
INSERT INTO `sys_organization` VALUES (40, 31, '运维部', '运维部', NULL, '3', NULL, 10, NULL, 0, 4, '2021-10-15 16:34:05', '2021-10-15 16:34:05');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色标识',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除, 0否, 1是',
  `tenant_id` int(11) NOT NULL DEFAULT 1 COMMENT '租户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  INDEX `tenant_id`(`tenant_id`) USING BTREE,
  CONSTRAINT `sys_role_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `sys_tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', '管理员', 0, 1, '2020-02-26 15:18:37', '2020-03-21 15:15:54');
INSERT INTO `sys_role` VALUES (2, '普通用户', 'user', '普通用户', 0, 1, '2020-02-26 15:18:52', '2020-03-21 15:16:02');
INSERT INTO `sys_role` VALUES (3, '游客', 'guest', '游客', 0, 1, '2020-02-26 15:19:49', '2020-03-21 15:16:57');
INSERT INTO `sys_role` VALUES (4, '管理员', 'admin', '管理员', 0, 2, '2020-02-26 15:18:37', '2020-03-21 15:15:54');
INSERT INTO `sys_role` VALUES (5, '普通用户', 'user', '普通用户', 0, 2, '2020-02-26 15:18:52', '2020-03-21 15:16:02');
INSERT INTO `sys_role` VALUES (6, '游客', 'guest', '游客', 0, 2, '2020-02-26 15:19:49', '2020-03-21 15:16:57');
INSERT INTO `sys_role` VALUES (7, '管理员', 'admin', '管理员', 0, 3, '2020-02-26 15:18:37', '2020-03-21 15:15:54');
INSERT INTO `sys_role` VALUES (8, '普通用户', 'user', '普通用户', 0, 3, '2020-02-26 15:18:52', '2020-03-21 15:16:02');
INSERT INTO `sys_role` VALUES (9, '游客', 'guest', '游客', 0, 3, '2020-02-26 15:19:49', '2020-03-21 15:16:57');
INSERT INTO `sys_role` VALUES (10, '管理员', 'admin', '管理员', 0, 4, '2020-02-26 15:18:37', '2020-03-21 15:15:54');
INSERT INTO `sys_role` VALUES (11, '普通用户', 'user', '普通用户', 0, 4, '2020-02-26 15:18:52', '2020-03-21 15:16:02');
INSERT INTO `sys_role` VALUES (12, '游客', 'guest', '游客', 0, 4, '2020-02-26 15:19:49', '2020-03-21 15:16:57');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  `tenant_id` int(11) NOT NULL DEFAULT 1 COMMENT '租户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sys_role_permission_role`(`role_id`) USING BTREE,
  INDEX `menu_id`(`menu_id`) USING BTREE,
  INDEX `tenant_id`(`tenant_id`) USING BTREE,
  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_menu_ibfk_3` FOREIGN KEY (`tenant_id`) REFERENCES `sys_tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1972 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (315, 3, 40, 1, '2022-07-29 13:59:39', '2022-07-29 13:59:39');
INSERT INTO `sys_role_menu` VALUES (316, 3, 41, 1, '2022-07-29 13:59:39', '2022-07-29 13:59:39');
INSERT INTO `sys_role_menu` VALUES (317, 3, 42, 1, '2022-07-29 13:59:39', '2022-07-29 13:59:39');
INSERT INTO `sys_role_menu` VALUES (318, 3, 43, 1, '2022-07-29 13:59:39', '2022-07-29 13:59:39');
INSERT INTO `sys_role_menu` VALUES (338, 6, 140, 2, '2022-07-29 14:14:00', '2022-07-29 14:14:00');
INSERT INTO `sys_role_menu` VALUES (339, 6, 141, 2, '2022-07-29 14:14:00', '2022-07-29 14:14:00');
INSERT INTO `sys_role_menu` VALUES (340, 6, 142, 2, '2022-07-29 14:14:00', '2022-07-29 14:14:00');
INSERT INTO `sys_role_menu` VALUES (341, 6, 143, 2, '2022-07-29 14:14:00', '2022-07-29 14:14:00');
INSERT INTO `sys_role_menu` VALUES (594, 7, 201, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (595, 7, 202, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (596, 7, 203, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (597, 7, 207, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (598, 7, 208, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (599, 7, 212, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (600, 7, 213, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (601, 7, 217, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (602, 7, 218, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (603, 7, 222, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (604, 7, 223, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (605, 7, 227, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (606, 7, 228, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (607, 7, 232, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (608, 7, 233, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (609, 7, 234, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (610, 7, 235, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (611, 7, 236, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (612, 7, 237, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (613, 7, 238, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (614, 7, 239, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (615, 7, 240, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (616, 7, 241, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (617, 7, 242, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (618, 7, 243, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (619, 7, 244, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (620, 7, 245, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (621, 7, 246, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (622, 7, 247, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (623, 7, 248, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (624, 7, 249, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (625, 7, 250, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (626, 7, 251, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (627, 7, 252, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (628, 7, 253, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (629, 7, 254, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (630, 7, 255, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (631, 7, 256, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (632, 7, 257, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (633, 7, 258, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (634, 7, 259, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (635, 7, 260, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (636, 7, 261, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (637, 7, 262, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (638, 7, 263, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (639, 7, 264, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (640, 7, 265, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (641, 7, 266, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (642, 7, 267, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (643, 7, 268, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (644, 7, 269, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (645, 7, 270, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (646, 7, 271, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (647, 7, 272, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (648, 7, 273, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (649, 7, 274, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (650, 7, 275, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (651, 7, 276, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (652, 7, 277, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (653, 7, 278, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (654, 7, 279, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (655, 7, 280, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (656, 7, 281, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (657, 7, 282, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (658, 7, 283, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (659, 7, 284, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (660, 7, 285, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (661, 7, 286, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (662, 7, 287, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (663, 7, 288, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (664, 7, 289, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (665, 7, 290, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (666, 7, 291, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (667, 7, 292, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (668, 7, 293, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (669, 7, 294, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (670, 7, 295, 3, '2021-11-05 17:45:05', '2021-11-05 17:45:05');
INSERT INTO `sys_role_menu` VALUES (671, 8, 201, 3, '2022-07-29 14:29:41', '2022-07-29 14:29:41');
INSERT INTO `sys_role_menu` VALUES (672, 8, 202, 3, '2022-07-29 14:29:41', '2022-07-29 14:29:41');
INSERT INTO `sys_role_menu` VALUES (673, 8, 203, 3, '2022-07-29 14:29:41', '2022-07-29 14:29:41');
INSERT INTO `sys_role_menu` VALUES (674, 8, 207, 3, '2022-07-29 14:29:41', '2022-07-29 14:29:41');
INSERT INTO `sys_role_menu` VALUES (675, 8, 208, 3, '2022-07-29 14:29:41', '2022-07-29 14:29:41');
INSERT INTO `sys_role_menu` VALUES (676, 8, 212, 3, '2022-07-29 14:29:41', '2022-07-29 14:29:41');
INSERT INTO `sys_role_menu` VALUES (677, 8, 213, 3, '2022-07-29 14:29:41', '2022-07-29 14:29:41');
INSERT INTO `sys_role_menu` VALUES (678, 8, 217, 3, '2022-07-29 14:29:41', '2022-07-29 14:29:41');
INSERT INTO `sys_role_menu` VALUES (679, 8, 218, 3, '2022-07-29 14:29:41', '2022-07-29 14:29:41');
INSERT INTO `sys_role_menu` VALUES (680, 8, 222, 3, '2022-07-29 14:29:41', '2022-07-29 14:29:41');
INSERT INTO `sys_role_menu` VALUES (681, 8, 223, 3, '2022-07-29 14:29:41', '2022-07-29 14:29:41');
INSERT INTO `sys_role_menu` VALUES (682, 8, 227, 3, '2022-07-29 14:29:41', '2022-07-29 14:29:41');
INSERT INTO `sys_role_menu` VALUES (683, 8, 228, 3, '2022-07-29 14:29:41', '2022-07-29 14:29:41');
INSERT INTO `sys_role_menu` VALUES (684, 9, 236, 3, '2022-07-29 14:30:21', '2022-07-29 14:30:21');
INSERT INTO `sys_role_menu` VALUES (685, 9, 237, 3, '2022-07-29 14:30:21', '2022-07-29 14:30:21');
INSERT INTO `sys_role_menu` VALUES (686, 9, 238, 3, '2022-07-29 14:30:21', '2022-07-29 14:30:21');
INSERT INTO `sys_role_menu` VALUES (687, 9, 239, 3, '2022-07-29 14:30:21', '2022-07-29 14:30:21');
INSERT INTO `sys_role_menu` VALUES (688, 9, 240, 3, '2022-07-29 14:30:21', '2022-07-29 14:30:21');
INSERT INTO `sys_role_menu` VALUES (689, 9, 254, 3, '2022-07-29 14:30:21', '2022-07-29 14:30:21');
INSERT INTO `sys_role_menu` VALUES (816, 12, 340, 4, '2023-06-13 22:41:31', '2023-06-13 22:41:31');
INSERT INTO `sys_role_menu` VALUES (817, 12, 341, 4, '2023-06-13 22:41:31', '2023-06-13 22:41:31');
INSERT INTO `sys_role_menu` VALUES (818, 12, 342, 4, '2023-06-13 22:41:31', '2023-06-13 22:41:31');
INSERT INTO `sys_role_menu` VALUES (819, 12, 343, 4, '2023-06-13 22:41:31', '2023-06-13 22:41:31');
INSERT INTO `sys_role_menu` VALUES (1556, 10, 336, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1557, 10, 337, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1558, 10, 338, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1559, 10, 339, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1560, 10, 301, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1561, 10, 302, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1562, 10, 303, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1563, 10, 304, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1564, 10, 305, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1565, 10, 306, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1566, 10, 333, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1567, 10, 307, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1568, 10, 308, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1569, 10, 309, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1570, 10, 310, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1571, 10, 311, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1572, 10, 312, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1573, 10, 313, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1574, 10, 314, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1575, 10, 315, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1576, 10, 316, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1577, 10, 317, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1578, 10, 318, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1579, 10, 319, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1580, 10, 320, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1581, 10, 321, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1582, 10, 322, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1583, 10, 323, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1584, 10, 324, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1585, 10, 325, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1586, 10, 326, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1587, 10, 329, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1588, 10, 330, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1589, 10, 331, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1590, 10, 332, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1591, 10, 327, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1592, 10, 328, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1593, 10, 334, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1594, 10, 335, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1595, 10, 340, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1596, 10, 341, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1597, 10, 342, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1598, 10, 343, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1599, 10, 344, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1600, 10, 345, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1601, 10, 351, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1602, 10, 352, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1603, 10, 353, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1604, 10, 346, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1605, 10, 347, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1606, 10, 348, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1607, 10, 349, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1608, 10, 350, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1609, 10, 354, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1610, 10, 355, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1611, 10, 356, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1612, 10, 357, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1613, 10, 358, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1614, 10, 359, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1615, 10, 360, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1616, 10, 361, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1617, 10, 362, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1618, 10, 363, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1619, 10, 364, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1620, 10, 370, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1621, 10, 384, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1622, 10, 375, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1623, 10, 365, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1624, 10, 366, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1625, 10, 367, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1626, 10, 368, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1627, 10, 377, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1628, 10, 385, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1629, 10, 387, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1630, 10, 376, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1631, 10, 372, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1632, 10, 386, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1633, 10, 393, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1634, 10, 391, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1635, 10, 390, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1636, 10, 389, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1637, 10, 394, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1638, 10, 381, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1639, 10, 380, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1640, 10, 388, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1641, 10, 392, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1642, 10, 374, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1643, 10, 369, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1644, 10, 379, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1645, 10, 371, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1646, 10, 373, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1647, 10, 378, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1648, 10, 382, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1649, 10, 383, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1650, 10, 395, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1651, 10, 396, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1652, 10, 397, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1653, 10, 398, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1654, 10, 399, 4, '2023-06-16 11:22:08', '2023-06-16 11:22:08');
INSERT INTO `sys_role_menu` VALUES (1655, 11, 337, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1656, 11, 338, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1657, 11, 301, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1658, 11, 302, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1659, 11, 303, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1660, 11, 304, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1661, 11, 305, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1662, 11, 306, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1663, 11, 333, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1664, 11, 307, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1665, 11, 308, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1666, 11, 309, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1667, 11, 310, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1668, 11, 311, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1669, 11, 312, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1670, 11, 313, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1671, 11, 314, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1672, 11, 315, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1673, 11, 316, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1674, 11, 317, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1675, 11, 318, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1676, 11, 319, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1677, 11, 320, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1678, 11, 321, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1679, 11, 322, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1680, 11, 323, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1681, 11, 324, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1682, 11, 325, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1683, 11, 326, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1684, 11, 329, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1685, 11, 330, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1686, 11, 331, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1687, 11, 332, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1688, 11, 327, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1689, 11, 328, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1690, 11, 334, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1691, 11, 335, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1692, 11, 395, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1693, 11, 396, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1694, 11, 397, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1695, 11, 399, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1696, 11, 336, 4, '2023-06-16 11:22:36', '2023-06-16 11:22:36');
INSERT INTO `sys_role_menu` VALUES (1697, 4, 136, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1698, 4, 137, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1699, 4, 138, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1700, 4, 139, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1701, 4, 101, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1702, 4, 102, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1703, 4, 103, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1704, 4, 104, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1705, 4, 105, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1706, 4, 106, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1707, 4, 133, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1708, 4, 107, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1709, 4, 108, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1710, 4, 109, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1711, 4, 110, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1712, 4, 111, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1713, 4, 112, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1714, 4, 113, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1715, 4, 114, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1716, 4, 115, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1717, 4, 116, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1718, 4, 122, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1719, 4, 123, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1720, 4, 124, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1721, 4, 125, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1722, 4, 126, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1723, 4, 117, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1724, 4, 118, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1725, 4, 119, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1726, 4, 120, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1727, 4, 121, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1728, 4, 129, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1729, 4, 130, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1730, 4, 131, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1731, 4, 132, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1732, 4, 127, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1733, 4, 128, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1734, 4, 134, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1735, 4, 135, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1736, 4, 140, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1737, 4, 141, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1738, 4, 142, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1739, 4, 143, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1740, 4, 144, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1741, 4, 145, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1742, 4, 151, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1743, 4, 152, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1744, 4, 153, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1745, 4, 146, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1746, 4, 147, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1747, 4, 148, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1748, 4, 149, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1749, 4, 150, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1750, 4, 154, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1751, 4, 155, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1752, 4, 156, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1753, 4, 157, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1754, 4, 158, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1755, 4, 159, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1756, 4, 160, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1757, 4, 161, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1758, 4, 162, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1759, 4, 163, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1760, 4, 164, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1761, 4, 165, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1762, 4, 166, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1763, 4, 167, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1764, 4, 168, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1765, 4, 169, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1766, 4, 170, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1767, 4, 171, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1768, 4, 172, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1769, 4, 173, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1770, 4, 174, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1771, 4, 176, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1772, 4, 178, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1773, 4, 179, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1774, 4, 180, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1775, 4, 181, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1776, 4, 182, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1777, 4, 183, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1778, 4, 184, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1779, 4, 185, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1780, 4, 186, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1781, 4, 187, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1782, 4, 188, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1783, 4, 189, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1784, 4, 191, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1785, 4, 192, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1786, 4, 193, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1787, 4, 190, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1788, 4, 194, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1789, 4, 199, 2, '2023-06-16 11:24:32', '2023-06-16 11:24:32');
INSERT INTO `sys_role_menu` VALUES (1790, 5, 137, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1791, 5, 136, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1792, 5, 138, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1793, 5, 101, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1794, 5, 102, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1795, 5, 103, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1796, 5, 104, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1797, 5, 105, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1798, 5, 106, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1799, 5, 133, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1800, 5, 107, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1801, 5, 108, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1802, 5, 109, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1803, 5, 110, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1804, 5, 111, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1805, 5, 112, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1806, 5, 113, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1807, 5, 114, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1808, 5, 115, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1809, 5, 116, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1810, 5, 122, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1811, 5, 123, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1812, 5, 124, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1813, 5, 125, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1814, 5, 126, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1815, 5, 117, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1816, 5, 118, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1817, 5, 119, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1818, 5, 120, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1819, 5, 121, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1820, 5, 129, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1821, 5, 130, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1822, 5, 131, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1823, 5, 132, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1824, 5, 127, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1825, 5, 128, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1826, 5, 134, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1827, 5, 135, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1828, 5, 191, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1829, 5, 188, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1830, 5, 192, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1831, 5, 199, 2, '2023-06-16 11:25:12', '2023-06-16 11:25:12');
INSERT INTO `sys_role_menu` VALUES (1832, 1, 36, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1833, 1, 37, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1834, 1, 38, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1835, 1, 39, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1836, 1, 1, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1837, 1, 2, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1838, 1, 3, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1839, 1, 4, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1840, 1, 5, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1841, 1, 6, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1842, 1, 33, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1843, 1, 7, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1844, 1, 8, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1845, 1, 9, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1846, 1, 10, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1847, 1, 11, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1848, 1, 12, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1849, 1, 13, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1850, 1, 14, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1851, 1, 15, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1852, 1, 16, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1853, 1, 17, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1854, 1, 18, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1855, 1, 19, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1856, 1, 20, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1857, 1, 21, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1858, 1, 22, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1859, 1, 23, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1860, 1, 24, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1861, 1, 25, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1862, 1, 26, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1863, 1, 29, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1864, 1, 30, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1865, 1, 31, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1866, 1, 32, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1867, 1, 27, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1868, 1, 28, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1869, 1, 34, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1870, 1, 35, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1871, 1, 40, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1872, 1, 41, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1873, 1, 42, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1874, 1, 43, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1875, 1, 44, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1876, 1, 45, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1877, 1, 51, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1878, 1, 52, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1879, 1, 53, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1880, 1, 46, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1881, 1, 47, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1882, 1, 48, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1883, 1, 49, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1884, 1, 50, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1885, 1, 54, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1886, 1, 55, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1887, 1, 56, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1888, 1, 57, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1889, 1, 58, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1890, 1, 59, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1891, 1, 60, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1892, 1, 61, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1893, 1, 62, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1894, 1, 63, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1895, 1, 64, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1896, 1, 65, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1897, 1, 66, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1898, 1, 67, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1899, 1, 68, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1900, 1, 69, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1901, 1, 70, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1902, 1, 71, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1903, 1, 72, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1904, 1, 73, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1905, 1, 74, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1906, 1, 75, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1907, 1, 76, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1908, 1, 77, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1909, 1, 78, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1910, 1, 79, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1911, 1, 80, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1912, 1, 82, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1913, 1, 83, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1914, 1, 84, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1915, 1, 85, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1916, 1, 86, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1917, 1, 87, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1918, 1, 88, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1919, 1, 89, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1920, 1, 97, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1921, 1, 98, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1922, 1, 90, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1923, 1, 91, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1924, 1, 92, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1925, 1, 93, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1926, 1, 94, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1927, 1, 95, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1928, 1, 96, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1929, 1, 99, 1, '2023-06-16 11:27:23', '2023-06-16 11:27:23');
INSERT INTO `sys_role_menu` VALUES (1930, 2, 37, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1931, 2, 38, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1932, 2, 1, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1933, 2, 2, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1934, 2, 3, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1935, 2, 4, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1936, 2, 5, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1937, 2, 6, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1938, 2, 33, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1939, 2, 7, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1940, 2, 8, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1941, 2, 9, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1942, 2, 10, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1943, 2, 11, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1944, 2, 12, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1945, 2, 13, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1946, 2, 14, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1947, 2, 15, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1948, 2, 16, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1949, 2, 17, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1950, 2, 18, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1951, 2, 19, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1952, 2, 20, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1953, 2, 21, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1954, 2, 22, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1955, 2, 23, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1956, 2, 24, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1957, 2, 25, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1958, 2, 26, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1959, 2, 29, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1960, 2, 30, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1961, 2, 31, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1962, 2, 32, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1963, 2, 27, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1964, 2, 28, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1965, 2, 34, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1966, 2, 35, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1967, 2, 93, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1968, 2, 94, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1969, 2, 99, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1970, 2, 36, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');
INSERT INTO `sys_role_menu` VALUES (1971, 2, 90, 1, '2023-06-16 11:27:47', '2023-06-16 11:27:47');

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `tenant_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '租户id',
  `tenant_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户名称',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除, 0否, 1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (1, 'Pqdmin', NULL, 0, '2021-08-25 13:33:33', '2021-10-13 21:44:52');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `email_verified` int(1) NOT NULL DEFAULT 0 COMMENT '邮箱是否验证, 0否, 1是',
  `real_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `introduction` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `organization_id` int(11) NULL DEFAULT NULL COMMENT '机构id',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态, 0正常, 1冻结',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除, 0否, 1是',
  `tenant_id` int(11) NOT NULL DEFAULT 1 COMMENT '租户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `organization_id`(`organization_id`) USING BTREE,
  INDEX `tenant_id`(`tenant_id`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `sys_organization` (`organization_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `sys_user_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `sys_tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$sWH.qQmf/dHMURzE4kN0puBOdB7VWwcDFB2NvwpMaHYz6OFZwQGBy', '管理员', 'https://avatars.githubusercontent.com/u/73225494?v=4', 1, '18239989602', NULL, 0, NULL, NULL, '2021-05-21', '山不在高有仙则名，水不在深有龙则灵！', 1, 0, 0, 1, '2020-01-13 14:43:52', '2023-02-06 09:05:19');
INSERT INTO `sys_user` VALUES (2, 'user01', '$2a$10$y3j0Bnn4cMOErMLv31LUw.Drs/xs1peDQwT7YYHJbFX6xGDQcXUaK', '用户一', NULL, 2, '12345678902', NULL, 0, NULL, NULL, NULL, NULL, 1, 0, 0, 1, '2020-09-15 17:49:37', '2023-02-06 09:04:21');
INSERT INTO `sys_user` VALUES (3, 'user02', '$2a$10$fF2qbzA1.zIOUZpedxtvoubQ9doxlSNSunGQLwYxnvSqM8Wx6AeGC', '用户二', NULL, 1, '12345678903', NULL, 0, NULL, NULL, NULL, NULL, 1, 0, 0, 1, '2020-09-15 17:50:20', '2023-02-06 09:04:22');
INSERT INTO `sys_user` VALUES (4, 'user03', '$2a$10$iP1vojXrDgjTaU6ZY3dGfefXGmyftJbPhTuU7cWBxkNI3w20WwZOW', '用户三', NULL, 2, '12345678904', NULL, 0, NULL, NULL, NULL, NULL, 1, 0, 0, 1, '2020-09-15 17:50:51', '2023-02-06 09:04:24');
INSERT INTO `sys_user` VALUES (5, 'user04', '$2a$10$iMsEmh.rPlzwy/SVe6KW3.62vlwqMJpibhCF9jYN.fMqxdqymzMzu', '用户四', NULL, 1, '12345678905', NULL, 0, NULL, NULL, NULL, NULL, 2, 0, 0, 1, '2020-09-15 17:51:50', '2023-02-06 09:04:26');
INSERT INTO `sys_user` VALUES (6, 'user05', '$2a$10$6bdw9kiSq6cefcwN1nvcyOyWxgKxNipVsR7M1QvmG9pPZ4ggldr4a', '用户五', NULL, 2, '12345678906', NULL, 0, NULL, NULL, NULL, NULL, 2, 0, 0, 1, '2020-09-15 17:52:22', '2023-02-06 09:04:28');
INSERT INTO `sys_user` VALUES (7, 'user06', '$2a$10$fKDoXZPU43tiFxXyzPXcu.kCpiv9ACtlgkxFeB/NBl4ti7GqI.EE.', '用户六', NULL, 1, '12345678907', NULL, 0, NULL, NULL, NULL, NULL, 2, 0, 0, 1, '2020-09-15 17:53:31', '2023-02-06 09:04:29');
INSERT INTO `sys_user` VALUES (8, 'user07', '$2a$10$R4JW6t3GK7fz3B830WsRI.uoW5LZq9EG.VAopRyKXVemXDkpybYni', '用户七', NULL, 1, '12345678908', NULL, 0, NULL, NULL, NULL, NULL, 3, 0, 0, 1, '2020-10-20 23:28:40', '2023-02-06 09:04:31');
INSERT INTO `sys_user` VALUES (9, 'user08', '$2a$10$EhZLneJiZjVd3qWXpiUXV.OC3mtTMNLepIjhUyQzgPqtvpBclMCm2', '用户八', NULL, 2, '12345678909', NULL, 0, NULL, NULL, NULL, NULL, 3, 1, 0, 1, '2020-10-20 23:29:03', '2023-02-06 09:04:33');
INSERT INTO `sys_user` VALUES (10, 'user09', '$2a$10$jP8jv8A.uVSfKFzVpoNgmetdTK9pMAMjJh5wEQLH.sFVdMDILaXMS', '用户九', NULL, 2, '12345678910', NULL, 0, NULL, NULL, NULL, NULL, 4, 0, 0, 1, '2020-10-20 23:29:30', '2023-02-06 09:04:35');
INSERT INTO `sys_user` VALUES (11, 'user10', '$2a$10$R/2v6h8bRhYsgryPwzgv8eFBl3jnALsqJ/O7DRHzLxuU/.T/JqO96', '用户十', NULL, 1, '12345678911', NULL, 0, NULL, NULL, NULL, NULL, 4, 1, 0, 1, '2020-10-20 23:29:55', '2023-02-06 09:04:38');
INSERT INTO `sys_user` VALUES (12, 'user11', '$2a$10$mR4uT3Qley1UkXm6zJ4zd.OMXzUovwCYX52eFVC80FwCrkDeFwYl6', '用户十一', NULL, 1, '12345678912', NULL, 0, NULL, NULL, NULL, NULL, 5, 0, 0, 1, '2020-10-20 23:30:28', '2023-02-06 09:04:36');
INSERT INTO `sys_user` VALUES (13, 'user12', '$2a$10$UveBloenMd4weP/6fHIkeeYZqPWNS6Y0NRxRGwXA1KzmwycklSAqa', '用户十二', NULL, 2, '12345678913', NULL, 0, NULL, NULL, NULL, NULL, 6, 0, 0, 1, '2020-10-20 23:30:53', '2023-02-06 09:04:40');
INSERT INTO `sys_user` VALUES (14, 'admin', '$2a$10$sWH.qQmf/dHMURzE4kN0puBOdB7VWwcDFB2NvwpMaHYz6OFZwQGBy', '管理员', 'https://avatars.githubusercontent.com/u/73225494?v=4', 1, '12345678901', NULL, 0, NULL, NULL, '2021-05-21', '遗其欲，则心静！', 11, 0, 0, 2, '2020-01-13 14:43:52', '2023-02-06 09:06:51');
INSERT INTO `sys_user` VALUES (15, 'user01', '$2a$10$y3j0Bnn4cMOErMLv31LUw.Drs/xs1peDQwT7YYHJbFX6xGDQcXUaK', '用户一', NULL, 2, '12345678902', NULL, 0, NULL, NULL, NULL, NULL, 11, 0, 0, 2, '2020-09-15 17:49:37', '2023-02-06 09:06:28');
INSERT INTO `sys_user` VALUES (16, 'user02', '$2a$10$fF2qbzA1.zIOUZpedxtvoubQ9doxlSNSunGQLwYxnvSqM8Wx6AeGC', '用户二', NULL, 1, '12345678903', NULL, 0, NULL, NULL, NULL, NULL, 11, 0, 0, 2, '2020-09-15 17:50:20', '2023-02-06 09:06:30');
INSERT INTO `sys_user` VALUES (17, 'user03', '$2a$10$iP1vojXrDgjTaU6ZY3dGfefXGmyftJbPhTuU7cWBxkNI3w20WwZOW', '用户三', NULL, 2, '12345678904', NULL, 0, NULL, NULL, NULL, NULL, 11, 0, 0, 2, '2020-09-15 17:50:51', '2023-02-06 09:06:31');
INSERT INTO `sys_user` VALUES (18, 'user04', '$2a$10$iMsEmh.rPlzwy/SVe6KW3.62vlwqMJpibhCF9jYN.fMqxdqymzMzu', '用户四', NULL, 1, '12345678905', NULL, 0, NULL, NULL, NULL, NULL, 12, 0, 0, 2, '2020-09-15 17:51:50', '2023-02-06 09:06:33');
INSERT INTO `sys_user` VALUES (19, 'user05', '$2a$10$6bdw9kiSq6cefcwN1nvcyOyWxgKxNipVsR7M1QvmG9pPZ4ggldr4a', '用户五', NULL, 2, '12345678906', NULL, 0, NULL, NULL, NULL, NULL, 12, 0, 0, 2, '2020-09-15 17:52:22', '2023-02-06 09:06:34');
INSERT INTO `sys_user` VALUES (20, 'user06', '$2a$10$fKDoXZPU43tiFxXyzPXcu.kCpiv9ACtlgkxFeB/NBl4ti7GqI.EE.', '用户六', NULL, 1, '12345678907', NULL, 0, NULL, NULL, NULL, NULL, 12, 0, 0, 2, '2020-09-15 17:53:31', '2023-02-06 09:06:36');
INSERT INTO `sys_user` VALUES (21, 'user07', '$2a$10$R4JW6t3GK7fz3B830WsRI.uoW5LZq9EG.VAopRyKXVemXDkpybYni', '用户七', NULL, 1, '12345678908', NULL, 0, NULL, NULL, NULL, NULL, 13, 0, 0, 2, '2020-10-20 23:28:40', '2023-02-06 09:06:38');
INSERT INTO `sys_user` VALUES (22, 'user08', '$2a$10$EhZLneJiZjVd3qWXpiUXV.OC3mtTMNLepIjhUyQzgPqtvpBclMCm2', '用户八', NULL, 2, '12345678909', NULL, 0, NULL, NULL, NULL, NULL, 13, 1, 0, 2, '2020-10-20 23:29:03', '2023-02-06 09:06:40');
INSERT INTO `sys_user` VALUES (23, 'user09', '$2a$10$jP8jv8A.uVSfKFzVpoNgmetdTK9pMAMjJh5wEQLH.sFVdMDILaXMS', '用户九', NULL, 2, '12345678910', NULL, 0, NULL, NULL, NULL, NULL, 14, 0, 0, 2, '2020-10-20 23:29:30', '2023-02-06 09:06:41');
INSERT INTO `sys_user` VALUES (24, 'user10', '$2a$10$R/2v6h8bRhYsgryPwzgv8eFBl3jnALsqJ/O7DRHzLxuU/.T/JqO96', '用户十', NULL, 1, '12345678911', NULL, 0, NULL, NULL, NULL, NULL, 14, 1, 0, 2, '2020-10-20 23:29:55', '2023-02-06 09:06:44');
INSERT INTO `sys_user` VALUES (25, 'user11', '$2a$10$mR4uT3Qley1UkXm6zJ4zd.OMXzUovwCYX52eFVC80FwCrkDeFwYl6', '用户十一', NULL, 1, '12345678912', NULL, 0, NULL, NULL, NULL, NULL, 15, 0, 0, 2, '2020-10-20 23:30:28', '2023-02-06 09:06:46');
INSERT INTO `sys_user` VALUES (26, 'user12', '$2a$10$UveBloenMd4weP/6fHIkeeYZqPWNS6Y0NRxRGwXA1KzmwycklSAqa', '用户十二', NULL, 2, '12345678913', NULL, 0, NULL, NULL, NULL, NULL, 16, 0, 0, 2, '2020-10-20 23:30:53', '2023-02-06 09:06:49');
INSERT INTO `sys_user` VALUES (27, 'admin', '$2a$10$sWH.qQmf/dHMURzE4kN0puBOdB7VWwcDFB2NvwpMaHYz6OFZwQGBy', '管理员', 'https://avatars.githubusercontent.com/u/73225494?v=4', 2, '12345678901', 'pqadmin@163.com', 0, NULL, NULL, '2021-05-21', '遗其欲，则心静！', 21, 0, 0, 3, '2020-01-13 14:43:52', '2023-04-10 15:08:51');
INSERT INTO `sys_user` VALUES (28, 'user01', '$2a$10$y3j0Bnn4cMOErMLv31LUw.Drs/xs1peDQwT7YYHJbFX6xGDQcXUaK', '用户一', NULL, 2, '12345678902', NULL, 0, NULL, NULL, NULL, NULL, 21, 0, 0, 3, '2020-09-15 17:49:37', '2023-03-18 09:35:41');
INSERT INTO `sys_user` VALUES (29, 'user02', '$2a$10$fF2qbzA1.zIOUZpedxtvoubQ9doxlSNSunGQLwYxnvSqM8Wx6AeGC', '用户二', NULL, 1, '12345678903', NULL, 0, NULL, NULL, NULL, NULL, 21, 0, 0, 3, '2020-09-15 17:50:20', '2023-02-06 09:10:16');
INSERT INTO `sys_user` VALUES (30, 'user03', '$2a$10$iP1vojXrDgjTaU6ZY3dGfefXGmyftJbPhTuU7cWBxkNI3w20WwZOW', '用户三', NULL, 2, '12345678904', NULL, 0, NULL, NULL, NULL, NULL, 21, 0, 0, 3, '2020-09-15 17:50:51', '2023-02-28 16:35:11');
INSERT INTO `sys_user` VALUES (31, 'user04', '$2a$10$iMsEmh.rPlzwy/SVe6KW3.62vlwqMJpibhCF9jYN.fMqxdqymzMzu', '用户四', NULL, 1, '12345678905', NULL, 0, NULL, NULL, NULL, NULL, 22, 0, 0, 3, '2020-09-15 17:51:50', '2023-02-06 09:10:19');
INSERT INTO `sys_user` VALUES (32, 'user05', '$2a$10$6bdw9kiSq6cefcwN1nvcyOyWxgKxNipVsR7M1QvmG9pPZ4ggldr4a', '用户五', NULL, 2, '12345678906', NULL, 0, NULL, NULL, NULL, NULL, 22, 0, 0, 3, '2020-09-15 17:52:22', '2023-02-06 09:10:21');
INSERT INTO `sys_user` VALUES (33, 'user06', '$2a$10$fKDoXZPU43tiFxXyzPXcu.kCpiv9ACtlgkxFeB/NBl4ti7GqI.EE.', '用户六', NULL, 1, '12345678907', NULL, 0, NULL, NULL, NULL, NULL, 22, 0, 0, 3, '2020-09-15 17:53:31', '2023-02-06 09:10:23');
INSERT INTO `sys_user` VALUES (34, 'user07', '$2a$10$R4JW6t3GK7fz3B830WsRI.uoW5LZq9EG.VAopRyKXVemXDkpybYni', '用户七', NULL, 1, '12345678908', NULL, 0, NULL, NULL, NULL, NULL, 23, 0, 0, 3, '2020-10-20 23:28:40', '2023-02-06 09:10:25');
INSERT INTO `sys_user` VALUES (35, 'user08', '$2a$10$AFQ5PLZCf.Y1N9vqoNIJouTTdydXyogoc3AG.7eJylS1LCSJnt7JW', '用户八', NULL, 2, '12345678909', NULL, 0, NULL, NULL, NULL, NULL, 23, 1, 0, 3, '2020-10-20 23:29:03', '2023-04-10 17:43:34');
INSERT INTO `sys_user` VALUES (36, 'user09', '$2a$10$jP8jv8A.uVSfKFzVpoNgmetdTK9pMAMjJh5wEQLH.sFVdMDILaXMS', '用户九', NULL, 2, '12345678910', NULL, 0, NULL, NULL, NULL, NULL, 24, 0, 0, 3, '2020-10-20 23:29:30', '2023-02-06 09:10:29');
INSERT INTO `sys_user` VALUES (37, 'user10', '$2a$10$NUC0kr7w91XBwsQivqALF.9STqNUgr2X7jtArwkfVba7meNfWxYn6', '用户十', NULL, 1, '12345678911', NULL, 0, NULL, NULL, NULL, NULL, 24, 1, 0, 3, '2020-10-20 23:29:55', '2023-04-11 22:05:46');
INSERT INTO `sys_user` VALUES (38, 'user11', '$2a$10$mR4uT3Qley1UkXm6zJ4zd.OMXzUovwCYX52eFVC80FwCrkDeFwYl6', '用户十一', NULL, 1, '12345678912', NULL, 0, NULL, NULL, NULL, NULL, 25, 0, 0, 3, '2020-10-20 23:30:28', '2023-02-06 09:10:32');
INSERT INTO `sys_user` VALUES (39, 'user12', '$2a$10$UveBloenMd4weP/6fHIkeeYZqPWNS6Y0NRxRGwXA1KzmwycklSAqa', '用户十二', NULL, 2, '12345678913', NULL, 0, NULL, NULL, NULL, NULL, 26, 0, 0, 3, '2020-10-20 23:30:53', '2023-03-06 15:51:07');
INSERT INTO `sys_user` VALUES (40, 'admin', '$2a$10$sWH.qQmf/dHMURzE4kN0puBOdB7VWwcDFB2NvwpMaHYz6OFZwQGBy', '管理员', 'https://avatars.githubusercontent.com/u/73225494?v=4', 2, '12345678901', 'eleadmin@eclouds.com', 0, NULL, NULL, '2021-05-21', '遗其欲，则心静！', 31, 0, 0, 4, '2020-01-13 14:43:52', '2023-04-10 15:08:51');
INSERT INTO `sys_user` VALUES (41, 'user01', '$2a$10$y3j0Bnn4cMOErMLv31LUw.Drs/xs1peDQwT7YYHJbFX6xGDQcXUaK', '用户一', 'https://avatars.githubusercontent.com/u/73225494?v=4', 2, '12345678902', NULL, 0, NULL, NULL, NULL, NULL, 31, 0, 0, 4, '2020-09-15 17:49:37', '2023-06-15 00:37:45');
INSERT INTO `sys_user` VALUES (42, 'user02', '$2a$10$fF2qbzA1.zIOUZpedxtvoubQ9doxlSNSunGQLwYxnvSqM8Wx6AeGC', '用户二', NULL, 1, '12345678903', NULL, 0, NULL, NULL, NULL, NULL, 31, 0, 0, 4, '2020-09-15 17:50:20', '2023-05-24 23:21:38');
INSERT INTO `sys_user` VALUES (43, 'user03', '$2a$10$iP1vojXrDgjTaU6ZY3dGfefXGmyftJbPhTuU7cWBxkNI3w20WwZOW', '用户三', NULL, 2, '12345678904', NULL, 0, NULL, NULL, NULL, NULL, 31, 0, 0, 4, '2020-09-15 17:50:51', '2023-06-02 00:11:21');
INSERT INTO `sys_user` VALUES (44, 'user04', '$2a$10$iMsEmh.rPlzwy/SVe6KW3.62vlwqMJpibhCF9jYN.fMqxdqymzMzu', '用户四', NULL, 1, '12345678905', NULL, 0, NULL, NULL, NULL, NULL, 32, 0, 0, 4, '2020-09-15 17:51:50', '2023-02-06 09:10:19');
INSERT INTO `sys_user` VALUES (45, 'user05', '$2a$10$6bdw9kiSq6cefcwN1nvcyOyWxgKxNipVsR7M1QvmG9pPZ4ggldr4a', '用户五', NULL, 2, '12345678906', NULL, 0, NULL, NULL, NULL, NULL, 32, 0, 0, 4, '2020-09-15 17:52:22', '2023-02-06 09:10:21');
INSERT INTO `sys_user` VALUES (46, 'user06', '$2a$10$fKDoXZPU43tiFxXyzPXcu.kCpiv9ACtlgkxFeB/NBl4ti7GqI.EE.', '用户六', NULL, 1, '12345678907', NULL, 0, NULL, NULL, NULL, NULL, 32, 0, 0, 4, '2020-09-15 17:53:31', '2023-02-06 09:10:23');
INSERT INTO `sys_user` VALUES (47, 'user07', '$2a$10$R4JW6t3GK7fz3B830WsRI.uoW5LZq9EG.VAopRyKXVemXDkpybYni', '用户七', NULL, 1, '12345678908', NULL, 0, NULL, NULL, NULL, NULL, 33, 0, 0, 4, '2020-10-20 23:28:40', '2023-02-06 09:10:25');
INSERT INTO `sys_user` VALUES (48, 'user08', '$2a$10$AFQ5PLZCf.Y1N9vqoNIJouTTdydXyogoc3AG.7eJylS1LCSJnt7JW', '用户八', NULL, 2, '12345678909', NULL, 0, NULL, NULL, NULL, NULL, 33, 1, 0, 4, '2020-10-20 23:29:03', '2023-06-13 21:57:35');
INSERT INTO `sys_user` VALUES (49, 'user09', '$2a$10$jP8jv8A.uVSfKFzVpoNgmetdTK9pMAMjJh5wEQLH.sFVdMDILaXMS', '用户九', NULL, 2, '12345678910', NULL, 0, NULL, NULL, NULL, NULL, 34, 0, 0, 4, '2020-10-20 23:29:30', '2023-02-06 09:10:29');
INSERT INTO `sys_user` VALUES (50, 'user10', '$2a$10$NUC0kr7w91XBwsQivqALF.9STqNUgr2X7jtArwkfVba7meNfWxYn6', '用户十', NULL, 1, '12345678911', NULL, 0, NULL, NULL, NULL, NULL, 34, 1, 0, 4, '2020-10-20 23:29:55', '2023-06-13 23:03:56');
INSERT INTO `sys_user` VALUES (51, 'user11', '$2a$10$mR4uT3Qley1UkXm6zJ4zd.OMXzUovwCYX52eFVC80FwCrkDeFwYl6', '用户十一', NULL, 1, '12345678912', NULL, 0, NULL, NULL, NULL, NULL, 35, 0, 0, 4, '2020-10-20 23:30:28', '2023-06-13 23:04:05');
INSERT INTO `sys_user` VALUES (52, 'user12', '$2a$10$UveBloenMd4weP/6fHIkeeYZqPWNS6Y0NRxRGwXA1KzmwycklSAqa', '用户十二', NULL, 2, '12345678913', NULL, 0, NULL, NULL, NULL, NULL, 36, 0, 0, 4, '2020-10-20 23:30:53', '2023-06-11 22:49:13');

-- ----------------------------
-- Table structure for sys_user_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_file`;
CREATE TABLE `sys_user_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `is_directory` int(11) NULL DEFAULT NULL COMMENT '是否是文件夹',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '上级id',
  `path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `length` int(11) NULL DEFAULT NULL COMMENT '文件大小',
  `content_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `deleted` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除, 0否, 1是',
  `tenant_id` int(11) NOT NULL DEFAULT 1 COMMENT '租户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户文件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_file
-- ----------------------------
INSERT INTO `sys_user_file` VALUES (1, 1, '我的图片', 1, 0, NULL, NULL, NULL, 0, 1, '2022-07-22 11:28:02', '2022-07-22 16:08:28');
INSERT INTO `sys_user_file` VALUES (2, 1, '我的文件', 1, 0, NULL, NULL, NULL, 0, 1, '2022-07-22 11:28:09', '2022-07-22 16:08:30');
INSERT INTO `sys_user_file` VALUES (3, 1, 'avatar.jpg', 0, 0, '20220722/19b623b787514f8eb7d1e8edf2e9ff15.jpg', 12805, 'image/jpeg', 0, 1, '2022-07-22 11:28:16', '2022-07-22 16:08:31');
INSERT INTO `sys_user_file` VALUES (4, 1, 'logo.svg', 0, 0, '20220722/e77995c100de46409cce84e848a63f7d.svg', 1605, 'image/svg+xml', 0, 1, '2022-07-22 11:28:21', '2022-07-22 16:08:32');
INSERT INTO `sys_user_file` VALUES (5, 1, 'favicon.ico', 0, 0, '20220722/acb31ddb5ce44530933c48741c3bbfe2.ico', 4286, 'image/vnd.microsoft.icon', 0, 1, '2022-07-22 11:29:11', '2022-07-22 16:08:32');
INSERT INTO `sys_user_file` VALUES (6, 1, '用户导入模板.xlsx', 0, 0, '20220722/b4fa501bf6084f2e8bed971e68462ce3.xlsx', 10221, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 0, 1, '2022-07-22 11:29:24', '2022-07-22 16:08:35');
INSERT INTO `sys_user_file` VALUES (7, 1, 'classes.json', 0, 0, '20220722/8d59c7d48453444d9ee84bd2b4c27a12.json', 6789, 'application/json', 0, 1, '2022-07-22 11:29:28', '2022-07-22 16:08:34');
INSERT INTO `sys_user_file` VALUES (8, 1, '壁纸', 1, 1, NULL, NULL, NULL, 0, 1, '2022-07-22 11:30:58', '2022-07-22 16:08:36');
INSERT INTO `sys_user_file` VALUES (9, 1, '头像', 1, 1, NULL, NULL, NULL, 0, 1, '2022-07-22 11:31:02', '2022-07-22 16:08:37');
INSERT INTO `sys_user_file` VALUES (10, 1, 'pro202012301.png', 0, 1, '20220722/4cbac74d9c5c45858854b24ee5db8e87.png', 59257, 'image/png', 0, 1, '2022-07-22 11:34:39', '2022-07-22 16:08:37');
INSERT INTO `sys_user_file` VALUES (11, 1, 'pro202012302.png', 0, 1, '20220722/24ba2b0906f64394ae0fb5e8f813cb30.png', 64832, 'image/png', 0, 1, '2022-07-22 11:34:43', '2022-07-22 16:08:38');
INSERT INTO `sys_user_file` VALUES (12, 1, 'pro202012303.png', 0, 1, '20220722/9d269d1fe7294ea4b5ca6f11c6ac8a95.png', 74518, 'image/png', 0, 1, '2022-07-22 11:34:47', '2022-07-22 16:08:39');
INSERT INTO `sys_user_file` VALUES (13, 1, 'eleadmin20201020172822.png', 0, 1, '20220722/45c686ab54264822963bc40716222591.png', 103558, 'image/png', 0, 1, '2022-07-22 13:02:52', '2022-07-22 16:08:39');
INSERT INTO `sys_user_file` VALUES (14, 1, 'RZ8FQmZfHkcffMlTBCJllBFjEhEsObVo.jpg', 0, 8, '20220722/099d2f77dfad41c7af776ad81af7aab5.jpg', 38206, 'image/jpeg', 0, 1, '2022-07-22 13:34:41', '2022-07-22 16:08:40');
INSERT INTO `sys_user_file` VALUES (15, 1, 'WLXm7gp1EbLDtvVQgkeQeyq5OtDm00Jd.jpg', 0, 8, '20220722/faf7fec118824f309fb66961866d9712.jpg', 60365, 'image/jpeg', 0, 1, '2022-07-22 13:34:49', '2022-07-22 16:08:41');
INSERT INTO `sys_user_file` VALUES (16, 1, '4Z0QR2L0J1XStxBh99jVJ8qLfsGsOgjU.jpg', 0, 8, '20220722/d845f1a4e91143dc81ec9fa96ce6f074.jpg', 50118, 'image/jpeg', 0, 1, '2022-07-22 13:34:54', '2022-07-22 16:08:42');
INSERT INTO `sys_user_file` VALUES (17, 1, 'ttkIjNPlVDuv4lUTvRX8GIlM2QqSe0jg.jpg', 0, 8, '20220722/4fc98decedcb4029bc954369c5e8c294.jpg', 29948, 'image/jpeg', 0, 1, '2022-07-22 13:35:03', '2022-07-22 16:08:42');
INSERT INTO `sys_user_file` VALUES (18, 1, 'fAenQ8nvRjL7x0i0jEfuDBZHvJfHf3v6.jpg', 0, 8, '20220722/9787d2f5b37d4813a48b72e950d00395.jpg', 48228, 'image/jpeg', 0, 1, '2022-07-22 13:35:08', '2022-07-22 16:08:43');
INSERT INTO `sys_user_file` VALUES (19, 1, 'LrCTN2j94lo9N7wEql7cBr1Ux4rHMvmZ.jpg', 0, 8, '20220722/9dacd9d48efa483ab204ae8ad0b60864.jpg', 37320, 'image/jpeg', 0, 1, '2022-07-22 13:35:12', '2022-07-22 16:08:43');
INSERT INTO `sys_user_file` VALUES (20, 1, 'yeKvhT20lMU0f1T3Y743UlGEOLLnZSnp.jpg', 0, 8, '20220722/f74da7fd19524bc0a4e75e6159d041ac.jpg', 29040, 'image/jpeg', 0, 1, '2022-07-22 13:35:17', '2022-07-22 16:08:44');
INSERT INTO `sys_user_file` VALUES (21, 1, 'CyrCNmTJfv7D6GFAg39bjT3eRkkRm5dI.jpg', 0, 8, '20220722/7539f0f90c4749cbbb56b111e2b8d6af.jpg', 39560, 'image/jpeg', 0, 1, '2022-07-22 13:35:26', '2022-07-22 16:08:45');
INSERT INTO `sys_user_file` VALUES (22, 1, 'faa0202700ee455b90fe77d8bef98bc0.jpg', 0, 9, '20220722/5079a6bc43b64bf2b86b87275dfaf7a2.jpg', 10250, 'image/jpeg', 0, 1, '2022-07-22 13:36:21', '2022-07-22 16:08:45');
INSERT INTO `sys_user_file` VALUES (23, 1, 'fe9196dd091e438fba115205c1003ee7.jpg', 0, 9, '20220722/db6740d4bb6e4938a8ce502a6af4554d.jpg', 10726, 'image/jpeg', 0, 1, '2022-07-22 13:36:34', '2022-07-22 16:08:46');
INSERT INTO `sys_user_file` VALUES (24, 1, '21222950dc174485b2ec5088435a46a3.jpg', 0, 9, '20220722/ef84d66c378549e7807b98b64282d222.jpg', 15201, 'image/jpeg', 0, 1, '2022-07-22 13:37:49', '2022-07-22 16:08:47');
INSERT INTO `sys_user_file` VALUES (25, 1, 'adb3ad5e05614fd2a59cf886ffc37f74.jpg', 0, 9, '20220722/c326e31373084a83a99387ac7929ecc7.jpg', 12782, 'image/jpeg', 0, 1, '2022-07-22 13:37:53', '2022-07-22 16:08:47');
INSERT INTO `sys_user_file` VALUES (26, 1, 'b3ce64e10db7497b8b9f5a31df1b4eb2.jpg', 0, 9, '20220722/2f5d639d26e0478ea50935edde4fd229.jpg', 13086, 'image/jpeg', 0, 1, '2022-07-22 13:37:56', '2022-07-22 16:08:48');
INSERT INTO `sys_user_file` VALUES (27, 1, 'b6a811873e704db49db994053a5019b2.jpg', 0, 9, '20220722/8da9136eed1f41cb8d4907cb77199ca5.jpg', 12591, 'image/jpeg', 0, 1, '2022-07-22 13:38:00', '2022-07-22 16:08:49');
INSERT INTO `sys_user_file` VALUES (28, 1, 'be7dc0c24fc342fda44e12a2c2a2b7bb.jpg', 0, 9, '20220722/2576207113104107935e743b5d5cd52a.jpg', 13554, 'image/jpeg', 0, 1, '2022-07-22 13:38:09', '2022-07-22 16:08:49');
INSERT INTO `sys_user_file` VALUES (29, 1, 'c184eef391ae48dba87e3057e70238fb.jpg', 0, 9, '20220722/15528efcdd1042ad8fce23d0f36905df.jpg', 17857, 'image/jpeg', 0, 1, '2022-07-22 13:38:15', '2022-07-22 16:08:50');
INSERT INTO `sys_user_file` VALUES (30, 1, 'd3519518b00d42d3936b2ab5ce3a4cc3.jpg', 0, 9, '20220722/6b8cfc0ee93144d680375a5c588da1e4.jpg', 10333, 'image/jpeg', 0, 1, '2022-07-22 13:38:22', '2022-07-22 16:08:51');
INSERT INTO `sys_user_file` VALUES (31, 1, '8931360b593040238d894a542c9037bc.jpg', 0, 9, '20220722/0e88d170dc284263898422dba5de257c.jpg', 10377, 'image/jpeg', 0, 1, '2022-07-22 13:38:26', '2022-07-22 16:08:52');
INSERT INTO `sys_user_file` VALUES (32, 1, 'e36594e7423147748b2592ccb720ae9e.jpg', 0, 9, '20220722/14a5f30c639b450c9ac7c01bb18b26b5.jpg', 12451, 'image/jpeg', 0, 1, '2022-07-22 13:39:16', '2022-07-22 16:08:58');
INSERT INTO `sys_user_file` VALUES (33, 1, 'f6bc05af944a4f738b54128717952107.jpg', 0, 9, '20220722/d67c079e3f41407c826ef9a110145d49.jpg', 11724, 'image/jpeg', 0, 1, '2022-07-22 13:39:20', '2022-07-22 16:08:59');
INSERT INTO `sys_user_file` VALUES (34, 1, '0568caaf0a7e41dda2d901d4ac2f3243.jpg', 0, 9, '20220722/b8f43e929d6048a7b6354b0fe4fae440.jpg', 24290, 'image/jpeg', 0, 1, '2022-07-22 13:39:24', '2022-07-22 16:08:59');
INSERT INTO `sys_user_file` VALUES (35, 1, '0bfaa58e801b47fb9f56dcb128206d94.jpg', 0, 9, '20220722/ebc5a81452694c6787b4e77ea579a12f.jpg', 4578, 'image/jpeg', 0, 1, '2022-07-22 13:39:28', '2022-07-22 16:09:00');
INSERT INTO `sys_user_file` VALUES (36, 1, '12b3d575a2a24e0789a014bd6ce7585b.jpg', 0, 9, '20220722/1ba37747d5014a5e9f6f0de5771326c9.jpg', 20909, 'image/jpeg', 0, 1, '2022-07-22 13:39:32', '2022-07-22 16:09:01');
INSERT INTO `sys_user_file` VALUES (37, 1, '2d98970a51b34b6b859339c96b240dcd.jpg', 0, 9, '20220722/6389dd41857b499a93ce3c5ce050da45.jpg', 11855, 'image/jpeg', 0, 1, '2022-07-22 13:39:36', '2022-07-22 16:09:02');
INSERT INTO `sys_user_file` VALUES (38, 1, '3cc0f65fefbe448191aa728d80f6b97e.jpg', 0, 9, '20220722/bc90af738f2641abb497092781055030.jpg', 15237, 'image/jpeg', 0, 1, '2022-07-22 13:39:40', '2022-07-22 16:09:02');
INSERT INTO `sys_user_file` VALUES (39, 1, '41d81834e87546f49d3ff48c3806ea92.jpg', 0, 9, '20220722/d08de988712a40e2b315ddbff750e730.jpg', 10983, 'image/jpeg', 0, 1, '2022-07-22 13:39:45', '2022-07-22 16:09:03');
INSERT INTO `sys_user_file` VALUES (40, 1, '4e60a84551fa48439bf42ecdb9673331.jpg', 0, 9, '20220722/5f5d6d56e4a74744906c542685770c28.jpg', 12075, 'image/jpeg', 0, 1, '2022-07-22 13:39:49', '2022-07-22 16:09:04');
INSERT INTO `sys_user_file` VALUES (41, 1, '66e6f6c60cfa44b288d6343027b544d0.jpg', 0, 9, '20220722/da9cb7ee91c04dedb462aebaa9321e15.jpg', 8346, 'image/jpeg', 0, 1, '2022-07-22 13:39:53', '2022-07-22 16:09:04');
INSERT INTO `sys_user_file` VALUES (42, 1, 'd6442cfa99b64b51aabfc470055b05dc.jpg', 0, 9, '20220722/b4fa02e6f1834586a05cede521394960.jpg', 14678, 'image/jpeg', 0, 1, '2022-07-22 13:39:58', '2022-07-22 16:09:05');
INSERT INTO `sys_user_file` VALUES (43, 1, '948344a2a77c47a7a7b332fe12ff749a.jpg', 0, 9, '20220722/a9e7971f1b084cf1a69544ae984ee9f7.jpg', 14334, 'image/jpeg', 0, 1, '2022-07-22 13:40:04', '2022-07-22 16:09:05');
INSERT INTO `sys_user_file` VALUES (44, 1, '20200708230820.png', 0, 2, '20220722/530578a3237745d791106053856f162f.png', 3799, 'image/png', 0, 1, '2022-07-22 13:52:55', '2022-07-22 16:09:06');
INSERT INTO `sys_user_file` VALUES (45, 1, 'china-provinces.geo.json', 0, 2, '20220722/74fc77a305f341f0a40d2448efaa047d.json', 54238, 'application/json', 0, 1, '2022-07-22 13:55:46', '2022-07-22 16:09:07');
INSERT INTO `sys_user_file` VALUES (46, 1, 'word.geo.json', 0, 2, '20220722/6f4b5f19e7754120868c810c5fcbeeb6.json', 1504924, 'application/json', 0, 1, '2022-07-22 13:55:51', '2022-07-22 16:09:08');
INSERT INTO `sys_user_file` VALUES (47, 1, '20200708224450.pdf', 0, 2, '20220722/21a93c2641b5486aae6d29b46a353073.pdf', 839977, 'application/pdf', 0, 1, '2022-07-22 13:55:55', '2022-07-22 16:09:10');
INSERT INTO `sys_user_file` VALUES (48, 1, '20200708224450.docx', 0, 2, '20220722/4a4f2df9ba4249e9b00df0427691ce57.docx', 2586229, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 0, 1, '2022-07-22 13:55:58', '2022-07-22 16:09:10');
INSERT INTO `sys_user_file` VALUES (49, 1, 'document.json', 0, 2, '20220722/e988a1140259460095dd154a0ab54ff0.json', 1675, 'application/json', 0, 1, '2022-07-22 13:57:16', '2022-07-22 16:09:11');
INSERT INTO `sys_user_file` VALUES (50, 1, 'archive.json', 0, 2, '20220722/fab7f40d28c44000b104205bd6d9e227.json', 1998, 'application/json', 0, 1, '2022-07-22 13:57:19', '2022-07-22 16:09:13');
INSERT INTO `sys_user_file` VALUES (51, 1, 'eleadmin-copyright.jpg', 0, 2, '20220722/881ef0f83ef347a18177ee26ccb33d1a.jpg', 79297, 'image/jpeg', 0, 1, '2022-07-22 13:57:23', '2022-07-22 16:09:14');
INSERT INTO `sys_user_file` VALUES (52, 1, 'eleadmin-pro-copyright.jpg', 0, 2, '20220722/b7bac0f9abdb4b0f94b911940a77ad3b.jpg', 151976, 'image/jpeg', 0, 1, '2022-07-22 13:57:25', '2022-07-22 16:09:16');
INSERT INTO `sys_user_file` VALUES (53, 14, '我的图片', 1, 0, NULL, NULL, NULL, 0, 2, '2022-07-22 11:28:02', '2022-07-22 11:28:02');
INSERT INTO `sys_user_file` VALUES (54, 14, '我的文件', 1, 0, NULL, NULL, NULL, 0, 2, '2022-07-22 11:28:09', '2022-07-22 11:28:09');
INSERT INTO `sys_user_file` VALUES (55, 14, 'avatar.jpg', 0, 0, '20220722/19b623b787514f8eb7d1e8edf2e9ff15.jpg', 12805, 'image/jpeg', 0, 2, '2022-07-22 11:28:16', '2022-07-22 11:28:16');
INSERT INTO `sys_user_file` VALUES (56, 14, 'logo.svg', 0, 0, '20220722/e77995c100de46409cce84e848a63f7d.svg', 1605, 'image/svg+xml', 0, 2, '2022-07-22 11:28:21', '2022-07-22 11:28:21');
INSERT INTO `sys_user_file` VALUES (57, 14, 'favicon.ico', 0, 0, '20220722/acb31ddb5ce44530933c48741c3bbfe2.ico', 4286, 'image/vnd.microsoft.icon', 0, 2, '2022-07-22 11:29:11', '2022-07-22 11:29:11');
INSERT INTO `sys_user_file` VALUES (58, 14, '用户导入模板.xlsx', 0, 0, '20220722/b4fa501bf6084f2e8bed971e68462ce3.xlsx', 10221, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 0, 2, '2022-07-22 11:29:24', '2022-07-22 11:29:24');
INSERT INTO `sys_user_file` VALUES (59, 14, 'classes.json', 0, 0, '20220722/8d59c7d48453444d9ee84bd2b4c27a12.json', 6789, 'application/json', 0, 2, '2022-07-22 11:29:28', '2022-07-22 11:29:28');
INSERT INTO `sys_user_file` VALUES (60, 14, '壁纸', 1, 53, NULL, NULL, NULL, 0, 2, '2022-07-22 11:30:58', '2022-07-22 16:10:42');
INSERT INTO `sys_user_file` VALUES (61, 14, '头像', 1, 53, NULL, NULL, NULL, 0, 2, '2022-07-22 11:31:02', '2022-07-22 16:10:43');
INSERT INTO `sys_user_file` VALUES (62, 14, 'pro202012301.png', 0, 53, '20220722/4cbac74d9c5c45858854b24ee5db8e87.png', 59257, 'image/png', 0, 2, '2022-07-22 11:34:39', '2022-07-22 16:10:44');
INSERT INTO `sys_user_file` VALUES (63, 14, 'pro202012302.png', 0, 53, '20220722/24ba2b0906f64394ae0fb5e8f813cb30.png', 64832, 'image/png', 0, 2, '2022-07-22 11:34:43', '2022-07-22 16:10:44');
INSERT INTO `sys_user_file` VALUES (64, 14, 'pro202012303.png', 0, 53, '20220722/9d269d1fe7294ea4b5ca6f11c6ac8a95.png', 74518, 'image/png', 0, 2, '2022-07-22 11:34:47', '2022-07-22 16:10:45');
INSERT INTO `sys_user_file` VALUES (65, 14, 'eleadmin20201020172822.png', 0, 53, '20220722/45c686ab54264822963bc40716222591.png', 103558, 'image/png', 0, 2, '2022-07-22 13:02:52', '2022-07-22 16:10:46');
INSERT INTO `sys_user_file` VALUES (66, 14, 'RZ8FQmZfHkcffMlTBCJllBFjEhEsObVo.jpg', 0, 60, '20220722/099d2f77dfad41c7af776ad81af7aab5.jpg', 38206, 'image/jpeg', 0, 2, '2022-07-22 13:34:41', '2022-07-22 16:10:55');
INSERT INTO `sys_user_file` VALUES (67, 14, 'WLXm7gp1EbLDtvVQgkeQeyq5OtDm00Jd.jpg', 0, 60, '20220722/faf7fec118824f309fb66961866d9712.jpg', 60365, 'image/jpeg', 0, 2, '2022-07-22 13:34:49', '2022-07-22 16:10:56');
INSERT INTO `sys_user_file` VALUES (68, 14, '4Z0QR2L0J1XStxBh99jVJ8qLfsGsOgjU.jpg', 0, 60, '20220722/d845f1a4e91143dc81ec9fa96ce6f074.jpg', 50118, 'image/jpeg', 0, 2, '2022-07-22 13:34:54', '2022-07-22 16:10:57');
INSERT INTO `sys_user_file` VALUES (69, 14, 'ttkIjNPlVDuv4lUTvRX8GIlM2QqSe0jg.jpg', 0, 60, '20220722/4fc98decedcb4029bc954369c5e8c294.jpg', 29948, 'image/jpeg', 0, 2, '2022-07-22 13:35:03', '2022-07-22 16:10:57');
INSERT INTO `sys_user_file` VALUES (70, 14, 'fAenQ8nvRjL7x0i0jEfuDBZHvJfHf3v6.jpg', 0, 60, '20220722/9787d2f5b37d4813a48b72e950d00395.jpg', 48228, 'image/jpeg', 0, 2, '2022-07-22 13:35:08', '2022-07-22 16:10:58');
INSERT INTO `sys_user_file` VALUES (71, 14, 'LrCTN2j94lo9N7wEql7cBr1Ux4rHMvmZ.jpg', 0, 60, '20220722/9dacd9d48efa483ab204ae8ad0b60864.jpg', 37320, 'image/jpeg', 0, 2, '2022-07-22 13:35:12', '2022-07-22 16:10:59');
INSERT INTO `sys_user_file` VALUES (72, 14, 'yeKvhT20lMU0f1T3Y743UlGEOLLnZSnp.jpg', 0, 60, '20220722/f74da7fd19524bc0a4e75e6159d041ac.jpg', 29040, 'image/jpeg', 0, 2, '2022-07-22 13:35:17', '2022-07-22 16:10:59');
INSERT INTO `sys_user_file` VALUES (73, 14, 'CyrCNmTJfv7D6GFAg39bjT3eRkkRm5dI.jpg', 0, 60, '20220722/7539f0f90c4749cbbb56b111e2b8d6af.jpg', 39560, 'image/jpeg', 0, 2, '2022-07-22 13:35:26', '2022-07-22 16:11:00');
INSERT INTO `sys_user_file` VALUES (74, 14, 'faa0202700ee455b90fe77d8bef98bc0.jpg', 0, 61, '20220722/5079a6bc43b64bf2b86b87275dfaf7a2.jpg', 10250, 'image/jpeg', 0, 2, '2022-07-22 13:36:21', '2022-07-22 16:11:04');
INSERT INTO `sys_user_file` VALUES (75, 14, 'fe9196dd091e438fba115205c1003ee7.jpg', 0, 61, '20220722/db6740d4bb6e4938a8ce502a6af4554d.jpg', 10726, 'image/jpeg', 0, 2, '2022-07-22 13:36:34', '2022-07-22 16:11:05');
INSERT INTO `sys_user_file` VALUES (76, 14, '21222950dc174485b2ec5088435a46a3.jpg', 0, 61, '20220722/ef84d66c378549e7807b98b64282d222.jpg', 15201, 'image/jpeg', 0, 2, '2022-07-22 13:37:49', '2022-07-22 16:11:06');
INSERT INTO `sys_user_file` VALUES (77, 14, 'adb3ad5e05614fd2a59cf886ffc37f74.jpg', 0, 61, '20220722/c326e31373084a83a99387ac7929ecc7.jpg', 12782, 'image/jpeg', 0, 2, '2022-07-22 13:37:53', '2022-07-22 16:11:06');
INSERT INTO `sys_user_file` VALUES (78, 14, 'b3ce64e10db7497b8b9f5a31df1b4eb2.jpg', 0, 61, '20220722/2f5d639d26e0478ea50935edde4fd229.jpg', 13086, 'image/jpeg', 0, 2, '2022-07-22 13:37:56', '2022-07-22 16:11:07');
INSERT INTO `sys_user_file` VALUES (79, 14, 'b6a811873e704db49db994053a5019b2.jpg', 0, 61, '20220722/8da9136eed1f41cb8d4907cb77199ca5.jpg', 12591, 'image/jpeg', 0, 2, '2022-07-22 13:38:00', '2022-07-22 16:11:08');
INSERT INTO `sys_user_file` VALUES (80, 14, 'be7dc0c24fc342fda44e12a2c2a2b7bb.jpg', 0, 61, '20220722/2576207113104107935e743b5d5cd52a.jpg', 13554, 'image/jpeg', 0, 2, '2022-07-22 13:38:09', '2022-07-22 16:11:09');
INSERT INTO `sys_user_file` VALUES (81, 14, 'c184eef391ae48dba87e3057e70238fb.jpg', 0, 61, '20220722/15528efcdd1042ad8fce23d0f36905df.jpg', 17857, 'image/jpeg', 0, 2, '2022-07-22 13:38:15', '2022-07-22 16:11:09');
INSERT INTO `sys_user_file` VALUES (82, 14, 'd3519518b00d42d3936b2ab5ce3a4cc3.jpg', 0, 61, '20220722/6b8cfc0ee93144d680375a5c588da1e4.jpg', 10333, 'image/jpeg', 0, 2, '2022-07-22 13:38:22', '2022-07-22 16:11:10');
INSERT INTO `sys_user_file` VALUES (83, 14, '8931360b593040238d894a542c9037bc.jpg', 0, 61, '20220722/0e88d170dc284263898422dba5de257c.jpg', 10377, 'image/jpeg', 0, 2, '2022-07-22 13:38:26', '2022-07-22 16:11:11');
INSERT INTO `sys_user_file` VALUES (84, 14, 'e36594e7423147748b2592ccb720ae9e.jpg', 0, 61, '20220722/14a5f30c639b450c9ac7c01bb18b26b5.jpg', 12451, 'image/jpeg', 0, 2, '2022-07-22 13:39:16', '2022-07-22 16:11:12');
INSERT INTO `sys_user_file` VALUES (85, 14, 'f6bc05af944a4f738b54128717952107.jpg', 0, 61, '20220722/d67c079e3f41407c826ef9a110145d49.jpg', 11724, 'image/jpeg', 0, 2, '2022-07-22 13:39:20', '2022-07-22 16:11:13');
INSERT INTO `sys_user_file` VALUES (86, 14, '0568caaf0a7e41dda2d901d4ac2f3243.jpg', 0, 61, '20220722/b8f43e929d6048a7b6354b0fe4fae440.jpg', 24290, 'image/jpeg', 0, 2, '2022-07-22 13:39:24', '2022-07-22 16:11:19');
INSERT INTO `sys_user_file` VALUES (87, 14, '0bfaa58e801b47fb9f56dcb128206d94.jpg', 0, 61, '20220722/ebc5a81452694c6787b4e77ea579a12f.jpg', 4578, 'image/jpeg', 0, 2, '2022-07-22 13:39:28', '2022-07-22 16:11:20');
INSERT INTO `sys_user_file` VALUES (88, 14, '12b3d575a2a24e0789a014bd6ce7585b.jpg', 0, 61, '20220722/1ba37747d5014a5e9f6f0de5771326c9.jpg', 20909, 'image/jpeg', 0, 2, '2022-07-22 13:39:32', '2022-07-22 16:11:20');
INSERT INTO `sys_user_file` VALUES (89, 14, '2d98970a51b34b6b859339c96b240dcd.jpg', 0, 61, '20220722/6389dd41857b499a93ce3c5ce050da45.jpg', 11855, 'image/jpeg', 0, 2, '2022-07-22 13:39:36', '2022-07-22 16:11:21');
INSERT INTO `sys_user_file` VALUES (90, 14, '3cc0f65fefbe448191aa728d80f6b97e.jpg', 0, 61, '20220722/bc90af738f2641abb497092781055030.jpg', 15237, 'image/jpeg', 0, 2, '2022-07-22 13:39:40', '2022-07-22 16:11:21');
INSERT INTO `sys_user_file` VALUES (91, 14, '41d81834e87546f49d3ff48c3806ea92.jpg', 0, 61, '20220722/d08de988712a40e2b315ddbff750e730.jpg', 10983, 'image/jpeg', 0, 2, '2022-07-22 13:39:45', '2022-07-22 16:11:22');
INSERT INTO `sys_user_file` VALUES (92, 14, '4e60a84551fa48439bf42ecdb9673331.jpg', 0, 61, '20220722/5f5d6d56e4a74744906c542685770c28.jpg', 12075, 'image/jpeg', 0, 2, '2022-07-22 13:39:49', '2022-07-22 16:11:23');
INSERT INTO `sys_user_file` VALUES (93, 14, '66e6f6c60cfa44b288d6343027b544d0.jpg', 0, 61, '20220722/da9cb7ee91c04dedb462aebaa9321e15.jpg', 8346, 'image/jpeg', 0, 2, '2022-07-22 13:39:53', '2022-07-22 16:11:24');
INSERT INTO `sys_user_file` VALUES (94, 14, 'd6442cfa99b64b51aabfc470055b05dc.jpg', 0, 61, '20220722/b4fa02e6f1834586a05cede521394960.jpg', 14678, 'image/jpeg', 0, 2, '2022-07-22 13:39:58', '2022-07-22 16:11:24');
INSERT INTO `sys_user_file` VALUES (95, 14, '948344a2a77c47a7a7b332fe12ff749a.jpg', 0, 61, '20220722/a9e7971f1b084cf1a69544ae984ee9f7.jpg', 14334, 'image/jpeg', 0, 2, '2022-07-22 13:40:04', '2022-07-22 16:11:25');
INSERT INTO `sys_user_file` VALUES (96, 14, '20200708230820.png', 0, 54, '20220722/530578a3237745d791106053856f162f.png', 3799, 'image/png', 0, 2, '2022-07-22 13:52:55', '2022-07-22 16:11:32');
INSERT INTO `sys_user_file` VALUES (97, 14, 'china-provinces.geo.json', 0, 54, '20220722/74fc77a305f341f0a40d2448efaa047d.json', 54238, 'application/json', 0, 2, '2022-07-22 13:55:46', '2022-07-22 16:11:32');
INSERT INTO `sys_user_file` VALUES (98, 14, 'word.geo.json', 0, 54, '20220722/6f4b5f19e7754120868c810c5fcbeeb6.json', 1504924, 'application/json', 0, 2, '2022-07-22 13:55:51', '2022-07-22 16:11:33');
INSERT INTO `sys_user_file` VALUES (99, 14, '20200708224450.pdf', 0, 54, '20220722/21a93c2641b5486aae6d29b46a353073.pdf', 839977, 'application/pdf', 0, 2, '2022-07-22 13:55:55', '2022-07-22 16:11:33');
INSERT INTO `sys_user_file` VALUES (100, 14, '20200708224450.docx', 0, 54, '20220722/4a4f2df9ba4249e9b00df0427691ce57.docx', 2586229, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 0, 2, '2022-07-22 13:55:58', '2022-07-22 16:11:34');
INSERT INTO `sys_user_file` VALUES (101, 14, 'document.json', 0, 54, '20220722/e988a1140259460095dd154a0ab54ff0.json', 1675, 'application/json', 0, 2, '2022-07-22 13:57:16', '2022-07-22 16:11:35');
INSERT INTO `sys_user_file` VALUES (102, 14, 'archive.json', 0, 54, '20220722/fab7f40d28c44000b104205bd6d9e227.json', 1998, 'application/json', 0, 2, '2022-07-22 13:57:19', '2022-07-22 16:11:36');
INSERT INTO `sys_user_file` VALUES (103, 14, 'eleadmin-copyright.jpg', 0, 54, '20220722/881ef0f83ef347a18177ee26ccb33d1a.jpg', 79297, 'image/jpeg', 0, 2, '2022-07-22 13:57:23', '2022-07-22 16:11:36');
INSERT INTO `sys_user_file` VALUES (104, 14, 'eleadmin-pro-copyright.jpg', 0, 54, '20220722/b7bac0f9abdb4b0f94b911940a77ad3b.jpg', 151976, 'image/jpeg', 0, 2, '2022-07-22 13:57:25', '2022-07-22 16:11:37');
INSERT INTO `sys_user_file` VALUES (105, 27, '我的图片', 1, 0, NULL, NULL, NULL, 0, 3, '2022-07-22 11:28:02', '2022-07-22 16:08:28');
INSERT INTO `sys_user_file` VALUES (106, 27, '我的文件', 1, 0, NULL, NULL, NULL, 0, 3, '2022-07-22 11:28:09', '2022-07-22 16:08:30');
INSERT INTO `sys_user_file` VALUES (107, 27, 'avatar.jpg', 0, 0, '20220722/19b623b787514f8eb7d1e8edf2e9ff15.jpg', 12805, 'image/jpeg', 0, 3, '2022-07-22 11:28:16', '2022-07-22 16:08:31');
INSERT INTO `sys_user_file` VALUES (108, 27, 'logo.svg', 0, 0, '20220722/e77995c100de46409cce84e848a63f7d.svg', 1605, 'image/svg+xml', 0, 3, '2022-07-22 11:28:21', '2022-07-22 16:08:32');
INSERT INTO `sys_user_file` VALUES (109, 27, 'favicon.ico', 0, 0, '20220722/acb31ddb5ce44530933c48741c3bbfe2.ico', 4286, 'image/vnd.microsoft.icon', 0, 3, '2022-07-22 11:29:11', '2022-07-22 16:08:32');
INSERT INTO `sys_user_file` VALUES (110, 27, '用户导入模板.xlsx', 0, 0, '20220722/b4fa501bf6084f2e8bed971e68462ce3.xlsx', 10221, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 0, 3, '2022-07-22 11:29:24', '2022-07-22 16:08:35');
INSERT INTO `sys_user_file` VALUES (111, 27, 'classes.json', 0, 0, '20220722/8d59c7d48453444d9ee84bd2b4c27a12.json', 6789, 'application/json', 0, 3, '2022-07-22 11:29:28', '2022-07-22 16:08:34');
INSERT INTO `sys_user_file` VALUES (112, 27, '壁纸', 1, 105, NULL, NULL, NULL, 0, 3, '2022-07-22 11:30:58', '2022-07-22 16:08:36');
INSERT INTO `sys_user_file` VALUES (113, 27, '头像', 1, 105, NULL, NULL, NULL, 0, 3, '2022-07-22 11:31:02', '2022-07-22 16:08:37');
INSERT INTO `sys_user_file` VALUES (114, 27, 'pro202012301.png', 0, 105, '20220722/4cbac74d9c5c45858854b24ee5db8e87.png', 59257, 'image/png', 0, 3, '2022-07-22 11:34:39', '2022-07-22 16:08:37');
INSERT INTO `sys_user_file` VALUES (115, 27, 'pro202012302.png', 0, 105, '20220722/24ba2b0906f64394ae0fb5e8f813cb30.png', 64832, 'image/png', 0, 3, '2022-07-22 11:34:43', '2022-07-22 16:08:38');
INSERT INTO `sys_user_file` VALUES (116, 27, 'pro202012303.png', 0, 105, '20220722/9d269d1fe7294ea4b5ca6f11c6ac8a95.png', 74518, 'image/png', 0, 3, '2022-07-22 11:34:47', '2022-07-22 16:08:39');
INSERT INTO `sys_user_file` VALUES (117, 27, 'eleadmin20201020172822.png', 0, 105, '20220722/45c686ab54264822963bc40716222591.png', 103558, 'image/png', 0, 3, '2022-07-22 13:02:52', '2022-07-22 16:08:39');
INSERT INTO `sys_user_file` VALUES (118, 27, 'RZ8FQmZfHkcffMlTBCJllBFjEhEsObVo.jpg', 0, 112, '20220722/099d2f77dfad41c7af776ad81af7aab5.jpg', 38206, 'image/jpeg', 0, 3, '2022-07-22 13:34:41', '2022-07-22 16:08:40');
INSERT INTO `sys_user_file` VALUES (119, 27, 'WLXm7gp1EbLDtvVQgkeQeyq5OtDm00Jd.jpg', 0, 112, '20220722/faf7fec118824f309fb66961866d9712.jpg', 60365, 'image/jpeg', 0, 3, '2022-07-22 13:34:49', '2022-07-22 16:08:41');
INSERT INTO `sys_user_file` VALUES (120, 27, '4Z0QR2L0J1XStxBh99jVJ8qLfsGsOgjU.jpg', 0, 112, '20220722/d845f1a4e91143dc81ec9fa96ce6f074.jpg', 50118, 'image/jpeg', 0, 3, '2022-07-22 13:34:54', '2022-07-22 16:08:42');
INSERT INTO `sys_user_file` VALUES (121, 27, 'ttkIjNPlVDuv4lUTvRX8GIlM2QqSe0jg.jpg', 0, 112, '20220722/4fc98decedcb4029bc954369c5e8c294.jpg', 29948, 'image/jpeg', 0, 3, '2022-07-22 13:35:03', '2022-07-22 16:08:42');
INSERT INTO `sys_user_file` VALUES (122, 27, 'fAenQ8nvRjL7x0i0jEfuDBZHvJfHf3v6.jpg', 0, 112, '20220722/9787d2f5b37d4813a48b72e950d00395.jpg', 48228, 'image/jpeg', 0, 3, '2022-07-22 13:35:08', '2022-07-22 16:08:43');
INSERT INTO `sys_user_file` VALUES (123, 27, 'LrCTN2j94lo9N7wEql7cBr1Ux4rHMvmZ.jpg', 0, 112, '20220722/9dacd9d48efa483ab204ae8ad0b60864.jpg', 37320, 'image/jpeg', 0, 3, '2022-07-22 13:35:12', '2022-07-22 16:08:43');
INSERT INTO `sys_user_file` VALUES (124, 27, 'yeKvhT20lMU0f1T3Y743UlGEOLLnZSnp.jpg', 0, 112, '20220722/f74da7fd19524bc0a4e75e6159d041ac.jpg', 29040, 'image/jpeg', 0, 3, '2022-07-22 13:35:17', '2022-07-22 16:08:44');
INSERT INTO `sys_user_file` VALUES (125, 27, 'CyrCNmTJfv7D6GFAg39bjT3eRkkRm5dI.jpg', 0, 112, '20220722/7539f0f90c4749cbbb56b111e2b8d6af.jpg', 39560, 'image/jpeg', 0, 3, '2022-07-22 13:35:26', '2022-07-22 16:08:45');
INSERT INTO `sys_user_file` VALUES (126, 27, 'faa0202700ee455b90fe77d8bef98bc0.jpg', 0, 113, '20220722/5079a6bc43b64bf2b86b87275dfaf7a2.jpg', 10250, 'image/jpeg', 0, 3, '2022-07-22 13:36:21', '2022-07-22 16:08:45');
INSERT INTO `sys_user_file` VALUES (127, 27, 'fe9196dd091e438fba115205c1003ee7.jpg', 0, 113, '20220722/db6740d4bb6e4938a8ce502a6af4554d.jpg', 10726, 'image/jpeg', 0, 3, '2022-07-22 13:36:34', '2022-07-22 16:08:46');
INSERT INTO `sys_user_file` VALUES (128, 27, '21222950dc174485b2ec5088435a46a3.jpg', 0, 113, '20220722/ef84d66c378549e7807b98b64282d222.jpg', 15201, 'image/jpeg', 0, 3, '2022-07-22 13:37:49', '2022-07-22 16:08:47');
INSERT INTO `sys_user_file` VALUES (129, 27, 'adb3ad5e05614fd2a59cf886ffc37f74.jpg', 0, 113, '20220722/c326e31373084a83a99387ac7929ecc7.jpg', 12782, 'image/jpeg', 0, 3, '2022-07-22 13:37:53', '2022-07-22 16:08:47');
INSERT INTO `sys_user_file` VALUES (130, 27, 'b3ce64e10db7497b8b9f5a31df1b4eb2.jpg', 0, 113, '20220722/2f5d639d26e0478ea50935edde4fd229.jpg', 13086, 'image/jpeg', 0, 3, '2022-07-22 13:37:56', '2022-07-22 16:08:48');
INSERT INTO `sys_user_file` VALUES (131, 27, 'b6a811873e704db49db994053a5019b2.jpg', 0, 113, '20220722/8da9136eed1f41cb8d4907cb77199ca5.jpg', 12591, 'image/jpeg', 0, 3, '2022-07-22 13:38:00', '2022-07-22 16:08:49');
INSERT INTO `sys_user_file` VALUES (132, 27, 'be7dc0c24fc342fda44e12a2c2a2b7bb.jpg', 0, 113, '20220722/2576207113104107935e743b5d5cd52a.jpg', 13554, 'image/jpeg', 0, 3, '2022-07-22 13:38:09', '2022-07-22 16:08:49');
INSERT INTO `sys_user_file` VALUES (133, 27, 'c184eef391ae48dba87e3057e70238fb.jpg', 0, 113, '20220722/15528efcdd1042ad8fce23d0f36905df.jpg', 17857, 'image/jpeg', 0, 3, '2022-07-22 13:38:15', '2022-07-22 16:08:50');
INSERT INTO `sys_user_file` VALUES (134, 27, 'd3519518b00d42d3936b2ab5ce3a4cc3.jpg', 0, 113, '20220722/6b8cfc0ee93144d680375a5c588da1e4.jpg', 10333, 'image/jpeg', 0, 3, '2022-07-22 13:38:22', '2022-07-22 16:08:51');
INSERT INTO `sys_user_file` VALUES (135, 27, '8931360b593040238d894a542c9037bc.jpg', 0, 113, '20220722/0e88d170dc284263898422dba5de257c.jpg', 10377, 'image/jpeg', 0, 3, '2022-07-22 13:38:26', '2022-07-22 16:08:52');
INSERT INTO `sys_user_file` VALUES (136, 27, 'e36594e7423147748b2592ccb720ae9e.jpg', 0, 113, '20220722/14a5f30c639b450c9ac7c01bb18b26b5.jpg', 12451, 'image/jpeg', 0, 3, '2022-07-22 13:39:16', '2022-07-22 16:08:58');
INSERT INTO `sys_user_file` VALUES (137, 27, 'f6bc05af944a4f738b54128717952107.jpg', 0, 113, '20220722/d67c079e3f41407c826ef9a110145d49.jpg', 11724, 'image/jpeg', 0, 3, '2022-07-22 13:39:20', '2022-07-22 16:08:59');
INSERT INTO `sys_user_file` VALUES (138, 27, '0568caaf0a7e41dda2d901d4ac2f3243.jpg', 0, 113, '20220722/b8f43e929d6048a7b6354b0fe4fae440.jpg', 24290, 'image/jpeg', 0, 3, '2022-07-22 13:39:24', '2022-07-22 16:08:59');
INSERT INTO `sys_user_file` VALUES (139, 27, '0bfaa58e801b47fb9f56dcb128206d94.jpg', 0, 113, '20220722/ebc5a81452694c6787b4e77ea579a12f.jpg', 4578, 'image/jpeg', 0, 3, '2022-07-22 13:39:28', '2022-07-22 16:09:00');
INSERT INTO `sys_user_file` VALUES (140, 27, '12b3d575a2a24e0789a014bd6ce7585b.jpg', 0, 113, '20220722/1ba37747d5014a5e9f6f0de5771326c9.jpg', 20909, 'image/jpeg', 0, 3, '2022-07-22 13:39:32', '2022-07-22 16:09:01');
INSERT INTO `sys_user_file` VALUES (141, 27, '2d98970a51b34b6b859339c96b240dcd.jpg', 0, 113, '20220722/6389dd41857b499a93ce3c5ce050da45.jpg', 11855, 'image/jpeg', 0, 3, '2022-07-22 13:39:36', '2022-07-22 16:09:02');
INSERT INTO `sys_user_file` VALUES (142, 27, '3cc0f65fefbe448191aa728d80f6b97e.jpg', 0, 113, '20220722/bc90af738f2641abb497092781055030.jpg', 15237, 'image/jpeg', 0, 3, '2022-07-22 13:39:40', '2022-07-22 16:09:02');
INSERT INTO `sys_user_file` VALUES (143, 27, '41d81834e87546f49d3ff48c3806ea92.jpg', 0, 113, '20220722/d08de988712a40e2b315ddbff750e730.jpg', 10983, 'image/jpeg', 0, 3, '2022-07-22 13:39:45', '2022-07-22 16:09:03');
INSERT INTO `sys_user_file` VALUES (144, 27, '4e60a84551fa48439bf42ecdb9673331.jpg', 0, 113, '20220722/5f5d6d56e4a74744906c542685770c28.jpg', 12075, 'image/jpeg', 0, 3, '2022-07-22 13:39:49', '2022-07-22 16:09:04');
INSERT INTO `sys_user_file` VALUES (145, 27, '66e6f6c60cfa44b288d6343027b544d0.jpg', 0, 113, '20220722/da9cb7ee91c04dedb462aebaa9321e15.jpg', 8346, 'image/jpeg', 0, 3, '2022-07-22 13:39:53', '2022-07-22 16:09:04');
INSERT INTO `sys_user_file` VALUES (146, 27, 'd6442cfa99b64b51aabfc470055b05dc.jpg', 0, 113, '20220722/b4fa02e6f1834586a05cede521394960.jpg', 14678, 'image/jpeg', 0, 3, '2022-07-22 13:39:58', '2022-07-22 16:09:05');
INSERT INTO `sys_user_file` VALUES (147, 27, '948344a2a77c47a7a7b332fe12ff749a.jpg', 0, 113, '20220722/a9e7971f1b084cf1a69544ae984ee9f7.jpg', 14334, 'image/jpeg', 0, 3, '2022-07-22 13:40:04', '2022-07-22 16:09:05');
INSERT INTO `sys_user_file` VALUES (148, 27, '20200708230820.png', 0, 106, '20220722/530578a3237745d791106053856f162f.png', 3799, 'image/png', 0, 3, '2022-07-22 13:52:55', '2022-07-22 16:09:06');
INSERT INTO `sys_user_file` VALUES (149, 27, 'china-provinces.geo.json', 0, 106, '20220722/74fc77a305f341f0a40d2448efaa047d.json', 54238, 'application/json', 0, 3, '2022-07-22 13:55:46', '2022-07-22 16:09:07');
INSERT INTO `sys_user_file` VALUES (150, 27, 'word.geo.json', 0, 106, '20220722/6f4b5f19e7754120868c810c5fcbeeb6.json', 1504924, 'application/json', 0, 3, '2022-07-22 13:55:51', '2022-07-22 16:09:08');
INSERT INTO `sys_user_file` VALUES (151, 27, '20200708224450.pdf', 0, 106, '20220722/21a93c2641b5486aae6d29b46a353073.pdf', 839977, 'application/pdf', 0, 3, '2022-07-22 13:55:55', '2022-07-22 16:09:10');
INSERT INTO `sys_user_file` VALUES (152, 27, '20200708224450.docx', 0, 106, '20220722/4a4f2df9ba4249e9b00df0427691ce57.docx', 2586229, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 0, 3, '2022-07-22 13:55:58', '2022-07-22 16:09:10');
INSERT INTO `sys_user_file` VALUES (153, 27, 'document.json', 0, 106, '20220722/e988a1140259460095dd154a0ab54ff0.json', 1675, 'application/json', 0, 3, '2022-07-22 13:57:16', '2022-07-22 16:09:11');
INSERT INTO `sys_user_file` VALUES (154, 27, 'archive.json', 0, 106, '20220722/fab7f40d28c44000b104205bd6d9e227.json', 1998, 'application/json', 0, 3, '2022-07-22 13:57:19', '2022-07-22 16:09:13');
INSERT INTO `sys_user_file` VALUES (155, 27, 'eleadmin-copyright.jpg', 0, 106, '20220722/881ef0f83ef347a18177ee26ccb33d1a.jpg', 79297, 'image/jpeg', 0, 3, '2022-07-22 13:57:23', '2022-07-22 16:09:14');
INSERT INTO `sys_user_file` VALUES (156, 27, 'eleadmin-pro-copyright.jpg', 0, 106, '20220722/b7bac0f9abdb4b0f94b911940a77ad3b.jpg', 151976, 'image/jpeg', 0, 3, '2022-07-22 13:57:25', '2022-07-22 16:09:16');
INSERT INTO `sys_user_file` VALUES (157, 40, '我的图片', 1, 0, NULL, NULL, NULL, 0, 4, '2022-07-22 11:28:02', '2022-07-22 16:08:28');
INSERT INTO `sys_user_file` VALUES (158, 40, '我的文件', 1, 0, NULL, NULL, NULL, 0, 4, '2022-07-22 11:28:09', '2022-07-22 16:08:30');
INSERT INTO `sys_user_file` VALUES (159, 40, 'avatar.jpg', 0, 0, '20220722/19b623b787514f8eb7d1e8edf2e9ff15.jpg', 12805, 'image/jpeg', 0, 4, '2022-07-22 11:28:16', '2022-07-22 16:08:31');
INSERT INTO `sys_user_file` VALUES (160, 40, 'logo.svg', 0, 0, '20220722/e77995c100de46409cce84e848a63f7d.svg', 1605, 'image/svg+xml', 0, 4, '2022-07-22 11:28:21', '2022-07-22 16:08:32');
INSERT INTO `sys_user_file` VALUES (161, 40, 'favicon.ico', 0, 0, '20220722/acb31ddb5ce44530933c48741c3bbfe2.ico', 4286, 'image/vnd.microsoft.icon', 0, 4, '2022-07-22 11:29:11', '2022-07-22 16:08:32');
INSERT INTO `sys_user_file` VALUES (162, 40, '用户导入模板.xlsx', 0, 0, '20220722/b4fa501bf6084f2e8bed971e68462ce3.xlsx', 10221, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 0, 4, '2022-07-22 11:29:24', '2022-07-22 16:08:35');
INSERT INTO `sys_user_file` VALUES (163, 40, 'classes.json', 0, 0, '20220722/8d59c7d48453444d9ee84bd2b4c27a12.json', 6789, 'application/json', 0, 4, '2022-07-22 11:29:28', '2022-07-22 16:08:34');
INSERT INTO `sys_user_file` VALUES (164, 40, '壁纸', 1, 157, NULL, NULL, NULL, 0, 4, '2022-07-22 11:30:58', '2022-07-22 16:08:36');
INSERT INTO `sys_user_file` VALUES (165, 40, '头像', 1, 157, NULL, NULL, NULL, 0, 4, '2022-07-22 11:31:02', '2022-07-22 16:08:37');
INSERT INTO `sys_user_file` VALUES (166, 40, 'pro202012301.png', 0, 157, '20220722/4cbac74d9c5c45858854b24ee5db8e87.png', 59257, 'image/png', 0, 4, '2022-07-22 11:34:39', '2022-07-22 16:08:37');
INSERT INTO `sys_user_file` VALUES (167, 40, 'pro202012302.png', 0, 157, '20220722/24ba2b0906f64394ae0fb5e8f813cb30.png', 64832, 'image/png', 0, 4, '2022-07-22 11:34:43', '2022-07-22 16:08:38');
INSERT INTO `sys_user_file` VALUES (168, 40, 'pro202012303.png', 0, 157, '20220722/9d269d1fe7294ea4b5ca6f11c6ac8a95.png', 74518, 'image/png', 0, 4, '2022-07-22 11:34:47', '2022-07-22 16:08:39');
INSERT INTO `sys_user_file` VALUES (169, 40, 'eleadmin20201020172822.png', 0, 157, '20220722/45c686ab54264822963bc40716222591.png', 103558, 'image/png', 0, 4, '2022-07-22 13:02:52', '2022-07-22 16:08:39');
INSERT INTO `sys_user_file` VALUES (170, 40, 'RZ8FQmZfHkcffMlTBCJllBFjEhEsObVo.jpg', 0, 164, '20220722/099d2f77dfad41c7af776ad81af7aab5.jpg', 38206, 'image/jpeg', 0, 4, '2022-07-22 13:34:41', '2022-07-22 16:08:40');
INSERT INTO `sys_user_file` VALUES (171, 40, 'WLXm7gp1EbLDtvVQgkeQeyq5OtDm00Jd.jpg', 0, 164, '20220722/faf7fec118824f309fb66961866d9712.jpg', 60365, 'image/jpeg', 0, 4, '2022-07-22 13:34:49', '2022-07-22 16:08:41');
INSERT INTO `sys_user_file` VALUES (172, 40, '4Z0QR2L0J1XStxBh99jVJ8qLfsGsOgjU.jpg', 0, 164, '20220722/d845f1a4e91143dc81ec9fa96ce6f074.jpg', 50118, 'image/jpeg', 0, 4, '2022-07-22 13:34:54', '2022-07-22 16:08:42');
INSERT INTO `sys_user_file` VALUES (173, 40, 'ttkIjNPlVDuv4lUTvRX8GIlM2QqSe0jg.jpg', 0, 164, '20220722/4fc98decedcb4029bc954369c5e8c294.jpg', 29948, 'image/jpeg', 0, 4, '2022-07-22 13:35:03', '2022-07-22 16:08:42');
INSERT INTO `sys_user_file` VALUES (174, 40, 'fAenQ8nvRjL7x0i0jEfuDBZHvJfHf3v6.jpg', 0, 164, '20220722/9787d2f5b37d4813a48b72e950d00395.jpg', 48228, 'image/jpeg', 0, 4, '2022-07-22 13:35:08', '2022-07-22 16:08:43');
INSERT INTO `sys_user_file` VALUES (175, 40, 'LrCTN2j94lo9N7wEql7cBr1Ux4rHMvmZ.jpg', 0, 164, '20220722/9dacd9d48efa483ab204ae8ad0b60864.jpg', 37320, 'image/jpeg', 0, 4, '2022-07-22 13:35:12', '2022-07-22 16:08:43');
INSERT INTO `sys_user_file` VALUES (176, 40, 'yeKvhT20lMU0f1T3Y743UlGEOLLnZSnp.jpg', 0, 164, '20220722/f74da7fd19524bc0a4e75e6159d041ac.jpg', 29040, 'image/jpeg', 0, 4, '2022-07-22 13:35:17', '2022-07-22 16:08:44');
INSERT INTO `sys_user_file` VALUES (177, 40, 'CyrCNmTJfv7D6GFAg39bjT3eRkkRm5dI.jpg', 0, 164, '20220722/7539f0f90c4749cbbb56b111e2b8d6af.jpg', 39560, 'image/jpeg', 0, 4, '2022-07-22 13:35:26', '2022-07-22 16:08:45');
INSERT INTO `sys_user_file` VALUES (178, 40, 'faa0202700ee455b90fe77d8bef98bc0.jpg', 0, 165, '20220722/5079a6bc43b64bf2b86b87275dfaf7a2.jpg', 10250, 'image/jpeg', 0, 4, '2022-07-22 13:36:21', '2022-07-22 16:08:45');
INSERT INTO `sys_user_file` VALUES (179, 40, 'fe9196dd091e438fba115205c1003ee7.jpg', 0, 165, '20220722/db6740d4bb6e4938a8ce502a6af4554d.jpg', 10726, 'image/jpeg', 0, 4, '2022-07-22 13:36:34', '2022-07-22 16:08:46');
INSERT INTO `sys_user_file` VALUES (180, 40, '21222950dc174485b2ec5088435a46a3.jpg', 0, 165, '20220722/ef84d66c378549e7807b98b64282d222.jpg', 15201, 'image/jpeg', 0, 4, '2022-07-22 13:37:49', '2022-07-22 16:08:47');
INSERT INTO `sys_user_file` VALUES (181, 40, 'adb3ad5e05614fd2a59cf886ffc37f74.jpg', 0, 165, '20220722/c326e31373084a83a99387ac7929ecc7.jpg', 12782, 'image/jpeg', 0, 4, '2022-07-22 13:37:53', '2022-07-22 16:08:47');
INSERT INTO `sys_user_file` VALUES (182, 40, 'b3ce64e10db7497b8b9f5a31df1b4eb2.jpg', 0, 165, '20220722/2f5d639d26e0478ea50935edde4fd229.jpg', 13086, 'image/jpeg', 0, 4, '2022-07-22 13:37:56', '2022-07-22 16:08:48');
INSERT INTO `sys_user_file` VALUES (183, 40, 'b6a811873e704db49db994053a5019b2.jpg', 0, 165, '20220722/8da9136eed1f41cb8d4907cb77199ca5.jpg', 12591, 'image/jpeg', 0, 4, '2022-07-22 13:38:00', '2022-07-22 16:08:49');
INSERT INTO `sys_user_file` VALUES (184, 40, 'be7dc0c24fc342fda44e12a2c2a2b7bb.jpg', 0, 165, '20220722/2576207113104107935e743b5d5cd52a.jpg', 13554, 'image/jpeg', 0, 4, '2022-07-22 13:38:09', '2022-07-22 16:08:49');
INSERT INTO `sys_user_file` VALUES (185, 40, 'c184eef391ae48dba87e3057e70238fb.jpg', 0, 165, '20220722/15528efcdd1042ad8fce23d0f36905df.jpg', 17857, 'image/jpeg', 0, 4, '2022-07-22 13:38:15', '2022-07-22 16:08:50');
INSERT INTO `sys_user_file` VALUES (186, 40, 'd3519518b00d42d3936b2ab5ce3a4cc3.jpg', 0, 165, '20220722/6b8cfc0ee93144d680375a5c588da1e4.jpg', 10333, 'image/jpeg', 0, 4, '2022-07-22 13:38:22', '2022-07-22 16:08:51');
INSERT INTO `sys_user_file` VALUES (187, 40, '8931360b593040238d894a542c9037bc.jpg', 0, 165, '20220722/0e88d170dc284263898422dba5de257c.jpg', 10377, 'image/jpeg', 0, 4, '2022-07-22 13:38:26', '2022-07-22 16:08:52');
INSERT INTO `sys_user_file` VALUES (188, 40, 'e36594e7423147748b2592ccb720ae9e.jpg', 0, 165, '20220722/14a5f30c639b450c9ac7c01bb18b26b5.jpg', 12451, 'image/jpeg', 0, 4, '2022-07-22 13:39:16', '2022-07-22 16:08:58');
INSERT INTO `sys_user_file` VALUES (189, 40, 'f6bc05af944a4f738b54128717952107.jpg', 0, 165, '20220722/d67c079e3f41407c826ef9a110145d49.jpg', 11724, 'image/jpeg', 0, 4, '2022-07-22 13:39:20', '2022-07-22 16:08:59');
INSERT INTO `sys_user_file` VALUES (190, 40, '0568caaf0a7e41dda2d901d4ac2f3243.jpg', 0, 165, '20220722/b8f43e929d6048a7b6354b0fe4fae440.jpg', 24290, 'image/jpeg', 0, 4, '2022-07-22 13:39:24', '2022-07-22 16:08:59');
INSERT INTO `sys_user_file` VALUES (191, 40, '0bfaa58e801b47fb9f56dcb128206d94.jpg', 0, 165, '20220722/ebc5a81452694c6787b4e77ea579a12f.jpg', 4578, 'image/jpeg', 0, 4, '2022-07-22 13:39:28', '2022-07-22 16:09:00');
INSERT INTO `sys_user_file` VALUES (192, 40, '12b3d575a2a24e0789a014bd6ce7585b.jpg', 0, 165, '20220722/1ba37747d5014a5e9f6f0de5771326c9.jpg', 20909, 'image/jpeg', 0, 4, '2022-07-22 13:39:32', '2022-07-22 16:09:01');
INSERT INTO `sys_user_file` VALUES (193, 40, '2d98970a51b34b6b859339c96b240dcd.jpg', 0, 165, '20220722/6389dd41857b499a93ce3c5ce050da45.jpg', 11855, 'image/jpeg', 0, 4, '2022-07-22 13:39:36', '2022-07-22 16:09:02');
INSERT INTO `sys_user_file` VALUES (194, 40, '3cc0f65fefbe448191aa728d80f6b97e.jpg', 0, 165, '20220722/bc90af738f2641abb497092781055030.jpg', 15237, 'image/jpeg', 0, 4, '2022-07-22 13:39:40', '2022-07-22 16:09:02');
INSERT INTO `sys_user_file` VALUES (195, 40, '41d81834e87546f49d3ff48c3806ea92.jpg', 0, 165, '20220722/d08de988712a40e2b315ddbff750e730.jpg', 10983, 'image/jpeg', 0, 4, '2022-07-22 13:39:45', '2022-07-22 16:09:03');
INSERT INTO `sys_user_file` VALUES (196, 40, '4e60a84551fa48439bf42ecdb9673331.jpg', 0, 165, '20220722/5f5d6d56e4a74744906c542685770c28.jpg', 12075, 'image/jpeg', 0, 4, '2022-07-22 13:39:49', '2022-07-22 16:09:04');
INSERT INTO `sys_user_file` VALUES (197, 40, '66e6f6c60cfa44b288d6343027b544d0.jpg', 0, 165, '20220722/da9cb7ee91c04dedb462aebaa9321e15.jpg', 8346, 'image/jpeg', 0, 4, '2022-07-22 13:39:53', '2022-07-22 16:09:04');
INSERT INTO `sys_user_file` VALUES (198, 40, 'd6442cfa99b64b51aabfc470055b05dc.jpg', 0, 165, '20220722/b4fa02e6f1834586a05cede521394960.jpg', 14678, 'image/jpeg', 0, 4, '2022-07-22 13:39:58', '2022-07-22 16:09:05');
INSERT INTO `sys_user_file` VALUES (199, 40, '948344a2a77c47a7a7b332fe12ff749a.jpg', 0, 165, '20220722/a9e7971f1b084cf1a69544ae984ee9f7.jpg', 14334, 'image/jpeg', 0, 4, '2022-07-22 13:40:04', '2022-07-22 16:09:05');
INSERT INTO `sys_user_file` VALUES (200, 40, '20200708230820.png', 0, 158, '20220722/530578a3237745d791106053856f162f.png', 3799, 'image/png', 0, 4, '2022-07-22 13:52:55', '2022-07-22 16:09:06');
INSERT INTO `sys_user_file` VALUES (201, 40, 'china-provinces.geo.json', 0, 158, '20220722/74fc77a305f341f0a40d2448efaa047d.json', 54238, 'application/json', 0, 4, '2022-07-22 13:55:46', '2022-07-22 16:09:07');
INSERT INTO `sys_user_file` VALUES (202, 40, 'word.geo.json', 0, 158, '20220722/6f4b5f19e7754120868c810c5fcbeeb6.json', 1504924, 'application/json', 0, 4, '2022-07-22 13:55:51', '2022-07-22 16:09:08');
INSERT INTO `sys_user_file` VALUES (203, 40, '20200708224450.pdf', 0, 158, '20220722/21a93c2641b5486aae6d29b46a353073.pdf', 839977, 'application/pdf', 0, 4, '2022-07-22 13:55:55', '2022-07-22 16:09:10');
INSERT INTO `sys_user_file` VALUES (204, 40, '20200708224450.docx', 0, 158, '20220722/4a4f2df9ba4249e9b00df0427691ce57.docx', 2586229, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 0, 4, '2022-07-22 13:55:58', '2022-07-22 16:09:10');
INSERT INTO `sys_user_file` VALUES (205, 40, 'document.json', 0, 158, '20220722/e988a1140259460095dd154a0ab54ff0.json', 1675, 'application/json', 0, 4, '2022-07-22 13:57:16', '2022-07-22 16:09:11');
INSERT INTO `sys_user_file` VALUES (206, 40, 'archive.json', 0, 158, '20220722/fab7f40d28c44000b104205bd6d9e227.json', 1998, 'application/json', 0, 4, '2022-07-22 13:57:19', '2022-07-22 16:09:13');
INSERT INTO `sys_user_file` VALUES (207, 40, 'eleadmin-copyright.jpg', 0, 158, '20220722/881ef0f83ef347a18177ee26ccb33d1a.jpg', 79297, 'image/jpeg', 0, 4, '2022-07-22 13:57:23', '2022-07-22 16:09:14');
INSERT INTO `sys_user_file` VALUES (208, 40, 'eleadmin-pro-copyright.jpg', 0, 158, '20220722/b7bac0f9abdb4b0f94b911940a77ad3b.jpg', 151976, 'image/jpeg', 0, 4, '2022-07-22 13:57:25', '2022-07-22 16:09:16');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `tenant_id` int(11) NOT NULL DEFAULT 1 COMMENT '租户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sys_user_role`(`user_id`) USING BTREE,
  INDEX `FK_sys_user_role_role`(`role_id`) USING BTREE,
  INDEX `tenant_id`(`tenant_id`) USING BTREE,
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_user_role_ibfk_3` FOREIGN KEY (`tenant_id`) REFERENCES `sys_tenant` (`tenant_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, 1, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (2, 2, 2, 1, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (3, 3, 2, 1, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (4, 4, 2, 1, '2021-05-21 15:23:41', '2023-02-07 09:20:33');
INSERT INTO `sys_user_role` VALUES (5, 5, 2, 1, '2021-05-21 15:23:41', '2021-10-18 02:29:00');
INSERT INTO `sys_user_role` VALUES (6, 6, 2, 1, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (7, 7, 2, 1, '2021-05-21 15:23:41', '2023-02-07 09:20:33');
INSERT INTO `sys_user_role` VALUES (8, 8, 2, 1, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (9, 9, 2, 1, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (10, 10, 2, 1, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (11, 11, 2, 1, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (12, 12, 2, 1, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (13, 13, 2, 1, '2021-05-21 15:23:41', '2023-02-07 09:20:33');
INSERT INTO `sys_user_role` VALUES (14, 14, 4, 2, '2021-05-21 15:23:41', '2023-02-07 09:20:33');
INSERT INTO `sys_user_role` VALUES (15, 15, 5, 2, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (16, 16, 5, 2, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (17, 17, 5, 2, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (18, 18, 5, 2, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (19, 19, 5, 2, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (20, 20, 5, 2, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (21, 21, 5, 2, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (22, 22, 5, 2, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (23, 23, 5, 2, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (24, 24, 5, 2, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (25, 25, 5, 2, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (26, 26, 5, 2, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (27, 27, 7, 3, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (28, 28, 8, 3, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (29, 29, 8, 3, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (30, 30, 8, 3, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (31, 31, 8, 3, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (32, 32, 8, 3, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (33, 33, 8, 3, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (34, 34, 8, 3, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (35, 35, 8, 3, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (36, 36, 8, 3, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (37, 37, 8, 3, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (38, 38, 8, 3, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (39, 39, 8, 3, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (42, 42, 11, 4, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (43, 43, 11, 4, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (44, 44, 11, 4, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (45, 45, 11, 4, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (46, 46, 11, 4, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (47, 47, 11, 4, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (48, 48, 11, 4, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (49, 49, 11, 4, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (50, 50, 11, 4, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (51, 51, 11, 4, '2021-05-21 15:23:41', '2021-10-13 21:45:16');
INSERT INTO `sys_user_role` VALUES (53, 52, 11, 4, '2023-05-27 12:13:29', '2023-05-27 12:13:29');
INSERT INTO `sys_user_role` VALUES (57, 41, 11, 4, '2023-05-28 21:33:14', '2023-05-28 21:33:14');
INSERT INTO `sys_user_role` VALUES (58, 40, 10, 4, '2023-05-28 21:33:18', '2023-05-28 21:33:18');

SET FOREIGN_KEY_CHECKS = 1;
