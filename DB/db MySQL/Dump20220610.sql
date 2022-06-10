-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.29

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'user1','123456',NULL,NULL,'seller 1'),(2,'user2','123456',NULL,NULL,'seller 2'),(3,'user3','123456789','user3@gmail.com','I am user 3','seller no3'),(9,'user5','123456','u5@gmail.com','name1',''),(10,'user22','123456','u22@gmail.com','user 22','shop 22'),(11,'user23','123456','u23@gmail.com','user 23','shop 23'),(12,'user4','123456','u1@gmai.com','name1','shop 4'),(13,'user7','123456','u7@gmail.com','name7',''),(14,'user8','123456','u8@gmail.com','name8',''),(15,'user9','123456','u9@gmail.com','u9',''),(16,'user10','123456','u10@gmail.com','u10','u10 shop');
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
  `EFFDATE` char(17) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`UID`,`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,2,'20220604141011001'),(1,2,3,'20220609122644594'),(1,3,2,'20220604151011002'),(1,4,1,'20220609013940170'),(1,9,2,'20220609013838654'),(1,10,1,'20220609013949018'),(1,12,1,'20220609113550725'),(1,20,4,'20220609013903821'),(2,1,2,'20220604141011001'),(2,2,2,'20220604151011001'),(2,3,2,'20220604151011002');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,'Iphone 13 Vip Pro',19,1,23000000,2,46000000,'Thành Phố Hồ Chí Minh','test address 12','0905512345','Cash - Tiền mặt','processing',NULL,NULL),(2,2,'Iphone 13 Vip Pro',19,1,23000000,3,69000000,'Hà Nội','test address 25','0904212345','Transfer - Chuyển khoản','processing',NULL,NULL),(3,2,'Iphone 13 Vip Pro',19,1,23000000,3,69000000,'Hà Nội','test address 25','0904212345','Transfer - Chuyển khoản','processing',NULL,NULL),(4,3,'Iphone 13 Vip Pro',19,1,23000000,5,115000000,'Tỉnh/Thành phố, Quận/Huyện, Phường/Xã','test address 3','0933333333','Cash - Tiền mặt','processing','6/2/2022, 11:57:59 AM',NULL);
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
  `STATUS` char(1) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT 'I',
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

--
-- Temporary view structure for view `vcart`
--

DROP TABLE IF EXISTS `vcart`;
/*!50001 DROP VIEW IF EXISTS `vcart`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vcart` AS SELECT 
 1 AS `UID`,
 1 AS `MERCHANT`,
 1 AS `MID`,
 1 AS `PID`,
 1 AS `quantity`,
 1 AS `item_name`,
 1 AS `price`,
 1 AS `EFFDATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'mydb'
--

--
-- Final view structure for view `vcart`
--

/*!50001 DROP VIEW IF EXISTS `vcart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vcart` AS select `c`.`UID` AS `UID`,`a`.`seller_branch_name` AS `MERCHANT`,`a`.`Uid` AS `MID`,`c`.`PID` AS `PID`,`c`.`QUANTITY` AS `quantity`,`i`.`item_name` AS `item_name`,`i`.`price` AS `price`,`c`.`EFFDATE` AS `EFFDATE` from (((`cart` `c` left join `shopee_item` `i` on((`c`.`PID` = `i`.`Pid`))) join (select `c`.`UID` AS `UID`,`i`.`seller_id` AS `SELLER_ID`,max(`c`.`EFFDATE`) AS `EFFDATE` from (`cart` `c` left join `shopee_item` `i` on((`c`.`PID` = `i`.`Pid`))) group by `c`.`UID`,`i`.`seller_id`) `e` on(((`i`.`seller_id` = `e`.`SELLER_ID`) and (`c`.`UID` = `e`.`UID`)))) join `accounts` `a` on((`i`.`seller_id` = `a`.`Uid`))) order by `c`.`UID` desc,`e`.`EFFDATE` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-10  0:02:52
