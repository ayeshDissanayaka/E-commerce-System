-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2019 at 08:59 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pafproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `username`, `password`) VALUES
(1, 'sahanJay', 'sahan123'),
(2, 'sahanJay', 'sahan123');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `lineID` int(11) NOT NULL,
  `cusID` int(11) NOT NULL,
  `addedDate` datetime NOT NULL,
  `checkedDate` datetime DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`lineID`, `cusID`, `addedDate`, `checkedDate`, `status`) VALUES
(1, 1, '2019-05-05 11:14:23', '2019-05-15 00:00:00', 'inactive'),
(2, 1, '2019-05-05 18:02:37', '2019-05-16 00:00:00', 'inactive'),
(3, 1, '2019-05-05 18:08:20', '2019-05-05 18:09:28', 'inactive'),
(4, 1, '2019-05-05 18:10:05', '2019-05-05 18:10:28', 'inactive'),
(5, 1, '2019-05-06 00:17:40', '2019-05-06 02:20:22', 'inactive'),
(6, 1, '2019-05-15 22:12:05', '2019-05-15 22:13:11', 'inactive'),
(7, 1, '2019-05-15 22:26:29', '2019-05-15 22:37:36', 'inactive'),
(8, 1, '2019-05-15 22:39:51', '2019-05-15 22:39:56', 'inactive'),
(9, 1, '2019-05-15 22:45:50', '2019-05-15 22:46:05', 'inactive'),
(10, 1, '2019-05-15 22:49:08', '2019-05-15 22:49:18', 'inactive'),
(11, 1, '2019-05-16 23:39:53', '2019-05-26 20:12:56', 'inactive'),
(12, 1, '2019-05-26 20:13:28', '2019-05-26 20:14:15', 'inactive'),
(13, 1, '2019-05-26 20:14:26', '2019-05-26 20:14:31', 'inactive'),
(14, 1, '2019-05-26 20:14:36', '2019-05-26 20:14:43', 'inactive'),
(15, 1, '2019-05-26 20:14:47', '2019-05-26 20:15:02', 'inactive'),
(16, 1, '2019-05-26 20:16:18', '2019-05-26 20:16:26', 'inactive'),
(17, 1, '2019-05-26 20:16:45', '2019-05-26 20:16:59', 'inactive'),
(18, 1, '2019-05-26 20:19:02', '2019-05-26 20:19:07', 'inactive'),
(19, 1, '2019-05-26 20:19:12', '2019-05-26 20:19:21', 'inactive'),
(20, 1, '2019-05-26 20:24:01', '2019-05-26 20:25:15', 'inactive'),
(21, 1, '2019-05-26 20:27:22', '2019-05-26 20:27:56', 'inactive'),
(22, 2, '2019-05-26 20:46:45', '2019-05-26 20:48:26', 'inactive'),
(23, 3, '2019-05-26 23:16:44', NULL, 'active'),
(24, 2, '2019-08-04 12:28:29', NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `cartitems`
--

CREATE TABLE `cartitems` (
  `itemID` int(11) NOT NULL,
  `cartID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cartitems`
--

INSERT INTO `cartitems` (`itemID`, `cartID`, `productID`, `qty`, `status`) VALUES
(6, 1, 1, 4, NULL),
(7, 1, 4, 1, NULL),
(8, 1, 3, 1, NULL),
(11, 2, 3, 1, NULL),
(12, 3, 1, 1, NULL),
(13, 4, 3, 1, NULL),
(14, 4, 4, 1, NULL),
(15, 4, 1, 1, NULL),
(18, 5, 4, 2, NULL),
(19, 6, 1, 5, NULL),
(21, 7, 1, 1, 'shipped'),
(22, 7, 4, 3, 'pending'),
(23, 8, 3, 1, 'pending'),
(24, 9, 3, 2, 'pending'),
(25, 10, 1, 1, 'pending'),
(26, 11, 8, 4, 'pending'),
(27, 11, 9, 1, 'pending'),
(29, 12, 3, 1, 'shipped'),
(30, 12, 7, 1, 'pending'),
(31, 13, 3, 1, 'pending'),
(32, 14, 9, 1, 'pending'),
(33, 15, 7, 1, 'pending'),
(34, 15, 8, 2, 'pending'),
(35, 16, 7, 1, 'pending'),
(36, 17, 8, 1, 'pending'),
(37, 17, 9, 2, 'pending'),
(38, 18, 7, 1, 'pending'),
(39, 19, 3, 1, 'pending'),
(40, 19, 1, 1, 'pending'),
(41, 19, 4, 1, 'pending'),
(42, 20, 1, 1, 'shipped'),
(43, 20, 7, 1, 'pending'),
(44, 20, 9, 1, 'pending'),
(45, 20, 4, 1, 'pending'),
(46, 21, 3, 2, 'pending'),
(47, 21, 7, 1, 'pending'),
(48, 21, 9, 4, 'pending'),
(49, 22, 1, 1, 'pending'),
(50, 22, 7, 5, 'pending'),
(53, 23, 1, 1, NULL),
(54, 24, 3, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catID` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `catName` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  `addedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catID`, `description`, `catName`, `status`, `addedDate`) VALUES
(1, 'Food Category', 'Foods and Beverages', 'active', '2019-04-10'),
(2, 'Test 3', 'Electronics', 'active', '2019-04-30'),
(3, 'sdfsdfsdfsdf', 'Other', 'active', '2019-04-30'),
(4, 'My Category Description', 'My Category 2', 'active', '2019-05-02'),
(5, 'sd', 'sd', 'active', '2019-05-02'),
(6, 'Cat Description', 'Cat1', 'active', '2019-05-03'),
(7, 'ssd', 'ssd', 'active', '2019-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `cusorder`
--

CREATE TABLE `cusorder` (
  `orderID` int(11) NOT NULL,
  `cartID` int(11) NOT NULL,
  `payID` int(11) NOT NULL,
  `billDate` date NOT NULL,
  `total` double NOT NULL,
  `shipID` int(11) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'paid'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cusorder`
--

INSERT INTO `cusorder` (`orderID`, `cartID`, `payID`, `billDate`, `total`, `shipID`, `status`) VALUES
(5, 1, 2, '2019-05-05', 390480, 3, 'paid'),
(6, 2, 1, '2019-05-05', 125000, 2, 'paid'),
(7, 3, 1, '2019-05-05', 120, 1, 'paid'),
(8, 3, 1, '2019-05-05', 120, 1, 'paid'),
(9, 4, 3, '2019-05-05', 390120, 2, 'paid'),
(10, 5, 3, '2019-05-06', 530000, 3, 'paid'),
(11, 6, 4, '2019-05-15', 600, 3, 'paid'),
(12, 7, 1, '2019-05-15', 795120, 1, 'paid'),
(13, 8, 1, '2019-05-15', 125000, 1, 'paid'),
(14, 9, 6, '2019-05-15', 250000, 3, 'paid'),
(15, 10, 1, '2019-05-15', 120, 1, 'paid'),
(16, 11, 2, '2019-05-26', 247, 3, 'paid'),
(17, 12, 2, '2019-05-26', 125012, 4, 'paid'),
(18, 13, 1, '2019-05-26', 125000, 1, 'paid'),
(19, 14, 1, '2019-05-26', 67, 1, 'paid'),
(20, 15, 1, '2019-05-26', 102, 1, 'paid'),
(21, 16, 1, '2019-05-26', 12, 1, 'paid'),
(22, 17, 1, '2019-05-26', 179, 1, 'paid'),
(23, 18, 1, '2019-05-26', 12, 1, 'paid'),
(24, 19, 1, '2019-05-26', 390120, 1, 'paid'),
(25, 20, 3, '2019-05-26', 265199, 3, 'paid'),
(26, 21, 4, '2019-05-26', 250280, 2, 'paid'),
(27, 22, 1, '2019-05-26', 180, 1, 'paid');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cusID` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `city` varchar(100) NOT NULL,
  `postal` varchar(100) NOT NULL,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(300) NOT NULL,
  `password` varchar(100) NOT NULL,
  `regDate` date NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cusID`, `fname`, `lname`, `email`, `phone`, `country`, `dob`, `city`, `postal`, `address1`, `address2`, `password`, `regDate`, `status`) VALUES
(2, 'Sahan', 'Malintha', 'pasanmalintha@gmail.com', '0711412090', 'Sri Lanka', '1994-12-12', 'Columbia', '10231', '204/1, Werahera, Boralesgamuwa', 'Colombo', 'pasan@12345', '2019-05-26', 'active'),
(3, 'Sahan', 'Lakshitha', 'sahanlakshitha1996@hotmail.com', '0711594019', 'Sri Lanka', '1995-04-19', 'Colombo', '10295', '204/1, Gangarama Road,', 'Werahera, Boralesgamuwa.', 'kuma123', '2019-05-26', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payID` int(11) NOT NULL,
  `payType` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  `addedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payID`, `payType`, `status`, `addedDate`) VALUES
(1, 'Test123456', 'inactive', '2019-04-10'),
(2, 'Test2', 'inactive', '2019-04-23'),
(3, 'Test34', 'active', '2019-04-25'),
(4, 'payment54321', 'active', '2019-04-30'),
(5, 'ssdfghj', 'active', '2019-04-30'),
(6, 'New My Payment', 'active', '2019-05-03');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prID` int(11) NOT NULL,
  `suppID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `unitPrice` double NOT NULL,
  `brand` varchar(100) NOT NULL,
  `catID` int(11) NOT NULL,
  `prodImage` varchar(500) NOT NULL,
  `addedDate` date NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  `admin` varchar(100) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prID`, `suppID`, `name`, `description`, `unitPrice`, `brand`, `catID`, `prodImage`, `addedDate`, `status`, `admin`) VALUES
(1, 1, 'Product Test 2', 'This is a testing Product 1', 120, 'Sony', 1, '/resources/images/products/wallpaper.jpg', '2019-05-14', 'active', 'active'),
(3, 1, 'Sony Bravia 32', 'This is a testing Product 2', 125000, 'Sony', 2, '/resources/images/products/medicine.jpg', '2019-05-02', 'active', 'active'),
(4, 2, 'Sony Bravia 64', 'This is a testing Product 2', 265000, 'Sony', 1, '/resources/images/products/wallpaper.jpg', '2019-05-02', 'active', 'active'),
(5, 2, 'Phone Cover', 'My test proeuct 1234', 250.75, 'Samsung', 2, '/resources/images/products/medicine.jpg', '2019-05-26', 'active', 'active'),
(6, 2, 'ss', 'asdfasd', 123, 'fsdfd', 3, '/resources/images/products/wallpaper.jpg', '2019-05-26', 'active', 'active'),
(7, 2, 'adsa', 'dfsdf', 12, 'asd', 2, '/resources/images/products/wallpaper.jpg', '2019-05-26', 'active', 'active'),
(8, 2, 'asdasd', 'sdfds', 45, 'sdfsdf', 4, '/resources/images/products/medicine.jpg', '2019-05-26', 'active', 'active'),
(9, 2, 'asdasd', 'dfg', 67, 'dfgd', 2, '/resources/images/products/medicine.jpg', '2019-05-26', 'inactive', 'active'),
(10, 1, 'sdfs', 'adfad', 12, 'Sony', 7, '/resources/images/products/medicine.jpg', '2019-05-26', 'inactive', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `suppID` int(11) NOT NULL,
  `company` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `city` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `regDate` date NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`suppID`, `company`, `fname`, `lname`, `email`, `phone`, `country`, `dob`, `city`, `password`, `state`, `address1`, `address2`, `regDate`, `status`) VALUES
(1, 'Test Company1', 'Sahan1', 'Jay1', 'sahanjay@gmail.com1', '07115940191', 'Sri Lanka1', '1992-04-18', 'Colombo1', 'Kuma12345.', 'SL', '204/1, Werahera,1', 'Boralesgamuwa1', '2019-04-18', 'active'),
(5, 'Neem Ads', 'ssd', 'Jayawardena', 'nirmani@gmail.com2', '0711594019', 'Sri Lanka', '1995-12-21', 'asdsadfsf', 's123', 'SL', '204/1, Werahera', 'Boralesgamuwa', '2019-05-19', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `shipID` int(11) NOT NULL,
  `company` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'active',
  `addedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`shipID`, `company`, `status`, `addedDate`) VALUES
(1, 'Ship Company 5', 'active', '2019-04-17'),
(2, 'Asad Sali', 'active', '2019-04-26'),
(3, 'DHL', 'active', '2019-04-19'),
(4, 'Test Shipment', 'active', '2019-05-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`lineID`);

--
-- Indexes for table `cartitems`
--
ALTER TABLE `cartitems`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catID`);

--
-- Indexes for table `cusorder`
--
ALTER TABLE `cusorder`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cusID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prID`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`suppID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `lineID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `cartitems`
--
ALTER TABLE `cartitems`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cusorder`
--
ALTER TABLE `cusorder`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `suppID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `shipID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
