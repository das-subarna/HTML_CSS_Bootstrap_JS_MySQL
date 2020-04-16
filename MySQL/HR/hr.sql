-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2020 at 05:11 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- Subarna Das

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hr`
--
CREATE DATABASE IF NOT EXISTS `hr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hr`;

-- --------------------------------------------------------


--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `region_id`) VALUES
(10, 'India', 7025),
(11, 'France', 7035),
(12, 'USA', 7038),
(13, 'Spain', 7040),
(14, 'Pakistan', 7045);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` varchar(10) NOT NULL,
  `department_name` varchar(30) DEFAULT NULL,
  `manager_id` varchar(30) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`, `location_id`) VALUES
('D1389', 'salaryes', 'E420', 127880),
('D1396', 'Administration', 'E125', 127877),
('D1559', 'Human Resources', 'E558', 137877),
('D1859', 'Public Relations', 'E127', 137877),
('D2589', 'Shipping', 'E317', 127887),
('D2679', 'IT', 'E422', 130877),
('D4059', 'Accounting', 'E519', 137877),
('D7559', 'Marketing', 'E252', 130877);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `commission_pct` int(11) DEFAULT NULL,
  `manager_id` varchar(30) DEFAULT NULL,
  `department_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES
('E125', 'Suresh', 'Kumar', 'suresh.kumar@gmail.c', '+91785063254', '2017-10-13', 127, 15000, NULL, NULL, 'D1396'),
('E127', 'Pankaj', 'Dev', 'p.dev@gmail.com', '+91956321489', '2017-08-17', 126, 19000, NULL, 'E125', 'D1859'),
('E239', 'Riya', 'Shaw', 'r.shaw@gmail.com', '+81987465554', '2018-12-12', 126, 16000, NULL, 'E252', 'D7559'),
('E252', 'Sia', 'Bundela', 's.bundela@gmail.com', '+81858665554', '2018-12-10', 123, 16000, NULL, 'E125', 'D7559'),
('E317', 'Shreyashi', 'Kahali', 's.kahali@gmail.com', '+91957569842', '2015-05-29', 126, 11500, NULL, 'E125', 'D2589'),
('E420', 'Sumeli', 'Rani', 'sumeli.rani@gmail.co', '+72850063254', '2017-09-23', 124, 10000, 1500, 'E125', 'D1389'),
('E422', 'Raghav', 'Singh', 's.raghav@gmail.com', '+81858855254', '2018-10-10', 124, 12000, NULL, 'E125', 'D2679'),
('E442', 'Rani', 'Shraddha', 's.rani@gmail.com', '+72850068854', '2018-09-13', 126, 8000, 1200, 'E420', 'D1389'),
('E519', 'Anita', 'Misra', 'a.misra@gmail.com', '+81987775484', '2017-12-12', 124, 20000, NULL, 'E125', 'D4059'),
('E558', 'Arnab', 'Karn', 'a.karn@gmail.com', '+91987756489', '2017-11-15', 126, 20000, NULL, 'E125', 'D1559');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `min_salary` int(11) DEFAULT NULL,
  `max_salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES
(123, 'Accountant', 15000, 25000),
(124, 'Team Leader', 20000, 30000),
(125, 'Manager', 25000, 35000),
(126, 'Executive', 35000, 50000),
(127, 'CEO', 40000, 55000);

-- --------------------------------------------------------

--
-- Table structure for table `job_history`
--

CREATE TABLE `job_history` (
  `employee_id` varchar(10) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `department_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job_history`
--

INSERT INTO `job_history` (`employee_id`, `start_date`, `end_date`, `job_id`, `department_id`) VALUES
('E125', '2017-10-13', '2020-04-12', 127, 'D1396'),
('E127', '2017-08-17', '2020-04-12', 126, 'D1859'),
('E239', '2018-12-12', '2019-12-12', 126, 'D7559'),
('E252', '2018-12-10', '2020-04-12', 123, 'D7559'),
('E317', '2015-05-29', '2020-04-12', 126, 'D2589'),
('E420', '2017-09-23', '2020-04-12', 124, 'D1389'),
('E422', '2018-10-10', '2019-04-05', 124, 'D2679'),
('E442', '2018-09-13', '2018-12-12', 126, 'D1389'),
('E519', '2017-12-12', '2020-04-12', 124, 'D4059'),
('E558', '2017-11-15', '2018-05-12', 126, 'D1559');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `street_address` varchar(50) DEFAULT NULL,
  `postal_code` varchar(30) DEFAULT NULL,
  `city` varchar(10) NOT NULL,
  `state_province` varchar(30) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES
(127877, '374 William Canning Street', 'UA00', 'Vioming', 'Jalisco', 12),
(127880, '180 North King Street', 'I700', 'Imphal', 'Mizoram', 10),
(127887, '700 Oak Street', 'F500', 'Marseille', 'Ile-de-France', 11),
(130877, 'Rio De Mohammad Street', 'PA80', 'Karachi', 'Punjab', 14),
(137877, '750 Tolstoy Street', 'S800', 'El Escoria', 'Barcelona', 13);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `region_id` int(11) NOT NULL,
  `region_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`region_id`, `region_name`) VALUES
(7025, 'Manipur'),
(7035, 'Paris'),
(7038, 'Mexico'),
(7040, 'Madrid'),
(7045, 'Lahore');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `manager_id` (`manager_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `job_history`
--
ALTER TABLE `job_history`
  ADD PRIMARY KEY (`employee_id`,`start_date`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`region_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `countries_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`region_id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `departments_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `job_history`
--
ALTER TABLE `job_history`
  ADD CONSTRAINT `job_history_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `job_history_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  ADD CONSTRAINT `job_history_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
