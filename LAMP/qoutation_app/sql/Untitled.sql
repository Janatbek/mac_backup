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
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `alias` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `dob` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` VARCHAR(45) NULL DEFAULT NULL,
  `updated_at` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quotation_app`.`quotes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quotation_app`.`quotes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `quoted_by` VARCHAR(45) NULL DEFAULT NULL,
  `message` TEXT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_quotes_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_quotes_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `quotation_app`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `quotation_app`.`favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `quotation_app`.`favorites` (
  `quote_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
