CREATE DATABASE  IF NOT EXISTS `swiggy_fullstack` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `swiggy_fullstack`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: swiggy_fullstack
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street_address` varchar(255) DEFAULT NULL,
  `house_no` varchar(45) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adress_id_0_idx` (`address_id`),
  KEY `user_id_0_idx` (`user_id`),
  CONSTRAINT `adress_id_0` FOREIGN KEY (`address_id`) REFERENCES `resturant` (`id`),
  CONSTRAINT `user_id_0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_cost` varchar(25) DEFAULT NULL,
  `coupon_code` varchar(75) DEFAULT NULL,
  `tax` varchar(25) DEFAULT NULL,
  `discount` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `resturant_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id_0_idx` (`menu_id`),
  KEY `user_id_2_idx` (`user_id`),
  KEY `resturant_id__1_idx` (`resturant_id`),
  CONSTRAINT `menu_id_0` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `resturant_id__1` FOREIGN KEY (`resturant_id`) REFERENCES `resturant` (`id`),
  CONSTRAINT `user_id_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `delivery_guy_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `user_address` int DEFAULT NULL,
  `user` int DEFAULT NULL,
  `bill_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_guy_id_idx` (`delivery_guy_id`),
  KEY `user_id_4_idx` (`user`),
  KEY `order_id_3_idx` (`order_id`),
  KEY `user_address_0_idx` (`user_address`),
  KEY `bill_id_0_idx` (`bill_id`),
  CONSTRAINT `bill_id_0` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`),
  CONSTRAINT `delivery_guy_id_0` FOREIGN KEY (`delivery_guy_id`) REFERENCES `user` (`id`),
  CONSTRAINT `order_id_3` FOREIGN KEY (`order_id`) REFERENCES `ordertb` (`id`),
  CONSTRAINT `user_address_0` FOREIGN KEY (`user_address`) REFERENCES `address` (`id`),
  CONSTRAINT `user_id_4` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `meal_type` varchar(200) DEFAULT NULL,
  `cusine_type` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `resturant_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `resturant_id_0_idx` (`resturant_id`),
  CONSTRAINT `resturant_id_0` FOREIGN KEY (`resturant_id`) REFERENCES `resturant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_0_idx` (`order_id`),
  KEY `user_id_1_idx` (`user_id`),
  CONSTRAINT `order_id_0` FOREIGN KEY (`order_id`) REFERENCES `ordertb` (`id`),
  CONSTRAINT `user_id_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordertb`
--

DROP TABLE IF EXISTS `ordertb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordertb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_3_idx` (`user_id`),
  KEY `cart_id_0_idx` (`cart_id`),
  CONSTRAINT `cart_id_0` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `user_id_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordertb`
--

LOCK TABLES `ordertb` WRITE;
/*!40000 ALTER TABLE `ordertb` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordertb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `description` varchar(75) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `payment_status` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_2_idx` (`order_id`),
  CONSTRAINT `order_id_2` FOREIGN KEY (`order_id`) REFERENCES `ordertb` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resturant`
--

DROP TABLE IF EXISTS `resturant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resturant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resturant`
--

LOCK TABLES `resturant` WRITE;
/*!40000 ALTER TABLE `resturant` DISABLE KEYS */;
/*!40000 ALTER TABLE `resturant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'Arun402','917702291840','Admin','arun.a@gmail.com','2023-12-27 10:52:48');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'swiggy_fullstack'
--

--
-- Dumping routines for database 'swiggy_fullstack'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-27 18:54:22
