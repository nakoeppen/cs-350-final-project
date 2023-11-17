-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: payroll
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `benefits`
--

DROP TABLE IF EXISTS `benefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benefits` (
  `BenefitsID` int NOT NULL AUTO_INCREMENT,
  `HealthInsuranceTier` varchar(10) NOT NULL,
  `401K` decimal(10,0) DEFAULT NULL,
  `HSA` decimal(10,0) DEFAULT NULL,
  `PaidTimeOff` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BenefitsID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benefits`
--

LOCK TABLES `benefits` WRITE;
/*!40000 ALTER TABLE `benefits` DISABLE KEYS */;
INSERT INTO `benefits` VALUES (1,'Bronze',3,1000,'40'),(2,'Bronze',5,1000,'50'),(3,'Silver',5,1000,'60'),(4,'Silver',10,2000,'70'),(5,'Gold',5,2000,'80'),(6,'Gold',10,4000,'80'),(7,'Platinum',10,4000,'100');
/*!40000 ALTER TABLE `benefits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DeptID` varchar(4) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Budget` decimal(10,0) NOT NULL,
  `Category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DeptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('FM','Facilities Management',1000000,NULL),('HR','Human Resouces',200000,NULL),('IT','Information Technology',500000,NULL),('PO','Presidents Office',500000,NULL),('SL','Student Life',2500000,NULL),('TF','Teaching Faculty',1000000,NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directdeposit`
--

DROP TABLE IF EXISTS `directdeposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directdeposit` (
  `DirectDepositID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int NOT NULL,
  `RoutingNumber` int NOT NULL,
  `AccountNumber` int NOT NULL,
  `BankName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DirectDepositID`),
  KEY `EmployeeID_idx` (`EmployeeID`),
  CONSTRAINT `EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directdeposit`
--

LOCK TABLES `directdeposit` WRITE;
/*!40000 ALTER TABLE `directdeposit` DISABLE KEYS */;
INSERT INTO `directdeposit` VALUES (1,1,123456,654321,'Chase Manhattan Bank'),(2,2,654321,123456,'Fifth Third Bank'),(3,3,98765,567890,'Home State Bank'),(4,4,567890,98765,'First Source Bank'),(5,5,587392,829040,'Centier Bank'),(6,6,374850,383905,'Boeing Employees Credit Union');
/*!40000 ALTER TABLE `directdeposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `StreetAddress` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(2) NOT NULL,
  `ZipCode` int DEFAULT NULL,
  `JobID` varchar(5) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `JobID_idx` (`JobID`),
  CONSTRAINT `JobID` FOREIGN KEY (`JobID`) REFERENCES `job` (`JobID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Nicholas','Rosasco','2305 Chicago Street','Valparaiso','IN',46383,'PROF'),(2,'Timothy','Malchow','','Valparaiso','IN',46383,'PROF'),(3,'Jose','Padilla','','Valparaiso','IN',46383,'PRES'),(4,'Carrie','Whittier','','Valparaiso','IN',46383,'DSL'),(5,'Gregg','Johnson','','Valparaiso','IN',46383,'DEAN'),(6,'Nicholas','Koeppen','306 Lafayette Street','Valparaiso','IN',46383,'NA'),(7,'Benjamin','Koeppen','306 Lafayette Street','Valparaiso','IN',46383,'JAN'),(8,'Spencer','Gannon','306 Lafayette Street','Valparaiso','IN',46383,'LAND');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `JobID` varchar(5) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `DeptID` varchar(4) NOT NULL,
  `HourlyRate` decimal(10,0) NOT NULL,
  `BenefitsID` int NOT NULL,
  PRIMARY KEY (`JobID`),
  KEY `DeptID_idx` (`DeptID`),
  KEY `BenefitsID_idx` (`BenefitsID`),
  CONSTRAINT `BenefitsID` FOREIGN KEY (`BenefitsID`) REFERENCES `benefits` (`BenefitsID`),
  CONSTRAINT `DeptID` FOREIGN KEY (`DeptID`) REFERENCES `department` (`DeptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES ('DEAN','Dean','TF',75,6),('DSL','Director of Student Life','SL',60,5),('JAN','Janitor','FM',25,2),('LAND','Landscaping','FM',20,1),('NA','Network Analyst','IT',40,3),('PRES','President','PO',100,7),('PROF','Professor','TF',30,3);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jobSecurity` AFTER UPDATE ON `job` FOR EACH ROW BEGIN
           IF NEW.HourlyRate < OLD.HourlyRate THEN
			   SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Notify Manager of Payroll decrease!';
			END IF;
       END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `DirectDepositID` int NOT NULL,
  `PaymentAmount` decimal(10,0) NOT NULL,
  `PaymentDate` date NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `DirectDepositID_idx` (`DirectDepositID`),
  CONSTRAINT `DirectDepositID` FOREIGN KEY (`DirectDepositID`) REFERENCES `directdeposit` (`DirectDepositID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1226,'2023-11-13'),(2,2,1326,'2023-11-13'),(3,3,2551,'2023-11-13'),(4,4,1431,'2023-11-13'),(5,5,1651,'2023-11-13');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payperiods`
--

DROP TABLE IF EXISTS `payperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payperiods` (
  `PayPeriodID` int NOT NULL AUTO_INCREMENT,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  PRIMARY KEY (`PayPeriodID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payperiods`
--

LOCK TABLES `payperiods` WRITE;
/*!40000 ALTER TABLE `payperiods` DISABLE KEYS */;
INSERT INTO `payperiods` VALUES (1,'2023-09-01','2023-09-15'),(2,'2023-09-15','2023-09-29'),(3,'2023-09-29','2023-10-13'),(4,'2023-10-13','2023-10-27');
/*!40000 ALTER TABLE `payperiods` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SafePayPeriods` BEFORE DELETE ON `payperiods` FOR EACH ROW BEGIN
           DELETE FROM timeworked
           WHERE timeworked.PayPeriodID = OLD.PayPeriodID;
       END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `timeworked`
--

DROP TABLE IF EXISTS `timeworked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeworked` (
  `EmployeeID` int NOT NULL,
  `PayPeriodID` int NOT NULL,
  `Hours` int NOT NULL,
  PRIMARY KEY (`EmployeeID`,`PayPeriodID`),
  KEY `PayPeriodID_idx` (`PayPeriodID`),
  CONSTRAINT `EmployeePayrollID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `PayPeriodID` FOREIGN KEY (`PayPeriodID`) REFERENCES `payperiods` (`PayPeriodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeworked`
--

LOCK TABLES `timeworked` WRITE;
/*!40000 ALTER TABLE `timeworked` DISABLE KEYS */;
INSERT INTO `timeworked` VALUES (1,1,80),(1,2,80),(1,3,80),(2,1,40),(2,2,40),(2,3,40),(3,1,60),(3,2,60),(3,3,60),(4,1,40),(4,2,40),(4,3,40),(5,1,40),(5,2,40),(5,3,40);
/*!40000 ALTER TABLE `timeworked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'payroll'
--

--
-- Dumping routines for database 'payroll'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetSpendingForDepartment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSpendingForDepartment`(IN pDept VARCHAR(4))
begin
	SELECT SUM(payment.PaymentAmount) AS 'Expenses'
	FROM payment JOIN directdeposit ON payment.DirectDepositID = directdeposit.DirectDepositID
	JOIN employee ON employee.EmployeeID = directdeposit.EmployeeID
	JOIN job ON employee.JobID = job.JobID
	JOIN department ON job.DeptID = department.DeptID
	WHERE department.DeptID = pDept AND YEAR(payment.PaymentDate) = YEAR(CURDATE());
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-17 12:24:44
