-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2020 at 02:21 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

--
-- (c) Subarna Das
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `irctc`
--
DROP DATABASE IF EXISTS `irctc`;
CREATE DATABASE IF NOT EXISTS `irctc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `irctc`;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `scode` varchar(5) DEFAULT NULL,
  `station` varchar(20) DEFAULT NULL,
  `arrival` varchar(5) DEFAULT NULL,
  `departure` varchar(5) DEFAULT NULL,
  `trainno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`scode`, `station`, `arrival`, `departure`, `trainno`) VALUES
('NDLS', 'New Delhi', 'start', '16:55', 12302),
('CNB', 'Kanpur Central', '21:38', '21:43', 12302),
('ALD', 'Allahabad Junction', '23:43', '23:46', 12302),
('DHN', 'Dhanbad Junction', '06:40', '06:45', 12302),
('HWH', 'Howrah Junction', '09:55', 'end', 12302),
('NDLS', 'New Delhi', 'start', '19:40', 12260),
('DDU', 'DD Upadhyaya', '04:33', '04:43', 12260),
('DHN', 'Dhanbad Junction', '08:58', '09:03', 12260),
('SDAH', 'Sealdah', '12:45', 'end', 12260),
('KLK', 'Kalka', 'start', '23:55', 12312),
('ANDI', 'Adarsh Nagar', '04:56', '04:58', 12312),
('DGR', 'Durgapur', '05:06', '05:10', 12312),
('HWH', 'Howrah Junction', '08:05', 'end', 12312),
('HWH', 'Howrah Junction', 'start', '14:50', 12841),
('VSKP', 'Vishakapatnam', '04:25', '04:45', 12841),
('MAS', 'Chennai Central', '17:15', 'end', 12841);

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `trainno` int(11) NOT NULL,
  `trainname` varchar(50) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`trainno`, `trainname`, `source`, `destination`) VALUES
(12260, 'Howrah Duronto Express', 'New Delhi', 'Sealdah'),
(12302, 'Kolkata Rajdhani', 'New Dehi', 'Howrah Junction'),
(12312, 'Kalka Mail', 'Kalka', 'Howrah Junction'),
(12841, 'Coromondal Express', 'Howrah Junction', 'Chennai Central');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD KEY `trainno` (`trainno`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`trainno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`trainno`) REFERENCES `train` (`trainno`);
COMMIT;
