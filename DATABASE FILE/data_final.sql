-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2025 at 12:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `emploi_du_temps`
--

CREATE TABLE `emploi_du_temps` (
  `id` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `jour` varchar(20) NOT NULL,
  `periode` int(11) NOT NULL,
  `matiere` varchar(100) DEFAULT NULL,
  `classArmId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emploi_du_temps`
--

INSERT INTO `emploi_du_temps` (`id`, `classId`, `jour`, `periode`, `matiere`, `classArmId`) VALUES
(4, 1, 'LUNDI', 1, 'S1', NULL),
(5, 3, 'MERCREDI', 3, 'S1', NULL),
(6, 2, 'VENDREDI', 3, 'mat', NULL),
(7, 1, 'VENDREDI', 1, 'pc', NULL),
(8, 1, 'SAMEDI', 3, 'mat', NULL),
(11, 1, 'SAMEDI', 3, 'S1', NULL),
(28, 5, 'MERCREDI', 3, 'VH', NULL),
(29, 3, 'JEUDI', 4, 'VH', 5),
(30, 1, 'MERCREDI', 2, 'nk', 5),
(31, 1, 'MERCREDI', 2, 'nk', 5),
(32, 1, 'MERCREDI', 2, 'nk', 5),
(33, 4, 'MERCREDI', 3, 'mn', 5),
(34, 4, 'MERCREDI', 3, 'mn', 5),
(35, 4, 'JEUDI', 3, 'vb', 2),
(36, 1, 'LUNDI', 3, 'eng', 4),
(37, 3, 'VENDREDI', 3, 'francai', 5),
(38, 1, 'MERCREDI', 3, 'span', 6),
(39, 1, 'SAMEDI', 0, 'italy', 2),
(40, 1, 'SAMEDI', 0, 'italy', 2),
(41, 1, 'SAMEDI', 0, 'italy', 2),
(42, 1, 'SAMEDI', 1, 'italy', 2);

-- --------------------------------------------------------

--
-- Table structure for table `emploi_exam`
--

CREATE TABLE `emploi_exam` (
  `id` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `classArmId` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `exam_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `exam_hall` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emploi_exam`
--

INSERT INTO `emploi_exam` (`id`, `classId`, `classArmId`, `subject`, `exam_date`, `start_time`, `end_time`, `created_at`, `exam_hall`) VALUES
(25, 3, 4, 'mate', '2025-02-02', '14:23:00', '17:26:00', '2025-02-12 11:48:25', 'salle2'),
(26, 1, 4, 'es', '2025-04-13', '26:24:39', '62:34:39', '2025-02-12 13:14:39', 'salle3');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`) VALUES
(1, 'Admin', '', 'admin@mail.com', '32250170a0dca92d53ec9624f336ca24');

-- --------------------------------------------------------

--
-- Table structure for table `tblattendance`
--

CREATE TABLE `tblattendance` (
  `Id` int(10) NOT NULL,
  `admissionNo` varchar(255) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `sessionTermId` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `dateTimeTaken` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblattendance`
--

INSERT INTO `tblattendance` (`Id`, `admissionNo`, `classId`, `classArmId`, `sessionTermId`, `status`, `dateTimeTaken`) VALUES
(162, 'ASDFLKJ', '1', '2', '1', '1', '2020-11-01'),
(163, 'HSKSDD', '1', '2', '1', '1', '2020-11-01'),
(164, 'JSLDKJ', '1', '2', '1', '1', '2020-11-01'),
(170, 'JSFSKDJ', '1', '4', '1', '1', '2020-11-01'),
(171, 'JKADA', '1', '4', '1', '0', '2020-11-01'),
(172, 'HSKDS9EE', '1', '4', '1', '1', '2020-11-01'),
(173, 'ASDFLKJ', '1', '2', '1', '1', '2020-11-19'),
(174, 'HSKSDD', '1', '2', '1', '1', '2020-11-19'),
(175, 'JSLDKJ', '1', '2', '1', '1', '2020-11-19'),
(176, 'JSFSKDJ', '1', '4', '1', '0', '2021-07-15'),
(177, 'JKADA', '1', '4', '1', '0', '2021-07-15'),
(178, 'HSKDS9EE', '1', '4', '1', '0', '2021-07-15'),
(179, 'ASDFLKJ', '1', '2', '1', '0', '2021-09-27'),
(180, 'HSKSDD', '1', '2', '1', '1', '2021-09-27'),
(181, 'JSLDKJ', '1', '2', '1', '1', '2021-09-27'),
(182, 'ASDFLKJ', '1', '2', '1', '0', '2021-10-06'),
(183, 'HSKSDD', '1', '2', '1', '0', '2021-10-06'),
(184, 'JSLDKJ', '1', '2', '1', '1', '2021-10-06'),
(185, 'ASDFLKJ', '1', '2', '1', '0', '2021-10-07'),
(186, 'HSKSDD', '1', '2', '1', '0', '2021-10-07'),
(187, 'JSLDKJ', '1', '2', '1', '0', '2021-10-07'),
(188, 'AMS110', '4', '6', '1', '1', '2021-10-07'),
(189, 'AMS133', '4', '6', '1', '0', '2021-10-07'),
(190, 'AMS135', '4', '6', '1', '0', '2021-10-07'),
(191, 'AMS144', '4', '6', '1', '1', '2021-10-07'),
(192, 'AMS148', '4', '6', '1', '0', '2021-10-07'),
(193, 'AMS151', '4', '6', '1', '1', '2021-10-07'),
(194, 'AMS159', '4', '6', '1', '1', '2021-10-07'),
(195, 'AMS161', '4', '6', '1', '1', '2021-10-07'),
(196, 'AMS110', '4', '6', '1', '1', '2022-06-06'),
(197, 'AMS133', '4', '6', '1', '0', '2022-06-06'),
(198, 'AMS135', '4', '6', '1', '0', '2022-06-06'),
(199, 'AMS144', '4', '6', '1', '1', '2022-06-06'),
(200, 'AMS148', '4', '6', '1', '0', '2022-06-06'),
(201, 'AMS151', '4', '6', '1', '1', '2022-06-06'),
(202, 'AMS159', '4', '6', '1', '1', '2022-06-06'),
(203, 'AMS161', '4', '6', '1', '1', '2022-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `tblclass`
--

CREATE TABLE `tblclass` (
  `Id` int(10) NOT NULL,
  `className` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblclass`
--

INSERT INTO `tblclass` (`Id`, `className`) VALUES
(1, 'Seven'),
(3, 'Eight'),
(4, 'Nine'),
(5, 'one');

-- --------------------------------------------------------

--
-- Table structure for table `tblclassarms`
--

CREATE TABLE `tblclassarms` (
  `Id` int(10) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmName` varchar(255) NOT NULL,
  `isAssigned` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblclassarms`
--

INSERT INTO `tblclassarms` (`Id`, `classId`, `classArmName`, `isAssigned`) VALUES
(2, '1', 'S1', '1'),
(4, '1', 'S2', '1'),
(5, '3', 'E1', '1'),
(6, '4', 'N1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblclassteacher`
--

CREATE TABLE `tblclassteacher` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNo` varchar(50) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblclassteacher`
--

INSERT INTO `tblclassteacher` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`, `phoneNo`, `classId`, `classArmId`, `dateCreated`) VALUES
(1, 'Will', 'Kibagendi', 'teacher2@mail.com', '32250170a0dca92d53ec9624f336ca24', '09089898999', '1', '2', '2022-10-31'),
(4, 'Demola', 'Ade', 'teacher3@gmail.com', '32250170a0dca92d53ec9624f336ca24', '09672002882', '1', '4', '2022-11-01'),
(5, 'Ryan', 'Mbeche', 'teacher4@mail.com', '32250170a0dca92d53ec9624f336ca24', '7014560000', '3', '5', '2022-10-07'),
(6, 'John', 'Keroche', 'teacher@mail.com', '32250170a0dca92d53ec9624f336ca24', '0100000030', '4', '6', '2022-10-07');

-- --------------------------------------------------------

--
-- Table structure for table `tblgrades`
--

CREATE TABLE `tblgrades` (
  `id` int(11) NOT NULL,
  `classId` int(11) DEFAULT NULL,
  `sessionTermId` int(11) DEFAULT NULL,
  `studentId` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `note` decimal(5,2) DEFAULT NULL,
  `noteType` varchar(50) DEFAULT NULL,
  `classArmId` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblgrades`
--

INSERT INTO `tblgrades` (`id`, `classId`, `sessionTermId`, `studentId`, `subject`, `note`, `noteType`, `classArmId`, `notes`) VALUES
(3, 1, 1, 12, 'Mathematics', 18.50, 'Exam fin module', NULL, NULL),
(4, 1, 1, 9, 'Science', 15.00, 'controle', NULL, NULL),
(5, 1, 3, 4, 'Mathématiques', 18.50, 'regional', 2, NULL),
(27, 3, 3, 6, 'francais', 17.28, 'Devoir', 5, NULL),
(32, 5, 3, 1, 'english', 19.00, 'Projet', 6, 'exellent'),
(35, 4, 1, 15, 'english', 12.00, 'Quiz', 6, NULL),
(36, 4, 1, 10, 'mate', 15.00, 'Examen', 2, NULL),
(40, 3, 1, 14, 'italy', 14.75, 'Devoir', 4, NULL),
(43, 5, 1, 4, 'informatique', 2.00, 'controle', 5, NULL),
(44, 1, 1, 4, 'mat', 12.00, 'rigional', 2, NULL),
(45, 1, 1, 4, 'mat', 12.00, 'rigional', 2, NULL),
(46, 1, 1, 7, 'pc', 17.00, 'controle', 4, 'اب'),
(47, 1, 1, 7, 'pc', 17.00, 'controle', 4, 'اب'),
(48, 4, 3, 11, 'english', 12.00, 'Examen', 6, 'bein'),
(49, 5, 1, 1, 'english', 17.28, 'controle', 6, 'bien'),
(50, 5, 3, 1, 'francais', 14.75, 'Projet', 6, 'bein');

-- --------------------------------------------------------

--
-- Table structure for table `tblschedule`
--

CREATE TABLE `tblschedule` (
  `id` int(11) NOT NULL,
  `day` varchar(20) NOT NULL,
  `termId` int(11) NOT NULL,
  `classId` int(11) NOT NULL,
  `classArmId` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL,
  `subject` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblschedule`
--

INSERT INTO `tblschedule` (`id`, `day`, `termId`, `classId`, `classArmId`, `teacherId`, `subject`) VALUES
(1, 'lundi', 2, 5, 5, 5, 'mat'),
(4, 'Mercredi', 2, 5, 5, 5, 'eng'),
(5, 'Mercredi', 2, 5, 5, 5, 'eng'),
(6, 'Vendredi', 2, 4, 5, 1, 'e1'),
(7, 'Vendredi', 2, 4, 5, 1, 'e1'),
(8, 'Mercredi', 3, 3, 6, 4, 'pc'),
(9, 'Samedi', 3, 4, 4, 6, 'pc'),
(10, 'Mercredi', 2, 1, 6, 5, 'phi'),
(11, 'Mercredi', 2, 1, 6, 5, 'phi'),
(12, 'Lundi', 2, 3, 2, 5, 'fr'),
(13, 'Lundi', 2, 3, 2, 5, 'fr'),
(14, 'Lundi', 2, 3, 2, 5, 'lk'),
(15, 'Vendredi', 2, 3, 5, 5, 'pho'),
(16, 'Mardi', 2, 5, 5, 1, 'phi');

-- --------------------------------------------------------

--
-- Table structure for table `tblsessionterm`
--

CREATE TABLE `tblsessionterm` (
  `Id` int(10) NOT NULL,
  `sessionName` varchar(50) NOT NULL,
  `termId` varchar(50) NOT NULL,
  `isActive` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsessionterm`
--

INSERT INTO `tblsessionterm` (`Id`, `sessionName`, `termId`, `isActive`, `dateCreated`) VALUES
(1, '2021/2022', '1', '1', '2022-10-31'),
(3, '2021/2022', '2', '0', '2022-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `otherName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`Id`, `firstName`, `lastName`, `otherName`, `emailAddress`, `password`, `classId`, `classArmId`, `dateCreated`) VALUES
(1, 'Thomas', 'Omari', 'none', 'test@test.com', '12345', '1', '2', '2022-10-31'),
(3, 'Samuel', 'Ondieki', 'none', 'AMS007', '12345', '1', '2', '2022-10-31'),
(4, 'Milagros', 'Oloo', 'none', 'Oloo@test.com\r\n', '1234', '1', '2', '2022-10-31'),
(5, 'Luis', 'Ayo', 'none', 'AMS012', '12345', '1', '4', '2022-10-31'),
(6, 'Sandra', 'Sagero', 'none', 'AMS015', '12345', '1', '4', '2022-10-31'),
(7, 'Smith', 'Makori', 'Mack', 'AMS017', '12345', '1', '4', '2022-10-31'),
(8, 'Juliana', 'Kerubo', 'none', 'AMS019', '12345', '3', '5', '2022-10-31'),
(9, 'Richard', 'Semo', 'none', 'AMS021', '12345', '3', '5', '2022-10-31'),
(10, 'Jon', 'Mbeeka', 'none', 'AMS110', '12345', '4', '6', '2022-10-07'),
(11, 'Aida', 'Moraa', 'none', 'AMS133', '12345', '4', '6', '2022-10-07'),
(12, 'Miguel', 'Bush', 'none', 'AMS135', '12345', '4', '6', '2022-10-07'),
(13, 'Sergio', 'Hammons', 'none', 'AMS144', '12345', '4', '6', '2022-10-07'),
(14, 'Lyn', 'Rogers', 'none', 'AMS148', '12345', '4', '6', '2022-10-07'),
(15, 'James', 'Dominick', 'none', 'AMS151', '12345', '4', '6', '2022-10-07'),
(16, 'Ethel', 'Quin', 'none', 'AMS159', '12345', '4', '6', '2022-10-07'),
(17, 'Roland', 'Estrada', 'none', 'AMS161', '12345', '4', '6', '2022-10-07');

-- --------------------------------------------------------

--
-- Table structure for table `tblteacherattendance`
--

CREATE TABLE `tblteacherattendance` (
  `id` int(11) NOT NULL,
  `teacherId` int(11) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `classArmId` int(11) DEFAULT NULL,
  `sessionTermId` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `dateTimeTaken` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblteacherattendance`
--

INSERT INTO `tblteacherattendance` (`id`, `teacherId`, `classId`, `classArmId`, `sessionTermId`, `status`, `dateTimeTaken`) VALUES
(1, 1, 1, 2, 1, 1, '2025-02-06 00:00:00'),
(2, 4, 1, 4, 1, 1, '2025-02-06 00:00:00'),
(3, 5, 3, 5, 1, 0, '2025-02-06 00:00:00'),
(4, 6, 4, 6, 1, 0, '2025-02-06 00:00:00'),
(5, 1, 1, 2, 1, 1, '2025-02-07 00:00:00'),
(6, 4, 1, 4, 1, 1, '2025-02-07 00:00:00'),
(7, 5, 3, 5, 1, 0, '2025-02-07 00:00:00'),
(8, 6, 4, 6, 1, 0, '2025-02-07 00:00:00'),
(9, 1, 1, 2, 1, 0, '2025-02-10 00:00:00'),
(10, 4, 1, 4, 1, 0, '2025-02-10 00:00:00'),
(11, 5, 3, 5, 1, 0, '2025-02-10 00:00:00'),
(12, 6, 4, 6, 1, 0, '2025-02-10 00:00:00'),
(13, 1, 1, 2, 1, 0, '2025-02-12 00:00:00'),
(14, 4, 1, 4, 1, 0, '2025-02-12 00:00:00'),
(15, 5, 3, 5, 1, 0, '2025-02-12 00:00:00'),
(16, 6, 4, 6, 1, 0, '2025-02-12 00:00:00'),
(17, 1, 1, 2, 1, 1, '2025-02-14 00:00:00'),
(18, 4, 1, 4, 1, 1, '2025-02-14 00:00:00'),
(19, 5, 3, 5, 1, 1, '2025-02-14 00:00:00'),
(20, 6, 4, 6, 1, 0, '2025-02-14 00:00:00'),
(21, 1, 1, 2, 1, 0, '2025-02-18 00:00:00'),
(22, 4, 1, 4, 1, 0, '2025-02-18 00:00:00'),
(23, 5, 3, 5, 1, 0, '2025-02-18 00:00:00'),
(24, 6, 4, 6, 1, 0, '2025-02-18 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblterm`
--

CREATE TABLE `tblterm` (
  `Id` int(10) NOT NULL,
  `termName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblterm`
--

INSERT INTO `tblterm` (`Id`, `termName`) VALUES
(1, 'First'),
(2, 'Second'),
(3, 'Third');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emploi_du_temps`
--
ALTER TABLE `emploi_du_temps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_temps_classarm` (`classArmId`);

--
-- Indexes for table `emploi_exam`
--
ALTER TABLE `emploi_exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classId` (`classId`),
  ADD KEY `classArmId` (`classArmId`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblattendance`
--
ALTER TABLE `tblattendance`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblclass`
--
ALTER TABLE `tblclass`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblclassarms`
--
ALTER TABLE `tblclassarms`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblclassteacher`
--
ALTER TABLE `tblclassteacher`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblgrades`
--
ALTER TABLE `tblgrades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classId` (`classId`),
  ADD KEY `sessionTermId` (`sessionTermId`),
  ADD KEY `studentId` (`studentId`),
  ADD KEY `classArmId` (`classArmId`);

--
-- Indexes for table `tblschedule`
--
ALTER TABLE `tblschedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `termId` (`termId`),
  ADD KEY `classId` (`classId`),
  ADD KEY `classArmId` (`classArmId`),
  ADD KEY `teacherId` (`teacherId`);

--
-- Indexes for table `tblsessionterm`
--
ALTER TABLE `tblsessionterm`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblteacherattendance`
--
ALTER TABLE `tblteacherattendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacherId` (`teacherId`),
  ADD KEY `classId` (`classId`),
  ADD KEY `classArmId` (`classArmId`),
  ADD KEY `sessionTermId` (`sessionTermId`);

--
-- Indexes for table `tblterm`
--
ALTER TABLE `tblterm`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emploi_du_temps`
--
ALTER TABLE `emploi_du_temps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `emploi_exam`
--
ALTER TABLE `emploi_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblattendance`
--
ALTER TABLE `tblattendance`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `tblclass`
--
ALTER TABLE `tblclass`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblclassarms`
--
ALTER TABLE `tblclassarms`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblclassteacher`
--
ALTER TABLE `tblclassteacher`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblgrades`
--
ALTER TABLE `tblgrades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tblschedule`
--
ALTER TABLE `tblschedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblsessionterm`
--
ALTER TABLE `tblsessionterm`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblteacherattendance`
--
ALTER TABLE `tblteacherattendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tblterm`
--
ALTER TABLE `tblterm`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emploi_du_temps`
--
ALTER TABLE `emploi_du_temps`
  ADD CONSTRAINT `fk_temps_classarm` FOREIGN KEY (`classArmId`) REFERENCES `tblclassarms` (`Id`);

--
-- Constraints for table `emploi_exam`
--
ALTER TABLE `emploi_exam`
  ADD CONSTRAINT `emploi_exam_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `tblclass` (`Id`),
  ADD CONSTRAINT `emploi_exam_ibfk_2` FOREIGN KEY (`classArmId`) REFERENCES `tblclassarms` (`Id`);

--
-- Constraints for table `tblgrades`
--
ALTER TABLE `tblgrades`
  ADD CONSTRAINT `tblgrades_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `tblclass` (`Id`),
  ADD CONSTRAINT `tblgrades_ibfk_2` FOREIGN KEY (`sessionTermId`) REFERENCES `tblsessionterm` (`Id`),
  ADD CONSTRAINT `tblgrades_ibfk_3` FOREIGN KEY (`studentId`) REFERENCES `tblstudents` (`Id`),
  ADD CONSTRAINT `tblgrades_ibfk_4` FOREIGN KEY (`classArmId`) REFERENCES `tblclassarms` (`Id`);

--
-- Constraints for table `tblschedule`
--
ALTER TABLE `tblschedule`
  ADD CONSTRAINT `tblschedule_ibfk_1` FOREIGN KEY (`termId`) REFERENCES `tblterm` (`Id`),
  ADD CONSTRAINT `tblschedule_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `tblclass` (`Id`),
  ADD CONSTRAINT `tblschedule_ibfk_3` FOREIGN KEY (`classArmId`) REFERENCES `tblclassarms` (`Id`),
  ADD CONSTRAINT `tblschedule_ibfk_4` FOREIGN KEY (`teacherId`) REFERENCES `tblclassteacher` (`Id`);

--
-- Constraints for table `tblteacherattendance`
--
ALTER TABLE `tblteacherattendance`
  ADD CONSTRAINT `tblteacherattendance_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `tblclassteacher` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblteacherattendance_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `tblclass` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblteacherattendance_ibfk_3` FOREIGN KEY (`classArmId`) REFERENCES `tblclassarms` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblteacherattendance_ibfk_4` FOREIGN KEY (`sessionTermId`) REFERENCES `tblsessionterm` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
