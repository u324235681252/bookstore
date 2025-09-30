-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore_dj
-- ------------------------------------------------------
-- Server version	8.0.30

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
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `date_joined` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$0JSdpwNGW89izghmexmRFT$MkJh2qyGx6kBs/rqx2tZVK0oZDt4s5V9pD/G2p31eKk=','2025-09-30 13:10:48.604753',1,'admin','Администратор','Системы','admin@bookstore.ru',1,1,'2025-09-30 15:57:49'),(2,'pbkdf2_sha256$720000$UGBTrvmPD2TPclxALMgAtP$YNLZ3LTIbhSj3UIairld3yRxb82LpqJz4jOrKz1X5iI=','2025-09-30 13:08:16.462112',0,'user1','Иван','Петров','ivan@example.com',0,1,'2025-09-30 15:57:49'),(3,'pbkdf2_sha256$720000$UGBTrvmPD2TPclxALMgAtP$YNLZ3LTIbhSj3UIairld3yRxb82LpqJz4jOrKz1X5iI=',NULL,0,'user2','Мария','Иванова','maria@example.com',0,1,'2025-09-30 15:57:49');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-09-30 12:58:33.357943'),(2,'auth','0001_initial','2025-09-30 13:02:29.191338'),(3,'admin','0001_initial','2025-09-30 13:02:29.385896'),(4,'admin','0002_logentry_remove_auto_add','2025-09-30 13:02:29.401122'),(5,'admin','0003_logentry_add_action_flag_choices','2025-09-30 13:02:29.408231'),(6,'contenttypes','0002_remove_content_type_name','2025-09-30 13:02:29.480943'),(7,'auth','0002_alter_permission_name_max_length','2025-09-30 13:02:29.529959'),(8,'auth','0003_alter_user_email_max_length','2025-09-30 13:02:29.560214'),(9,'auth','0004_alter_user_username_opts','2025-09-30 13:02:29.566675'),(10,'auth','0005_alter_user_last_login_null','2025-09-30 13:02:29.643434'),(11,'auth','0006_require_contenttypes_0002','2025-09-30 13:02:29.644963'),(12,'auth','0007_alter_validators_add_error_messages','2025-09-30 13:02:29.651159'),(13,'auth','0008_alter_user_username_max_length','2025-09-30 13:02:29.671674'),(14,'auth','0009_alter_user_last_name_max_length','2025-09-30 13:02:29.690280'),(15,'auth','0010_alter_group_name_max_length','2025-09-30 13:02:29.700513'),(16,'auth','0011_update_proxy_permissions','2025-09-30 13:02:29.708573'),(17,'auth','0012_alter_user_first_name_max_length','2025-09-30 13:02:29.728780'),(18,'sessions','0001_initial','2025-09-30 13:02:29.781817');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('xowaq6whmzn81lotu3y4zzd6kwk4937x','.eJxVjEEOwiAQRe_C2pAOg3Vw6b5naAYYpGogKe3KeHfbpAvdvvf-f6uR1yWPa5N5nKK6KlCnX-Y5PKXsIj643KsOtSzz5PWe6MM2PdQor9vR_h1kbnlbJ_YQOmBvPFm8IFNIDslu1AAGFjJewBF19mwTQO_I9V1KaAXFIKrPF-dmN2g:1v3a80:u-PSGHKhMFUV61m7aUUGJWuLEE6_3FWavE5hr5ywXuY','2025-10-14 13:10:48.607447');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_author`
--

DROP TABLE IF EXISTS `shop_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biography` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_author`
--

LOCK TABLES `shop_author` WRITE;
/*!40000 ALTER TABLE `shop_author` DISABLE KEYS */;
INSERT INTO `shop_author` VALUES (1,'Фёдор Достоевский','Великий русский писатель, мыслитель, философ и публицист.'),(2,'Лев Толстой','Русский писатель и мыслитель, один из величайших писателей мира.'),(3,'Михаил Булгаков','Русский писатель, драматург, театральный режиссёр и актёр.'),(4,'Джордж Оруэлл','Британский писатель и публицист.'),(5,'Рэй Брэдбери','Американский писатель-фантаст, автор более восьмисот литературных произведений.'),(6,'Габриэль Гарсиа Маркес','Колумбийский писатель-прозаик, журналист, издатель и политический деятель.'),(7,'Эрих Мария Ремарк','Немецкий писатель XX века.'),(8,'Харпер Ли','Американская писательница, автор романа \"Убить пересмешника\".'),(9,'Джейн Остин','Английская писательница, провозвестница реализма в британской литературе.'),(10,'Антуан де Сент-Экзюпери','Французский писатель, поэт, эссеист и профессиональный лётчик.'),(11,'Стивен Кинг','Американский писатель, работающий в разнообразных жанрах.'),(12,'Агата Кристи','Английская писательница, самый известный автор детективных романов.'),(13,'Артур Конан Дойл','Шотландский и английский врач и писатель.'),(14,'Джоан Роулинг','Британская писательница, сценарист и кинопродюсер.'),(15,'Дэн Браун','Американский писатель, автор триллеров.');
/*!40000 ALTER TABLE `shop_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_book`
--

DROP TABLE IF EXISTS `shop_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `isbn` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages` int NOT NULL,
  `language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Русский',
  `publisher` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `rental_price_2weeks` decimal(10,2) NOT NULL,
  `rental_price_1month` decimal(10,2) NOT NULL,
  `rental_price_3months` decimal(10,2) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'available',
  `stock` int DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `author_id` (`author_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `shop_book_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `shop_author` (`id`),
  CONSTRAINT `shop_book_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_book`
--

LOCK TABLES `shop_book` WRITE;
/*!40000 ALTER TABLE `shop_book` DISABLE KEYS */;
INSERT INTO `shop_book` VALUES (1,'Преступление и наказание',1,4,'Один из самых значительных романов в мировой литературе. История Родиона Раскольникова, бедного студента, который совершает убийство и переживает моральные муки.',1866,'9785170123456',671,'Русский','АСТ','https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400&h=600&fit=crop','',850.00,150.00,250.00,500.00,'available',4,'2025-09-30 15:57:49','2025-09-30 13:11:23'),(2,'Война и мир',2,4,'Роман-эпопея о русском обществе в эпоху войн против Наполеона. Считается одним из величайших романов мира.',1869,'9785170234567',1300,'Русский','Эксмо','https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=600&fit=crop',NULL,1200.00,200.00,350.00,700.00,'available',3,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(3,'Мастер и Маргарита',3,1,'Культовый роман о дьяволе, посетившем Москву 1930-х годов, о Мастере и его возлюбленной Маргарите. Сочетание мистики, сатиры и философии.',1967,'9785170345678',480,'Русский','АСТ','https://images.unsplash.com/photo-1541963463532-d68292c34b19?w=400&h=600&fit=crop',NULL,650.00,120.00,200.00,400.00,'available',7,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(4,'1984',4,2,'Антиутопический роман-предупреждение об опасностях тоталитаризма. История Уинстона Смита в мире тотального контроля.',1949,'9785170456789',320,'Русский','АСТ','https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=600&fit=crop',NULL,550.00,100.00,180.00,350.00,'available',10,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(5,'451 градус по Фаренгейту',5,2,'Антиутопия о будущем, где все книги подлежат сожжению. История пожарного Гая Монтэга, чья работа — сжигать книги.',1953,'9785170567890',256,'Русский','Эксмо','https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=600&fit=crop',NULL,480.00,90.00,160.00,320.00,'available',8,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(6,'Сто лет одиночества',6,1,'Магическая история семьи Буэндиа в вымышленном городе Макондо. Шедевр магического реализма.',1967,'9785170678901',416,'Русский','АСТ','https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=400&h=600&fit=crop',NULL,720.00,130.00,220.00,440.00,'available',4,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(7,'Триумфальная арка',7,1,'Роман о любви во времена фашизма. История хирурга-эмигранта и актрисы в предвоенном Париже.',1945,'9785170789012',512,'Русский','АСТ','https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=600&fit=crop',NULL,680.00,125.00,210.00,420.00,'available',6,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(8,'Убить пересмешника',8,1,'Классический роман о расовой несправедливости на американском Юге. История глазами маленькой девочки Джин Луизы Финч.',1960,'9785170890123',384,'Русский','АСТ','https://images.unsplash.com/photo-1495446815901-a7297e633e8d?w=400&h=600&fit=crop',NULL,590.00,110.00,190.00,380.00,'available',5,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(9,'Гордость и предубеждение',9,4,'Классический роман о любви и браке в английском обществе начала XIX века. История Элизабет Беннет и мистера Дарси.',1813,'9785170901234',432,'Русский','Эксмо','https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=600&fit=crop',NULL,520.00,95.00,170.00,340.00,'available',7,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(10,'Маленький принц',10,10,'Философская сказка о маленьком мальчике с другой планеты. Книга о дружбе, любви и ответственности.',1943,'9785171012345',96,'Русский','Эксмо','https://images.unsplash.com/photo-1546484396-fb3fc6f95f98?w=400&h=600&fit=crop',NULL,320.00,60.00,100.00,200.00,'available',15,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(11,'Сияние',11,3,'Хоррор-роман о семье, проводящей зиму в изолированном отеле Overlook. История о безумии и сверхъестественном.',1977,'9785171123456',512,'Русский','АСТ','https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=600&fit=crop',NULL,650.00,120.00,200.00,400.00,'available',6,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(12,'Убийство в Восточном экспрессе',12,3,'Детективный роман о расследовании убийства в поезде. Великий сыщик Эркюль Пуаро раскрывает сложное преступление.',1934,'9785171234567',256,'Русский','Эксмо','https://images.unsplash.com/photo-1554200876-56c2f25224fa?w=400&h=600&fit=crop',NULL,450.00,85.00,150.00,300.00,'available',8,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(13,'Приключения Шерлока Холмса',13,3,'Сборник рассказов о великом детективе. Загадочные преступления и блестящая дедукция.',1892,'9785171345678',320,'Русский','АСТ','https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=600&fit=crop',NULL,480.00,90.00,160.00,320.00,'available',9,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(14,'Гарри Поттер и философский камень',14,10,'Первая книга о мальчике-волшебнике. Начало магического путешествия Гарри Поттера.',1997,'9785171456789',432,'Русский','Росмэн','https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400&h=600&fit=crop',NULL,750.00,140.00,230.00,460.00,'available',12,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(15,'Код да Винчи',15,3,'Захватывающий триллер о поисках Святого Грааля. Профессор Роберт Лэнгдон расследует убийство в Лувре.',2003,'9785171567890',592,'Русский','АСТ','https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400&h=600&fit=crop',NULL,680.00,125.00,210.00,420.00,'available',7,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(16,'Анна Каренина',2,4,'Роман о трагической любви замужней дамы Анны Карениной и блестящего офицера Вронского. Глубокое исследование человеческих отношений.',1877,'9785171678901',864,'Русский','АСТ','https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=600&fit=crop',NULL,950.00,170.00,280.00,560.00,'available',4,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(17,'Идиот',1,4,'Роман о князе Мышкине, человеке исключительной доброты и честности в коррумпированном обществе.',1869,'9785171789012',640,'Русский','Эксмо','https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=600&fit=crop',NULL,780.00,145.00,240.00,480.00,'available',5,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(18,'Скотный двор',4,2,'Сатирическая антиутопия-притча о тоталитаризме. Аллегория на события, приведшие к сталинскому режиму.',1945,'9785171890123',128,'Русский','АСТ','https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=600&fit=crop',NULL,350.00,65.00,110.00,220.00,'available',10,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(19,'Марсианские хроники',5,2,'Цикл рассказов о колонизации Марса. Поэтическая хроника освоения красной планеты.',1950,'9785171901234',288,'Русский','Эксмо','https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400&h=600&fit=crop',NULL,520.00,95.00,170.00,340.00,'available',6,'2025-09-30 15:57:49','2025-09-30 15:57:49'),(20,'Три товарища',7,1,'Роман о дружбе, любви и верности в послевоенной Германии. История трёх фронтовых друзей.',1936,'9785172012345',480,'Русский','АСТ','https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=400&h=600&fit=crop',NULL,620.00,115.00,195.00,390.00,'available',8,'2025-09-30 15:57:49','2025-09-30 15:57:49');
/*!40000 ALTER TABLE `shop_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category`
--

LOCK TABLES `shop_category` WRITE;
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` VALUES (1,'Художественная литература','fiction'),(2,'Фантастика','sci-fi'),(3,'Детективы','detective'),(4,'Классика','classics'),(5,'Научная литература','science'),(6,'Бизнес','business'),(7,'Саморазвитие','self-help'),(8,'История','history'),(9,'Психология','psychology'),(10,'Детская литература','children');
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_purchase`
--

DROP TABLE IF EXISTS `shop_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_purchase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `purchased_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `shop_purchase_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `shop_purchase_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `shop_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_purchase`
--

LOCK TABLES `shop_purchase` WRITE;
/*!40000 ALTER TABLE `shop_purchase` DISABLE KEYS */;
INSERT INTO `shop_purchase` VALUES (1,1,1,850.00,'2025-09-30 13:11:23');
/*!40000 ALTER TABLE `shop_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_rental`
--

DROP TABLE IF EXISTS `shop_rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_rental` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `rental_period` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rented_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `expires_at` datetime NOT NULL,
  `returned` tinyint(1) NOT NULL DEFAULT '0',
  `reminder_sent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `shop_rental_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `shop_rental_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `shop_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_rental`
--

LOCK TABLES `shop_rental` WRITE;
/*!40000 ALTER TABLE `shop_rental` DISABLE KEYS */;
INSERT INTO `shop_rental` VALUES (1,1,1,14,150.00,'2025-09-30 13:09:28','2025-10-14 13:09:28',0,0);
/*!40000 ALTER TABLE `shop_rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_userprofile`
--

DROP TABLE IF EXISTS `shop_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_userprofile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `email_notifications` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `shop_userprofile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_userprofile`
--

LOCK TABLES `shop_userprofile` WRITE;
/*!40000 ALTER TABLE `shop_userprofile` DISABLE KEYS */;
INSERT INTO `shop_userprofile` VALUES (1,1,'+7 (999) 123-45-67','г. Москва, ул. Ленина, д. 1',1),(2,2,'+7 (999) 234-56-78','г. Санкт-Петербург, Невский пр., д. 10',1),(3,3,'+7 (999) 345-67-89','г. Екатеринбург, ул. Малышева, д. 5',1);
/*!40000 ALTER TABLE `shop_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-30 16:18:07
