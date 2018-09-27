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
-- Table structure for table `Imagen`
--

DROP TABLE IF EXISTS `Imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Imagen` (
  `idImagen` int(11) NOT NULL,
  `Link` varchar(256) NOT NULL,
  `Carro_idCarro` int(11) NOT NULL,
  PRIMARY KEY (`idImagen`),
  KEY `fk_Imagen_Carro1_idx` (`Carro_idCarro`),
  CONSTRAINT `fk_Imagen_Carro1` FOREIGN KEY (`Carro_idCarro`) REFERENCES `Carro` (`idCarro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Imagen`
--

LOCK TABLES `Imagen` WRITE;
/*!40000 ALTER TABLE `Imagen` DISABLE KEYS */;
INSERT INTO `Imagen` VALUES 
	(1,'http://www.hyundaicr.com/images/modelos-menu-nav/Elantra-thumb.png',1),
	(2,'http://www.hyundaicr.com/images/modelos-menu-nav/Elantra-thumb.png',2),
	(3,'http://www.hyundaicr.com/images/modelos-menu-nav/Tucson-thumb.png',3),
	(4,'http://www.hyundaicr.com/images/modelos-menu-nav/Tucson-thumb.png',4),
	(5,'http://www.hyundaicr.com/images/modelos/elantra/elementos/elantra-design-right-side-front-view-blue-original.jpg',1),
	(6,'http://www.hyundaicr.com/images/modelos/elantra/elementos/elantra-design-right-side-front-view-blue-original.jpg',2),
	(7,'http://www.hyundaicr.com/images/modelos-menu-nav/SantaFe-thumb.png',5)
	;
/*!40000 ALTER TABLE `Imagen` ENABLE KEYS */;
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
