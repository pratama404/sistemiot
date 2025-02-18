-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 18, 2025 at 07:38 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_iot`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` int NOT NULL,
  `serial_number` varchar(8) NOT NULL,
  `sensor_actuator` enum('sensor','actuator') NOT NULL,
  `value` varchar(10) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mqtt_topic` text NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `serial_number`, `sensor_actuator`, `value`, `name`, `mqtt_topic`, `time`) VALUES
(1, '12345678', 'sensor', '40', 'suhu', 'kelasiot/suhu', '2024-06-27 13:08:43'),
(2, '12345678', 'sensor', '30', 'suhu', '123456789/suhu', '2024-06-27 13:08:43'),
(3, 'abcdefg', 'actuator', '90', 'Servo', '12345678/taman/pintu', '2024-06-27 13:08:43'),
(4, '12345678', 'actuator', '23', 'servo', 'kelasiot/12345678/servo', '2024-06-27 13:08:43'),
(6, '12345678', 'sensor', '33', 'suhu', 'kelasiot/12345678/suhu', '2024-06-27 13:08:43'),
(7, '12345678', 'sensor', '35', 'suhu', 'kelasiot/12345678/suhu', '2024-06-27 13:08:43');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `serial_number` varchar(8) NOT NULL,
  `mcu_type` varchar(15) NOT NULL,
  `location` text NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`serial_number`, `mcu_type`, `location`, `created_time`, `active`) VALUES
('12345678', 'ESP32', 'Gedung A', '2024-06-24 09:16:26', 'Yes'),
('63633', 'GDFSGS', 'kokoki', '2024-06-24 15:38:20', 'No'),
('87654321', 'Test', 'lokasi', '2024-06-24 10:59:14', 'Yes'),
('abcdefg', 'ESP8266', 'Mars', '2024-06-24 13:31:07', 'No'),
('asdfgh', 'NodeMCU', 'rumahini', '2024-06-24 16:02:15', 'No'),
('jajan', 'jajan', 'jajan', '2024-06-28 16:30:34', 'Yes'),
('oko', 'oko', 'oko', '2024-06-25 04:41:17', 'Yes'),
('wertyu', 'arduino uno', 'jateng', '2024-06-25 04:28:30', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `role` enum('Admin','User') NOT NULL DEFAULT 'User',
  `active` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `fullname`, `role`, `active`) VALUES
('bambang', '$2y$10$sIxwBKXC60/DKfJIkE1L1OtyB6Z6Pv6n0WIQyc2dxMxggx88WRnYC', 'Bambang Puji', 'Admin', 'Yes'),
('bunga', '$2y$10$TcXIgCe0u2IpaFaR0./E0eD3ubNh3n6P2wb9QQR9yUaXvaaacXE.i', 'Bunga Kembang', 'User', 'Yes'),
('pratama', '$2y$10$pPdX4k8O.5rS94X/N6rzKex2iGo2oYzM8YGiQd6OFhgjTmvdAj7au', 'Pratama', 'Admin', 'Yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serial_number` (`serial_number`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`serial_number`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data`
--
ALTER TABLE `data`
  ADD CONSTRAINT `data_ibfk_1` FOREIGN KEY (`serial_number`) REFERENCES `devices` (`serial_number`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
