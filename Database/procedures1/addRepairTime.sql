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
    

END