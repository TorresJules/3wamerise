-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 06, 2024 at 10:13 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evalmerise3wa`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `Id_Courses` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `evaluations`
--

CREATE TABLE `evaluations` (
  `Id_Evaluations` int(11) NOT NULL,
  `Id_Users` int(11) NOT NULL,
  `Id_EvaluationsTypes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `evaluationstypes`
--

CREATE TABLE `evaluationstypes` (
  `Id_EvaluationsTypes` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `Id_Grades` int(11) NOT NULL,
  `grade` decimal(3,1) DEFAULT NULL,
  `Id_Users` int(11) NOT NULL,
  `Id_Evaluations` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `Id_Sessions` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sessions_courses`
--

CREATE TABLE `sessions_courses` (
  `Id_Sessions` int(11) NOT NULL,
  `Id_Courses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students_sessions`
--

CREATE TABLE `students_sessions` (
  `Id_Users` int(11) NOT NULL,
  `Id_Sessions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `Id_UserRoles` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id_Users` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pword` varchar(255) DEFAULT NULL,
  `Id_UserRoles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`Id_Courses`);

--
-- Indexes for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`Id_Evaluations`),
  ADD KEY `Id_Users` (`Id_Users`),
  ADD KEY `Id_EvaluationsTypes` (`Id_EvaluationsTypes`);

--
-- Indexes for table `evaluationstypes`
--
ALTER TABLE `evaluationstypes`
  ADD PRIMARY KEY (`Id_EvaluationsTypes`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`Id_Grades`),
  ADD KEY `Id_Users` (`Id_Users`),
  ADD KEY `Id_Evaluations` (`Id_Evaluations`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`Id_Sessions`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sessions_courses`
--
ALTER TABLE `sessions_courses`
  ADD PRIMARY KEY (`Id_Sessions`,`Id_Courses`),
  ADD KEY `Id_Courses` (`Id_Courses`);

--
-- Indexes for table `students_sessions`
--
ALTER TABLE `students_sessions`
  ADD PRIMARY KEY (`Id_Users`,`Id_Sessions`),
  ADD KEY `Id_Sessions` (`Id_Sessions`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`Id_UserRoles`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id_Users`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `Id_UserRoles` (`Id_UserRoles`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `Id_Courses` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `Id_Evaluations` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluationstypes`
--
ALTER TABLE `evaluationstypes`
  MODIFY `Id_EvaluationsTypes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `Id_Grades` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `Id_Sessions` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userroles`
--
ALTER TABLE `userroles`
  MODIFY `Id_UserRoles` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Id_Users` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`Id_Users`) REFERENCES `users` (`Id_Users`),
  ADD CONSTRAINT `evaluations_ibfk_2` FOREIGN KEY (`Id_EvaluationsTypes`) REFERENCES `evaluationstypes` (`Id_EvaluationsTypes`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`Id_Users`) REFERENCES `users` (`Id_Users`),
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`Id_Evaluations`) REFERENCES `evaluations` (`Id_Evaluations`);

--
-- Constraints for table `sessions_courses`
--
ALTER TABLE `sessions_courses`
  ADD CONSTRAINT `sessions_courses_ibfk_1` FOREIGN KEY (`Id_Sessions`) REFERENCES `sessions` (`Id_Sessions`),
  ADD CONSTRAINT `sessions_courses_ibfk_2` FOREIGN KEY (`Id_Courses`) REFERENCES `courses` (`Id_Courses`);

--
-- Constraints for table `students_sessions`
--
ALTER TABLE `students_sessions`
  ADD CONSTRAINT `students_sessions_ibfk_1` FOREIGN KEY (`Id_Users`) REFERENCES `users` (`Id_Users`),
  ADD CONSTRAINT `students_sessions_ibfk_2` FOREIGN KEY (`Id_Sessions`) REFERENCES `sessions` (`Id_Sessions`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Id_UserRoles`) REFERENCES `userroles` (`Id_UserRoles`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
