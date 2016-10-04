-- MySQL dump 10.13  Distrib 5.6.32-78.0, for Linux (x86_64)
--
-- Host: localhost    Database: u6120353_cabinet
-- ------------------------------------------------------
-- Server version	5.6.32-78.0

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `detail_text` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `articles_user_id_foreign` (`user_id`),
  CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Administrator'),(2,'3ocered');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2016_08_13_154539_create_groups_table',2),('2016_08_13_154921_create_user_groups_table',2),('2016_08_13_155429_users_informations_table',1),('2016_08_13_155523_rooms_table',3),('2016_08_13_155557_articles_table',3),('2016_08_18_130622_create_sessions_table',4),('2016_08_26_091103_created_options_table',5),('2016_08_26_150648_created_votes_table',6),('2016_08_26_152957_created_vote_option_table',7),('2016_08_27_102710_create_user_vote_table',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `options_text_unique` (`text`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (3,'Возможно'),(1,'да'),(2,'нет');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `area_all` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `area_summer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `floor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `porch` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `block` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,1,'126,2','40,5','1','1','A1',NULL,'2016-08-17 12:58:31'),(2,2,'95,2','52,8','1','1','A1',NULL,'2016-08-17 12:58:31'),(3,3,'95,0','51,9','1','1','A1',NULL,'2016-08-17 12:58:31'),(4,4,'94,1','52,8','1','1','A1',NULL,'2016-08-17 12:58:31'),(5,5,'130,7','37,1','1','1','A1',NULL,'2016-08-17 12:58:31'),(6,16,'130,7','37,1','1','2','A1',NULL,'2016-08-17 12:58:31'),(7,17,'94,1','52,8','1','2','A1',NULL,'2016-08-17 12:58:31'),(8,18,'95,0','51,9','1','2','A1',NULL,'2016-08-17 12:58:31'),(9,19,'95,2','52,8','1','2','A1',NULL,'2016-08-17 12:58:31'),(10,20,'126,2','40,5','1','2','A1',NULL,'2016-08-17 12:58:31'),(11,6,'106,4','12,4','2','1','A1',NULL,'2016-08-17 12:58:31'),(12,7,'55,9','4,65','2','1','A1',NULL,'2016-08-17 12:58:31'),(13,8,'55,2','4,65','2','1','A1',NULL,'2016-08-17 12:58:31'),(14,9,'55,6','4,3','2','1','A1',NULL,'2016-08-17 12:58:31'),(15,10,'112,1','9,5','2','1','A1',NULL,'2016-08-17 12:58:31'),(16,21,'112,1','9,5','2','2','A1',NULL,'2016-08-17 12:58:31'),(17,22,'55,6','4,3','2','2','A1',NULL,'2016-08-17 12:58:31'),(18,23,'55,2','4,65','2','2','A1',NULL,'2016-08-17 12:58:31'),(19,24,'55,9','4,65','2','2','A1',NULL,'2016-08-17 12:58:31'),(20,25,'123,3','15,9','2','2','A1',NULL,'2016-08-17 12:58:31'),(21,11,'106,3','15,9','3','1','A1',NULL,'2016-08-17 12:58:31'),(22,12,'55,8','4,65','3','1','A1',NULL,'2016-08-17 12:58:31'),(23,13,'54,7','4,65','3','1','A1',NULL,'2016-08-17 12:58:31'),(24,14,'55,5','4,3','3','1','A1',NULL,'2016-08-17 12:58:31'),(25,15,'112,1','9,5','3','1','A1',NULL,'2016-08-17 12:58:31'),(26,26,'112,1','9,5','3','2','A1',NULL,'2016-08-17 12:58:31'),(27,27,'55,5','4,3','3','2','A1',NULL,'2016-08-17 12:58:31'),(28,28,'54,7','4,65','3','2','A1',NULL,'2016-08-17 12:58:31'),(29,29,'55,8','4,65','3','2','A1',NULL,'2016-08-17 12:58:31'),(30,30,'123,3','15,9','3','2','A1',NULL,'2016-08-17 12:58:31'),(31,1,'126,2','40,5','1','1','A2',NULL,'2016-08-17 12:58:31'),(32,2,'95,2','52,8','1','1','A2',NULL,'2016-08-17 12:58:31'),(33,3,'95,0','51,9','1','1','A2',NULL,'2016-08-17 12:58:31'),(34,4,'94,1','52,8','1','1','A2',NULL,'2016-08-17 12:58:31'),(35,5,'130,7','37,1','1','1','A2',NULL,'2016-08-17 12:58:31'),(36,16,'130,7','37,1','1','2','A2',NULL,'2016-08-17 12:58:31'),(37,17,'94,1','52,8','1','2','A2',NULL,'2016-08-17 12:58:31'),(38,18,'95,0','51,9','1','2','A2',NULL,'2016-08-17 12:58:31'),(39,19,'55,3','10,8','1','2','A2',NULL,'2016-08-17 12:58:31'),(40,20,'95,7','8,2','1','2','A2',NULL,'2016-08-17 12:58:31'),(41,6,'106,4','12,4','2','1','A2',NULL,'2016-08-17 12:58:31'),(42,7,'55,9','4,65','2','1','A2',NULL,'2016-08-17 12:58:31'),(43,8,'55,2','4,65','2','1','A2',NULL,'2016-08-17 12:58:31'),(44,9,'55,6','4,3','2','1','A2',NULL,'2016-08-17 12:58:31'),(45,10,'112,1','9,5','2','1','A2',NULL,'2016-08-17 12:58:31'),(46,21,'112,1','9,5','2','2','A2',NULL,'2016-08-17 12:58:31'),(47,22,'55,6','4,3','2','2','A2',NULL,'2016-08-17 12:58:31'),(48,23,'55,2','4,65','2','2','A2',NULL,'2016-08-17 12:58:31'),(49,24,'55,9','4,65','2','2','A2',NULL,'2016-08-17 12:58:31'),(50,25,'123,3','15,9','2','2','A2',NULL,'2016-08-17 12:58:31'),(51,11,'106,3','15,9','3','1','A2',NULL,'2016-08-17 12:58:31'),(52,12,'55,8','4,65','3','1','A2',NULL,'2016-08-17 12:58:31'),(53,13,'54,7','4,65','3','1','A2',NULL,'2016-08-17 12:58:31'),(54,14,'55,5','4,3','3','1','A2',NULL,'2016-08-17 12:58:31'),(55,15,'112,1','9,5','3','1','A2',NULL,'2016-08-17 12:58:31'),(56,26,'112,1','9,5','3','2','A2',NULL,'2016-08-17 12:58:31'),(57,27,'55,5','4,3','3','2','A2',NULL,'2016-08-17 12:58:31'),(58,28,'54,7','4,65','3','2','A2',NULL,'2016-08-17 12:58:31'),(59,29,'55,8','4,65','3','2','A2',NULL,'2016-08-17 12:58:31'),(60,30,'123,3','15,9','3','2','A2',NULL,'2016-08-17 12:58:31'),(61,1,'118,5','31,0','1','1','A3',NULL,'2016-08-17 12:58:31'),(62,2,'95,2','52,8','1','1','A3',NULL,'2016-08-17 12:58:31'),(63,3,'95,0','51,9','1','1','A3',NULL,'2016-08-17 12:58:31'),(64,4,'94,1','52,8','1','1','A3',NULL,'2016-08-17 12:58:31'),(65,5,'130,7','37,1','1','1','A3',NULL,'2016-08-17 12:58:31'),(66,16,'130,7','37,1','1','2','A3',NULL,'2016-08-17 12:58:31'),(67,17,'94,1','52,8','1','2','A3',NULL,'2016-08-17 12:58:31'),(68,18,'95,0','51,9','1','2','A3',NULL,'2016-08-17 12:58:31'),(69,19,'55,3','10,8','1','2','A3',NULL,'2016-08-17 12:58:31'),(70,20,'156,8','52,9','1','2','A3',NULL,'2016-08-17 12:58:31'),(71,6,'123,3','15,9','2','1','A3',NULL,'2016-08-17 12:58:31'),(72,7,'55,9','4,65','2','1','A3',NULL,'2016-08-17 12:58:31'),(73,8,'55,2','4,65','2','1','A3',NULL,'2016-08-17 12:58:31'),(74,9,'55,6','4,3','2','1','A3',NULL,'2016-08-17 12:58:31'),(75,10,'112,1','9,5','2','1','A3',NULL,'2016-08-17 12:58:31'),(76,21,'112,1','9,5','2','2','A3',NULL,'2016-08-17 12:58:31'),(77,22,'55,6','4,3','2','2','A3',NULL,'2016-08-17 12:58:31'),(78,23,'55,2','4,65','2','2','A3',NULL,'2016-08-17 12:58:31'),(79,24,'55,9','4,65','2','2','A3',NULL,'2016-08-17 12:58:31'),(80,25,'125,4','14,8','2','2','A3',NULL,'2016-08-17 12:58:31'),(81,11,'123,2','15,9','3','1','A3',NULL,'2016-08-17 12:58:31'),(82,12,'55,8','4,65','3','1','A3',NULL,'2016-08-17 12:58:31'),(83,13,'55,1','4,65','3','1','A3',NULL,'2016-08-17 12:58:31'),(84,14,'55,5','4,3','3','1','A3',NULL,'2016-08-17 12:58:31'),(85,15,'112,1','9,5','3','1','A3',NULL,'2016-08-17 12:58:31'),(86,26,'112,1','9,5','3','2','A3',NULL,'2016-08-17 12:58:31'),(87,27,'55,5','4,3','3','2','A3',NULL,'2016-08-17 12:58:31'),(88,28,'55,1','4,65','3','2','A3',NULL,'2016-08-17 12:58:31'),(89,29,'55,8','4,65','3','2','A3',NULL,'2016-08-17 12:58:31'),(90,30,'125,3','14,8','3','2','A3',NULL,'2016-08-17 12:58:31'),(91,1,'126,2','40,5','1','1','A4',NULL,'2016-08-17 12:58:31'),(92,2,'95,2','52,8','1','1','A4',NULL,'2016-08-17 12:58:31'),(93,3,'95,0','51,9','1','1','A4',NULL,'2016-08-17 12:58:31'),(94,4,'94,1','52,8','1','1','A4',NULL,'2016-08-17 12:58:31'),(95,5,'130,7','37,1','1','1','A4',NULL,'2016-08-17 12:58:31'),(96,16,'130,7','37,1','1','2','A4',NULL,'2016-08-17 12:58:31'),(97,17,'94,1','52,8','1','2','A4',NULL,'2016-08-17 12:58:31'),(98,18,'95,0','51,9','1','2','A4',NULL,'2016-08-17 12:58:31'),(99,19,'95,2','52,8','1','2','A4',NULL,'2016-08-17 12:58:31'),(100,20,'126,2','40,5','1','2','A4',NULL,'2016-08-17 12:58:31'),(101,6,'106,4','12,4','2','1','A4',NULL,'2016-08-17 12:58:31'),(102,7,'55,9','4,65','2','1','A4',NULL,'2016-08-17 12:58:31'),(103,8,'55,2','4,65','2','1','A4',NULL,'2016-08-17 12:58:31'),(104,9,'55,6','4,3','2','1','A4',NULL,'2016-08-17 12:58:31'),(105,10,'112,1','9,5','2','1','A4',NULL,'2016-08-17 12:58:31'),(106,21,'112,1','9,5','2','2','A4',NULL,'2016-08-17 12:58:31'),(107,22,'55,6','4,3','2','2','A4',NULL,'2016-08-17 12:58:31'),(108,23,'55,2','4,65','2','2','A4',NULL,'2016-08-17 12:58:31'),(109,24,'55,9','4,65','2','2','A4',NULL,'2016-08-17 12:58:31'),(110,25,'123,3','15,9','2','2','A4',NULL,'2016-08-17 12:58:31'),(111,11,'106,3','15,9','3','1','A4',NULL,'2016-08-17 12:58:31'),(112,12,'55,8','4,65','3','1','A4',NULL,'2016-08-17 12:58:31'),(113,13,'54,7','4,65','3','1','A4',NULL,'2016-08-17 12:58:31'),(114,14,'55,5','4,3','3','1','A4',NULL,'2016-08-17 12:58:31'),(115,15,'112,1','9,5','3','1','A4',NULL,'2016-08-17 12:58:31'),(116,26,'112,1','9,5','3','2','A4',NULL,'2016-08-17 12:58:31'),(117,27,'55,5','4,3','3','2','A4',NULL,'2016-08-17 12:58:31'),(118,28,'54,7','4,65','3','2','A4',NULL,'2016-08-17 12:58:31'),(119,29,'55,8','4,65','3','2','A4',NULL,'2016-08-17 12:58:31'),(120,30,'123,3','15,9','3','2','A4',NULL,'2016-08-17 12:58:31'),(121,1,'126,2','40,5','1','1','B1',NULL,'2016-08-17 12:58:31'),(122,2,'95,2','52,8','1','1','B1',NULL,'2016-08-17 12:58:31'),(123,3,'95,0','51,9','1','1','B1',NULL,'2016-08-17 12:58:31'),(124,4,'94,1','52,8','1','1','B1',NULL,'2016-08-17 12:58:31'),(125,5,'130,7','37,1','1','1','B1',NULL,'2016-08-17 12:58:31'),(126,16,'130,7','37,1','1','2','B1',NULL,'2016-08-17 12:58:31'),(127,17,'94,1','52,8','1','2','B1',NULL,'2016-08-17 12:58:31'),(128,18,'95,0','51,9','1','2','B1',NULL,'2016-08-17 12:58:31'),(129,19,'95,2','52,8','1','2','B1',NULL,'2016-08-17 12:58:31'),(130,20,'126,2','40,5','1','2','B1',NULL,'2016-08-17 12:58:31'),(131,6,'123,3','15,9','2','1','B1',NULL,'2016-08-17 12:58:31'),(132,7,'55,9','4,65','2','1','B1',NULL,'2016-08-17 12:58:31'),(133,8,'55,2','4,7','2','1','B1',NULL,'2016-08-17 12:58:31'),(134,9,'55,6','4,3','2','1','B1',NULL,'2016-08-17 12:58:31'),(135,10,'112,1','9,5','2','1','B1',NULL,'2016-08-17 12:58:31'),(136,21,'112,1','9,5','2','2','B1',NULL,'2016-08-17 12:58:31'),(137,22,'55,6','4,3','2','2','B1',NULL,'2016-08-17 12:58:31'),(138,23,'55,2','4,7','2','2','B1',NULL,'2016-08-17 12:58:31'),(139,24,'55,9','4,65','2','2','B1',NULL,'2016-08-17 12:58:31'),(140,25,'123,3','15,9','2','2','B1',NULL,'2016-08-17 12:58:31'),(141,11,'123,1','15,9','3','1','B1',NULL,'2016-08-17 12:58:31'),(142,12,'55,8','4,65','3','1','B1',NULL,'2016-08-17 12:58:31'),(143,13,'54,7','4,7','3','1','B1',NULL,'2016-08-17 12:58:31'),(144,14,'55,5','4,3','3','1','B1',NULL,'2016-08-17 12:58:31'),(145,15,'112,1','9,5','3','1','B1',NULL,'2016-08-17 12:58:31'),(146,26,'112,1','9,5','3','2','B1',NULL,'2016-08-17 12:58:31'),(147,27,'55,5','4,3','3','2','B1',NULL,'2016-08-17 12:58:31'),(148,28,'54,7','4,7','3','2','B1',NULL,'2016-08-17 12:58:31'),(149,29,'55,8','4,65','3','2','B1',NULL,'2016-08-17 12:58:31'),(150,30,'123,1','15,9','3','2','B1',NULL,'2016-08-17 12:58:31'),(151,1,'126,2','40,5','1','1','B2',NULL,'2016-08-17 12:58:31'),(152,2,'95,2','52,8','1','1','B2',NULL,'2016-08-17 12:58:31'),(153,3,'95,0','51,9','1','1','B2',NULL,'2016-08-17 12:58:31'),(154,4,'94,1','52,8','1','1','B2',NULL,'2016-08-17 12:58:31'),(155,5,'130,7','37,1','1','1','B2',NULL,'2016-08-17 12:58:31'),(156,16,'130,7','37,1','1','2','B2',NULL,'2016-08-17 12:58:31'),(157,17,'94,1','52,8','1','2','B2',NULL,'2016-08-17 12:58:31'),(158,18,'95,2','51,0','1','2','B2',NULL,'2016-08-17 12:58:31'),(159,19,'55,3','10,8','1','2','B2',NULL,'2016-08-17 12:58:31'),(160,20,'95,7','8,2','1','2','B2',NULL,'2016-08-17 12:58:31'),(161,6,'123,3','15,9','2','1','B2',NULL,'2016-08-17 12:58:31'),(162,7,'55,9','4,65','2','1','B2',NULL,'2016-08-17 12:58:31'),(163,8,'55,2','4,7','2','1','B2',NULL,'2016-08-17 12:58:31'),(164,9,'55,6','4,3','2','1','B2',NULL,'2016-08-17 12:58:31'),(165,10,'112,1','9,5','2','1','B2',NULL,'2016-08-17 12:58:31'),(166,21,'112,1','9,5','2','2','B2',NULL,'2016-08-17 12:58:31'),(167,22,'55,6','4,3','2','2','B2',NULL,'2016-08-17 12:58:31'),(168,23,'55,2','4,7','2','2','B2',NULL,'2016-08-17 12:58:31'),(169,24,'55,9','4,65','2','2','B2',NULL,'2016-08-17 12:58:31'),(170,25,'123,3','15,9','2','2','B2',NULL,'2016-08-17 12:58:31'),(171,11,'123,1','15,9','3','1','B2',NULL,'2016-08-17 12:58:31'),(172,12,'55,8','4,65','3','1','B2',NULL,'2016-08-17 12:58:31'),(173,13,'54,7','4,7','3','1','B2',NULL,'2016-08-17 12:58:31'),(174,14,'55,5','4,3','3','1','B2',NULL,'2016-08-17 12:58:31'),(175,15,'112,1','9,5','3','1','B2',NULL,'2016-08-17 12:58:31'),(176,26,'112,1','9,5','3','2','B2',NULL,'2016-08-17 12:58:31'),(177,27,'55,5','4,3','3','2','B2',NULL,'2016-08-17 12:58:31'),(178,28,'54,7','4,7','3','2','B2',NULL,'2016-08-17 12:58:31'),(179,29,'55,8','4,65','3','2','B2',NULL,'2016-08-17 12:58:31'),(180,30,'123,1','15,9','3','2','B2',NULL,'2016-08-17 12:58:31'),(181,1,'126,2','40,5','1','1','B3',NULL,'2016-08-17 12:58:31'),(182,2,'95,2','52,8','1','1','B3',NULL,'2016-08-17 12:58:31'),(183,3,'95,0','51,9','1','1','B3',NULL,'2016-08-17 12:58:31'),(184,4,'94,1','52,8','1','1','B3',NULL,'2016-08-17 12:58:31'),(185,5,'130,7','37,1','1','1','B3',NULL,'2016-08-17 12:58:31'),(186,16,'130,7','37,1','1','2','B3',NULL,'2016-08-17 12:58:31'),(187,17,'94,1','52,8','1','2','B3',NULL,'2016-08-17 12:58:31'),(188,18,'95,2','51,0','1','2','B3',NULL,'2016-08-17 12:58:31'),(189,19,'82,4','8,2','1','2','B3',NULL,'2016-08-17 12:58:31'),(190,20,'95,7','8,2','1','2','B3',NULL,'2016-08-17 12:58:31'),(191,6,'123,3','15,9','2','1','B3',NULL,'2016-08-17 12:58:31'),(192,7,'55,9','4,65','2','1','B3',NULL,'2016-08-17 12:58:31'),(193,8,'55,2','4,7','2','1','B3',NULL,'2016-08-17 12:58:31'),(194,9,'55,6','4,3','2','1','B3',NULL,'2016-08-17 12:58:31'),(195,10,'112,1','9,5','2','1','B3',NULL,'2016-08-17 12:58:31'),(196,21,'112,1','9,5','2','2','B3',NULL,'2016-08-17 12:58:31'),(197,22,'55,6','4,3','2','2','B3',NULL,'2016-08-17 12:58:31'),(198,23,'55,2','4,7','2','2','B3',NULL,'2016-08-17 12:58:31'),(199,24,'55,9','4,65','2','2','B3',NULL,'2016-08-17 12:58:31'),(200,25,'123,3','15,9','2','2','B3',NULL,'2016-08-17 12:58:31'),(201,11,'123,1','15,9','3','1','B3',NULL,'2016-08-17 12:58:31'),(202,12,'55,8','4,65','3','1','B3',NULL,'2016-08-17 12:58:31'),(203,13,'54,7','4,7','3','1','B3',NULL,'2016-08-17 12:58:31'),(204,14,'55,5','4,3','3','1','B3',NULL,'2016-08-17 12:58:31'),(205,15,'112,1','9,5','3','1','B3',NULL,'2016-08-17 12:58:31'),(206,26,'112,1','9,5','3','2','B3',NULL,'2016-08-17 12:58:31'),(207,27,'55,5','4,3','3','2','B3',NULL,'2016-08-17 12:58:31'),(208,28,'54,7','4,7','3','2','B3',NULL,'2016-08-17 12:58:31'),(209,29,'55,8','4,65','3','2','B3',NULL,'2016-08-17 12:58:31'),(210,30,'123,1','15,9','3','2','B3',NULL,'2016-08-17 12:58:31'),(211,1,'95,7','8,2','1','1','B4',NULL,'2016-08-17 12:58:31'),(212,2,'55,3','10,8','1','1','B4',NULL,'2016-08-17 12:58:31'),(213,3,'55,0','10,8','1','1','B4',NULL,'2016-08-17 12:58:31'),(214,4,'55,3','10,8','1','1','B4',NULL,'2016-08-17 12:58:31'),(215,5,'103,8','8,4','1','1','B4',NULL,'2016-08-17 12:58:31'),(216,16,'103,8','8,4','1','2','B4',NULL,'2016-08-17 12:58:31'),(217,17,'55,3','10,8','1','2','B4',NULL,'2016-08-17 12:58:31'),(218,18,'55,0','10,8','1','2','B4',NULL,'2016-08-17 12:58:31'),(219,19,'55,3','10,8','1','2','B4',NULL,'2016-08-17 12:58:31'),(220,20,'95,7','8,2','1','2','B4',NULL,'2016-08-17 12:58:31'),(221,6,'123,3','15,9','2','1','B4',NULL,'2016-08-17 12:58:31'),(222,7,'55,9','4,65','2','1','B4',NULL,'2016-08-17 12:58:31'),(223,8,'55,2','4,7','2','1','B4',NULL,'2016-08-17 12:58:31'),(224,9,'55,6','4,3','2','1','B4',NULL,'2016-08-17 12:58:31'),(225,10,'112,1','9,5','2','1','B4',NULL,'2016-08-17 12:58:31'),(226,21,'112,1','9,5','2','2','B4',NULL,'2016-08-17 12:58:31'),(227,22,'55,6','4,3','2','2','B4',NULL,'2016-08-17 12:58:31'),(228,23,'55,2','4,7','2','2','B4',NULL,'2016-08-17 12:58:31'),(229,24,'55,9','4,65','2','2','B4',NULL,'2016-08-17 12:58:31'),(230,25,'123,3','15,9','2','2','B4',NULL,'2016-08-17 12:58:31'),(231,11,'123,1','15,9','3','1','B4',NULL,'2016-08-17 12:58:31'),(232,12,'55,8','4,65','3','1','B4',NULL,'2016-08-17 12:58:31'),(233,13,'54,7','4,7','3','1','B4',NULL,'2016-08-17 12:58:31'),(234,14,'55,5','4,3','3','1','B4',NULL,'2016-08-17 12:58:31'),(235,15,'112,1','9,5','3','1','B4',NULL,'2016-08-17 12:58:31'),(236,26,'112,1','9,5','3','2','B4',NULL,'2016-08-17 12:58:31'),(237,27,'55,5','4,3','3','2','B4',NULL,'2016-08-17 12:58:31'),(238,28,'54,7','4,7','3','2','B4',NULL,'2016-08-17 12:58:31'),(239,29,'55,8','4,65','3','2','B4',NULL,'2016-08-17 12:58:31'),(240,30,'123,1','15,9','3','2','B4',NULL,'2016-08-17 12:58:31'),(241,1,'95,9','8,4','1','1','G1',NULL,'2016-08-17 12:58:31'),(242,2,'98,2','53,8','1','1','G1',NULL,'2016-08-17 12:58:31'),(243,3,'98,2','54,0','1','1','G1',NULL,'2016-08-17 12:58:31'),(244,4,'98,4','54,0','1','1','G1',NULL,'2016-08-17 12:58:31'),(245,5,'133,4','47,9','1','1','G1',NULL,'2016-08-17 12:58:31'),(246,6,'122,6','16,2','2','1','G1',NULL,'2016-08-17 12:58:31'),(247,7,'55,8','4,6','2','1','G1',NULL,'2016-08-17 12:58:31'),(248,8,'55,2','4,6','2','1','G1',NULL,'2016-08-17 12:58:31'),(249,9,'55,2','4,2','2','1','G1',NULL,'2016-08-17 12:58:31'),(250,10,'101,8','12,0','2','1','G1',NULL,'2016-08-17 12:58:31'),(251,11,'122,5','16,2','3','1','G1',NULL,'2016-08-17 12:58:31'),(252,12,'55,7','4,6','3','1','G1',NULL,'2016-08-17 12:58:31'),(253,13,'55,1','4,6','3','1','G1',NULL,'2016-08-17 12:58:31'),(254,14,'55,1','4,2','3','1','G1',NULL,'2016-08-17 12:58:31'),(255,15,'101,8','12,0','3','1','G1',NULL,'2016-08-17 12:58:31'),(256,1,'123,4','48,5','1','1','G2',NULL,'2016-08-17 12:58:31'),(257,2,'98,2','53,8','1','1','G2',NULL,'2016-08-17 12:58:31'),(258,3,'98,2','54,0','1','1','G2',NULL,'2016-08-17 12:58:31'),(259,4,'98,4','54,0','1','1','G2',NULL,'2016-08-17 12:58:31'),(260,5,'133,4','47,9','1','1','G2',NULL,'2016-08-17 12:58:31'),(261,6,'122,6','16,2','2','1','G2',NULL,'2016-08-17 12:58:31'),(262,7,'55,8','4,6','2','1','G2',NULL,'2016-08-17 12:58:31'),(263,8,'55,2','4,6','2','1','G2',NULL,'2016-08-17 12:58:31'),(264,9,'55,2','4,2','2','1','G2',NULL,'2016-08-17 12:58:31'),(265,10,'101,8','12,0','2','1','G2',NULL,'2016-08-17 12:58:31'),(266,11,'122,5','16,2','3','1','G2',NULL,'2016-08-17 12:58:31'),(267,12,'55,7','4,6','3','1','G2',NULL,'2016-08-17 12:58:31'),(268,13,'55,1','4,6','3','1','G2',NULL,'2016-08-17 12:58:31'),(269,14,'55,1','4,2','3','1','G2',NULL,'2016-08-17 12:58:31'),(270,15,'101,8','12,0','3','1','G2',NULL,'2016-08-17 12:58:31'),(271,1,'95,9','8,4','1','1','G3',NULL,'2016-08-17 12:58:31'),(272,2,'55,3','10,8','1','1','G3',NULL,'2016-08-17 12:58:31'),(273,3,'55,0','10,8','1','1','G3',NULL,'2016-08-17 12:58:31'),(274,4,'55,3','10,8','1','1','G3',NULL,'2016-08-17 12:58:31'),(275,5,'95,0','9,5','1','1','G3',NULL,'2016-08-17 12:58:31'),(276,6,'122,6','16,2','2','1','G3',NULL,'2016-08-17 12:58:31'),(277,7,'55,8','4,6','2','1','G3',NULL,'2016-08-17 12:58:31'),(278,8,'55,2','4,6','2','1','G3',NULL,'2016-08-17 12:58:31'),(279,9,'55,2','4,2','2','1','G3',NULL,'2016-08-17 12:58:31'),(280,10,'101,8','12,0','2','1','G3',NULL,'2016-08-17 12:58:31'),(281,11,'122,5','16,2','3','1','G3',NULL,'2016-08-17 12:58:31'),(282,12,'55,7','4,6','3','1','G3',NULL,'2016-08-17 12:58:31'),(283,13,'55,1','4,6','3','1','G3',NULL,'2016-08-17 12:58:31'),(284,14,'55,1','4,2','3','1','G3',NULL,'2016-08-17 12:58:31'),(285,15,'101,8','12,0','3','1','G3',NULL,'2016-08-17 12:58:31'),(286,1,'79,8','7,7','1','1','G4',NULL,'2016-08-17 12:58:31'),(287,2,'55,3','10,8','1','1','G4',NULL,'2016-08-17 12:58:31'),(288,3,'55,0','10,8','1','1','G4',NULL,'2016-08-17 12:58:31'),(289,4,'55,3','10,8','1','1','G4',NULL,'2016-08-17 12:58:31'),(290,5,'95,9','8,4','1','1','G4',NULL,'2016-08-17 12:58:31'),(291,6,'86,7','10,4','2','1','G4',NULL,'2016-08-17 12:58:31'),(292,7,'55,2','4,2','2','1','G4',NULL,'2016-08-17 12:58:31'),(293,8,'55,2','4,6','2','1','G4',NULL,'2016-08-17 12:58:31'),(294,9,'55,8','4,6','2','1','G4',NULL,'2016-08-17 12:58:31'),(295,10,'122,6','16,2','2','1','G4',NULL,'2016-08-17 12:58:31'),(296,11,'86,7','10,4','3','1','G4',NULL,'2016-08-17 12:58:31'),(297,12,'55,1','4,2','3','1','G4',NULL,'2016-08-17 12:58:31'),(298,13,'55,1','4,6','3','1','G4',NULL,'2016-08-17 12:58:31'),(299,14,'55,7','4,6','3','1','G4',NULL,'2016-08-17 12:58:31'),(300,15,'122,6','16,2','3','1','G4',NULL,'2016-08-17 12:58:31'),(301,500,'122,6','16,2','3','1','A1','0000-00-00 00:00:00','2016-08-17 12:58:31');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0707cafed6bf68e4299e19764727d245b2eaecdc',NULL,'68.180.228.165','Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSDduRkh4TTRob0o1SzZHamxFenZnTjliOFhPTnQ0UDZnamJXV0ZXcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1L3Bhc3N3b3JkL2VtYWlsIjt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUwNjQ3Njc7czoxOiJjIjtpOjE0NzUwNjQ3Njc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475064767),('08dff84bdc6b2a86bd40bfc8a9358aa887bc2963',NULL,'40.77.167.95','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN2xWZWRMTHdKYUdrQVVTVFZ5Z1l1N0RjUk9vSjRmenoxRzNPVFpXdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzQ4MzE5Nzg7czoxOiJjIjtpOjE0NzQ4MzE5Nzg7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1474831978),('13c017da39bde09e8494cdbd815ee93d96ddcf2b',NULL,'66.249.76.17','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOEozYU5SOWc5Y0p1OThqUkhwb2lUdFo5SjM1VkhjODk5YmQ5ZWFVciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUzNTI1NjA7czoxOiJjIjtpOjE0NzUzNTI1NjA7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475352560),('1441018d6d618896f51a983e12d624dfdaad9639',NULL,'66.249.76.15','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaGNCRVpUMGRNNUhWc1RVajdmZFliSEFNSW1SbTRHbFNRdkpCcUZuYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzQ4OTU4NjY7czoxOiJjIjtpOjE0NzQ4OTU4NjY7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1474895866),('15cbeb52b4f50ee1ceece98a47efbf89db62c552',NULL,'180.76.15.32','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUTBRaGxzeWI0c2g3d0xZa21SazZ5b1FManlsYnlKMmRCR3pGTGIwYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1L3Bhc3N3b3JkL2VtYWlsIjt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUzOTAwNzI7czoxOiJjIjtpOjE0NzUzOTAwNzI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475390072),('1b4374d711a9a407975eafc0f59b7945d1f370cf',NULL,'109.188.124.61','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSGdUenRmMTBRaW95eVdZeEtlWTBFckJXU2Z4R05LMzJibnJZc3BLOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzU0OTI2Nzk7czoxOiJjIjtpOjE0NzU0OTI2Nzk7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475492679),('1deb590905ad743a4a55c7e9261059e297c28f84',NULL,'46.63.50.71','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoibTZvQlphYjAyTEJjckN3S3VsYjZWMTRUZ1NxYTY5cm8xeEk5ZUFwTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUwNjU0MDA7czoxOiJjIjtpOjE0NzUwNjU0MDA7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475065400),('2e0ca3ab37f2f0aaac43ba6687bc59141cd6fd46',NULL,'180.76.15.148','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYTBTWUJtUXFSQjBoUGFDMng1RmxjZjRUZ090eVBOSjl5S01uN0RleCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUzNTE1NTA7czoxOiJjIjtpOjE0NzUzNTE1NTA7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475351550),('32ce5699d0f0bbfb2cff1155f2ed64a38c5bebf0',NULL,'69.30.210.242','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTDlrYTVIQ0t2dnVpNE9WZjR4OHFiTVNYZUd3SlJSSVhqYTh3S0xhTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzQ5NzQyNDM7czoxOiJjIjtpOjE0NzQ5NzQyNDM7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1474974243),('359e8e55bde1e9cda7068649e94444aeb9d6337e',NULL,'188.170.202.13','Mozilla/5.0 (iPad; CPU OS 9_3_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13F69 Safari/601.1','YTo0OntzOjY6Il90b2tlbiI7czo0MDoicWdxY2FaSVZrQkM0RzBtWXQ3VEJOZ1NDczJMbXdKYlZWSzBKdVBQNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQ3NDc4NDQ3NTtzOjE6ImMiO2k6MTQ3NDc4NDQ2NTtzOjE6ImwiO3M6MToiMCI7fX0=',1474784475),('3d1999616bf2c4073b90a4433cec61f51eea1160',10,'82.145.221.61','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36 OPR/40.0.2308.62','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRDlyajZYa2Z2UGxxYVRNVk5WSmNCdlJpYkJsVWxGbDllMVJleFVhcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1L2NhYmluZXQiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEwO3M6OToiX3NmMl9tZXRhIjthOjM6e3M6MToidSI7aToxNDc0OTkxNzIwO3M6MToiYyI7aToxNDc0OTkxNjU2O3M6MToibCI7czoxOiIwIjt9fQ==',1474991720),('3ec83263ab3874238375f28ec9fd876b618b1344',NULL,'185.15.63.4','Mozilla/5.0 (iPad; CPU OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTVd4SThwaVQ3NVF1dlNNcXhMMmZQcGpxdTJWVkFudXpoSHFDUkg3TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUxMzc4MjY7czoxOiJjIjtpOjE0NzUxMzc4MjY7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475137826),('4f9ae8817c9094d0895a2538700a8f96584a80fc',NULL,'91.210.230.8','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 YaBrowser/16.9.1.1192 Yowser/2.5 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMEhwWmVPajlUVmV5clNxd0dvb0lkNEVhVjlyWVduZkV5eDk0WEdteiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQ3NTA2MzQ3MztzOjE6ImMiO2k6MTQ3NTA2MjY0MjtzOjE6ImwiO3M6MToiMCI7fX0=',1475063473),('58fb800092d49bb81d1004e449757994fa88630a',NULL,'91.210.24.232','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUWUzYVhiSWlVY2Z3VURpZkNTN0NJNXBUaEtNRG5QNHNvZWlGU0NyeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQ3NTMwODYwNTtzOjE6ImMiO2k6MTQ3NTMwNTY1MjtzOjE6ImwiO3M6MToiMCI7fX0=',1475308605),('5bb0dba0a103564d21c4fc047abbc2c74260b1af',NULL,'91.210.230.8','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 YaBrowser/16.9.1.1192 Yowser/2.5 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVWcyVEJzS3FEWWpmdE11VXZ6Z1BMakRmNk1FdjFvSER6S01HYWp3dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUxNDMzMzI7czoxOiJjIjtpOjE0NzUxNDMzMzI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475143332),('5fe5305e997d8914f053e09b8ec3ca453f3561a7',NULL,'66.249.76.17','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiczB0aWIyUHpnYk5QYWhDMUtHT2g5Uzk2NGpoYnE3TGV2TjFHbjdHTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzQ4MzQxNTc7czoxOiJjIjtpOjE0NzQ4MzQxNTc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1474834157),('66f51ef6659c7b0572fc5894aa059813fd378226',NULL,'66.249.66.50','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWVJqbFhhaHZFTjNmekNWS1lGM0NkTVM1NDE0N1gxdlZEeE1GOHR2MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1L3Bhc3N3b3JkL2VtYWlsIjt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUzMzI0MzM7czoxOiJjIjtpOjE0NzUzMzI0MzM7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475332433),('6a58ab00d243f03accb71b4551874b4265e6551d',NULL,'95.159.149.199','Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS2RDZXVsaDh5YVpDdFdpbDJSODY4U2RJY1UwOHdLZnZhU0xreVgxWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzQ4NDAyMTU7czoxOiJjIjtpOjE0NzQ4NDAyMTU7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1474840215),('70ec036abc79293c7eb2d5adb28540a58401a29e',NULL,'109.235.189.218','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36 OPR/39.0.2256.71','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiV0t4Z3ZVeEFndGJUZDZDSHpoeExzekNKQTFUQk5LVUd3WGdtYWRyZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQ3NDg4MTE5NztzOjE6ImMiO2k6MTQ3NDg4MTAwNjtzOjE6ImwiO3M6MToiMCI7fX0=',1474881197),('76e9832fff8c29faf5546f30a347104699c04844',NULL,'185.15.63.4','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoidlhHcmxVUXp2a28zTURQRU0wU3ZFTVAwTEZZaFJGZnJUa24wYmpXbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUwMTA1NjQ7czoxOiJjIjtpOjE0NzUwMTA1NjQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475010565),('7975b9df6488d7db44ebef680bb3d4225dce350e',NULL,'109.162.15.183','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVnlTRGZCeVdxSGZrZ2IyU2NMNTNaWUlVaTJuQ3lVUFhiaGlkNXVxUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzU1Nzk3ODM7czoxOiJjIjtpOjE0NzU1Nzk3ODM7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475579783),('870662d9c440b40efca3fba8287549bc3e5dc9f7',NULL,'46.159.194.83','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoidWdlR25XRHczc3ZBNTRQYXNyWlJVWUhsTHB1S2xpN1BVV0tCZTlmUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUwNjcyOTU7czoxOiJjIjtpOjE0NzUwNjcyOTU7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475067295),('9e388f0156e9292e0e1bbda1a59d326741ffb386',NULL,'109.235.189.60','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoidnowVTlseE5mODk1NWc4QWR1MWJtOEtEaGZEZkNQcVE2YlI4WTB6TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUxMzUwMzQ7czoxOiJjIjtpOjE0NzUxMzUwMzQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475135035),('b4e2fe13f80edd0d76782a452bf863b586041c3e',NULL,'93.92.178.91','Mozilla/5.0 (Linux; Android 4.1.2; GT-N8000 Build/JZO54K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.124 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWnR5ZTBvMHFPc2FaSkpmMUYxcEFZa0p0WnNvdlc2WThKV3FXWTFQZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQ3NTM0NDI5MTtzOjE6ImMiO2k6MTQ3NTM0NDEyNTtzOjE6ImwiO3M6MToiMCI7fX0=',1475344291),('b6fc095e9384272e5ab361249c5725a6bcb8772f',NULL,'109.235.189.60','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZURDVEpqN3hlUk0xbDBGMHkzM0FNSXVDZEEybnhvZFJIRGt3elI1MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUwNzMzNzQ7czoxOiJjIjtpOjE0NzUwNzMzNzQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475073374),('b84e692a3e8458374c1a6d2d4da118d08fd58306',NULL,'109.235.189.218','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36 OPR/40.0.2308.62','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSk1TT2IxbW40cmlFZHVQemtHSUZ5SWhTN1pFYmxzZW5CRHlJUktsZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQ3NTU4OTA0OTtzOjE6ImMiO2k6MTQ3NTU2MjQ4MztzOjE6ImwiO3M6MToiMCI7fX0=',1475589049),('ba1e84c0cbac24756e73455d9a803a93aef493d5',NULL,'130.193.51.2','Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTmg2aGFJYnRlZDBkZlBqRHJRdHNTNHFTS0NUR1B3ZEoxd2xxaDhWSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1L3Bhc3N3b3JkL2VtYWlsIjt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzQ4MTEyNjc7czoxOiJjIjtpOjE0NzQ4MTEyNjc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1474811267),('bef9a8701f79161730fbb927c20f887db181999d',NULL,'91.210.24.232','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoid2ZoMFF2Vk9NMXhMZENvUHBKNDh1amtuUkEwaFFqdmZSUW5vekszZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzU0MTIzODc7czoxOiJjIjtpOjE0NzU0MTIzODc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475412387),('c79680bdc72c13ab6ea40fd0a1a65bddae8f9fec',NULL,'91.210.25.193','Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRjRoWHBOeXkySTVsZHh3YnQ0dmVGaUJyd2xjVDR1TUVKV3pneTFIZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzU1NjI3NjY7czoxOiJjIjtpOjE0NzU1NjI3NjY7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475562766),('cbd710eab0ccda5ce6acd8daccb9af4f1b8a2cb8',NULL,'180.76.15.22','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSFFQeFRlN0ZCeUNPRXRNb1gyYUZGSDVad01IV2FIOXFyTklxR1h3cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzQ5ODY1MTk7czoxOiJjIjtpOjE0NzQ5ODY1MTk7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1474986519),('cdb4d7b678116900845d816287abd4ea54629c1c',NULL,'95.84.192.107','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSmFTQlNTWGdmanVsS2xvMTRiMTZWY1NFWExhSDhNc2RmWlM0NHdCRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUwNjg1ODE7czoxOiJjIjtpOjE0NzUwNjg1ODE7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475068581),('cf9f7279c49c7cdc2934101beb1a643468629d3e',NULL,'66.249.76.17','Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaFdFdzljTnNPZUQxSllJaHdoS0ZhaVdLY3U5bDlwTUhITERpclRxQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUyOTE1MTQ7czoxOiJjIjtpOjE0NzUyOTE1MTQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475291514),('dc91c8bb5041f2a01207cab899df1210332d3c2a',NULL,'66.249.76.16','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRm9BZFdlWldONVU3ajk0ZnlMdFUyb1VqcXFpUE9UcTNVSHUyRUdSNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUwOTMzNTg7czoxOiJjIjtpOjE0NzUwOTMzNTg7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475093358),('e0dcf8defeb9b884c9d8ed8e57d87ff0f6b27b99',NULL,'180.76.15.144','Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYUtzaURma0hlQnBYOHlTSW1HMm8ybHc3d2Y5YUh1T3BsZUFFY0t2eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUzMDczNzI7czoxOiJjIjtpOjE0NzUzMDczNzI7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475307372),('e1cd4943e1cb5e2b68123f4861dba518fd8b9ad7',NULL,'66.249.76.15','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSlB2VXZIazdsNDJvcDZiMmtEbGEyU0ZmQW5KeEJ4U1owMDBSVk1CdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1L3Bhc3N3b3JkL2VtYWlsIjt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUzNTM0ODQ7czoxOiJjIjtpOjE0NzUzNTM0ODQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475353484),('e1f8aa22d63e46681619a5eec02137ff00ba2921',NULL,'109.235.189.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoibTFZcllyejF3ZDJyd083bGV6OVFVR09PR05yT2x4VVZjT3M3aGc3RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUyMzQ1MDc7czoxOiJjIjtpOjE0NzUyMzQ1MDc7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475234508),('e4bee35fef167d7ad457451e55d692638499eacd',NULL,'109.235.189.67','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVHZoWXpRcng4azdxRG9RMUN6WDdFTFZhN1JhY2JGZk0zT0NnRXBLZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzU1ODY3NzY7czoxOiJjIjtpOjE0NzU1ODY3NzY7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475586776),('eaeb7014074dd9caabac890407ed8d9440d35891',NULL,'66.249.66.47','Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTm1iNkdqN0h1ZVdxZTlRUFcyQlJHSUdqeUlsMG4yNDk5Q296WlN6VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzU0ODMxMzA7czoxOiJjIjtpOjE0NzU0ODMxMzA7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475483130),('ee65d1d10a1c205e07bb7f191a9c91824f1e31fb',NULL,'46.4.120.3','Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUjVEVmpXWmVGZEF5SEhsVUxDQVVmdE56N25wVG1seWl6ckN3UXJ0YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1L3Bhc3N3b3JkL2VtYWlsIjt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUzMjc1MzQ7czoxOiJjIjtpOjE0NzUzMjc1MzQ7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475327534),('f22d34f423c121cb4a79166e3f96394aece5da66',NULL,'95.108.225.221','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 YaBrowser/16.9.1.1192 Yowser/2.5 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoibTZGeGRzT0FhNFpkVkNFc0piU3E5YWU2emtNdm9DRXUyMmJzU084NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9jYWJpbmV0LmxhenVyYmVyLnJ1Ijt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0NzUzNDkzMTk7czoxOiJjIjtpOjE0NzUzNDkzMTk7czoxOiJsIjtzOjE6IjAiO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1475349319),('fee5a17c369a92a95aa07702b13fe750035f5552',NULL,'185.15.63.123','Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko','YTo1OntzOjY6Il90b2tlbiI7czo0MDoidEYxbElGWjdtM2RvMUNra0Vvb1d2eDFuUjJTZTdsbFFiRFBMZklIVCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMjoiaHR0cDovL2NhYmluZXQubGF6dXJiZXIucnUvYWRtaW4iO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozODoiaHR0cDovL2NhYmluZXQubGF6dXJiZXIucnUvYWRtaW4vbG9naW4iO31zOjU6ImZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3NmMl9tZXRhIjthOjM6e3M6MToidSI7aToxNDc1NTcxMTA1O3M6MToiYyI7aToxNDc1NTcxMDM4O3M6MToibCI7czoxOiIwIjt9fQ==',1475571105);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  KEY `user_groups_user_id_foreign` (`user_id`),
  KEY `user_groups_group_id_foreign` (`group_id`),
  CONSTRAINT `user_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `user_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,1),(10,2),(1,2);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_votes`
--

DROP TABLE IF EXISTS `user_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `vote_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_vote_user_id_foreign` (`user_id`),
  KEY `user_vote_vote_id_foreign` (`vote_id`),
  KEY `user_vote_option_id_foreign` (`option_id`),
  CONSTRAINT `user_vote_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`),
  CONSTRAINT `user_vote_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_vote_vote_id_foreign` FOREIGN KEY (`vote_id`) REFERENCES `votes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_votes`
--

LOCK TABLES `user_votes` WRITE;
/*!40000 ALTER TABLE `user_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','vizor@poiskovoeprodvigenie.ru','$2y$10$bX96N/uPY9u4pYvWbnUhtewskTGVQuRnSjS1NVvHdBQMJOYT1s0Pi','yjDAufNozibuZCVv2gbDrOaQ7R7L92UbrMtM1sxOrDiwoYb4mgiCZbDbwMmb','2016-08-13 14:20:41','2016-09-23 07:33:47'),(10,'','4ay4enko@gmail.com','$2y$10$VbhRxrIoe8X0quK/6rpLYO9rFiOrk.Lcvfhlnw8udtWFWmsi1AL4C','aTcY7L74iqj3IpRoyKFEd99JMSdwP45KKfPR94JZf0opsGJoLxpkTDCqwAyL','2016-09-23 07:11:25','2016-09-23 09:00:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_informations`
--

DROP TABLE IF EXISTS `users_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_informations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secondname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `room_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_informations_user_id_foreign` (`user_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `users_informations_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  CONSTRAINT `users_informations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_informations`
--

LOCK TABLES `users_informations` WRITE;
/*!40000 ALTER TABLE `users_informations` DISABLE KEYS */;
INSERT INTO `users_informations` VALUES (16,'Сергей','Чайченко','Николаевич','4ay4enko@gmail.com','','89185552289',10,6,'2016-09-21 18:06:33','2016-09-23 07:11:25'),(17,'Валерий','Казаков','Валериивич','vizor@poiskovoeprodvigenie.ru','','111111',1,301,'2016-09-23 07:21:29','2016-09-23 07:21:29');
/*!40000 ALTER TABLE `users_informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote_option`
--

DROP TABLE IF EXISTS `vote_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote_option` (
  `vote_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  KEY `vote_option_vote_id_foreign` (`vote_id`),
  KEY `vote_option_option_id_foreign` (`option_id`),
  CONSTRAINT `vote_option_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`),
  CONSTRAINT `vote_option_vote_id_foreign` FOREIGN KEY (`vote_id`) REFERENCES `votes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote_option`
--

LOCK TABLES `vote_option` WRITE;
/*!40000 ALTER TABLE `vote_option` DISABLE KEYS */;
INSERT INTO `vote_option` VALUES (4,1),(4,2);
/*!40000 ALTER TABLE `vote_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (4,'<p>Нужно ли вам больше парковочных мест?</p>\r\n','2016-09-23 07:30:41','2016-09-23 07:30:41');
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-04 17:03:58
