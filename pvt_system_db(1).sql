-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2022 at 05:17 PM
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
-- Database: `pvt_system_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flightId` int(11) NOT NULL,
  `flightNumber` varchar(30) NOT NULL,
  `departTime` time NOT NULL,
  `arrivalTime` time NOT NULL,
  `numberOfSeats` int(11) NOT NULL,
  `ticketPrice` double(11,2) NOT NULL,
  `date` date NOT NULL,
  `departLocation` varchar(50) NOT NULL,
  `arrivalLocation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flightId`, `flightNumber`, `departTime`, `arrivalTime`, `numberOfSeats`, `ticketPrice`, `date`, `departLocation`, `arrivalLocation`) VALUES
(6, 'UL190', '15:40:00', '18:30:00', 70, 25000.00, '2022-09-01', 'colombo', 'Dhaka'),
(7, 'QR654', '14:25:00', '17:20:00', 70, 35000.00, '2022-10-09', 'colombo', 'Doha'),
(8, 'UL192', '16:30:00', '12:00:00', 80, 58000.00, '2022-10-11', 'colombo', 'Tiruchchirappalli'),
(9, 'UL116', '17:25:00', '21:30:00', 70, 45000.00, '2022-10-12', 'colombo', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `email` varchar(30) NOT NULL,
  `role` varchar(30) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`email`, `role`, `time`, `ip`) VALUES
('dilshan79@gmail.com', 'Level 1', '2022-10-07 09:42:16', '0:0:0:0:0:0:0:1'),
('malindie123@gmail.com', 'User', '2022-10-07 13:43:38', '0:0:0:0:0:0:0:1'),
('nethmi111@gmail.com', 'Level 1', '2022-10-07 13:30:17', '0:0:0:0:0:0:0:1');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_booking`
--

CREATE TABLE `ticket_booking` (
  `id` int(11) NOT NULL,
  `numberOfSeats` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `flightId` int(11) NOT NULL,
  `paymentStatus` varchar(30) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_booking`
--

INSERT INTO `ticket_booking` (`id`, `numberOfSeats`, `email`, `flightId`, `paymentStatus`) VALUES
(8, 4, 'malindie123@gmail.com', 6, 'Pending'),
(9, 8, 'malindie123@gmail.com', 7, 'Pending'),
(10, 5, 'malindie123@gmail.com', 9, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `role` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Activated'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `dob`, `address`, `role`, `status`) VALUES
(1, 'malindie', 'malindie123@gmail.com', 'malindie@15', '1999-01-05', 'sma 4564,rhjggb,adgad', 'User', 'Activated'),
(2, 'dilshan', 'dilshan123@gmail.com', 'dilshan@123', '1998-10-25', ',465,ranajayapura,ipalogama', 'Level 1', 'Activated'),
(3, 'ushan', 'ushan456@gmail.com', 'ushan@456', '1997-03-25', 'sma,4646,gdgs,sgafkusgf', 'Level 2', 'Activated'),
(4, 'avish', 'avish145@gmail.com', 'avish@145', '1997-05-25', '4313,afgjhfb,fsgf', 'Admin', 'Activated'),
(5, 'nethmi', 'nethmi111@gmail.com', 'nethmi111', '1999-03-07', 'gsdggsgsgsdgzdf', 'Level 1', 'Activated');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flightId`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `ticket_booking`
--
ALTER TABLE `ticket_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `flightId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ticket_booking`
--
ALTER TABLE `ticket_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
