CREATE DEFINER=`root`@`localhost` PROCEDURE `getClient`(
IN _iD INT
)
BEGIN

	SELECT Nombre 
    FROM Persona 		
    WHERE Cedula = _iD;

END