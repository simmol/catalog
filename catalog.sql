-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: catalog
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4-log

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'2011-05-11 12:01:39'),(2,'2011-05-11 12:00:39');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_lang`
--

DROP TABLE IF EXISTS `category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_lang` (
  `cid` int(11) NOT NULL,
  `lang` varchar(32) NOT NULL,
  `name` varchar(52) NOT NULL,
  PRIMARY KEY (`cid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_lang`
--

LOCK TABLES `category_lang` WRITE;
/*!40000 ALTER TABLE `category_lang` DISABLE KEYS */;
INSERT INTO `category_lang` VALUES (1,'bg','Филми'),(1,'en','Movies'),(2,'bg','Игри'),(2,'en','Games');
/*!40000 ALTER TABLE `category_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `scid` int(11) NOT NULL,
  `price` varchar(32) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,1,'10','2011-05-11 12:05:11','2011-05-11 12:05:11'),(2,1,2,'20','2011-05-11 12:06:17','2011-05-11 12:06:17'),(3,2,3,'15','2011-05-11 12:07:00','2011-05-11 12:07:00'),(4,2,4,'30.20','2011-05-11 12:06:59','2011-05-11 12:06:59');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_lang`
--

DROP TABLE IF EXISTS `product_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_lang` (
  `pid` int(11) NOT NULL,
  `lang` varchar(32) NOT NULL,
  `name` varchar(52) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`pid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_lang`
--

LOCK TABLES `product_lang` WRITE;
/*!40000 ALTER TABLE `product_lang` DISABLE KEYS */;
INSERT INTO `product_lang` VALUES (1,'bg','Тор','3D филм за Тор'),(1,'en','Thor','3D movie for Thor'),(2,'bg','Заглавие на Филм','Описание на филм'),(2,'en','Movie Title','Movie description'),(3,'bg','СтарКрафт','Три раси Протос, Теран и Зерг ...'),(3,'en','StarCraft','3 Races Protos, Teran, Zerg ...'),(4,'bg','Томб Райдър 4','Поредните приключения на Лара Крофт'),(4,'en','Tomb Raider 4','The next adventures of Lara Croft');
/*!40000 ALTER TABLE `product_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory` (
  `scid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`scid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,1),(2,1),(3,2),(4,2);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory_lang`
--

DROP TABLE IF EXISTS `subcategory_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory_lang` (
  `scid` int(11) NOT NULL,
  `lang` varchar(32) NOT NULL,
  `name` varchar(252) NOT NULL,
  PRIMARY KEY (`scid`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory_lang`
--

LOCK TABLES `subcategory_lang` WRITE;
/*!40000 ALTER TABLE `subcategory_lang` DISABLE KEYS */;
INSERT INTO `subcategory_lang` VALUES (1,'bg','Комедия'),(1,'en','Comedy'),(2,'bg','Екшън'),(2,'en','Action'),(3,'bg','Стратегия'),(3,'en','RTS'),(4,'bg','Приключенска'),(4,'en','Adventure');
/*!40000 ALTER TABLE `subcategory_lang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-05-17 11:48:20
