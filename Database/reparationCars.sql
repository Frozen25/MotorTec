CREATE DEFINER=`root`@`localhost` PROCEDURE `reparationCars`(
IN _Name VARCHAR(20),
IN _LASTNAME VARCHAR(45),
IN _ID INT,

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
	
END