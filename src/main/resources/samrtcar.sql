-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema smartcar
-- -----------------------------------------------------
-- data of cars,including basic data, current info of car and data of sensors on car.

-- -----------------------------------------------------
-- Schema smartcar
--
-- data of cars,including basic data, current info of car and data of sensors on car.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `smartcar` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `smartcar` ;

-- -----------------------------------------------------
-- Table `smartcar`.`car_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `smartcar`.`car_info` ;

CREATE TABLE IF NOT EXISTS `smartcar`.`car_info` (
  `car_info_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `GPS_longitude` DOUBLE NULL COMMENT '',
  `GPS_lattude` DOUBLE NULL COMMENT '',
  `charge_times` INT NULL COMMENT '',
  `power` FLOAT NULL COMMENT '',
  `total_miles` INT NULL COMMENT '',
  `speed_current` INT NULL COMMENT '',
  `status` TINYINT NULL COMMENT '',
  `update_time` DATETIME NULL COMMENT 'dynanmic',
  PRIMARY KEY (`car_info_id`)  COMMENT '',
  UNIQUE INDEX `id_UNIQUE` (`car_info_id` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartcar`.`battery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `smartcar`.`battery` ;

CREATE TABLE IF NOT EXISTS `smartcar`.`battery` (
  `baterry_id` INT NOT NULL COMMENT '',
  `supplier` VARCHAR(45) NULL COMMENT '',
  `parameters` VARCHAR(45) NULL COMMENT '',
  `cratedate` DATE NULL COMMENT '',
  `status` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`baterry_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartcar`.`sensor_class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `smartcar`.`sensor_class` ;

CREATE TABLE IF NOT EXISTS `smartcar`.`sensor_class` (
  `sensor_id` INT NOT NULL COMMENT '',
  `sensor_name` VARCHAR(45) NULL COMMENT '',
  `basic_parameters` VARCHAR(45) NULL COMMENT '',
  `supplier` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`sensor_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartcar`.`sensor_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `smartcar`.`sensor_list` ;

CREATE TABLE IF NOT EXISTS `smartcar`.`sensor_list` (
  `id` INT NOT NULL COMMENT '',
  `sensor_id` INT NOT NULL COMMENT '',
  `sensor_name` VARCHAR(45) NULL COMMENT '',
  `data` VARCHAR(45) NULL COMMENT 'json varchar',
  `type` VARCHAR(45) NULL COMMENT 'ladar \ntempreture\n....',
  `status` TINYINT NULL COMMENT '',
  `update_time` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_sensor_list_sensor_class1_idx` (`sensor_id` ASC)  COMMENT '',
  CONSTRAINT `fk_sensor_list_sensor_class1`
    FOREIGN KEY (`sensor_id`)
    REFERENCES `smartcar`.`sensor_class` (`sensor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smartcar`.`car_basic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `smartcar`.`car_basic` ;

CREATE TABLE IF NOT EXISTS `smartcar`.`car_basic` (
  `car_id` INT NOT NULL COMMENT '',
  `car_info_id` INT NOT NULL COMMENT '',
  `baterry_id` INT NOT NULL COMMENT '',
  `sensor_list_id` INT NOT NULL COMMENT '',
  `Vin` VARCHAR(45) NULL COMMENT '',
  `release_date` DATE NULL COMMENT '',
  `liscence_date` DATE NULL COMMENT '',
  PRIMARY KEY (`car_id`)  COMMENT '',
  INDEX `fk_car_basic_car_info_idx` (`car_info_id` ASC)  COMMENT '',
  INDEX `fk_car_basic_battery1_idx` (`baterry_id` ASC)  COMMENT '',
  INDEX `fk_car_basic_sensor_list1_idx` (`sensor_list_id` ASC)  COMMENT '',
  CONSTRAINT `fk_car_basic_car_info`
    FOREIGN KEY (`car_info_id`)
    REFERENCES `smartcar`.`car_info` (`car_info_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_car_basic_battery1`
    FOREIGN KEY (`baterry_id`)
    REFERENCES `smartcar`.`battery` (`baterry_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_car_basic_sensor_list1`
    FOREIGN KEY (`sensor_list_id`)
    REFERENCES `smartcar`.`sensor_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
