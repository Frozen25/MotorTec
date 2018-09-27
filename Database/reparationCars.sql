CREATE DEFINER=`root`@`localhost` PROCEDURE `reparationCars`(
IN _Name VARCHAR(20),
IN _LASTNAME VARCHAR(45),
IN _ID INT,
IN _PHONE INT,
IN _DISTRICT INT,
IN _DESCRIPTION VARCHAR(100)
)
BEGIN
	 CALL InsertUbicacion(_DISTRICT, _DESCRIPTION);
     INSERT INTO Persona VALUES((SELECT MAX(idPersona) + 1 FROM Persona id), _ID, _NAME, 
     _LASTNAME, _PHONE, ((SELECT MAX(idUbicacion) FROM Ubicacion idUbicacion)));
     
     INSERT INTO Cliente VALUES ((SELECT MAX(idCliente) + 1 FROM Cliente id), 
     (SELECT MAX(idPersona) FROM Persona id));
	
END