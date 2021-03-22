-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: dailyfresh
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 用户',6,'add_user'),(22,'Can change 用户',6,'change_user'),(23,'Can delete 用户',6,'delete_user'),(24,'Can view 用户',6,'view_user'),(25,'Can add 地址',7,'add_address'),(26,'Can change 地址',7,'change_address'),(27,'Can delete 地址',7,'delete_address'),(28,'Can view 地址',7,'view_address'),(29,'Can add 商品SPU',8,'add_goods'),(30,'Can change 商品SPU',8,'change_goods'),(31,'Can delete 商品SPU',8,'delete_goods'),(32,'Can view 商品SPU',8,'view_goods'),(33,'Can add 商品',9,'add_goodssku'),(34,'Can change 商品',9,'change_goodssku'),(35,'Can delete 商品',9,'delete_goodssku'),(36,'Can view 商品',9,'view_goodssku'),(37,'Can add 商品种类',10,'add_goodstype'),(38,'Can change 商品种类',10,'change_goodstype'),(39,'Can delete 商品种类',10,'delete_goodstype'),(40,'Can view 商品种类',10,'view_goodstype'),(41,'Can add 主页促销活动',11,'add_indexpromotionbanner'),(42,'Can change 主页促销活动',11,'change_indexpromotionbanner'),(43,'Can delete 主页促销活动',11,'delete_indexpromotionbanner'),(44,'Can view 主页促销活动',11,'view_indexpromotionbanner'),(45,'Can add 主页分类展示商品',12,'add_indextypegoodsbanner'),(46,'Can change 主页分类展示商品',12,'change_indextypegoodsbanner'),(47,'Can delete 主页分类展示商品',12,'delete_indextypegoodsbanner'),(48,'Can view 主页分类展示商品',12,'view_indextypegoodsbanner'),(49,'Can add 首页轮播商品',13,'add_indexgoodsbanner'),(50,'Can change 首页轮播商品',13,'change_indexgoodsbanner'),(51,'Can delete 首页轮播商品',13,'delete_indexgoodsbanner'),(52,'Can view 首页轮播商品',13,'view_indexgoodsbanner'),(53,'Can add 商品图片',14,'add_goodsimage'),(54,'Can change 商品图片',14,'change_goodsimage'),(55,'Can delete 商品图片',14,'delete_goodsimage'),(56,'Can view 商品图片',14,'view_goodsimage'),(57,'Can add 订单商品',15,'add_ordergoods'),(58,'Can change 订单商品',15,'change_ordergoods'),(59,'Can delete 订单商品',15,'delete_ordergoods'),(60,'Can view 订单商品',15,'view_ordergoods'),(61,'Can add 订单',16,'add_orderinfo'),(62,'Can change 订单',16,'change_orderinfo'),(63,'Can delete 订单',16,'delete_orderinfo'),(64,'Can view 订单',16,'view_orderinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_address`
--

DROP TABLE IF EXISTS `df_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `addr` varchar(256) NOT NULL,
  `zip_code` varchar(6) DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_address_user_id_5e6a5c8a_fk_df_user_id` (`user_id`),
  CONSTRAINT `df_address_user_id_5e6a5c8a_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_address`
--

LOCK TABLES `df_address` WRITE;
/*!40000 ALTER TABLE `df_address` DISABLE KEYS */;
INSERT INTO `df_address` VALUES (1,'2021-03-12 06:02:41.986329','2021-03-12 06:02:41.986370',0,'zzz','123','123123','13322333311',1,1),(2,'2021-03-12 06:04:04.973115','2021-03-12 06:04:04.973173',0,'123','333','123123','13322333322',0,1),(3,'2021-03-12 06:04:47.459846','2021-03-12 06:04:47.459897',0,'13322333322','3333','123123','13322223333',0,1);
/*!40000 ALTER TABLE `df_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods`
--

DROP TABLE IF EXISTS `df_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `detail` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods`
--

LOCK TABLES `df_goods` WRITE;
/*!40000 ALTER TABLE `df_goods` DISABLE KEYS */;
INSERT INTO `df_goods` VALUES (3,'2021-03-12 05:52:00.297256','2021-03-22 08:43:46.953180',0,'好东西天天来买啊','<p>好东西天天来买啊</p>\r\n<p><span style=\"font-size: 10px;\">好东西天天来买啊</span></p>\r\n<p><span style=\"font-size: 10px;\">好东西天天来买啊</span></p>\r\n<p><span style=\"font-size: 10px;\">好东西天天来买啊</span></p>');
/*!40000 ALTER TABLE `df_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_image`
--

DROP TABLE IF EXISTS `df_goods_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_goods_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `sku_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_image_sku_id_f8dc96ea_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_goods_image_sku_id_f8dc96ea_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_image`
--

LOCK TABLES `df_goods_image` WRITE;
/*!40000 ALTER TABLE `df_goods_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `df_goods_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_sku`
--

DROP TABLE IF EXISTS `df_goods_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_goods_sku` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `desc` varchar(256) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unite` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock` int NOT NULL,
  `sales` int NOT NULL,
  `status` smallint NOT NULL,
  `goods_id` int NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_sku_goods_id_31622280_fk_df_goods_id` (`goods_id`),
  KEY `df_goods_sku_type_id_576de3b4_fk_df_goods_type_id` (`type_id`),
  CONSTRAINT `df_goods_sku_goods_id_31622280_fk_df_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `df_goods` (`id`),
  CONSTRAINT `df_goods_sku_type_id_576de3b4_fk_df_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `df_goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_sku`
--

LOCK TABLES `df_goods_sku` WRITE;
/*!40000 ALTER TABLE `df_goods_sku` DISABLE KEYS */;
INSERT INTO `df_goods_sku` VALUES (6,'2021-03-12 05:52:22.671054','2021-03-22 09:26:35.760539',1,'123键盘','123',123.00,'123','goods/webwxgetmsgimg1.jpeg',118,116,1,3,14);
/*!40000 ALTER TABLE `df_goods_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_type`
--

DROP TABLE IF EXISTS `df_goods_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_goods_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `logo` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_type`
--

LOCK TABLES `df_goods_type` WRITE;
/*!40000 ALTER TABLE `df_goods_type` DISABLE KEYS */;
INSERT INTO `df_goods_type` VALUES (14,'2021-03-12 05:51:50.187791','2021-03-22 08:44:06.317747',1,'很好的东西','333','type/webwxgetmsgimg1.jpeg');
/*!40000 ALTER TABLE `df_goods_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_index_banner`
--

DROP TABLE IF EXISTS `df_index_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_index_banner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint NOT NULL,
  `sku_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_banner_sku_id_57f2798e_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_index_banner_sku_id_57f2798e_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_index_banner`
--

LOCK TABLES `df_index_banner` WRITE;
/*!40000 ALTER TABLE `df_index_banner` DISABLE KEYS */;
INSERT INTO `df_index_banner` VALUES (2,'2021-03-12 05:52:40.788616','2021-03-12 05:52:40.788660',1,'banner/2020-03-18_16-50-07屏幕截图.png',1,6);
/*!40000 ALTER TABLE `df_index_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_index_promotion`
--

DROP TABLE IF EXISTS `df_index_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_index_promotion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `index` smallint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_index_promotion`
--

LOCK TABLES `df_index_promotion` WRITE;
/*!40000 ALTER TABLE `df_index_promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `df_index_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_index_type_goods`
--

DROP TABLE IF EXISTS `df_index_type_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_index_type_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `display_type` smallint NOT NULL,
  `index` smallint NOT NULL,
  `sku_id` int NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_index_type_goods_sku_id_0a8a17db_fk_df_goods_sku_id` (`sku_id`),
  KEY `df_index_type_goods_type_id_35192ffd_fk_df_goods_type_id` (`type_id`),
  CONSTRAINT `df_index_type_goods_sku_id_0a8a17db_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`),
  CONSTRAINT `df_index_type_goods_type_id_35192ffd_fk_df_goods_type_id` FOREIGN KEY (`type_id`) REFERENCES `df_goods_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_index_type_goods`
--

LOCK TABLES `df_index_type_goods` WRITE;
/*!40000 ALTER TABLE `df_index_type_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `df_index_type_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_goods`
--

DROP TABLE IF EXISTS `df_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_order_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `count` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `sku_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_order_goods_order_id_6958ee23_fk_df_order_info_order_id` (`order_id`),
  KEY `df_order_goods_sku_id_b7d6e04e_fk_df_goods_sku_id` (`sku_id`),
  CONSTRAINT `df_order_goods_order_id_6958ee23_fk_df_order_info_order_id` FOREIGN KEY (`order_id`) REFERENCES `df_order_info` (`order_id`),
  CONSTRAINT `df_order_goods_sku_id_b7d6e04e_fk_df_goods_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `df_goods_sku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_goods`
--

LOCK TABLES `df_order_goods` WRITE;
/*!40000 ALTER TABLE `df_order_goods` DISABLE KEYS */;
INSERT INTO `df_order_goods` VALUES (1,'2021-03-12 06:02:59.294135','2021-03-17 01:19:11.008240',0,1,123.00,'123','202103121402591',6),(2,'2021-03-12 07:13:24.341848','2021-03-12 07:13:24.341883',0,1,123.00,'','202103121513241',6),(3,'2021-03-16 01:24:57.531364','2021-03-16 01:32:59.620671',0,1,123.00,'123','202103160924571',6),(4,'2021-03-17 01:15:19.943660','2021-03-17 01:15:19.943718',0,1,123.00,'','202103170915191',6),(5,'2021-03-22 09:26:35.759238','2021-03-22 09:26:35.759288',0,1,123.00,'','202103221726351',6);
/*!40000 ALTER TABLE `df_order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_info`
--

DROP TABLE IF EXISTS `df_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_order_info` (
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `pay_method` smallint NOT NULL,
  `total_count` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `transit_price` decimal(10,2) NOT NULL,
  `order_status` smallint NOT NULL,
  `trade_no` varchar(128) NOT NULL,
  `addr_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `df_order_info_addr_id_70c3726e_fk_df_address_id` (`addr_id`),
  KEY `df_order_info_user_id_ac1e5bf5_fk_df_user_id` (`user_id`),
  CONSTRAINT `df_order_info_addr_id_70c3726e_fk_df_address_id` FOREIGN KEY (`addr_id`) REFERENCES `df_address` (`id`),
  CONSTRAINT `df_order_info_user_id_ac1e5bf5_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_info`
--

LOCK TABLES `df_order_info` WRITE;
/*!40000 ALTER TABLE `df_order_info` DISABLE KEYS */;
INSERT INTO `df_order_info` VALUES ('2021-03-12 06:02:59.284593','2021-03-17 01:19:11.029453',0,'202103121402591',3,1,123.00,10.00,5,'2021031722001454310500965584',1,1),('2021-03-12 07:13:24.301168','2021-03-12 07:13:24.377580',0,'202103121513241',3,1,123.00,10.00,1,'',3,1),('2021-03-16 01:24:57.519217','2021-03-16 01:32:59.646466',0,'202103160924571',3,1,123.00,10.00,5,'2021031622001454310500965749',1,1),('2021-03-17 01:15:19.914152','2021-03-17 01:15:20.036609',0,'202103170915191',1,1,123.00,10.00,1,'',1,1),('2021-03-22 09:26:35.749782','2021-03-22 09:26:36.581564',0,'202103221726351',1,1,123.00,10.00,1,'',3,1);
/*!40000 ALTER TABLE `df_order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_user`
--

DROP TABLE IF EXISTS `df_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_user`
--

LOCK TABLES `df_user` WRITE;
/*!40000 ALTER TABLE `df_user` DISABLE KEYS */;
INSERT INTO `df_user` VALUES (1,'pbkdf2_sha256$150000$6o07sK2WdhB5$1O2LJsxbdeL086LMLIEDuWkxUHdjVTZgCmEcU5N6J+Q=','2021-03-05 09:20:12.289461',1,'qwer1','','','wqer@1.com',1,1,'2021-03-05 06:43:54.844289','2021-03-05 06:43:54.976259','2021-03-05 06:43:54.976275',0);
/*!40000 ALTER TABLE `df_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_user_groups`
--

DROP TABLE IF EXISTS `df_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `df_user_groups_user_id_group_id_80e5ab91_uniq` (`user_id`,`group_id`),
  KEY `df_user_groups_group_id_36f24e94_fk_auth_group_id` (`group_id`),
  CONSTRAINT `df_user_groups_group_id_36f24e94_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `df_user_groups_user_id_a816b098_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_user_groups`
--

LOCK TABLES `df_user_groups` WRITE;
/*!40000 ALTER TABLE `df_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `df_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_user_user_permissions`
--

DROP TABLE IF EXISTS `df_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `df_user_user_permissions_user_id_permission_id_b22997de_uniq` (`user_id`,`permission_id`),
  KEY `df_user_user_permiss_permission_id_40a6cb2d_fk_auth_perm` (`permission_id`),
  CONSTRAINT `df_user_user_permiss_permission_id_40a6cb2d_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `df_user_user_permissions_user_id_b5f6551b_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_user_user_permissions`
--

LOCK TABLES `df_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `df_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `df_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_df_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_df_user_id` FOREIGN KEY (`user_id`) REFERENCES `df_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-03-05 07:00:05.719917','6','123',1,'[{\"added\": {}}]',10,1),(2,'2021-03-05 07:04:16.776183','1','123',1,'[{\"added\": {}}]',8,1),(3,'2021-03-05 07:04:27.072218','1','123',1,'[{\"added\": {}}]',9,1),(4,'2021-03-05 07:04:46.826395','1','IndexGoodsBanner object (1)',1,'[{\"added\": {}}]',13,1),(5,'2021-03-05 07:13:19.554928','1','IndexGoodsBanner object (1)',3,'',13,1),(6,'2021-03-05 07:15:21.954902','1','123ddd',1,'[{\"added\": {}}]',11,1),(7,'2021-03-05 07:51:02.658128','2','123',1,'[{\"added\": {}}]',11,1),(8,'2021-03-05 07:56:28.002061','3','123',1,'[{\"added\": {}}]',11,1),(9,'2021-03-05 08:12:00.787092','7','123',1,'[{\"added\": {}}]',10,1),(10,'2021-03-05 08:34:54.312084','8','1231',1,'[{\"added\": {}}]',10,1),(11,'2021-03-05 08:35:32.353190','9','1233',1,'[{\"added\": {}}]',10,1),(12,'2021-03-05 08:48:16.395270','10','123',1,'[{\"added\": {}}]',10,1),(13,'2021-03-05 08:49:36.107952','10','123',3,'',10,1),(14,'2021-03-05 08:49:36.134192','9','1233',3,'',10,1),(15,'2021-03-05 08:49:36.157553','8','1231',3,'',10,1),(16,'2021-03-05 08:49:36.174519','7','123',3,'',10,1),(17,'2021-03-05 08:49:36.195420','6','123',3,'',10,1),(18,'2021-03-05 08:50:12.197295','1','123',3,'',8,1),(19,'2021-03-05 08:56:16.736389','11','123',1,'[{\"added\": {}}]',10,1),(20,'2021-03-05 09:03:56.972124','12','123',1,'[{\"added\": {}}]',10,1),(21,'2021-03-05 09:07:21.679070','12','123',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',10,1),(22,'2021-03-05 09:09:43.990979','2','1233',1,'[{\"added\": {}}]',8,1),(23,'2021-03-05 09:10:05.613483','2','333',1,'[{\"added\": {}}]',9,1),(24,'2021-03-05 09:11:51.003121','2','333',2,'[]',9,1),(25,'2021-03-05 09:12:13.973297','3','12333d',1,'[{\"added\": {}}]',9,1),(26,'2021-03-05 09:17:24.283435','4','123',1,'[{\"added\": {}}]',9,1),(27,'2021-03-05 09:19:33.563055','5','123',1,'[{\"added\": {}}]',9,1),(28,'2021-03-08 01:51:09.064018','5','123',3,'',9,1),(29,'2021-03-08 01:51:09.095323','4','123',3,'',9,1),(30,'2021-03-08 01:51:09.120474','3','12333d',3,'',9,1),(31,'2021-03-08 01:51:09.137947','2','333',3,'',9,1),(32,'2021-03-08 01:51:14.187040','12','123',3,'',10,1),(33,'2021-03-08 01:51:14.210411','11','123',3,'',10,1),(34,'2021-03-08 02:14:46.516640','2','1233',3,'',8,1),(35,'2021-03-08 02:15:22.631777','13','ddd',1,'[{\"added\": {}}]',10,1),(36,'2021-03-08 02:16:05.598828','3','123',3,'',11,1),(37,'2021-03-08 02:16:05.612831','2','123',3,'',11,1),(38,'2021-03-08 02:16:05.628798','1','123ddd',3,'',11,1),(39,'2021-03-12 05:50:53.188559','13','ddd',3,'',10,1),(40,'2021-03-12 05:51:50.208101','14','123',1,'[{\"added\": {}}]',10,1),(41,'2021-03-12 05:52:00.328007','3','1233',1,'[{\"added\": {}}]',8,1),(42,'2021-03-12 05:52:22.712388','6','333',1,'[{\"added\": {}}]',9,1),(43,'2021-03-12 05:52:40.807342','2','IndexGoodsBanner object (2)',1,'[{\"added\": {}}]',13,1),(44,'2021-03-22 08:41:23.318880','6','333',3,'',9,1),(45,'2021-03-22 08:41:28.602557','6','333',3,'',9,1),(46,'2021-03-22 08:41:33.602450','6','333',3,'',9,1),(47,'2021-03-22 08:41:42.823858','6','333',2,'[{\"changed\": {\"fields\": [\"is_delete\"]}}]',9,1),(48,'2021-03-22 08:41:48.046961','6','333',3,'',9,1),(49,'2021-03-22 08:42:20.280764','3','1233',3,'',8,1),(50,'2021-03-22 08:42:28.225775','14','123',3,'',10,1),(51,'2021-03-22 08:43:46.973519','3','好东西天天来买啊',2,'[{\"changed\": {\"fields\": [\"name\", \"detail\"]}}]',8,1),(52,'2021-03-22 08:44:06.335361','14','很好的东西',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',10,1),(53,'2021-03-22 08:44:11.487956','6','333',2,'[]',9,1),(54,'2021-03-22 08:45:26.307329','6','键盘一把',2,'[{\"changed\": {\"fields\": [\"name\", \"image\"]}}]',9,1),(55,'2021-03-22 09:01:14.520085','6','键盘一把1',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(56,'2021-03-22 09:01:55.646626','6','123',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(57,'2021-03-22 09:05:09.016115','6','123 键盘',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(58,'2021-03-22 09:05:33.085325','6','123键盘',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'goods','goods'),(14,'goods','goodsimage'),(9,'goods','goodssku'),(10,'goods','goodstype'),(13,'goods','indexgoodsbanner'),(11,'goods','indexpromotionbanner'),(12,'goods','indextypegoodsbanner'),(15,'order','ordergoods'),(16,'order','orderinfo'),(5,'sessions','session'),(7,'user','address'),(6,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-03-05 06:43:14.378823'),(2,'contenttypes','0002_remove_content_type_name','2021-03-05 06:43:15.013684'),(3,'auth','0001_initial','2021-03-05 06:43:15.388278'),(4,'auth','0002_alter_permission_name_max_length','2021-03-05 06:43:16.685532'),(5,'auth','0003_alter_user_email_max_length','2021-03-05 06:43:16.734590'),(6,'auth','0004_alter_user_username_opts','2021-03-05 06:43:16.753953'),(7,'auth','0005_alter_user_last_login_null','2021-03-05 06:43:16.778891'),(8,'auth','0006_require_contenttypes_0002','2021-03-05 06:43:16.797924'),(9,'auth','0007_alter_validators_add_error_messages','2021-03-05 06:43:16.823376'),(10,'auth','0008_alter_user_username_max_length','2021-03-05 06:43:16.842984'),(11,'auth','0009_alter_user_last_name_max_length','2021-03-05 06:43:16.873357'),(12,'auth','0010_alter_group_name_max_length','2021-03-05 06:43:16.928423'),(13,'auth','0011_update_proxy_permissions','2021-03-05 06:43:16.968628'),(14,'user','0001_initial','2021-03-05 06:43:17.537012'),(15,'admin','0001_initial','2021-03-05 06:43:19.278398'),(16,'admin','0002_logentry_remove_auto_add','2021-03-05 06:43:19.834772'),(17,'admin','0003_logentry_add_action_flag_choices','2021-03-05 06:43:19.873530'),(18,'goods','0001_initial','2021-03-05 06:43:20.904531'),(19,'goods','0002_auto_20190923_1554','2021-03-05 06:43:22.760351'),(20,'goods','0003_auto_20200412_1503','2021-03-05 06:43:23.590502'),(21,'order','0001_initial','2021-03-05 06:43:23.860398'),(22,'order','0002_auto_20190916_1514','2021-03-05 06:43:24.251330'),(23,'order','0003_auto_20190923_1554','2021-03-05 06:43:25.400392'),(24,'sessions','0001_initial','2021-03-05 06:43:25.529111'),(25,'user','0002_auto_20190923_1554','2021-03-05 06:43:25.686848');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-22  9:32:24
