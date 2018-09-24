CREATE DATABASE IF NOT EXISTS `MotorTEC_db` DEFAULT CHARACTER SET utf8;
USE `MotorTEC_db`;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPais`))
-- Configura el motor de almacenamiento
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Provincia` (
  `idProvincia` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Pais_idPais` INT NOT NULL,
  PRIMARY KEY (`idProvincia`),
  INDEX `fk_Provincia_Pais1_idx` (`Pais_idPais` ASC) VISIBLE,
  CONSTRAINT `fk_Provincia_Pais1`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `MotorTEC_db`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Canton` (
  `idCanton` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Provincia_idProvincia` INT NOT NULL,
  PRIMARY KEY (`idCanton`),
  INDEX `fk_Canton_Provincia1_idx` (`Provincia_idProvincia` ASC) VISIBLE,
  CONSTRAINT `fk_Canton_Provincia1`
    FOREIGN KEY (`Provincia_idProvincia`)
    REFERENCES `MotorTEC_db`.`Provincia` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Distrito` (
  `idDistrito` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Canton_idCanton` INT NOT NULL,
  PRIMARY KEY (`idDistrito`),
  INDEX `fk_Distrito_Canton1_idx` (`Canton_idCanton` ASC) VISIBLE,
  CONSTRAINT `fk_Distrito_Canton1`
    FOREIGN KEY (`Canton_idCanton`)
    REFERENCES `MotorTEC_db`.`Canton` (`idCanton`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Ubicacion` (
  `idUbicacion` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(256) NOT NULL,
  `Distrito_idDistrito` INT NOT NULL,
  PRIMARY KEY (`idUbicacion`),
  INDEX `fk_Ubicacion_Distrito1_idx` (`Distrito_idDistrito` ASC) VISIBLE,
  CONSTRAINT `fk_Ubicacion_Distrito1`
    FOREIGN KEY (`Distrito_idDistrito`)
    REFERENCES `MotorTEC_db`.`Distrito` (`idDistrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `Cedula` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Telefono` INT NULL,
  `Email` VARCHAR(45) NULL,
  `Ubicacion_idUbicacion` INT NOT NULL,
  PRIMARY KEY (`idPersona`),
  INDEX `fk_Persona_Ubicacion1_idx` (`Ubicacion_idUbicacion` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_Ubicacion1`
    FOREIGN KEY (`Ubicacion_idUbicacion`)
    REFERENCES `MotorTEC_db`.`Ubicacion` (`idUbicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `MotorTEC_db`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Taller` (
  `idTaller` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Ubicacion_idUbicacion` INT NOT NULL,
  PRIMARY KEY (`idTaller`),
  INDEX `fk_Taller_Ubicacion1_idx` (`Ubicacion_idUbicacion` ASC) VISIBLE,
  CONSTRAINT `fk_Taller_Ubicacion1`
    FOREIGN KEY (`Ubicacion_idUbicacion`)
    REFERENCES `MotorTEC_db`.`Ubicacion` (`idUbicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Mecanico` (
  `idMecanico` INT NOT NULL AUTO_INCREMENT,
  `Salario` INT NOT NULL,
  `Fecha_Contratacion` DATE NOT NULL,
  `Puesto` VARCHAR(45) NOT NULL,
  `Taller_idTaller` INT NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idMecanico`),
  INDEX `fk_Mecanico_Taller1_idx` (`Taller_idTaller` ASC) VISIBLE,
  INDEX `fk_Mecanico_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Mecanico_Taller1`
    FOREIGN KEY (`Taller_idTaller`)
    REFERENCES `MotorTEC_db`.`Taller` (`idTaller`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mecanico_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `MotorTEC_db`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Marca` (
  `idMarca` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMarca`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Concesionario` (
  `idConcesionario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Ubicacion_idUbicacion` INT NOT NULL,
  `Taller_idTaller` INT NOT NULL,
  PRIMARY KEY (`idConcesionario`),
  INDEX `fk_Concesionario_Ubicacion1_idx` (`Ubicacion_idUbicacion` ASC) VISIBLE,
  INDEX `fk_Concesionario_Taller1_idx` (`Taller_idTaller` ASC) VISIBLE,
  CONSTRAINT `fk_Concesionario_Ubicacion1`
    FOREIGN KEY (`Ubicacion_idUbicacion`)
    REFERENCES `MotorTEC_db`.`Ubicacion` (`idUbicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Concesionario_Taller1`
    FOREIGN KEY (`Taller_idTaller`)
    REFERENCES `MotorTEC_db`.`Taller` (`idTaller`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Estado` (
  `idEstado` INT NOT NULL AUTO_INCREMENT,
  `Estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Coche` (
  `idCoche` INT NOT NULL AUTO_INCREMENT,
  `Matricula` VARCHAR(6) NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `Kilometraje` INT ZEROFILL NOT NULL,
  `Marca_idMarca` INT NOT NULL,
  `Cliente_idCliente` INT ZEROFILL NULL,
  `Concesionario_idConcesionario` INT NOT NULL,
  `Estado_idEstado` INT NOT NULL,
  PRIMARY KEY (`idCoche`),
  INDEX `fk_Coche_Marca1_idx` (`Marca_idMarca` ASC) VISIBLE,
  INDEX `fk_Coche_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Coche_Concesionario1_idx` (`Concesionario_idConcesionario` ASC) VISIBLE,
  INDEX `fk_Coche_Estado1_idx` (`Estado_idEstado` ASC) VISIBLE,
  CONSTRAINT `fk_Coche_Marca1`
    FOREIGN KEY (`Marca_idMarca`)
    REFERENCES `MotorTEC_db`.`Marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Coche_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `MotorTEC_db`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Coche_Concesionario1`
    FOREIGN KEY (`Concesionario_idConcesionario`)
    REFERENCES `MotorTEC_db`.`Concesionario` (`idConcesionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Coche_Estado1`
    FOREIGN KEY (`Estado_idEstado`)
    REFERENCES `MotorTEC_db`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Reparacion` (
  `idReparacion` INT NOT NULL AUTO_INCREMENT,
  `Coche_idCoche` INT NOT NULL,
  PRIMARY KEY (`idReparacion`),
  INDEX `fk_Reparacion_Coche1_idx` (`Coche_idCoche` ASC) VISIBLE,
  CONSTRAINT `fk_Reparacion_Coche1`
    FOREIGN KEY (`Coche_idCoche`)
    REFERENCES `MotorTEC_db`.`Coche` (`idCoche`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Factura` (
  `idFactura` INT NOT NULL AUTO_INCREMENT,
  `Monto` INT NOT NULL,
  `Compra` TINYINT(1) NOT NULL,
  `Fecha` DATETIME NOT NULL,
  `Coche_idCoche` INT NOT NULL,
  `Concesionario_idConcesionario` INT NOT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `fk_Compra_Coche1_idx` (`Coche_idCoche` ASC) VISIBLE,
  INDEX `fk_Compra_Concesionario1_idx` (`Concesionario_idConcesionario` ASC) VISIBLE,
  CONSTRAINT `fk_Compra_Coche1`
    FOREIGN KEY (`Coche_idCoche`)
    REFERENCES `MotorTEC_db`.`Coche` (`idCoche`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_Concesionario1`
    FOREIGN KEY (`Concesionario_idConcesionario`)
    REFERENCES `MotorTEC_db`.`Concesionario` (`idConcesionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`TiempoReparacion` (
  `idTiempoReparacion` INT NOT NULL AUTO_INCREMENT,
  `HoraInicio` DATETIME NULL,
  `HoraFin` DATETIME NULL,
  `Reparacion_idReparacion` INT NOT NULL,
  `Mecanico_idMecanico` INT NOT NULL,
  PRIMARY KEY (`idTiempoReparacion`),
  INDEX `fk_TiempoReparacion_Reparacion1_idx` (`Reparacion_idReparacion` ASC) VISIBLE,
  INDEX `fk_TiempoReparacion_Mecanico1_idx` (`Mecanico_idMecanico` ASC) VISIBLE,
  CONSTRAINT `fk_TiempoReparacion_Reparacion1`
    FOREIGN KEY (`Reparacion_idReparacion`)
    REFERENCES `MotorTEC_db`.`Reparacion` (`idReparacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TiempoReparacion_Mecanico1`
    FOREIGN KEY (`Mecanico_idMecanico`)
    REFERENCES `MotorTEC_db`.`Mecanico` (`idMecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MotorTEC_db`.`Imagen` (
  `idImagen` INT NOT NULL,
  `Link` VARCHAR(256) NOT NULL,
  `Coche_idCoche` INT NOT NULL,
  PRIMARY KEY (`idImagen`),
  INDEX `fk_Imagen_Coche1_idx` (`Coche_idCoche` ASC) VISIBLE,
  CONSTRAINT `fk_Imagen_Coche1`
    FOREIGN KEY (`Coche_idCoche`)
    REFERENCES `MotorTEC_db`.`Coche` (`idCoche`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
