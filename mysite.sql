-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: localhost    Database: mysite
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add user',6,'add_user'),(17,'Can change user',6,'change_user'),(18,'Can delete user',6,'delete_user'),(19,'Can add submit info',7,'add_submitinfo'),(20,'Can change submit info',7,'change_submitinfo'),(21,'Can delete submit info',7,'delete_submitinfo'),(22,'Can add question',8,'add_question'),(23,'Can change question',8,'change_question'),(24,'Can delete question',8,'delete_question'),(25,'Can add contest_question',9,'add_contest_question'),(26,'Can change contest_question',9,'change_contest_question'),(27,'Can delete contest_question',9,'delete_contest_question'),(28,'Can add application',10,'add_application'),(29,'Can change application',10,'change_application'),(30,'Can delete application',10,'delete_application'),(31,'Can add contest',11,'add_contest'),(32,'Can change contest',11,'change_contest'),(33,'Can delete contest',11,'delete_contest'),(34,'Can add contest_user',12,'add_contest_user'),(35,'Can change contest_user',12,'change_contest_user'),(36,'Can delete contest_user',12,'delete_contest_user'),(37,'Can add grade info',13,'add_gradeinfo'),(38,'Can change grade info',13,'change_gradeinfo'),(39,'Can delete grade info',13,'delete_gradeinfo'),(40,'Can add example',14,'add_example'),(41,'Can change example',14,'change_example'),(42,'Can delete example',14,'delete_example');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contestms_application`
--

DROP TABLE IF EXISTS `contestms_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contestms_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_time` datetime(6) NOT NULL,
  `handled` tinyint(1) NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `contest_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contestms_application_user_id_f68e087c_uniq` (`user_id`,`contest_id`),
  KEY `contestms_application_41b6de5d` (`contest_id`),
  KEY `contestms_application_e8701ad4` (`user_id`),
  CONSTRAINT `contestms_applicatio_contest_id_bb67adf1_fk_contestms_contest_id` FOREIGN KEY (`contest_id`) REFERENCES `contestms_contest` (`id`),
  CONSTRAINT `contestms_application_user_id_b695fa5d_fk_contestms_user_id` FOREIGN KEY (`user_id`) REFERENCES `contestms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contestms_application`
--

LOCK TABLES `contestms_application` WRITE;
/*!40000 ALTER TABLE `contestms_application` DISABLE KEYS */;
INSERT INTO `contestms_application` VALUES (24,'2016-09-02 00:16:00.736312',1,1,2,17),(27,'2016-09-02 07:32:57.299848',0,0,4,17),(31,'2016-09-05 22:49:03.345971',1,1,2,9);
/*!40000 ALTER TABLE `contestms_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contestms_contest`
--

DROP TABLE IF EXISTS `contestms_contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contestms_contest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `duration` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contestms_contest`
--

LOCK TABLES `contestms_contest` WRITE;
/*!40000 ALTER TABLE `contestms_contest` DISABLE KEYS */;
INSERT INTO `contestms_contest` VALUES (2,'ACM基地2015级第二次招新比赛','2016-09-11 09:00:00.000000',18000000000),(3,'测试','2016-09-02 00:04:00.000000',300000000),(4,'还是测试','2016-08-31 16:17:00.000000',43200000000);
/*!40000 ALTER TABLE `contestms_contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contestms_contest_question`
--

DROP TABLE IF EXISTS `contestms_contest_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contestms_contest_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_added` datetime(6) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contestms_contest_question_contest_id_6e6f8137_uniq` (`contest_id`,`question_id`),
  KEY `contestms_contest_question_7aa0f6ee` (`question_id`),
  CONSTRAINT `contestms_contest__question_id_9f4605db_fk_contestms_question_id` FOREIGN KEY (`question_id`) REFERENCES `contestms_question` (`id`),
  CONSTRAINT `contestms_contest_qu_contest_id_0e3c66ed_fk_contestms_contest_id` FOREIGN KEY (`contest_id`) REFERENCES `contestms_contest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contestms_contest_question`
--

LOCK TABLES `contestms_contest_question` WRITE;
/*!40000 ALTER TABLE `contestms_contest_question` DISABLE KEYS */;
INSERT INTO `contestms_contest_question` VALUES (1,'2016-08-30 12:15:15.791054',2,1),(2,'2016-08-30 12:15:25.540072',2,2),(3,'2016-08-30 12:15:36.863179',2,3),(4,'2016-09-02 00:14:19.058441',2,4),(5,'2016-09-02 00:14:41.105307',2,9),(6,'2016-09-02 00:14:51.111205',2,8),(7,'2016-09-02 00:15:02.227606',2,6),(8,'2016-09-02 00:15:08.136642',2,7),(10,'2016-09-02 00:38:02.197999',2,5);
/*!40000 ALTER TABLE `contestms_contest_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contestms_contest_user`
--

DROP TABLE IF EXISTS `contestms_contest_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contestms_contest_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_joined` datetime(6) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contestms_contest_user_contest_id_99dfef19_uniq` (`contest_id`,`user_id`),
  KEY `contestms_contest_user_user_id_b355efb5_fk_contestms_user_id` (`user_id`),
  CONSTRAINT `contestms_contest_us_contest_id_a3787901_fk_contestms_contest_id` FOREIGN KEY (`contest_id`) REFERENCES `contestms_contest` (`id`),
  CONSTRAINT `contestms_contest_user_user_id_b355efb5_fk_contestms_user_id` FOREIGN KEY (`user_id`) REFERENCES `contestms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contestms_contest_user`
--

LOCK TABLES `contestms_contest_user` WRITE;
/*!40000 ALTER TABLE `contestms_contest_user` DISABLE KEYS */;
INSERT INTO `contestms_contest_user` VALUES (24,'2016-09-02 00:41:01.924494',2,17),(29,'2016-09-06 15:48:43.689481',2,9);
/*!40000 ALTER TABLE `contestms_contest_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contestms_example`
--

DROP TABLE IF EXISTS `contestms_example`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contestms_example` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `input` longtext NOT NULL,
  `output` longtext NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contestms_example_question_id_ee52781f_fk_contestms_question_id` (`question_id`),
  CONSTRAINT `contestms_example_question_id_ee52781f_fk_contestms_question_id` FOREIGN KEY (`question_id`) REFERENCES `contestms_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contestms_example`
--

LOCK TABLES `contestms_example` WRITE;
/*!40000 ALTER TABLE `contestms_example` DISABLE KEYS */;
INSERT INTO `contestms_example` VALUES (1,'abcabcbb','3',1),(2,'bbbbb','1',1),(3,'pwwkew','3',1),(4,'100','10.000000',2),(5,'5','2.236068',2),(6,'0','0.000000',2),(7,'0','C',3),(8,'1','&nbsp;CC\r\nC\r\n CC',3),(9,'2','&nbsp;&nbsp;&nbsp;&nbsp;CC CC\r\n   C  C\r\n    CC CC\r\n CC\r\nC\r\n CC\r\n    CC CC\r\n   C  C\r\n    CC CC',3),(10,'3\r\n5 -2 8','１',4),(11,'5\r\n-10 8 -20 12 25','３',4),(12,'1 10','0',5),(13,'1 100','1',5),(14,'1 100000000','15341887',5),(15,'1','1',6),(16,'3','5',6),(17,'10','16796',6),(18,'3\r\n1 1 2','1 2',7),(19,'5\r\n1 2 3 4 5','1 2 3 4 5',7),(20,'5\r\n1 1 1 1 1','1',7),(21,'4 \r\n1 3 6 2','invalid',8),(22,'4 \r\n6 2 1 3','valid',8),(23,'4 \r\n8 1 6 7','valid',8),(24,'9 \r\n12 7 \r\n24 9 \r\n30 5 \r\n41 9 \r\n80 7 \r\n50 87 \r\n22 9 \r\n45 1 \r\n50 7','243.06',9);
/*!40000 ALTER TABLE `contestms_example` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contestms_gradeinfo`
--

DROP TABLE IF EXISTS `contestms_gradeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contestms_gradeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accept` tinyint(1) NOT NULL,
  `accept_sub_time` datetime(6) DEFAULT NULL,
  `sub_times` smallint(5) unsigned NOT NULL,
  `wrong_times` smallint(5) unsigned NOT NULL,
  `contest_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_fb` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contestms_gradeinfo_contest_id_e374ce5b_uniq` (`contest_id`,`user_id`,`question_id`),
  KEY `contestms_gradeinfo_7aa0f6ee` (`question_id`),
  KEY `contestms_gradeinfo_e8701ad4` (`user_id`),
  CONSTRAINT `contestms_gradeinf_question_id_aa47d863_fk_contestms_question_id` FOREIGN KEY (`question_id`) REFERENCES `contestms_question` (`id`),
  CONSTRAINT `contestms_gradeinfo_contest_id_5eb83b46_fk_contestms_contest_id` FOREIGN KEY (`contest_id`) REFERENCES `contestms_contest` (`id`),
  CONSTRAINT `contestms_gradeinfo_user_id_5229118c_fk_contestms_user_id` FOREIGN KEY (`user_id`) REFERENCES `contestms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contestms_gradeinfo`
--

LOCK TABLES `contestms_gradeinfo` WRITE;
/*!40000 ALTER TABLE `contestms_gradeinfo` DISABLE KEYS */;
INSERT INTO `contestms_gradeinfo` VALUES (69,1,'0001-01-01 00:42:26.784063',2,1,2,1,17,0),(70,0,NULL,0,0,2,2,17,0),(71,0,NULL,0,0,2,3,17,0),(72,0,NULL,1,1,2,4,17,0),(73,0,NULL,0,0,2,9,17,0),(74,0,NULL,0,0,2,8,17,0),(75,0,NULL,0,0,2,6,17,0),(76,0,NULL,0,0,2,7,17,0),(77,0,NULL,0,0,2,5,17,0),(114,0,NULL,0,0,2,1,9,0),(115,0,NULL,0,0,2,2,9,0),(116,0,NULL,0,0,2,3,9,0),(117,0,NULL,0,0,2,4,9,0),(118,0,NULL,0,0,2,9,9,0),(119,0,NULL,0,0,2,8,9,0),(120,0,NULL,0,0,2,6,9,0),(121,0,NULL,0,0,2,7,9,0),(122,0,NULL,0,0,2,5,9,0);
/*!40000 ALTER TABLE `contestms_gradeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contestms_question`
--

DROP TABLE IF EXISTS `contestms_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contestms_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `hint` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contestms_question`
--

LOCK TABLES `contestms_question` WRITE;
/*!40000 ALTER TABLE `contestms_question` DISABLE KEYS */;
INSERT INTO `contestms_question` VALUES (1,'找子串','给你一个字符串, 找出它的最长子串, 满足这个子字符串中任意两个字符都不相同.\r\n输入一个字符串,\r\n输出满足题意的子字符串的长度。','样例１最长无重复字符子串是\"abc\", 长度为3.\r\n样例2最长无重复字符子串是\"b\", 长度为1.\r\n样例3最长无重复字符子串是\"wke\", 长度为3,注意必须是子串, \"pwke\"是样例3的一个子序列而非子串.'),(2,'平方根','C语言中的sqrt函数, 函数原型 double sqrt (double x).它的作用是求x的平方根.\r\n现在要求你写程序实现这个函数, 返回结果要求精确到小数点后6位.注意, 该题不允许使用math.h或cmath中的sqrt函数.\r\n输入x( 0 <= x <= 10^9), 输出x的平方根.','...'),(3,'Help C5','Hello, I’m Sea5, and you can call me C5 instead. I want a program which can sign my name automatically. And my brothers, \r\nC0, C1, C2, C3, C4, C6, C7, C8, each of them wants one as well. Can you help us?\r\n\r\nC0’s signature is ‘C’\r\n\r\nWhen you draw C(N)’s name, you should print the name using C(N-1)’s name as its element, and using the following format to draw it.\r\n\r\n*XX\r\n\r\nX**\r\n\r\n*XX\r\n\r\n(X is the element, * is blank space)\r\n\r\nAnd please don’t print extra spaces at the end of line.\r\n\r\nFor example, C1’s name should be\r\n\r\n*CC                    *CC\r\n\r\nC                      C**\r\n\r\n*CC     But not        *CC\r\n\r\n(I use * to show you where are spaces.)','...'),(4,'蚂蚁病毒','水平长100厘米的细长直杆子上有n只蚂蚁。它们的头有的朝左，有的朝右。每只蚂蚁都只能沿着杆子向前爬，速度是1厘米/秒。 当两只蚂蚁碰面时，它们会同时掉头往相反的方向爬行。这些蚂蚁中，有1只蚂蚁感染了病毒了。并且在和其它蚂蚁碰面时，会把病毒传染给碰到的蚂蚁。 请你计算，当所有蚂蚁都爬离杆子时，有多少只蚂蚁感染了病毒?\r\n\r\n第一行输入一个整数n (1 < n < 50), 表示蚂蚁的总数。\r\n接着的一行是n个用空格分开的整数 Xi (-100 < Xi < 100), Xi的绝对值，表示蚂蚁离开杆子左边端点的距离。\r\n正值表示头朝右，负值表示头朝左，数据中不会出现0值，也不会出现两只蚂蚁占用同一位置。其中，第一个数据代表的蚂蚁感染了病毒了。\r\n\r\n要求输出1个整数，表示最后感染病毒的蚂蚁的数目。','...'),(5,'数数','统计一定范围[L, R]内十进制数中出现偶数个5的数的个数。\r\n输入正整数L, R(1 <= L <= R <= 10^16),\r\n输出该范围内满足上述条件的数的个数.','...'),(6,'剧场找零','有2n个人排成一行进入剧场。入场费5元。其中只有n个人有一张5元钞票，另外n人只有10元钞票，剧院无其它钞票，问有多少种不同的方法使得只要有10元的人买票，售票处就有5元的钞票找零？\r\n\r\n输入正整数n( 1 <= n <= 20), \r\n输出不同的方案种数.','令持5元钞票的人为A, 持10元钞票的为B\r\n样例２的有以下五种情况:\r\nAAABBB\r\nABABAB\r\nAABBAB\r\nABAABB\r\nAABABB'),(7,'A Very Easy Question','In computer programming, create, read, update and delete (as an acronym CRUD) are the four basic functions of persistent storage. Alternate words are sometimes used when defining the four basic functions of CRUD, retrieve instead of read, modify instead of update, or destroy instead of delete. CRUD is also sometimes used to describe user interface conventions that facilitate viewing, searching,and changing information.In this question, our theme is \'D\'.\r\nHere comes my question: Given a sorted array A[n], remove the duplicates in place such that each element appear only once and output the new array.\r\n\r\nInput:\r\nThe first line of input contains a single integer n denoting the length of the array.\r\nThe next line contains n space separated integers A[0], A[1], A[2]...A[n-1]\r\nOutput:\r\nThe new array  as defined above.','....'),(8,'图形解锁','相信每个人都知道手机上的图形解锁功能, 解锁界面是一个 3×3 的正方形点阵，第一行的三个点标号 1,2,3，第二行的三个点标号 4,5,6，第三行的三个点标号 7,8,9。密码本身是一段序列，表示经过点的先后顺序，但遵循如下规则：\r\n\r\n    密码至少经过四个点。\r\n\r\n    不能重复经过同一个点。\r\n\r\n    路径上的中间点不能跳过，除非已经被经过（3427 是合法的，但 3724不合法）。\r\n\r\n输入\r\n\r\n第一个数 n，设置密码的长度；接着 n 个正整数，之间用空格隔开，表示密码序列 s1s2...sn。\r\n输出\r\n若合法输出 valid，否则输出 invalid。\r\n\r\n设置的密码的长度为正整数 n(1≤n≤9)，密码序列为 s1s2…sn(0≤si< INT_MAX)，我们知道这个密码序列是否合法，这个问题交给了你。','对于第一组数据，1 到 3 跳过了路径上的点 2，所以不合法。\r\n\r\n对于第二组数据，1 到 3 时点 2 已经被经过了，所以合法。\r\n\r\n对于第三组数据，8-> 1-> 6 -> 7\r\n8→1→6→7 路径均没有中间点，所以合法。'),(9,'围树','在一片区域有许多树，一个农夫想买一根绳把所有的数包围起来，所以把要首先知道最短需要多长的绳子，然而他不知道如何计算，你能帮助他吗？\r\n忽略树的直径，树可以看做点，忽略绳子的粗细，绳子可以看成直线。树的数量不超过100。\r\n\r\n输入\r\n第一行代表区域内树的数量n，接下来的n行每行代表树的位置坐标，横纵坐标皆为正整数，并且不大于32767。\r\n输出\r\n最小需要多长的绳子。结果保留两位小数。','...');
/*!40000 ALTER TABLE `contestms_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contestms_submitinfo`
--

DROP TABLE IF EXISTS `contestms_submitinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contestms_submitinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_time` datetime(6) NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contestms_submitinfo_contest_id_78dc5c6a_fk_contestms_contest_id` (`contest_id`),
  KEY `contestms_submitin_question_id_e9ff0308_fk_contestms_question_id` (`question_id`),
  KEY `contestms_submitinfo_user_id_88ae86dd_fk_contestms_user_id` (`user_id`),
  CONSTRAINT `contestms_submitin_question_id_e9ff0308_fk_contestms_question_id` FOREIGN KEY (`question_id`) REFERENCES `contestms_question` (`id`),
  CONSTRAINT `contestms_submitinfo_contest_id_78dc5c6a_fk_contestms_contest_id` FOREIGN KEY (`contest_id`) REFERENCES `contestms_contest` (`id`),
  CONSTRAINT `contestms_submitinfo_user_id_88ae86dd_fk_contestms_user_id` FOREIGN KEY (`user_id`) REFERENCES `contestms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contestms_submitinfo`
--

LOCK TABLES `contestms_submitinfo` WRITE;
/*!40000 ALTER TABLE `contestms_submitinfo` DISABLE KEYS */;
INSERT INTO `contestms_submitinfo` VALUES (51,'0001-01-01 00:42:14.858487',0,2,1,17),(53,'0001-01-01 00:42:26.784063',1,2,1,17),(54,'0001-01-01 09:35:50.187861',0,2,4,17),(55,'0001-01-01 09:37:09.671217',0,2,4,17),(56,'0001-01-01 09:37:44.456589',0,2,4,17),(57,'0001-01-01 09:39:37.671369',0,2,4,17);
/*!40000 ALTER TABLE `contestms_submitinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contestms_user`
--

DROP TABLE IF EXISTS `contestms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contestms_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `class_name` varchar(20) NOT NULL,
  `stu_id` varchar(20) NOT NULL,
  `tel_num` varchar(20) NOT NULL,
  `qq_num` varchar(20) NOT NULL,
  `comment` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contestms_user`
--

LOCK TABLES `contestms_user` WRITE;
/*!40000 ALTER TABLE `contestms_user` DISABLE KEYS */;
INSERT INTO `contestms_user` VALUES (9,'pbkdf2_sha256$30000$5UDHVZuV6wDi$vR8mlt4JiRjGriflUuVhSDYrywfsAWKFrKJsxZ9nwXo=','2016-09-10 10:12:22.731076',1,'pash','','','111@11.com',1,1,'2016-08-31 16:17:13.381296','','','','','',NULL),(17,'pbkdf2_sha256$30000$272UzgBummQ1$b7xMdDPQxi8JVYjdMuqHFKdmT3DXkx1HOp1l1mpqfmo=','2016-09-10 10:01:01.206917',0,'庞胜','','','',0,1,'2016-09-02 00:05:30.952160','male','123','sdf','sdf','sdf','sdf');
/*!40000 ALTER TABLE `contestms_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contestms_user_groups`
--

DROP TABLE IF EXISTS `contestms_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contestms_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contestms_user_groups_user_id_53e2eb71_uniq` (`user_id`,`group_id`),
  KEY `contestms_user_groups_group_id_3df014e7_fk_auth_group_id` (`group_id`),
  CONSTRAINT `contestms_user_groups_group_id_3df014e7_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `contestms_user_groups_user_id_0301b482_fk_contestms_user_id` FOREIGN KEY (`user_id`) REFERENCES `contestms_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contestms_user_groups`
--

LOCK TABLES `contestms_user_groups` WRITE;
/*!40000 ALTER TABLE `contestms_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `contestms_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contestms_user_user_permissions`
--

DROP TABLE IF EXISTS `contestms_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contestms_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contestms_user_user_permissions_user_id_287d791e_uniq` (`user_id`,`permission_id`),
  KEY `contestms_user_user_permission_id_ef1d66cc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `contestms_user_user_permis_user_id_7961ed15_fk_contestms_user_id` FOREIGN KEY (`user_id`) REFERENCES `contestms_user` (`id`),
  CONSTRAINT `contestms_user_user_permission_id_ef1d66cc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contestms_user_user_permissions`
--

LOCK TABLES `contestms_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `contestms_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `contestms_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_contestms_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_contestms_user_id` FOREIGN KEY (`user_id`) REFERENCES `contestms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (26,'2016-08-31 16:17:52.843379','4','还是测试',2,'[{\"changed\": {\"fields\": [\"start_time\"]}}]',11,9),(27,'2016-08-31 16:18:03.156295','2','测试比赛',2,'[{\"changed\": {\"fields\": [\"start_time\"]}}]',11,9),(28,'2016-08-31 16:18:16.756025','3','依然是测试',2,'[{\"changed\": {\"fields\": [\"start_time\", \"duration\"]}}]',11,9),(29,'2016-09-01 16:16:20.390836','13','成都',3,'',6,9),(30,'2016-09-01 16:16:20.398428','12','测试人员',3,'',6,9),(31,'2016-09-01 16:16:20.413046','11','庞胜',3,'',6,9),(32,'2016-09-01 16:16:20.419266','10','无奈',3,'',6,9),(33,'2016-09-02 00:03:58.043090','16','无奈',3,'',6,9),(34,'2016-09-02 00:03:58.049805','15','成都',3,'',6,9),(35,'2016-09-02 00:03:58.061565','14','庞胜',3,'',6,9),(36,'2016-09-02 00:04:17.986242','3','依然是测试',2,'[{\"changed\": {\"fields\": [\"start_time\", \"duration\"]}}]',11,9),(37,'2016-09-02 00:10:25.230971','4','HDU 4507 吉哥系列故事――恨7不成妻',1,'[{\"added\": {}}]',8,9),(38,'2016-09-02 00:11:06.210828','5','不要62',1,'[{\"added\": {}}]',8,9),(39,'2016-09-02 00:12:01.222461','6','Bomb',1,'[{\"added\": {}}]',8,9),(40,'2016-09-02 00:12:31.044610','7','B-number',1,'[{\"added\": {}}]',8,9),(41,'2016-09-02 00:13:18.209333','8','Round Numbers',1,'[{\"added\": {}}]',8,9),(42,'2016-09-02 00:13:53.886917','9','F(x)',1,'[{\"added\": {}}]',8,9),(43,'2016-09-02 00:14:19.058866','4','测试比赛-HDU 4507 吉哥系列故事――恨7不成妻',1,'[{\"added\": {}}]',9,9),(44,'2016-09-02 00:14:41.106256','5','测试比赛-F(x)',1,'[{\"added\": {}}]',9,9),(45,'2016-09-02 00:14:51.111701','6','测试比赛-Round Numbers',1,'[{\"added\": {}}]',9,9),(46,'2016-09-02 00:15:02.228559','7','测试比赛-Bomb',1,'[{\"added\": {}}]',9,9),(47,'2016-09-02 00:15:08.137308','8','测试比赛-B-number',1,'[{\"added\": {}}]',9,9),(48,'2016-09-02 00:15:16.045490','9','测试比赛-HDU 4507 吉哥系列故事――恨7不成妻',1,'[{\"added\": {}}]',9,9),(49,'2016-09-02 00:17:58.908637','2','测试比赛',2,'[{\"changed\": {\"fields\": [\"start_time\"]}}]',11,9),(50,'2016-09-02 00:19:44.563578','19','测试比赛-庞胜',3,'',12,9),(51,'2016-09-02 00:19:44.568287','18','还是测试-pash',3,'',12,9),(52,'2016-09-02 00:19:44.574440','17','测试比赛-pash',3,'',12,9),(53,'2016-09-02 00:31:30.407286','20','测试比赛-庞胜',3,'',12,9),(54,'2016-09-02 00:31:49.648918','22','pash-还是测试',3,'',10,9),(55,'2016-09-02 00:31:49.656458','20','pash-测试比赛',3,'',10,9),(56,'2016-09-02 00:32:02.834461','23','庞胜-依然是测试',3,'',10,9),(57,'2016-09-02 00:37:39.739704','9','测试比赛-HDU 4507 吉哥系列故事――恨7不成妻',3,'',9,9),(58,'2016-09-02 00:38:02.199438','10','测试比赛-不要62',1,'[{\"added\": {}}]',9,9),(59,'2016-09-02 00:40:02.296977','22','测试比赛-庞胜',3,'',12,9),(60,'2016-09-02 00:40:53.000816','23','测试比赛-庞胜',3,'',12,9),(61,'2016-09-02 16:41:43.690536','2','测试比赛',2,'[{\"changed\": {\"fields\": [\"start_time\"]}}]',11,9),(62,'2016-09-02 16:48:37.081115','2','测试比赛',2,'[{\"changed\": {\"fields\": [\"start_time\"]}}]',11,9),(63,'2016-09-02 17:07:14.758876','2','测试比赛',2,'[{\"changed\": {\"fields\": [\"start_time\", \"duration\"]}}]',11,9),(64,'2016-09-02 17:09:43.677429','2','测试比赛',2,'[{\"changed\": {\"fields\": [\"start_time\", \"duration\"]}}]',11,9),(65,'2016-09-02 17:10:16.119738','2','测试比赛',2,'[{\"changed\": {\"fields\": [\"start_time\", \"duration\"]}}]',11,9),(66,'2016-09-02 17:13:54.719398','2','ACM基地2015级第二次招新比赛',2,'[{\"changed\": {\"fields\": [\"name\", \"start_time\"]}}]',11,9),(67,'2016-09-02 17:54:17.403322','1','找子串',2,'[{\"changed\": {\"fields\": [\"title\", \"content\"]}}]',8,9),(68,'2016-09-02 17:55:34.755936','2','ACM基地2015级第二次招新比赛',2,'[{\"changed\": {\"fields\": [\"start_time\"]}}]',11,9),(69,'2016-09-03 12:41:23.763728','1','找子串',2,'[{\"changed\": {\"fields\": [\"content\"]}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(70,'2016-09-03 12:52:38.237526','1','找子串',2,'[{\"changed\": {\"fields\": [\"hint\"]}}]',8,9),(71,'2016-09-03 14:01:25.389368','2','平方根',2,'[{\"changed\": {\"fields\": [\"title\", \"content\", \"hint\"]}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(72,'2016-09-03 14:05:19.834337','2','平方根',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(73,'2016-09-03 14:07:15.045833','2','平方根',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(74,'2016-09-03 14:53:28.144098','3','Help C5',2,'[{\"changed\": {\"fields\": [\"title\", \"content\", \"hint\"]}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(75,'2016-09-03 14:55:32.278834','3','Help C5',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(76,'2016-09-03 15:09:49.800344','3','Help C5',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(77,'2016-09-03 15:11:53.375727','3','Help C5',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(78,'2016-09-03 15:13:00.130985','3','Help C5',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(79,'2016-09-03 15:13:31.729187','3','Help C5',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(80,'2016-09-03 15:34:05.182829','3','Help C5',2,'[{\"changed\": {\"fields\": [\"output\"], \"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(81,'2016-09-03 15:39:32.420403','3','Help C5',2,'[{\"changed\": {\"fields\": [\"output\"], \"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(82,'2016-09-03 15:46:56.610284','3','Help C5',2,'[{\"changed\": {\"fields\": [\"output\"], \"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(83,'2016-09-03 15:47:17.156676','3','Help C5',2,'[{\"changed\": {\"fields\": [\"output\"], \"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(84,'2016-09-03 15:50:22.265462','3','Help C5',2,'[{\"changed\": {\"fields\": [\"output\"], \"object\": \"Example object\", \"name\": \"example\"}}, {\"changed\": {\"fields\": [\"output\"], \"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(85,'2016-09-03 15:52:27.474223','3','Help C5',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(86,'2016-09-03 16:48:07.962419','1','找子串',2,'[{\"changed\": {\"fields\": [\"hint\"]}}]',8,9),(87,'2016-09-04 10:08:26.094251','3','Help C5',2,'[{\"changed\": {\"fields\": [\"input\"], \"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(88,'2016-09-06 10:18:51.245252','4','蚂蚁病毒',2,'[{\"changed\": {\"fields\": [\"title\", \"content\", \"hint\"]}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(89,'2016-09-06 10:20:34.892335','4','蚂蚁病毒',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(90,'2016-09-06 10:21:44.566798','4','蚂蚁病毒',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(91,'2016-09-06 10:22:27.180551','4','蚂蚁病毒',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(92,'2016-09-07 08:48:12.471946','5','数数',2,'[{\"changed\": {\"fields\": [\"title\", \"content\", \"hint\"]}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(93,'2016-09-07 08:49:15.923788','5','数数',2,'[{\"changed\": {\"fields\": [\"input\", \"output\"], \"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(94,'2016-09-07 08:53:41.256845','5','数数',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(95,'2016-09-07 11:39:44.261497','6','剧场找零',2,'[{\"changed\": {\"fields\": [\"title\", \"content\", \"hint\"]}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(96,'2016-09-07 12:14:29.092833','6','剧场找零',2,'[{\"changed\": {\"fields\": [\"input\", \"output\"], \"object\": \"Example object\", \"name\": \"example\"}}, {\"changed\": {\"fields\": [\"input\", \"output\"], \"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(97,'2016-09-07 12:14:55.080047','6','剧场找零',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(98,'2016-09-07 12:36:19.841021','6','剧场找零',2,'[{\"changed\": {\"fields\": [\"hint\"]}}]',8,9),(99,'2016-09-07 13:48:27.986354','7','A very easy question',2,'[{\"changed\": {\"fields\": [\"title\", \"content\", \"hint\"]}}]',8,9),(100,'2016-09-07 13:56:44.637052','1','找子串',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(101,'2016-09-07 13:57:42.527519','2','平方根',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(102,'2016-09-07 13:59:19.927777','4','蚂蚁病毒',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(103,'2016-09-07 14:40:56.967609','7','A very easy question',2,'[{\"changed\": {\"fields\": [\"content\"]}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(104,'2016-09-07 14:41:38.337822','7','A very easy question',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(105,'2016-09-07 14:42:08.266792','7','A very easy question',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(106,'2016-09-07 14:43:05.877089','7','A very easy question',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(107,'2016-09-07 14:44:05.909715','7','A very easy question',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(108,'2016-09-07 14:44:30.532762','7','A Very Easy Question',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,9),(109,'2016-09-07 14:53:16.377260','8','图形解锁',2,'[{\"changed\": {\"fields\": [\"title\", \"content\", \"hint\"]}}]',8,9),(110,'2016-09-07 14:53:38.917799','8','图形解锁',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(111,'2016-09-07 15:02:07.635450','8','图形解锁',2,'[{\"changed\": {\"fields\": [\"content\"]}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(112,'2016-09-07 15:04:16.793270','8','图形解锁',2,'[{\"changed\": {\"fields\": [\"hint\"]}}]',8,9),(113,'2016-09-07 15:05:05.907199','8','图形解锁',2,'[{\"changed\": {\"fields\": [\"hint\"]}}]',8,9),(114,'2016-09-07 16:15:08.051490','6','剧场找零',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(115,'2016-09-07 16:53:33.107623','5','数数',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(116,'2016-09-07 16:54:20.232313','4','蚂蚁病毒',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(117,'2016-09-07 16:55:43.753023','6','剧场找零',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(118,'2016-09-07 16:55:59.567118','6','剧场找零',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(119,'2016-09-07 16:57:29.875372','8','图形解锁',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(120,'2016-09-07 17:05:01.559919','7','A Very Easy Question',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(121,'2016-09-07 17:07:15.982678','7','A Very Easy Question',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(122,'2016-09-07 17:08:15.634150','7','A Very Easy Question',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(123,'2016-09-07 17:25:38.525184','2','平方根',2,'[{\"changed\": {\"fields\": [\"output\"], \"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(124,'2016-09-07 17:37:10.894315','8','图形解锁',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,9),(125,'2016-09-07 18:56:49.782457','2','ACM基地2015级第二次招新比赛',2,'[{\"changed\": {\"fields\": [\"start_time\"]}}]',11,9),(126,'2016-09-10 10:24:33.833456','9','围树',2,'[{\"changed\": {\"fields\": [\"title\", \"content\", \"hint\"]}}, {\"added\": {\"object\": \"Example object\", \"name\": \"example\"}}]',8,9),(127,'2016-09-10 19:19:02.366002','23','松岛枫',3,'',6,9),(128,'2016-09-10 19:19:02.373997','22','qqq',3,'',6,9),(129,'2016-09-10 19:19:02.380244','21','田守业',3,'',6,9),(130,'2016-09-10 19:19:02.385995','20','马凯锋',3,'',6,9),(131,'2016-09-10 19:19:02.391714','19','测试',3,'',6,9),(132,'2016-09-10 19:19:02.397164','18','无奈',3,'',6,9),(133,'2016-09-10 19:19:21.217476','2','ACM基地2015级第二次招新比赛',2,'[{\"changed\": {\"fields\": [\"start_time\"]}}]',11,9),(134,'2016-09-10 19:19:32.661189','3','测试',2,'[{\"changed\": {\"fields\": [\"name\", \"start_time\"]}}]',11,9);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'contenttypes','contenttype'),(10,'contestms','application'),(11,'contestms','contest'),(9,'contestms','contest_question'),(12,'contestms','contest_user'),(14,'contestms','example'),(13,'contestms','gradeinfo'),(8,'contestms','question'),(7,'contestms','submitinfo'),(6,'contestms','user'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-08-28 16:07:32.950327'),(2,'contenttypes','0002_remove_content_type_name','2016-08-28 16:07:33.061878'),(3,'auth','0001_initial','2016-08-28 16:07:33.515569'),(4,'auth','0002_alter_permission_name_max_length','2016-08-28 16:07:33.597555'),(5,'auth','0003_alter_user_email_max_length','2016-08-28 16:07:33.612621'),(6,'auth','0004_alter_user_username_opts','2016-08-28 16:07:33.626678'),(7,'auth','0005_alter_user_last_login_null','2016-08-28 16:07:33.643959'),(8,'auth','0006_require_contenttypes_0002','2016-08-28 16:07:33.651467'),(9,'auth','0007_alter_validators_add_error_messages','2016-08-28 16:07:33.672831'),(10,'auth','0008_alter_user_username_max_length','2016-08-28 16:07:33.687029'),(11,'contestms','0001_initial','2016-08-28 16:07:36.193726'),(12,'admin','0001_initial','2016-08-28 16:07:36.417731'),(13,'admin','0002_logentry_remove_auto_add','2016-08-28 16:07:36.473119'),(14,'sessions','0001_initial','2016-08-28 16:07:36.542042'),(15,'contestms','0002_auto_20160829_1327','2016-08-29 13:27:36.743511'),(16,'contestms','0003_auto_20160902_0039','2016-09-02 00:39:22.072535'),(17,'contestms','0004_example','2016-09-03 12:29:10.586175'),(18,'contestms','0005_question_hint','2016-09-03 12:44:02.288005'),(19,'contestms','0006_gradeinfo_is_fb','2016-09-07 21:17:27.890336');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0tj4qlpawrd4o8j321a9dd2swevqvngb','ZDU5ZWY2ZDM4ZWQyN2EwYzRhZDFkNGZjMTUwZTg2YjQ0YzA1MGE1OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkYzkxODg4ZjllMDJhYzk1YWNkMDAwYTg5NmJmNmEwYmRhZGQxNjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9','2016-09-16 07:11:08.196322'),('4g6cf12hhzbnvpf3q9ar88vj3kyj69x0','MTZjYjU0NThiYmQwMWMzOTljNDJiYTlmYmE3Y2FhZDZlZDlhNTdlMTp7fQ==','2016-09-12 14:46:47.664821'),('79ht9u77e0lycwvn7ky56pl62h195zoc','N2IyNDdlM2IzZmQ1NTgyODk1MGY0ZWJjNjA1ODFlMzhiMzljOThiOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRjOTZkNjA3NDQ0MDZkZDVjOTQwNDJmMDkwMWZlZmIyYmM4YmVjMDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=','2016-09-24 10:12:22.745740'),('9l1ds28jx3n85ckzrd90h6mr2wb1lsjm','ZDEzNGFkMzEyYzFlNGEwZDJmMTJjNWVkZjU1NzU4MzUzNTc3NGRmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjljOWI3MTg1NzNhMzFkZjBkMzk2MzZmNzNiNTM4OWIwOTc0NmI4YTkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-09-13 12:25:08.279329'),('9spq5fnbg3asf5ght83jwql120ksw5rh','MzFlNTcwN2IzMjQxMDE5OTc3NDNlOTEwY2JkYThmOWM0Y2Q3NTFlYzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg3NmIwYjQxMDZhODQ4YjAwMTQ2MGFkMzI2YzY3MzY3MzZhMDU3YzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMSJ9','2016-09-21 17:20:01.733636'),('aoxsigtcdetgl57c2d3ncvgzronsh8ei','MjViZmE5YmRhNDE0YjRkZDUxMTk5ZDUwODVlYWY3OTI1ZjRjYjA3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjljOWI3MTg1NzNhMzFkZjBkMzk2MzZmNzNiNTM4OWIwOTc0NmI4YTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-13 21:12:16.086384'),('b9i96s4o318mzr8kudkqsfnqgeevbqab','MTZjYjU0NThiYmQwMWMzOTljNDJiYTlmYmE3Y2FhZDZlZDlhNTdlMTp7fQ==','2016-09-12 14:42:52.454506'),('cdjh3rzshqpbnl59b3jb0yorgpwtn08j','MjViZmE5YmRhNDE0YjRkZDUxMTk5ZDUwODVlYWY3OTI1ZjRjYjA3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjljOWI3MTg1NzNhMzFkZjBkMzk2MzZmNzNiNTM4OWIwOTc0NmI4YTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-13 07:06:07.427492'),('ejkk1t4hskbbyx43fdmg5o6armkhu620','MTZjYjU0NThiYmQwMWMzOTljNDJiYTlmYmE3Y2FhZDZlZDlhNTdlMTp7fQ==','2016-09-12 14:47:13.507565'),('ernopup99zhzvdpsuijc4ndnab7coqr7','ZDU5ZWY2ZDM4ZWQyN2EwYzRhZDFkNGZjMTUwZTg2YjQ0YzA1MGE1OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkYzkxODg4ZjllMDJhYzk1YWNkMDAwYTg5NmJmNmEwYmRhZGQxNjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9','2016-09-16 16:20:05.258101'),('fhevewuu58rsnqox5ywrvrgk43x96jce','N2IyNDdlM2IzZmQ1NTgyODk1MGY0ZWJjNjA1ODFlMzhiMzljOThiOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRjOTZkNjA3NDQ0MDZkZDVjOTQwNDJmMDkwMWZlZmIyYmM4YmVjMDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=','2016-09-15 16:47:52.058067'),('gayb6zj5e48k2eqdkobcunb5sn9ytzpp','N2IyNDdlM2IzZmQ1NTgyODk1MGY0ZWJjNjA1ODFlMzhiMzljOThiOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRjOTZkNjA3NDQ0MDZkZDVjOTQwNDJmMDkwMWZlZmIyYmM4YmVjMDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=','2016-09-21 21:22:39.483432'),('hqpyjexf3wkv3zf9wfuuu9zvf2njgwe3','ZGZiZWVhN2Q3Y2U1ODgxODAxZTUyNjQ1NmRmYzliYzJlNDMwMDRkZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwNmIxNTliMmI2ZjhkMWIzODU0ZjE5NDVlZGU5ZDJiYThiZDYwMmIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2016-09-12 15:47:05.890241'),('i7qa2i1qddif78auiuhxnsr42tls1e7o','MjViZmE5YmRhNDE0YjRkZDUxMTk5ZDUwODVlYWY3OTI1ZjRjYjA3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjljOWI3MTg1NzNhMzFkZjBkMzk2MzZmNzNiNTM4OWIwOTc0NmI4YTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-12 21:50:28.585239'),('igvoaavm5owxavjhg8f6j5clb2j06c8d','ODlmMmY1YTBhZjFhM2UxNzhmNGM2YTg0NDNiMDQ3NTAyOWE5YmY0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjM3NTJhODBlN2U4MGFkZWUzN2NhZDgzMWMwMzFjZmU1NDQ0NTJmY2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMSJ9','2016-09-15 08:21:30.212787'),('mnoejo1c4gaeiike7lj0qx05nsvzoriw','YjRlOGJlNDQ4YTBjNGVlYTM3OGRhYWNjMDc2ZDg0NTRkMmNlNDgyYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjZjODlhNmUwZmI0ZGQwZGZmZTY3ZDJlYzA2ODM3NDQ0MjI1ZTMyOWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMCJ9','2016-09-17 14:19:42.310571'),('nhyj3f9yskdlpndugkdhofcexmn8c4dr','ZDU5ZWY2ZDM4ZWQyN2EwYzRhZDFkNGZjMTUwZTg2YjQ0YzA1MGE1OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkYzkxODg4ZjllMDJhYzk1YWNkMDAwYTg5NmJmNmEwYmRhZGQxNjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9','2016-09-16 11:32:49.653470'),('otv5hyhcd6ea6rl59y5zdat89j7n4vh9','ZDU5ZWY2ZDM4ZWQyN2EwYzRhZDFkNGZjMTUwZTg2YjQ0YzA1MGE1OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjlkYzkxODg4ZjllMDJhYzk1YWNkMDAwYTg5NmJmNmEwYmRhZGQxNjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNyJ9','2016-09-16 15:56:24.516358'),('pifavg3llfeb4paxqh10cpqup8zrcmzz','MTZjYjU0NThiYmQwMWMzOTljNDJiYTlmYmE3Y2FhZDZlZDlhNTdlMTp7fQ==','2016-09-12 14:40:48.537378'),('q38dstdfyhtjwptkqfxrp7ts63geg9lc','N2IyNDdlM2IzZmQ1NTgyODk1MGY0ZWJjNjA1ODFlMzhiMzljOThiOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRjOTZkNjA3NDQ0MDZkZDVjOTQwNDJmMDkwMWZlZmIyYmM4YmVjMDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=','2016-09-16 00:03:30.839288'),('qab8t4vo22ipuhf2f57lcv2o99p3zmj0','M2ExY2M4Yzk2YmYxNDJmY2RjNTg1MDBlODNiNWUwODIwY2E5N2QwMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjVhYTc0Yzk1MDBhMjM0ZGY1NzBhZDFiOGFmZmFhYTJjMTRiMjhiM2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2016-09-12 15:07:23.110895'),('rhe7mrignnt5dgtbxq3xddyqg675gsqd','N2IyNDdlM2IzZmQ1NTgyODk1MGY0ZWJjNjA1ODFlMzhiMzljOThiOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRjOTZkNjA3NDQ0MDZkZDVjOTQwNDJmMDkwMWZlZmIyYmM4YmVjMDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=','2016-09-15 17:08:44.820847'),('rvdntzt6h0phnuun4x7oj1x62ipnr2w8','ZDEzNGFkMzEyYzFlNGEwZDJmMTJjNWVkZjU1NzU4MzUzNTc3NGRmYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjljOWI3MTg1NzNhMzFkZjBkMzk2MzZmNzNiNTM4OWIwOTc0NmI4YTkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-09-11 16:47:49.873277'),('ti0ngez84h3ttb3v558hoomzz7jvfv0s','MTZjYjU0NThiYmQwMWMzOTljNDJiYTlmYmE3Y2FhZDZlZDlhNTdlMTp7fQ==','2016-09-12 14:32:02.949177'),('xrw7r1we9ujl5fd6wqcm82cudcou6o0i','MjViZmE5YmRhNDE0YjRkZDUxMTk5ZDUwODVlYWY3OTI1ZjRjYjA3NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjljOWI3MTg1NzNhMzFkZjBkMzk2MzZmNzNiNTM4OWIwOTc0NmI4YTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-09-12 13:57:24.039628');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-10 19:20:58
