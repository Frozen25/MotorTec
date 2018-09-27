-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: MotorTEC2_db
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

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
-- Table structure for table `Reparacion`
--

DROP TABLE IF EXISTS `Reparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reparacion` (
  `idReparacion` int(11) NOT NULL AUTO_INCREMENT,
  `Carro_idCarro` int(11) NOT NULL,
  `Taller_idTaller` int(11) NOT NULL,
  PRIMARY KEY (`idReparacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reparacion`
--

LOCK TABLES `Reparacion` WRITE;
/*!40000 ALTER TABLE `Reparacion` DISABLE KEYS */;
INSERT INTO `Reparacion` (idReparacion, Carro_idCarro, Taller_idTaller) VALUES 
	(1, 1,1),
	(2, 2,1),	
	(3, 3,1),
	(4, 4,1),
	(5, 5,1),
	(6, 6,1),
	(7, 7,1),
	(8, 8,1),
	(9, 9,1),
	(10, 10,1),
	(11, 11,1),
	(12, 12,1),
	(13, 13,1),
	(14, 14,1),
	(15, 15,1),
	(16, 16,1),
	(17, 17,1),
	(18, 18,1),
	(19, 19,1),
	(20, 20,1),
	(21, 21,1),
	(22, 22,1),
	(23, 23,1),
	(24, 24,1),
	(25, 25,1),
	(26, 26,1),
	(27, 27,1),
	(28, 28,1),
	(29, 29,1),
	(30, 30,1),
	(31, 31,2),
	(32, 32,2),
	(33, 33,2),
	(34, 34,2),
	(35, 35,2),
	(36, 36,2),
	(37, 37,2),
	(38, 38,2),
	(39, 39,2),
	(40, 40,2),
	(41, 41,2),
	(42, 42,2),
	(43, 43,2),
	(44, 44,2),
	(45, 45,2),
	(46, 46,2),
	(47, 47,2),
	(48, 48,2),
	(49, 49,2),
	(50, 50,2),

	/*AGREGAR OTRAS REPARACIONES A LOS PRIMEROS DOS CARROS CARRO*/
	(51, 1,1),
	(52, 1,1),
	(53, 2,1),
	(54, 2,1);
	
/*!40000 ALTER TABLE `Reparacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-26 17:43:54
