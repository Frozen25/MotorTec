CREATE DEFINER=`root`@`localhost` PROCEDURE `addSell`(
IN _Price INT,
IN _Date VARCHAR(20),
IN _idCar INT,
IN _idCs INT,
IN _ClientName VARCHAR(20)
)
/*
    cuando se vende un carro se deberia de borrar las imagenes
    asociadas a dicho carro
*/


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

END