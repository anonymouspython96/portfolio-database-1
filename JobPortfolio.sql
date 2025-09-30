/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.3-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: database_creato_come_prova_del_know_how_in_SQL
-- ------------------------------------------------------
-- Server version	11.8.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Competenze`
--

DROP TABLE IF EXISTS `Competenze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Competenze` (
  `CompetenzeID` int(11) NOT NULL AUTO_INCREMENT,
  `Competenza` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CompetenzeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Competenze`
--

LOCK TABLES `Competenze` WRITE;
/*!40000 ALTER TABLE `Competenze` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Competenze` VALUES
(1,'SQL'),
(2,'Python'),
(3,'Data Analysis'),
(4,'Project Management');
/*!40000 ALTER TABLE `Competenze` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `CompetenzeDipendenti`
--

DROP TABLE IF EXISTS `CompetenzeDipendenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CompetenzeDipendenti` (
  `DipendenteID` int(11) NOT NULL,
  `CompetenzeID` int(11) NOT NULL,
  PRIMARY KEY (`DipendenteID`,`CompetenzeID`),
  KEY `CompetenzeID` (`CompetenzeID`),
  CONSTRAINT `CompetenzeDipendenti_ibfk_1` FOREIGN KEY (`DipendenteID`) REFERENCES `Dipendenti` (`DipendenteID`),
  CONSTRAINT `CompetenzeDipendenti_ibfk_2` FOREIGN KEY (`CompetenzeID`) REFERENCES `Competenze` (`CompetenzeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompetenzeDipendenti`
--

LOCK TABLES `CompetenzeDipendenti` WRITE;
/*!40000 ALTER TABLE `CompetenzeDipendenti` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `CompetenzeDipendenti` VALUES
(1,1),
(2,1),
(1,2),
(2,3),
(3,4);
/*!40000 ALTER TABLE `CompetenzeDipendenti` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Dipendenti`
--

DROP TABLE IF EXISTS `Dipendenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dipendenti` (
  `DipendenteID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) DEFAULT NULL,
  `Cognome` varchar(50) DEFAULT NULL,
  `Posizione` varchar(50) DEFAULT NULL,
  `Assunzione` date DEFAULT NULL,
  PRIMARY KEY (`DipendenteID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dipendenti`
--

LOCK TABLES `Dipendenti` WRITE;
/*!40000 ALTER TABLE `Dipendenti` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Dipendenti` VALUES
(1,'Alice','Rossi','Developer','2023-01-15'),
(2,'Marco','Bianchi','Data Analyst','2022-07-01'),
(3,'Luca','Verdi','Project Manager','2021-03-20');
/*!40000 ALTER TABLE `Dipendenti` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Progetti`
--

DROP TABLE IF EXISTS `Progetti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Progetti` (
  `ProgettoID` int(11) NOT NULL AUTO_INCREMENT,
  `NomeProgetto` varchar(100) DEFAULT NULL,
  `InizioProgetto` date DEFAULT NULL,
  `FineProgetto` date DEFAULT NULL,
  PRIMARY KEY (`ProgettoID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Progetti`
--

LOCK TABLES `Progetti` WRITE;
/*!40000 ALTER TABLE `Progetti` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Progetti` VALUES
(1,'Website Revamp','2024-01-01','2024-06-01'),
(2,'Data Dashboard','2024-03-01','2024-09-01');
/*!40000 ALTER TABLE `Progetti` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `ProgettiAssegnati`
--

DROP TABLE IF EXISTS `ProgettiAssegnati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProgettiAssegnati` (
  `DipendenteID` int(11) NOT NULL,
  `ProgettoID` int(11) NOT NULL,
  `Ruolo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DipendenteID`,`ProgettoID`),
  KEY `ProgettoID` (`ProgettoID`),
  CONSTRAINT `ProgettiAssegnati_ibfk_1` FOREIGN KEY (`DipendenteID`) REFERENCES `Dipendenti` (`DipendenteID`),
  CONSTRAINT `ProgettiAssegnati_ibfk_2` FOREIGN KEY (`ProgettoID`) REFERENCES `Progetti` (`ProgettoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProgettiAssegnati`
--

LOCK TABLES `ProgettiAssegnati` WRITE;
/*!40000 ALTER TABLE `ProgettiAssegnati` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ProgettiAssegnati` VALUES
(1,1,'Backend Developer'),
(2,2,'Data Analyst'),
(3,1,'Project Manager'),
(3,2,'Project Manager');
/*!40000 ALTER TABLE `ProgettiAssegnati` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-09-30 12:33:17
