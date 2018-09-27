CREATE DEFINER=`root`@`localhost` PROCEDURE `getProvinceFromCountry`(
IN _Country VARCHAR(20)
)
BEGIN
	SELECT pr.Nombre
    FROM Pais p JOIN Provincia pr ON p.idPais = pr.Pais_idPais
    WHERE p.Nombre = _Country;
END