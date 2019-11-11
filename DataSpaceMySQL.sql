-- MySQL Script generated by MySQL Workbench
-- Mon Nov 11 13:52:03 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Space
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Space
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Space` DEFAULT CHARACTER SET utf8 ;
USE `Space` ;

-- -----------------------------------------------------
-- Table `Space`.`GALAXY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Space`.`GALAXY` (
  `Name` VARCHAR(30) NOT NULL,
  `Age` FLOAT NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Space`.`STAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Space`.`STAR` (
  `Name` VARCHAR(20) NOT NULL,
  `Position_Latitude` FLOAT NULL,
  `Position_Longitude` FLOAT NULL,
  `Spectral_Type` VARCHAR(10) NULL,
  `Magnitude` FLOAT NULL,
  `Velocity_Heliocentric` FLOAT NULL,
  `Velocity_Rotational` FLOAT NULL,
  `Galaxy_Name` VARCHAR(30) NULL,
  PRIMARY KEY (`Name`),
  INDEX `Galaxy_Name_idx` (`Galaxy_Name` ASC) VISIBLE,
  CONSTRAINT `Galaxy_Name`
    FOREIGN KEY (`Galaxy_Name`)
    REFERENCES `Space`.`GALAXY` (`Name`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Space`.`BODY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Space`.`BODY` (
  `Name` VARCHAR(30) NOT NULL,
  `Mass` FLOAT NULL,
  `Orbital_Period` VARCHAR(10) NULL,
  `Semi-Major_Axis` VARCHAR(10) NULL,
  `Eccentricity` FLOAT NULL,
  `Star_Name` VARCHAR(20) NULL,
  PRIMARY KEY (`Name`),
  INDEX `Star_Name_idx` (`Star_Name` ASC) VISIBLE,
  CONSTRAINT `Star_Name`
    FOREIGN KEY (`Star_Name`)
    REFERENCES `Space`.`STAR` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Space`.`ASTEROID`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Space`.`ASTEROID` (
  `Body_Name` VARCHAR(30) NOT NULL,
  `Diameter` VARCHAR(30) NULL,
  `Rotation_Period` FLOAT NULL,
  `Spectral_Class` VARCHAR(10) NULL,
  PRIMARY KEY (`Body_Name`),
  CONSTRAINT `Body_Name`
    FOREIGN KEY (`Body_Name`)
    REFERENCES `Space`.`BODY` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Space`.`PLANET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Space`.`PLANET` (
  `Body_Name` VARCHAR(20) NOT NULL,
  `Radius` FLOAT NULL,
  `Distance` FLOAT NULL,
  PRIMARY KEY (`Body_Name`),
  CONSTRAINT `Body_Name`
    FOREIGN KEY (`Body_Name`)
    REFERENCES `Space`.`BODY` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Space`.`SOL_PLANET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Space`.`SOL_PLANET` (
  `Planet_Name` VARCHAR(20) NOT NULL,
  `Discover` VARCHAR(20) NULL,
  `Num_Known_Satallites` INT NULL,
  PRIMARY KEY (`Planet_Name`),
  CONSTRAINT `Planet_Name`
    FOREIGN KEY (`Planet_Name`)
    REFERENCES `Space`.`PLANET` (`Body_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Space`.`EXOPLANET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Space`.`EXOPLANET` (
  `Planet_Name` VARCHAR(20) NOT NULL,
  `Discovery_Date` VARCHAR(10) NULL,
  `Equilibrium_Temp` FLOAT NULL,
  PRIMARY KEY (`Planet_Name`),
  CONSTRAINT `Planet_Name`
    FOREIGN KEY (`Planet_Name`)
    REFERENCES `Space`.`PLANET` (`Body_Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
