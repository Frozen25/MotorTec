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
-- Table structure for table `Carro`
--

DROP TABLE IF EXISTS `Carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Carro` (
  `idCarro` int(11) NOT NULL AUTO_INCREMENT,
  `Matricula` varchar(6) DEFAULT NULL,
  `Modelo` varchar(45) NOT NULL,
  `Color` varchar(45) NOT NULL,
  `Kilometraje` int(10) unsigned zerofill NOT NULL,
  `Concesionario_idConcesionario` int(11) NOT NULL,
  `Estado_idEstado` int(11) NOT NULL,
  `Marca_idMarca` int(11) NOT NULL,
  `Cliente_idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCarro`),
  KEY `fk_Carro_Concesionario1_idx` (`Concesionario_idConcesionario`),
  KEY `fk_Carro_Estado1_idx` (`Estado_idEstado`),
  KEY `fk_Carro_Marca1_idx` (`Marca_idMarca`),
  KEY `fk_Carro_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_Carro_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carro_Concesionario1` FOREIGN KEY (`Concesionario_idConcesionario`) REFERENCES `Concesionario` (`idConcesionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carro_Estado1` FOREIGN KEY (`Estado_idEstado`) REFERENCES `Estado` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carro_Marca1` FOREIGN KEY (`Marca_idMarca`) REFERENCES `Marca` (`idMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carro`
--

LOCK TABLES `Carro` WRITE;
/*!40000 ALTER TABLE `Carro` DISABLE KEYS */;
INSERT INTO `Carro` VALUES (1,NULL,'Elantra','Azul',0000000000,1,1,1,NULL),(2,'BJT099','Elantra','Azul',0000000000,1,2,1,NULL),(3,NULL,'Tucson','Blanco',0000000000,2,1,1,NULL),(4,'THV453','Tucson','Blanco',0000000000,2,2,1,NULL),(5,NULL,'Santa Fe','Azul',0000000000,1,1,1,NULL);
/*!40000 ALTER TABLE `Carro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-26 17:43:55
