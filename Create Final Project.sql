-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Payroll
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Payroll
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Payroll` DEFAULT CHARACTER SET utf8 ;
USE `Payroll` ;

-- -----------------------------------------------------
-- Table `Payroll`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payroll`.`Department` (
  `DeptID` VARCHAR(4) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Budget` DECIMAL NOT NULL,
  `Category` VARCHAR(45) NULL,
  PRIMARY KEY (`DeptID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Payroll`.`Benefits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payroll`.`Benefits` (
  `BenefitsID` INT NOT NULL AUTO_INCREMENT,
  `HealthInsuranceTier` VARCHAR(10) NOT NULL,
  `401K` DECIMAL NULL,
  `HSA` DECIMAL NULL,
  `PaidTimeOff` VARCHAR(45) NULL,
  PRIMARY KEY (`BenefitsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Payroll`.`Job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payroll`.`Job` (
  `JobID` VARCHAR(5) NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `DeptID` VARCHAR(4) NOT NULL,
  `HourlyRate` DECIMAL NOT NULL,
  `BenefitsID` INT NOT NULL,
  PRIMARY KEY (`JobID`),
  INDEX `DeptID_idx` (`DeptID` ASC) VISIBLE,
  INDEX `BenefitsID_idx` (`BenefitsID` ASC) VISIBLE,
  CONSTRAINT `DeptID`
    FOREIGN KEY (`DeptID`)
    REFERENCES `Payroll`.`Department` (`DeptID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `BenefitsID`
    FOREIGN KEY (`BenefitsID`)
    REFERENCES `Payroll`.`Benefits` (`BenefitsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Payroll`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payroll`.`Employee` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `StreetAddress` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(2) NOT NULL,
  `ZipCode` INT NULL,
  `JobID` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  INDEX `JobID_idx` (`JobID` ASC) VISIBLE,
  CONSTRAINT `JobID`
    FOREIGN KEY (`JobID`)
    REFERENCES `Payroll`.`Job` (`JobID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Payroll`.`DirectDeposit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payroll`.`DirectDeposit` (
  `DirectDepositID` INT NOT NULL AUTO_INCREMENT,
  `EmployeeID` INT NOT NULL,
  `RoutingNumber` INT NOT NULL,
  `AccountNumber` INT NOT NULL,
  `BankName` VARCHAR(100) NULL,
  PRIMARY KEY (`DirectDepositID`),
  INDEX `EmployeeID_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `EmployeeID`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Payroll`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Payroll`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payroll`.`Payment` (
  `PaymentID` INT NOT NULL AUTO_INCREMENT,
  `DirectDepositID` INT NOT NULL,
  `PaymentAmount` DECIMAL NOT NULL,
  `PaymentDate` DATE NOT NULL,
  PRIMARY KEY (`PaymentID`),
  INDEX `DirectDepositID_idx` (`DirectDepositID` ASC) VISIBLE,
  CONSTRAINT `DirectDepositID`
    FOREIGN KEY (`DirectDepositID`)
    REFERENCES `Payroll`.`DirectDeposit` (`DirectDepositID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Payroll`.`PayPeriods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payroll`.`PayPeriods` (
  `PayPeriodID` INT NOT NULL AUTO_INCREMENT,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NOT NULL,
  PRIMARY KEY (`PayPeriodID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Payroll`.`TimeWorked`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Payroll`.`TimeWorked` (
  `EmployeeID` INT NOT NULL,
  `PayPeriodID` INT NOT NULL,
  `Hours` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`, `PayPeriodID`),
  INDEX `PayPeriodID_idx` (`PayPeriodID` ASC) VISIBLE,
  CONSTRAINT `PayPeriodID`
    FOREIGN KEY (`PayPeriodID`)
    REFERENCES `Payroll`.`PayPeriods` (`PayPeriodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EmployeePayrollID`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Payroll`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
