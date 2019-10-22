-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: archives
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_archive`
--

DROP TABLE IF EXISTS `t_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_archive` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tag` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '档案编号,不是数字，根据档案类型+自动生成的数字编号组成，如CI_1000001',
  `category_id` int(10) unsigned NOT NULL COMMENT '档案类型编号',
  `point_id` int(10) unsigned NOT NULL COMMENT '档案存档点编号',
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '档案标题',
  `user_id` int(10) unsigned NOT NULL COMMENT '建档用户编号',
  `created` bigint(20) unsigned NOT NULL COMMENT '建档日期时间戳',
  `modify` bigint(20) unsigned DEFAULT NULL COMMENT '修改日期时间戳',
  `modify_user_id` int(10) unsigned DEFAULT NULL COMMENT '修改用户的编号',
  `content` mediumtext COLLATE utf8mb4_bin NOT NULL COMMENT '档案内容',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '0表示已删除，1表示在使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='档案信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_archive`
--

LOCK TABLES `t_archive` WRITE;
/*!40000 ALTER TABLE `t_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_archive_borrow`
--

DROP TABLE IF EXISTS `t_archive_borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_archive_borrow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `borrow_user_id` int(10) unsigned NOT NULL COMMENT '借阅人编号',
  `cred_type` int(10) unsigned NOT NULL COMMENT '证件类型，0为身份证，1为军官证',
  `card_number` varchar(18) COLLATE utf8mb4_bin NOT NULL COMMENT '证件号码',
  `created` bigint(20) unsigned NOT NULL COMMENT '借阅日期时间戳',
  `return_date` bigint(20) unsigned NOT NULL COMMENT '归还日期，单位：秒',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '0为未归还，1为归还',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='档案借阅信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_archive_borrow`
--

LOCK TABLES `t_archive_borrow` WRITE;
/*!40000 ALTER TABLE `t_archive_borrow` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_archive_borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_archive_category`
--

DROP TABLE IF EXISTS `t_archive_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_archive_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tag` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '类型标识，根据行业标准定义，不是纯数字，如：CI',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '类型名称',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '0为已删除，1为正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='档案分类信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_archive_category`
--

LOCK TABLES `t_archive_category` WRITE;
/*!40000 ALTER TABLE `t_archive_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_archive_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_archive_point`
--

DROP TABLE IF EXISTS `t_archive_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_archive_point` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '存档点名称',
  `address` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '存档点地址',
  `contact` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '联系人',
  `phone` varchar(11) COLLATE utf8mb4_bin NOT NULL COMMENT '联系人电话',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '0为禁用，1为使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='存档点信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_archive_point`
--

LOCK TABLES `t_archive_point` WRITE;
/*!40000 ALTER TABLE `t_archive_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_archive_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_department`
--

DROP TABLE IF EXISTS `t_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '部门名称',
  `phone` varchar(11) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系电话',
  `fax` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '传真',
  `path` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '部门路径',
  `boss_department_id` int(10) unsigned DEFAULT NULL COMMENT '上级部门编号',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT '部门主管编号',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '1表示正常，0表示停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='部门信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_department`
--

LOCK TABLES `t_department` WRITE;
/*!40000 ALTER TABLE `t_department` DISABLE KEYS */;
INSERT INTO `t_department` VALUES (1,'管理组','',NULL,'/admin',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `t_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dictionary`
--

DROP TABLE IF EXISTS `t_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dictionary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '类型名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '1表示在使用，0表示废弃',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字典目录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dictionary`
--

LOCK TABLES `t_dictionary` WRITE;
/*!40000 ALTER TABLE `t_dictionary` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dictionary_detail`
--

DROP TABLE IF EXISTS `t_dictionary_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dictionary_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '字典明细名称',
  `pin` int(10) unsigned DEFAULT '0' COMMENT '字典明细显示顺序，值越大显示越靠前',
  `dictionary_id` int(10) unsigned NOT NULL COMMENT '字典目录表编号',
  `status` tinyint(1) DEFAULT '1' COMMENT '1表示在使用，0表示废弃',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='字典明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dictionary_detail`
--

LOCK TABLES `t_dictionary_detail` WRITE;
/*!40000 ALTER TABLE `t_dictionary_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dictionary_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_permission`
--

DROP TABLE IF EXISTS `t_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '权限名称',
  `system_resource_id` int(10) unsigned NOT NULL COMMENT '系统资源路径编号',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '0为禁用，1为正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='权限信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_permission`
--

LOCK TABLES `t_permission` WRITE;
/*!40000 ALTER TABLE `t_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '0为禁用，1为在使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'员工',NULL,1),(2,'档案管理员',NULL,1),(3,'系统管理员',NULL,1),(4,'数据维护员',NULL,1);
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_system_config`
--

DROP TABLE IF EXISTS `t_system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '系统名称',
  `phone` varchar(11) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公司电话',
  `address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公司地址',
  `website` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公司网站地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统配置信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_system_config`
--

LOCK TABLES `t_system_config` WRITE;
/*!40000 ALTER TABLE `t_system_config` DISABLE KEYS */;
INSERT INTO `t_system_config` VALUES (1,'GuaSeed','13800000000','四川省','http://www.zzyitj.xyz');
/*!40000 ALTER TABLE `t_system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_system_menu`
--

DROP TABLE IF EXISTS `t_system_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_system_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `path` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '资源路径',
  `icon` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源图标链接',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT '父菜单编号',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '0为禁用，1为在使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_system_menu`
--

LOCK TABLES `t_system_menu` WRITE;
/*!40000 ALTER TABLE `t_system_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_system_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_system_resource`
--

DROP TABLE IF EXISTS `t_system_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_system_resource` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '资源名称',
  `path` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '资源路径',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '0为禁用，1为在使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统资源信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_system_resource`
--

LOCK TABLES `t_system_resource` WRITE;
/*!40000 ALTER TABLE `t_system_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_system_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'MD5后的密码',
  `real_name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '真实姓名',
  `id_number` varchar(18) COLLATE utf8mb4_bin NOT NULL COMMENT '身份证',
  `department_id` int(10) unsigned NOT NULL COMMENT '所在部门编号',
  `created` bigint(20) unsigned NOT NULL COMMENT '入职时间，即本条数据创建时间戳',
  `phone` varchar(11) COLLATE utf8mb4_bin NOT NULL COMMENT '联系电话',
  `education` tinyint(4) NOT NULL COMMENT '学历，0为小学，1为中学，2为中专，3为大专，4为本科，5为研究生，6为博士',
  `current_address` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '现居地址',
  `sex` tinyint(1) NOT NULL COMMENT '性别，0表示女，1表示男',
  `remarks` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '1表示在职，0表示离职',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'admin','xxxxx','管理员','510000199011111111',1,0,'13800000000',4,NULL,1,NULL,1);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-22 15:53:14
