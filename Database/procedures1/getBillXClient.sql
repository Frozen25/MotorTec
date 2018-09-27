CREATE DEFINER=`root`@`localhost` PROCEDURE `getBillXClient`(
IN _nombreConcesionario VARCHAR(45),
IN _nombrePerson VARCHAR(45)
)
BEGIN
/*
	compras de una persona
*/
SELECT Factura.Fecha, Factura.idFactura, Factura.Compra, Factura.Monto, Carro.Matricula
FROM (Concesionario 
  INNER JOIN Factura ON Factura.Concesionario_idConcesionario = Concesionario.idConcesionario
  INNER JOIN Carro ON Carro.idCarro = Factura.Carro_idCarro
  INNER JOIN Cliente ON Carro.Cliente_idCliente = Cliente.idCliente
  INNER JOIN Persona ON Persona.idPersona = Cliente.Persona_idPersona)
WHERE Concesionario.Nombre = _nombreConcesionario AND Persona.Nombre = _nombrePerson;

END