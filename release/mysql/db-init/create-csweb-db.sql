CREATE DATABASE  IF NOT EXISTS `cspro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cspro`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: census_final
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `cen2000_77`
--

DROP TABLE IF EXISTS `cen2000_77`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cen2000_77` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `guid` binary(16) NOT NULL,
  `caseids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `questionnaire` blob NOT NULL,
  `revision` int unsigned NOT NULL,
  `deleted` tinyint unsigned NOT NULL DEFAULT '0',
  `verified` tinyint unsigned NOT NULL DEFAULT '0',
  `clock` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  `partial_save_mode` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partial_save_field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partial_save_level_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partial_save_record_occurrence` smallint DEFAULT NULL,
  `partial_save_item_occurrence` smallint DEFAULT NULL,
  `partial_save_subitem_occurrence` smallint DEFAULT NULL,
  PRIMARY KEY (`guid`),
  UNIQUE KEY `id` (`id`),
  KEY `revision` (`revision`),
  KEY `caseids` (`caseids`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cen2000_77`
--

LOCK TABLES `cen2000_77` WRITE;
/*!40000 ALTER TABLE `cen2000_77` DISABLE KEYS */;
/*!40000 ALTER TABLE `cen2000_77` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cen2000_77_case_binary_data`
--

DROP TABLE IF EXISTS `cen2000_77_case_binary_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cen2000_77_case_binary_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `case_guid` binary(16) NOT NULL,
  `binary_data_signature` char(32) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `case_guid` (`case_guid`),
  CONSTRAINT `cen2000_77_case_binary_data_ibfk_1` FOREIGN KEY (`case_guid`) REFERENCES `cen2000_77` (`guid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cen2000_77_case_binary_data`
--

LOCK TABLES `cen2000_77_case_binary_data` WRITE;
/*!40000 ALTER TABLE `cen2000_77_case_binary_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cen2000_77_case_binary_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cen2000_77_notes`
--

DROP TABLE IF EXISTS `cen2000_77_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cen2000_77_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `case_guid` binary(16) NOT NULL,
  `operator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_occurrence` smallint NOT NULL,
  `item_occurrence` smallint NOT NULL,
  `subitem_occurrence` smallint NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` datetime NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `case_guid` (`case_guid`),
  CONSTRAINT `cen2000_77_notes_ibfk_1` FOREIGN KEY (`case_guid`) REFERENCES `cen2000_77` (`guid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cen2000_77_notes`
--

LOCK TABLES `cen2000_77_notes` WRITE;
/*!40000 ALTER TABLE `cen2000_77_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cen2000_77_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_apps`
--

DROP TABLE IF EXISTS `cspro_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_apps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `build_time` datetime NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `files` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_apps`
--

LOCK TABLES `cspro_apps` WRITE;
/*!40000 ALTER TABLE `cspro_apps` DISABLE KEYS */;
/*!40000 ALTER TABLE `cspro_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_binary_sync_history`
--

DROP TABLE IF EXISTS `cspro_binary_sync_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_binary_sync_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `binary_data_signature` char(32) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `sync_history_id` int unsigned NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sync_history_id` (`sync_history_id`),
  CONSTRAINT `cspro_sync_history_archive_id_constraint` FOREIGN KEY (`sync_history_id`) REFERENCES `cspro_sync_history` (`revision`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_binary_sync_history`
--

LOCK TABLES `cspro_binary_sync_history` WRITE;
/*!40000 ALTER TABLE `cspro_binary_sync_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cspro_binary_sync_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_binary_sync_history_archive`
--

DROP TABLE IF EXISTS `cspro_binary_sync_history_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_binary_sync_history_archive` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `binary_data_signature` char(32) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `sync_history_id` int unsigned NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sync_history_id` (`sync_history_id`),
  CONSTRAINT `cspro_sync_history_id_constraint` FOREIGN KEY (`sync_history_id`) REFERENCES `cspro_sync_history` (`revision`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_binary_sync_history_archive`
--

LOCK TABLES `cspro_binary_sync_history_archive` WRITE;
/*!40000 ALTER TABLE `cspro_binary_sync_history_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `cspro_binary_sync_history_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_config`
--

DROP TABLE IF EXISTS `cspro_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_config` (
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_config`
--

LOCK TABLES `cspro_config` WRITE;
/*!40000 ALTER TABLE `cspro_config` DISABLE KEYS */;
INSERT INTO `cspro_config` VALUES ('schema_version','7','2023-09-14 16:31:12','2023-09-14 16:31:12'),('server_device_id','712c670d-754a-4977-849f-b76205063543','2023-09-14 16:31:12','2023-09-14 16:31:12');
/*!40000 ALTER TABLE `cspro_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_dictionaries`
--

DROP TABLE IF EXISTS `cspro_dictionaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_dictionaries` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `dictionary_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dictionary_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dictionary_full_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dictionary_name` (`dictionary_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_dictionaries`
--

LOCK TABLES `cspro_dictionaries` WRITE;
/*!40000 ALTER TABLE `cspro_dictionaries` DISABLE KEYS */;
INSERT INTO `cspro_dictionaries` VALUES (1,'CEN2000_77','CSPro_7.7_Popstan Census','[Dictionary]\r\nVersion=CSPro 7.7\r\nLabel=CSPro_7.7_Popstan Census\r\nName=CEN2000_77\r\nRecordTypeStart=1\r\nRecordTypeLen=1\r\nPositions=Relative\r\nZeroFill=Yes\r\nDecimalChar=No\r\nSecurityOptions=C63DB135514D23E5D9BF9DECBC348DB5A7EA3D045723E0153EDA4BF598C8AC85\r\n\r\n[Level]\r\nLabel=Questionnaire\r\nName=QUEST\r\n\r\n[IdItems]\r\n\r\n[Item]\r\nLabel=Province\r\nName=PROVINCE\r\nStart=2\r\nLen=2\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Province\r\nName=PROV_VS1\r\nValue=1;Artesia\r\nValue=2;Copal\r\nValue=3;Dari\r\nValue=4;Eris\r\nValue=5;Girda\r\nValue=6;Hali\r\nValue=7;Kerac\r\nValue=8;Lacuna\r\nValue=9;Laya\r\nValue=10;Lira\r\nValue=11;Matanga\r\nValue=12;Patan\r\nValue=13;Rift\r\nValue=14;Terra\r\nValue=15;Tumar\r\n\r\n[Item]\r\nLabel=District\r\nName=DISTRICT\r\nStart=4\r\nLen=2\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=District\r\nName=DIST_VS1\r\nValue=1:18\r\n\r\n[Item]\r\nLabel=Village\r\nName=VILLAGE\r\nStart=6\r\nLen=3\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Village\r\nName=VILLAGE_VS1\r\nValue=1:999\r\n\r\n[Item]\r\nLabel=Enumeration area\r\nName=EA\r\nStart=9\r\nLen=3\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Enumeration area\r\nName=EA_VS1\r\nValue=1:999\r\n\r\n[Item]\r\nLabel=Urban/Rural\r\nName=UR\r\nStart=12\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Urban/Rural\r\nName=UR_VS1\r\nValue=1;Urban\r\nValue=2;Rural\r\n\r\n[Item]\r\nLabel=Building number\r\nName=BUILDING\r\nStart=13\r\nLen=3\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Building number\r\nName=BUILDING_VS1\r\nValue=1:998;Building\r\nValue=999;Homeless\r\n\r\n[Item]\r\nLabel=Housing unit\r\nName=HU\r\nStart=16\r\nLen=3\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Housing unit\r\nName=HU_VS1\r\nValue=1:999\r\n\r\n[Item]\r\nLabel=Household number\r\nName=HH\r\nStart=19\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Household number\r\nName=HH_VS1\r\nValue=1:9\r\n\r\n[Record]\r\nLabel=Person Record\r\nName=PERSON\r\nRecordTypeValue=\'1\'\r\nRequired=No\r\nMaxRecords=30\r\nRecordLen=49\r\n\r\n[Item]\r\nLabel=Line number\r\nName=LINE\r\nStart=20\r\nLen=2\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Line number\r\nName=LINE_VS1\r\nValue=1:30\r\n\r\n[Item]\r\nLabel=Relationship\r\nName=P02_REL\r\nStart=22\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Relationship\r\nName=P02_REL_VS1\r\nValue=1;Head\r\nValue=2;Spouse\r\nValue=3;Child\r\nValue=4;Parent\r\nValue=5;Other relative\r\nValue=6;Nonrelative\r\nValue=9;Not Reported\r\n\r\n[Item]\r\nLabel=Sex\r\nName=P03_SEX\r\nStart=23\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Sex\r\nName=P03_SEX_VS1\r\nValue=1;Male\r\nValue=2;Female\r\n\r\n[Item]\r\nLabel=Age\r\nName=P04_AGE\r\nStart=24\r\nLen=2\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Age\r\nName=P04_AGE_VS1\r\nValue=0:98\r\n\r\n[ValueSet]\r\nLabel=Age in 5 year groups\r\nName=P04_AGE_VS2\r\nValue=0:4;0 to 4 years\r\nValue=5:9;5 to 9 years\r\nValue=10:14;10 to 14 years\r\nValue=15:19;15 to 19 years\r\nValue=20:24;20 to 24 years\r\nValue=25:29;25 to 29 years\r\nValue=30:34;30 to 34 years\r\nValue=35:39;35 to 39 years\r\nValue=40:44;40 to 44 years\r\nValue=45:49;45 to 49 years\r\nValue=50:54;50 to 54 years\r\nValue=55:59;55 to 59 years\r\nValue=60:64;60 to 64 years\r\nValue=65:69;65 to 69 years\r\nValue=70:74;70 to 74 years\r\nValue=75:79;75 to 79 years\r\nValue=80:84;80 to 84 years\r\nValue=85:89;85 to 89 years\r\nValue=90:94;90 to 94 years\r\nValue=95:98;95 years and over\r\n\r\n[ValueSet]\r\nLabel=Age in 10 year groups\r\nName=P04_AGE_VS3\r\nValue=0:9;0 to 9 years\r\nValue=10:19;10 to 19 years\r\nValue=20:29;20 to 29 years\r\nValue=30:39;30 to 39 years\r\nValue=40:49;40 to 49 years\r\nValue=50:59;50 to 59 years\r\nValue=60:69;60 to 69 years\r\nValue=70:79;70 to 79 years\r\nValue=80:89;80 to 89 years\r\nValue=90:98;90 years and over\r\n\r\n[ValueSet]\r\nLabel=Age 10-54 in 5 year groups\r\nName=AGG_10_5\r\nValue=10:14;10 to 14 years\r\nValue=15:19;15 to 19 years\r\nValue=20:24;20 to 24 years\r\nValue=25:29;25 to 29 years\r\nValue=30:34;30 to 34 years\r\nValue=35:39;35 to 39 years\r\nValue=40:44;40 to 44 years\r\nValue=45:49;45 to 49 years\r\nValue=50:54;50 to 54 years\r\n\r\n[Item]\r\nLabel=Marital status\r\nName=P05_MS\r\nStart=26\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Marital status\r\nName=P05_MS_VS1\r\nValue=1;Married\r\nValue=2;Divorced\r\nValue=3;Separated\r\nValue=4;Widowed\r\nValue=5;Never Married\r\n\r\n[Item]\r\nLabel=Mother living\r\nName=P06_MOTHER\r\nStart=27\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Mother living\r\nName=P06_MOTHER_VS1\r\nValue=1;Yes\r\nValue=2;No\r\nValue=3;Don\'t know\r\n\r\n[Item]\r\nLabel=Place of birth\r\nName=P07_BIRTH\r\nStart=28\r\nLen=2\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Place of birth\r\nName=P07_BIRTH_VS1\r\nValue=1:15;Popstan\r\nValue=21;Endar\r\nValue=22;Victoria\r\nValue=23:27;Africa\r\nValue=40:44;Middle East\r\nValue=50:53;Asia\r\nValue=70:74;Europe\r\nValue=80:84;Americas\r\nValue=0;Not Reported\r\n\r\n[Item]\r\nLabel=Residence in 1995\r\nName=P08_RES95\r\nStart=30\r\nLen=2\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Residence in 1995\r\nName=P08_RES95_VS1\r\nValue=1:15;Popstan\r\nValue=21;Endar\r\nValue=22;Victoria\r\nValue=23:27;Africa\r\nValue=40:44;Middle East\r\nValue=50:53;Asia\r\nValue=70:74;Europe\r\nValue=80:84;Americas\r\nValue=0;Unknown\r\nValue=\'  \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Attending school\r\nName=P09_ATTEND\r\nStart=32\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Attending school\r\nName=P09_ATTEND_VS1\r\nValue=1;Yes\r\nValue=2;No\r\nValue=9;Not Reported\r\nValue=\' \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Highest grade completed\r\nName=P10_HIGH_GR\r\nStart=33\r\nLen=2\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Highest grade completed\r\nName=P10_HIGH_GR_VS1\r\nValue=0;None\r\nValue=1:5;Primary\r\nValue=6:8;Middle School\r\nValue=9:12;High School\r\nValue=13:30;University\r\nValue=31:36;Technical\r\nValue=99;Not Reported\r\nValue=\'  \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Literacy\r\nName=P11_LITERACY\r\nStart=35\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Literacy\r\nName=P11_LITERACY_VS1\r\nValue=1;Literate\r\nValue=2;Illiterate\r\nValue=9;Not Reported\r\nValue=\' \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Working\r\nName=P12_WORKING\r\nStart=36\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Working\r\nName=P12_WORKING_VS1\r\nValue=1;Yes\r\nValue=2;No\r\nValue=9;Not Reported\r\nValue=\' \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Looking for work\r\nName=P13_LOOKING\r\nStart=37\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Looking for work\r\nName=P13_LOOKING_VS1\r\nValue=1;Yes\r\nValue=2;No\r\nValue=9;Not Reported\r\nValue=\' \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Why not looking for work\r\nName=P14_WHY_NOT\r\nStart=38\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Why not looking for work\r\nName=P14_WHY_NOT_VS1\r\nValue=1;Had job\r\nValue=2;Believed job not available\r\nValue=3;Did not want job\r\nValue=4;Doing own housework\r\nValue=5;Going to school\r\nValue=6;Other\r\nValue=9;Not Reported\r\nValue=\' \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Occupation\r\nName=P15_OCC\r\nStart=39\r\nLen=2\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Occupation\r\nName=P15_OCC_VS1\r\nValue=1;Medical\r\nValue=2;Accountants\r\nValue=10:13;Artist Technical\r\nValue=20:21;Admin Managerial\r\nValue=30:34;Clerical Office\r\nValue=40:43;Sales Workers\r\nValue=50:54;Service Workers\r\nValue=60:65;Farmers, Fishers\r\nValue=70:79;Production Work\r\nValue=80:83;Transport Worker\r\nValue=90:92;Construction Trades\r\nValue=95;Other\r\nValue=99;Not Reported\r\nValue=\'  \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Occupation (major groups)\r\nName=P15A_OCC\r\nStart=39\r\nLen=1\r\nItemType=SubItem\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Occupation (major groups)\r\nName=P15A_OCC_VS1\r\nValue=0;Social or personal Services\r\nValue=1;Professional, Technical\r\nValue=2;Public Administration\r\nValue=3;Clerical\r\nValue=4;Wholesale or Retail Industry\r\nValue=5;Service\r\nValue=6;Farming, Forestry, Fishing, Hunting\r\nValue=7;Tradesmen/Craftsmen\r\nValue=8;Transportation\r\nValue=9;Construction, other, not reported\r\nValue=\' \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Industry\r\nName=P16_IND\r\nStart=41\r\nLen=2\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Industry\r\nName=P16_IND_VS1\r\nValue=10;Hunting\r\nValue=11;Agriculture\r\nValue=12;Forestry\r\nValue=13;Fishing\r\nValue=20;Mining Quarrying\r\nValue=30;Food manufacture\r\nValue=31;Beverage Tobacco\r\nValue=32;Machinery Mfg\r\nValue=33;Wood products\r\nValue=34;Paper products\r\nValue=35;Chemical Petrol\r\nValue=36;Non-metal Manufa\r\nValue=37;Metal Industries\r\nValue=39;Jewelry Mfg\r\nValue=40;Energy supplies\r\nValue=41;Waterworks\r\nValue=42;Natural Gas Supply\r\nValue=43;Sanitation Services\r\nValue=50;Construction\r\nValue=60;Wholesale Trade\r\nValue=61;Retail Trade\r\nValue=62;Hotels, Restaurants\r\nValue=70;Transport\r\nValue=71;Storage\r\nValue=72;Communication\r\nValue=80;Financial Banks\r\nValue=81;Insurance\r\nValue=82;Real Estate\r\nValue=83;Business Service\r\nValue=90;Public Admin\r\nValue=91;Education\r\nValue=92;Medical Dental\r\nValue=93;Social Community\r\nValue=94;Recrtn Cultural\r\nValue=95;Personal HHold\r\nValue=98;Other\r\nValue=99;Not Reported\r\nValue=\'  \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Industry (major groups)\r\nName=P16A_IND\r\nStart=41\r\nLen=1\r\nItemType=SubItem\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Industry (major groups)\r\nName=P16A_IND_VS1\r\nValue=0;Social or Personal Services\r\nValue=1;Farming, Forestry, Fishing, Hunting\r\nValue=2;Mining, Quarrying\r\nValue=3;Manufacturing\r\nValue=4;Utilities (Electricity, Gas, Water, Sanitation)\r\nValue=5;Construction\r\nValue=6;Commerce\r\nValue=7;Transport, Storage, Communication\r\nValue=8;Financing, Business Services\r\nValue=9;Public Administration and not reported\r\nValue=\' \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Work Status\r\nName=P17_WK_STATUS\r\nStart=43\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Work Status\r\nName=P17_WK_STATUS_VS1\r\nValue=1;Employer\r\nValue=2;Paid employee\r\nValue=3;Self-employed\r\nValue=4;Unpaid family worker\r\nValue=5;Other\r\nValue=9;Not Reported\r\nValue=\' \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Economically active\r\nName=ECON_ACTIVE\r\nStart=44\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Economically active\r\nName=ECON_ACTIVE_VS1\r\nValue=1;Yes\r\nValue=2;No\r\nValue=9;Not Reported\r\nValue=\' \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Number of children born alive\r\nName=P18_BORN\r\nStart=45\r\nLen=2\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Number of children born alive\r\nName=P18_BORN_VS1\r\nValue=0;None\r\nValue=1;1\r\nValue=2;2\r\nValue=3;3\r\nValue=4;4\r\nValue=5;5\r\nValue=6;6\r\nValue=7;7\r\nValue=8;8\r\nValue=9;9\r\nValue=10:20;10+\r\nValue=99;Not Reported\r\nValue=\'  \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Number of children still living\r\nName=P19_LIVING\r\nStart=47\r\nLen=2\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Number of children still living\r\nName=P19_LIVING_VS1\r\nValue=0;None\r\nValue=1;1\r\nValue=2;2\r\nValue=3;3\r\nValue=4;4\r\nValue=5;5\r\nValue=6;6\r\nValue=7;7\r\nValue=8;8\r\nValue=9;9\r\nValue=10:20;10+\r\nValue=99;Not Reported\r\nValue=\'  \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Number of children born in last 12 months\r\nName=P20_BORN12\r\nStart=49\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Number of children born in last 12 months\r\nName=P20_BORN12_VS1\r\nValue=0:3\r\nValue=9;Not Reported\r\nValue=\' \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Record]\r\nLabel=Housing Record\r\nName=HOUSING\r\nRecordTypeValue=\'2\'\r\nRecordLen=38\r\n\r\n[Item]\r\nLabel=Type of housing\r\nName=H01_TYPE\r\nStart=20\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Type of housing\r\nName=H01_TYPE_VS1\r\nValue=1;Single family\r\nValue=2;Multi-family\r\nValue=3;Improvised\r\nValue=4;Mobile\r\nValue=5;Collective quarters\r\nValue=6;Homeless (none)\r\nValue=9;Not reported\r\n\r\n[Item]\r\nLabel=Wall type\r\nName=H02_WALL\r\nStart=21\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Wall type\r\nName=H02_WALL_VS1\r\nValue=1;Stone/Cement\r\nValue=2;Metal\r\nValue=3;Wood\r\nValue=4;Bamboo/Mud/Reed\r\nValue=5;Other\r\nValue=6;None\r\nValue=9;Not Reported\r\nValue=\' \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Roof type\r\nName=H03_ROOF\r\nStart=22\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Roof type\r\nName=H03_ROOF_VS1\r\nValue=1;Stone/Cement\r\nValue=2;Metal\r\nValue=3;Wood\r\nValue=4;Bamboo/Mud/Reed\r\nValue=5;Other\r\nValue=6;None\r\nValue=9;Not Reported\r\nValue=\' \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Floor type\r\nName=H04_FLOOR\r\nStart=23\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Floor type\r\nName=H04_FLOOR_VS1\r\nValue=1;Stone/Cement\r\nValue=2;Tile/Marble\r\nValue=3;Wood\r\nValue=4;Leaves/Reed\r\nValue=5;Other\r\nValue=6;None\r\nValue=9;Not Reported\r\nValue=\' \';Not Applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Number of rooms\r\nName=H05_ROOMS\r\nStart=24\r\nLen=2\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Number of rooms\r\nName=H05_ROOMS_VS1\r\nValue=1;01\r\nValue=2;02\r\nValue=3;03\r\nValue=4;04\r\nValue=5;05\r\nValue=6;06\r\nValue=7;07\r\nValue=8;08\r\nValue=9;09\r\nValue=10;10\r\nValue=11;11\r\nValue=12;12\r\nValue=13;13\r\nValue=14;14\r\nValue=15;15\r\nValue=16;16\r\nValue=17;17\r\nValue=18;18\r\nValue=19;19\r\nValue=20;20\r\nValue=99;Not reported\r\nValue=\'  \';Not applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Tenure\r\nName=H06_TENURE\r\nStart=26\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Tenure\r\nName=H06_TENURE_VS1\r\nValue=1;Owned\r\nValue=2;Paid rent\r\nValue=3;Rent free\r\nValue=4;Vacant\r\nValue=9;Not reported\r\nValue=\' \';Not applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Amount of rent paid\r\nName=H07_RENT\r\nStart=27\r\nLen=3\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Amount of rent paid\r\nName=H07_RENT_VS1\r\nValue=0:998\r\nValue=999;Not reported\r\nValue=\'   \';Not applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Type of toilet facilities\r\nName=H08_TOILET\r\nStart=30\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Type of toilet facilities\r\nName=H08_TOILET_VS1\r\nValue=1;Private toilet\r\nValue=2;Shared toilet\r\nValue=3;Outhouse\r\nValue=4;Pit\r\nValue=5;Other\r\nValue=6;None\r\nValue=9;Not reported\r\nValue=\' \';Not applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Type of bathing facilities\r\nName=H09_BATH\r\nStart=31\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Type of bathing facilities\r\nName=H09_BATH_VS1\r\nValue=1;Exclusive\r\nValue=2;Shared\r\nValue=3;Hand basin\r\nValue=4;Portable tub or basin\r\nValue=5;Other\r\nValue=6;None\r\nValue=9;Not reported\r\nValue=\' \';Not applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Source of water\r\nName=H10_WATER\r\nStart=32\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Source of water\r\nName=H10_WATER_VS1\r\nValue=1;Inside piped\r\nValue=2;Outside piped\r\nValue=3;Bottled or canned\r\nValue=4;Closed well or closed spring\r\nValue=5;Open well or spring\r\nValue=6;River/Stream/Other\r\nValue=9;Not reported\r\nValue=\' \';Not applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Fuel for lighting\r\nName=H11_LIGHT\r\nStart=33\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Fuel for lighting\r\nName=H11_LIGHT_VS1\r\nValue=1;Electric\r\nValue=2;Gas\r\nValue=3;Kerosene\r\nValue=4;Candle/Tallow\r\nValue=5;Other\r\nValue=6;None\r\nValue=9;Not reported\r\nValue=\' \';Not applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Fuel for cooking\r\nName=H12_FUEL\r\nStart=34\r\nLen=1\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Fuel for cooking\r\nName=H12_FUEL_VS1\r\nValue=1;Electricity\r\nValue=2;Gas\r\nValue=3;Kerosene or oil\r\nValue=4;Coal or charcoal\r\nValue=5;Wood\r\nValue=6;Other\r\nValue=7;None\r\nValue=9;Not reported\r\nValue=\' \';Not applicable\r\nName=NOTAPPL,Special\r\n\r\n[Item]\r\nLabel=Number of persons in the household\r\nName=H13_PERSONS\r\nStart=35\r\nLen=4\r\nDataType=Numeric\r\nZeroFill=Yes\r\n\r\n[ValueSet]\r\nLabel=Number of persons in the household\r\nName=H13_PERSONS_VS1\r\nValue=0;None\r\nValue=1;1 person\r\nValue=2;2 persons\r\nValue=3;3 persons\r\nValue=4;4 persons\r\nValue=5;5 persons\r\nValue=6;6 persons\r\nValue=7;7 persons\r\nValue=8;8 persons\r\nValue=9;9 persons\r\nValue=10:9999;10+ persons\r\n','2023-09-15 20:01:48','2023-09-15 20:01:48');
/*!40000 ALTER TABLE `cspro_dictionaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_dictionaries_schema`
--

DROP TABLE IF EXISTS `cspro_dictionaries_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_dictionaries_schema` (
  `dictionary_id` smallint unsigned NOT NULL,
  `host_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schema_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schema_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schema_password` varbinary(255) NOT NULL,
  `additional_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `map_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`dictionary_id`),
  UNIQUE KEY `schema_name` (`schema_name`),
  CONSTRAINT `schema_dict_id_constraint` FOREIGN KEY (`dictionary_id`) REFERENCES `cspro_dictionaries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_dictionaries_schema`
--

LOCK TABLES `cspro_dictionaries_schema` WRITE;
/*!40000 ALTER TABLE `cspro_dictionaries_schema` DISABLE KEYS */;
/*!40000 ALTER TABLE `cspro_dictionaries_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_log`
--

DROP TABLE IF EXISTS `cspro_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) DEFAULT NULL,
  `level_name` varchar(255) DEFAULT NULL,
  `message` longtext,
  `context` longtext,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_log`
--

LOCK TABLES `cspro_log` WRITE;
/*!40000 ALTER TABLE `cspro_log` DISABLE KEYS */;
INSERT INTO `cspro_log` VALUES (1,'request','CRITICAL','Uncaught PHP Exception Twig\\Error\\RuntimeError: \"An exception has been thrown during the rendering of a template (\"Failed to write cache file \"D:\\Users\\nathan\\Sites\\CSWebFinal\\var\\cache\\dev/twig/28/28505a418df5c101cfd6001057d215d6.php\".\").\" at D:\\Users\\nathan\\Sites\\CSWebFinal\\vendor\\symfony\\web-profiler-bundle\\Resources\\views\\Profiler\\toolbar_js.html.twig line 15','{\"exception\":\"[object] (Twig\\\\Error\\\\RuntimeError(code: 0): An exception has been thrown during the rendering of a template (\\\"Failed to write cache file \\\"D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal\\\\var\\\\cache\\\\dev/twig/28/28505a418df5c101cfd6001057d215d6.php\\\".\\\"). at D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal\\\\vendor\\\\symfony\\\\web-profiler-bundle\\\\Resources\\\\views\\\\Profiler\\\\toolbar_js.html.twig:15, RuntimeException(code: 0): Failed to write cache file \\\"D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal\\\\var\\\\cache\\\\dev/twig/28/28505a418df5c101cfd6001057d215d6.php\\\". at D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal\\\\vendor\\\\twig\\\\twig\\\\src\\\\Cache\\\\FilesystemCache.php:76)\"} []\n','2023-09-14 16:38:21'),(2,'console','CRITICAL','Error thrown while running command \"{command}\". Message: \"{message}\"','{\"exception\":\"[object] (Symfony\\\\Component\\\\Console\\\\Exception\\\\InvalidArgumentException(code: 0): The target directory \\\"D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal/web\\\" does not exist. at D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal\\\\vendor\\\\symfony\\\\framework-bundle\\\\Command\\\\AssetsInstallCommand.php:108)\",\"command\":\"assets:install --symlink --relative web\",\"message\":\"The target directory \\\"D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal/web\\\" does not exist.\"} []\n','2023-09-14 20:50:46'),(3,'console','CRITICAL','Error thrown while running command \"{command}\". Message: \"{message}\"','{\"exception\":\"[object] (Symfony\\\\Component\\\\Console\\\\Exception\\\\InvalidArgumentException(code: 0): The target directory \\\"D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal/web\\\" does not exist. at D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal\\\\vendor\\\\symfony\\\\framework-bundle\\\\Command\\\\AssetsInstallCommand.php:108)\",\"command\":\"assets:install --symlink --relative web\",\"message\":\"The target directory \\\"D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal/web\\\" does not exist.\"} []\n','2023-09-14 20:55:06'),(4,'request','ERROR','Uncaught PHP Exception Symfony\\Component\\HttpKernel\\Exception\\NotFoundHttpException: \"No route found for \"GET http://localhost/favicon.ico\" (from \"http://localhost/phpinfo.php\")\" at D:\\Users\\nathan\\Sites\\CSWebFinal\\vendor\\symfony\\http-kernel\\EventListener\\RouterListener.php line 135','{\"exception\":\"[object] (Symfony\\\\Component\\\\HttpKernel\\\\Exception\\\\NotFoundHttpException(code: 0): No route found for \\\"GET http://localhost/favicon.ico\\\" (from \\\"http://localhost/phpinfo.php\\\") at D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal\\\\vendor\\\\symfony\\\\http-kernel\\\\EventListener\\\\RouterListener.php:135, Symfony\\\\Component\\\\Routing\\\\Exception\\\\ResourceNotFoundException(code: 0): No routes found for \\\"/favicon.ico/\\\". at D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal\\\\vendor\\\\symfony\\\\routing\\\\Matcher\\\\Dumper\\\\CompiledUrlMatcherTrait.php:74)\"} []\n','2023-09-15 20:08:04'),(5,'request','CRITICAL','Uncaught PHP Exception JsonException: \"Syntax error\" at D:\\Users\\nathan\\Sites\\CSWebFinal\\src\\AppBundle\\Controller\\ui\\DictionaryController.php line 40','{\"exception\":\"[object] (JsonException(code: 4): Syntax error at D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal\\\\src\\\\AppBundle\\\\Controller\\\\ui\\\\DictionaryController.php:40)\"} []\n','2023-09-15 20:12:34'),(6,'request','ERROR','Uncaught PHP Exception Symfony\\Component\\HttpKernel\\Exception\\NotFoundHttpException: \"No route found for \"GET http://localhost/phpinfo\"\" at D:\\Users\\nathan\\Sites\\CSWebFinal\\vendor\\symfony\\http-kernel\\EventListener\\RouterListener.php line 135','{\"exception\":\"[object] (Symfony\\\\Component\\\\HttpKernel\\\\Exception\\\\NotFoundHttpException(code: 0): No route found for \\\"GET http://localhost/phpinfo\\\" at D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal\\\\vendor\\\\symfony\\\\http-kernel\\\\EventListener\\\\RouterListener.php:135, Symfony\\\\Component\\\\Routing\\\\Exception\\\\ResourceNotFoundException(code: 0): No routes found for \\\"/phpinfo/\\\". at D:\\\\Users\\\\nathan\\\\Sites\\\\CSWebFinal\\\\vendor\\\\symfony\\\\routing\\\\Matcher\\\\Dumper\\\\CompiledUrlMatcherTrait.php:74)\"} []\n','2023-09-15 20:55:19');
/*!40000 ALTER TABLE `cspro_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_permissions`
--

DROP TABLE IF EXISTS `cspro_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Permissions Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_permissions`
--

LOCK TABLES `cspro_permissions` WRITE;
/*!40000 ALTER TABLE `cspro_permissions` DISABLE KEYS */;
INSERT INTO `cspro_permissions` VALUES (1,'data_all','2023-09-14 16:31:12','2023-09-14 16:31:12'),(2,'apps_all','2023-09-14 16:31:12','2023-09-14 16:31:12'),(3,'users_all','2023-09-14 16:31:12','2023-09-14 16:31:12'),(4,'roles_all','2023-09-14 16:31:12','2023-09-14 16:31:12'),(5,'reports_all','2023-09-14 16:31:12','2023-09-14 16:31:12'),(6,'dictionary_sync_upload','2023-09-14 16:31:12','2023-09-14 16:31:12'),(7,'dictionary_sync_download','2023-09-14 16:31:12','2023-09-14 16:31:12'),(8,'settings_all','2023-09-14 16:31:12','2023-09-14 16:31:12');
/*!40000 ALTER TABLE `cspro_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_role_dictionary_permissions`
--

DROP TABLE IF EXISTS `cspro_role_dictionary_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_role_dictionary_permissions` (
  `role_id` int unsigned NOT NULL,
  `dictionary_id` smallint unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  KEY `cspro_role_dictionary_role_id_constraint` (`role_id`),
  KEY `cspro_role_dictionary_id_constraint` (`dictionary_id`),
  KEY `cspro_role_dictionary_permission_id_constraint` (`permission_id`),
  CONSTRAINT `cspro_role_dictionary_id_constraint` FOREIGN KEY (`dictionary_id`) REFERENCES `cspro_dictionaries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cspro_role_dictionary_permission_id_constraint` FOREIGN KEY (`permission_id`) REFERENCES `cspro_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cspro_role_dictionary_role_id_constraint` FOREIGN KEY (`role_id`) REFERENCES `cspro_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Role Dictionary Permissions Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_role_dictionary_permissions`
--

LOCK TABLES `cspro_role_dictionary_permissions` WRITE;
/*!40000 ALTER TABLE `cspro_role_dictionary_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cspro_role_dictionary_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_role_permissions`
--

DROP TABLE IF EXISTS `cspro_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_role_permissions` (
  `role_id` int unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  KEY `cspro_role_id_constraint` (`role_id`),
  KEY `cspro_permission_id_constraint` (`permission_id`),
  CONSTRAINT `cspro_permission_id_constraint` FOREIGN KEY (`permission_id`) REFERENCES `cspro_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cspro_role_id_constraint` FOREIGN KEY (`role_id`) REFERENCES `cspro_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Role Permissions Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_role_permissions`
--

LOCK TABLES `cspro_role_permissions` WRITE;
/*!40000 ALTER TABLE `cspro_role_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cspro_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_roles`
--

DROP TABLE IF EXISTS `cspro_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolename_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Roles Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_roles`
--

LOCK TABLES `cspro_roles` WRITE;
/*!40000 ALTER TABLE `cspro_roles` DISABLE KEYS */;
INSERT INTO `cspro_roles` VALUES (1,'Standard User','2023-09-14 16:31:12','2023-09-14 16:31:12'),(2,'Administrator','2023-09-14 16:31:12','2023-09-14 16:31:12');
/*!40000 ALTER TABLE `cspro_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_sync_history`
--

DROP TABLE IF EXISTS `cspro_sync_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_sync_history` (
  `revision` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dictionary_id` smallint unsigned NOT NULL,
  `universe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` enum('put','get','both') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_case_revision` int unsigned DEFAULT NULL,
  `last_case_guid` binary(16) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`revision`),
  KEY `dictionary_id` (`dictionary_id`),
  CONSTRAINT `cspro_dict_id_constraint` FOREIGN KEY (`dictionary_id`) REFERENCES `cspro_dictionaries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_sync_history`
--

LOCK TABLES `cspro_sync_history` WRITE;
/*!40000 ALTER TABLE `cspro_sync_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cspro_sync_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cspro_users`
--

DROP TABLE IF EXISTS `cspro_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cspro_users` (
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int unsigned NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 06:00:00',
  PRIMARY KEY (`username`),
  KEY `role` (`role`),
  CONSTRAINT `role_id_constraint` FOREIGN KEY (`role`) REFERENCES `cspro_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cspro_users`
--

LOCK TABLES `cspro_users` WRITE;
/*!40000 ALTER TABLE `cspro_users` DISABLE KEYS */;
INSERT INTO `cspro_users` VALUES ('admin','$2y$10$E.R4qfU/LUA0/lsn34IsbOaf9tEIjFnkQnvuaLjHNnhMiDnVZbjTW','System','Administrator',NULL,NULL,2,'2023-09-14 16:31:12','2023-09-14 16:31:12');
/*!40000 ALTER TABLE `cspro_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`access_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('8dfcb1dda8fc8831aaa12e332ab298ed259d012c','cspro_android','admin','2023-09-14 17:31:34',NULL),('7ba3bb65fcb2661a2dc45021faaebb68e7c3ae8d','cspro_android','admin','2023-09-14 17:39:54',NULL),('dcfbb98157db3a865cf693c952c0541453a79bd2','cspro_android','admin','2023-09-14 18:23:54',NULL),('f4e101ee8f702e78b10dfff4d713b197923b0eb5','cspro_android','admin','2023-09-15 20:44:42',NULL),('f2b5e4f2e9d7c29d756d85afb8c3df0484e4b195','cspro_android','admin','2023-09-15 21:06:25',NULL),('a493a0feed86782e19f1e5f98c41ed5fa9dcc619','cspro_android','admin','2023-09-15 21:06:57',NULL),('dfdb0f946c8ea51653d01db46986ab7ae14a41b8','cspro_android','admin','2023-09-15 21:12:34',NULL),('9a4b4284914bb0c4991141ad489950dbc6217233','cspro_android','admin','2023-09-15 21:57:15',NULL),('11802953fc0a1c13892f48998c15f37b7dad11dc','cspro_android','admin','2023-09-15 21:57:34',NULL),('bf1fc61f3a594ed47378edb30900482a77908fe6','cspro_android','admin','2023-09-15 22:01:16',NULL),('165d453e44eaa5bccc16c1b265f843a169aa301a','cspro_android','admin','2023-09-15 22:03:30',NULL);
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_authorization_codes`
--

DROP TABLE IF EXISTS `oauth_authorization_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_uri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`authorization_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_authorization_codes`
--

LOCK TABLES `oauth_authorization_codes` WRITE;
/*!40000 ALTER TABLE `oauth_authorization_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_authorization_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_uri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `grant_types` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES ('cspro_android','cspro','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_jwt`
--

DROP TABLE IF EXISTS `oauth_jwt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_jwt` (
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public_key` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_jwt`
--

LOCK TABLES `oauth_jwt` WRITE;
/*!40000 ALTER TABLE `oauth_jwt` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_jwt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` VALUES ('e7f90caf218ec7444fb1ab0b410b74cabd3cd5ad','cspro_android','admin','2023-09-28 16:31:34',NULL),('ffccd593dcf4924e586917940602fcffa7ecf5a7','cspro_android','admin','2023-09-28 16:39:54',NULL),('13aac568f086d3707b5f19892eb9f2795f43797d','cspro_android','admin','2023-09-28 17:23:54',NULL),('6bfdff47d47a0b20d29fe1b4f4491116b7430a86','cspro_android','admin','2023-09-29 19:44:42',NULL),('5738b9e409718664ca37be8e9558a100f614eccc','cspro_android','admin','2023-09-29 20:06:25',NULL),('9161f23f97efd0d59ccbc07119c70d3b2edbbd41','cspro_android','admin','2023-09-29 20:06:57',NULL),('7b0458d34f59761bc46cc8bebc59cccf61eebbe8','cspro_android','admin','2023-09-29 20:12:34',NULL),('224a2d9c3033a4b15dd07f62fac6ff6b8a07fac4','cspro_android','admin','2023-09-29 20:57:15',NULL),('89b9694558ba7dde9dc480f89cf8866e77620c3c','cspro_android','admin','2023-09-29 20:57:34',NULL),('82778abdc0a0481fda36cf70b8c7dece0e7c1587','cspro_android','admin','2023-09-29 21:01:16',NULL),('1f4e4db5c9c37c469d0a27681090821f7cb06ead','cspro_android','admin','2023-09-29 21:03:30',NULL);
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_scopes`
--

DROP TABLE IF EXISTS `oauth_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_scopes` (
  `scope` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_scopes`
--

LOCK TABLES `oauth_scopes` WRITE;
/*!40000 ALTER TABLE `oauth_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_users`
--

DROP TABLE IF EXISTS `oauth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_users` (
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_users`
--

LOCK TABLES `oauth_users` WRITE;
/*!40000 ALTER TABLE `oauth_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-25 17:48:04
