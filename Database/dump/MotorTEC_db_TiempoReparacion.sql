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
-- Table structure for table `TiempoReparacion`
--

DROP TABLE IF EXISTS `TiempoReparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TiempoReparacion` (
  `idTiempoReparacion` int(11) NOT NULL AUTO_INCREMENT,
  `HoraInicio` datetime DEFAULT NULL,
  `HoraFin` datetime DEFAULT NULL,
  `Reparacion_idReparacion` int(11) NOT NULL,
  `Mecanico_idMecanico` int(11) NOT NULL,
  PRIMARY KEY (`idTiempoReparacion`),
  KEY `fk_TiempoReparacion_Reparacion1_idx` (`Reparacion_idReparacion`),
  KEY `fk_TiempoReparacion_Mecanico1_idx` (`Mecanico_idMecanico`),
  CONSTRAINT `fk_TiempoReparacion_Mecanico1` FOREIGN KEY (`Mecanico_idMecanico`) REFERENCES `Mecanico` (`idMecanico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TiempoReparacion_Reparacion1` FOREIGN KEY (`Reparacion_idReparacion`) REFERENCES `Reparacion` (`idReparacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TiempoReparacion`
--

LOCK TABLES `TiempoReparacion` WRITE;
/*!40000 ALTER TABLE `TiempoReparacion` DISABLE KEYS */;
INSERT INTO TiempoReparacion (HoraInicio, HoraFin, Reparacion_idReparacion, Mecanico_idMecanico) VALUES 
  ( '2015-05-01 14:47:40' , '2015-05-01 15:47:40' , 1, 3 ),
  ( '2015-05-01 14:47:40' , '2015-05-01 15:47:40' , 2, 1 ),
  ( '2015-05-01 14:47:40' , '2015-05-01 15:47:40' , 3, 4 ),
  ( '2015-05-01 14:47:40' , '2015-05-01 15:47:40' , 4, 3 ),
  ( '2015-05-01 14:47:40' , '2015-05-01 15:47:40' , 5, 4 ),
  ( '2015-05-01 14:47:40' , '2015-05-01 15:47:40' , 6, 2 ),
  ( '2015-05-01 14:47:40' , '2015-05-01 15:47:40' , 7, 4 ),
  ( '2015-05-01 14:47:40' , '2015-05-01 15:47:40' , 8, 4 ),
  ( '2015-05-01 14:47:40' , '2015-05-01 15:47:40' , 9, 1 ),
  ( '2015-05-01 14:47:40' , '2015-05-01 15:47:40' , 10, 2 ),
  

  ( '2015-05-02 10:47:40' , '2015-05-02 13:47:40' , 1, 2 ),
  ( '2015-05-02 10:47:40' , '2015-05-02 13:47:40' , 2, 1 ),
  ( '2015-05-02 10:47:40' , '2015-05-02 13:47:40' , 3, 3 ),
  ( '2015-05-02 10:47:40' , '2015-05-02 13:47:40' , 4, 3 ),
  ( '2015-05-02 10:47:40' , '2015-05-02 13:47:40' , 5, 3 ),
  ( '2015-05-02 10:47:40' , '2015-05-02 13:47:40' , 6, 2 ),
  ( '2015-05-02 10:47:40' , '2015-05-02 13:47:40' , 7, 4 ),
  ( '2015-05-02 10:47:40' , '2015-05-02 13:47:40' , 8, 3 ),
  ( '2015-05-02 10:47:40' , '2015-05-02 13:47:40' , 9, 3 ),
  ( '2015-05-02 10:47:40' , '2015-05-02 13:47:40' , 10, 2 ),
  

  ( '2015-05-01 9:47:40' , '2015-05-01 14:47:40' , 31, 7 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 12:47:40' , 32, 10 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 11:47:40' , 33, 8 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 12:47:40' , 34, 5 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 11:47:40' , 35, 7 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 13:47:40' , 36, 7 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 14:47:40' , 37, 7 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 13:47:40' , 38, 8 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 10:47:40' , 39, 5 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 11:47:40' , 40, 8 ),
  

  ( '2015-05-01 9:47:40' , '2015-05-01 10:47:40' , 31, 7 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 13:47:40' , 32, 5 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 14:47:40' , 33, 8 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 14:47:40' , 34, 7 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 11:47:40' , 35, 5 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 10:47:40' , 36, 5 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 10:47:40' , 37, 10 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 12:47:40' , 38, 7 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 10:47:40' , 39, 10 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 12:47:40' , 40, 7 ),
  

  ( '2015-05-01 9:47:40' , '2015-05-01 12:47:40' , 31, 6 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 11:47:40' , 32, 5 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 10:47:40' , 33, 5 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 12:47:40' , 34, 8 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 12:47:40' , 35, 6 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 10:47:40' , 36, 5 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 11:47:40' , 37, 5 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 10:47:40' , 38, 10 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 12:47:40' , 39, 6 ),
  ( '2015-05-01 9:47:40' , '2015-05-01 11:47:40' , 40, 8 )
  ;
  
/*!40000 ALTER TABLE `TiempoReparacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-26 17:43:53
