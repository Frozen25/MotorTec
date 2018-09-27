CREATE DEFINER=`root`@`localhost` PROCEDURE `getCantonFromProvince`(
IN _Province VARCHAR(20)
)
BEGIN

	SELECT c.Nombre 
    FROM Canton c JOIN Provincia p ON c.Provincia_idProvincia = p.idProvincia
    WHERE p.Nombre = _Province;

END