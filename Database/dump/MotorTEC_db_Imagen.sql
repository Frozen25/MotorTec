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
  `Carro_idCarro` int(11) DEFAULT NULL,
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
	(NULL, 'https://st2.depositphotos.com/5266903/8595/v/950/depositphotos_85958906-stock-illustration-spanner-and-screwdriver-icon.jpg' ),
	(1,'https://www.hyundaiusa.com/images/vehicles/pages/vlp/2018/santa-fe/hero/se/2018-santa-fe-se-base-becketts-black.jpg',51),
	(2,'https://www.motorbeam.com/wp-content/uploads/Hyundai-Santa-Fe-Black.jpg',51),
	(3,'https://i.ytimg.com/vi/RJF25gXm0ag/maxresdefault.jpg',51),
	(4,'https://www.hyundaiusa.com/images/vehicles/pages/vlp/2018/santa-fe/interior-hero/2018-santa-fe-ang-3-se-ult-black.jpg',51),

	(5,'https://www.hyundaiusa.com/images/vehicles/pages/vlp/2018/santa-fe/hero/se/2018-santa-fe-se-base-becketts-black.jpg',53),
	(6,'https://www.motorbeam.com/wp-content/uploads/Hyundai-Santa-Fe-Black.jpg',53),
	(7,'https://i.ytimg.com/vi/RJF25gXm0ag/maxresdefault.jpg',53),
	(8,'https://www.hyundaiusa.com/images/vehicles/pages/vlp/2018/santa-fe/interior-hero/2018-santa-fe-ang-3-se-ult-black.jpg',53),

	(9,'https://www.hyundaiusa.com/images/vehicles/pages/vlp/2018/santa-fe/hero/se/2018-santa-fe-se-base-becketts-black.jpg',55),
	(10,'https://www.motorbeam.com/wp-content/uploads/Hyundai-Santa-Fe-Black.jpg',55),
	(11,'https://i.ytimg.com/vi/RJF25gXm0ag/maxresdefault.jpg',55),
	(12,'https://www.hyundaiusa.com/images/vehicles/pages/vlp/2018/santa-fe/interior-hero/2018-santa-fe-ang-3-se-ult-black.jpg',55),

	(13,'https://www.hyundaiusa.com/images/vehicles/pages/vlp/2018/santa-fe/hero/se/2018-santa-fe-se-base-becketts-black.jpg',57),
	(14,'https://www.motorbeam.com/wp-content/uploads/Hyundai-Santa-Fe-Black.jpg',57),
	(15,'https://i.ytimg.com/vi/RJF25gXm0ag/maxresdefault.jpg',57),
	(16,'https://www.hyundaiusa.com/images/vehicles/pages/vlp/2018/santa-fe/interior-hero/2018-santa-fe-ang-3-se-ult-black.jpg',57),

	(17,'https://www.hyundaiusa.com/images/vehicles/pages/vlp/2018/santa-fe/hero/se/2018-santa-fe-se-base-becketts-black.jpg',59),
	(18,'https://www.motorbeam.com/wp-content/uploads/Hyundai-Santa-Fe-Black.jpg',59),
	(19,'https://i.ytimg.com/vi/RJF25gXm0ag/maxresdefault.jpg',59),
	(20,'https://www.hyundaiusa.com/images/vehicles/pages/vlp/2018/santa-fe/interior-hero/2018-santa-fe-ang-3-se-ult-black.jpg',59),
	

	(21,'http://crautos.com/clasificados/usados/99535498-1.jpg',52),
	(22,'http://crautos.com/clasificados/usados/99535498-2.jpg',52),

	(23,'http://crautos.com/clasificados/usados/98004085-3.jpg',54),
	(24,'http://crautos.com/clasificados/usados/98004085-2.jpg',54),

	(25,'http://crautos.com/clasificados/usados/45741453-2.jpg',56),
	(26,'http://crautos.com/clasificados/usados/45741453-1.jpg',56),

	(27,'http://crautos.com/clasificados/usados/60747881-1.jpg',58),
	(28,'http://crautos.com/clasificados/usados/60747881-2.jpg',58),

	(29,'http://crautos.com/clasificados/usados/23634696-1.jpg',60),
	(30,'http://crautos.com/clasificados/usados/23634696-2.jpg',60)
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
