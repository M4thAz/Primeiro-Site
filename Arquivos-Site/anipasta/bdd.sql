-- MySQL Script generated by MySQL Workbench
-- Fri Jun  3 10:10:35 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema animezineos
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `animezineos` ;

-- -----------------------------------------------------
-- Schema animezineos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `animezineos` DEFAULT CHARACTER SET utf8mb4 ;
USE `animezineos` ;

-- -----------------------------------------------------
-- Table `animezineos`.`animes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `animezineos`.`animes` ;

CREATE TABLE IF NOT EXISTS `animezineos`.`animes` (
  `idanimes` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_anime` VARCHAR(45) NOT NULL,
  `genero` VARCHAR(45) NULL DEFAULT NULL,
  `episodios_qnt` INT(11) NOT NULL,
  `data_estreia` DATE NULL DEFAULT NULL,
  `temporada_qnt` INT(11) NULL DEFAULT NULL,
  `imgs_animes` VARCHAR(80) NULL,
  PRIMARY KEY (`idanimes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `animezineos`.`estudios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `animezineos`.`estudios` ;

CREATE TABLE IF NOT EXISTS `animezineos`.`estudios` (
  `nome_estudio` VARCHAR(80) NOT NULL,
  `id_estudio` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_estudio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `animezineos`.`estudios_has_animes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `animezineos`.`estudios_has_animes` ;

CREATE TABLE IF NOT EXISTS `animezineos`.`estudios_has_animes` (
  `estudios_id_estudio` INT(11) NOT NULL,
  `animes_idanimes` INT(11) NOT NULL,
  PRIMARY KEY (`estudios_id_estudio`, `animes_idanimes`),
  INDEX `fk_estudios_has_animes_animes1_idx` (`animes_idanimes` ASC),
  INDEX `fk_estudios_has_animes_estudios_idx` (`estudios_id_estudio` ASC),
  CONSTRAINT `fk_estudios_has_animes_estudios`
    FOREIGN KEY (`estudios_id_estudio`)
    REFERENCES `animezineos`.`estudios` (`id_estudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estudios_has_animes_animes1`
    FOREIGN KEY (`animes_idanimes`)
    REFERENCES `animezineos`.`animes` (`idanimes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
