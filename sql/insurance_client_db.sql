-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2016 at 10:11 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `insurance_client_db`
--
CREATE DATABASE IF NOT EXISTS `insurance_client_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `insurance_client_db`;

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE IF NOT EXISTS `blacklist` (
  `nric` varchar(9) NOT NULL,
  `licencePlate` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `vehicleType` char(1) NOT NULL,
  `reason` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `nric` char(9) NOT NULL,
  `licencePlate` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `vehicleType` char(1) NOT NULL,
  `currentPremium` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `drivingTier` varchar(7) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`licencePlate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`nric`, `licencePlate`, `name`, `vehicleType`, `currentPremium`, `startDate`, `endDate`, `drivingTier`, `email`) VALUES
('S9876543A', '1', 'sarah tay su-lyn', 'B', 800, '2015-03-11', '2016-03-11', 'average', 'sarah.tay.2013@smu.edu.sg'),
('S9876543A', '2', 'Jovin Ng', 'B', 800, '2015-03-11', '2016-03-11', 'average', 'jovin.ng.2014@smu.edu.sg'),
('S9876543A', '3', 'Bowen', 'B', 800, '2015-03-11', '2017-03-11', 'average', 'bowen.lyu.2014@smu.edu.sg'),
('S9876543A', '4', 'Jiawej', 'B', 800, '2015-03-11', '2017-03-11', 'average', 'jiawen.xu.2014@smu.edu.sg');

-- --------------------------------------------------------

--
-- Table structure for table `drivinglog`
--

DROP TABLE IF EXISTS `drivinglog`;
CREATE TABLE IF NOT EXISTS `drivinglog` (
  `licence` varchar(10) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `average_spd` int(11) NOT NULL,
  `acceleration` int(11) NOT NULL,
  PRIMARY KEY (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drivinglog`
--

INSERT INTO `drivinglog` (`licence`, `timestamp`, `average_spd`, `acceleration`) VALUES
('1', '2016-03-08 20:00:00', 80, 120),
('2', '2016-03-09 19:00:00', 80, 120),
('SBA1234A', '2016-03-17 08:25:43', 10, 10),
('SBA1234A', '2016-03-19 05:41:14', 10, 10),
('SBA1234A', '2016-03-19 05:41:20', 10, 10),
('SBA1234A', '2016-03-25 09:15:30', 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `ltalog`
--

DROP TABLE IF EXISTS `ltalog`;
CREATE TABLE IF NOT EXISTS `ltalog` (
  `plateNumber` varchar(10) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(100) NOT NULL,
  `severity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ltalog`
--

INSERT INTO `ltalog` (`plateNumber`, `timestamp`, `description`, `severity`) VALUES
('SGA2222B', '2016-02-29 16:00:00', 'Beat red light', 2),
('SGA2222B', '2016-03-18 17:00:00', 'Drink driving', 1),
('SGB1111Z', '2016-03-17 16:00:00', 'Honking excessively at elderly woman crossing the street', 3),
('1', '2016-03-25 07:51:00', '12312312', 5),
('1', '2016-03-25 07:51:00', '524534', 5),
('1', '2016-03-25 07:51:04', '12312312', 5),
('1', '2016-03-25 07:51:04', '524534', 5),
('1', '2016-03-25 07:51:11', '12312312', 5),
('1', '2016-03-25 07:51:11', '524534', 5),
('1', '2016-03-25 07:51:15', '12312312', 5),
('1', '2016-03-25 07:51:15', '524534', 5),
('1', '2016-03-25 07:51:15', '12312312', 5),
('1', '2016-03-25 07:51:15', '524534', 5),
('1', '2016-03-25 07:51:15', '12312312', 5),
('1', '2016-03-25 07:51:15', '524534', 5);

-- --------------------------------------------------------

--
-- Table structure for table `waitinglist`
--

DROP TABLE IF EXISTS `waitinglist`;
CREATE TABLE IF NOT EXISTS `waitinglist` (
  `nric` varchar(9) NOT NULL,
  `licencePlate` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `vehicleType` char(1) NOT NULL,
  `newPremium` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
