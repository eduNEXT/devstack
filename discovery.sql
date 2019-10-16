-- MySQL dump 10.13  Distrib 5.6.42, for Linux (x86_64)
--
-- Host: localhost    Database: discovery
-- ------------------------------------------------------
-- Server version	5.6.42

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
-- Current Database: `discovery`
--

/*!40000 DROP DATABASE IF EXISTS `discovery`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `discovery` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `discovery`;

--
-- Table structure for table `auth_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (8,'General Staff'),(2,'Internal Users'),(7,'Legal Team Members'),(4,'Marketing Reviewers'),(6,'Partner Managers'),(9,'Partner Support Members'),(3,'Project Coordinators'),(1,'Publisher Admins'),(5,'Publishers');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',2,'add_logentry'),(2,'Can change log entry',2,'change_logentry'),(3,'Can delete log entry',2,'delete_logentry'),(4,'Can add group',3,'add_group'),(5,'Can change group',3,'change_group'),(6,'Can delete group',3,'delete_group'),(7,'Can add permission',4,'add_permission'),(8,'Can change permission',4,'change_permission'),(9,'Can delete permission',4,'delete_permission'),(10,'Can add content type',5,'add_contenttype'),(11,'Can change content type',5,'change_contenttype'),(12,'Can delete content type',5,'delete_contenttype'),(13,'Can add session',6,'add_session'),(14,'Can change session',6,'change_session'),(15,'Can delete session',6,'delete_session'),(16,'Can add site',7,'add_site'),(17,'Can change site',7,'change_site'),(18,'Can delete site',7,'delete_site'),(19,'Can add code',8,'add_code'),(20,'Can change code',8,'change_code'),(21,'Can delete code',8,'delete_code'),(22,'Can add nonce',9,'add_nonce'),(23,'Can change nonce',9,'change_nonce'),(24,'Can delete nonce',9,'delete_nonce'),(25,'Can add partial',10,'add_partial'),(26,'Can change partial',10,'change_partial'),(27,'Can delete partial',10,'delete_partial'),(28,'Can add association',11,'add_association'),(29,'Can change association',11,'change_association'),(30,'Can delete association',11,'delete_association'),(31,'Can add user social auth',12,'add_usersocialauth'),(32,'Can change user social auth',12,'change_usersocialauth'),(33,'Can delete user social auth',12,'delete_usersocialauth'),(34,'Can add flag',13,'add_flag'),(35,'Can change flag',13,'change_flag'),(36,'Can delete flag',13,'delete_flag'),(37,'Can add sample',14,'add_sample'),(38,'Can change sample',14,'change_sample'),(39,'Can delete sample',14,'delete_sample'),(40,'Can add switch',15,'add_switch'),(41,'Can change switch',15,'change_switch'),(42,'Can delete switch',15,'delete_switch'),(43,'Can add group object permission',16,'add_groupobjectpermission'),(44,'Can change group object permission',16,'change_groupobjectpermission'),(45,'Can delete group object permission',16,'delete_groupobjectpermission'),(46,'Can add user object permission',17,'add_userobjectpermission'),(47,'Can change user object permission',17,'change_userobjectpermission'),(48,'Can delete user object permission',17,'delete_userobjectpermission'),(49,'Can add comment',18,'add_comment'),(50,'Can change comment',18,'change_comment'),(51,'Can delete comment',18,'delete_comment'),(52,'Can moderate comments',18,'can_moderate'),(53,'Can add comment flag',19,'add_commentflag'),(54,'Can change comment flag',19,'change_commentflag'),(55,'Can delete comment flag',19,'delete_commentflag'),(56,'Can add Tagged Item',20,'add_taggeditem'),(57,'Can change Tagged Item',20,'change_taggeditem'),(58,'Can delete Tagged Item',20,'delete_taggeditem'),(59,'Can add Tag',21,'add_tag'),(60,'Can change Tag',21,'change_tag'),(61,'Can delete Tag',21,'delete_tag'),(62,'Can add Partner',22,'add_partner'),(63,'Can change Partner',22,'change_partner'),(64,'Can delete Partner',22,'delete_partner'),(65,'Can add currency',23,'add_currency'),(66,'Can change currency',23,'change_currency'),(67,'Can delete currency',23,'delete_currency'),(68,'Can add user',24,'add_user'),(69,'Can change user',24,'change_user'),(70,'Can delete user',24,'delete_user'),(71,'Can add user throttle rate',25,'add_userthrottlerate'),(72,'Can change user throttle rate',25,'change_userthrottlerate'),(73,'Can delete user throttle rate',25,'delete_userthrottlerate'),(74,'Can add language tag',26,'add_languagetag'),(75,'Can change language tag',26,'change_languagetag'),(76,'Can delete language tag',26,'delete_languagetag'),(77,'Can add catalog',27,'add_catalog'),(78,'Can change catalog',27,'change_catalog'),(79,'Can delete catalog',27,'delete_catalog'),(80,'Can view catalog',27,'view_catalog'),(81,'Can add corporate endorsement',28,'add_corporateendorsement'),(82,'Can change corporate endorsement',28,'change_corporateendorsement'),(83,'Can delete corporate endorsement',28,'delete_corporateendorsement'),(84,'Can add course run',29,'add_courserun'),(85,'Can change course run',29,'change_courserun'),(86,'Can delete course run',29,'delete_courserun'),(87,'Can add Topic model translations',30,'add_topictranslation'),(88,'Can change Topic model translations',30,'change_topictranslation'),(89,'Can delete Topic model translations',30,'delete_topictranslation'),(90,'Can add level type',31,'add_leveltype'),(91,'Can change level type',31,'change_leveltype'),(92,'Can delete level type',31,'delete_leveltype'),(93,'Can add person social network',32,'add_personsocialnetwork'),(94,'Can change person social network',32,'change_personsocialnetwork'),(95,'Can delete person social network',32,'delete_personsocialnetwork'),(96,'Can add course run social network',33,'add_courserunsocialnetwork'),(97,'Can change course run social network',33,'change_courserunsocialnetwork'),(98,'Can delete course run social network',33,'delete_courserunsocialnetwork'),(99,'Can add prerequisite',34,'add_prerequisite'),(100,'Can change prerequisite',34,'change_prerequisite'),(101,'Can delete prerequisite',34,'delete_prerequisite'),(102,'Can add person work',35,'add_personwork'),(103,'Can change person work',35,'change_personwork'),(104,'Can delete person work',35,'delete_personwork'),(105,'Can add data loader config',36,'add_dataloaderconfig'),(106,'Can change data loader config',36,'change_dataloaderconfig'),(107,'Can delete data loader config',36,'delete_dataloaderconfig'),(108,'Can add program type',37,'add_programtype'),(109,'Can change program type',37,'change_programtype'),(110,'Can delete program type',37,'delete_programtype'),(111,'Can add course entitlement',38,'add_courseentitlement'),(112,'Can change course entitlement',38,'change_courseentitlement'),(113,'Can delete course entitlement',38,'delete_courseentitlement'),(114,'Can add FAQ',39,'add_faq'),(115,'Can change FAQ',39,'change_faq'),(116,'Can delete FAQ',39,'delete_faq'),(117,'Can add Subject model translations',40,'add_subjecttranslation'),(118,'Can change Subject model translations',40,'change_subjecttranslation'),(119,'Can delete Subject model translations',40,'delete_subjecttranslation'),(120,'Can add program',41,'add_program'),(121,'Can change program',41,'change_program'),(122,'Can delete program',41,'delete_program'),(123,'Can add endorsement',42,'add_endorsement'),(124,'Can change endorsement',42,'change_endorsement'),(125,'Can delete endorsement',42,'delete_endorsement'),(126,'Can add job outlook item',43,'add_joboutlookitem'),(127,'Can change job outlook item',43,'change_joboutlookitem'),(128,'Can delete job outlook item',43,'delete_joboutlookitem'),(129,'Can add image',44,'add_image'),(130,'Can change image',44,'change_image'),(131,'Can delete image',44,'delete_image'),(132,'Can add expected learning item',45,'add_expectedlearningitem'),(133,'Can change expected learning item',45,'change_expectedlearningitem'),(134,'Can delete expected learning item',45,'delete_expectedlearningitem'),(135,'Can add seat',46,'add_seat'),(136,'Can change seat',46,'change_seat'),(137,'Can delete seat',46,'delete_seat'),(138,'Can add topic',47,'add_topic'),(139,'Can change topic',47,'change_topic'),(140,'Can delete topic',47,'delete_topic'),(141,'Can add video',48,'add_video'),(142,'Can change video',48,'change_video'),(143,'Can delete video',48,'delete_video'),(144,'Can add seat type',49,'add_seattype'),(145,'Can change seat type',49,'change_seattype'),(146,'Can delete seat type',49,'delete_seattype'),(147,'Can add course',50,'add_course'),(148,'Can change course',50,'change_course'),(149,'Can delete course',50,'delete_course'),(150,'Can add syllabus item',51,'add_syllabusitem'),(151,'Can change syllabus item',51,'change_syllabusitem'),(152,'Can delete syllabus item',51,'delete_syllabusitem'),(153,'Can add position',52,'add_position'),(154,'Can change position',52,'change_position'),(155,'Can delete position',52,'delete_position'),(156,'Can add organization',53,'add_organization'),(157,'Can change organization',53,'change_organization'),(158,'Can delete organization',53,'delete_organization'),(159,'Can add subject',54,'add_subject'),(160,'Can change subject',54,'change_subject'),(161,'Can delete subject',54,'delete_subject'),(162,'Can add person',55,'add_person'),(163,'Can change person',55,'change_person'),(164,'Can delete person',55,'delete_person'),(165,'Can add organization user role',56,'add_organizationuserrole'),(166,'Can change organization user role',56,'change_organizationuserrole'),(167,'Can delete organization user role',56,'delete_organizationuserrole'),(168,'Can add course run',57,'add_courserun'),(169,'Can change course run',57,'change_courserun'),(170,'Can delete course run',57,'delete_courserun'),(171,'Can add historical course',58,'add_historicalcourse'),(172,'Can change historical course',58,'change_historicalcourse'),(173,'Can delete historical course',58,'delete_historicalcourse'),(174,'Can add historical course run',59,'add_historicalcourserun'),(175,'Can change historical course run',59,'change_historicalcourserun'),(176,'Can delete historical course run',59,'delete_historicalcourserun'),(177,'Can add historical course state',60,'add_historicalcoursestate'),(178,'Can change historical course state',60,'change_historicalcoursestate'),(179,'Can delete historical course state',60,'delete_historicalcoursestate'),(180,'Can add course run state',61,'add_courserunstate'),(181,'Can change course run state',61,'change_courserunstate'),(182,'Can delete course run state',61,'delete_courserunstate'),(183,'Can add historical course user role',62,'add_historicalcourseuserrole'),(184,'Can change historical course user role',62,'change_historicalcourseuserrole'),(185,'Can delete historical course user role',62,'delete_historicalcourseuserrole'),(186,'Can add course',63,'add_course'),(187,'Can change course',63,'change_course'),(188,'Can delete course',63,'delete_course'),(189,'Can view course',63,'view_course'),(190,'Can add organization extension',1,'add_organizationextension'),(191,'Can change organization extension',1,'change_organizationextension'),(192,'Can delete organization extension',1,'delete_organizationextension'),(193,'Can edit course',1,'publisher_edit_course'),(194,'Can edit course run',1,'publisher_edit_course_run'),(195,'Can view course',1,'publisher_view_course'),(196,'Can view the course run',1,'publisher_view_course_run'),(197,'Can add seat',64,'add_seat'),(198,'Can change seat',64,'change_seat'),(199,'Can delete seat',64,'delete_seat'),(200,'Can add historical course run state',65,'add_historicalcourserunstate'),(201,'Can change historical course run state',65,'change_historicalcourserunstate'),(202,'Can delete historical course run state',65,'delete_historicalcourserunstate'),(203,'Can add historical organization user role',66,'add_historicalorganizationuserrole'),(204,'Can change historical organization user role',66,'change_historicalorganizationuserrole'),(205,'Can delete historical organization user role',66,'delete_historicalorganizationuserrole'),(206,'Can add course state',67,'add_coursestate'),(207,'Can change course state',67,'change_coursestate'),(208,'Can delete course state',67,'delete_coursestate'),(209,'Can add course entitlement',68,'add_courseentitlement'),(210,'Can change course entitlement',68,'change_courseentitlement'),(211,'Can delete course entitlement',68,'delete_courseentitlement'),(212,'Can add historical organization extension',69,'add_historicalorganizationextension'),(213,'Can change historical organization extension',69,'change_historicalorganizationextension'),(214,'Can delete historical organization extension',69,'delete_historicalorganizationextension'),(215,'Can add historical seat',70,'add_historicalseat'),(216,'Can change historical seat',70,'change_historicalseat'),(217,'Can delete historical seat',70,'delete_historicalseat'),(218,'Can add user attributes',71,'add_userattributes'),(219,'Can change user attributes',71,'change_userattributes'),(220,'Can delete user attributes',71,'delete_userattributes'),(221,'Can add course user role',72,'add_courseuserrole'),(222,'Can change course user role',72,'change_courseuserrole'),(223,'Can delete course user role',72,'delete_courseuserrole'),(224,'Can add publisher user',24,'add_publisheruser'),(225,'Can change publisher user',24,'change_publisheruser'),(226,'Can delete publisher user',24,'delete_publisheruser'),(227,'Can add comment',74,'add_comments'),(228,'Can change comment',74,'change_comments'),(229,'Can delete comment',74,'delete_comments'),(230,'Can moderate comments',74,'can_moderate');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogs_catalog`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs_catalog`
--

LOCK TABLES `catalogs_catalog` WRITE;
/*!40000 ALTER TABLE `catalogs_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogs_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_currency`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_currency` (
  `code` varchar(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_currency`
--

LOCK TABLES `core_currency` WRITE;
/*!40000 ALTER TABLE `core_currency` DISABLE KEYS */;
INSERT INTO `core_currency` VALUES ('AED','UAE Dirham'),('AFN','Afghani'),('ALL','Lek'),('AMD','Armenian Dram'),('ANG','Netherlands Antillian Guilder'),('AOA','Kwanza'),('ARS','Argentine Peso'),('AUD','Australian Dollar'),('AWG','Aruban Guilder'),('AZN','Azerbaijanian Manat'),('BAM','Convertible Marks'),('BBD','Barbados Dollar'),('BDT','Taka'),('BGN','Bulgarian Lev'),('BHD','Bahraini Dinar'),('BIF','Burundi Franc'),('BMD','Bermudian Dollar'),('BND','Brunei Dollar'),('BOB','Boliviano'),('BOV','Mvdol'),('BRL','Brazilian Real'),('BSD','Bahamian Dollar'),('BTN','Ngultrum'),('BWP','Pula'),('BYR','Belarussian Ruble'),('BZD','Belize Dollar'),('CAD','Canadian Dollar'),('CDF','Congolese Franc'),('CHE','WIR Euro'),('CHF','Swiss Franc'),('CHW','WIR Franc'),('CLF','Unidades de fomento'),('CLP','Chilean Peso'),('CNY','Yuan Renminbi'),('COP','Colombian Peso'),('COU','Unidad de Valor Real'),('CRC','Costa Rican Colon'),('CUP','Cuban Peso'),('CVE','Cape Verde Escudo'),('CYP','Cyprus Pound'),('CZK','Czech Koruna'),('DJF','Djibouti Franc'),('DKK','Danish Krone'),('DOP','Dominican Peso'),('DZD','Algerian Dinar'),('EEK','Kroon'),('EGP','Egyptian Pound'),('ERN','Nakfa'),('ETB','Ethiopian Birr'),('EUR','Euro'),('FJD','Fiji Dollar'),('FKP','Falkland Islands Pound'),('GBP','Pound Sterling'),('GEL','Lari'),('GHS','Ghana Cedi'),('GIP','Gibraltar Pound'),('GMD','Dalasi'),('GNF','Guinea Franc'),('GTQ','Quetzal'),('GYD','Guyana Dollar'),('HKD','Hong Kong Dollar'),('HNL','Lempira'),('HRK','Croatian Kuna'),('HTG','Gourde'),('HUF','Forint'),('IDR','Rupiah'),('ILS','New Israeli Sheqel'),('INR','Indian Rupee'),('IQD','Iraqi Dinar'),('IRR','Iranian Rial'),('ISK','Iceland Krona'),('JMD','Jamaican Dollar'),('JOD','Jordanian Dinar'),('JPY','Yen'),('KES','Kenyan Shilling'),('KGS','Som'),('KHR','Riel'),('KMF','Comoro Franc'),('KPW','North Korean Won'),('KRW','Won'),('KWD','Kuwaiti Dinar'),('KYD','Cayman Islands Dollar'),('KZT','Tenge'),('LAK','Kip'),('LBP','Lebanese Pound'),('LKR','Sri Lanka Rupee'),('LRD','Liberian Dollar'),('LSL','Loti'),('LTL','Lithuanian Litas'),('LVL','Latvian Lats'),('LYD','Libyan Dinar'),('MAD','Moroccan Dirham'),('MDL','Moldovan Leu'),('MGA','Malagasy Ariary'),('MKD','Denar'),('MMK','Kyat'),('MNT','Tugrik'),('MOP','Pataca'),('MRO','Ouguiya'),('MTL','Maltese Lira'),('MUR','Mauritius Rupee'),('MVR','Rufiyaa'),('MWK','Kwacha'),('MXN','Mexican Peso'),('MXV','Mexican Unidad de Inversion (UDI)'),('MYR','Malaysian Ringgit'),('MZN','Metical'),('NAD','Namibia Dollar'),('NGN','Naira'),('NIO','Cordoba Oro'),('NOK','Norwegian Krone'),('NPR','Nepalese Rupee'),('NZD','New Zealand Dollar'),('OMR','Rial Omani'),('PAB','Balboa'),('PEN','Nuevo Sol'),('PGK','Kina'),('PHP','Philippine Peso'),('PKR','Pakistan Rupee'),('PLN','Zloty'),('PYG','Guarani'),('QAR','Qatari Rial'),('RON','New Leu'),('RSD','Serbian Dinar'),('RUB','Russian Ruble'),('RWF','Rwanda Franc'),('SAR','Saudi Riyal'),('SBD','Solomon Islands Dollar'),('SCR','Seychelles Rupee'),('SDG','Sudanese Pound'),('SEK','Swedish Krona'),('SGD','Singapore Dollar'),('SHP','Saint Helena Pound'),('SLL','Leone'),('SOS','Somali Shilling'),('SRD','Surinam Dollar'),('STD','Dobra'),('SVC','El Salvador Colon'),('SYP','Syrian Pound'),('SZL','Lilangeni'),('THB','Baht'),('TJS','Somoni'),('TMM','Manat'),('TND','Tunisian Dinar'),('TOP','Pa\'anga'),('TRY','New Turkish Lira'),('TTD','Trinidad and Tobago Dollar'),('TWD','New Taiwan Dollar'),('TZS','Tanzanian Shilling'),('UAH','Hryvnia'),('UGX','Uganda Shilling'),('USD','US Dollar'),('USN','US Dollar (Next day)'),('USS','US Dollar (Same day)'),('UYI','Uruguay Peso en Unidades Indexadas'),('UYU','Peso Uruguayo'),('UZS','Uzbekistan Sum'),('VEF','Bolivar Fuerte'),('VND','Dong'),('VUV','Vatu'),('WST','Tala'),('YER','Yemeni Rial'),('ZAR','Rand'),('ZMK','Zambian Kwacha'),('ZWD','Zimbabwe Dollar');
/*!40000 ALTER TABLE `core_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_partner`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `short_code` varchar(8) NOT NULL,
  `courses_api_url` varchar(255) DEFAULT NULL,
  `ecommerce_api_url` varchar(255) DEFAULT NULL,
  `organizations_api_url` varchar(255) DEFAULT NULL,
  `programs_api_url` varchar(255) DEFAULT NULL,
  `marketing_site_api_url` varchar(255) DEFAULT NULL,
  `marketing_site_url_root` varchar(255) DEFAULT NULL,
  `oidc_url_root` varchar(255) DEFAULT NULL,
  `oidc_key` varchar(255) DEFAULT NULL,
  `oidc_secret` varchar(255) DEFAULT NULL,
  `marketing_site_api_password` varchar(255) DEFAULT NULL,
  `marketing_site_api_username` varchar(255) DEFAULT NULL,
  `studio_url` varchar(255) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `lms_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_code` (`short_code`),
  UNIQUE KEY `site_id` (`site_id`),
  CONSTRAINT `core_partner_site_id_8e0937ee_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_partner`
--

LOCK TABLES `core_partner` WRITE;
/*!40000 ALTER TABLE `core_partner` DISABLE KEYS */;
INSERT INTO `core_partner` VALUES (1,'2019-02-25 22:09:53.258608','2019-02-25 22:09:53.258658','edX','edx','http://edx.devstack.lms:18000/api/courses/v1/','http://edx.devstack.ecommerce:18130/api/v2/','http://edx.devstack.lms:18000/api/organizations/v0/','','','','http://edx.devstack.lms:18000/oauth2','discovery-key','discovery-secret','','',NULL,1,NULL);
/*!40000 ALTER TABLE `core_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user` (
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
  `full_name` varchar(255) DEFAULT NULL,
  `referral_tracking_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (1,'pbkdf2_sha256$36000$3xgCi6WWrI70$zPdvZIa+rvvGjgCFIKgPDNBIUzv3CSqrZ/PAuUwB0kk=','2019-02-25 22:20:54.214244',1,'edx','','','edx@example.com',1,1,'2019-02-25 22:09:24.618099',NULL,'affiliate_partner'),(2,'',NULL,0,'discovery_worker','','','discovery_worker@example.com',1,1,'2019-02-25 22:14:38.824938',NULL,'affiliate_partner'),(3,'',NULL,0,'ecommerce_worker','','','ecommerce_worker@example.com',1,1,'2019-02-25 22:23:50.071058',NULL,'affiliate_partner');
/*!40000 ALTER TABLE `core_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_groups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_groups_user_id_group_id_c82fcad1_uniq` (`user_id`,`group_id`),
  KEY `core_user_groups_group_id_fe8c697f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `core_user_groups_group_id_fe8c697f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `core_user_groups_user_id_70b4d9b8_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_groups`
--

LOCK TABLES `core_user_groups` WRITE;
/*!40000 ALTER TABLE `core_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_user_permissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_user_permissions_user_id_permission_id_73ea0daa_uniq` (`user_id`,`permission_id`),
  KEY `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` (`permission_id`),
  CONSTRAINT `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `core_user_user_permissions_user_id_085123d3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_user_permissions`
--

LOCK TABLES `core_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_userthrottlerate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_userthrottlerate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_userthrottlerate_user_id_078cf3b3_fk_core_user_id` (`user_id`),
  CONSTRAINT `core_userthrottlerate_user_id_078cf3b3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_userthrottlerate`
--

LOCK TABLES `core_userthrottlerate` WRITE;
/*!40000 ALTER TABLE `core_userthrottlerate` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_userthrottlerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_corporateendorsement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_corporateendorsement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `corporation_name` varchar(128) NOT NULL,
  `statement` longtext,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_metadata_corp_image_id_0c63c347_fk_course_me` (`image_id`),
  CONSTRAINT `course_metadata_corp_image_id_0c63c347_fk_course_me` FOREIGN KEY (`image_id`) REFERENCES `course_metadata_image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_corporateendorsement`
--

LOCK TABLES `course_metadata_corporateendorsement` WRITE;
/*!40000 ALTER TABLE `course_metadata_corporateendorsement` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_corporateendorsement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_corporateendorsement_individual_endorsements`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_corporateendorsement_individual_endorsements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `corporateendorsement_id` int(11) NOT NULL,
  `endorsement_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_corporat_corporateendorsement_id__22a04ee3_uniq` (`corporateendorsement_id`,`endorsement_id`),
  KEY `course_metadata_corp_endorsement_id_52fe984c_fk_course_me` (`endorsement_id`),
  CONSTRAINT `course_metadata_corp_corporateendorsement_67e83919_fk_course_me` FOREIGN KEY (`corporateendorsement_id`) REFERENCES `course_metadata_corporateendorsement` (`id`),
  CONSTRAINT `course_metadata_corp_endorsement_id_52fe984c_fk_course_me` FOREIGN KEY (`endorsement_id`) REFERENCES `course_metadata_endorsement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_corporateendorsement_individual_endorsements`
--

LOCK TABLES `course_metadata_corporateendorsement_individual_endorsements` WRITE;
/*!40000 ALTER TABLE `course_metadata_corporateendorsement_individual_endorsements` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_corporateendorsement_individual_endorsements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_course`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `key` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_description` varchar(350) DEFAULT NULL,
  `full_description` longtext,
  `card_image_url` varchar(200) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `level_type_id` int(11) DEFAULT NULL,
  `partner_id` int(11) NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `canonical_course_run_id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `outcome` longtext,
  `prerequisites_raw` longtext,
  `syllabus_raw` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_course_partner_id_key_55ff3a0a_uniq` (`partner_id`,`key`),
  UNIQUE KEY `course_metadata_course_partner_id_uuid_22cd21cd_uniq` (`partner_id`,`uuid`),
  UNIQUE KEY `canonical_course_run_id` (`canonical_course_run_id`),
  KEY `course_metadata_cour_level_type_id_0d71b1c8_fk_course_me` (`level_type_id`),
  KEY `course_metadata_cour_video_id_d715224d_fk_course_me` (`video_id`),
  KEY `course_metadata_course_slug_1cbf829a` (`slug`),
  CONSTRAINT `course_metadata_cour_canonical_course_run_f98d1f1d_fk_course_me` FOREIGN KEY (`canonical_course_run_id`) REFERENCES `course_metadata_courserun` (`id`),
  CONSTRAINT `course_metadata_cour_level_type_id_0d71b1c8_fk_course_me` FOREIGN KEY (`level_type_id`) REFERENCES `course_metadata_leveltype` (`id`),
  CONSTRAINT `course_metadata_cour_video_id_d715224d_fk_course_me` FOREIGN KEY (`video_id`) REFERENCES `course_metadata_video` (`id`),
  CONSTRAINT `course_metadata_course_partner_id_ea4e09ed_fk_core_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `core_partner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_course`
--

LOCK TABLES `course_metadata_course` WRITE;
/*!40000 ALTER TABLE `course_metadata_course` DISABLE KEYS */;
INSERT INTO `course_metadata_course` VALUES (1,'2019-02-25 22:09:55.352141','2019-02-25 22:22:00.911352','5ee1ae851acd4793a06cd3ca3d5e6e34','edX+DemoX','edX Demonstration Course',NULL,NULL,NULL,'edxdemox',NULL,NULL,1,NULL,1,'',NULL,NULL,NULL),(2,'2019-02-25 22:09:55.387359','2019-02-25 22:22:00.932467','c00dc66f2d97425a81d00c85a86bd047','edX+E2E-101','E2E Test Course',NULL,NULL,NULL,'edxe2e-101',NULL,NULL,1,NULL,2,'',NULL,NULL,NULL),(3,'2019-02-25 22:21:54.306379','2019-02-25 22:22:00.952564','88ae2fc3046d4655b1f24f8075eeaabc','ednx+TP1','Course 1 test program',NULL,NULL,NULL,'ednxtp1',NULL,NULL,1,NULL,3,'',NULL,NULL,NULL),(4,'2019-02-25 22:21:54.327999','2019-02-25 22:22:00.961090','979049afcd9947e9bc799b05d65493e0','ednx+TP2','Course 2 test program',NULL,NULL,NULL,'ednxtp2',NULL,NULL,1,NULL,4,'',NULL,NULL,NULL);
/*!40000 ALTER TABLE `course_metadata_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_course_authoring_organizations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_course_authoring_organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_course_a_course_id_organization_i_2de292cf_uniq` (`course_id`,`organization_id`),
  KEY `course_metadata_cour_organization_id_165c351c_fk_course_me` (`organization_id`),
  CONSTRAINT `course_metadata_cour_course_id_8fdd456f_fk_course_me` FOREIGN KEY (`course_id`) REFERENCES `course_metadata_course` (`id`),
  CONSTRAINT `course_metadata_cour_organization_id_165c351c_fk_course_me` FOREIGN KEY (`organization_id`) REFERENCES `course_metadata_organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_course_authoring_organizations`
--

LOCK TABLES `course_metadata_course_authoring_organizations` WRITE;
/*!40000 ALTER TABLE `course_metadata_course_authoring_organizations` DISABLE KEYS */;
INSERT INTO `course_metadata_course_authoring_organizations` VALUES (1,1,1,1),(2,2,1,1),(3,3,2,1),(4,4,2,1);
/*!40000 ALTER TABLE `course_metadata_course_authoring_organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_course_expected_learning_items`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_course_expected_learning_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `expectedlearningitem_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_course_e_course_id_expectedlearni_418fa820_uniq` (`course_id`,`expectedlearningitem_id`),
  KEY `course_metadata_cour_expectedlearningitem_96f5f788_fk_course_me` (`expectedlearningitem_id`),
  CONSTRAINT `course_metadata_cour_course_id_3289f575_fk_course_me` FOREIGN KEY (`course_id`) REFERENCES `course_metadata_course` (`id`),
  CONSTRAINT `course_metadata_cour_expectedlearningitem_96f5f788_fk_course_me` FOREIGN KEY (`expectedlearningitem_id`) REFERENCES `course_metadata_expectedlearningitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_course_expected_learning_items`
--

LOCK TABLES `course_metadata_course_expected_learning_items` WRITE;
/*!40000 ALTER TABLE `course_metadata_course_expected_learning_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_course_expected_learning_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_course_prerequisites`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_course_prerequisites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `prerequisite_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_course_p_course_id_prerequisite_i_837ee02b_uniq` (`course_id`,`prerequisite_id`),
  KEY `course_metadata_cour_prerequisite_id_8ca175ee_fk_course_me` (`prerequisite_id`),
  CONSTRAINT `course_metadata_cour_course_id_3009bc5f_fk_course_me` FOREIGN KEY (`course_id`) REFERENCES `course_metadata_course` (`id`),
  CONSTRAINT `course_metadata_cour_prerequisite_id_8ca175ee_fk_course_me` FOREIGN KEY (`prerequisite_id`) REFERENCES `course_metadata_prerequisite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_course_prerequisites`
--

LOCK TABLES `course_metadata_course_prerequisites` WRITE;
/*!40000 ALTER TABLE `course_metadata_course_prerequisites` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_course_prerequisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_course_sponsoring_organizations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_course_sponsoring_organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_course_s_course_id_organization_i_bb4e0747_uniq` (`course_id`,`organization_id`),
  KEY `course_metadata_cour_organization_id_0448ba21_fk_course_me` (`organization_id`),
  CONSTRAINT `course_metadata_cour_course_id_4d7e523e_fk_course_me` FOREIGN KEY (`course_id`) REFERENCES `course_metadata_course` (`id`),
  CONSTRAINT `course_metadata_cour_organization_id_0448ba21_fk_course_me` FOREIGN KEY (`organization_id`) REFERENCES `course_metadata_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_course_sponsoring_organizations`
--

LOCK TABLES `course_metadata_course_sponsoring_organizations` WRITE;
/*!40000 ALTER TABLE `course_metadata_course_sponsoring_organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_course_sponsoring_organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_course_subjects`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_course_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_course_s_course_id_subject_id_20100461_uniq` (`course_id`,`subject_id`),
  KEY `course_metadata_cour_subject_id_acf0b652_fk_course_me` (`subject_id`),
  CONSTRAINT `course_metadata_cour_course_id_ac231079_fk_course_me` FOREIGN KEY (`course_id`) REFERENCES `course_metadata_course` (`id`),
  CONSTRAINT `course_metadata_cour_subject_id_acf0b652_fk_course_me` FOREIGN KEY (`subject_id`) REFERENCES `course_metadata_subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_course_subjects`
--

LOCK TABLES `course_metadata_course_subjects` WRITE;
/*!40000 ALTER TABLE `course_metadata_course_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_course_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_courseentitlement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_courseentitlement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `sku` varchar(128) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `currency_id` varchar(6) NOT NULL,
  `mode_id` int(11) NOT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_courseen_course_id_mode_id_a57ac460_uniq` (`course_id`,`mode_id`),
  KEY `course_metadata_cour_currency_id_464a49fa_fk_core_curr` (`currency_id`),
  KEY `course_metadata_cour_mode_id_bbb4c50c_fk_course_me` (`mode_id`),
  KEY `course_metadata_cour_partner_id_c694a44d_fk_core_part` (`partner_id`),
  CONSTRAINT `course_metadata_cour_course_id_2f22a662_fk_course_me` FOREIGN KEY (`course_id`) REFERENCES `course_metadata_course` (`id`),
  CONSTRAINT `course_metadata_cour_currency_id_464a49fa_fk_core_curr` FOREIGN KEY (`currency_id`) REFERENCES `core_currency` (`code`),
  CONSTRAINT `course_metadata_cour_mode_id_bbb4c50c_fk_course_me` FOREIGN KEY (`mode_id`) REFERENCES `course_metadata_seattype` (`id`),
  CONSTRAINT `course_metadata_cour_partner_id_c694a44d_fk_core_part` FOREIGN KEY (`partner_id`) REFERENCES `core_partner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_courseentitlement`
--

LOCK TABLES `course_metadata_courseentitlement` WRITE;
/*!40000 ALTER TABLE `course_metadata_courseentitlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_courseentitlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_courserun`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_courserun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `key` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `title_override` varchar(255) DEFAULT NULL,
  `start` datetime(6) DEFAULT NULL,
  `end` datetime(6) DEFAULT NULL,
  `enrollment_start` datetime(6) DEFAULT NULL,
  `enrollment_end` datetime(6) DEFAULT NULL,
  `announcement` datetime(6) DEFAULT NULL,
  `short_description_override` varchar(350) DEFAULT NULL,
  `full_description_override` longtext,
  `min_effort` smallint(5) unsigned DEFAULT NULL,
  `max_effort` smallint(5) unsigned DEFAULT NULL,
  `weeks_to_complete` smallint(5) unsigned DEFAULT NULL,
  `pacing_type` varchar(255) DEFAULT NULL,
  `card_image_url` varchar(200) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL,
  `mobile_available` tinyint(1) NOT NULL,
  `course_id` int(11) NOT NULL,
  `language_id` varchar(50) DEFAULT NULL,
  `syllabus_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `course_overridden` tinyint(1) NOT NULL,
  `reporting_type` varchar(255) NOT NULL,
  `eligible_for_financial_aid` tinyint(1) NOT NULL,
  `learner_testimonials` longtext,
  `license` varchar(255) NOT NULL,
  `outcome_override` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `course_metadata_cour_course_id_385c407d_fk_course_me` (`course_id`),
  KEY `course_metadata_cour_language_id_ecbd3631_fk_ietf_lang` (`language_id`),
  KEY `course_metadata_cour_syllabus_id_3e44ef98_fk_course_me` (`syllabus_id`),
  KEY `course_metadata_cour_video_id_30310bee_fk_course_me` (`video_id`),
  KEY `course_metadata_courserun_status_d5f98f3c` (`status`),
  KEY `course_metadata_courserun_end_5ba7c110` (`end`),
  KEY `course_metadata_courserun_enrollment_end_c606cdd8` (`enrollment_end`),
  KEY `course_metadata_courserun_pacing_type_7df728cc` (`pacing_type`),
  KEY `course_metadata_courserun_slug_ed5ee7d7` (`slug`),
  KEY `course_metadata_courserun_start_1a586933` (`start`),
  KEY `course_metadata_courserun_license_8ebbe8fe` (`license`),
  CONSTRAINT `course_metadata_cour_course_id_385c407d_fk_course_me` FOREIGN KEY (`course_id`) REFERENCES `course_metadata_course` (`id`),
  CONSTRAINT `course_metadata_cour_language_id_ecbd3631_fk_ietf_lang` FOREIGN KEY (`language_id`) REFERENCES `ietf_language_tags_languagetag` (`code`),
  CONSTRAINT `course_metadata_cour_syllabus_id_3e44ef98_fk_course_me` FOREIGN KEY (`syllabus_id`) REFERENCES `course_metadata_syllabusitem` (`id`),
  CONSTRAINT `course_metadata_cour_video_id_30310bee_fk_course_me` FOREIGN KEY (`video_id`) REFERENCES `course_metadata_video` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_courserun`
--

LOCK TABLES `course_metadata_courserun` WRITE;
/*!40000 ALTER TABLE `course_metadata_courserun` DISABLE KEYS */;
INSERT INTO `course_metadata_courserun` VALUES (1,'2019-02-25 22:09:55.365128','2019-02-25 22:22:00.906820','33fbf43701d949c79a4b6bc1c23e5d61','course-v1:edX+DemoX+Demo_Course','published','edX Demonstration Course','2013-02-05 05:00:00.000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'instructor_paced','http://edx.devstack.lms:18000/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',NULL,0,0,1,NULL,NULL,NULL,0,'mooc',1,NULL,'',NULL),(2,'2019-02-25 22:09:55.416307','2019-02-25 22:22:00.918226','8ad78d7655ba4851ade44ebd63900510','course-v1:edX+E2E-101+course','published','E2E Test Course','2016-01-01 00:00:00.000000','2018-12-31 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'instructor_paced','http://edx.devstack.lms:18000/static/studio/images/pencils.jpg',NULL,0,0,2,NULL,NULL,NULL,0,'mooc',1,NULL,'',NULL),(3,'2019-02-25 22:21:54.316331','2019-02-25 22:22:00.948740','6b8c24daf9fe47a486e6d147430ae74b','course-v1:ednx+TP1+2019_TP','published','Course 1 test program','2030-01-01 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'instructor_paced','http://edx.devstack.lms:18000/asset-v1:ednx+TP1+2019_TP+type@asset+block@images_course_image.jpg',NULL,0,0,3,NULL,NULL,NULL,0,'mooc',1,NULL,'',NULL),(4,'2019-02-25 22:21:54.351982','2019-02-25 22:22:00.958058','d5cb4ea2c1964f83b9a00e6da566eba8','course-v1:ednx+TP2+2019_TP','published','Course 2 test program','2030-01-01 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'instructor_paced','http://edx.devstack.lms:18000/asset-v1:ednx+TP2+2019_TP+type@asset+block@images_course_image.jpg',NULL,0,0,4,NULL,NULL,NULL,0,'mooc',1,NULL,'',NULL);
/*!40000 ALTER TABLE `course_metadata_courserun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_courserun_staff`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_courserun_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courserun_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_courseru_courserun_id_person_id_a42d576d_uniq` (`courserun_id`,`person_id`),
  KEY `course_metadata_cour_person_id_bfccf53f_fk_course_me` (`person_id`),
  CONSTRAINT `course_metadata_cour_courserun_id_f0ca16de_fk_course_me` FOREIGN KEY (`courserun_id`) REFERENCES `course_metadata_courserun` (`id`),
  CONSTRAINT `course_metadata_cour_person_id_bfccf53f_fk_course_me` FOREIGN KEY (`person_id`) REFERENCES `course_metadata_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_courserun_staff`
--

LOCK TABLES `course_metadata_courserun_staff` WRITE;
/*!40000 ALTER TABLE `course_metadata_courserun_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_courserun_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_courserun_transcript_languages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_courserun_transcript_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courserun_id` int(11) NOT NULL,
  `languagetag_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_courseru_courserun_id_languagetag_b60ea34d_uniq` (`courserun_id`,`languagetag_id`),
  KEY `course_metadata_cour_languagetag_id_e7d4f167_fk_ietf_lang` (`languagetag_id`),
  CONSTRAINT `course_metadata_cour_courserun_id_90bcb7b7_fk_course_me` FOREIGN KEY (`courserun_id`) REFERENCES `course_metadata_courserun` (`id`),
  CONSTRAINT `course_metadata_cour_languagetag_id_e7d4f167_fk_ietf_lang` FOREIGN KEY (`languagetag_id`) REFERENCES `ietf_language_tags_languagetag` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_courserun_transcript_languages`
--

LOCK TABLES `course_metadata_courserun_transcript_languages` WRITE;
/*!40000 ALTER TABLE `course_metadata_courserun_transcript_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_courserun_transcript_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_courserun_video_translation_languages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_courserun_video_translation_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courserun_id` int(11) NOT NULL,
  `languagetag_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_courseru_courserun_id_languagetag_13850316_uniq` (`courserun_id`,`languagetag_id`),
  KEY `course_metadata_cour_languagetag_id_89f04574_fk_ietf_lang` (`languagetag_id`),
  CONSTRAINT `course_metadata_cour_courserun_id_162f62ff_fk_course_me` FOREIGN KEY (`courserun_id`) REFERENCES `course_metadata_courserun` (`id`),
  CONSTRAINT `course_metadata_cour_languagetag_id_89f04574_fk_ietf_lang` FOREIGN KEY (`languagetag_id`) REFERENCES `ietf_language_tags_languagetag` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_courserun_video_translation_languages`
--

LOCK TABLES `course_metadata_courserun_video_translation_languages` WRITE;
/*!40000 ALTER TABLE `course_metadata_courserun_video_translation_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_courserun_video_translation_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_courserunsocialnetwork`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_courserunsocialnetwork` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `type` varchar(15) NOT NULL,
  `value` varchar(500) NOT NULL,
  `course_run_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_courseru_course_run_id_type_15fa0d05_uniq` (`course_run_id`,`type`),
  KEY `course_metadata_courserunsocialnetwork_type_594bbe96` (`type`),
  CONSTRAINT `course_metadata_cour_course_run_id_7fc9c21e_fk_course_me` FOREIGN KEY (`course_run_id`) REFERENCES `course_metadata_courserun` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_courserunsocialnetwork`
--

LOCK TABLES `course_metadata_courserunsocialnetwork` WRITE;
/*!40000 ALTER TABLE `course_metadata_courserunsocialnetwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_courserunsocialnetwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_dataloaderconfig`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_dataloaderconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `max_workers` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_dataloaderconfig`
--

LOCK TABLES `course_metadata_dataloaderconfig` WRITE;
/*!40000 ALTER TABLE `course_metadata_dataloaderconfig` DISABLE KEYS */;
INSERT INTO `course_metadata_dataloaderconfig` VALUES (1,7);
/*!40000 ALTER TABLE `course_metadata_dataloaderconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_endorsement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_endorsement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `quote` longtext NOT NULL,
  `endorser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_metadata_endo_endorser_id_b4b1d96b_fk_course_me` (`endorser_id`),
  CONSTRAINT `course_metadata_endo_endorser_id_b4b1d96b_fk_course_me` FOREIGN KEY (`endorser_id`) REFERENCES `course_metadata_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_endorsement`
--

LOCK TABLES `course_metadata_endorsement` WRITE;
/*!40000 ALTER TABLE `course_metadata_endorsement` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_endorsement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_expectedlearningitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_expectedlearningitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_expectedlearningitem`
--

LOCK TABLES `course_metadata_expectedlearningitem` WRITE;
/*!40000 ALTER TABLE `course_metadata_expectedlearningitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_expectedlearningitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_faq`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `question` longtext NOT NULL,
  `answer` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_faq`
--

LOCK TABLES `course_metadata_faq` WRITE;
/*!40000 ALTER TABLE `course_metadata_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_image`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `src` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `src` (`src`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_image`
--

LOCK TABLES `course_metadata_image` WRITE;
/*!40000 ALTER TABLE `course_metadata_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_joboutlookitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_joboutlookitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_joboutlookitem`
--

LOCK TABLES `course_metadata_joboutlookitem` WRITE;
/*!40000 ALTER TABLE `course_metadata_joboutlookitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_joboutlookitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_leveltype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_leveltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_leveltype`
--

LOCK TABLES `course_metadata_leveltype` WRITE;
/*!40000 ALTER TABLE `course_metadata_leveltype` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_leveltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_organization`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `key` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `marketing_url_path` varchar(255) DEFAULT NULL,
  `description` longtext,
  `homepage_url` varchar(255) DEFAULT NULL,
  `logo_image_url` varchar(200) DEFAULT NULL,
  `banner_image_url` varchar(200) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `certificate_logo_image_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_organization_partner_id_key_ea4cce65_uniq` (`partner_id`,`key`),
  UNIQUE KEY `course_metadata_organization_partner_id_uuid_70194856_uniq` (`partner_id`,`uuid`),
  CONSTRAINT `course_metadata_orga_partner_id_1fecd74b_fk_core_part` FOREIGN KEY (`partner_id`) REFERENCES `core_partner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_organization`
--

LOCK TABLES `course_metadata_organization` WRITE;
/*!40000 ALTER TABLE `course_metadata_organization` DISABLE KEYS */;
INSERT INTO `course_metadata_organization` VALUES (1,'2019-02-25 22:09:55.358146','2019-02-25 22:09:55.358217','c914378ccaae4604b30988c25ad35c90','edX','',NULL,NULL,NULL,NULL,NULL,1,NULL),(2,'2019-02-25 22:21:54.177709','2019-02-25 22:22:00.859785','28de1f896fd048bcb7dd29fbab7cac1a','ednx','ednx',NULL,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `course_metadata_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_person`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `given_name` varchar(255) NOT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `bio` longtext,
  `profile_image_url` varchar(200) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `profile_url` varchar(200) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `salutation` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_person_partner_id_uuid_3075ec7a_uniq` (`partner_id`,`uuid`),
  KEY `course_metadata_person_slug_e3809b38` (`slug`),
  CONSTRAINT `course_metadata_person_partner_id_08eff1bf_fk_core_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `core_partner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_person`
--

LOCK TABLES `course_metadata_person` WRITE;
/*!40000 ALTER TABLE `course_metadata_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_personsocialnetwork`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_personsocialnetwork` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `type` varchar(15) NOT NULL,
  `value` varchar(500) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_personsocialnetwork_person_id_type_a8675b81_uniq` (`person_id`,`type`),
  KEY `course_metadata_personsocialnetwork_type_444d35ec` (`type`),
  CONSTRAINT `course_metadata_pers_person_id_98134540_fk_course_me` FOREIGN KEY (`person_id`) REFERENCES `course_metadata_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_personsocialnetwork`
--

LOCK TABLES `course_metadata_personsocialnetwork` WRITE;
/*!40000 ALTER TABLE `course_metadata_personsocialnetwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_personsocialnetwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_personwork`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_personwork` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `value` varchar(255) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_metadata_pers_person_id_90e67b80_fk_course_me` (`person_id`),
  CONSTRAINT `course_metadata_pers_person_id_90e67b80_fk_course_me` FOREIGN KEY (`person_id`) REFERENCES `course_metadata_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_personwork`
--

LOCK TABLES `course_metadata_personwork` WRITE;
/*!40000 ALTER TABLE `course_metadata_personwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_personwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_position`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `organization_override` varchar(255) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`),
  KEY `course_metadata_posi_organization_id_e80f0d99_fk_course_me` (`organization_id`),
  CONSTRAINT `course_metadata_posi_organization_id_e80f0d99_fk_course_me` FOREIGN KEY (`organization_id`) REFERENCES `course_metadata_organization` (`id`),
  CONSTRAINT `course_metadata_posi_person_id_c6f50db4_fk_course_me` FOREIGN KEY (`person_id`) REFERENCES `course_metadata_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_position`
--

LOCK TABLES `course_metadata_position` WRITE;
/*!40000 ALTER TABLE `course_metadata_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_prerequisite`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_prerequisite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_prerequisite`
--

LOCK TABLES `course_metadata_prerequisite` WRITE;
/*!40000 ALTER TABLE `course_metadata_prerequisite` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_program`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `status` varchar(24) NOT NULL,
  `marketing_slug` varchar(255) NOT NULL,
  `order_courses_by_start_date` tinyint(1) NOT NULL,
  `overview` longtext,
  `weeks_to_complete` smallint(5) unsigned DEFAULT NULL,
  `min_hours_effort_per_week` smallint(5) unsigned DEFAULT NULL,
  `max_hours_effort_per_week` smallint(5) unsigned DEFAULT NULL,
  `banner_image` varchar(100) DEFAULT NULL,
  `banner_image_url` varchar(200) DEFAULT NULL,
  `card_image_url` varchar(200) DEFAULT NULL,
  `credit_redemption_overview` longtext,
  `partner_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `one_click_purchase_enabled` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `total_hours_of_effort` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `course_metadata_program_marketing_slug_7423281d_uniq` (`marketing_slug`),
  KEY `course_metadata_program_partner_id_7b5e5949_fk_core_partner_id` (`partner_id`),
  KEY `course_metadata_prog_type_id_2fc71f96_fk_course_me` (`type_id`),
  KEY `course_metadata_prog_video_id_187f9769_fk_course_me` (`video_id`),
  KEY `course_metadata_program_status_6d3de7bd` (`status`),
  KEY `course_metadata_program_hidden_376b469c` (`hidden`),
  CONSTRAINT `course_metadata_prog_type_id_2fc71f96_fk_course_me` FOREIGN KEY (`type_id`) REFERENCES `course_metadata_programtype` (`id`),
  CONSTRAINT `course_metadata_prog_video_id_187f9769_fk_course_me` FOREIGN KEY (`video_id`) REFERENCES `course_metadata_video` (`id`),
  CONSTRAINT `course_metadata_program_partner_id_7b5e5949_fk_core_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `core_partner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_program`
--

LOCK TABLES `course_metadata_program` WRITE;
/*!40000 ALTER TABLE `course_metadata_program` DISABLE KEYS */;
INSERT INTO `course_metadata_program` VALUES (1,'2019-02-25 22:09:59.895416','2019-02-25 22:09:59.895455','d47dfc96deaf47fe90dd575e56c27161','edX Demonstration Program','','active','demo-program',1,'A demo program for testing.',NULL,1,4,'',NULL,'http://edx.devstack.lms:18000/asset-v1:edX+DemoX+Demo_Course+type@asset+block@images_course_image.jpg',NULL,1,2,NULL,1,0,4),(2,'2019-02-25 22:22:56.941351','2019-02-25 22:22:59.353426','eaa77f57226c484a86a4a0ec7d663496','Program test ednx','','active','programs-test-ednx',1,'',NULL,NULL,NULL,'media/programs/banner_images/eaa77f57-226c-484a-86a4-a0ec7d663496-db0e39b31bbe.png',NULL,NULL,'',1,3,NULL,1,0,NULL);
/*!40000 ALTER TABLE `course_metadata_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_program_authoring_organizations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_program_authoring_organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_program__program_id_organization__c465ae79_uniq` (`program_id`,`organization_id`),
  KEY `course_metadata_prog_organization_id_f6eeae17_fk_course_me` (`organization_id`),
  CONSTRAINT `course_metadata_prog_organization_id_f6eeae17_fk_course_me` FOREIGN KEY (`organization_id`) REFERENCES `course_metadata_organization` (`id`),
  CONSTRAINT `course_metadata_prog_program_id_2c21b5af_fk_course_me` FOREIGN KEY (`program_id`) REFERENCES `course_metadata_program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_program_authoring_organizations`
--

LOCK TABLES `course_metadata_program_authoring_organizations` WRITE;
/*!40000 ALTER TABLE `course_metadata_program_authoring_organizations` DISABLE KEYS */;
INSERT INTO `course_metadata_program_authoring_organizations` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `course_metadata_program_authoring_organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_program_corporate_endorsements`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_program_corporate_endorsements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `corporateendorsement_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_program__program_id_corporateendo_8fed7617_uniq` (`program_id`,`corporateendorsement_id`),
  KEY `course_metadata_prog_corporateendorsement_3b2aca1e_fk_course_me` (`corporateendorsement_id`),
  CONSTRAINT `course_metadata_prog_corporateendorsement_3b2aca1e_fk_course_me` FOREIGN KEY (`corporateendorsement_id`) REFERENCES `course_metadata_corporateendorsement` (`id`),
  CONSTRAINT `course_metadata_prog_program_id_fe0a1956_fk_course_me` FOREIGN KEY (`program_id`) REFERENCES `course_metadata_program` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_program_corporate_endorsements`
--

LOCK TABLES `course_metadata_program_corporate_endorsements` WRITE;
/*!40000 ALTER TABLE `course_metadata_program_corporate_endorsements` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_program_corporate_endorsements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_program_courses`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_program_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_program__program_id_course_id_cd88ef2d_uniq` (`program_id`,`course_id`),
  KEY `course_metadata_prog_course_id_64957041_fk_course_me` (`course_id`),
  CONSTRAINT `course_metadata_prog_course_id_64957041_fk_course_me` FOREIGN KEY (`course_id`) REFERENCES `course_metadata_course` (`id`),
  CONSTRAINT `course_metadata_prog_program_id_07e785b4_fk_course_me` FOREIGN KEY (`program_id`) REFERENCES `course_metadata_program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_program_courses`
--

LOCK TABLES `course_metadata_program_courses` WRITE;
/*!40000 ALTER TABLE `course_metadata_program_courses` DISABLE KEYS */;
INSERT INTO `course_metadata_program_courses` VALUES (1,1,1,1),(2,2,3,1),(3,2,4,2);
/*!40000 ALTER TABLE `course_metadata_program_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_program_credit_backing_organizations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_program_credit_backing_organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_program__program_id_organization__63744dc6_uniq` (`program_id`,`organization_id`),
  KEY `course_metadata_prog_organization_id_406b2580_fk_course_me` (`organization_id`),
  CONSTRAINT `course_metadata_prog_organization_id_406b2580_fk_course_me` FOREIGN KEY (`organization_id`) REFERENCES `course_metadata_organization` (`id`),
  CONSTRAINT `course_metadata_prog_program_id_dc3de1d3_fk_course_me` FOREIGN KEY (`program_id`) REFERENCES `course_metadata_program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_program_credit_backing_organizations`
--

LOCK TABLES `course_metadata_program_credit_backing_organizations` WRITE;
/*!40000 ALTER TABLE `course_metadata_program_credit_backing_organizations` DISABLE KEYS */;
INSERT INTO `course_metadata_program_credit_backing_organizations` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `course_metadata_program_credit_backing_organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_program_excluded_course_runs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_program_excluded_course_runs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `courserun_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_program__program_id_courserun_id_79fe187f_uniq` (`program_id`,`courserun_id`),
  KEY `course_metadata_prog_courserun_id_304c93a9_fk_course_me` (`courserun_id`),
  CONSTRAINT `course_metadata_prog_courserun_id_304c93a9_fk_course_me` FOREIGN KEY (`courserun_id`) REFERENCES `course_metadata_courserun` (`id`),
  CONSTRAINT `course_metadata_prog_program_id_2ac0ea55_fk_course_me` FOREIGN KEY (`program_id`) REFERENCES `course_metadata_program` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_program_excluded_course_runs`
--

LOCK TABLES `course_metadata_program_excluded_course_runs` WRITE;
/*!40000 ALTER TABLE `course_metadata_program_excluded_course_runs` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_program_excluded_course_runs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_program_expected_learning_items`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_program_expected_learning_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `expectedlearningitem_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_program__program_id_expectedlearn_dc903876_uniq` (`program_id`,`expectedlearningitem_id`),
  KEY `course_metadata_prog_expectedlearningitem_dfeaee3e_fk_course_me` (`expectedlearningitem_id`),
  CONSTRAINT `course_metadata_prog_expectedlearningitem_dfeaee3e_fk_course_me` FOREIGN KEY (`expectedlearningitem_id`) REFERENCES `course_metadata_expectedlearningitem` (`id`),
  CONSTRAINT `course_metadata_prog_program_id_d0420cd7_fk_course_me` FOREIGN KEY (`program_id`) REFERENCES `course_metadata_program` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_program_expected_learning_items`
--

LOCK TABLES `course_metadata_program_expected_learning_items` WRITE;
/*!40000 ALTER TABLE `course_metadata_program_expected_learning_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_program_expected_learning_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_program_faq`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_program_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `faq_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_program_faq_program_id_faq_id_d9959e17_uniq` (`program_id`,`faq_id`),
  KEY `course_metadata_prog_faq_id_2f2e0c0b_fk_course_me` (`faq_id`),
  CONSTRAINT `course_metadata_prog_faq_id_2f2e0c0b_fk_course_me` FOREIGN KEY (`faq_id`) REFERENCES `course_metadata_faq` (`id`),
  CONSTRAINT `course_metadata_prog_program_id_fdfc34e7_fk_course_me` FOREIGN KEY (`program_id`) REFERENCES `course_metadata_program` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_program_faq`
--

LOCK TABLES `course_metadata_program_faq` WRITE;
/*!40000 ALTER TABLE `course_metadata_program_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_program_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_program_individual_endorsements`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_program_individual_endorsements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `endorsement_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_program__program_id_endorsement_i_13000253_uniq` (`program_id`,`endorsement_id`),
  KEY `course_metadata_prog_endorsement_id_b2b94fc1_fk_course_me` (`endorsement_id`),
  CONSTRAINT `course_metadata_prog_endorsement_id_b2b94fc1_fk_course_me` FOREIGN KEY (`endorsement_id`) REFERENCES `course_metadata_endorsement` (`id`),
  CONSTRAINT `course_metadata_prog_program_id_5df9610a_fk_course_me` FOREIGN KEY (`program_id`) REFERENCES `course_metadata_program` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_program_individual_endorsements`
--

LOCK TABLES `course_metadata_program_individual_endorsements` WRITE;
/*!40000 ALTER TABLE `course_metadata_program_individual_endorsements` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_program_individual_endorsements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_program_instructor_ordering`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_program_instructor_ordering` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_program__program_id_person_id_63e79136_uniq` (`program_id`,`person_id`),
  KEY `course_metadata_prog_person_id_7023a064_fk_course_me` (`person_id`),
  CONSTRAINT `course_metadata_prog_person_id_7023a064_fk_course_me` FOREIGN KEY (`person_id`) REFERENCES `course_metadata_person` (`id`),
  CONSTRAINT `course_metadata_prog_program_id_0b36c0da_fk_course_me` FOREIGN KEY (`program_id`) REFERENCES `course_metadata_program` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_program_instructor_ordering`
--

LOCK TABLES `course_metadata_program_instructor_ordering` WRITE;
/*!40000 ALTER TABLE `course_metadata_program_instructor_ordering` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_program_instructor_ordering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_program_job_outlook_items`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_program_job_outlook_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `joboutlookitem_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_program__program_id_joboutlookite_81303939_uniq` (`program_id`,`joboutlookitem_id`),
  KEY `course_metadata_prog_joboutlookitem_id_9e7b5711_fk_course_me` (`joboutlookitem_id`),
  CONSTRAINT `course_metadata_prog_joboutlookitem_id_9e7b5711_fk_course_me` FOREIGN KEY (`joboutlookitem_id`) REFERENCES `course_metadata_joboutlookitem` (`id`),
  CONSTRAINT `course_metadata_prog_program_id_c3e1349f_fk_course_me` FOREIGN KEY (`program_id`) REFERENCES `course_metadata_program` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_program_job_outlook_items`
--

LOCK TABLES `course_metadata_program_job_outlook_items` WRITE;
/*!40000 ALTER TABLE `course_metadata_program_job_outlook_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_program_job_outlook_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_programtype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_programtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  `logo_image` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `course_metadata_programtype_slug_7ece80b1_uniq` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_programtype`
--

LOCK TABLES `course_metadata_programtype` WRITE;
/*!40000 ALTER TABLE `course_metadata_programtype` DISABLE KEYS */;
INSERT INTO `course_metadata_programtype` VALUES (1,'2019-02-25 22:08:43.293392','2019-02-25 22:08:43.299152','XSeries','','xseries'),(2,'2019-02-25 22:08:43.303895','2019-02-25 22:08:43.309159','MicroMasters','','micromasters'),(3,'2019-02-25 22:08:43.475203','2019-02-25 22:08:43.481699','Professional Certificate','','professional-certificate');
/*!40000 ALTER TABLE `course_metadata_programtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_programtype_applicable_seat_types`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_programtype_applicable_seat_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `programtype_id` int(11) NOT NULL,
  `seattype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_programt_programtype_id_seattype__8a96e1af_uniq` (`programtype_id`,`seattype_id`),
  KEY `course_metadata_prog_seattype_id_75ae38e7_fk_course_me` (`seattype_id`),
  CONSTRAINT `course_metadata_prog_programtype_id_d29d9865_fk_course_me` FOREIGN KEY (`programtype_id`) REFERENCES `course_metadata_programtype` (`id`),
  CONSTRAINT `course_metadata_prog_seattype_id_75ae38e7_fk_course_me` FOREIGN KEY (`seattype_id`) REFERENCES `course_metadata_seattype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_programtype_applicable_seat_types`
--

LOCK TABLES `course_metadata_programtype_applicable_seat_types` WRITE;
/*!40000 ALTER TABLE `course_metadata_programtype_applicable_seat_types` DISABLE KEYS */;
INSERT INTO `course_metadata_programtype_applicable_seat_types` VALUES (1,1,2),(2,1,3),(3,1,4),(4,2,2),(5,2,3),(6,2,4),(7,3,2),(8,3,3),(9,3,4);
/*!40000 ALTER TABLE `course_metadata_programtype_applicable_seat_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_seat`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_seat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `type` varchar(63) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `upgrade_deadline` datetime(6) DEFAULT NULL,
  `credit_provider` varchar(255) DEFAULT NULL,
  `credit_hours` int(11) DEFAULT NULL,
  `course_run_id` int(11) NOT NULL,
  `currency_id` varchar(6) NOT NULL,
  `sku` varchar(128) DEFAULT NULL,
  `bulk_sku` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_seat_course_run_id_type_curre_5e769f84_uniq` (`course_run_id`,`type`,`currency_id`,`credit_provider`),
  KEY `course_metadata_seat_currency_id_2b9198b5_fk_core_currency_code` (`currency_id`),
  CONSTRAINT `course_metadata_seat_course_run_id_ff51e99e_fk_course_me` FOREIGN KEY (`course_run_id`) REFERENCES `course_metadata_courserun` (`id`),
  CONSTRAINT `course_metadata_seat_currency_id_2b9198b5_fk_core_currency_code` FOREIGN KEY (`currency_id`) REFERENCES `core_currency` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_seat`
--

LOCK TABLES `course_metadata_seat` WRITE;
/*!40000 ALTER TABLE `course_metadata_seat` DISABLE KEYS */;
INSERT INTO `course_metadata_seat` VALUES (1,'2019-02-25 22:09:56.208574','2019-02-25 22:22:01.591493','verified',149.00,'2020-02-25 22:08:02.006822',NULL,NULL,1,'PEN','8CF08E5','A5B6DBE'),(2,'2019-02-25 22:09:56.216185','2019-02-25 22:22:01.543807','audit',0.00,NULL,NULL,NULL,1,'PEN','68EFFFF',NULL),(3,'2019-02-25 22:21:55.049068','2019-02-25 22:22:01.578655','professional',10.00,NULL,NULL,NULL,3,'PEN','83046D1','F2F56CB'),(4,'2019-02-25 22:21:55.058073','2019-02-25 22:22:01.560722','professional',10.00,NULL,NULL,NULL,4,'PEN','73FC5C4','FFF8884');
/*!40000 ALTER TABLE `course_metadata_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_seattype`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_seattype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(64) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `course_metadata_seattype_slug_6f5f00a6` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_seattype`
--

LOCK TABLES `course_metadata_seattype` WRITE;
/*!40000 ALTER TABLE `course_metadata_seattype` DISABLE KEYS */;
INSERT INTO `course_metadata_seattype` VALUES (1,'2019-02-25 22:08:22.764899','2019-02-25 22:08:22.764938','Audit','audit'),(2,'2019-02-25 22:08:22.769579','2019-02-25 22:08:22.769692','Credit','credit'),(3,'2019-02-25 22:08:22.773182','2019-02-25 22:08:22.773226','Professional','professional'),(4,'2019-02-25 22:08:22.776432','2019-02-25 22:08:22.776506','Verified','verified');
/*!40000 ALTER TABLE `course_metadata_seattype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_subject`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `banner_image_url` varchar(200) DEFAULT NULL,
  `card_image_url` varchar(200) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `partner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_subject_partner_id_slug_458f3dca_uniq` (`partner_id`,`slug`),
  UNIQUE KEY `course_metadata_subject_partner_id_uuid_85ff9e13_uniq` (`partner_id`,`uuid`),
  KEY `course_metadata_subject_slug_448e47b5` (`slug`),
  KEY `course_metadata_subject_partner_id_7764c72d` (`partner_id`),
  CONSTRAINT `course_metadata_subject_partner_id_7764c72d_fk_core_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `core_partner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_subject`
--

LOCK TABLES `course_metadata_subject` WRITE;
/*!40000 ALTER TABLE `course_metadata_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_subjecttranslation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_subjecttranslation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_code` varchar(15) NOT NULL,
  `master_id` int(11) DEFAULT NULL,
  `description` longtext,
  `name` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_subjectt_language_code_master_id_0ec122e5_uniq` (`language_code`,`master_id`),
  KEY `course_metadata_subj_master_id_7071ad59_fk_course_me` (`master_id`),
  KEY `course_metadata_subjecttranslation_language_code_7c1c7e14` (`language_code`),
  CONSTRAINT `course_metadata_subj_master_id_7071ad59_fk_course_me` FOREIGN KEY (`master_id`) REFERENCES `course_metadata_subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_subjecttranslation`
--

LOCK TABLES `course_metadata_subjecttranslation` WRITE;
/*!40000 ALTER TABLE `course_metadata_subjecttranslation` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_subjecttranslation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_syllabusitem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_syllabusitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `value` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_metadata_syll_parent_id_301ad50c_fk_course_me` (`parent_id`),
  CONSTRAINT `course_metadata_syll_parent_id_301ad50c_fk_course_me` FOREIGN KEY (`parent_id`) REFERENCES `course_metadata_syllabusitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_syllabusitem`
--

LOCK TABLES `course_metadata_syllabusitem` WRITE;
/*!40000 ALTER TABLE `course_metadata_syllabusitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_syllabusitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_topic`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `banner_image_url` varchar(200) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `partner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_topic_partner_id_uuid_a32c57bc_uniq` (`partner_id`,`uuid`),
  UNIQUE KEY `course_metadata_topic_partner_id_slug_522411ff_uniq` (`partner_id`,`slug`),
  KEY `course_metadata_topic_slug_70126453` (`slug`),
  CONSTRAINT `course_metadata_topic_partner_id_470dc2a6_fk_core_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `core_partner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_topic`
--

LOCK TABLES `course_metadata_topic` WRITE;
/*!40000 ALTER TABLE `course_metadata_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_topictranslation`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_topictranslation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_code` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `description` longtext,
  `long_description` longtext,
  `master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_metadata_topictra_language_code_master_id_86f54f05_uniq` (`language_code`,`master_id`),
  KEY `course_metadata_topi_master_id_4fbd09ca_fk_course_me` (`master_id`),
  KEY `course_metadata_topictranslation_language_code_f5b18ce1` (`language_code`),
  CONSTRAINT `course_metadata_topi_master_id_4fbd09ca_fk_course_me` FOREIGN KEY (`master_id`) REFERENCES `course_metadata_topic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_topictranslation`
--

LOCK TABLES `course_metadata_topictranslation` WRITE;
/*!40000 ALTER TABLE `course_metadata_topictranslation` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_topictranslation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_metadata_video`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_metadata_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `src` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `src` (`src`),
  KEY `course_metadata_vide_image_id_0b55dd0e_fk_course_me` (`image_id`),
  CONSTRAINT `course_metadata_vide_image_id_0b55dd0e_fk_course_me` FOREIGN KEY (`image_id`) REFERENCES `course_metadata_image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_metadata_video`
--

LOCK TABLES `course_metadata_video` WRITE;
/*!40000 ALTER TABLE `course_metadata_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_metadata_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_core_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-02-25 22:22:57.126932','2','Program test ednx',1,'[{\"added\": {}}]',41,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_flags`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(30) NOT NULL,
  `flag_date` datetime(6) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_comment_flags_user_id_comment_id_flag_537f77a7_uniq` (`user_id`,`comment_id`,`flag`),
  KEY `django_comment_flags_comment_id_d8054933_fk_django_comments_id` (`comment_id`),
  KEY `django_comment_flags_flag_8b141fcb` (`flag`),
  CONSTRAINT `django_comment_flags_comment_id_d8054933_fk_django_comments_id` FOREIGN KEY (`comment_id`) REFERENCES `django_comments` (`id`),
  CONSTRAINT `django_comment_flags_user_id_f3f81f0a_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_flags`
--

LOCK TABLES `django_comment_flags` WRITE;
/*!40000 ALTER TABLE `django_comment_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_pk` longtext NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `user_url` varchar(200) NOT NULL,
  `comment` longtext NOT NULL,
  `submit_date` datetime(6) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `django_comments_content_type_id_c4afe962_fk_django_co` (`content_type_id`),
  KEY `django_comments_site_id_9dcf666e_fk_django_site_id` (`site_id`),
  KEY `django_comments_user_id_a0a440a1_fk_core_user_id` (`user_id`),
  KEY `django_comments_submit_date_514ed2d9` (`submit_date`),
  CONSTRAINT `django_comments_content_type_id_c4afe962_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_comments_site_id_9dcf666e_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `django_comments_user_id_a0a440a1_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comments`
--

LOCK TABLES `django_comments` WRITE;
/*!40000 ALTER TABLE `django_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(3,'auth','group'),(4,'auth','permission'),(27,'catalogs','catalog'),(5,'contenttypes','contenttype'),(23,'core','currency'),(22,'core','partner'),(24,'core','user'),(25,'core','userthrottlerate'),(28,'course_metadata','corporateendorsement'),(50,'course_metadata','course'),(38,'course_metadata','courseentitlement'),(29,'course_metadata','courserun'),(33,'course_metadata','courserunsocialnetwork'),(36,'course_metadata','dataloaderconfig'),(42,'course_metadata','endorsement'),(45,'course_metadata','expectedlearningitem'),(39,'course_metadata','faq'),(44,'course_metadata','image'),(43,'course_metadata','joboutlookitem'),(31,'course_metadata','leveltype'),(53,'course_metadata','organization'),(55,'course_metadata','person'),(32,'course_metadata','personsocialnetwork'),(35,'course_metadata','personwork'),(52,'course_metadata','position'),(34,'course_metadata','prerequisite'),(41,'course_metadata','program'),(37,'course_metadata','programtype'),(46,'course_metadata','seat'),(49,'course_metadata','seattype'),(54,'course_metadata','subject'),(40,'course_metadata','subjecttranslation'),(51,'course_metadata','syllabusitem'),(47,'course_metadata','topic'),(30,'course_metadata','topictranslation'),(48,'course_metadata','video'),(18,'django_comments','comment'),(19,'django_comments','commentflag'),(16,'guardian','groupobjectpermission'),(17,'guardian','userobjectpermission'),(26,'ietf_language_tags','languagetag'),(63,'publisher','course'),(68,'publisher','courseentitlement'),(57,'publisher','courserun'),(61,'publisher','courserunstate'),(67,'publisher','coursestate'),(72,'publisher','courseuserrole'),(58,'publisher','historicalcourse'),(59,'publisher','historicalcourserun'),(65,'publisher','historicalcourserunstate'),(60,'publisher','historicalcoursestate'),(62,'publisher','historicalcourseuserrole'),(69,'publisher','historicalorganizationextension'),(66,'publisher','historicalorganizationuserrole'),(70,'publisher','historicalseat'),(1,'publisher','organizationextension'),(56,'publisher','organizationuserrole'),(73,'publisher','publisheruser'),(64,'publisher','seat'),(71,'publisher','userattributes'),(74,'publisher_comments','comments'),(6,'sessions','session'),(7,'sites','site'),(11,'social_django','association'),(8,'social_django','code'),(9,'social_django','nonce'),(10,'social_django','partial'),(12,'social_django','usersocialauth'),(21,'taggit','tag'),(20,'taggit','taggeditem'),(13,'waffle','flag'),(14,'waffle','sample'),(15,'waffle','switch');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-02-25 22:08:16.060394'),(2,'contenttypes','0002_remove_content_type_name','2019-02-25 22:08:16.168395'),(3,'auth','0001_initial','2019-02-25 22:08:16.603132'),(4,'auth','0002_alter_permission_name_max_length','2019-02-25 22:08:16.690424'),(5,'auth','0003_alter_user_email_max_length','2019-02-25 22:08:16.702768'),(6,'auth','0004_alter_user_username_opts','2019-02-25 22:08:16.725009'),(7,'auth','0005_alter_user_last_login_null','2019-02-25 22:08:16.747378'),(8,'auth','0006_require_contenttypes_0002','2019-02-25 22:08:16.750728'),(9,'core','0001_initial','2019-02-25 22:08:17.545317'),(10,'core','0002_userthrottlerate','2019-02-25 22:08:17.555184'),(11,'core','0003_auto_20160315_1910','2019-02-25 22:08:17.570668'),(12,'core','0004_currency','2019-02-25 22:08:17.580617'),(13,'core','0005_populate_currencies','2019-02-25 22:08:17.584143'),(14,'core','0006_user_referral_tracking_id','2019-02-25 22:08:17.589095'),(15,'core','0007_auto_20160510_2017','2019-02-25 22:08:17.604787'),(16,'core','0008_partner','2019-02-25 22:08:17.620312'),(17,'core','0009_auto_20160730_2131','2019-02-25 22:08:17.625289'),(18,'core','0010_auto_20160731_0023','2019-02-25 22:08:17.629517'),(19,'core','0011_auto_20161101_2207','2019-02-25 22:08:17.633716'),(20,'admin','0001_initial','2019-02-25 22:08:17.863986'),(21,'admin','0002_logentry_remove_auto_add','2019-02-25 22:08:17.903803'),(22,'auth','0007_alter_validators_add_error_messages','2019-02-25 22:08:17.938180'),(23,'auth','0008_alter_user_username_max_length','2019-02-25 22:08:17.960353'),(24,'catalogs','0001_initial','2019-02-25 22:08:18.021743'),(25,'catalogs','0002_auto_20160327_2101','2019-02-25 22:08:18.025716'),(26,'waffle','0001_initial','2019-02-25 22:08:18.719415'),(27,'sites','0001_initial','2019-02-25 22:08:18.781195'),(28,'sites','0002_alter_domain_unique','2019-02-25 22:08:18.820289'),(29,'core','0002_partner_studio_url','2019-02-25 22:08:18.904724'),(30,'core','0003_auto_20170522_0856','2019-02-25 22:08:19.002572'),(31,'core','0004_partner_site','2019-02-25 22:08:19.163377'),(32,'core','0005_auto_20170830_1246','2019-02-25 22:08:19.328825'),(33,'core','0006_partner_lms_url','2019-02-25 22:08:19.414248'),(34,'core','0007_auto_20171004_1133','2019-02-25 22:08:19.461645'),(35,'ietf_language_tags','0001_initial','2019-02-25 22:08:19.695119'),(36,'ietf_language_tags','0002_language_tag_data_migration','2019-02-25 22:08:19.697222'),(37,'ietf_language_tags','0003_fix_language_tag_names','2019-02-25 22:08:19.699140'),(38,'ietf_language_tags','0004_add_chinese_tags','2019-02-25 22:08:19.701375'),(39,'ietf_language_tags','0005_fix_language_tag_names_again','2019-02-25 22:08:19.703161'),(40,'taggit','0001_initial','2019-02-25 22:08:19.981813'),(41,'taggit','0002_auto_20150616_2121','2019-02-25 22:08:20.027364'),(42,'course_metadata','0001_initial','2019-02-25 22:08:31.636294'),(43,'course_metadata','0002_auto_20160406_1644','2019-02-25 22:08:31.649190'),(44,'course_metadata','0003_auto_20160523_1422','2019-02-25 22:08:31.655969'),(45,'course_metadata','0004_program','2019-02-25 22:08:31.662095'),(46,'course_metadata','0005_auto_20160713_0113','2019-02-25 22:08:31.679574'),(47,'course_metadata','0006_auto_20160719_2052','2019-02-25 22:08:31.696668'),(48,'course_metadata','0007_auto_20160720_1749','2019-02-25 22:08:31.703904'),(49,'course_metadata','0008_program_image','2019-02-25 22:08:31.710139'),(50,'course_metadata','0009_auto_20160725_1751','2019-02-25 22:08:31.716273'),(51,'course_metadata','0010_auto_20160731_0226','2019-02-25 22:08:31.733714'),(52,'course_metadata','0011_auto_20160805_1949','2019-02-25 22:08:31.746078'),(53,'course_metadata','0012_create_seat_types','2019-02-25 22:08:31.752389'),(54,'course_metadata','0013_auto_20160809_1259','2019-02-25 22:08:31.759269'),(55,'course_metadata','0014_auto_20160811_0436','2019-02-25 22:08:31.765947'),(56,'course_metadata','0015_auto_20160813_2142','2019-02-25 22:08:31.783071'),(57,'course_metadata','0016_auto_20160815_1438','2019-02-25 22:08:31.801161'),(58,'course_metadata','0017_auto_20160815_2135','2019-02-25 22:08:31.807783'),(59,'course_metadata','0018_auto_20160815_2252','2019-02-25 22:08:31.814720'),(60,'course_metadata','0019_program_banner_image','2019-02-25 22:08:31.820037'),(61,'course_metadata','0020_auto_20160819_1942','2019-02-25 22:08:31.830108'),(62,'course_metadata','0021_auto_20160819_2005','2019-02-25 22:08:31.845214'),(63,'course_metadata','0022_remove_duplicate_courses','2019-02-25 22:08:31.854770'),(64,'course_metadata','0023_auto_20160826_1912','2019-02-25 22:08:31.858179'),(65,'course_metadata','0024_auto_20160901_1426','2019-02-25 22:08:31.862181'),(66,'course_metadata','0025_remove_program_category','2019-02-25 22:08:31.866031'),(67,'course_metadata','0026_auto_20160912_2146','2019-02-25 22:08:31.878158'),(68,'course_metadata','0027_auto_20160915_2038','2019-02-25 22:08:31.897934'),(69,'course_metadata','0028_courserun_hidden','2019-02-25 22:08:31.912332'),(70,'course_metadata','0029_auto_20160923_1306','2019-02-25 22:08:31.922875'),(71,'course_metadata','0030_create_refresh_command_switches','2019-02-25 22:08:31.931229'),(72,'course_metadata','0031_courserun_weeks_to_complete','2019-02-25 22:08:31.940215'),(73,'course_metadata','0032_auto_20161021_1636','2019-02-25 22:08:31.954607'),(74,'course_metadata','0033_courserun_mobile_available','2019-02-25 22:08:31.974132'),(75,'course_metadata','0034_auto_20161103_0855','2019-02-25 22:08:32.065167'),(76,'course_metadata','0035_auto_20161103_2129','2019-02-25 22:08:32.152189'),(77,'course_metadata','0036_course_canonical_course_run','2019-02-25 22:08:32.372566'),(78,'course_metadata','0037_migrate_courses_with_canonical','2019-02-25 22:08:32.461804'),(79,'course_metadata','0038_seat_sku','2019-02-25 22:08:32.550455'),(80,'course_metadata','0039_programtype_logo_image','2019-02-25 22:08:32.630598'),(81,'course_metadata','0040_auto_20161220_1644','2019-02-25 22:08:32.922017'),(82,'course_metadata','0041_organization_certificate_logo_image_url','2019-02-25 22:08:33.022748'),(83,'course_metadata','0042_auto_20170119_0918','2019-02-25 22:08:33.094833'),(84,'course_metadata','0043_courserun_course_overridden','2019-02-25 22:08:33.256377'),(85,'course_metadata','0044_auto_20170131_1749','2019-02-25 22:08:33.375690'),(86,'course_metadata','0045_person_profile_image','2019-02-25 22:08:33.473884'),(87,'course_metadata','0046_courserun_reporting_type','2019-02-25 22:08:33.637224'),(88,'course_metadata','0047_personwork','2019-02-25 22:08:33.824487'),(89,'course_metadata','0048_dataloaderconfig','2019-02-25 22:08:33.885947'),(90,'course_metadata','0049_courserun_eligible_for_financial_aid','2019-02-25 22:08:34.087335'),(91,'course_metadata','0050_person_profile_url','2019-02-25 22:08:34.194303'),(92,'course_metadata','0051_program_one_click_purchase_enabled','2019-02-25 22:08:34.387167'),(93,'course_metadata','0052_create_course_run_publication_switch','2019-02-25 22:08:34.546549'),(94,'course_metadata','0053_person_email','2019-02-25 22:08:34.637681'),(95,'course_metadata','0054_update_program_type_slug_field','2019-02-25 22:08:34.787750'),(96,'course_metadata','0055_program_hidden','2019-02-25 22:08:34.960308'),(97,'course_metadata','0056_auto_20170620_1351','2019-02-25 22:08:35.044638'),(98,'course_metadata','0057_auto_20170915_1528','2019-02-25 22:08:35.778744'),(99,'course_metadata','0058_auto_course_about_page_creation_switch','2019-02-25 22:08:35.870630'),(100,'course_metadata','0059_auto_20171002_1705','2019-02-25 22:08:36.247387'),(101,'course_metadata','0060_create_subjecttranslations_models','2019-02-25 22:08:36.676992'),(102,'course_metadata','0061_migrate_subjects_data','2019-02-25 22:08:36.760430'),(103,'course_metadata','0062_courserun_license','2019-02-25 22:08:36.963915'),(104,'course_metadata','0063_auto_20171005_1931','2019-02-25 22:08:37.587078'),(105,'course_metadata','0064_auto_20171018_1528','2019-02-25 22:08:37.840192'),(106,'course_metadata','0065_program_total_hours_of_effort','2019-02-25 22:08:38.064250'),(107,'course_metadata','0066_auto_20171107_1707','2019-02-25 22:08:38.226506'),(108,'course_metadata','0067_auto_20171108_1432','2019-02-25 22:08:38.275370'),(109,'course_metadata','0068_auto_20171108_1614','2019-02-25 22:08:38.647878'),(110,'course_metadata','0069_courseentitlement_expires','2019-02-25 22:08:38.771210'),(111,'course_metadata','0070_auto_20171127_1057','2019-02-25 22:08:38.833771'),(112,'course_metadata','0071_auto_20171128_1945','2019-02-25 22:08:39.437657'),(113,'course_metadata','0072_courseentitlement_partner','2019-02-25 22:08:39.685333'),(114,'course_metadata','0073_program_instructors','2019-02-25 22:08:39.980270'),(115,'course_metadata','0074_auto_20171212_2016','2019-02-25 22:08:40.316257'),(116,'course_metadata','0075_auto_20171211_1922','2019-02-25 22:08:40.621516'),(117,'course_metadata','0076_auto_20171219_1841','2019-02-25 22:08:40.888663'),(118,'course_metadata','0077_auto_20180131_1956','2019-02-25 22:08:41.044759'),(119,'course_metadata','0077_auto_20180126_1204','2019-02-25 22:08:41.181757'),(120,'course_metadata','0078_merge_20180209_1044','2019-02-25 22:08:41.193936'),(121,'course_metadata','0079_enable_program_default_true','2019-02-25 22:08:41.265642'),(122,'course_metadata','0080_seat_bulk_sku','2019-02-25 22:08:41.385105'),(123,'course_metadata','0081_auto_20180329_0718','2019-02-25 22:08:41.669773'),(124,'course_metadata','0082_person_salutation','2019-02-25 22:08:41.787826'),(125,'course_metadata','0083_auto_20180511_1406','2019-02-25 22:08:41.935906'),(126,'course_metadata','0084_auto_20180522_1339','2019-02-25 22:08:42.255217'),(127,'django_comments','0001_initial','2019-02-25 22:08:43.036752'),(128,'django_comments','0002_update_user_email_field_length','2019-02-25 22:08:43.150018'),(129,'django_comments','0003_add_submit_date_index','2019-02-25 22:08:43.206446'),(130,'edx_catalog_extensions','0001_create_program_types','2019-02-25 22:08:43.396917'),(131,'edx_catalog_extensions','0002_convert_program_category_to_type','2019-02-25 22:08:43.400544'),(132,'edx_catalog_extensions','0003_create_publish_to_marketing_site_flag','2019-02-25 22:08:43.404093'),(133,'edx_catalog_extensions','0002_create_professional_certificate_program_type','2019-02-25 22:08:43.487187'),(134,'guardian','0001_initial','2019-02-25 22:08:44.213840'),(135,'publisher','0001_initial','2019-02-25 22:08:47.307918'),(136,'publisher','0002_auto_20160729_1027','2019-02-25 22:08:50.218880'),(137,'publisher','0003_auto_20160801_1757','2019-02-25 22:08:50.998641'),(138,'publisher','0004_auto_20160810_0854','2019-02-25 22:08:51.818177'),(139,'publisher','0005_auto_20160901_0003','2019-02-25 22:08:51.920371'),(140,'publisher','0006_auto_20160902_0726','2019-02-25 22:08:51.953418'),(141,'publisher','0007_auto_20160905_1020','2019-02-25 22:08:53.809145'),(142,'publisher','0008_auto_20160928_1015','2019-02-25 22:08:54.103876'),(143,'publisher','0009_auto_20160929_1927','2019-02-25 22:08:56.180842'),(144,'publisher','0010_auto_20161006_1151','2019-02-25 22:08:57.171341'),(145,'publisher','0011_userattributes','2019-02-25 22:08:57.365168'),(146,'publisher','0012_auto_20161020_0718','2019-02-25 22:08:58.553984'),(147,'publisher','0013_create_enable_email_notifications_switch','2019-02-25 22:08:58.680787'),(148,'publisher','0014_create_admin_group','2019-02-25 22:08:58.783097'),(149,'publisher','0015_auto_20161117_1210','2019-02-25 22:08:59.098575'),(150,'publisher','0016_auto_20161129_0910','2019-02-25 22:08:59.880999'),(151,'publisher','0017_auto_20161201_1501','2019-02-25 22:09:01.007272'),(152,'publisher','0018_create_internal_user_group','2019-02-25 22:09:01.267900'),(153,'publisher','0019_create_user_groups','2019-02-25 22:09:01.378597'),(154,'publisher','0020_auto_20161214_1304','2019-02-25 22:09:01.949277'),(155,'publisher','0021_auto_20161214_1356','2019-02-25 22:09:02.015020'),(156,'publisher','0022_auto_20161222_2135','2019-02-25 22:09:02.087600'),(157,'publisher','0023_auto_20161228_1350','2019-02-25 22:09:02.447091'),(158,'publisher','0024_auto_20170105_1626','2019-02-25 22:09:02.522447'),(159,'publisher','0025_auto_20170106_1830','2019-02-25 22:09:02.787732'),(160,'publisher','0026_create_switch_hide_features_for_pilot','2019-02-25 22:09:02.896830'),(161,'publisher','0027_remove_old_permissions','2019-02-25 22:09:03.008893'),(162,'publisher','0028_create_partner_manager_group','2019-02-25 22:09:03.117397'),(163,'publisher','0029_auto_20170119_0934','2019-02-25 22:09:03.253893'),(164,'publisher','0030_create_switch_add_instructor_feature','2019-02-25 22:09:03.365166'),(165,'publisher','0031_courserunstate_coursestate_historicalcourserunstate_historicalcoursestate','2019-02-25 22:09:04.654152'),(166,'publisher','0032_create_switch_for_comments','2019-02-25 22:09:04.786200'),(167,'publisher','0033_auto_20170213_0914','2019-02-25 22:09:04.907075'),(168,'publisher','0034_auto_20170213_0918','2019-02-25 22:09:05.043587'),(169,'publisher','0035_publisheruser','2019-02-25 22:09:05.054277'),(170,'publisher','0036_auto_20170216_0946','2019-02-25 22:09:05.771810'),(171,'publisher','0037_auto_20170221_1150','2019-02-25 22:09:06.101574'),(172,'publisher','0038_auto_20170223_0723','2019-02-25 22:09:06.924594'),(173,'publisher','0039_rename_partner_coordinator_group','2019-02-25 22:09:07.057918'),(174,'publisher','0040_auto_20170223_1241','2019-02-25 22:09:07.965377'),(175,'publisher','0041_auto_20170306_1002','2019-02-25 22:09:08.822394'),(176,'publisher','0042_auto_20170306_1014','2019-02-25 22:09:09.085214'),(177,'publisher','0043_auto_20170321_1239','2019-02-25 22:09:09.208333'),(178,'publisher','0044_auto_20170323_0749','2019-02-25 22:09:09.439668'),(179,'publisher','0045_auto_20170330_0729','2019-02-25 22:09:10.365325'),(180,'publisher','0046_auto_20170413_0935','2019-02-25 22:09:10.504626'),(181,'publisher','0047_auto_20170413_1010','2019-02-25 22:09:11.009227'),(182,'publisher','0048_auto_20170511_1059','2019-02-25 22:09:11.131730'),(183,'publisher','0049_auto_20170518_1017','2019-02-25 22:09:11.288066'),(184,'publisher','0050_auto_20170524_1909','2019-02-25 22:09:11.605223'),(185,'publisher','0051_auto_20170525_1049','2019-02-25 22:09:11.916739'),(186,'publisher','0052_auto_20170529_1002','2019-02-25 22:09:12.217016'),(187,'publisher','0053_auto_20170604_1502','2019-02-25 22:09:13.049526'),(188,'publisher','0054_auto_20170605_0953','2019-02-25 22:09:13.247516'),(189,'publisher','0055_auto_20170620_1500','2019-02-25 22:09:13.687243'),(190,'publisher','0056_auto_20170621_1712','2019-02-25 22:09:14.312742'),(191,'publisher','0057_auto_20170920_1821','2019-02-25 22:09:14.613658'),(192,'publisher','0058_auto_20170927_1758','2019-02-25 22:09:14.894800'),(193,'publisher','0059_auto_20170928_0425','2019-02-25 22:09:16.220540'),(194,'publisher','0060_auto_20171004_0521','2019-02-25 22:09:16.349575'),(195,'publisher','0061_add_people_permission','2019-02-25 22:09:16.485688'),(196,'publisher','0062_auto_20171212_2016','2019-02-25 22:09:16.595366'),(197,'publisher','0063_auto_20171219_1841','2019-02-25 22:09:16.704193'),(198,'publisher','0064_auto_20180125_1836','2019-02-25 22:09:17.564486'),(199,'publisher','0065_auto_20180507_0951','2019-02-25 22:09:18.389351'),(200,'publisher_comments','0001_initial','2019-02-25 22:09:18.819484'),(201,'publisher_comments','0002_comments_comment_type','2019-02-25 22:09:18.977558'),(202,'sessions','0001_initial','2019-02-25 22:09:19.087581'),(203,'default','0001_initial','2019-02-25 22:09:19.687812'),(204,'social_auth','0001_initial','2019-02-25 22:09:19.699881'),(205,'default','0002_add_related_name','2019-02-25 22:09:19.911364'),(206,'social_auth','0002_add_related_name','2019-02-25 22:09:19.927998'),(207,'default','0003_alter_email_max_length','2019-02-25 22:09:20.071774'),(208,'social_auth','0003_alter_email_max_length','2019-02-25 22:09:20.081261'),(209,'default','0004_auto_20160423_0400','2019-02-25 22:09:20.149608'),(210,'social_auth','0004_auto_20160423_0400','2019-02-25 22:09:20.170712'),(211,'social_auth','0005_auto_20160727_2333','2019-02-25 22:09:20.216485'),(212,'social_django','0006_partial','2019-02-25 22:09:20.284850'),(213,'social_django','0003_alter_email_max_length','2019-02-25 22:09:20.305261'),(214,'core','0001_squashed_0011_auto_20161101_2207','2019-02-25 22:09:20.317331'),(215,'catalogs','0001_squashed_0002_auto_20160327_2101','2019-02-25 22:09:20.322621'),(216,'ietf_language_tags','0001_squashed_0005_fix_language_tag_names_again','2019-02-25 22:09:20.327785'),(217,'course_metadata','0001_squashed_0033_courserun_mobile_available','2019-02-25 22:09:20.334027'),(218,'social_django','0004_auto_20160423_0400','2019-02-25 22:09:20.350805'),(219,'social_django','0001_initial','2019-02-25 22:09:20.366494'),(220,'social_django','0002_add_related_name','2019-02-25 22:09:20.372113'),(221,'social_django','0005_auto_20160727_2333','2019-02-25 22:09:20.377070'),(222,'edx_catalog_extensions','0001_squashed_0003_create_publish_to_marketing_site_flag','2019-02-25 22:09:20.382488');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('z699umf7jx4mhsh66n7e4v17l0ywh2z2','ODI5ZDNiYzk0YmNjNTRmZGU1Mzc4NjU0MzI5OTU4NWI2MTMwNjNlMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2M2ZmE2MTA1N2JkYjUwNzBkNDI0MmNkMGYzZTBkYzg5OGM5YmU5YSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-03-11 22:20:54.229380');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'localhost:18381','edX');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian_groupobjectpermission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guardian_groupobjectpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_pk` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq` (`group_id`,`permission_id`,`object_pk`),
  KEY `guardian_groupobject_content_type_id_7ade36b8_fk_django_co` (`content_type_id`),
  KEY `guardian_groupobject_permission_id_36572738_fk_auth_perm` (`permission_id`),
  CONSTRAINT `guardian_groupobject_content_type_id_7ade36b8_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `guardian_groupobject_group_id_4bbbfb62_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `guardian_groupobject_permission_id_36572738_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian_groupobjectpermission`
--

LOCK TABLES `guardian_groupobjectpermission` WRITE;
/*!40000 ALTER TABLE `guardian_groupobjectpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `guardian_groupobjectpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian_userobjectpermission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guardian_userobjectpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_pk` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq` (`user_id`,`permission_id`,`object_pk`),
  KEY `guardian_userobjectp_content_type_id_2e892405_fk_django_co` (`content_type_id`),
  KEY `guardian_userobjectp_permission_id_71807bfc_fk_auth_perm` (`permission_id`),
  CONSTRAINT `guardian_userobjectp_content_type_id_2e892405_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `guardian_userobjectp_permission_id_71807bfc_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `guardian_userobjectpermission_user_id_d5c1e964_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian_userobjectpermission`
--

LOCK TABLES `guardian_userobjectpermission` WRITE;
/*!40000 ALTER TABLE `guardian_userobjectpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `guardian_userobjectpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ietf_language_tags_languagetag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ietf_language_tags_languagetag` (
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ietf_language_tags_languagetag`
--

LOCK TABLES `ietf_language_tags_languagetag` WRITE;
/*!40000 ALTER TABLE `ietf_language_tags_languagetag` DISABLE KEYS */;
INSERT INTO `ietf_language_tags_languagetag` VALUES ('af','Afrikaans'),('ar-ae','Arabic - United Arab Emirates'),('ar-bh','Arabic - Bahrain'),('ar-dz','Arabic - Algeria'),('ar-eg','Arabic - Egypt'),('ar-iq','Arabic - Iraq'),('ar-jo','Arabic - Jordan'),('ar-kw','Arabic - Kuwait'),('ar-lb','Arabic - Lebanon'),('ar-ly','Arabic - Libya'),('ar-ma','Arabic - Morocco'),('ar-om','Arabic - Oman'),('ar-qa','Arabic - Qatar'),('ar-sa','Arabic - Saudi Arabia'),('ar-sy','Arabic - Syria'),('ar-tn','Arabic - Tunisia'),('ar-ye','Arabic - Yemen'),('az-az','Azeri - Latin'),('be','Belarusian'),('bg','Bulgarian'),('ca','Catalan'),('cs','Czech'),('da','Danish'),('de-at','German - Austria'),('de-ch','German - Switzerland'),('de-de','German - Germany'),('de-li','German - Liechtenstein'),('de-lu','German - Luxembourg'),('el','Greek'),('en-au','English - Australia'),('en-bz','English - Belize'),('en-ca','English - Canada'),('en-cb','English - Caribbean'),('en-gb','English - Great Britain'),('en-ie','English - Ireland'),('en-in','English - India'),('en-jm','English - Jamaica'),('en-my','English - Malaysia'),('en-nz','English - New Zealand'),('en-ph','English - Phillippines'),('en-sg','English - Singapore'),('en-tt','English - Trinidad'),('en-us','English - United States'),('en-za','English - Southern Africa'),('en-zw','English - Zimbabwe'),('es-ar','Spanish - Argentina'),('es-bo','Spanish - Bolivia'),('es-cl','Spanish - Chile'),('es-co','Spanish - Colombia'),('es-cr','Spanish - Costa Rica'),('es-do','Spanish - Dominican Republic'),('es-ec','Spanish - Ecuador'),('es-es','Spanish - Spain (Modern)'),('es-gt','Spanish - Guatemala'),('es-hn','Spanish - Honduras'),('es-mx','Spanish - Mexico'),('es-ni','Spanish - Nicaragua'),('es-pa','Spanish - Panama'),('es-pe','Spanish - Peru'),('es-pr','Spanish - Puerto Rico'),('es-py','Spanish - Paraguay'),('es-sv','Spanish - El Salvador'),('es-uy','Spanish - Uruguay'),('es-ve','Spanish - Venezuela'),('et','Estonian'),('eu','Basque (Basque)'),('fa','Farsi'),('fi','Finnish'),('fo','Faroese'),('fr-be','French - Belgium'),('fr-ca','French - Canada'),('fr-ch','French - Switzerland'),('fr-fr','French - France'),('fr-lu','French - Luxembourg'),('gd','Scottish Gaelic - United Kingdom'),('gd-ie','Irish - Ireland'),('he','Hebrew'),('hi','Hindi'),('hr','Croatian'),('hu','Hungarian'),('hy','Armenian'),('id','Indonesian'),('is','Icelandic'),('it-ch','Italian - Switzerland'),('it-it','Italian - Italy'),('ja','Japanese'),('ko','Korean'),('lt','Lithuanian'),('lv','Latvian'),('mk','F.Y.R.O. Macedonia'),('mr','Marathi'),('ms-bn','Malay - Brunei'),('ms-my','Malay - Malaysia'),('mt','Maltese'),('nb-no','Norwegian - Bokmål'),('nl-be','Dutch - Belgium'),('nl-nl','Dutch - Netherlands'),('nn-no','Norwegian - Nynorsk'),('pl','Polish'),('pt-br','Portuguese - Brazil'),('pt-pt','Portuguese - Portugal'),('rm','Raeto-Romance'),('ro','Romanian - Romania'),('ro-mo','Romanian - Republic of Moldova'),('ru','Russian'),('ru-mo','Russian - Republic of Moldova'),('sa','Sanskrit'),('sb','Sorbian'),('sk','Slovak'),('sl','Slovenian'),('sq','Albanian'),('sr-sp','Serbian - Latin'),('st','Southern Sotho'),('sv-fi','Swedish - Finland'),('sv-se','Swedish - Sweden'),('sw','Swahili'),('ta','Tamil'),('th','Thai'),('tn','Setsuana'),('tr','Turkish'),('ts','Tsonga'),('tt','Tatar'),('uk','Ukrainian'),('ur','Urdu'),('uz-uz','Uzbek - Latin'),('vi','Vietnamese'),('xh','Xhosa'),('yi','Yiddish'),('zh-cmn','Chinese - Mandarin'),('zh-cn','Chinese - China'),('zh-Hans','Chinese - Simplified'),('zh-Hant','Chinese - Traditional'),('zh-hk','Chinese - Hong Kong SAR'),('zh-mo','Chinese - Macau SAR'),('zh-sg','Chinese - Singapore'),('zh-tw','Chinese - Taiwan'),('zu','Zulu');
/*!40000 ALTER TABLE `ietf_language_tags_languagetag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_comments_comments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_comments_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_pk` longtext NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `user_url` varchar(200) NOT NULL,
  `comment` longtext NOT NULL,
  `submit_date` datetime(6) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_type` varchar(255),
  PRIMARY KEY (`id`),
  KEY `publisher_comments_c_content_type_id_5b5465fc_fk_django_co` (`content_type_id`),
  KEY `publisher_comments_comments_site_id_d51db447_fk_django_site_id` (`site_id`),
  KEY `publisher_comments_comments_user_id_690dd7c7_fk_core_user_id` (`user_id`),
  KEY `publisher_comments_comments_submit_date_774754e3` (`submit_date`),
  CONSTRAINT `publisher_comments_c_content_type_id_5b5465fc_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `publisher_comments_comments_site_id_d51db447_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `publisher_comments_comments_user_id_690dd7c7_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_comments_comments`
--

LOCK TABLES `publisher_comments_comments` WRITE;
/*!40000 ALTER TABLE `publisher_comments_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_comments_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_course`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `short_description` longtext,
  `full_description` longtext,
  `expected_learnings` longtext,
  `syllabus` longtext,
  `prerequisites` longtext,
  `learner_testimonial` longtext,
  `level_type_id` int(11) DEFAULT NULL,
  `primary_subject_id` int(11) DEFAULT NULL,
  `secondary_subject_id` int(11) DEFAULT NULL,
  `tertiary_subject_id` int(11) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `is_seo_review` tinyint(1) NOT NULL,
  `faq` longtext,
  `video_link` varchar(200) DEFAULT NULL,
  `course_metadata_pk` int(10) unsigned DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `publisher_course_primary_subject_id_f9208182_fk_course_me` (`primary_subject_id`),
  KEY `publisher_course_secondary_subject_id_72342b61_fk_course_me` (`secondary_subject_id`),
  KEY `publisher_course_tertiary_subject_id_799d2584_fk_course_me` (`tertiary_subject_id`),
  KEY `publisher_course_changed_by_id_da790006_fk_core_user_id` (`changed_by_id`),
  KEY `publisher_course_level_type_id_6259ebe9_fk_course_me` (`level_type_id`),
  CONSTRAINT `publisher_course_changed_by_id_da790006_fk_core_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `publisher_course_level_type_id_6259ebe9_fk_course_me` FOREIGN KEY (`level_type_id`) REFERENCES `course_metadata_leveltype` (`id`),
  CONSTRAINT `publisher_course_primary_subject_id_f9208182_fk_course_me` FOREIGN KEY (`primary_subject_id`) REFERENCES `course_metadata_subject` (`id`),
  CONSTRAINT `publisher_course_secondary_subject_id_72342b61_fk_course_me` FOREIGN KEY (`secondary_subject_id`) REFERENCES `course_metadata_subject` (`id`),
  CONSTRAINT `publisher_course_tertiary_subject_id_799d2584_fk_course_me` FOREIGN KEY (`tertiary_subject_id`) REFERENCES `course_metadata_subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_course`
--

LOCK TABLES `publisher_course` WRITE;
/*!40000 ALTER TABLE `publisher_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_course_organizations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_course_organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publisher_course_organiz_course_id_organization_i_4696f4c4_uniq` (`course_id`,`organization_id`),
  KEY `publisher_course_org_organization_id_db73e667_fk_course_me` (`organization_id`),
  CONSTRAINT `publisher_course_org_course_id_c6bb556e_fk_publisher` FOREIGN KEY (`course_id`) REFERENCES `publisher_course` (`id`),
  CONSTRAINT `publisher_course_org_organization_id_db73e667_fk_course_me` FOREIGN KEY (`organization_id`) REFERENCES `course_metadata_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_course_organizations`
--

LOCK TABLES `publisher_course_organizations` WRITE;
/*!40000 ALTER TABLE `publisher_course_organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_course_organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_courseentitlement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_courseentitlement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `mode` varchar(63) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `course_id` int(11) NOT NULL,
  `currency_id` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publisher_courseentitlement_course_id_mode_0110ee6d_uniq` (`course_id`,`mode`),
  KEY `publisher_courseenti_currency_id_6a37c47b_fk_core_curr` (`currency_id`),
  CONSTRAINT `publisher_courseenti_course_id_21cd2071_fk_publisher` FOREIGN KEY (`course_id`) REFERENCES `publisher_course` (`id`),
  CONSTRAINT `publisher_courseenti_currency_id_6a37c47b_fk_core_curr` FOREIGN KEY (`currency_id`) REFERENCES `core_currency` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_courseentitlement`
--

LOCK TABLES `publisher_courseentitlement` WRITE;
/*!40000 ALTER TABLE `publisher_courseentitlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_courseentitlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_courserun`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_courserun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `lms_course_id` varchar(255) DEFAULT NULL,
  `start` datetime(6) DEFAULT NULL,
  `end` datetime(6) DEFAULT NULL,
  `certificate_generation` datetime(6) DEFAULT NULL,
  `pacing_type` varchar(255) DEFAULT NULL,
  `min_effort` smallint(5) unsigned DEFAULT NULL,
  `max_effort` smallint(5) unsigned DEFAULT NULL,
  `length` int(10) unsigned DEFAULT NULL,
  `is_re_run` tinyint(1) NOT NULL,
  `is_xseries` tinyint(1) NOT NULL,
  `xseries_name` varchar(255) DEFAULT NULL,
  `is_micromasters` tinyint(1) NOT NULL,
  `micromasters_name` varchar(255) DEFAULT NULL,
  `contacted_partner_manager` tinyint(1) NOT NULL,
  `notes` longtext,
  `target_content` tinyint(1) NOT NULL,
  `priority` varchar(5) DEFAULT NULL,
  `course_team_admins` longtext,
  `course_team_additional_staff` longtext,
  `course_id` int(11) NOT NULL,
  `language_id` varchar(50) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `video_language_id` varchar(50) DEFAULT NULL,
  `preview_url` varchar(200) DEFAULT NULL,
  `card_image_url` varchar(200) DEFAULT NULL,
  `is_professional_certificate` tinyint(1) NOT NULL,
  `professional_certificate_name` varchar(255) DEFAULT NULL,
  `short_description_override` varchar(255) DEFAULT NULL,
  `full_description_override` longtext,
  `title_override` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lms_course_id` (`lms_course_id`),
  KEY `publisher_courserun_pacing_type_87f91943` (`pacing_type`),
  KEY `publisher_courserun_course_id_22fea441_fk_publisher_course_id` (`course_id`),
  KEY `publisher_courserun_changed_by_id_0daa399f_fk_core_user_id` (`changed_by_id`),
  KEY `publisher_courserun_video_language_id_438a310b_fk_ietf_lang` (`video_language_id`),
  KEY `publisher_courserun_language_id_3c952b29_fk_ietf_lang` (`language_id`),
  CONSTRAINT `publisher_courserun_changed_by_id_0daa399f_fk_core_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `publisher_courserun_course_id_22fea441_fk_publisher_course_id` FOREIGN KEY (`course_id`) REFERENCES `publisher_course` (`id`),
  CONSTRAINT `publisher_courserun_language_id_3c952b29_fk_ietf_lang` FOREIGN KEY (`language_id`) REFERENCES `ietf_language_tags_languagetag` (`code`),
  CONSTRAINT `publisher_courserun_video_language_id_438a310b_fk_ietf_lang` FOREIGN KEY (`video_language_id`) REFERENCES `ietf_language_tags_languagetag` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_courserun`
--

LOCK TABLES `publisher_courserun` WRITE;
/*!40000 ALTER TABLE `publisher_courserun` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_courserun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_courserun_sponsor`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_courserun_sponsor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courserun_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publisher_courserun_spon_courserun_id_organizatio_cf0f1156_uniq` (`courserun_id`,`organization_id`),
  KEY `publisher_courserun__organization_id_9b1a7daf_fk_course_me` (`organization_id`),
  CONSTRAINT `publisher_courserun__courserun_id_05a7e43f_fk_publisher` FOREIGN KEY (`courserun_id`) REFERENCES `publisher_courserun` (`id`),
  CONSTRAINT `publisher_courserun__organization_id_9b1a7daf_fk_course_me` FOREIGN KEY (`organization_id`) REFERENCES `course_metadata_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_courserun_sponsor`
--

LOCK TABLES `publisher_courserun_sponsor` WRITE;
/*!40000 ALTER TABLE `publisher_courserun_sponsor` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_courserun_sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_courserun_staff`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_courserun_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courserun_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `sort_value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publisher_courserun_staff_courserun_id_person_id_7465d23d_uniq` (`courserun_id`,`person_id`),
  KEY `publisher_courserun__person_id_36bc2c2e_fk_course_me` (`person_id`),
  CONSTRAINT `publisher_courserun__courserun_id_677a4e42_fk_publisher` FOREIGN KEY (`courserun_id`) REFERENCES `publisher_courserun` (`id`),
  CONSTRAINT `publisher_courserun__person_id_36bc2c2e_fk_course_me` FOREIGN KEY (`person_id`) REFERENCES `course_metadata_person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_courserun_staff`
--

LOCK TABLES `publisher_courserun_staff` WRITE;
/*!40000 ALTER TABLE `publisher_courserun_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_courserun_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_courserun_transcript_languages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_courserun_transcript_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courserun_id` int(11) NOT NULL,
  `languagetag_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publisher_courserun_tran_courserun_id_languagetag_d465e255_uniq` (`courserun_id`,`languagetag_id`),
  KEY `publisher_courserun__languagetag_id_83c343c5_fk_ietf_lang` (`languagetag_id`),
  CONSTRAINT `publisher_courserun__courserun_id_7ed48200_fk_publisher` FOREIGN KEY (`courserun_id`) REFERENCES `publisher_courserun` (`id`),
  CONSTRAINT `publisher_courserun__languagetag_id_83c343c5_fk_ietf_lang` FOREIGN KEY (`languagetag_id`) REFERENCES `ietf_language_tags_languagetag` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_courserun_transcript_languages`
--

LOCK TABLES `publisher_courserun_transcript_languages` WRITE;
/*!40000 ALTER TABLE `publisher_courserun_transcript_languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_courserun_transcript_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_courserunstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_courserunstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `approved_by_role` varchar(63) DEFAULT NULL,
  `owner_role` varchar(63) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_run_id` int(11) NOT NULL,
  `owner_role_modified` datetime(6),
  `preview_accepted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_run_id` (`course_run_id`),
  KEY `publisher_courserunstate_changed_by_id_1019b568_fk_core_user_id` (`changed_by_id`),
  CONSTRAINT `publisher_courseruns_course_run_id_59b3e874_fk_publisher` FOREIGN KEY (`course_run_id`) REFERENCES `publisher_courserun` (`id`),
  CONSTRAINT `publisher_courserunstate_changed_by_id_1019b568_fk_core_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_courserunstate`
--

LOCK TABLES `publisher_courserunstate` WRITE;
/*!40000 ALTER TABLE `publisher_courserunstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_courserunstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_coursestate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_coursestate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `approved_by_role` varchar(63) DEFAULT NULL,
  `owner_role` varchar(63) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `owner_role_modified` datetime(6),
  `marketing_reviewed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_id` (`course_id`),
  KEY `publisher_coursestate_changed_by_id_12c4608f_fk_core_user_id` (`changed_by_id`),
  CONSTRAINT `publisher_coursestate_changed_by_id_12c4608f_fk_core_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `publisher_coursestate_course_id_04fcf6b1_fk_publisher_course_id` FOREIGN KEY (`course_id`) REFERENCES `publisher_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_coursestate`
--

LOCK TABLES `publisher_coursestate` WRITE;
/*!40000 ALTER TABLE `publisher_coursestate` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_coursestate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_courseuserrole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_courseuserrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role` varchar(63) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publisher_courseuserrole_course_id_user_id_role_068460e0_uniq` (`course_id`,`user_id`,`role`),
  KEY `publisher_courseuserrole_changed_by_id_46a65762_fk_core_user_id` (`changed_by_id`),
  KEY `publisher_courseuserrole_user_id_c8f641f2_fk_core_user_id` (`user_id`),
  CONSTRAINT `publisher_courseuser_course_id_dae191cd_fk_publisher` FOREIGN KEY (`course_id`) REFERENCES `publisher_course` (`id`),
  CONSTRAINT `publisher_courseuserrole_changed_by_id_46a65762_fk_core_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `publisher_courseuserrole_user_id_c8f641f2_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_courseuserrole`
--

LOCK TABLES `publisher_courseuserrole` WRITE;
/*!40000 ALTER TABLE `publisher_courseuserrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_courseuserrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_historicalcourse`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_historicalcourse` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `short_description` longtext,
  `full_description` longtext,
  `expected_learnings` longtext,
  `syllabus` longtext,
  `prerequisites` longtext,
  `learner_testimonial` longtext,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `level_type_id` int(11) DEFAULT NULL,
  `primary_subject_id` int(11) DEFAULT NULL,
  `secondary_subject_id` int(11) DEFAULT NULL,
  `tertiary_subject_id` int(11) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `image` longtext,
  `is_seo_review` tinyint(1) NOT NULL,
  `faq` longtext,
  `video_link` varchar(200) DEFAULT NULL,
  `course_metadata_pk` int(10) unsigned DEFAULT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `publisher_historical_history_user_id_bdd76bd1_fk_core_user` (`history_user_id`),
  KEY `publisher_historicalcourse_id_56e1863b` (`id`),
  KEY `publisher_historicalcourse_level_type_id_bed3ee9f` (`level_type_id`),
  KEY `publisher_historicalcourse_primary_subject_id_58ca30f1` (`primary_subject_id`),
  KEY `publisher_historicalcourse_secondary_subject_id_63cac2f2` (`secondary_subject_id`),
  KEY `publisher_historicalcourse_tertiary_subject_id_c5a4abb5` (`tertiary_subject_id`),
  KEY `publisher_historicalcourse_changed_by_id_6fe99160` (`changed_by_id`),
  CONSTRAINT `publisher_historical_history_user_id_bdd76bd1_fk_core_user` FOREIGN KEY (`history_user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_historicalcourse`
--

LOCK TABLES `publisher_historicalcourse` WRITE;
/*!40000 ALTER TABLE `publisher_historicalcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_historicalcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_historicalcourserun`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_historicalcourserun` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `lms_course_id` varchar(255) DEFAULT NULL,
  `start` datetime(6) DEFAULT NULL,
  `end` datetime(6) DEFAULT NULL,
  `certificate_generation` datetime(6) DEFAULT NULL,
  `pacing_type` varchar(255) DEFAULT NULL,
  `min_effort` smallint(5) unsigned DEFAULT NULL,
  `max_effort` smallint(5) unsigned DEFAULT NULL,
  `length` int(10) unsigned DEFAULT NULL,
  `is_re_run` tinyint(1) NOT NULL,
  `is_xseries` tinyint(1) NOT NULL,
  `xseries_name` varchar(255) DEFAULT NULL,
  `is_micromasters` tinyint(1) NOT NULL,
  `micromasters_name` varchar(255) DEFAULT NULL,
  `contacted_partner_manager` tinyint(1) NOT NULL,
  `notes` longtext,
  `target_content` tinyint(1) NOT NULL,
  `priority` varchar(5) DEFAULT NULL,
  `course_team_admins` longtext,
  `course_team_additional_staff` longtext,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `language_id` varchar(50) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `video_language_id` varchar(50) DEFAULT NULL,
  `preview_url` varchar(200) DEFAULT NULL,
  `card_image_url` varchar(200) DEFAULT NULL,
  `is_professional_certificate` tinyint(1) NOT NULL,
  `professional_certificate_name` varchar(255) DEFAULT NULL,
  `short_description_override` varchar(255) DEFAULT NULL,
  `full_description_override` longtext,
  `title_override` varchar(255) DEFAULT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `publisher_historical_history_user_id_6ff8ac39_fk_core_user` (`history_user_id`),
  KEY `publisher_historicalcourserun_id_1a6dedf9` (`id`),
  KEY `publisher_historicalcourserun_lms_course_id_978594ce` (`lms_course_id`),
  KEY `publisher_historicalcourserun_pacing_type_fd25ba06` (`pacing_type`),
  KEY `publisher_historicalcourserun_course_id_c5fc83db` (`course_id`),
  KEY `publisher_historicalcourserun_language_id_82236cf5` (`language_id`),
  KEY `publisher_historicalcourserun_changed_by_id_02cff090` (`changed_by_id`),
  KEY `publisher_historicalcourserun_video_language_id_5fb44eb5` (`video_language_id`),
  CONSTRAINT `publisher_historical_history_user_id_6ff8ac39_fk_core_user` FOREIGN KEY (`history_user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_historicalcourserun`
--

LOCK TABLES `publisher_historicalcourserun` WRITE;
/*!40000 ALTER TABLE `publisher_historicalcourserun` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_historicalcourserun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_historicalcourserunstate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_historicalcourserunstate` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `approved_by_role` varchar(63) DEFAULT NULL,
  `owner_role` varchar(63) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_run_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `owner_role_modified` datetime(6) DEFAULT NULL,
  `preview_accepted` tinyint(1) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `publisher_historical_history_user_id_926abd86_fk_core_user` (`history_user_id`),
  KEY `publisher_historicalcourserunstate_id_219deb2d` (`id`),
  KEY `publisher_historicalcourserunstate_changed_by_id_751b5409` (`changed_by_id`),
  KEY `publisher_historicalcourserunstate_course_run_id_9191ac52` (`course_run_id`),
  CONSTRAINT `publisher_historical_history_user_id_926abd86_fk_core_user` FOREIGN KEY (`history_user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_historicalcourserunstate`
--

LOCK TABLES `publisher_historicalcourserunstate` WRITE;
/*!40000 ALTER TABLE `publisher_historicalcourserunstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_historicalcourserunstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_historicalcoursestate`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_historicalcoursestate` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `approved_by_role` varchar(63) DEFAULT NULL,
  `owner_role` varchar(63) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `owner_role_modified` datetime(6) DEFAULT NULL,
  `marketing_reviewed` tinyint(1) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `publisher_historical_history_user_id_6727a072_fk_core_user` (`history_user_id`),
  KEY `publisher_historicalcoursestate_id_200dfd52` (`id`),
  KEY `publisher_historicalcoursestate_changed_by_id_57a6c0e9` (`changed_by_id`),
  KEY `publisher_historicalcoursestate_course_id_35d6b682` (`course_id`),
  CONSTRAINT `publisher_historical_history_user_id_6727a072_fk_core_user` FOREIGN KEY (`history_user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_historicalcoursestate`
--

LOCK TABLES `publisher_historicalcoursestate` WRITE;
/*!40000 ALTER TABLE `publisher_historicalcoursestate` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_historicalcoursestate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_historicalcourseuserrole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_historicalcourseuserrole` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role` varchar(63) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `publisher_historical_history_user_id_5db9e098_fk_core_user` (`history_user_id`),
  KEY `publisher_historicalcourseuserrole_id_c7626158` (`id`),
  KEY `publisher_historicalcourseuserrole_changed_by_id_0417965f` (`changed_by_id`),
  KEY `publisher_historicalcourseuserrole_course_id_59b6c1a2` (`course_id`),
  KEY `publisher_historicalcourseuserrole_user_id_42ec15f7` (`user_id`),
  CONSTRAINT `publisher_historical_history_user_id_5db9e098_fk_core_user` FOREIGN KEY (`history_user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_historicalcourseuserrole`
--

LOCK TABLES `publisher_historicalcourseuserrole` WRITE;
/*!40000 ALTER TABLE `publisher_historicalcourseuserrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_historicalcourseuserrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_historicalorganizationextension`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_historicalorganizationextension` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `auto_create_in_studio` tinyint(1) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `publisher_historical_history_user_id_a946c96e_fk_core_user` (`history_user_id`),
  KEY `publisher_historicalorganizationextension_id_c1e73197` (`id`),
  KEY `publisher_historicalorganizationextension_group_id_7c9ee76b` (`group_id`),
  KEY `publisher_historicalorganiz_organization_id_3ffea141` (`organization_id`),
  CONSTRAINT `publisher_historical_history_user_id_a946c96e_fk_core_user` FOREIGN KEY (`history_user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_historicalorganizationextension`
--

LOCK TABLES `publisher_historicalorganizationextension` WRITE;
/*!40000 ALTER TABLE `publisher_historicalorganizationextension` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_historicalorganizationextension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_historicalorganizationuserrole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_historicalorganizationuserrole` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role` varchar(63) NOT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `publisher_historical_history_user_id_4b832541_fk_core_user` (`history_user_id`),
  KEY `publisher_historicalorganizationuserrole_id_aeff2251` (`id`),
  KEY `publisher_historicalorganiz_organization_id_4c5f9fbc` (`organization_id`),
  KEY `publisher_historicalorganizationuserrole_user_id_b35466d7` (`user_id`),
  CONSTRAINT `publisher_historical_history_user_id_4b832541_fk_core_user` FOREIGN KEY (`history_user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_historicalorganizationuserrole`
--

LOCK TABLES `publisher_historicalorganizationuserrole` WRITE;
/*!40000 ALTER TABLE `publisher_historicalorganizationuserrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_historicalorganizationuserrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_historicalseat`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_historicalseat` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `type` varchar(63) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `upgrade_deadline` datetime(6) DEFAULT NULL,
  `credit_provider` varchar(255) DEFAULT NULL,
  `credit_hours` int(11) DEFAULT NULL,
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `history_date` datetime(6) NOT NULL,
  `history_type` varchar(1) NOT NULL,
  `course_run_id` int(11) DEFAULT NULL,
  `currency_id` varchar(6) DEFAULT NULL,
  `history_user_id` int(11) DEFAULT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `credit_price` decimal(10,2) NOT NULL,
  `history_change_reason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `publisher_historical_history_user_id_9291493f_fk_core_user` (`history_user_id`),
  KEY `publisher_historicalseat_id_c22ce760` (`id`),
  KEY `publisher_historicalseat_course_run_id_ddae5629` (`course_run_id`),
  KEY `publisher_historicalseat_currency_id_5bd68dbe` (`currency_id`),
  KEY `publisher_historicalseat_changed_by_id_204b29d7` (`changed_by_id`),
  CONSTRAINT `publisher_historical_history_user_id_9291493f_fk_core_user` FOREIGN KEY (`history_user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_historicalseat`
--

LOCK TABLES `publisher_historicalseat` WRITE;
/*!40000 ALTER TABLE `publisher_historicalseat` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_historicalseat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_organizationextension`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_organizationextension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `group_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `auto_create_in_studio` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`),
  UNIQUE KEY `organization_id` (`organization_id`),
  CONSTRAINT `publisher_organizati_group_id_0ba2ef13_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `publisher_organizati_organization_id_18ffbcdb_fk_course_me` FOREIGN KEY (`organization_id`) REFERENCES `course_metadata_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_organizationextension`
--

LOCK TABLES `publisher_organizationextension` WRITE;
/*!40000 ALTER TABLE `publisher_organizationextension` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_organizationextension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_organizationuserrole`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_organizationuserrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `role` varchar(63) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publisher_organizationus_organization_id_user_id__04f8c35e_uniq` (`organization_id`,`user_id`,`role`),
  KEY `publisher_organizationuserrole_user_id_3d132769_fk_core_user_id` (`user_id`),
  CONSTRAINT `publisher_organizati_organization_id_e76b0138_fk_course_me` FOREIGN KEY (`organization_id`) REFERENCES `course_metadata_organization` (`id`),
  CONSTRAINT `publisher_organizationuserrole_user_id_3d132769_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_organizationuserrole`
--

LOCK TABLES `publisher_organizationuserrole` WRITE;
/*!40000 ALTER TABLE `publisher_organizationuserrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_organizationuserrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_seat`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_seat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `type` varchar(63) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `upgrade_deadline` datetime(6) DEFAULT NULL,
  `credit_provider` varchar(255) DEFAULT NULL,
  `credit_hours` int(11) DEFAULT NULL,
  `course_run_id` int(11) NOT NULL,
  `currency_id` varchar(6) NOT NULL,
  `changed_by_id` int(11) DEFAULT NULL,
  `credit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `publisher_seat_course_run_id_a695187e_fk_publisher_courserun_id` (`course_run_id`),
  KEY `publisher_seat_currency_id_69164d10_fk_core_currency_code` (`currency_id`),
  KEY `publisher_seat_changed_by_id_3f5b36c9_fk_core_user_id` (`changed_by_id`),
  CONSTRAINT `publisher_seat_changed_by_id_3f5b36c9_fk_core_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `core_user` (`id`),
  CONSTRAINT `publisher_seat_course_run_id_a695187e_fk_publisher_courserun_id` FOREIGN KEY (`course_run_id`) REFERENCES `publisher_courserun` (`id`),
  CONSTRAINT `publisher_seat_currency_id_69164d10_fk_core_currency_code` FOREIGN KEY (`currency_id`) REFERENCES `core_currency` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_seat`
--

LOCK TABLES `publisher_seat` WRITE;
/*!40000 ALTER TABLE `publisher_seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher_userattributes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher_userattributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `enable_email_notification` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `publisher_userattributes_user_id_a08c9c8b_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher_userattributes`
--

LOCK TABLES `publisher_userattributes` WRITE;
/*!40000 ALTER TABLE `publisher_userattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `publisher_userattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_core_user_id` (`user_id`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_tag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_taggeditem`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  KEY `taggit_taggeditem_content_type_id_object_id_196cc965_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `everyone` tinyint(1) DEFAULT NULL,
  `percent` decimal(3,1) DEFAULT NULL,
  `testing` tinyint(1) NOT NULL,
  `superusers` tinyint(1) NOT NULL,
  `staff` tinyint(1) NOT NULL,
  `authenticated` tinyint(1) NOT NULL,
  `languages` longtext NOT NULL,
  `rollout` tinyint(1) NOT NULL,
  `note` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `waffle_flag_created_4a6e8cef` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag`
--

LOCK TABLES `waffle_flag` WRITE;
/*!40000 ALTER TABLE `waffle_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag_groups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `waffle_flag_groups_flag_id_group_id_8ba0c71b_uniq` (`flag_id`,`group_id`),
  KEY `waffle_flag_groups_group_id_a97c4f66_fk_auth_group_id` (`group_id`),
  CONSTRAINT `waffle_flag_groups_flag_id_c11c0c05_fk_waffle_flag_id` FOREIGN KEY (`flag_id`) REFERENCES `waffle_flag` (`id`),
  CONSTRAINT `waffle_flag_groups_group_id_a97c4f66_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag_groups`
--

LOCK TABLES `waffle_flag_groups` WRITE;
/*!40000 ALTER TABLE `waffle_flag_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_flag_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_flag_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_flag_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `waffle_flag_users_flag_id_user_id_b46f76b0_uniq` (`flag_id`,`user_id`),
  KEY `waffle_flag_users_user_id_8026df9b_fk_core_user_id` (`user_id`),
  CONSTRAINT `waffle_flag_users_flag_id_833c37b0_fk_waffle_flag_id` FOREIGN KEY (`flag_id`) REFERENCES `waffle_flag` (`id`),
  CONSTRAINT `waffle_flag_users_user_id_8026df9b_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_flag_users`
--

LOCK TABLES `waffle_flag_users` WRITE;
/*!40000 ALTER TABLE `waffle_flag_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_flag_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_sample`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_sample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `percent` decimal(4,1) NOT NULL,
  `note` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `waffle_sample_created_76198bd5` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_sample`
--

LOCK TABLES `waffle_sample` WRITE;
/*!40000 ALTER TABLE `waffle_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `waffle_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waffle_switch`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waffle_switch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `note` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `waffle_switch_created_c004e77e` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waffle_switch`
--

LOCK TABLES `waffle_switch` WRITE;
/*!40000 ALTER TABLE `waffle_switch` DISABLE KEYS */;
INSERT INTO `waffle_switch` VALUES (1,'use_company_name_as_utm_source_value',0,'','2019-02-25 22:08:19.458983','2019-02-25 22:08:19.458994'),(2,'threaded_metadata_write',0,'','2019-02-25 22:08:22.685597','2019-02-25 22:08:22.685607'),(3,'parallel_refresh_pipeline',0,'','2019-02-25 22:08:22.687175','2019-02-25 22:08:22.687183'),(4,'publish_course_runs_to_marketing_site',0,'','2019-02-25 22:08:34.540864','2019-02-25 22:08:34.540873'),(5,'log_course_search_queries',0,'','2019-02-25 22:08:35.039236','2019-02-25 22:08:35.039247'),(6,'auto_course_about_page_creation',0,'','2019-02-25 22:08:35.855198','2019-02-25 22:08:35.855208'),(7,'publish_program_to_marketing_site',0,'','2019-02-25 22:08:43.381473','2019-02-25 22:08:43.381483'),(8,'enable_publisher_email_notifications',0,'','2019-02-25 22:08:58.674805','2019-02-25 22:08:58.674815'),(9,'publisher_hide_features_for_pilot',0,'','2019-02-25 22:09:02.890544','2019-02-25 22:09:02.890567'),(10,'publisher_add_instructor_feature',0,'','2019-02-25 22:09:03.358788','2019-02-25 22:09:03.358799'),(11,'publisher_comment_widget_feature',0,'','2019-02-25 22:09:04.779730','2019-02-25 22:09:04.779740'),(12,'publisher_history_widget_feature',0,'','2019-02-25 22:09:04.902208','2019-02-25 22:09:04.902219'),(13,'publisher_approval_widget_feature',0,'','2019-02-25 22:09:05.036570','2019-02-25 22:09:05.036579'),(14,'publish_person_to_marketing_site',0,'','2019-02-25 22:09:09.201086','2019-02-25 22:09:09.201096');
/*!40000 ALTER TABLE `waffle_switch` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-25 22:45:30
