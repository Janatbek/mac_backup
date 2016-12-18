-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema wishlist
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `wishlist` ;

-- -----------------------------------------------------
-- Schema wishlist
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wishlist` DEFAULT CHARACTER SET utf8 ;
USE `wishlist` ;

-- -----------------------------------------------------
-- Table `wishlist`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wishlist`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `doh` DATETIME NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wishlist`.`wishlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wishlist`.`wishlist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `added_at` DATETIME NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_wishlist_users_idx` (`user_id` ASC),
  CONSTRAINT `fk_wishlist_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `wishlist`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
