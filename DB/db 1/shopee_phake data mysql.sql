-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

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
-- Table structure for table `dbo.CART`
--

DROP TABLE IF EXISTS `dbo.CART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.CART` (
  `UNIQUE_NUMBER` tinyint(4) DEFAULT NULL,
  `UID` smallint(6) DEFAULT NULL,
  `PRODUCT_ID` varchar(4) DEFAULT NULL,
  `QUANTITY` varchar(4) DEFAULT NULL,
  `FLAG` tinyint(4) DEFAULT NULL,
  `CREATED_AT` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.CART`
--

LOCK TABLES `dbo.CART` WRITE;
/*!40000 ALTER TABLE `dbo.CART` DISABLE KEYS */;
INSERT INTO `dbo.CART` VALUES (1,1,'A002','2   ',1,'2022-05-21 19:38:07'),(2,1,'B001','3   ',1,'2022-05-21 19:38:07'),(3,1,'B002','1   ',1,'2022-05-21 19:38:07');
/*!40000 ALTER TABLE `dbo.CART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.CITY`
--

DROP TABLE IF EXISTS `dbo.CITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.CITY` (
  `UNIQUE_NUMBER` tinyint(4) DEFAULT NULL,
  `CODE` tinyint(4) DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `CREATED_AT` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.CITY`
--

LOCK TABLES `dbo.CITY` WRITE;
/*!40000 ALTER TABLE `dbo.CITY` DISABLE KEYS */;
INSERT INTO `dbo.CITY` VALUES (1,2,'T?nh Hà Giang                 ','2022-05-21 16:29:31'),(2,79,'Thành ph? H? Chí Minh         ','2022-05-21 16:29:31');
/*!40000 ALTER TABLE `dbo.CITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.MERCHANTS`
--

DROP TABLE IF EXISTS `dbo.MERCHANTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.MERCHANTS` (
  `UNIQUE_NUMBER` tinyint(4) DEFAULT NULL,
  `ID` smallint(6) DEFAULT NULL,
  `UID` varchar(5) DEFAULT NULL,
  `MER_NAME` varchar(30) DEFAULT NULL,
  `CITY_CODE` tinyint(4) DEFAULT NULL,
  `CREATED_AT` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.MERCHANTS`
--

LOCK TABLES `dbo.MERCHANTS` WRITE;
/*!40000 ALTER TABLE `dbo.MERCHANTS` DISABLE KEYS */;
INSERT INTO `dbo.MERCHANTS` VALUES (1,1,'0002 ','Tom Shop                      ',2,'2022-05-21 17:04:09'),(2,2,'0001 ','Min Shop                      ',79,'2022-05-21 17:04:09');
/*!40000 ALTER TABLE `dbo.MERCHANTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.ORDERS`
--

DROP TABLE IF EXISTS `dbo.ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.ORDERS` (
  `UNIQUE_NUMBER` varchar(0) DEFAULT NULL,
  `ID` varchar(0) DEFAULT NULL,
  `CUS_ID` varchar(0) DEFAULT NULL,
  `MER_ID` varchar(0) DEFAULT NULL,
  `STATUS` varchar(0) DEFAULT NULL,
  `CREATED_AT` varchar(0) DEFAULT NULL,
  `PAID_AT` varchar(0) DEFAULT NULL,
  `TOTALAMT` varchar(0) DEFAULT NULL,
  `DELIVERY_AT` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.ORDERS`
--

LOCK TABLES `dbo.ORDERS` WRITE;
/*!40000 ALTER TABLE `dbo.ORDERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbo.ORDERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.ORDER_ITEM`
--

DROP TABLE IF EXISTS `dbo.ORDER_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.ORDER_ITEM` (
  `UNIQUE_NUMBER` tinyint(4) DEFAULT NULL,
  `ORDER_ID` smallint(6) DEFAULT NULL,
  `PRODUCT_ID` varchar(4) DEFAULT NULL,
  `QUANTITY` varchar(4) DEFAULT NULL,
  `CREATED_AT` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.ORDER_ITEM`
--

LOCK TABLES `dbo.ORDER_ITEM` WRITE;
/*!40000 ALTER TABLE `dbo.ORDER_ITEM` DISABLE KEYS */;
INSERT INTO `dbo.ORDER_ITEM` VALUES (1,1,'B001','1   ','2022-05-21 19:13:40'),(2,1,'B002','2   ','2022-05-21 19:13:40');
/*!40000 ALTER TABLE `dbo.ORDER_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.PRODUCTS`
--

DROP TABLE IF EXISTS `dbo.PRODUCTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.PRODUCTS` (
  `UNIQUE_NUMBER` tinyint(4) DEFAULT NULL,
  `ID` varchar(4) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `MERCHANT_ID` smallint(6) DEFAULT NULL,
  `PRICE` int(11) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT NULL,
  `QUANTITY` smallint(6) DEFAULT NULL,
  `SOLD` tinyint(4) DEFAULT NULL,
  `CREATED_AT` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.PRODUCTS`
--

LOCK TABLES `dbo.PRODUCTS` WRITE;
/*!40000 ALTER TABLE `dbo.PRODUCTS` DISABLE KEYS */;
INSERT INTO `dbo.PRODUCTS` VALUES (1,'A001','Áo Haori Hoa Sen Siêu Ch?t , hàng cao c?p                                                           ',1,195000,'I',100,0,'2022-05-21 18:14:58'),(2,'A002','Áo Hoodie nam n? in hình Phi Hành Gia c?c d?p, ch?t n? dày d?n                                      ',2,85000,'I',50,0,'2022-05-21 18:14:58'),(4,'B002','Serum Image Skincare VITAL C Hydrating Antioxidant ACE Serum 30ml                                   ',2,2449000,'I',50,0,'2022-05-21 18:14:58'),(5,'B001','Kem ch?ng n?ng Image Skincare SPF50 cho da h?n h?p 91g                                              ',2,1685000,'I',50,0,'2022-05-21 18:15:20');
/*!40000 ALTER TABLE `dbo.PRODUCTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.SHIPCOST`
--

DROP TABLE IF EXISTS `dbo.SHIPCOST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.SHIPCOST` (
  `UNIQUE_NUMBER` tinyint(4) DEFAULT NULL,
  `CITY1` varchar(4) DEFAULT NULL,
  `CITY2` varchar(5) DEFAULT NULL,
  `SHIPFEE` mediumint(9) DEFAULT NULL,
  `CREATED_AT` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.SHIPCOST`
--

LOCK TABLES `dbo.SHIPCOST` WRITE;
/*!40000 ALTER TABLE `dbo.SHIPCOST` DISABLE KEYS */;
INSERT INTO `dbo.SHIPCOST` VALUES (1,'02  ','02   ',20000,'2022-05-21 17:08:16'),(2,'79  ','79   ',20000,'2022-05-21 17:08:16'),(3,'02  ','79   ',30000,'2022-05-21 17:08:16');
/*!40000 ALTER TABLE `dbo.SHIPCOST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.USERS`
--

DROP TABLE IF EXISTS `dbo.USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.USERS` (
  `UNIQUE_NUMBER` tinyint(4) DEFAULT NULL,
  `ID` smallint(6) DEFAULT NULL,
  `USERNAME` varchar(30) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `FIRST_NAME` varchar(30) DEFAULT NULL,
  `LAST_NAME` varchar(30) DEFAULT NULL,
  `CITY_CODE` tinyint(4) DEFAULT NULL,
  `CREATED_AT` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.USERS`
--

LOCK TABLES `dbo.USERS` WRITE;
/*!40000 ALTER TABLE `dbo.USERS` DISABLE KEYS */;
INSERT INTO `dbo.USERS` VALUES (1,1,'milmeo                        ','mity.2a@gmail.com             ','Test                          ','AddDB                         ',2,'2022-05-21 16:57:46'),(2,2,'tommy                         ','milkon97@gmail.com            ','Test2                         ','AddDB                         ',2,'2022-05-21 16:57:46'),(3,3,'chinchuot                     ','vutumycoin@gmail.com          ','Test3                         ','AddDB                         ',79,'2022-05-21 16:57:46');
/*!40000 ALTER TABLE `dbo.USERS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-22 15:20:26
