-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: locationship.cv9rjerebvxh.ap-south-1.rds.amazonaws.com    Database: locationship
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedby` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'Rant Out','2023-06-11 18:59:39',1),(2,'Find An Investor','2023-06-11 18:59:39',1),(3,'Plan A Trip','2023-06-11 18:59:39',1);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buzz`
--

DROP TABLE IF EXISTS `buzz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buzz` (
  `id` int NOT NULL AUTO_INCREMENT,
  `senderid` int NOT NULL,
  `receiverid` int NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedby` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buzz`
--

LOCK TABLES `buzz` WRITE;
/*!40000 ALTER TABLE `buzz` DISABLE KEYS */;
INSERT INTO `buzz` VALUES (1,9,10,'2023-06-12 00:32:52',7),(2,7,8,'2023-06-12 00:33:06',7),(3,14,1,'2023-06-13 07:58:07',14),(4,14,1,'2023-06-13 08:00:35',14),(5,14,1,'2023-06-13 08:00:37',14),(6,14,1,'2023-06-13 08:00:45',14),(7,14,8,'2023-06-13 08:00:47',14),(8,14,1,'2023-06-13 08:00:49',14);
/*!40000 ALTER TABLE `buzz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendrequests`
--

DROP TABLE IF EXISTS `friendrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendrequests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `senderid` int NOT NULL,
  `receiverid` int NOT NULL,
  `requeststatus` int NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedby` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendrequests`
--

LOCK TABLES `friendrequests` WRITE;
/*!40000 ALTER TABLE `friendrequests` DISABLE KEYS */;
INSERT INTO `friendrequests` VALUES (18,1,14,0,'2023-06-13 10:42:29',14),(19,14,8,1,'2023-06-13 10:42:52',14),(20,28,1,0,'2023-06-13 19:27:44',28),(21,27,28,1,'2023-06-13 19:28:06',28),(22,30,1,0,'2023-06-13 20:49:41',30),(23,31,28,0,'2023-06-13 21:39:19',31),(24,33,30,0,'2023-06-13 21:54:56',33),(25,33,31,1,'2023-06-13 21:55:02',33),(26,33,28,0,'2023-06-13 21:59:24',33),(27,34,27,0,'2023-06-13 22:19:03',34),(28,34,30,0,'2023-06-13 22:19:05',34),(30,33,34,1,'2023-06-13 22:24:58',33),(31,34,28,0,'2023-06-13 22:28:01',34);
/*!40000 ALTER TABLE `friendrequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friends` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userone` int NOT NULL,
  `usertwo` int NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedby` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giftvouchers`
--

DROP TABLE IF EXISTS `giftvouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giftvouchers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` text NOT NULL,
  `name` text NOT NULL,
  `title` text NOT NULL,
  `company` text NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedby` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giftvouchers`
--

LOCK TABLES `giftvouchers` WRITE;
/*!40000 ALTER TABLE `giftvouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `giftvouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interests`
--

DROP TABLE IF EXISTS `interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedby` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests`
--

LOCK TABLES `interests` WRITE;
/*!40000 ALTER TABLE `interests` DISABLE KEYS */;
INSERT INTO `interests` VALUES (1,'art','2023-06-11 18:58:13',1),(2,'parenting','2023-06-11 18:58:13',1),(3,'real-estate','2023-06-11 18:58:36',1);
/*!40000 ALTER TABLE `interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `senderid` int NOT NULL,
  `receiverid` int NOT NULL,
  `message` longtext NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedby` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referralcodes`
--

DROP TABLE IF EXISTS `referralcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referralcodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` int NOT NULL,
  `userid` int NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedby` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referralcodes`
--

LOCK TABLES `referralcodes` WRITE;
/*!40000 ALTER TABLE `referralcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `referralcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useractivities`
--

DROP TABLE IF EXISTS `useractivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useractivities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `activity` text,
  `createdate` datetime NOT NULL,
  `updatedby` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useractivities`
--

LOCK TABLES `useractivities` WRITE;
/*!40000 ALTER TABLE `useractivities` DISABLE KEYS */;
INSERT INTO `useractivities` VALUES (2,14,'Find An Investor','2023-06-12 19:02:09',14),(3,1,'Find An Investor abcd','2023-06-12 19:03:04',14),(4,14,'Find An Investor AB','2023-06-12 19:04:34',14),(5,14,'Find An Investor AB','2023-06-13 13:36:47',14),(6,14,'Find An Investor AB','2023-06-13 13:37:39',14),(7,14,'Find An Investor AB','2023-06-13 13:38:06',14),(8,14,'Find An Investor AB','2023-06-13 13:38:32',14),(9,14,'Find An Investor AB','2023-06-13 14:22:37',14),(10,14,'Find An Investor AB','2023-06-13 14:22:57',14),(11,14,'Find An Investor to checkout stuff','2023-06-13 14:23:12',14),(12,14,'Plan A Trip','2023-06-13 14:23:24',14),(13,14,'Plan A Trip','2023-06-13 15:43:04',14),(14,14,'Plan A Trip','2023-06-13 15:44:06',14),(15,14,'Plan A Trip with someone','2023-06-13 15:44:13',14),(16,27,'','2023-06-13 17:30:13',27),(17,27,'Plan A Trip','2023-06-13 17:30:34',27),(18,28,'','2023-06-13 19:24:49',28),(19,28,'Watch a sunset!','2023-06-13 19:27:21',28),(20,28,'Watch a sunset!','2023-06-13 19:27:29',28),(21,30,'Plan A Trip','2023-06-13 20:48:50',30),(22,30,'Find An Investor','2023-06-13 21:33:10',30),(23,31,'Plan A Trip','2023-06-13 21:37:46',31),(24,33,'Let\'s play','2023-06-13 21:52:59',33),(25,34,'Let\'s party','2023-06-13 22:18:56',34),(26,34,'Let\'s party','2023-06-13 22:20:24',34),(27,34,'Find An Investor','2023-06-13 22:20:26',34),(28,35,'Find An Investor','2023-06-14 02:59:48',35),(29,27,'Plan A Trip','2023-06-14 18:05:05',27),(30,27,'Plan A Trip','2023-06-14 18:05:40',27),(31,35,'Find An Investor','2023-06-18 11:08:20',35),(32,33,'Let\'s play','2023-06-26 05:42:53',33),(33,33,'Let\'s play','2023-06-26 05:43:39',33),(34,33,'Let\'s play','2023-06-26 05:44:46',33),(35,33,'Let\'s play','2023-06-26 06:04:12',33);
/*!40000 ALTER TABLE `useractivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinterests`
--

DROP TABLE IF EXISTS `userinterests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinterests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `interestid` int NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedby` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinterests`
--

LOCK TABLES `userinterests` WRITE;
/*!40000 ALTER TABLE `userinterests` DISABLE KEYS */;
INSERT INTO `userinterests` VALUES (19,14,2,'2023-06-12 19:04:34',14),(20,1,3,'2023-06-12 19:04:34',14),(26,28,1,'2023-06-13 19:27:21',28),(27,28,2,'2023-06-13 19:27:21',28),(28,28,3,'2023-06-13 19:27:21',28),(29,30,2,'2023-06-13 20:48:50',30),(30,30,3,'2023-06-13 20:48:50',30),(31,31,2,'2023-06-13 21:37:46',31),(34,34,2,'2023-06-13 22:18:56',34),(35,34,3,'2023-06-13 22:18:56',34),(36,35,1,'2023-06-14 02:59:48',35),(37,27,2,'2023-06-14 18:05:05',27),(38,27,3,'2023-06-14 18:05:05',27),(66,33,1,'2023-06-26 06:04:12',33);
/*!40000 ALTER TABLE `userinterests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `phone` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `linkedin` text NOT NULL,
  `twitter` text NOT NULL,
  `instagram` text NOT NULL,
  `profilepicture` text NOT NULL,
  `about` text NOT NULL,
  `otp` int NOT NULL,
  `dateofbirth` text NOT NULL,
  `referralcode` varchar(100) NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (27,'Vijit Singhai','Vijit@parxlab.com','8305555566','','','','','','','This is me describing myself in just a hundred characters.',1234,'2022-02-02','','2023-06-13 16:33:07','1'),(28,'Sanchit  Singhai','Sanchit@gmail.com','8305555567','','','','','','','This is something really good about me in just and within 100 characters.',1234,'2022-03-02','','2023-06-13 19:07:53','1'),(30,'Prakshi Jain','Prakshi@gmail.com','8305555568','','','','','','','This is a short description about myself as good human who never asks for as nothing at all. ',1234,'2022-03-05','','2023-06-13 20:42:55','1'),(31,'Sapan Sharma','Sapan@gmail.com','8305555523','','','','','','','I am mostly into computers and stuff.  We can have a game session though! ',1234,'2022-02-02','','2023-06-13 21:35:47','1'),(33,'Alex Ron','Alex@gmail.com','8305555522','','','','','','','I like to play basketball a lot.  Huge fitness freak. Can play chess too.  Multi club member. ',1234,'2023-6-12','','2023-06-13 21:47:32','1'),(34,'Kinjal Gupta','Kinjal@gmail.com','8306666677','','','','','','','This is a song about somebody else, so don\'t hurt yourself, hurt yourself.',1234,'2023-6-1','','2023-06-13 22:17:45','1'),(35,'Ishaan Bansal','ishaan.bansal.29@gmail.com','9336833322','','','','','','','Small description done \n',1234,'1997-6-12','','2023-06-14 02:38:47','1'),(36,'','','9999988888','','','','','','userPhoto-1687762066831','',1234,'','','2023-06-25 20:37:48','1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucherredemptions`
--

DROP TABLE IF EXISTS `voucherredemptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucherredemptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `voucherid` int NOT NULL,
  `redemptiondate` text NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedby` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucherredemptions`
--

LOCK TABLES `voucherredemptions` WRITE;
/*!40000 ALTER TABLE `voucherredemptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucherredemptions` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-26 18:27:48
