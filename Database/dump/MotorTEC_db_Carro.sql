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
INSERT INTO `Carro` ( idCarro ,Matricula, Modelo, Color, Kilometraje, Concesionario_idConcesionario, Estado_idEstado, Marca_idMarca, Cliente_idCliente) VALUES 
                            
                            (1 ,'AAA001', 'Rooster', 'Rojo', 84123, 1, 3, 3, 2),
                            (2 ,'AAA002', 'Rooster', 'Rojo', 20894, 1, 3, 3, 2),
                            (3 ,'AAA003', 'Rooster', 'Rojo', 80109, 1, 3, 3, 2),
                            (4 ,'AAA004', 'Rooster', 'Rojo', 12765, 1, 3, 3, 2),
                            (5 ,'AAA005', 'Rooster', 'Rojo', 91022, 1, 3, 3, 2),                            
                            (7 ,'AAA007', 'Rooster', 'Rojo', 12642, 1, 3, 3, 2),
                            (8 ,'AAA008', 'Rooster', 'Rojo', 10334, 1, 3, 3, 2),
                            (9 ,'AAA009', 'Rooster', 'Rojo', 45647, 1, 3, 3, 2),
                            (10 ,'AAA010', 'Rooster', 'Rojo', 87722, 1, 3, 3, 2),
                            (11 ,'AAA011', 'Rooster', 'Azul', 14481, 1, 3, 3, 2),
                            (12 ,'AAA012', 'Rooster', 'Azul', 21968, 1, 3, 3, 2),
                            (13 ,'AAA013', 'Rooster', 'Azul', 36468, 1, 3, 3, 2),
                            (14 ,'AAA014', 'Rooster', 'Azul', 62709, 1, 3, 3, 2),
                            (15 ,'AAA015', 'Rooster', 'Azul', 21595, 1, 3, 3, 2),
                            (16 ,'AAA016', 'Rooster', 'Azul', 53256, 1, 3, 3, 2),
                            (17 ,'AAA017', 'Rooster', 'Azul', 34506, 1, 3, 3, 2),
                            (18 ,'AAA018', 'Rooster', 'Azul', 66077, 1, 3, 3, 2),
                            (19 ,'AAA019', 'Rooster', 'Azul', 35743, 1, 3, 3, 2),
                            (20 ,'AAA020', 'Rooster', 'Azul', 23138, 1, 3, 3, 2),
                            (21 ,'AAA021', 'Rooster', 'Amarillo', 77483, 1, 3, 3, 3),
                            (22 ,'AAA022', 'Rooster', 'Amarillo', 57783, 1, 3, 3, 3),
                            (23 ,'AAA023', 'Rooster', 'Amarillo', 17204, 1, 3, 3, 3),
                            (24 ,'AAA024', 'Rooster', 'Amarillo', 49239, 1, 3, 3, 3),
                            (25 ,'AAA025', 'Rooster', 'Amarillo', 82413, 1, 3, 3, 3),
                            (26 ,'AAA026', 'Rooster', 'Amarillo', 82315, 1, 3, 3, 3),
                            (27 ,'AAA027', 'Rooster', 'Amarillo', 14765, 1, 3, 3, 3),
                            (28 ,'AAA028', 'Rooster', 'Amarillo', 53909, 1, 3, 3, 3),
                            (29 ,'AAA029', 'Rooster', 'Amarillo', 40169, 1, 3, 3, 3),
                            (30 ,'AAA030', 'Rooster', 'Amarillo', 33191, 1, 3, 3, 3),
                            (31 ,'AAA031', 'Rooster', 'Naranja', 80294, 2, 3, 3, 2),
                            (32 ,'AAA032', 'Rooster', 'Naranja', 59344, 2, 3, 3, 2),
                            (33 ,'AAA033', 'Rooster', 'Naranja', 39042, 2, 3, 3, 2),
                            (34 ,'AAA034', 'Rooster', 'Naranja', 44098, 2, 3, 3, 2),
                            (35 ,'AAA035', 'Rooster', 'Naranja', 54489, 2, 3, 3, 2),
                            (36 ,'AAA036', 'Rooster', 'Naranja', 67165, 2, 3, 3, 2),
                            (37 ,'AAA037', 'Rooster', 'Naranja', 56803, 2, 3, 3, 2),
                            (38 ,'AAA038', 'Rooster', 'Naranja', 43940, 2, 3, 3, 2),
                            (39 ,'AAA039', 'Rooster', 'Naranja', 61557, 2, 3, 3, 2),
                            (40 ,'AAA040', 'Rooster', 'Naranja', 76172, 2, 3, 3, 2),
                            (41 ,'AAA041', 'Rooster', 'Negro', 62751, 2, 3, 3, 3),
                            (42 ,'AAA042', 'Rooster', 'Negro', 84743, 2, 3, 3, 3),
                            (43 ,'AAA043', 'Rooster', 'Negro', 12474, 2, 3, 3, 3),
                            (44 ,'AAA044', 'Rooster', 'Negro', 99880, 2, 3, 3, 3),
                            (45 ,'AAA045', 'Rooster', 'Negro', 56285, 2, 3, 3, 3),
                            (46 ,'AAA046', 'Rooster', 'Negro', 12743, 2, 3, 3, 3),
                            (47 ,'AAA047', 'Rooster', 'Negro', 92821, 2, 3, 3, 3),
                            (48 ,'AAA048', 'Rooster', 'Negro', 14235, 2, 3, 3, 3),
                            (49 ,'AAA049', 'Rooster', 'Negro', 25742, 2, 3, 3, 3),
                            (50 ,'AAA050', 'Rooster', 'Negro', 46824, 2, 3, 3, 3),

                            (51 ,'AAA051', 'Santa Fe', 'Negro', 0, 1, 1, 1, NULL),
                            (52 ,'AAA052', 'Civic', 'Negro', 84743, 1, 2, 2, NULL),
                            (53 ,'AAA053', 'Santa Fe', 'Negro', 0, 1, 1, 1, NULL),
                            (54 ,'AAA054', 'Civic', 'Negro', 99880, 1, 2, 2, NULL),
                            (55 ,'AAA055', 'Santa Fe', 'Negro', 0, 1, 1, 1, NULL),
                            
                            (56 ,'AAA056', 'Civic', 'Negro', 12743, 2, 2, 2, NULL),
                            (57 ,'AAA057', 'Santa Fe', 'Negro', 0, 2, 1, 1, NULL),
                            (58 ,'AAA058', 'Civic', 'Negro', 14235, 2, 2, 2, NULL),
                            (59 ,'AAA059', 'Santa Fe', 'Negro', 0, 2, 1, 1, NULL),
                            (60 ,'AAA060', 'Civic', 'Negro', 46824, 2, 2, 2, NULL);

/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
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
