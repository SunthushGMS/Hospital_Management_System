-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: health_lanka
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `user_id` int NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `access_level` enum('basic','advanced','super') DEFAULT NULL,
  `datejoined` date DEFAULT NULL,
  `publicbio` text,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (5,'Primary Administrator','super','2020-01-15','System Administration and Maintenance');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Appointment`
--

DROP TABLE IF EXISTS `Appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `status` enum('accept','rescheduled') DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `Doctor` (`user_id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointment`
--

LOCK TABLES `Appointment` WRITE;
/*!40000 ALTER TABLE `Appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Doctor` (
  `user_id` int NOT NULL,
  `publicbio` text,
  `specialization` varchar(100) DEFAULT NULL,
  `license_no` varchar(50) DEFAULT NULL,
  `experience` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `license_no` (`license_no`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor` VALUES (1,'General Medicine Specialist','General Practice','MED-LK-789456',10),(4,'Pediatric Specialist','Pediatrics','PED-LK-321654',7);
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Drug`
--

DROP TABLE IF EXISTS `Drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Drug` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drug`
--

LOCK TABLES `Drug` WRITE;
/*!40000 ALTER TABLE `Drug` DISABLE KEYS */;
/*!40000 ALTER TABLE `Drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Drug_Prescription`
--

DROP TABLE IF EXISTS `Drug_Prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Drug_Prescription` (
  `prescription_id` int NOT NULL,
  `drug_id` int NOT NULL,
  PRIMARY KEY (`prescription_id`,`drug_id`),
  KEY `drug_id` (`drug_id`),
  CONSTRAINT `drug_prescription_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `Prescription` (`id`),
  CONSTRAINT `drug_prescription_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `Drug` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drug_Prescription`
--

LOCK TABLES `Drug_Prescription` WRITE;
/*!40000 ALTER TABLE `Drug_Prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `Drug_Prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Emergency_Patient`
--

DROP TABLE IF EXISTS `Emergency_Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Emergency_Patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `severity` enum('low','medium','high','critical') DEFAULT NULL,
  `problem` varchar(255) DEFAULT NULL,
  `description` text,
  `doctor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `emergency_patient_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `Doctor` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Emergency_Patient`
--

LOCK TABLES `Emergency_Patient` WRITE;
/*!40000 ALTER TABLE `Emergency_Patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Emergency_Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lab_Report`
--

DROP TABLE IF EXISTS `Lab_Report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lab_Report` (
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
  CONSTRAINT `lab_report_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`user_id`),
  CONSTRAINT `lab_report_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `Doctor` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lab_Report`
--

LOCK TABLES `Lab_Report` WRITE;
/*!40000 ALTER TABLE `Lab_Report` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lab_Report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient` (
  `user_id` int NOT NULL,
  `bloodtype` enum('A+','A-','B+','B-','AB+','AB-','O+','O-','unknown') DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `allergies` text,
  `med_history` text,
  `notes` text,
  `genetic_predispositions` text,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (2,'B+','male','Penicillin','2019 Appendicitis Surgery','Regular Check-ups','Heart Disease'),(3,'O+','male','None','Past Asthma','Annual Check-ups Required','Mental Health'),(10,'unknown','other','','','','');
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription`
--

DROP TABLE IF EXISTS `Prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Prescription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_of_issue` date DEFAULT NULL,
  `dietary_advice` text,
  `doctors_notes` text,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `Doctor` (`user_id`),
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescription`
--

LOCK TABLES `Prescription` WRITE;
/*!40000 ALTER TABLE `Prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Request_Labreport`
--

DROP TABLE IF EXISTS `Request_Labreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Request_Labreport` (
  `labreport_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  PRIMARY KEY (`labreport_id`,`doctor_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `request_labreport_ibfk_1` FOREIGN KEY (`labreport_id`) REFERENCES `Lab_Report` (`id`),
  CONSTRAINT `request_labreport_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `Doctor` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Request_Labreport`
--

LOCK TABLES `Request_Labreport` WRITE;
/*!40000 ALTER TABLE `Request_Labreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `Request_Labreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Surgery`
--

DROP TABLE IF EXISTS `Surgery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Surgery` (
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
-- Dumping data for table `Surgery`
--

LOCK TABLES `Surgery` WRITE;
/*!40000 ALTER TABLE `Surgery` DISABLE KEYS */;
/*!40000 ALTER TABLE `Surgery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Surgery_Recommendations`
--

DROP TABLE IF EXISTS `Surgery_Recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Surgery_Recommendations` (
  `surgery_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  PRIMARY KEY (`surgery_id`,`doctor_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `surgery_recommendations_ibfk_1` FOREIGN KEY (`surgery_id`) REFERENCES `Surgery` (`id`),
  CONSTRAINT `surgery_recommendations_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `Doctor` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Surgery_Recommendations`
--

LOCK TABLES `Surgery_Recommendations` WRITE;
/*!40000 ALTER TABLE `Surgery_Recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Surgery_Recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
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
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'moditha','secure123','Moditha Marasingha','General Practitioner','1990-05-15','moditha@health.lk','0771234567','Colombo','English','testimg.jpeg','doctor'),(2,'sharukalal','pass456','Sharuka Sunthush','Patient Profile','1985-12-01','sharuka@mail.com','0719876543','Gampaha','English','testimg.jpeg','patient'),(3,'hasindupriya','hasindu789','Hasindu Chanuka','Personal User','2000-08-22','hasindu@test.lk','0761122334','Kandy','English','testimg.jpeg','patient'),(4,'anjaleefernando','anj#2025','Anjalee','Pediatrician','1988-03-30','anjalee@health.lk','0704455667','Ratnapura','English','testimg.jpeg','doctor'),(5,'nimalperera','Admin@1234','Nimal Perera','System Administrator','1995-07-10','nimal@health.lk','0112345678','Kaduwela','English','testimg.jpeg','admin'),(10,'Chani112','chani123','Chanindu Isuranga','','2007-11-21','chani@gmail.com','0777777112','nittabuwa, main st','','testimg.jpeg','patient');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vaccinated_Patient`
--

DROP TABLE IF EXISTS `Vaccinated_Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vaccinated_Patient` (
  `patient_id` int NOT NULL,
  `vaccine_id` int NOT NULL,
  PRIMARY KEY (`patient_id`,`vaccine_id`),
  KEY `vaccine_id` (`vaccine_id`),
  CONSTRAINT `vaccinated_patient_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`user_id`),
  CONSTRAINT `vaccinated_patient_ibfk_2` FOREIGN KEY (`vaccine_id`) REFERENCES `Vaccination` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vaccinated_Patient`
--

LOCK TABLES `Vaccinated_Patient` WRITE;
/*!40000 ALTER TABLE `Vaccinated_Patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vaccinated_Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vaccination`
--

DROP TABLE IF EXISTS `Vaccination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vaccination` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `date_of_vaccination` date DEFAULT NULL,
  `status` enum('scheduled','completed','cancelled') DEFAULT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `vaccination_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `Doctor` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vaccination`
--

LOCK TABLES `Vaccination` WRITE;
/*!40000 ALTER TABLE `Vaccination` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vaccination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'health_lanka'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-25 14:05:17
