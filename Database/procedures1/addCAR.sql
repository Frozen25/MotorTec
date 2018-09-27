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
END