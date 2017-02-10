CREATE DATABASE  IF NOT EXISTS `bdmaratonoo2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bdmaratonoo2`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: bdmaratonoo2
-- ------------------------------------------------------
-- Server version	5.5.31

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `codCategoria` varchar(8) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `distancia` int(11) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `edadDesde` int(11) NOT NULL,
  `edadHasta` int(11) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'10KF1824','10K Mujeres de 18 a 21 Años',10,'F',18,21),(2,'10KM1824','10K Varones de 18 a 21 Años',10,'M',18,21),(3,'21KF1824','21K Mujeres de 18 a 21 Años',21,'F',18,21),(4,'21KM1824','21K Varones de 18 a 21 Años',21,'M',18,21),(5,'10KF2529','10K Mujeres de 25 a 29 Años',10,'F',25,29),(6,'10KM2529','10K Varones de 25 a 29 Años',10,'M',25,29),(7,'21KF2529','21K Mujeres de 25 a 29 Años',21,'F',25,29),(8,'21KM2529','21K Varones de 25 a 29 Años',21,'M',25,29);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corredor`
--

DROP TABLE IF EXISTS `corredor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corredor` (
  `idCorredor` int(11) NOT NULL AUTO_INCREMENT,
  `dni` int(11) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `sexo` varchar(1) NOT NULL,
  PRIMARY KEY (`idCorredor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corredor`
--

LOCK TABLES `corredor` WRITE;
/*!40000 ALTER TABLE `corredor` DISABLE KEYS */;
INSERT INTO `corredor` VALUES (1,11111111,'Elizondo','Diego Fernando','1997-09-10','M'),(2,22222222,'Rosemberg','Maria','1996-12-28','F'),(3,33333333,'Rivero','Marcelo Sebastian','1995-12-11','M'),(4,44444444,'Aguilar','Daniel','1997-08-10','M'),(5,55555555,'Gatica','María Belen','1996-12-27','F'),(6,66666666,'Urrutia','Alejandro','1995-12-11','M');
/*!40000 ALTER TABLE `corredor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion`
--

DROP TABLE IF EXISTS `inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscripcion` (
  `idInscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `fechaHoraSalida` datetime DEFAULT NULL,
  `fechaHoraLLegada` datetime DEFAULT NULL,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`idInscripcion`),
  KEY `fk_inscripcion_categoria_idx` (`idCategoria`),
  CONSTRAINT `fk_inscripcion_corredor` FOREIGN KEY (`idInscripcion`) REFERENCES `corredor` (`idCorredor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscripcion_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion`
--

LOCK TABLES `inscripcion` WRITE;
/*!40000 ALTER TABLE `inscripcion` DISABLE KEYS */;
INSERT INTO `inscripcion` VALUES (1,'2016-12-04 10:15:20','2016-12-04 11:18:30',2),(2,'2016-12-04 10:17:20','2016-12-04 11:37:43',1),(3,'2016-12-04 10:36:42','2016-12-04 11:52:59',4);
/*!40000 ALTER TABLE `inscripcion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-11  1:19:04
