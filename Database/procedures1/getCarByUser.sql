CREATE DEFINER=`root`@`localhost` PROCEDURE `getCarByUser`(
IN _UserName VARCHAR(15),
IN _CsName VARCHAR(20)
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
        JOIN
    Cliente cl ON c.Cliente_idCliente = cl.idCliente
        JOIN
    Persona p ON cl.Persona_idPersona = p.idPersona
WHERE
    p.Nombre = _UserName AND cs.Nombre = _CsName
GROUP BY c.Modelo , e.idEstado;

END