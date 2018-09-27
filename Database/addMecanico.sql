CREATE DEFINER=`root`@`localhost` PROCEDURE `addMecanico`(
IN _Name VARCHAR(20),
IN _LASTNAME VARCHAR(45),
IN _ID INT,
IN _PHONE INT,
IN _EMAIL VARCHAR(45),
IN _DISTRICT INT,
IN _DESCRIPTION VARCHAR(100),
IN _TALLER INT,
IN _SALARIO INT
IN _FECHA VARCHAR(45)
)

---salario fecha, ttaller, persona

BEGIN

	 INSERT INTO Ubicacion(Descripcion, Distrito_idDistrito) VALUES(_DESCRIPTION, _DISTRICT);
     
     INSERT INTO Persona(Cedula, Nombre, Apellido, Telefono, Email, Ubicacion_idUbicacion)
     VALUES(_ID, _NAME, _LASTNAME, _PHONE, _EMAIL, (SELECT MAX(idUbicacion) FROM Ubicacion idUbicacion));
     
     INSERT INTO Mecanico (Salario, Fecha_Contratacion, Taller_idTaller, Persona_idPersona) VALUES 
     	( _SALARIO, _FECHA, _TALLER  , (SELECT MAX(idPersona) FROM Persona id));

END