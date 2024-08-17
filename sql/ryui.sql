/*
 Navicat Premium Dump SQL

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : ryui

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 18/08/2024 03:05:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `form_col_num` int NULL DEFAULT 1 COMMENT '表单布局（单列 双列 三列）',
  `gen_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'pyzx_sushe_sub', '宿舍检查明细表', '', NULL, 'PyzxSusheSub', 'crud', 'com.ruoyi.project.pyzx', 'pyzxsub', 'sub', '宿舍检查明细', '落叶', 1, '0', '/', '{\"parentMenuId\":\"2013\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"宿舍检查\",\"treeCode\":\"\"}', 'admin', '2024-08-16 14:58:26', '', '2024-08-18 02:40:55', '');
INSERT INTO `gen_table` VALUES (2, 'pyzx_sushe_main', '宿舍检查表', 'pyzx_sushe_sub', 'pid', 'PyzxSusheMain', 'sub', 'com.ruoyi.project.pyzx', 'pyzxdormitory', 'dormitory', '宿舍检查记录', '落叶', 1, '0', '/', '{\"parentMenuId\":\"2013\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"宿舍检查\",\"treeCode\":\"\"}', 'admin', '2024-08-16 14:59:16', '', '2024-08-16 15:25:31', '');
INSERT INTO `gen_table` VALUES (3, 'pyzx_moral_details', '日常德育记录表', '', NULL, 'PyzxMoralDetails', 'crud', 'com.ruoyi.project.pyzx', 'pyzxeducation', 'education', '日常德育记录', '落叶', 1, '0', '/', '{\"parentMenuId\":\"2022\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"德育记录\",\"treeCode\":\"\"}', 'admin', '2024-08-16 17:15:38', '', '2024-08-18 02:22:16', '');
INSERT INTO `gen_table` VALUES (5, 'pyzx_moral_education', '日常登记', 'pyzx_moral_details', 'id', 'PyzxMoralEducation', 'sub', 'com.ruoyi.project.pyzx', 'pyzxeducation', 'education', '日常登记', 'ruoyi', 1, '0', '/', '{\"parentMenuId\":\"2022\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"德育记录\",\"treeCode\":\"\"}', 'admin', '2024-08-16 17:16:46', '', '2024-08-16 17:50:19', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '主键', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-16 14:58:26', NULL, '2024-08-18 02:40:55');
INSERT INTO `gen_table_column` VALUES (3, 1, 'grade', '年级', 'varchar(20)', 'String', 'grade', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'select', 'sys_dept_list', 5, 'admin', '2024-08-16 14:58:26', NULL, '2024-08-18 02:40:55');
INSERT INTO `gen_table_column` VALUES (4, 1, 'stuclass', '班级', 'varchar(20)', 'String', 'stuclass', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'select', 'pyzx_student_class', 6, 'admin', '2024-08-16 14:58:26', NULL, '2024-08-18 02:40:55');
INSERT INTO `gen_table_column` VALUES (5, 1, 'room', '宿舍号', 'int', 'Long', 'room', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-08-16 14:58:26', NULL, '2024-08-18 02:40:55');
INSERT INTO `gen_table_column` VALUES (6, 1, 'bad', '床号', 'int', 'Long', 'bad', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2024-08-16 14:58:26', NULL, '2024-08-18 02:40:55');
INSERT INTO `gen_table_column` VALUES (7, 1, 'sex', '性别', 'int', 'Long', 'sex', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'select', 'sys_user_sex', 9, 'admin', '2024-08-16 14:58:26', NULL, '2024-08-18 02:40:55');
INSERT INTO `gen_table_column` VALUES (8, 1, 'standard', '扣分', 'decimal(11,2)', 'BigDecimal', 'standard', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2024-08-16 14:58:26', NULL, '2024-08-18 02:40:55');
INSERT INTO `gen_table_column` VALUES (9, 1, 'standardreason', '扣分原因', 'varchar(255)', 'String', 'standardreason', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2024-08-16 14:58:26', NULL, '2024-08-18 02:40:55');
INSERT INTO `gen_table_column` VALUES (10, 1, 'checkdate', '检查日期', 'date', 'Date', 'checkdate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 12, 'admin', '2024-08-16 14:58:26', NULL, '2024-08-18 02:40:55');
INSERT INTO `gen_table_column` VALUES (13, 1, 'create_by', '创建人', 'varchar(20)', 'String', 'createBy', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2024-08-16 14:58:26', NULL, '2024-08-18 02:40:55');
INSERT INTO `gen_table_column` VALUES (14, 2, 'id', '主键', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-16 14:59:16', NULL, '2024-08-16 15:25:31');
INSERT INTO `gen_table_column` VALUES (15, 2, 'weekname', '周名称', 'varchar(20)', 'String', 'weekname', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_week_name', 2, 'admin', '2024-08-16 14:59:16', NULL, '2024-08-16 15:25:31');
INSERT INTO `gen_table_column` VALUES (16, 2, 'weeknum', '周数', 'varchar(20)', 'String', 'weeknum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_week_num', 3, 'admin', '2024-08-16 14:59:16', NULL, '2024-08-16 15:25:31');
INSERT INTO `gen_table_column` VALUES (17, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2024-08-16 14:59:16', NULL, '2024-08-16 15:25:31');
INSERT INTO `gen_table_column` VALUES (18, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2024-08-16 14:59:16', NULL, '2024-08-16 15:25:31');
INSERT INTO `gen_table_column` VALUES (19, 2, 'create_by', '创建人', 'varchar(20)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-08-16 14:59:16', NULL, '2024-08-16 15:25:31');
INSERT INTO `gen_table_column` VALUES (20, 2, 'checked_by', '检查人', 'varchar(20)', 'String', 'checkedBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-08-16 14:59:16', NULL, '2024-08-16 15:25:31');
INSERT INTO `gen_table_column` VALUES (21, 3, 'id', '主键', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-16 17:15:38', NULL, '2024-08-18 02:22:16');
INSERT INTO `gen_table_column` VALUES (23, 3, 'stuclass', '班级', 'varchar(20)', 'String', 'stuclass', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'select', 'pyzx_student_class', 4, 'admin', '2024-08-16 17:15:38', NULL, '2024-08-18 02:22:16');
INSERT INTO `gen_table_column` VALUES (24, 3, 'name', '姓名', 'varchar(20)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', 'pyzx_student_name', 5, 'admin', '2024-08-16 17:15:38', NULL, '2024-08-18 02:22:16');
INSERT INTO `gen_table_column` VALUES (25, 3, 'sex', '性别', 'int', 'Long', 'sex', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'select', 'pyzx_student_sex', 6, 'admin', '2024-08-16 17:15:38', NULL, '2024-08-18 02:22:16');
INSERT INTO `gen_table_column` VALUES (26, 3, 'point', '加分', 'decimal(11,2)', 'BigDecimal', 'point', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2024-08-16 17:15:38', NULL, '2024-08-18 02:22:16');
INSERT INTO `gen_table_column` VALUES (27, 3, 'reason', '加分原因', 'varchar(255)', 'String', 'reason', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2024-08-16 17:15:38', NULL, '2024-08-18 02:22:16');
INSERT INTO `gen_table_column` VALUES (28, 3, 'standard', '扣分', 'decimal(11,2)', 'BigDecimal', 'standard', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2024-08-16 17:15:38', NULL, '2024-08-18 02:22:16');
INSERT INTO `gen_table_column` VALUES (29, 3, 'standardreason', '扣分原因', 'varchar(255)', 'String', 'standardreason', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2024-08-16 17:15:38', NULL, '2024-08-18 02:22:16');
INSERT INTO `gen_table_column` VALUES (30, 3, 'checkdate', '检查日期', 'date', 'Date', 'checkdate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2024-08-16 17:15:38', NULL, '2024-08-18 02:22:16');
INSERT INTO `gen_table_column` VALUES (33, 3, 'create_by', '创建人', 'varchar(20)', 'String', 'createBy', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2024-08-16 17:15:38', NULL, '2024-08-18 02:22:16');
INSERT INTO `gen_table_column` VALUES (41, 5, 'id', '主键', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-16 17:16:46', NULL, '2024-08-16 17:50:19');
INSERT INTO `gen_table_column` VALUES (42, 5, 'weekname', '周名称', 'varchar(20)', 'String', 'weekname', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_week_name', 2, 'admin', '2024-08-16 17:16:46', NULL, '2024-08-16 17:50:19');
INSERT INTO `gen_table_column` VALUES (43, 5, 'weeknum', '周数', 'varchar(20)', 'String', 'weeknum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_week_num', 3, 'admin', '2024-08-16 17:16:46', NULL, '2024-08-16 17:50:19');
INSERT INTO `gen_table_column` VALUES (44, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2024-08-16 17:16:46', NULL, '2024-08-16 17:50:19');
INSERT INTO `gen_table_column` VALUES (45, 5, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2024-08-16 17:16:46', NULL, '2024-08-16 17:50:19');
INSERT INTO `gen_table_column` VALUES (46, 5, 'create_by', '创建人', 'varchar(20)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-08-16 17:16:46', NULL, '2024-08-16 17:50:19');
INSERT INTO `gen_table_column` VALUES (47, 5, 'checked_by', '检查人', 'varchar(20)', 'String', 'checkedBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-08-16 17:16:46', NULL, '2024-08-16 17:50:19');
INSERT INTO `gen_table_column` VALUES (48, 1, 'weeknum', '周数', 'varchar(20)', 'String', 'weeknum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_week_num', 2, '', '2024-08-18 00:04:08', NULL, '2024-08-18 02:40:55');
INSERT INTO `gen_table_column` VALUES (49, 1, 'weekname', '周名称', 'varchar(20)', 'String', 'weekname', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_week_name', 3, '', '2024-08-18 00:04:08', NULL, '2024-08-18 02:40:55');
INSERT INTO `gen_table_column` VALUES (50, 1, 'checked_by', '核对人', 'varchar(20)', 'String', 'checkedBy', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 14, '', '2024-08-18 00:04:08', NULL, '2024-08-18 02:40:55');
INSERT INTO `gen_table_column` VALUES (51, 3, 'weeknum', '周数', 'varchar(20)', 'String', 'weeknum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_week_num', 2, '', '2024-08-18 02:17:07', NULL, '2024-08-18 02:22:16');
INSERT INTO `gen_table_column` VALUES (52, 3, 'weekname', '周名称', 'varchar(20)', 'String', 'weekname', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_week_name', 3, '', '2024-08-18 02:17:07', NULL, '2024-08-18 02:22:16');
INSERT INTO `gen_table_column` VALUES (53, 3, 'checked_by', '核对人', 'varchar(20)', 'String', 'checkedBy', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 13, '', '2024-08-18 02:17:07', NULL, '2024-08-18 02:22:16');
INSERT INTO `gen_table_column` VALUES (54, 1, 'name', '姓名', 'varchar(20)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', 'pyzx_student_name', 4, '', '2024-08-18 02:23:46', NULL, '2024-08-18 02:40:55');

-- ----------------------------
-- Table structure for pyzx_moral_details
-- ----------------------------
DROP TABLE IF EXISTS `pyzx_moral_details`;
CREATE TABLE `pyzx_moral_details`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `weeknum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '周数',
  `weekname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '周名称',
  `stuclass` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '班级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` int NULL DEFAULT NULL COMMENT '性别',
  `point` decimal(11, 2) NULL DEFAULT NULL COMMENT '加分',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '加分原因',
  `standard` decimal(11, 2) NULL DEFAULT NULL COMMENT '扣分',
  `standardreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '扣分原因',
  `checkdate` date NULL DEFAULT NULL COMMENT '检查日期',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '创建人',
  `checked_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '核对人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_estonian_ci COMMENT = '日常德育记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pyzx_moral_details
-- ----------------------------
INSERT INTO `pyzx_moral_details` VALUES (8, NULL, NULL, '23电子2班', NULL, NULL, 20.00, '', NULL, '测试', NULL, NULL, NULL);
INSERT INTO `pyzx_moral_details` VALUES (40, NULL, NULL, '23电子2班', NULL, NULL, 20.00, '', NULL, '测试', NULL, NULL, NULL);
INSERT INTO `pyzx_moral_details` VALUES (41, NULL, NULL, '23电子2班', NULL, NULL, 20.00, '测试', 20.00, '测试', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pyzx_sushe_sub
-- ----------------------------
DROP TABLE IF EXISTS `pyzx_sushe_sub`;
CREATE TABLE `pyzx_sushe_sub`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `weeknum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '周数',
  `weekname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '周名称',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '姓名',
  `grade` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '年级',
  `stuclass` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '班级',
  `room` int NULL DEFAULT NULL COMMENT '宿舍号',
  `bad` int NULL DEFAULT NULL COMMENT '床号',
  `sex` int NULL DEFAULT NULL COMMENT '性别',
  `standard` decimal(11, 2) NULL DEFAULT NULL COMMENT '扣分标准',
  `standardreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '扣分原因',
  `checkdate` date NULL DEFAULT NULL COMMENT '检查日期',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '创建人',
  `checked_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_estonian_ci NULL DEFAULT NULL COMMENT '核对人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_estonian_ci COMMENT = '宿舍检查明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pyzx_sushe_sub
-- ----------------------------
INSERT INTO `pyzx_sushe_sub` VALUES (41, '第1周', '星期一', NULL, '二年级', '23电子2班', 420, 1, 0, 1.00, '1', '2024-08-18', NULL, '');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-08-16 09:18:46', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-08-16 09:18:46', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-08-16 09:18:46', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-08-16 09:18:46', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2024-08-16 09:18:46', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2024-08-16 09:18:46', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2024-08-16 09:18:46', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2024-08-16 09:18:46', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2024-08-16 09:18:46', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2024-08-16 09:18:46', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (11, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-08-16 09:18:46', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '23电子2班', 0, '张舒媚', '15888888888', 'xxx@qq.com', '0', '0', 'admin', '2024-08-16 09:18:45', 'admin', '2024-08-16 09:47:59');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '班委', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-16 09:18:45', 'admin', '2024-08-18 02:47:25');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '课代表', 2, '若依', '15888888888', 'ry@qq.com', '1', '0', 'admin', '2024-08-16 09:18:45', 'admin', '2024-08-18 02:50:28');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '主管部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-16 09:18:45', 'admin', '2024-08-18 02:48:56');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '劳动部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-16 09:18:45', 'admin', '2024-08-18 02:47:50');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '学习部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-16 09:18:45', 'admin', '2024-08-18 02:48:03');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '宣传部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-16 09:18:45', 'admin', '2024-08-18 02:48:28');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-08-16 09:18:45', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '1', '2', 'admin', '2024-08-16 09:18:45', 'admin', '2024-08-18 02:50:16');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '1', '2', 'admin', '2024-08-16 09:18:45', 'admin', '2024-08-18 02:50:19');
INSERT INTO `sys_dept` VALUES (200, 101, '0,100,101', '体委部门', 6, NULL, NULL, NULL, '0', '0', 'admin', '2024-08-18 02:49:41', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 101, '0,100,101', '值日部门', 7, NULL, NULL, NULL, '0', '0', 'admin', '2024-08-18 02:49:59', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-08-16 09:18:46', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (108, 1, '星期一', '星期一', 'sys_week_name', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '星期一');
INSERT INTO `sys_dict_data` VALUES (109, 2, '星期二', '星期二', 'sys_week_name', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '星期二');
INSERT INTO `sys_dict_data` VALUES (110, 3, '星期三', '星期三', 'sys_week_name', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '星期三');
INSERT INTO `sys_dict_data` VALUES (111, 4, '星期四', '星期四', 'sys_week_name', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '星期四');
INSERT INTO `sys_dict_data` VALUES (112, 5, '星期五', '星期五', 'sys_week_name', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '星期五');
INSERT INTO `sys_dict_data` VALUES (113, 6, '星期六', '星期六', 'sys_week_name', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '星期六');
INSERT INTO `sys_dict_data` VALUES (114, 7, '星期日', '星期日', 'sys_week_name', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '星期日');
INSERT INTO `sys_dict_data` VALUES (115, 1, '第1周', '第1周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第一周');
INSERT INTO `sys_dict_data` VALUES (116, 2, '第2周', '第2周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第二周');
INSERT INTO `sys_dict_data` VALUES (117, 3, '第3周', '第3周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第三周');
INSERT INTO `sys_dict_data` VALUES (118, 4, '第4周', '第4周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第四周');
INSERT INTO `sys_dict_data` VALUES (119, 5, '第5周', '第5周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第五周');
INSERT INTO `sys_dict_data` VALUES (120, 6, '第6周', '第6周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第六周');
INSERT INTO `sys_dict_data` VALUES (121, 7, '第7周', '第7周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第七周');
INSERT INTO `sys_dict_data` VALUES (122, 8, '第8周', '第8周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第八周');
INSERT INTO `sys_dict_data` VALUES (123, 9, '第9周', '第9周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第九周');
INSERT INTO `sys_dict_data` VALUES (124, 10, '第10周', '第10周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第十周');
INSERT INTO `sys_dict_data` VALUES (125, 11, '第11周', '第11周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第十一周');
INSERT INTO `sys_dict_data` VALUES (126, 12, '第12周', '第12周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第十二周');
INSERT INTO `sys_dict_data` VALUES (127, 13, '第13周', '第13周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第十三周');
INSERT INTO `sys_dict_data` VALUES (128, 14, '第14周', '第14周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第十四周');
INSERT INTO `sys_dict_data` VALUES (129, 15, '第15周', '第15周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第十五周');
INSERT INTO `sys_dict_data` VALUES (130, 16, '第16周', '第16周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第十六周');
INSERT INTO `sys_dict_data` VALUES (131, 17, '第17周', '第17周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第十七周');
INSERT INTO `sys_dict_data` VALUES (132, 18, '第18周', '第18周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第十八周');
INSERT INTO `sys_dict_data` VALUES (133, 19, '第19周', '第19周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第十九周');
INSERT INTO `sys_dict_data` VALUES (134, 20, '第20周', '第20周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第二十周');
INSERT INTO `sys_dict_data` VALUES (135, 21, '第21周', '第21周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第二十一周');
INSERT INTO `sys_dict_data` VALUES (136, 22, '第22周', '第22周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第二十二周');
INSERT INTO `sys_dict_data` VALUES (137, 23, '第23周', '第23周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第二十三周');
INSERT INTO `sys_dict_data` VALUES (138, 24, '第24周', '第24周', 'sys_week_num', NULL, NULL, 'Y', '0', 'admin', '2024-08-16 14:14:48', '', NULL, '第二十四周');
INSERT INTO `sys_dict_data` VALUES (139, 1, '23电子2班', '23电子2班', 'pyzx_student_class', '23电子2班', 'default', 'Y', '0', 'admin', '2024-08-16 17:39:28', 'admin', '2024-08-18 00:20:04', '23电子2班');
INSERT INTO `sys_dict_data` VALUES (140, 3, '一年级', '一年级', 'sys_dept_list', '一年级', 'default', 'Y', '0', 'admin', '2024-08-18 00:21:33', 'admin', '2024-08-18 00:22:55', '一年级');
INSERT INTO `sys_dict_data` VALUES (141, 1, '二年级', '二年级', 'sys_dept_list', '二年级', 'default', 'Y', '0', 'admin', '2024-08-18 00:22:01', 'admin', '2024-08-18 00:23:05', '二年级');
INSERT INTO `sys_dict_data` VALUES (142, 2, '三年级', '三年级', 'sys_dept_list', '三年级', 'default', 'Y', '0', 'admin', '2024-08-18 00:22:31', 'admin', '2024-08-18 00:23:11', '三年级');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '周名称', 'sys_week_name', '0', 'admin', '2024-08-16 11:26:14', '', NULL, '星期一至星期日');
INSERT INTO `sys_dict_type` VALUES (101, '周数', 'sys_week_num', '0', 'admin', '2024-08-16 11:26:57', '', NULL, '第1周到第20周');
INSERT INTO `sys_dict_type` VALUES (102, '年级', 'sys_dept_list', '0', 'admin', '2024-08-16 15:00:48', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '学生性别', 'pyzx_student_sex', '0', 'admin', '2024-08-16 17:20:53', 'admin', '2024-08-16 17:21:29', '');
INSERT INTO `sys_dict_type` VALUES (104, '学生姓名', 'pyzx_student_name', '0', 'admin', '2024-08-16 17:21:16', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '班级', 'pyzx_student_class', '0', 'admin', '2024-08-16 17:22:20', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-08-16 09:18:46', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-08-16 09:18:46', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-08-16 09:18:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 09:20:21');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-16 09:23:17');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 09:29:07');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 09:38:31');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 09:54:40');
INSERT INTO `sys_logininfor` VALUES (105, 'chaojiweihu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-16 10:27:09');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-08-16 10:27:15');
INSERT INTO `sys_logininfor` VALUES (107, 'chaojiweihu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-08-16 10:27:33');
INSERT INTO `sys_logininfor` VALUES (108, 'chaojiweihu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误2次', '2024-08-16 10:28:04');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-08-16 10:29:54');
INSERT INTO `sys_logininfor` VALUES (110, 'chaojiweihi', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-08-16 10:30:06');
INSERT INTO `sys_logininfor` VALUES (111, 'chaojiweihu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-08-16 10:30:17');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-08-16 10:31:39');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 10:31:52');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-16 10:33:56');
INSERT INTO `sys_logininfor` VALUES (115, 'chaojiweihu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-08-16 10:34:02');
INSERT INTO `sys_logininfor` VALUES (116, 'chaojiweihu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-08-16 10:34:34');
INSERT INTO `sys_logininfor` VALUES (117, 'chaojiweihu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误2次', '2024-08-16 10:37:51');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-08-16 10:41:17');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-08-16 10:41:24');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 10:41:34');
INSERT INTO `sys_logininfor` VALUES (121, 'chaojiweihu', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-08-16 14:38:16');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 14:38:30');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 15:10:39');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 15:14:09');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 15:18:34');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 15:24:00');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 15:27:40');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 16:37:40');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 17:33:36');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 17:52:13');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-17 23:31:34');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-17 23:44:06');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-18 00:03:41');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-18 00:10:51');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-18 00:16:20');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-18 00:19:23');
INSERT INTO `sys_logininfor` VALUES (137, '赵班长', '192.168.6.212', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-08-18 00:29:28');
INSERT INTO `sys_logininfor` VALUES (138, '赵剑波', '240e:47c:10a8:6d45:17ec:2ebf:f31e:9d79', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '验证码错误', '2024-08-18 00:52:53');
INSERT INTO `sys_logininfor` VALUES (139, '赵剑波', '240e:47c:10a8:6d45:17ec:2ebf:f31e:9d79', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '验证码错误', '2024-08-18 00:53:09');
INSERT INTO `sys_logininfor` VALUES (140, '赵剑波', '240e:47c:10a8:6d45:17ec:2ebf:f31e:9d79', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '验证码错误', '2024-08-18 00:53:30');
INSERT INTO `sys_logininfor` VALUES (141, '赵剑波', '240e:47c:10a8:6d45:17ec:2ebf:f31e:9d79', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '用户不存在/密码错误', '2024-08-18 00:54:00');
INSERT INTO `sys_logininfor` VALUES (142, '赵班长', '240e:47c:10a8:6d45:17ec:2ebf:f31e:9d79', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-08-18 00:54:26');
INSERT INTO `sys_logininfor` VALUES (143, '赵班长', '2409:895a:c8a:8c81:e89c:ccff:fe5b:a8f5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2024-08-18 01:26:20');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-18 02:28:32');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-18 02:32:44');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-18 02:38:47');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-18 02:43:06');
INSERT INTO `sys_logininfor` VALUES (148, '赵班长', '192.168.6.207', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2024-08-18 03:00:50');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2042 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2024-08-16 09:18:45', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2024-08-16 09:18:45', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2024-08-16 09:18:45', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2024-08-16 09:18:45', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2024-08-16 09:18:45', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2024-08-16 09:18:45', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2024-08-16 09:18:45', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2024-08-16 09:18:45', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2024-08-16 09:18:45', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2024-08-16 09:18:45', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2024-08-16 09:18:45', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2024-08-16 09:18:45', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2024-08-16 09:18:45', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2024-08-16 09:18:45', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2024-08-16 09:18:45', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2024-08-16 09:18:45', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2024-08-16 09:18:45', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2024-08-16 09:18:45', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2024-08-16 09:18:45', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2024-08-16 09:18:45', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2024-08-16 09:18:45', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2024-08-16 09:18:45', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2024-08-16 09:18:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '宿舍检查', 0, 6, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-bank', 'admin', '2024-08-16 14:57:16', 'admin', '2024-08-18 03:01:54', '');
INSERT INTO `sys_menu` VALUES (2022, '德育记录', 0, 5, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-balance-scale', 'admin', '2024-08-16 17:27:24', 'admin', '2024-08-18 03:01:47', '');
INSERT INTO `sys_menu` VALUES (2023, '谈心谈话', 0, 7, '#', 'menuItem', 'M', '1', '1', '', 'fa fa-star-o', 'admin', '2024-08-16 17:28:28', 'admin', '2024-08-18 02:30:19', '');
INSERT INTO `sys_menu` VALUES (2030, '宿舍检查明细', 2013, 1, '/pyzxsub/sub', '', 'C', '0', '1', 'pyzxsub:sub:view', '#', 'admin', '2024-08-18 00:16:11', '', NULL, '宿舍检查明细菜单');
INSERT INTO `sys_menu` VALUES (2031, '宿舍检查明细查询', 2030, 1, '#', '', 'F', '0', '1', 'pyzxsub:sub:list', '#', 'admin', '2024-08-18 00:16:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '宿舍检查明细新增', 2030, 2, '#', '', 'F', '0', '1', 'pyzxsub:sub:add', '#', 'admin', '2024-08-18 00:16:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '宿舍检查明细修改', 2030, 3, '#', '', 'F', '0', '1', 'pyzxsub:sub:edit', '#', 'admin', '2024-08-18 00:16:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '宿舍检查明细删除', 2030, 4, '#', '', 'F', '0', '1', 'pyzxsub:sub:remove', '#', 'admin', '2024-08-18 00:16:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '宿舍检查明细导出', 2030, 5, '#', '', 'F', '0', '1', 'pyzxsub:sub:export', '#', 'admin', '2024-08-18 00:16:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '日常德育记录', 2022, 1, '/pyzxeducation/education', '', 'C', '0', '1', 'pyzxeducation:education:view', '#', 'admin', '2024-08-18 02:34:32', '', NULL, '日常德育记录菜单');
INSERT INTO `sys_menu` VALUES (2037, '日常德育记录查询', 2036, 1, '#', '', 'F', '0', '1', 'pyzxeducation:education:list', '#', 'admin', '2024-08-18 02:34:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '日常德育记录新增', 2036, 2, '#', '', 'F', '0', '1', 'pyzxeducation:education:add', '#', 'admin', '2024-08-18 02:34:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '日常德育记录修改', 2036, 3, '#', '', 'F', '0', '1', 'pyzxeducation:education:edit', '#', 'admin', '2024-08-18 02:34:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '日常德育记录删除', 2036, 4, '#', '', 'F', '0', '1', 'pyzxeducation:education:remove', '#', 'admin', '2024-08-18 02:34:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '日常德育记录导出', 2036, 5, '#', '', 'F', '0', '1', 'pyzxeducation:education:export', '#', 'admin', '2024-08-18 02:34:32', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (10, '测试', '2', 0x3C703EE6B58BE8AF953C2F703E, '0', 'admin', '2024-08-18 00:44:12', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 274 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"23电子2班\"],\"orderNum\":[\"0\"],\"leader\":[\"温\"],\"phone\":[\"15888888888\"],\"email\":[\"xxx@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 09:46:50', 179);
INSERT INTO `sys_oper_log` VALUES (101, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"23电子2班\"],\"deptName\":[\"班干部\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 09:47:30', 49);
INSERT INTO `sys_oper_log` VALUES (102, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"23电子2班\"],\"orderNum\":[\"0\"],\"leader\":[\"张舒媚\"],\"phone\":[\"15888888888\"],\"email\":[\"xxx@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 09:47:59', 27);
INSERT INTO `sys_oper_log` VALUES (103, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"102\"],\"parentId\":[\"100\"],\"parentName\":[\"23电子2班\"],\"deptName\":[\"课代表\"],\"orderNum\":[\"2\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 09:48:14', 47);
INSERT INTO `sys_oper_log` VALUES (104, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"维护\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', NULL, 1, '不允许操作超级管理员用户', '2024-08-16 09:50:38', 2);
INSERT INTO `sys_oper_log` VALUES (105, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"维护\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', NULL, 1, '不允许操作超级管理员用户', '2024-08-16 09:50:45', 0);
INSERT INTO `sys_oper_log` VALUES (106, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"维护\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 09:53:05', 115);
INSERT INTO `sys_oper_log` VALUES (107, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"D:\\\\ruoyi\\\\uploadPath\\\\avatar\\\\2024\\\\08\\\\16\\\\blob_20240816095332A001.png: 设备未就绪。\",\"code\":500}', 0, NULL, '2024-08-16 09:53:32', 133);
INSERT INTO `sys_oper_log` VALUES (108, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 09:55:18', 205);
INSERT INTO `sys_oper_log` VALUES (109, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"维护\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 09:55:23', 63);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-08-16 10:13:20', 14);
INSERT INTO `sys_oper_log` VALUES (111, '角色管理', 1, 'com.ruoyi.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"班干部\"],\"roleKey\":[\"cadre\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"班干部\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 10:25:06', 51);
INSERT INTO `sys_oper_log` VALUES (112, '角色管理', 1, 'com.ruoyi.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"班干部\"],\"roleKey\":[\"cadre\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"班干部\"],\"menuIds\":[\"\"]}', '{\"msg\":\"新增角色\'班干部\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2024-08-16 10:25:06', 6);
INSERT INTO `sys_oper_log` VALUES (113, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"班干部\"],\"roleKey\":[\"cadre\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"班干部\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 10:25:40', 26);
INSERT INTO `sys_oper_log` VALUES (114, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', 'POST', 1, 'chaojiweihu', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"班干部\"],\"roleKey\":[\"cadre\"],\"dataScope\":[\"3\"],\"deptIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 10:26:22', 38);
INSERT INTO `sys_oper_log` VALUES (115, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', 'POST', 1, 'chaojiweihu', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"班干部\"],\"roleKey\":[\"cadre\"],\"dataScope\":[\"3\"],\"deptIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 10:26:22', 31);
INSERT INTO `sys_oper_log` VALUES (116, '重置密码', 2, 'com.ruoyi.project.system.user.controller.ProfileController.resetPwd()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 10:33:38', 29);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"宿舍管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:39:11', 126);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"宿舍管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"新增菜单\'宿舍管理\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2024-08-16 14:39:12', 10);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2001', '127.0.0.1', '内网IP', '2001', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:40:34', 29);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:40:38', 20);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2003', '127.0.0.1', '内网IP', '2003', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:40:42', 27);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2004', '127.0.0.1', '内网IP', '2004', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:40:46', 21);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2005', '127.0.0.1', '内网IP', '2005', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:53:20', 78);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2000', '127.0.0.1', '内网IP', '2000', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:53:23', 24);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2008', '127.0.0.1', '内网IP', '2008', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:54:48', 24);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2009', '127.0.0.1', '内网IP', '2009', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:54:54', 33);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2010', '127.0.0.1', '内网IP', '2010', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:54:59', 19);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2011', '127.0.0.1', '内网IP', '2011', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:55:02', 21);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2012', '127.0.0.1', '内网IP', '2012', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:55:05', 21);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2007', '127.0.0.1', '内网IP', '2007', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:55:25', 27);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"宿舍检查记录\"],\"url\":[\"\\\\pyzxdormitory\\\\dormitory\"],\"target\":[\"menuItem\"],\"perms\":[\"pyzxdormitory:dormitory:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:56:13', 21);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"宿舍检查\"],\"url\":[\"\\\\pyzxdormitory\\\\dormitory\"],\"target\":[\"menuItem\"],\"perms\":[\"pyzxdormitory:dormitory:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:56:35', 17);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2006', '127.0.0.1', '内网IP', '2006', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:56:52', 37);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"宿舍检查\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:57:16', 20);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2013\"],\"menuType\":[\"C\"],\"menuName\":[\"宿舍检查记录\"],\"url\":[\"\\\\pyzxdormitory\\\\dormitory\"],\"target\":[\"menuItem\"],\"perms\":[\"pyzxdormitory:dormitory:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:57:36', 18);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"pyzx_sushe_sub\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:58:26', 158);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"pyzx_sushe_sub\"],\"tableComment\":[\"宿舍检查明细表\"],\"className\":[\"PyzxSusheSub\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"父id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"pid\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"年级\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"grade\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"班级\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"stuclass\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"宿舍号\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"room\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"床号\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"bad\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"c', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:59:10', 123);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"pyzx_sushe_main\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 14:59:16', 61);
INSERT INTO `sys_oper_log` VALUES (139, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"年级\"],\"dictType\":[\"sys_dept_list\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 15:00:48', 21);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"pyzx_sushe_sub\"],\"tableComment\":[\"宿舍检查明细表\"],\"className\":[\"PyzxSusheSub\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"父id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"pid\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"年级\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"grade\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_dept_list\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"班级\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"stuclass\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"宿舍号\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"room\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"床号\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"bad\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 15:01:40', 80);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"pyzx_sushe_main\"],\"tableComment\":[\"宿舍检查表\"],\"className\":[\"PyzxSusheMain\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"14\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"15\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"周名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"weekname\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"sys_week_name\"],\"columns[2].columnId\":[\"16\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"周数\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"weeknum\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_week_num\"],\"columns[3].columnId\":[\"17\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"18\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"更新时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"updateTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"19\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建人\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"createBy\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"co', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 15:04:10', 52);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"pyzx_sushe_main\"],\"tableComment\":[\"宿舍检查表\"],\"className\":[\"PyzxSusheMain\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"14\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"15\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"周名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"weekname\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"sys_week_name\"],\"columns[2].columnId\":[\"16\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"周数\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"weeknum\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_week_num\"],\"columns[3].columnId\":[\"17\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"18\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"更新时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"updateTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"19\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建人\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"createBy\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 15:04:33', 37);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"pyzx_sushe_main\"]}', NULL, 0, NULL, '2024-08-16 15:11:34', 216);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 15:14:54', 141);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"pyzx_sushe_sub\"],\"tableComment\":[\"宿舍检查明细表\"],\"className\":[\"PyzxSusheSub\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"父id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"pid\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"年级\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"grade\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_dept_list\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"班级\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"stuclass\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"宿舍号\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"room\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"床号\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"bad\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 15:23:13', 135);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"pyzx_sushe_sub\"],\"tableComment\":[\"宿舍检查明细表\"],\"className\":[\"PyzxSusheSub\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"父id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"pid\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"年级\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"grade\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_dept_list\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"班级\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"stuclass\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"宿舍号\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"room\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"床号\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"bad\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 15:24:58', 142);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"pyzx_sushe_main\"],\"tableComment\":[\"宿舍检查表\"],\"className\":[\"PyzxSusheMain\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"14\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"15\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"周名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"weekname\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"sys_week_name\"],\"columns[2].columnId\":[\"16\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"周数\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"weeknum\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_week_num\"],\"columns[3].columnId\":[\"17\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"18\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"更新时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"updateTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"19\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建人\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"createBy\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 15:25:31', 64);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/pyzx_sushe_main', '127.0.0.1', '内网IP', '\"pyzx_sushe_main\"', NULL, 0, NULL, '2024-08-16 15:25:37', 324);
INSERT INTO `sys_oper_log` VALUES (149, '宿舍检查记录', 1, 'com.ruoyi.project.pyzx.dormitory.controller.PyzxSusheMainController.addSave()', 'POST', 1, 'admin', '研发部门', '/pyzxdormitory/dormitory/add', '127.0.0.1', '内网IP', '{\"weekname\":[\"星期一\"],\"weeknum\":[\"第1周\"],\"checkedBy\":[\"\"],\"index\":[\"1\"],\"pyzxSusheSubList[0].stuclass\":[\"\"],\"pyzxSusheSubList[0].room\":[\"\"],\"pyzxSusheSubList[0].bad\":[\"\"],\"pyzxSusheSubList[0].sex\":[\"0\"],\"pyzxSusheSubList[0].standard\":[\"\"],\"pyzxSusheSubList[0].standardreason\":[\"\"],\"pyzxSusheSubList[0].checkdate\":[\"\"],\"pyzxSusheSubList[0].createTime\":[\"\"],\"pyzxSusheSubList[0].updateTime\":[\"\"],\"pyzxSusheSubList[0].createBy\":[\"1\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 15:35:31', 159);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2015\"],\"menuType\":[\"F\"],\"menuName\":[\"宿舍检查记录详情\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"pyzxdormitory:dormitory:detail\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 15:48:35', 35);
INSERT INTO `sys_oper_log` VALUES (151, '宿舍检查记录', 5, 'com.ruoyi.project.pyzx.dormitory.controller.PyzxSusheMainController.export()', 'POST', 1, 'admin', '研发部门', '/pyzxdormitory/dormitory/export', '127.0.0.1', '内网IP', '{\"weekname\":[\"\"],\"weeknum\":[\"\"],\"checkedBy\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"71854fbf-9b01-47ad-b005-e208ada1118c_宿舍检查记录数据.xlsx\",\"code\":0}', 0, NULL, '2024-08-16 16:56:18', 1569);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/pyzx_sushe_main', '127.0.0.1', '内网IP', '\"pyzx_sushe_main\"', NULL, 0, NULL, '2024-08-16 17:02:19', 440);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"pyzx_moral_details,pyzx_moral_education\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:15:38', 260);
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:15:49', 23);
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"pyzx_moral_education\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:16:46', 85);
INSERT INTO `sys_oper_log` VALUES (156, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"学生姓名\"],\"dictType\":[\"pyzx_student_sex\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:20:53', 29);
INSERT INTO `sys_oper_log` VALUES (157, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"学生姓名\"],\"dictType\":[\"pyzx_student_name\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:21:16', 18);
INSERT INTO `sys_oper_log` VALUES (158, '字典类型', 2, 'com.ruoyi.project.system.dict.controller.DictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"103\"],\"dictName\":[\"学生性别\"],\"dictType\":[\"pyzx_student_sex\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:21:29', 42);
INSERT INTO `sys_oper_log` VALUES (159, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"班级\"],\"dictType\":[\"pyzx_student_class\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:22:20', 19);
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"pyzx_moral_details\"],\"tableComment\":[\"日常德育记录表\"],\"className\":[\"PyzxMoralDetails\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"21\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"22\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"父id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"pid\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"23\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"班级\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"stuclass\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"pyzx_student_class\"],\"columns[3].columnId\":[\"24\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"姓名\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"name\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"pyzx_student_name\"],\"columns[4].columnId\":[\"25\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"性别\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"sex\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"pyzx_student_sex\"],\"columns[5].columnId\":[\"26\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"加分\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"point\"],\"columns[5].isInsert\":[\"1\"],\"c', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:26:23', 81);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"德育记录\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-balance-scale\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:27:24', 35);
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"pyzx_moral_details\"],\"tableComment\":[\"日常德育记录表\"],\"className\":[\"PyzxMoralDetails\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"21\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"22\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"父id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"pid\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"23\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"班级\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"stuclass\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"pyzx_student_class\"],\"columns[3].columnId\":[\"24\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"姓名\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"name\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"pyzx_student_name\"],\"columns[4].columnId\":[\"25\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"性别\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"sex\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"pyzx_student_sex\"],\"columns[5].columnId\":[\"26\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"加分\"],\"columns[5].javaType\":[\"BigDecimal\"],\"columns[5].javaField\":[\"point\"],\"columns[5].isInsert\":[\"1\"],\"c', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:27:39', 72);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"谈心谈话\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-star-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:28:28', 22);
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"5\"],\"tableName\":[\"pyzx_moral_education\"],\"tableComment\":[\"日常登记\"],\"className\":[\"PyzxMoralEducation\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"41\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"42\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"周名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"weekname\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"sys_week_name\"],\"columns[2].columnId\":[\"43\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"周数\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"weeknum\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_week_num\"],\"columns[3].columnId\":[\"44\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"45\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"更新时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"updateTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"46\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建人\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"createBy\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:30:58', 49);
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/pyzx_moral_education', '127.0.0.1', '内网IP', '\"pyzx_moral_education\"', NULL, 0, NULL, '2024-08-16 17:31:06', 166);
INSERT INTO `sys_oper_log` VALUES (166, '日常登记', 1, 'com.ruoyi.project.pyzx.education.controller.PyzxMoralEducationController.addSave()', 'POST', 1, 'admin', '研发部门', '/pyzxeducation/education/add', '127.0.0.1', '内网IP', '{\"weekname\":[\"星期一\"],\"weeknum\":[\"第1周\"],\"checkedBy\":[\"1\"],\"index\":[\"1\"],\"pyzxMoralDetailsList[0].point\":[\"20\"],\"pyzxMoralDetailsList[0].reason\":[\"测试\"],\"pyzxMoralDetailsList[0].standard\":[\"20\"],\"pyzxMoralDetailsList[0].standardreason\":[\"测试\"],\"pyzxMoralDetailsList[0].checkdate\":[\"\"],\"pyzxMoralDetailsList[0].createTime\":[\"\"],\"pyzxMoralDetailsList[0].updateTime\":[\"\"],\"pyzxMoralDetailsList[0].createBy\":[\"1\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'stuclass\' cannot be null\r\n### The error may exist in file [C:\\Users\\服务端\\IdeaProjects\\RuoYi-fast(ui)\\target\\classes\\mybatis\\pyzxeducation\\PyzxMoralEducationMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into pyzx_moral_details( id, pid, stuclass, name, sex, point, reason, standard, standardreason, checkdate, create_time, update_time, create_by) values                        ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'stuclass\' cannot be null\n; Column \'stuclass\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'stuclass\' cannot be null', '2024-08-16 17:36:13', 147);
INSERT INTO `sys_oper_log` VALUES (167, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"201\"],\"dictValue\":[\"23电子2班\"],\"dictType\":[\"pyzx_student_class\"],\"cssClass\":[\"23电子2班\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"23电子2班\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:39:28', 20);
INSERT INTO `sys_oper_log` VALUES (168, '日常登记', 1, 'com.ruoyi.project.pyzx.education.controller.PyzxMoralEducationController.addSave()', 'POST', 1, 'admin', '研发部门', '/pyzxeducation/education/add', '127.0.0.1', '内网IP', '{\"weekname\":[\"星期一\"],\"weeknum\":[\"第1周\"],\"checkedBy\":[\"1\"],\"index\":[\"1\"],\"pyzxMoralDetailsList[0].stuclass\":[\"23电子2班\"],\"pyzxMoralDetailsList[0].point\":[\"20\"],\"pyzxMoralDetailsList[0].reason\":[\"测试\"],\"pyzxMoralDetailsList[0].standard\":[\"20\"],\"pyzxMoralDetailsList[0].standardreason\":[\"测试\"],\"pyzxMoralDetailsList[0].checkdate\":[\"\"],\"pyzxMoralDetailsList[0].createTime\":[\"\"],\"pyzxMoralDetailsList[0].updateTime\":[\"\"],\"pyzxMoralDetailsList[0].createBy\":[\"1\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:39:51', 18);
INSERT INTO `sys_oper_log` VALUES (169, '日常登记', 5, 'com.ruoyi.project.pyzx.education.controller.PyzxMoralEducationController.export()', 'POST', 1, 'admin', '研发部门', '/pyzxeducation/education/export', '127.0.0.1', '内网IP', '{\"weekname\":[\"\"],\"weeknum\":[\"\"],\"checkedBy\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"44571387-30b2-4cf6-9027-f4704a6ffe35_日常登记数据.xlsx\",\"code\":0}', 0, NULL, '2024-08-16 17:40:06', 124);
INSERT INTO `sys_oper_log` VALUES (170, '宿舍检查记录', 2, 'com.ruoyi.project.pyzx.dormitory.controller.PyzxSusheMainController.editSave()', 'POST', 1, 'admin', '研发部门', '/pyzxdormitory/dormitory/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"weekname\":[\"星期一\"],\"weeknum\":[\"第1周\"],\"checkedBy\":[\"\"],\"index\":[\"1\"],\"pyzxSusheSubList[0].stuclass\":[\"\"],\"pyzxSusheSubList[0].room\":[\"\"],\"pyzxSusheSubList[0].bad\":[\"\"],\"pyzxSusheSubList[0].sex\":[\"0\"],\"pyzxSusheSubList[0].standard\":[\"12\"],\"pyzxSusheSubList[0].standardreason\":[\"士大夫\"],\"pyzxSusheSubList[0].checkdate\":[\"\"],\"pyzxSusheSubList[0].createTime\":[\"\"],\"pyzxSusheSubList[0].updateTime\":[\"\"],\"pyzxSusheSubList[0].createBy\":[\"1\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:40:55', 62);
INSERT INTO `sys_oper_log` VALUES (171, '宿舍检查记录', 5, 'com.ruoyi.project.pyzx.dormitory.controller.PyzxSusheMainController.export()', 'POST', 1, 'admin', '研发部门', '/pyzxdormitory/dormitory/export', '127.0.0.1', '内网IP', '{\"weekname\":[\"\"],\"weeknum\":[\"\"],\"checkedBy\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"987f7657-a1c2-405c-a267-15819a2ca9b9_宿舍检查记录数据.xlsx\",\"code\":0}', 0, NULL, '2024-08-16 17:41:06', 50);
INSERT INTO `sys_oper_log` VALUES (172, '宿舍检查记录', 5, 'com.ruoyi.project.pyzx.dormitory.controller.PyzxSusheMainController.export()', 'POST', 1, 'admin', '研发部门', '/pyzxdormitory/dormitory/export', '127.0.0.1', '内网IP', '{\"weekname\":[\"\"],\"weeknum\":[\"\"],\"checkedBy\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"b8321e72-8e70-4414-a10a-b3b36866def3_宿舍检查记录数据.xlsx\",\"code\":0}', 0, NULL, '2024-08-16 17:41:16', 63);
INSERT INTO `sys_oper_log` VALUES (173, '日常登记', 1, 'com.ruoyi.project.pyzx.education.controller.PyzxMoralEducationController.addSave()', 'POST', 1, 'admin', '研发部门', '/pyzxeducation/education/add', '127.0.0.1', '内网IP', '{\"weekname\":[\"星期一\"],\"weeknum\":[\"第1周\"],\"checkedBy\":[\"\"],\"index\":[\"1\"],\"pyzxMoralDetailsList[0].stuclass\":[\"23电子2班\"],\"pyzxMoralDetailsList[0].point\":[\"20\"],\"pyzxMoralDetailsList[0].reason\":[\"\"],\"pyzxMoralDetailsList[0].standard\":[\"\"],\"pyzxMoralDetailsList[0].standardreason\":[\"测试\"],\"pyzxMoralDetailsList[0].checkdate\":[\"\"],\"pyzxMoralDetailsList[0].createTime\":[\"\"],\"pyzxMoralDetailsList[0].updateTime\":[\"\"],\"pyzxMoralDetailsList[0].createBy\":[\"\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:45:43', 23);
INSERT INTO `sys_oper_log` VALUES (174, '日常登记', 2, 'com.ruoyi.project.pyzx.education.controller.PyzxMoralEducationController.editSave()', 'POST', 1, 'admin', '研发部门', '/pyzxeducation/education/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"weekname\":[\"星期一\"],\"weeknum\":[\"第1周\"],\"checkedBy\":[\"\"],\"index\":[\"1\"],\"pyzxMoralDetailsList[0].stuclass\":[\"23电子2班\"],\"pyzxMoralDetailsList[0].point\":[\"20\"],\"pyzxMoralDetailsList[0].reason\":[\"\"],\"pyzxMoralDetailsList[0].standard\":[\"\"],\"pyzxMoralDetailsList[0].standardreason\":[\"测试\"],\"pyzxMoralDetailsList[0].checkdate\":[\"88899\"],\"pyzxMoralDetailsList[0].createTime\":[\"\"],\"pyzxMoralDetailsList[0].updateTime\":[\"\"],\"pyzxMoralDetailsList[0].createBy\":[\"\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:46:32', 32);
INSERT INTO `sys_oper_log` VALUES (175, '日常登记', 2, 'com.ruoyi.project.pyzx.education.controller.PyzxMoralEducationController.editSave()', 'POST', 1, 'admin', '研发部门', '/pyzxeducation/education/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"weekname\":[\"星期一\"],\"weeknum\":[\"第1周\"],\"checkedBy\":[\"1\"],\"index\":[\"1\"],\"pyzxMoralDetailsList[0].stuclass\":[\"23电子2班\"],\"pyzxMoralDetailsList[0].point\":[\"20\"],\"pyzxMoralDetailsList[0].reason\":[\"测试\"],\"pyzxMoralDetailsList[0].standard\":[\"20\"],\"pyzxMoralDetailsList[0].standardreason\":[\"测试\"],\"pyzxMoralDetailsList[0].checkdate\":[\"88899\"],\"pyzxMoralDetailsList[0].createTime\":[\"\"],\"pyzxMoralDetailsList[0].updateTime\":[\"\"],\"pyzxMoralDetailsList[0].createBy\":[\"1\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:47:10', 33);
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"5\"],\"tableName\":[\"pyzx_moral_education\"],\"tableComment\":[\"日常登记\"],\"className\":[\"PyzxMoralEducation\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"41\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"42\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"周名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"weekname\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"sys_week_name\"],\"columns[2].columnId\":[\"43\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"周数\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"weeknum\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_week_num\"],\"columns[3].columnId\":[\"44\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"45\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"更新时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"updateTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"46\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建人\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"createBy\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:50:19', 90);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/pyzx_moral_education', '127.0.0.1', '内网IP', '\"pyzx_moral_education\"', NULL, 0, NULL, '2024-08-16 17:50:28', 216);
INSERT INTO `sys_oper_log` VALUES (178, '日常登记', 2, 'com.ruoyi.project.pyzx.education.controller.PyzxMoralEducationController.editSave()', 'POST', 1, 'admin', '研发部门', '/pyzxeducation/education/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"weekname\":[\"星期一\"],\"weeknum\":[\"第1周\"],\"checkedBy\":[\"1\"],\"index\":[\"1\"],\"pyzxMoralDetailsList[0].pid\":[\"1111\"],\"pyzxMoralDetailsList[0].stuclass\":[\"23电子2班\"],\"pyzxMoralDetailsList[0].point\":[\"20\"],\"pyzxMoralDetailsList[0].reason\":[\"\"],\"pyzxMoralDetailsList[0].standard\":[\"\"],\"pyzxMoralDetailsList[0].standardreason\":[\"测试\"],\"pyzxMoralDetailsList[0].checkdate\":[\"\"],\"pyzxMoralDetailsList[0].createTime\":[\"\"],\"pyzxMoralDetailsList[0].updateTime\":[\"\"],\"pyzxMoralDetailsList[0].createBy\":[\"\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:52:41', 34);
INSERT INTO `sys_oper_log` VALUES (179, '日常登记', 2, 'com.ruoyi.project.pyzx.education.controller.PyzxMoralEducationController.editSave()', 'POST', 1, 'admin', '研发部门', '/pyzxeducation/education/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"weekname\":[\"星期一\"],\"weeknum\":[\"第1周\"],\"checkedBy\":[\"1\"],\"index\":[\"1\"],\"pyzxMoralDetailsList[0].pid\":[\"1111\"],\"pyzxMoralDetailsList[0].stuclass\":[\"23电子2班\"],\"pyzxMoralDetailsList[0].point\":[\"20\"],\"pyzxMoralDetailsList[0].reason\":[\"\"],\"pyzxMoralDetailsList[0].standard\":[\"\"],\"pyzxMoralDetailsList[0].standardreason\":[\"测试\"],\"pyzxMoralDetailsList[0].checkdate\":[\"得很好\"],\"pyzxMoralDetailsList[0].createTime\":[\"\"],\"pyzxMoralDetailsList[0].updateTime\":[\"\"],\"pyzxMoralDetailsList[0].createBy\":[\"\"],\"btSelectAll\":[\"\"],\"btSelectItem\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-16 17:55:10', 83);
INSERT INTO `sys_oper_log` VALUES (180, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/pyzx_sushe_sub', '127.0.0.1', '内网IP', '\"pyzx_sushe_sub\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:04:08', 334);
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"pyzx_sushe_sub\"],\"tableComment\":[\"宿舍检查明细表\"],\"className\":[\"PyzxSusheSub\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"48\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"周数\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"weeknum\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"sys_week_num\"],\"columns[2].columnId\":[\"49\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"周名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"weekname\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"sys_week_name\"],\"columns[3].columnId\":[\"3\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"年级\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"grade\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"sys_dept_list\"],\"columns[4].columnId\":[\"4\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"班级\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"stuclass\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"pyzx_student_class\"],\"columns[5].columnId\":[\"5\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"宿舍号\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaF', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:08:42', 97);
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"pyzx_sushe_sub\"]}', NULL, 0, NULL, '2024-08-18 00:09:33', 390);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2016', '127.0.0.1', '内网IP', '2016', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:11:06', 28);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2025', '127.0.0.1', '内网IP', '2025', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:11:14', 17);
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2017', '127.0.0.1', '内网IP', '2017', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:11:19', 55);
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2018', '127.0.0.1', '内网IP', '2018', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:11:24', 17);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2019', '127.0.0.1', '内网IP', '2019', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:11:31', 134);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2020', '127.0.0.1', '内网IP', '2020', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:11:36', 16);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2021', '127.0.0.1', '内网IP', '2021', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:11:41', 31);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2015', '127.0.0.1', '内网IP', '2015', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:11:47', 20);
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"pyzx_sushe_sub\"],\"tableComment\":[\"宿舍检查明细表\"],\"className\":[\"PyzxSusheSub\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"48\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"周数\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"weeknum\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"sys_week_num\"],\"columns[2].columnId\":[\"49\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"周名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"weekname\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_week_name\"],\"columns[3].columnId\":[\"3\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"年级\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"grade\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"sys_dept_list\"],\"columns[4].columnId\":[\"4\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"班级\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"stuclass\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"pyzx_student_class\"],\"columns[5].columnId\":[\"5\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"宿舍号\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].j', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:17:55', 136);
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/pyzx_sushe_sub', '127.0.0.1', '内网IP', '\"pyzx_sushe_sub\"', NULL, 0, NULL, '2024-08-18 00:17:58', 335);
INSERT INTO `sys_oper_log` VALUES (193, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"139\"],\"dictLabel\":[\"23电子2班\"],\"dictValue\":[\"23电子2班\"],\"dictType\":[\"pyzx_student_class\"],\"cssClass\":[\"23电子2班\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"23电子2班\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:20:04', 28);
INSERT INTO `sys_oper_log` VALUES (194, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"一年级\"],\"dictValue\":[\"一年级\"],\"dictType\":[\"sys_dept_list\"],\"cssClass\":[\"一年级\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"一年级\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:21:33', 20);
INSERT INTO `sys_oper_log` VALUES (195, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"二年级\"],\"dictValue\":[\"二年级\"],\"dictType\":[\"sys_dept_list\"],\"cssClass\":[\"二年级\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"二年级\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:22:01', 16);
INSERT INTO `sys_oper_log` VALUES (196, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"三年级\"],\"dictValue\":[\"三年级\"],\"dictType\":[\"sys_dept_list\"],\"cssClass\":[\"三年级\"],\"dictSort\":[\"3\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"三年级\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:22:31', 100);
INSERT INTO `sys_oper_log` VALUES (197, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"142\"],\"dictLabel\":[\"三年级\"],\"dictValue\":[\"三年级\"],\"dictType\":[\"sys_dept_list\"],\"cssClass\":[\"三年级\"],\"dictSort\":[\"4\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"三年级\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:22:51', 28);
INSERT INTO `sys_oper_log` VALUES (198, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"140\"],\"dictLabel\":[\"一年级\"],\"dictValue\":[\"一年级\"],\"dictType\":[\"sys_dept_list\"],\"cssClass\":[\"一年级\"],\"dictSort\":[\"3\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"一年级\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:22:55', 20);
INSERT INTO `sys_oper_log` VALUES (199, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"141\"],\"dictLabel\":[\"二年级\"],\"dictValue\":[\"二年级\"],\"dictType\":[\"sys_dept_list\"],\"cssClass\":[\"二年级\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"二年级\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:23:05', 25);
INSERT INTO `sys_oper_log` VALUES (200, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"142\"],\"dictLabel\":[\"三年级\"],\"dictValue\":[\"三年级\"],\"dictType\":[\"sys_dept_list\"],\"cssClass\":[\"三年级\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"三年级\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:23:11', 22);
INSERT INTO `sys_oper_log` VALUES (201, '宿舍检查明细', 1, 'com.ruoyi.project.pyzx.sub.controller.PyzxSusheSubController.addSave()', 'POST', 1, 'admin', '研发部门', '/pyzxsub/sub/add', '127.0.0.1', '内网IP', '{\"weeknum\":[\"第1周\"],\"weekname\":[\"星期一\"],\"grade\":[\"二年级\"],\"stuclass\":[\"23电子2班\"],\"room\":[\"410\"],\"bad\":[\"1\"],\"sex\":[\"0\"],\"standard\":[\"1\"],\"standardreason\":[\"有垃圾\"],\"checkdate\":[\"2024-08-18\"],\"checkedBy\":[\"张舒媚\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:24:10', 25);
INSERT INTO `sys_oper_log` VALUES (202, '宿舍检查明细', 3, 'com.ruoyi.project.pyzx.sub.controller.PyzxSusheSubController.remove()', 'POST', 1, 'admin', '研发部门', '/pyzxsub/sub/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"38\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:24:15', 25);
INSERT INTO `sys_oper_log` VALUES (203, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"班干部\"],\"roleKey\":[\"cadre\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"班干部\"],\"menuIds\":[\"2013,2030,2031,2032,2033,2034,2035\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:27:09', 43);
INSERT INTO `sys_oper_log` VALUES (204, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', 'POST', 1, 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"班干部\"],\"roleKey\":[\"cadre\"],\"dataScope\":[\"5\"],\"deptIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:27:44', 72);
INSERT INTO `sys_oper_log` VALUES (205, '用户管理', 1, 'com.ruoyi.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"赵班长\"],\"deptName\":[\"研发部门\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"赵班长\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:28:55', 23);
INSERT INTO `sys_oper_log` VALUES (206, '宿舍检查明细', 3, 'com.ruoyi.project.pyzx.sub.controller.PyzxSusheSubController.remove()', 'POST', 1, '赵班长', '研发部门', '/pyzxsub/sub/remove', '192.168.6.212', '内网IP', '{\"ids\":[\"39\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:29:39', 13);
INSERT INTO `sys_oper_log` VALUES (207, '宿舍检查明细', 1, 'com.ruoyi.project.pyzx.sub.controller.PyzxSusheSubController.addSave()', 'POST', 1, 'admin', '研发部门', '/pyzxsub/sub/add', '127.0.0.1', '内网IP', '{\"weeknum\":[\"第1周\"],\"weekname\":[\"星期一\"],\"grade\":[\"二年级\"],\"stuclass\":[\"23电子2班\"],\"room\":[\"410\"],\"bad\":[\"1\"],\"sex\":[\"0\"],\"standard\":[\"1\"],\"standardreason\":[\"有垃圾\"],\"checkdate\":[\"\"],\"checkedBy\":[\"张舒媚\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:30:21', 20);
INSERT INTO `sys_oper_log` VALUES (208, '宿舍检查明细', 3, 'com.ruoyi.project.pyzx.sub.controller.PyzxSusheSubController.remove()', 'POST', 1, '赵班长', '研发部门', '/pyzxsub/sub/remove', '192.168.6.212', '内网IP', '{\"ids\":[\"40\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:30:30', 10);
INSERT INTO `sys_oper_log` VALUES (209, '宿舍检查明细', 1, 'com.ruoyi.project.pyzx.sub.controller.PyzxSusheSubController.addSave()', 'POST', 1, '赵班长', '研发部门', '/pyzxsub/sub/add', '192.168.6.212', '内网IP', '{\"weeknum\":[\"第1周\"],\"weekname\":[\"星期一\"],\"grade\":[\"二年级\"],\"stuclass\":[\"23电子2班\"],\"room\":[\"420\"],\"bad\":[\"1\"],\"sex\":[\"0\"],\"standard\":[\"1\"],\"standardreason\":[\"1\"],\"checkdate\":[\"2024-08-18\"],\"checkedBy\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:31:14', 11);
INSERT INTO `sys_oper_log` VALUES (210, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"班干部\"],\"roleKey\":[\"cadre\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"班干部\"],\"menuIds\":[\"2013,2030,2031,2032,2035\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:34:21', 29);
INSERT INTO `sys_oper_log` VALUES (211, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', 'POST', 1, 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"班干部\"],\"roleKey\":[\"cadre\"],\"dataScope\":[\"5\"],\"deptIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:36:35', 94);
INSERT INTO `sys_oper_log` VALUES (212, '角色管理', 1, 'com.ruoyi.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"老师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"1,100,1000,1001,1004,1005,1006,103,1016,1017,104,1020,1021,107,1035,1036,1037,1038,2,109,1047,2013,2030,2031,2032,2033,2034,2035,2022,2024,2026,2027,2028,2029,2023\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:41:32', 28);
INSERT INTO `sys_oper_log` VALUES (213, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', 'POST', 1, 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"老师\"],\"roleKey\":[\"teacher\"],\"dataScope\":[\"3\"],\"deptIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:41:53', 26);
INSERT INTO `sys_oper_log` VALUES (214, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', 'POST', 1, 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"老师\"],\"roleKey\":[\"teacher\"],\"dataScope\":[\"5\"],\"deptIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:42:04', 14);
INSERT INTO `sys_oper_log` VALUES (215, '通知公告', 3, 'com.ruoyi.project.system.notice.controller.NoticeController.remove()', 'POST', 1, 'admin', '研发部门', '/system/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2,3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:43:38', 11);
INSERT INTO `sys_oper_log` VALUES (216, '通知公告', 1, 'com.ruoyi.project.system.notice.controller.NoticeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"测试\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<p>测试</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 00:44:12', 11);
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/pyzx_moral_details', '127.0.0.1', '内网IP', '\"pyzx_moral_details\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:17:07', 153);
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/pyzx_moral_details', '127.0.0.1', '内网IP', '\"pyzx_moral_details\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:18:02', 80);
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"pyzx_moral_details\"],\"tableComment\":[\"日常德育记录表\"],\"className\":[\"PyzxMoralDetails\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"21\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"51\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"周数\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"weeknum\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"sys_week_num\"],\"columns[2].columnId\":[\"52\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"周名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"weekname\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_week_name\"],\"columns[3].columnId\":[\"23\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"班级\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"stuclass\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"pyzx_student_class\"],\"columns[4].columnId\":[\"24\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"姓名\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"name\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"pyzx_student_name\"],\"columns[5].columnId\":[', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:22:16', 65);
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/pyzx_sushe_sub', '127.0.0.1', '内网IP', '\"pyzx_sushe_sub\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:23:46', 108);
INSERT INTO `sys_oper_log` VALUES (221, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"pyzx_sushe_sub\"],\"tableComment\":[\"宿舍检查明细表\"],\"className\":[\"PyzxSusheSub\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"48\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"周数\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"weeknum\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"sys_week_num\"],\"columns[2].columnId\":[\"49\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"周名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"weekname\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"sys_week_name\"],\"columns[3].columnId\":[\"54\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"姓名\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"name\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"pyzx_student_name\"],\"columns[4].columnId\":[\"3\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"年级\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"grade\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"sys_dept_list\"],\"columns[5].columnId\":[\"4\"],\"columns[5].sort', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:25:37', 69);
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"pyzx_sushe_sub\"],\"tableComment\":[\"宿舍检查明细表\"],\"className\":[\"PyzxSusheSub\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"48\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"周数\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"weeknum\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"sys_week_num\"],\"columns[2].columnId\":[\"49\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"周名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"weekname\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"sys_week_name\"],\"columns[3].columnId\":[\"54\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"姓名\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"name\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"pyzx_student_name\"],\"columns[4].columnId\":[\"3\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"年级\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"grade\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"sys_dept_list\"],\"columns[5].columnId\":[\"4\"],\"columns[5].sort', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:26:55', 72);
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"pyzx_moral_details,pyzx_sushe_sub\"]}', NULL, 0, NULL, '2024-08-18 02:27:02', 308);
INSERT INTO `sys_oper_log` VALUES (224, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2026', '127.0.0.1', '内网IP', '2026', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-08-18 02:27:26', 8);
INSERT INTO `sys_oper_log` VALUES (225, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2029', '127.0.0.1', '内网IP', '2029', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-08-18 02:27:30', 5);
INSERT INTO `sys_oper_log` VALUES (226, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2029', '127.0.0.1', '内网IP', '2029', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-08-18 02:27:43', 13);
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2026', '127.0.0.1', '内网IP', '2026', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-08-18 02:28:43', 11);
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2029', '127.0.0.1', '内网IP', '2029', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-08-18 02:28:48', 7);
INSERT INTO `sys_oper_log` VALUES (229, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"老师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"1,100,1000,1001,1004,1005,1006,103,1016,1017,104,1020,1021,107,1035,1036,1037,1038,2,109,1047,2013,2030,2031,2032,2033,2034,2035,2023\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:29:41', 27);
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2026', '127.0.0.1', '内网IP', '2026', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:29:44', 13);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2027', '127.0.0.1', '内网IP', '2027', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:29:48', 16);
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2028', '127.0.0.1', '内网IP', '2028', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:29:58', 27);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2029', '127.0.0.1', '内网IP', '2029', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:30:02', 21);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2024', '127.0.0.1', '内网IP', '2024', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:30:09', 24);
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2023\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"谈心谈话\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-star-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:30:19', 20);
INSERT INTO `sys_oper_log` VALUES (236, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"pyzx_moral_details,pyzx_sushe_sub\"]}', NULL, 0, NULL, '2024-08-18 02:32:57', 289);
INSERT INTO `sys_oper_log` VALUES (237, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/pyzx_moral_details', '127.0.0.1', '内网IP', '\"pyzx_moral_details\"', NULL, 0, NULL, '2024-08-18 02:33:17', 99);
INSERT INTO `sys_oper_log` VALUES (238, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/pyzx_moral_education', '127.0.0.1', '内网IP', '\"pyzx_moral_education\"', NULL, 0, NULL, '2024-08-18 02:33:47', 129);
INSERT INTO `sys_oper_log` VALUES (239, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"pyzx_sushe_sub\"],\"tableComment\":[\"宿舍检查明细表\"],\"className\":[\"PyzxSusheSub\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"48\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"周数\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"weeknum\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"sys_week_num\"],\"columns[2].columnId\":[\"49\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"周名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"weekname\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_week_name\"],\"columns[3].columnId\":[\"54\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"姓名\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"name\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"select\"],\"columns[3].dictType\":[\"pyzx_student_name\"],\"columns[4].columnId\":[\"3\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"年级\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"grade\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"sys_dept_list\"],\"columns[5].columnId\":[\"4\"],\"columns[5].', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:36:28', 70);
INSERT INTO `sys_oper_log` VALUES (240, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/pyzx_sushe_sub', '127.0.0.1', '内网IP', '\"pyzx_sushe_sub\"', NULL, 0, NULL, '2024-08-18 02:37:27', 98);
INSERT INTO `sys_oper_log` VALUES (241, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"pyzx_sushe_sub\"],\"tableComment\":[\"宿舍检查明细表\"],\"className\":[\"PyzxSusheSub\"],\"functionAuthor\":[\"落叶\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"48\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"周数\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"weeknum\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"sys_week_num\"],\"columns[2].columnId\":[\"49\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"周名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"weekname\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"sys_week_name\"],\"columns[3].columnId\":[\"54\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"姓名\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"name\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"pyzx_student_name\"],\"columns[4].columnId\":[\"3\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"年级\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"grade\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"select\"],\"columns[4].dictType\":[\"sys_dept_list\"],\"columns[5].columnId\":[\"4\"],\"columns[5].s', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:40:55', 106);
INSERT INTO `sys_oper_log` VALUES (242, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/pyzx_sushe_sub', '127.0.0.1', '内网IP', '\"pyzx_sushe_sub\"', NULL, 0, NULL, '2024-08-18 02:41:00', 184);
INSERT INTO `sys_oper_log` VALUES (243, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"班干部\"],\"roleKey\":[\"cadre\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"班干部\"],\"menuIds\":[\"2013,2030,2031,2032,2035,2022,2036,2037,2038,2039,2040,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:43:35', 30);
INSERT INTO `sys_oper_log` VALUES (244, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"老师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"1,100,1000,1001,1004,1005,1006,103,1016,1017,104,1020,1021,107,1035,1036,1037,1038,2,109,1047,2013,2030,2031,2032,2033,2034,2035,2022,2036,2037,2038,2039,2040,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:43:42', 26);
INSERT INTO `sys_oper_log` VALUES (245, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"班干部\"],\"roleKey\":[\"cadre\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"班干部\"],\"menuIds\":[\"2013,2030,2031,2032,2035,2022,2036,2037,2038,2041\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:44:08', 28);
INSERT INTO `sys_oper_log` VALUES (246, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"23电子2班\"],\"deptName\":[\"班委\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:47:25', 33);
INSERT INTO `sys_oper_log` VALUES (247, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"101\"],\"parentName\":[\"班委\"],\"deptName\":[\"班长部门\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:47:38', 29);
INSERT INTO `sys_oper_log` VALUES (248, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"104\"],\"parentId\":[\"101\"],\"parentName\":[\"班委\"],\"deptName\":[\"劳动部门\"],\"orderNum\":[\"2\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:47:50', 35);
INSERT INTO `sys_oper_log` VALUES (249, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"105\"],\"parentId\":[\"101\"],\"parentName\":[\"班委\"],\"deptName\":[\"学习部门\"],\"orderNum\":[\"3\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:48:03', 31);
INSERT INTO `sys_oper_log` VALUES (250, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"106\"],\"parentId\":[\"101\"],\"parentName\":[\"班委\"],\"deptName\":[\"宣传部门\"],\"orderNum\":[\"4\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:48:28', 30);
INSERT INTO `sys_oper_log` VALUES (251, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"101\"],\"parentName\":[\"班委\"],\"deptName\":[\"主管部门\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:48:56', 31);
INSERT INTO `sys_oper_log` VALUES (252, '部门管理', 1, 'com.ruoyi.project.system.dept.controller.DeptController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"101\"],\"deptName\":[\"体委部门\"],\"orderNum\":[\"6\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:49:41', 15);
INSERT INTO `sys_oper_log` VALUES (253, '部门管理', 1, 'com.ruoyi.project.system.dept.controller.DeptController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"101\"],\"deptName\":[\"值日部门\"],\"orderNum\":[\"7\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:49:59', 16);
INSERT INTO `sys_oper_log` VALUES (254, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"102\"],\"parentId\":[\"100\"],\"parentName\":[\"23电子2班\"],\"deptName\":[\"课代表\"],\"orderNum\":[\"2\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"1\"]}', '{\"msg\":\"该部门包含未停用的子部门！\",\"code\":500}', 0, NULL, '2024-08-18 02:50:08', 16);
INSERT INTO `sys_oper_log` VALUES (255, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"108\"],\"parentId\":[\"102\"],\"parentName\":[\"课代表\"],\"deptName\":[\"市场部门\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:50:16', 32);
INSERT INTO `sys_oper_log` VALUES (256, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"109\"],\"parentId\":[\"102\"],\"parentName\":[\"课代表\"],\"deptName\":[\"财务部门\"],\"orderNum\":[\"2\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:50:19', 31);
INSERT INTO `sys_oper_log` VALUES (257, '部门管理', 3, 'com.ruoyi.project.system.dept.controller.DeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/108', '127.0.0.1', '内网IP', '108', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:50:22', 17);
INSERT INTO `sys_oper_log` VALUES (258, '部门管理', 3, 'com.ruoyi.project.system.dept.controller.DeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/109', '127.0.0.1', '内网IP', '109', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:50:25', 13);
INSERT INTO `sys_oper_log` VALUES (259, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"102\"],\"parentId\":[\"100\"],\"parentName\":[\"23电子2班\"],\"deptName\":[\"课代表\"],\"orderNum\":[\"2\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:50:28', 42);
INSERT INTO `sys_oper_log` VALUES (260, '岗位管理', 2, 'com.ruoyi.project.system.post.controller.PostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"1\"],\"postName\":[\"老大\"],\"postCode\":[\"teacher\"],\"postSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:51:05', 17);
INSERT INTO `sys_oper_log` VALUES (261, '岗位管理', 2, 'com.ruoyi.project.system.post.controller.PostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"2\"],\"postName\":[\"班长\"],\"postCode\":[\"monitor\"],\"postSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:51:37', 19);
INSERT INTO `sys_oper_log` VALUES (262, '岗位管理', 3, 'com.ruoyi.project.system.post.controller.PostController.remove()', 'POST', 1, 'admin', '研发部门', '/system/post/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:51:44', 14);
INSERT INTO `sys_oper_log` VALUES (263, '岗位管理', 5, 'com.ruoyi.project.system.post.controller.PostController.export()', 'POST', 1, 'admin', '研发部门', '/system/post/export', '127.0.0.1', '内网IP', '{\"postCode\":[\"\"],\"postName\":[\"\"],\"status\":[\"\"],\"orderByColumn\":[\"postSort\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"2aa65955-0830-4325-b3b9-437f7453e700_岗位数据.xlsx\",\"code\":0}', 0, NULL, '2024-08-18 02:52:02', 1606);
INSERT INTO `sys_oper_log` VALUES (264, '岗位管理', 2, 'com.ruoyi.project.system.post.controller.PostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"4\"],\"postName\":[\"班干部\"],\"postCode\":[\"user\"],\"postSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:52:31', 19);
INSERT INTO `sys_oper_log` VALUES (265, '岗位管理', 2, 'com.ruoyi.project.system.post.controller.PostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"4\"],\"postName\":[\"班干部\"],\"postCode\":[\"user\"],\"postSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:52:36', 19);
INSERT INTO `sys_oper_log` VALUES (266, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"103\"],\"userName\":[\"赵班长\"],\"dept.deptName\":[\"主管部门\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"赵班长\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:53:04', 28);
INSERT INTO `sys_oper_log` VALUES (267, '用户管理', 1, 'com.ruoyi.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"userName\":[\"张\"],\"deptName\":[\"23电子2班\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"zhang\"],\"sex\":[\"1\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:54:18', 33);
INSERT INTO `sys_oper_log` VALUES (268, '用户管理', 3, 'com.ruoyi.project.system.user.controller.UserController.remove()', 'POST', 1, 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 02:54:58', 21);
INSERT INTO `sys_oper_log` VALUES (269, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"100\"],\"userName\":[\"维护\"],\"dept.deptName\":[\"23电子2班\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"维护\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', NULL, 1, '不允许操作超级管理员用户', '2024-08-18 02:55:16', 4);
INSERT INTO `sys_oper_log` VALUES (270, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"100\"],\"userName\":[\"维护\"],\"dept.deptName\":[\"23电子2班\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"维护\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', NULL, 1, '不允许操作超级管理员用户', '2024-08-18 02:58:08', 4);
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"宿舍检查\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 03:01:34', 15);
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2022\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"德育记录\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-balance-scale\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 03:01:47', 23);
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"宿舍检查\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-08-18 03:01:54', 14);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'teacher', '老大', 1, '0', 'admin', '2024-08-16 09:18:45', 'admin', '2024-08-18 02:51:05', '');
INSERT INTO `sys_post` VALUES (2, 'monitor', '班长', 2, '0', 'admin', '2024-08-16 09:18:45', 'admin', '2024-08-18 02:51:37', '');
INSERT INTO `sys_post` VALUES (4, 'user', '班干部', 3, '0', 'admin', '2024-08-16 09:18:45', 'admin', '2024-08-18 02:52:36', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2024-08-16 09:18:45', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (100, '班干部', 'cadre', 3, '5', '0', '0', 'admin', '2024-08-16 10:25:06', 'admin', '2024-08-18 02:44:08', '班干部');
INSERT INTO `sys_role` VALUES (101, '老师', 'teacher', 4, '5', '0', '0', 'admin', '2024-08-18 00:41:32', 'admin', '2024-08-18 02:43:42', '老师');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2038);
INSERT INTO `sys_role_menu` VALUES (100, 2041);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 2);
INSERT INTO `sys_role_menu` VALUES (101, 100);
INSERT INTO `sys_role_menu` VALUES (101, 103);
INSERT INTO `sys_role_menu` VALUES (101, 104);
INSERT INTO `sys_role_menu` VALUES (101, 107);
INSERT INTO `sys_role_menu` VALUES (101, 109);
INSERT INTO `sys_role_menu` VALUES (101, 1000);
INSERT INTO `sys_role_menu` VALUES (101, 1001);
INSERT INTO `sys_role_menu` VALUES (101, 1004);
INSERT INTO `sys_role_menu` VALUES (101, 1005);
INSERT INTO `sys_role_menu` VALUES (101, 1006);
INSERT INTO `sys_role_menu` VALUES (101, 1016);
INSERT INTO `sys_role_menu` VALUES (101, 1017);
INSERT INTO `sys_role_menu` VALUES (101, 1020);
INSERT INTO `sys_role_menu` VALUES (101, 1021);
INSERT INTO `sys_role_menu` VALUES (101, 1035);
INSERT INTO `sys_role_menu` VALUES (101, 1036);
INSERT INTO `sys_role_menu` VALUES (101, 1037);
INSERT INTO `sys_role_menu` VALUES (101, 1038);
INSERT INTO `sys_role_menu` VALUES (101, 1047);
INSERT INTO `sys_role_menu` VALUES (101, 2013);
INSERT INTO `sys_role_menu` VALUES (101, 2022);
INSERT INTO `sys_role_menu` VALUES (101, 2030);
INSERT INTO `sys_role_menu` VALUES (101, 2031);
INSERT INTO `sys_role_menu` VALUES (101, 2032);
INSERT INTO `sys_role_menu` VALUES (101, 2033);
INSERT INTO `sys_role_menu` VALUES (101, 2034);
INSERT INTO `sys_role_menu` VALUES (101, 2035);
INSERT INTO `sys_role_menu` VALUES (101, 2036);
INSERT INTO `sys_role_menu` VALUES (101, 2037);
INSERT INTO `sys_role_menu` VALUES (101, 2038);
INSERT INTO `sys_role_menu` VALUES (101, 2039);
INSERT INTO `sys_role_menu` VALUES (101, 2040);
INSERT INTO `sys_role_menu` VALUES (101, 2041);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '维护', '00', '', '', '1', '/profile/avatar/2024/08/16/blob_20240816095518A001.png', 'b8f977f7d39a25ec9b9c1031a2999b75', 'f1711e', '0', '0', '127.0.0.1', '2024-08-18 02:43:07', '2024-08-16 10:33:39', 'chaojiweihu', '2024-08-16 09:18:45', '', '2024-08-18 02:43:06', '维护');
INSERT INTO `sys_user` VALUES (2, 105, '张舒媚', '张舒媚', '00', '', '', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '2', '127.0.0.1', NULL, NULL, 'admin', '2024-08-16 09:18:45', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (100, 103, '赵班长', '赵班长', '00', '', '', '0', '', '79bb3134699793a5ceae09612af429fc', '17b7ee', '0', '0', '192.168.6.207', '2024-08-18 03:00:51', '2024-08-18 00:28:55', 'admin', '2024-08-18 00:28:55', 'admin', '2024-08-18 03:00:50', '');
INSERT INTO `sys_user` VALUES (101, 100, 'zhang', '张', '00', '', '', '1', '', '7a1e1c1fa44e52042627d4f317442b58', '8bead0', '0', '0', '', NULL, '2024-08-18 02:54:19', 'admin', '2024-08-18 02:54:18', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('309dfbb7-bef7-425a-ae65-20d76e471183', '赵班长', '主管部门', '192.168.6.207', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', 'on_line', '2024-08-18 03:00:26', '2024-08-18 03:01:59', 1800000);
INSERT INTO `sys_user_online` VALUES ('e900da39-3501-4234-a6fd-093c3fe6d5e6', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', 'on_line', '2024-08-18 02:43:03', '2024-08-18 03:01:24', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 101);

SET FOREIGN_KEY_CHECKS = 1;
