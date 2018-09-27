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
INSERT INTO `Carro` (Matricula, Modelo, Color, Kilometraje, Concesionario_idConcesionario, Estado_idEstado, Marca_idMarca, Cliente_idCliente) VALUES 
                            
                            ('AAA001', 'Roadster', 'Rojo', 84123, 1, 3, 3, 12),
                            ('AAA002', 'Roadster', 'Rojo', 20894, 1, 3, 3, 12),
                            ('AAA003', 'Roadster', 'Rojo', 80109, 1, 3, 3, 12),
                            ('AAA004', 'Roadster', 'Rojo', 12765, 1, 3, 3, 12),
                            ('AAA005', 'Roadster', 'Rojo', 91022, 1, 3, 3, 12),
                            ('AAA006', 'Roadster', 'Rojo', 64888, 1, 3, 3, 12),
                            ('AAA007', 'Roadster', 'Rojo', 12642, 1, 3, 3, 12),
                            ('AAA008', 'Roadster', 'Rojo', 10334, 1, 3, 3, 12),
                            ('AAA009', 'Roadster', 'Rojo', 45647, 1, 3, 3, 12),
                            ('AAA010', 'Roadster', 'Rojo', 87722, 1, 3, 3, 12),
                            ('AAA011', 'Roadster', 'Azul', 14481, 1, 3, 3, 12),
                            ('AAA012', 'Roadster', 'Azul', 21968, 1, 3, 3, 12),
                            ('AAA013', 'Roadster', 'Azul', 36468, 1, 3, 3, 12),
                            ('AAA014', 'Roadster', 'Azul', 62709, 1, 3, 3, 12),
                            ('AAA015', 'Roadster', 'Azul', 21595, 1, 3, 3, 12),
                            ('AAA016', 'Roadster', 'Azul', 53256, 1, 3, 3, 12),
                            ('AAA017', 'Roadster', 'Azul', 34506, 1, 3, 3, 12),
                            ('AAA018', 'Roadster', 'Azul', 66077, 1, 3, 3, 12),
                            ('AAA019', 'Roadster', 'Azul', 35743, 1, 3, 3, 12),
                            ('AAA020', 'Roadster', 'Azul', 23138, 1, 3, 3, 1),
                            ('AAA021', 'Roadster', 'Amarillo', 77483, 1, 3, 3, 13),
                            ('AAA022', 'Roadster', 'Amarillo', 57783, 1, 3, 3, 13),
                            ('AAA023', 'Roadster', 'Amarillo', 17204, 1, 3, 3, 13),
                            ('AAA024', 'Roadster', 'Amarillo', 49239, 1, 3, 3, 13),
                            ('AAA025', 'Roadster', 'Amarillo', 82413, 1, 3, 3, 13),
                            ('AAA026', 'Roadster', 'Amarillo', 82315, 1, 3, 3, 13),
                            ('AAA027', 'Roadster', 'Amarillo', 14765, 1, 3, 3, 13),
                            ('AAA028', 'Roadster', 'Amarillo', 53909, 1, 3, 3, 13),
                            ('AAA029', 'Roadster', 'Amarillo', 40169, 1, 3, 3, 13),
                            ('AAA030', 'Roadster', 'Amarillo', 33191, 1, 3, 3, 13),
                            ('AAA031', 'Roadster', 'Naranja', 80294, 2, 3, 3, 12),
                            ('AAA032', 'Roadster', 'Naranja', 59344, 2, 3, 3, 12),
                            ('AAA033', 'Roadster', 'Naranja', 39042, 2, 3, 3, 12),
                            ('AAA034', 'Roadster', 'Naranja', 44098, 2, 3, 3, 12),
                            ('AAA035', 'Roadster', 'Naranja', 54489, 2, 3, 3, 12),
                            ('AAA036', 'Roadster', 'Naranja', 67165, 2, 3, 3, 12),
                            ('AAA037', 'Roadster', 'Naranja', 56803, 2, 3, 3, 12),
                            ('AAA038', 'Roadster', 'Naranja', 43940, 2, 3, 3, 12),
                            ('AAA039', 'Roadster', 'Naranja', 61557, 2, 3, 3, 12),
                            ('AAA040', 'Roadster', 'Naranja', 76172, 2, 3, 3, 12),
                            ('AAA041', 'Roadster', 'Negro', 62751, 2, 3, 3, 13),
                            ('AAA042', 'Roadster', 'Negro', 84743, 2, 3, 3, 13),
                            ('AAA043', 'Roadster', 'Negro', 12474, 2, 3, 3, 13),
                            ('AAA044', 'Roadster', 'Negro', 99880, 2, 3, 3, 13),
                            ('AAA045', 'Roadster', 'Negro', 56285, 2, 3, 3, 13),
                            ('AAA046', 'Roadster', 'Negro', 12743, 2, 3, 3, 13),
                            ('AAA047', 'Roadster', 'Negro', 92821, 2, 3, 3, 13),
                            ('AAA048', 'Roadster', 'Negro', 14235, 2, 3, 3, 13),
                            ('AAA049', 'Roadster', 'Negro', 25742, 2, 3, 3, 13),
                            ('AAA050', 'Roadster', 'Negro', 46824, 2, 3, 3, 13),

                            ('AAA051', 'Santa Fe', 'Negro', 62751, 1, 1, 1, NULL),
                            ('AAA052', 'Civic', 'Negro', 84743, 1, 2, 2, NULL),
                            ('AAA053', 'Santa Fe', 'Negro', 12474, 1, 1, 1, NULL),
                            ('AAA054', 'Civic', 'Negro', 99880, 1, 2, 2, NULL),
                            ('AAA055', 'Santa Fe', 'Negro', 56285, 1, 1, 1, NULL),
                            ('AAA056', 'Civic', 'Negro', 12743, 2, 2, 2, NULL),
                            ('AAA057', 'Santa Fe', 'Negro', 92821, 2, 1, 1, NULL),
                            ('AAA058', 'Civic', 'Negro', 14235, 2, 2, 2, NULL),
                            ('AAA059', 'Santa Fe', 'Negro', 25742, 2, 1, 1, NULL),
                            ('AAA060', 'Civic', 'Negro', 46824, 2, 2, 2, NULL);
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
