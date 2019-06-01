-- MySQL dump 10.13  Distrib 8.0.13, for osx10.13 (x86_64)
--
-- Host: localhost    Database: tendu
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isGo` int(11) DEFAULT NULL,
  `isNeed` int(11) DEFAULT NULL,
  `info` text COLLATE utf8mb4_general_ci,
  `history` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,'四川职业技术学院',NULL,NULL,NULL,NULL,NULL),(2,'四川职业技术学院2',NULL,1,1,NULL,NULL),(4,'dfasdsdas',NULL,1,1,NULL,NULL),(5,'dwdad',NULL,0,1,NULL,NULL),(6,'asdas',NULL,1,1,NULL,'%3Cp%3Eawdawdawd%3C%2Fp%3E'),(7,'weweqe',NULL,1,1,'',NULL),(8,'eqweqweqwe',NULL,1,1,'%3Cp%3Eqweqwewqe%3C%2Fp%3E',NULL),(9,'qweqwe',NULL,1,1,'<p>qwewqewqweqw</p>',NULL),(10,'sfweerwer',NULL,1,1,'<p><em><span style=\"font-size: 20px;\"><strong>qweqweqwe</strong></span></em></p>',NULL);
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin',NULL,NULL,NULL,NULL,2),(6,'asdasd','sadad',1,'121312','2019-05-29 09:41:28',NULL,1),(7,'ttttttt','awdawd',1,'123123','2019-05-29 09:42:51',NULL,5),(8,'rdddd','123123',1,'65434535','2019-05-29 09:45:31',NULL,1),(9,'啊擦拭','21323424',1,'123123213','2019-05-29 10:51:52',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-01 15:51:50
