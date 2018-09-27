CREATE DEFINER=`root`@`localhost` PROCEDURE `changeCarState`(
IN _State VARCHAR(45),
IN _idCar INT,
)
BEGIN

	UPDATE Carro
	SET Carro.Estado_idEstado = (SELECT Estado.idEstado FROM Estado WHERE Estado.Estado = _State)
	WHERE idCarro = _idCar;

END