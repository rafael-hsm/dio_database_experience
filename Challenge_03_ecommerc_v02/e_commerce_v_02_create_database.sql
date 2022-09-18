SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- DATABASE e_commerce_v_02
-- -----------------------------------------------------

CREATE DATABASE IF NOT EXISTS `e_commerce_v_02` ;
USE `e_commerce_v_02` ;

-- -----------------------------------------------------
-- Table `e_commerce_v_02`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce_v_02`.`Person` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `username` CHAR(20) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `PF` CHAR(1) NOT NULL,
  `PJ` CHAR(1) NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `idClient_UNIQUE` (`idClient` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce_v_02`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce_v_02`.`Payment` (
  `idpayment` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('Credit Card', 'PIX', 'Pay_order') NOT NULL,
  `status` ENUM('Waiting', 'Confirmed') NULL,
  PRIMARY KEY (`idpayment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce_v_02`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce_v_02`.`Product` (
  `idProduct` INT NOT NULL AUTO_INCREMENT,
  `product` VARCHAR(45) NOT NULL,
  `category` CHAR(20) NOT NULL,
  `quantity` FLOAT NOT NULL,
  `price` FLOAT NOT NULL,
  PRIMARY KEY (`idProduct`),
  UNIQUE INDEX `category_UNIQUE` (`category` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce_v_02`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce_v_02`.`Order` (
  `idorder` INT NOT NULL AUTO_INCREMENT,
  `person_idClient` INT NOT NULL,
  `payment_idpayment1` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  `quantity` FLOAT NULL,
  `discount` FLOAT NOT NULL,
  `total` FLOAT NOT NULL,
  `status` VARCHAR(45) NULL COMMENT 'Type of order: \n1 - Pending (wait payment)\n2 - Confirmed\n3 - Cancelled\n4 - Shipped\n5 - Refunded\n',
  `person_Delivery Address_idDelivery Address` INT NOT NULL,
  PRIMARY KEY (`idorder`),
  INDEX `fk_order_person1_idx` (`person_idClient` ASC, `person_Delivery Address_idDelivery Address` ASC) VISIBLE,
  INDEX `fk_order_payment1_idx` (`payment_idpayment1` ASC) VISIBLE,
  INDEX `fk_order_Product1_idx` (`Product_idProduct` ASC) VISIBLE,
  CONSTRAINT `fk_order_person1`
    FOREIGN KEY (`person_idClient`)
    REFERENCES `e_commerce_v_02`.`Person` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_payment1`
    FOREIGN KEY (`payment_idpayment1`)
    REFERENCES `e_commerce_v_02`.`Payment` (`idpayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `e_commerce_v_02`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce_v_02`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce_v_02`.`Stock` (
  `idStock` INT NOT NULL AUTO_INCREMENT,
  `Sotck Localization` ENUM('A', 'B', 'C') NOT NULL DEFAULT 'A',
  PRIMARY KEY (`idStock`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce_v_02`.`DeliveryAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce_v_02`.`DeliveryAddress` (
  `idDelivery Address` INT NOT NULL AUTO_INCREMENT,
  `order_idorder` INT NOT NULL,
  `region` CHAR(2) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `postal code` INT(8) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `contact` INT(11) NOT NULL,
  PRIMARY KEY (`idDelivery Address`),
  INDEX `fk_Delivery Address_order1_idx` (`order_idorder` ASC) VISIBLE,
  CONSTRAINT `fk_Delivery Address_order1`
    FOREIGN KEY (`order_idorder`)
    REFERENCES `e_commerce_v_02`.`Order` (`idorder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce_v_02`.`LegalPerson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce_v_02`.`LegalPerson` (
  `idlegalPerson` INT NOT NULL AUTO_INCREMENT,
  `company Name` VARCHAR(60) NOT NULL COMMENT 'Name of company',
  `registration Number` VARCHAR(14) NOT NULL COMMENT 'CNPJ',
  `Region` CHAR(2) NOT NULL,
  `City` CHAR(45) NOT NULL,
  `Phone` VARCHAR(11) NOT NULL COMMENT '	',
  `person_idClient` INT NOT NULL,
  `LPusername` CHAR(20) NOT NULL,
  PRIMARY KEY (`idlegalPerson`),
  UNIQUE INDEX `company Name_UNIQUE` (`company Name` ASC) VISIBLE,
  UNIQUE INDEX `registration Number_UNIQUE` (`registration Number` ASC) VISIBLE,
  UNIQUE INDEX `Phone_UNIQUE` (`Phone` ASC) VISIBLE,
  INDEX `fk_Legal Person_person1_idx` (`person_idClient` ASC) VISIBLE,
  UNIQUE INDEX `LPusername_UNIQUE` (`LPusername` ASC) VISIBLE,
  CONSTRAINT `fk_Legal Person_person1`
    FOREIGN KEY (`person_idClient`)
    REFERENCES `e_commerce_v_02`.`Person` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce_v_02`.`NaturalPerson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce_v_02`.`NaturalPerson` (
  `idNatural Person` INT NOT NULL AUTO_INCREMENT,
  `Fname` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `Lname` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `NPusername` CHAR(20) NOT NULL,
  `Person_idClient` INT NOT NULL,
  PRIMARY KEY (`idNatural Person`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  UNIQUE INDEX `NPusername_UNIQUE` (`NPusername` ASC) VISIBLE,
  INDEX `fk_NaturalPerson_Person1_idx` (`Person_idClient` ASC) VISIBLE,
  CONSTRAINT `fk_NaturalPerson_Person1`
    FOREIGN KEY (`Person_idClient`)
    REFERENCES `e_commerce_v_02`.`Person` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce_v_02`.`Relation Product/Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce_v_02`.`Relation Product/Stock` (
  `Stock_idStock` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  PRIMARY KEY (`Stock_idStock`, `Product_idProduct`),
  INDEX `fk_Stock_has_Product_Product1_idx` (`Product_idProduct` ASC) VISIBLE,
  INDEX `fk_Stock_has_Product_Stock1_idx` (`Stock_idStock` ASC) VISIBLE,
  CONSTRAINT `fk_Stock_has_Product_Stock1`
    FOREIGN KEY (`Stock_idStock`)
    REFERENCES `e_commerce_v_02`.`Stock` (`idStock`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Stock_has_Product_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `e_commerce_v_02`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
