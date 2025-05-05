-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: health_lanka
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `user_id` int NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `access_level` enum('basic','advanced','super') DEFAULT NULL,
  `datejoined` date DEFAULT NULL,
  `publicbio` text,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (5,'Primary Administrator','super','2020-01-15','System Administration and Maintenance');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_ID` int DEFAULT NULL,
  `patient_ID` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,3,1,'2025-05-09','09:07:00','Pending'),(2,5,1,'2025-05-14','13:50:00','Pending');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `user_id` int NOT NULL,
  `publicbio` text,
  `specialization` varchar(100) DEFAULT NULL,
  `license_no` varchar(50) DEFAULT NULL,
  `experience` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `license_no` (`license_no`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'General Medicine Specialist','General Practice','MED-LK-789456',10),(4,'Pediatric Specialist','Pediatrics','PED-LK-321654',7);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_prescription`
--

DROP TABLE IF EXISTS `drug_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug_prescription` (
  `prescription_id` int NOT NULL,
  `drug_id` int NOT NULL,
  PRIMARY KEY (`prescription_id`,`drug_id`),
  KEY `drug_id` (`drug_id`),
  CONSTRAINT `drug_prescription_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`id`),
  CONSTRAINT `drug_prescription_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_prescription`
--

LOCK TABLES `drug_prescription` WRITE;
/*!40000 ALTER TABLE `drug_prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_patient`
--

DROP TABLE IF EXISTS `emergency_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `severity` enum('low','medium','high','critical') DEFAULT NULL,
  `problem` varchar(255) DEFAULT NULL,
  `description` text,
  `doctor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `emergency_patient_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_patient`
--

LOCK TABLES `emergency_patient` WRITE;
/*!40000 ALTER TABLE `emergency_patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_report`
--

DROP TABLE IF EXISTS `lab_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `summary` text,
  `description` text,
  `patient_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `lab_report_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`user_id`),
  CONSTRAINT `lab_report_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_report`
--

LOCK TABLES `lab_report` WRITE;
/*!40000 ALTER TABLE `lab_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `user_id` int NOT NULL,
  `bloodtype` enum('A+','A-','B+','B-','AB+','AB-','O+','O-','unknown') DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `allergies` text,
  `med_history` text,
  `notes` text,
  `genetic_predispositions` text,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (2,'B+','male','Penicillin','2019 Appendicitis Surgery','Regular Check-ups','Heart Disease'),(3,'O+','male','None','Past Asthma','Annual Check-ups Required','Mental Health'),(10,'unknown','other','','','','');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmake`
--

DROP TABLE IF EXISTS `paymentmake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmake` (
  `payID` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `patientID` int DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `service` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`payID`),
  KEY `patientID` (`patientID`),
  CONSTRAINT `paymentmake_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmake`
--

LOCK TABLES `paymentmake` WRITE;
/*!40000 ALTER TABLE `paymentmake` DISABLE KEYS */;
INSERT INTO `paymentmake` VALUES (1,'sdljlsj',2,'08098018282','hkdahd@gmail.com','Tests',34667.00);
/*!40000 ALTER TABLE `paymentmake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_of_issue` date DEFAULT NULL,
  `dietary_advice` text,
  `doctors_notes` text,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`user_id`),
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_labreport`
--

DROP TABLE IF EXISTS `request_labreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_labreport` (
  `labreport_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  PRIMARY KEY (`labreport_id`,`doctor_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `request_labreport_ibfk_1` FOREIGN KEY (`labreport_id`) REFERENCES `lab_report` (`id`),
  CONSTRAINT `request_labreport_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_labreport`
--

LOCK TABLES `request_labreport` WRITE;
/*!40000 ALTER TABLE `request_labreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_labreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surgery`
--

DROP TABLE IF EXISTS `surgery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surgery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `completion_status` enum('completed','in progress','scheduled') DEFAULT NULL,
  `acceptance_status` enum('accepted','pending','rejected') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surgery`
--

LOCK TABLES `surgery` WRITE;
/*!40000 ALTER TABLE `surgery` DISABLE KEYS */;
/*!40000 ALTER TABLE `surgery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surgery_recommendations`
--

DROP TABLE IF EXISTS `surgery_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surgery_recommendations` (
  `surgery_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  PRIMARY KEY (`surgery_id`,`doctor_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `surgery_recommendations_ibfk_1` FOREIGN KEY (`surgery_id`) REFERENCES `surgery` (`id`),
  CONSTRAINT `surgery_recommendations_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surgery_recommendations`
--

LOCK TABLES `surgery_recommendations` WRITE;
/*!40000 ALTER TABLE `surgery_recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `surgery_recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `bio` text,
  `dateofbirth` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `profilepiclink` varchar(255) DEFAULT NULL,
  `role` enum('doctor','patient','admin') NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'moditha','secure123','Moditha Marasingha','General Practitioner','1990-05-15','moditha@health.lk','0771234567','Colombo','English','testimg.jpeg','doctor'),(2,'sharukalal','pass456','Sharuka Sunthush','Patient Profile','1985-12-01','sharuka@mail.com','0719876543','Gampaha','English','testimg.jpeg','patient'),(3,'hasindupriya','hasindu789','Hasindu Chanuka','Personal User','2000-08-22','hasindu@test.lk','0761122334','Kandy','English','testimg.jpeg','patient'),(4,'anjaleefernando','anj#2025','Anjalee','Pediatrician','1988-03-30','anjalee@health.lk','0704455667','Ratnapura','English','testimg.jpeg','doctor'),(5,'nimalperera','Admin@1234','Nimal Perera','System Administrator','1995-07-10','nimal@health.lk','0112345678','Kaduwela','English','testimg.jpeg','admin'),(10,'Chani112','chani123','Chanindu Isuranga','','2007-11-21','chani@gmail.com','0777777112','nittabuwa, main st','','testimg.jpeg','patient');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccinated_patient`
--

DROP TABLE IF EXISTS `vaccinated_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccinated_patient` (
  `patient_id` int NOT NULL,
  `vaccine_id` int NOT NULL,
  PRIMARY KEY (`patient_id`,`vaccine_id`),
  KEY `vaccine_id` (`vaccine_id`),
  CONSTRAINT `vaccinated_patient_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`user_id`),
  CONSTRAINT `vaccinated_patient_ibfk_2` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccination` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccinated_patient`
--

LOCK TABLES `vaccinated_patient` WRITE;
/*!40000 ALTER TABLE `vaccinated_patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `vaccinated_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccination`
--

DROP TABLE IF EXISTS `vaccination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccination` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `date_of_vaccination` date DEFAULT NULL,
  `status` enum('scheduled','completed','cancelled') DEFAULT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `vaccination_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccination`
--

LOCK TABLES `vaccination` WRITE;
/*!40000 ALTER TABLE `vaccination` DISABLE KEYS */;
/*!40000 ALTER TABLE `vaccination` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-05 10:23:17
