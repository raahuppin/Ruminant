CREATE DATABASE  IF NOT EXISTS `datenbank_eshop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `datenbank_eshop`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: datenbank_eshop
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `kunden`
--

DROP TABLE IF EXISTS `kunden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kunden` (
  `idKunden` int(11) NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(45) NOT NULL,
  `Nachname` varchar(45) NOT NULL,
  `Adresse` varchar(45) NOT NULL,
  `PLZ & Stadt` varchar(45) NOT NULL,
  `Land` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Passwort` varchar(45) NOT NULL,
  PRIMARY KEY (`idKunden`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunden`
--

LOCK TABLES `kunden` WRITE;
/*!40000 ALTER TABLE `kunden` DISABLE KEYS */;
INSERT INTO `kunden` VALUES (1,'Ana-Lena','Amsler','Allmendstrasse 17','3014 Bern','Schweiz','anaamsler','anaamsler1'),(2,'Hans','Mustermann','Musterstrasse 26','5678 Zug','Schweiz','hans','hansi'),(3,'Alaska','Kanada','Zielweg 878','0012 Basel','Schweiz','alaska','alaski');
/*!40000 ALTER TABLE `kunden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkte`
--

DROP TABLE IF EXISTS `produkte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkte` (
  `idProdukte` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Bewertung` varchar(45) DEFAULT NULL,
  `Zustand` varchar(45) DEFAULT NULL,
  `Geschmack` varchar(45) DEFAULT NULL,
  `Preis in Fr.` int(11) NOT NULL,
  PRIMARY KEY (`idProdukte`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkte`
--

LOCK TABLES `produkte` WRITE;
/*!40000 ALTER TABLE `produkte` DISABLE KEYS */;
INSERT INTO `produkte` VALUES (1,'Justin Bieber','sehr gut','1x gekaut','mint',500),(2,'Katy Perry','gut','3x gekaut','cinnamon',250),(3,'DJ Ötzi','schlecht','1x gekaut','strawberry',300),(4,'Donald Trump','sehr schlecht','5x gekaut','peppermint',1000);
/*!40000 ALTER TABLE `produkte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rechnung`
--

DROP TABLE IF EXISTS `rechnung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rechnung` (
  `Kunden_idKunden` int(11) NOT NULL AUTO_INCREMENT,
  `Warenkorb_idWarenkorb` int(11) NOT NULL,
  PRIMARY KEY (`Kunden_idKunden`,`Warenkorb_idWarenkorb`),
  KEY `fk_Kunden_has_Warenkorb_Warenkorb1_idx` (`Warenkorb_idWarenkorb`),
  KEY `fk_Kunden_has_Warenkorb_Kunden1_idx` (`Kunden_idKunden`),
  CONSTRAINT `fk_Kunden_has_Warenkorb_Kunden1` FOREIGN KEY (`Kunden_idKunden`) REFERENCES `kunden` (`idKunden`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kunden_has_Warenkorb_Warenkorb1` FOREIGN KEY (`Warenkorb_idWarenkorb`) REFERENCES `warenkorb` (`idWarenkorb`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rechnung`
--

LOCK TABLES `rechnung` WRITE;
/*!40000 ALTER TABLE `rechnung` DISABLE KEYS */;
/*!40000 ALTER TABLE `rechnung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warenkorb`
--

DROP TABLE IF EXISTS `warenkorb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warenkorb` (
  `idWarenkorb` int(11) NOT NULL AUTO_INCREMENT,
  `Produkte_idProdukte` int(11) NOT NULL,
  PRIMARY KEY (`idWarenkorb`),
  KEY `fk_Warenkorb_Produkte1_idx` (`Produkte_idProdukte`),
  CONSTRAINT `fk_Warenkorb_Produkte1` FOREIGN KEY (`Produkte_idProdukte`) REFERENCES `produkte` (`idProdukte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warenkorb`
--

LOCK TABLES `warenkorb` WRITE;
/*!40000 ALTER TABLE `warenkorb` DISABLE KEYS */;
INSERT INTO `warenkorb` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `warenkorb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-03 11:09:01