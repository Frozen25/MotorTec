CREATE DEFINER=root`@`localhost PROCEDURE getCarFix(
IN _nombreConcesionario VARCHAR(45),
IN _nombrePerson VARCHAR(45)
)
BEGIN

SELECT Taller.Nombre, Carro.Matricula, Reparacion.idReparacion, Persona.Nombre, Persona.Apellido
FROM (Concesionario 
  INNER JOIN Taller ON Taller.idTaller = Concesionario.Taller_idTaller
  INNER JOIN Reparacion ON Reparacion.Taller_idTaller = Taller.idTaller
  INNER JOIN Carro ON Carro.idCarro = Reparacion.Carro_idCarro
  INNER JOIN Cliente ON Carro.Cliente_idCliente = Cliente.idCliente
  INNER JOIN Persona ON Persona.idPersona = Cliente.Persona_idPersona)
WHERE Concesionario.Nombre = _nombreConcesionario AND Persona.Nombre = _nombrePerson;

END