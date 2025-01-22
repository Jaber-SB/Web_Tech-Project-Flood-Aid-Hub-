-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2025 at 12:53 AM
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
-- Database: `crowdfunding`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `goal` varchar(255) NOT NULL,
  `target_amount` decimal(10,2) NOT NULL,
  `raised_amount` decimal(10,2) DEFAULT 0.00,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `title`, `goal`, `target_amount`, `raised_amount`, `image_url`, `created_at`) VALUES
(1, ' Medical Aid and Wellness', 'Provides medical assistance, including mobile clinics, medical supplies, and mental health support to flood victims.', 1200000.00, 30200.00, 'assets/image678bf6f4678269.48090344.jpeg', '2025-01-18 18:46:12'),
(2, 'Emergency Flood Relief', 'This campaign aims to provide immediate relief supplies such as food, clean water, and medical aid to families affected by recent flooding in Bangladesh.', 200000.00, 20500.00, 'assets/image678bf76b95d618.47849839.jpg', '2025-01-18 18:48:11');

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `supported_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `support`
--

INSERT INTO `support` (`id`, `user_id`, `campaign_id`, `amount`, `supported_at`) VALUES
(1, 3, 1, 100.00, '2025-01-18 18:53:42'),
(2, 3, 2, 10000.00, '2025-01-18 19:32:44'),
(3, 3, 2, 10000.00, '2025-01-19 04:07:39'),
(4, 4, 1, 10000.00, '2025-01-19 04:15:56'),
(5, 4, 2, 500.00, '2025-01-19 05:59:30'),
(6, 4, 1, 10000.00, '2025-01-19 06:26:38'),
(7, 4, 1, 10000.00, '2025-01-19 06:48:26'),
(8, 4, 1, 100.00, '2025-01-19 12:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(20) DEFAULT 'user',
  `user_status` varchar(20) DEFAULT 'inactive',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `user_type`, `user_status`, `created_at`) VALUES
(1, 'Morshed', 'Jaber', 'jaber@gmail.com', '$2y$10$G65iqHh1EPD41wdDCim9UeP6kggaHeZUfhT7IknIxh8JrWOH5Mgbe', 'admin', 'active', '2025-01-18 18:37:25'),
(2, 'Sarowar', 'Protik', 'protik@gmail.com', '$2y$10$jobcDL9zbi7efwM5YdY8Z.jkiz2AVoa27J0PH9y706DH6y/QIYB82', 'user', 'active', '2025-01-18 18:38:45'),
(3, 'Sanviraj', 'Siam', 'sanvi@gmail.com', '$2y$10$rve5.2yKvIqkfswC8A8pm.LMvn9oiyjMrcn7ieb1zTWMVXe/sgGhS', 'user', 'active', '2025-01-18 18:41:56'),
(4, 'Morshed Al', 'Jaber', 'm.a.jaber1239@gmail.com', '$2y$10$nWbXxkRuLE8WiiVzYJ8wae4LvKLGrUjhO.MlvhJrwtMQfa7pM4Zli', 'user', 'active', '2025-01-19 04:09:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `campaign_id` (`campaign_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `support`
--
ALTER TABLE `support`
  ADD CONSTRAINT `support_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `support_ibfk_2` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
