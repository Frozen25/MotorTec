CREATE DEFINER=`root`@`localhost` PROCEDURE `getCarWithImages`(
IN _idCarro INT
)
BEGIN

SELECT 
    c.idCarro,
    c.Matricula,
    c.Modelo,
    c.Color,
    c.Kilometraje,
    c.Estado_idEstado AS Estado,
    m.Nombre AS Marca,
    i.Link AS Image,
    c.Concesionario_idConcesionario AS Concesionario
FROM
    Carro c
        JOIN
    Marca m ON c.Marca_idMarca = m.idMarca
        JOIN
    Concesionario cs ON c.Concesionario_idConcesionario = cs.idConcesionario
        JOIN
    Estado e ON c.Estado_idEstado = e.idEstado
        JOIN
    Imagen i ON i.Carro_idCarro = c.idCarro
WHERE
    c.idCarro = _idCarro;

END