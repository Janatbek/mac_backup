-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema quotation_app
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `quotation_app` ;

-- -----------------------------------------------------
-- Schema quotation_app
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quotation_app` DEFAULT CHARACTER SET utf8 ;
USE `quotation_app` ;

-- -----------------------------------------------------
-- Table `quotation_app`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quotation_app`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `alias` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `dob` VARCHAR(45) NULL,
  `created_at` VARCHAR(45) NULL,
  `updated_at` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quotation_app`.`quotes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quotation_app`.`quotes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `message` TEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quotation_app`.`favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quotation_app`.`favorites` (
  `quote_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`quote_id`, `user_id`),
  INDEX `fk_quotes_has_users_users1_idx` (`user_id` ASC),
  INDEX `fk_quotes_has_users_quotes_idx` (`quote_id` ASC),
  CONSTRAINT `fk_quotes_has_users_quotes`
    FOREIGN KEY (`quote_id`)
    REFERENCES `quotation_app`.`quotes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quotes_has_users_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `quotation_app`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
