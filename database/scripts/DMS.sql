-- MySQL dump 10.13  Distrib 5.6.11, for Win32 (x86)
--
-- Host: localhost    Database: dms
-- ------------------------------------------------------
-- Server version	5.6.11

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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `seat` smallint(5) unsigned zerofill DEFAULT NULL,
  `color` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `engine_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `shelves_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sign_date` date NOT NULL,
  `entry_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `insure_date` date NOT NULL,
  `annual_survey_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `repair_info` text,
  PRIMARY KEY (`id`),
  KEY `uq_car_no` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_shuttle_infos`
--

DROP TABLE IF EXISTS `customer_shuttle_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_shuttle_infos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `type` varchar(4) NOT NULL DEFAULT 'pick',
  `customer_id` int(10) unsigned NOT NULL,
  `driver_id` int(10) unsigned NOT NULL,
  `car_id` int(10) unsigned NOT NULL,
  `start_time` varchar(5) NOT NULL,
  `end_time` varchar(5) NOT NULL,
  `drive_kilo` bigint(20) unsigned NOT NULL,
  `detail_info` text NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_customer_id` FOREIGN KEY (`id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `company` varchar(40) NOT NULL,
  `business` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uq_customer_name` (`name`,`phone_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `driver_month_performances`
--

DROP TABLE IF EXISTS `driver_month_performances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver_month_performances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year` smallint(5) unsigned NOT NULL,
  `month` smallint(5) unsigned NOT NULL,
  `driver_id` int(10) unsigned NOT NULL,
  `cleaning_award` bigint(20) unsigned NOT NULL,
  `attendance_info` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uq_year_month_driver_id` (`year`,`month`,`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `sex` varchar(6) NOT NULL DEFAULT 'male',
  `card_no` varchar(20) NOT NULL,
  `record_no` varchar(20) NOT NULL,
  `drive_type` varchar(50) NOT NULL,
  `first_get_card_date` date NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_driver_name` (`name`,`card_no`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='驾驶员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uq_holiday_name` (`title`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-29 14:15:12
