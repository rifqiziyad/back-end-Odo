-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2021 at 06:00 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `odo-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `topup`
--

CREATE TABLE `topup` (
  `topup_id` int(11) NOT NULL,
  `topup_user_id` int(11) NOT NULL,
  `topup_amount` int(10) NOT NULL,
  `topup_method` varchar(255) NOT NULL,
  `topup_status` enum('success','failed') NOT NULL,
  `topup_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `topup_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `transaction_sender_id` int(11) NOT NULL,
  `transaction_receiver_id` int(11) NOT NULL,
  `transaction_amount` int(10) NOT NULL,
  `transaction_status` enum('success','failed') NOT NULL,
  `transaction_message` varchar(255) NOT NULL,
  `transaction_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaction_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `transaction_sender_id`, `transaction_receiver_id`, `transaction_amount`, `transaction_status`, `transaction_message`, `transaction_created_at`, `transaction_updated_at`) VALUES
(1, 1, 4, 3000, 'success', 'buat ngopi', '2021-07-15 09:52:42', NULL),
(2, 1, 6, 3000, 'success', 'buat ngopi', '2021-06-10 09:53:54', NULL),
(3, 1, 2, 3000, 'success', 'buat ngopi', '2021-06-10 09:54:01', NULL),
(4, 1, 4, 3000, 'success', 'buat ngopi', '2021-06-10 09:54:39', NULL),
(5, 1, 4, 50000, 'success', 'buat ngopi', '2021-06-10 10:06:43', NULL),
(6, 1, 2, 100, 'success', 'asdasd', '2021-06-12 17:15:20', NULL),
(7, 1, 2, 100, 'success', 'asdasd', '2021-06-12 17:18:23', NULL),
(8, 1, 2, 110, 'success', 'asd', '2021-06-13 02:36:34', NULL),
(9, 1, 2, 110, 'success', 'asd', '2021-06-13 02:36:35', NULL),
(10, 1, 2, 111, 'success', 'asda', '2021-06-13 02:46:25', NULL),
(11, 1, 2, 101, 'success', 'asdsad', '2021-06-13 02:46:57', NULL),
(12, 1, 2, 111, 'success', 'asdasd', '2021-06-13 02:53:33', NULL),
(13, 1, 2, 111, 'success', 'asdasd', '2021-06-13 03:04:03', NULL),
(14, 1, 2, 111, 'success', 'asdasd', '2021-06-13 03:06:22', NULL),
(15, 1, 2, 111, 'success', 'asdasd', '2021-06-13 03:07:29', NULL),
(16, 1, 2, 111, 'success', 'asdasd', '2021-06-13 03:08:34', NULL),
(17, 1, 2, 111, 'success', 'asdasd', '2021-06-13 03:11:43', NULL),
(18, 1, 2, 111, 'success', 'asdasd', '2021-06-13 03:12:09', NULL),
(19, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:13:38', NULL),
(20, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:15:09', NULL),
(21, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:16:03', NULL),
(22, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:18:08', NULL),
(23, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:19:00', NULL),
(24, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:21:08', NULL),
(25, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:21:47', NULL),
(26, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:22:56', NULL),
(27, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:24:06', NULL),
(28, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:27:00', NULL),
(29, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:27:27', NULL),
(30, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:27:49', NULL),
(31, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:29:18', NULL),
(32, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:30:13', NULL),
(33, 1, 2, 111, 'success', 'asdsad', '2021-06-13 03:31:43', NULL),
(34, 1, 2, 111, 'success', 'asd', '2021-06-13 03:33:53', NULL),
(35, 1, 2, 111, 'success', 'asd', '2021-06-13 03:35:25', NULL),
(36, 1, 2, 111, 'success', 'asd', '2021-06-13 03:36:03', NULL),
(37, 1, 2, 111, 'success', 'asd', '2021-06-13 03:36:31', NULL),
(38, 1, 2, 111, 'success', 'asd', '2021-06-13 03:37:37', NULL),
(39, 1, 2, 111, 'success', 'asd', '2021-06-13 03:39:22', NULL),
(40, 1, 2, 111, 'success', 'asd', '2021-06-13 03:43:16', NULL),
(41, 1, 2, 111, 'success', 'asd', '2021-06-13 03:43:42', NULL),
(42, 1, 2, 111, 'success', 'asd', '2021-06-13 03:45:39', NULL),
(43, 1, 2, 6000, 'success', 'jajan', '2021-06-13 03:50:38', NULL),
(44, 1, 2, 200, 'success', 'asd', '2021-06-14 09:15:17', NULL),
(45, 1, 2, 9000, 'success', 'asd', '2021-06-14 09:16:54', NULL),
(46, 1, 2, 50000, 'success', 'buat ngopi', '2021-06-14 09:18:47', NULL),
(47, 1, 2, 200, 'success', 'jajan', '2021-06-14 09:19:00', NULL),
(48, 1, 2, 1000, 'success', 'jajan', '2021-06-14 09:19:05', NULL),
(49, 1, 2, 2600, 'success', 'jajan', '2021-06-14 09:19:11', NULL),
(50, 1, 2, 900, 'success', 'jajan', '2021-06-14 09:19:16', NULL),
(51, 1, 2, 1000, 'success', 'jajan', '2021-06-14 09:32:11', NULL),
(52, 5, 1, 200000, 'success', 'asdasd', '2021-06-14 14:53:37', NULL),
(53, 5, 1, 1111, 'success', 'asasd', '2021-06-14 14:56:57', NULL),
(54, 5, 1, 22222, 'success', 'asdasd', '2021-06-14 14:57:14', NULL),
(55, 5, 1, 50000, 'success', 'asdasd', '2021-06-14 14:57:33', NULL),
(57, 1, 3, 10000, 'success', 'asdasd', '2021-06-15 06:45:22', NULL),
(58, 1, 6, 30500, 'success', 'asdasd', '2021-06-15 10:17:33', NULL),
(59, 30, 1, 4000, 'success', 'asdasd', '2021-06-15 11:22:08', NULL),
(60, 1, 2, 20, 'success', 'jajan', '2021-06-15 16:01:16', NULL),
(61, 1, 4, 20000, 'success', 'asd', '2021-06-15 16:06:59', NULL),
(62, 30, 1, 100000, 'success', 'test', '2021-06-15 23:28:14', NULL),
(63, 1, 30, 100000, 'success', 'test', '2021-06-15 23:30:28', NULL),
(64, 30, 1, 20000, 'success', 'test', '2021-06-16 02:30:08', NULL),
(65, 39, 1, 50000, 'success', 'test', '2021-06-16 04:53:29', NULL),
(66, 30, 2, 23332, 'success', 'asd', '2021-06-16 15:51:58', NULL),
(67, 42, 5, 1000000, 'success', 'beli skin legend', '2021-06-16 15:55:38', NULL),
(68, 30, 1, 200, 'success', '', '2021-07-11 17:49:14', NULL),
(69, 30, 1, 20000, 'success', '', '2021-07-13 04:58:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_verify` enum('1','0') NOT NULL DEFAULT '0',
  `user_email` varchar(250) NOT NULL,
  `user_password` varchar(250) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `user_pin` varchar(250) NOT NULL,
  `user_balance` varchar(100) NOT NULL DEFAULT '0',
  `user_phone` varchar(100) NOT NULL,
  `user_image` varchar(250) NOT NULL,
  `user_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_verify`, `user_email`, `user_password`, `user_name`, `user_pin`, `user_balance`, `user_phone`, `user_image`, `user_created_at`, `user_updated_at`) VALUES
(1, '1', 'admin@admin.com', '$2b$10$Gc7X2i4qVejW/RsVZpBMwe42QmLJWHCeb.2ADhhrIMJUrmTzd1eJ2', 'admin123', '111111', '607345', '0812213124323', '2021-06-14T07-49-37.455ZEllipse 327.png', '2021-06-05 06:06:54', '2021-07-13 04:58:47'),
(2, '0', 'nanda@gmail.com', '$2b$10$/yWTTtQK92Li/f4ky7FxXuvPMgD2mR5heC5HU4qSDHBptHMLQptBS', 'Nanda Radefa', '', '72270', '029384927454', '', '2021-06-05 16:36:57', '2021-06-16 15:51:58'),
(3, '0', 'akdariukhra@gmail.com', '$2b$10$woUZaPKO8cPNIdxbEHbR3up/9k6FN7UpEd7zXueSRoR7993mCXAkS', 'Akdari Ukhra', '', '112750', '073994534', '2021-06-09T02-17-57.527Zpp.png', '2021-06-05 16:37:17', '2021-06-15 06:45:22'),
(4, '0', 'anty@gmail.com', '$2b$10$xZr8Ja2Cy3OVsYN1X248ZeyB2ugusx1.wsmN9OloW9dL10bMY2sP2', 'Syukrillah Frianty', '', '25000', '0837473994534', '', '2021-06-05 16:38:25', '2021-06-15 16:06:59'),
(5, '0', 'rifqiimtinan@gmail.com1', '$2b$10$vMa4p7hnnLTfkUduC0vcr.6pJDbTy1ozn9S1nYgOuGR3.oE0gyv6S', 'Rifqi ZIyad Imtinan', '111111', '1026667', '0903843243', '2021-06-08T07-44-31.665Zphoto6262768406352735192.jpg', '2021-06-05 16:39:01', '2021-06-16 15:55:38'),
(6, '0', 'yusuf@gmail.com', '$2b$10$IPplz2jLaGFpes4WKaltfOj1DjOyWM3Cp2zuj5j/I6iT./vcbyPgq', 'Yusuf Abdul Aziz', '', '30500', '', '', '2021-06-05 17:06:21', '2021-06-15 10:17:33'),
(14, '0', 'contoh@gmail.com', '$2b$10$ibG.NI8cCtztW9fHUpb/3u99niiQPqNO2EygHeiD1tWQ04uei64AK', 'contoh', '', '0', '', '', '2021-06-08 18:35:05', NULL),
(15, '0', 'contoh@gmail.com1', '$2b$10$/KhryjatBt90.Qw7JOyagOPC4fVFUxce/WIuRIe/0C8yKu1EK5iPi', 'contoh', '222222', '0', '', '', '2021-06-08 18:35:44', NULL),
(16, '0', 'rifqi@gmail.com', '$2b$10$5Xj220t17f/GougaTPSemOH9SvmtzM.cqG/k07NzrgYEAYlpphuo.', 'rifqi', '222322', '0', '', '', '2021-06-09 02:57:56', NULL),
(30, '1', 'rifqiimtinan@gmail.com', '$2b$10$0TllaQCuNG0CVKyLpb07tOKAdzGZfPSBAGBSD7o0eretvMEu/MIrq', 'Rifqi Ziyad Imtinan', '111111', '274868', '08839274324', '2021-07-13T05-03-59.496Z211121462_564713361358509_8918265241513205516_n.jpg', '2021-06-14 18:08:18', '2021-07-13 05:07:02'),
(36, '0', 'rifqiziyad@gmail.com', '$2b$10$9bFZzXWhm2LR4P/39SNME.j98kslfcB5qzVcj5.VnOaec1shHYLyG', 'Rifqi Ziyad Imtinan', '', '0', '', '', '2021-06-15 17:41:23', NULL),
(37, '0', 'rifqiimtinan@gmail.com2', '$2b$10$Buq9yZlDBW1BgbHYJMbRvOMWNPXaAAsaYlnAzgJUwL7OgzNv7wnA2', 'Rifqi', '111111', '0', '', '', '2021-06-15 17:47:43', NULL),
(41, '0', 'test@gmail.com', '$2b$10$poWKsV0HPE0ELJ6pJZzKSuJSYKV1SzI0GupeL2lAMqa9RA0qAbOoG', 'test', '', '0', '', '', '2021-06-16 05:04:27', NULL),
(42, '0', 'rifqi@rifqi.com', '$2b$10$jn8O71kdj4VLcvWkE0gtE..a1eaG7NcxAEOzPgxtTegIK86g25RAu', 'Rifqi', '111111', '1000000', '', '', '2021-06-16 15:53:44', '2021-06-16 15:55:38'),
(43, '1', 'siwis54006@godpeed.com', '$2b$10$u30zyAHjB3kmFOb1CwsEAuU6G53t2P.iodPMyz8N3NLmY/SGGCpvS', 'Anonim', '', '0', '', '', '2021-07-11 16:48:04', NULL),
(47, '1', 'xeyos18371@ovooovo.com', '$2b$10$1JPB/e6AJsNtg.xNkXVYaenvKKhYi.WCTd4V/.ORCMJ0GKMMKNMry', 'test', '111111', '0', '', '', '2021-07-12 14:24:47', NULL),
(48, '1', 'xiyac81200@godpeed.com', '$2b$10$MTLo4Warn53tobJcFtzmm..F3V8UH934L9rbm6NEdvrgTaqoDbu0e', 'tes123', '', '0', '', '', '2021-07-13 08:40:11', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `topup`
--
ALTER TABLE `topup`
  ADD PRIMARY KEY (`topup_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `topup`
--
ALTER TABLE `topup`
  MODIFY `topup_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
