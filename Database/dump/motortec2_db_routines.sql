-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: motortec2_db
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'motortec2_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `addCAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCAR`(
IN _Matricula VARCHAR(20), 
IN _Modelo VARCHAR(20),
IN _Color VARCHAR(20),
IN _kilometraje INT,
IN _csName VARCHAR(20),
IN _marcaName VARCHAR(20),
IN _imageLink VARCHAR(150),
IN _price INT,
IN _date VARCHAR(20)
)
BEGIN
	
    INSERT INTO Carro (Matricula, Modelo, Color, Kilometraje, Concesionario_idConcesionario, 
    Estado_idEstado, Marca_idMarca, Cliente_idCliente) VALUES (_Matricula, _Modelo, _Color,
    _kilometraje,
    (
		SELECT idConcesionario FROM Concesionario WHERE Nombre = _csName
    ), 2,
    (
		SELECT idMarca FROM Marca WHERE Nombre = _marcaName
    ), 
    NULL);
    
    INSERT INTO Imagen VALUES ((SELECT MAX(idImagen) + 1 FROM Imagen id), _imageLink, 
    (SELECT MAX(idCarro) FROM Carro));
    
    INSERT INTO Factura (Monto , Compra, Fecha, Concesionario_idConcesionario,  Carro_idCarro)
    VALUES (_price, 1, _date, (
		SELECT idConcesionario 
		FROM Concesionario
		WHERE Concesionario.Nombre = _csName), 
		(SELECT MAX(idCarro) FROM Carro));    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addMecanico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addMecanico`(
IN _Name VARCHAR(20),
IN _LASTNAME VARCHAR(45),
IN _ID INT,
IN _PHONE INT,
IN _EMAIL VARCHAR(45),
IN _DISTRICT INT,
IN _DESCRIPTION VARCHAR(100),
IN _TALLER INT,
IN _SALARIO INT,
IN _FECHA VARCHAR(45)
)
BEGIN

	 INSERT INTO Ubicacion(Descripcion, Distrito_idDistrito) VALUES(_DESCRIPTION, _DISTRICT);
     
     INSERT INTO Persona(Cedula, Nombre, Apellido, Telefono, Email, Ubicacion_idUbicacion)
     VALUES(_ID, _NAME, _LASTNAME, _PHONE, _EMAIL, (SELECT MAX(idUbicacion) FROM Ubicacion idUbicacion));
     
     INSERT INTO Mecanico (Salario, Fecha_Contratacion, Taller_idTaller, Persona_idPersona) VALUES 
     	( _SALARIO, _FECHA, _TALLER  , (SELECT MAX(idPersona) FROM Persona id));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addRepairTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addRepairTime`(
IN _MATRICULA VARCHAR (6),
IN _INICIO VARCHAR (20),
IN _FIN VARCHAR (20),
/*
---DATOS DEL MECANICO
*/
IN _NOMBRE VARCHAR(45),
IN _LASTNAME VARCHAR(45),
IN _ID INT
/*--matricula, hora a q hora, quien
*/
)
BEGIN

	INSERT INTO TiempoReparacion (HoraInicio, HoraFin, Reparacion_idReparacion, Mecanico_idMecanico) VALUES
		( _INICIO, _FIN,  
			(SELECT MAX(idReparacion)
				FROM Reparacion
				INNER JOIN Carro WHERE Carro.idCarro = Reparacion.Carro_idCarro AND  
					Carro.Matricula = 'AAA001'
				), 
			(SELECT idMecanico, Persona.Nombre, Persona.Cedula
				FROM Mecanico
				INNER JOIN Persona WHERE Mecanico.Persona_idPersona = Persona.idPersona 
					AND (
						(Persona.Nombre = 'Hououinj' AND Persona.Apellido = 'Kyouma')
						OR (Persona.Cedula = 978311857)
				    )
				)
			);
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addSell` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addSell`(
IN _Price INT,
IN _Date VARCHAR(20),
IN _idCar INT,
IN _idCs INT,
IN _ClientName VARCHAR(20)
)
BEGIN

	INSERT INTO Factura(Monto, Compra, Fecha, Concesionario_idConcesionario, Carro_idCarro) 
    VALUES(_Price, 0, _Date, _idCs, _idCar);
    
    
	UPDATE Carro 
SET 
    Cliente_idCliente = (SELECT 
            c.idCliente
        FROM
            Cliente c
                JOIN
            Persona p ON c.Persona_idPersona = p.idPersona
        WHERE
            p.Nombre = _ClientName
        LIMIT 1),
    Estado_idEstado = 2
WHERE
    idCarro = _idCar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buying` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buying`(
IN _nombreConcesionaria VARCHAR(20),
IN _idCarro INT,
IN _monto INT,
IN _fecha VARCHAR(20)
)
BEGIN

	INSERT INTO Factura (Monto , Compra, Fecha, Concesionario_idConcesionario,  Carro_idCarro) 
		VALUES ( _monto , 1, _fecha, 
			(SELECT idConcesionario 
			FROM Concesionario
			WHERE Concesionario.Nombre = _nombreConcesionaria), _idCarro);

	UPDATE Carro 
SET 
    Estado_idEstado = 2,
    Cliente_idCliente = NULL,
    Concesionario_idConcesionario = (SELECT 
            idConcesionario
        FROM
            Concesionario
        WHERE
            Concesionario.Nombre = _nombreConcesionaria)
WHERE
    Carro.idCarro = _idCarro;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeCarState` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeCarState`(
IN _State VARCHAR(45),
IN _idCar INT
)
BEGIN

	UPDATE Carro
	SET Carro.Estado_idEstado = (SELECT Estado.idEstado FROM Estado WHERE Estado.Estado = _State)
	WHERE idCarro = _idCar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getBillXClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBillXClient`(
IN _nombreConcesionario VARCHAR(45),
IN _nombrePerson VARCHAR(45)
)
BEGIN
/*
	compras de una persona
*/
SELECT Factura.Fecha, Factura.idFactura, Factura.Compra, Factura.Monto, Carro.Matricula
FROM (Concesionario 
  INNER JOIN Factura ON Factura.Concesionario_idConcesionario = Concesionario.idConcesionario
  INNER JOIN Carro ON Carro.idCarro = Factura.Carro_idCarro
  INNER JOIN Cliente ON Carro.Cliente_idCliente = Cliente.idCliente
  INNER JOIN Persona ON Persona.idPersona = Cliente.Persona_idPersona)
WHERE Concesionario.Nombre = _nombreConcesionario AND Persona.Nombre = _nombrePerson;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCantonFromProvince` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCantonFromProvince`(
IN _Province VARCHAR(20)
)
BEGIN

	SELECT c.Nombre 
    FROM Canton c JOIN Provincia p ON c.Provincia_idProvincia = p.idProvincia
    WHERE p.Nombre = _Province;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCarByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCarByUser`(
IN _UserName VARCHAR(15),
IN _CsName VARCHAR(20)
)
BEGIN

SET sql_mode = '';
     SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT 
    c.idCarro,
    c.Matricula,
    c.Modelo,
    c.Color,
    c.Kilometraje,
    c.Estado_idEstado AS Estado,
    m.Nombre AS Marca,
    i.Link AS Image,
    c.Concesionario_idConcesionario AS Concesionario
FROM
    Carro c
        JOIN
    Marca m ON c.Marca_idMarca = m.idMarca
        JOIN
    Concesionario cs ON c.Concesionario_idConcesionario = cs.idConcesionario
        JOIN
    Estado e ON c.Estado_idEstado = e.idEstado
        JOIN
    Imagen i ON i.Carro_idCarro = c.idCarro
        JOIN
    Cliente cl ON c.Cliente_idCliente = cl.idCliente
        JOIN
    Persona p ON cl.Persona_idPersona = p.idPersona
WHERE
    p.Nombre = _UserName AND cs.Nombre = _CsName
GROUP BY c.Modelo , e.idEstado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClient`(
IN _iD INT
)
BEGIN

	SELECT Nombre 
    FROM Persona 		
    WHERE Cedula = _iD;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDistrictFromCanton` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDistrictFromCanton`(
IN _Canton VARCHAR(20)
)
BEGIN
	SELECT d.Nombre, d.idDistrito 
    FROM Distrito d JOIN Canton c ON d.Canton_idCanton = c.idCanton 
    WHERE c.Nombre = _Canton;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNewCar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getNewCar`(
IN _NombreConcesionario VARCHAR(20)
)
BEGIN

SET sql_mode = '';
     SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT 
    c.idCarro,
    c.Matricula,
    c.Modelo,
    c.Color,
    c.Kilometraje,
    c.Estado_idEstado AS Estado,
    m.Nombre AS Marca,
    i.Link AS Image
FROM
    Carro c
        JOIN
    Marca m ON c.Marca_idMarca = m.idMarca
        JOIN
    Concesionario cs ON c.Concesionario_idConcesionario = cs.idConcesionario
        JOIN
    Estado e ON c.Estado_idEstado = e.idEstado
        JOIN
    Imagen i ON i.Carro_idCarro = c.idCarro
WHERE
    cs.Nombre = _NombreConcesionario
        AND e.idEstado = 1
        AND c.Cliente_idCliente IS NULL
GROUP BY c.Modelo , e.idEstado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProvinceFromCountry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProvinceFromCountry`(
IN _Country VARCHAR(20)
)
BEGIN
	SELECT pr.Nombre
    FROM Pais p JOIN Provincia pr ON p.idPais = pr.Pais_idPais
    WHERE p.Nombre = _Country;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUsedCar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsedCar`(
IN _NombreConcesionario VARCHAR(20)
)
BEGIN
	
		SET sql_mode = '';
     SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT 
    c.idCarro,
    c.Matricula,
    c.Modelo,
    c.Color,
    c.Kilometraje,
    c.Estado_idEstado AS Estado,
    m.Nombre AS Marca,
    i.Link AS Image
FROM
    Carro c
        JOIN
    Marca m ON c.Marca_idMarca = m.idMarca
        JOIN
    Concesionario cs ON c.Concesionario_idConcesionario = cs.idConcesionario
        JOIN
    Estado e ON c.Estado_idEstado = e.idEstado
        JOIN
    Imagen i ON i.Carro_idCarro = c.idCarro
WHERE
    cs.Nombre = _NombreConcesionario
        AND e.idEstado = 2
        AND c.Cliente_idCliente IS NULL
GROUP BY c.Modelo , e.idEstado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reparationCars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reparationCars`(
IN _Name VARCHAR(20),
IN _LASTNAME VARCHAR(45),
IN _ID INT

)
BEGIN
	 SELECT Cliente_idCliente
	 FROM Carro
	 WHERE Carro.Cliente_idCliente = ( 
	 	SELECT cli.idCliente
	 	FROM Cliente cli 
	 	WHERE cli.Persona_idPersona = ( 
	 		SELECT idPersona
	 		FROM Persona per
	 		WHERE ( per.Cedula = _ID ) OR (_Name = per.Nombre AND _LASTNAME = per.Apellido )  
	 	)	 
	 ) AND Carro.Estado = 3;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-27 18:08:08
