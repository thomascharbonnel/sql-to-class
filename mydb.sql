-- MySQL Script generated by MySQL Workbench
-- Tue Aug 19 11:25:18 2014
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Agents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Agents` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Agents` (
  `AgentID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(200) NULL DEFAULT NULL,
  `MiddleName` VARCHAR(200) NULL DEFAULT NULL,
  `LastName` VARCHAR(200) NULL DEFAULT NULL,
  `PhoneNumber` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`AgentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Devices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Devices` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Devices` (
  `DeviceID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Agent` BIGINT UNSIGNED NULL DEFAULT NULL,
  `DeviceState` TINYINT UNSIGNED NULL DEFAULT NULL,
  `NotificationType` TINYINT NULL DEFAULT NULL,
  `BatteryVoltage` DOUBLE NULL DEFAULT NULL,
  `BatteryState` TINYINT NULL DEFAULT NULL,
  `LowBattery` TINYINT NULL DEFAULT NULL,
  `BatteryEmailDatetime` DATETIME NULL DEFAULT NULL,
  `Temperature` DOUBLE NULL DEFAULT NULL,
  `TemperatureState` TINYINT NULL DEFAULT NULL,
  `Ecio` TINYINT NULL DEFAULT NULL,
  `Rssi` TINYINT NULL DEFAULT NULL,
  `ErrorsFound` TINYINT NULL DEFAULT NULL,
  `PendingLocationAck` TINYINT NULL DEFAULT NULL,
  `LastDatetime` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`DeviceID`),
  CONSTRAINT `AgentId`
    FOREIGN KEY (`Agent`)
    REFERENCES `mydb`.`Agents` (`AgentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `AgentId_idx` ON `mydb`.`Devices` (`Agent` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`DriverLicenses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DriverLicenses` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DriverLicenses` (
  `DriverLicenseID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(200) NULL,
  `MiddleName` VARCHAR(200) NULL DEFAULT NULL,
  `LastName` VARCHAR(200) NULL,
  `DateOfBirth` DATE NULL,
  `IssueDate` DATE NULL,
  `ExpirationDate` DATE NULL,
  `Number` VARCHAR(30) NULL,
  `DD` VARCHAR(21) NULL,
  `Address` TEXT NULL,
  `Class` CHAR(1) NULL,
  `End` VARCHAR(4) NULL,
  `Restr` CHAR(1) NULL,
  `Sex` TINYINT NULL,
  `Height` VARCHAR(5) NULL,
  `Weight` VARCHAR(3) NULL,
  `Eyes` VARCHAR(5) NULL,
  `Hair` VARCHAR(3) NULL,
  `StateCountry` VARCHAR(100) NULL,
  `Code` VARCHAR(286) NULL DEFAULT NULL,
  PRIMARY KEY (`DriverLicenseID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mydb`.`Reports`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Reports` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Reports` (
  `ReportID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `EventNumber` BIGINT NULL DEFAULT NULL,
  `CodeRevision` INT NULL DEFAULT NULL,
  `AccidentNumber` BIGINT NULL DEFAULT NULL,
  `CrashType` TINYINT NULL DEFAULT NULL,
  `Area` TINYINT NULL DEFAULT NULL,
  `ReportPurpose` TINYINT NULL DEFAULT NULL,
  `ReportType` TINYINT NULL DEFAULT NULL,
  `Attribute` TINYINT NULL DEFAULT NULL,
  `AgencyName` VARCHAR(200) NULL DEFAULT NULL,
  `CollisionDatetime` DATETIME NULL DEFAULT NULL,
  `BeatSector` VARCHAR(200) NULL DEFAULT NULL,
  `CityOrCounty` TINYINT NULL DEFAULT NULL COMMENT 'Whether it was a city or a county',
  `AccidentCounty` VARCHAR(200) NULL DEFAULT NULL COMMENT 'County where the accident took place.',
  `Surface` TINYINT NULL DEFAULT NULL COMMENT '1. Asphalt, 2. Concrete, 3. Gravel, 4. Dirt, 5. Other',
  `Intersection` TINYINT NULL DEFAULT NULL COMMENT '1. Four Way, 2. > Four Way, 3. T, 4. Y, 5. Roundabout, 6. Other',
  `PaddleMarkers` TINYINT NULL DEFAULT NULL COMMENT '1. None, 2. Left Side, 3. Right Side, 4. Both Sides, 5. Unknown',
  `MileMarker` BIGINT NULL DEFAULT NULL,
  `NumberOfVehicles` SMALLINT NULL DEFAULT NULL,
  `NumberOfNonMotorists` SMALLINT NULL DEFAULT NULL,
  `NumberOfOccupants` SMALLINT NULL DEFAULT NULL,
  `NumberOfFatalities` SMALLINT NULL DEFAULT NULL,
  `NumberOfInjured` SMALLINT NULL DEFAULT NULL,
  `NumberOfRestrained` SMALLINT NULL DEFAULT NULL,
  `IsParkingLot` TINYINT(1) NULL DEFAULT NULL,
  `OccuredOn` VARCHAR(200) NULL DEFAULT NULL COMMENT 'Place where the accident occurred (Highway # or Street Name).',
  `LocationType` TINYINT NULL DEFAULT NULL COMMENT '1. At Intersection With, 2. Or 3. Feet, 4. Miles, 5. Approximate',
  `OfCrossStreet` VARCHAR(200) NULL DEFAULT NULL,
  `AccessControl` TINYINT NULL DEFAULT NULL COMMENT '1. None, 2. Full, 3. Partial',
  `RoadwayCharacter` SMALLINT NULL DEFAULT NULL COMMENT '1. Curve & Grade, 2. Curve & Hillcrest, 3. Curve & Level, 4. Straight & Grade, 5. Straight & Hillcrest, 6. Straight & Level, 7. Unknown, 8. Other',
  `RoadwayCharacterAdd` VARCHAR(200) NULL DEFAULT NULL,
  `RoadwayCondition` SMALLINT NULL DEFAULT NULL COMMENT '1. Dry, 2. Icy, 3. Wet, 4. Snow, 5. Sand / Mud / Oil / Dirt / Gravel, 6. Other, 7. Slush, 8. Standing Water, 9. Moving Water, 10. Unknown',
  `RoadwayConditionAdd` VARCHAR(200) NULL DEFAULT NULL,
  `TotalThruLanes` TINYINT NULL DEFAULT NULL,
  `TotalAllLanes` SMALLINT NULL DEFAULT NULL,
  `TravelLane` DOUBLE NULL DEFAULT NULL,
  `StorageTurnLane` DOUBLE NULL DEFAULT NULL,
  `Median` DOUBLE NULL DEFAULT NULL,
  `PavedShoulderInside` DOUBLE NULL DEFAULT NULL,
  `PavedShoulderOutside` DOUBLE NULL DEFAULT NULL,
  `RoadwayGrade` TINYINT NULL DEFAULT NULL COMMENT '1. Not Determined, 2. Relatively Level Rdw, 3. Up Slope (+), 4. Down Slope (-)',
  `RelativeTo` DOUBLE NULL DEFAULT NULL,
  `Grade` DOUBLE NULL DEFAULT NULL,
  `AtIntersectionWith` VARCHAR(200) NULL DEFAULT NULL,
  `PavementMarkingsAndType` TINYINT NULL DEFAULT NULL COMMENT '11. Other, 12. None, 13. Unknown',
  `HighwayDescription` TINYINT NULL DEFAULT NULL COMMENT '1. Two-Way, Not Divided ; 2. Two-Way, Divided, Upro, Median ; 3. Two-Way, Divided, Median Barrier ; 4. One-Way, Not Divided ; 5. Unknown ; 6. Off Road',
  `WeatherConditions` SMALLINT NULL DEFAULT NULL COMMENT '1. Clear, 2. Cloudy, 3. Snow, 4. Rain, 5. Blowing Sand, Dirt, Soil, Snow ; 6. Other ; 7. Fog, Smog, Smoke, Ash ; 8. Severe Crosswinds ; 9. Sleet / Hall ; 10. Unknown',
  `LightConditions` SMALLINT NULL DEFAULT NULL COMMENT '. Dusk, 2. Dawn, 3. Daylight, 4. Unknown, 5. Other, 6. Dark — No Roadway Lighting ; 7. Dark — Spot Roadway Lighting ; 8. Dark — Continuous Roadway Lighting ; 9. Dark — Unknown Roadway Lightning',
  `VehicleCollisionType` SMALLINT NULL DEFAULT NULL COMMENT '1. Head On, 2. Rear End, 3. Backing, 4. Angle, 5. Read to Rear, 6. Sideswipe',
  `LocationOfFirstEvent` SMALLINT NULL DEFAULT NULL COMMENT '1. Travel Lane, 2. Turn Lane, 3. Gore, 4. Median, 5. Inside Shouler, 6. Outsite Shoulder, 7. Intersection, 8. Private Property, 9. Roadside, 10. Other, 11. Ramp, 12. Unknown',
  `LocationOfFirstEventAdd` VARCHAR(200) NULL DEFAULT NULL,
  `HighwayEnvironmentFactors` SMALLINT NULL DEFAULT NULL COMMENT '1. None, 2. Weather, 3. Debris, 4. Glare, 5. Other Highway, 6. Other Environmental, 7. Shoulders, 8. Road Obstruction, 9. Worn Traffic Surface, 10. Wet, Icy, Snow, Slush ; 11. Ruts, Holes, Bumps ; 12. Active Work Zone ; 13. Inactive Work Zone ; 14. Animal in Roadway ; 15. Unknown',
  `PropertyDamageDescription` VARCHAR(200) NULL DEFAULT NULL,
  `OwnersName` VARCHAR(200) NULL DEFAULT NULL,
  `OwnersAddress` VARCHAR(600) NULL DEFAULT NULL,
  `IsOwnerNotified` TINYINT(1) NULL DEFAULT NULL,
  `FirstHarmfulEventCode` BIGINT NULL DEFAULT NULL,
  `FirstHarmfulEventDescription` TEXT NULL DEFAULT NULL,
  `DescriptionOfAccidentNarrative` TEXT NULL DEFAULT NULL,
  `IsInvestigationComplete` TINYINT(1) NULL DEFAULT NULL,
  `IsPhotosTaken` TINYINT(1) NULL DEFAULT NULL,
  `IsSceneDiagram` TINYINT(1) NULL DEFAULT NULL,
  `IsStatements` TINYINT(1) NULL DEFAULT NULL,
  `NotifiedDateTime` DATETIME NULL DEFAULT NULL,
  `ArrivalDateTime` DATETIME NULL DEFAULT NULL,
  `Investigators` VARCHAR(300) NULL DEFAULT NULL,
  `IdNumber` BIGINT NULL DEFAULT NULL,
  `Date` DATETIME NULL DEFAULT NULL,
  `ReviewedBy` VARCHAR(200) NULL DEFAULT NULL,
  `DateReviewed` DATETIME NULL DEFAULT NULL,
  `Latitude` DOUBLE NULL DEFAULT NULL,
  `Longitude` DOUBLE NULL DEFAULT NULL,
  `Day` DATETIME NULL DEFAULT NULL,
  `SurfaceAdd` VARCHAR(300) NULL DEFAULT NULL,
  `IntersectionAdd` VARCHAR(300) NULL DEFAULT NULL,
  `FirstHarmfulEventAccidentDescription` VARCHAR(500) NULL DEFAULT NULL,
  `MedianForAverageRoadwayWidth` VARCHAR(300) NULL DEFAULT NULL,
  `PavementMarkingsAndTypeAdd` VARCHAR(300) NULL DEFAULT NULL,
  `WeatherConditionsAdd` VARCHAR(300) NULL DEFAULT NULL,
  `LightConditionsAdd` VARCHAR(300) NULL DEFAULT NULL,
  `AddressMap` VARCHAR(500) NULL DEFAULT NULL,
  `AgencyNameTypeCounty` TINYINT(1) NULL DEFAULT NULL,
  `AgencyNameTypeCity` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ReportID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Vehicles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Vehicles` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Vehicles` (
  `VehicleID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Report` BIGINT UNSIGNED NOT NULL COMMENT 'Why are Vehicles and Reports linked when there is already a connection through Occupants, you might ask? Well, there can be a vehicle which took part in the accident AND with no occupant found (or no occupant at all). Yes, I am being paranoid.',
  `VehicleNumber` VARCHAR(200) NULL DEFAULT NULL,
  `NumberOfOccupants` BIGINT NULL DEFAULT NULL,
  `IsAtFault` TINYINT(1) NULL DEFAULT NULL,
  `VIN` VARCHAR(100) NULL DEFAULT NULL,
  `Plate` VARCHAR(100) NULL DEFAULT NULL,
  `State` VARCHAR(100) NULL DEFAULT NULL,
  `Type` VARCHAR(100) NULL DEFAULT NULL,
  `IsTrailingUnit` TINYINT(1) NULL DEFAULT NULL,
  `IsNonContact` TINYINT(1) NULL DEFAULT NULL,
  `TravelLane` VARCHAR(200) NULL DEFAULT NULL,
  `HighwayStreetName` VARCHAR(300) NULL DEFAULT NULL,
  `DirectionOfTravel` TINYINT NULL DEFAULT NULL,
  `VehicleAction` TINYINT NULL DEFAULT NULL,
  `VehicleActionAdd` VARCHAR(300) NULL DEFAULT NULL,
  PRIMARY KEY (`VehicleID`),
  CONSTRAINT `Report`
    FOREIGN KEY (`Report`)
    REFERENCES `mydb`.`Reports` (`ReportID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `Report_idx` ON `mydb`.`Vehicles` (`Report` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Occupants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Occupants` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Occupants` (
  `OccupantID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Report` BIGINT UNSIGNED NOT NULL,
  `Vehicle` BIGINT UNSIGNED NULL DEFAULT NULL,
  `FirstName` VARCHAR(200) NULL DEFAULT NULL,
  `MiddleName` VARCHAR(200) NULL DEFAULT NULL,
  `LastName` VARCHAR(200) NULL DEFAULT NULL,
  `Suffix` VARCHAR(10) NULL DEFAULT NULL,
  `StreetAddress` TEXT NULL DEFAULT NULL,
  `City` VARCHAR(200) NULL DEFAULT NULL,
  `StateCountry` VARCHAR(200) NULL DEFAULT NULL,
  `ZipCode` VARCHAR(45) NULL DEFAULT NULL,
  `Sex` VARCHAR(1) NULL DEFAULT NULL,
  `DateOfBirth` DATE NULL DEFAULT NULL,
  `PhoneNumber` VARCHAR(200) NULL DEFAULT NULL,
  `TransportedBy` TINYINT NULL DEFAULT NULL,
  `TransportedTo` VARCHAR(200) NULL DEFAULT NULL,
  `PersonType` VARCHAR(200) NULL DEFAULT NULL,
  `SeatingPosition` VARCHAR(200) NULL DEFAULT NULL,
  `OccupantRestraints` TINYINT(1) NULL DEFAULT NULL,
  `InjurySeverity` TINYINT NULL DEFAULT NULL,
  `InjuryLocation` VARCHAR(200) NULL DEFAULT NULL,
  `Airbags` VARCHAR(200) NULL DEFAULT NULL,
  `AirbagSwitch` VARCHAR(200) NULL DEFAULT NULL,
  `Ejected` VARCHAR(200) NULL DEFAULT NULL,
  `Trapped` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`OccupantID`),
  CONSTRAINT `Vehicle`
    FOREIGN KEY (`Vehicle`)
    REFERENCES `mydb`.`Vehicles` (`VehicleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Report`
    FOREIGN KEY (`Report`)
    REFERENCES `mydb`.`Reports` (`ReportID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Vehicle_idx` ON `mydb`.`Occupants` (`Vehicle` ASC);

CREATE INDEX `Report_idx` ON `mydb`.`Occupants` (`Report` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Drivers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Drivers` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Drivers` (
  `DriverInformationID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `DriverLicense` BIGINT UNSIGNED NULL DEFAULT NULL COMMENT 'If the driver was not identified, it is possible that the link between the Driver and its license has not been made yet.',
  `Occupant` BIGINT UNSIGNED NULL DEFAULT NULL,
  `OperatorLicenseNumber` VARCHAR(200) NULL DEFAULT NULL,
  `Class` VARCHAR(45) NULL DEFAULT NULL,
  `CdlOrDl` TINYINT NULL DEFAULT NULL,
  `LicenseStatus` VARCHAR(100) NULL,
  `Compliance` TINYINT NULL,
  `Endorsement0` VARCHAR(45) NULL,
  `Endorsement1` VARCHAR(45) NULL,
  `Endorsement2` VARCHAR(45) NULL,
  `Restriction0` VARCHAR(45) NULL,
  `Restriction1` VARCHAR(45) NULL,
  `Restriction2` VARCHAR(45) NULL,
  `AlcoholInvolvement` TINYINT NULL,
  `MethodOfDetermination` TINYINT NULL,
  `TestResults` VARCHAR(45) NULL,
  `DriverFactors` MEDIUMINT NULL,
  `VehicleYear` INT NULL,
  `VehicleMake` VARCHAR(45) NULL,
  `VehicleModel` VARCHAR(45) NULL,
  `VehicleType` VARCHAR(45) NULL,
  `PlatePermitNumber` VARCHAR(100) NULL,
  `State` VARCHAR(100) NULL,
  `ExpirationDate` DATETIME NULL,
  `VehicleColor` VARCHAR(100) NULL,
  `VehicleIdentificationNumber` VARCHAR(100) NULL,
  `IsRegisteredOwnerName` TINYINT(1) NULL DEFAULT NULL,
  `RegisteredOwnerNameAdd` VARCHAR(200) NULL DEFAULT NULL,
  `RegisteredOwnerAddress` VARCHAR(200) NULL DEFAULT NULL,
  `InsuranceCompanyName` VARCHAR(200) NULL DEFAULT NULL,
  `InsuranceCompanyAddress` VARCHAR(200) NULL DEFAULT NULL,
  `PolicyNumber` VARCHAR(200) NULL DEFAULT NULL,
  `Effective` DATETIME NULL DEFAULT NULL,
  `To` DATETIME NULL DEFAULT NULL,
  `IsVehicleTowed` TINYINT(1) NULL DEFAULT NULL,
  `TowedBy` VARCHAR(200) NULL DEFAULT NULL,
  `RemovedTo` VARCHAR(200) NULL DEFAULT NULL,
  `VehicleFactors` INT NULL DEFAULT NULL,
  `FirstContact` TINYINT NULL DEFAULT NULL,
  `IsOverRide` TINYINT(1) NULL DEFAULT NULL,
  `DamagedAreas` MEDIUMINT NULL DEFAULT NULL,
  `TrafficControl` INT NULL DEFAULT NULL,
  `DistanceTraveledAfterImpact` DOUBLE NULL DEFAULT NULL,
  `SpeedEstimateFrom` DOUBLE NULL DEFAULT NULL,
  `SpeedEstimateTo` DOUBLE NULL DEFAULT NULL,
  `SpeedEstimateLimit` DOUBLE NULL DEFAULT NULL,
  `ExtentOfDamage` TINYINT NULL DEFAULT NULL,
  `NRS0` TINYINT NULL DEFAULT NULL,
  `NRS1` TINYINT NULL DEFAULT NULL,
  `Violation0` VARCHAR(45) NULL DEFAULT NULL,
  `Violation1` VARCHAR(45) NULL DEFAULT NULL,
  `NOC0` VARCHAR(45) NULL DEFAULT NULL,
  `NOC1` VARCHAR(45) NULL DEFAULT NULL,
  `CitationNumber0` VARCHAR(45) NULL DEFAULT NULL,
  `CitationNumber1` VARCHAR(45) NULL DEFAULT NULL,
  `SOECode0` VARCHAR(45) NULL DEFAULT NULL,
  `SOECode1` VARCHAR(45) NULL DEFAULT NULL,
  `SOECode2` VARCHAR(45) NULL DEFAULT NULL,
  `SOECode3` VARCHAR(45) NULL DEFAULT NULL,
  `SOECode4` VARCHAR(45) NULL DEFAULT NULL,
  `SOEDescription0` VARCHAR(45) NULL DEFAULT NULL,
  `SOEDescription1` VARCHAR(45) NULL DEFAULT NULL,
  `SOEDescription2` VARCHAR(45) NULL DEFAULT NULL,
  `SOEDescription3` VARCHAR(45) NULL DEFAULT NULL,
  `SOEDescription4` VARCHAR(45) NULL DEFAULT NULL,
  `SOECollisionWithFixedObject0` TINYINT(1) NULL DEFAULT NULL,
  `SOECollisionWithFixedObject1` TINYINT(1) NULL DEFAULT NULL,
  `SOECollisionWithFixedObject2` TINYINT(1) NULL DEFAULT NULL,
  `SOECollisionWithFixedObject3` TINYINT(1) NULL DEFAULT NULL,
  `SOECollisionWithFixedObject4` TINYINT(1) NULL DEFAULT NULL,
  `SOEMostHarmfulEvent0` TINYINT(1) NULL DEFAULT NULL,
  `SOEMostHarmfulEvent1` TINYINT(1) NULL DEFAULT NULL,
  `SOEMostHarmfulEvent2` TINYINT(1) NULL DEFAULT NULL,
  `SOEMostHarmfulEvent3` TINYINT(1) NULL DEFAULT NULL,
  `SOEMostHarmfulEvent4` TINYINT(1) NULL DEFAULT NULL,
  `NRSComment0` VARCHAR(100) NULL DEFAULT NULL,
  `NRSComment1` VARCHAR(100) NULL DEFAULT NULL,
  `IsCommercialVehicle` TINYINT(1) NULL DEFAULT NULL,
  `CommercialVehicleConfiguration` MEDIUMINT NULL DEFAULT NULL,
  `Source` TINYINT NULL DEFAULT NULL,
  `CarrierName` VARCHAR(100) NULL DEFAULT NULL,
  `PowerUnitGvwr` TINYINT NULL DEFAULT NULL,
  `IsHazMat` TINYINT(1) NULL DEFAULT NULL,
  `CarrierStreetAddress` VARCHAR(100) NULL DEFAULT NULL,
  `CarrierCity` VARCHAR(100) NULL DEFAULT NULL,
  `CarrierState` VARCHAR(100) NULL DEFAULT NULL,
  `CarrierZip` VARCHAR(100) NULL DEFAULT NULL,
  `CargoBodyType` MEDIUMINT NULL DEFAULT NULL,
  `HazMatId` VARCHAR(100) NULL DEFAULT NULL,
  `HazardClassificationNumber` VARCHAR(100) NULL DEFAULT NULL,
  `TypeOfCarrier` TINYINT NULL DEFAULT NULL,
  `NasSafetyReportNumber` VARCHAR(100) NULL DEFAULT NULL,
  `CarrierNumber` VARCHAR(100) NULL DEFAULT NULL,
  `IsInsured` TINYINT(1) NULL DEFAULT NULL,
  `DriverFactorsAdd` VARCHAR(300) NULL DEFAULT NULL,
  `DamagedAreasAdd` VARCHAR(300) NULL DEFAULT NULL,
  `SourceAdd` VARCHAR(200) NULL DEFAULT NULL,
  `TrailingUnit` TINYINT(1) NULL DEFAULT NULL,
  `CommercialVehicleConfigurationAdd` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`DriverInformationID`),
  CONSTRAINT `DrivingLicenceId`
    FOREIGN KEY (`DriverLicense`)
    REFERENCES `mydb`.`DriverLicenses` (`DriverLicenseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OccupantId`
    FOREIGN KEY (`Occupant`)
    REFERENCES `mydb`.`Occupants` (`OccupantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `DrivingLicenceId_idx` ON `mydb`.`Drivers` (`DriverLicense` ASC);

CREATE INDEX `OccupantId_idx` ON `mydb`.`Drivers` (`Occupant` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`DriverInformations_Reports`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`DriverInformations_Reports` ;

CREATE TABLE IF NOT EXISTS `mydb`.`DriverInformations_Reports` (
  `Report` BIGINT UNSIGNED NOT NULL,
  `DriverInformation` BIGINT UNSIGNED NOT NULL,
  CONSTRAINT `Report`
    FOREIGN KEY (`Report`)
    REFERENCES `mydb`.`Reports` (`ReportID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DriverInformation`
    FOREIGN KEY (`DriverInformation`)
    REFERENCES `mydb`.`Drivers` (`DriverInformationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `ReportId_idx` ON `mydb`.`DriverInformations_Reports` (`Report` ASC);

CREATE INDEX `DriverInformation_idx` ON `mydb`.`DriverInformations_Reports` (`DriverInformation` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`NonMotorists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`NonMotorists` ;

CREATE TABLE IF NOT EXISTS `mydb`.`NonMotorists` (
  `NonMotoristID` BIGINT UNSIGNED NOT NULL,
  `Occupant` BIGINT UNSIGNED NULL,
  PRIMARY KEY (`NonMotoristID`),
  CONSTRAINT `Occupant`
    FOREIGN KEY (`Occupant`)
    REFERENCES `mydb`.`Occupants` (`OccupantID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Occupant_idx` ON `mydb`.`NonMotorists` (`Occupant` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
