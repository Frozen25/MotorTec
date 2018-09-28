CREATE DEFINER=`root`@`localhost` PROCEDURE `getCarFix`(
IN _MATRICULA VARCHAR(6),

)
BEGIN

	INSERT INTO Reparacion (Carro_idCarro, Taller_idTaller) VALUES (
		(SELECT ( idCarro )
	   	FROM Carro
	   	WHERE Carro.Matricula = _MATRICULA)
	   	,
	   	(SELECT (Concesionario.Taller_idTaller)
	   		FROM Carro
	   		INNER JOIN Concesionario WHERE Carro.Concesionario_idConcesionario = Concesionario.idConcesionario)
	   )

END