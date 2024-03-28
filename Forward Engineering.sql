-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AWS_seminovos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AWS_seminovos` DEFAULT CHARACTER SET utf8 ;
USE `AWS_seminovos` ;
-- -----------------------------------------------------
-- Table `AWS_seminovos`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AWS_seminovos`.`endereco` (
  `idendereco` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `uf` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idendereco`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `AWS_seminovos`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AWS_seminovos`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nome_completo` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `cnh` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `id_endereco` INT NOT NULL,
  PRIMARY KEY (`idcliente`),
  INDEX `FK_id_endereco1_idx` (`id_endereco` ASC) ,
  CONSTRAINT `FK_id_endereco1`
    FOREIGN KEY (`id_endereco`)
    REFERENCES `AWS_seminovos`.`endereco` (`idendereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `AWS_seminovos`.`conta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AWS_seminovos`.`conta` (
  `idconta` INT NOT NULL AUTO_INCREMENT,
  `agencia` INT NOT NULL,
  `banco` VARCHAR(45) NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`idconta`),
  INDEX `FK_id_cliente1_idx` (`id_cliente` ASC),
  CONSTRAINT `FK_id_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `AWS_seminovos`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `AWS_seminovos`.`veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AWS_seminovos`.`veiculo` (
  `idveiculo` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `ano` VARCHAR(45) NOT NULL,
  `km` INT NOT NULL,
  `renavam` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idveiculo`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `AWS_seminovos`.`negociacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AWS_seminovos`.`negociacao` (
  `idnegocio` INT NOT NULL AUTO_INCREMENT,
  `valor_fipe` INT NOT NULL,
  `valor_venda` INT NOT NULL,
  `valor_compra` INT NOT NULL,
  `id_veiculo` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`idnegocio`),
  INDEX `FK_id_cliente2_idx` (`id_cliente` ASC) ,
  INDEX `FK_id_veiculo1_idx` (`id_veiculo` ASC) ,
  CONSTRAINT `FK_id_veiculo1`
    FOREIGN KEY (`id_veiculo`)
    REFERENCES `AWS_seminovos`.`veiculo` (`idveiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_cliente2`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `AWS_seminovos`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `AWS_seminovos`.`pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AWS_seminovos`.`pagamento` (
  `idpagamento` INT NOT NULL AUTO_INCREMENT,
  `data_contrato` DATE NOT NULL,
  `validade` DATE NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_negocio` INT NOT NULL,
  PRIMARY KEY (`idpagamento`),
  INDEX `FK_id_cliente_idx` (`id_cliente` ASC) ,
  INDEX `FK_id_negocio2_idx` (`id_negocio` ASC) ,
  CONSTRAINT `FK_id_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `AWS_seminovos`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_negocio2`
    FOREIGN KEY (`id_negocio`)
    REFERENCES `AWS_seminovos`.`negociacao` (`idnegocio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AWS_seminovos`.`manutencao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AWS_seminovos`.`manutencao` (
  `idmanutencao` INT NOT NULL AUTO_INCREMENT,
  `data_manutencao` DATE NOT NULL,
  `valor_manutencao` DECIMAL NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  `id_veiculo` INT NOT NULL,
  PRIMARY KEY (`idmanutencao`),
  INDEX `FK_id_veiculo1_idx` (`id_veiculo` ASC),
  CONSTRAINT `FK_id_veiculo1`
    FOREIGN KEY (`id_veiculo`)
    REFERENCES `AWS_seminovos`.`veiculo` (`idveiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `AWS_seminovos`.`contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AWS_seminovos`.`contrato` (
  `idcontrato` INT NOT NULL AUTO_INCREMENT,
  `data_contrato` DATE NOT NULL,
  `validade` DATE NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_negocio` INT NOT NULL,
  PRIMARY KEY (`idcontrato`),
  INDEX `FK_id_cliente1_idx` (`id_cliente` ASC) ,
  INDEX `FK_id_negocio2_idx` (`id_negocio` ASC) ,
  CONSTRAINT `FK_id_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `AWS_seminovos`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_negocio2`
    FOREIGN KEY (`id_negocio`)
    REFERENCES `AWS_seminovos`.`negociacao` (`idnegocio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
