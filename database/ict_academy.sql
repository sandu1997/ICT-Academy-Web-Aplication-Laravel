-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 17, 2022 at 08:03 AM
-- Server version: 8.0.28
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ict_academy`
--

-- --------------------------------------------------------

--
-- Table structure for table `advances`
--

DROP TABLE IF EXISTS `advances`;
CREATE TABLE IF NOT EXISTS `advances` (
  `advanceID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `advanceAmount` decimal(8,2) NOT NULL,
  `date` date NOT NULL,
  `employeeID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handlerStaffID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`advanceID`),
  KEY `advances_employeeid_foreign` (`employeeID`),
  KEY `advances_handlerstaffid_foreign` (`handlerStaffID`),
  KEY `advances_branchid_foreign` (`branchID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advances`
--

INSERT INTO `advances` (`advanceID`, `description`, `advanceAmount`, `date`, `employeeID`, `handlerStaffID`, `branchID`, `deleted_at`) VALUES
(1, 'Month faaaaees', '20000.00', '2022-04-22', 'TECHR001', 'STAFF001', 'BRNCH001', NULL),
(2, 'Month', '20000.00', '2022-04-22', 'TECHR001', 'STAFF002', 'BRNCH001', NULL),
(4, 'Month', '20000.00', '2022-09-10', 'TECHR001', 'STAFF001', 'BRNCH001', NULL),
(5, 'Month', '20000.00', '2022-07-10', 'TECHR001', 'STAFF001', 'BRNCH001', NULL),
(6, 'Month', '20000.00', '2022-08-10', 'TECHR001', 'STAFF001', 'BRNCH001', NULL),
(7, 'Month a', '1500.00', '2022-08-11', 'TECHR001', 'STAFF001', 'BRNCH001', NULL),
(8, 'Month b', '20000.00', '2022-08-11', 'TECHR002', 'STAFF001', 'BRNCH001', NULL),
(9, 'Month b', '20000.00', '2022-08-12', 'TECHR001', 'STAFF001', 'BRNCH002', NULL),
(10, 'Month c', '800.00', '2022-08-14', 'TECHR001', 'STAFF002', 'BRNCH002', NULL),
(11, 'Month', '20000.00', '2022-08-11', 'STAFF002', 'STAFF001', 'BRNCH002', NULL),
(12, 'Month q', '1800.00', '2022-08-22', 'STAFF002', 'STAFF002', 'BRNCH001', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
CREATE TABLE IF NOT EXISTS `attendances` (
  `studentID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time DEFAULT NULL,
  `attendStatus` smallint NOT NULL DEFAULT '0' COMMENT 'Present = 1, Absent = 0',
  PRIMARY KEY (`studentID`,`classID`,`date`),
  KEY `attendances_classid_foreign` (`classID`)
) ;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`studentID`, `classID`, `date`, `time`, `attendStatus`) VALUES
('ICTA1999001', 'CLASS001', '2022-07-19', '03:59:08', 1),
('ICTA1999002', 'CLASS001', '2022-07-19', '03:59:08', 1),
('ICTA1999002', 'CLASS001', '2022-07-21', '05:45:19', 1),
('ICTA1999003', 'CLASS001', '2022-07-19', '03:59:08', 1),
('ICTA1999003', 'CLASS001', '2022-07-21', NULL, 1),
('ICTA1999004', 'CLASS001', '2022-07-19', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
CREATE TABLE IF NOT EXISTS `branches` (
  `branchID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telNo` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noOfRooms` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`branchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branchID`, `branchName`, `telNo`, `address`, `noOfRooms`) VALUES
('BRNCH001', 'Hakmana', '0769198533', 'ICT Academy, Beliatta road, Hakmana', '4'),
('BRNCH002', 'Kalutara', '0718293640', 'dedfed, Beliatta road, Hakmana', '5');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `categoryID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `categories_categoryname_unique` (`categoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `categoryName`) VALUES
('CTGRY002', 'Advanced Level'),
('CTGRY001', 'Professional Level');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `classID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `className` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `grade` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classFee` decimal(7,2) NOT NULL,
  `feeType` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `subjectID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacherID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`classID`),
  KEY `classes_subjectid_foreign` (`subjectID`),
  KEY `classes_categoryid_foreign` (`categoryID`),
  KEY `classes_teacherid_foreign` (`teacherID`),
  KEY `classes_branchid_foreign` (`branchID`)
) ;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`classID`, `className`, `day`, `startTime`, `endTime`, `grade`, `room`, `classFee`, `feeType`, `status`, `subjectID`, `categoryID`, `teacherID`, `branchID`) VALUES
('CLASS001', 'Maths G12', 'Thursday', '08:30:00', '12:30:00', '2', 'Room No. 3', '10.00', 'Monthly', 'Active', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS002', 'History G12', 'Wednesday', '08:30:00', '12:30:00', '3', 'Room No. 2', '1000.00', 'Daily', 'Active', 'SUBJT002', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS003', 'English G12', 'Wednesday', '08:30:00', '12:30:00', '4', 'Room No. 2', '10.00', 'Daily', 'Active', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS004', 'Maths G12', 'Tuesday', '08:30:00', '12:30:00', '5', 'Room No. 2', '10.00', 'Monthly', 'Active', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS005', 'Sinhala G12', 'Tuesday', '08:30:00', '12:30:00', '5', 'Room No. 2', '10.00', 'Monthly', 'Deactivate', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS006', 'Maths (Sinhala)-Grd12-Tuesday-13:30', 'Tuesday', '13:30:00', '15:31:00', '7', 'Room No. 1', '0.00', 'Daily', 'Active', 'SUBJT002', 'CTGRY002', 'TECHR001', 'BRNCH001'),
('CLASS007', 'English (Sinhala)/GrdOther/Thursday/03:29', 'Thursday', '03:29:00', '04:30:00', '8', 'Online', '0.00', 'Monthly', 'Active', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS008', 'English (Sinhala)/GrdOther/Tuesday/01:13', 'Tuesday', '01:13:00', '03:21:00', '9', 'Room No. 2', '0.00', 'Monthly', 'Active', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS009', 'Maths_G12', 'Tuesday', '08:30:00', '12:30:00', '9', 'Room No. 2', '10.00', 'Monthly', 'Active', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS010', 'Maths_G12_', 'Tuesday', '08:30:00', '12:30:00', '9', 'Room No. 2', '10.00', 'Monthly', 'Active', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS011', 'Singala_GHHHHHH7', 'Tuesday', '09:30:00', '12:30:00', '11', 'Room No. 1', '20000.00', 'Monthly', 'Deactivate', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS012', 'Maths G12', 'Wednesday', '08:30:00', '12:30:00', '13', 'Room No. 2', '10.00', 'Monthly', 'Deactivate', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS013', 'Maths G12', 'Tuesday', '08:30:00', '12:30:00', '13', 'Room No. 2', '10.00', 'Monthly', 'Deactivate', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS014', 'Maths G12', 'Tuesday', '08:30:00', '12:30:00', 'Other', 'Room No. 2', '10.00', 'Monthly', 'Active', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS015', 'Maths G12', 'Tuesday', '08:30:00', '12:30:00', '11', 'Room No. 2', '10.00', 'Monthly', 'Deactivate', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001'),
('CLASS016', 'Maths G12', 'Tuesday', '08:30:00', '12:30:00', '11', 'Room No. 2', '10.00', 'Monthly', 'Deactivate', 'SUBJT001', 'CTGRY001', 'TECHR001', 'BRNCH001');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `employeeID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nic` char(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`employeeID`)
) ;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employeeID`, `employeeType`, `nic`, `title`) VALUES
('STAFF001', 'Staff', '972701564V', 'Mr.'),
('STAFF002', 'Staff', '745601256V', 'Mr.'),
('STAFF003', 'Staff', '972741564123', 'Mr.'),
('STAFF004', 'Staff', '972741564123', 'Mr.'),
('STAFF005', 'Staff', '972741564123', 'Mr.'),
('TECHR001', 'Teacher', '972741564123', 'Mr.'),
('TECHR002', 'Teacher', '972741564123', 'Mr.');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
CREATE TABLE IF NOT EXISTS `enrollment` (
  `studentID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paymentStatus` int NOT NULL DEFAULT '1' COMMENT 'Paid >= 0, Free = -1',
  `enrolledDate` date NOT NULL,
  `status` smallint NOT NULL DEFAULT '1' COMMENT 'Active = 1, Deactivate = 0',
  PRIMARY KEY (`studentID`,`classID`),
  KEY `enrollment_classid_foreign` (`classID`)
) ;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`studentID`, `classID`, `paymentStatus`, `enrolledDate`, `status`) VALUES
('ICTA1999002', 'CLASS001', 22, '2022-07-19', 1),
('ICTA1999003', 'CLASS001', 22, '2022-07-11', 1),
('ICTA1999004', 'CLASS001', 0, '2022-07-19', 1),
('ICTA1999004', 'CLASS011', -1, '2022-07-19', 0),
('ICTA1999004', 'CLASS012', 22, '2022-07-19', 0),
('ICTA1999011', 'CLASS011', 20, '2022-07-19', 0),
('ICTA1999013', 'CLASS001', 0, '2022-07-19', 0),
('ICTA1999016', 'CLASS013', 19, '2022-07-19', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE IF NOT EXISTS `exams` (
  `examID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalMark` smallint NOT NULL DEFAULT '100',
  `date` date NOT NULL,
  `classID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subjectID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`examID`),
  KEY `exams_classid_foreign` (`classID`),
  KEY `exams_subjectid_foreign` (`subjectID`),
  KEY `exams_categoryid_foreign` (`categoryID`),
  KEY `exams_branchid_foreign` (`branchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`examID`, `exam`, `totalMark`, `date`, `classID`, `subjectID`, `categoryID`, `branchID`) VALUES
('EXAM0001', 'PIT L2 S1', 25, '2021-07-16', 'CLASS001', 'SUBJT001', 'CTGRY001', 'BRNCH001'),
('EXAM0002', 'Logic Gate L2 S1', 10, '2022-07-16', 'CLASS001', 'SUBJT001', 'CTGRY001', 'BRNCH001'),
('EXAM0003', 'Logic Gate L2 S1', 10, '2022-07-16', 'CLASS001', 'SUBJT001', 'CTGRY001', 'BRNCH001');

-- --------------------------------------------------------

--
-- Table structure for table `expenditures`
--

DROP TABLE IF EXISTS `expenditures`;
CREATE TABLE IF NOT EXISTS `expenditures` (
  `expenseID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `expense` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expenseAmount` decimal(8,2) NOT NULL,
  `date` date NOT NULL,
  `handlerStaffID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`expenseID`),
  KEY `expenditures_handlerstaffid_foreign` (`handlerStaffID`),
  KEY `expenditures_branchid_foreign` (`branchID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenditures`
--

INSERT INTO `expenditures` (`expenseID`, `expense`, `expenseAmount`, `date`, `handlerStaffID`, `branchID`, `deleted_at`) VALUES
(1, 'Month asdsadasdaes', '99000.00', '2022-05-22', 'STAFF001', 'BRNCH001', NULL),
(2, 'Month asdsadasdaes', '99000.00', '2022-05-22', 'STAFF003', 'BRNCH001', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
CREATE TABLE IF NOT EXISTS `fees` (
  `feeID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paidAmount` decimal(7,2) NOT NULL,
  `date` date NOT NULL,
  `paidStatus` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'P' COMMENT 'Current = P, Arrears = A',
  `handlerStaffID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`feeID`),
  KEY `fees_studentid_foreign` (`studentID`),
  KEY `fees_classid_foreign` (`classID`),
  KEY `fees_handlerstaffid_foreign` (`handlerStaffID`),
  KEY `fees_branchid_foreign` (`branchID`)
) ;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`feeID`, `studentID`, `classID`, `paidAmount`, `date`, `paidStatus`, `handlerStaffID`, `branchID`, `deleted_at`) VALUES
(218, 'ICTA1999001', 'CLASS001', '200.00', '2022-07-24', 'P', 'STAFF002', 'BRNCH001', '2022-07-24 09:27:23'),
(220, 'ICTA1999001', 'CLASS002', '350.00', '2022-08-16', 'P', 'STAFF001', 'BRNCH001', '2022-07-24 14:32:47'),
(221, 'ICTA1999001', 'CLASS001', '50000.00', '2022-08-16', 'P', 'STAFF003', 'BRNCH001', NULL),
(222, 'ICTA1999001', 'CLASS001', '750.00', '2022-07-16', 'P', 'STAFF001', 'BRNCH001', NULL),
(223, 'ICTA1999001', 'CLASS001', '50000.00', '2022-07-16', 'P', 'STAFF001', 'BRNCH001', NULL),
(224, 'ICTA1999001', 'CLASS001', '750.00', '2022-07-16', 'P', 'STAFF001', 'BRNCH001', NULL),
(225, 'ICTA1999001', 'CLASS001', '50000.00', '2022-07-24', 'P', 'STAFF001', 'BRNCH001', NULL),
(226, 'ICTA1999001', 'CLASS001', '750.00', '2022-07-24', 'P', 'STAFF001', 'BRNCH001', NULL),
(227, 'ICTA1999001', 'CLASS001', '500.00', '2022-07-16', 'A', 'STAFF001', 'BRNCH001', NULL),
(228, 'ICTA1999001', 'CLASS001', '750.00', '2022-07-16', 'A', 'STAFF001', 'BRNCH001', NULL),
(229, 'ICTA1999001', 'CLASS001', '650.00', '2022-07-16', 'P', 'STAFF001', 'BRNCH001', NULL),
(230, 'ICTA1999001', 'CLASS002', '120.00', '2022-07-16', 'A', 'STAFF001', 'BRNCH001', NULL),
(231, 'ICTA1999001', 'CLASS002', '350.00', '2022-07-16', 'P', 'STAFF001', 'BRNCH001', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mark`
--

DROP TABLE IF EXISTS `mark`;
CREATE TABLE IF NOT EXISTS `mark` (
  `examID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `studentID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mark` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Ab' COMMENT 'Absent = Ab',
  PRIMARY KEY (`examID`,`studentID`),
  KEY `mark_studentid_foreign` (`studentID`)
) ;

--
-- Dumping data for table `mark`
--

INSERT INTO `mark` (`examID`, `studentID`, `mark`) VALUES
('EXAM0001', 'ICTA1999001', '16'),
('EXAM0001', 'ICTA1999002', '12'),
('EXAM0001', 'ICTA1999003', 'Ab'),
('EXAM0002', 'ICTA1999002', 'Ab');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_04_22_230432_create_branches_table', 1),
(5, '2022_04_22_230744_create_people_table', 1),
(6, '2022_04_22_230814_create_employees_table', 1),
(9, '2022_04_22_230936_create_staff_table', 1),
(10, '2022_04_22_231008_create_teachers_table', 1),
(11, '2022_04_22_231030_create_students_table', 1),
(12, '2022_04_22_231816_create_categories_table', 1),
(13, '2022_04_22_231840_create_subjects_table', 1),
(14, '2022_04_22_233239_create_classes_table', 1),
(16, '2022_04_22_233949_create_parents_table', 1),
(26, '2022_04_22_233525_create_enrollment_table', 2),
(28, '2022_04_22_234033_create_attendances_table', 3),
(33, '2022_04_22_230832_create_users_table', 8),
(34, '2022_04_22_230914_create_user_login_records_table', 9),
(35, '2019_12_14_000001_create_personal_access_tokens_table', 10),
(38, '2022_04_22_234231_create_exams_table', 13),
(39, '2022_04_22_234247_create_mark_table', 14),
(43, '2022_04_22_234054_create_fees_table', 15),
(45, '2022_07_26_131211_create_processes_table', 16),
(46, '2022_04_22_234113_create_advances_table', 17),
(47, '2022_04_22_234200_create_expenditures_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

DROP TABLE IF EXISTS `parents`;
CREATE TABLE IF NOT EXISTS `parents` (
  `studentID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentType` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telNo` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`studentID`,`parentName`)
) ;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`studentID`, `title`, `parentName`, `parentType`, `telNo`) VALUES
('ICTA1999001', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999002', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999003', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999004', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999005', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999006', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999007', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999008', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999009', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999010', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999011', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999012', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999013', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999014', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999015', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941'),
('ICTA1999016', 'Mrs.', 'Hj KJOJsd', 'Father', '0778596941');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
CREATE TABLE IF NOT EXISTS `people` (
  `personID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personType` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date NOT NULL,
  `sex` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telNo` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `joinedDate` date NOT NULL,
  PRIMARY KEY (`personID`),
  UNIQUE KEY `email_unique` (`email`) USING BTREE
) ;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`personID`, `personType`, `firstName`, `lastName`, `dob`, `sex`, `telNo`, `address`, `email`, `status`, `joinedDate`) VALUES
('ICTA1999001', 'Student', 'Helanka', 'Maa  aaaaaa', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', 'pragiath9@gma.9il.com', 'Active', '2022-05-11'),
('ICTA1999002', 'Student', 'Sumudu', 'Maa  aaaaaa', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', 'paragith9@gma.9il.com', 'Active', '2022-05-11'),
('ICTA1999003', 'Student', 'Pragith', 'Maa  aaaaaa', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', 'pragbith9@gma.9il.com', 'Active', '2022-05-11'),
('ICTA1999004', 'Student', 'Janani', 'Maa  bbbbbb', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', 'pramgith9@gma.9il.com', 'Active', '2022-05-11'),
('ICTA1999005', 'Student', 'bbbbb', 'Maa  bbbbbb', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', 'prdagith9@gma.9il.com', 'Active', '2022-05-11'),
('ICTA1999006', 'Student', 'Helanka', 'mamama', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', NULL, 'Active', '2022-05-11'),
('ICTA1999007', 'Student', 'Helanka', 'mamama', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', NULL, 'Active', '2022-05-11'),
('ICTA1999008', 'Student', 'Helanka', 'mamama', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', NULL, 'Active', '2022-05-11'),
('ICTA1999009', 'Student', 'Helanka', 'mamama', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', 'pragith9@gma.9il.com', 'Active', '2022-05-11'),
('ICTA1999010', 'Student', 'Helanka', 'mamama', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', 'pragitha9@gma.9il.com', 'Past', '2022-05-11'),
('ICTA1999011', 'Student', 'Helanka', 'mamama', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', 'praagitha9@gma.9il.com', 'Past', '2022-05-11'),
('ICTA1999012', 'Student', 'Helanka', 'mamama', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', 'paraagitha9@gma.9il.com', 'Past', '2022-05-11'),
('ICTA1999013', 'Student', 'Helanka', 'mamama', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', 'paraagitaha9@gma.9il.com', 'Past', '2022-05-11'),
('ICTA1999014', 'Student', 'Helanka', 'mamama', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', 'paraagiataha9@gma.9il.com', 'Active', '2022-05-11'),
('ICTA1999015', 'Student', 'Helanka', 'mamama', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', 'aaaa@gma.9il.com', 'Past', '2022-05-11'),
('ICTA1999016', 'Student', 'Helanka', 'mamama', '1999-10-26', 'Male', '0778596940', 'Gallea aaaaa', 'ddd@gma.9il.com', 'Past', '2022-05-11'),
('STAFF001', 'Employee', 'Super', 'User', '1997-09-29', 'Male', '0778596940', 'FoT, UoR', 'helankas26@gmail.com', 'Super', '2022-05-21'),
('STAFF002', 'Employee', 'sddf', 'dfddf', '2020-02-05', 'Female', '0778596940', '3rd Lane, Sethsiri Uyana, Mathugama Road,', 'hel26@gmail.com', 'Active', '2022-05-22'),
('STAFF003', 'Employee', 'Dashini', 'lalala', '1998-10-26', 'Male', '0775063611', 'asdasdsdada', 'pragi@gma.9il.com', 'Active', '2022-05-11'),
('STAFF004', 'Employee', 'Dashini', 'lalala', '1998-10-26', 'Male', '0775063611', 'asdasdsdada', 'aaaaa@gma.9il.com', 'Deactivate', '2022-05-11'),
('STAFF005', 'Employee', 'Dashini', 'lalala', '1998-10-26', 'Male', '0775063611', 'asdasdsdada', 'vvvvv@gma.9il.com', 'Active', '2022-05-11'),
('TECHR001', 'Employee', 'Janaka', 'Sisitha', '1988-10-26', 'Male', '0775063611', 'asdasdsdada, matara', 'sisithaJ88@gma9il.com', 'Active', '2022-05-11'),
('TECHR002', 'Employee', 'Heshanka', 'Sisitha', '1988-10-26', 'Male', '0775063611', 'asdasdsdada, matara', 'Heshanka@gma9il.com', 'Active', '2022-05-11');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_id` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_id`, `tokenable_type`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(73, 'USERS001', 'User', 'staff-STAFF001-token', '73e78c8dfa82216940eaa30c546fd6f58b9fabb2bbb923d6497ddc0cc740be90', '[\"*\"]', '2022-08-09 14:08:50', '2022-08-04 10:41:55', '2022-08-09 14:08:50'),
(74, 'USERS001', 'User', 'staff-STAFF001-token', '8b83915c1f69863a5755f91c3f8b19776925af8bafe1b5642d78033e88d941fe', '[\"*\"]', '2022-08-09 16:08:13', '2022-08-09 16:06:31', '2022-08-09 16:08:13'),
(76, 'USERS001', 'User', 'staff-STAFF001-token', '961599d637cb2e05796f63adfa77358959fa9fcc46652fe4db44d9181040eade', '[\"*\"]', NULL, '2022-08-09 16:10:50', '2022-08-09 16:10:50'),
(77, 'USERS001', 'User', 'staff-STAFF001-token', 'b1bc9157fadc960c29c539b8e4c5a3e03a47af47343d1c39c829e45af9c5f178', '[\"*\"]', NULL, '2022-08-09 16:48:59', '2022-08-09 16:48:59'),
(78, 'USERS001', 'User', 'staff-STAFF001-token', '2d8b9f84e405c81b5a859feaef46b50eb0ad3d5c464f7c9b3b4766e968ce02ca', '[\"*\"]', NULL, '2022-08-09 16:58:36', '2022-08-09 16:58:36'),
(80, 'USERS001', 'User', 'staff-STAFF001-token', 'd361c76c84d3bad26c9d485dd6518ed814a324b6a3421b54af87959dcf0f3a6b', '[\"*\"]', '2022-08-13 09:07:28', '2022-08-12 05:14:30', '2022-08-13 09:07:28'),
(83, 'USERS001', 'User', 'staff-STAFF001-token', '12a19c34081f28cd46bd17e38a8b6a7fc010923a7074c843dd0cb7922b57df97', '[\"*\"]', '2022-08-12 12:24:56', '2022-08-12 07:11:17', '2022-08-12 12:24:56'),
(84, 'USERS002', 'User', 'teacher-TECHR001-token', 'd9e6d13a2807c6af4340814ab82fbf1ffb400f6f466940c279f7637becd10a17', '[\"*\"]', NULL, '2022-08-13 03:19:56', '2022-08-13 03:19:56'),
(85, 'USERS001', 'User', 'staff-STAFF001-token', '9f7301f0915f3fc8333570922f3f79bd0d4275f6fb859c8508b1399839e0969d', '[\"*\"]', NULL, '2022-08-13 03:20:17', '2022-08-13 03:20:17'),
(86, 'USERS002', 'User', 'teacher-TECHR001-token', '2ad3e8614556533855e1806892516dd24bbc2bfa8673354951e122f4e6402cfd', '[\"*\"]', NULL, '2022-08-13 03:23:31', '2022-08-13 03:23:31'),
(87, 'USERS002', 'User', 'teacher-TECHR001-token', '1b98306e610292f1087ac527f43fa26043ea62db6e3acc949350629872449ae1', '[\"*\"]', NULL, '2022-08-13 03:25:39', '2022-08-13 03:25:39'),
(88, 'USERS002', 'User', 'teacher-TECHR001-token', '8b79def6bf9224e068de6bdfc0d2f0fa5e257814c0fedf8ecdfb3638b6f93c38', '[\"*\"]', NULL, '2022-08-13 06:00:05', '2022-08-13 06:00:05'),
(93, 'USERS002', 'User', 'teacher-TECHR001-token', '78496758707d09abb24c7a4f548d097bf1661901a72e5f650ed268790cd13c43', '[\"*\"]', NULL, '2022-08-13 08:10:02', '2022-08-13 08:10:02'),
(94, 'USERS001', 'User', 'staff-STAFF001-token', 'daab1f6decbb42c7734c4be1ab826332759773bf6f9ae88f10bee1320d3bfb78', '[\"*\"]', NULL, '2022-08-13 08:11:10', '2022-08-13 08:11:10'),
(95, 'USERS002', 'User', 'teacher-TECHR001-token', '7f91bf93a174214ed874bbc273f2f4d3d8bad5357a767a7595c8f95e75a4a6ca', '[\"*\"]', NULL, '2022-08-13 08:37:06', '2022-08-13 08:37:06'),
(97, 'USERS002', 'User', 'teacher-TECHR001-token', '7b1a52b6672b55278cc3f75f21b75d6ea8e5dde2717ad71fdf6763f135b86635', '[\"*\"]', NULL, '2022-08-13 08:56:27', '2022-08-13 08:56:27'),
(98, 'USERS002', 'User', 'teacher-TECHR001-token', 'accabea570df1f39f4d832f3181c67595911c3e134c72641e9817425e6bbab28', '[\"*\"]', NULL, '2022-08-13 08:56:30', '2022-08-13 08:56:30'),
(100, 'USERS002', 'User', 'teacher-TECHR001-token', 'df6d1bd395ff69b5598a1db92c6bf0afc2def0b7fcb1751d2c472de48c4020c6', '[\"*\"]', NULL, '2022-08-13 09:06:52', '2022-08-13 09:06:52'),
(101, 'USERS002', 'User', 'teacher-TECHR001-token', 'b71eab340fe3794b3d9353299754cac4dfb2f224ff16a9f74ab778d7769e0377', '[\"*\"]', NULL, '2022-08-13 09:07:50', '2022-08-13 09:07:50'),
(102, 'USERS002', 'User', 'teacher-TECHR001-token', '0a10023c80d82a2b2e5d88d21b0edad63d9efa58121fb206bc9f470a09f91419', '[\"*\"]', NULL, '2022-08-13 09:10:30', '2022-08-13 09:10:30'),
(103, 'USERS002', 'User', 'teacher-TECHR001-token', '982525bb03c1855533fe593bca120464e1db1b6b8bd5d3f6d4bdc6ea0d99cb43', '[\"*\"]', NULL, '2022-08-13 09:17:47', '2022-08-13 09:17:47'),
(106, 'USERS002', 'User', 'teacher-TECHR001-token', '1dccc993464896a7a054e7acb9dea5e58885ce050515a5e3ef096b119ac34700', '[\"*\"]', NULL, '2022-08-13 09:21:34', '2022-08-13 09:21:34'),
(108, 'USERS002', 'User', 'teacher-TECHR001-token', '5b0f797d4b35331a97cf8cc96e0eb718226ca5c71992ed5be575a176b0b21d94', '[\"*\"]', NULL, '2022-08-13 09:23:06', '2022-08-13 09:23:06'),
(109, 'USERS002', 'User', 'teacher-TECHR001-token', '6743f23a322bafd2343972f659339ef10b49f70565408be3be43905cf7ce5314', '[\"*\"]', NULL, '2022-08-13 09:23:27', '2022-08-13 09:23:27'),
(113, 'USERS001', 'User', 'staff-STAFF001-token', '0e640c2bd2d40fda56186554649f060d7f864f1dbdbf4ac16314980bd878c4c5', '[\"*\"]', NULL, '2022-08-14 14:04:21', '2022-08-14 14:04:21'),
(114, 'USERS001', 'User', 'staff-STAFF001-token', 'c5a394a5c42ffbdd83b4fec96752619fbb8cd2bf61c5bc039f560b40e5d38153', '[\"*\"]', NULL, '2022-08-14 14:04:24', '2022-08-14 14:04:24'),
(115, 'USERS001', 'User', 'staff-STAFF001-token', '2aec19f8260319df3213ebac41432637f92beb55bda563b4acd5fc8a281a2038', '[\"*\"]', NULL, '2022-08-14 14:04:26', '2022-08-14 14:04:26'),
(116, 'USERS001', 'User', 'staff-STAFF001-token', '8e34b567e5fb838e001cd451221494adff6d97553c1c3085c211f8bcac0faaba', '[\"*\"]', NULL, '2022-08-14 14:04:26', '2022-08-14 14:04:26'),
(119, 'USERS001', 'User', 'staff-STAFF001-token', 'fb483434e0cf90cd5096972abbfae98130f401fe786f03fc140998fbd2dc4632', '[\"*\"]', NULL, '2022-08-14 14:09:27', '2022-08-14 14:09:27'),
(120, 'USERS001', 'User', 'staff-STAFF001-token', '59c85b72c97f8c7ad18eb27638bdcbd8fcd7686d269af9e91ff2dec85a552ec4', '[\"*\"]', NULL, '2022-08-14 14:09:33', '2022-08-14 14:09:33'),
(123, 'USERS001', 'User', 'staff-STAFF001-token', 'cc1ad22956c84810da7007e6346f608b2ae7fd633fab4ff2812e607629f6a3be', '[\"*\"]', NULL, '2022-08-14 14:25:57', '2022-08-14 14:25:57');

-- --------------------------------------------------------

--
-- Table structure for table `processes`
--

DROP TABLE IF EXISTS `processes`;
CREATE TABLE IF NOT EXISTS `processes` (
  `processID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `processType` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `handlerStaffID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`processID`),
  KEY `processes_handlerstaffid_foreign` (`handlerStaffID`),
  KEY `processes_branchid_foreign` (`branchID`)
) ;

--
-- Dumping data for table `processes`
--

INSERT INTO `processes` (`processID`, `processType`, `updated_at`, `handlerStaffID`, `branchID`, `deleted_at`) VALUES
(44, 'month_end', '2022-08-01 17:19:18', 'STAFF001', 'BRNCH001', NULL),
(45, 'year_end', '2022-08-01 17:19:18', 'STAFF001', 'BRNCH001', NULL),
(46, 'ol_batch_end', '2022-08-01 17:19:18', 'STAFF001', 'BRNCH001', NULL),
(47, 'al_batch_end', '2022-09-01 00:00:01', 'STAFF001', 'BRNCH001', NULL),
(48, 'clear_login', '2022-08-01 17:19:18', 'STAFF001', 'BRNCH001', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staffID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`staffID`),
  KEY `staff_branchid_foreign` (`branchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `branchID`) VALUES
('STAFF001', 'BRNCH001'),
('STAFF002', 'BRNCH001'),
('STAFF003', 'BRNCH001'),
('STAFF004', 'BRNCH001'),
('STAFF005', 'BRNCH001');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `studentID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`studentID`),
  KEY `students_branchid_foreign` (`branchID`)
) ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`studentID`, `grade`, `branchID`) VALUES
('ICTA1999001', '3', 'BRNCH001'),
('ICTA1999002', '2', 'BRNCH001'),
('ICTA1999003', '3', 'BRNCH001'),
('ICTA1999004', '6', 'BRNCH001'),
('ICTA1999005', '7', 'BRNCH001'),
('ICTA1999006', '8', 'BRNCH001'),
('ICTA1999007', '9', 'BRNCH001'),
('ICTA1999008', '9', 'BRNCH001'),
('ICTA1999009', '9', 'BRNCH001'),
('ICTA1999010', '13', 'BRNCH001'),
('ICTA1999011', '12', 'BRNCH001'),
('ICTA1999012', '13', 'BRNCH001'),
('ICTA1999013', '13', 'BRNCH001'),
('ICTA1999014', 'Other', 'BRNCH001'),
('ICTA1999015', '12', 'BRNCH001'),
('ICTA1999016', '12', 'BRNCH001');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `subjectID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subjectName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`subjectID`),
  KEY `subjects_categoryid_foreign` (`categoryID`)
) ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subjectID`, `subjectName`, `medium`, `categoryID`) VALUES
('SUBJT001', 'English (Sinhala)', 'English', 'CTGRY001'),
('SUBJT002', 'Maths (Sinhala)', 'English', 'CTGRY002');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `teacherID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qualification` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`teacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacherID`, `qualification`) VALUES
('TECHR001', 'MSc. BSc.ICT'),
('TECHR002', 'MSc. BSc.ICT');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privilege` char(13) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Guess',
  `employeeID` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_employeeid_foreign` (`employeeID`)
) ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `privilege`, `employeeID`, `status`, `remember_token`) VALUES
('USERS001', 'SuperAdmin', '$2y$10$G/jTJH0Az0cpfrhoIP8exObEsOR5v9S/AZwJUHSViLi3852IKaRkO', 'Super', 'STAFF001', 'Active', NULL),
('USERS002', 'sisithaJ88@gma9il.com', '$2y$10$m5yqUiyGCmEwRggLmTFAR.dj5HCV2fdhR3HYXxgm93ebjvGQ1MYgu', 'Standard', 'TECHR001', 'Active', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_login_records`
--

DROP TABLE IF EXISTS `user_login_records`;
CREATE TABLE IF NOT EXISTS `user_login_records` (
  `userID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loginDate` date NOT NULL,
  `loginTime` time NOT NULL,
  `logoutTime` time DEFAULT NULL,
  PRIMARY KEY (`userID`,`loginDate`,`loginTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_login_records`
--

INSERT INTO `user_login_records` (`userID`, `loginDate`, `loginTime`, `logoutTime`) VALUES
('USERS001', '2022-08-04', '01:39:17', '01:40:30'),
('USERS001', '2022-08-04', '01:40:44', '01:40:56'),
('USERS001', '2022-08-04', '04:11:55', NULL),
('USERS001', '2022-08-09', '09:36:31', NULL),
('USERS001', '2022-08-09', '09:38:42', '09:38:46'),
('USERS001', '2022-08-09', '09:40:50', NULL),
('USERS001', '2022-08-09', '10:18:59', NULL),
('USERS001', '2022-08-09', '10:28:36', NULL),
('USERS001', '2022-08-11', '01:39:07', NULL),
('USERS001', '2022-08-12', '10:44:30', '12:38:14'),
('USERS001', '2022-08-12', '12:38:46', '12:39:12'),
('USERS001', '2022-08-12', '12:40:11', '12:40:25'),
('USERS001', '2022-08-12', '12:41:17', NULL),
('USERS001', '2022-08-13', '01:41:10', NULL),
('USERS001', '2022-08-13', '02:22:44', NULL),
('USERS001', '2022-08-13', '02:27:13', NULL),
('USERS001', '2022-08-13', '02:49:05', NULL),
('USERS001', '2022-08-13', '02:50:31', NULL),
('USERS001', '2022-08-13', '02:52:43', NULL),
('USERS001', '2022-08-13', '08:50:17', NULL),
('USERS001', '2022-08-13', '11:47:46', '11:51:32'),
('USERS001', '2022-08-13', '11:52:01', '11:53:26'),
('USERS001', '2022-08-13', '11:54:04', '11:54:33'),
('USERS001', '2022-08-13', '11:55:29', '07:16:10'),
('USERS001', '2022-08-14', '07:16:38', '07:18:16'),
('USERS001', '2022-08-14', '07:18:25', '07:19:10'),
('USERS001', '2022-08-14', '07:19:17', '07:33:53'),
('USERS001', '2022-08-14', '07:34:21', NULL),
('USERS001', '2022-08-14', '07:34:24', NULL),
('USERS001', '2022-08-14', '07:34:26', NULL),
('USERS001', '2022-08-14', '07:36:53', '07:37:02'),
('USERS001', '2022-08-14', '07:37:26', '07:38:50'),
('USERS001', '2022-08-14', '07:39:27', NULL),
('USERS001', '2022-08-14', '07:39:33', NULL),
('USERS001', '2022-08-14', '07:43:42', '07:43:52'),
('USERS001', '2022-08-14', '07:43:58', '07:55:06'),
('USERS001', '2022-08-14', '07:55:57', NULL),
('USERS002', '2022-08-13', '01:40:02', NULL),
('USERS002', '2022-08-13', '02:07:06', NULL),
('USERS002', '2022-08-13', '02:26:27', NULL),
('USERS002', '2022-08-13', '02:26:31', NULL),
('USERS002', '2022-08-13', '02:36:52', NULL),
('USERS002', '2022-08-13', '02:37:50', NULL),
('USERS002', '2022-08-13', '02:40:30', NULL),
('USERS002', '2022-08-13', '02:47:47', NULL),
('USERS002', '2022-08-13', '02:51:34', NULL),
('USERS002', '2022-08-13', '02:53:06', NULL),
('USERS002', '2022-08-13', '02:53:27', NULL),
('USERS002', '2022-08-13', '08:49:56', NULL),
('USERS002', '2022-08-13', '08:53:31', NULL),
('USERS002', '2022-08-13', '08:55:39', NULL),
('USERS002', '2022-08-13', '11:30:05', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advances`
--
ALTER TABLE `advances`
  ADD CONSTRAINT `advances_branchid_foreign` FOREIGN KEY (`branchID`) REFERENCES `branches` (`branchID`),
  ADD CONSTRAINT `advances_employeeid_foreign` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`),
  ADD CONSTRAINT `advances_handlerstaffid_foreign` FOREIGN KEY (`handlerStaffID`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_classid_foreign` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_studentid_foreign` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`) ON DELETE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_branchid_foreign` FOREIGN KEY (`branchID`) REFERENCES `branches` (`branchID`),
  ADD CONSTRAINT `classes_categoryid_foreign` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`),
  ADD CONSTRAINT `classes_subjectid_foreign` FOREIGN KEY (`subjectID`) REFERENCES `subjects` (`subjectID`),
  ADD CONSTRAINT `classes_teacherid_foreign` FOREIGN KEY (`teacherID`) REFERENCES `teachers` (`teacherID`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_employeeid_foreign` FOREIGN KEY (`employeeID`) REFERENCES `people` (`personID`) ON DELETE CASCADE;

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_classid_foreign` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollment_studentid_foreign` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`) ON DELETE CASCADE;

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_branchid_foreign` FOREIGN KEY (`branchID`) REFERENCES `branches` (`branchID`),
  ADD CONSTRAINT `exams_categoryid_foreign` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`),
  ADD CONSTRAINT `exams_classid_foreign` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`),
  ADD CONSTRAINT `exams_subjectid_foreign` FOREIGN KEY (`subjectID`) REFERENCES `subjects` (`subjectID`);

--
-- Constraints for table `expenditures`
--
ALTER TABLE `expenditures`
  ADD CONSTRAINT `expenditures_branchid_foreign` FOREIGN KEY (`branchID`) REFERENCES `branches` (`branchID`),
  ADD CONSTRAINT `expenditures_handlerstaffid_foreign` FOREIGN KEY (`handlerStaffID`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_branchid_foreign` FOREIGN KEY (`branchID`) REFERENCES `branches` (`branchID`),
  ADD CONSTRAINT `fees_classid_foreign` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`),
  ADD CONSTRAINT `fees_handlerstaffid_foreign` FOREIGN KEY (`handlerStaffID`) REFERENCES `staff` (`staffID`),
  ADD CONSTRAINT `fees_studentid_foreign` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`);

--
-- Constraints for table `mark`
--
ALTER TABLE `mark`
  ADD CONSTRAINT `mark_examid_foreign` FOREIGN KEY (`examID`) REFERENCES `exams` (`examID`) ON DELETE CASCADE,
  ADD CONSTRAINT `mark_studentid_foreign` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`) ON DELETE CASCADE;

--
-- Constraints for table `parents`
--
ALTER TABLE `parents`
  ADD CONSTRAINT `parents_studentid_foreign` FOREIGN KEY (`studentID`) REFERENCES `students` (`studentID`) ON DELETE CASCADE;

--
-- Constraints for table `processes`
--
ALTER TABLE `processes`
  ADD CONSTRAINT `processes_branchid_foreign` FOREIGN KEY (`branchID`) REFERENCES `branches` (`branchID`),
  ADD CONSTRAINT `processes_handlerstaffid_foreign` FOREIGN KEY (`handlerStaffID`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_branchid_foreign` FOREIGN KEY (`branchID`) REFERENCES `branches` (`branchID`),
  ADD CONSTRAINT `staff_staffid_foreign` FOREIGN KEY (`staffID`) REFERENCES `employees` (`employeeID`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_branchid_foreign` FOREIGN KEY (`branchID`) REFERENCES `branches` (`branchID`),
  ADD CONSTRAINT `students_studentid_foreign` FOREIGN KEY (`studentID`) REFERENCES `people` (`personID`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_categoryid_foreign` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_teacherid_foreign` FOREIGN KEY (`teacherID`) REFERENCES `employees` (`employeeID`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_employeeid_foreign` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`);

--
-- Constraints for table `user_login_records`
--
ALTER TABLE `user_login_records`
  ADD CONSTRAINT `user_login_records_userid_foreign` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
