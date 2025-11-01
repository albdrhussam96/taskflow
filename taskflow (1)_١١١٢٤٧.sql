-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2025 at 01:37 PM
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
-- Database: `taskflow`
--

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `username` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gmail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`username`, `name`, `gmail`, `password`) VALUES
(1, 'Ali Hassan', 'ali.hassan@example.com', 's2uh38h9'),
(2, 'Omar Khaled', 'omar.khaled@example.com', 'f95j87gh'),
(3, 'Hassan Ali', 'hassan.ali@example.com', 'huf76vy8'),
(4, 'Khaled Noor', 'khaled.noor@example.com', 'f8yfd809'),
(5, 'Alaa Salem', 'alaa.salem@example.com', 'gmo94jgj');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id_task` int(11) NOT NULL,
  `name_task` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id_task`, `name_task`) VALUES
(1, 'Develop Login Module'),
(2, 'Design Landing Page'),
(3, 'Fix API Issues'),
(4, 'Database Optimization'),
(5, 'Write Documentation');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `member_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `member_number`) VALUES
(1, 'Backend Team', 3),
(2, 'Frontend Team', 2),
(3, 'Mobile Team', 3),
(4, 'QA Team', 2),
(5, 'Design Team', 2);

-- --------------------------------------------------------

--
-- Table structure for table `team_member`
--

CREATE TABLE `team_member` (
  `id_tm` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `id_member` int(11) NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `team_member`
--

INSERT INTO `team_member` (`id_tm`, `id_team`, `id_member`, `is_admin`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 0),
(3, 2, 2, 1),
(4, 2, 3, 0),
(5, 3, 1, 0),
(6, 3, 4, 1),
(7, 4, 5, 1),
(8, 4, 3, 0),
(9, 5, 4, 1),
(10, 5, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `team_member_task`
--

CREATE TABLE `team_member_task` (
  `id_tmt` int(11) NOT NULL,
  `id_task` int(11) NOT NULL,
  `id_tm` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_finish` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `team_member_task`
--

INSERT INTO `team_member_task` (`id_tmt`, `id_task`, `id_tm`, `start_date`, `end_date`, `is_finish`) VALUES
(1, 1, 1, '2025-01-10', '2025-01-20', 1),
(2, 3, 2, '2025-01-12', '2025-01-18', 0),
(3, 2, 4, '2025-02-01', '2025-02-10', 1),
(4, 5, 7, '2025-02-15', '2025-02-25', 0),
(5, 4, 6, '2025-03-01', '2025-03-15', 1),
(6, 1, 3, '2025-03-05', '2025-03-20', 0),
(7, 2, 5, '2025-04-02', '2025-04-15', 1),
(8, 3, 8, '2025-04-10', '2025-04-25', 0),
(9, 4, 9, '2025-05-01', '2025-05-18', 1),
(10, 5, 10, '2025-05-03', '2025-05-22', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id_task`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_member`
--
ALTER TABLE `team_member`
  ADD PRIMARY KEY (`id_tm`),
  ADD KEY `id_team` (`id_team`),
  ADD KEY `id_member` (`id_member`);

--
-- Indexes for table `team_member_task`
--
ALTER TABLE `team_member_task`
  ADD PRIMARY KEY (`id_tmt`),
  ADD KEY `id_task` (`id_task`,`id_tm`),
  ADD KEY `id_tm` (`id_tm`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `username` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id_task` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `team_member`
--
ALTER TABLE `team_member`
  MODIFY `id_tm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `team_member_task`
--
ALTER TABLE `team_member_task`
  MODIFY `id_tmt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `team_member`
--
ALTER TABLE `team_member`
  ADD CONSTRAINT `team_member_ibfk_1` FOREIGN KEY (`id_team`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_member_ibfk_2` FOREIGN KEY (`id_member`) REFERENCES `member` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_member_task`
--
ALTER TABLE `team_member_task`
  ADD CONSTRAINT `team_member_task_ibfk_1` FOREIGN KEY (`id_tm`) REFERENCES `team_member` (`id_tm`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_member_task_ibfk_2` FOREIGN KEY (`id_task`) REFERENCES `task` (`id_task`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
