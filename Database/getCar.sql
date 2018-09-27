CREATE DEFINER=`root`@`localhost` PROCEDURE `getCar`(
IN _idCoche INT
)
BEGIN

	SELECT c.idCoche, c.Matricula, c.Modelo, c.Color, c.Estado, c.Image, c.Kilometraje, m.Nombre AS Marca 
    FROM Coche c JOIN Marca m ON c.Marca_idMarca = m.idMarca 
    WHERE c.idCoche = _idCoche;
END