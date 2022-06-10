-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.28

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

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `Uid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `seller_branch_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Uid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'user1','123456',NULL,NULL,'I sell everything'),(2,'user2','123456',NULL,NULL,'I sell everything but no2'),(3,'user3','123456789','user3@gmail.com','I am user 3','seller no3'),(9,'user5','123456','u5@gmail.com','name1',''),(10,'user22','123456','u22@gmail.com','user 22','shop 22'),(11,'user23','123456','u23@gmail.com','user 23','shop 23'),(12,'user4','123456','u1@gmai.com','name1','shop 4'),(13,'user7','123456','u7@gmail.com','name7',''),(14,'user8','123456','u8@gmail.com','name8',''),(15,'user9','123456','u9@gmail.com','u9',''),(16,'user10','123456','u10@gmail.com','u10','u10 shop'),(18,'seller6822','123456','seller6822@gmail.com','Sel Ler6822','Shop uy tín 6822');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `UID` int NOT NULL,
  `PID` int NOT NULL,
  `QUANTITY` int DEFAULT NULL,
  `EFFDATE` char(17) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`UID`,`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (2,21,1,'20220608224228388'),(3,12,3,'20220607222419394'),(3,19,3,'20220607222249735');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `ORDERID` int NOT NULL,
  `PID` int NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`ORDERID`,`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Order_id` int NOT NULL AUTO_INCREMENT,
  `Buyer_id` int DEFAULT NULL,
  `Item_name` varchar(255) DEFAULT NULL,
  `Pid` int DEFAULT NULL,
  `Seller_id` int DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total` decimal(15,0) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `pay_method` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date_time_order` varchar(255) DEFAULT NULL,
  `date_time_delivery` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,'Iphone 13 Vip Pro',19,1,23000000,2,46000000,'Thành Phố Hồ Chí Minh','test address 12','0905512345','Cash - Tiền mặt','processing',NULL,NULL),(2,2,'Iphone 13 Vip Pro',19,1,23000000,3,69000000,'Hà Nội','test address 25','0904212345','Transfer - Chuyển khoản','processing',NULL,NULL),(3,2,'Iphone 13 Vip Pro',19,1,23000000,3,69000000,'Hà Nội','test address 25','0904212345','Transfer - Chuyển khoản','processing',NULL,NULL),(4,3,'Iphone 13 Vip Pro',19,1,23000000,5,115000000,'Tỉnh/Thành phố, Quận/Huyện, Phường/Xã','test address 3','0933333333','Cash - Tiền mặt','processing','6/2/2022, 11:57:59 AM',NULL),(5,1,'Iphone 13 Vip Pro',19,1,23000000,2,46000000,'Đà Nẵng','test address 345','0905512345','Tiền mặt','processing','6/7/2022, 10:37:00 PM',NULL),(6,18,'Iphone 11 64GB Chính hãng',20,1,12390000,4,49560000,'Hà Nội','68 22 Street','0968202211','Tiền mặt','processing','6/8/2022, 10:59:43 PM',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopee_item`
--

DROP TABLE IF EXISTS `shopee_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopee_item` (
  `Pid` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT '0',
  `category` varchar(255) DEFAULT NULL,
  `seller_name` varchar(255) DEFAULT NULL,
  `seller_id` int DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `manufactor` varchar(255) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `storage_name` varchar(255) DEFAULT NULL,
  `product_classify` varchar(255) DEFAULT NULL,
  `STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'I',
  PRIMARY KEY (`Pid`),
  KEY `seller_idx` (`Pid`),
  KEY `id_idx` (`seller_id`,`seller_name`),
  CONSTRAINT `Uid` FOREIGN KEY (`seller_id`) REFERENCES `accounts` (`Uid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopee_item`
--

LOCK TABLES `shopee_item` WRITE;
/*!40000 ALTER TABLE `shopee_item` DISABLE KEYS */;
INSERT INTO `shopee_item` VALUES (1,'Áo thun nam nữ unisex tay lỡ, áo phông cotton from rộng AD69 Oversize',150000,'Áo nam','I sell everything',1,'','','','','','I'),(2,'Áo nam trắng 2',100000,'Áo nam','I sell everything but no2',2,'','','','','','I'),(3,'Áo nam đen 5',50000,'Áo nam','I sell everything',1,'','','','','','I'),(4,'Áo nam trắng 4',40000,'Áo nam','I sell everything but no2',2,'','','','','','I'),(7,'Áo nữ 5',430000,'Áo nữ','I sell everything but no2',2,'','','','','','I'),(12,'Áo nữ trắng 6',60000,'Áo nam','I sell everything',1,'','','','','','I'),(13,'Áo nam cam 7',70000,'Áo nam','I sell everything',1,'','','','','','I'),(14,'Áo đỏ caro',100000000,'Áo nam','I sell everything but no2',2,'','','','','','I'),(19,'Iphone 13 Vip Pro',23000000,'Áo nam','I sell everything',1,'quá ghê gớm','Apple','Thegioididong nhà làm','Kho 1 địa chỉ...','Hàng dễ vỡ','I'),(20,'Iphone 11 64GB Chính hãng',12390000,'Đồ điện tử','I sell everything',1,'Trả góp 0% uy tín ','Apple','Thegioididong nhà làm','Kho hàng ở đâu đó','Hàng dễ vỡ','I'),(21,'Sản phẩm thú cưng xịn',555,'Thú cưng','I sell everything but no2',2,'mô tả','','','','','I');
/*!40000 ALTER TABLE `shopee_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-08 23:09:38
