CREATE DEFINER=`root`@`localhost` PROCEDURE `getNewCar`(
IN _NombreConcesionario VARCHAR(20)
)
BEGIN

SET sql_mode = '';
     SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT 
    c.idCarro,
    c.Matricula,
    c.Modelo,
    c.Color,
    c.Kilometraje,
    c.Estado_idEstado AS Estado,
    m.Nombre AS Marca,
    i.Link AS Image
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
    cs.Nombre = _NombreConcesionario
        AND e.idEstado = 1
        AND c.Cliente_idCliente IS NULL
GROUP BY c.Modelo , e.idEstado;

END