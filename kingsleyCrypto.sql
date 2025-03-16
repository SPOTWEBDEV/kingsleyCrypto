-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2025 at 11:23 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jay`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `pass`, `status`) VALUES
(1, 'admin@admin', 'admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `wallet_addr` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `snapshot` varchar(100) NOT NULL,
  `method` varchar(100) NOT NULL,
  `date_deposited` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `wallet_addr`, `amount`, `snapshot`, `method`, `date_deposited`, `status`) VALUES
(1, 6, '--', '500', '--', 'USDT(Trc20)', '2025-01-21 20:30:43', 0),
(2, 6, '--', '88', '--', 'USDT(Trc20)', '2025-01-21 20:30:52', 0),
(3, 2, '--', '400', '--', 'Ethereum', '2025-01-21 20:33:07', 0),
(4, 2, '--', '400', '--', 'USDT(Trc20)', '2025-01-21 20:33:16', 0),
(5, 2, '--', '90', '--', 'USDT(Trc20)', '2025-01-21 20:52:13', 0),
(6, 6, '--', '1303', '--', 'Bank', '2025-01-25 07:32:31', 1);

-- --------------------------------------------------------


--
-- Table structure for table `investments`
--

CREATE TABLE `investments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan` varchar(255) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `profit` decimal(10,2) NOT NULL,
  `number_of_day` int(11) NOT NULL,
  `total` varchar(255) NOT NULL,
  `date_invested` varchar(100) NOT NULL,
  `date_to_mature` varchar(100) NOT NULL,
  `ends_on` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `investments`
--

INSERT INTO `investments` (`id`, `user_id`, `plan`, `amount`, `email`, `profit`, `number_of_day`, `total`, `date_invested`, `date_to_mature`, `ends_on`, `status`) VALUES
(1, 6, 'Basic Plan', '100', 'spotwebdev.com@gmail.com', '5.20', 0, '26', '2025-01-25 07:38:12', '2025-01-26 07:38:12', '2025-01-30 07:38:12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kyc`
--

CREATE TABLE `kyc` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phonenumber` varchar(255) NOT NULL,
  `datebirth` varchar(255) NOT NULL,
  `drivinglincense` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `status` enum('pending','approved','declined') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_accounts`
--

CREATE TABLE `payment_accounts` (
  `id` int(11) NOT NULL,
  `payment_type` enum('Bank','Wallet','Western Union') NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `routing_number` varchar(255) DEFAULT NULL,
  `wallet_provider` varchar(255) DEFAULT NULL,
  `wu_name` varchar(255) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_accounts`
--

INSERT INTO `payment_accounts` (`id`, `payment_type`, `bank_name`, `account_number`, `account_name`, `routing_number`, `wallet_provider`, `wu_name`, `date_added`) VALUES
(1, 'Bank', 'SPOT BANK', '224884848484', 'micheal eze', '988573', '', '', '2025-01-24 21:44:39'),
(3, 'Wallet', '', '0xxxhfnnnnnnnnnnnnnnnnrRR', '', '', 'Bitccoin', '', '2025-01-25 05:33:13'),
(6, 'Western Union', '', '9387474834', 'John Doe', '', '', NULL, '2025-01-25 06:28:32');

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `network` varchar(100) NOT NULL,
  `wallet_address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `profile_image` varchar(300) NOT NULL,
  `password` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `wallet` varchar(100) NOT NULL,
  `ref_wallet` varchar(100) NOT NULL,
  `gain_wallet` varchar(100) NOT NULL,
  `total_deposit` float NOT NULL,
  `total_withdrawal` float NOT NULL,
  `trading_commission` int(11) NOT NULL,
  `pending_investment` int(11) NOT NULL,
  `referral_balance` int(11) NOT NULL,
  `referral` int(11) NOT NULL,
  `account_warning` enum('no','yes') NOT NULL,
  `restriction` enum('no','yes') NOT NULL,
  `promo_won` varchar(100) NOT NULL,
  `ref_id` varchar(100) NOT NULL,
  `referree` varchar(100) NOT NULL,
  `date_registered` varchar(100) NOT NULL,
  `paid_ref` varchar(11) NOT NULL,
  `dn_with` int(11) NOT NULL,
  `status` varchar(11) NOT NULL,
  `kycstatus` enum('null','pending','declined','approved') NOT NULL,
  `copy_balance` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user`, `name`, `email`, `phone`, `profile_image`, `password`, `country`, `wallet`, `ref_wallet`, `gain_wallet`, `total_deposit`, `total_withdrawal`, `trading_commission`, `pending_investment`, `referral_balance`, `referral`, `account_warning`, `restriction`, `promo_won`, `ref_id`, `referree`, `date_registered`, `paid_ref`, `dn_with`, `status`, `kycstatus`, `copy_balance`) VALUES
(2, 'firstclass', 'firstclass', 'firstclass@gmail.com', '949494', '--', 'firstclass123', 'Afghanistan', '5', '0', '0', 0, 0, 0, 0, 10, 0, 'no', 'no', '', '1115504554', '', '2025-01-21 19:19:55', '0', 0, '0', 'null', '0'),
(6, 'thebest', 'thebest', 'spotwebdev.com@gmail.com', '07080879952', '--', 'thebest', 'Albania', '1203', '0', '0', 1303, 0, 0, 0, 0, 0, 'no', 'no', '', '228706318', '1115504554', '2025-01-21 19:47:40', '1', 0, '0', 'null', '0'),
(7, 'aypvkhag', 'jfjf', 'festus@gmail.com', 'fff', '1739257269.jpg', 'repented', 'Afghanistan', '200', '0', '0', 0, 0, 0, 0, 100, 0, 'no', 'no', '', '173257284', '', '2025-01-24 19:49:29', '0', 0, '0', 'null', '0');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `from_wallet` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `wallet_addr` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `date_withdrawn` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `expert`
--
ALTER TABLE `expert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `kyc`
--
ALTER TABLE `kyc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_accounts`
--
ALTER TABLE `payment_accounts`
  ADD PRIMARY KEY (`id`);


--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `investments`
--
ALTER TABLE `investments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kyc`
--
ALTER TABLE `kyc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_accounts`
--
ALTER TABLE `payment_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
