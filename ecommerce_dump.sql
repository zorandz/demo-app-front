-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: full-stack-ecommerce
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Zagreb',NULL,NULL,'Nova Ves 79 A','10 000'),(2,'Zagreb',NULL,NULL,'Nova Ves 79 A','10 000'),(3,'Zagreb','Canada','Alberta','Nova Ves 79 A','10 000'),(4,'Zagreb','Canada','Alberta','Nova Ves 79 A','10 000'),(5,'Zagreb','Canada','Alberta','Nova Ves 79 A','10 000'),(6,'Zagreb','Canada','Alberta','Nova Ves 79 A','10 000'),(7,'Zagreb','Canada','Alberta','Nova Ves 79 A','10 000'),(8,'Zagreb','Canada','Alberta','Nova Ves 79 A','10 000'),(9,'Zagreb','Brazil','Acre','Nova Ves 79 A','10 000'),(10,'Zagreb','Brazil','Acre','Nova Ves 79 A','10 000');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'BR','Brazil'),(2,'CA','Canada'),(3,'DE','Germany'),(4,'IN','India'),(5,'TR','Turkey'),(6,'US','United States');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (23);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt4dc2r9nbvbujrljv3e23iibt` (`order_id`),
  CONSTRAINT `FKt4dc2r9nbvbujrljv3e23iibt` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,'assets/images/products/mousepads/mousepad-luv2code-1002.png',53,4,17.99,2),(2,'assets/images/products/books/book-luv2code-1000.png',1,1,14.99,3),(3,'assets/images/products/books/book-luv2code-1001.png',2,1,20.99,3),(4,'assets/images/products/books/book-luv2code-1002.png',3,1,14.99,3),(5,'assets/images/products/coffeemugs/coffeemug-luv2code-1002.png',28,1,18.99,4),(6,'assets/images/products/luggagetags/luggagetag-luv2code-1007.png',83,1,16.99,4),(7,'assets/images/products/books/book-luv2code-1002.png',3,1,14.99,4),(8,'assets/images/products/luggagetags/luggagetag-luv2code-1004.png',80,1,16.99,4),(9,'assets/images/products/luggagetags/luggagetag-luv2code-1008.png',84,1,16.99,4),(10,'assets/images/products/coffeemugs/coffeemug-luv2code-1000.png',26,1,18.99,4),(11,'assets/images/products/mousepads/mousepad-luv2code-1002.png',53,2,17.99,4),(12,'assets/images/products/coffeemugs/coffeemug-luv2code-1001.png',27,1,18.99,4),(13,'assets/images/products/books/book-luv2code-1001.png',2,1,20.99,4),(14,'assets/images/products/books/book-luv2code-1000.png',1,1,14.99,4),(15,'assets/images/products/mousepads/mousepad-luv2code-1002.png',53,2,17.99,5),(16,'assets/images/products/mousepads/mousepad-luv2code-1000.png',51,1,17.99,5),(17,'assets/images/products/mousepads/mousepad-luv2code-1001.png',52,1,17.99,5);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `order_tracking_number` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `total_quantity` int DEFAULT NULL,
  `billing_address_id` bigint DEFAULT NULL,
  `shipping_address_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqraecqgbbr1p37ic9dr44e2dr` (`billing_address_id`),
  KEY `FKh0uue95ltjysfmkqb5abgk7tj` (`shipping_address_id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`),
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKh0uue95ltjysfmkqb5abgk7tj` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKqraecqgbbr1p37ic9dr44e2dr` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `unit_price` decimal(13,2) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `units_in_stock` int DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `category_id` bigint NOT NULL,
  `category` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (3,'BOOK-TECH-1002','Exploring Vue.js','Learn Vue.js at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',14.99,'assets/images/products/books/book-luv2code-1002.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(4,'BOOK-TECH-1003','Advanced Techniques in Big Data','Learn Big Data at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',13.99,'assets/images/products/books/book-luv2code-1003.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(5,'BOOK-TECH-1004','Crash Course in Big Data','Learn Big Data at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',18.99,'assets/images/products/books/book-luv2code-1004.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(6,'BOOK-TECH-1005','JavaScript Cookbook','Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',23.99,'assets/images/products/books/book-luv2code-1005.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(7,'BOOK-TECH-1006','Beginners Guide to SQL','Learn SQL at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',14.99,'assets/images/products/books/book-luv2code-1006.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(8,'BOOK-TECH-1007','Advanced Techniques in JavaScript','Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',16.99,'assets/images/products/books/book-luv2code-1007.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(9,'BOOK-TECH-1008','Introduction to Spring Boot','Learn Spring Boot at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',25.99,'assets/images/products/books/book-luv2code-1008.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(10,'BOOK-TECH-1009','Become a Guru in React.js','Learn React.js at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',23.99,'assets/images/products/books/book-luv2code-1009.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(11,'BOOK-TECH-1010','Beginners Guide to Data Science','Learn Data Science at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',24.99,'assets/images/products/books/book-luv2code-1010.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(12,'BOOK-TECH-1011','Advanced Techniques in Java','Learn Java at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',19.99,'assets/images/products/books/book-luv2code-1011.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(13,'BOOK-TECH-1012','Exploring DevOps','Learn DevOps at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',24.99,'assets/images/products/books/book-luv2code-1012.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(14,'BOOK-TECH-1013','The Expert Guide to SQL','Learn SQL at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',19.99,'assets/images/products/books/book-luv2code-1013.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(15,'BOOK-TECH-1014','Introduction to SQL','Learn SQL at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',22.99,'assets/images/products/books/book-luv2code-1014.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(16,'BOOK-TECH-1015','The Expert Guide to JavaScript','Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',22.99,'assets/images/products/books/book-luv2code-1015.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(17,'BOOK-TECH-1016','Exploring React.js','Learn React.js at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',27.99,'assets/images/products/books/book-luv2code-1016.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(18,'BOOK-TECH-1017','Advanced Techniques in React.js','Learn React.js at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',13.99,'assets/images/products/books/book-luv2code-1017.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(19,'BOOK-TECH-1018','Introduction to C#','Learn C# at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',26.99,'assets/images/products/books/book-luv2code-1018.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(20,'BOOK-TECH-1019','Crash Course in JavaScript','Learn JavaScript at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',13.99,'assets/images/products/books/book-luv2code-1019.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(21,'BOOK-TECH-1020','Introduction to Machine Learning','Learn Machine Learning at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',19.99,'assets/images/products/books/book-luv2code-1020.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(22,'BOOK-TECH-1021','Become a Guru in Java','Learn Java at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',18.99,'assets/images/products/books/book-luv2code-1021.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(23,'BOOK-TECH-1022','Introduction to Python','Learn Python at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',26.99,'assets/images/products/books/book-luv2code-1022.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(24,'BOOK-TECH-1023','Advanced Techniques in C#','Learn C# at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',22.99,'assets/images/products/books/book-luv2code-1023.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(25,'BOOK-TECH-1024','The Expert Guide to Machine Learning','Learn Machine Learning at your own pace. The author explains how the technology works in easy-to-understand language. This book includes working examples that you can apply to your own projects. Purchase the book and get started today!',16.99,'assets/images/products/books/book-luv2code-1024.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,1,NULL),(26,'COFFEEMUG-1000','Coffee Mug - Express','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1000.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(27,'COFFEEMUG-1001','Coffee Mug - Cherokee','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1001.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(32,'COFFEEMUG-1006','Coffee Mug - Worthing','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1006.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(33,'COFFEEMUG-1007','Coffee Mug - Oak Cliff','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1007.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(34,'COFFEEMUG-1008','Coffee Mug - Tachyon','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1008.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(35,'COFFEEMUG-1009','Coffee Mug - Pan','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1009.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(36,'COFFEEMUG-1010','Coffee Mug - Phase','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1010.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(37,'COFFEEMUG-1011','Coffee Mug - Falling','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1011.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(38,'COFFEEMUG-1012','Coffee Mug - Wispy','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1012.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(39,'COFFEEMUG-1013','Coffee Mug - Arlington','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1013.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(40,'COFFEEMUG-1014','Coffee Mug - Gazing','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1014.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(41,'COFFEEMUG-1015','Coffee Mug - Azura','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1015.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(42,'COFFEEMUG-1016','Coffee Mug - Quantum Leap','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1016.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(43,'COFFEEMUG-1017','Coffee Mug - Light Years','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1017.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(44,'COFFEEMUG-1018','Coffee Mug - Taylor','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1018.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(45,'COFFEEMUG-1019','Coffee Mug - Gracia','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1019.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(46,'COFFEEMUG-1020','Coffee Mug - Relax','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1020.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(47,'COFFEEMUG-1021','Coffee Mug - Windermere','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1021.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(48,'COFFEEMUG-1022','Coffee Mug - Prancer','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1022.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(49,'COFFEEMUG-1023','Coffee Mug - Recursion','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1023.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(50,'COFFEEMUG-1024','Coffee Mug - Treasure','Do you love mathematics? If so, then you need this elegant coffee mug with an amazing fractal design. You don\'t have to worry about boring coffee mugs anymore. This coffee mug will be the topic of conversation in the office, guaranteed! Buy it now!',18.99,'assets/images/products/coffeemugs/coffeemug-luv2code-1024.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,2,NULL),(54,'MOUSEPAD-1003','Mouse Pad - Aspire','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1003.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(56,'MOUSEPAD-1005','Mouse Pad - Columbia','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1005.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(57,'MOUSEPAD-1006','Mouse Pad - Worthing','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1006.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(58,'MOUSEPAD-1007','Mouse Pad - Oak Cliff','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1007.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(59,'MOUSEPAD-1008','Mouse Pad - Tachyon','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1008.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(60,'MOUSEPAD-1009','Mouse Pad - Pan','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1009.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(61,'MOUSEPAD-1010','Mouse Pad - Phase','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1010.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(62,'MOUSEPAD-1011','Mouse Pad - Falling','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1011.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(63,'MOUSEPAD-1012','Mouse Pad - Wispy','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1012.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(64,'MOUSEPAD-1013','Mouse Pad - Arlington','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1013.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(65,'MOUSEPAD-1014','Mouse Pad - Gazing','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1014.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(66,'MOUSEPAD-1015','Mouse Pad - Azura','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1015.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(67,'MOUSEPAD-1016','Mouse Pad - Quantum Leap','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1016.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(68,'MOUSEPAD-1017','Mouse Pad - Light Years','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1017.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(69,'MOUSEPAD-1018','Mouse Pad - Taylor','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1018.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(70,'MOUSEPAD-1019','Mouse Pad - Gracia','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1019.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(71,'MOUSEPAD-1020','Mouse Pad - Relax','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1020.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(72,'MOUSEPAD-1021','Mouse Pad - Windermere','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1021.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(73,'MOUSEPAD-1022','Mouse Pad - Prancer','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1022.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(74,'MOUSEPAD-1023','Mouse Pad - Recursion','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1023.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(75,'MOUSEPAD-1024','Mouse Pad - Treasure','Fractal images are amazing! You can now own a mouse pad with a unique and amazing fractal. The mouse pad is made of a durable and smooth material. Your mouse will easily glide across the mouse pad. This mouse pad will brighten your workspace. Buy it now!',17.99,'assets/images/products/mousepads/mousepad-luv2code-1024.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,3,NULL),(76,'LUGGAGETAG-1000','Luggage Tag - Cherish','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1000.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,4,NULL),(77,'LUGGAGETAG-1001','Luggage Tag - Adventure','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1001.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,4,NULL),(79,'LUGGAGETAG-1003','Luggage Tag - River','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1003.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,4,NULL),(81,'LUGGAGETAG-1005','Luggage Tag - Blooming','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1005.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,4,NULL),(82,'LUGGAGETAG-1006','Luggage Tag - Park','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1006.png',_binary '',100,'2021-11-11 15:20:02.000000',NULL,4,NULL),(83,'LUGGAGETAG-1007','Luggage Tag - Beauty','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1007.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(84,'LUGGAGETAG-1008','Luggage Tag - Water Fall','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1008.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(85,'LUGGAGETAG-1009','Luggage Tag - Trail','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1009.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(86,'LUGGAGETAG-1010','Luggage Tag - Skyscraper','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1010.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(87,'LUGGAGETAG-1011','Luggage Tag - Leaf','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1011.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(88,'LUGGAGETAG-1012','Luggage Tag - Jungle','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1012.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(89,'LUGGAGETAG-1013','Luggage Tag - Shoreline','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1013.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(90,'LUGGAGETAG-1014','Luggage Tag - Blossom','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1014.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(91,'LUGGAGETAG-1015','Luggage Tag - Lock','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1015.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(92,'LUGGAGETAG-1016','Luggage Tag - Cafe','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1016.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(93,'LUGGAGETAG-1017','Luggage Tag - Darling','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1017.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(94,'LUGGAGETAG-1018','Luggage Tag - Full Stack','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1018.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(95,'LUGGAGETAG-1019','Luggage Tag - Courtyard','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1019.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(96,'LUGGAGETAG-1020','Luggage Tag - Coaster','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1020.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(97,'LUGGAGETAG-1021','Luggage Tag - Bridge','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1021.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(98,'LUGGAGETAG-1022','Luggage Tag - Sunset','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1022.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(99,'LUGGAGETAG-1023','Luggage Tag - Flames','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1023.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(100,'LUGGAGETAG-1024','Luggage Tag - Countryside','This luggage tag will help you identify your luggage. The luggage tag is very unique and it will stand out from the crowd. The luggage tag is created out of a rugged and durable plastic. Buy this luggage tag now to make it easy to identify your luggage!',16.99,'assets/images/products/luggagetags/luggagetag-luv2code-1024.png',_binary '',100,'2021-11-11 15:20:03.000000',NULL,4,NULL),(101,'dsfsdf','Makaroni','1',3.00,'assets\\images\\products\\books\\facebook-slika-1.jpg',_binary '\0',1,'2021-12-06 14:00:37.159000','2021-12-06 14:00:37.159000',2,NULL),(102,'dsfsdf','Makaroni','1',3.00,'assets\\images\\products\\books\\facebook-slika-1.jpg',_binary '\0',1,'2021-12-06 14:00:38.508000','2021-12-06 14:00:38.508000',2,NULL),(103,'dsfsdf','Makaroni','1',3.00,'assets\\images\\products\\books\\facebook-slika-1.jpg',_binary '\0',1,'2021-12-06 14:03:21.186000','2021-12-06 14:03:21.186000',2,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Books'),(2,'Coffee Mugs'),(3,'Mouse Pads'),(4,'Luggage Tags');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKghic7mqjt6qb9vq7up7awu0er` (`country_id`),
  CONSTRAINT `FKghic7mqjt6qb9vq7up7awu0er` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Acre',1),(2,'Alagoas',1),(3,'AmapÃ¡',1),(4,'Amazonas',1),(5,'Bahia',1),(6,'CearÃ¡',1),(7,'Distrito Federal',1),(8,'EspÃ­rito Santo',1),(9,'GoiÃ¡s',1),(10,'MaranhÃ£o',1),(11,'Mato Grosso do Sul',1),(12,'Mato Grosso',1),(13,'Minas Gerais',1),(14,'ParanÃ¡',1),(15,'ParaÃ­ba',1),(16,'ParÃ¡',1),(17,'Pernambuco',1),(18,'Piaui',1),(19,'Rio de Janeiro',1),(20,'Rio Grande do Norte',1),(21,'Rio Grande do Sul',1),(22,'RondÃ´nia',1),(23,'Roraima',1),(24,'Santa Catarina',1),(25,'Sergipe',1),(26,'SÃ£o Paulo',1),(27,'Tocantins',1),(28,'Alberta',2),(29,'British Columbia',2),(30,'Manitoba',2),(31,'New Brunswick',2),(32,'Newfoundland and Labrador',2),(33,'Northwest Territories',2),(34,'Nova Scotia',2),(35,'Nunavut',2),(36,'Ontario',2),(37,'Prince Edward Island',2),(38,'Quebec',2),(39,'Saskatchewan',2),(40,'Yukon',2),(41,'Baden-WÃ¼rttemberg',3),(42,'Bavaria',3),(43,'Berlin',3),(44,'Brandenburg',3),(45,'Bremen',3),(46,'Hamburg',3),(47,'Hesse',3),(48,'Lower Saxony',3),(49,'Mecklenburg-Vorpommern',3),(50,'North Rhine-Westphalia',3),(51,'Rhineland-Palatinate',3),(52,'Saarland',3),(53,'Saxony',3),(54,'Saxony-Anhalt',3),(55,'Schleswig-Holstein',3),(56,'Thuringia',3),(57,'Andhra Pradesh',4),(58,'Arunachal Pradesh',4),(59,'Assam',4),(60,'Bihar',4),(61,'Chhattisgarh',4),(62,'Goa',4),(63,'Gujarat',4),(64,'Haryana',4),(65,'Himachal Pradesh',4),(66,'Jammu & Kashmir',4),(67,'Jharkhand',4),(68,'Karnataka',4),(69,'Kerala',4),(70,'Madhya Pradesh',4),(71,'Maharashtra',4),(72,'Manipur',4),(73,'Meghalaya',4),(74,'Mizoram',4),(75,'Nagaland',4),(76,'Odisha',4),(77,'Punjab',4),(78,'Rajasthan',4),(79,'Sikkim',4),(80,'Tamil Nadu',4),(81,'Telangana',4),(82,'Tripura',4),(83,'Uttar Pradesh',4),(84,'Uttarakhand',4),(85,'West Bengal',4),(86,'Andaman and Nicobar Islands',4),(87,'Chandigarh',4),(88,'Dadra and Nagar Haveli',4),(89,'Daman & Diu',4),(90,'Lakshadweep',4),(91,'Puducherry',4),(92,'The Government of NCT of Delhi',4),(93,'Alabama',6),(94,'Alaska',6),(95,'Arizona',6),(96,'Arkansas',6),(97,'California',6),(98,'Colorado',6),(99,'Connecticut',6),(100,'Delaware',6),(101,'District Of Columbia',6),(102,'Florida',6),(103,'Georgia',6),(104,'Hawaii',6),(105,'Idaho',6),(106,'Illinois',6),(107,'Indiana',6),(108,'Iowa',6),(109,'Kansas',6),(110,'Kentucky',6),(111,'Louisiana',6),(112,'Maine',6),(113,'Maryland',6),(114,'Massachusetts',6),(115,'Michigan',6),(116,'Minnesota',6),(117,'Mississippi',6),(118,'Missouri',6),(119,'Montana',6),(120,'Nebraska',6),(121,'Nevada',6),(122,'New Hampshire',6),(123,'New Jersey',6),(124,'New Mexico',6),(125,'New York',6),(126,'North Carolina',6),(127,'North Dakota',6),(128,'Ohio',6),(129,'Oklahoma',6),(130,'Oregon',6),(131,'Pennsylvania',6),(132,'Rhode Island',6),(133,'South Carolina',6),(134,'South Dakota',6),(135,'Tennessee',6),(136,'Texas',6),(137,'Utah',6),(138,'Vermont',6),(139,'Virginia',6),(140,'Washington',6),(141,'West Virginia',6),(142,'Wisconsin',6),(143,'Wyoming',6),(144,'AdÄ±yaman',5),(145,'Afyonkarahisar',5),(146,'AÄrÄ±',5),(147,'Aksaray',5),(148,'Amasya',5),(149,'Ankara',5),(150,'Antalya',5),(151,'Ardahan',5),(152,'Artvin',5),(153,'AydÄ±n',5),(154,'BalÄ±kesir',5),(155,'BartÄ±n',5),(156,'Batman',5),(157,'Bayburt',5),(158,'Bilecik',5),(159,'BingÃ¶l',5),(160,'Bitlis',5),(161,'Bolu',5),(162,'Burdur',5),(163,'Bursa',5),(164,'Ãanakkale',5),(165,'ÃankÄ±rÄ±',5),(166,'Ãorum',5),(167,'Denizli',5),(168,'DiyarbakÄ±r',5),(169,'DÃ¼zce',5),(170,'Edirne',5),(171,'ElazÄ±Ä',5),(172,'Erzincan',5),(173,'Erzurum',5),(174,'EskiÅehir',5),(175,'Gaziantep',5),(176,'Giresun',5),(177,'GÃ¼mÃ¼Åhane',5),(178,'HakkÃ¢ri',5),(179,'Hatay',5),(180,'IÄdÄ±r',5),(181,'Isparta',5),(182,'Ä°stanbul',5),(183,'Ä°zmir',5),(184,'KahramanmaraÅ',5),(185,'KarabÃ¼k',5),(186,'Karaman',5),(187,'Kars',5),(188,'Kastamonu',5),(189,'Kayseri',5),(190,'KÄ±rÄ±kkale',5),(191,'KÄ±rklareli',5),(192,'KÄ±rÅehir',5),(193,'Kilis',5),(194,'Kocaeli',5),(195,'Konya',5),(196,'KÃ¼tahya',5),(197,'Malatya',5),(198,'Manisa',5),(199,'Mardin',5),(200,'Mersin',5),(201,'MuÄla',5),(202,'MuÅ',5),(203,'NevÅehir',5),(204,'NiÄde',5),(205,'Ordu',5),(206,'Osmaniye',5),(207,'Rize',5),(208,'Sakarya',5),(209,'Samsun',5),(210,'Siirt',5),(211,'Sinop',5),(212,'Sivas',5),(213,'ÅanlÄ±urfa',5),(214,'ÅÄ±rnak',5),(215,'TekirdaÄ',5),(216,'Tokat',5),(217,'Trabzon',5),(218,'Tunceli',5),(219,'UÅak',5),(220,'Van',5),(221,'Yalova',5),(222,'Yozgat',5),(223,'Zonguldak',5);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `authorities` tinyblob,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `is_not_locked` bit(1) NOT NULL,
  `join_date` datetime(6) DEFAULT NULL,
  `last_login_date` datetime(6) DEFAULT NULL,
  `last_login_date_display` datetime(6) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (12,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','zoran.dzoic@yahoo.com','Zoran',_binary '',_binary '','2021-12-09 01:35:52.734000','2021-12-13 11:09:05.662000','2021-12-12 16:56:57.195000','DÅ¾oiÄ','$2a$10$pxYY1y1NSiEb4UtGxHCUYOSXv9DGeHTL0OaT5bJW1dSFWf/PZ8Pt2','http://localhost:8080/user/image/profile/temp','ROLE_ADMIN','9355849942','zoki'),(14,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:readt\0user:createt\0user:update','gentlehouse@gmail.com','Nomo',_binary '',_binary '','2021-12-09 06:33:44.683000',NULL,NULL,'Tester','$2a$10$pcaUtbe8UZlbZ8d3W4HLQe95o3h9wuVhr2zndyL3dvdTXuoOM0LZa','http://localhost:8080/user/image/testi/testi.jpg','ROLE_ADMIN','8410968557','testi'),(22,_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0	user:read','milan.bandiÄ@gmail.com','Milan',_binary '\0',_binary '\0','2021-12-12 16:58:51.435000',NULL,NULL,'BandiÄ','$2a$10$GZEDJUydhMzGpb4vt94lAeowKo52neB/tUUWzpd2oMWaYbgFFs/UW','http://localhost:8080/user/image/profile/temp','ROLE_USER','3988400472','miki');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-13 12:54:39
