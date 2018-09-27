CREATE DEFINER=`root`@`localhost` PROCEDURE `addSell`(
IN _Price INT,
IN _Date VARCHAR(15),
IN _idCar INT,
IN _idConcesionario INT,
IN _ClientName VARCHAR(20)
)
BEGIN

	INSERT INTO Factura(Monto, Compra, Fecha, Coche_idCoche, Concesionario_idConcesionario) 
    VALUES(_Price, 0, _Date, _idCar, _idConcesionario);
    
    
	UPDATE Carro SET 
    Cliente_idCliente = (
        SELECT 
            c.idCliente
        FROM
            Cliente c
                JOIN
            Persona p ON c.Persona_idPersona = p.idPersona
        WHERE
            p.Nombre = _ClientName),
    Estado_idEstado = 2 WHERE idCarro = _idCar
    ;
    DELETE FROM Imagen
        WHERE Imagen.Carro_idCarro = _idCar
    ;


END