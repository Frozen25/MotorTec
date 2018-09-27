CREATE DEFINER=`root`@`localhost` PROCEDURE `addClient`(
IN _Name VARCHAR(20),
IN _LASTNAME VARCHAR(45),
IN _ID INT,
IN _PHONE INT,
IN _EMAIL VARCHAR(45),
IN _DISTRICT INT,
IN _DESCRIPTION VARCHAR(100)
)
BEGIN

	 INSERT INTO Ubicacion(Descripcion, Distrito_idDistrito) VALUES(_DESCRIPTION, _DISTRICT);
     
     INSERT INTO Persona(Cedula, Nombre, Apellido, Telefono, Email, Ubicacion_idUbicacion)
     VALUES(_ID, _NAME, _LASTNAME, _PHONE, _EMAIL, (SELECT MAX(idUbicacion) FROM Ubicacion idUbicacion));
     
     INSERT INTO Cliente(Persona_idPersona) VALUES ((SELECT MAX(idPersona) FROM Persona id));

END