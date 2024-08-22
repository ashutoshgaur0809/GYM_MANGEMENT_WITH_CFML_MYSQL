-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 192.168.2.30:3306
-- Generation Time: Aug 22, 2024 at 01:24 PM
-- Server version: 5.7.21
-- PHP Version: 7.0.33-0ubuntu0.16.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_ashutosh`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminreg`
--

CREATE TABLE `adminreg` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `passkey` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminreg`
--

INSERT INTO `adminreg` (`id`, `fullname`, `email`, `phone`, `passkey`) VALUES
(3, 'A', 'ashutoshgaur0809@gmaill.com', '07014729896', '123'),
(7, 'anhijiet', 'ak@gmail.com', '07014729896', 'xyz'),
(8, 'Jatin Jangid', 'jjj@gmail.com', '07014729896', 'xyz');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cId` int(11) NOT NULL,
  `cName` varchar(255) NOT NULL,
  `cPack` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cId`, `cName`, `cPack`) VALUES
(1, 'Duration', '7'),
(2, 'Access', '3'),
(3, 'Service', '5');

-- --------------------------------------------------------

--
-- Table structure for table `newpack`
--

CREATE TABLE `newpack` (
  `npid` int(11) NOT NULL,
  `npName` varchar(255) NOT NULL,
  `npCat` varchar(255) NOT NULL,
  `npRate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newpack`
--

INSERT INTO `newpack` (`npid`, `npName`, `npCat`, `npRate`) VALUES
(25, '2 Month', 'Duration', '800'),
(26, 'Strong', 'Service', '10000'),
(27, 'Specail', 'Service', '12000');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `oid` int(11) NOT NULL,
  `uName` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pName` varchar(255) NOT NULL,
  `cName` varchar(255) NOT NULL,
  `pRate` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`oid`, `uName`, `phone`, `city`, `email`, `pName`, `cName`, `pRate`, `status`, `Date`) VALUES
(6, 'Jatin', '07014729896', 'Jodhpur', 'ashutoshgaur0809@gmaill.com', 'one_month', 'Duration', '700.0', 1, '2024-08-21'),
(7, 'Jatin', '07014729896', 'Jodhpur', 'ashutoshgaur0809@gmaill.com', 'one_month', 'Duration', '700.0', 1, '2024-08-21'),
(8, 'Jatin', '07014729896', 'Jodhpur', 'ashutoshgaur0809@gmaill.com', 'three_month', 'Duration', '2000.0', 1, '2024-08-21'),
(9, 'Jatin', '07014729896', 'Jodhpur', 'ashutoshgaur0809@gmaill.com', '2 Month', 'Duration', '800.0', 1, '2024-08-21'),
(16, 'Jatin', '07014729896', 'Jodhpur', 'ashutoshgaur0809@gmaill.com', 'comprehensive', 'Service', '5000.0', 1, '2024-08-21'),
(17, 'Jatin', '07014729896', 'Jodhpur', 'ashutoshgaur0809@gmaill.com', '2 Month', 'Duration', '800.0', 0, '2024-08-21'),
(18, 'Jatin', '07014729896', 'Jodhpur', 'ashutoshgaur0809@gmaill.com', '2 Month', 'Duration', '800.0', 0, '2024-08-21'),
(19, 'Jatin', '07014729896', 'Jodhpur', 'ashutoshgaur0809@gmaill.com', 'Strong', 'Service', '10000.0', 0, '2024-08-21'),
(20, 'Jatin', '07014729896', 'Jodhpur', 'ashutoshgaur0809@gmaill.com', 'Strong', 'Service', '10000.0', 0, '2024-08-21');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pId` int(11) NOT NULL,
  `pName` varchar(255) NOT NULL,
  `cName` varchar(255) NOT NULL,
  `pRate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pId`, `pName`, `cName`, `pRate`) VALUES
(1, 'one_month', 'Duration', '70.0'),
(2, 'three_month', 'Duration', '2000'),
(3, 'six_month', 'Duration', '350.0'),
(4, 'off_peak', 'Access', '8000.0'),
(5, 'peak_time', 'Access', '1500'),
(6, 'any_time', 'Access', '4000'),
(7, 'basic', 'Service', '900'),
(8, 'standard', 'Service', '1800'),
(9, 'comprehensive', 'Service', '5000');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `fullname`, `email`, `phone`, `city`, `password`, `date`) VALUES
(7, 'Jatin', 'ashutoshgaur0809@gmaill.com', '07014729896', 'Jodhpur', '12', '2024-08-20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminreg`
--
ALTER TABLE `adminreg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cId`);

--
-- Indexes for table `newpack`
--
ALTER TABLE `newpack`
  ADD PRIMARY KEY (`npid`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pId`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminreg`
--
ALTER TABLE `adminreg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `newpack`
--
ALTER TABLE `newpack`
  MODIFY `npid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
