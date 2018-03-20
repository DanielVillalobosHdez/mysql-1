-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: GuardiaCivil
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.17.10.1

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
-- Table structure for table `asesores`
--

DROP TABLE IF EXISTS `asesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asesores` (
  `DNI_PERSONA` varchar(9) NOT NULL,
  `Especialidad` varchar(255) DEFAULT NULL,
  `Siglas_UNIDAD` varchar(4) DEFAULT NULL,
  `Localizacion_UNIDAD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DNI_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesores`
--

LOCK TABLES `asesores` WRITE;
/*!40000 ALTER TABLE `asesores` DISABLE KEYS */;
INSERT INTO `asesores` VALUES ('02234263B','INFORMÁTICA','GDT','BARCELONA'),('03111969M','CONTABILIDAD','SFGC','ANDALUCÍA'),('08041996A','BANDAS','SIGC','MADRID'),('14785236C','FÍSICA','NRBQ','VALENCIA'),('63258741X','CRIMINOLOGÍA','UCO','MADRID');
/*!40000 ALTER TABLE `asesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casa_cuartel`
--

DROP TABLE IF EXISTS `casa_cuartel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casa_cuartel` (
  `localizacion` varchar(255) NOT NULL,
  PRIMARY KEY (`localizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casa_cuartel`
--

LOCK TABLES `casa_cuartel` WRITE;
/*!40000 ALTER TABLE `casa_cuartel` DISABLE KEYS */;
INSERT INTO `casa_cuartel` VALUES ('Av.Madrid,2,28670 Villaviciosa de Odón, Madrid'),('Calle de las Lilas,7,28933 Móstoles, Madrid'),('Calle de Siguenza,1,28804 Alcala de Henares, Madrid'),('Calle Fuenlabrada,42,28901 Getafe, Madrid'),('Calle Ubaldo Rodríguez,13,47480 Fresno el Viejo, Valladolid');
/*!40000 ALTER TABLE `casa_cuartel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardia`
--

DROP TABLE IF EXISTS `guardia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guardia` (
  `DNI_PERSONA` varchar(9) NOT NULL,
  `rango` varchar(255) DEFAULT NULL,
  `Siglas_UNIDAD` varchar(4) DEFAULT NULL,
  `Localizacion_UNIDAD` varchar(255) DEFAULT NULL,
  `ID_VEHICULO` int(11) DEFAULT NULL,
  `Localizacion_CASACUARTEL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DNI_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardia`
--

LOCK TABLES `guardia` WRITE;
/*!40000 ALTER TABLE `guardia` DISABLE KEYS */;
INSERT INTO `guardia` VALUES ('04091997D','TENIENTE','GRS','VALENCIA',3,'Plaza Diputación, 2, 03130 Santa Pola, Alicante'),('09068090J','CORONEL','NRBQ','ALICANTE',1,'Avinguda de la Costa Blnaca, 22A, 03540 Alacant'),('09068747P','CABO','UCO','MADRID',2,'C/ SALINAS DEL ROSIO,33'),('09069748D','SUBTENIENTE','UEI','MADRID',NULL,'CRTA.ANDALUCIA KM.25,200'),('14881844H','GENERAL','GAR','BILBAO',5,'Ercilla Kalea, 37-39, 48011 Bilbo, Bizkaia');
/*!40000 ALTER TABLE `guardia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitacion` (
  `Localizacion_CASACUARTEL` varchar(255) NOT NULL,
  `Tipo_HABITACION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Localizacion_CASACUARTEL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
INSERT INTO `habitacion` VALUES ('Av.Madrid,2,28670 Villaviciosa de Odón, Madrid','FAMILIAR'),('Calle de las Lilas,7,28933 Móstoles, Madrid','DOBLE'),('Calle de Siguenza,1,28804 Alcala de Henares, Madrid','DOBLE'),('Calle Fuenlabrada,42,28901 Getafe, Madrid','INDIVIDUAL'),('Calle Ubaldo Rodríguez,13,47480 Fresno el Viejo, Valladolid','FAMILIAR');
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `DNI` varchar(9) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('02234263B','Francisco Javier','Girón y Ezpeleta'),('08072627Z','Antonio','Tejero'),('09069748D','Antonio','Recio'),('14881844H','Francisco','Quintana'),('19391936G','Carla','De la Vega');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_ext`
--

DROP TABLE IF EXISTS `personal_ext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_ext` (
  `DNI_PERSONA` varchar(9) NOT NULL,
  `servicio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DNI_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_ext`
--

LOCK TABLES `personal_ext` WRITE;
/*!40000 ALTER TABLE `personal_ext` DISABLE KEYS */;
INSERT INTO `personal_ext` VALUES ('08072627Z','LIMPIADOR'),('12345678A','PSICOLOGÍA'),('19391936G','LIMPIADORA'),('21011999C','COCINERO'),('87654321Z','RESTAURADOR');
/*!40000 ALTER TABLE `personal_ext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad` (
  `siglas` varchar(4) NOT NULL,
  `localizacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`siglas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
INSERT INTO `unidad` VALUES ('GAR','Guipúzcoa'),('GDT','Bilbao'),('GRS','Barcelona'),('NRBQ','Madrid'),('UEI','Madrid');
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(20) DEFAULT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `matricula` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (1,'TOYOTA','RAV4','0504PGC'),(2,'AUDI','Q3','1492PGC'),(3,'CITROEN','C4','1488PGC'),(4,'BMW','X3','1844PGC'),(5,'LAMBORGHINI','VENENO','1997PGC');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-04 14:10:30
