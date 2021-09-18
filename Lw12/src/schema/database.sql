SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`feedback` (
  `feedback_id` INT         NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(45) NOT NULL,
  `email`       VARCHAR(45) NOT NULL,
  `country`     VARCHAR(30) NOT NULL,
  `gender`      VARCHAR(16) NOT NULL,
  `message`     TEXT        NOT NULL,
  PRIMARY KEY (`feedback_id`),
  UNIQUE INDEX `feedback_id_UNIQUE` (`feedback_id` ASC)
) ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
