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
-- Table structure for table `Factura`
--

DROP TABLE IF EXISTS `Factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `Monto` int(11) NOT NULL,
  `Compra` tinyint(1) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Carro_idCarro` int(11) NOT NULL,
  `Concesionario_idConcesionario` int(11) NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `fk_Compra_Concesionario1_idx` (`Concesionario_idConcesionario`),
  CONSTRAINT `fk_Compra_Concesionario1` FOREIGN KEY (`Concesionario_idConcesionario`) REFERENCES `Concesionario` (`idConcesionario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Factura`
--

LOCK TABLES `Factura` WRITE;
/*!40000 ALTER TABLE `Factura` DISABLE KEYS */;
INSERT INTO Factura (idFactura, Monto, Compra, Fecha, Carro_idCarro, Concesionario_idConcesionario) VALUES 
	(1 , 2213424 , 0, '2010-01-26 21:04:22', 1, 1),
	(2 , 8223253 , 0, '2010-01-26 21:04:22', 2, 1),
	(3 , 3062397 , 0, '2010-01-26 21:04:22', 3, 1),
	(4 , 1960423 , 0, '2010-01-26 21:04:22', 4, 1),
	(5 , 3441284 , 0, '2010-01-26 21:04:22', 5, 1),
	(6 , 4252613 , 0, '2010-01-26 21:04:22', 6, 1),
	(7 , 6311552 , 0, '2010-01-26 21:04:22', 7, 1),
	(8 , 1759670 , 0, '2010-01-26 21:04:22', 8, 1),
	(9 , 5813993 , 0, '2010-01-26 21:04:22', 9, 1),
	(10 , 6633526 , 0, '2010-01-26 21:04:22', 10, 1),

	(11 , 6232246 , 0, '2010-01-26 21:04:22', 11, 1),
	(12 , 5229298 , 0, '2010-01-26 21:04:22', 12, 1),
	(13 , 8235784 , 0, '2010-01-26 21:04:22', 13, 1),
	(14 , 7477953 , 0, '2010-01-26 21:04:22', 14, 1),
	(15 , 8927231 , 0, '2010-01-26 21:04:22', 15, 1),
	(16 , 7822044 , 0, '2010-01-26 21:04:22', 16, 1),
	(17 , 7823118 , 0, '2010-01-26 21:04:22', 17, 1),
	(18 , 5644022 , 0, '2010-01-26 21:04:22', 18, 1),
	(19 , 3824243 , 0, '2010-01-26 21:04:22', 19, 1),
	(20 , 7276257 , 0, '2010-01-26 21:04:22', 20, 1),
	
	(21 , 1314451 , 0, '2010-01-26 21:04:22', 21, 1),
	(22 , 6719980 , 0, '2010-01-26 21:04:22', 22, 1),
	(23 , 4669401 , 0, '2010-01-26 21:04:22', 23, 1),
	(24 , 1393318 , 0, '2010-01-26 21:04:22', 24, 1),
	(25 , 4519002 , 0, '2010-01-26 21:04:22', 25, 1),
	(26 , 3924207 , 0, '2010-01-26 21:04:22', 26, 1),
	(27 , 6537248 , 0, '2010-01-26 21:04:22', 27, 1),
	(28 , 8818784 , 0, '2010-01-26 21:04:22', 28, 1),
	(29 , 8913915 , 0, '2010-01-26 21:04:22', 29, 1),
	(30 , 4713620 , 0, '2010-01-26 21:04:22', 30, 1),
	
	

	(31 , 6567249 , 0, '2010-01-26 21:04:22', 31, 2),
	(32 , 4197765 , 0, '2010-01-26 21:04:22', 32, 2),
	(33 , 4098453 , 0, '2010-01-26 21:04:22', 33, 2),
	(34 , 3770599 , 0, '2010-01-26 21:04:22', 34, 2),
	(35 , 7822314 , 0, '2010-01-26 21:04:22', 35, 2),
	(36 , 1116203 , 0, '2010-01-26 21:04:22', 36, 2),
	(37 , 8441708 , 0, '2010-01-26 21:04:22', 37, 2),
	(38 , 2227962 , 0, '2010-01-26 21:04:22', 38, 2),
	(39 , 8147654 , 0, '2010-01-26 21:04:22', 39, 2),
	(40 , 5908183 , 0, '2010-01-26 21:04:22', 40, 2),
	
	(41 , 2580119 , 0, '2010-01-26 21:04:22', 41, 2),
	(42 , 5496304 , 0, '2010-01-26 21:04:22', 42, 2),
	(43 , 8286128 , 0, '2010-01-26 21:04:22', 43, 2),
	(44 , 6702384 , 0, '2010-01-26 21:04:22', 44, 2),
	(45 , 3467912 , 0, '2010-01-26 21:04:22', 45, 2),
	(46 , 1224539 , 0, '2010-01-26 21:04:22', 46, 2),
	(47 , 3832372 , 0, '2010-01-26 21:04:22', 47, 2),
	(48 , 8477556 , 0, '2010-01-26 21:04:22', 48, 2),
	(49 , 5225216 , 0, '2010-01-26 21:04:22', 49, 2),
	(50 , 1595328 , 0, '2010-01-26 21:04:22', 50, 2);
		

/*!40000 ALTER TABLE `Factura` ENABLE KEYS */;
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
