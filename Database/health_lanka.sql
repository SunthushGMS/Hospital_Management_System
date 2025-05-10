-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: health_lanka_v3
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,3,1,'2025-05-09','09:07:00','Pending'),(2,5,1,'2025-05-14','13:50:00','Pending'),(3,4,2,'2025-05-08','11:52:00','rescheduled'),(4,1,101,'2025-05-06','09:00:00','pending'),(5,2,102,'2025-05-06','10:30:00','pending'),(6,1,103,'2025-05-06','11:15:00','pending'),(7,3,104,'2025-05-06','14:00:00','pending'),(8,2,105,'2025-05-06','15:45:00','pending'),(9,1,2,'2025-05-07','09:00:00','pending'),(10,1,3,'2025-05-07','10:30:00','pending'),(11,2,4,'2025-05-07','11:15:00','pending'),(12,2,5,'2025-05-07','13:00:00','pending'),(13,3,6,'2025-05-07','14:45:00','pending'),(14,3,7,'2025-05-07','16:00:00','pending');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `appointmentdetailsview`
--

DROP TABLE IF EXISTS `appointmentdetailsview`;
/*!50001 DROP VIEW IF EXISTS `appointmentdetailsview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `appointmentdetailsview` AS SELECT 
 1 AS `appointmentId`,
 1 AS `doctorId`,
 1 AS `patientId`,
 1 AS `patientName`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `date`,
 1 AS `time`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `doctor` VALUES (1,'General Medicine Specialist','General Practice','MED-LK-789456',10),(4,'Pediatric Specialist','Skin Care','PED-LK-321654',7);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug` (
  `drug_id` int NOT NULL AUTO_INCREMENT,
  `drug_name` varchar(255) DEFAULT NULL,
  `dosage` varchar(100) DEFAULT NULL,
  `frequency` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `instruction` text,
  `prescription_id` int DEFAULT NULL,
  PRIMARY KEY (`drug_id`),
  KEY `fk_prescription` (`prescription_id`),
  CONSTRAINT `fk_prescription` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` VALUES (4,'Vitamin C','one','6hr','3days','none',6),(5,'penadol','2','6hrs','until feel good','none',6),(6,'test','test','test','test','test',7);
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
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
  `patient_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `fk_patient` (`patient_id`),
  CONSTRAINT `emergency_patient_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`user_id`),
  CONSTRAINT `fk_patient` FOREIGN KEY (`patient_id`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_patient`
--

LOCK TABLES `emergency_patient` WRITE;
/*!40000 ALTER TABLE `emergency_patient` DISABLE KEYS */;
INSERT INTO `emergency_patient` VALUES (1,'medium','fdgfddf','ghgg',1,NULL),(7,'high','Severe abdominal pain','Patient reports intense abdominal cramping and nausea for the past 6 hours. Pain level increasing with occasional vomiting. Needs urgent diagnosis and potential scan.',1,2),(8,'medium','Minor head injury','Patient slipped in the bathroom and hit the back of the head. No loss of consciousness reported. Mild swelling and dizziness. Needs observation and basic neurological exam.',1,3);
/*!40000 ALTER TABLE `emergency_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `emergencypatientdetails`
--

DROP TABLE IF EXISTS `emergencypatientdetails`;
/*!50001 DROP VIEW IF EXISTS `emergencypatientdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `emergencypatientdetails` AS SELECT 
 1 AS `surgeryId`,
 1 AS `patientName`,
 1 AS `phone`,
 1 AS `problem`,
 1 AS `severity`,
 1 AS `description`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,'2025-05-10','test','test',1,2),(5,'2025-05-10','hello test','hellotest2',1,3),(6,'2025-05-10','Eat Well','NONE',1,2),(7,'2025-05-10','none','none',1,2);
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
-- Table structure for table `support_requests`
--

DROP TABLE IF EXISTS `support_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `reply` text,
  `status` varchar(20) DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_requests`
--

LOCK TABLES `support_requests` WRITE;
/*!40000 ALTER TABLE `support_requests` DISABLE KEYS */;
INSERT INTO `support_requests` VALUES (1,'Anjalee Samarasinghe','it76856@my.edu.lk','0704173679','qqq','','pending'),(2,'Moditha Marasingha','marasinghamoditha51@gmail.com','0716899444','Test Message 1','','pending'),(3,'Moditha Marasingha','al5323540@gmail.com','5463554636','test 2','','pending');
/*!40000 ALTER TABLE `support_requests` ENABLE KEYS */;
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
  `patient_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `surgery_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surgery`
--

LOCK TABLES `surgery` WRITE;
/*!40000 ALTER TABLE `surgery` DISABLE KEYS */;
INSERT INTO `surgery` VALUES (1,'Appendectomy','2025-05-05','09:00:00','scheduled','accepted',2),(2,'Knee Arthroscopy','2025-05-06','10:30:00','scheduled','pending',2),(3,'Cataract Surgery','2025-05-07','08:45:00','scheduled','accepted',2),(4,'Gallbladder Removal','2025-05-08','11:15:00','in progress','accepted',2),(5,'Tonsillectomy','2025-05-09','13:00:00','scheduled','rejected',2),(6,'anjalee','2025-05-31','00:09:00','completed','pending',NULL),(7,'c','2025-05-08','14:52:00','completed','pending',NULL),(8,'heart sergon','2025-05-08','17:05:00','scheduled','pending',2);
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
  CONSTRAINT `surgery_recommendations_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surgery_recommendations`
--

LOCK TABLES `surgery_recommendations` WRITE;
/*!40000 ALTER TABLE `surgery_recommendations` DISABLE KEYS */;
INSERT INTO `surgery_recommendations` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1);
/*!40000 ALTER TABLE `surgery_recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `surgerydetailsview`
--

DROP TABLE IF EXISTS `surgerydetailsview`;
/*!50001 DROP VIEW IF EXISTS `surgerydetailsview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `surgerydetailsview` AS SELECT 
 1 AS `patientId`,
 1 AS `patientName`,
 1 AS `phone`,
 1 AS `surgeryId`,
 1 AS `surgeryName`,
 1 AS `description`,
 1 AS `date`,
 1 AS `time`,
 1 AS `completion_status`,
 1 AS `acceptance_status`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'moditha','secure123','Moditha Marasingha','General Practitioner','1990-05-15','moditha@health.lk','0771234567','Colombo','English','user_1_1746719831770.jpg','doctor'),(2,'sharukalal','pass456','Sharuka Sunthush','Patient Profile','1985-12-01','sharuka@mail.com','0719876543','Gampaha','English','testimg.jpeg','patient'),(3,'hasindupriya','hasindu789','Hasindu Chanuka','Personal User','2000-08-22','hasindu@test.lk','0761122334','Kandy','English','testimg.jpeg','patient'),(4,'anjaleefernando','anj#2025','Anjalee Fernando','Pediatrician','2004-01-16','anjalee@health.lk','0704455667','Pasyala','English','testimg.jpeg','doctor'),(5,'nimalperera','Admin@1234','Nimal Perera','System Administrator','1995-07-10','nimal@health.lk','0112345678','Kaduwela','English','testimg.jpeg','admin'),(10,'Chani112','chani123','Chanindu Isuranga','','2007-11-21','chani@gmail.com','0777777112','nittabuwa, main st','','testimg.jpeg','patient');
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

--
-- Dumping events for database 'health_lanka_v3'
--

--
-- Dumping routines for database 'health_lanka_v3'
--

--
-- Final view structure for view `appointmentdetailsview`
--

/*!50001 DROP VIEW IF EXISTS `appointmentdetailsview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `appointmentdetailsview` AS select `a`.`id` AS `appointmentId`,`a`.`doctor_ID` AS `doctorId`,`u`.`uid` AS `patientId`,`u`.`fullname` AS `patientName`,`u`.`email` AS `email`,`u`.`phone_no` AS `phone`,`a`.`date` AS `date`,`a`.`time` AS `time`,`a`.`status` AS `status` from (`appointment` `a` join `user` `u` on((`a`.`patient_ID` = `u`.`uid`))) where (`u`.`role` = 'patient') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `emergencypatientdetails`
--

/*!50001 DROP VIEW IF EXISTS `emergencypatientdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emergencypatientdetails` AS select `ep`.`id` AS `surgeryId`,`u`.`fullname` AS `patientName`,`u`.`phone_no` AS `phone`,`ep`.`problem` AS `problem`,`ep`.`severity` AS `severity`,`ep`.`description` AS `description` from (`emergency_patient` `ep` join `user` `u`) where ((`ep`.`patient_id` = `u`.`uid`) and (`u`.`role` = 'patient')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `surgerydetailsview`
--

/*!50001 DROP VIEW IF EXISTS `surgerydetailsview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `surgerydetailsview` AS select `u`.`uid` AS `patientId`,`u`.`fullname` AS `patientName`,`u`.`phone_no` AS `phone`,`s`.`id` AS `surgeryId`,`s`.`name` AS `surgeryName`,`u`.`bio` AS `description`,`s`.`date` AS `date`,`s`.`time` AS `time`,`s`.`completion_status` AS `completion_status`,`s`.`acceptance_status` AS `acceptance_status` from (`surgery` `s` join `user` `u`) where (`s`.`patient_id` = `u`.`uid`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-10 12:52:06
