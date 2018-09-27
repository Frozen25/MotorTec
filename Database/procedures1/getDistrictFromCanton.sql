CREATE DEFINER=`root`@`localhost` PROCEDURE `getDistrictFromCanton`(
IN _Canton VARCHAR(20)
)
BEGIN
	SELECT d.Nombre, d.idDistrito 
    FROM Distrito d JOIN Canton c ON d.Canton_idCanton = c.idCanton 
    WHERE c.Nombre = _Canton;
END