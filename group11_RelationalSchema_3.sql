-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema online_travel_reservation
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema online_travel_reservation
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online_travel_reservation` DEFAULT CHARACTER SET utf8 ;
USE `online_travel_reservation` ;


-- -----------------------------------------------------
-- Table `online_travel_reservation`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_travel_reservation`.`users` (
  `userId` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `idUser_UNIQUE` (`userId` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_travel_reservation`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_travel_reservation`.`employee` (
  `employeeId` INT(11) NOT NULL,
  INDEX `fk_employee_user1_idx` (`employeeId` ASC),
  CONSTRAINT `fk_employee_user1`
    FOREIGN KEY (`employeeId`)
    REFERENCES `online_travel_reservation`.`users` (`userId`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_travel_reservation`.`administrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_travel_reservation`.`administrator` (
  `adminId` INT(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`adminId`),
  INDEX `fk_admin_employee1_idx` (`adminId` ASC),
  CONSTRAINT `fk_admin_employee1`
    FOREIGN KEY (`adminId`)
    REFERENCES `online_travel_reservation`.`employee` (`employeeId`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_travel_reservation`.`aircraft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_travel_reservation`.`aircraft` (
  `aircraftId` INT(11) NOT NULL AUTO_INCREMENT,
  `aircraftName` VARCHAR(45) NOT NULL,
  `operationDays` VARCHAR(255) NOT NULL,
  `numOfSeats` INT(11) NOT NULL,
  PRIMARY KEY (`aircraftId`),
  UNIQUE INDEX `aircraftId_UNIQUE` (`aircraftId` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_travel_reservation`.`airline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_travel_reservation`.`airline` (
  `airlineId` INT(11) NOT NULL,
  `airlineAbbr` VARCHAR(2) NOT NULL,
  `airlineFullName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`airlineId`),
  UNIQUE INDEX `airlineId_UNIQUE` (`airlineId` ASC),
  UNIQUE INDEX `airlineAbbr_UNIQUE` (`airlineAbbr` ASC),
  UNIQUE INDEX `airlineFullName_UNIQUE` (`airlineFullName` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_travel_reservation`.`airport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_travel_reservation`.`airport` (
  `airportId` INT(11) NOT NULL AUTO_INCREMENT,
  `airportAbbr` VARCHAR(3) NOT NULL,
  `airportFullName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`airportId`),
  UNIQUE INDEX `airportId_UNIQUE` (`airportId` ASC),
  UNIQUE INDEX `airportFullName_UNIQUE` (`airportFullName` ASC),
  UNIQUE INDEX `airportAbbr_UNIQUE` (`airportAbbr` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_travel_reservation`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_travel_reservation`.`customer` (
  `customerId` INT(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customerId`),
  CONSTRAINT `fk_customer_user1`
    FOREIGN KEY (`customerId`)
    REFERENCES `online_travel_reservation`.`users` (`userId`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_travel_reservation`.`flight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_travel_reservation`.`flight` (
  `flightId` VARCHAR(45) NOT NULL,
  `flightNumber` VARCHAR(6) NOT NULL,
  `destinationAirport` VARCHAR(45) NOT NULL,
  `departureAirport` VARCHAR(45) NOT NULL,
  `numStops` VARCHAR(45) NOT NULL,
  `numberOfSeatsAvailable` INT(11) NOT NULL,
  `departureDate` VARCHAR(45) NOT NULL,
  `arrivalDate` VARCHAR(45) NOT NULL,
  `departureTime` VARCHAR(45) NOT NULL,
  `arrivalTime` VARCHAR(45) NOT NULL,
  `timeInAir` VARCHAR(45) NOT NULL,
  `airline_airportId` INT(11) NOT NULL,
  `airport_airportId` INT(11) NOT NULL,
  `aircraft_aircraftId` INT(11) NOT NULL,
  `month` INT(11) NOT NULL,
  `year` INT(11) NOT NULL,
  `price` INT(11) NOT NULL,
  PRIMARY KEY (`flightId`),
  UNIQUE INDEX `flightId_UNIQUE` (`flightId` ASC),
  UNIQUE INDEX `flightNumber_UNIQUE` (`flightNumber` ASC),
  INDEX `fk_flight_airline1_idx` (`airline_airportId` ASC),
  INDEX `fk_flight_airport1_idx` (`airport_airportId` ASC),
  INDEX `fk_flight_aircraft1_idx` (`aircraft_aircraftId` ASC),
  CONSTRAINT `fk_flight_aircraft1`
    FOREIGN KEY (`aircraft_aircraftId`)
    REFERENCES `online_travel_reservation`.`aircraft` (`aircraftId`),
  CONSTRAINT `fk_flight_airline1`
    FOREIGN KEY (`airline_airportId`)
    REFERENCES `online_travel_reservation`.`airline` (`airlineId`),
  CONSTRAINT `fk_flight_airport1`
    FOREIGN KEY (`airport_airportId`)
    REFERENCES `online_travel_reservation`.`airport` (`airportId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `online_travel_reservation`.`waiting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_travel_reservation`.`waiting` (
  `customerId` VARCHAR(45) NOT NULL,
  `flightId` VARCHAR(6) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `online_travel_reservation`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_travel_reservation`.`ticket` (
  `ticketId` INT(11) NOT NULL AUTO_INCREMENT,
  `fromAirport` VARCHAR(45) NOT NULL,
  `toAirport` VARCHAR(45) NOT NULL,
  `seatNumber` VARCHAR(45) NOT NULL,
  `totalFare` VARCHAR(4) NOT NULL,
  `flight_flightId` VARCHAR(45) NOT NULL,
  `class` VARCHAR(45) NOT NULL,
  `flightNumber` VARCHAR(45) NOT NULL,
  `departureDate` VARCHAR(45) NOT NULL,
  `departureTime` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `dateBooked` VARCHAR(45) NOT NULL,
  `timeBooked` VARCHAR(45) NOT NULL,
  `customerId` VARCHAR(45) NOT NULL,
  `monthBooked` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ticketId`),
  UNIQUE INDEX `ticketId_UNIQUE` (`ticketId` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



-- -----------------------------------------------------
-- Table `online_travel_reservation`.`customerrep`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_travel_reservation`.`customerrep` (
  `customerRepId` INT(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customerRepId`),
  INDEX `fk_customerRep_employee1_idx` (`customerRepId` ASC),
  CONSTRAINT `fk_customerRep_employee1`
    FOREIGN KEY (`customerRepId`)
    REFERENCES `online_travel_reservation`.`employee` (`employeeId`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_travel_reservation`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_travel_reservation`.`question` (
  `questionId` INT(11) NOT NULL AUTO_INCREMENT,
  `message` VARCHAR(255) NOT NULL,
  `reply` VARCHAR(255) NOT NULL,
  `customer_user_userId` INT(11) NOT NULL,
  `answered` VARCHAR(45) NOT NULL,
  `alert` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`questionId`),
  UNIQUE INDEX `questionId_UNIQUE` (`questionId` ASC),
  INDEX `fk_question_customer1_idx` (`customer_user_userId` ASC),
  CONSTRAINT `fk_question_customer1`
    FOREIGN KEY (`customer_user_userId`)
    REFERENCES `online_travel_reservation`.`customer` (`customerId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


insert into users values (null);
insert into users values (null);
insert into employee values (1);
insert into employee values (2);
insert into administrator values (1, "admin@email.com", "adpass", "Generic", "Boss");
insert into customerrep values (2, "emp@email.com", "empass", "Basic", "Worker");
insert into airline values (1, "AA", "American Airlines");
insert into airline values (2, "JB", "Jetblue");
insert into airline values (3, "SW", "Southwest");


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
