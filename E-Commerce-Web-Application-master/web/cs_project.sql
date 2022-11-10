-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2022 at 09:16 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `allusers`
--

CREATE TABLE `allusers` (
  `uid` varchar(20) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `upass` varchar(20) NOT NULL,
  `uemail` varchar(30) NOT NULL,
  `umobileno` varchar(10) NOT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `State` varchar(30) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allusers`
--

INSERT INTO `allusers` (`uid`, `uname`, `upass`, `uemail`, `umobileno`, `Gender`, `dob`, `Address`, `State`, `Country`) VALUES
('amiruddin1', 'Aamir Samlayawala', 'Aamir@308', 'ami.coolboy2001@gmail.com', '9087654321', NULL, NULL, NULL, NULL, NULL),
('chin', 'chintu', 'chintan1101@', 'chin@gmail.com', '9087654321', NULL, NULL, NULL, NULL, NULL),
('Husain0501', 'Husain Ali Samlayawala', 'Husain@0501', 'husain1599@gmail.com', '9087654321', NULL, NULL, NULL, NULL, NULL),
('Mahi', 'Mahendra Singh Dhoni', 'Mahi@7781', 'mahi7781@gmail.com', '9087654321', NULL, NULL, NULL, NULL, NULL),
('Mahir', 'Mahir Saiyed', 'mahir@123', 'mahir@gmail.com', '9087654321', NULL, NULL, NULL, NULL, NULL),
('Mufz3093', 'Mufazzal Jariwala', 'Mufz@3093', 'mufz3093@gmail.com', '9712207347', NULL, NULL, NULL, NULL, NULL),
('SakanMuka', 'Sakina Samlayawala', 'Sakina@3009', 'sakinamuku@gmail.com', '9087654321', NULL, NULL, NULL, NULL, NULL),
('VK18', 'Virat Kohli', 'Virat@18', 'virat.kohli@gmail.com', '9087654321', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `C_ID` int(11) NOT NULL,
  `C_PID` varchar(11) DEFAULT NULL,
  `C_PDESC` varchar(100) NOT NULL,
  `C_PQTY` varchar(11) NOT NULL,
  `C_PPRICE` varchar(11) NOT NULL,
  `C_PSELLER` varchar(100) DEFAULT NULL,
  `CAT_ID` varchar(11) DEFAULT NULL,
  `C_PName` varchar(50) DEFAULT NULL,
  `uid` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`C_ID`, `C_PID`, `C_PDESC`, `C_PQTY`, `C_PPRICE`, `C_PSELLER`, `CAT_ID`, `C_PName`, `uid`) VALUES
(30, '51', 'Gents Slipper', '2', '210', 'Flipcart Ltd.', '5', 'Bahamas Footwear', 'amiruddin1'),
(31, '54', 'LG Oven High Speed', '2', '34000', 'Amazon & Co.', '3', 'LG Oven', 'amiruddin1'),
(36, '48', 'Ladies Pink Frock ', '1', '1599', 'Amazon & Co.', '2', 'Frock', 'VK18'),
(38, '52', '10X Plate', '2', '850', 'Flipcart Ltd.', '6', 'Bhagyoday Plate set', 'amiruddin1');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `C_ID` int(11) NOT NULL,
  `C_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`C_ID`, `C_NAME`) VALUES
(1, 'ELECTRONICS'),
(2, 'MEN/WOMEN WEARS'),
(3, 'HOME APPLIANCES'),
(4, 'MOBILE ACCESSORIES'),
(5, 'FOOT WEAR'),
(6, 'CROCKERY'),
(7, 'Hardware'),
(8, 'Others'),
(9, 'Stationery');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ORDER_ID` int(11) NOT NULL,
  `P_ID` varchar(20) DEFAULT NULL,
  `OP_NAME` varchar(50) NOT NULL,
  `OP_DESC` varchar(50) NOT NULL,
  `OP_PRICE` varchar(50) NOT NULL,
  `OP_QTY` varchar(50) NOT NULL,
  `OC_NAME` varchar(50) NOT NULL,
  `OP_SELLER` varchar(50) NOT NULL,
  `O_TIME` datetime NOT NULL,
  `user_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ORDER_ID`, `P_ID`, `OP_NAME`, `OP_DESC`, `OP_PRICE`, `OP_QTY`, `OC_NAME`, `OP_SELLER`, `O_TIME`, `user_id`) VALUES
(10, '44', 'Laptop', '8 GB RAM, 1 TB Storage', '100000', '1', 'ELECTRONICS', 'Flipcart Ltd.', '2022-10-23 12:03:01', 'amiruddin1'),
(11, '53', 'Laxmi Mojdi', 'Ledies Mojdi 10 Number', '499', '1', 'FOOT WEAR', 'Flipcart Ltd.', '2022-10-23 12:10:35', 'amiruddin1'),
(12, '44', 'Laptop', '8 GB RAM, 1 TB Storage', '100000', '1', 'ELECTRONICS', 'Flipcart Ltd.', '2022-10-23 12:13:25', 'VK18');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductId` int(11) NOT NULL,
  `Pname` varchar(30) NOT NULL,
  `PDesc` varchar(100) NOT NULL,
  `PQty` int(11) NOT NULL,
  `PPrice` int(11) NOT NULL,
  `PSeller` varchar(100) NOT NULL,
  `CAT_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductId`, `Pname`, `PDesc`, `PQty`, `PPrice`, `PSeller`, `CAT_ID`) VALUES
(44, 'Laptop', '8 GB RAM, 1 TB Storage', 60, 100000, 'Flipcart Ltd.', 1),
(47, 'Men Jeans', 'XL Size', 1, 599, 'Amazon & Co.', 2),
(48, 'Frock', 'Ladies Pink Frock ', 1, 1599, 'Amazon & Co.', 2),
(49, 'LG Fridge', 'Double Door', 1, 25000, 'Amazon & Co.', 3),
(50, 'MI Note 9 Pro Max Cober', 'MI Note 9 Pro Max Phone Cover', 1, 300, 'Amazon & Co.', 4),
(51, 'Bahamas Footwear', 'Gents Slipper', 1, 210, 'Flipcart Ltd.', 5),
(52, 'Bhagyoday Plate set', '10X Plate', 1, 850, 'Flipcart Ltd.', 6),
(53, 'Laxmi Mojdi', 'Ledies Mojdi 10 Number', 1, 499, 'Flipcart Ltd.', 5),
(54, 'LG Oven', 'LG Oven High Speed', 1, 34000, 'Amazon & Co.', 3),
(55, 'Usha Fan', '4 Pankh Wala Fan Jo bijli se chalta hai', 1, 1900, 'Amazon & Co.', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allusers`
--
ALTER TABLE `allusers`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`C_ID`),
  ADD UNIQUE KEY `C_PID` (`C_PID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`C_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ORDER_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `C_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `C_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
