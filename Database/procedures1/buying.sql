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

END