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
  PRIMARY KEY (`Pid`),
  KEY `seller_idx` (`Pid`),
  KEY `id_idx` (`seller_id`,`seller_name`),
  CONSTRAINT `Uid` FOREIGN KEY (`seller_id`) REFERENCES `accounts` (`Uid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopee_item`
--

LOCK TABLES `shopee_item` WRITE;
/*!40000 ALTER TABLE `shopee_item` DISABLE KEYS */;
INSERT INTO `shopee_item` VALUES (1,'Áo thun nam nữ unisex tay lỡ, áo phông cotton from rộng AD69 Oversize',0,'Áo nam','seller 1',1,NULL,NULL,NULL,NULL,NULL),(2,'Áo thun nam nữ unisex tay lỡ, áo phông cotton from rộng AD69 Oversize',0,'Áo nam','seller 2',2,NULL,NULL,NULL,NULL,NULL),(3,'Áo thun nam nữ unisex tay lỡ, áo phông cotton from rộng AD69 Oversize',0,'Áo nam','seller 1',1,'','','','',''),(4,'Áo thun nam nữ unisex tay lỡ, áo phông cotton from rộng AD69 Oversize',0,'Áo nam','seller 2',2,NULL,NULL,NULL,NULL,NULL),(6,'Áo thun nam nữ unisex tay lỡ, áo phông cotton from rộng AD69 Oversize',0,'ao_nam','seller 2',2,NULL,NULL,NULL,NULL,NULL),(7,'Áo thun nam nữ unisex tay lỡ, áo phông cotton from rộng AD69 Oversize',0,'ao_nam','seller 2',2,NULL,NULL,NULL,NULL,NULL),(8,'Áo thun nam nữ unisex tay lỡ, áo phông cotton from rộng AD69 Oversize',0,'ao_nam','seller 2',2,NULL,NULL,NULL,NULL,NULL),(9,'Áo thun nam nữ unisex tay lỡ, áo phông cotton from rộng AD69 Oversize',0,'ao_nam','seller 2',2,NULL,NULL,NULL,NULL,NULL),(12,'test add item number 12A',0,'Áo nam','seller 1',1,NULL,NULL,NULL,NULL,NULL),(13,'Sản phẩm test 126798',0,'Áo nam','seller 1',1,'','','','',''),(14,'Sản phẩm test 14',0,'Áo nữ','seller 2',2,NULL,NULL,NULL,NULL,NULL),(17,'',0,'Áo nam','seller 2',2,NULL,NULL,NULL,NULL,NULL),(19,'Iphone 13 Vip Pro',23000000,'Áo nam','seller 1',1,'quá ghê gớm','Apple','Thegioididong nhà làm','Kho 1 địa chỉ...','Hàng dễ vỡ'),(20,'Sản phẩm test 10',0,'Áo nam','seller 1',1,'','Apple','Thegioididong nhà làm','Kho 1 địa chỉ...','Hàng dễ vỡ');
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

-- Dump completed on 2022-06-02 12:08:42
