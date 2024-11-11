-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2024 at 04:23 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `emp_country`
--

CREATE TABLE `emp_country` (
  `EMP_ID` int(5) NOT NULL,
  `EMP_Country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `emp_dept`
--

CREATE TABLE `emp_dept` (
  `EMP_DEPT` varchar(30) NOT NULL,
  `DEPT_TYPE` varchar(40) NOT NULL,
  `EMP_DEPT_NO` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp_dept`
--

INSERT INTO `emp_dept` (`EMP_DEPT`, `DEPT_TYPE`, `EMP_DEPT_NO`) VALUES
('BIO', 'medicine', 11),
('Electric', 'maths', 2),
('Electrical', 'Mathematics', 22);

-- --------------------------------------------------------

--
-- Table structure for table `emp_dept_map`
--

CREATE TABLE `emp_dept_map` (
  `EMP_ID` int(5) NOT NULL,
  `EMP_DEPT` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emp_country`
--
ALTER TABLE `emp_country`
  ADD PRIMARY KEY (`EMP_ID`);

--
-- Indexes for table `emp_dept`
--
ALTER TABLE `emp_dept`
  ADD PRIMARY KEY (`EMP_DEPT`);

--
-- Indexes for table `emp_dept_map`
--
ALTER TABLE `emp_dept_map`
  ADD PRIMARY KEY (`EMP_ID`,`EMP_DEPT`),
  ADD KEY `EMP_DEPT` (`EMP_DEPT`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emp_dept_map`
--
ALTER TABLE `emp_dept_map`
  ADD CONSTRAINT `emp_dept_map_ibfk_1` FOREIGN KEY (`EMP_ID`) REFERENCES `emp_country` (`EMP_ID`),
  ADD CONSTRAINT `emp_dept_map_ibfk_2` FOREIGN KEY (`EMP_DEPT`) REFERENCES `emp_dept` (`EMP_DEPT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
