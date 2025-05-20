-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2025 at 10:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `temple_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `poojas`
--

CREATE TABLE `poojas` (
  `id` int(11) NOT NULL,
  `temple_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poojas`
--

INSERT INTO `poojas` (`id`, `temple_id`, `name`, `price`) VALUES
(1, 1, 'Usha Pooja', 150.00),
(2, 1, 'Noon Pooja', 200.00),
(3, 1, 'Athazha Pooja', 250.00),
(4, 2, 'Ganapathi Homam', 100.00),
(5, 2, 'Neyyabhishekam', 300.00),
(6, 2, 'Malar Nivedyam', 120.00),
(7, 3, 'Deeparadhana', 80.00),
(8, 3, 'Guruthi Pooja', 180.00),
(9, 3, 'Bhagavathi Seva', 150.00),
(10, 4, 'Pushpanjali', 60.00),
(11, 4, 'Archana', 50.00),
(12, 4, 'Kumkumarchana', 100.00),
(13, 5, 'Shivarchana', 200.00),
(14, 5, 'Abhishekam', 250.00),
(15, 5, 'Neeranjanam', 90.00),
(16, 6, 'Uruli Kamazhthal', 400.00),
(17, 6, 'Noorum Palum', 150.00),
(18, 6, 'Sarpabali', 350.00),
(19, 7, 'Bali Tharpanam', 250.00),
(20, 7, 'Annadanam', 100.00),
(21, 7, 'Neyvilakku', 120.00),
(22, 8, 'Kalamezhuthu Pattu', 500.00),
(23, 8, 'Pushpanjali', 80.00),
(24, 8, 'Thrikalapooja', 150.00),
(25, 9, 'Vellattam', 200.00),
(26, 9, 'Thiruvappana', 250.00),
(27, 9, 'Payasam Nivedyam', 100.00),
(28, 10, 'Usha Pooja', 150.00),
(29, 10, 'Nivedyam', 60.00),
(30, 10, 'Thrimadhuram', 90.00);

-- --------------------------------------------------------

--
-- Table structure for table `temples`
--

CREATE TABLE `temples` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temples`
--

INSERT INTO `temples` (`id`, `name`, `location`, `district`) VALUES
(1, 'Sree Krishna Temple', 'Guruvayoor', 'Thrissur'),
(2, 'Sabarimala Ayyappa Temple', 'Sabarimala', 'Pathanamthitta'),
(3, 'Chottanikkara Devi Temple', 'Chottanikkara', 'Ernakulam'),
(4, 'Attukal Bhagavathy Temple', 'Thiruvananthapuram', 'Thiruvananthapuram'),
(5, 'Vaikom Mahadeva Temple', 'Vaikom', 'Kottayam'),
(6, 'Mannarasala Nagaraja Temple', 'Haripad', 'Alappuzha'),
(7, 'Thirunelli Temple', 'Wayanad', 'Wayanad'),
(8, 'Lokanarkavu Temple', 'Vadakara', 'Kozhikode'),
(9, 'Parassinikkadavu Muthappan Temple', 'Kannur', 'Kannur'),
(10, 'Kaviyoor Mahadeva Temple', 'Kaviyoor', 'Pathanamthitta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `poojas`
--
ALTER TABLE `poojas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `temple_id` (`temple_id`);

--
-- Indexes for table `temples`
--
ALTER TABLE `temples`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `poojas`
--
ALTER TABLE `poojas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `temples`
--
ALTER TABLE `temples`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `poojas`
--
ALTER TABLE `poojas`
  ADD CONSTRAINT `poojas_ibfk_1` FOREIGN KEY (`temple_id`) REFERENCES `temples` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
