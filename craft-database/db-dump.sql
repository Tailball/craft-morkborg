-- MySQL dump 10.13  Distrib 5.7.30, for osx10.12 (x86_64)
--
-- Host: localhost    Database: craftmorkborg
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  KEY `assets_uploaderId_fk` (`uploaderId`),
  CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (15,1,1,1,'MB_logo_pixel.png','image',1155,804,333915,NULL,NULL,NULL,'2020-12-16 15:31:32','2020-12-16 15:31:32','2020-12-16 15:31:32','c8f38cb3-4880-4ec5-9dac-4563534950c0'),(16,1,1,1,'MB_logo_pixel_2020-12-16-153144.png','image',1155,804,333915,NULL,0,0,'2020-12-16 15:32:15','2020-12-16 15:32:15','2020-12-16 15:32:15','92b1952b-2677-4ec7-99ea-ce992239ec44'),(18,1,1,1,'mb-Banner.jpg','image',1728,750,1018485,NULL,NULL,NULL,'2020-12-17 13:09:09','2020-12-17 13:09:09','2020-12-17 13:09:09','16f23069-0c39-4620-a447-881f54b6d993'),(19,1,1,1,'mb-article-1.webp','image',1950,1300,286736,NULL,NULL,NULL,'2020-12-17 13:09:11','2020-12-17 13:09:11','2020-12-17 13:09:11','ab4001ee-c202-4052-b085-7a08ad9c09a3'),(20,1,1,1,'mb-article-2.webp','image',1950,1300,542574,NULL,NULL,NULL,'2020-12-17 13:09:14','2020-12-17 13:09:14','2020-12-17 13:09:14','6991d66d-64b1-4d6b-a0ea-4681c6e25802'),(21,1,1,1,'mb-article-3.webp','image',1950,1300,321352,NULL,NULL,NULL,'2020-12-17 13:09:16','2020-12-17 13:09:17','2020-12-17 13:09:17','f548881e-f5ac-4774-af52-e2592eb81db0'),(22,1,1,1,'mb-article-4.webp','image',1447,965,174494,NULL,NULL,NULL,'2020-12-17 13:09:18','2020-12-17 13:09:18','2020-12-17 13:09:18','8d6b9e90-e6f7-4dac-abae-21490b213146'),(23,1,1,1,'mb-article-5.webp','image',1950,1300,297218,NULL,NULL,NULL,'2020-12-17 13:09:20','2020-12-17 13:09:21','2020-12-17 13:09:21','464e14ca-dc02-40a2-bb00-90662922e28e');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransformindex`
--

LOCK TABLES `assettransformindex` WRITE;
/*!40000 ALTER TABLE `assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransforms_name_idx` (`name`),
  KEY `assettransforms_handle_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  KEY `categories_parentId_fk` (`parentId`),
  CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categorygroups_name_idx` (`name`),
  KEY `categorygroups_handle_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedattributes_siteId_fk` (`siteId`),
  KEY `changedattributes_userId_fk` (`userId`),
  CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (2,1,'title','2020-12-16 15:24:55',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedfields_siteId_fk` (`siteId`),
  KEY `changedfields_fieldId_fk` (`fieldId`),
  KEY `changedfields_userId_fk` (`userId`),
  CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (2,1,1,'2020-12-16 14:38:19',0,1),(2,1,2,'2020-12-16 14:44:05',0,1),(2,1,5,'2020-12-17 13:39:44',0,1),(2,1,10,'2020-12-16 15:34:12',0,1),(2,1,11,'2020-12-17 10:57:23',0,1),(17,1,12,'2020-12-17 13:10:09',0,1),(17,1,13,'2020-12-17 13:10:09',0,1),(17,1,14,'2020-12-17 13:10:09',0,1),(17,1,15,'2020-12-17 13:10:09',0,1),(17,1,16,'2020-12-17 13:14:23',0,1),(17,1,17,'2020-12-17 13:28:03',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_headerText` text,
  `field_shopTitle` text,
  `field_shopSubtitle` text,
  `field_shopDescription` text,
  `field_shopContentTitle` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`),
  CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2020-12-16 10:42:15','2020-12-17 14:00:16','d38c8a98-5d17-4922-88f4-bf1cd0ba46fe',NULL,NULL,NULL,NULL,NULL),(2,2,1,'Mörk Borg!','2020-12-16 14:33:10','2020-12-17 13:39:44','e537eb6d-9008-4374-8ec1-e1598dc4d5b3','a doom metal album of a game. a spiked flail to the face. light on rules, heavy everything else.',NULL,NULL,NULL,NULL),(3,15,1,'MB logo pixel','2020-12-16 15:31:01','2020-12-16 15:31:01','13fa64f4-5aba-4ae9-9391-ac9cb17e101f',NULL,NULL,NULL,NULL,NULL),(4,16,1,'MB logo pixel','2020-12-16 15:31:44','2020-12-16 15:31:44','c1ca150b-ca14-4bb2-b2c0-38d4e183fb56',NULL,NULL,NULL,NULL,NULL),(5,17,1,'Shop','2020-12-17 10:56:51','2020-12-17 13:28:03','7a89727e-44f5-4309-9bb1-c9b650355c21',NULL,'Mörk Borg','A doom metal album of a game. A spiked flail to the face. Light on rules, heavy everything else.','<p><strong>MÖRK BORG is a pitch-black apocalyptic fantasy RPG about lost souls and fools seeking redemption, forgiveness or the last remaining riches in a bleak and dying world.</strong> Who are you? The tomb-robber with silver glittering between cracked fingernails? The mystic who would bend the world’s heart away from it’s inevitable end? Confront power-draining necromancers, skulking skeletal warriors and backstabbing wickheads. Wander the Valley of the Unfortunate Undead, the catacombs beneath the Bergen Chrypt or the bedevilled Sarkash forest. But leave hope behind – the world’s cruel fate is sealed, and all your vain heroic efforts are destined to end in death and dismay. Or are they?</p>','MÖRK BORG CONTENT'),(6,18,1,'Mb Banner','2020-12-17 13:09:08','2020-12-17 13:09:08','4aaeebfd-0de9-477e-85d9-b3154043b399',NULL,NULL,NULL,NULL,NULL),(7,19,1,'Mb article 1','2020-12-17 13:09:09','2020-12-17 13:09:09','ea04eb34-afe7-411c-8cf8-82cbda0305b5',NULL,NULL,NULL,NULL,NULL),(8,20,1,'Mb article 2','2020-12-17 13:09:12','2020-12-17 13:09:12','02dd88bb-aad6-47b8-b7f8-3ba1ec724fd3',NULL,NULL,NULL,NULL,NULL),(9,21,1,'Mb article 3','2020-12-17 13:09:14','2020-12-17 13:09:14','45a419d6-504a-4e6f-b726-7259b4863fe1',NULL,NULL,NULL,NULL,NULL),(10,22,1,'Mb article 4','2020-12-17 13:09:17','2020-12-17 13:09:17','96433eba-215b-4dac-931e-c513068a9bc2',NULL,NULL,NULL,NULL,NULL),(11,23,1,'Mb article 5','2020-12-17 13:09:19','2020-12-17 13:09:19','494f3e31-ead5-42c3-b7c6-d3158c51a60f',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drafts_creatorId_fk` (`creatorId`),
  KEY `drafts_sourceId_fk` (`sourceId`),
  CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_dateDeleted_idx` (`dateDeleted`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  KEY `elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `elements_draftId_fk` (`draftId`),
  KEY `elements_revisionId_fk` (`revisionId`),
  CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2020-12-16 10:42:15','2020-12-17 14:00:16',NULL,'893dc7d4-3ac8-4f76-8151-ed8dd1d353e2'),(2,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2020-12-16 14:33:10','2020-12-17 13:39:44',NULL,'63f33538-5e28-4845-966f-f54a93644fce'),(3,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2020-12-16 14:44:02','2020-12-16 14:44:02','2020-12-16 14:44:05','8bbda99d-f925-4cd0-9240-662d549c72a3'),(4,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2020-12-16 14:44:02','2020-12-16 14:44:02','2020-12-16 14:44:05','e401091a-b0b3-4198-9e9f-d77e37c54685'),(5,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2020-12-16 14:44:02','2020-12-16 14:44:02','2020-12-16 14:44:05','088fd6af-86ae-45d5-a7c6-f1dc10d54deb'),(6,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2020-12-16 14:44:02','2020-12-16 14:44:02','2020-12-16 14:44:05','4772c161-ca17-4a50-8189-d33d44b7aa1f'),(7,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2020-12-16 14:44:05','2020-12-16 14:44:05',NULL,'ce7f50aa-44e4-478c-8ef7-139bfecea308'),(8,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2020-12-16 14:44:05','2020-12-16 14:44:05',NULL,'8435325a-0818-4fd6-930b-69d285b44e06'),(9,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2020-12-16 14:44:05','2020-12-16 14:44:05',NULL,'c14342d0-896a-4060-b3d1-70e6fa498d6f'),(10,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2020-12-16 14:44:05','2020-12-16 14:44:05',NULL,'c49e6f9c-ed28-4bd7-ba6f-11e1e99f400b'),(11,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2020-12-16 15:01:05','2020-12-17 13:39:44',NULL,'03e1edc7-8ae9-4eab-bf15-aa8390534dd3'),(12,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2020-12-16 15:01:05','2020-12-16 15:25:47',NULL,'bdf310c4-0e51-4c33-8abb-3905ed8db70e'),(13,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2020-12-16 15:01:05','2020-12-16 15:25:47',NULL,'7e7783ee-5d7c-4299-9856-8f5142381fc8'),(14,NULL,NULL,3,'craft\\elements\\MatrixBlock',1,0,'2020-12-16 15:01:05','2020-12-16 15:25:47',NULL,'c59bd32e-ede4-4032-8e51-46b46bddfee8'),(15,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-16 15:31:01','2020-12-16 15:31:01',NULL,'aefed121-da2e-4d1d-b323-971bf1580c24'),(16,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-16 15:31:44','2020-12-16 15:31:44','2020-12-17 10:55:50','47396dba-4034-40c8-a656-4f11329d6cb6'),(17,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2020-12-17 10:56:51','2020-12-17 13:28:03',NULL,'7f9f3b45-dd38-4f31-9cc1-09e96c85a2b5'),(18,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-17 13:09:08','2020-12-17 13:09:08',NULL,'3b8ff548-6d3b-4b57-a413-f55715979b65'),(19,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-17 13:09:09','2020-12-17 13:09:09',NULL,'e55b31e3-7134-4ee6-b11d-1513b3803cb1'),(20,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-17 13:09:12','2020-12-17 13:09:12',NULL,'db48a834-796f-48e6-9a8a-330202d4f9d0'),(21,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-17 13:09:14','2020-12-17 13:09:14',NULL,'bc72540d-18b6-4536-9933-05af1ebcb845'),(22,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-17 13:09:17','2020-12-17 13:09:17',NULL,'d334bc78-929c-4d92-881f-a5b4464cd6f7'),(23,NULL,NULL,4,'craft\\elements\\Asset',1,0,'2020-12-17 13:09:19','2020-12-17 13:09:19',NULL,'9b3b02fb-5525-4fe1-81c9-3cc1c78e9564'),(24,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2020-12-17 13:19:11','2020-12-17 13:28:03',NULL,'58696fa3-8e3e-421b-9a4f-2ab72da3e1af'),(25,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2020-12-17 13:28:03','2020-12-17 13:28:03',NULL,'82fbf2de-67ed-493e-908e-44eade996914'),(26,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2020-12-17 13:28:03','2020-12-17 13:28:03',NULL,'892ab3b9-840f-4fd5-8e4e-158ecac96dde'),(27,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2020-12-17 13:28:03','2020-12-17 13:28:03',NULL,'88b2123e-2794-40b1-8fe3-6b410fd1e42b'),(28,NULL,NULL,6,'craft\\elements\\MatrixBlock',1,0,'2020-12-17 13:28:03','2020-12-17 13:28:03',NULL,'e47765bf-3950-408d-a9de-3017abb20832');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `elements_sites_siteId_idx` (`siteId`),
  KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `elements_sites_enabled_idx` (`enabled`),
  KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2020-12-16 10:42:15','2020-12-16 10:42:15','05763f53-b346-41cd-bec1-714ad8158f96'),(2,2,1,'home','__home__',1,'2020-12-16 14:33:10','2020-12-16 14:33:10','0b351528-ef95-4b9e-88de-8f6adff7b879'),(3,3,1,NULL,NULL,1,'2020-12-16 14:44:02','2020-12-16 14:44:02','b803f0cd-d479-40e5-9809-fd595dbaca7f'),(4,4,1,NULL,NULL,1,'2020-12-16 14:44:02','2020-12-16 14:44:02','0c564952-e8e8-4532-a375-6668e941778d'),(5,5,1,NULL,NULL,1,'2020-12-16 14:44:02','2020-12-16 14:44:02','66331236-4b27-47bf-b8d3-e18aa2fa601c'),(6,6,1,NULL,NULL,1,'2020-12-16 14:44:02','2020-12-16 14:44:02','ece0b7d1-151b-4513-896d-ee72912337b8'),(7,7,1,NULL,NULL,1,'2020-12-16 14:44:05','2020-12-16 14:44:05','54fc2971-ace6-460c-af19-14fc27156b66'),(8,8,1,NULL,NULL,1,'2020-12-16 14:44:05','2020-12-16 14:44:05','f2a3fc49-a9e7-42fa-9245-fad730608b2b'),(9,9,1,NULL,NULL,1,'2020-12-16 14:44:05','2020-12-16 14:44:05','0549f81f-e8b0-4686-82a6-4672bee7c7dc'),(10,10,1,NULL,NULL,1,'2020-12-16 14:44:05','2020-12-16 14:44:05','91efd376-e340-45fb-8193-3af952129d32'),(11,11,1,NULL,NULL,1,'2020-12-16 15:01:05','2020-12-16 15:01:05','1164404b-ea3f-40ef-833e-f538596d0600'),(12,12,1,NULL,NULL,1,'2020-12-16 15:01:05','2020-12-16 15:01:05','e6b2788b-6a06-4723-b32c-160fb70b87f8'),(13,13,1,NULL,NULL,1,'2020-12-16 15:01:05','2020-12-16 15:01:05','cc686ee4-0db0-4fd9-8d7b-3dd4bb2a64ec'),(14,14,1,NULL,NULL,1,'2020-12-16 15:01:05','2020-12-16 15:01:05','73785719-0d41-4c40-9191-e79dba49ed47'),(15,15,1,NULL,NULL,1,'2020-12-16 15:31:01','2020-12-16 15:31:01','7de7b00a-6ca2-4f14-9b1b-18c3a1940996'),(16,16,1,NULL,NULL,1,'2020-12-16 15:31:44','2020-12-16 15:31:44','f80a132a-252f-419e-9ae6-15d4c81adf3d'),(17,17,1,'shop','shop',1,'2020-12-17 10:56:51','2020-12-17 10:56:51','15a3acfd-75a4-4eb5-b62e-2d33aa1bb5be'),(18,18,1,NULL,NULL,1,'2020-12-17 13:09:08','2020-12-17 13:09:08','cfbc5afc-62b9-45e0-9f2c-788c6b4d2410'),(19,19,1,NULL,NULL,1,'2020-12-17 13:09:09','2020-12-17 13:09:09','9decffa1-65d4-4427-9ce8-d702b3588d78'),(20,20,1,NULL,NULL,1,'2020-12-17 13:09:12','2020-12-17 13:09:12','0e841013-5396-4489-9cbd-0935ea709dde'),(21,21,1,NULL,NULL,1,'2020-12-17 13:09:14','2020-12-17 13:09:14','6806e340-3400-4018-9691-11ed98afa3f4'),(22,22,1,NULL,NULL,1,'2020-12-17 13:09:17','2020-12-17 13:09:17','d2be5af2-f02a-4463-8437-9d489b11ee4d'),(23,23,1,NULL,NULL,1,'2020-12-17 13:09:19','2020-12-17 13:09:19','e30aa2d2-1fa6-4b23-9db2-cd239c48d36f'),(24,24,1,NULL,NULL,1,'2020-12-17 13:19:11','2020-12-17 13:19:11','8a9d4daa-c3d7-4180-8cdc-329d8416ff23'),(25,25,1,NULL,NULL,1,'2020-12-17 13:28:03','2020-12-17 13:28:03','bfd16dc8-e8b3-4046-8f91-0e8e026f8226'),(26,26,1,NULL,NULL,1,'2020-12-17 13:28:03','2020-12-17 13:28:03','eedbed82-09cf-49dd-a83b-92428614ff05'),(27,27,1,NULL,NULL,1,'2020-12-17 13:28:03','2020-12-17 13:28:03','b0a180e9-3e5a-4f67-a668-b81339234b3a'),(28,28,1,NULL,NULL,1,'2020-12-17 13:28:03','2020-12-17 13:28:03','babbca6e-7fce-4380-8fd0-ed8e75e4294d');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  KEY `entries_parentId_fk` (`parentId`),
  CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2020-12-16 14:33:00',NULL,NULL,'2020-12-16 14:33:10','2020-12-16 14:33:10','f6af0f61-0a20-4013-ba04-5f84068077fd'),(17,2,NULL,2,NULL,'2020-12-17 10:56:00',NULL,NULL,'2020-12-17 10:56:51','2020-12-17 10:56:51','beaa334b-fe12-4453-8239-e2993c0cd0d1');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,1,'Home','home',1,'site',NULL,'{section.name|raw}',1,'2020-12-16 14:33:10','2020-12-16 14:37:26',NULL,'208b0608-44a5-4f1d-a433-ed4bddbfe933'),(2,2,5,'Shop','shop',0,'site',NULL,'{section.name|raw}',1,'2020-12-17 10:56:51','2020-12-17 10:56:51',NULL,'7f9128b5-fd37-401f-915e-02fd1daa5603');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldgroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2020-12-16 10:42:15','2020-12-16 10:42:15','b89a0f84-9d05-430d-a0f5-e5fb9159ff1c'),(2,'HomePage','2020-12-16 14:36:09','2020-12-16 14:36:09','e4d1a852-2b7c-4c34-ab2b-1b2195f090a2'),(3,'Shop','2020-12-17 13:03:36','2020-12-17 13:03:36','f301df04-889d-4004-966e-27c6b5fe527a');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (10,2,7,4,1,0,'2020-12-16 14:53:36','2020-12-16 14:53:36','bcdae5d2-a146-4ea9-a815-4b23c7502dc4'),(11,2,7,3,1,1,'2020-12-16 14:53:36','2020-12-16 14:53:36','a2bff051-602c-4bbd-a946-d3ce65c9ffe6'),(21,3,11,7,1,0,'2020-12-16 15:13:39','2020-12-16 15:13:39','5fef7f52-0f55-48b5-b553-ba95091bfcbc'),(22,3,11,8,1,1,'2020-12-16 15:13:39','2020-12-16 15:13:39','b00d8d92-e620-4ce5-a1f0-426d8bc3dfc9'),(23,3,11,6,1,2,'2020-12-16 15:13:39','2020-12-16 15:13:39','c55853a7-c3e5-49e6-8aa7-a0fae1ca0308'),(24,3,11,9,1,3,'2020-12-16 15:13:39','2020-12-16 15:13:39','c480fd66-9eda-4916-afe6-e96050a06ba0'),(29,1,14,10,0,1,'2020-12-17 10:56:12','2020-12-17 10:56:12','fb9ff5f1-d058-4fe7-be14-9ba282f9b37c'),(30,1,14,11,0,2,'2020-12-17 10:56:12','2020-12-17 10:56:12','862ea69b-15f0-4d72-aa7a-aec088094514'),(31,1,14,1,0,3,'2020-12-17 10:56:12','2020-12-17 10:56:12','a4a0a5d3-bea0-4b55-bf7f-15e16f277fa8'),(32,1,14,2,0,4,'2020-12-17 10:56:12','2020-12-17 10:56:12','2e8075b0-d862-4b83-899e-024be9b11c99'),(33,1,14,5,0,5,'2020-12-17 10:56:12','2020-12-17 10:56:12','ba5dd2bc-53ff-49f5-a40b-5c25ea2096d6'),(43,6,18,20,0,0,'2020-12-17 13:18:03','2020-12-17 13:18:03','b735e8bc-d35f-424c-a87c-f7510a936ad5'),(44,6,18,18,0,1,'2020-12-17 13:18:03','2020-12-17 13:18:03','94bf8938-98de-4bc6-ace0-ddfbaf157f66'),(45,6,18,19,0,2,'2020-12-17 13:18:03','2020-12-17 13:18:03','ad980933-b47f-4df1-88d2-e149348ac458'),(46,5,19,12,0,1,'2020-12-17 13:18:25','2020-12-17 13:18:25','5fbe4e2c-33f5-4355-acdb-2f29fe45b901'),(47,5,19,13,0,2,'2020-12-17 13:18:25','2020-12-17 13:18:25','468cf533-5aff-4b43-aa31-06cc9a179582'),(48,5,19,14,0,3,'2020-12-17 13:18:25','2020-12-17 13:18:25','8fd1b118-28f6-43dd-ad42-4fb3e0c3a97b'),(49,5,19,15,0,4,'2020-12-17 13:18:25','2020-12-17 13:18:25','8f0651c6-8cf8-4ad6-bc80-481894761f0e'),(50,5,19,16,0,5,'2020-12-17 13:18:25','2020-12-17 13:18:25','4eeb64f2-9afa-4ebc-84fc-d61c5601b477'),(51,5,19,17,0,6,'2020-12-17 13:18:25','2020-12-17 13:18:25','e84b9349-a6a9-4853-bfac-6f899abf61b5');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2020-12-16 14:33:10','2020-12-16 14:33:10',NULL,'ab185253-8d93-4535-a859-ad0c40af5e7a'),(2,'craft\\elements\\MatrixBlock','2020-12-16 14:42:32','2020-12-16 14:42:32',NULL,'fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95'),(3,'craft\\elements\\MatrixBlock','2020-12-16 14:59:30','2020-12-16 14:59:30',NULL,'a2879fb3-ff97-4ee4-980f-6265c74f75b1'),(4,'craft\\elements\\Asset','2020-12-16 15:28:58','2020-12-16 15:28:58',NULL,'91c10b42-6f17-40db-918c-7043227c0265'),(5,'craft\\elements\\Entry','2020-12-17 10:56:51','2020-12-17 10:56:51',NULL,'b687a011-c2f1-4e55-bdbf-8e61d7faa8dc'),(6,'craft\\elements\\MatrixBlock','2020-12-17 13:18:03','2020-12-17 13:18:03',NULL,'d6e31844-79dc-40d2-bcfe-f3ec8990febc');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `elements` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (7,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"a55dc167-4783-496c-93d4-e6d19d9601ba\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"1676b7bd-ed54-4e36-a24e-5e1edefd69ba\"}]',1,'2020-12-16 14:53:36','2020-12-16 14:53:36','4b1b5de8-9fd2-4407-9d84-31bdbf1048b7'),(11,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"9c211903-dc95-46f5-8acc-36859e85d1de\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"cbe5da37-1cdc-4c69-8d25-e7706c033fc3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"2b06f126-8cc9-40f5-b071-3db5408bfbe3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"fieldUid\":\"0ee6a5c7-7ad4-4805-809f-1327d00af700\"}]',1,'2020-12-16 15:13:39','2020-12-16 15:13:39','97ea1cd9-753e-49b0-a4cc-7ebaab6a4d76'),(12,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2020-12-16 15:28:58','2020-12-16 15:28:58','790852e7-8344-4538-b186-1c6447629664'),(14,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"cf8a9107-74dd-4d0f-979d-722ae9e1f981\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4bd8bbee-da42-4923-a6e8-1b476ca4a55e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"36bb3abc-338d-4e94-8516-0aaf9a3b45a4\"}]',1,'2020-12-17 10:56:12','2020-12-17 10:56:12','f47ff5e3-f0c2-4c4e-af42-4be99f8bf38f'),(18,6,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0c1a1fd0-1a9d-4418-a650-6b409a61c99f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6b4f7c75-0571-4f1c-8b3f-fda308c47100\"}]',1,'2020-12-17 13:18:03','2020-12-17 13:18:03','b6d474bd-c9bc-42aa-bac1-c0964e69204b'),(19,5,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"fb348c93-0517-4c22-b481-5353de3bf7f1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b75005a6-0f0c-4cc3-a0c4-48db38318db8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bda5f10a-c5a8-4123-b49c-a6d61306ed00\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"8cefcdba-0a48-40d8-98fe-3d518eac1f3c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c0027ad5-65c4-48f7-8f83-1729cd02d01f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7d98f61f-8eb8-4451-8a78-13b36a78eda3\"}]',1,'2020-12-17 13:18:25','2020-12-17 13:18:25','08de1fbc-3ccf-456a-8830-bf85bbdfabf1');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fields_handle_context_idx` (`handle`,`context`),
  KEY `fields_groupId_idx` (`groupId`),
  KEY `fields_context_idx` (`context`),
  CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,2,'Header Text','headerText','global','You can just type in lowercase.',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-16 14:36:53','2020-12-16 14:36:53','cf8a9107-74dd-4d0f-979d-722ae9e1f981'),(2,2,'Matrix Quotes','matrixQuotes','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_matrixquotes}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2020-12-16 14:42:31','2020-12-16 14:53:36','4bd8bbee-da42-4923-a6e8-1b476ca4a55e'),(3,NULL,'Author','author','matrixBlockType:1fb33381-16f5-4152-874a-1e9ec146cd34','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-16 14:42:32','2020-12-16 14:42:32','1676b7bd-ed54-4e36-a24e-5e1edefd69ba'),(4,NULL,'Main Quote','mainQuote','matrixBlockType:1fb33381-16f5-4152-874a-1e9ec146cd34','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-16 14:42:32','2020-12-16 14:42:32','a55dc167-4783-496c-93d4-e6d19d9601ba'),(5,2,'Matrix Rewards','matrixRewards','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_matrixrewards}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2020-12-16 14:59:29','2020-12-16 14:59:49','36bb3abc-338d-4e94-8516-0aaf9a3b45a4'),(6,NULL,'SVG','svg','matrixBlockType:5db73d10-416e-480f-998e-0197662d48a5','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-16 14:59:30','2020-12-16 14:59:30','2b06f126-8cc9-40f5-b071-3db5408bfbe3'),(7,NULL,'Reward Title','rewardTitle','matrixBlockType:5db73d10-416e-480f-998e-0197662d48a5','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-16 14:59:30','2020-12-16 14:59:30','9c211903-dc95-46f5-8acc-36859e85d1de'),(8,NULL,'Reward Result','rewardResult','matrixBlockType:5db73d10-416e-480f-998e-0197662d48a5','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-16 14:59:30','2020-12-16 14:59:30','cbe5da37-1cdc-4c69-8d25-e7706c033fc3'),(9,NULL,'SVG Viewbox','svgViewbox','matrixBlockType:5db73d10-416e-480f-998e-0197662d48a5','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-16 15:13:39','2020-12-16 15:13:39','0ee6a5c7-7ad4-4805-809f-1327d00af700'),(10,2,'Main Image','mainImage','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2020-12-16 15:30:10','2020-12-16 15:30:10','63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8'),(11,2,'Link To','linkTo','global','',0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":false,\"source\":null,\"sources\":[\"singles\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2020-12-17 10:55:34','2020-12-17 10:55:34','5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f'),(12,3,'Header Image','headerImage','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2020-12-17 13:04:10','2020-12-17 13:04:10','fb348c93-0517-4c22-b481-5353de3bf7f1'),(13,3,'Shop Title','shopTitle','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-17 13:04:41','2020-12-17 13:04:41','b75005a6-0f0c-4cc3-a0c4-48db38318db8'),(14,3,'Shop Subtitle','shopSubtitle','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-17 13:04:51','2020-12-17 13:04:51','bda5f10a-c5a8-4123-b49c-a6d61306ed00'),(15,3,'Shop Description','shopDescription','global','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2020-12-17 13:05:05','2020-12-17 13:08:02','8cefcdba-0a48-40d8-98fe-3d518eac1f3c'),(16,3,'Shop Content Title','shopContentTitle','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-17 13:13:01','2020-12-17 13:13:01','c0027ad5-65c4-48f7-8f83-1729cd02d01f'),(17,3,'Matrix Shop Item','matrixShopItem','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_matrixshopitem}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2020-12-17 13:18:03','2020-12-17 13:18:03','7d98f61f-8eb8-4451-8a78-13b36a78eda3'),(18,NULL,'Item Description','itemDescription','matrixBlockType:1557c6c8-c6dd-4b7b-a2f5-f74c01020a79','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"normal\"}','2020-12-17 13:18:03','2020-12-17 13:18:03','0c1a1fd0-1a9d-4418-a650-6b409a61c99f'),(19,NULL,'Item Image','itemImage','matrixBlockType:1557c6c8-c6dd-4b7b-a2f5-f74c01020a79','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2020-12-17 13:18:03','2020-12-17 13:18:03','6b4f7c75-0571-4f1c-8b3f-fda308c47100'),(20,NULL,'Item Title','itemTitle','matrixBlockType:1557c6c8-c6dd-4b7b-a2f5-f74c01020a79','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2020-12-17 13:18:03','2020-12-17 13:18:03','c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `globalsets_name_idx` (`name`),
  KEY `globalsets_handle_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  KEY `gqltokens_schemaId_fk` (`schemaId`),
  CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'3.5.17','3.5.13',0,'cctbnuvebzjb','cavnulcpkhuf','2020-12-16 10:42:15','2020-12-17 13:36:35','8e04a15a-74f4-4c18-9e98-9c8ce178ee38');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`ownerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
INSERT INTO `matrixblocks` VALUES (3,2,2,1,1,0,'2020-12-16 14:44:02','2020-12-16 14:44:02','f2582553-6585-472b-9dcf-3a1ad4b12591'),(4,2,2,1,2,0,'2020-12-16 14:44:02','2020-12-16 14:44:02','6fedaa59-0db1-4a51-b7a7-4f67f9217a5c'),(5,2,2,1,3,0,'2020-12-16 14:44:02','2020-12-16 14:44:02','afa82be3-5047-4184-87dc-33deb99d9afa'),(6,2,2,1,4,0,'2020-12-16 14:44:02','2020-12-16 14:44:02','76dc066c-793c-49d0-a777-f5ed4824bf00'),(7,2,2,1,1,NULL,'2020-12-16 14:44:05','2020-12-16 14:44:05','35e97c8a-63f5-45d7-a54c-16e602771ec2'),(8,2,2,1,2,NULL,'2020-12-16 14:44:05','2020-12-16 14:44:05','f582d599-d2d4-4057-b218-4f436fe9812d'),(9,2,2,1,3,NULL,'2020-12-16 14:44:05','2020-12-16 14:44:05','3024ddf2-2379-415b-bc15-be3ec0683dd6'),(10,2,2,1,4,NULL,'2020-12-16 14:44:05','2020-12-16 14:44:05','a83ca0bf-cea5-455c-9d48-c2a60c7d85e4'),(11,2,5,2,1,NULL,'2020-12-16 15:01:05','2020-12-16 15:01:05','64e0214c-6299-4618-8bc9-d6ae731ae086'),(12,2,5,2,2,NULL,'2020-12-16 15:01:05','2020-12-16 15:01:05','75f939cf-23b2-4476-ab07-6cf83cb215e9'),(13,2,5,2,3,NULL,'2020-12-16 15:01:05','2020-12-16 15:01:05','a3f9a7ea-9e3d-4edc-b921-cb1dde672575'),(14,2,5,2,4,NULL,'2020-12-16 15:01:05','2020-12-16 15:01:05','6223510b-366c-4f89-b517-887b0f135893'),(24,17,17,3,1,NULL,'2020-12-17 13:19:11','2020-12-17 13:19:11','3afcaff9-05e4-441b-8d13-c2194428aa8b'),(25,17,17,3,2,NULL,'2020-12-17 13:28:03','2020-12-17 13:28:03','cd8a6021-edbd-4126-a633-95c33d961b1e'),(26,17,17,3,3,NULL,'2020-12-17 13:28:03','2020-12-17 13:28:03','377ab692-5229-481a-adba-09cf0b946c6a'),(27,17,17,3,4,NULL,'2020-12-17 13:28:03','2020-12-17 13:28:03','6b1e3abf-5ef2-4f6b-bd28-33bc9aca2bce'),(28,17,17,3,5,NULL,'2020-12-17 13:28:03','2020-12-17 13:28:03','fdc4be02-2110-4c08-8a30-9118ea173022');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocktypes_name_fieldId_idx` (`name`,`fieldId`),
  KEY `matrixblocktypes_handle_fieldId_idx` (`handle`,`fieldId`),
  KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
INSERT INTO `matrixblocktypes` VALUES (1,2,2,'Quote','quote',1,'2020-12-16 14:42:32','2020-12-16 14:42:32','1fb33381-16f5-4152-874a-1e9ec146cd34'),(2,5,3,'Reward','reward',1,'2020-12-16 14:59:30','2020-12-16 14:59:30','5db73d10-416e-480f-998e-0197662d48a5'),(3,17,6,'Item','item',1,'2020-12-17 13:18:03','2020-12-17 13:18:03','1557c6c8-c6dd-4b7b-a2f5-f74c01020a79');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_matrixquotes`
--

DROP TABLE IF EXISTS `matrixcontent_matrixquotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_matrixquotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_quote_author` text,
  `field_quote_mainQuote` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_matrixquotes_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_matrixquotes_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_matrixquotes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_matrixquotes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_matrixquotes`
--

LOCK TABLES `matrixcontent_matrixquotes` WRITE;
/*!40000 ALTER TABLE `matrixcontent_matrixquotes` DISABLE KEYS */;
INSERT INTO `matrixcontent_matrixquotes` VALUES (1,3,1,'2020-12-16 14:44:02','2020-12-16 14:44:02','a1185ec6-1e9f-405c-a784-53d66c370347','RPG Gamer','This is the OSR taken to a completely new level. 10/10'),(2,4,1,'2020-12-16 14:44:02','2020-12-16 14:44:02','755ef157-1f5f-48e4-9ca7-c9f9dd6ba19d','John Harper','There is some of the best world building crammed into metaphorical, three sentence little segments here.'),(3,5,1,'2020-12-16 14:44:02','2020-12-16 14:44:02','fb34437f-2270-47d4-a905-6b6976a2ecac','RPG Buyer','It\'s an art piece to have in your collection.'),(4,6,1,'2020-12-16 14:44:02','2020-12-16 14:44:02','d81fdf86-a798-456a-b2c2-c4372a9d8208','Daniel D. Fox (Zweihänder)','MÖRK BORG for OSR president.'),(5,7,1,'2020-12-16 14:44:05','2020-12-16 14:44:05','2f1d517b-9e2a-483e-9c36-08a937a48009','RPG Gamer','This is the OSR taken to a completely new level. 10/10'),(6,8,1,'2020-12-16 14:44:05','2020-12-16 14:44:05','2e439971-cba9-477e-95be-3cee7324514f','John Harper','There is some of the best world building crammed into metaphorical, three sentence little segments here.'),(7,9,1,'2020-12-16 14:44:05','2020-12-16 14:44:05','d26d7c88-0015-4faf-8644-4ed139603f71','RPG Buyer','It\'s an art piece to have in your collection.'),(8,10,1,'2020-12-16 14:44:05','2020-12-16 14:44:05','aad89f40-d23c-4499-9c5a-678fea7d36e4','Daniel D. Fox (Zweihänder)','MÖRK BORG for OSR president.');
/*!40000 ALTER TABLE `matrixcontent_matrixquotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_matrixrewards`
--

DROP TABLE IF EXISTS `matrixcontent_matrixrewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_matrixrewards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_reward_svg` text,
  `field_reward_rewardTitle` text,
  `field_reward_rewardResult` text,
  `field_reward_svgViewbox` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_matrixrewards_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_matrixrewards_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_matrixrewards_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_matrixrewards_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_matrixrewards`
--

LOCK TABLES `matrixcontent_matrixrewards` WRITE;
/*!40000 ALTER TABLE `matrixcontent_matrixrewards` DISABLE KEYS */;
INSERT INTO `matrixcontent_matrixrewards` VALUES (1,11,1,'2020-12-16 15:01:05','2020-12-17 13:39:44','fb26ed24-4bb0-4d4f-b213-36a82aea8233','<path d=\"M64.51,33.58v.48c-.39.17-.24.53-.28.83a8.7,8.7,0,0,1-.92,3.77,9.2,9.2,0,0,1-.39,1.71c-.2.59-.41,1.18-.66,1.76-.17.39-.42.75-.63,1.13-.67,1.2-1.35,2.4-2,3.59-.44,1.1-.88,2.2-1.31,3.3a14.4,14.4,0,0,1-.7,1.72,23.63,23.63,0,0,1-1.56,2.37,2.22,2.22,0,0,1-.81.68,10.33,10.33,0,0,1-3,.89,7.45,7.45,0,0,0-2,.54,11.12,11.12,0,0,0-1.59,1l-3.13,2A3.21,3.21,0,0,1,43,58.29a6.18,6.18,0,0,0-2.39-1.47c-.71.21-1.16-.29-1.55-.68a5.82,5.82,0,0,1-1.69-3.57,3.83,3.83,0,0,0-.56-1.63l-2,.2a3.78,3.78,0,0,1-.82.06,11.18,11.18,0,0,1-2-.26,1.52,1.52,0,0,0-1.39.32,1.56,1.56,0,0,1-1.58.28l.68-.67c-1.06-.46-2,.53-3,0l-.63-.76-.93.72c-1.31.1-2.43-.54-3.7-.22v2.29a2.45,2.45,0,0,1-2.07.41c-.92-.89-.44-1.92-.17-2.94L18.09,50,17,51.42c-1.14,0-1.27-.06-1.49-.92a12.64,12.64,0,0,1-.25-1.5,2.87,2.87,0,0,1,1.32-1.56l.56.08.57.1-2.43-1.77c.2,1.24-.62,2.08-.9,3.16l-1.16.61c-.93-.7-1.07-.81-1-1.35a3.7,3.7,0,0,1,1.33-3.05,2,2,0,0,0,.34-.49c-1.09.35-2.06,1.05-3.12.08h0a1.28,1.28,0,0,0-1-.72l-1.26.56A11.94,11.94,0,0,1,8,46.59a1.1,1.1,0,0,1-1.51.71C5.65,46.55,6,45.79,6.39,45l1-.62-.08-1c-.37,0-.75.2-1,.08-.81-.43-1.75-.26-2.57-.61h0c0-.12,0-.27,0-.35a1.94,1.94,0,0,1-.05-2.41l-1.13-.73.34-2.67C1.7,35.92.47,35.16,0,33.69A10.06,10.06,0,0,1,1.63,29.9l-.16-.69a7.51,7.51,0,0,1,1.69-2.57c.75-.76,1.38-1.62,2-2.33a4.14,4.14,0,0,1,.24-3.07,25.68,25.68,0,0,1,1.53-2.11A20.46,20.46,0,0,0,8.37,17,3.6,3.6,0,0,1,9.88,15.2l.38-1.34c.85-.12,1.25-.77,1.72-1.29,1-1.08,1.88-2.23,2.86-3.3A12.76,12.76,0,0,1,17.4,6.79c1.23-.73,2-2,3.27-2.62.1,0,.15-.18.23-.27a6,6,0,0,1,2.19-1.56c.69-.28,1.44-.46,2.1-.8s1.24-.26,1.63-.61A2.83,2.83,0,0,1,28.93.38a10.13,10.13,0,0,0,3.2-.22,1.88,1.88,0,0,1,.71,0c.69.06,1.38.18,2.07.19A6.2,6.2,0,0,0,37,.21a4.13,4.13,0,0,1,2.67,0,13.64,13.64,0,0,1,2.28.53,8.22,8.22,0,0,0,2.28.54l2.48,2.21c1.43.91,3,1.35,4.3,2.24A26.07,26.07,0,0,1,55.05,9c.14.14.31.25.46.38.88.77,1.85,1.42,2.75,2.18a10.73,10.73,0,0,1,3.26,5.12c.27.82.4,1.69.63,2.53s.47,1.42.68,2.15a35.21,35.21,0,0,0,1,4.13,2.1,2.1,0,0,1,.07.8,16.93,16.93,0,0,0,.3,3.48,1.53,1.53,0,0,1,0,.7,7.54,7.54,0,0,0-.13,1.95A1.07,1.07,0,0,0,64.51,33.58ZM42.27,16.14c0-.4.13-.84-.25-1.26l-.79.57,1.06.67.23,1.67.81-.12ZM29,14.5l.18-.24c-.48-.61-.92-1.25-1.46-1.82s-.55-1.45-.94-2.12l.43-.66c1.92.38,3.36,1.83,5.4,2.38-.65-1.23-1.65-1.92-2.32-3a5.51,5.51,0,0,1,3.27,3.57l1,.43a2.59,2.59,0,0,1-.4-2.44,1.68,1.68,0,0,1,.41.29,16.66,16.66,0,0,1,1.36,1.8,9,9,0,0,0,3,2.82c.21.14.44.25.73.42,0-.23,0-.38,0-.44A46.14,46.14,0,0,0,36.4,12c-1.16-1.06-1.93-2.42-3-3.54a1.12,1.12,0,0,1-.18-1.55l1-.12.85-.7a4.2,4.2,0,0,1,.83.18c1,.48,2.08,1,3.08,1.5a5.73,5.73,0,0,0,2.75.77L38.53,6.23,37.9,4.62C36.59,4.82,36,4,35.39,2.94c-.44.06-.88.09-1.3.17a13.67,13.67,0,0,1-4.8.49l-1.16-.69c-.7,1.19-1.9,1.55-3,2.14a14.49,14.49,0,0,1,2.23.18,4.5,4.5,0,0,1,2.05.86c-.22.1-.33.19-.42.17-.86-.1-1.72-.23-2.57-.35a4.58,4.58,0,0,0-3.23.36c-.65.38-1.34.69-2,1a3.17,3.17,0,0,1-1,.4A6.62,6.62,0,0,0,17,9.41,10.52,10.52,0,0,0,16,10.47l.14.21c1.11-.16,2-1,3.12-1.21.43.42.31.88.21,1.35l-.93.88c1.59.4,2.95-.08,4.35-.3l1.07.36.63,1.4C26.08,13.65,27.71,13.46,29,14.5Zm.69,5.93a3.11,3.11,0,0,1-2.6.23,4.09,4.09,0,0,1-2.45,1.52c-.94,1.83-.39,3.8-.57,5.62A10.7,10.7,0,0,0,25,29.05a4.6,4.6,0,0,0,2.75,1.71,2,2,0,0,1,.88.31A5.43,5.43,0,0,0,32,32,3.31,3.31,0,0,0,34.08,31a1.73,1.73,0,0,0,.56-1.49,1.34,1.34,0,0,1,0-.35,5,5,0,0,0,0-3.24,1.72,1.72,0,0,1-.07-.61l-.93-1.87-.06.05-1.15-1.41C31.52,21.76,30.93,20.62,29.68,20.43Zm-13.5,5.13a2.41,2.41,0,0,0-1.76.93,3.07,3.07,0,0,1-.74.58,8,8,0,0,0-1.09.9c-.55.62-1,1.36-1.53,2a13.7,13.7,0,0,0-2.43,3.91,3.55,3.55,0,0,0-.22,3.07A5.23,5.23,0,0,1,8.62,38,7.42,7.42,0,0,0,11.42,37a3.24,3.24,0,0,1,1-.31l.35.71-.69,2a14.53,14.53,0,0,1,1.49.13c.49.09,1,.26,1.36.37l2.19-2.32a5.92,5.92,0,0,1,.67-4c-.13-.51-.22-.94-.36-1.35-.28-.89-.25-1.88-1.07-2.57a1.63,1.63,0,0,1-.34-1.1c0-.62.11-1.25.15-1.87C16.2,26.29,16.18,25.94,16.18,25.56Zm.63-9.22c-.14-.09-.16-.13-.2-.14-1.24-.37-2.41.23-3.63.22-.11,0-.21.1-.32.15-.72.32-1.45.62-2.15,1a2.3,2.3,0,0,0-.81.63c-.55.78-1,1.59-1.49,2.27.1,1.73-.12,3.42,1,4.83.67-.35,1.24-.71,1.86-1a9.88,9.88,0,0,0,3.18-2.78c.71-.78,1.32-1.66,2-2.49l.16.08-.17,1.18a2.84,2.84,0,0,0,.95-2A14.17,14.17,0,0,0,16.81,16.34Zm21.3,12.92c-.22.26-.46.51-.67.8a9.7,9.7,0,0,1-1.89,2.11,2.75,2.75,0,0,0-.95,1.46l.37-.32.86,1.42a3.57,3.57,0,0,1,2.54-.37,15.3,15.3,0,0,0,1.82-4.1l-.91-1ZM20.18,35.13c-1.14,1.57-1.31,3.47-2,5,.08,1.51,1.15,1.73,2.32,2a7,7,0,0,0,.4-1.5,21.15,21.15,0,0,0-.12-2.24,3.27,3.27,0,0,0-.09-.7A5.46,5.46,0,0,1,20.18,35.13ZM30.05,12.5l-.11.23c.74.77,1.43,1.59,2.23,2.3a3.85,3.85,0,0,0,2.76,1l-1-1,.12-.65ZM36.38,16l.52.86.53-.07a4.49,4.49,0,0,0,.79,1.65c.58.58,1.06,1.26,1.6,1.89a4.57,4.57,0,0,0,.6.5l-.33-2.5C38.91,17.5,38.05,16.34,36.38,16ZM27.21,40.4l-1.6-4.1c-.37,1.47.3,3-.52,4.41A3,3,0,0,0,27.21,40.4Zm5.62-6.67a14,14,0,0,0-.28,2.05c0,1,.16,1.94.26,2.92H33l.32-.17.85-3L33,34.6ZM14.17,23.33a.79.79,0,0,0-.32.07,10.5,10.5,0,0,1-2.93,1.48,4.65,4.65,0,0,0-1.22.7.47.47,0,0,0,0,.79l3.05-1.54A3.45,3.45,0,0,0,14.17,23.33ZM24,39a15.7,15.7,0,0,0-.59-7.13c0,.63,0,1,0,1.41.06,1.23.14,2.47.2,3.7,0,.4,0,.8,0,1.19A4.31,4.31,0,0,0,24,39ZM38.18,12.24l-.25.24,1.84,2.27,1.53-.12C40.5,13.42,39.18,13.05,38.18,12.24Zm-1.87,25c1.1.13,1.4-.71,1.83-1.4-.46-.75-1.1-.74-1.83-.5ZM20,17.61l1.78,1.5.42-.85-.66-1.5Zm26.48-2.27a4.32,4.32,0,0,0-3.11-2.53A7.25,7.25,0,0,0,46.46,15.34Zm9.66-.16a3.11,3.11,0,0,0-2.26-2C54.54,14.14,54.8,15.1,56.12,15.18ZM40.46,24.52c.3,1.07.3,1.07,1,1.05a1,1,0,0,0-.2-1.05ZM5.31,28.07c.59-.4,1.13-.78,1-1.65C5.24,27,5.17,27.13,5.31,28.07ZM4.55,38.58l1.08.61v-1C5.16,38.09,4.78,38,4.55,38.58Zm15.39-6.86-.14.15,1.08,1.62.15-.88Zm1.6-25.33a2.24,2.24,0,0,0-2,.58C20.36,7.23,20.87,6.86,21.54,6.39ZM20.06,22.44c.62-1.14.62-1.14,0-1.91ZM28.71,17a1.16,1.16,0,0,0,1.33.27A1.14,1.14,0,0,0,28.71,17ZM16.65,23.81l.29.13.23-.74-.2-.08ZM31,1.54l-1.22.38C30.39,2.11,30.73,2.11,31,1.54ZM9.77,29.24c-.44,0-.63.14-.66.73Zm27.51-7.76-.76-.37C36.65,21.67,36.85,21.75,37.28,21.48ZM10.2,39.62l.27.18.25-.56-.17-.1Zm17.06-4.21h.14v-.55h-.14ZM8.64,27h.08v-.26H8.64Zm12,.47c0-.17,0-.09,0,0C20.66,27.41,20.69,27.33,20.62,27.49Zm1.43-2.13.09,0,0-.24-.1,0ZM19,22.7l-.09.19H19C19,22.84,19,22.77,19,22.7Zm8.33-6,0,.1.26,0,0-.11ZM15.88,21l-.1,0,.05.26.11,0Z\"></path>                             <path d=\"M23,51.37c.73-.23,1.14.19,1.51.67.3,2.06.3,2.06-.08,2.84-1,.28-1,.28-2.08-.49L22,53.47C22.28,52.72,22.23,51.85,23,51.37Z\"></path>                             <path d=\"M3.42,47.58l-.79-.25-.36-1.24c.9-1.07,1.4-2.59,3.2-2.1C5.85,45.31,5.09,46.62,3.42,47.58Z\"></path>                             <path d=\"M10.7,44.81a4.49,4.49,0,0,1-.14,3.3l-1.4.79c-.88-.61-1-.95-.75-1.83.42-1.47,1.17-2.2,2.31-2.25Z\"></path>                             <path d=\"M26.94,52.2l1.15.68v1.87l-1,1.24a1.2,1.2,0,0,1-.38,0c-.37-.14-.72-.31-1.09-.48C25.14,54,26.39,53.31,26.94,52.2Z\"></path>                             <path d=\"M3.77,42.9c.09.73-.5,1.12-.85,1.62a13.87,13.87,0,0,1-1.06,1.2L.72,46C.29,44.84.29,44.82,1,43.55l1.47-.9,1.34.26Z\"></path>                             <path d=\"M29.09,52.45a1.65,1.65,0,0,1,.61,1.9c-.08.35-.07.35-.73.7C29.06,54.18,28.26,53.35,29.09,52.45Z\"></path>                             <path d=\"M31.74,7.5l-.27.22-.1-.1.21-.25Z\"></path>','best writing','diamond','0 -0.011716476641595364 64.51000213623047 59.364925384521484'),(2,12,1,'2020-12-16 15:01:05','2020-12-16 15:25:47','83716c91-729e-4fa1-b743-426f52214c38','<path d=\"M61.48,32.27v1.91c-.34,0-.25.26-.24.43A1.59,1.59,0,0,1,60.78,36c-.12.39.06.76-.17,1.15-.38.67-.57,1.45-1,2.11a20.8,20.8,0,0,0-1,2.21l-.23.53a5.47,5.47,0,0,0,.85,4L59,47.45a6.22,6.22,0,0,1-3.73,3c-1.94-.14-3.58.94-4.89,2.67-1-.21-1.84.49-2.86.08s-1.91-.35-2.6-1a15.16,15.16,0,0,0-1.64-.32c-.6-.05-1.2,0-1.69,0l-1.41-1-.75.45v2c-.39.77-.66,1.5-1.38,1.87a5.49,5.49,0,0,1-.75-.24,1.83,1.83,0,0,1-.54-.42,6.79,6.79,0,0,1-.44-.65L35,54.29c-.12.75.16,1.52-.27,2.19l.3.43a.84.84,0,0,0-.08,1.3l-.59.91-1.23-.35c-.24-.59-.46-1.1-.64-1.62-.09-.25-.22-.57-.13-.77a4.32,4.32,0,0,0-.1-3.07c-.59-.06-.54.5-.9.78l-1.81-.85c-.12.24-.3.44-.3.64a5.44,5.44,0,0,1-.53,1.7,1.35,1.35,0,0,1-1.2,1.05l-.93-.87V52.53L26,51.86h-.69l-.73-.59-.47,1.54-.87.85v.48l-.32.32H21.14c-.2-.41.14-.9-.27-1.24a1,1,0,0,0,0-1.16l-.12-.45c-1.36,1.11-1.36,2.92-2.42,4.08h-.71l-.57-.55c-.27-1.32.49-2.49.4-3.71l-.89.3c-.36.23-.73.64-1.14,1s-.46,1-.94,1.3H12.8a3.85,3.85,0,0,1-1.4-2.09,1.48,1.48,0,0,0-.85-1,6.7,6.7,0,0,1-1-.78v-.8l1.78-2.75-.81-.69H9.71a5.3,5.3,0,0,0-3.6-.69l-.68.68A5.39,5.39,0,0,1,3,48.75c-.43-.46-1-.12-1.37-.23L1,48c-.6-.39-1.14-1.39-.88-1.95a2.79,2.79,0,0,0,.2-1.23,7.9,7.9,0,0,1,.49-2.19c0-.17.21-.32.22-.5a3.35,3.35,0,0,1,.94-2.24,6.46,6.46,0,0,0,1-1.82,4.19,4.19,0,0,0,.59-2.44,4.91,4.91,0,0,1-1.91-2.16A2.9,2.9,0,0,0,1.46,33c-.19-.29.38-.45.09-.81-.16-.19-.07-.6-.08-.91s0-.64,0-.95.08-.52,0-.71a3.71,3.71,0,0,1,.14-2.87,4.32,4.32,0,0,0,.34-2.24,5.05,5.05,0,0,1-.09-1.86c0-.67.4-1.18.42-1.8a7.07,7.07,0,0,0,1.37-3.73,2.62,2.62,0,0,1,.41-.9c.14-.23.4-.39.53-.62A14.6,14.6,0,0,1,7.32,12a2.63,2.63,0,0,0,.59-.71A11.23,11.23,0,0,1,9.62,9,3.72,3.72,0,0,1,11,7.76c.51-.22.82-.77,1.4-.92a1.7,1.7,0,0,0,.66-.41,5.76,5.76,0,0,1,1.75-1c1-.48,2.09-.76,3.07-1.25a25.81,25.81,0,0,1,4.91-2c1-.26,2-.43,3-.66l.3-.3L28,1,29.77.66c.34-.15.64-.27.94-.43a1.64,1.64,0,0,1,1.8.08A1.1,1.1,0,0,0,33,.47a17.8,17.8,0,0,0,1.79,0,1.35,1.35,0,0,0,.52-.19,5.23,5.23,0,0,0,.84.2c.4,0,.86-.13,1.18,0,1.21.58,2.58.67,3.78,1.27.82.41,1.73.57,2.56,1A12.16,12.16,0,0,1,46,4.26c1.31.13,2,1.51,3.18,1.61.27.31.39.7.87.84a3.89,3.89,0,0,1,1.16.64,9.06,9.06,0,0,1,.94.92,4.32,4.32,0,0,0,.87.79,2.64,2.64,0,0,1,.77.91c.34.47.91.71,1.13,1.29a5.19,5.19,0,0,0,.91,1.66,6.8,6.8,0,0,1,.91,1.65,7.57,7.57,0,0,1,.82,1.56c.1.58.44,1,.58,1.57s.12,1.23.68,1.63c.07.93,1,1.49,1.07,2.42.86.83.71,2,1.08,3-.13,1.65.39,3.26.25,4.92a19.1,19.1,0,0,0,0,2.27C61.25,32.06,61.4,32.16,61.48,32.27ZM30.4,4.54l-.24-.24c0-.36-.3-.2-1.06-.52.16.19.21.28.24.27a1.33,1.33,0,0,0,.34-.1c-.15,0-.29-.08,0,.11,0,.36.3.2.48.24l.24.24c0,.36.29.2.33.16.56.74,1.32.76,1.94,1s1.33.64,2,1l.12.71,4.45.94c-.84-.61-1.92-.64-2.68-1.37a14.8,14.8,0,0,1-2.9-1.06,13.34,13.34,0,0,0-2.76-1.13C30.85,4.42,30.58,4.57,30.4,4.54ZM16.77,11.47c.18,0,.46.12.43-.16l1.06-.45c-.56-.22-.85-.07-1,.37-.18,0-.46-.12-.48.24l-.24.24c-.24.09-.61-.22-.69.26l-.05-.05-.19.17.07.08a.64.64,0,0,0,.14-.22c.24-.09.61.22.72-.24Zm1.43,1c.18,0,.46.12.46-.26l0,0,.2-.16L18.82,12a.83.83,0,0,0-.14.22c-.18,0-.46-.12-.45.26l-.05,0-.19.17.07.07A.6.6,0,0,0,18.2,12.43ZM6,14.31l-.55,1.22c.62-.19.53-.59.52-1l0,0,.2-.16-.08-.08C6.1,14.43,6,14.49,6,14.31Zm14.43-2.84h-.69l.11.11-.56.23c.55.29.81.06,1-.53v.22l.7-.09v-.16C20.82,11.26,20.58,11.27,20.45,11.47Zm1.46-5.74c-.32,0-.59-.08-.7,0a.84.84,0,0,1-.63.23,2.05,2.05,0,0,0-.43.09l0,.11h1.29a1,1,0,0,0,.3-.47l0,0,.2-.17-.08-.07C21.87,5.58,21.82,5.65,21.91,5.73ZM17.47,13.9v.16a3.67,3.67,0,0,1,.66,0,2.47,2.47,0,0,1,.49.19l.15-.44h1.1c.4,0,.67-.27,1-.4a4.85,4.85,0,0,1,.86-.17l0-.12H20a4.59,4.59,0,0,1-.93.44c-.53.13-1.09.19-.64.75l0,0-.2.17.08.08C18.36,14.49,18.41,14.43,17.47,13.9Zm-6-1.47a2.46,2.46,0,0,0-.47,0,4.08,4.08,0,0,0-.42.18l-.17-.14c-.18.23-.32.53-.56.66a11.57,11.57,0,0,0-2.44,2.3c-.06.06,0,.23,0,.37l0-.05-.19.16L7.3,16a.55.55,0,0,0,.14-.22c.32-.19.86-.34.9-.59.14-.69,1-.7,1.12-1.3.89-.19,1.36-1,2-1.47l0,0,.2-.16-.08-.08A.55.55,0,0,0,11.51,12.43ZM39,6l0,0,.16.2.08-.08A.33.33,0,0,0,39,6c-.76-.6-1.12-1.61-2.07-2A24.67,24.67,0,0,0,35.17,1.8c-.48-.14-.73-.22-1-.28s-.45-.15-.55-.07a.93.93,0,0,1-.63.23c-.26,0-.53-.09-.78.15-.07.07-.37-.15-.57-.15A2.5,2.5,0,0,0,30,2a1.38,1.38,0,0,0-.12.33l.5.22c.34.15.81,0,1.23.35.68.51,1.67.46,2.24,1.18a14.93,14.93,0,0,1,3,1.2A12,12,0,0,0,39,6ZM23,9.88a5.35,5.35,0,0,0,1.2.38,10.46,10.46,0,0,0,1.09-.21c.18,0,.37.08.55.09a4.1,4.1,0,0,0,1.59,0A3.49,3.49,0,0,1,28.56,10a3.28,3.28,0,0,0,2.12-.45,9.85,9.85,0,0,0-3.95-.79l.42-.42c.59-.1,1.24.16,1.81-.24a.58.58,0,0,1,.57,0c.49.4,1.16.28,1.65.64,0,0,.11,0,.25-.09l-.34-.83a4.92,4.92,0,0,1-1.52-.18,15.23,15.23,0,0,0-2.14,0c-.73,0-1.45-.22-2.17-.22a10.77,10.77,0,0,0-3.49.22,1.48,1.48,0,0,1-.42,0l-.08.75-2,1.37h1.19c.29-.17.58-.46.81-.42a2.31,2.31,0,0,0,1.57-.55,10.18,10.18,0,0,1,2.36-.67,1.1,1.1,0,0,1,.43,0A.85.85,0,0,1,25,9c-.75,0-1.1.8-1.77,1L23.2,10l-.19.17.07.07C23.14,10.19,23.19,10.12,23,9.88ZM41.68,33.7h1.15A2.3,2.3,0,0,0,45,32.49a9.75,9.75,0,0,1,.71-1.09c0-1,0-1.88,0-2.79a1.53,1.53,0,0,0-.34-1.05,10,10,0,0,1-.74-1.25,15.92,15.92,0,0,0-2.19-3.14,3.72,3.72,0,0,0-.64-.46l-1.28-.9c-.56-.1-1.12-.22-1.68-.29s-1.25.15-1.84-.32c-.92.91-2.25,1.35-2.78,2.65a9.1,9.1,0,0,0-1,3.75c.24.32.4.75.7.9.78.39,1,1.17,1.46,1.78.13.18.21.47.38.54.85.31,1.37,1.16,2.29,1.38.11,0,.19.24.25.32H39.4ZM18.92,28.36c0-.18-.07-.4,0-.48a2.79,2.79,0,0,0,.46-2.2,8.33,8.33,0,0,0-.23-1.21,4.69,4.69,0,0,0-1.36-2.55,14.12,14.12,0,0,1-1.19-1.37,4.09,4.09,0,0,1-.5,0c-.92-.08-1.86.2-2.77-.22-.16-.07-.44,0-.65.13-.47.2-.93.44-1.21.58a7.52,7.52,0,0,1-1.07,1.21L9.59,22,7.91,23.28v2.87c-.72.77-.77,1.79-1.15,2.68.5.39,0,1,.29,1.5.89.13,1.81-.18,2.61.24a18.49,18.49,0,0,1,2.47-.76,15.78,15.78,0,0,1,3.54-.65,2.45,2.45,0,0,0,.75-.2A21.86,21.86,0,0,1,18.92,28.36Zm2,12c.11-.21.19-.38.29-.54.53-.85,1-1.73,1.61-2.54a1.72,1.72,0,0,1,1-.72,3.46,3.46,0,0,1,3.31,1.18c.39.47.75,1,1.14,1.48a2.35,2.35,0,0,0,.42-1.45,13.08,13.08,0,0,1-.25-2.65.3.3,0,0,0-.07-.21A3.63,3.63,0,0,1,28,33.58a6.51,6.51,0,0,1-.19-1.39C26.91,31,25.88,30,25.85,28.72l-.92-1h-1.4c-.08.7-.64,1.2-.67,1.9-.59.52-.44,1.32-.72,2a10.25,10.25,0,0,0-.74,1.84,11,11,0,0,1-.83,1.9,1.22,1.22,0,0,1,.2,1.33,2.16,2.16,0,0,0-.17,1c0,.47,0,.94,0,1.36l-.84,1.28ZM19,31.77a3.2,3.2,0,0,0-2.78-1.15L16,31c-1.25.13-2.33.28-3.41.33s-1.93.84-3,.73l-.32.5H8.49L7.82,34l1.45,1.12a3,3,0,0,1,1.52.22c.16.1.49-.08.75-.13a10.54,10.54,0,0,1,1.66-.31c1,0,1.8-.22,2.2-1.23,1.1.21,2-.69,3.07-.43ZM34.18,7c-.52-.19-1-.37-1.55-.58S31.55,6,31,5.73A6.52,6.52,0,0,1,29.55,5c-.47-.4-1-.67-1.48-1s-.77-.76-1.28-1.12a4.23,4.23,0,0,0-1.6.33c-.46.3-1.2-.12-1.45.6.41.24.51.4.7,1.12l-1,1.34c.93,0,1.8.07,2.66,0,1.19-.11,2.32.3,3.49.25a.57.57,0,0,1,.22,0,6.79,6.79,0,0,0,2.44.44c.23,0,.53,0,.68.07C33.36,7.34,33.77,7.06,34.18,7ZM40,37.47c.07-.67-.54-.62-.83-.88A17.59,17.59,0,0,0,37,34.91a27,27,0,0,0-2.45-1.27c-.58-.3-.58-.29-1,.39A3.73,3.73,0,0,0,35,35.16a13.07,13.07,0,0,1,1.74,1c.62.33,1.26.61,1.88.94.1.05.11.26.17.39Zm7-25.33a2.33,2.33,0,0,0-.32-.32c-.13-.08-.31-.08-.4-.18a11.62,11.62,0,0,0-3.33-2.07,4.76,4.76,0,0,0-3.39-.36,13,13,0,0,1,1.67.52c.9.44,1.78.92,2.63,1.43s1.8,1.18,2.79,1.83ZM31.37,35.48c-.55-.43-.42-1.14-.88-1.61s-.31-1.26-.88-1.55H28.52v1.11a10.29,10.29,0,0,0,1.26,2,1.58,1.58,0,0,0,1.4.66c.06,0,.11-.09.15-.13l-.2-.24Zm-16,11.61A1.54,1.54,0,0,0,17,46V44.28L16.35,44c-.26.38-.53.74-.77,1.12s-.47.75-.69,1.11Zm6.88-30.33c-.71.12-1.12-.55-1.85-.62A2.45,2.45,0,0,1,18.8,15l-.84,0c0,.17,0,.28,0,.32A4.17,4.17,0,0,0,21.23,17a2.33,2.33,0,0,1,.59,0,1.84,1.84,0,0,1,.45.22Zm8.85-5.17c.23.12.46.35.68.34.88-.06,1.79.23,2.65-.2.19-.1.41-.11.62-.23s.52,0,1.06,0l-.56-.42c-.51.07-1,.16-1.4.18A6.86,6.86,0,0,0,31.12,11.59ZM39,3.23a1.93,1.93,0,0,0-1.32-1.76l-.58.34,1.64,1.64ZM19.25,7.7a3,3,0,0,0-2.31.4l-.52.52c.32.35.71.31,1.15,0S18.62,8.05,19.25,7.7Zm21-2.91,2.47,1.9c0-.76,0-.76-.31-1.23C41.63,5.82,41.28,4.74,40.29,4.79ZM15.79,9.7l-.85-.58-.81.53.07.15L15,9.54l.13.78ZM23.11,50l-.56-.1v.93l.13.05ZM17,14.28v-.12h-.48v.12ZM7.44,17.39v-.12H7v.12ZM39.92,8.56l0-.21-.38.1v.11ZM22.27,3.66v.08h.24V3.66Zm-7,8.53h-.08v.24h.08Zm2.24.56v.08h.23v-.08Z\"></path>','best layout & design','gold','0.05302613973617554 -0.0009501445456407964 61.42697525024414 59.120948791503906'),(3,13,1,'2020-12-16 15:01:05','2020-12-16 15:25:47','3297dc88-c8a5-4e43-b955-236373e2bf35','<path d=\"M55.28,56.73l-.33.71a4.66,4.66,0,0,1,.74,3.43c.92,1.74.4,2.16-.64,3.08l.68,2.32a1.72,1.72,0,0,1-1.64,1c-1.11,0-2.22.13-3.17-.7a4.46,4.46,0,0,0-1.29-.49l-.24,1.5-1.6.94-1.39-1,.19-1.69-2.4-2.56-.42.18,1.12,1.06V66.2c-.68.89-1.38,1.84-2.93,1.23l-.76-2.37L40,65.51l-1,2.65-.9.27-1.36-.84V65.23c-.44-.45-.32-1.16-.23-2l-1,.34c-.3,1.3.73,2.24.85,3.55a1.16,1.16,0,0,1-1.11,1.1A2.17,2.17,0,0,1,34,66.56a11.51,11.51,0,0,0-.35-1.24l-1.42-.43c-.14.8-.26,1.53-.4,2.25a1.33,1.33,0,0,1-1.22,1.26l-.82-.92v-3c-.75-.61-.75-.61-1.44-.55L29,65.07c-.51.72-.92,1.51-2.05,1.52l-.85-1.14,1-1.7-1.14-1.31a2.68,2.68,0,0,1,1-2.76,1.64,1.64,0,0,0-.79-1.17,6.54,6.54,0,0,0-3-1,12.19,12.19,0,0,1-2.34-.3,2.5,2.5,0,0,0-2,.13,4.09,4.09,0,0,1-3,.13,10.44,10.44,0,0,0-3.06-.08,3.88,3.88,0,0,1-1.52-.05A9.5,9.5,0,0,0,10,57a4.15,4.15,0,0,1-3.14-2.66,45.33,45.33,0,0,1-1.53-4.75,3.83,3.83,0,0,1,0-1.07c0-.72,0-1.43,0-2.13l-.65-.51-2.48-4c0-.61,0-1.36,0-2.11a1.39,1.39,0,0,0-.09-.58,4.47,4.47,0,0,1-.38-2.44c0-.56,0-1.12,0-1.67A19,19,0,0,0,.35,27.74a4.77,4.77,0,0,1-.12-3.27,8.11,8.11,0,0,0,.26-1.39c.21-1.65.39-3.31.59-5,0-.43.14-.86.24-1.4.3-.56.7-1.2,1-1.88a11.73,11.73,0,0,1,2.51-3.31A45.26,45.26,0,0,1,9.12,7.77,30.86,30.86,0,0,1,13.52,5a4.22,4.22,0,0,1,.76-.32,4.52,4.52,0,0,0,2-1.29,7.89,7.89,0,0,1,3.45-2c.33-.13.7-.16,1-.27a3.16,3.16,0,0,1,2.47,0c.94-.29,1.87-.64,2.84-.85A7.54,7.54,0,0,1,28.75.05C29.8.2,30.89.09,32,.14c1.39,0,2.78.14,4.16.25A2.78,2.78,0,0,1,37,.7c1.31.64,2.6,1.35,4,1.92a5.14,5.14,0,0,1,1.79,1.13A26.92,26.92,0,0,0,46.83,6.8c.89.65,1.77,1.33,2.64,2,1.38,1.1,2.06,2.69,2.92,4.16a23.38,23.38,0,0,1,1.4,3.4,9.88,9.88,0,0,0,1.31,2.11,6.09,6.09,0,0,1,1,1.88c.27.95.65,1.86,1,2.79a5.41,5.41,0,0,1,.12.58,13.93,13.93,0,0,0,1.74,4.88,9.78,9.78,0,0,1,1,2.55c.22.67.38,1.37.54,2.07a1.89,1.89,0,0,1,0,.71c-.17,1.25-.37,2.5-.58,3.83l.63,2-.94,2.84.81,3.24c0,.47.1,1.25.09,2a12.17,12.17,0,0,1-.38,4.33,2.32,2.32,0,0,0-.07.59A3,3,0,0,1,58.76,55a15.6,15.6,0,0,1-3.16,1.59ZM20.1,27.85l-.24.25-.06.09.06-.1.24-.23.25-.22a3.19,3.19,0,0,0,1.45-1.15c-.68.14-1.36.26-1.48,1.11Zm-.72,2.39-.06.11.06-.1.24-.24c.93,0,1.24-.77,1.81-1.24a.45.45,0,0,0-.35,0c-.49.4-1,.8-1.46,1.21ZM40.9,43.16l.17-.26-.1,0-.07.31-.18.26.1.06Zm15.52-16,.12,0-.09-.08-.09-.3-.11.05ZM23.68,25.23l1-.24.54,0-.05-.18-.49.21-1,.24-.3.1.07.11ZM58.35,37.42a.83.83,0,0,0-.34.94c.48-.25.3-.63.34-.94l.18-.26-.11,0ZM24.9,28.61c1.12-.42,1.18-.46,1.44-1.3l-1.49,1.24-.09.15Zm15.51,16-.62,1,.36.72-1.86,2.52a4.94,4.94,0,0,1-1.66,3.28v1.59l.61.87c.06.61.1,1.12.17,1.63,0,.09.17.15.28.26l.71-.41.37-1.52-.46-1.15a22.2,22.2,0,0,0,3.78-9.5c-.57.83-.44,1.88-1.56,2.33l-.1-1.63.2-.5-.17-.05ZM21.29,9.2h0a6.39,6.39,0,0,1-3,1.9l-.09.76a2.07,2.07,0,0,0,1.95.4L21.89,12a48.17,48.17,0,0,0-2.79,4l.84.67a23.1,23.1,0,0,0,2.2-2.79,6.65,6.65,0,0,1,1.32-1.64,11.2,11.2,0,0,1,1.18-.85l-.1-.64c-.94-.59-1.91-.26-3-.23.84-.67,1.53-1.2,2.19-1.76S25.25,8,25.61,7.12c-.52-.7-1.12-.57-1.75-.34-1.78.64-3.58,1.25-5.37,1.89A4.3,4.3,0,0,0,18,8.9c-.09.51-.14.94.35,1.2C19.45,10.14,20.32,9.49,21.29,9.2Zm2.8,35.64c1.24,0,2.35,0,3.47,0a6.35,6.35,0,0,0,4.06-1.06,5.08,5.08,0,0,1,1.31-.56,10.39,10.39,0,0,0,4.19-2.84,4.42,4.42,0,0,0,1.39-3.76,8.91,8.91,0,0,0-.31-1.26,7.59,7.59,0,0,1-.38-1,2,2,0,0,0-1.35-1.67c-.55-.21-1.11-.38-1.67-.57l-1.88-.61c-.69-.09-1.36-.14-2-.29-2.13-.46-4.23-.67-6.22.53a9.81,9.81,0,0,1-1,.42,10.42,10.42,0,0,0-3.18,1.64l-.68,1.35a6.75,6.75,0,0,0-.69,3.33,2.37,2.37,0,0,0,.4,1.1,10.6,10.6,0,0,1,1,1.46C21.21,42.83,22.79,43.66,24.09,44.84ZM42.74,14a3.88,3.88,0,0,0-2-1.31,5.43,5.43,0,0,0-4.15-.13,4.44,4.44,0,0,0-2.19,1.74c-.6,1.06-1.12,2.18-1.7,3.33.91,1.86.43,3.87.55,5.68a13.12,13.12,0,0,0,.86,1.18A19.12,19.12,0,0,0,35.53,26a.71.71,0,0,0,1,0l-.06-1.11a4.43,4.43,0,0,1,2.7.19A3.06,3.06,0,0,0,41.28,25a9.34,9.34,0,0,1,2.14-.68,3.42,3.42,0,0,0,2.9-2.65,7.61,7.61,0,0,0,.24-3.77l-.68-.65L45.6,15Zm7.93,13.67c-.83.52-1.9,1.12-2.9,1.82a2.41,2.41,0,0,0-.83,1.13c-.42,1.31-.73,2.66-1.09,4A11,11,0,0,0,46.52,36a4.48,4.48,0,0,1,.8,2,2.09,2.09,0,0,0,1.8,1.92,4.07,4.07,0,0,1,2.42,1.42,2.26,2.26,0,0,0,.9.53c.52.18,1.07.29,1.72.46a4.79,4.79,0,0,0,1.18-1.06,8.74,8.74,0,0,0,1.06-2.49c.18-.85.52-1.66.78-2.5a3.72,3.72,0,0,0,.22-1,13.14,13.14,0,0,0-.19-2c-.17-.89-.41-1.77-.62-2.68l-3.13-2.61ZM46.78,53.28l1.32,1c.46.35.71,1,1.41,1a4.74,4.74,0,0,0,.82-2.08,2.64,2.64,0,0,0-.18-2,6.71,6.71,0,0,1-.6-2.16,11.81,11.81,0,0,0-1.84-4.76H46.2a8.15,8.15,0,0,0-1.55,4.23c-2.22,1.39-2.34,3.63-2.44,5.92.42.39.29,1.31,1.13,1.46a2.86,2.86,0,0,0,1.24-1.56A1.87,1.87,0,0,1,46.78,53.28ZM5.85,40A16,16,0,0,0,6,42a22.66,22.66,0,0,0,.7,2.4,4.14,4.14,0,0,1,.39,1.82,14.18,14.18,0,0,0,.18,2.29l1.23.4.42-.44v-3.9a6.26,6.26,0,0,1-1.12-3.29,4,4,0,0,0-1-2.94,1.69,1.69,0,0,1-.4-.84c-.45-1.92-.87-3.85-1.33-5.95l-.43-.23a3.58,3.58,0,0,0-.48,2.12,44.71,44.71,0,0,0,.69,4.45,6.92,6.92,0,0,0,.62,1.53A3.55,3.55,0,0,0,5.85,40Zm11.72-5.59-1.45.86.33,1.31-1-.08c-.05.49-.1.91-.12,1.34s-.62.78-.22,1.35l1.08-.16A5.72,5.72,0,0,0,17.57,34.43Zm22.78-2.52A1.74,1.74,0,0,0,40,33.69a20.37,20.37,0,0,1,.14,4.87,8.55,8.55,0,0,0,.19,2.31A13.32,13.32,0,0,0,40.35,31.91ZM25.12,23.68a3,3,0,0,0,.94-2l-.92-.87L22.62,24.2ZM36.78,46l-.17-.16c-.67.14-1.35.26-2,.43a17.11,17.11,0,0,0-2,.64c-.62.25-1.4.14-2,.86a6.09,6.09,0,0,0,2.29-.14c.91-.18,1.75-.72,2.72-.52ZM17,31l-.22-.27a11.59,11.59,0,0,0-3.05,2.19c-.07.56-.21,1.07.52,1.4Zm5.88-11.44c-.52.89-.52.89-.39,1.47a3.18,3.18,0,0,1,2.73-1.33l-1-.94ZM37.3,44.8a3.63,3.63,0,0,0,.29-2.2l-.73,1.49a4,4,0,0,0,.17.41A2.78,2.78,0,0,0,37.3,44.8ZM5.85,33.18c0,.89,0,.89.65,1ZM44.07,44.36a.83.83,0,0,0-.4,1.21Zm-20.54-18-.07-.17-.42.19.07.16Zm19,16.2c-.07.12-.14.19-.13.23s.11.08.17.12ZM24.12,29.21c0-.17,0-.09,0,0ZM59,34.38a.29.29,0,0,0,0-.1l-.08,0a.32.32,0,0,0,0,.09ZM42.91,36.31l.05-.15-.08,0A.41.41,0,0,0,42.91,36.31Z\"></path>                             <path d=\"M21.29,9.2,21.53,9l0,.1-.29.09Z\"></path>','product of the year','gold','-0.0023812504950910807 0.012114578858017921 60.56385803222656 68.50788879394531'),(4,14,1,'2020-12-16 15:01:05','2020-12-16 15:25:47','14bc152f-5441-478b-aa9d-9faab48d3314','<path d=\"M95.52,46.22c-.08.12-.22.23-.23.35a11.6,11.6,0,0,0,0,1.56,8.38,8.38,0,0,1-.52,3.47,3.51,3.51,0,0,0-.19.91c-.06.64-1,3.28-1.51,3.6s-.83,1.16-1.43,1.54-1.25.69-1.8,1.12a9.39,9.39,0,0,1-2,1.25c-1,.42-1.85,1-2.72,1.47L82,61.87a3.62,3.62,0,0,1-2.17.59,5.82,5.82,0,0,1-2-.13A21.4,21.4,0,0,0,74.44,62a1,1,0,0,0-.17.07,2.23,2.23,0,0,0-.06.41,17.72,17.72,0,0,1,0,2.06A4,4,0,0,0,74.46,66a8.76,8.76,0,0,1,.2,3.3,6.56,6.56,0,0,1-.45,1.56,12.44,12.44,0,0,0-.48,3.55l-1.44,3.41c-.79.65-1.82,1.39-2.73,2.26a2.9,2.9,0,0,0-1.11,2.24c0,1.16,0,2.32,0,3.62l-1.67,1.43c.06,1.2-.19,2.23.21,3.25l-.31,1.62-.74.66h-.8a4.86,4.86,0,0,1-.51-.89,7,7,0,0,0-1.43-2.54,1.9,1.9,0,0,1-.24-2.3c-.33-.93-.23-2-.85-2.77a20.38,20.38,0,0,0-1,2,6.53,6.53,0,0,0-.51,2,8.65,8.65,0,0,0,.17,3,7.26,7.26,0,0,1,0,2l-.28.34c-.22-.06-.32,0-.36-.1a20.36,20.36,0,0,1-1.79-2,5.42,5.42,0,0,1-.64-1.74c-.21-.83-.34-1.68-.52-2.51a2.67,2.67,0,0,0-.26-.66,5.65,5.65,0,0,1-.64-2.7A4.41,4.41,0,0,0,55,80.72a6,6,0,0,0-1.51-1.2l-1-2.79-1-.59a22.34,22.34,0,0,1-2.19-1.37,7.74,7.74,0,0,1-2.11-3.24c-.15-.36-.29-.73-.47-1.19a29.33,29.33,0,0,0-.31-4A12.25,12.25,0,0,0,46,63.78c-.11-.28,0-.7,0-1.08-.18-1.33-.21-2.67-.29-3.73.24-1.4,1.17-2.07,1.83-2.87a3.24,3.24,0,0,0,.76-2.78l-.41-.56V51.52c-.28-.39-.51-.75-.77-1.09a2.7,2.7,0,0,1-.49-1,3.36,3.36,0,0,0-.86-1.51A11.63,11.63,0,0,1,44,45a1.53,1.53,0,0,1-.13-.68,5.49,5.49,0,0,0-.21-1.75,1.9,1.9,0,0,1,.16-1c.12-.41.3-.81.45-1.22l-.61-.4a10.86,10.86,0,0,1,.15-2.2c.23-1.8.87-3.47,1.25-5.22a6.32,6.32,0,0,1,.45-1.08,1.58,1.58,0,0,1,.92-.83,33.45,33.45,0,0,0,3.15-1.77c.32-.19.67-.48.4-1l-1.08.86-.25-.25L50,27.12a5.77,5.77,0,0,1,.41-2.27c.29-.67-.19-1.28-.31-1.91a2.64,2.64,0,0,0-.21-.47l-.75-.39-1,.24L47,23.75c-.56,1.19-1.69,1.88-2.51,2.82H43.6c-.36-.46-.73-1-1.15-1.44a4.15,4.15,0,0,0-.78-.85c-.41-.27-.65-.78-1-1.14a8.91,8.91,0,0,0-1-.82,5.83,5.83,0,0,0-3.46-1.25,10.12,10.12,0,0,1-1.51-.25c-.73.55-1.47,1.07-2.17,1.64a3,3,0,0,0-1.15,1.61c-.3,1.28-1,2.47-1,3.84a4.22,4.22,0,0,1-.22.9,3.16,3.16,0,0,0,1,2.92A11.26,11.26,0,0,1,33.29,35l1,1.06c.41.43.82.87,1.25,1.28a2.8,2.8,0,0,1,.87,1.38,1.65,1.65,0,0,0,.33.75,1.24,1.24,0,0,1,.37,1.16L38.55,42a26.07,26.07,0,0,1,.34,3.09,26.65,26.65,0,0,1-.41,3.18l-1.6,2.23a15.59,15.59,0,0,1-3.44,3.44c-.19.15-.35.32-.54.47a1.87,1.87,0,0,1-1.3.48c-.48,0-1,0-1.44,0a3.61,3.61,0,0,1-3.26-2c-.21-.37-.49-.71-.71-1-.3-1-.57-2-.9-2.92-.48-1.41-1-2.79-1.49-4.2a5.45,5.45,0,0,1-.13-1.07,22.43,22.43,0,0,0-1-2.35,15,15,0,0,0-1.46-2,5.38,5.38,0,0,0-.95-1,10.17,10.17,0,0,1-1-1.21,10.76,10.76,0,0,0-1.28-1,21.21,21.21,0,0,1-2.3-1.64,6.62,6.62,0,0,0-2.7-1.35c-.7-.23-1.43-.39-2.14-.59a10.05,10.05,0,0,0-1.91-.16c-.52,0-1,0-1.56,0s-.77.1-1.36.18a2.08,2.08,0,0,0-.45-.16,2.09,2.09,0,0,0-2.64,1.42,5.09,5.09,0,0,0-.34,3.44,19.93,19.93,0,0,1,.33,2.32,10.84,10.84,0,0,0,.34,1.6c.23.7.54,1.38.85,2.16l-.36.31A2.85,2.85,0,0,1,2.19,41.7a32.5,32.5,0,0,1-1.08-3.34c-.26-1-.39-2.06-.64-3.08A17.76,17.76,0,0,1,.23,31.5a4.14,4.14,0,0,0-.15-.68,2.11,2.11,0,0,1-.07-.7c.31-1.61.27-3.27.72-4.86.1-.34.32-.63.43-1a16.05,16.05,0,0,1,2.28-4.06A4.29,4.29,0,0,1,4.76,19,30.18,30.18,0,0,1,7.58,17.5c.63-.3,1.29-.54,1.91-.84l1.68-.47,0-.06,2.22-.22,1.37.15c.82.08,1.67-.2,2.46.22a1.64,1.64,0,0,1,1.68.47c.1.09.3.06.39.07l1.42,1.7a3.44,3.44,0,0,0,.14-1.34c0-.48,0-1,0-1.44v-1.2c.42-1.17.74-2.26,1.2-3.29A14.75,14.75,0,0,1,25.57,6a29.48,29.48,0,0,1,3.59-2.89,1.28,1.28,0,0,1,.42-.17A11.74,11.74,0,0,0,31.47,2,8.58,8.58,0,0,1,35.05.73,4.88,4.88,0,0,0,36,.52,20,20,0,0,1,41.23,0a7.87,7.87,0,0,1,1.08.21,5,5,0,0,1,3.51.18,23.41,23.41,0,0,0,4.11,1.31,10.3,10.3,0,0,1,1.86.71l.75.3L54,3.82a37.6,37.6,0,0,1,3.92,3.43c.36.36.81.63,1.17,1s.66.78,1,1.17a15.35,15.35,0,0,1,2.67,5.21,2.44,2.44,0,0,1,.05.63,6.67,6.67,0,0,1,1.87,3.69.69.69,0,0,1,0,.47,4,4,0,0,0-.22,1.88l.46,1-.19.51c.13.52.73.93.27,1.54.64.87,1.39,1.54,2.4,1.36l2.24.72,1.34-1.27a12.45,12.45,0,0,1,4.47-4.53A12,12,0,0,0,76.57,20a1.6,1.6,0,0,1,2-.11,5,5,0,0,1,2.31-.51,5.19,5.19,0,0,1,2.23.57c.3.2.74.21,1.06.4s.58.36.9.52a17.57,17.57,0,0,1,1.59,1.21c1.18.77,1.87,2,2.89,2.95a6.14,6.14,0,0,1,.89,1.51c.08.4.15.87.27,1.32a1.55,1.55,0,0,1-.2,1.13c-.44,1-.87,2-1.29,2.95l-1.53,1.61a24,24,0,0,0-6.24,3.32v1.36c0-.19,0-.14,0-.11A3,3,0,0,1,81.63,41a13.24,13.24,0,0,1-2,4c-.44.6-1,1.13-1.45,1.72-.35.42-.67.87-1.12,1.47l-.71,2.68L77,53.2a2.81,2.81,0,0,0,2.44.27c.36-.17.86,0,1.27-.16a17.24,17.24,0,0,0,2-.64,19,19,0,0,0,2.17-1.17c1-.62,2.07-1.23,3-2a5.62,5.62,0,0,0,2.18-2.09c.25-.6.82-.82,1.19-1.25a10.79,10.79,0,0,0,1.52-2.66L94,42.93c.79.38,1.11,1.17,1.56,1.86Zm-15.32-23L82.32,23c-.6-1.24-.73-1.34-2.17-1.68-.63.29-.4.84-.41,1.23l.46.67-.68-.15v1.55ZM64.8,53.34a6.77,6.77,0,0,0-.65,2.89A4.61,4.61,0,0,1,64.1,58a4.13,4.13,0,0,0,.1,2.88,2.34,2.34,0,0,1,.11,1.73,6.11,6.11,0,0,0-.39,2.63l-1,2A2.87,2.87,0,0,1,63,69.34,6.22,6.22,0,0,0,62.49,72a1.42,1.42,0,0,0,.11.33h.77L64,71.6c.59-1.91,1.25-3.61,3.32-3.74A10.46,10.46,0,0,0,68.7,68a2.37,2.37,0,0,1,2,.63c.07.07.21.08.43.15L72,68a8.17,8.17,0,0,1-.26-2.27,13.87,13.87,0,0,1,0-1.44c0-.55-.14-1.09-.15-1.63,0-1.08,0-2.16,0-3.23a5.84,5.84,0,0,0-.64-2.75L70.56,54l-.84-1-1.11-.54a18.07,18.07,0,0,1-1.87.29A15.67,15.67,0,0,0,64.8,53.34Zm-17.62-8a15.37,15.37,0,0,0,1.33.87,11.76,11.76,0,0,1,1.4.59c1.15.8,2.36.57,3.58.35a1.25,1.25,0,0,0,.62-.33c1.4-1.48,2.35-3.1,1.73-5.26a3.07,3.07,0,0,1,0-1,3.34,3.34,0,0,0,0-.43,10.63,10.63,0,0,0-1.62-4,11.53,11.53,0,0,0-.94-1.21L50.59,34a4.56,4.56,0,0,0-2,.85l-1,2-1.21.06L46,39.54c.21.48.48,1,.66,1.55a2.51,2.51,0,0,1,.26,1.72A3.26,3.26,0,0,0,47.18,45.32Zm1.11-34.87,1.21.84c1.93-.44,3.69-1.09,5.62-1a7.6,7.6,0,0,1,2.37.25,1.46,1.46,0,0,0,.59,0,1,1,0,0,0,.3-.12v-1l-1-.92-1.56-.63H54.12l.51-.69L53.75,6l-4.2-.18c-.23,0-.47,0-.71,0-.07,0-.13-.07-.23-.13l.22-.67-.48-.45c-.55.09-1.12.24-1.7.29s-1.34.57-2,.1c-.51.22-1,.44-1.12,1.11l.64.76c1.29-.26,1.88.73,2.71,1.45L49.18,8l2.13.23L51,8.58l-.47-.17-1.58.79ZM9.73,22.33c-.32-.6-.62-1-.15-1.62l1-.21-.79-.39A5.93,5.93,0,0,1,7.9,21.37c-.16-.13-.29-.31-.46-.36a1.43,1.43,0,0,0-.88-.07,3.38,3.38,0,0,0-1.13.84C4.54,22.87,3.71,24,2.87,25.11c0,.77.6.76,1,1,.59-.41,1.21-.15,1.79-.25,1.76-.31,3.53-.6,5.27-1a3.16,3.16,0,0,1,1.33-.11,1.32,1.32,0,0,0,.52,0l2.42-.56L17.9,26l3.32-2.58a2.6,2.6,0,0,0-.67-.12c-.19,0-.42.21-.54.15a12.64,12.64,0,0,0-2.85-.57,16.4,16.4,0,0,0-2.32-.33,4.49,4.49,0,0,1-1.74-.22c-.15-.07-.38,0-.79.1l2.53,1.38a2.45,2.45,0,0,1-1.8,0C11.94,23.25,10.82,22.8,9.73,22.33ZM69.42,42.19a1.66,1.66,0,0,1-.2,1.56l.55,2.19H71c.25-.52.48-1,.73-1.49s-.38-1.07.29-1.6c.29.07.65.18,1,.25s.82.25,1.1.11c.45-.23.75.14,1.1.12.39-.42,1.09-.56,1-1.35l-.76-.12L73.34,40,72.4,40c.27-1.18.08-1.52-1.43-2.73-.5.74-.13,1.81-1,2.54-.31-.05-.7-.08-1.07-.16a4.35,4.35,0,0,0-2.55.16,1,1,0,0,0-.73,1.15A9,9,0,0,0,69.42,42.19ZM52.18,16.91c.18.65.46,1.13,1.13,1.21l1.06-.5a7.76,7.76,0,0,0,.92.11,23.62,23.62,0,0,1,2.38,0c1.17.14,2.41.07,3.46.84.2.14.58,0,1,.08l.13-1a5,5,0,0,1-.66-.5A4.13,4.13,0,0,0,59.36,16c-.49-.13-1.07,0-1.5-.19-.63-.29-1.29,0-1.86-.22a4.34,4.34,0,0,0-1.93,0,2.3,2.3,0,0,0-1.12.38A1.45,1.45,0,0,0,52.18,16.91ZM87,56c.49-.76,1.66-.71,2-1.54V53l-.63-.17a5.13,5.13,0,0,0,1-.64A5.85,5.85,0,0,1,91.17,51l1.21-.62c.06-.48.07-.87-.41-1.06-.82.34-1.78.37-2.32,1.16l-1,0c-.22.21-.38.38-.56.54a1.54,1.54,0,0,1-.31.17,5.16,5.16,0,0,0-2.37,2.65l.46.62c-.51.13-1.27-.07-1.13,1l.48.52ZM53.42,13.68a8.62,8.62,0,0,1,.95.49c.47.33,1,.11,1.49.26a8.18,8.18,0,0,0,4.49-.26,1.28,1.28,0,0,0,.92-.72.66.66,0,0,0-.5-.76,6,6,0,0,0-2-.47h-5C53.23,12.68,53.4,13.13,53.42,13.68ZM36.58,10.27a4.59,4.59,0,0,1,.26,1.23c-.08,1.09.18,2.15.06,3.25a9.22,9.22,0,0,1-.7,2.94h.69c1.08-.56,1.22-1.57,1.56-2.2.26-1.28-.1-2.37.08-3.46a1.51,1.51,0,0,0-.13-.56c-.15-.51-.31-1-.48-1.6l-.68-.29Zm9.35,1.51A28.3,28.3,0,0,0,44.07,17a2.46,2.46,0,0,0,.5,2.26,7.39,7.39,0,0,0,1.16-2.75c.12-.41.08-.92.32-1.23.75-1,.61-2.14.85-3.22,0-.06-.07-.14-.12-.23Zm-14.57,2,1.32,4.56a4.06,4.06,0,0,0,.61-1.85A11.73,11.73,0,0,0,32.83,13a1.44,1.44,0,0,0-.8-1A1.9,1.9,0,0,0,31.36,13.79ZM40.46,18l0,.41.76.34c1.48-1.2,1.55-3,2.05-4.55a7.22,7.22,0,0,0-.22-3.08c-.48.62-.49.62-.48,1a8.19,8.19,0,0,1-.42,2.54A9.6,9.6,0,0,1,40.46,18ZM21.91,24.22a8.71,8.71,0,0,0-2.86,2c1.07.41,2.15.83,3.25,1.22a2.43,2.43,0,0,0,.71.07Zm7,8.86-1.81,1.33a2.39,2.39,0,0,0,.53,1.73c1.15-.6,2.36-1.06,3-2.2l-.7-.86Zm0,6,1.76-.4,1.25-1.94a2.34,2.34,0,0,0-2.15.33l-.86-.25-.63.55v1.1ZM41.54,3.16l-.85.78.07.9,3.54-.62.5-.64A3.69,3.69,0,0,0,41.54,3.16ZM25.34,28.57c1,.67,2.17.79,2.61,1.87.61-.23.61-.23.79-.82A9.29,9.29,0,0,0,26.94,28c-.67-.43-1.29-.92-2.06-1.48Zm42.86-1a4.32,4.32,0,0,0-.54-.68,4.65,4.65,0,0,0-.79-.5c0,.65,0,.65,1.76,2.57H70.4c-.18-.5.47-.84.08-1.39ZM55.63,52.18c-.16.74-1.12,1.36-.16,2.19a3,3,0,0,0,.67-.3,18.31,18.31,0,0,0,2.48-2.5s-.06-.19-.13-.41l-2.4,1.43a2.43,2.43,0,0,0-.18-.32S55.84,52.25,55.63,52.18Zm-5.41-1.46a5.33,5.33,0,0,0,3.59-.54L54,48.67l-1.82.59.13.58H50.49Zm13.61,1.51L64.41,50l-.58-.46a3.49,3.49,0,0,0-1.07,2.1c0,.73-.54,1.43-.15,2.23Zm-2.31-30a3.19,3.19,0,0,0,1.37,1.46c.12.07.35,0,.54-.06V23l-.93-2.17c-.14.11-.33.2-.41.35s-.13.44-.24.65A2.28,2.28,0,0,1,61.52,22.23ZM72.84,32.81l.19-.09c-.12-.76-.18-1.53-.37-2.27s-.51-1.54-.8-2.39l-.15,3.41Zm-3,16c-.41-1.5-.47-1.64-.75-1.83a5,5,0,0,0-1.36,2.4c0,.15.1.31.24.68l.87-1.79.43.79a2.05,2.05,0,0,1,.25-.13ZM57.08,46.51c-.07,0-.25-.08-.35,0s-.58.32-.6.52c-.1.78-.72,1.06-1.26,1.41v.65c1.08.06,1.51-.77,2.07-1.28ZM55,33.8l1-.07a4.11,4.11,0,0,0-2.21-2.13l-.65.58C53.66,32.85,54.64,32.89,55,33.8Zm7-8.23c1.44.07,1.91,1.48,3,2l.07-1.36a13,13,0,0,0-1.48-.51C63.11,25.61,62.64,25.17,62,25.57ZM28,32.74l-1.83-1.2c.3.91.18,1.67.77,2.26C27.41,33.56,28,33.54,28,32.74Zm27.9,3.11c.56,1.35,1.36,2.28,1.89,3.4l.37-.35q-.43-.78-.87-1.59C57,36.79,56.89,36.13,55.92,35.85Zm28.51-9.11a1.09,1.09,0,0,0-1-.85c-.61.33-.35.86-.38,1.31A1,1,0,0,0,84.43,26.74Zm2.91-.32.39,1.11h.53l.39-1.05-.91-.83Zm-9.09.27-.59-2.38-.76-.08A5.38,5.38,0,0,0,78.25,26.69Zm-56.81,1.4a4.76,4.76,0,0,0,2.22,1.37C23.29,28.27,22.31,28.25,21.44,28.09ZM55,30.46a1.28,1.28,0,0,0-.55.82l1,.34.33-.31ZM23.5,30.21l0,.82,1,.93C24.24,31.19,24.2,30.57,23.5,30.21ZM77.75,24V22.75C77.27,23.36,77.27,23.36,77.75,24ZM46.31,34.44l-.33.92.19.13.61-.58Z\"></path>','best game','silver','0.005149666219949722 -0.025130489841103554 95.55484771728516 93.76514434814453');
/*!40000 ALTER TABLE `matrixcontent_matrixrewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_matrixshopitem`
--

DROP TABLE IF EXISTS `matrixcontent_matrixshopitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_matrixshopitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_item_itemDescription` text,
  `field_item_itemTitle` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_matrixshopitem_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_matrixshopitem_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_matrixshopitem_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_matrixshopitem_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_matrixshopitem`
--

LOCK TABLES `matrixcontent_matrixshopitem` WRITE;
/*!40000 ALTER TABLE `matrixcontent_matrixshopitem` DISABLE KEYS */;
INSERT INTO `matrixcontent_matrixshopitem` VALUES (1,24,1,'2020-12-17 13:19:11','2020-12-17 13:28:03','c7cb5292-b8c5-434e-97bf-d10824cca260','<p>The streets of <strong>Galgenbeck</strong> are overrun by <strong>Goblins</strong>, turning burgher and pauper alike into their own cursed kin. But a local alchemist claims to have a cure. Only, the price is steadily increasing.</p>','The Goblin Grinder'),(2,25,1,'2020-12-17 13:28:03','2020-12-17 13:28:03','40374e8b-ea04-4820-b22b-a2d260afe2e8','<p>The PCs find themselves<strong> buried alive </strong>in the vast, ever-changing cemetery of <strong>Graven-Tosk</strong>. This dark and weird tombcrawl is suitable as a campaign starter or a post-TPK adventure.</p>','Graves Left Wanting'),(3,26,1,'2020-12-17 13:28:03','2020-12-17 13:28:03','4430b301-73ee-41fc-af97-6f8239147e70','<p><strong>Villagers disappear</strong>. Tracks lead to an underground temple of bacchanalian frenzy, reeking of rot, offal and bile. Find them and sate your hunger in <em>Bloat</em>, a gluttunous one-page dungeon.</p>','Bloat'),(4,27,1,'2020-12-17 13:28:03','2020-12-17 13:28:03','063bfc53-1759-4fca-ba1c-7212c27ec361','<p><strong>Cursed with eternal life </strong>and destined to roam the world trading shards of souls for ruinous relics. You never know when this <strong>mysterious monger</strong> might appear. Will you make a deal?</p>','The Merchant'),(5,28,1,'2020-12-17 13:28:03','2020-12-17 13:28:03','100bad88-c4a9-4e2a-8d5e-c463c6ff68f1','<p><strong>Occult treasures</strong>, <strong>trinkets</strong> and <strong>weapons</strong> to be found in the many sealed graves and vaults of MÖRK BORG.</p>','The Tenebrous Reliquary');
/*!40000 ALTER TABLE `matrixcontent_matrixshopitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `migrations_track_name_unq_idx` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','b2defec0-ddee-4686-b7e3-18b514e2e96c'),(2,'craft','m150403_183908_migrations_table_changes','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','85254bf0-c878-4312-9288-01892a703dbc'),(3,'craft','m150403_184247_plugins_table_changes','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','4fe1f806-6d19-408e-92d8-191cdc07bb77'),(4,'craft','m150403_184533_field_version','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','664421e3-b5f6-4a63-9cdd-88d7576ea97a'),(5,'craft','m150403_184729_type_columns','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','b27cf59a-5167-4e0d-a4f0-bdbfe6a3ba3b'),(6,'craft','m150403_185142_volumes','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','b9c00adc-86f7-49d3-81da-487f1e622b53'),(7,'craft','m150428_231346_userpreferences','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','aa2bf5f2-0876-4dc0-8443-b574558f1652'),(8,'craft','m150519_150900_fieldversion_conversion','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','f3ab4a30-77e1-49f8-a7f9-9e100a444ea0'),(9,'craft','m150617_213829_update_email_settings','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','49e5959c-9093-4cc4-a799-74e45c1a8fc1'),(10,'craft','m150721_124739_templatecachequeries','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','dba2bf86-26d2-4553-b925-86d1b929953f'),(11,'craft','m150724_140822_adjust_quality_settings','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','cfff414c-cee4-4330-a471-7870457ab1ef'),(12,'craft','m150815_133521_last_login_attempt_ip','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','177194a6-5ead-48b7-a44f-72cfe5996ffa'),(13,'craft','m151002_095935_volume_cache_settings','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','4806cfd8-73e3-4da0-88ca-947cd2b49b28'),(14,'craft','m151005_142750_volume_s3_storage_settings','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','238aecaf-0aab-4b93-8adf-07b99546d9e0'),(15,'craft','m151016_133600_delete_asset_thumbnails','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','41b61c22-fdb8-428c-90e0-cf4f41d32f5e'),(16,'craft','m151209_000000_move_logo','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','95ef2223-e35f-4027-8c7e-f300c18d8ada'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','c3cc0c8c-4fe4-4727-af7a-8a0d23a449b8'),(18,'craft','m151215_000000_rename_asset_permissions','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','bc892b6d-6491-451f-bbfc-79f9655077e3'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','20dcfa41-7fe2-410e-837d-00267dafccb0'),(20,'craft','m160708_185142_volume_hasUrls_setting','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','d02372c3-27a5-4d31-a533-f325758b6fcc'),(21,'craft','m160714_000000_increase_max_asset_filesize','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','fb5d78e7-53e0-4cf4-9138-739d3b1ae541'),(22,'craft','m160727_194637_column_cleanup','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','dd22a468-77e8-41f0-8417-0fe13fb2f578'),(23,'craft','m160804_110002_userphotos_to_assets','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','20531945-7f60-4a4c-9cc5-62663e4829a1'),(24,'craft','m160807_144858_sites','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','65efd765-6db7-41de-904d-01a6395a4101'),(25,'craft','m160829_000000_pending_user_content_cleanup','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','b65859da-976c-410f-b174-818ea7d391e9'),(26,'craft','m160830_000000_asset_index_uri_increase','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','7ec817e0-343b-4f97-ae82-fbd10c8dc6cb'),(27,'craft','m160912_230520_require_entry_type_id','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','0290a72a-fe56-49f9-81f0-be5853875d74'),(28,'craft','m160913_134730_require_matrix_block_type_id','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','2cd3191f-710f-4000-b775-71a7dac0e014'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','24a79e97-9464-43e4-94b8-73d334c4439c'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','e6bac29f-3beb-4515-8571-0cd03afc1283'),(31,'craft','m160925_113941_route_uri_parts','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','5190ef9d-bac2-444a-9c98-63b9925f4b2c'),(32,'craft','m161006_205918_schemaVersion_not_null','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','b6545b81-46d1-418f-88b2-1956f3a91923'),(33,'craft','m161007_130653_update_email_settings','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','445b13f9-ac9e-4017-bd05-07cbf28bc03f'),(34,'craft','m161013_175052_newParentId','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','9fc044aa-25b4-4480-b23e-6c88c0b854ce'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','e74d93f2-7372-49b5-ab1a-84828ba3b717'),(36,'craft','m161021_182140_rename_get_help_widget','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','8a1e8ae3-0172-4305-9080-7aef8cb09983'),(37,'craft','m161025_000000_fix_char_columns','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','cdb21499-5eea-4dd2-aa3f-9f90a6b15082'),(38,'craft','m161029_124145_email_message_languages','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','68c0c235-7777-4a75-ab07-b65cbed62973'),(39,'craft','m161108_000000_new_version_format','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','a363220e-97d1-4911-956b-fc808074e073'),(40,'craft','m161109_000000_index_shuffle','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','4308fe81-0fb6-4b9c-a278-e56a1558ab31'),(41,'craft','m161122_185500_no_craft_app','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','3874492a-09e5-44a6-bbda-6263c8ddddb0'),(42,'craft','m161125_150752_clear_urlmanager_cache','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','479f2eb0-a0b9-4d7a-8302-4479a256516c'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','3d5dc376-5b8c-4923-8797-43b974756e60'),(44,'craft','m170114_161144_udates_permission','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','04029874-8100-422e-b18f-0bcc612037f3'),(45,'craft','m170120_000000_schema_cleanup','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','9210f084-97a9-4a04-912b-766e598e6a87'),(46,'craft','m170126_000000_assets_focal_point','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','45c0d5d9-e418-4813-b91c-cfb8a2a1b26b'),(47,'craft','m170206_142126_system_name','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','16a81c39-f77e-4b8a-8bd9-36e37aebfba4'),(48,'craft','m170217_044740_category_branch_limits','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','dcec52d5-921b-4a75-a9f2-82ec0019c1ee'),(49,'craft','m170217_120224_asset_indexing_columns','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','3cd71440-7504-4c14-b9da-f834be0c76c6'),(50,'craft','m170223_224012_plain_text_settings','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','94df34c1-562d-4c48-91cc-cc23b30c6656'),(51,'craft','m170227_120814_focal_point_percentage','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','808854fe-34af-40c2-a483-d8567e884136'),(52,'craft','m170228_171113_system_messages','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','071048e0-99b6-44af-9475-e3364f40faaf'),(53,'craft','m170303_140500_asset_field_source_settings','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','33a29df4-a6c4-4496-b58a-36ced9d34fa5'),(54,'craft','m170306_150500_asset_temporary_uploads','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','b9b95008-7ee0-49eb-92fa-8dc8113821f5'),(55,'craft','m170523_190652_element_field_layout_ids','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','46a2ced8-5299-4625-a468-a2dd512cbfea'),(56,'craft','m170621_195237_format_plugin_handles','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','443d49b8-0f1b-425b-b77a-63c28109e214'),(57,'craft','m170630_161027_deprecation_line_nullable','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','ecadf745-df70-4e73-8d40-319473a41dae'),(58,'craft','m170630_161028_deprecation_changes','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','24fc399b-51e4-467f-b9ae-36d9dfab79ff'),(59,'craft','m170703_181539_plugins_table_tweaks','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','234d5f45-7bdd-4ce7-b514-65baca4d5740'),(60,'craft','m170704_134916_sites_tables','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','01a9225d-c07a-4f9a-966d-9363bdd8946a'),(61,'craft','m170706_183216_rename_sequences','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','e2bc3e50-dc5c-4acd-b39f-bdecd8871ae2'),(62,'craft','m170707_094758_delete_compiled_traits','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','4075df35-37a1-458d-b55c-fa62c497c4bf'),(63,'craft','m170731_190138_drop_asset_packagist','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','69180449-0ae1-44db-bd5b-2166a3d2155d'),(64,'craft','m170810_201318_create_queue_table','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','b20bb9d1-cde9-40d4-8c78-46cc8009193f'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','6bd2157b-0e20-4752-a880-01c11bd7cba2'),(66,'craft','m170914_204621_asset_cache_shuffle','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','5bc3bde4-5069-4352-8ca2-ecbc4453c3b8'),(67,'craft','m171011_214115_site_groups','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','09cc77af-99a8-4971-961a-30306be01468'),(68,'craft','m171012_151440_primary_site','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','8da64edf-579b-44d3-abb3-f362879a90ae'),(69,'craft','m171013_142500_transform_interlace','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','6efd6d8b-291e-45c5-aa3a-ed79ba778e07'),(70,'craft','m171016_092553_drop_position_select','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','438b370b-3d03-441b-b67c-ffd54073c0de'),(71,'craft','m171016_221244_less_strict_translation_method','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','b6638421-003a-41fa-bd99-ddbf9c12cb38'),(72,'craft','m171107_000000_assign_group_permissions','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','76a38781-e84b-4554-a602-3608686053c8'),(73,'craft','m171117_000001_templatecache_index_tune','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','a97b7301-df5e-4860-bcd7-31edd40f4dd7'),(74,'craft','m171126_105927_disabled_plugins','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','7bc0b46d-cf8a-4b23-b1fc-a7488559cab5'),(75,'craft','m171130_214407_craftidtokens_table','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','e0d05114-13f1-444d-877d-6cbab8bad466'),(76,'craft','m171202_004225_update_email_settings','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','82eeb37e-fd0c-42c5-a0c9-d2b44fb05e21'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','cac92cb9-5174-498e-8b8a-f663503ee213'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','5f2da6cd-a5b1-4db6-be4a-8e4711a6202e'),(79,'craft','m171218_143135_longtext_query_column','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','74ee051e-5a0d-4fb7-a30c-c100598e7ee0'),(80,'craft','m171231_055546_environment_variables_to_aliases','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','bec04b85-2cc1-43d1-8002-d81caf35551a'),(81,'craft','m180113_153740_drop_users_archived_column','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','0b3997ea-c007-4240-815b-ac793f1433ea'),(82,'craft','m180122_213433_propagate_entries_setting','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','abd174fc-4448-4c4c-9d24-5a07399dc18f'),(83,'craft','m180124_230459_fix_propagate_entries_values','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','955baf62-7254-47f9-a882-ed929be2fb1f'),(84,'craft','m180128_235202_set_tag_slugs','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','0a216a23-c8f0-4976-95b7-4d43001d1441'),(85,'craft','m180202_185551_fix_focal_points','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','5ad08af6-13f2-444b-8858-61ea3fa3d715'),(86,'craft','m180217_172123_tiny_ints','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','1fc387ce-3270-45ad-8d84-748d74a39dda'),(87,'craft','m180321_233505_small_ints','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','d6193279-392d-429a-ba1d-02f0ab70eab1'),(88,'craft','m180328_115523_new_license_key_statuses','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','321c43dc-b0db-4fa9-89e2-2a69393a82b3'),(89,'craft','m180404_182320_edition_changes','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','db950efc-a037-4f68-a2c7-b83ad171dea9'),(90,'craft','m180411_102218_fix_db_routes','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','70be023b-b605-4bd9-ab32-e212a77ae06c'),(91,'craft','m180416_205628_resourcepaths_table','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','34abea58-b24a-4bcf-a27d-615df98ec8f2'),(92,'craft','m180418_205713_widget_cleanup','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','c583e5ba-61f7-4806-93d6-9787d4544d45'),(93,'craft','m180425_203349_searchable_fields','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','50179b7d-eb0f-4d2b-889d-489e0b4c58ef'),(94,'craft','m180516_153000_uids_in_field_settings','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','b798bc8a-e28a-4e36-8d69-00fd7a83ce77'),(95,'craft','m180517_173000_user_photo_volume_to_uid','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','65ab4a91-e11e-45de-b7b2-1332ac08aeae'),(96,'craft','m180518_173000_permissions_to_uid','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','6f16afbe-2970-4530-a194-5bdc80b07e9f'),(97,'craft','m180520_173000_matrix_context_to_uids','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','42a18f09-bf7b-43f4-b9a5-8242e46ee6ce'),(98,'craft','m180521_172900_project_config_table','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','f5bb4cf6-cc85-4f7c-ba3b-df0a7b57bf62'),(99,'craft','m180521_173000_initial_yml_and_snapshot','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','9f0166b0-d7bd-432d-a556-2aa0ef62d765'),(100,'craft','m180731_162030_soft_delete_sites','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','e181f6c7-d949-4216-a598-cd384c940a63'),(101,'craft','m180810_214427_soft_delete_field_layouts','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','acbd4dfb-a19b-4019-9d33-acd9c6d9eb15'),(102,'craft','m180810_214439_soft_delete_elements','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','59c9ede8-3326-45c3-9290-21dd9d54f828'),(103,'craft','m180824_193422_case_sensitivity_fixes','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','884c079d-5dbf-46ee-8741-4d876fd87da5'),(104,'craft','m180901_151639_fix_matrixcontent_tables','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','d42356a3-9b5f-438f-9a36-3cebd14ab69d'),(105,'craft','m180904_112109_permission_changes','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','3fc150ab-cd42-4160-b68a-fd5a50cf1a1b'),(106,'craft','m180910_142030_soft_delete_sitegroups','2020-12-16 10:42:15','2020-12-16 10:42:15','2020-12-16 10:42:15','4eb8adfd-d156-4dd6-85ee-b9595f95a98b'),(107,'craft','m181011_160000_soft_delete_asset_support','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','88dcb8f0-6f69-44b3-90c7-b1908e1b3997'),(108,'craft','m181016_183648_set_default_user_settings','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','f314c75d-7ca8-41e6-b5a6-7ba6226d69db'),(109,'craft','m181017_225222_system_config_settings','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','7c319e57-0e90-4ee6-b922-2740d70dd143'),(110,'craft','m181018_222343_drop_userpermissions_from_config','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','96cf7478-25cf-44bf-9083-e25cfc01927b'),(111,'craft','m181029_130000_add_transforms_routes_to_config','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','d0e93bc7-2fbb-4921-87b2-c841eeeee528'),(112,'craft','m181112_203955_sequences_table','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','661706a4-8ad6-4934-b0ea-347440a06c90'),(113,'craft','m181121_001712_cleanup_field_configs','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','3912765b-c667-4b1e-af7d-61e3c5a0fac3'),(114,'craft','m181128_193942_fix_project_config','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','a4aa35ae-55d4-4ee2-97fc-b5d143c7e470'),(115,'craft','m181130_143040_fix_schema_version','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','bc8dd60d-868e-45cb-b069-9180489c9b5a'),(116,'craft','m181211_143040_fix_entry_type_uids','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','7bbc17f9-6a96-4f83-b094-f7512daf8bb0'),(117,'craft','m181217_153000_fix_structure_uids','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','fed4a7dd-82f9-40ea-8c91-db77435404b9'),(118,'craft','m190104_152725_store_licensed_plugin_editions','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','22d6633f-c1d0-423d-b099-ac3ffdc483ab'),(119,'craft','m190108_110000_cleanup_project_config','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','8a4e2218-ab94-4d9a-87bc-1ae9ebdc4c13'),(120,'craft','m190108_113000_asset_field_setting_change','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','afc8f6fc-23c5-4a4b-b813-57daa1f7b10a'),(121,'craft','m190109_172845_fix_colspan','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','b7c17c32-8921-4077-9165-d611fe9c2f3c'),(122,'craft','m190110_150000_prune_nonexisting_sites','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','307ede66-2f4a-425a-b033-e518bbc1dc23'),(123,'craft','m190110_214819_soft_delete_volumes','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','32db3348-5064-4b1e-b65f-fe69e827415e'),(124,'craft','m190112_124737_fix_user_settings','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','45fee601-ddb9-4d94-adc2-b46c6854c72d'),(125,'craft','m190112_131225_fix_field_layouts','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','305ddf6e-a834-4721-8fda-8580decae336'),(126,'craft','m190112_201010_more_soft_deletes','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','3df8e8f1-6396-4369-ad74-154c31aa99b3'),(127,'craft','m190114_143000_more_asset_field_setting_changes','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','745e038b-ecd1-45a4-8e19-6c479ee03b8d'),(128,'craft','m190121_120000_rich_text_config_setting','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','71ad9b98-88c4-4d27-8875-8502fb54d75f'),(129,'craft','m190125_191628_fix_email_transport_password','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','fef90b85-5895-4dce-b29c-47cf950f685b'),(130,'craft','m190128_181422_cleanup_volume_folders','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','c478b51f-d29a-47af-bf5a-2b086dd23346'),(131,'craft','m190205_140000_fix_asset_soft_delete_index','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','75e3118d-1764-4b08-a94e-082b5ef3665b'),(132,'craft','m190218_143000_element_index_settings_uid','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','4416b437-e29a-4073-966f-952a6dd10ec3'),(133,'craft','m190312_152740_element_revisions','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','d4221dbf-ec11-45f0-83dd-898a0416e8fa'),(134,'craft','m190327_235137_propagation_method','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','3fccc19d-8745-413c-a327-84dfd7420f43'),(135,'craft','m190401_223843_drop_old_indexes','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','7e8c5811-540c-49ed-bdd7-b89942dae95e'),(136,'craft','m190416_014525_drop_unique_global_indexes','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','3f9d176d-7a70-45f5-b2c2-6fc2daa8d00d'),(137,'craft','m190417_085010_add_image_editor_permissions','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','dcbbf9e4-79cd-49ae-8d50-c0fe25ea673c'),(138,'craft','m190502_122019_store_default_user_group_uid','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','4a3fd8b8-93ce-42ff-b193-556aa5558df5'),(139,'craft','m190504_150349_preview_targets','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','d2764f02-9bf3-4a17-aa44-e330e80ae5eb'),(140,'craft','m190516_184711_job_progress_label','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','ce3259fb-a089-4e32-a2a5-1d30d713da53'),(141,'craft','m190523_190303_optional_revision_creators','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','07b978d2-2b2a-4088-95e9-a15fe6c6f08d'),(142,'craft','m190529_204501_fix_duplicate_uids','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','1b6e7319-6f4d-4602-8a6f-db29984b209f'),(143,'craft','m190605_223807_unsaved_drafts','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','8638f251-3120-4b63-902f-b138b8186f34'),(144,'craft','m190607_230042_entry_revision_error_tables','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','dab28957-4708-4350-8486-a5a40374d407'),(145,'craft','m190608_033429_drop_elements_uid_idx','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','01217262-12de-48ad-b276-51331dfd542a'),(146,'craft','m190617_164400_add_gqlschemas_table','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','59b806b4-3f7e-4c72-976d-d08ff4fcd477'),(147,'craft','m190624_234204_matrix_propagation_method','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','b120c2a2-9aba-45ed-9e9a-ae07bb86d6a6'),(148,'craft','m190711_153020_drop_snapshots','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','b717a2c6-feb4-4885-bda0-cbd1d044832f'),(149,'craft','m190712_195914_no_draft_revisions','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','144d478c-1e6e-401e-ae04-5bbdd88ab2b3'),(150,'craft','m190723_140314_fix_preview_targets_column','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','82d7f4ab-6579-4874-8003-34b249ca273d'),(151,'craft','m190820_003519_flush_compiled_templates','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','051b1d3f-cfd3-47d4-9d10-7d66af2fbfff'),(152,'craft','m190823_020339_optional_draft_creators','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','3b3484e9-3283-4b9b-addb-27153adc1656'),(153,'craft','m190913_152146_update_preview_targets','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','2468370a-4323-40ca-ba9b-a25e7ea5cbb1'),(154,'craft','m191107_122000_add_gql_project_config_support','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','6482cebb-21c4-4134-9ac4-3e8be6b51ac8'),(155,'craft','m191204_085100_pack_savable_component_settings','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','527b8171-d65e-462d-b371-90ca1bef5e44'),(156,'craft','m191206_001148_change_tracking','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','479f77ac-6258-4f23-a9ae-92414969c170'),(157,'craft','m191216_191635_asset_upload_tracking','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','9ed3ca09-b0ca-43a7-9836-e0ad41a555e4'),(158,'craft','m191222_002848_peer_asset_permissions','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','d3482f0d-6d54-4a39-845f-5f3cc9581ec1'),(159,'craft','m200127_172522_queue_channels','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','d9199be5-85ca-4117-b32e-ed7c4c4f6ac1'),(160,'craft','m200211_175048_truncate_element_query_cache','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','247ca820-8ee8-4579-a6ad-66be47cb77ef'),(161,'craft','m200213_172522_new_elements_index','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','c15415d2-78fc-4a87-b446-2fd31e2385cb'),(162,'craft','m200228_195211_long_deprecation_messages','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','0ebf30cd-9be9-4810-968a-cc077741b8f3'),(163,'craft','m200306_054652_disabled_sites','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','ce64c4be-fccb-400e-8676-f2d6dd30acad'),(164,'craft','m200522_191453_clear_template_caches','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','1f475515-561e-4e31-8949-9cdac11f987d'),(165,'craft','m200606_231117_migration_tracks','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','518e3a78-9ccd-4031-a694-60e1ab0a6eae'),(166,'craft','m200619_215137_title_translation_method','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','8e38bbab-b9b3-44c8-9778-e587ba4b71ba'),(167,'craft','m200620_005028_user_group_descriptions','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','716d9c3f-7cbd-4b57-a7ad-369c25ded13d'),(168,'craft','m200620_230205_field_layout_changes','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','9977e1d4-59e0-4156-9faa-0162a22bf521'),(169,'craft','m200625_131100_move_entrytypes_to_top_project_config','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','8089ff61-c1eb-4324-8c19-c997b368f2af'),(170,'craft','m200629_112700_remove_project_config_legacy_files','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','0d01f46e-2915-4c1e-b4b2-5fed4aa6d77d'),(171,'craft','m200630_183000_drop_configmap','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','54333c1b-a7fb-49f0-8d43-21b4e3b86a89'),(172,'craft','m200715_113400_transform_index_error_flag','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','b141a94a-c0a0-45a1-9023-bbcc54439448'),(173,'craft','m200716_110900_replace_file_asset_permissions','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','90eb88f4-97b9-49b0-a12c-6d79505c4068'),(174,'craft','m200716_153800_public_token_settings_in_project_config','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','414f806b-a112-47b8-8d29-a1c166a98d0e'),(175,'craft','m200720_175543_drop_unique_constraints','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','3644367f-a511-49dc-ac9e-6ddf162be34a'),(176,'craft','m200825_051217_project_config_version','2020-12-16 10:42:16','2020-12-16 10:42:16','2020-12-16 10:42:16','225c0693-ba06-4027-8953-f4d2cf0096ce'),(177,'plugin:redactor','m180430_204710_remove_old_plugins','2020-12-17 13:05:50','2020-12-17 13:05:50','2020-12-17 13:05:50','7c0fab98-8d65-458b-8302-25420ec05742'),(178,'plugin:redactor','Install','2020-12-17 13:05:50','2020-12-17 13:05:50','2020-12-17 13:05:50','46036fda-3c7b-4294-8ac5-1e457f7cb0f0'),(179,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2020-12-17 13:05:50','2020-12-17 13:05:50','2020-12-17 13:05:50','abf8b868-5395-4198-87f6-25bcf1735f75');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'redactor','2.8.5','2.3.0','unknown',NULL,'2020-12-17 13:05:50','2020-12-17 13:05:50','2020-12-17 13:35:03','b12872cd-ad93-42cf-afa1-f6ad743d0bec');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1608212195'),('email.fromEmail','\"jochen.panjaer@telenet.be\"'),('email.fromName','\"morkborg\"'),('email.replyToEmail','null'),('email.template','null'),('email.transportSettings.command','\"\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.autocapitalize','true'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.autocomplete','false'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.autocorrect','true'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.class','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.disabled','false'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.id','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.instructions','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.label','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.max','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.min','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.name','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.orientation','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.placeholder','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.readonly','false'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.requirable','false'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.size','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.step','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.tip','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.title','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.warning','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.0.width','100'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.1.fieldUid','\"63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.1.instructions','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.1.label','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.1.required','false'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.1.tip','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.1.warning','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.1.width','100'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.2.fieldUid','\"5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.2.instructions','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.2.label','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.2.required','false'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.2.tip','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.2.warning','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.2.width','100'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.3.fieldUid','\"cf8a9107-74dd-4d0f-979d-722ae9e1f981\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.3.instructions','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.3.label','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.3.required','false'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.3.tip','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.3.warning','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.3.width','100'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.4.fieldUid','\"4bd8bbee-da42-4923-a6e8-1b476ca4a55e\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.4.instructions','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.4.label','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.4.required','false'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.4.tip','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.4.warning','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.4.width','100'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.5.fieldUid','\"36bb3abc-338d-4e94-8516-0aaf9a3b45a4\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.5.instructions','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.5.label','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.5.required','false'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.5.tip','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.5.warning','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.elements.5.width','100'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.name','\"Content\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.fieldLayouts.ab185253-8d93-4535-a859-ad0c40af5e7a.tabs.0.sortOrder','1'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.handle','\"home\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.hasTitleField','true'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.name','\"Home\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.section','\"531e9e3b-64fd-4dca-a506-4b7af612c541\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.sortOrder','1'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.titleFormat','\"{section.name|raw}\"'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.titleTranslationKeyFormat','null'),('entryTypes.208b0608-44a5-4f1d-a433-ed4bddbfe933.titleTranslationMethod','\"site\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.autocapitalize','true'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.autocomplete','false'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.autocorrect','true'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.class','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.disabled','false'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.id','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.instructions','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.label','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.max','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.min','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.name','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.orientation','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.placeholder','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.readonly','false'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.requirable','false'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.size','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.step','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.tip','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.title','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.warning','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.0.width','100'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.1.fieldUid','\"fb348c93-0517-4c22-b481-5353de3bf7f1\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.1.instructions','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.1.label','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.1.required','false'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.1.tip','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.1.warning','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.1.width','100'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.2.fieldUid','\"b75005a6-0f0c-4cc3-a0c4-48db38318db8\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.2.instructions','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.2.label','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.2.required','false'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.2.tip','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.2.warning','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.2.width','100'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.3.fieldUid','\"bda5f10a-c5a8-4123-b49c-a6d61306ed00\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.3.instructions','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.3.label','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.3.required','false'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.3.tip','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.3.warning','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.3.width','100'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.4.fieldUid','\"8cefcdba-0a48-40d8-98fe-3d518eac1f3c\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.4.instructions','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.4.label','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.4.required','false'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.4.tip','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.4.warning','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.4.width','100'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.5.fieldUid','\"c0027ad5-65c4-48f7-8f83-1729cd02d01f\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.5.instructions','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.5.label','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.5.required','false'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.5.tip','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.5.warning','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.5.width','100'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.6.fieldUid','\"7d98f61f-8eb8-4451-8a78-13b36a78eda3\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.6.instructions','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.6.label','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.6.required','false'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.6.tip','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.6.warning','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.elements.6.width','100'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.name','\"Content\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.fieldLayouts.b687a011-c2f1-4e55-bdbf-8e61d7faa8dc.tabs.0.sortOrder','1'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.handle','\"shop\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.hasTitleField','false'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.name','\"Shop\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.section','\"3d28ca80-b57e-4158-b576-3db40041fee5\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.sortOrder','1'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.titleFormat','\"{section.name|raw}\"'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.titleTranslationKeyFormat','null'),('entryTypes.7f9128b5-fd37-401f-915e-02fd1daa5603.titleTranslationMethod','\"site\"'),('fieldGroups.b89a0f84-9d05-430d-a0f5-e5fb9159ff1c.name','\"Common\"'),('fieldGroups.e4d1a852-2b7c-4c34-ab2b-1b2195f090a2.name','\"HomePage\"'),('fieldGroups.f301df04-889d-4004-966e-27c6b5fe527a.name','\"Shop\"'),('fields.36bb3abc-338d-4e94-8516-0aaf9a3b45a4.contentColumnType','\"string\"'),('fields.36bb3abc-338d-4e94-8516-0aaf9a3b45a4.fieldGroup','\"e4d1a852-2b7c-4c34-ab2b-1b2195f090a2\"'),('fields.36bb3abc-338d-4e94-8516-0aaf9a3b45a4.handle','\"matrixRewards\"'),('fields.36bb3abc-338d-4e94-8516-0aaf9a3b45a4.instructions','\"\"'),('fields.36bb3abc-338d-4e94-8516-0aaf9a3b45a4.name','\"Matrix Rewards\"'),('fields.36bb3abc-338d-4e94-8516-0aaf9a3b45a4.searchable','false'),('fields.36bb3abc-338d-4e94-8516-0aaf9a3b45a4.settings.contentTable','\"{{%matrixcontent_matrixrewards}}\"'),('fields.36bb3abc-338d-4e94-8516-0aaf9a3b45a4.settings.maxBlocks','\"\"'),('fields.36bb3abc-338d-4e94-8516-0aaf9a3b45a4.settings.minBlocks','\"\"'),('fields.36bb3abc-338d-4e94-8516-0aaf9a3b45a4.settings.propagationMethod','\"all\"'),('fields.36bb3abc-338d-4e94-8516-0aaf9a3b45a4.translationKeyFormat','null'),('fields.36bb3abc-338d-4e94-8516-0aaf9a3b45a4.translationMethod','\"site\"'),('fields.36bb3abc-338d-4e94-8516-0aaf9a3b45a4.type','\"craft\\\\fields\\\\Matrix\"'),('fields.4bd8bbee-da42-4923-a6e8-1b476ca4a55e.contentColumnType','\"string\"'),('fields.4bd8bbee-da42-4923-a6e8-1b476ca4a55e.fieldGroup','\"e4d1a852-2b7c-4c34-ab2b-1b2195f090a2\"'),('fields.4bd8bbee-da42-4923-a6e8-1b476ca4a55e.handle','\"matrixQuotes\"'),('fields.4bd8bbee-da42-4923-a6e8-1b476ca4a55e.instructions','\"\"'),('fields.4bd8bbee-da42-4923-a6e8-1b476ca4a55e.name','\"Matrix Quotes\"'),('fields.4bd8bbee-da42-4923-a6e8-1b476ca4a55e.searchable','false'),('fields.4bd8bbee-da42-4923-a6e8-1b476ca4a55e.settings.contentTable','\"{{%matrixcontent_matrixquotes}}\"'),('fields.4bd8bbee-da42-4923-a6e8-1b476ca4a55e.settings.maxBlocks','\"\"'),('fields.4bd8bbee-da42-4923-a6e8-1b476ca4a55e.settings.minBlocks','\"\"'),('fields.4bd8bbee-da42-4923-a6e8-1b476ca4a55e.settings.propagationMethod','\"all\"'),('fields.4bd8bbee-da42-4923-a6e8-1b476ca4a55e.translationKeyFormat','null'),('fields.4bd8bbee-da42-4923-a6e8-1b476ca4a55e.translationMethod','\"site\"'),('fields.4bd8bbee-da42-4923-a6e8-1b476ca4a55e.type','\"craft\\\\fields\\\\Matrix\"'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.contentColumnType','\"string\"'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.fieldGroup','\"e4d1a852-2b7c-4c34-ab2b-1b2195f090a2\"'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.handle','\"linkTo\"'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.instructions','\"\"'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.name','\"Link To\"'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.searchable','false'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.settings.allowSelfRelations','false'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.settings.limit','\"1\"'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.settings.localizeRelations','false'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.settings.selectionLabel','\"\"'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.settings.showSiteMenu','false'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.settings.source','null'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.settings.sources.0','\"singles\"'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.settings.targetSiteId','null'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.settings.validateRelatedElements','false'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.settings.viewMode','null'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.translationKeyFormat','null'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.translationMethod','\"site\"'),('fields.5ceee8f4-e5ca-4f2f-9c0d-62e5b8ca2e0f.type','\"craft\\\\fields\\\\Entries\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.contentColumnType','\"string\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.fieldGroup','\"e4d1a852-2b7c-4c34-ab2b-1b2195f090a2\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.handle','\"mainImage\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.instructions','\"\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.name','\"Main Image\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.searchable','false'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.allowedKinds','null'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.allowSelfRelations','false'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.allowUploads','true'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.defaultUploadLocationSource','\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.defaultUploadLocationSubpath','\"\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.limit','\"1\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.localizeRelations','false'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.previewMode','\"full\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.restrictFiles','\"\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.selectionLabel','\"\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.showSiteMenu','false'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.showUnpermittedFiles','false'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.showUnpermittedVolumes','false'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.singleUploadLocationSource','\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.singleUploadLocationSubpath','\"\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.source','null'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.sources','\"*\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.targetSiteId','null'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.useSingleFolder','false'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.validateRelatedElements','false'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.settings.viewMode','\"large\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.translationKeyFormat','null'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.translationMethod','\"site\"'),('fields.63ea3f7e-a7a3-44a0-82f3-2f5ca80027f8.type','\"craft\\\\fields\\\\Assets\"'),('fields.7d98f61f-8eb8-4451-8a78-13b36a78eda3.contentColumnType','\"string\"'),('fields.7d98f61f-8eb8-4451-8a78-13b36a78eda3.fieldGroup','\"f301df04-889d-4004-966e-27c6b5fe527a\"'),('fields.7d98f61f-8eb8-4451-8a78-13b36a78eda3.handle','\"matrixShopItem\"'),('fields.7d98f61f-8eb8-4451-8a78-13b36a78eda3.instructions','\"\"'),('fields.7d98f61f-8eb8-4451-8a78-13b36a78eda3.name','\"Matrix Shop Item\"'),('fields.7d98f61f-8eb8-4451-8a78-13b36a78eda3.searchable','false'),('fields.7d98f61f-8eb8-4451-8a78-13b36a78eda3.settings.contentTable','\"{{%matrixcontent_matrixshopitem}}\"'),('fields.7d98f61f-8eb8-4451-8a78-13b36a78eda3.settings.maxBlocks','\"\"'),('fields.7d98f61f-8eb8-4451-8a78-13b36a78eda3.settings.minBlocks','\"\"'),('fields.7d98f61f-8eb8-4451-8a78-13b36a78eda3.settings.propagationMethod','\"all\"'),('fields.7d98f61f-8eb8-4451-8a78-13b36a78eda3.translationKeyFormat','null'),('fields.7d98f61f-8eb8-4451-8a78-13b36a78eda3.translationMethod','\"site\"'),('fields.7d98f61f-8eb8-4451-8a78-13b36a78eda3.type','\"craft\\\\fields\\\\Matrix\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.contentColumnType','\"text\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.fieldGroup','\"f301df04-889d-4004-966e-27c6b5fe527a\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.handle','\"shopDescription\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.instructions','\"\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.name','\"Shop Description\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.searchable','false'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.availableTransforms','\"*\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.availableVolumes','\"*\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.cleanupHtml','true'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.columnType','\"text\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.configSelectionMode','\"choose\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.defaultTransform','\"\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.manualConfig','\"\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.purifierConfig','\"\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.purifyHtml','\"1\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.redactorConfig','\"\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.removeEmptyTags','\"1\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.removeInlineStyles','\"1\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.removeNbsp','\"1\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.showUnpermittedFiles','false'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.showUnpermittedVolumes','false'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.settings.uiMode','\"enlarged\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.translationKeyFormat','null'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.translationMethod','\"none\"'),('fields.8cefcdba-0a48-40d8-98fe-3d518eac1f3c.type','\"craft\\\\redactor\\\\Field\"'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.contentColumnType','\"text\"'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.fieldGroup','\"f301df04-889d-4004-966e-27c6b5fe527a\"'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.handle','\"shopTitle\"'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.instructions','\"\"'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.name','\"Shop Title\"'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.searchable','false'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.settings.byteLimit','null'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.settings.charLimit','null'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.settings.code','\"\"'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.settings.columnType','null'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.settings.initialRows','\"4\"'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.settings.multiline','\"\"'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.settings.placeholder','\"\"'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.settings.uiMode','\"normal\"'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.translationKeyFormat','null'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.translationMethod','\"none\"'),('fields.b75005a6-0f0c-4cc3-a0c4-48db38318db8.type','\"craft\\\\fields\\\\PlainText\"'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.contentColumnType','\"text\"'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.fieldGroup','\"f301df04-889d-4004-966e-27c6b5fe527a\"'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.handle','\"shopSubtitle\"'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.instructions','\"\"'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.name','\"Shop Subtitle\"'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.searchable','false'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.settings.byteLimit','null'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.settings.charLimit','null'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.settings.code','\"\"'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.settings.columnType','null'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.settings.initialRows','\"4\"'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.settings.multiline','\"\"'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.settings.placeholder','\"\"'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.settings.uiMode','\"normal\"'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.translationKeyFormat','null'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.translationMethod','\"none\"'),('fields.bda5f10a-c5a8-4123-b49c-a6d61306ed00.type','\"craft\\\\fields\\\\PlainText\"'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.contentColumnType','\"text\"'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.fieldGroup','\"f301df04-889d-4004-966e-27c6b5fe527a\"'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.handle','\"shopContentTitle\"'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.instructions','\"\"'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.name','\"Shop Content Title\"'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.searchable','false'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.settings.byteLimit','null'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.settings.charLimit','null'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.settings.code','\"\"'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.settings.columnType','null'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.settings.initialRows','\"4\"'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.settings.multiline','\"\"'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.settings.placeholder','\"\"'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.settings.uiMode','\"normal\"'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.translationKeyFormat','null'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.translationMethod','\"none\"'),('fields.c0027ad5-65c4-48f7-8f83-1729cd02d01f.type','\"craft\\\\fields\\\\PlainText\"'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.contentColumnType','\"text\"'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.fieldGroup','\"e4d1a852-2b7c-4c34-ab2b-1b2195f090a2\"'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.handle','\"headerText\"'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.instructions','\"You can just type in lowercase.\"'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.name','\"Header Text\"'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.searchable','false'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.settings.byteLimit','null'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.settings.charLimit','null'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.settings.code','\"\"'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.settings.columnType','null'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.settings.initialRows','\"4\"'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.settings.multiline','\"\"'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.settings.placeholder','\"\"'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.settings.uiMode','\"normal\"'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.translationKeyFormat','null'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.translationMethod','\"none\"'),('fields.cf8a9107-74dd-4d0f-979d-722ae9e1f981.type','\"craft\\\\fields\\\\PlainText\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.contentColumnType','\"string\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.fieldGroup','\"f301df04-889d-4004-966e-27c6b5fe527a\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.handle','\"headerImage\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.instructions','\"\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.name','\"Header Image\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.searchable','false'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.allowedKinds','null'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.allowSelfRelations','false'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.allowUploads','true'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.defaultUploadLocationSource','\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.defaultUploadLocationSubpath','\"\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.limit','\"1\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.localizeRelations','false'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.previewMode','\"full\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.restrictFiles','\"\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.selectionLabel','\"\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.showSiteMenu','false'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.showUnpermittedFiles','false'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.showUnpermittedVolumes','false'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.singleUploadLocationSource','\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.singleUploadLocationSubpath','\"\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.source','null'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.sources.0','\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.targetSiteId','null'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.useSingleFolder','false'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.validateRelatedElements','false'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.settings.viewMode','\"large\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.translationKeyFormat','null'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.translationMethod','\"site\"'),('fields.fb348c93-0517-4c22-b481-5353de3bf7f1.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.field','\"7d98f61f-8eb8-4451-8a78-13b36a78eda3\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.0.fieldUid','\"c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.0.label','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.0.required','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.0.tip','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.0.warning','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.0.width','100'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.1.fieldUid','\"0c1a1fd0-1a9d-4418-a650-6b409a61c99f\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.1.label','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.1.required','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.1.tip','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.1.warning','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.1.width','100'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.2.fieldUid','\"6b4f7c75-0571-4f1c-8b3f-fda308c47100\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.2.label','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.2.required','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.2.tip','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.2.warning','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.elements.2.width','100'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.name','\"Content\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fieldLayouts.d6e31844-79dc-40d2-bcfe-f3ec8990febc.tabs.0.sortOrder','1'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.contentColumnType','\"text\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.fieldGroup','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.handle','\"itemDescription\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.instructions','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.name','\"Item Description\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.searchable','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.availableTransforms','\"*\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.availableVolumes','\"*\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.cleanupHtml','true'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.columnType','\"text\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.defaultTransform','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.manualConfig','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.purifierConfig','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.purifyHtml','\"1\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.redactorConfig','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.removeNbsp','\"1\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.showHtmlButtonForNonAdmins','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.showUnpermittedFiles','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.settings.uiMode','\"normal\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.translationKeyFormat','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.translationMethod','\"none\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.0c1a1fd0-1a9d-4418-a650-6b409a61c99f.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.contentColumnType','\"string\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.fieldGroup','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.handle','\"itemImage\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.instructions','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.name','\"Item Image\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.searchable','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.allowedKinds','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.allowSelfRelations','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.allowUploads','true'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.defaultUploadLocationSource','\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.limit','\"1\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.localizeRelations','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.previewMode','\"full\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.restrictFiles','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.selectionLabel','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.showSiteMenu','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.showUnpermittedFiles','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.singleUploadLocationSource','\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.source','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.sources.0','\"volume:452eb0c3-c1e9-4278-a2d2-7a149d7041a9\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.targetSiteId','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.useSingleFolder','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.validateRelatedElements','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.settings.viewMode','\"list\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.translationKeyFormat','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.translationMethod','\"site\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.6b4f7c75-0571-4f1c-8b3f-fda308c47100.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.contentColumnType','\"text\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.fieldGroup','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.handle','\"itemTitle\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.instructions','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.name','\"Item Title\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.searchable','false'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.settings.byteLimit','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.settings.charLimit','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.settings.code','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.settings.columnType','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.settings.initialRows','\"4\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.settings.multiline','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.settings.placeholder','\"\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.settings.uiMode','\"normal\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.translationKeyFormat','null'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.translationMethod','\"none\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.fields.c6f121ca-3f1f-4ad4-8db4-34e6b99c6ad9.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.handle','\"item\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.name','\"Item\"'),('matrixBlockTypes.1557c6c8-c6dd-4b7b-a2f5-f74c01020a79.sortOrder','1'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.field','\"4bd8bbee-da42-4923-a6e8-1b476ca4a55e\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.0.fieldUid','\"a55dc167-4783-496c-93d4-e6d19d9601ba\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.0.label','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.0.required','true'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.0.tip','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.0.warning','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.0.width','100'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.1.fieldUid','\"1676b7bd-ed54-4e36-a24e-5e1edefd69ba\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.1.label','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.1.required','true'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.1.tip','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.1.warning','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.elements.1.width','100'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.name','\"Content\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fieldLayouts.fd66cc68-19b0-484c-9dd6-6cfcf8fd4f95.tabs.0.sortOrder','1'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.contentColumnType','\"text\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.fieldGroup','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.handle','\"author\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.instructions','\"\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.name','\"Author\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.searchable','false'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.settings.byteLimit','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.settings.charLimit','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.settings.code','\"\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.settings.columnType','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.settings.initialRows','\"4\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.settings.multiline','\"\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.settings.placeholder','\"\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.settings.uiMode','\"normal\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.translationKeyFormat','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.translationMethod','\"none\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.1676b7bd-ed54-4e36-a24e-5e1edefd69ba.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.contentColumnType','\"text\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.fieldGroup','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.handle','\"mainQuote\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.instructions','\"\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.name','\"Main Quote\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.searchable','false'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.settings.byteLimit','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.settings.charLimit','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.settings.code','\"\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.settings.columnType','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.settings.initialRows','\"4\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.settings.multiline','\"\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.settings.placeholder','\"\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.settings.uiMode','\"normal\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.translationKeyFormat','null'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.translationMethod','\"none\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.fields.a55dc167-4783-496c-93d4-e6d19d9601ba.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.handle','\"quote\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.name','\"Quote\"'),('matrixBlockTypes.1fb33381-16f5-4152-874a-1e9ec146cd34.sortOrder','1'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.field','\"36bb3abc-338d-4e94-8516-0aaf9a3b45a4\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.0.fieldUid','\"9c211903-dc95-46f5-8acc-36859e85d1de\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.0.label','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.0.required','true'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.0.tip','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.0.warning','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.0.width','100'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.1.fieldUid','\"cbe5da37-1cdc-4c69-8d25-e7706c033fc3\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.1.label','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.1.required','true'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.1.tip','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.1.warning','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.1.width','100'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.2.fieldUid','\"2b06f126-8cc9-40f5-b071-3db5408bfbe3\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.2.label','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.2.required','true'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.2.tip','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.2.warning','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.2.width','100'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.3.fieldUid','\"0ee6a5c7-7ad4-4805-809f-1327d00af700\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.3.label','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.3.required','true'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.3.tip','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.3.warning','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.elements.3.width','100'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.name','\"Content\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fieldLayouts.a2879fb3-ff97-4ee4-980f-6265c74f75b1.tabs.0.sortOrder','1'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.contentColumnType','\"text\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.fieldGroup','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.handle','\"svgViewbox\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.instructions','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.name','\"SVG Viewbox\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.searchable','false'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.settings.byteLimit','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.settings.charLimit','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.settings.code','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.settings.columnType','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.settings.initialRows','\"4\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.settings.multiline','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.settings.placeholder','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.settings.uiMode','\"normal\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.translationKeyFormat','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.translationMethod','\"none\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.0ee6a5c7-7ad4-4805-809f-1327d00af700.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.contentColumnType','\"text\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.fieldGroup','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.handle','\"svg\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.instructions','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.name','\"SVG\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.searchable','false'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.settings.byteLimit','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.settings.charLimit','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.settings.code','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.settings.columnType','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.settings.initialRows','\"4\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.settings.multiline','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.settings.placeholder','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.settings.uiMode','\"normal\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.translationKeyFormat','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.translationMethod','\"none\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.2b06f126-8cc9-40f5-b071-3db5408bfbe3.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.contentColumnType','\"text\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.fieldGroup','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.handle','\"rewardTitle\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.instructions','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.name','\"Reward Title\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.searchable','false'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.settings.byteLimit','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.settings.charLimit','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.settings.code','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.settings.columnType','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.settings.initialRows','\"4\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.settings.multiline','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.settings.placeholder','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.settings.uiMode','\"normal\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.translationKeyFormat','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.translationMethod','\"none\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.9c211903-dc95-46f5-8acc-36859e85d1de.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.contentColumnType','\"text\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.fieldGroup','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.handle','\"rewardResult\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.instructions','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.name','\"Reward Result\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.searchable','false'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.settings.byteLimit','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.settings.charLimit','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.settings.code','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.settings.columnType','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.settings.initialRows','\"4\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.settings.multiline','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.settings.placeholder','\"\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.settings.uiMode','\"normal\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.translationKeyFormat','null'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.translationMethod','\"none\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.fields.cbe5da37-1cdc-4c69-8d25-e7706c033fc3.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.handle','\"reward\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.name','\"Reward\"'),('matrixBlockTypes.5db73d10-416e-480f-998e-0197662d48a5.sortOrder','1'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('sections.3d28ca80-b57e-4158-b576-3db40041fee5.enableVersioning','false'),('sections.3d28ca80-b57e-4158-b576-3db40041fee5.handle','\"shop\"'),('sections.3d28ca80-b57e-4158-b576-3db40041fee5.name','\"Shop\"'),('sections.3d28ca80-b57e-4158-b576-3db40041fee5.propagationMethod','\"all\"'),('sections.3d28ca80-b57e-4158-b576-3db40041fee5.siteSettings.a0e385e0-70a7-4da0-9d79-35d28731e42c.enabledByDefault','true'),('sections.3d28ca80-b57e-4158-b576-3db40041fee5.siteSettings.a0e385e0-70a7-4da0-9d79-35d28731e42c.hasUrls','true'),('sections.3d28ca80-b57e-4158-b576-3db40041fee5.siteSettings.a0e385e0-70a7-4da0-9d79-35d28731e42c.template','\"pages/shop\"'),('sections.3d28ca80-b57e-4158-b576-3db40041fee5.siteSettings.a0e385e0-70a7-4da0-9d79-35d28731e42c.uriFormat','\"shop\"'),('sections.3d28ca80-b57e-4158-b576-3db40041fee5.type','\"single\"'),('sections.531e9e3b-64fd-4dca-a506-4b7af612c541.enableVersioning','false'),('sections.531e9e3b-64fd-4dca-a506-4b7af612c541.handle','\"home\"'),('sections.531e9e3b-64fd-4dca-a506-4b7af612c541.name','\"Home\"'),('sections.531e9e3b-64fd-4dca-a506-4b7af612c541.propagationMethod','\"all\"'),('sections.531e9e3b-64fd-4dca-a506-4b7af612c541.siteSettings.a0e385e0-70a7-4da0-9d79-35d28731e42c.enabledByDefault','true'),('sections.531e9e3b-64fd-4dca-a506-4b7af612c541.siteSettings.a0e385e0-70a7-4da0-9d79-35d28731e42c.hasUrls','true'),('sections.531e9e3b-64fd-4dca-a506-4b7af612c541.siteSettings.a0e385e0-70a7-4da0-9d79-35d28731e42c.template','\"pages/index\"'),('sections.531e9e3b-64fd-4dca-a506-4b7af612c541.siteSettings.a0e385e0-70a7-4da0-9d79-35d28731e42c.uriFormat','\"__home__\"'),('sections.531e9e3b-64fd-4dca-a506-4b7af612c541.type','\"single\"'),('siteGroups.409c4a32-6ee7-4425-afd0-96383f76ad12.name','\"morkborg\"'),('sites.a0e385e0-70a7-4da0-9d79-35d28731e42c.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.a0e385e0-70a7-4da0-9d79-35d28731e42c.handle','\"default\"'),('sites.a0e385e0-70a7-4da0-9d79-35d28731e42c.hasUrls','true'),('sites.a0e385e0-70a7-4da0-9d79-35d28731e42c.language','\"en-US\"'),('sites.a0e385e0-70a7-4da0-9d79-35d28731e42c.name','\"morkborg\"'),('sites.a0e385e0-70a7-4da0-9d79-35d28731e42c.primary','true'),('sites.a0e385e0-70a7-4da0-9d79-35d28731e42c.siteGroup','\"409c4a32-6ee7-4425-afd0-96383f76ad12\"'),('sites.a0e385e0-70a7-4da0-9d79-35d28731e42c.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"morkborg\"'),('system.schemaVersion','\"3.5.13\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.autocapitalize','true'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.autocomplete','false'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.autocorrect','true'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.class','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.disabled','false'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.id','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.instructions','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.label','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.max','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.min','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.name','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.orientation','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.placeholder','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.readonly','false'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.requirable','false'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.size','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.step','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.tip','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.title','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.warning','null'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.elements.0.width','100'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.name','\"Content\"'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.fieldLayouts.91c10b42-6f17-40db-918c-7043227c0265.tabs.0.sortOrder','1'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.handle','\"images\"'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.hasUrls','true'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.name','\"images\"'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.settings.path','\"@webroot/assets/craftimages\"'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.sortOrder','1'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.type','\"craft\\\\volumes\\\\Local\"'),('volumes.452eb0c3-c1e9-4278-a2d2-7a149d7041a9.url','\"@web/assets/craftimages\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `relations_sourceId_idx` (`sourceId`),
  KEY `relations_targetId_idx` (`targetId`),
  KEY `relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (1,10,2,NULL,15,1,'2020-12-16 15:34:12','2020-12-16 15:34:12','e6e07dd3-926c-4db8-8ccf-173ecbd91c1d'),(2,11,2,NULL,17,1,'2020-12-17 10:57:16','2020-12-17 10:57:16','b56c3e63-dd32-45bb-8c3c-9e18b3e1ddf0'),(3,12,17,NULL,18,1,'2020-12-17 13:10:09','2020-12-17 13:10:09','81caac43-b96d-4bb1-8654-b1fb53404bcf'),(4,19,24,NULL,23,1,'2020-12-17 13:19:11','2020-12-17 13:19:11','7682f8a2-8a6d-4b9e-b873-46f2b8319835'),(5,19,25,NULL,19,1,'2020-12-17 13:28:03','2020-12-17 13:28:03','171749dd-e8c9-470f-ace2-ed83778edc04'),(6,19,26,NULL,20,1,'2020-12-17 13:28:03','2020-12-17 13:28:03','54aeef00-197e-4de4-8bfc-e28745b810a7'),(7,19,27,NULL,21,1,'2020-12-17 13:28:03','2020-12-17 13:28:03','6d1d58e6-99f2-44d4-8784-1477674f2073'),(8,19,28,NULL,22,1,'2020-12-17 13:28:03','2020-12-17 13:28:03','7aff277b-9f16-4343-8659-b56543955ac3');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('1063c4fb','@craft/web/assets/plugins/dist'),('16ba98e9','@craft/web/assets/editsection/dist'),('29e19676','@lib/vue'),('32d20240','@craft/web/assets/craftsupport/dist'),('3845254c','@craft/web/assets/dbbackup/dist'),('3ad4b58d','@craft/web/assets/login/dist'),('4074eeef','@lib/velocity'),('40a3503','@lib/axios'),('4b07f733','@craft/web/assets/deprecationerrors/dist'),('4d554699','@craft/web/assets/updates/dist'),('51fb1992','@bower/jquery/dist'),('5422dbcf','@craft/web/assets/editentry/dist'),('5a020035','@craft/redactor/assets/field/dist'),('5c534107','@lib/jquery.payment'),('628a67e6','@craft/redactor/assets/redactor-plugins/dist/fullscreen'),('6b4efaa3','@craft/web/assets/matrixsettings/dist'),('6f831abc','@craft/web/assets/edituser/dist'),('748419cf','@craft/web/assets/dashboard/dist'),('7e6bb267','@lib/element-resize-detector'),('827c760e','@craft/web/assets/installer/dist'),('83434c1b','@lib/xregexp'),('867b1da5','@craft/web/assets/pluginstore/dist'),('892f0891','@lib/selectize'),('8f002dd8','@craft/web/assets/cp/dist'),('908caf8d','@lib/datepicker-i18n'),('957ef449','@craft/web/assets/updateswidget/dist'),('983dd710','@craft/web/assets/fieldsettings/dist'),('9c51a012','@craft/web/assets/generalsettings/dist'),('a207f078','@craft/web/assets/updater/dist'),('a686490f','@craft/web/assets/findreplace/dist'),('abc4b627','@craft/web/assets/recententries/dist'),('bcbc146e','@lib/timepicker'),('c5b924eb','@lib/fileupload'),('c91a1bfc','@lib/iframe-resizer'),('cd5b380f','@craft/redactor/assets/redactor-plugins/dist/video'),('cf0e2bac','@craft/redactor/assets/redactor/dist'),('d211ef32','@craft/web/assets/queuemanager/dist'),('d3f40544','@lib/d3'),('d5f21512','@craft/web/assets/utilities/dist'),('d873135e','@lib/prismjs'),('daf519d7','@lib/jquery-touch-events'),('dc73f04','@craft/web/assets/feed/dist'),('dd29c16b','@craft/web/assets/matrix/dist'),('dd512515','@lib/picturefill'),('ddd8bd64','@craft/web/assets/tablesettings/dist'),('ddeff7c','@craft/web/assets/clearcaches/dist'),('e04912c2','@lib/garnishjs'),('edd754a','@lib/jquery-ui'),('f50fc6fc','@lib/fabric'),('f5ca0f11','@craft/web/assets/fields/dist'),('fce4f7c4','@craft/web/assets/admintable/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  KEY `revisions_creatorId_fk` (`creatorId`),
  CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' admin '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(2,'slug',0,1,' home '),(2,'title',0,1,' mork borg '),(7,'slug',0,1,''),(8,'slug',0,1,''),(9,'slug',0,1,''),(10,'slug',0,1,''),(11,'slug',0,1,''),(12,'slug',0,1,''),(13,'slug',0,1,''),(14,'slug',0,1,''),(15,'filename',0,1,' mb logo pixel png '),(15,'extension',0,1,' png '),(15,'kind',0,1,' image '),(15,'slug',0,1,''),(15,'title',0,1,' mb logo pixel '),(16,'filename',0,1,' mb logo pixel 2020 12 16 153144 png '),(16,'extension',0,1,' png '),(16,'kind',0,1,' image '),(16,'slug',0,1,''),(16,'title',0,1,' mb logo pixel '),(17,'title',0,1,' shop '),(17,'slug',0,1,' shop '),(18,'filename',0,1,' mb banner jpg '),(18,'extension',0,1,' jpg '),(18,'kind',0,1,' image '),(18,'slug',0,1,''),(18,'title',0,1,' mb banner '),(19,'filename',0,1,' mb article 1 webp '),(19,'extension',0,1,' webp '),(19,'kind',0,1,' image '),(19,'slug',0,1,''),(19,'title',0,1,' mb article 1 '),(20,'filename',0,1,' mb article 2 webp '),(20,'extension',0,1,' webp '),(20,'kind',0,1,' image '),(20,'slug',0,1,''),(20,'title',0,1,' mb article 2 '),(21,'filename',0,1,' mb article 3 webp '),(21,'extension',0,1,' webp '),(21,'kind',0,1,' image '),(21,'slug',0,1,''),(21,'title',0,1,' mb article 3 '),(22,'filename',0,1,' mb article 4 webp '),(22,'extension',0,1,' webp '),(22,'kind',0,1,' image '),(22,'slug',0,1,''),(22,'title',0,1,' mb article 4 '),(23,'filename',0,1,' mb article 5 webp '),(23,'extension',0,1,' webp '),(23,'kind',0,1,' image '),(23,'slug',0,1,''),(23,'title',0,1,' mb article 5 '),(24,'slug',0,1,''),(25,'slug',0,1,''),(26,'slug',0,1,''),(27,'slug',0,1,''),(28,'slug',0,1,''),(1,'email',0,1,' jochenpanjaergraphics telenet be '),(1,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sections_handle_idx` (`handle`),
  KEY `sections_name_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  KEY `sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',0,'all',NULL,'2020-12-16 14:33:10','2020-12-16 14:33:10',NULL,'531e9e3b-64fd-4dca-a506-4b7af612c541'),(2,NULL,'Shop','shop','single',0,'all',NULL,'2020-12-17 10:56:51','2020-12-17 10:56:51',NULL,'3d28ca80-b57e-4158-b576-3db40041fee5');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','pages/index',1,'2020-12-16 14:33:10','2020-12-16 14:33:10','e123cf20-2e90-4229-bf95-f213390d63c0'),(2,2,1,1,'shop','pages/shop',1,'2020-12-17 10:56:51','2020-12-17 10:56:51','2e70f6d4-1d0e-46c2-a74a-c9be7c332f1e');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessions_uid_idx` (`uid`),
  KEY `sessions_token_idx` (`token`),
  KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `sessions_userId_idx` (`userId`),
  CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (9,1,'uS0EncsauzQzVVRr2-7a5f9CDHGhQeB4xYw6uxBKF4MfhJ5YK0NUf5b-GuBDkB6uvp2zYbdGjNndpA8CDNcDmNLO7kH-PQJHt3xV','2020-12-17 14:00:45','2020-12-17 14:00:49','60eef149-1ffd-4656-85bd-908982d61217');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sitegroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'morkborg','2020-12-16 10:42:15','2020-12-16 10:42:15',NULL,'409c4a32-6ee7-4425-afd0-96383f76ad12');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sites_dateDeleted_idx` (`dateDeleted`),
  KEY `sites_handle_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`),
  CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,1,'morkborg','default','en-US',1,'$PRIMARY_SITE_URL',1,'2020-12-16 10:42:15','2020-12-16 10:42:15',NULL,'a0e385e0-70a7-4da0-9d79-35d28731e42c');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `structureelements_root_idx` (`root`),
  KEY `structureelements_lft_idx` (`lft`),
  KEY `structureelements_rgt_idx` (`rgt`),
  KEY `structureelements_level_idx` (`level`),
  KEY `structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taggroups_name_idx` (`name`),
  KEY `taggroups_handle_idx` (`handle`),
  KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`),
  CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecacheelements`
--

LOCK TABLES `templatecacheelements` WRITE;
/*!40000 ALTER TABLE `templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `templatecachequeries_type_idx` (`type`),
  CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecachequeries`
--

LOCK TABLES `templatecachequeries` WRITE;
/*!40000 ALTER TABLE `templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecaches`
--

LOCK TABLES `templatecaches` WRITE;
/*!40000 ALTER TABLE `templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unq_idx` (`token`),
  KEY `tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `usergroups_handle_idx` (`handle`),
  KEY `usergroups_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_uid_idx` (`uid`),
  KEY `users_verificationCode_idx` (`verificationCode`),
  KEY `users_email_idx` (`email`),
  KEY `users_username_idx` (`username`),
  KEY `users_photoId_fk` (`photoId`),
  CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin',NULL,'','','jochenpanjaergraphics@telenet.be','$2y$13$FZB6FKCzQwf9CASTfxYxKukCZZPOGznB.jBRi92R9uX.jbVSymDUy',1,0,0,0,'2020-12-17 14:00:45',NULL,NULL,NULL,'2020-12-16 10:46:14',NULL,1,NULL,NULL,NULL,0,'2020-12-17 14:00:18','2020-12-16 10:42:15','2020-12-17 14:00:45','02047572-3ca1-440e-93b8-16123a286bce');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `volumefolders_parentId_idx` (`parentId`),
  KEY `volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'images','','2020-12-16 15:28:58','2020-12-16 15:28:58','b16714ea-b746-406f-8ffe-03414ac5a55d'),(2,NULL,NULL,'Temporary source',NULL,'2020-12-16 15:30:38','2020-12-16 15:30:38','ae44cd4d-b05a-4f9a-a6a0-d753167c2f90'),(3,2,NULL,'user_1','user_1/','2020-12-16 15:30:38','2020-12-16 15:30:38','558625bf-e428-44ee-9cb9-e8b8eae594c8');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `volumes_name_idx` (`name`),
  KEY `volumes_handle_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,4,'images','images','craft\\volumes\\Local',1,'@web/assets/craftimages','{\"path\":\"@webroot/assets/craftimages\"}',1,'2020-12-16 15:28:58','2020-12-16 15:28:58',NULL,'452eb0c3-c1e9-4278-a2d2-7a149d7041a9');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`),
  CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2020-12-16 10:46:44','2020-12-16 10:46:44','80559322-6542-4677-ba3e-e7e9a22b1b6d'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2020-12-16 10:46:44','2020-12-16 10:46:44','d8caf522-cfaa-49b9-90a2-9442ffe52179'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2020-12-16 10:46:44','2020-12-16 10:46:44','2278ec4e-7a91-4c6a-b28c-e230838db199'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2020-12-16 10:46:44','2020-12-16 10:46:44','5a776c30-27e0-4883-9878-492dc7e4aacc');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-17 15:03:40
