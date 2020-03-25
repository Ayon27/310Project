-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 25, 2020 at 01:50 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `310project`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `booking_id` int(6) NOT NULL AUTO_INCREMENT,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `user_id` int(10) NOT NULL,
  `listing_id` int(10) NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `check_in`, `check_out`, `user_id`, `listing_id`) VALUES
(1, '2020-04-01', '2020-04-03', 2, 2),
(3, '2020-04-07', '2020-04-08', 3, 5),
(4, '2020-03-26', '2020-03-27', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `listing`
--

DROP TABLE IF EXISTS `listing`;
CREATE TABLE IF NOT EXISTS `listing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `host_id` int(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `bedrooms` int(4) NOT NULL,
  `washrooms` int(4) NOT NULL,
  `guests` int(4) NOT NULL,
  `entire_house` int(1) NOT NULL,
  `has_pool` int(1) NOT NULL,
  `has_gym` int(1) NOT NULL,
  `country` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `hostName` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `listing`
--

INSERT INTO `listing` (`id`, `host_id`, `name`, `bedrooms`, `washrooms`, `guests`, `entire_house`, `has_pool`, `has_gym`, `country`, `state`, `address`, `price`, `hostName`) VALUES
(1, 1, 'Good place', 2, 1, 3, 0, 1, 0, 'Bangladesh', 'Chittagong', '77/4, street 44', 26.65, 'Ayon'),
(5, 1, 'Best Place', 4, 3, 8, 1, 1, 1, 'Bangladesh', 'Dhaka', 'Banani 1325', 55.89, 'Ayon'),
(3, 2, 'A play to stay', 1, 1, 2, 0, 0, 0, 'Bangladesh', 'Dhaka', 'Mohakhali 93/3', 12.99, 'user five'),
(4, 4, 'User twos Place', 2, 1, 2, 0, 0, 0, 'Bangladesh', 'Dhaka', 'Banani 1552', 15.55, 'User two'),
(6, 1, 'Better Place', 3, 2, 6, 1, 1, 1, 'Bangladesh', 'Dhaka', '77/1A, street 35', 32.9, 'Ayon');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(85) NOT NULL,
  `pass` varchar(2000) NOT NULL,
  `name` varchar(45) NOT NULL,
  `country` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `pass`, `name`, `country`, `state`, `address`, `phone`) VALUES
(1, 'ayon8295@gmail.com', '0c209002302f0d702507b0880830db08d0ee0b30bf0b00520710060970660250ba00f0ea0ae0d705b0be00a0d60620ad', 'Ayon', 'Bangladesh', 'Chittagong', 'Mehdibag 578', '01738852050'),
(2, 'user5@user5.com', '01905103f0dc09d0a40fb0720a40a005e0b606901705408d03c0900ff0940d504109e01f0230630ee0a809d0fe0e10dd', 'user five', 'Bangladesh', 'Dhaka', 'Street 12', '01321456987'),
(3, 'user1@user1.com', '01905103f0dc09d0a40fb0720a40a005e0b606901705408d03c0900ff0940d504109e01f0230630ee0a809d0fe0e10dd', 'user one', 'Bangladesh', 'street 66', 'Dhaka', '01151381381'),
(4, 'user2@user2.com', '01905103f0dc09d0a40fb0720a40a005e0b606901705408d03c0900ff0940d504109e01f0230630ee0a809d0fe0e10dd', 'User two', 'Bangladesh', 'Dhaka', 'Banani 1552', '01321456987');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
