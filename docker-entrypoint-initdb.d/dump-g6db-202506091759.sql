/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: g6db
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `g6db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `g6db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `g6db`;

--
-- Table structure for table `appblog_comment`
--

DROP TABLE IF EXISTS `appblog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appblog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `publish` datetime NOT NULL,
  `approved_comment` tinyint(1) NOT NULL,
  `post_id` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appblog_comment_post_id_2f247b10` (`post_id`),
  CONSTRAINT `appblog_comment_FK_0_0` FOREIGN KEY (`post_id`) REFERENCES `appblog_post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appblog_comment`
--

LOCK TABLES `appblog_comment` WRITE;
/*!40000 ALTER TABLE `appblog_comment` DISABLE KEYS */;
INSERT INTO `appblog_comment` VALUES
(25,'mb','c1','2021-12-20 13:43:32',1,6),
(26,'mb','c2','2021-12-20 13:53:18',1,6),
(27,'mb','c3','2021-12-20 13:55:38',1,6),
(28,'mb','c4','2021-12-20 13:56:07',1,6),
(29,'mb','c1','2021-12-20 13:56:37',1,4),
(30,'mb','c2','2021-12-20 13:56:51',1,4),
(31,'mb','c1','2021-12-20 13:57:28',1,3),
(32,'mb','c5','2021-12-20 14:47:21',1,6);
/*!40000 ALTER TABLE `appblog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appblog_post`
--

DROP TABLE IF EXISTS `appblog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appblog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `author_id` int(11) NOT NULL,
  `publish` datetime NOT NULL,
  `created` datetime NOT NULL,
  `slug` varchar(200) NOT NULL,
  `updated` datetime NOT NULL,
  `category` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appblog_post_slug_7b56ebab` (`slug`),
  KEY `appblog_post_author_id_e064ffb1` (`author_id`),
  CONSTRAINT `appblog_post_FK_0_0` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appblog_post`
--

LOCK TABLES `appblog_post` WRITE;
/*!40000 ALTER TABLE `appblog_post` DISABLE KEYS */;
INSERT INTO `appblog_post` VALUES
(3,'Objetivo 3: Garantizar una vida sana y promover el bienestar para todos en todas las edades','Objetivo de Desarrollo Sostenible 3\r\nSalud y bienestar.\r\nAcrónimo    ODS 3\r\nTipo(category):    Objetivos del Milenio\r\nObjetivos   Garantizar una vida sana y promover el bienestar para todos en todas las edades.\r\nFundación   2015\r\nFundador    Naciones Unidas\r\nSitio web   https://sdgs.un.org/goals/goal3',2,'2021-12-18 08:34:43','2021-12-14 23:39:39','objetivo-3-garantizar-una-vida-sana-y-promover-el-bienestar-para-todos-en-todas-las-edades','2021-12-24 20:30:30','objetivos_del_milenio','published'),
(4,'Objetivo 4: Garantizar una educación inclusiva, equitativa y de calidad y promover oportunidades de aprendizaje durante toda la vida para todos','Objetivo de Desarrollo Sostenible 4\r\nEducación de calidad.\r\nAcrónimo    ODS 4\r\nTipo(category):    Objetivos del Milenio\r\nObjetivos   Garantizar una educación inclusiva, equitativa y de calidad y promover oportunidades de aprendizaje durante toda la vida para todos.\r\nFundación   2015\r\nFundador    Naciones Unidas\r\nSitio web   https://sdgs.un.org/goals/goal4',2,'2021-12-18 09:34:44','2021-12-14 23:39:58','objetivo-4-garantizar-una-educacion-inclusiva-equitativa-y-de-calidad-y-promover-oportunidades-de-aprendizaje-durante-toda-la-vida-para-todos','2021-12-24 20:30:19','objetivos_del_milenio','published'),
(5,'Objetivo 5: Lograr la igualdad entre los géneros.','Objetivo de Desarrollo Sostenible 5\r\nIgualdad de género.\r\nAcrónimo    ODS 5\r\nTipo(category):    ONU\r\nObjetivos   Lograr la igualdad entre los géneros y empoderar a todas las mujeres y las niñas.\r\nSitio web   https://sdgs.un.org/goals/goal5',2,'2021-12-14 23:39:59','2021-12-14 23:40:27','objetivo-5-lograr-la-igualdad-entre-los-generos','2021-12-24 20:29:52','onu','published'),
(6,'Objetivo 6: Garantizar la disponibilidad de agua y su gestión sostenible y el saneamiento para todos','Objetivo de Desarrollo Sostenible 6\r\nAgua limpia y saneamiento.\r\nAcrónimo    ODS 6\r\nTipo(category):    Objetivos del Milenio\r\nObjetivos   Garantizar la disponibilidad de agua y su gestión sostenible y el saneamiento para todos.\r\nFundación   2015\r\nFundador    Naciones Unidas\r\nSitio web   https://sdgs.un.org/goals/goal6',2,'2021-12-14 23:40:28','2021-12-14 23:40:47','objetivo-6-garantizar-la-disponibilidad-de-agua-y-su-gestion-sostenible-y-el-saneamiento-para-todos','2021-12-24 20:32:19','objetivos_del_milenio','published');
/*!40000 ALTER TABLE `appblog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appuser_userx`
--

DROP TABLE IF EXISTS `appuser_userx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appuser_userx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(200) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `text` text NOT NULL,
  `publish` datetime NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appuser_post2_author_id_a9a680c1` (`author_id`),
  KEY `appuser_post2_slug_a91b543d` (`slug`),
  CONSTRAINT `appuser_userx_FK_0_0` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appuser_userx`
--

LOCK TABLES `appuser_userx` WRITE;
/*!40000 ALTER TABLE `appuser_userx` DISABLE KEYS */;
INSERT INTO `appuser_userx` VALUES
(1,'pepe','lastname','pepe-lastname','hola pepe','2021-12-18 11:35:54','2021-12-18 11:36:48','2021-12-18 11:38:28','published',1),
(2,'pepa','lastname','pepa-lastname','hola pepa','2021-12-18 11:37:13','2021-12-18 11:37:35','2021-12-18 11:38:33','published',1);
/*!40000 ALTER TABLE `appuser_userx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sqlite_autoindex_auth_group_1` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES
(2,'administrators'),
(1,'writers');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  CONSTRAINT `auth_group_permissions_FK_0_0` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `auth_group_permissions_FK_1_0` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES
(42,1,1),
(43,1,2),
(44,1,3),
(45,1,4),
(46,1,5),
(47,1,6),
(48,1,7),
(49,1,8),
(50,1,9),
(51,1,10),
(52,1,11),
(53,1,12),
(2,1,13),
(54,1,14),
(55,1,15),
(56,1,16),
(57,1,17),
(58,1,18),
(59,1,19),
(60,1,20),
(61,1,21),
(62,1,22),
(63,1,23),
(64,1,24),
(3,1,25),
(4,1,26),
(5,1,27),
(6,1,28),
(7,1,29),
(8,1,30),
(9,1,31),
(1,1,32),
(65,1,33),
(66,1,34),
(67,1,35),
(68,1,36),
(69,1,37),
(70,1,38),
(71,1,39),
(72,1,40),
(10,2,1),
(11,2,2),
(12,2,3),
(13,2,4),
(14,2,5),
(15,2,6),
(16,2,7),
(17,2,8),
(18,2,9),
(19,2,10),
(20,2,11),
(21,2,12),
(22,2,13),
(23,2,14),
(24,2,15),
(25,2,16),
(26,2,17),
(27,2,18),
(28,2,19),
(29,2,20),
(30,2,21),
(31,2,22),
(32,2,23),
(33,2,24),
(34,2,25),
(35,2,26),
(36,2,27),
(37,2,28),
(38,2,29),
(39,2,30),
(40,2,31),
(41,2,32),
(73,2,33),
(74,2,34),
(75,2,35),
(76,2,36),
(77,2,37),
(78,2,38),
(79,2,39),
(80,2,40);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`),
  CONSTRAINT `auth_permission_FK_0_0` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,1,'add_logentry','Can add log entry'),
(2,1,'change_logentry','Can change log entry'),
(3,1,'delete_logentry','Can delete log entry'),
(4,1,'view_logentry','Can view log entry'),
(5,2,'add_permission','Can add permission'),
(6,2,'change_permission','Can change permission'),
(7,2,'delete_permission','Can delete permission'),
(8,2,'view_permission','Can view permission'),
(9,3,'add_group','Can add group'),
(10,3,'change_group','Can change group'),
(11,3,'delete_group','Can delete group'),
(12,3,'view_group','Can view group'),
(13,4,'add_user','Can add user'),
(14,4,'change_user','Can change user'),
(15,4,'delete_user','Can delete user'),
(16,4,'view_user','Can view user'),
(17,5,'add_contenttype','Can add content type'),
(18,5,'change_contenttype','Can change content type'),
(19,5,'delete_contenttype','Can delete content type'),
(20,5,'view_contenttype','Can view content type'),
(21,6,'add_session','Can add session'),
(22,6,'change_session','Can change session'),
(23,6,'delete_session','Can delete session'),
(24,6,'view_session','Can view session'),
(25,7,'add_post','Can add post'),
(26,7,'change_post','Can change post'),
(27,7,'delete_post','Can delete post'),
(28,7,'view_post','Can view post'),
(29,8,'add_comment','Can add comment'),
(30,8,'change_comment','Can change comment'),
(31,8,'delete_comment','Can delete comment'),
(32,8,'view_comment','Can view comment'),
(33,9,'add_post2','Can add post2'),
(34,9,'change_post2','Can change post2'),
(35,9,'delete_post2','Can delete post2'),
(36,9,'view_post2','Can view post2'),
(37,9,'add_userx','Can add userx'),
(38,9,'change_userx','Can change userx'),
(39,9,'delete_userx','Can delete userx'),
(40,9,'view_userx','Can view userx');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `first_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sqlite_autoindex_auth_user_1` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$260000$3uSLoN0yDzJqZuAQsWHRtu$sL1Rr6C5geyHVNO5kd4kBOMXm/VBjmx8Y9br9Ara3qA=','2025-06-08 17:56:13',1,'admin','','',1,1,'2021-12-14 23:17:40',''),
(2,'pbkdf2_sha256$260000$xg7co1L3O8RfjczDFrTEJG$eRSEexdjeZ7gr/CiNeCCl0UPJxTjZ8LvQ/MBBPwGd3s=','2025-06-08 17:55:35',1,'grupo6','','',1,1,'2021-12-20 15:22:20','');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  CONSTRAINT `auth_user_groups_FK_0_0` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `auth_user_groups_FK_1_0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  CONSTRAINT `auth_user_user_permissions_FK_0_0` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `auth_user_user_permissions_FK_1_0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` text DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `change_message` text NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  CONSTRAINT `django_admin_log_FK_0_0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `django_admin_log_FK_1_0` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2021-12-14 23:38:55','1','Objetivo 1: Poner fin a la pobreza en todas sus formas en todo el mundo','[{\"added\": {}}]',7,1,1),
(2,'2021-12-14 23:39:18','2','Objetivo 2: Poner fin al hambre, lograr la seguridad alimentaria y la mejora de la nutrición y promover la agricultura sostenible','[{\"added\": {}}]',7,1,1),
(3,'2021-12-14 23:39:39','3','Objetivo 3: Garantizar una vida sana y promover el bienestar para todos en todas las edades','[{\"added\": {}}]',7,1,1),
(4,'2021-12-14 23:39:58','4','Objetivo 4: Garantizar una educación inclusiva, equitativa y de calidad y promover oportunidades de aprendizaje durante toda la vida para todos','[{\"added\": {}}]',7,1,1),
(5,'2021-12-14 23:40:27','5','Objetivo 5: Lograr la igualdad entre los géneros.','[{\"added\": {}}]',7,1,1),
(6,'2021-12-14 23:40:47','6','Objetivo 6: Garantizar la disponibilidad de agua y su gestión sostenible y el saneamiento para todos','[{\"added\": {}}]',7,1,1),
(7,'2021-12-15 00:15:32','7','New title','[{\"changed\": {\"fields\": [\"Slug\", \"Text\", \"Status\"]}}]',7,1,2),
(8,'2021-12-17 22:56:33','1','writer','[{\"added\": {}}]',3,1,1),
(9,'2021-12-17 22:56:46','2','administrators','[{\"added\": {}}]',3,1,1),
(10,'2021-12-17 22:56:58','1','writers','[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1,2),
(11,'2021-12-17 22:57:57','10','xxx','[{\"changed\": {\"fields\": [\"Slug\"]}}]',7,1,2),
(12,'2021-12-17 22:59:04','12','yyy','[{\"added\": {}}]',7,1,1),
(13,'2021-12-18 10:19:17','6','Objetivo 6: Garantizar la disponibilidad de agua y su gestión sostenible y el saneamiento para todos','[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1,2),
(14,'2021-12-18 10:19:33','5','Objetivo 5: Lograr la igualdad entre los géneros.','[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1,2),
(15,'2021-12-18 11:36:48','1','pepe','[{\"added\": {}}]',9,1,1),
(16,'2021-12-18 11:37:35','2','pepa','[{\"added\": {}}]',9,1,1),
(17,'2021-12-18 11:38:28','1','pepe','[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1,2),
(18,'2021-12-18 11:38:33','2','pepa','[{\"changed\": {\"fields\": [\"Status\"]}}]',9,1,2),
(19,'2021-12-18 12:28:22','25','jjjjjjj jjjjjjjjjjj','',7,1,3),
(20,'2021-12-18 12:28:22','24','jj hhh','',7,1,3),
(21,'2021-12-18 12:28:23','23','dd dddd','',7,1,3),
(22,'2021-12-18 12:28:23','22','fadfaa fadfafa','',7,1,3),
(23,'2021-12-18 12:28:23','21','fafa fdafa','',7,1,3),
(24,'2021-12-18 12:28:23','20','fdafa fadfadfa','',7,1,3),
(25,'2021-12-18 12:28:23','16','ver si agrega slugxxxx','',7,1,3),
(26,'2021-12-18 12:28:23','15','ver si agrega slug','',7,1,3),
(27,'2021-12-18 12:49:09','14','zzz--editado--debe aparecer abaja de todo','',7,1,3),
(28,'2021-12-18 12:49:09','13','saturday','',7,1,3),
(29,'2021-12-18 12:49:09','10','xxx','',7,1,3),
(30,'2021-12-18 12:49:23','26','slug automático','',7,1,3),
(31,'2021-12-18 13:49:40','7','fdfadffa','[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1,2),
(32,'2021-12-20 13:23:12','1','writers','[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1,2),
(33,'2021-12-20 13:23:51','2','administrators','[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(8,'appblog','comment'),
(7,'appblog','post'),
(9,'appuser','userx'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2021-12-14 23:16:12'),
(2,'auth','0001_initial','2021-12-14 23:16:12'),
(3,'admin','0001_initial','2021-12-14 23:16:12'),
(4,'admin','0002_logentry_remove_auto_add','2021-12-14 23:16:12'),
(5,'admin','0003_logentry_add_action_flag_choices','2021-12-14 23:16:12'),
(6,'appblog','0001_initial','2021-12-14 23:16:12'),
(7,'appblog','0002_auto_20211214_2315','2021-12-14 23:16:13'),
(8,'contenttypes','0002_remove_content_type_name','2021-12-14 23:16:13'),
(9,'auth','0002_alter_permission_name_max_length','2021-12-14 23:16:13'),
(10,'auth','0003_alter_user_email_max_length','2021-12-14 23:16:14'),
(11,'auth','0004_alter_user_username_opts','2021-12-14 23:16:14'),
(12,'auth','0005_alter_user_last_login_null','2021-12-14 23:16:14'),
(13,'auth','0006_require_contenttypes_0002','2021-12-14 23:16:14'),
(14,'auth','0007_alter_validators_add_error_messages','2021-12-14 23:16:14'),
(15,'auth','0008_alter_user_username_max_length','2021-12-14 23:16:15'),
(16,'auth','0009_alter_user_last_name_max_length','2021-12-14 23:16:15'),
(17,'auth','0010_alter_group_name_max_length','2021-12-14 23:16:15'),
(18,'auth','0011_update_proxy_permissions','2021-12-14 23:16:16'),
(19,'auth','0012_alter_user_first_name_max_length','2021-12-14 23:16:16'),
(20,'sessions','0001_initial','2021-12-14 23:16:16'),
(21,'appblog','0003_auto_20211216_1945','2021-12-16 19:45:56'),
(22,'appuser','0001_initial','2021-12-18 11:33:46'),
(23,'appuser','0002_remove_post2_title','2021-12-18 11:35:04'),
(24,'appblog','0004_alter_post_options','2021-12-18 12:13:28'),
(25,'appuser','0003_rename_post2_userx','2021-12-18 12:50:30'),
(26,'appblog','0005_post_category','2021-12-18 13:38:20'),
(27,'appblog','0006_alter_post_status','2021-12-18 14:10:30');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` text NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('03ztrnyplj7esglam7k1en3pl8ufbnqu','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1n0FK6:tqh0I8QObLkC5eScrJZ7Y7Rnewlod4RfP4mZs4fIBe0','2022-01-06 01:03:22'),
('1totqj1d2ml4cn7ezvouh4gwfgeutohq','.eJxVjEEOwiAQRe_C2pChQIe4dO8ZyACDVA0kpV0Z764kXej2v_f-S3jat-L3zqtfkjiLSZx-t0DxwXWAdKd6azK2uq1LkEORB-3y2hI_L4f7d1Col1HbYFx2KkbFKjsACEoZayBqPbOZLH-xThYNOkayBOgcYMaExtKsxPsDy1A25g:1n0Srl:Dcw_WZCfBIMr0aPfP0S0nQjiZSwLUiavOYAbYimGlr8','2022-01-06 15:31:01'),
('2ltsnb59dhmxmqemxy3racr6m9r5ytz6','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1mxJrb:TjQ303QOwwvbdSIjPWfX6KseYylzb6iiXVYJhQmE3Wg','2021-12-28 23:17:51'),
('30fct9fq2xuoo4ppyry4d7hinnkust4a','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myKaO:dqdmCFGMFJ1V0bPoDKjMSu41DG6q2zqV-1sPPYRqyds','2021-12-31 18:16:16'),
('58p9ucwaap8d3vcykl030hkszroei6xi','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myhMR:IRKuFC3yJpHCDUdZht4Vxi2z2WoewPw1oGA5YILPU78','2022-01-01 18:35:23'),
('6o7w6kib0bhgjujlu2ljpmf7b3w75rj7','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1n7Mld:exkL8fhUxKcRzZVGsAmQIDhre_grzc2rhSRJZ37Z9cY','2022-01-25 16:25:13'),
('7nerew37eupu3ieuknwqsr4gidlaq9ye','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1mxtQj:QaoICLkRuXZZ9VDq8RphTg-0VAmlz0cezhDD1oyOjgw','2021-12-30 13:16:29'),
('8yosltvr52u70vpitd70j1e9zi31difi','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1mzMk8:MqsjCwEaTY8VMmCig9ennwXK_KEiWVFnTWiQZejN_Ec','2022-01-03 14:46:36'),
('9inno2k3e6pgcmrnbwqgxfjdh1bac5ij','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myMAj:O9LRgd2xOEXaWItrXszg8UTkEYyX4m5TDcUeyjcFKXE','2021-12-31 19:57:53'),
('a84alqeg0zi2aek9c3bfs4b8a0n6s1li','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1mxzMm:yT05aay4ae-ulVQOauJpcvEfsUtLqRvBSPtbfYs6z_o','2021-12-30 19:36:48'),
('ajcr0p6ju6plg5cjfgrn3kqjme6d3d4k','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myEKU:NfxoPN5bdQ4tT81-xiCJns8urk9Ayc3FjfOJAfQBbsY','2021-12-31 11:35:26'),
('bcjrcuh37hmmco5c7cngm101qe2a9cgr','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1mxUFa:G-F5vpQThhL-NTilS8rFiLq-IjFP8nySyIeQqVdApZE','2021-12-29 10:23:18'),
('bgzcbn3blz7opsh1ls132w02g8knzcmc','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myDNt:qGqmZYkKYhmPO1Z4DZu57ApDUfdGcGRvAXcgnqy1WEg','2021-12-31 10:34:53'),
('buz5ycoixwgy8kyl25yy39k8a7v5dahk','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myLpz:bypGi8DopYAnuVMDo91PaRPMU8ROSce1gfkgjYIrfLc','2021-12-31 19:36:27'),
('cg8skjmcd7qha6i6fal9e7pfjg9ytkwy','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myCYZ:iRbmR41IJpPaXlQk3m6j3YvV20gnYdsVwCzyFE0Ld_k','2021-12-31 09:41:51'),
('comj4udhjj3c5zyg2auelo999ez4s6h7','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myWoM:Z2bgPcRu0xMOFHJFRb25gev5QvqQsy46JEyJudFJr_k','2022-01-01 07:19:30'),
('fcst94z4rzhrg7zuvpsem4t8ip2bjmj1','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myCIy:3WtAx3AQ3XX7nyrZCk5_y-kJCkBJXGMyUIekapV6BeY','2021-12-31 09:25:44'),
('ipbdlrnapmp8kouodjbzsgcliaow9d51','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myCBq:zNe_X3pCNNAmeScWDWA00wpZaoRHzZwyE41dYo3IYdk','2021-12-31 09:18:22'),
('it1h9m1s2aed3oy2zsbzdxad4941j2gw','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myCFn:oQmsEW43jecleMCLJqQwB2lm1PH_o2mgPKeg6Uqq8n0','2021-12-31 09:22:27'),
('jr0p6ldbaor9rhu0e5s5h0cdgtd18y31','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1uON3t:Njx6Bc7dAVoyQ35Gl97DbqWt0nJz2i9B9pw4-JX3pRI','2025-06-22 17:56:13'),
('lkvt1mmq8nicor2unolc3xpb1t8ea44m','.eJxVjEEOwiAQRe_C2pChQIe4dO8ZyACDVA0kpV0Z764kXej2v_f-S3jat-L3zqtfkjiLSZx-t0DxwXWAdKd6azK2uq1LkEORB-3y2hI_L4f7d1Col1HbYFx2KkbFKjsACEoZayBqPbOZLH-xThYNOkayBOgcYMaExtKsxPsDy1A25g:1n5AnA:35XTG0Sc_OMrWToXWavwHr7d_IhHhSc6PM23rl0jIcg','2022-01-19 15:13:44'),
('m58ms39jmkzi0ld8xfv7x6ixojb0yg57','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1mzLLX:Eq654FQ0-1EmIdEgF4tUtln40j5L11kfDeZtjK5hKc4','2022-01-03 13:17:07'),
('m8c886g8ec62z9k1gy0iq8c9wjojjrjq','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1mzKTU:ZanXA55mp8nRpPHrfpe4WaI7xtssrx1vxSAGEyeDg0k','2022-01-03 12:21:16'),
('p3spy10rtinixmalqw7usxcrqiasib7v','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myA1M:6OWMLevjbfEJLKkHK2R3Mow7uNTJN_JM1ETtHn6Cczs','2021-12-31 06:59:24'),
('ph3p20k67vdrb673m9tt3i0f55e933ml','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myJw1:kcorYjZ9K1vewp8mUAe6nu4CKsUTnGNGj241Lzh1Ios','2021-12-31 17:34:33'),
('qu1rx1ts61p5ipsqge58iv5nigylmguk','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myO0K:UVBT4Osf3l5NIMChuhXvgedbMUv_AqDYiAkwJCv5SZM','2021-12-31 21:55:16'),
('qyfswrkqw63n0396q39fhsqfabso334y','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1my9yG:FP5ejGNCyNnZwvb6alzZ-6j6HHyjO9YgnpXnQqO82ns','2021-12-31 06:56:12'),
('rvyz5bwywx7jsq6fhx082k2fomrli6vg','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myA3L:Os59h-Nj_L8D0csmW9r7GFYRbSrgvGhTyRhsyaF8XMc','2021-12-31 07:01:27'),
('s4wcxd30tczikwc0vm1qfajavcvpi4vh','.eJxVjEEOwiAQRe_C2pChQIe4dO8ZyACDVA0kpV0Z764kXej2v_f-S3jat-L3zqtfkjiLSZx-t0DxwXWAdKd6azK2uq1LkEORB-3y2hI_L4f7d1Col1HbYFx2KkbFKjsACEoZayBqPbOZLH-xThYNOkayBOgcYMaExtKsxPsDy1A25g:1o94Tq:qTeVmvuimgpFwaHiFtriTbJ_H9b-LQGG5wG8v02V8Qo','2022-07-20 09:50:10'),
('t57lxdwk0f0t20wl22nwso57en46ud31','.eJxVjEEOwiAQRe_C2pChQIe4dO8ZyACDVA0kpV0Z764kXej2v_f-S3jat-L3zqtfkjiLSZx-t0DxwXWAdKd6azK2uq1LkEORB-3y2hI_L4f7d1Col1HbYFx2KkbFKjsACEoZayBqPbOZLH-xThYNOkayBOgcYMaExtKsxPsDy1A25g:1n0ttQ:r8RzzDMWIlhc2QUB_KGJeG8FUVAC_e5aB70NSvzc_DI','2022-01-07 20:22:32'),
('tu1jimgt05l1pxsu52rrwbl3t0rs8w49','.eJxVjEEOwiAQRe_C2pChQIe4dO8ZyACDVA0kpV0Z764kXej2v_f-S3jat-L3zqtfkjiLSZx-t0DxwXWAdKd6azK2uq1LkEORB-3y2hI_L4f7d1Col1HbYFx2KkbFKjsACEoZayBqPbOZLH-xThYNOkayBOgcYMaExtKsxPsDy1A25g:1o94Ws:ChJU6cebDK65EfgfbCreobKzMF5C3HdyGUsVkps1Kv8','2022-07-20 09:53:18'),
('vd1zrp2ea76wo5oay659bn7btm2nbe9i','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1mxt9t:MTAWajRbapClgwbzeRdPLqjWsqur2yEotSMA9dbs5VA','2021-12-30 12:59:05'),
('w1po71za5cozqe7ckaeh7xcjo0n2gvsy','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1n0G9C:FTvOiB2MbcHZneIY6OR368liDav1RAqrI4zeCW41fOg','2022-01-06 01:56:10'),
('xpu6islxkeb0ns1hwc8vaui5l2yds2p5','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1o94MN:v-uvJt7bJGV2kHbAF3LaaBo7OI7dFYw4S9MAne_-H5M','2022-07-20 09:42:27'),
('y7aybrzr5qvelzogbmwufzios3nxhms3','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1mxtg3:PHXgJxZsalj4if50jIM8eWK6bmb0LJbN27LPjd2uRIo','2021-12-30 13:32:19'),
('yksg8br754t5z7w3e61131mqcoadyaqv','.eJxVjE0OwiAYRO_C2hCgCOLSfc9Avh-QqoGktCvj3W2TLnQ3mfdm3iLCupS49jTHicVVaHH67RDomeoO-AH13iS1uswTyl2RB-1ybJxet8P9OyjQy7b2VlvvhoxMZgsqoMvZaEXOBkgcLOts_KACBbqcNapgBkawhhQAYhafL8-mN_U:1myKWX:BiXwS5Okgeg1Rn7pzKu-6Yw179eJopgnvtGbaL_b5AM','2021-12-31 18:12:17'),
('yyb0gv1diotl61sjsbzo19413441jt1o','.eJxVjEEOwiAQRe_C2pChQIe4dO8ZyACDVA0kpV0Z764kXej2v_f-S3jat-L3zqtfkjiLSZx-t0DxwXWAdKd6azK2uq1LkEORB-3y2hI_L4f7d1Col1HbYFx2KkbFKjsACEoZayBqPbOZLH-xThYNOkayBOgcYMaExtKsxPsDy1A25g:1n0Ujx:gbzLRKndf3ee85jgfnVNQwtQtRRwEeKiE31htIJZV6U','2022-01-06 17:31:05');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'g6db'
--

--
-- Dumping routines for database 'g6db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-09 17:59:09
