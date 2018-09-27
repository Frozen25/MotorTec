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
-- Table structure for table `Mecanico`
--

DROP TABLE IF EXISTS `Mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mecanico` (
  `idMecanico` int(11) NOT NULL AUTO_INCREMENT,
  `Salario` int(11) NOT NULL,
  `Fecha_Contratacion` date NOT NULL,
  `Puesto` varchar(45) NOT NULL,
  `Taller_idTaller` int(11) NOT NULL,
  `Persona_idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idMecanico`),
  KEY `fk_Mecanico_Taller1_idx` (`Taller_idTaller`),
  KEY `fk_Mecanico_Persona1_idx` (`Persona_idPersona`),
  CONSTRAINT `fk_Mecanico_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `Persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mecanico_Taller1` FOREIGN KEY (`Taller_idTaller`) REFERENCES `Taller` (`idTaller`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mecanico`
--

LOCK TABLES `Mecanico` WRITE;
/*!40000 ALTER TABLE `Mecanico` DISABLE KEYS */;
INSERT INTO `Mecanico`  VALUES 
  (1 , 213000, '2015-01-01', 1,1),  
  (2 , 213000, '2015-01-01', 1,2),  
  (3 , 213000, '2015-01-01', 1,3),  
  (4 , 213000, '2015-01-01', 1,4),
  (5 , 213000, '2015-01-01', 2,5),
  (6 , 213000, '2015-01-01', 2,6),  
  (7 , 213000, '2015-01-01', 2,7),  
  (8 , 213000, '2015-01-01', 2,8),  
  (9 , 213000, '2015-01-01', 2,9),
  (10, 213000, '2015-01-01', 2,10)
  ;    
/*!40000 ALTER TABLE `Mecanico` ENABLE KEYS */;
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
