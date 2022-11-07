-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2022 at 07:22 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homebakers`
--

-- --------------------------------------------------------

--
-- Table structure for table `bakers`
--

CREATE TABLE `bakers` (
  `bakerId` int(20) NOT NULL,
  `bakerName` varchar(50) NOT NULL,
  `bakerCompany` varchar(50) NOT NULL,
  `bakerAddress` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bakers`
--

INSERT INTO `bakers` (`bakerId`, `bakerName`, `bakerCompany`, `bakerAddress`, `location`, `number`, `email`, `password`) VALUES
(1, 'Alen Rinny', 'Rinny Corp', 'Manjumel', '9.955145&76.329606', '8458384993', 'alen@gmail.com', 'alen@123'),
(2, 'Dev Krishnan', 'Dev Corp', 'Edapalli', '10.024046&76.309606', '5647893090', 'dev@gmail.com', 'dev@123'),
(3, 'Nivil Edward', 'Nivil corp', 'kundanoor', '9.935887&76.318344', '8945903456', 'nivil@gmail.com', 'nivil@123'),
(4, 'Neeraj', 'nee corp', 'Near Kundanoor bank', '9.949963&76.318087', '9876567867', 'neeraj@gmail.com', 'neeraj@123'),
(5, 'Melinda Mary', 'Melinda Corp', 'kannadikadu', '9.953721&76.318077', '9845678945', 'melinda@gmail.com', 'melinda@123');

-- --------------------------------------------------------

--
-- Table structure for table `cakes`
--

CREATE TABLE `cakes` (
  `cakeId` int(10) NOT NULL,
  `cakeName` varchar(30) NOT NULL,
  `cakeFlavour` varchar(30) DEFAULT NULL,
  `bakerId` int(4) NOT NULL,
  `cakeImage` varchar(100) NOT NULL,
  `cakePrice` int(11) NOT NULL,
  `cakeRating` int(11) NOT NULL,
  `cakeIngredients` varchar(200) NOT NULL,
  `cakeCalories` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cakes`
--

INSERT INTO `cakes` (`cakeId`, `cakeName`, `cakeFlavour`, `bakerId`, `cakeImage`, `cakePrice`, `cakeRating`, `cakeIngredients`, `cakeCalories`) VALUES
(1, 'Butter Scotch', 'ButterScotch', 1, 'http://localhost/bake_house/Server/assets/cakes/1/Butter Scotch/', 750, 4, 'aaaa', 6050),
(2, 'Red Velvet', 'Strawberry', 1, 'http://localhost/bake_house/Server/assets/cakes/1/Red Velvet/', 750, 4, 'aaaaa', 6999),
(3, 'Vannila', 'Vannila', 1, 'http://localhost/bake_house/Server/assets/cakes/1/Vannila/', 650, 3, 'aaaa', 700),
(4, 'Fruit', 'Fruits', 1, 'http://localhost/bake_house/Server/assets/cakes/2/Fruit Cake/', 850, 5, 'aaa', 600),
(5, 'Kit Kat', 'Chocolate', 1, 'http://localhost/bake_house/Server/assets/cakes/2/Kit Kat/', 900, 5, 'aaaaa', 800);

-- --------------------------------------------------------

--
-- Table structure for table `candles`
--

CREATE TABLE `candles` (
  `candleId` int(20) NOT NULL,
  `candleName` varchar(30) NOT NULL,
  `candleType` varchar(30) NOT NULL,
  `candleImage` varchar(100) NOT NULL,
  `candlePrice` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `candles`
--

INSERT INTO `candles` (`candleId`, `candleName`, `candleType`, `candleImage`, `candlePrice`) VALUES
(1, 'candle1', 'birthday', 'http://localhost/bake_house user/Server/assets/candles/candle1.png', 30),
(2, 'candle2', 'birthday', 'http://localhost/bake_house user/Server/assets/candles/candle2.png', 20),
(3, 'candle3', 'birthday', 'http://localhost/bake_house user/Server/assets/candles/candle3.png', 10);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartId` int(11) NOT NULL,
  `cakeId` int(11) NOT NULL,
  `bakerId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `calories` int(11) NOT NULL,
  `eggless` int(11) NOT NULL,
  `sugarfree` int(11) NOT NULL,
  `candleId` int(11) NOT NULL,
  `writing` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartId`, `cakeId`, `bakerId`, `userId`, `weight`, `calories`, `eggless`, `sugarfree`, `candleId`, `writing`, `date`, `time`) VALUES
(1, 1, 1, 4, 1, 4850, 0, 1, 1, '0', '21', '5'),
(2, 4, 3, 4, 2, 600, 1, 0, 3, 'happy birthday dachu ', '21/7/2022', '5:55 PM'),
(3, 5, 5, 5, 1, 400, 0, 0, 0, '', '21/7/2022', '5:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(20) NOT NULL,
  `cakeId` int(30) NOT NULL,
  `userId` int(30) NOT NULL,
  `weight` varchar(30) NOT NULL,
  `calories` int(30) NOT NULL,
  `eggless` int(30) NOT NULL,
  `sugarfree` int(30) NOT NULL,
  `candleId` int(30) NOT NULL,
  `writing` varchar(200) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(30) NOT NULL,
  `bakerId` int(11) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `cakeId`, `userId`, `weight`, `calories`, `eggless`, `sugarfree`, `candleId`, `writing`, `date`, `time`, `bakerId`, `status`, `location`) VALUES
(7, 1, 4, '0.5', 3025, 0, 0, 0, 'Happy Birthday Aunty', '7/10/2022', '5:55 PM', 1, 'accepted', '9.9536536&76.3180468'),
(8, 2, 4, '0.5', 3500, 0, 0, 0, 'Happy Wedding Aniversary', '8/10/2022', '5:55 PM', 1, 'pending', '9.9536536&76.3180476'),
(9, 3, 4, '0.5', 350, 0, 0, 0, 'Happy Retirement', '21/10/2022', '5:55 PM', 1, 'pending', '9.9536537&76.3180462'),
(10, 3, 4, '0.5', 350, 0, 0, 0, 'Happy Birthday Brother', '3/11/2022', '5:55 PM', 1, 'pending', '9.9536537&76.3180462'),
(11, 4, 4, '0.5', 300, 0, 0, 0, 'Happy Birthday Bro', '7/11/2022', '5:55 PM', 1, 'pending', '9.9536536&76.3180468');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `userId` varchar(30) NOT NULL,
  `cakeId` varchar(30) NOT NULL,
  `rating` int(10) NOT NULL,
  `review` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`userId`, `cakeId`, `rating`, `review`) VALUES
('4', '2', 4, 'Very Nice Cake'),
('4', '6', 2, 'Not So Good'),
('3', '2', 5, 'Superrrrrrrbb cake, really tasty!'),
('3', '3', 3, 'So tasty creamy, but too much fat'),
('5', '5', 3, 'Very good cake'),
('4', '1', 2, 'good one\n');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(20) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `userEmail` varchar(30) NOT NULL,
  `userNumber` varchar(50) NOT NULL,
  `userAddress` varchar(100) NOT NULL,
  `userPassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `userName`, `userEmail`, `userNumber`, `userAddress`, `userPassword`) VALUES
(1, 'Manu Singh', 'manu@gmail.com', '8383237890', 'Fort Kochi, India', 'Manu@123'),
(2, 'Raju Patel', 'raju@gmail.com', '848219092', 'Aluva,Kerala', 'raju@123'),
(3, 'Deepak', 'deepak@gmail.com', '8281707449', 'KannadiKadu,Maradu', 'Deepak@123'),
(4, 'Diya Denny', 'diya@gmail.com', '8789234563', 'Kannadikadu, Maradu', 'Diya@123'),
(5, 'Darshana Denny', 'dachu@gmail.com', '9087645378', 'Kerala, India', 'dachu@123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bakers`
--
ALTER TABLE `bakers`
  ADD PRIMARY KEY (`bakerId`);

--
-- Indexes for table `cakes`
--
ALTER TABLE `cakes`
  ADD PRIMARY KEY (`cakeId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD UNIQUE KEY `userId` (`userId`),
  ADD UNIQUE KEY `userId_2` (`userId`),
  ADD KEY `userId_3` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bakers`
--
ALTER TABLE `bakers`
  MODIFY `bakerId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cakes`
--
ALTER TABLE `cakes`
  MODIFY `cakeId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
