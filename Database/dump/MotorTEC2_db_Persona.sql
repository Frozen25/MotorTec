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
-- Table structure for table `Persona`
--

DROP TABLE IF EXISTS `Persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Ubicacion_idUbicacion` int(11) NOT NULL,
  PRIMARY KEY (`idPersona`),
  KEY `fk_Persona_Ubicacion1_idx` (`Ubicacion_idUbicacion`),
  CONSTRAINT `fk_Persona_Ubicacion1` FOREIGN KEY (`Ubicacion_idUbicacion`) REFERENCES `Ubicacion` (`idUbicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Persona`
--

LOCK TABLES `Persona` WRITE;
/*!40000 ALTER TABLE `Persona` DISABLE KEYS */;
INSERT INTO Persona (Cedula, Nombre, Apellido, Ubicacion_idUbicacion ) VALUES 
  ( 978311857, 'Hououin', 'Kyouma', 1),
  ( 883372238, 'Oneida', 'Concannon', 2),
  ( 651085524, 'Silvana', 'Amparan', 1),
  ( 740439623, 'Jani', 'Schmautz', 2),
  ( 705073854, 'Dion', 'Brixner', 1),
  ( 658305348, 'Lisha', 'Snellenberger', 1),
  ( 258700507, 'Renata', 'Viger', 2),
  ( 382767179, 'Kiera', 'Piros', 1),
  ( 304029809, 'Lezlie', 'Barkhurst', 1),
  ( 572807875, 'Lien', 'Drivas', 2),
  ( 676456755, 'Elmer', 'Alquijay', 2),
  ( 146156797, 'Tommy', 'Mandahl', 1),
  ( 987797211, 'Keith', 'Pezzulo', 2),
  ( 779691542, 'Lonnie', 'Olives', 1),
  ( 835737039, 'Donald', 'Mellage', 1),
  ( 720450350, 'Kenneth', 'Mortimore', 1),
  ( 429056694, 'Jenell', 'Nitka', 2),
  ( 681836723, 'Neely', 'Roark', 2),
  ( 605275203, 'Crysta', 'Wentland', 2),
  ( 683336700, 'Mayuri', 'Shiina', 1),
  ( 606675200, 'Kurisutina', 'Makise', 2)
  ;

/*!40000 ALTER TABLE `Persona` ENABLE KEYS */;
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
