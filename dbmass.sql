DROP SCHEMA IF EXISTS `db mass`;
CREATE SCHEMA `db mass`;
USE `db mass`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: db mass
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `citizen`
--

DROP TABLE IF EXISTS `citizen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citizen` (
  `Social Security Number` char(10) NOT NULL,
  `C_Name` varchar(40) DEFAULT NULL,
  `Gender` enum('Male','Female','Other') NOT NULL,
  `Date of Birth` varchar(40) DEFAULT NULL,
  `Physical Address` varchar(40) DEFAULT NULL,
  `IP Address` varchar(40) DEFAULT NULL,
  `C_List` enum('Blacklist','Whitelist','Greylist') DEFAULT NULL,
  `Phone Number` int NOT NULL,
  PRIMARY KEY (`Social Security Number`),
  UNIQUE KEY `Social Security Number_UNIQUE` (`Social Security Number`),
  UNIQUE KEY `Phone Number_UNIQUE` (`Phone Number`),
  UNIQUE KEY `IP Address_UNIQUE` (`IP Address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citizen`
--

LOCK TABLES `citizen` WRITE;
/*!40000 ALTER TABLE `citizen` DISABLE KEYS */;
INSERT INTO `citizen` VALUES ('111111111','Tao Sin','Female','1900/05/20','Yasuo Tan','14436.8656','Whitelist',11111111),('149231741','Yazhu Yong','Female','2001/02/29','Li Hua Yuan','246.140.36.224','Blacklist',20177333),('199849702','Shi Bao','Male','1950/01/01','Cheng Dong Da','250.199.122.146','Blacklist',90111135),('442274483','Ju Yawen','Male','1983/10/14','Guo Yi Dong','117.69.145.184','Greylist',22088184),('489294383','Ming Yijun','Male','1992/12/10','Feng Cheng Zhen','142.104.239.15','Whitelist',52047447),('564994928','Chun Ning','Other','2011/11/11','Hubei','242.140.06.299','Blacklist',30291167),('611833813','Lin Tai','Female','1991/08/07','Ying Ye Ting','195.138.188.76','Greylist',50564465),('990014529','Xin Zhao','Female','1975/05/27','Yasuo Tan','153.002.2.56','Blacklist',12560090);
/*!40000 ALTER TABLE `citizen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `Social Security Number(1)` char(10) NOT NULL,
  `Social Security Number(2)` char(10) NOT NULL,
  PRIMARY KEY (`Social Security Number(1)`,`Social Security Number(2)`),
  KEY `fk_Citizen_has_Citizen_Citizen2_idx` (`Social Security Number(2)`),
  CONSTRAINT `fk_Citizen_has_Citizen_Citizen1` FOREIGN KEY (`Social Security Number(1)`) REFERENCES `citizen` (`Social Security Number`),
  CONSTRAINT `fk_Citizen_has_Citizen_Citizen2` FOREIGN KEY (`Social Security Number(2)`) REFERENCES `citizen` (`Social Security Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES ('564994928','149231741'),('149231741','199849702'),('489294383','442274483'),('199849702','489294383'),('611833813','489294383'),('489294383','564994928'),('990014529','564994928'),('442274483','990014529');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `is active in`
--

DROP TABLE IF EXISTS `is active in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `is active in` (
  `Social Security Number` char(10) NOT NULL,
  `S_Name` enum('Fb gang','Agents','Hmmy','DB_Mass','L.A.P.D') NOT NULL,
  PRIMARY KEY (`Social Security Number`,`S_Name`),
  KEY `fk_Citizen_has_Social Group_Citizen1_idx` (`Social Security Number`),
  KEY `fk_Citizen_has_Social Group_Social Group1_idx` (`S_Name`),
  CONSTRAINT `fk_Citizen_has_Social Group_Citizen1` FOREIGN KEY (`Social Security Number`) REFERENCES `citizen` (`Social Security Number`),
  CONSTRAINT `fk_Citizen_has_Social Group_Social Group1` FOREIGN KEY (`S_Name`) REFERENCES `social group` (`S_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `is active in`
--

LOCK TABLES `is active in` WRITE;
/*!40000 ALTER TABLE `is active in` DISABLE KEYS */;
INSERT INTO `is active in` VALUES ('199849702','Fb gang'),('149231741','Agents'),('564994928','Hmmy'),('489294383','DB_Mass'),('442274483','L.A.P.D');
/*!40000 ALTER TABLE `is active in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `is common in`
--

DROP TABLE IF EXISTS `is common in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `is common in` (
  `URL Address` varchar(40) NOT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`URL Address`,`ID`),
  KEY `fk_Website_has_Keyphrase_Keyphrase1_idx` (`ID`),
  KEY `fk_Website_has_Keyphrase_Website1_idx` (`URL Address`),
  CONSTRAINT `fk_Website_has_Keyphrase_Keyphrase1` FOREIGN KEY (`ID`) REFERENCES `keyphrase` (`ID`),
  CONSTRAINT `fk_Website_has_Keyphrase_Website1` FOREIGN KEY (`URL Address`) REFERENCES `website` (`URL Address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `is common in`
--

LOCK TABLES `is common in` WRITE;
/*!40000 ALTER TABLE `is common in` DISABLE KEYS */;
INSERT INTO `is common in` VALUES ('https://www.facebook.com/',1),('https://www.bookaticket.com/',2),('https://www.stoiximan.gr/',3),('https://www.makeleio.gr/',4),('https://www.thmmy.gr/',5);
/*!40000 ALTER TABLE `is common in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyphrase`
--

DROP TABLE IF EXISTS `keyphrase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyphrase` (
  `Content` varchar(40) DEFAULT NULL,
  `ID` int NOT NULL,
  `Meaning` varchar(40) DEFAULT NULL,
  `Political Ideology_P_Name` enum('Authoritarian Left','Centrist','Libertarian Left','Libertarian Right','Authoritarian Right') NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Keyphrase_Political Ideology_idx` (`Political Ideology_P_Name`),
  CONSTRAINT `fk_Keyphrase_Political Ideology` FOREIGN KEY (`Political Ideology_P_Name`) REFERENCES `political ideology` (`P_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyphrase`
--

LOCK TABLES `keyphrase` WRITE;
/*!40000 ALTER TABLE `keyphrase` DISABLE KEYS */;
INSERT INTO `keyphrase` VALUES ('YoLo',1,'You only live once','Libertarian Right'),('Stfu',2,'Shut the f*** up','Authoritarian Left'),('GG ',3,'Good Game','Centrist'),('Free Helicopter Rides',4,'Extermination of political opponents','Authoritarian Right'),('bro',5,'Reference to a friend','Libertarian Left');
/*!40000 ALTER TABLE `keyphrase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `political ideology`
--

DROP TABLE IF EXISTS `political ideology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `political ideology` (
  `P_Name` enum('Authoritarian Left','Centrist','Libertarian Left','Libertarian Right','Authoritarian Right') NOT NULL,
  `P_List` enum('Blacklist','Whitelist','Greylist') DEFAULT NULL,
  `Popularity Index` float DEFAULT NULL,
  PRIMARY KEY (`P_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `political ideology`
--

LOCK TABLES `political ideology` WRITE;
/*!40000 ALTER TABLE `political ideology` DISABLE KEYS */;
INSERT INTO `political ideology` VALUES ('Authoritarian Left','Greylist',0.75),('Centrist','Whitelist',0.6),('Libertarian Left','Blacklist',0.49),('Libertarian Right','Blacklist',0.8),('Authoritarian Right','Greylist',0.2);
/*!40000 ALTER TABLE `political ideology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `popular`
--

DROP TABLE IF EXISTS `popular`;
/*!50001 DROP VIEW IF EXISTS `popular`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `popular` AS SELECT 
 1 AS `URL Address`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `social group`
--

DROP TABLE IF EXISTS `social group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social group` (
  `S_Name` enum('Fb gang','Agents','Hmmy','DB_Mass','L.A.P.D') NOT NULL,
  `Polarization Index` float NOT NULL,
  PRIMARY KEY (`S_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social group`
--

LOCK TABLES `social group` WRITE;
/*!40000 ALTER TABLE `social group` DISABLE KEYS */;
INSERT INTO `social group` VALUES ('Fb gang',0.88),('Agents',0.31),('Hmmy',0.69),('DB_Mass',0.45),('L.A.P.D',0.17);
/*!40000 ALTER TABLE `social group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supports`
--

DROP TABLE IF EXISTS `supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supports` (
  `Social Security Number` char(10) NOT NULL,
  `P_Name` enum('Authoritarian Left','Centrist','Libertarian Left','Libertarian Right','Authoritarian Right') NOT NULL,
  PRIMARY KEY (`Social Security Number`,`P_Name`),
  KEY `fk_Citizen_has_Political Ideology_Political Ideology1_idx` (`P_Name`),
  KEY `fk_Citizen_has_Political Ideology_Citizen1_idx` (`Social Security Number`),
  CONSTRAINT `fk_Citizen_has_Political Ideology_Citizen1` FOREIGN KEY (`Social Security Number`) REFERENCES `citizen` (`Social Security Number`),
  CONSTRAINT `fk_Citizen_has_Political Ideology_Political Ideology1` FOREIGN KEY (`P_Name`) REFERENCES `political ideology` (`P_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supports`
--

LOCK TABLES `supports` WRITE;
/*!40000 ALTER TABLE `supports` DISABLE KEYS */;
INSERT INTO `supports` VALUES ('442274483','Authoritarian Left'),('611833813','Centrist'),('564994928','Libertarian Left'),('149231741','Authoritarian Right'),('199849702','Authoritarian Right'),('489294383','Authoritarian Right');
/*!40000 ALTER TABLE `supports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `suspicious`
--

DROP TABLE IF EXISTS `suspicious`;
/*!50001 DROP VIEW IF EXISTS `suspicious`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `suspicious` AS SELECT 
 1 AS `SSN`,
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `uses`
--

DROP TABLE IF EXISTS `uses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uses` (
  `Social Security Number` char(10) NOT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`Social Security Number`,`ID`),
  KEY `fk_Citizen_has_Keyphrase_Keyphrase1_idx` (`ID`),
  KEY `fk_Citizen_has_Keyphrase_Citizen1_idx` (`Social Security Number`),
  CONSTRAINT `fk_Citizen_has_Keyphrase_Citizen1` FOREIGN KEY (`Social Security Number`) REFERENCES `citizen` (`Social Security Number`),
  CONSTRAINT `fk_Citizen_has_Keyphrase_Keyphrase1` FOREIGN KEY (`ID`) REFERENCES `keyphrase` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uses`
--

LOCK TABLES `uses` WRITE;
/*!40000 ALTER TABLE `uses` DISABLE KEYS */;
INSERT INTO `uses` VALUES ('611833813',1),('149231741',2),('199849702',3),('489294383',4),('564994928',5);
/*!40000 ALTER TABLE `uses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `Citizen_Social Security Number` char(10) NOT NULL,
  `Website_URL Address` varchar(40) NOT NULL,
  PRIMARY KEY (`Citizen_Social Security Number`,`Website_URL Address`),
  KEY `fk_Citizen_has_Website_Website1_idx` (`Website_URL Address`),
  KEY `fk_Citizen_has_Website_Citizen1_idx` (`Citizen_Social Security Number`),
  CONSTRAINT `fk_Citizen_has_Website_Citizen1` FOREIGN KEY (`Citizen_Social Security Number`) REFERENCES `citizen` (`Social Security Number`),
  CONSTRAINT `fk_Citizen_has_Website_Website1` FOREIGN KEY (`Website_URL Address`) REFERENCES `website` (`URL Address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES ('149231741','https://www.makeleio.gr/'),('199849702','https://www.ammunation.com/'),('442274483','https://www.facebook.com/'),('489294383','https://www.stoiximan.gr/'),('564994928','https://www.thmmy.gr/'),('611833813','https://elearning.auth.gr/view11117');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website`
--

DROP TABLE IF EXISTS `website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website` (
  `URL Address` varchar(40) NOT NULL,
  `Number of Visitors` int DEFAULT NULL,
  `W_List` enum('Blacklist','Whitelist','Greylist') DEFAULT NULL,
  PRIMARY KEY (`URL Address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website`
--

LOCK TABLES `website` WRITE;
/*!40000 ALTER TABLE `website` DISABLE KEYS */;
INSERT INTO `website` VALUES ('https://elearning.auth.gr/view11117',242,'Blacklist'),('https://www.ammunation.com/',32856,'Greylist'),('https://www.bookaticket.com/',124462,'Whitelist'),('https://www.facebook.com/',3528957,'Greylist'),('https://www.makeleio.gr/',2437,'Blacklist'),('https://www.stoiximan.gr/',199286,'Whitelist'),('https://www.thmmy.gr/',8633,'Whitelist');
/*!40000 ALTER TABLE `website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `popular`
--

/*!50001 DROP VIEW IF EXISTS `popular`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `popular` AS select `b`.`URL Address` AS `URL Address` from ((select `a`.`P_Name` AS `P_Name`,`b`.`ID` AS `ID` from ((select `political ideology`.`P_Name` AS `P_Name` from `political ideology` where (`political ideology`.`P_List` = 'Blacklist')) `a` join (select `keyphrase`.`ID` AS `ID`,`keyphrase`.`Political Ideology_P_Name` AS `Political Ideology_P_Name` from `keyphrase`) `b` on((`a`.`P_Name` = `b`.`Political Ideology_P_Name`)))) `a` join (select `is common in`.`ID` AS `ID`,`c`.`URL Address` AS `URL Address` from ((select `website`.`URL Address` AS `URL Address` from `website` where (`website`.`Number of Visitors` > 50000)) `c` join `is common in` on((`is common in`.`URL Address` = `c`.`URL Address`)))) `b` on((`a`.`ID` = `b`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `suspicious`
--

/*!50001 DROP VIEW IF EXISTS `suspicious`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `suspicious` AS select `citizen`.`Social Security Number` AS `SSN`,`citizen`.`C_Name` AS `Name` from ((`citizen` join `supports` on((`citizen`.`Social Security Number` = `supports`.`Social Security Number`))) join `political ideology` on((`political ideology`.`P_Name` = `supports`.`P_Name`))) where (`political ideology`.`P_List` = 'Blacklist') union select `citizen`.`Social Security Number` AS `SSN`,`citizen`.`C_Name` AS `Name` from ((`citizen` join `is active in` on((`citizen`.`Social Security Number` = `is active in`.`Social Security Number`))) join `social group` on((`social group`.`S_Name` = `is active in`.`S_Name`))) where (`social group`.`Polarization Index` > 0.7) */;
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

-- Dump completed on 2021-12-20 20:12:06
