-- MySQL dump 10.13  Distrib 8.0.12, for osx10.13 (x86_64)
--
-- Host: localhost    Database: musicstore
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `cart`
--
DROP DATABASE IF EXISTS musicstore;

CREATE DATABASE musicstore;
USE musicstore; 
DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grand_total` double NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FK_867x3yysb1f3jk41cv3vsoejj` (`customer_id`),
  CONSTRAINT `FK_867x3yysb1f3jk41cv3vsoejj` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,31000,1),(2,5000,2);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart_item` (
  `cart_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `total_price_double` double NOT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `FK_n7d76evrrkrg1cva2ewnh57hn` (`cart_id`),
  KEY `FK_r5b99rvdnupujm2h7hh2bh6m7` (`product_id`),
  CONSTRAINT `FK_n7d76evrrkrg1cva2ewnh57hn` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `FK_r5b99rvdnupujm2h7hh2bh6m7` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (2,1,31000,1,10),(4,1,5000,2,8);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `main_category_name` varchar(255) NOT NULL,
  `sub_category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'drums','drums'),(2,'guitars','guitars'),(3,'microphones','microphones'),(4,'drums','acoustic-drums'),(5,'drums','electric-drums'),(6,'guitars','electric-guitars'),(7,'guitars','acoustic-guitars'),(8,'guitars','folk-guitars'),(9,'pianos','pianos');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `code` (
  `code_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code_date` datetime DEFAULT NULL,
  `code_str` varchar(255) DEFAULT NULL,
  `code_type` int(11) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`code_id`),
  KEY `FK_k6x8c6off4frbk34ax4usk10` (`customer_id`),
  CONSTRAINT `FK_k6x8c6off4frbk34ax4usk10` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code` DISABLE KEYS */;
INSERT INTO `code` VALUES (1,'2019-05-10 17:40:54','pklmhpvivquviadao3opac24on',0,1),(2,'2019-05-11 12:30:10','jhufiajouq2gou3qbgl7pjtatl',0,2);
/*!40000 ALTER TABLE `code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_date` datetime DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `FK_g9sk3sbpw80xw32a5b435qvw2` (`cart_id`),
  CONSTRAINT `FK_g9sk3sbpw80xw32a5b435qvw2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'b20','bvpatidar@gmail.com',_binary '','$2a$10$qANIkw0cBer85xozQ7CiM.APIhYDaardgTfrifCpwvEMNxpz6SPim','2019-05-10 17:40:50',1),(2,'Admin','admin@musicstore.com',_binary '','$2a$10$3QRnMf5LmN4y6yfZ5MeOj.QyXbALUHT6XF17Qcvf5HsF6mUUqy2CG','2019-05-11 12:29:53',2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_order` (
  `customer_order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_date` datetime DEFAULT NULL,
  `order_total_price` double NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`customer_order_id`),
  KEY `FK_puwshb8ptuseofvg0vd8iktd5` (`customer_id`),
  KEY `FK_qigvnreb2wbokr9mqqnr1b7k0` (`address_id`),
  CONSTRAINT `FK_puwshb8ptuseofvg0vd8iktd5` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `FK_qigvnreb2wbokr9mqqnr1b7k0` FOREIGN KEY (`address_id`) REFERENCES `customer_order_shipping_address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (1,'2019-05-11 16:00:56',31000,2,1);
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order_item`
--

DROP TABLE IF EXISTS `customer_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_order_item` (
  `customer_order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `customer_order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`customer_order_item_id`),
  KEY `FK_ptkdcent0wqq1itoh7fwulg9` (`customer_order_id`),
  CONSTRAINT `FK_ptkdcent0wqq1itoh7fwulg9` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_order` (`customer_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order_item`
--

LOCK TABLES `customer_order_item` WRITE;
/*!40000 ALTER TABLE `customer_order_item` DISABLE KEYS */;
INSERT INTO `customer_order_item` VALUES (1,10,'ASAT Classic Bluesboy Electric Guitar Mint Green',31000,1,1);
/*!40000 ALTER TABLE `customer_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order_shipping_address`
--

DROP TABLE IF EXISTS `customer_order_shipping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_order_shipping_address` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `original_shipping_address_id` bigint(20) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `customer_order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FK_1f6wj53n4da2g1kj8ec3wlnep` (`customer_order_id`),
  CONSTRAINT `FK_1f6wj53n4da2g1kj8ec3wlnep` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_order` (`customer_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order_shipping_address`
--

LOCK TABLES `customer_order_shipping_address` WRITE;
/*!40000 ALTER TABLE `customer_order_shipping_address` DISABLE KEYS */;
INSERT INTO `customer_order_shipping_address` VALUES (1,'F-404 Dwarka Suncrest Phase - 3','Pune','India','Bhavesh',1,'7022369080','Maharastra','411027',1);
/*!40000 ALTER TABLE `customer_order_shipping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_condition` varchar(255) NOT NULL,
  `product_date` datetime DEFAULT NULL,
  `product_description` text,
  `product_name` varchar(255) NOT NULL,
  `product_price` double NOT NULL,
  `product_summary` varchar(255) DEFAULT NULL,
  `product_tagsw` varchar(255) DEFAULT NULL,
  `product_views` bigint(20) NOT NULL DEFAULT '0',
  `unit_in_stock` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK_rlaghtegr0yx2c1q1s6nkqjlh` (`category_id`),
  CONSTRAINT `FK_rlaghtegr0yx2c1q1s6nkqjlh` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (5,'new','2019-10-05 20:19:33','Drums with 36\"','Yamaha Drum	',16000,'Yamaha Drum	','yamaha;drums',3,10,1),(8,'new','2019-11-05 11:34:25','From Rogue comes this amazing deal in the RA-90 dreadnought acoustic guitar. The Rogue guitar is an ideal instrument for the beginner, or young musician. The body depth and width bring out balanced tone and plenty of projection to be heard from across the room.','Rogue RA-090 Dreadnought Acoustic Guitar',5000,'Rogue RA-090 Dreadnought Acoustic Guitar','Acoustic;Guitar;Rogue',0,20,7),(9,'new','2019-11-05 11:35:46','Alvarez\'s Artist Series AP30SB Parlor is based on a traditional parlor guitar but built to offer a more modern sound with greater projection thanks to the effect of Alvarez\'s FSTM bracing on the solid A Sitka spruce and mahogany body. The AP30SB Parlor has a vintage vibe with a traditional teardrop Vintage Sunburst and open pore finish to the back and sides that helps the guitar perform even better.','Alvarez AP30SB Parlor Acoustic Guitar',10000,'A beautiful parlor with vintage looks and high-quality tonewood combination.','Alvarez;Acoustic;Guitar',0,50,7),(10,'new','2019-11-05 11:39:08','The G&L ASAT Classic Bluesboy is a factory-modded version of the traditional single-cutaway bolt-on axe. For players looking for the unmistakable warmth of a classic humbucker in the neck position, the Bluesboy delivers with a well-balanced pairing of a G&L alnico humbucker and a single-coil G&L bridge pickup.','ASAT Classic Bluesboy Electric Guitar Mint Green',31000,'G&L Limited Edition Tribute ASAT Classic Bluesboy Electric Guitar Mint Green','ASAT;Bluesboy;Electric;Guitar',3,50,6),(11,'new','2019-11-05 11:42:07','The pinnacle of Legator\'s product line, the X series guitars are built with exceptional precision and attention to quality.\r\n','Legator Ninja X 8 Multi-Scale Electric Guitar',135000,'Legator Ninja X 8 Multi-Scale Electric Guitar','Ninja;Electric;Guitar',0,60,6),(12,'new','2019-11-05 11:44:41','The result of working with pro drum instructors, the new Rogue 5-Piece Complete drum set includes everything a starting drummer needs to begin their musical journey. ','Rogue 5-Piece Complete Drum Set Wine Red',22500,'Start your drumming journey with a real drum kit.','drum;acoustic;Rogue',0,80,4),(13,'new','2019-11-05 11:46:47','The Sound Percussion Labs D1316 Lil Kicker 3-Piece Drum Kit is a drum set designed for junior drummers with full-size passion for music. ','Sound Percussion Labs Lil Kicker Drum',12700,'Sound Percussion Labs Lil Kicker - 3 Piece Jr Drum Set with Throne','drums;acoustic;junior',0,55,4),(14,'new','2019-11-05 11:49:27','The Simmons SD550 full-sized 5-piece mesh-head electronic drum kit creates an ultra-realistic drum configuration with features normally reserved for much more expensive kits. It’s ideal for gigging, practicing, recording and learning. \r\n','Simmons SD550 Electronic Drum Set with Mesh Pads',26200,'Simmons SD550 Electronic Drum Set with Mesh Pads','electric;drums;Simmons',0,90,5),(15,'new','2019-11-05 11:51:42','The NSPIRE Fusion Full Pack is a complete kit with module and trigger pads that install easily on top of your acoustic drums. With 10,12,14 in. tom trigger pads, a 14 in. snare trigger pad, a kick trigger pad that fits virtually any sized bass drum, as well as hi-hat, crash, and ride cymbal trigger pads, players can maintain the setup, feel and spacing of their acoustic kit. ','NFUZD Audio Inspire Fusion Full Pack',71500,'A hybrid set of trigger pads in fusion sizes with limitless possibilities.','drums;electric;NFUZD',0,80,5),(16,'new','2019-11-05 11:55:00','Slide into some classic country, Hawaiian, and blues tones with the affordable Rogue RLS1 Lap Steel Guitar.','Rogue RLS-1 Lap Steel Guitar with Stand and Gig Bag',5250,'A great whinin\' axe at a phenomenal price.','folk;guitars;Rogue',0,75,8),(17,'new','2019-11-05 11:56:03','Sporting a gorgeous finish, the Rogue RM-100A is a well-built, traditional A-model mandolin. It features clean workmanship throughout and projects a bright tone with lots of bark. ','Rogue RM-100A A-Style Mandolin',3760,'Easy to play and laughably easy to own!','folk;guitar;Rogue',0,70,8),(18,'new','2019-11-05 11:57:46','The Rogue Rocketeer electric guitar package includes the RR100 double cutaway guitar, gig bag, strap, guitar cable, picks, and a Rogue G10 solid-state guitar amp.\r\n','Rogue Rocketeer Electric Guitar Pack',7800,'A guitar pack with the essentials to get a young rocker started.','guitars;pack;Rogue',0,90,2),(19,'new','2019-11-05 12:00:01','The Williams Rhapsody 2 digital piano fills your home or studio with impressive looks, great sound, realistic feel and plenty of features. ','Williams Rhapsody 2 88-Key Console Digital Piano',37600,'Great sound, matches most decors.','pianos;Williams',0,90,9),(20,'new','2019-11-05 12:01:33','The new Suzuki MDG-4000ts Digital Grand Piano is a serious instrument for the serious musician that will capture your attention the second you turn it on. You won\'t believe the technology, touch, feel and sound packed into this beautiful Baby Grand Piano.','Suzuki MDG-4000ts TouchScreen Baby Grand Digital Piano Black',195000,'Rich in features, impeccable sound, convenient delivery.','pianos;Suzuki',0,45,9),(21,'new','2019-11-05 12:03:36','The MXL 990 remains one of the industry\'s most ground-breaking microphones. The first high quality condenser microphone to come into reach of working musicians, the MXL 990 has a FET preamp and a large diaphragm for truly professional sound quality in both digital and analog recordings. ','MXL 990 Condenser Microphone with Shockmount',5200,'Silky sweet high end with solid lows and mids.','microphones;MXL',0,75,3),(22,'new','2019-11-05 12:04:58','With four handheld mics, each on their own independent UHF channel, the VocoPro UHF-5805 gives you maximized vocal options without the fear of frequency interference. Wireless means that you are free from cables for more active performances that the crowd will never forget, plus with its rechargeable microphones and charger, the party can go all night. ','VocoPro UHF-5805 Plus Rechargeable Wireless System with Mic Bag',44900,'4-channel wireless system with 4 rechargeable mics and mic bag.','VocoPro;microphones',0,75,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_comment`
--

DROP TABLE IF EXISTS `product_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_comment` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_cotents` text,
  `comment_date` datetime DEFAULT NULL,
  `comment_starts` int(11) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_2iahns69ci0yvpqggvwh476ar` (`customer_id`),
  KEY `FK_par4rgtlb93x4i01q3x333c19` (`product_id`),
  CONSTRAINT `FK_2iahns69ci0yvpqggvwh476ar` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `FK_par4rgtlb93x4i01q3x333c19` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_comment`
--

LOCK TABLES `product_comment` WRITE;
/*!40000 ALTER TABLE `product_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tag`
--

DROP TABLE IF EXISTS `product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_tag` (
  `tag_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_contents` varchar(255) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `FK_2rkcr5ky2nboypb8b67s7ixai` (`product_id`),
  CONSTRAINT `FK_2rkcr5ky2nboypb8b67s7ixai` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tag`
--

LOCK TABLES `product_tag` WRITE;
/*!40000 ALTER TABLE `product_tag` DISABLE KEYS */;
INSERT INTO `product_tag` VALUES (9,'yamaha',5),(10,'drums',5),(18,'Acoustic',8),(19,'Guitar',8),(20,'Rogue',8),(21,'Alvarez',9),(22,'Acoustic',9),(23,'Guitar',9),(24,'ASAT',10),(25,'Bluesboy',10),(26,'Electric',10),(27,'Guitar',10),(28,'Ninja',11),(29,'Electric',11),(30,'Guitar',11),(31,'drum',12),(32,'acoustic',12),(33,'Rogue',12),(34,'drums',13),(35,'acoustic',13),(36,'junior',13),(37,'electric',14),(38,'drums',14),(39,'Simmons',14),(40,'drums',15),(41,'electric',15),(42,'NFUZD',15),(43,'folk',16),(44,'guitars',16),(45,'Rogue',16),(46,'folk',17),(47,'guitar',17),(48,'Rogue',17),(49,'guitars',18),(50,'pack',18),(51,'Rogue',18),(52,'pianos',19),(53,'Williams',19),(54,'pianos',20),(55,'Suzuki',20),(56,'microphones',21),(57,'MXL',21),(58,'VocoPro',22),(59,'microphones',22);
/*!40000 ALTER TABLE `product_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `FK_1gjlkmfrx4nrb14hjkb99rb1a` (`customer_id`),
  CONSTRAINT `FK_1gjlkmfrx4nrb14hjkb99rb1a` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN','bvpatidar@gmail.com',1),(2,'ROLE_ADMIN','admin@musicstore.com',2);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_address`
--

DROP TABLE IF EXISTS `shipping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipping_address` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FK_g6538l115arvyc2vcky8ld32o` (`customer_id`),
  CONSTRAINT `FK_g6538l115arvyc2vcky8ld32o` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_address`
--

LOCK TABLES `shipping_address` WRITE;
/*!40000 ALTER TABLE `shipping_address` DISABLE KEYS */;
INSERT INTO `shipping_address` VALUES (1,'F-404 Dwarka Suncrest Phase - 3','Pune','India','Bhavesh',_binary '','7022369080','Maharastra','411027',2);
/*!40000 ALTER TABLE `shipping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `slider` (
  `slider_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `slider_description` varchar(255) DEFAULT NULL,
  `slider_link` varchar(255) NOT NULL,
  `slider_title` varchar(255) NOT NULL,
  `slider_upper_data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`slider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
INSERT INTO `slider` VALUES (11,'Slickest and elegant guitar designs that you\'ll love to play again and again! ','guitars','Premium Guitars','Premium Guitars starting from $14000'),(12,'Use drums in your next event and experience royal feeling while rocking with it.','drums','Drums','Drums starting from $30000');
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-11 22:26:14
