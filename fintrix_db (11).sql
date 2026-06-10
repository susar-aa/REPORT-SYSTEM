-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 10, 2026 at 07:58 PM
-- Server version: 10.11.15-MariaDB
-- PHP Version: 8.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fintrix_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `work_date` date NOT NULL,
  `status` enum('present','half_day','absent') DEFAULT 'present'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `work_date`, `status`) VALUES
(40, 4, '2026-05-06', 'present'),
(41, 5, '2026-05-06', 'present'),
(46, 4, '2026-05-07', 'present'),
(47, 5, '2026-05-07', 'present'),
(54, 7, '2026-05-08', 'present'),
(55, 5, '2026-05-08', 'present'),
(58, 7, '2026-05-09', 'present'),
(59, 5, '2026-05-09', 'present'),
(62, 7, '2026-05-11', 'present'),
(63, 5, '2026-05-11', 'present'),
(66, 7, '2026-05-12', 'present'),
(67, 5, '2026-05-12', 'present'),
(70, 7, '2026-05-13', 'present'),
(71, 5, '2026-05-13', 'present'),
(74, 7, '2026-05-14', 'present'),
(75, 5, '2026-05-14', 'present'),
(78, 7, '2026-05-15', 'present'),
(79, 5, '2026-05-15', 'present'),
(84, 8, '2026-05-16', 'present'),
(85, 5, '2026-05-16', 'present'),
(88, 7, '2026-05-18', 'present'),
(89, 5, '2026-05-18', 'present'),
(92, 7, '2026-05-19', 'present'),
(93, 5, '2026-05-19', 'present'),
(96, 8, '2026-05-22', 'present'),
(97, 5, '2026-05-22', 'present'),
(100, 8, '2026-05-23', 'present'),
(101, 5, '2026-05-23', 'present'),
(104, 7, '2026-05-25', 'present'),
(105, 5, '2026-05-25', 'present'),
(108, 7, '2026-05-26', 'present'),
(109, 5, '2026-05-26', 'present'),
(112, 7, '2026-05-27', 'present'),
(113, 5, '2026-05-27', 'present'),
(116, 7, '2026-05-28', 'present'),
(117, 5, '2026-05-28', 'present'),
(120, 7, '2026-05-29', 'present'),
(121, 5, '2026-05-29', 'present'),
(124, 7, '2026-06-02', 'present'),
(125, 5, '2026-06-02', 'present'),
(128, 7, '2026-06-03', 'present'),
(129, 5, '2026-06-03', 'present'),
(132, 7, '2026-06-04', 'present'),
(133, 5, '2026-06-04', 'present'),
(136, 7, '2026-06-05', 'present'),
(137, 5, '2026-06-05', 'present'),
(142, 7, '2026-06-08', 'present'),
(143, 5, '2026-06-08', 'present'),
(146, 7, '2026-06-09', 'present'),
(147, 5, '2026-06-09', 'present'),
(150, 7, '2026-05-20', 'present'),
(151, 7, '2026-05-21', 'present'),
(152, 7, '2026-05-30', 'present'),
(153, 7, '2026-06-01', 'present'),
(154, 7, '2026-06-06', 'present'),
(155, 7, '2026-05-22', 'absent'),
(156, 7, '2026-05-23', 'absent'),
(157, 7, '2026-05-16', 'absent'),
(158, 7, '2026-06-10', 'present'),
(159, 5, '2026-06-10', 'present');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `profit_percentage` decimal(5,2) DEFAULT 0.00,
  `main_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `profit_percentage`, `main_category_id`) VALUES
(3, 'ENERGY DRINKS', '2026-05-01 05:10:02', 10.00, 1),
(4, 'EGG RANGE', '2026-05-01 05:10:13', 18.00, 2),
(5, 'BUBBLE GUM', '2026-05-01 05:10:22', 18.00, 2),
(6, 'FRUIT JELLY / PUDDING', '2026-05-01 05:10:43', 18.00, 2),
(7, 'LOLLIPOP', '2026-05-01 05:10:51', 18.00, 2),
(8, 'BISCUITS', '2026-05-01 05:11:02', 18.00, 2),
(9, 'CAKE', '2026-05-01 05:12:15', 18.00, 2),
(10, 'TOFFEE', '2026-05-01 05:12:20', 18.00, 2),
(11, 'PEPPERMINT', '2026-05-01 05:12:41', 18.00, 2),
(12, 'WAFER CHOCOLATE', '2026-05-01 05:12:54', 18.00, 2),
(13, 'CHOCOLATE', '2026-05-01 05:13:00', 18.00, 2),
(14, 'CHIPS / POTATO BISCUITS', '2026-05-01 05:13:19', 18.00, 2),
(15, 'LOCAL CONFECTIONERY', '2026-05-01 05:13:36', 18.00, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cheques`
--

CREATE TABLE `cheques` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `bank_name` varchar(100) NOT NULL,
  `cheque_number` varchar(50) NOT NULL,
  `banking_date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `status` enum('pending','passed','returned') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `customer_id` int(11) DEFAULT NULL,
  `type` enum('incoming','outgoing') DEFAULT 'incoming',
  `supplier_id` int(11) DEFAULT NULL,
  `grn_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cheques`
--

INSERT INTO `cheques` (`id`, `order_id`, `bank_name`, `cheque_number`, `banking_date`, `amount`, `status`, `created_at`, `customer_id`, `type`, `supplier_id`, `grn_id`) VALUES
(3, NULL, 'People\'s Bank', '048010', '2026-06-06', 843340.00, 'pending', '2026-05-05 18:31:51', NULL, 'outgoing', 1, 12),
(4, NULL, 'People\'s Bank', '048011', '2026-06-01', 800000.00, 'pending', '2026-05-05 18:32:27', NULL, 'outgoing', 1, 12),
(7, 69, 'People bank', '000159', '2026-05-22', 15876.00, 'passed', '2026-05-08 10:28:26', 62, 'incoming', NULL, NULL),
(9, 116, 'NTB Bank', '208068', '2026-05-05', 1280.00, 'passed', '2026-05-14 09:50:37', 7, 'incoming', NULL, NULL),
(10, 120, 'T.M.Y.S.thennakon', '163825', '2026-06-06', 25225.00, 'pending', '2026-05-15 07:30:06', 112, 'incoming', NULL, NULL),
(15, 118, 'Commercial Bank', '855209', '2026-06-14', 34107.04, 'pending', '2026-06-03 14:41:06', NULL, 'incoming', NULL, NULL),
(16, 186, 'People bank', '000193', '2026-06-17', 7620.00, 'pending', '2026-06-04 11:02:34', 62, 'incoming', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_finances`
--

CREATE TABLE `company_finances` (
  `id` int(11) NOT NULL,
  `cash_on_hand` decimal(12,2) DEFAULT 0.00,
  `bank_balance` decimal(12,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_finances`
--

INSERT INTO `company_finances` (`id`, `cash_on_hand`, `bank_balance`) VALUES
(1, 57710.00, 82413.96);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `rep_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `whatsapp` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `owner_name`, `phone`, `address`, `latitude`, `longitude`, `rep_id`, `route_id`, `created_at`, `whatsapp`, `email`, `password`) VALUES
(7, 'DIRECT SALES', '', '', '', NULL, NULL, NULL, NULL, '2026-05-04 02:12:18', '', '', NULL),
(10, 'HIGHWAY CITY HOTEL', 'Pathum', '0769634295', '', NULL, NULL, NULL, NULL, '2026-05-05 04:06:20', '0769634295', '', NULL),
(11, 'MADUSHANI SUPER', 'Sanka', '0713521519', 'Kappitigala road. Uyandana', 7.47973000, 80.40356200, 8, 7, '2026-05-05 05:53:56', '0713521519', 'swilwalaarchchi@gmail.com', NULL),
(12, 'RATIONAL PHARMACY', 'Abesinha', '0773234610', 'Keppetigala Road, Galpoththawaththa', 7.48314900, 80.40974700, 8, 7, '2026-05-05 06:24:21', '0773234610', '', NULL),
(13, 'TI SUPER', 'Lakshan', '0775712318', 'Kappitigala road . Galpoththawaththa', 7.48335300, 80.41058600, 8, 7, '2026-05-05 06:41:03', '0702082054', 'hiranyalakshan00@gmail.com', NULL),
(14, 'GALPOTHA STORES', 'Nimal', '0372295196', 'Galpoththa', 7.48339300, 80.41068600, 8, 7, '2026-05-05 06:47:59', '0769367865', '', NULL),
(15, 'CHANDANA STORES', 'Chandana', '0721577421', 'Kappitigala, Galpoththakanda', 7.48260300, 80.41126400, 8, 7, '2026-05-05 07:04:09', '0721577421', '', NULL),
(16, 'THUSITHA STORES', 'Thusitha', '0786314579', 'Kappitigala road. Digampitiya', 7.48468000, 80.41277900, 8, 7, '2026-05-05 07:15:02', '0786314579', '', NULL),
(17, 'KITHSIRI STORES', 'Kithsiri', '0764056716', 'Meegolla', 7.49145700, 80.42296000, 8, 7, '2026-05-05 08:13:35', '0764056716', '', NULL),
(18, 'WASANA BOOK SHOP', 'Wasana', '0741501025', 'Meegolla', 7.49124100, 80.42314100, 8, 7, '2026-05-05 08:18:11', '0741501025', '', NULL),
(19, 'RANRASA FOOD', 'Herath', '0774261753', 'Meegolla', 7.49097900, 80.42326400, 8, 7, '2026-05-05 08:31:32', '0774261753', '', NULL),
(20, 'Tl', 'Karunarathana', '0777175386', 'Uyandana', 7.47678800, 80.39817600, 8, 7, '2026-05-05 09:25:21', '0777175386', '', NULL),
(22, 'ASLAM STORES', 'Aslam', '0752853941', 'Kandy road.theliyagonna', 7.47567500, 80.38730100, 8, 7, '2026-05-05 10:41:33', '0752853941', '', NULL),
(24, 'HEELA SUPER', 'Lakshan', '', 'Kappitigala road.', 7.45211800, 80.34941600, 7, 7, '2026-05-06 02:42:55', '', '', NULL),
(25, 'TI STORES', 'T.l', '', 'Kappitugala road. Digampitiya', 7.45211900, 80.34942400, 7, 7, '2026-05-06 02:47:12', '', '', NULL),
(26, 'SELLMAX SUPER', '', '', 'Uyandana ( CIC )', 7.45211900, 80.34942000, 7, 7, '2026-05-06 02:48:56', '', '', NULL),
(27, 'SAUMYA GROCERY', 'Anura', '0372228456', 'Boyagane', 7.45243600, 80.34547700, 7, 8, '2026-05-06 03:44:36', '', '', NULL),
(28, 'DOMPE SUPER', 'Sarath', '0719588211', 'Boyagene', 7.44649200, 80.34279000, 7, 8, '2026-05-06 03:59:43', '0719588211', '', NULL),
(29, 'DEWAS SUPER', 'Devinda', '0773367996', 'Boyagane', 7.44735400, 80.34947500, 7, 8, '2026-05-06 04:59:26', '0773367996', '', NULL),
(30, 'PAHANYA BOOK SHOP', 'Pahaya', '0784142886', 'Boyagene', 7.44561800, 80.34379700, 7, 8, '2026-05-06 05:34:29', '0705593501', '', NULL),
(31, 'DEEPTHI STORES', 'Deepthi', '0718602609', 'Malpitiya . Boyegene', 7.44541800, 80.34238600, 7, 8, '2026-05-06 05:53:20', '0718602609', '', NULL),
(32, 'SENEVIRATHNE STORES', 'Senevirathana', '0711641739', 'Bevillganuwe junction. Pothuhere', 7.40273900, 80.32389200, 7, 8, '2026-05-06 07:01:11', '0711641739', '', NULL),
(33, 'SAVINU HOTEL', 'Savinu', '0768288056', 'Kodella', 7.38598200, 80.31644000, 7, 8, '2026-05-06 07:34:40', '0715325890', '', NULL),
(34, 'RAKKITHA GROCERY', 'Rakkitha', '0778788975', 'Pollgahwela', 0.00000000, 0.00000000, 7, 8, '2026-05-06 08:20:31', '', '', NULL),
(35, 'NAGORIKA SUPER', 'Asha', '0763366846', 'Girahade', 7.36364300, 80.30292700, 7, 8, '2026-05-06 08:34:19', '0763366846', '', NULL),
(36, 'CENTRAL GROCERY', 'Nasinkan', '0775712318', 'Pollgahwela', 7.34675600, 80.30426500, 7, 8, '2026-05-06 08:58:00', '', '', NULL),
(37, 'GODAWELA STORES', 'Dilhani', '0763361766', 'Pollgahawela', 7.34255300, 80.30320300, 7, 8, '2026-05-06 09:52:54', '', '', NULL),
(38, 'COMPLETE STORES', 'Complete', '', 'Boyagene', 7.39049200, 80.31892000, 7, 8, '2026-05-06 10:26:14', '', '', NULL),
(39, 'UDENI STORES', 'Udeni', '', 'Wadakada road', 7.42068300, 80.32088200, 7, 8, '2026-05-06 11:00:33', '', '', NULL),
(40, 'DISSANAYAKA SUPER', 'Disanayaka', '0766364334', 'Wadakada road , pothuhera', 7.42067200, 80.32112900, 7, 8, '2026-05-06 11:17:34', '0766364334', '', NULL),
(41, 'NAWATHTHANA STORES', 'Nawaththana', '0716479940', 'No,252Wadakada road , pothuhera', 7.42064000, 80.32143000, 7, 8, '2026-05-06 11:50:48', '0741017479', '', NULL),
(42, 'ULPATHI STORES', 'Damayanthi', '0772942119', 'Ulpethe gdr, siyabalangamuwe, maspotha', 7.52428700, 80.34186300, 7, 10, '2026-05-07 05:10:16', '0772942119', '', NULL),
(43, 'SURANGA STORES', 'Suranga', '0774707479', 'Siyabalangamuwe', 7.53011100, 80.34058700, 7, 10, '2026-05-07 05:36:33', '0774707479', '', NULL),
(44, 'SMS SUPER', 'Sunethra', '0767114346', 'Pepelewele, siyabalangamuwe', 7.53989700, 80.34027100, 7, 10, '2026-05-07 05:51:55', '0767114346', '', NULL),
(45, 'AMD SUPER', 'Damsiri', '0762544560', 'Kidapola, siyabalangamuwe', 7.54629800, 80.33923800, 7, 10, '2026-05-07 06:10:31', '0762544560', '', NULL),
(46, 'JAYAKODI STORES', 'Jayakodi', '0703066660', 'Siyabalangamuwe', 7.55224900, 80.34045100, 7, 10, '2026-05-07 06:21:36', '0703066660', '', NULL),
(47, 'WIJERATHNA STORES', 'Wijarathana', '0711750032', 'Kudagalagamuwe', 7.55865600, 80.34107800, 7, 10, '2026-05-07 06:32:46', '0711750032', '', NULL),
(48, 'DUHARI GROCERY', 'Duhari', '0712626252', 'Kudagalagamuwe', 7.55916500, 80.34079400, 7, 10, '2026-05-07 06:51:55', '0712626252', '', NULL),
(49, 'GIMHANI SUPER', 'Gimhani', '0701108050', 'Eeriyagode, hanhamuna', 7.40140300, 80.32858200, 7, 10, '2026-05-07 09:05:02', '0713495510', '', NULL),
(50, 'LAKE VIEW STORES', 'Karunarathna', '', 'Puththalam road , saragama', 7.45211600, 80.34941900, 7, 10, '2026-05-07 10:28:32', '', '', NULL),
(51, 'SETH BOOK SHOP', 'Seth', '', 'Siyabalangamuwe', 7.45211300, 80.34941800, 7, 10, '2026-05-07 10:29:00', '', '', NULL),
(52, 'SAMARANAYAKA STORES', 'Samaranyaka', '0711712252', 'Dabulla road, kiriwaule', 7.51478800, 80.42050500, 7, 11, '2026-05-08 04:54:55', '0711712252', '', NULL),
(53, 'LAKMAL HOTEL', 'Lakmal', '', 'Dabulla road, ibbagamuwe', 7.53695500, 80.43923100, 7, 11, '2026-05-08 05:15:49', '', '', NULL),
(54, 'NATIONAL STORES', 'National', '', 'Thalgodepitiya, ibbagamuwe', 7.57226000, 80.46582100, 7, 11, '2026-05-08 05:43:55', '', '', NULL),
(55, 'AMS STORES', 'AMS', '0703916371', 'Ipalegama. Ibbagamuwe', 7.57227500, 80.46582200, 7, 11, '2026-05-08 05:55:29', '0766265635', '', NULL),
(56, 'BRISTO BLEND', 'Dushmantha', '0741900964', 'Ipelgema, ibbagamuwe', 7.57238300, 80.46586900, 7, 11, '2026-05-08 06:04:24', '0741900964', '', NULL),
(57, 'CB TRADERS', 'C.B.', '', 'Ilpemeda, ibbagamuwe', 7.58098100, 80.47113300, 7, 11, '2026-05-08 06:18:22', '', '', NULL),
(58, 'GUNASIRI SUPER', 'Gunesiri', '0711506363', 'Mallsiripure town', 7.64170500, 80.50883000, 7, 11, '2026-05-08 07:18:06', '0728610460', '', NULL),
(59, 'NEW SIRISARA STORES', 'Sirisara', '', 'Galewela town', 7.76248500, 80.57020700, 7, 11, '2026-05-08 09:13:39', '', '', NULL),
(60, 'SUMITH STORES', 'Sumith', '0762634694', 'Galewela road kalawewe', 7.76280600, 80.57025900, 7, 11, '2026-05-08 09:21:03', '0762634694', '', NULL),
(61, 'SINULETH STORES', 'Sinuleth', '', 'Dabegolla , galewela', 7.76015000, 80.57247600, 7, 11, '2026-05-08 09:58:52', '', '', NULL),
(62, 'SAMANALA BOOK SHOP', 'Silva', '0779730723', 'Dabegolla road , galewela', 7.76015600, 80.57247700, 7, 11, '2026-05-08 10:23:03', '0779730723', '', NULL),
(63, 'VITA KADE', 'Chanaka', '0776864653', 'Sadagala , uhumiya', 7.47904300, 80.29799500, 7, 12, '2026-05-09 04:30:32', '0776864653', '', NULL),
(64, 'LS BOOK SHOP', 'L.S', '0766503188', 'Sadegala , uhumiya', 7.48842500, 80.29652500, 7, 12, '2026-05-09 04:59:45', '0726252917', '', NULL),
(65, 'RASHMIKA STORES', 'Rashmika', '', 'Sadegala, uhumiya', 7.49339800, 80.29996300, 7, 12, '2026-05-09 05:13:57', '', '', NULL),
(66, 'SATHSARA STORES', 'Sathsara', '0717769708', 'Uhumiya', 7.45907500, 80.29317700, 7, 12, '2026-05-09 05:34:21', '0717769708', '', NULL),
(67, 'SUMANA STORES', 'Sumana', '0710710010', 'Mahapitiya road, uhumiya', 7.45817600, 80.29160800, 7, 12, '2026-05-09 05:48:28', '0710710010', '', NULL),
(68, 'SAUBAGYA STORES', 'Saubagya', '0783729829', 'Narammala town', 7.43337200, 80.21557400, 7, 12, '2026-05-09 07:02:33', '0763358988', '', NULL),
(69, 'NIMLATH COOL POT', 'Nimalth', '0758935159', 'Narammla town', 7.42785100, 80.21315400, 7, 12, '2026-05-09 07:45:18', '0758935159', '', NULL),
(70, 'RONCELY STORES', 'Roncely', '0772365863', 'Dabegolla, horombawe, kuliyapitiya road', 7.45048100, 80.18655000, 7, 12, '2026-05-09 08:44:20', '0715330384', '', NULL),
(71, 'AMITH STORES', 'Amith', '0768623726', 'Etamapola, horombawe', 7.42884300, 80.17756300, 7, 12, '2026-05-09 09:00:51', '0768623726', '', NULL),
(72, 'JANISH SUPER', 'Janish', '0717002088', 'Dabegolla , horombawe', 7.44554800, 80.18578100, 7, 12, '2026-05-09 09:13:15', '0717002088', '', NULL),
(74, 'BANDARA STORES', 'Bandra', '0766318499', 'Kuliyapitiya horombawe', 7.45337300, 80.14910200, 7, 12, '2026-05-09 09:59:52', '0466318499', '', NULL),
(75, 'SUDU PUTHA STORES', 'Sudu putha', '', 'Bihalpola, kuliyapitiya road', 7.45374300, 80.14782800, 7, 12, '2026-05-09 10:02:55', '', '', NULL),
(76, 'VEGETABLE SHOP', 'Ananda', '', 'Kuliyapitiya road horombawe', 7.46223900, 80.06399300, 7, 12, '2026-05-09 10:31:25', '', '', NULL),
(77, 'DIYABUBULA STORES', 'Dula', '0706920984', 'Kuliyapitiya road', 7.45986800, 80.12476300, 7, 12, '2026-05-09 11:11:08', '', '', NULL),
(78, 'AROGYA PHARMACY', 'Aroggya', '', 'Kuliyapitiya town', 7.43592200, 80.22131800, 7, 12, '2026-05-09 12:22:42', '', '', NULL),
(79, 'AJITH STORES', 'Ajith', '', 'Horombawe, kuliyapitiya road', 7.45211500, 80.34941900, 7, 12, '2026-05-09 13:15:37', '', '', NULL),
(80, 'SUPER MAX', 'Divika', '0773409273', 'Kandy road , 6 kanuwe', 7.44341900, 80.43119000, 7, 13, '2026-05-11 05:37:27', '0773409273', '', NULL),
(81, 'ANINDYA STORES', 'Anindiya', '0701351613', 'Baranadra road, mawathgama', 7.43497800, 80.44720000, 7, 13, '2026-05-11 05:56:13', '0701351613', '', NULL),
(82, 'NETH BOOK SHOP', 'Neth', '0776464992', 'Barandana road , thalgaspitiya', 7.45703200, 80.45105300, 7, 13, '2026-05-11 06:26:23', '0776464992', '', NULL),
(83, 'THILAKA HOTEL', 'Thilaka', '075206060', 'Kandy road, matibokka', 0.00000000, 0.00000000, 7, 13, '2026-05-11 07:50:11', '0702289129', '', NULL),
(84, 'ANAGU STORES', 'Anagi', '0755852634', 'Kandy road , matibokka', 7.38450000, 80.51976700, 7, 13, '2026-05-11 07:59:31', '0755852634', '', NULL),
(85, 'TL SUPER', 'Lakshan', '0702082054', 'Redeegama road , galpoththawaththa', 7.38412900, 80.52014100, 7, 13, '2026-05-11 08:25:07', '0702082054', '', NULL),
(86, 'ROSARI ROSARI', 'Roasari', '0722461339', 'Kandy road, galagdra', 7.37186800, 80.52539500, 7, 13, '2026-05-11 10:00:18', '0715650050', '', NULL),
(87, 'C MAX', 'Asfar', '0721222204', 'Kandy road, galagdra', 7.44813200, 80.42637900, 7, 13, '2026-05-11 11:31:17', '0721222204', '', NULL),
(88, 'Y AND Y MINI MART', 'Paradeep', '0774765220', 'Hewenpola road , abekote', 7.47911000, 80.46215900, 7, 14, '2026-05-12 06:22:37', '0774765220', '', NULL),
(89, 'JKL MANIKA', 'Manika', '', 'Hewenpola, galagdra', 7.46844500, 80.47348000, 7, 14, '2026-05-12 06:38:07', '', '', NULL),
(90, 'VEGETABLE SHOP', 'Ananda', '0762288434', 'Gonedeniya, kavisagamuwe road', 7.46720800, 80.47606200, 7, 14, '2026-05-12 06:43:50', '0762288434', '', NULL),
(91, 'SUMITH STORES', 'Sumith', '', 'Gonedeniya , kavisagamuwe road', 7.46476200, 80.47619500, 7, 14, '2026-05-12 06:52:17', '', '', NULL),
(92, 'PRADEEP STORES', 'Paradeepa', '', 'Anhandiya , kavisagamuwe road', 7.46142300, 80.47938800, 7, 14, '2026-05-12 06:59:59', '', '', NULL),
(93, 'NS SUPER', 'Irehsa', '0778463352', 'Buluwela, pussella , kavisagamuwe road', 7.49094400, 80.47191400, 7, 14, '2026-05-12 08:07:41', '0778463352', '', NULL),
(94, 'ASHINI STORES', 'Ashini', '0702009122', 'Matele road, lihiniwehera', 7.56756000, 80.51163000, 7, 14, '2026-05-12 09:36:30', '0702009122', '', NULL),
(95, 'RANIDI SUPER', 'Ranidi', '0723614428', 'Redeegama road, uyandana', 7.47640500, 80.39700300, 7, 14, '2026-05-12 11:01:34', '0723614428', '', NULL),
(96, 'IRESHA STORES', 'Irehsa', '+94 77 846 3352', 'Kavisagamuwe road, gonedeniya', 7.45213600, 80.34940800, 7, 14, '2026-05-12 12:07:02', '0448463352', '', NULL),
(98, 'PRADEEPA STORES', 'Pradeepa', '', 'Redeegama, hanhandiya', 7.45213600, 80.34941900, 7, 14, '2026-05-12 12:21:51', '', '', NULL),
(99, 'IDUNIL STORES', 'Idunil', '', 'Madagalla road,', 7.60433000, 80.43480000, 7, 15, '2026-05-13 06:03:45', '', '', NULL),
(100, 'CA SUPER', 'Anandi', '0774543780', 'Madagalla road, kubukkwewa', 7.52089300, 80.46347800, 7, 15, '2026-05-13 06:21:33', '0774543780', '', NULL),
(101, 'KAJU GEDARA', 'Damayanthi', '', 'Madagalla road, kubukgete', 7.66940500, 80.42654000, 7, 15, '2026-05-13 06:34:34', '', '', NULL),
(102, 'ICE CREAM SHOP', 'Dilshan', '0764170782', 'Madagalla road, rabe', 7.72823500, 80.42025500, 7, 15, '2026-05-13 07:25:28', '0768630456', '', NULL),
(103, 'SAIBER KADE', 'Danushka', '0782843439', 'Madagalla road, roabe handiya', 7.72762600, 80.41977900, 7, 15, '2026-05-13 07:48:19', '0482843439', '', NULL),
(104, 'SASITHMA PHARMACY', 'Sasithma', '', 'Madagalla road, pollpitbigama', 7.81595000, 80.40500600, 7, 15, '2026-05-13 09:53:50', '', '', NULL),
(105, 'GAMINI STORES', 'Gamini', '', 'Madagalla road, thambuwe', 7.77094900, 80.39292400, 7, 15, '2026-05-13 10:09:43', '', '', NULL),
(106, 'PREMASIRI STORES', 'Pramasiri', '', 'Rabe, ma eliya', 7.75503100, 80.38683600, 7, 15, '2026-05-13 10:11:50', '', '', NULL),
(107, 'AKURA SUPER', 'Nandana', '', 'Hiripitiya', 7.64680000, 80.37167800, 7, 15, '2026-05-13 10:52:17', '', '', NULL),
(108, 'C LANKA BOOK SHOP', 'Dinesha', '', 'Rabukkana, dalugala,', 7.31711100, 80.39347300, 7, 9, '2026-05-14 05:24:01', '', '', NULL),
(109, 'SENALIKA STORES', 'Senalika', '', 'Rabukkana road, mawathgama', 7.45213500, 80.34940800, 7, 9, '2026-05-14 10:24:34', '', '', NULL),
(110, 'NEW WESTERN PHARMACY', 'Lahiru', '', 'Kurunrgala mahavideeya', 7.48863900, 80.36355200, 7, 17, '2026-05-15 05:25:27', '', '', NULL),
(111, 'HATTON TEA STORES', 'Shaid', '', 'Kurunegala, mshaveddeya', 7.48930400, 80.36392900, 7, 17, '2026-05-15 06:14:12', '', '', NULL),
(112, 'NISAKMA SCHOOL COLLEGE', 'Nisakma', '', 'Nisakma , kurunegala', 7.48759300, 80.36762300, 7, 17, '2026-05-15 07:12:57', '', '', NULL),
(113, 'SUSANTHA STORES', 'Susantha', '', 'Vilbawe road , kurunegala', 7.46555400, 80.35980300, 7, 17, '2026-05-15 09:30:00', '', '', NULL),
(114, 'NIMSARA STORES', 'Nimsara', '0758617990', 'Bogamuwe road, kurunegala', 7.44550300, 80.34428800, 7, 17, '2026-05-15 10:15:43', '0758617990', '', NULL),
(115, 'TLK STORES', 'T. L. K', '', 'Kurunegala', 7.47102800, 80.35485100, 7, 17, '2026-05-15 11:11:01', '', '', NULL),
(116, 'SENADHA STORES', 'Senadha', '', 'Vilbawe road , kurunegala', 7.45213600, 80.34941100, 7, 17, '2026-05-15 11:48:13', '', '', NULL),
(117, 'PRASANNA STORES', 'Prasanna', '', 'Pannala, ibbagamuwe', 7.45213600, 80.34940600, 7, 18, '2026-05-16 14:02:37', '', '', NULL),
(118, 'SAMANMALI STORES', 'Samnmali stors', '', 'Ibbagamuwe', 7.45213600, 80.34940600, 7, 18, '2026-05-16 14:05:04', '', '', NULL),
(119, 'GUNARATHNE STORES', 'Gunerathna', '', 'Bathalagode', 7.45213500, 80.34940900, 7, 18, '2026-05-16 14:06:04', '', '', NULL),
(120, 'SHIVA STORES', 'Shiva', '', 'Delvita', 7.45213700, 80.34941100, 7, 18, '2026-05-16 14:07:19', '', '', NULL),
(121, 'GANEESHA STORES', 'Ganeesha', '', 'Delvita, redeegama road', 7.45213600, 80.34942000, 7, 18, '2026-05-16 14:08:27', '', '', NULL),
(122, 'SIRIWARDANA STORES', 'Siriwardana', '', 'Kavisagamuwe', 7.45213500, 80.34941100, 7, 18, '2026-05-16 14:09:25', '', '', NULL),
(123, 'GHB STORES', 'Silva', '', 'Udanagama, redeegama road', 7.45213900, 80.34940900, 7, 18, '2026-05-16 14:10:45', '', '', NULL),
(124, 'KALE KADE', 'Kumara', '', 'Dabulla road, badegamuwe', 7.45214700, 80.34942900, 7, 11, '2026-05-16 14:15:02', '', '', NULL),
(125, 'HIKMINI GROCERY', 'Hikmini grosari', '0714902460', 'Alauwe town', 7.30208500, 80.23824600, 7, 19, '2026-05-18 05:24:36', '0714902460', '', NULL),
(126, 'SISILA TOURIST INN', 'Sisila', '0701020817', 'Kurunegala road, abepussa', 7.24406300, 80.21297900, 7, 19, '2026-05-18 07:22:39', '0701020817', '', NULL),
(127, 'SMN GROCERY', 'S.M.N', '0773515571', 'Kandy road, wattamkulama', NULL, NULL, 7, 19, '2026-05-18 09:26:12', '0773515571', '', NULL),
(128, 'LANKA SUPER', 'Shaid', '0771820894', 'Aluwa road, abepussa', NULL, NULL, 7, 19, '2026-05-18 10:11:09', '0771820894', '', NULL),
(129, 'NIMSARA STORES', 'Nimsara', '', 'Colombo road, boyagana', 7.45213500, 80.34941600, 7, NULL, '2026-05-18 12:49:49', '', '', NULL),
(130, 'MINI MART', 'Nanda', '', 'Yanthampalwe', 7.50090100, 80.33378300, 7, 20, '2026-05-19 04:00:53', '', '', NULL),
(131, 'SADAHIRU SUPER', 'Sadahiru', '0719612861', 'Puththalam road, mahakeliya', 7.58186600, 80.28019300, 7, 20, '2026-05-19 05:01:44', '0719612861', '', NULL),
(132, 'EMAILIND HOTEL', 'Ananda', '', 'Puththalam road, mahakeliya', 7.53008800, 80.35880200, 7, 20, '2026-05-19 11:27:20', '', '', NULL),
(135, 'CHATHURYA STORES', 'Chathurya', '0789714295', 'Meeganu road, kurunegala,', 7.48812400, 80.36021600, 7, 17, '2026-05-22 06:08:09', '0789714295', '', NULL),
(136, 'CHATHURYA STORES', 'Chathurya', '', 'Meeganu road, kurunegala', 7.48814600, 80.36031700, 7, 17, '2026-05-22 06:20:17', '', '', NULL),
(137, 'DN STORES', 'Janayantha', '', 'Kurunegala road, lake round', 7.49610100, 80.35925300, 7, 17, '2026-05-22 06:41:55', '', '', NULL),
(138, 'YUMMY YARD', '', '', 'Kandy road, rajapeella', 7.48414900, 80.36547600, 7, 17, '2026-05-22 08:49:39', '', '', NULL),
(139, 'SENEVIRATHNE STORES', 'Sanevirathna', '', 'Wadakada', 7.47103500, 80.35661800, 7, 17, '2026-05-22 10:21:14', '', '', NULL),
(140, 'RAJA STORES', 'Raja', '', 'Vilbawe', 7.47464400, 80.35473300, 7, 17, '2026-05-22 11:14:35', '', '', NULL),
(141, 'RAJAPAKSHA STORES', 'Rajapksha', '', 'Malandeniya kahapthwela, Kandy road', 7.47889400, 80.35716800, 7, 21, '2026-05-23 05:24:09', '', '', NULL),
(142, 'C9 SUPER', 'Rajapksha', '0719266094', 'Kandy road, paragrahadeniya', 7.42147000, 80.46607100, 7, 21, '2026-05-23 05:38:52', '0726811325', '', NULL),
(143, 'CHATHURYA BAKERS', 'Chathura', '0784296649', 'Rabukkana road, galagdra', 7.52160700, 80.33534100, 7, 21, '2026-05-23 07:09:47', '0784296649', '', NULL),
(144, 'SENEVIRATHNA STORES', 'Senevirathana', '0775541512', 'Vidyala road, nuwela, Kandy road', 7.48124500, 80.36186500, 7, 21, '2026-05-23 11:37:13', '', '', NULL),
(145, 'WELAWITA HOTEL', 'Rohana', '0768828114', 'Dabulla road, gokarella', 7.60726100, 80.48311200, 7, 11, '2026-05-25 07:44:03', '0768828114', '', NULL),
(146, 'ARM TRADERS', 'Hamdhi', '', 'Pannala, Ibbagamuwa', 7.53687400, 80.43943000, 7, 11, '2026-05-25 10:10:32', '0762008509', '', NULL),
(147, 'UDAYA STORES', 'Udeaya', '', 'Pannala, ibbagamuwe', 7.53509000, 80.43818400, 7, 11, '2026-05-25 10:16:50', '', '', NULL),
(148, 'CAFE HANSALI', 'Hansali', '0742085513', 'Colombo road, pollgahwela', 7.33417300, 80.29890200, 7, 8, '2026-05-26 04:35:41', '0742085513', '', NULL),
(149, 'GOLDEN HOME', 'Yasidu', '', 'Aluwe road, giriulla', 7.37804800, 80.31731600, 7, 8, '2026-05-26 09:38:30', '', '', NULL),
(150, 'GOLDEN MART', 'K, Ramesh', '0777160938', 'Hiripitiya road, wellawa', 7.54923900, 80.37005000, 7, 22, '2026-05-27 04:22:26', '0777160938', '', NULL),
(151, 'MALAN STORES', 'Malan', '0765651504', 'Mathawe handiya, kohilegdra, rabukkana road', 7.41518400, 80.36565500, 7, 9, '2026-05-28 04:46:05', '0765651504', '', NULL),
(152, 'KARUNARATHNE HOTEL', 'Karunarathna', '07114489265', 'Mathawe handiya, rabukkana road', 7.41529700, 80.36554800, 7, 9, '2026-05-28 05:13:58', '0714489265', '', NULL),
(153, 'THE EURO LOUNGE RESTURANT', 'Lounge', '', 'Rabukkana road, pinnawela', 7.31530200, 80.39212000, 7, 9, '2026-05-28 10:04:24', '', '', NULL),
(154, 'RS BAKERS', 'RS', '', 'Rabukkana road pinnawela', 7.31095500, 80.38915800, 7, 9, '2026-05-28 10:24:44', '0770128891', '', NULL),
(155, 'AGR STORES', 'AGR', '', 'Mathawe road, rabukkana', 7.32766100, 80.40457200, 7, 9, '2026-05-28 11:29:17', '', '', NULL),
(157, 'PN STORES', 'PN', '', 'Rabukkana road , weligama', 7.32239500, 80.39372800, 7, 9, '2026-05-28 11:33:19', '', '', NULL),
(158, 'KARUNARATHNE STORES', 'Karunarathna', '', 'Kavisagamuwe', 7.49769200, 80.47243500, 7, 23, '2026-05-29 10:06:19', '', '', NULL),
(159, 'MINUDI HOTEL', 'Minudi', '', 'Redigama road, rambadagalla,', 7.49778800, 80.47234300, 7, 23, '2026-05-29 10:07:31', '', '', NULL),
(160, 'SK FRESH PIKE', 'S K', '', 'Madagalla road, rabe', 7.84819800, 80.39490500, 7, 15, '2026-06-02 09:30:48', '', '', NULL),
(162, 'SHANSU PHARMACY', 'Shansu', '', 'Polpithigama, madagalla', 7.84814300, 80.39506400, 7, 15, '2026-06-02 09:55:19', '', '', NULL),
(164, 'KUBUK SEVANA', '', '', 'Meegamuwe road, kalugamuwe', 7.44599100, 80.25209500, 7, 12, '2026-06-03 05:32:03', '', '', NULL),
(165, 'JANAKA BAKERS', 'Janaka', '', 'Narammala town', 7.42749900, 80.21416500, 7, 12, '2026-06-03 07:27:04', '', '', NULL),
(166, 'NIMLA HOTEL AND COOL', 'Nimla', '', 'Narammala town', 7.42779700, 80.21318700, 7, 12, '2026-06-03 07:59:20', '0758935159', '', NULL),
(167, 'RAJARATA EBULA', 'Rajarata', '0742893708', 'Sewendr, narammlaind road', 7.41856100, 80.25347500, 7, 12, '2026-06-03 09:22:31', '0742893708', '', NULL),
(168, 'WASANA CAKE', 'Wasana', '', 'Narammala town', 7.42673000, 80.24647900, 7, 12, '2026-06-03 09:54:24', '', '', NULL),
(169, 'WPS STORES', '', '', 'Dabulla road, pangolla', 7.59272700, 80.47936700, 7, 24, '2026-06-04 06:51:56', '', '', NULL),
(170, 'COMIDA RESTURANT', '', '', 'Dabulla road, pollgolla', 7.59791700, 80.48115400, 7, 24, '2026-06-04 06:53:14', '', '', NULL),
(171, 'DEEPA STORES', 'Deepa', '', 'Dabulla road, gokarella', 7.60881300, 80.48330200, 7, 24, '2026-06-04 06:55:12', '', '', NULL),
(172, 'BANDARA STORES', 'Bandara', '', 'Melsiripure town', 7.74085400, 80.55571200, 7, 24, '2026-06-04 10:57:12', '', '', NULL),
(174, 'THARUSHI SWEET HOUSE', 'Tharushi', '', 'Galewela, matele road', 7.69916100, 80.54134400, 7, 24, '2026-06-04 11:04:44', '', '', NULL),
(175, 'DESHAN FOODS', 'Deshan', '', 'Alauwe town', 7.30966900, 80.26326800, 7, 25, '2026-06-05 08:52:20', '', '', NULL),
(176, 'BLACK CHILL', '', '', 'Colombo road, thulhiriya', 7.30969600, 80.26317000, 7, 25, '2026-06-05 08:54:04', '', '', NULL),
(177, 'LAKSHU STORES', '', '', 'Colombo road udapola', 7.49002400, 80.36523600, 7, 25, '2026-06-05 11:17:23', '', '', NULL),
(178, 'CAFE AND REST', '', '', 'Colombo road, thulhiriya', 7.45214200, 80.34943400, 7, 19, '2026-06-05 11:52:22', '', '', NULL),
(179, 'Keme suthra', '', '', 'Redeegama road, karadhgolla', 7.50082300, 80.44385000, 7, 23, '2026-06-08 06:28:34', '0715899970', '', NULL),
(180, 'Kopi kade', '', '', 'Redeegama road, hunugalkadolla', 7.52087100, 80.47904000, 7, 23, '2026-06-08 09:05:36', '0763867227', '', NULL),
(181, 'Bumble bee', 'Bumble', '', 'Kavisagamuwe', 7.48833200, 80.51392400, 7, 23, '2026-06-08 11:17:20', '0719884502', '', NULL),
(182, 'Vimalasiri stros', '', '', 'Kavisagamuwe', 7.50542200, 80.45385100, 7, 23, '2026-06-08 11:22:37', '', '', NULL),
(183, 'Kumari stros', '', '', 'Karadhgolla', 7.45206900, 80.34717500, 7, 23, '2026-06-08 12:03:24', '', '', NULL),
(184, 'Dinakara brake\'s', '', '', 'Kandy road, mawathgama', NULL, NULL, 7, 21, '2026-06-09 05:15:18', '', '', NULL),
(185, 'C.9 super market', 'Charith', '', 'Kandy road, paragrahadeniya', 7.42151100, 80.46610700, 7, 21, '2026-06-09 05:32:30', '', '', NULL),
(186, 'New rich brake\'s', '', '', 'Kandy road, galagdra town', 7.37185500, 80.52632000, 7, 21, '2026-06-09 11:18:04', '', '', NULL),
(187, 'Geethanjalai ice cream shop', '', '', 'Kandy road, aledeniya', 7.38227300, 80.52107800, 7, 21, '2026-06-09 11:20:53', '', '', NULL),
(188, 'T.G . Brakes', '', '', 'Mathawe road, kohilegdra', NULL, NULL, 7, 9, '2026-06-10 10:31:01', '', '', NULL),
(189, 'Ruwan pharmacy', '', '', 'Mathawe, rabukkana road', 0.00000000, 0.00000000, 7, 9, '2026-06-10 10:32:44', '', '', NULL),
(190, 'T .G brake\'s', '', '', 'Mathawe', 0.00000000, 0.00000000, 7, 9, '2026-06-10 10:52:34', '', '', NULL),
(191, 'The yaka in you', '', '', 'Rabukkana town', 7.43820000, 80.33858200, 7, 9, '2026-06-10 11:06:25', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_payments`
--

CREATE TABLE `customer_payments` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `method` enum('Cash','Bank Transfer','Cheque','Other') NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_payments`
--

INSERT INTO `customer_payments` (`id`, `customer_id`, `assignment_id`, `amount`, `method`, `reference`, `notes`, `created_at`) VALUES
(3, 12, 14, 640.00, 'Cash', '', 'Rep Collected Payment', '2026-05-12 13:36:23'),
(7, 10, 25, 7680.00, 'Cash', '', 'Rep Collected Payment', '2026-05-26 12:01:20'),
(8, 12, 28, 320.00, 'Cash', '', 'Rep Collected Payment', '2026-05-29 13:06:45'),
(9, 95, 28, 640.00, 'Cash', '', 'Rep Collected Payment', '2026-05-29 13:07:01'),
(10, 103, 29, 2000.00, 'Cash', '', 'Rep Collected Payment', '2026-06-02 12:37:24'),
(11, 110, NULL, 34107.04, 'Cheque', 'Commercial Bank - 855209', 'Admin Recorded Payment', '2026-06-03 14:41:06'),
(12, 95, 33, 1140.00, 'Cash', '', 'Rep Collected Payment', '2026-06-08 11:48:05'),
(13, 96, 33, 3000.00, 'Cash', '', 'Rep Collected Payment', '2026-06-08 12:02:16'),
(14, 144, 34, 300.00, 'Cash', '', 'Rep Collected Payment', '2026-06-09 11:42:01'),
(15, 108, 35, 3320.00, 'Cash', '', 'Rep Collected Payment', '2026-06-10 10:34:58');

-- --------------------------------------------------------

--
-- Table structure for table `damaged_stock`
--

CREATE TABLE `damaged_stock` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock_qty` int(11) NOT NULL DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_dispatches`
--

CREATE TABLE `delivery_dispatches` (
  `id` int(11) NOT NULL,
  `dispatch_ref` varchar(50) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `vehicle_id` varchar(50) DEFAULT NULL,
  `start_meter` decimal(8,1) DEFAULT NULL,
  `end_meter` decimal(8,1) DEFAULT NULL,
  `cash_collected` decimal(12,2) DEFAULT 0.00,
  `cheque_amount` decimal(12,2) DEFAULT 0.00,
  `credit_collected` decimal(12,2) DEFAULT 0.00,
  `date` date NOT NULL DEFAULT curdate(),
  `status` enum('draft','loading','dispatched','completed') DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dispatch_collections`
--

CREATE TABLE `dispatch_collections` (
  `id` int(11) NOT NULL,
  `dispatch_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dispatch_sessions`
--

CREATE TABLE `dispatch_sessions` (
  `dispatch_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_campaigns`
--

CREATE TABLE `email_campaigns` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `status` enum('draft','sent') DEFAULT 'draft',
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `emp_code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `daily_rate` decimal(10,2) DEFAULT 0.00,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `user_id`, `emp_code`, `name`, `phone`, `designation`, `daily_rate`, `status`, `created_at`) VALUES
(4, NULL, 'EMP-001', 'Kaveen Subodha', '0761077212', 'Driver', 2200.00, 'active', '2026-05-05 03:12:48'),
(5, 7, 'EMP-002', 'Chanuka Jeewantha', '0773087935', 'Rep', 0.00, 'active', '2026-05-05 03:16:35'),
(6, 8, 'EMP-003', 'Susara Senarathne', '0761407875', 'Owner', 0.00, 'active', '2026-05-05 04:16:43'),
(7, NULL, 'EMP-004', 'Randila Kaushal', '0779133717', 'Driver', 2000.00, 'active', '2026-05-08 02:51:06'),
(8, NULL, 'EMP-005', 'Lakshitha', '0765594177', 'Driver', 2200.00, 'active', '2026-05-16 03:32:24');

-- --------------------------------------------------------

--
-- Table structure for table `finance_logs`
--

CREATE TABLE `finance_logs` (
  `id` int(11) NOT NULL,
  `type` enum('cash_in','cash_out','bank_in','bank_out','transfer') NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `finance_logs`
--

INSERT INTO `finance_logs` (`id`, `type`, `amount`, `description`, `created_by`, `created_at`) VALUES
(34, 'cash_in', 25290.00, 'Route Settlement Cash Collection - Assignment #7', 1, '2026-05-06 17:05:07'),
(35, 'cash_in', 14010.00, 'Route Settlement Cash Collection - Assignment #5', 1, '2026-05-06 17:08:05'),
(36, 'cash_in', 12640.00, 'Route Settlement Cash Collection - Assignment #9', 1, '2026-05-07 13:09:00'),
(37, 'cash_in', 8830.00, 'Route Settlement Cash Collection - Assignment #11', 1, '2026-05-08 12:54:28'),
(38, 'cash_in', 9730.00, 'Route Settlement Cash Collection - Assignment #12', 1, '2026-05-10 16:17:34'),
(39, 'cash_in', 5000.00, 'Manual Cash Adj: Donated by Mr Anuradha', 1, '2026-05-11 11:51:03'),
(40, 'transfer', 75460.00, 'Deposit to Bank: Deposit - 0001', 1, '2026-05-11 11:56:31'),
(41, 'cash_in', 3540.00, 'Route Settlement Cash Collection - Assignment #13', 1, '2026-05-11 12:42:39'),
(42, 'bank_in', 19362.00, 'Incoming Cheque Cleared: 085838 (Pan Asia Bank)', 1, '2026-05-12 09:28:54'),
(44, 'bank_in', 9358.00, 'Manual Bank Adj: Donations', 1, '2026-05-12 09:29:23'),
(45, 'cash_in', 1580.00, 'Route Settlement Cash Collection - Assignment #14', 1, '2026-05-12 16:42:38'),
(46, 'bank_in', 320.00, 'Bank Transfer - Order #114', 1, '2026-05-14 07:53:04'),
(49, 'bank_in', 1280.00, 'Incoming Cheque Cleared: 208068 (NTB Bank)', 1, '2026-05-14 08:57:05'),
(50, 'bank_in', 1280.00, 'Incoming Cheque Cleared: 208068 (NTB Bank)', 1, '2026-05-14 09:51:00'),
(51, 'cash_in', 590.00, 'Route Settlement Cash Collection - Assignment #16', 1, '2026-05-15 12:42:42'),
(52, 'cash_in', 4608.00, 'Route Settlement Cash Collection - Assignment #15', 1, '2026-05-15 12:45:27'),
(53, 'cash_in', 2280.00, 'Route Settlement Cash Collection - Assignment #18', 1, '2026-05-15 12:47:15'),
(54, 'cash_out', 350.00, 'Company Exp (Other/Miscellaneous): Vehicle Punch Repair', 1, '2026-05-15 12:56:43'),
(55, 'cash_in', 4520.00, 'Route Settlement Cash Collection - Assignment #19', 1, '2026-05-17 03:01:44'),
(56, 'cash_in', 1180.00, 'Route Settlement Cash Collection - Assignment #20', 1, '2026-05-18 12:54:01'),
(57, 'cash_in', 5000.00, 'Cash Sale - Order #140', 1, '2026-05-18 14:17:07'),
(58, 'cash_in', 590.00, 'Route Settlement Cash Collection - Assignment #21', 1, '2026-05-19 12:02:15'),
(59, 'bank_out', 2000000.00, 'Supplier Account Pay (Bank) - Supplier #1', 1, '2026-04-25 15:52:12'),
(60, 'cash_out', 5000.00, 'Company Exp (Fuel): Fuel on Medagalla Route', 1, '2026-05-21 04:40:26'),
(61, 'bank_in', 15876.00, 'Incoming Cheque Cleared: 000159 (People bank)', 1, '2026-05-21 12:03:02'),
(63, 'cash_in', 140.00, 'Route Settlement Cash Collection - Assignment #23', 1, '2026-05-24 02:25:48'),
(64, 'cash_in', 2360.00, 'Route Settlement Cash Collection - Assignment #22', 1, '2026-05-24 02:27:16'),
(65, 'bank_out', 10000.00, 'Company Exp (Fuel): Fuel from Falcon Cash', 1, '2026-05-26 04:04:53'),
(66, 'cash_in', 1020.00, 'Route Settlement Cash Collection - Assignment #24', 1, '2026-05-26 15:36:38'),
(67, 'cash_in', 10420.00, 'Route Settlement Cash Collection - Assignment #25', 1, '2026-05-26 15:40:12'),
(68, 'bank_in', 10000.00, 'Reversed Exp (Fuel): Fuel from Falcon Cash', 1, '2026-05-26 15:40:27'),
(69, 'cash_out', 5000.00, 'Company Exp (Fuel): Fuel from Falcon Cash', 1, '2026-05-26 15:40:56'),
(70, 'bank_out', 5000.00, 'Company Exp (Fuel): 3000', 1, '2026-05-28 12:17:08'),
(71, 'cash_in', 2930.00, 'Route Settlement Cash Collection - Assignment #27', 1, '2026-05-28 12:32:47'),
(72, 'cash_in', 2000.00, 'Route Settlement Cash Collection - Assignment #29', 1, '2026-06-02 12:50:44'),
(73, 'cash_in', 6970.00, 'Route Settlement Cash Collection - Assignment #30', 1, '2026-06-03 15:04:32'),
(74, 'cash_in', 1910.00, 'Route Settlement Cash Collection - Assignment #28', 1, '2026-06-04 14:12:58'),
(75, 'cash_in', 4790.00, 'Route Settlement Cash Collection - Assignment #31', 1, '2026-06-04 14:14:37'),
(76, 'cash_in', 4700.00, 'Route Settlement Cash Collection - Assignment #32', 1, '2026-06-05 12:46:18'),
(77, 'cash_in', 5930.00, 'Route Settlement Cash Collection - Assignment #33', 1, '2026-06-08 15:04:21'),
(78, 'cash_out', 750.00, 'Company Exp (Maintenance & Repairs): Vehicle Oil Refill', 1, '2026-06-08 15:04:48'),
(79, 'bank_out', 34000.00, 'Salary: Randila Kaushal (2026-05)', 1, '2026-06-09 04:57:16'),
(80, 'cash_in', 4770.00, 'Route Settlement Cash Collection - Assignment #34', 1, '2026-06-09 12:26:47');

-- --------------------------------------------------------

--
-- Table structure for table `general_expenses`
--

CREATE TABLE `general_expenses` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_method` enum('Cash','Bank') NOT NULL,
  `expense_date` date NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `general_expenses`
--

INSERT INTO `general_expenses` (`id`, `category`, `amount`, `payment_method`, `expense_date`, `reference`, `description`, `created_by`, `created_at`) VALUES
(1, 'Other/Miscellaneous', 350.00, 'Cash', '2026-05-13', '', 'Vehicle Punch Repair', 1, '2026-05-15 12:56:43'),
(2, 'Fuel', 5000.00, 'Cash', '2026-05-13', '', 'Fuel on Medagalla Route', 1, '2026-05-21 04:40:26'),
(4, 'Fuel', 5000.00, 'Cash', '2026-05-26', '', 'Fuel from Falcon Cash', 1, '2026-05-26 15:40:56'),
(5, 'Fuel', 5000.00, 'Bank', '2026-05-28', '', '3000', 1, '2026-05-28 12:17:08'),
(6, 'Maintenance & Repairs', 750.00, 'Cash', '2026-06-08', '', 'Vehicle Oil Refill', 1, '2026-06-08 15:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `grns`
--

CREATE TABLE `grns` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `po_id` int(11) DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  `subtotal` decimal(12,2) DEFAULT 0.00,
  `discount_amount` decimal(12,2) DEFAULT 0.00,
  `tax_amount` decimal(12,2) DEFAULT 0.00,
  `total_amount` decimal(12,2) NOT NULL,
  `grn_date` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `payment_method` varchar(50) DEFAULT 'Pending',
  `payment_status` enum('paid','pending','waiting') DEFAULT 'pending',
  `paid_amount` decimal(12,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grns`
--

INSERT INTO `grns` (`id`, `supplier_id`, `po_id`, `reference_no`, `reference_number`, `subtotal`, `discount_amount`, `tax_amount`, `total_amount`, `grn_date`, `created_by`, `created_at`, `payment_method`, `payment_status`, `paid_amount`) VALUES
(12, 1, NULL, '1326', NULL, 1643340.00, 0.00, 0.00, 1643340.00, '2026-04-29', 1, '2026-05-05 18:31:51', 'Bank Transfer', 'paid', 1643340.00);

-- --------------------------------------------------------

--
-- Table structure for table `grn_items`
--

CREATE TABLE `grn_items` (
  `id` int(11) NOT NULL,
  `grn_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grn_items`
--

INSERT INTO `grn_items` (`id`, `grn_id`, `product_id`, `quantity`, `unit_cost`) VALUES
(46, 12, 6, 960, 320.00),
(47, 12, 7, 480, 410.00),
(48, 12, 8, 600, 320.00),
(49, 12, 9, 600, 320.00),
(50, 12, 10, 528, 315.00),
(51, 12, 12, 10, 4272.00),
(52, 12, 13, 10, 5400.00),
(53, 12, 11, 10, 5400.00),
(54, 12, 14, 10, 4500.00),
(55, 12, 15, 10, 5350.00),
(56, 12, 16, 15, 2700.00),
(57, 12, 17, 15, 3216.00),
(58, 12, 18, 15, 3600.00),
(59, 12, 19, 15, 2340.00),
(60, 12, 22, 20, 2205.00),
(61, 12, 20, 25, 1068.00),
(62, 12, 21, 10, 3216.00),
(63, 12, 23, 50, 590.00),
(64, 12, 24, 50, 590.00);

-- --------------------------------------------------------

--
-- Table structure for table `main_categories`
--

CREATE TABLE `main_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_categories`
--

INSERT INTO `main_categories` (`id`, `name`, `created_at`) VALUES
(1, 'Beverages', '2026-05-05 14:48:01'),
(2, 'Imported Confectionery', '2026-05-05 14:48:38'),
(3, 'Local Confectionery', '2026-05-05 14:48:46');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `shipping_name` varchar(100) DEFAULT NULL,
  `shipping_phone` varchar(20) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `rep_id` int(11) DEFAULT NULL,
  `rep_session_id` int(11) DEFAULT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `dispatch_id` int(11) DEFAULT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_receipt` varchar(255) DEFAULT NULL,
  `payment_status` enum('paid','pending','waiting') DEFAULT 'pending',
  `order_status` enum('pending','processing','dispatched','delivered','cancelled') DEFAULT 'pending',
  `paid_amount` decimal(12,2) DEFAULT 0.00,
  `paid_cash` decimal(12,2) DEFAULT 0.00,
  `paid_bank` decimal(12,2) DEFAULT 0.00,
  `paid_cheque` decimal(12,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `discount_amount` decimal(12,2) DEFAULT 0.00,
  `subtotal` decimal(12,2) DEFAULT 0.00,
  `tax_amount` decimal(12,2) DEFAULT 0.00,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `shipping_name`, `shipping_phone`, `shipping_address`, `rep_id`, `rep_session_id`, `assignment_id`, `dispatch_id`, `total_amount`, `payment_method`, `payment_receipt`, `payment_status`, `order_status`, `paid_amount`, `paid_cash`, `paid_bank`, `paid_cheque`, `created_at`, `discount_amount`, `subtotal`, `tax_amount`, `latitude`, `longitude`) VALUES
(18, 11, NULL, NULL, NULL, 7, NULL, 5, NULL, 3370.00, 'Cash', NULL, 'paid', 'pending', 3370.00, 3370.00, 0.00, 0.00, '2026-05-05 19:04:25', 0.00, 3370.00, 0.00, 7.45209650, 80.34938790),
(19, 12, NULL, NULL, NULL, 7, NULL, 5, NULL, 3370.00, 'Credit', NULL, 'paid', 'pending', 3370.00, 0.00, 0.00, 0.00, '2026-05-05 19:05:19', 0.00, 3370.00, 0.00, 7.45218300, 80.34938320),
(20, 14, NULL, NULL, NULL, 7, NULL, 5, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-05 19:07:24', 0.00, 590.00, 0.00, 7.45218750, 80.34934390),
(21, 15, NULL, NULL, NULL, 7, NULL, 5, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-05 19:07:49', 0.00, 590.00, 0.00, 7.45217870, 80.34934240),
(22, 17, NULL, NULL, NULL, 7, NULL, 5, NULL, 960.00, 'Cash', NULL, 'paid', 'pending', 960.00, 960.00, 0.00, 0.00, '2026-05-05 19:09:43', 0.00, 960.00, 0.00, 7.45211100, 80.34939010),
(23, 18, NULL, NULL, NULL, 7, NULL, 5, NULL, 960.00, 'Cash', NULL, 'paid', 'pending', 960.00, 960.00, 0.00, 0.00, '2026-05-05 19:10:06', 0.00, 960.00, 0.00, 7.45217530, 80.34945390),
(24, 19, NULL, NULL, NULL, 7, NULL, 5, NULL, 960.00, 'Cash', NULL, 'paid', 'pending', 960.00, 960.00, 0.00, 0.00, '2026-05-05 19:10:51', 0.00, 960.00, 0.00, 7.45220550, 80.34940930),
(25, 95, NULL, NULL, NULL, 7, NULL, 5, NULL, 3370.00, 'Credit', NULL, 'pending', 'pending', 1780.00, 0.00, 0.00, 0.00, '2026-05-05 19:12:28', 0.00, 3370.00, 0.00, 7.45211460, 80.34942370),
(26, 22, NULL, NULL, NULL, 7, NULL, 5, NULL, 1180.00, 'Cash', NULL, 'paid', 'pending', 1180.00, 1180.00, 0.00, 0.00, '2026-05-05 19:12:59', 0.00, 1180.00, 0.00, 7.45224270, 80.34934270),
(27, 24, NULL, NULL, NULL, 7, NULL, 5, NULL, 1685.00, 'Cash', NULL, 'paid', 'pending', 1685.00, 1685.00, 0.00, 0.00, '2026-05-06 02:44:35', 0.00, 1685.00, 0.00, 7.45211740, 80.34941990),
(28, 25, NULL, NULL, NULL, 7, NULL, 5, NULL, 1600.00, 'Cash', NULL, 'paid', 'pending', 1600.00, 1600.00, 0.00, 0.00, '2026-05-06 02:52:37', 0.00, 1600.00, 0.00, 7.45212130, 80.34943980),
(29, 26, NULL, NULL, NULL, 7, NULL, 5, NULL, 2100.00, 'Cash', NULL, 'paid', 'pending', 2100.00, 2100.00, 0.00, 0.00, '2026-05-06 02:55:07', 0.00, 2100.00, 0.00, 7.45212250, 80.34943960),
(30, 27, NULL, NULL, NULL, 7, NULL, 7, NULL, 5976.00, 'Cash', NULL, 'paid', 'pending', 5976.00, 5976.00, 0.00, 0.00, '2026-05-06 03:49:54', 0.00, 5976.00, 0.00, 7.44872960, 80.34400700),
(32, 29, NULL, NULL, NULL, 7, NULL, 7, NULL, 9102.00, 'Cash', NULL, 'paid', 'pending', 9102.00, 9102.00, 0.00, 0.00, '2026-05-06 05:05:54', 0.00, 9102.00, 0.00, 7.44550370, 80.34427710),
(34, 31, NULL, NULL, NULL, 7, NULL, 7, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-06 05:53:47', 0.00, 590.00, 0.00, 7.44536140, 80.34232650),
(36, 32, NULL, NULL, NULL, 7, NULL, 7, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-06 07:02:47', 0.00, 590.00, 0.00, 7.40272830, 80.32389090),
(37, 30, NULL, NULL, NULL, 7, NULL, 7, NULL, 3600.00, 'Cash', NULL, 'paid', 'pending', 3600.00, 3600.00, 0.00, 0.00, '2026-05-06 07:04:39', 0.00, 3600.00, 0.00, 7.40160570, 80.32382000),
(38, 33, NULL, NULL, NULL, 7, NULL, 7, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-06 07:35:07', 0.00, 590.00, 0.00, 7.38598130, 80.31643970),
(39, 34, NULL, NULL, NULL, 7, NULL, 7, NULL, 1890.00, 'Cash', NULL, 'paid', 'pending', 1890.00, 1890.00, 0.00, 0.00, '2026-05-06 08:22:38', 0.00, 1890.00, 0.00, 7.36115040, 80.30678370),
(40, 35, NULL, NULL, NULL, 7, NULL, 7, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-06 08:34:47', 0.00, 590.00, 0.00, NULL, NULL),
(41, 37, NULL, NULL, NULL, 7, NULL, 7, NULL, 1180.00, 'Cash', NULL, 'paid', 'pending', 1180.00, 1180.00, 0.00, 0.00, '2026-05-06 09:54:13', 0.00, 1180.00, 0.00, 7.45211520, 80.34941850),
(42, 38, NULL, NULL, NULL, 7, NULL, 7, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-06 10:26:45', 0.00, 590.00, 0.00, 7.39187710, 80.31998590),
(43, 36, NULL, NULL, NULL, 7, NULL, 7, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-06 10:28:18', 0.00, 590.00, 0.00, 7.39589730, 80.32193790),
(44, 39, NULL, NULL, NULL, 7, NULL, 7, NULL, 1180.00, 'Cash', NULL, 'paid', 'pending', 1180.00, 1180.00, 0.00, 0.00, '2026-05-06 11:01:10', 0.00, 1180.00, 0.00, 7.42060090, 80.32103080),
(47, 41, NULL, NULL, NULL, 7, NULL, 7, NULL, 3810.00, 'Cash', NULL, 'paid', 'pending', 3810.00, 3810.00, 0.00, 0.00, '2026-05-06 11:51:36', 0.00, 3810.00, 0.00, 7.42063910, 80.32143380),
(48, 40, NULL, NULL, NULL, 7, NULL, 7, NULL, 3290.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-06 12:23:18', 0.00, 3290.00, 0.00, 7.45211520, 80.34941860),
(49, 42, NULL, NULL, NULL, 7, NULL, 9, NULL, 1068.00, 'Cash', NULL, 'paid', 'pending', 1068.00, 1068.00, 0.00, 0.00, '2026-05-07 05:10:54', 0.00, 1068.00, 0.00, 7.52430350, 80.34184080),
(50, 43, NULL, NULL, NULL, 7, NULL, 9, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-07 05:36:51', 0.00, 590.00, 0.00, 7.53082150, 80.34022200),
(51, 44, NULL, NULL, NULL, 7, NULL, 9, NULL, 2340.00, 'Cash', NULL, 'paid', 'pending', 2340.00, 2340.00, 0.00, 0.00, '2026-05-07 05:52:26', 0.00, 2340.00, 0.00, 7.53989920, 80.34026770),
(52, 45, NULL, NULL, NULL, 7, NULL, 9, NULL, 3408.00, 'Cash', NULL, 'paid', 'pending', 3408.00, 3408.00, 0.00, 0.00, '2026-05-07 06:11:15', 0.00, 3408.00, 0.00, NULL, NULL),
(53, 46, NULL, NULL, NULL, 7, NULL, 9, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-07 06:21:58', 0.00, 590.00, 0.00, 7.55224860, 80.34044920),
(54, 47, NULL, NULL, NULL, 7, NULL, 9, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-07 06:33:09', 0.00, 590.00, 0.00, 7.55919420, 80.34100110),
(55, 48, NULL, NULL, NULL, 7, NULL, 9, NULL, 950.00, 'Cash', NULL, 'paid', 'pending', 950.00, 950.00, 0.00, 0.00, '2026-05-07 06:53:26', 0.00, 950.00, 0.00, 7.55931540, 80.34098010),
(56, 49, NULL, NULL, NULL, 7, NULL, 9, NULL, 1920.00, 'Cash', NULL, 'paid', 'pending', 1920.00, 1920.00, 0.00, 0.00, '2026-05-07 09:06:55', 0.00, 1920.00, 0.00, 7.40140350, 80.32858810),
(57, 51, NULL, NULL, NULL, 7, NULL, 9, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-07 10:31:12', 0.00, 590.00, 0.00, 7.45211300, 80.34941190),
(58, 50, NULL, NULL, NULL, 7, NULL, 9, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-07 10:33:42', 0.00, 590.00, 0.00, 7.45211780, 80.34941960),
(59, 52, NULL, NULL, NULL, 7, NULL, 11, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-08 04:55:12', 0.00, 590.00, 0.00, 7.51478510, 80.42049430),
(60, 53, NULL, NULL, NULL, 7, NULL, 11, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-08 05:16:11', 0.00, 590.00, 0.00, 7.53889790, 80.44036270),
(61, 54, NULL, NULL, NULL, 7, NULL, 11, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-08 05:44:24', 0.00, 590.00, 0.00, 7.57230310, 80.46581940),
(62, 55, NULL, NULL, NULL, 7, NULL, 11, NULL, 1068.00, 'Cash', NULL, 'paid', 'pending', 1068.00, 1068.00, 0.00, 0.00, '2026-05-08 05:55:48', 0.00, 1068.00, 0.00, 7.57101380, 80.46566140),
(63, 56, NULL, NULL, NULL, 7, NULL, 11, NULL, 1270.00, 'Cash', NULL, 'paid', 'pending', 1270.00, 1270.00, 0.00, 0.00, '2026-05-08 06:05:41', 0.00, 1270.00, 0.00, 7.57237430, 80.46586590),
(64, 57, NULL, NULL, NULL, 7, NULL, 11, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-08 06:18:45', 0.00, 590.00, 0.00, 7.57858100, 80.46894220),
(65, 58, NULL, NULL, NULL, 7, NULL, 11, NULL, 2360.00, 'Cash', NULL, 'paid', 'pending', 2360.00, 2360.00, 0.00, 0.00, '2026-05-08 07:18:40', 0.00, 2360.00, 0.00, 7.64172230, 80.50889130),
(66, 59, NULL, NULL, NULL, 7, NULL, 11, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-08 09:14:35', 0.00, 590.00, 0.00, 7.76236610, 80.57016930),
(67, 60, NULL, NULL, NULL, 7, NULL, 11, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-08 09:21:21', 0.00, 590.00, 0.00, 7.76213330, 80.57003840),
(68, 61, NULL, NULL, NULL, 7, NULL, 11, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-08 09:59:17', 0.00, 590.00, 0.00, 7.76015360, 80.57248070),
(69, 62, NULL, NULL, NULL, 7, NULL, 11, NULL, 15876.96, 'Cheque', NULL, 'paid', 'pending', 15876.00, 0.00, 0.00, 15876.00, '2026-05-08 10:28:26', 0.00, 15876.96, 0.00, 7.76013180, 80.57241250),
(70, 63, NULL, NULL, NULL, 7, NULL, 12, NULL, 5292.00, 'Cash', NULL, 'paid', 'pending', 5292.00, 5292.00, 0.00, 0.00, '2026-05-09 04:30:56', 0.00, 5292.00, 0.00, 7.47833380, 80.29818790),
(71, 64, NULL, NULL, NULL, 7, NULL, 12, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-09 05:00:11', 0.00, 590.00, 0.00, 7.48842290, 80.29652390),
(72, 65, NULL, NULL, NULL, 7, NULL, 12, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-09 05:14:17', 0.00, 590.00, 0.00, 7.49053260, 80.29962520),
(73, 66, NULL, NULL, NULL, 7, NULL, 12, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-09 05:34:38', 0.00, 590.00, 0.00, 7.45970880, 80.29297220),
(74, 67, NULL, NULL, NULL, 7, NULL, 12, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-09 05:48:44', 0.00, 590.00, 0.00, 7.45817440, 80.29160590),
(75, 68, NULL, NULL, NULL, 7, NULL, 12, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-09 07:02:50', 0.00, 590.00, 0.00, 7.43337180, 80.21557640),
(76, 70, NULL, NULL, NULL, 7, NULL, 12, NULL, 945.00, 'Cash', NULL, 'paid', 'pending', 945.00, 945.00, 0.00, 0.00, '2026-05-09 08:45:00', 0.00, 945.00, 0.00, 7.45052350, 80.18636990),
(77, 71, NULL, NULL, NULL, 7, NULL, 12, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-09 09:01:06', 0.00, 590.00, 0.00, 7.42826840, 80.17690910),
(78, 72, NULL, NULL, NULL, 7, NULL, 12, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-09 09:13:46', 0.00, 590.00, 0.00, 7.44554820, 80.18576300),
(79, 69, NULL, NULL, NULL, 7, NULL, 12, NULL, 1068.00, 'Cash', NULL, 'paid', 'pending', 1068.00, 1068.00, 0.00, 0.00, '2026-05-09 09:42:30', 0.00, 1068.00, 0.00, 7.45129080, 80.17173180),
(80, 74, NULL, NULL, NULL, 7, NULL, 12, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-09 10:00:11', 0.00, 590.00, 0.00, NULL, NULL),
(81, 75, NULL, NULL, NULL, 7, NULL, 12, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-09 10:03:25', 0.00, 590.00, 0.00, 7.45485690, 80.14455260),
(82, 76, NULL, NULL, NULL, 7, NULL, 12, NULL, 1180.00, 'Cash', NULL, 'paid', 'pending', 1180.00, 1180.00, 0.00, 0.00, '2026-05-09 10:32:41', 0.00, 1180.00, 0.00, 7.45998810, 80.06243180),
(83, 77, NULL, NULL, NULL, 7, NULL, 12, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-09 11:11:39', 0.00, 590.00, 0.00, 7.45951450, 80.13066850),
(84, 78, NULL, NULL, NULL, 7, NULL, 12, NULL, 1068.00, 'Cash', NULL, 'paid', 'pending', 1068.00, 1068.00, 0.00, 0.00, '2026-05-09 12:23:41', 0.00, 1068.00, 0.00, NULL, NULL),
(85, 69, NULL, NULL, NULL, 7, NULL, 12, NULL, 2136.00, 'Cash', NULL, 'paid', 'pending', 2136.00, 2136.00, 0.00, 0.00, '2026-05-09 13:14:03', 0.00, 2136.00, 0.00, 6.97538290, 79.93011350),
(86, 79, NULL, NULL, NULL, 7, NULL, 12, NULL, 2136.00, 'Cash', NULL, 'paid', 'pending', 2136.00, 2136.00, 0.00, 0.00, '2026-05-09 13:16:08', 0.00, 2136.00, 0.00, 6.97582840, 79.92989280),
(87, 80, NULL, NULL, NULL, 7, NULL, 13, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-11 05:37:46', 0.00, 590.00, 0.00, 7.44343850, 80.43118590),
(88, 81, NULL, NULL, NULL, 7, NULL, 13, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-11 05:56:27', 0.00, 590.00, 0.00, 7.43493470, 80.44717610),
(89, 82, NULL, NULL, NULL, 7, NULL, 13, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-11 06:26:41', 0.00, 590.00, 0.00, 7.45699930, 80.45107970),
(90, 83, NULL, NULL, NULL, 7, NULL, 13, NULL, 1180.00, 'Cash', NULL, 'paid', 'pending', 1180.00, 1180.00, 0.00, 0.00, '2026-05-11 07:50:38', 0.00, 1180.00, 0.00, NULL, NULL),
(91, 85, NULL, NULL, NULL, 7, NULL, 13, NULL, 65335.62, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-11 08:36:48', 0.00, 65335.62, 0.00, NULL, NULL),
(92, 86, NULL, NULL, NULL, 7, NULL, 13, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-11 10:00:42', 0.00, 590.00, 0.00, 7.37179800, 80.52545840),
(93, 87, NULL, NULL, NULL, 7, NULL, 13, NULL, 20249.04, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-11 11:36:14', 0.00, 20249.04, 0.00, 7.46234770, 80.40265560),
(95, 89, NULL, NULL, NULL, 7, NULL, 14, NULL, 1180.00, 'Cash', NULL, 'paid', 'pending', 1180.00, 1180.00, 0.00, 0.00, '2026-05-12 06:38:31', 0.00, 1180.00, 0.00, NULL, NULL),
(96, 90, NULL, NULL, NULL, 7, NULL, 14, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-12 06:44:08', 0.00, 590.00, 0.00, NULL, NULL),
(97, 91, NULL, NULL, NULL, 7, NULL, 14, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-12 06:52:34', 0.00, 590.00, 0.00, 7.46371790, 80.47694870),
(98, 92, NULL, NULL, NULL, 7, NULL, 14, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-12 07:00:39', 0.00, 590.00, 0.00, NULL, NULL),
(99, 96, NULL, NULL, NULL, 7, NULL, 14, NULL, 10371.24, 'Cash', NULL, 'pending', 'pending', 3600.00, 600.00, 0.00, 0.00, '2026-05-12 08:10:12', 0.00, 10371.24, 0.00, 7.45213580, 80.34940770),
(100, 94, NULL, NULL, NULL, 7, NULL, 14, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-12 09:36:45', 0.00, 590.00, 0.00, 7.56763300, 80.51172220),
(103, 95, NULL, NULL, NULL, 7, NULL, 14, NULL, 1780.00, 'Cash', NULL, 'paid', 'pending', 1780.00, 1780.00, 0.00, 0.00, '2026-05-12 13:27:53', 0.00, 1780.00, 0.00, 7.45218500, 80.34965520),
(104, 99, NULL, NULL, NULL, 7, NULL, 15, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-13 06:04:00', 0.00, 590.00, 0.00, 7.60653270, 80.43385150),
(105, 100, NULL, NULL, NULL, 7, NULL, 15, NULL, 1068.00, 'Cash', NULL, 'paid', 'pending', 1068.00, 1068.00, 0.00, 0.00, '2026-05-13 06:21:49', 0.00, 1068.00, 0.00, 7.52089410, 80.46347630),
(106, 101, NULL, NULL, NULL, 7, NULL, 15, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-13 06:35:08', 0.00, 590.00, 0.00, NULL, NULL),
(107, 102, NULL, NULL, NULL, 7, NULL, 15, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-13 07:25:47', 0.00, 590.00, 0.00, 7.72828720, 80.42029240),
(108, 103, NULL, NULL, NULL, 7, NULL, 15, NULL, 25226.85, 'Credit', NULL, 'pending', 'pending', 2000.00, 0.00, 0.00, 0.00, '2026-05-13 07:58:16', 0.00, 25226.85, 0.00, NULL, NULL),
(109, 104, NULL, NULL, NULL, 7, NULL, 15, NULL, 10455.90, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-13 09:55:25', 0.00, 10455.90, 0.00, 7.82304540, 80.40561150),
(110, 105, NULL, NULL, NULL, 7, NULL, 15, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-13 10:10:20', 0.00, 590.00, 0.00, 7.76613630, 80.39152370),
(111, 106, NULL, NULL, NULL, 7, NULL, 15, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-13 10:14:03', 0.00, 590.00, 0.00, NULL, NULL),
(112, 107, NULL, NULL, NULL, 7, NULL, 15, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-13 10:52:32', 0.00, 590.00, 0.00, 7.63985730, 80.37253220),
(113, 108, NULL, NULL, NULL, 7, NULL, 16, NULL, 7832.16, 'Credit', NULL, 'pending', 'pending', 3320.00, 0.00, 0.00, 0.00, '2026-05-14 05:30:03', 0.00, 7832.16, 0.00, NULL, NULL),
(114, 7, NULL, NULL, NULL, 8, NULL, NULL, NULL, 320.00, 'Bank', NULL, 'paid', 'pending', 320.00, 0.00, 320.00, 0.00, '2026-05-14 07:53:04', 0.00, 320.00, 0.00, NULL, NULL),
(116, 7, NULL, NULL, NULL, 8, NULL, NULL, NULL, 1280.00, 'Cheque', NULL, 'paid', 'pending', 1280.00, 0.00, 0.00, 1280.00, '2026-05-14 09:50:37', 0.00, 1280.00, 0.00, NULL, NULL),
(117, 109, NULL, NULL, NULL, 7, NULL, 16, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-14 10:25:14', 0.00, 590.00, 0.00, 7.45213410, 80.34940850),
(118, 110, NULL, NULL, NULL, 7, NULL, 18, NULL, 34107.04, 'Credit', NULL, 'waiting', 'pending', 34107.04, 0.00, 0.00, 0.00, '2026-05-15 05:32:20', 0.00, 34107.04, 0.00, 7.48866980, 80.36366010),
(119, 111, NULL, NULL, NULL, 7, NULL, 18, NULL, 1180.00, 'Cash', NULL, 'paid', 'pending', 1180.00, 1180.00, 0.00, 0.00, '2026-05-15 06:14:39', 0.00, 1180.00, 0.00, 7.48927890, 80.36391990),
(120, 112, NULL, NULL, NULL, 7, NULL, 18, NULL, 25225.92, 'Cheque', NULL, 'waiting', 'pending', 25225.00, 0.00, 0.00, 25225.00, '2026-05-15 07:30:06', 0.00, 25225.92, 0.00, 7.48758920, 80.36762080),
(122, 114, NULL, NULL, NULL, 7, NULL, 18, NULL, 7879.20, 'Credit', NULL, 'pending', 'pending', 4416.00, 0.00, 0.00, 0.00, '2026-05-15 10:17:24', 0.00, 7879.20, 0.00, 7.44549850, 80.34428000),
(123, 115, NULL, NULL, NULL, 7, NULL, 18, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-15 11:11:18', 0.00, 590.00, 0.00, 7.47098210, 80.35486950),
(125, NULL, NULL, NULL, NULL, 7, NULL, 18, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-15 11:53:59', 0.00, 590.00, 0.00, 7.45214800, 80.34942850),
(126, 117, NULL, NULL, NULL, 7, NULL, 19, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-16 14:04:09', 0.00, 590.00, 0.00, 7.45213600, 80.34941000),
(127, 118, NULL, NULL, NULL, 7, NULL, 19, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-16 14:05:21', 0.00, 590.00, 0.00, 7.45213690, 80.34941790),
(128, 119, NULL, NULL, NULL, 7, NULL, 19, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-16 14:06:18', 0.00, 590.00, 0.00, 7.45213520, 80.34940730),
(129, 120, NULL, NULL, NULL, 7, NULL, 19, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-16 14:07:35', 0.00, 590.00, 0.00, 7.45213640, 80.34941160),
(130, 121, NULL, NULL, NULL, 7, NULL, 19, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-16 14:08:50', 0.00, 590.00, 0.00, 7.45213730, 80.34942550),
(131, 122, NULL, NULL, NULL, 7, NULL, 19, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-16 14:09:55', 0.00, 590.00, 0.00, 7.45214100, 80.34942380),
(132, 123, NULL, NULL, NULL, 7, NULL, 19, NULL, 960.00, 'Cash', NULL, 'paid', 'pending', 960.00, 960.00, 0.00, 0.00, '2026-05-16 14:11:24', 0.00, 960.00, 0.00, 7.45213710, 80.34940670),
(133, 124, NULL, NULL, NULL, 7, NULL, 19, NULL, 36803.92, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-16 14:18:10', 0.00, 36803.92, 0.00, 7.45213790, 80.34940740),
(134, 125, NULL, NULL, NULL, 7, NULL, 20, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-18 05:25:10', 0.00, 590.00, 0.00, 7.30208660, 80.23824590),
(135, 126, NULL, NULL, NULL, 7, NULL, 20, NULL, 12480.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-18 07:23:49', 0.00, 12480.00, 0.00, 7.24406300, 80.21297850),
(136, 127, NULL, NULL, NULL, 7, NULL, 20, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-18 09:26:31', 0.00, 590.00, 0.00, NULL, NULL),
(137, 128, NULL, NULL, NULL, 7, NULL, 20, NULL, 24516.90, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-18 10:13:48', 0.00, 24516.90, 0.00, NULL, NULL),
(140, 114, NULL, NULL, NULL, 7, NULL, NULL, NULL, 4500.00, 'Cash', NULL, 'paid', 'pending', 4500.00, 5000.00, 0.00, 0.00, '2026-05-18 14:17:07', 0.00, 4500.00, 0.00, NULL, NULL),
(141, 130, NULL, NULL, NULL, 7, NULL, 21, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-19 04:01:19', 0.00, 590.00, 0.00, 7.50220360, 80.33424130),
(143, 132, NULL, NULL, NULL, 7, NULL, 21, NULL, 7560.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-19 11:30:27', 0.00, 7560.00, 0.00, 7.51234710, 80.36366460),
(144, 135, NULL, NULL, NULL, 7, NULL, 22, NULL, 18318.36, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-22 06:19:37', 0.00, 18318.36, 0.00, 7.48819630, 80.36057300),
(145, 136, NULL, NULL, NULL, 7, NULL, 22, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-22 06:20:34', 0.00, 590.00, 0.00, 7.48815420, 80.36038010),
(146, 137, NULL, NULL, NULL, 7, NULL, 22, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-22 06:42:33', 0.00, 590.00, 0.00, 7.49482010, 80.35789420),
(147, 138, NULL, NULL, NULL, 7, NULL, 22, NULL, 15360.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-22 08:50:17', 0.00, 15360.00, 0.00, 7.48565940, 80.36577290),
(148, 139, NULL, NULL, NULL, 7, NULL, 22, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-22 10:21:35', 0.00, 590.00, 0.00, 7.46985370, 80.35707660),
(149, 140, NULL, NULL, NULL, 7, NULL, 22, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-22 11:14:59', 0.00, 590.00, 0.00, 7.47456140, 80.35482930),
(154, 10, NULL, NULL, NULL, 7, NULL, NULL, NULL, 19362.00, 'Bank', NULL, 'paid', 'pending', 19362.00, 0.00, 19362.00, 0.00, '2026-05-22 13:58:25', 0.00, 19362.00, 0.00, NULL, NULL),
(155, 10, NULL, NULL, NULL, 7, NULL, NULL, NULL, 7680.00, 'Credit', NULL, 'paid', 'pending', 7680.00, 0.00, 0.00, 0.00, '2026-05-22 13:59:03', 0.00, 7680.00, 0.00, NULL, NULL),
(156, 141, NULL, NULL, NULL, 7, NULL, 23, NULL, 590.00, 'Cash', NULL, 'paid', 'pending', 590.00, 590.00, 0.00, 0.00, '2026-05-23 05:24:25', 0.00, 590.00, 0.00, 7.47889450, 80.35716990),
(158, 143, NULL, NULL, NULL, 7, NULL, 23, NULL, 6350.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-23 07:10:37', 0.00, 6350.00, 0.00, 7.52160690, 80.33534070),
(159, 145, NULL, NULL, NULL, 7, NULL, 24, NULL, 11460.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-25 07:50:45', 0.00, 11460.00, 0.00, 7.60726070, 80.48311210),
(160, 146, NULL, NULL, NULL, 7, NULL, 24, NULL, 21534.33, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-25 10:13:18', 0.00, 21534.33, 0.00, 7.53694050, 80.43938050),
(161, 147, NULL, NULL, NULL, 7, NULL, 24, NULL, 1025.00, 'Cash', NULL, 'paid', 'pending', 1025.00, 1025.00, 0.00, 0.00, '2026-05-25 10:17:21', 0.00, 1025.00, 0.00, 7.53138030, 80.43524920),
(162, 148, NULL, NULL, NULL, 7, NULL, 25, NULL, 7650.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-26 04:37:04', 0.00, 7650.00, 0.00, 7.33452030, 80.29894970),
(163, 149, NULL, NULL, NULL, 7, NULL, 25, NULL, 2700.00, 'Cash', NULL, 'paid', 'pending', 2700.00, 2700.00, 0.00, 0.00, '2026-05-26 09:38:51', 0.00, 2700.00, 0.00, 7.37678040, 80.31930510),
(164, 150, NULL, NULL, NULL, 7, NULL, 26, NULL, 8880.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-27 04:23:09', 0.00, 8880.00, 0.00, 7.54947240, 80.37007360),
(165, 151, NULL, NULL, NULL, 7, NULL, 27, NULL, 12878.37, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-28 04:48:20', 0.00, 12878.37, 0.00, 7.41526390, 80.36573090),
(166, 152, NULL, NULL, NULL, 7, NULL, 27, NULL, 1575.00, 'Cash', NULL, 'paid', 'pending', 1575.00, 1575.00, 0.00, 0.00, '2026-05-28 05:14:24', 0.00, 1575.00, 0.00, 7.41531960, 80.36545230),
(167, 154, NULL, NULL, NULL, 7, NULL, 27, NULL, 6370.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-28 10:27:56', 0.00, 6370.00, 0.00, 7.31095210, 80.38913410),
(169, 155, NULL, NULL, NULL, 7, NULL, 27, NULL, 320.00, 'Cash', NULL, 'paid', 'pending', 320.00, 320.00, 0.00, 0.00, '2026-05-28 11:32:22', 0.00, 320.00, 0.00, 7.32327950, 80.39686990),
(170, 157, NULL, NULL, NULL, 7, NULL, 27, NULL, 945.00, 'Cash', NULL, 'paid', 'pending', 945.00, 945.00, 0.00, 0.00, '2026-05-28 11:33:48', 0.00, 945.00, 0.00, 7.32247260, 80.39074850),
(171, 158, NULL, NULL, NULL, 7, NULL, 28, NULL, 955.00, 'Cash', NULL, 'paid', 'pending', 955.00, 955.00, 0.00, 0.00, '2026-05-29 10:06:40', 0.00, 955.00, 0.00, 7.49766180, 80.47239230),
(172, 159, NULL, NULL, NULL, 7, NULL, 28, NULL, 7650.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-05-29 10:08:12', 0.00, 7650.00, 0.00, 7.49774460, 80.47232430),
(173, 160, NULL, NULL, NULL, 7, NULL, 29, NULL, 8190.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-02 09:41:47', 0.00, 8190.00, 0.00, 7.84807350, 80.39502590),
(174, 162, NULL, NULL, NULL, 7, NULL, 29, NULL, 3810.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-02 09:55:55', 0.00, 3810.00, 0.00, 7.84813760, 80.39506750),
(176, 164, NULL, NULL, NULL, 7, NULL, 30, NULL, 3150.00, 'Cash', NULL, 'paid', 'pending', 3150.00, 3150.00, 0.00, 0.00, '2026-06-03 05:32:27', 0.00, 3150.00, 0.00, 7.44599150, 80.25209450),
(177, 165, NULL, NULL, NULL, 7, NULL, 30, NULL, 3825.00, 'Cash', NULL, 'paid', 'pending', 3825.00, 3825.00, 0.00, 0.00, '2026-06-03 07:28:09', 0.00, 3825.00, 0.00, 7.42749610, 80.21416270),
(178, 69, NULL, NULL, NULL, 7, NULL, 30, NULL, 9570.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-03 08:00:48', 0.00, 9570.00, 0.00, 7.42778710, 80.21318620),
(179, 144, NULL, NULL, NULL, 7, NULL, NULL, NULL, 27664.00, 'Credit', NULL, 'pending', 'pending', 300.00, 0.00, 0.00, 0.00, '2026-06-03 08:22:52', 0.00, 27664.00, 0.00, NULL, NULL),
(180, 167, NULL, NULL, NULL, 7, NULL, 30, NULL, 24000.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-03 09:24:40', 0.00, 24000.00, 0.00, 7.41885170, 80.25335810),
(181, 168, NULL, NULL, NULL, 7, NULL, 30, NULL, 3825.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-03 09:55:10', 0.00, 3825.00, 0.00, 7.42667000, 80.24652330),
(182, 169, NULL, NULL, NULL, 7, NULL, 31, NULL, 960.00, 'Cash', NULL, 'paid', 'pending', 960.00, 960.00, 0.00, 0.00, '2026-06-04 06:52:40', 0.00, 960.00, 0.00, 7.59702240, 80.48099390),
(183, 170, NULL, NULL, NULL, 7, NULL, 31, NULL, 10110.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-04 06:54:04', 0.00, 10110.00, 0.00, 7.60612950, 80.48254240),
(184, 171, NULL, NULL, NULL, 7, NULL, 31, NULL, 3840.00, 'Cash', NULL, 'paid', 'pending', 3840.00, 3840.00, 0.00, 0.00, '2026-06-04 06:55:45', 0.00, 3840.00, 0.00, 7.58558559, 80.48815317),
(185, 172, NULL, NULL, NULL, 7, NULL, 31, NULL, 3820.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-04 10:57:59', 0.00, 3820.00, 0.00, 7.73549320, 80.55111770),
(186, 62, NULL, NULL, NULL, 7, NULL, 31, NULL, 7620.00, 'Cheque', NULL, 'paid', 'pending', 7620.00, 0.00, 0.00, 7620.00, '2026-06-04 11:02:34', 0.00, 7620.00, 0.00, 7.70267900, 80.54363270),
(187, 174, NULL, NULL, NULL, 7, NULL, 31, NULL, 33464.16, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-04 11:06:33', 0.00, 33464.16, 0.00, 7.67969840, 80.53690190),
(188, 175, NULL, NULL, NULL, 7, NULL, 32, NULL, 3780.00, 'Cash', NULL, 'paid', 'pending', 3780.00, 3780.00, 0.00, 0.00, '2026-06-05 08:53:40', 0.00, 3780.00, 0.00, 7.30965430, 80.26322790),
(189, 176, NULL, NULL, NULL, 7, NULL, 32, NULL, 945.00, 'Cash', NULL, 'paid', 'pending', 945.00, 945.00, 0.00, 0.00, '2026-06-05 08:54:21', 0.00, 945.00, 0.00, 7.30967050, 80.26327070),
(190, 102, NULL, NULL, NULL, 7, NULL, NULL, NULL, 5730.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-05 09:03:46', 0.00, 5730.00, 0.00, NULL, NULL),
(191, 177, NULL, NULL, NULL, 7, NULL, 32, NULL, 7650.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-05 11:18:00', 0.00, 7650.00, 0.00, 7.48767130, 80.36510760),
(192, 178, NULL, NULL, NULL, 7, NULL, NULL, NULL, 3810.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-05 12:51:40', 0.00, 3810.00, 0.00, NULL, NULL),
(193, 179, NULL, NULL, NULL, 7, NULL, 33, NULL, 1575.00, 'Cash', NULL, 'paid', 'pending', 1575.00, 1575.00, 0.00, 0.00, '2026-06-08 06:29:05', 0.00, 1575.00, 0.00, 7.50082360, 80.44385830),
(194, 10, NULL, NULL, NULL, 8, NULL, NULL, NULL, 23040.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-08 08:58:23', 0.00, 23040.00, 0.00, NULL, NULL),
(195, 180, NULL, NULL, NULL, 7, NULL, 33, NULL, 1275.00, 'Cash', NULL, 'paid', 'pending', 1275.00, 1275.00, 0.00, 0.00, '2026-06-08 09:06:09', 0.00, 1275.00, 0.00, NULL, NULL),
(196, 181, NULL, NULL, NULL, 7, NULL, 33, NULL, 950.00, 'Cash', NULL, 'paid', 'pending', 950.00, 950.00, 0.00, 0.00, '2026-06-08 11:17:41', 0.00, 950.00, 0.00, 7.48833340, 80.51392750),
(197, 182, NULL, NULL, NULL, 7, NULL, 33, NULL, 7620.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-08 11:23:14', 0.00, 7620.00, 0.00, 7.50218090, 80.44756950),
(198, 183, NULL, NULL, NULL, 7, NULL, 33, NULL, 1890.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-08 12:04:05', 0.00, 1890.00, 0.00, 7.45247580, 80.34869180),
(199, 184, NULL, NULL, NULL, 7, NULL, 34, NULL, 1920.00, 'Cash', NULL, 'paid', 'pending', 1920.00, 1920.00, 0.00, 0.00, '2026-06-09 05:15:41', 0.00, 1920.00, 0.00, NULL, NULL),
(200, 185, NULL, NULL, NULL, 7, NULL, 34, NULL, 7650.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-09 05:33:05', 0.00, 7650.00, 0.00, 7.42151170, 80.46610500),
(201, 186, NULL, NULL, NULL, 7, NULL, 34, NULL, 15300.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-09 11:19:02', 0.00, 15300.00, 0.00, NULL, NULL),
(202, 187, NULL, NULL, NULL, 7, NULL, 34, NULL, 2550.00, 'Cash', NULL, 'paid', 'pending', 2550.00, 2550.00, 0.00, 0.00, '2026-06-09 11:21:30', 0.00, 2550.00, 0.00, 7.38851320, 80.51862890),
(204, 189, NULL, NULL, NULL, 7, NULL, 35, NULL, 7650.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-10 10:33:28', 0.00, 7650.00, 0.00, NULL, NULL),
(205, 190, NULL, NULL, NULL, 7, NULL, 35, NULL, 3820.00, 'Cash', NULL, 'paid', 'pending', 3820.00, 3820.00, 0.00, 0.00, '2026-06-10 10:54:10', 0.00, 3820.00, 0.00, 7.41834300, 80.36172770),
(206, 191, NULL, NULL, NULL, 7, NULL, 35, NULL, 3810.00, 'Credit', NULL, 'pending', 'pending', 0.00, 0.00, 0.00, 0.00, '2026-06-10 11:07:22', 0.00, 3810.00, 0.00, 7.44343000, 80.34150260);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `cost_price` decimal(10,2) DEFAULT 0.00,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT 0.00,
  `is_foc` tinyint(1) DEFAULT 0,
  `promo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `supplier_id`, `quantity`, `cost_price`, `price`, `discount`, `is_foc`, `promo_id`) VALUES
(44, 18, 10, 1, 2, 0.00, 315.00, 0.00, 0, NULL),
(45, 18, 6, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(46, 18, 7, 1, 2, 0.00, 410.00, 0.00, 0, NULL),
(47, 18, 9, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(48, 18, 8, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(49, 19, 9, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(50, 19, 8, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(51, 19, 7, 1, 2, 0.00, 410.00, 0.00, 0, NULL),
(52, 19, 10, 1, 2, 0.00, 315.00, 0.00, 0, NULL),
(53, 19, 6, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(54, 20, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(55, 21, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(56, 22, 6, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(57, 23, 9, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(58, 24, 6, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(64, 26, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(65, 26, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(66, 27, 10, 1, 1, 0.00, 315.00, 0.00, 0, NULL),
(67, 27, 6, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(68, 27, 7, 1, 1, 0.00, 410.00, 0.00, 0, NULL),
(69, 27, 9, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(70, 27, 8, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(71, 28, 6, 1, 5, 0.00, 320.00, 0.00, 0, NULL),
(72, 29, 12, 1, 1, 0.00, 2100.00, 0.00, 0, NULL),
(73, 25, 10, 1, 2, 0.00, 315.00, 0.00, 0, NULL),
(74, 25, 6, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(75, 25, 7, 1, 2, 0.00, 410.00, 0.00, 0, NULL),
(76, 25, 9, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(77, 25, 8, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(78, 30, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(79, 30, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(80, 30, 12, 1, 1, 0.00, 2136.00, 0.00, 0, NULL),
(84, 32, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(85, 32, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(86, 32, 13, 1, 1, 0.00, 5400.00, 108.00, 0, NULL),
(88, 34, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(95, 36, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(96, 37, 18, 1, 1, 0.00, 3600.00, 0.00, 0, NULL),
(97, 38, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(98, 39, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(99, 40, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(101, 42, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(102, 43, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(103, 44, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(104, 44, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(109, 47, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(110, 47, 9, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(111, 41, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(112, 41, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(113, 48, 16, 1, 1, 0.00, 2700.00, 0.00, 0, NULL),
(114, 48, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(115, 49, 20, 1, 1, 0.00, 1068.00, 0.00, 0, NULL),
(116, 50, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(117, 51, 19, 1, 1, 0.00, 2340.00, 0.00, 0, NULL),
(118, 52, 20, 1, 1, 0.00, 1068.00, 0.00, 0, NULL),
(119, 52, 19, 1, 1, 0.00, 2340.00, 0.00, 0, NULL),
(120, 53, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(121, 54, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(122, 55, 10, 1, 2, 0.00, 315.00, 0.00, 0, NULL),
(123, 55, 6, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(124, 56, 9, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(125, 56, 8, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(126, 57, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(127, 58, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(128, 59, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(129, 60, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(130, 61, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(131, 62, 20, 1, 1, 0.00, 1068.00, 0.00, 0, NULL),
(132, 63, 10, 1, 2, 0.00, 315.00, 0.00, 0, NULL),
(133, 63, 6, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(134, 64, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(135, 65, 24, 1, 2, 0.00, 590.00, 0.00, 0, NULL),
(136, 65, 23, 1, 2, 0.00, 590.00, 0.00, 0, NULL),
(137, 66, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(138, 67, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(139, 68, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(140, 69, 20, 1, 1, 0.00, 1068.00, 32.04, 0, NULL),
(141, 69, 11, 1, 1, 0.00, 5400.00, 162.00, 0, NULL),
(142, 69, 14, 1, 1, 0.00, 4500.00, 135.00, 0, NULL),
(143, 69, 13, 1, 1, 0.00, 5400.00, 162.00, 0, NULL),
(144, 70, 13, 1, 1, 0.00, 5400.00, 108.00, 0, NULL),
(145, 71, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(146, 72, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(147, 73, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(148, 74, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(149, 75, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(150, 76, 10, 1, 3, 0.00, 315.00, 0.00, 0, NULL),
(151, 77, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(152, 78, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(153, 79, 20, 1, 1, 0.00, 1068.00, 0.00, 0, NULL),
(154, 80, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(155, 81, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(156, 82, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(157, 82, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(158, 83, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(159, 84, 20, 1, 1, 0.00, 1068.00, 0.00, 0, NULL),
(160, 85, 12, 1, 1, 0.00, 2136.00, 0.00, 0, NULL),
(161, 86, 12, 1, 1, 0.00, 2136.00, 0.00, 0, NULL),
(162, 87, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(163, 88, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(164, 89, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(165, 90, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(166, 90, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(167, 91, 10, 1, 3, 0.00, 315.00, 0.00, 0, NULL),
(168, 91, 6, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(169, 91, 7, 1, 3, 0.00, 410.00, 0.00, 0, NULL),
(170, 91, 9, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(171, 91, 8, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(172, 91, 12, 1, 2, 0.00, 4272.00, 512.64, 0, NULL),
(173, 91, 13, 1, 2, 0.00, 5242.00, 629.04, 0, NULL),
(174, 91, 19, 1, 1, 0.00, 2340.00, 140.40, 0, NULL),
(175, 91, 11, 1, 2, 0.00, 5400.00, 648.00, 0, NULL),
(176, 91, 17, 1, 2, 0.00, 3216.00, 385.92, 0, NULL),
(177, 91, 21, 1, 2, 0.00, 3216.00, 385.92, 0, NULL),
(178, 91, 18, 1, 1, 0.00, 3600.00, 216.00, 0, NULL),
(179, 91, 16, 1, 2, 0.00, 2700.00, 324.00, 0, NULL),
(180, 91, 14, 1, 1, 0.00, 4500.00, 270.00, 0, NULL),
(181, 91, 20, 1, 2, 0.00, 1068.00, 128.16, 0, NULL),
(182, 91, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(183, 91, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(184, 91, 22, 1, 1, 0.00, 2205.00, 132.30, 0, NULL),
(185, 92, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(186, 93, 10, 1, 3, 0.00, 315.00, 0.00, 0, NULL),
(187, 93, 6, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(188, 93, 9, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(189, 93, 8, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(190, 93, 12, 1, 1, 0.00, 4272.00, 128.16, 0, NULL),
(191, 93, 13, 1, 1, 0.00, 5292.00, 158.76, 0, NULL),
(192, 93, 18, 1, 1, 0.00, 3600.00, 108.00, 0, NULL),
(193, 93, 16, 1, 1, 0.00, 2700.00, 81.00, 0, NULL),
(194, 93, 20, 1, 1, 0.00, 1068.00, 32.04, 0, NULL),
(196, 95, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(197, 95, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(198, 96, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(199, 97, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(200, 98, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(203, 100, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(207, 99, 13, 1, 1, 0.00, 5292.00, 158.76, 0, NULL),
(208, 99, 11, 1, 1, 0.00, 5400.00, 162.00, 0, NULL),
(210, 103, 8, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(211, 103, 6, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(212, 103, 7, 1, 2, 0.00, 410.00, 0.00, 0, NULL),
(213, 104, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(214, 105, 20, 1, 1, 0.00, 1068.00, 0.00, 0, NULL),
(215, 106, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(216, 107, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(217, 108, 13, 1, 1, 0.00, 5292.00, 158.76, 0, NULL),
(218, 108, 16, 1, 1, 0.00, 2700.00, 81.00, 0, NULL),
(219, 108, 20, 1, 1, 0.00, 1068.00, 32.04, 0, NULL),
(220, 108, 22, 1, 1, 0.00, 2205.00, 66.15, 0, NULL),
(221, 108, 19, 1, 1, 0.00, 2340.00, 70.20, 0, NULL),
(222, 108, 7, 1, 6, 0.00, 410.00, 0.00, 0, NULL),
(223, 108, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(224, 108, 6, 1, 8, 0.00, 320.00, 0.00, 0, NULL),
(225, 108, 9, 1, 8, 0.00, 320.00, 0.00, 0, NULL),
(226, 108, 8, 1, 8, 0.00, 320.00, 0.00, 0, NULL),
(227, 109, 20, 1, 1, 0.00, 1068.00, 21.36, 0, NULL),
(228, 109, 22, 1, 1, 0.00, 2205.00, 44.10, 0, NULL),
(229, 109, 10, 1, 3, 0.00, 315.00, 0.00, 0, NULL),
(230, 109, 17, 1, 1, 0.00, 3216.00, 64.32, 0, NULL),
(231, 109, 21, 1, 1, 0.00, 3216.00, 64.32, 0, NULL),
(232, 110, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(233, 111, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(234, 112, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(235, 113, 13, 1, 1, 0.00, 5292.00, 105.84, 0, NULL),
(236, 113, 16, 1, 1, 0.00, 2700.00, 54.00, 0, NULL),
(237, 114, 6, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(240, 116, 9, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(241, 116, 8, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(242, 117, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(243, 118, 12, 1, 2, 0.00, 4272.00, 341.76, 0, NULL),
(244, 118, 18, 1, 1, 0.00, 3600.00, 144.00, 0, NULL),
(245, 118, 16, 1, 1, 0.00, 2700.00, 108.00, 0, NULL),
(246, 118, 22, 1, 1, 0.00, 2205.00, 88.20, 0, NULL),
(247, 118, 21, 1, 1, 0.00, 3216.00, 128.64, 0, NULL),
(248, 118, 20, 1, 1, 0.00, 1068.00, 42.72, 0, NULL),
(249, 118, 7, 1, 4, 0.00, 410.00, 0.00, 0, NULL),
(250, 118, 10, 1, 12, 0.00, 315.00, 0.00, 0, NULL),
(251, 118, 9, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(252, 118, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(253, 118, 6, 1, 4, 0.00, 320.00, 0.00, 0, NULL),
(254, 118, 17, 1, 1, 0.00, 3216.00, 128.64, 0, NULL),
(255, 119, 23, 1, 2, 0.00, 590.00, 0.00, 0, NULL),
(256, 120, 11, 1, 2, 0.00, 5400.00, 432.00, 0, NULL),
(257, 120, 22, 1, 1, 0.00, 2205.00, 88.20, 0, NULL),
(258, 120, 17, 1, 1, 0.00, 3216.00, 128.64, 0, NULL),
(259, 120, 21, 1, 1, 0.00, 3216.00, 128.64, 0, NULL),
(260, 120, 19, 1, 1, 0.00, 2340.00, 93.60, 0, NULL),
(261, 120, 14, 1, 1, 0.00, 4500.00, 180.00, 0, NULL),
(263, 122, 16, 1, 1, 0.00, 2700.00, 54.00, 0, NULL),
(264, 122, 20, 1, 1, 0.00, 1068.00, 21.36, 0, NULL),
(265, 122, 12, 1, 1, 0.00, 4272.00, 85.44, 0, NULL),
(266, 123, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(268, 125, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(269, 126, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(270, 127, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(271, 128, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(272, 129, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(273, 130, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(274, 131, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(275, 132, 6, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(276, 132, 9, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(277, 132, 8, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(278, 133, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(279, 133, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(280, 133, 7, 1, 6, 0.00, 410.00, 0.00, 0, NULL),
(281, 133, 9, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(282, 133, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(283, 133, 12, 1, 1, 0.00, 4272.00, 170.88, 0, NULL),
(284, 133, 11, 1, 1, 0.00, 5400.00, 216.00, 0, NULL),
(285, 133, 14, 1, 1, 0.00, 4500.00, 180.00, 0, NULL),
(286, 133, 22, 1, 1, 0.00, 2205.00, 88.20, 0, NULL),
(287, 133, 16, 1, 1, 0.00, 2700.00, 108.00, 0, NULL),
(288, 133, 21, 1, 1, 0.00, 3216.00, 128.64, 0, NULL),
(289, 133, 17, 1, 1, 0.00, 3216.00, 128.64, 0, NULL),
(290, 133, 20, 1, 1, 0.00, 1068.00, 42.72, 0, NULL),
(291, 133, 23, 1, 2, 0.00, 590.00, 0.00, 0, NULL),
(292, 134, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(293, 135, 7, 1, 12, 0.00, 410.00, 0.00, 0, NULL),
(294, 135, 10, 1, 24, 0.00, 315.00, 0.00, 0, NULL),
(295, 136, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(296, 137, 10, 1, 12, 0.00, 315.00, 0.00, 0, NULL),
(297, 137, 6, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(298, 137, 9, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(299, 137, 8, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(300, 137, 16, 1, 1, 0.00, 2700.00, 54.00, 0, NULL),
(301, 137, 22, 1, 1, 0.00, 2205.00, 44.10, 0, NULL),
(302, 137, 14, 1, 1, 0.00, 4500.00, 90.00, 0, NULL),
(303, 140, 14, 1, 1, 0.00, 4500.00, 0.00, 0, NULL),
(304, 141, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(306, 143, 10, 1, 24, 0.00, 315.00, 0.00, 0, NULL),
(307, 144, 10, 1, 5, 0.00, 315.00, 0.00, 0, NULL),
(308, 144, 6, 1, 5, 0.00, 320.00, 0.00, 0, NULL),
(309, 144, 9, 1, 5, 0.00, 320.00, 0.00, 0, NULL),
(310, 144, 8, 1, 5, 0.00, 320.00, 0.00, 0, NULL),
(311, 144, 18, 1, 1, 0.00, 3600.00, 144.00, 0, 11),
(312, 144, 20, 1, 2, 0.00, 1068.00, 85.44, 0, 11),
(313, 144, 14, 1, 1, 0.00, 4500.00, 180.00, 0, 11),
(314, 144, 22, 1, 1, 0.00, 2205.00, 88.20, 0, 11),
(315, 145, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(316, 146, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(317, 147, 6, 1, 24, 0.00, 320.00, 0.00, 0, NULL),
(318, 147, 6, NULL, 1, 0.00, 0.00, 0.00, 1, 9),
(319, 147, 9, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(320, 147, 8, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(321, 148, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(322, 149, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(346, 154, 9, 1, 8, 0.00, 320.00, 0.00, 0, NULL),
(347, 154, 8, 1, 8, 0.00, 320.00, 0.00, 0, NULL),
(348, 154, 10, 1, 8, 0.00, 315.00, 0.00, 0, NULL),
(349, 154, 6, 1, 8, 0.00, 320.00, 0.00, 0, NULL),
(350, 154, 7, 1, 8, 0.00, 410.00, 0.00, 0, NULL),
(351, 154, 13, 1, 1, 0.00, 5400.00, 108.00, 0, NULL),
(352, 154, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(353, 155, 9, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(354, 155, 8, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(355, 156, 23, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(357, 158, 10, 1, 10, 0.00, 315.00, 0.00, 0, NULL),
(358, 158, 9, 1, 5, 0.00, 320.00, 0.00, 0, NULL),
(359, 158, 8, 1, 5, 0.00, 320.00, 0.00, 0, NULL),
(360, 159, 10, 1, 12, 0.00, 315.00, 0.00, 0, NULL),
(361, 159, 9, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(362, 159, 8, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(363, 160, 10, 1, 24, 0.00, 315.00, 0.00, 0, NULL),
(364, 160, 10, NULL, 1, 0.00, 0.00, 0.00, 1, 10),
(365, 160, 6, 1, 24, 0.00, 320.00, 0.00, 0, NULL),
(366, 160, 6, NULL, 1, 0.00, 0.00, 0.00, 1, 9),
(367, 160, 22, 1, 1, 0.00, 2205.00, 66.15, 0, 11),
(368, 160, 17, 1, 1, 0.00, 3216.00, 96.48, 0, 11),
(369, 160, 20, 1, 1, 0.00, 1068.00, 32.04, 0, 11),
(370, 161, 20, 1, 1, 0.00, 1025.00, 0.00, 0, NULL),
(371, 162, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(372, 162, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(373, 162, 9, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(374, 162, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(375, 163, 16, 1, 1, 0.00, 2700.00, 0.00, 0, NULL),
(376, 164, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(377, 164, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(378, 164, 9, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(379, 164, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(380, 164, 7, 1, 3, 0.00, 410.00, 0.00, 0, NULL),
(381, 165, 10, 1, 12, 0.00, 315.00, 0.00, 0, NULL),
(382, 165, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(383, 165, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(384, 165, 17, 1, 1, 0.00, 3216.00, 96.48, 0, 11),
(385, 165, 22, 1, 1, 0.00, 2205.00, 66.15, 0, 11),
(386, 166, 10, 1, 5, 0.00, 315.00, 0.00, 0, NULL),
(387, 167, 9, 1, 4, 0.00, 320.00, 0.00, 0, NULL),
(388, 167, 8, 1, 4, 0.00, 320.00, 0.00, 0, NULL),
(389, 167, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(390, 167, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(395, 169, 6, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(396, 170, 10, 1, 3, 0.00, 315.00, 0.00, 0, NULL),
(397, 171, 10, 1, 1, 0.00, 315.00, 0.00, 0, NULL),
(398, 171, 9, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(399, 171, 8, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(400, 172, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(401, 172, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(402, 172, 9, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(403, 172, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(404, 173, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(405, 173, 6, 1, 4, 0.00, 320.00, 0.00, 0, NULL),
(406, 173, 7, 1, 6, 0.00, 410.00, 0.00, 0, NULL),
(407, 173, 9, 1, 4, 0.00, 320.00, 0.00, 0, NULL),
(408, 173, 8, 1, 4, 0.00, 320.00, 0.00, 0, NULL),
(409, 174, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(410, 174, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(411, 176, 10, 1, 10, 0.00, 315.00, 0.00, 0, NULL),
(412, 177, 10, 1, 3, 0.00, 315.00, 0.00, 0, NULL),
(413, 177, 6, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(414, 177, 9, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(415, 177, 8, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(416, 178, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(417, 178, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(418, 178, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(419, 178, 9, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(430, 179, 12, 1, 1, 0.00, 4272.00, 0.00, 0, NULL),
(431, 179, 18, 1, 1, 0.00, 3600.00, 0.00, 0, NULL),
(432, 179, 22, 1, 1, 0.00, 2205.00, 0.00, 0, NULL),
(433, 179, 21, 1, 1, 0.00, 3216.00, 0.00, 0, NULL),
(434, 179, 17, 1, 1, 0.00, 3216.00, 0.00, 0, NULL),
(435, 179, 20, 1, 1, 0.00, 1025.00, 0.00, 0, NULL),
(436, 179, 19, 1, 1, 0.00, 2340.00, 0.00, 0, NULL),
(437, 179, 16, 1, 1, 0.00, 2700.00, 0.00, 0, NULL),
(438, 179, 14, 1, 1, 0.00, 4500.00, 0.00, 0, NULL),
(439, 179, 24, 1, 1, 0.00, 590.00, 0.00, 0, NULL),
(440, 180, 10, 1, 24, 0.00, 315.00, 0.00, 0, NULL),
(441, 180, 6, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(442, 180, 7, 1, 12, 0.00, 410.00, 0.00, 0, NULL),
(443, 180, 9, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(444, 180, 8, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(445, 181, 10, 1, 3, 0.00, 315.00, 0.00, 0, NULL),
(446, 181, 6, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(447, 181, 9, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(448, 181, 8, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(449, 182, 6, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(450, 183, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(451, 183, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(452, 183, 7, 1, 6, 0.00, 410.00, 0.00, 0, NULL),
(453, 183, 9, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(454, 183, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(455, 184, 9, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(456, 184, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(457, 185, 10, 1, 4, 0.00, 315.00, 0.00, 0, NULL),
(458, 185, 9, 1, 4, 0.00, 320.00, 0.00, 0, NULL),
(459, 185, 8, 1, 4, 0.00, 320.00, 0.00, 0, NULL),
(460, 186, 10, 1, 12, 0.00, 315.00, 0.00, 0, NULL),
(461, 186, 6, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(462, 187, 10, 1, 12, 0.00, 315.00, 0.00, 0, NULL),
(463, 187, 6, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(464, 187, 9, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(465, 187, 8, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(466, 187, 11, 1, 1, 0.00, 5400.00, 216.00, 0, 11),
(467, 187, 22, 1, 1, 0.00, 2205.00, 88.20, 0, 11),
(468, 187, 18, 1, 1, 0.00, 3600.00, 144.00, 0, 11),
(469, 187, 14, 1, 1, 0.00, 4500.00, 180.00, 0, 11),
(470, 187, 17, 1, 1, 0.00, 3216.00, 128.64, 0, 11),
(471, 188, 10, 1, 12, 0.00, 315.00, 0.00, 0, NULL),
(472, 189, 10, 1, 3, 0.00, 315.00, 0.00, 0, NULL),
(473, 190, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(474, 190, 6, 1, 4, 0.00, 320.00, 0.00, 0, NULL),
(475, 190, 9, 1, 4, 0.00, 320.00, 0.00, 0, NULL),
(476, 190, 8, 1, 4, 0.00, 320.00, 0.00, 0, NULL),
(477, 191, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(478, 191, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(479, 191, 9, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(480, 191, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(481, 192, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(482, 192, 6, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(483, 192, 9, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(484, 192, 8, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(485, 193, 10, 1, 5, 0.00, 315.00, 0.00, 0, NULL),
(486, 194, 9, 1, 24, 0.00, 320.00, 0.00, 0, NULL),
(487, 194, 8, 1, 24, 0.00, 320.00, 0.00, 0, NULL),
(488, 194, 6, 1, 24, 0.00, 320.00, 0.00, 0, NULL),
(489, 194, 6, NULL, 1, 0.00, 0.00, 0.00, 1, 9),
(490, 195, 10, 1, 1, 0.00, 315.00, 0.00, 0, NULL),
(491, 195, 6, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(492, 195, 9, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(493, 195, 8, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(494, 196, 10, 1, 2, 0.00, 315.00, 0.00, 0, NULL),
(495, 196, 6, 1, 1, 0.00, 320.00, 0.00, 0, NULL),
(496, 197, 10, 1, 12, 0.00, 315.00, 0.00, 0, NULL),
(497, 197, 9, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(498, 197, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(499, 198, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(500, 199, 9, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(501, 199, 8, 1, 3, 0.00, 320.00, 0.00, 0, NULL),
(502, 200, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(503, 200, 9, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(504, 200, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(505, 200, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(506, 201, 10, 1, 12, 0.00, 315.00, 0.00, 0, NULL),
(507, 201, 6, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(508, 201, 9, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(509, 201, 8, 1, 12, 0.00, 320.00, 0.00, 0, NULL),
(510, 202, 10, 1, 2, 0.00, 315.00, 0.00, 0, NULL),
(511, 202, 6, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(512, 202, 9, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(513, 202, 8, 1, 2, 0.00, 320.00, 0.00, 0, NULL),
(517, 204, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(518, 204, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(519, 204, 9, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(520, 204, 8, 1, 6, 0.00, 320.00, 0.00, 0, NULL),
(521, 205, 10, 1, 4, 0.00, 315.00, 0.00, 0, NULL),
(522, 205, 9, 1, 4, 0.00, 320.00, 0.00, 0, NULL),
(523, 205, 8, 1, 4, 0.00, 320.00, 0.00, 0, NULL),
(524, 206, 10, 1, 6, 0.00, 315.00, 0.00, 0, NULL),
(525, 206, 6, 1, 6, 0.00, 320.00, 0.00, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `month` varchar(7) NOT NULL,
  `days_worked` decimal(5,1) DEFAULT 0.0,
  `basic_pay` decimal(10,2) DEFAULT 0.00,
  `bonus` decimal(10,2) DEFAULT 0.00,
  `deduction` decimal(10,2) DEFAULT 0.00,
  `net_pay` decimal(10,2) DEFAULT 0.00,
  `payment_method` varchar(50) DEFAULT 'Cash',
  `status` enum('pending','paid') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`id`, `employee_id`, `month`, `days_worked`, `basic_pay`, `bonus`, `deduction`, `net_pay`, `payment_method`, `status`, `created_at`) VALUES
(4, 4, '2026-05', 2.0, 4400.00, 0.00, 0.00, 4400.00, 'Cash', 'pending', '2026-05-06 17:17:11'),
(5, 5, '2026-05', 19.0, 0.00, 0.00, 0.00, 0.00, 'Cash', 'pending', '2026-05-06 17:17:11'),
(6, 6, '2026-05', 0.0, 0.00, 0.00, 0.00, 0.00, 'Cash', 'pending', '2026-05-06 17:17:11'),
(13, 7, '2026-05', 17.0, 34000.00, 0.00, 0.00, 34000.00, 'Bank Transfer', 'paid', '2026-05-10 17:27:33'),
(22, 8, '2026-05', 3.0, 6600.00, 0.00, 0.00, 6600.00, 'Cash', 'pending', '2026-06-09 04:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `status` enum('available','unavailable') DEFAULT 'available',
  `supplier_id` int(11) DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT 0.00,
  `cost_price` decimal(10,2) DEFAULT 0.00,
  `stock` int(11) DEFAULT 0,
  `mrp` decimal(10,2) DEFAULT 0.00,
  `pcs_per_pack` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `created_at`, `status`, `supplier_id`, `sku`, `selling_price`, `cost_price`, `stock`, `mrp`, `pcs_per_pack`) VALUES
(6, 'Roar Energy', 3, '2026-05-02 15:58:31', 'available', 1, 'EDR', 320.00, 0.00, 567, 350.00, 1),
(7, 'Bocca Energy', 3, '2026-05-02 15:59:43', 'available', 1, 'EDB', 410.00, 0.00, 246, 450.00, 1),
(8, 'Beauty Collagen Male', 3, '2026-05-02 16:00:36', 'available', 1, 'EDBCM', 320.00, 0.00, 217, 350.01, 1),
(9, 'Beauty Collagen Female', 3, '2026-05-02 16:01:32', 'available', 1, 'EDBCF', 320.00, 0.00, 225, 350.00, 1),
(10, 'I Power Energy', 3, '2026-05-02 16:02:12', 'available', 1, 'EDIP', 315.00, 0.00, 27, 345.00, 1),
(11, 'Stand Lollipop 60pcs', 7, '2026-05-02 16:03:49', 'available', 1, 'LSL', 5400.00, 0.00, 0, 6000.00, 60),
(12, 'King Egg 24pcs', 4, '2026-05-02 16:05:57', 'available', 1, 'ERKE24', 4272.00, 0.00, 1, 4800.00, 24),
(13, 'Owl Egg 60pcs', 4, '2026-05-02 16:07:27', 'available', 1, 'EROE60', 5400.00, 0.00, 0, 6000.00, 60),
(14, 'Creamy Lollipop 100pcs', 7, '2026-05-02 16:08:31', 'available', 1, 'LCL100', 4500.00, 0.00, 0, 5000.00, 100),
(15, 'Hop Pop Lollipop 50pcs', 7, '2026-05-02 16:10:44', 'available', 1, 'LHPL50', 5350.00, 0.00, 0, 6000.00, 50),
(16, 'Super Beans Chocolate 100pcs', 13, '2026-05-02 16:12:18', 'available', 1, 'CSBC100', 2700.00, 0.00, 0, 3000.00, 100),
(17, 'Chocopik Crispy Wafer 24pcs', 12, '2026-05-02 16:17:03', 'available', 1, 'WCCW24', 3216.00, 0.00, 1, 3600.00, 1),
(18, 'Candy Rush 200pcs', 10, '2026-05-02 16:18:34', 'available', 1, 'TCR200', 3600.00, 0.00, 0, 4000.00, 200),
(19, 'Lemon Bubble Gum', 5, '2026-05-02 16:20:24', 'available', 1, 'BGLBG130', 2340.00, 0.00, 0, 2600.00, 130),
(20, 'Happy Finger Wafer Sticks 12pcs', 12, '2026-05-02 16:21:32', 'available', 1, 'WCHFWS12', 1068.00, 0.00, 0, 1200.00, 12),
(21, 'Pochinki Wafer Chocolate', 12, '2026-05-02 16:22:40', 'available', 1, 'WCPWC24', 3216.00, 0.00, 0, 3600.00, 24),
(22, 'Classic Dino Chocolate 35pcs', 13, '2026-05-02 16:24:41', 'available', 1, 'CCDC35', 2205.00, 0.00, 0, 2450.00, 35),
(23, 'Murukku Small 75pcs', 15, '2026-05-02 16:25:54', 'available', 1, 'LCMS75', 590.00, 0.00, 1, 750.00, 75),
(24, 'Milk Toffee 75pcs', 15, '2026-05-02 16:26:25', 'available', 1, 'LCMT75', 590.00, 0.00, 0, 750.00, 75);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `is_thumbnail` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`, `created_at`, `is_thumbnail`) VALUES
(7, 6, '1777737508_69f61f244c2c8.jpg', '2026-05-02 15:58:31', 0),
(8, 7, '1777737581_69f61f6dc46f2.jpg', '2026-05-02 15:59:43', 0),
(9, 8, '1777737633_69f61fa1f0a40.jpg', '2026-05-02 16:00:36', 0),
(10, 9, '1777737688_69f61fd8eee66.jpg', '2026-05-02 16:01:32', 0),
(11, 10, '1777737730_69f62002e6318.jpg', '2026-05-02 16:02:12', 0),
(12, 11, '1777737770_69f6202a369ef.jpg', '2026-05-02 16:03:49', 0),
(13, 12, '1777737843_69f620731aa9f.jpg', '2026-05-02 16:05:57', 0),
(14, 13, '1777738046_69f6213e09a49.jpg', '2026-05-02 16:07:27', 0),
(15, 14, '1777738110_69f6217e9f42a.jpg', '2026-05-02 16:08:31', 0),
(16, 15, '1777738239_69f621ff17fbe.jpg', '2026-05-02 16:10:44', 0),
(17, 16, '1777738358_69f62276322dc.jpg', '2026-05-02 16:12:41', 0),
(18, 17, '1777738621_69f6237d9c357.jpg', '2026-05-02 16:17:03', 0),
(19, 18, '1777738713_69f623d9c30dd.jpg', '2026-05-02 16:18:34', 0),
(20, 19, '1777738823_69f6244746e27.jpg', '2026-05-02 16:20:24', 0),
(21, 20, '1777738891_69f6248b9b687.jpg', '2026-05-02 16:21:32', 0),
(22, 21, '1777738956_69f624cc89143.jpg', '2026-05-02 16:22:40', 0),
(23, 22, '1777739079_69f6254722bde.jpg', '2026-05-02 16:24:41', 0),
(24, 23, '1777739152_69f6259054c64.jpg', '2026-05-02 16:25:54', 0),
(26, 22, '1778575993_6a02ea79f316e.png', '2026-05-12 08:53:18', 1),
(27, 21, '1778576032_6a02eaa00c83e.png', '2026-05-12 08:53:53', 1),
(28, 20, '1778576043_6a02eaab0b5b2.png', '2026-05-12 08:54:04', 1),
(29, 19, '1778576053_6a02eab569b4f.png', '2026-05-12 08:54:15', 1),
(30, 18, '1778576062_6a02eabe235ae.png', '2026-05-12 08:54:26', 1),
(31, 17, '1778576076_6a02eaccc0dd2.png', '2026-05-12 08:54:39', 1),
(32, 15, '1778576095_6a02eadf26bf8.png', '2026-05-12 08:54:56', 1),
(33, 14, '1778576105_6a02eae9d579e.png', '2026-05-12 08:55:07', 1),
(34, 13, '1778576116_6a02eaf4ebac3.png', '2026-05-12 08:55:18', 1),
(35, 12, '1778576127_6a02eaff84688.png', '2026-05-12 08:55:28', 1),
(36, 6, '1778576144_6a02eb10dc8d0.png', '2026-05-12 08:55:46', 1),
(37, 7, '1778576163_6a02eb2374b46.png', '2026-05-12 08:56:05', 1),
(38, 8, '1778576172_6a02eb2c8e0e4.png', '2026-05-12 08:56:14', 1),
(39, 9, '1778576184_6a02eb38d2bd0.png', '2026-05-12 08:56:26', 1),
(40, 10, '1778576194_6a02eb420e715.png', '2026-05-12 08:56:35', 1),
(41, 11, '1778576294_6a02eba689edb.png', '2026-05-12 08:58:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_suppliers`
--

CREATE TABLE `product_suppliers` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `promo_type` enum('percentage','foc') NOT NULL,
  `target_main_category_id` int(11) DEFAULT NULL,
  `target_category_id` int(11) DEFAULT NULL,
  `target_product_id` int(11) DEFAULT NULL,
  `tiers_config` text DEFAULT NULL,
  `min_amount` decimal(12,2) DEFAULT 0.00,
  `discount_percent` decimal(5,2) DEFAULT 0.00,
  `min_qty` int(11) DEFAULT 0,
  `free_product_id` int(11) DEFAULT NULL,
  `free_qty` int(11) DEFAULT 0,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `name`, `promo_type`, `target_main_category_id`, `target_category_id`, `target_product_id`, `tiers_config`, `min_amount`, `discount_percent`, `min_qty`, `free_product_id`, `free_qty`, `status`, `created_at`) VALUES
(9, 'Roar Free Issue', 'foc', NULL, NULL, 6, '[{\"min_qty\":24,\"free_qty\":1,\"free_product_id\":6},{\"min_qty\":48,\"free_qty\":2,\"free_product_id\":6},{\"min_qty\":72,\"free_qty\":3,\"free_product_id\":6}]', 0.00, 0.00, 0, NULL, 0, 'active', '2026-05-22 03:53:59'),
(10, 'I Power Free Issue', 'foc', NULL, NULL, 10, '[{\"min_qty\":24,\"free_qty\":1,\"free_product_id\":10},{\"min_qty\":48,\"free_qty\":2,\"free_product_id\":10}]', 0.00, 0.00, 0, NULL, 0, 'active', '2026-05-22 03:54:42'),
(11, 'Imported Confectionery Discount', 'percentage', 2, NULL, NULL, '[{\"min_amount\":5000,\"discount_percent\":3},{\"min_amount\":10000,\"discount_percent\":4},{\"min_amount\":20000,\"discount_percent\":6},{\"min_amount\":30000,\"discount_percent\":10}]', 0.00, 0.00, 0, NULL, 0, 'active', '2026-05-22 03:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `po_date` date DEFAULT NULL,
  `po_number` varchar(100) NOT NULL,
  `expected_date` date NOT NULL,
  `subtotal` decimal(12,2) DEFAULT 0.00,
  `discount_amount` decimal(12,2) DEFAULT 0.00,
  `tax_amount` decimal(12,2) DEFAULT 0.00,
  `total_amount` decimal(12,2) NOT NULL,
  `status` enum('pending','sent','received','completed','cancelled') DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `claim_start_date` date DEFAULT NULL,
  `claim_end_date` date DEFAULT NULL,
  `claimed_discount` decimal(12,2) DEFAULT 0.00,
  `claimed_foc` decimal(12,2) DEFAULT 0.00,
  `claimed_daily_pay` decimal(12,2) DEFAULT 0.00,
  `working_days` int(11) DEFAULT 0,
  `daily_pay_rate` decimal(12,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` int(11) NOT NULL,
  `po_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rep_daily_sessions`
--

CREATE TABLE `rep_daily_sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_date` date NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` enum('active','ended') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `rep_daily_sessions`
--

INSERT INTO `rep_daily_sessions` (`id`, `user_id`, `session_date`, `start_time`, `end_time`, `status`) VALUES
(10, 7, '2026-05-06', '2026-05-06 00:28:55', '2026-05-06 17:57:01', 'ended'),
(11, 7, '2026-05-06', '2026-05-06 08:52:06', '2026-05-06 17:57:01', 'ended'),
(12, 7, '2026-05-06', '2026-05-06 09:02:19', '2026-05-06 17:57:01', 'ended'),
(13, 7, '2026-05-07', '2026-05-07 08:18:06', '2026-05-07 16:11:37', 'ended'),
(14, 7, '2026-05-07', '2026-05-07 08:39:25', '2026-05-07 16:11:37', 'ended'),
(15, 7, '2026-05-08', '2026-05-08 08:46:19', '2026-05-08 18:14:47', 'ended'),
(16, 7, '2026-05-09', '2026-05-09 08:26:27', '2026-05-09 18:49:51', 'ended'),
(17, 7, '2026-05-11', '2026-05-11 08:29:50', '2026-05-11 18:06:27', 'ended'),
(18, 7, '2026-05-12', '2026-05-12 09:27:52', '2026-05-12 19:54:07', 'ended'),
(19, 7, '2026-05-13', '2026-05-13 09:00:42', '2026-05-13 17:37:13', 'ended'),
(20, 7, '2026-05-14', '2026-05-14 09:01:58', '2026-05-14 15:56:23', 'ended'),
(21, 7, '2026-05-15', '2026-05-15 09:22:00', '2026-05-15 18:02:27', 'ended'),
(22, 7, '2026-05-16', '2026-05-16 09:08:24', '2026-05-16 19:52:39', 'ended'),
(23, 7, '2026-05-18', '2026-05-18 09:09:30', '2026-05-18 18:10:21', 'ended'),
(24, 7, '2026-05-19', '2026-05-19 08:56:24', '2026-05-19 17:25:44', 'ended'),
(25, 7, '2026-05-22', '2026-05-22 09:32:08', '2026-05-22 17:15:47', 'ended'),
(26, 7, '2026-05-23', '2026-05-23 09:35:05', '2026-05-23 17:32:51', 'ended'),
(27, 7, '2026-05-25', '2026-05-25 09:01:46', '2026-05-25 17:42:10', 'ended'),
(28, 7, '2026-05-26', '2026-05-26 09:22:32', '2026-05-26 17:36:42', 'ended'),
(29, 7, '2026-05-27', '2026-05-27 09:29:17', '2026-05-27 16:52:36', 'ended'),
(30, 7, '2026-05-28', '2026-05-28 09:30:38', '2026-05-28 17:57:33', 'ended'),
(31, 7, '2026-05-29', '2026-05-29 09:16:15', '2026-05-29 18:37:59', 'ended'),
(32, 7, '2026-06-02', '2026-06-02 14:37:49', '2026-06-02 18:09:59', 'ended'),
(33, 7, '2026-06-03', '2026-06-03 09:45:31', '2026-06-03 17:30:04', 'ended'),
(34, 7, '2026-06-04', '2026-06-04 09:28:25', '2026-06-04 18:03:29', 'ended'),
(35, 7, '2026-06-05', '2026-06-05 09:18:37', '2026-06-05 17:09:19', 'ended'),
(36, 7, '2026-06-08', '2026-06-08 09:52:40', '2026-06-08 18:04:18', 'ended'),
(37, 7, '2026-06-09', '2026-06-09 09:24:40', '2026-06-09 17:55:52', 'ended'),
(38, 7, '2026-06-10', '2026-06-10 16:00:25', '2026-06-10 17:06:51', 'ended');

-- --------------------------------------------------------

--
-- Table structure for table `rep_location_logs`
--

CREATE TABLE `rep_location_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `activity_type` enum('start_day','invoice_created','live_ping','end_day','customer_created') NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `rep_location_logs`
--

INSERT INTO `rep_location_logs` (`id`, `user_id`, `latitude`, `longitude`, `activity_type`, `timestamp`) VALUES
(173, 7, 7.45219910, 80.34939640, '', '2026-05-06 00:28:55'),
(174, 7, 7.45219910, 80.34939640, '', '2026-05-06 00:28:55'),
(175, 7, 7.45208860, 80.34940600, '', '2026-05-06 00:29:05'),
(176, 7, 7.45215740, 80.34938400, '', '2026-05-06 00:29:21'),
(177, 7, 7.45209380, 80.34939100, '', '2026-05-06 00:30:05'),
(178, 7, 7.45213110, 80.34938030, '', '2026-05-06 00:30:07'),
(179, 7, 7.49180000, 80.36270000, '', '2026-05-06 00:30:19'),
(180, 7, 7.45220800, 80.34937480, '', '2026-05-06 00:32:10'),
(181, 7, 7.45220560, 80.34937420, '', '2026-05-06 00:32:17'),
(182, 7, 7.49180000, 80.36270000, '', '2026-05-06 00:32:45'),
(183, 7, 7.45209650, 80.34938790, 'invoice_created', '2026-05-06 00:34:25'),
(184, 7, 7.45212130, 80.34937280, '', '2026-05-06 00:34:29'),
(185, 7, 7.49180000, 80.36270000, '', '2026-05-06 00:34:46'),
(186, 7, 7.45218300, 80.34938320, 'invoice_created', '2026-05-06 00:35:19'),
(187, 7, 7.45219410, 80.34938080, '', '2026-05-06 00:35:22'),
(188, 7, 7.49180000, 80.36270000, '', '2026-05-06 00:36:45'),
(189, 7, 7.45218750, 80.34934390, 'invoice_created', '2026-05-06 00:37:24'),
(190, 7, 7.45217870, 80.34934240, 'invoice_created', '2026-05-06 00:37:49'),
(191, 7, 7.49180000, 80.36270000, '', '2026-05-06 00:38:45'),
(192, 7, 7.45211100, 80.34939010, 'invoice_created', '2026-05-06 00:39:43'),
(193, 7, 7.45217530, 80.34945390, 'invoice_created', '2026-05-06 00:40:06'),
(194, 7, 7.45219710, 80.34941530, '', '2026-05-06 00:40:17'),
(195, 7, 7.49180000, 80.36270000, '', '2026-05-06 00:40:45'),
(196, 7, 7.45220550, 80.34940930, 'invoice_created', '2026-05-06 00:40:51'),
(197, 7, 7.45218860, 80.34942260, '', '2026-05-06 00:40:55'),
(198, 7, 7.45219090, 80.34945460, 'invoice_created', '2026-05-06 00:42:28'),
(199, 7, 7.49180000, 80.36270000, '', '2026-05-06 00:42:45'),
(200, 7, 7.45224270, 80.34934270, 'invoice_created', '2026-05-06 00:42:59'),
(201, 7, 7.45223400, 80.34934240, '', '2026-05-06 00:43:09'),
(202, 7, 7.49180000, 80.36270000, '', '2026-05-06 00:44:45'),
(203, 7, 7.49180000, 80.36270000, '', '2026-05-06 00:46:45'),
(204, 7, 7.49180000, 80.36270000, '', '2026-05-06 00:48:45'),
(205, 7, 7.49180000, 80.36270000, '', '2026-05-06 07:25:43'),
(206, 7, 7.45211740, 80.34941990, 'invoice_created', '2026-05-06 08:14:35'),
(207, 7, 7.45211670, 80.34942350, '', '2026-05-06 08:14:42'),
(208, 7, 7.45211620, 80.34942290, '', '2026-05-06 08:15:57'),
(209, 7, 7.45211390, 80.34941710, '', '2026-05-06 08:18:06'),
(210, 7, 7.45211650, 80.34942550, '', '2026-05-06 08:19:03'),
(211, 7, 7.45212660, 80.34944390, '', '2026-05-06 08:22:14'),
(212, 7, 7.45212130, 80.34943980, 'invoice_created', '2026-05-06 08:22:37'),
(213, 7, 7.45212980, 80.34943890, '', '2026-05-06 08:22:43'),
(214, 7, 7.45212400, 80.34943670, '', '2026-05-06 08:23:40'),
(215, 7, 7.45212250, 80.34943960, 'invoice_created', '2026-05-06 08:25:07'),
(216, 7, 7.45214220, 80.34943860, '', '2026-05-06 08:25:10'),
(217, 7, 7.45212390, 80.34944020, '', '2026-05-06 08:26:05'),
(218, 7, 7.45212180, 80.34943490, '', '2026-05-06 08:28:05'),
(219, 7, 7.45212850, 80.34944160, '', '2026-05-06 08:31:32'),
(220, 7, 7.45210620, 80.34940890, '', '2026-05-06 08:33:03'),
(221, 7, 7.45211460, 80.34942370, 'invoice_created', '2026-05-06 08:37:55'),
(222, 7, 7.45211040, 80.34943270, '', '2026-05-06 08:37:59'),
(223, 7, 7.45208260, 80.34939860, '', '2026-05-06 08:38:56'),
(224, 7, 7.45212500, 80.34944210, '', '2026-05-06 08:39:36'),
(225, 7, 7.45215560, 80.34937920, '', '2026-05-06 08:40:54'),
(226, 7, 7.45207860, 80.34938670, '', '2026-05-06 08:52:06'),
(227, 7, 7.45209100, 80.34937290, '', '2026-05-06 08:52:12'),
(228, 7, 7.45208000, 80.34938180, '', '2026-05-06 08:52:20'),
(229, 7, 7.45215460, 80.34933540, '', '2026-05-06 08:58:57'),
(230, 7, 7.45212820, 80.34938760, '', '2026-05-06 09:00:03'),
(231, 7, 7.45212820, 80.34938760, '', '2026-05-06 09:00:03'),
(232, 7, 7.45206670, 80.34857800, '', '2026-05-06 09:00:32'),
(233, 7, 7.45229710, 80.34678880, '', '2026-05-06 09:02:24'),
(234, 7, 7.45243360, 80.34546910, '', '2026-05-06 09:02:35'),
(235, 7, 7.45243430, 80.34546800, '', '2026-05-06 09:02:42'),
(236, 7, 7.45241910, 80.34544830, '', '2026-05-06 09:03:13'),
(237, 7, 7.45243160, 80.34545760, '', '2026-05-06 09:03:26'),
(238, 7, 7.45242980, 80.34544770, '', '2026-05-06 09:03:54'),
(239, 7, 7.45245560, 80.34536520, '', '2026-05-06 09:04:00'),
(240, 7, 7.45245000, 80.34536010, '', '2026-05-06 09:04:17'),
(241, 7, 7.45243260, 80.34547510, '', '2026-05-06 09:04:33'),
(242, 7, 7.45243390, 80.34547730, '', '2026-05-06 09:09:21'),
(243, 7, 7.45244840, 80.34538420, '', '2026-05-06 09:15:02'),
(244, 7, 7.45240630, 80.34540330, '', '2026-05-06 09:18:23'),
(245, 7, 7.44872960, 80.34400700, 'invoice_created', '2026-05-06 09:19:54'),
(246, 7, 7.44859010, 80.34376270, '', '2026-05-06 09:19:57'),
(247, 7, 7.44793090, 80.34352330, '', '2026-05-06 09:20:09'),
(248, 7, 7.44705790, 80.34308220, '', '2026-05-06 09:20:27'),
(249, 7, 7.44689270, 80.34299090, '', '2026-05-06 09:20:30'),
(250, 7, 7.44735720, 80.34947810, '', '2026-05-06 10:27:03'),
(251, 7, 7.44735730, 80.34947820, '', '2026-05-06 10:30:25'),
(252, 7, 7.44735010, 80.34948570, 'invoice_created', '2026-05-06 10:31:47'),
(253, 7, 7.44703150, 80.34966720, '', '2026-05-06 10:32:06'),
(254, 7, 7.44577800, 80.34691610, '', '2026-05-06 10:33:55'),
(255, 7, 7.44599230, 80.34545360, '', '2026-05-06 10:34:26'),
(256, 7, 7.44560030, 80.34427930, '', '2026-05-06 10:34:49'),
(257, 7, 7.44551300, 80.34427880, '', '2026-05-06 10:35:15'),
(258, 7, 7.44550370, 80.34427710, 'invoice_created', '2026-05-06 10:35:54'),
(259, 7, 7.44560560, 80.34420390, '', '2026-05-06 10:35:57'),
(260, 7, 7.44561030, 80.34419550, '', '2026-05-06 10:36:05'),
(261, 7, 7.44562470, 80.34380360, '', '2026-05-06 10:52:29'),
(262, 7, 7.44562300, 80.34380380, '', '2026-05-06 10:59:50'),
(263, 7, 7.44562970, 80.34380330, '', '2026-05-06 11:00:18'),
(264, 7, 7.44562170, 80.34380150, '', '2026-05-06 11:03:12'),
(265, 7, 7.44561840, 80.34379820, '', '2026-05-06 11:03:28'),
(266, 7, 7.44555430, 80.34376590, '', '2026-05-06 11:04:33'),
(267, 7, 7.44562070, 80.34380560, 'invoice_created', '2026-05-06 11:07:06'),
(268, 7, 7.44581910, 80.34302090, '', '2026-05-06 11:09:11'),
(269, 7, 7.44545420, 80.34241310, '', '2026-05-06 11:20:25'),
(270, 7, 7.44551970, 80.34234970, '', '2026-05-06 11:21:59'),
(271, 7, 7.44544820, 80.34245120, '', '2026-05-06 11:23:24'),
(272, 7, 7.44536140, 80.34232650, 'invoice_created', '2026-05-06 11:23:47'),
(273, 7, 7.43760690, 80.33807990, '', '2026-05-06 11:41:16'),
(274, 7, 7.43751310, 80.33785600, '', '2026-05-06 11:41:23'),
(275, 7, 7.43637920, 80.33663480, '', '2026-05-06 11:46:52'),
(276, 7, 7.40261140, 80.32416270, '', '2026-05-06 12:23:03'),
(277, 7, 7.40270770, 80.32410350, '', '2026-05-06 12:30:52'),
(278, 7, 7.40272310, 80.32409380, '', '2026-05-06 12:30:59'),
(279, 7, 7.40273990, 80.32389260, 'invoice_created', '2026-05-06 12:31:44'),
(280, 7, 7.40265610, 80.32416070, '', '2026-05-06 12:32:11'),
(281, 7, 7.40264870, 80.32404100, '', '2026-05-06 12:32:19'),
(282, 7, 7.40272830, 80.32389090, 'invoice_created', '2026-05-06 12:32:47'),
(283, 7, 7.40274130, 80.32389050, '', '2026-05-06 12:32:50'),
(284, 7, 7.40274130, 80.32388700, '', '2026-05-06 12:33:03'),
(285, 7, 7.40263250, 80.32416040, '', '2026-05-06 12:33:46'),
(286, 7, 7.40264620, 80.32411130, '', '2026-05-06 12:33:57'),
(287, 7, 7.40171300, 80.32389300, '', '2026-05-06 12:34:22'),
(288, 7, 7.40160570, 80.32382000, 'invoice_created', '2026-05-06 12:34:39'),
(289, 7, 7.40160860, 80.32384390, '', '2026-05-06 12:34:43'),
(290, 7, 7.40159410, 80.32384120, '', '2026-05-06 12:34:45'),
(291, 7, 7.38589820, 80.31643820, '', '2026-05-06 13:04:47'),
(292, 7, 7.38598130, 80.31643970, 'invoice_created', '2026-05-06 13:05:07'),
(293, 7, 7.38604830, 80.31603860, '', '2026-05-06 13:05:53'),
(294, 7, 7.36114720, 80.30681490, '', '2026-05-06 13:47:22'),
(295, 7, 7.36117430, 80.30672930, '', '2026-05-06 13:52:18'),
(296, 7, 7.36115040, 80.30678370, 'invoice_created', '2026-05-06 13:52:38'),
(297, 7, 7.36116590, 80.30666170, '', '2026-05-06 13:52:58'),
(298, 7, 7.34668270, 80.30419950, '', '2026-05-06 14:27:06'),
(299, 7, 7.34653710, 80.30419290, '', '2026-05-06 14:28:20'),
(300, 7, 7.34241650, 80.30321750, '', '2026-05-06 15:20:28'),
(301, 7, 7.34261780, 80.30324880, '', '2026-05-06 15:23:26'),
(302, 7, 7.34301400, 80.30326980, 'invoice_created', '2026-05-06 15:24:13'),
(303, 7, 7.34302290, 80.30346130, '', '2026-05-06 15:24:17'),
(304, 7, 7.34302850, 80.30347410, '', '2026-05-06 15:24:25'),
(305, 7, 7.36211530, 80.30808280, '', '2026-05-06 15:41:29'),
(306, 7, 7.36220470, 80.30815310, '', '2026-05-06 15:41:30'),
(307, 7, 7.38512390, 80.31576850, '', '2026-05-06 15:53:55'),
(308, 7, 7.38512390, 80.31576850, '', '2026-05-06 15:53:55'),
(309, 7, 7.39088080, 80.31918350, '', '2026-05-06 15:56:22'),
(310, 7, 7.39187710, 80.31998590, 'invoice_created', '2026-05-06 15:56:45'),
(311, 7, 7.39186420, 80.31983610, '', '2026-05-06 15:56:47'),
(312, 7, 7.39529100, 80.32150900, '', '2026-05-06 15:57:58'),
(313, 7, 7.39589730, 80.32193790, 'invoice_created', '2026-05-06 15:58:18'),
(314, 7, 7.39605540, 80.32202000, '', '2026-05-06 15:58:21'),
(315, 7, 7.39615590, 80.32224590, '', '2026-05-06 15:58:47'),
(316, 7, 7.42060090, 80.32103080, 'invoice_created', '2026-05-06 16:31:10'),
(317, 7, 7.42063700, 80.32108820, '', '2026-05-06 16:31:20'),
(318, 7, 7.42068100, 80.32109960, '', '2026-05-06 16:46:17'),
(319, 7, 7.42070960, 80.32114320, '', '2026-05-06 16:47:41'),
(320, 7, 7.42067230, 80.32112860, 'invoice_created', '2026-05-06 16:48:30'),
(321, 7, 7.42064920, 80.32108510, '', '2026-05-06 16:49:07'),
(322, 7, 7.42062700, 80.32105940, '', '2026-05-06 16:58:17'),
(323, 7, 7.42057010, 80.32147280, 'invoice_created', '2026-05-06 16:58:55'),
(324, 7, 7.42063420, 80.32143720, '', '2026-05-06 16:59:00'),
(325, 7, 7.42065380, 80.32142690, '', '2026-05-06 17:18:42'),
(326, 7, 7.42063910, 80.32143380, 'invoice_created', '2026-05-06 17:21:36'),
(327, 7, 7.44475200, 80.34208470, '', '2026-05-06 17:38:28'),
(328, 7, 7.44652390, 80.34279160, '', '2026-05-06 17:38:48'),
(329, 7, 7.44747750, 80.34319370, '', '2026-05-06 17:41:26'),
(330, 7, 7.44763960, 80.34315530, '', '2026-05-06 17:41:35'),
(331, 7, 7.45241450, 80.34538860, '', '2026-05-06 17:43:51'),
(332, 7, 7.45211520, 80.34941850, 'invoice_created', '2026-05-06 17:51:23'),
(333, 7, 7.45212800, 80.34950190, '', '2026-05-06 17:51:28'),
(334, 7, 7.45211460, 80.34941790, '', '2026-05-06 17:52:44'),
(335, 7, 7.45211520, 80.34941860, 'invoice_created', '2026-05-06 17:53:18'),
(336, 7, 7.45211640, 80.34943580, '', '2026-05-06 17:53:22'),
(337, 7, 7.45211500, 80.34941960, '', '2026-05-06 17:53:52'),
(338, 7, 7.45211390, 80.34941800, '', '2026-05-06 17:54:52'),
(339, 7, 7.45211530, 80.34941920, '', '2026-05-06 17:56:52'),
(340, 7, 7.45211510, 80.34941880, '', '2026-05-06 17:57:01'),
(341, 7, 7.45211440, 80.34940710, '', '2026-05-07 08:18:10'),
(342, 7, 7.45211860, 80.34941890, '', '2026-05-07 08:38:50'),
(343, 7, 7.45212110, 80.34939870, '', '2026-05-07 08:39:25'),
(344, 7, 7.45209220, 80.34940500, '', '2026-05-07 08:39:31'),
(345, 7, 7.45244470, 80.34761130, '', '2026-05-07 09:20:54'),
(346, 7, 7.45244470, 80.34761130, '', '2026-05-07 09:20:54'),
(347, 7, 7.52430350, 80.34184080, 'invoice_created', '2026-05-07 10:40:54'),
(348, 7, 7.53082150, 80.34022200, 'invoice_created', '2026-05-07 11:06:51'),
(349, 7, 7.53990290, 80.34027420, '', '2026-05-07 11:22:00'),
(350, 7, 7.53989920, 80.34026770, 'invoice_created', '2026-05-07 11:22:26'),
(351, 7, 7.54604630, 80.33942900, '', '2026-05-07 11:42:52'),
(352, 7, 7.55225030, 80.34045280, '', '2026-05-07 11:49:45'),
(353, 7, 7.55224860, 80.34044920, 'invoice_created', '2026-05-07 11:51:58'),
(354, 7, 7.55896300, 80.34060180, '', '2026-05-07 12:01:32'),
(355, 7, 7.55919420, 80.34100110, 'invoice_created', '2026-05-07 12:03:09'),
(356, 7, 7.55931540, 80.34098010, 'invoice_created', '2026-05-07 12:23:26'),
(357, 7, 7.56316600, 80.33845560, '', '2026-05-07 12:26:24'),
(358, 7, 7.40140470, 80.32858720, '', '2026-05-07 14:32:36'),
(359, 7, 7.40140170, 80.32858410, '', '2026-05-07 14:35:06'),
(360, 7, 7.40140350, 80.32858810, 'invoice_created', '2026-05-07 14:36:55'),
(361, 7, 7.50784490, 80.34247420, '', '2026-05-07 15:17:22'),
(362, 7, 7.45206500, 80.34937920, '', '2026-05-07 15:51:02'),
(363, 7, 7.45211100, 80.34941920, '', '2026-05-07 15:53:00'),
(364, 7, 7.45211330, 80.34941760, '', '2026-05-07 15:55:00'),
(365, 7, 7.45210820, 80.34941240, '', '2026-05-07 15:57:45'),
(366, 7, 7.45210870, 80.34941240, '', '2026-05-07 15:57:52'),
(367, 7, 7.45211420, 80.34941650, '', '2026-05-07 15:59:06'),
(368, 7, 7.45212890, 80.34938570, '', '2026-05-07 15:59:26'),
(369, 7, 7.45211510, 80.34941810, '', '2026-05-07 15:59:58'),
(370, 7, 7.45211300, 80.34941190, 'invoice_created', '2026-05-07 16:01:12'),
(371, 7, 7.45211220, 80.34941880, '', '2026-05-07 16:01:18'),
(372, 7, 7.45211550, 80.34941970, '', '2026-05-07 16:01:32'),
(373, 7, 7.45211630, 80.34941900, '', '2026-05-07 16:02:04'),
(374, 7, 7.45212730, 80.34939010, '', '2026-05-07 16:02:52'),
(375, 7, 7.45211780, 80.34941960, 'invoice_created', '2026-05-07 16:03:42'),
(376, 7, 7.45211540, 80.34941850, '', '2026-05-07 16:03:48'),
(377, 7, 7.45211800, 80.34941810, '', '2026-05-07 16:05:47'),
(378, 7, 7.45211460, 80.34941680, '', '2026-05-07 16:06:35'),
(379, 7, 7.45211880, 80.34941900, '', '2026-05-07 16:08:35'),
(380, 7, 7.45211660, 80.34941720, '', '2026-05-07 16:10:35'),
(381, 7, 7.45211220, 80.34942080, '', '2026-05-07 16:11:37'),
(382, 7, 7.45206200, 80.34937890, '', '2026-05-08 08:46:19'),
(383, 7, 7.45211390, 80.34898400, '', '2026-05-08 08:46:24'),
(384, 7, 7.45209600, 80.34940420, '', '2026-05-08 08:47:41'),
(385, 7, 7.49847200, 80.38507420, '', '2026-05-08 09:17:54'),
(386, 7, 7.50078790, 80.39379980, '', '2026-05-08 09:42:44'),
(387, 7, 7.51478510, 80.42049430, 'invoice_created', '2026-05-08 10:25:12'),
(388, 7, 7.48809430, 80.36468420, '', '2026-05-08 10:45:12'),
(389, 7, 7.53889790, 80.44036270, 'invoice_created', '2026-05-08 10:46:11'),
(390, 7, 7.57227510, 80.46584430, '', '2026-05-08 11:14:04'),
(391, 7, 7.57230310, 80.46581940, 'invoice_created', '2026-05-08 11:14:24'),
(392, 7, 7.57101380, 80.46566140, 'invoice_created', '2026-05-08 11:25:48'),
(393, 7, 7.57237870, 80.46586690, '', '2026-05-08 11:33:27'),
(394, 7, 7.57237430, 80.46586590, 'invoice_created', '2026-05-08 11:35:41'),
(395, 7, 7.57239980, 80.46587740, '', '2026-05-08 11:38:23'),
(396, 7, 7.57363010, 80.46634670, '', '2026-05-08 11:38:50'),
(397, 7, 7.57799580, 80.46845780, '', '2026-05-08 11:47:17'),
(398, 7, 7.58097760, 80.47113400, '', '2026-05-08 11:48:30'),
(399, 7, 7.57858100, 80.46894220, 'invoice_created', '2026-05-08 11:48:45'),
(400, 7, 7.57854820, 80.46896080, '', '2026-05-08 11:48:49'),
(401, 7, 7.57859330, 80.46901040, '', '2026-05-08 11:49:55'),
(402, 7, 7.57871320, 80.46911330, '', '2026-05-08 11:50:13'),
(403, 7, 7.57868580, 80.46903470, '', '2026-05-08 11:52:14'),
(404, 7, 7.64172230, 80.50889130, 'invoice_created', '2026-05-08 12:48:40'),
(405, 7, 7.73639340, 80.55154890, '', '2026-05-08 14:02:22'),
(406, 7, 7.52098170, 80.32554730, '', '2026-05-08 14:40:39'),
(407, 7, 7.76236610, 80.57016930, 'invoice_created', '2026-05-08 14:44:35'),
(408, 7, 7.76236610, 80.57016930, '', '2026-05-08 14:44:39'),
(409, 7, 7.76213330, 80.57003840, 'invoice_created', '2026-05-08 14:51:21'),
(410, 7, 7.75402910, 80.57591620, '', '2026-05-08 15:16:32'),
(411, 7, 7.75402910, 80.57591620, '', '2026-05-08 15:16:32'),
(412, 7, 7.75403230, 80.57591980, '', '2026-05-08 15:17:16'),
(413, 7, 7.75403240, 80.57591990, '', '2026-05-08 15:17:24'),
(414, 7, 7.75403040, 80.57591940, '', '2026-05-08 15:17:52'),
(415, 7, 7.76006010, 80.57349360, '', '2026-05-08 15:27:03'),
(416, 7, 7.76019030, 80.57241320, '', '2026-05-08 15:28:55'),
(417, 7, 7.76015360, 80.57248070, 'invoice_created', '2026-05-08 15:29:17'),
(418, 7, 7.76013670, 80.57250970, '', '2026-05-08 15:29:24'),
(419, 7, 7.76013180, 80.57241250, 'invoice_created', '2026-05-08 15:58:26'),
(420, 7, 7.76017360, 80.57244430, '', '2026-05-08 16:00:15'),
(421, 7, 7.75172370, 80.56388710, '', '2026-05-08 16:19:27'),
(422, 7, 7.73852180, 80.55380030, '', '2026-05-08 16:22:26'),
(423, 7, 7.73641010, 80.55152190, '', '2026-05-08 16:22:58'),
(424, 7, 7.73549180, 80.55111320, '', '2026-05-08 16:23:05'),
(425, 7, 7.73400280, 80.55058990, '', '2026-05-08 16:23:53'),
(426, 7, 7.50083130, 80.39392840, '', '2026-05-08 17:19:35'),
(427, 7, 7.49777080, 80.38422260, '', '2026-05-08 17:40:43'),
(428, 7, 7.45209170, 80.34938110, '', '2026-05-08 18:05:35'),
(429, 7, 7.45209170, 80.34938110, '', '2026-05-08 18:12:40'),
(430, 7, 7.45211410, 80.34941750, '', '2026-05-08 18:14:32'),
(431, 7, 7.45211100, 80.34941920, '', '2026-05-08 18:14:47'),
(432, 7, 7.45209030, 80.34939100, '', '2026-05-09 08:26:27'),
(433, 7, 7.45204480, 80.34917670, '', '2026-05-09 08:26:32'),
(434, 7, 7.45204480, 80.34917670, '', '2026-05-09 08:35:46'),
(435, 7, 7.47833380, 80.29818790, 'invoice_created', '2026-05-09 10:00:56'),
(436, 7, 7.48842640, 80.29653130, '', '2026-05-09 10:26:33'),
(437, 7, 7.48842290, 80.29652390, 'invoice_created', '2026-05-09 10:30:11'),
(438, 7, 7.49425640, 80.30015190, '', '2026-05-09 10:43:32'),
(439, 7, 7.49053260, 80.29962520, 'invoice_created', '2026-05-09 10:44:17'),
(440, 7, 7.49024640, 80.29866520, '', '2026-05-09 10:44:22'),
(441, 7, 7.45970880, 80.29297220, 'invoice_created', '2026-05-09 11:04:38'),
(442, 7, 7.45817440, 80.29160590, 'invoice_created', '2026-05-09 11:18:44'),
(443, 7, 7.43454210, 80.21728470, '', '2026-05-09 12:21:53'),
(444, 7, 7.43337180, 80.21557640, 'invoice_created', '2026-05-09 12:32:50'),
(445, 7, 7.42774780, 80.21322860, '', '2026-05-09 13:12:36'),
(446, 7, 7.42777290, 80.21320870, '', '2026-05-09 13:23:07'),
(447, 7, 7.45052350, 80.18636990, 'invoice_created', '2026-05-09 14:15:00'),
(448, 7, 7.45065880, 80.18631750, '', '2026-05-09 14:19:00'),
(449, 7, 7.42827300, 80.17691280, '', '2026-05-09 14:29:12'),
(450, 7, 7.42827300, 80.17691280, '', '2026-05-09 14:29:12'),
(451, 7, 7.42826840, 80.17690910, 'invoice_created', '2026-05-09 14:31:06'),
(452, 7, 7.44554820, 80.18576300, 'invoice_created', '2026-05-09 14:43:46'),
(453, 7, 7.44701680, 80.18660550, '', '2026-05-09 14:46:53'),
(454, 7, 7.45097520, 80.18216550, '', '2026-05-09 15:05:42'),
(455, 7, 7.45097520, 80.18216550, '', '2026-05-09 15:05:42'),
(456, 7, 7.45129160, 80.17173320, '', '2026-05-09 15:12:12'),
(457, 7, 7.45129080, 80.17173180, 'invoice_created', '2026-05-09 15:12:30'),
(458, 7, 7.45129170, 80.17173140, '', '2026-05-09 15:12:35'),
(459, 7, 7.45330310, 80.14902630, '', '2026-05-09 15:30:47'),
(460, 7, 7.45293240, 80.14880530, '', '2026-05-09 15:32:03'),
(461, 7, 7.45485690, 80.14455260, 'invoice_created', '2026-05-09 15:33:25'),
(462, 7, 7.45503770, 80.14395080, '', '2026-05-09 15:33:28'),
(463, 7, 7.45503770, 80.14395080, '', '2026-05-09 15:33:28'),
(464, 7, 7.45998810, 80.06243180, 'invoice_created', '2026-05-09 16:02:41'),
(465, 7, 7.46061310, 80.06288030, '', '2026-05-09 16:02:46'),
(466, 7, 7.46008430, 80.12424750, '', '2026-05-09 16:36:48'),
(467, 7, 7.46008430, 80.12424750, '', '2026-05-09 16:36:48'),
(468, 7, 7.46008430, 80.12424750, '', '2026-05-09 16:36:48'),
(469, 7, 7.46008430, 80.12424750, '', '2026-05-09 16:36:48'),
(470, 7, 7.45957200, 80.12705800, '', '2026-05-09 16:41:14'),
(471, 7, 7.45951450, 80.13066850, 'invoice_created', '2026-05-09 16:41:39'),
(472, 7, 7.45518230, 80.14382940, '', '2026-05-09 16:44:02'),
(473, 7, 7.45518230, 80.14382940, '', '2026-05-09 16:44:02'),
(474, 7, 7.43463520, 80.21502520, '', '2026-05-09 17:17:31'),
(475, 7, 7.43480390, 80.21492720, '', '2026-05-09 17:18:21'),
(476, 7, 7.43476940, 80.21505120, '', '2026-05-09 17:18:31'),
(477, 7, 7.43539020, 80.21907390, '', '2026-05-09 17:52:10'),
(478, 7, 7.43625180, 80.22217230, '', '2026-05-09 17:52:53'),
(479, 7, 7.44020870, 80.22691140, '', '2026-05-09 17:53:59'),
(480, 7, 7.44068070, 80.22769510, '', '2026-05-09 17:54:08'),
(481, 7, 7.47049770, 80.39325660, '', '2026-05-09 18:17:12'),
(482, 7, 7.47700820, 80.34521320, '', '2026-05-09 18:18:22'),
(483, 7, 7.47180700, 80.34977380, '', '2026-05-09 18:24:16'),
(484, 7, 7.47078980, 80.34960180, '', '2026-05-09 18:25:03'),
(485, 7, 7.45205590, 80.34937580, '', '2026-05-09 18:35:28'),
(486, 7, 7.45208660, 80.34939300, '', '2026-05-09 18:36:01'),
(487, 7, 7.45211600, 80.34941840, '', '2026-05-09 18:38:02'),
(488, 7, 7.45211400, 80.34942140, '', '2026-05-09 18:40:02'),
(489, 7, 7.45211510, 80.34941890, '', '2026-05-09 18:42:08'),
(490, 7, 6.97515360, 79.92997810, '', '2026-05-09 18:42:59'),
(491, 7, 6.97538290, 79.93004530, '', '2026-05-09 18:43:03'),
(492, 7, 6.97537410, 79.93008070, '', '2026-05-09 18:43:23'),
(493, 7, 6.97538290, 79.93011350, 'invoice_created', '2026-05-09 18:44:03'),
(494, 7, 6.97537270, 79.93008840, '', '2026-05-09 18:44:05'),
(495, 7, 6.97536760, 79.93009010, '', '2026-05-09 18:44:48'),
(496, 7, 7.45211500, 80.34941880, '', '2026-05-09 18:44:56'),
(497, 7, 6.97582840, 79.92989280, 'invoice_created', '2026-05-09 18:46:08'),
(498, 7, 6.97536510, 79.93008560, '', '2026-05-09 18:46:11'),
(499, 7, 7.45211560, 80.34941930, '', '2026-05-09 18:46:16'),
(500, 7, 7.45211750, 80.34941930, '', '2026-05-09 18:46:22'),
(501, 7, 6.97536690, 79.93008230, '', '2026-05-09 18:46:24'),
(502, 7, 7.45211740, 80.34941960, '', '2026-05-09 18:46:42'),
(503, 7, 6.97561740, 79.92987080, '', '2026-05-09 18:47:09'),
(504, 7, 7.45211350, 80.34942160, '', '2026-05-09 18:48:41'),
(505, 7, 7.45211570, 80.34941940, '', '2026-05-09 18:49:51'),
(506, 7, 7.45215950, 80.34948000, '', '2026-05-11 08:29:50'),
(507, 7, 7.45216680, 80.34948370, '', '2026-05-11 08:29:55'),
(508, 7, 7.45213840, 80.34941260, '', '2026-05-11 08:36:26'),
(509, 7, 7.45214520, 80.34944630, '', '2026-05-11 08:37:13'),
(510, 7, 7.45213920, 80.34944090, '', '2026-05-11 08:37:21'),
(511, 7, 7.45213790, 80.34940600, '', '2026-05-11 08:39:07'),
(512, 7, 7.45213390, 80.34941600, '', '2026-05-11 08:39:34'),
(513, 7, 7.48648110, 80.41577820, '', '2026-05-11 09:36:19'),
(514, 7, 7.44343850, 80.43118590, 'invoice_created', '2026-05-11 11:07:46'),
(515, 7, 7.43498400, 80.44719120, '', '2026-05-11 11:25:25'),
(516, 7, 7.43493470, 80.44717610, 'invoice_created', '2026-05-11 11:26:27'),
(517, 7, 7.43495440, 80.44717400, '', '2026-05-11 11:27:27'),
(518, 7, 7.45759700, 80.45098560, '', '2026-05-11 11:56:27'),
(519, 7, 7.45699930, 80.45107970, 'invoice_created', '2026-05-11 11:56:41'),
(520, 7, 7.38463970, 80.52022430, '', '2026-05-11 13:28:29'),
(521, 7, 7.38487620, 80.51981990, '', '2026-05-11 13:30:29'),
(522, 7, 7.38487620, 80.51981890, '', '2026-05-11 13:30:49'),
(523, 7, 7.38414340, 80.52021530, '', '2026-05-11 13:55:11'),
(524, 7, 7.37180860, 80.52546670, '', '2026-05-11 15:28:52'),
(525, 7, 7.37185340, 80.52543410, '', '2026-05-11 15:30:24'),
(526, 7, 7.37179800, 80.52545840, 'invoice_created', '2026-05-11 15:30:42'),
(527, 7, 7.37266110, 80.52414820, '', '2026-05-11 16:01:46'),
(528, 7, 7.43732910, 80.43789920, '', '2026-05-11 16:58:53'),
(529, 7, 7.43751060, 80.43770300, '', '2026-05-11 16:59:00'),
(530, 7, 7.44143880, 80.43358300, '', '2026-05-11 16:59:51'),
(531, 7, 7.44817150, 80.42636150, '', '2026-05-11 17:01:26'),
(532, 7, 7.46234770, 80.40265560, 'invoice_created', '2026-05-11 17:06:14'),
(533, 7, 7.46246140, 80.40270120, '', '2026-05-11 17:06:26'),
(534, 7, 7.45213550, 80.34940830, '', '2026-05-11 18:03:17'),
(535, 7, 7.45213660, 80.34943100, '', '2026-05-11 18:05:13'),
(536, 7, 7.45213530, 80.34941390, '', '2026-05-11 18:06:27'),
(537, 7, 7.45213290, 80.34962000, '', '2026-05-12 09:27:52'),
(538, 7, 7.47409880, 80.39051970, '', '2026-05-12 10:51:18'),
(539, 7, 7.47943990, 80.46221290, '', '2026-05-12 11:52:41'),
(540, 7, 7.47938100, 80.46213890, '', '2026-05-12 11:52:44'),
(541, 7, 7.47938140, 80.46210590, 'invoice_created', '2026-05-12 11:53:09'),
(542, 7, 7.46718180, 80.47606250, '', '2026-05-12 12:21:06'),
(543, 7, 7.46371790, 80.47694870, 'invoice_created', '2026-05-12 12:22:34'),
(544, 7, 7.46384880, 80.47687090, '', '2026-05-12 12:22:38'),
(545, 7, 7.46384880, 80.47687090, '', '2026-05-12 12:22:38'),
(546, 7, 7.46236730, 80.47810590, '', '2026-05-12 12:29:14'),
(547, 7, 7.45967980, 80.48009340, '', '2026-05-12 12:30:07'),
(548, 7, 7.45838930, 80.48072640, '', '2026-05-12 12:30:43'),
(549, 7, 7.49094360, 80.47191520, '', '2026-05-12 13:37:44'),
(550, 7, 7.49088130, 80.47192840, 'invoice_created', '2026-05-12 13:40:12'),
(551, 7, 7.54729360, 80.48911220, '', '2026-05-12 14:50:02'),
(552, 7, 7.54872880, 80.49030630, '', '2026-05-12 14:50:22'),
(553, 7, 7.54970210, 80.49191560, '', '2026-05-12 14:51:38'),
(554, 7, 7.55396630, 80.49337340, '', '2026-05-12 14:52:00'),
(555, 7, 7.55704160, 80.49498720, '', '2026-05-12 14:52:24'),
(556, 7, 7.55700830, 80.49509770, '', '2026-05-12 14:52:31'),
(557, 7, 7.56757030, 80.51175730, '', '2026-05-12 14:58:52'),
(558, 7, 7.56763300, 80.51172220, 'invoice_created', '2026-05-12 15:06:45'),
(559, 7, 7.56763300, 80.51172220, '', '2026-05-12 15:07:01'),
(560, 7, 7.57340190, 80.52536870, '', '2026-05-12 15:23:58'),
(561, 7, 7.47640680, 80.39700560, '', '2026-05-12 16:30:42'),
(562, 7, 7.47642730, 80.39703190, 'invoice_created', '2026-05-12 16:34:25'),
(563, 7, 7.45507900, 80.34614590, '', '2026-05-12 17:20:05'),
(564, 7, 7.45213500, 80.34941010, '', '2026-05-12 17:26:56'),
(565, 7, 7.45213520, 80.34940470, '', '2026-05-12 17:33:48'),
(566, 7, 7.45213550, 80.34940830, '', '2026-05-12 17:34:13'),
(567, 7, 7.45213520, 80.34940830, '', '2026-05-12 17:34:19'),
(568, 7, 7.45213670, 80.34942060, '', '2026-05-12 17:37:06'),
(569, 7, 7.45213580, 80.34940780, '', '2026-05-12 17:37:13'),
(570, 7, 7.45213580, 80.34940770, 'invoice_created', '2026-05-12 17:37:41'),
(571, 7, 7.45213480, 80.34940520, '', '2026-05-12 17:37:50'),
(572, 7, 7.45213480, 80.34940580, '', '2026-05-12 17:37:56'),
(573, 7, 7.45213490, 80.34940890, '', '2026-05-12 17:44:36'),
(574, 7, 7.45213490, 80.34940890, '', '2026-05-12 17:46:36'),
(575, 7, 7.45213490, 80.34940610, '', '2026-05-12 17:49:02'),
(576, 7, 7.45213570, 80.34940810, '', '2026-05-12 17:52:16'),
(577, 7, 7.45213520, 80.34940800, '', '2026-05-12 17:52:36'),
(578, 7, 7.45213530, 80.34940770, '', '2026-05-12 17:53:09'),
(579, 7, 7.45213540, 80.34941250, '', '2026-05-12 17:54:21'),
(580, 7, 7.45213480, 80.34940520, '', '2026-05-12 17:55:10'),
(581, 7, 7.45213540, 80.34940830, 'invoice_created', '2026-05-12 17:56:23'),
(582, 7, 7.45213560, 80.34940820, '', '2026-05-12 17:56:29'),
(583, 7, 7.45213580, 80.34940800, '', '2026-05-12 17:58:59'),
(584, 7, 7.45213580, 80.34940800, '', '2026-05-12 18:00:30'),
(585, 7, 7.45220380, 80.34945920, '', '2026-05-12 18:25:50'),
(586, 7, 7.45238340, 80.34930890, '', '2026-05-12 18:25:54'),
(587, 7, 7.45215510, 80.34972160, '', '2026-05-12 18:32:40'),
(588, 7, 7.45216110, 80.34938180, '', '2026-05-12 18:51:05'),
(589, 7, 7.45218080, 80.34939840, '', '2026-05-12 18:51:24'),
(590, 7, 7.45215680, 80.34938880, '', '2026-05-12 18:53:45'),
(591, 7, 7.45223620, 80.34945580, '', '2026-05-12 18:56:51'),
(592, 7, 7.45221290, 80.34943000, '', '2026-05-12 18:57:00'),
(593, 7, 7.45219650, 80.34940760, '', '2026-05-12 18:57:10'),
(594, 7, 7.45218500, 80.34965520, 'invoice_created', '2026-05-12 18:57:53'),
(595, 7, 7.45216840, 80.34938270, '', '2026-05-12 18:57:56'),
(596, 7, 7.45213580, 80.34939920, '', '2026-05-12 19:00:38'),
(597, 7, 7.45216170, 80.34942030, '', '2026-05-12 19:06:05'),
(598, 7, 7.45216790, 80.34938900, '', '2026-05-12 19:06:07'),
(599, 7, 7.45218440, 80.34939510, '', '2026-05-12 19:06:24'),
(600, 7, 7.45215670, 80.34965980, '', '2026-05-12 19:07:21'),
(601, 7, 7.45210710, 80.34945840, '', '2026-05-12 19:10:00'),
(602, 7, 7.45210710, 80.34945840, '', '2026-05-12 19:10:00'),
(603, 7, 7.45216170, 80.34966230, '', '2026-05-12 19:11:02'),
(604, 7, 7.45215680, 80.34969640, '', '2026-05-12 19:12:18'),
(605, 7, 7.45217810, 80.34966860, '', '2026-05-12 19:13:05'),
(606, 7, 7.45216810, 80.34959110, '', '2026-05-12 19:13:08'),
(607, 7, 7.45217760, 80.34937870, '', '2026-05-12 19:14:13'),
(608, 7, 7.45217810, 80.34965450, '', '2026-05-12 19:16:45'),
(609, 7, 7.48797990, 80.36470610, '', '2026-05-12 19:41:53'),
(610, 7, 7.48804470, 80.36360300, '', '2026-05-12 19:53:02'),
(611, 7, 7.45215630, 80.34964860, '', '2026-05-12 19:54:07'),
(612, 7, 7.45213950, 80.34941270, '', '2026-05-13 09:00:42'),
(613, 7, 7.45214040, 80.34944100, '', '2026-05-13 09:00:49'),
(614, 7, 7.60653270, 80.43385150, 'invoice_created', '2026-05-13 11:34:00'),
(615, 7, 7.52089380, 80.46347710, '', '2026-05-13 11:51:37'),
(616, 7, 7.52089410, 80.46347630, 'invoice_created', '2026-05-13 11:51:49'),
(617, 7, 7.66940450, 80.42653810, '', '2026-05-13 12:03:48'),
(618, 7, 7.66940530, 80.42653960, '', '2026-05-13 12:05:12'),
(619, 7, 7.72828720, 80.42029240, 'invoice_created', '2026-05-13 12:55:47'),
(620, 7, 7.72814390, 80.42002620, '', '2026-05-13 13:19:16'),
(621, 7, 7.72763260, 80.41978560, '', '2026-05-13 13:35:34'),
(622, 7, 7.74476630, 80.41883800, '', '2026-05-13 13:49:22'),
(623, 7, 7.75293530, 80.41665490, '', '2026-05-13 13:56:12'),
(624, 7, 7.81578560, 80.40458920, '', '2026-05-13 15:14:51'),
(625, 7, 7.81578560, 80.40458920, '', '2026-05-13 15:15:07'),
(626, 7, 7.81729960, 80.40494520, '', '2026-05-13 15:24:03'),
(627, 7, 7.82304540, 80.40561150, 'invoice_created', '2026-05-13 15:25:25'),
(628, 7, 7.77056740, 80.39256250, '', '2026-05-13 15:39:46'),
(629, 7, 7.76613630, 80.39152370, 'invoice_created', '2026-05-13 15:40:20'),
(630, 7, 7.76416220, 80.39126930, '', '2026-05-13 15:40:59'),
(631, 7, 7.74379230, 80.38133120, '', '2026-05-13 15:44:15'),
(632, 7, 7.64966650, 80.37158320, '', '2026-05-13 16:21:15'),
(633, 7, 7.64706600, 80.37157130, '', '2026-05-13 16:21:33'),
(634, 7, 7.63985730, 80.37253220, 'invoice_created', '2026-05-13 16:22:32'),
(635, 7, 7.63922080, 80.37255340, '', '2026-05-13 16:22:36'),
(636, 7, 7.45213490, 80.34941350, '', '2026-05-13 17:28:26'),
(637, 7, 7.45213490, 80.34941350, '', '2026-05-13 17:28:26'),
(638, 7, 7.45213580, 80.34940760, '', '2026-05-13 17:29:30'),
(639, 7, 7.45213580, 80.34940760, '', '2026-05-13 17:34:49'),
(640, 7, 7.45213550, 80.34940830, '', '2026-05-13 17:36:49'),
(641, 7, 7.45213560, 80.34941480, '', '2026-05-13 17:37:13'),
(642, 7, 7.45226660, 80.34689740, '', '2026-05-14 09:02:12'),
(643, 7, 7.31735250, 80.39377190, '', '2026-05-14 10:52:04'),
(644, 7, 7.31725020, 80.39350490, '', '2026-05-14 10:54:05'),
(645, 7, 7.45213270, 80.34941360, '', '2026-05-14 15:54:59'),
(646, 7, 7.45213410, 80.34940850, 'invoice_created', '2026-05-14 15:55:14'),
(647, 7, 7.45213470, 80.34941330, '', '2026-05-14 15:55:19'),
(648, 7, 7.45213500, 80.34940970, '', '2026-05-14 15:56:23'),
(649, 7, 7.45213320, 80.34953990, '', '2026-05-15 09:22:01'),
(650, 7, 7.45213340, 80.34943520, '', '2026-05-15 09:22:08'),
(651, 7, 7.48866980, 80.36366010, 'invoice_created', '2026-05-15 11:02:20'),
(652, 7, 7.48879440, 80.36363850, '', '2026-05-15 11:02:25'),
(653, 7, 7.48927800, 80.36392490, '', '2026-05-15 11:43:36'),
(654, 7, 7.48923910, 80.36393400, '', '2026-05-15 11:44:17'),
(655, 7, 7.48927890, 80.36391990, 'invoice_created', '2026-05-15 11:44:39'),
(656, 7, 7.48759160, 80.36762430, '', '2026-05-15 12:40:05'),
(657, 7, 7.48759160, 80.36762430, '', '2026-05-15 12:40:05'),
(658, 7, 7.48759100, 80.36762100, '', '2026-05-15 12:49:37'),
(659, 7, 7.48758920, 80.36762080, 'invoice_created', '2026-05-15 13:00:06'),
(660, 7, 7.48758990, 80.36762280, '', '2026-05-15 13:00:36'),
(661, 7, 7.49509120, 80.36068420, '', '2026-05-15 13:50:51'),
(662, 7, 7.46451550, 80.35800480, '', '2026-05-15 15:00:06'),
(663, 7, 7.46261860, 80.35553960, 'invoice_created', '2026-05-15 15:00:40'),
(664, 7, 7.46249630, 80.35539650, '', '2026-05-15 15:00:48'),
(665, 7, 7.46220090, 80.35501860, '', '2026-05-15 15:00:54'),
(666, 7, 7.46215390, 80.35436020, '', '2026-05-15 15:01:04'),
(667, 7, 7.46208510, 80.35430700, '', '2026-05-15 15:01:08'),
(668, 7, 7.46208510, 80.35430700, '', '2026-05-15 15:01:35'),
(669, 7, 7.44549850, 80.34428000, 'invoice_created', '2026-05-15 15:47:24'),
(670, 7, 7.47102820, 80.35485030, '', '2026-05-15 16:39:41'),
(671, 7, 7.47098210, 80.35486950, 'invoice_created', '2026-05-15 16:41:18'),
(672, 7, 7.47097940, 80.35489850, '', '2026-05-15 16:41:21'),
(673, 7, 7.47091910, 80.35484470, '', '2026-05-15 16:41:25'),
(674, 7, 7.47102840, 80.35485240, '', '2026-05-15 16:41:55'),
(675, 7, 7.45213680, 80.34940650, '', '2026-05-15 17:08:58'),
(676, 7, 7.45213560, 80.34941170, '', '2026-05-15 17:09:04'),
(677, 7, 7.45213540, 80.34941160, '', '2026-05-15 17:16:04'),
(678, 7, 7.45213680, 80.34940630, '', '2026-05-15 17:18:16'),
(679, 7, 7.45214130, 80.34941190, '', '2026-05-15 17:18:22'),
(680, 7, 7.45213510, 80.34941060, 'invoice_created', '2026-05-15 17:18:40'),
(681, 7, 7.45213560, 80.34941060, '', '2026-05-15 17:19:18'),
(682, 7, 7.45213710, 80.34940670, '', '2026-05-15 17:20:46'),
(683, 7, 7.45213500, 80.34940190, '', '2026-05-15 17:22:46'),
(684, 7, 7.45213530, 80.34941520, '', '2026-05-15 17:23:29'),
(685, 7, 7.45214800, 80.34942850, 'invoice_created', '2026-05-15 17:23:59'),
(686, 7, 7.45213660, 80.34940610, '', '2026-05-15 17:24:17'),
(687, 7, 7.45213820, 80.34941170, '', '2026-05-15 17:26:16'),
(688, 7, 7.45213680, 80.34940650, '', '2026-05-15 17:27:14'),
(689, 7, 7.45213510, 80.34941000, '', '2026-05-15 17:28:42'),
(690, 7, 7.45214800, 80.34943460, '', '2026-05-15 17:33:45'),
(691, 7, 7.45213340, 80.34941310, '', '2026-05-15 17:38:23'),
(692, 7, 7.45214770, 80.34942360, '', '2026-05-15 17:44:40'),
(693, 7, 7.45213660, 80.34941070, '', '2026-05-15 17:44:46'),
(694, 7, 7.45213640, 80.34941770, '', '2026-05-15 17:45:05'),
(695, 7, 7.45213900, 80.34941270, '', '2026-05-15 17:45:10'),
(696, 7, 7.45213900, 80.34941270, '', '2026-05-15 17:47:15'),
(697, 7, 7.45213630, 80.34940380, '', '2026-05-15 17:49:07'),
(698, 7, 7.45213630, 80.34941810, '', '2026-05-15 18:00:40'),
(699, 7, 7.45213440, 80.34940760, '', '2026-05-15 18:02:27'),
(700, 7, 7.45213850, 80.34944210, '', '2026-05-16 09:08:24'),
(701, 7, 7.45214140, 80.34948050, '', '2026-05-16 09:08:30'),
(702, 7, 7.45263500, 80.34812200, '', '2026-05-16 10:44:47'),
(703, 7, 7.45263500, 80.34812200, '', '2026-05-16 10:45:48'),
(704, 7, 7.45213700, 80.34940560, '', '2026-05-16 19:31:36'),
(705, 7, 7.45213620, 80.34940340, '', '2026-05-16 19:31:49'),
(706, 7, 7.45213600, 80.34941110, '', '2026-05-16 19:32:40'),
(707, 7, 7.45213600, 80.34941000, 'invoice_created', '2026-05-16 19:34:09'),
(708, 7, 7.45214660, 80.34942930, '', '2026-05-16 19:34:15'),
(709, 7, 7.45213580, 80.34941810, '', '2026-05-16 19:35:07'),
(710, 7, 7.45213690, 80.34941790, 'invoice_created', '2026-05-16 19:35:21'),
(711, 7, 7.45213650, 80.34940710, '', '2026-05-16 19:35:27'),
(712, 7, 7.45213520, 80.34940730, 'invoice_created', '2026-05-16 19:36:18'),
(713, 7, 7.45213580, 80.34941010, '', '2026-05-16 19:37:22'),
(714, 7, 7.45213640, 80.34941160, 'invoice_created', '2026-05-16 19:37:35'),
(715, 7, 7.45213890, 80.34942290, '', '2026-05-16 19:37:41'),
(716, 7, 7.45214430, 80.34943120, '', '2026-05-16 19:38:31'),
(717, 7, 7.45213730, 80.34942550, 'invoice_created', '2026-05-16 19:38:50'),
(718, 7, 7.45214810, 80.34943760, '', '2026-05-16 19:38:55'),
(719, 7, 7.45213940, 80.34941640, '', '2026-05-16 19:39:29'),
(720, 7, 7.45214100, 80.34942380, 'invoice_created', '2026-05-16 19:39:55'),
(721, 7, 7.45215110, 80.34944640, '', '2026-05-16 19:40:02'),
(722, 7, 7.45213990, 80.34941310, '', '2026-05-16 19:40:48'),
(723, 7, 7.45213710, 80.34940670, 'invoice_created', '2026-05-16 19:41:24'),
(724, 7, 7.45213640, 80.34940460, '', '2026-05-16 19:41:30'),
(725, 7, 7.45214560, 80.34942710, '', '2026-05-16 19:42:56'),
(726, 7, 7.45214340, 80.34942620, '', '2026-05-16 19:45:05'),
(727, 7, 7.45213790, 80.34940740, 'invoice_created', '2026-05-16 19:48:10'),
(728, 7, 7.45213610, 80.34941800, '', '2026-05-16 19:48:29'),
(729, 7, 7.45213410, 80.34940830, '', '2026-05-16 19:50:28'),
(730, 7, 7.45213570, 80.34941710, '', '2026-05-16 19:52:29'),
(731, 7, 7.45213660, 80.34941230, '', '2026-05-16 19:52:39'),
(732, 7, 7.45263500, 80.34812200, '', '2026-05-18 09:35:33'),
(733, 7, 7.45263500, 80.34812200, '', '2026-05-18 09:35:44'),
(734, 7, 7.30208410, 80.23824360, '', '2026-05-18 10:54:50'),
(735, 7, 7.30208660, 80.23824590, 'invoice_created', '2026-05-18 10:55:10'),
(736, 7, 7.30208700, 80.23824580, '', '2026-05-18 10:55:26'),
(737, 7, 7.30205270, 80.23815270, '', '2026-05-18 10:55:30'),
(738, 7, 7.24406300, 80.21297850, 'invoice_created', '2026-05-18 12:53:49'),
(739, 7, 7.24406400, 80.21297870, '', '2026-05-18 12:53:56'),
(740, 7, 7.24397150, 80.21307960, '', '2026-05-18 13:02:08'),
(741, 7, 7.45215760, 80.34939100, '', '2026-05-19 08:56:25'),
(742, 7, 7.50116520, 80.33419550, '', '2026-05-19 09:31:01'),
(743, 7, 7.50220360, 80.33424130, 'invoice_created', '2026-05-19 09:31:19'),
(744, 7, 7.58189870, 80.28021010, 'invoice_created', '2026-05-19 10:32:09'),
(745, 7, 7.59457600, 80.26850180, '', '2026-05-19 11:12:30'),
(746, 7, 7.52304680, 80.36148870, '', '2026-05-19 16:57:39'),
(747, 7, 7.51234710, 80.36366460, 'invoice_created', '2026-05-19 17:00:27'),
(748, 7, 7.51233990, 80.36368960, '', '2026-05-19 17:00:34'),
(749, 7, 7.45215430, 80.34967860, '', '2026-05-19 17:25:04'),
(750, 7, 7.45215410, 80.34967600, '', '2026-05-19 17:25:44'),
(751, 7, 7.45214570, 80.34950260, '', '2026-05-22 09:32:08'),
(752, 7, 7.48816170, 80.36053180, '', '2026-05-22 11:37:10'),
(753, 7, 7.48816170, 80.36053180, '', '2026-05-22 11:37:10'),
(754, 7, 7.48816170, 80.36053180, '', '2026-05-22 11:37:10'),
(755, 7, 7.48816170, 80.36053180, '', '2026-05-22 11:37:10'),
(756, 7, 7.45263500, 80.34812200, '', '2026-05-22 11:47:11'),
(757, 7, 7.45263500, 80.34812200, '', '2026-05-22 11:49:12'),
(758, 7, 7.48819630, 80.36057300, 'invoice_created', '2026-05-22 11:49:37'),
(759, 7, 7.48815420, 80.36038010, 'invoice_created', '2026-05-22 11:50:34'),
(760, 7, 7.48812480, 80.36011980, '', '2026-05-22 11:50:40'),
(761, 7, 7.45263500, 80.34812200, '', '2026-05-22 11:51:12'),
(762, 7, 7.45263500, 80.34812200, '', '2026-05-22 11:53:11'),
(763, 7, 7.49481990, 80.35789530, '', '2026-05-22 12:10:36'),
(764, 7, 7.49481990, 80.35789530, '', '2026-05-22 12:10:36'),
(765, 7, 7.49481640, 80.35789540, '', '2026-05-22 12:10:42'),
(766, 7, 7.49610250, 80.35925550, '', '2026-05-22 12:12:00'),
(767, 7, 7.49482010, 80.35789420, 'invoice_created', '2026-05-22 12:12:33'),
(768, 7, 7.48348010, 80.36722010, '', '2026-05-22 14:19:09'),
(769, 7, 7.48565940, 80.36577290, 'invoice_created', '2026-05-22 14:20:17'),
(770, 7, 7.47646540, 80.35640850, '', '2026-05-22 15:31:33'),
(771, 7, 7.46985370, 80.35707660, 'invoice_created', '2026-05-22 15:51:35'),
(772, 7, 7.47459950, 80.35483380, '', '2026-05-22 16:35:27'),
(773, 7, 7.47459950, 80.35483380, '', '2026-05-22 16:35:27'),
(774, 7, 7.47456140, 80.35482930, 'invoice_created', '2026-05-22 16:44:59'),
(775, 7, 7.47507820, 80.35453780, '', '2026-05-22 16:45:19'),
(776, 7, 7.45217720, 80.34957700, '', '2026-05-22 17:09:55'),
(777, 7, 7.45213850, 80.34942010, '', '2026-05-22 17:12:24'),
(778, 7, 7.45213600, 80.34940390, '', '2026-05-22 17:14:32'),
(779, 7, 7.45213720, 80.34940660, '', '2026-05-22 17:14:47'),
(780, 7, 7.45213720, 80.34940670, '', '2026-05-22 17:15:47'),
(781, 7, 7.45214850, 80.34971550, '', '2026-05-23 09:35:05'),
(782, 7, 7.47889450, 80.35716990, 'invoice_created', '2026-05-23 10:54:25'),
(783, 7, 7.42150830, 80.46610600, 'invoice_created', '2026-05-23 11:09:11'),
(784, 7, 7.52160650, 80.33534090, '', '2026-05-23 12:37:42'),
(785, 7, 7.52160690, 80.33534080, '', '2026-05-23 12:39:53'),
(786, 7, 7.52160690, 80.33534070, 'invoice_created', '2026-05-23 12:40:37'),
(787, 7, 7.48060290, 80.36263240, '', '2026-05-23 17:05:54'),
(788, 7, 7.48157540, 80.36071840, '', '2026-05-23 17:07:17'),
(789, 7, 7.45213660, 80.34941590, '', '2026-05-23 17:29:54'),
(790, 7, 7.45213450, 80.34941030, '', '2026-05-23 17:32:20'),
(791, 7, 7.45213650, 80.34941930, '', '2026-05-23 17:32:33'),
(792, 7, 7.45213950, 80.34941490, '', '2026-05-23 17:32:51'),
(793, 7, 7.45215300, 80.34961050, '', '2026-05-25 09:01:46'),
(794, 7, 7.45214100, 80.34953590, '', '2026-05-25 09:01:51'),
(795, 7, 7.45216190, 80.34944420, '', '2026-05-25 09:02:23'),
(796, 7, 7.60726070, 80.48311220, '', '2026-05-25 13:14:07'),
(797, 7, 7.60726070, 80.48311210, 'invoice_created', '2026-05-25 13:20:45'),
(798, 7, 7.53771910, 80.43981870, '', '2026-05-25 15:33:26'),
(799, 7, 7.53689660, 80.43922770, '', '2026-05-25 15:37:14'),
(800, 7, 7.53694050, 80.43938050, 'invoice_created', '2026-05-25 15:43:18'),
(801, 7, 7.53689520, 80.43922870, '', '2026-05-25 15:46:02'),
(802, 7, 7.53508880, 80.43818260, '', '2026-05-25 15:46:29'),
(803, 7, 7.53138030, 80.43524920, 'invoice_created', '2026-05-25 15:47:21'),
(804, 7, 7.47768160, 80.38342420, '', '2026-05-25 16:45:02'),
(805, 7, 7.45213510, 80.34940800, '', '2026-05-25 17:39:54'),
(806, 7, 7.45213510, 80.34941130, '', '2026-05-25 17:41:14'),
(807, 7, 7.45213580, 80.34941130, '', '2026-05-25 17:42:10'),
(808, 7, 7.45216620, 80.34957940, '', '2026-05-26 09:22:32'),
(809, 7, 7.44747810, 80.34321770, '', '2026-05-26 09:30:35'),
(810, 7, 7.44530420, 80.34236400, '', '2026-05-26 09:34:16'),
(811, 7, 7.44530420, 80.34236400, '', '2026-05-26 09:34:16'),
(812, 7, 7.44430310, 80.34241190, '', '2026-05-26 09:34:26'),
(813, 7, 7.33449280, 80.29882630, '', '2026-05-26 10:04:40'),
(814, 7, 7.33442870, 80.29882520, '', '2026-05-26 10:06:07'),
(815, 7, 7.33452030, 80.29894970, 'invoice_created', '2026-05-26 10:07:04'),
(816, 7, 7.37678040, 80.31930510, 'invoice_created', '2026-05-26 15:08:51'),
(817, 7, 7.45039320, 80.34478280, '', '2026-05-26 17:02:45'),
(818, 7, 7.45021030, 80.34467480, '', '2026-05-26 17:03:25'),
(819, 7, 7.45213550, 80.34941430, '', '2026-05-26 17:26:28'),
(820, 7, 7.45213470, 80.34941620, '', '2026-05-26 17:30:40'),
(821, 7, 7.45213580, 80.34941090, '', '2026-05-26 17:30:46'),
(822, 7, 7.45213490, 80.34940960, '', '2026-05-26 17:31:22'),
(823, 7, 7.45213460, 80.34940740, '', '2026-05-26 17:33:22'),
(824, 7, 7.45213570, 80.34941320, '', '2026-05-26 17:35:22'),
(825, 7, 7.45213650, 80.34940300, '', '2026-05-26 17:36:42'),
(826, 7, 7.49594030, 80.37103370, '', '2026-05-27 09:29:17'),
(827, 7, 7.54929500, 80.37010240, '', '2026-05-27 09:51:24'),
(828, 7, 7.54929500, 80.37010240, '', '2026-05-27 09:51:24'),
(829, 7, 7.54947240, 80.37007360, 'invoice_created', '2026-05-27 09:53:09'),
(830, 7, 7.65659460, 80.37025200, '', '2026-05-27 12:11:52'),
(831, 7, 7.61771670, 80.36928630, '', '2026-05-27 14:14:03'),
(832, 7, 7.45213970, 80.34944220, '', '2026-05-27 16:52:11'),
(833, 7, 7.45213610, 80.34941820, '', '2026-05-27 16:52:36'),
(834, 7, 7.45214530, 80.34942310, '', '2026-05-28 09:30:39'),
(835, 7, 7.45214520, 80.34952400, '', '2026-05-28 09:30:42'),
(836, 7, 7.41526390, 80.36573090, 'invoice_created', '2026-05-28 10:18:20'),
(837, 7, 7.41534430, 80.36558740, '', '2026-05-28 10:42:51'),
(838, 7, 7.41531960, 80.36545230, 'invoice_created', '2026-05-28 10:44:24'),
(839, 7, 7.38820630, 80.39160720, '', '2026-05-28 11:21:44'),
(840, 7, 7.22478410, 80.19905930, '', '2026-05-28 12:35:58'),
(841, 7, 7.32269950, 80.39434730, '', '2026-05-28 13:52:27'),
(842, 7, 7.32268300, 80.39432810, '', '2026-05-28 13:55:13'),
(843, 7, 7.32269040, 80.39434290, '', '2026-05-28 13:56:26'),
(844, 7, 7.31533840, 80.39215200, '', '2026-05-28 15:29:04'),
(845, 7, 7.31529920, 80.39211740, '', '2026-05-28 15:34:32'),
(846, 7, 7.31103680, 80.38906830, '', '2026-05-28 15:53:36'),
(847, 7, 7.31095210, 80.38913410, 'invoice_created', '2026-05-28 15:57:56'),
(848, 7, 7.32766050, 80.40457110, '', '2026-05-28 16:49:04'),
(849, 7, 7.32748850, 80.40450000, 'invoice_created', '2026-05-28 17:00:54'),
(850, 7, 7.32723480, 80.40359150, '', '2026-05-28 17:01:12'),
(851, 7, 7.32244030, 80.39767130, '', '2026-05-28 17:02:02'),
(852, 7, 7.32327950, 80.39686990, 'invoice_created', '2026-05-28 17:02:22'),
(853, 7, 7.32282390, 80.39470710, '', '2026-05-28 17:02:43'),
(854, 7, 7.32247260, 80.39074850, 'invoice_created', '2026-05-28 17:03:48'),
(855, 7, 7.32425740, 80.38842320, '', '2026-05-28 17:04:37'),
(856, 7, 7.45239500, 80.34759250, '', '2026-05-28 17:32:08'),
(857, 7, 7.45213860, 80.34940820, '', '2026-05-28 17:42:03'),
(858, 7, 7.45213600, 80.34940550, '', '2026-05-28 17:43:52'),
(859, 7, 7.45213900, 80.34941400, '', '2026-05-28 17:45:52'),
(860, 7, 7.45213730, 80.34940650, '', '2026-05-28 17:46:26'),
(861, 7, 7.45213700, 80.34940650, '', '2026-05-28 17:46:32'),
(862, 7, 7.45213560, 80.34941340, '', '2026-05-28 17:48:28'),
(863, 7, 7.45213760, 80.34941270, '', '2026-05-28 17:54:16'),
(864, 7, 7.45213730, 80.34940860, '', '2026-05-28 17:55:33'),
(865, 7, 7.45213550, 80.34941200, '', '2026-05-28 17:57:03'),
(866, 7, 7.45213790, 80.34940760, '', '2026-05-28 17:57:33'),
(867, 7, 7.49766180, 80.47239230, 'invoice_created', '2026-05-29 15:36:40'),
(868, 7, 7.49765980, 80.47237110, '', '2026-05-29 15:36:45'),
(869, 7, 7.49774460, 80.47232430, 'invoice_created', '2026-05-29 15:38:12'),
(870, 7, 7.49775480, 80.47232410, '', '2026-05-29 15:38:15'),
(871, 7, 7.49775390, 80.47232660, '', '2026-05-29 15:38:18'),
(872, 7, 7.45294980, 80.34759350, '', '2026-05-29 18:34:09'),
(873, 7, 7.45213650, 80.34941620, '', '2026-05-29 18:34:16'),
(874, 7, 7.45213660, 80.34941180, '', '2026-05-29 18:36:08'),
(875, 7, 7.45213840, 80.34940870, '', '2026-05-29 18:36:48'),
(876, 7, 7.45214250, 80.34941840, '', '2026-05-29 18:37:05'),
(877, 7, 7.45213850, 80.34941780, '', '2026-05-29 18:37:59'),
(878, 7, 7.84811880, 80.39486010, '', '2026-06-02 15:10:28'),
(879, 7, 7.84807350, 80.39502590, 'invoice_created', '2026-06-02 15:11:47'),
(880, 7, 7.84811760, 80.39503800, '', '2026-06-02 15:16:02'),
(881, 7, 7.84812820, 80.39510960, '', '2026-06-02 15:16:06'),
(882, 7, 7.84808850, 80.39502560, '', '2026-06-02 15:22:15'),
(883, 7, 7.84815930, 80.39515940, '', '2026-06-02 15:22:23'),
(884, 7, 7.84816800, 80.39515150, '', '2026-06-02 15:23:33'),
(885, 7, 7.84816600, 80.39512990, '', '2026-06-02 15:23:43'),
(886, 7, 7.84813850, 80.39510190, '', '2026-06-02 15:23:46'),
(887, 7, 7.84814260, 80.39506690, '', '2026-06-02 15:25:23'),
(888, 7, 7.84813760, 80.39506750, 'invoice_created', '2026-06-02 15:25:55'),
(889, 7, 7.84813410, 80.39508960, '', '2026-06-02 15:25:58'),
(890, 7, 7.45213610, 80.34940770, '', '2026-06-02 18:05:26'),
(891, 7, 7.45213420, 80.34941240, '', '2026-06-02 18:07:04'),
(892, 7, 7.45213580, 80.34940760, '', '2026-06-02 18:07:26'),
(893, 7, 7.45213920, 80.34945500, '', '2026-06-02 18:07:37'),
(894, 7, 7.45213540, 80.34940930, '', '2026-06-02 18:09:45'),
(895, 7, 7.45213760, 80.34942120, '', '2026-06-02 18:09:59'),
(896, 7, 7.47350250, 80.32785830, '', '2026-06-03 09:45:31'),
(897, 7, 7.47351690, 80.32768560, '', '2026-06-03 09:52:18'),
(898, 7, 7.47351690, 80.32768560, '', '2026-06-03 09:52:18'),
(899, 7, 7.44599150, 80.25209450, 'invoice_created', '2026-06-03 11:02:27'),
(900, 7, 7.42750890, 80.21416530, '', '2026-06-03 12:55:43'),
(901, 7, 7.42749610, 80.21416270, 'invoice_created', '2026-06-03 12:58:09'),
(902, 7, 7.42779460, 80.21317700, '', '2026-06-03 13:28:07'),
(903, 7, 7.42778710, 80.21318620, 'invoice_created', '2026-06-03 13:30:48'),
(904, 7, 7.42780520, 80.21318640, '', '2026-06-03 13:39:57'),
(905, 7, 7.41885170, 80.25335810, 'invoice_created', '2026-06-03 14:54:40'),
(906, 7, 7.42667840, 80.24638910, '', '2026-06-03 15:20:52'),
(907, 7, 7.42672950, 80.24647900, '', '2026-06-03 15:24:30'),
(908, 7, 7.42667000, 80.24652330, 'invoice_created', '2026-06-03 15:25:10'),
(909, 7, 7.42670650, 80.24652780, '', '2026-06-03 15:25:27'),
(910, 7, 7.42670600, 80.24652910, '', '2026-06-03 15:25:29'),
(911, 7, 7.43749600, 80.23844390, '', '2026-06-03 15:29:31'),
(912, 7, 7.45294980, 80.34759350, '', '2026-06-03 17:30:04'),
(913, 7, 7.59183670, 80.47928290, '', '2026-06-04 12:21:09'),
(914, 7, 7.59702240, 80.48099390, 'invoice_created', '2026-06-04 12:22:40'),
(915, 7, 7.60612950, 80.48254240, 'invoice_created', '2026-06-04 12:24:04'),
(916, 7, 7.58558559, 80.48815317, 'invoice_created', '2026-06-04 12:25:45'),
(917, 7, 7.73549320, 80.55111770, 'invoice_created', '2026-06-04 16:27:59'),
(918, 7, 7.70267900, 80.54363270, 'invoice_created', '2026-06-04 16:32:34'),
(919, 7, 7.69916200, 80.54134690, '', '2026-06-04 16:33:11'),
(920, 7, 7.67969840, 80.53690190, 'invoice_created', '2026-06-04 16:36:33'),
(921, 7, 7.45395180, 80.34759350, '', '2026-06-04 18:03:29'),
(922, 7, 7.30974950, 80.26330910, '', '2026-06-05 14:21:50'),
(923, 7, 7.30965430, 80.26322790, 'invoice_created', '2026-06-05 14:23:40'),
(924, 7, 7.30967050, 80.26327070, 'invoice_created', '2026-06-05 14:24:21'),
(925, 7, 7.30971530, 80.26327680, '', '2026-06-05 14:25:05'),
(926, 7, 7.30986120, 80.26343370, '', '2026-06-05 14:26:01'),
(927, 7, 7.49151490, 80.36555490, '', '2026-06-05 16:46:18'),
(928, 7, 7.49138010, 80.36569600, '', '2026-06-05 16:46:29'),
(929, 7, 7.48767130, 80.36510760, 'invoice_created', '2026-06-05 16:48:00'),
(930, 7, 7.48778600, 80.36518800, '', '2026-06-05 16:48:06'),
(931, 7, 7.48785370, 80.36518140, '', '2026-06-05 16:48:33'),
(932, 7, 7.48246450, 80.36158550, '', '2026-06-05 16:55:11'),
(933, 7, 7.47272780, 80.35085820, '', '2026-06-05 17:01:52'),
(934, 7, 7.45213630, 80.34955020, '', '2026-06-05 17:09:19'),
(935, 7, 7.50082410, 80.44385820, '', '2026-06-08 11:57:15'),
(936, 7, 7.50082360, 80.44385830, 'invoice_created', '2026-06-08 11:59:05'),
(937, 7, 7.48833220, 80.51392300, '', '2026-06-08 16:46:19'),
(938, 7, 7.48833340, 80.51392750, 'invoice_created', '2026-06-08 16:47:41'),
(939, 7, 7.51019810, 80.46160180, '', '2026-06-08 16:51:30'),
(940, 7, 7.50218090, 80.44756950, 'invoice_created', '2026-06-08 16:53:14'),
(941, 7, 7.49944910, 80.44105100, '', '2026-06-08 16:54:27'),
(942, 7, 7.47709400, 80.37224440, '', '2026-06-08 17:11:15'),
(943, 7, 7.47709400, 80.37224440, '', '2026-06-08 17:11:15'),
(944, 7, 7.47707760, 80.37226120, '', '2026-06-08 17:11:20'),
(945, 7, 7.47702500, 80.37223400, '', '2026-06-08 17:11:29'),
(946, 7, 7.47701470, 80.37215370, '', '2026-06-08 17:17:45'),
(947, 7, 7.47703530, 80.37216750, '', '2026-06-08 17:18:07'),
(948, 7, 7.45678400, 80.34618110, '', '2026-06-08 17:31:52'),
(949, 7, 7.45367420, 80.34614980, '', '2026-06-08 17:32:18'),
(950, 7, 7.45206470, 80.34719250, '', '2026-06-08 17:33:29'),
(951, 7, 7.45247580, 80.34869180, 'invoice_created', '2026-06-08 17:34:05'),
(952, 7, 7.45213850, 80.34941970, '', '2026-06-08 17:37:42'),
(953, 7, 7.45213850, 80.34941970, '', '2026-06-08 17:37:42'),
(954, 7, 7.45213710, 80.34941500, '', '2026-06-08 17:37:50'),
(955, 7, 7.45213550, 80.34941280, '', '2026-06-08 17:39:49'),
(956, 7, 7.45213870, 80.34941820, '', '2026-06-08 17:59:17'),
(957, 7, 7.45213520, 80.34940650, '', '2026-06-08 18:01:08'),
(958, 7, 7.45214340, 80.34942340, '', '2026-06-08 18:03:08'),
(959, 7, 7.45213700, 80.34940650, '', '2026-06-08 18:04:18'),
(960, 7, 7.42151170, 80.46610500, 'invoice_created', '2026-06-09 11:03:05'),
(961, 7, 7.38851320, 80.51862890, 'invoice_created', '2026-06-09 16:51:30'),
(962, 7, 7.38857180, 80.51880360, '', '2026-06-09 16:51:33'),
(963, 7, 7.38880540, 80.51890570, '', '2026-06-09 16:51:36'),
(964, 7, 7.39334700, 80.51557510, '', '2026-06-09 16:53:00'),
(965, 7, 7.43096770, 80.44956350, '', '2026-06-09 17:11:41');
INSERT INTO `rep_location_logs` (`id`, `user_id`, `latitude`, `longitude`, `activity_type`, `timestamp`) VALUES
(966, 7, 7.43136900, 80.44875760, '', '2026-06-09 17:12:03'),
(967, 7, 7.43419530, 80.44396650, '', '2026-06-09 17:13:41'),
(968, 7, 7.48111460, 80.36211140, '', '2026-06-09 17:34:53'),
(969, 7, 7.48153740, 80.36116620, '', '2026-06-09 17:35:15'),
(970, 7, 7.45213910, 80.34940890, '', '2026-06-09 17:54:45'),
(971, 7, 7.45213910, 80.34940890, '', '2026-06-09 17:54:45'),
(972, 7, 7.45214880, 80.34949900, '', '2026-06-09 17:55:52'),
(973, 7, 7.41469000, 80.39304100, '', '2026-06-10 16:03:47'),
(974, 7, 7.41450610, 80.39289500, '', '2026-06-10 16:04:07'),
(975, 7, 7.41346700, 80.39173640, '', '2026-06-10 16:05:00'),
(976, 7, 7.41445650, 80.39285200, '', '2026-06-10 16:05:03'),
(977, 7, 7.41834240, 80.36172540, '', '2026-06-10 16:22:08'),
(978, 7, 7.41834490, 80.36173800, '', '2026-06-10 16:22:40'),
(979, 7, 7.41834300, 80.36172770, 'invoice_created', '2026-06-10 16:24:10'),
(980, 7, 7.41836150, 80.36172740, '', '2026-06-10 16:24:20'),
(981, 7, 7.43231380, 80.33541040, '', '2026-06-10 16:35:57'),
(982, 7, 7.43231380, 80.33541040, '', '2026-06-10 16:35:57'),
(983, 7, 7.44343000, 80.34150260, 'invoice_created', '2026-06-10 16:37:22'),
(984, 7, 7.44455680, 80.34182130, '', '2026-06-10 16:37:33'),
(985, 7, 7.45213510, 80.34940940, '', '2026-06-10 17:01:06'),
(986, 7, 7.45213850, 80.34942750, '', '2026-06-10 17:04:20'),
(987, 7, 7.45213660, 80.34940590, '', '2026-06-10 17:05:43'),
(988, 7, 7.45213580, 80.34940520, '', '2026-06-10 17:06:14'),
(989, 7, 7.45215350, 80.34942410, '', '2026-06-10 17:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `rep_routes`
--

CREATE TABLE `rep_routes` (
  `id` int(11) NOT NULL,
  `rep_id` int(11) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `route_id` int(11) NOT NULL,
  `assign_date` date NOT NULL,
  `status` enum('assigned','accepted','rejected','completed','unloaded') DEFAULT 'assigned',
  `start_meter` decimal(8,1) DEFAULT NULL,
  `end_meter` decimal(8,1) DEFAULT NULL,
  `expected_cash` decimal(12,2) DEFAULT NULL,
  `actual_cash` decimal(12,2) DEFAULT NULL,
  `expected_bank` decimal(12,2) DEFAULT NULL,
  `actual_bank` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `cash_5000` int(11) DEFAULT 0,
  `cash_2000` int(11) DEFAULT 0,
  `cash_1000` int(11) DEFAULT 0,
  `cash_500` int(11) DEFAULT 0,
  `cash_100` int(11) DEFAULT 0,
  `cash_50` int(11) DEFAULT 0,
  `cash_20` int(11) DEFAULT 0,
  `cash_coins` decimal(12,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rep_routes`
--

INSERT INTO `rep_routes` (`id`, `rep_id`, `driver_id`, `route_id`, `assign_date`, `status`, `start_meter`, `end_meter`, `expected_cash`, `actual_cash`, `expected_bank`, `actual_bank`, `created_at`, `cash_5000`, `cash_2000`, `cash_1000`, `cash_500`, `cash_100`, `cash_50`, `cash_20`, `cash_coins`) VALUES
(5, 7, 4, 7, '2026-05-05', 'unloaded', 24611.5, 24614.3, 13995.00, 14010.00, 0.00, NULL, '2026-05-05 18:54:43', 0, 0, 0, 0, 0, 0, 0, 0.00),
(7, 7, 4, 8, '2026-05-06', 'unloaded', 24614.3, 24618.1, 25278.00, 25290.00, 0.00, NULL, '2026-05-06 03:31:50', 0, 0, 0, 0, 0, 0, 0, 0.00),
(9, 7, 4, 10, '2026-05-07', 'unloaded', 24618.1, 24624.9, 12636.00, 12640.00, 0.00, NULL, '2026-05-07 03:08:14', 0, 0, 0, 0, 0, 0, 0, 0.00),
(11, 7, 7, 11, '2026-05-08', 'unloaded', 24624.9, 24635.1, 8828.00, 8830.00, 0.00, NULL, '2026-05-08 03:15:49', 0, 0, 0, 0, 0, 0, 0, 0.00),
(12, 7, 7, 12, '2026-05-09', 'unloaded', 24635.1, 24646.1, 9725.00, 9730.00, 0.00, NULL, '2026-05-09 02:42:21', 0, 0, 0, 0, 0, 0, 0, 0.00),
(13, 7, 7, 13, '2026-05-11', 'unloaded', 24647.1, 24655.5, 3540.00, 3540.00, 0.00, NULL, '2026-05-11 02:58:59', 0, 0, 1, 3, 6, 4, 11, 0.00),
(14, 7, 7, 14, '2026-05-12', 'unloaded', 25520.5, 25552.8, 1560.00, 1580.00, 0.00, NULL, '2026-05-12 03:40:56', 0, 0, 0, 1, 5, 6, 14, 0.00),
(15, 7, 7, 15, '2026-05-13', 'unloaded', 24656.5, 24669.1, 4608.00, 4608.00, 0.00, NULL, '2026-05-13 03:29:40', 0, 0, 3, 1, 5, 7, 12, 18.00),
(16, 7, 7, 9, '2026-05-14', 'unloaded', 24669.1, 24679.9, 590.00, 590.00, 0.00, NULL, '2026-05-14 03:22:37', 0, 0, 0, 0, 5, 1, 2, 0.00),
(18, 7, 7, 17, '2026-05-15', 'unloaded', 24679.9, 24685.0, 0.00, 2280.00, 0.00, NULL, '2026-05-15 03:43:21', 0, 0, 0, 2, 11, 2, 4, 0.00),
(19, 7, 8, 18, '2026-05-16', 'unloaded', 24685.0, 24694.8, 4500.00, 4520.00, 0.00, NULL, '2026-05-16 03:33:15', 0, 0, 2, 3, 4, 4, 21, 0.00),
(20, 7, 7, 19, '2026-05-18', 'unloaded', 24694.8, 24705.1, 0.00, 1180.00, 0.00, NULL, '2026-05-18 03:36:42', 0, 0, 0, 2, 0, 2, 4, 0.00),
(21, 7, 7, 20, '2026-05-19', 'unloaded', 24705.1, 24715.0, 590.00, 590.00, 0.00, NULL, '2026-05-19 03:22:56', 0, 0, 0, 1, 0, 1, 2, 0.00),
(22, 7, 8, 17, '2026-05-22', 'unloaded', 24723.2, 24728.2, 2360.00, 2360.00, 0.00, NULL, '2026-05-22 03:57:40', 0, 0, 1, 2, 0, 4, 8, 0.00),
(23, 7, 8, 21, '2026-05-23', 'unloaded', 24728.2, 24738.9, 0.00, 140.00, 0.00, NULL, '2026-05-23 04:04:10', 0, 0, 0, 0, 1, 0, 2, 0.00),
(24, 7, 7, 11, '2026-05-25', 'unloaded', 24738.9, 24752.2, 1025.00, 1020.00, 0.00, NULL, '2026-05-25 03:31:07', 0, 0, 1, 0, 0, 0, 1, 5.00),
(25, 7, 7, 8, '2026-05-26', 'unloaded', 24752.2, 24763.1, 5380.00, 10420.00, 0.00, NULL, '2026-05-26 03:48:13', 0, 0, 2, 2, 73, 0, 6, 0.00),
(26, 7, 7, 22, '2026-05-27', 'unloaded', 24763.8, 24773.2, 0.00, 0.00, 0.00, NULL, '2026-05-27 03:12:41', 0, 0, 0, 0, 0, 0, 0, 0.00),
(27, 7, 7, 9, '2026-05-28', 'unloaded', 24773.2, 24779.6, 2930.00, 2930.00, 0.00, NULL, '2026-05-28 03:36:31', 0, 0, 2, 1, 3, 1, 3, 20.00),
(28, 7, 7, 23, '2026-05-29', 'unloaded', 24779.6, 24788.5, 1915.00, 1910.00, 0.00, NULL, '2026-05-29 03:43:31', 0, 0, 1, 1, 3, 1, 3, 5.00),
(29, 7, 7, 15, '2026-06-02', 'unloaded', 24794.7, 24807.3, 0.00, 2000.00, 0.00, NULL, '2026-06-02 03:34:18', 0, 1, 0, 0, 0, 0, 0, 0.00),
(30, 7, 7, 12, '2026-06-03', 'unloaded', 24807.9, 24814.1, 3975.00, 6970.00, 0.00, NULL, '2026-06-03 03:55:17', 0, 0, 6, 1, 4, 1, 1, 5.00),
(31, 7, 7, 24, '2026-06-04', 'unloaded', 24813.8, 24823.9, 0.00, 4790.00, 0.00, NULL, '2026-06-04 03:55:26', 0, 0, 1, 2, 27, 1, 2, 10.00),
(32, 7, 7, 25, '2026-06-05', 'unloaded', 24825.0, 24834.1, 4725.00, 4700.00, 0.00, NULL, '2026-06-05 03:44:41', 0, 0, 4, 1, 2, 0, 1, 5.00),
(33, 7, 7, 23, '2026-06-08', 'unloaded', 24834.7, 24843.7, 3940.00, 5930.00, 0.00, NULL, '2026-06-08 04:16:04', 0, 0, 4, 1, 12, 3, 4, 0.00),
(34, 7, 7, 21, '2026-06-09', 'unloaded', 24843.7, 24853.9, 1770.00, 4770.00, 0.00, NULL, '2026-06-09 03:50:24', 0, 0, 4, 0, 4, 3, 11, 0.00),
(35, 7, 7, 9, '2026-06-10', 'completed', 24853.9, 24863.9, 4140.00, 7140.00, NULL, NULL, '2026-06-10 03:28:39', 0, 0, 6, 1, 6, 0, 2, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `rep_sessions`
--

CREATE TABLE `rep_sessions` (
  `id` int(11) NOT NULL,
  `rep_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `start_meter` decimal(8,1) DEFAULT NULL,
  `end_meter` decimal(8,1) DEFAULT NULL,
  `cash_collected` decimal(12,2) DEFAULT 0.00,
  `cheque_amount` decimal(12,2) DEFAULT 0.00,
  `cheque_count` int(11) DEFAULT 0,
  `date` date NOT NULL,
  `status` enum('active','ended','dispatched') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rep_targets`
--

CREATE TABLE `rep_targets` (
  `id` int(11) NOT NULL,
  `rep_id` int(11) NOT NULL,
  `month` varchar(7) NOT NULL,
  `target_amount` decimal(12,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rep_targets`
--

INSERT INTO `rep_targets` (`id`, `rep_id`, `month`, `target_amount`, `created_at`) VALUES
(2, 7, '2026-05', 2000000.00, '2026-05-06 17:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `territory_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `territory_id`, `name`, `description`, `status`, `created_at`) VALUES
(7, 5, 'Kurunegala To Galapitamulla', '', 'active', '2026-05-05 04:33:22'),
(8, 1, 'Boyagane To Polgahawela', 'Covers from office location to Polgahawela Town', 'active', '2026-05-06 03:14:56'),
(9, 1, 'Dambokka To Rambukkana', '', 'active', '2026-05-07 02:46:52'),
(10, 2, 'Yanthampalawa To Pallandeniya', '', 'active', '2026-05-07 03:07:58'),
(11, 4, 'Dambulla Road', '', 'active', '2026-05-08 03:15:35'),
(12, 6, 'Negombo Road', '', 'active', '2026-05-09 02:42:03'),
(13, 3, 'Kandy Road', '', 'active', '2026-05-11 02:58:46'),
(14, 3, 'Galapitamulla To Rideegama', '', 'active', '2026-05-12 03:40:23'),
(15, 4, 'Ibbagamuwa Road Medagalla', '', 'active', '2026-05-13 03:29:20'),
(17, NULL, 'Kurunegala Town', '', 'active', '2026-05-15 03:43:04'),
(18, 5, 'Mallawapitiya Road Kavisigamuwa', '', 'active', '2026-05-16 03:30:37'),
(19, 1, 'Polgahawela To Alawwa', '', 'active', '2026-05-18 03:36:23'),
(20, 2, 'Yanthanpalawa To Wariyapola', '', 'active', '2026-05-19 03:22:33'),
(21, 3, 'Galagedara To Katugasthota', '', 'active', '2026-05-23 04:03:58'),
(22, 4, 'Wellawa To Hiripitiya', '', 'active', '2026-05-27 03:12:26'),
(23, 5, 'Mallawapitiya To Rideegama', '', 'active', '2026-05-29 03:42:30'),
(24, 4, 'Melsiripura To Galewela', '', 'active', '2026-06-04 03:38:36'),
(25, 1, 'Boyagane To Alawwa', '', 'active', '2026-06-05 03:44:18');

-- --------------------------------------------------------

--
-- Table structure for table `route_expenses`
--

CREATE TABLE `route_expenses` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route_expenses`
--

INSERT INTO `route_expenses` (`id`, `assignment_id`, `type`, `amount`, `description`, `created_at`) VALUES
(4, 7, 'Fuel', 5000.00, '', '2026-05-06 12:08:47'),
(5, 12, 'Fuel', 10000.00, '', '2026-05-09 12:48:14'),
(6, 14, 'Fuel', 5000.00, '', '2026-05-12 12:04:12'),
(7, 18, 'Fuel', 3000.00, '', '2026-05-15 09:31:02'),
(8, 18, 'Other', 100.00, '', '2026-05-15 12:15:03'),
(9, 20, 'Fuel', 8000.00, '', '2026-05-18 12:39:35'),
(10, 23, 'Fuel', 5000.00, '', '2026-05-23 12:02:30'),
(11, 25, 'Fuel', 5000.00, '', '2026-05-26 04:00:39'),
(12, 27, 'Fuel', 1500.00, '', '2026-05-28 12:16:24'),
(13, 29, 'Fuel', 5000.00, '', '2026-06-02 12:39:43'),
(14, 30, 'Fuel', 3000.00, '', '2026-06-03 11:58:48'),
(15, 31, 'Fuel', 5000.00, '', '2026-06-04 11:58:23'),
(16, 33, 'Fuel', 4000.00, '', '2026-06-08 11:41:27'),
(17, 34, 'Fuel', 3000.00, '', '2026-06-09 12:05:08'),
(18, 35, 'Fuel', 3000.00, '', '2026-06-10 11:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `route_loads`
--

CREATE TABLE `route_loads` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `loaded_qty` int(11) NOT NULL,
  `returned_qty` int(11) DEFAULT NULL,
  `short_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route_loads`
--

INSERT INTO `route_loads` (`id`, `assignment_id`, `product_id`, `loaded_qty`, `returned_qty`, `short_qty`) VALUES
(23, 22, 22, 12, NULL, NULL),
(24, 22, 14, 3, NULL, NULL),
(25, 27, 10, 48, NULL, NULL),
(26, 27, 6, 24, NULL, NULL),
(27, 27, 8, 24, NULL, NULL),
(28, 28, 10, 96, NULL, NULL),
(29, 28, 6, 24, NULL, NULL),
(30, 29, 9, 24, NULL, NULL),
(31, 30, 24, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_returns`
--

CREATE TABLE `sales_returns` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `rep_id` int(11) DEFAULT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_returns`
--

INSERT INTO `sales_returns` (`id`, `customer_id`, `rep_id`, `assignment_id`, `total_amount`, `notes`, `created_at`) VALUES
(2, 129, 1, NULL, 3916.00, 'Rejected', '2026-05-18 14:08:04'),
(3, 114, 1, NULL, 3916.00, 'Rejected', '2026-05-18 14:11:20'),
(4, 12, 1, NULL, 2410.00, '', '2026-06-02 12:46:52');

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_items`
--

CREATE TABLE `sales_return_items` (
  `id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `condition_status` enum('good','damaged','expired') DEFAULT 'good'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_return_items`
--

INSERT INTO `sales_return_items` (`id`, `return_id`, `product_id`, `quantity`, `unit_price`, `condition_status`) VALUES
(3, 2, 12, 1, 3916.00, 'good'),
(4, 3, 12, 1, 3916.00, 'good'),
(5, 4, 8, 2, 320.00, 'good'),
(6, 4, 7, 2, 410.00, 'good'),
(7, 4, 10, 2, 315.00, 'good'),
(8, 4, 6, 1, 320.00, 'good');

-- --------------------------------------------------------

--
-- Table structure for table `stock_logs`
--

CREATE TABLE `stock_logs` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` enum('grn_in','sale_out','manual_adj','returned') NOT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `qty_change` int(11) NOT NULL,
  `previous_stock` int(11) NOT NULL,
  `new_stock` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_logs`
--

INSERT INTO `stock_logs` (`id`, `product_id`, `type`, `reference_id`, `qty_change`, `previous_stock`, `new_stock`, `created_by`, `created_at`) VALUES
(195, 6, 'grn_in', 12, 960, 0, 960, 1, '2026-05-05 18:31:51'),
(196, 7, 'grn_in', 12, 480, 0, 480, 1, '2026-05-05 18:31:51'),
(197, 8, 'grn_in', 12, 600, 0, 600, 1, '2026-05-05 18:31:51'),
(198, 9, 'grn_in', 12, 600, 0, 600, 1, '2026-05-05 18:31:51'),
(199, 10, 'grn_in', 12, 528, 0, 528, 1, '2026-05-05 18:31:51'),
(200, 12, 'grn_in', 12, 10, 0, 10, 1, '2026-05-05 18:31:51'),
(201, 13, 'grn_in', 12, 10, 0, 10, 1, '2026-05-05 18:31:51'),
(202, 11, 'grn_in', 12, 10, 0, 10, 1, '2026-05-05 18:31:51'),
(203, 14, 'grn_in', 12, 10, 0, 10, 1, '2026-05-05 18:31:51'),
(204, 15, 'grn_in', 12, 10, 0, 10, 1, '2026-05-05 18:31:51'),
(205, 16, 'grn_in', 12, 15, 0, 15, 1, '2026-05-05 18:31:51'),
(206, 17, 'grn_in', 12, 15, 0, 15, 1, '2026-05-05 18:31:51'),
(207, 18, 'grn_in', 12, 15, 0, 15, 1, '2026-05-05 18:31:51'),
(208, 19, 'grn_in', 12, 15, 0, 15, 1, '2026-05-05 18:31:51'),
(209, 22, 'grn_in', 12, 20, 0, 20, 1, '2026-05-05 18:31:51'),
(210, 20, 'grn_in', 12, 25, 0, 25, 1, '2026-05-05 18:31:51'),
(211, 21, 'grn_in', 12, 10, 0, 10, 1, '2026-05-05 18:31:51'),
(212, 23, 'grn_in', 12, 50, 0, 50, 1, '2026-05-05 18:31:51'),
(213, 24, 'grn_in', 12, 50, 0, 50, 1, '2026-05-05 18:31:51'),
(214, 9, 'sale_out', 15, -100, 600, 500, 1, '2026-05-05 18:46:21'),
(215, 9, 'sale_out', 16, -8, 600, 592, 1, '2026-05-05 18:49:27'),
(216, 8, 'sale_out', 16, -8, 600, 592, 1, '2026-05-05 18:49:27'),
(217, 7, 'sale_out', 16, -8, 480, 472, 1, '2026-05-05 18:49:27'),
(218, 10, 'sale_out', 16, -8, 528, 520, 1, '2026-05-05 18:49:27'),
(219, 6, 'sale_out', 16, -8, 960, 952, 1, '2026-05-05 18:49:27'),
(220, 13, 'sale_out', 16, -1, 10, 9, 1, '2026-05-05 18:49:27'),
(221, 23, 'sale_out', 16, -1, 50, 49, 1, '2026-05-05 18:49:27'),
(222, 9, 'sale_out', 17, -2, 592, 590, 1, '2026-05-05 18:50:40'),
(223, 8, 'sale_out', 17, -2, 592, 590, 1, '2026-05-05 18:50:40'),
(224, 9, '', NULL, -100, 590, 490, 1, '2026-05-05 18:53:59'),
(225, 8, '', NULL, -100, 590, 490, 1, '2026-05-05 18:53:59'),
(226, 7, '', NULL, -100, 472, 372, 1, '2026-05-05 18:53:59'),
(227, 18, '', NULL, -15, 15, 0, 1, '2026-05-05 18:53:59'),
(228, 17, '', NULL, -15, 15, 0, 1, '2026-05-05 18:53:59'),
(229, 22, '', NULL, -20, 20, 0, 1, '2026-05-05 18:53:59'),
(230, 14, '', NULL, -10, 10, 0, 1, '2026-05-05 18:53:59'),
(231, 20, '', NULL, -25, 25, 0, 1, '2026-05-05 18:53:59'),
(232, 15, '', NULL, -10, 10, 0, 1, '2026-05-05 18:53:59'),
(233, 10, '', NULL, -100, 520, 420, 1, '2026-05-05 18:53:59'),
(234, 12, '', NULL, -10, 10, 0, 1, '2026-05-05 18:53:59'),
(235, 19, '', NULL, -15, 15, 0, 1, '2026-05-05 18:53:59'),
(236, 24, '', NULL, -29, 50, 21, 1, '2026-05-05 18:53:59'),
(237, 23, '', NULL, -29, 49, 20, 1, '2026-05-05 18:53:59'),
(238, 13, '', NULL, -9, 9, 0, 1, '2026-05-05 18:53:59'),
(239, 21, '', NULL, -10, 10, 0, 1, '2026-05-05 18:53:59'),
(240, 6, '', NULL, -100, 952, 852, 1, '2026-05-05 18:53:59'),
(241, 11, '', NULL, -10, 10, 0, 1, '2026-05-05 18:53:59'),
(242, 16, '', NULL, -15, 15, 0, 1, '2026-05-05 18:53:59'),
(243, 10, 'sale_out', 18, -2, 100, 98, 7, '2026-05-05 19:04:25'),
(244, 6, 'sale_out', 18, -2, 100, 98, 7, '2026-05-05 19:04:25'),
(245, 7, 'sale_out', 18, -2, 100, 98, 7, '2026-05-05 19:04:25'),
(246, 9, 'sale_out', 18, -2, 100, 98, 7, '2026-05-05 19:04:25'),
(247, 8, 'sale_out', 18, -2, 100, 98, 7, '2026-05-05 19:04:25'),
(248, 9, 'sale_out', 19, -2, 98, 96, 7, '2026-05-05 19:05:19'),
(249, 8, 'sale_out', 19, -2, 98, 96, 7, '2026-05-05 19:05:19'),
(250, 7, 'sale_out', 19, -2, 98, 96, 7, '2026-05-05 19:05:19'),
(251, 10, 'sale_out', 19, -2, 98, 96, 7, '2026-05-05 19:05:19'),
(252, 6, 'sale_out', 19, -2, 98, 96, 7, '2026-05-05 19:05:19'),
(253, 23, 'sale_out', 20, -1, 29, 28, 7, '2026-05-05 19:07:24'),
(254, 23, 'sale_out', 21, -1, 28, 27, 7, '2026-05-05 19:07:49'),
(255, 6, 'sale_out', 22, -3, 96, 93, 7, '2026-05-05 19:09:43'),
(256, 9, 'sale_out', 23, -3, 96, 93, 7, '2026-05-05 19:10:06'),
(257, 6, 'sale_out', 24, -3, 93, 90, 7, '2026-05-05 19:10:51'),
(258, 10, 'sale_out', 25, -2, 96, 94, 7, '2026-05-05 19:12:28'),
(259, 6, 'sale_out', 25, -2, 90, 88, 7, '2026-05-05 19:12:28'),
(260, 7, 'sale_out', 25, -2, 96, 94, 7, '2026-05-05 19:12:28'),
(261, 9, 'sale_out', 25, -2, 93, 91, 7, '2026-05-05 19:12:28'),
(262, 8, 'sale_out', 25, -2, 96, 94, 7, '2026-05-05 19:12:28'),
(263, 23, 'sale_out', 26, -1, 27, 26, 7, '2026-05-05 19:12:59'),
(264, 24, 'sale_out', 26, -1, 29, 28, 7, '2026-05-05 19:12:59'),
(265, 10, 'sale_out', 27, -1, 94, 93, 7, '2026-05-06 02:44:35'),
(266, 6, 'sale_out', 27, -1, 88, 87, 7, '2026-05-06 02:44:35'),
(267, 7, 'sale_out', 27, -1, 94, 93, 7, '2026-05-06 02:44:35'),
(268, 9, 'sale_out', 27, -1, 91, 90, 7, '2026-05-06 02:44:35'),
(269, 8, 'sale_out', 27, -1, 94, 93, 7, '2026-05-06 02:44:35'),
(270, 6, 'sale_out', 28, -5, 87, 82, 7, '2026-05-06 02:52:37'),
(271, 12, 'sale_out', 29, -1, 10, 9, 7, '2026-05-06 02:55:07'),
(272, 10, 'sale_out', 25, -2, 95, 93, 7, '2026-05-06 03:07:55'),
(273, 6, 'sale_out', 25, -2, 84, 82, 7, '2026-05-06 03:07:55'),
(274, 7, 'sale_out', 25, -2, 95, 93, 7, '2026-05-06 03:07:55'),
(275, 9, 'sale_out', 25, -2, 92, 90, 7, '2026-05-06 03:07:55'),
(276, 8, 'sale_out', 25, -2, 95, 93, 7, '2026-05-06 03:07:55'),
(277, 8, 'sale_out', 30, -6, 93, 87, 7, '2026-05-06 03:49:54'),
(278, 6, 'sale_out', 30, -6, 82, 76, 7, '2026-05-06 03:49:54'),
(279, 12, 'sale_out', 30, -1, 9, 8, 7, '2026-05-06 03:49:54'),
(280, 10, 'sale_out', 31, -6, 93, 87, 7, '2026-05-06 05:01:48'),
(281, 13, 'sale_out', 31, -1, 9, 8, 7, '2026-05-06 05:01:48'),
(282, 6, 'sale_out', 31, -6, 76, 70, 7, '2026-05-06 05:01:48'),
(283, 10, 'returned', 31, 6, 432, 426, 7, '2026-05-06 05:05:12'),
(284, 13, 'returned', 31, 1, 2, 1, 7, '2026-05-06 05:05:12'),
(285, 6, 'returned', 31, 6, 864, 858, 7, '2026-05-06 05:05:12'),
(286, 6, 'sale_out', 32, -6, 70, 64, 7, '2026-05-06 05:05:54'),
(287, 10, 'sale_out', 32, -6, 87, 81, 7, '2026-05-06 05:05:54'),
(288, 13, 'sale_out', 32, -1, 8, 7, 7, '2026-05-06 05:05:54'),
(289, 18, 'sale_out', 33, -1, 15, 14, 7, '2026-05-06 05:37:06'),
(290, 24, 'sale_out', 34, -1, 28, 27, 7, '2026-05-06 05:53:47'),
(291, 9, 'sale_out', 35, -8, 90, 82, 7, '2026-05-06 07:01:44'),
(292, 13, 'sale_out', 35, -1, 7, 6, 7, '2026-05-06 07:01:44'),
(293, 23, 'sale_out', 35, -1, 26, 25, 7, '2026-05-06 07:01:44'),
(294, 8, 'sale_out', 35, -8, 87, 79, 7, '2026-05-06 07:01:44'),
(295, 7, 'sale_out', 35, -8, 93, 85, 7, '2026-05-06 07:01:44'),
(296, 24, 'sale_out', 35, -1, 27, 26, 7, '2026-05-06 07:01:44'),
(297, 9, 'returned', 35, 8, 506, 498, 7, '2026-05-06 07:02:25'),
(298, 13, 'returned', 35, 1, 3, 2, 7, '2026-05-06 07:02:25'),
(299, 23, 'returned', 35, 1, 22, 21, 7, '2026-05-06 07:02:25'),
(300, 8, 'returned', 35, 8, 506, 498, 7, '2026-05-06 07:02:25'),
(301, 7, 'returned', 35, 8, 388, 380, 7, '2026-05-06 07:02:25'),
(302, 24, 'returned', 35, 1, 23, 22, 7, '2026-05-06 07:02:25'),
(303, 24, 'sale_out', 36, -1, 26, 25, 7, '2026-05-06 07:02:47'),
(304, 18, 'returned', 33, 1, 2, 1, 7, '2026-05-06 07:04:26'),
(305, 18, 'sale_out', 37, -1, 14, 13, 7, '2026-05-06 07:04:39'),
(306, 23, 'sale_out', 38, -1, 25, 24, 7, '2026-05-06 07:35:07'),
(307, 10, 'sale_out', 39, -6, 81, 75, 7, '2026-05-06 08:22:38'),
(308, 24, 'sale_out', 40, -1, 25, 24, 7, '2026-05-06 08:34:47'),
(309, 23, 'sale_out', 41, -1, 24, 23, 7, '2026-05-06 09:54:13'),
(310, 24, 'sale_out', 42, -1, 24, 23, 7, '2026-05-06 10:26:45'),
(311, 23, 'sale_out', 43, -1, 23, 22, 7, '2026-05-06 10:28:18'),
(312, 24, 'sale_out', 44, -1, 23, 22, 7, '2026-05-06 11:01:10'),
(313, 23, 'sale_out', 44, -1, 22, 21, 7, '2026-05-06 11:01:10'),
(314, 24, 'sale_out', 45, -1, 22, 21, 7, '2026-05-06 11:18:30'),
(315, 16, 'sale_out', 45, -1, 15, 14, 7, '2026-05-06 11:18:30'),
(316, 24, 'sale_out', 46, -1, 21, 20, 7, '2026-05-06 11:28:55'),
(317, 16, 'sale_out', 46, -1, 14, 13, 7, '2026-05-06 11:28:55'),
(318, 10, 'sale_out', 47, -6, 75, 69, 7, '2026-05-06 11:51:36'),
(319, 9, 'sale_out', 47, -6, 82, 76, 7, '2026-05-06 11:51:36'),
(320, 23, 'sale_out', 41, -1, 22, 21, 7, '2026-05-06 12:21:23'),
(321, 24, 'sale_out', 41, -1, 20, 19, 7, '2026-05-06 12:21:23'),
(322, 24, 'returned', 45, 1, 24, 23, 7, '2026-05-06 12:22:50'),
(323, 16, 'returned', 45, 1, 2, 1, 7, '2026-05-06 12:22:50'),
(324, 24, 'returned', 46, 1, 25, 24, 7, '2026-05-06 12:23:02'),
(325, 16, 'returned', 46, 1, 3, 2, 7, '2026-05-06 12:23:02'),
(326, 16, 'sale_out', 48, -1, 13, 12, 7, '2026-05-06 12:23:18'),
(327, 24, 'sale_out', 48, -1, 19, 18, 7, '2026-05-06 12:23:18'),
(328, 6, '', NULL, -80, 858, 778, 1, '2026-05-07 04:19:15'),
(329, 10, '', NULL, -90, 426, 336, 1, '2026-05-07 04:19:15'),
(330, 9, '', NULL, -90, 498, 408, 1, '2026-05-07 04:19:15'),
(331, 8, '', NULL, -90, 498, 408, 1, '2026-05-07 04:19:15'),
(332, 7, '', NULL, -70, 380, 310, 1, '2026-05-07 04:19:15'),
(333, 23, '', NULL, -1, 21, 20, 1, '2026-05-07 04:19:35'),
(334, 24, '', NULL, -4, 24, 20, 1, '2026-05-07 04:19:35'),
(335, 18, '', NULL, -1, 1, 0, 1, '2026-05-07 04:23:44'),
(336, 13, '', NULL, -2, 2, 0, 1, '2026-05-07 04:24:49'),
(337, 16, '', NULL, -2, 2, 0, 1, '2026-05-07 04:25:17'),
(338, 12, '', NULL, -1, 1, 0, 1, '2026-05-07 04:28:38'),
(339, 20, 'sale_out', 49, -1, 25, 24, 7, '2026-05-07 05:10:54'),
(340, 24, 'sale_out', 50, -1, 22, 21, 7, '2026-05-07 05:36:51'),
(341, 19, 'sale_out', 51, -1, 15, 14, 7, '2026-05-07 05:52:26'),
(342, 20, 'sale_out', 52, -1, 24, 23, 7, '2026-05-07 06:11:15'),
(343, 19, 'sale_out', 52, -1, 14, 13, 7, '2026-05-07 06:11:15'),
(344, 24, 'sale_out', 53, -1, 21, 20, 7, '2026-05-07 06:21:58'),
(345, 24, 'sale_out', 54, -1, 20, 19, 7, '2026-05-07 06:33:09'),
(346, 10, 'sale_out', 55, -2, 159, 157, 7, '2026-05-07 06:53:26'),
(347, 6, 'sale_out', 55, -1, 144, 143, 7, '2026-05-07 06:53:26'),
(348, 9, 'sale_out', 56, -3, 166, 163, 7, '2026-05-07 09:06:55'),
(349, 8, 'sale_out', 56, -3, 169, 166, 7, '2026-05-07 09:06:55'),
(350, 24, 'sale_out', 57, -1, 19, 18, 7, '2026-05-07 10:31:12'),
(351, 24, 'sale_out', 58, -1, 18, 17, 7, '2026-05-07 10:33:42'),
(352, 24, 'sale_out', 59, -1, 17, 16, 7, '2026-05-08 04:55:12'),
(353, 24, 'sale_out', 60, -1, 16, 15, 7, '2026-05-08 05:16:11'),
(354, 24, 'sale_out', 61, -1, 15, 14, 7, '2026-05-08 05:44:24'),
(355, 20, 'sale_out', 62, -1, 23, 22, 7, '2026-05-08 05:55:48'),
(356, 10, 'sale_out', 63, -2, 157, 155, 7, '2026-05-08 06:05:41'),
(357, 6, 'sale_out', 63, -2, 143, 141, 7, '2026-05-08 06:05:41'),
(358, 24, 'sale_out', 64, -1, 14, 13, 7, '2026-05-08 06:18:45'),
(359, 24, 'sale_out', 65, -2, 13, 11, 7, '2026-05-08 07:18:40'),
(360, 23, 'sale_out', 65, -2, 22, 20, 7, '2026-05-08 07:18:40'),
(361, 24, 'sale_out', 66, -1, 11, 10, 7, '2026-05-08 09:14:35'),
(362, 24, 'sale_out', 67, -1, 10, 9, 7, '2026-05-08 09:21:21'),
(363, 24, 'sale_out', 68, -1, 9, 8, 7, '2026-05-08 09:59:17'),
(364, 20, 'sale_out', 69, -1, 22, 21, 7, '2026-05-08 10:28:26'),
(365, 11, 'sale_out', 69, -1, 10, 9, 7, '2026-05-08 10:28:26'),
(366, 14, 'sale_out', 69, -1, 10, 9, 7, '2026-05-08 10:28:26'),
(367, 13, 'sale_out', 69, -1, 8, 7, 7, '2026-05-08 10:28:26'),
(368, 24, '', NULL, -10, 20, 10, 1, '2026-05-09 02:42:49'),
(369, 13, 'sale_out', 70, -1, 7, 6, 7, '2026-05-09 04:30:56'),
(370, 24, 'sale_out', 71, -1, 18, 17, 7, '2026-05-09 05:00:11'),
(371, 24, 'sale_out', 72, -1, 17, 16, 7, '2026-05-09 05:14:17'),
(372, 24, 'sale_out', 73, -1, 16, 15, 7, '2026-05-09 05:34:38'),
(373, 24, 'sale_out', 74, -1, 15, 14, 7, '2026-05-09 05:48:44'),
(374, 24, 'sale_out', 75, -1, 14, 13, 7, '2026-05-09 07:02:50'),
(375, 10, 'sale_out', 76, -3, 155, 152, 7, '2026-05-09 08:45:00'),
(376, 24, 'sale_out', 77, -1, 13, 12, 7, '2026-05-09 09:01:06'),
(377, 24, 'sale_out', 78, -1, 12, 11, 7, '2026-05-09 09:13:46'),
(378, 20, 'sale_out', 79, -1, 21, 20, 7, '2026-05-09 09:42:30'),
(379, 24, 'sale_out', 80, -1, 11, 10, 7, '2026-05-09 10:00:11'),
(380, 24, 'sale_out', 81, -1, 10, 9, 7, '2026-05-09 10:03:25'),
(381, 24, 'sale_out', 82, -1, 9, 8, 7, '2026-05-09 10:32:41'),
(382, 23, 'sale_out', 82, -1, 20, 19, 7, '2026-05-09 10:32:41'),
(383, 24, 'sale_out', 83, -1, 8, 7, 7, '2026-05-09 11:11:39'),
(384, 20, 'sale_out', 84, -1, 20, 19, 7, '2026-05-09 12:23:41'),
(385, 12, 'sale_out', 85, -1, 9, 8, 7, '2026-05-09 13:14:03'),
(386, 12, 'sale_out', 86, -1, 8, 7, 7, '2026-05-09 13:16:08'),
(387, 24, 'sale_out', 87, -1, 7, 6, 7, '2026-05-11 05:37:46'),
(388, 24, 'sale_out', 88, -1, 6, 5, 7, '2026-05-11 05:56:27'),
(389, 23, 'sale_out', 89, -1, 19, 18, 7, '2026-05-11 06:26:41'),
(390, 23, 'sale_out', 90, -1, 18, 17, 7, '2026-05-11 07:50:38'),
(391, 24, 'sale_out', 90, -1, 5, 4, 7, '2026-05-11 07:50:38'),
(392, 10, 'sale_out', 91, -3, 152, 149, 7, '2026-05-11 08:36:48'),
(393, 6, 'sale_out', 91, -3, 141, 138, 7, '2026-05-11 08:36:48'),
(394, 7, 'sale_out', 91, -3, 155, 152, 7, '2026-05-11 08:36:48'),
(395, 9, 'sale_out', 91, -3, 163, 160, 7, '2026-05-11 08:36:48'),
(396, 8, 'sale_out', 91, -3, 166, 163, 7, '2026-05-11 08:36:48'),
(397, 12, 'sale_out', 91, -2, 7, 5, 7, '2026-05-11 08:36:48'),
(398, 13, 'sale_out', 91, -2, 6, 4, 7, '2026-05-11 08:36:48'),
(399, 19, 'sale_out', 91, -1, 13, 12, 7, '2026-05-11 08:36:48'),
(400, 11, 'sale_out', 91, -2, 9, 7, 7, '2026-05-11 08:36:48'),
(401, 17, 'sale_out', 91, -2, 15, 13, 7, '2026-05-11 08:36:48'),
(402, 21, 'sale_out', 91, -2, 10, 8, 7, '2026-05-11 08:36:48'),
(403, 18, 'sale_out', 91, -1, 14, 13, 7, '2026-05-11 08:36:48'),
(404, 16, 'sale_out', 91, -2, 14, 12, 7, '2026-05-11 08:36:48'),
(405, 14, 'sale_out', 91, -1, 9, 8, 7, '2026-05-11 08:36:48'),
(406, 20, 'sale_out', 91, -2, 19, 17, 7, '2026-05-11 08:36:48'),
(407, 23, 'sale_out', 91, -1, 17, 16, 7, '2026-05-11 08:36:48'),
(408, 24, 'sale_out', 91, -1, 4, 3, 7, '2026-05-11 08:36:48'),
(409, 22, 'sale_out', 91, -1, 20, 19, 7, '2026-05-11 08:36:48'),
(410, 23, 'sale_out', 92, -1, 16, 15, 7, '2026-05-11 10:00:43'),
(411, 10, 'sale_out', 93, -3, 149, 146, 7, '2026-05-11 11:36:14'),
(412, 6, 'sale_out', 93, -3, 138, 135, 7, '2026-05-11 11:36:14'),
(413, 9, 'sale_out', 93, -3, 160, 157, 7, '2026-05-11 11:36:14'),
(414, 8, 'sale_out', 93, -3, 163, 160, 7, '2026-05-11 11:36:14'),
(415, 12, 'sale_out', 93, -1, 5, 4, 7, '2026-05-11 11:36:14'),
(416, 13, 'sale_out', 93, -1, 4, 3, 7, '2026-05-11 11:36:14'),
(417, 18, 'sale_out', 93, -1, 13, 12, 7, '2026-05-11 11:36:14'),
(418, 16, 'sale_out', 93, -1, 12, 11, 7, '2026-05-11 11:36:14'),
(419, 20, 'sale_out', 93, -1, 17, 16, 7, '2026-05-11 11:36:14'),
(420, 17, 'sale_out', 94, -1, 13, 12, 7, '2026-05-12 06:23:09'),
(421, 24, 'sale_out', 95, -1, 3, 2, 7, '2026-05-12 06:38:31'),
(422, 23, 'sale_out', 95, -1, 15, 14, 7, '2026-05-12 06:38:31'),
(423, 23, 'sale_out', 96, -1, 14, 13, 7, '2026-05-12 06:44:08'),
(424, 24, 'sale_out', 97, -1, 2, 1, 7, '2026-05-12 06:52:34'),
(425, 24, 'sale_out', 98, -1, 1, 0, 7, '2026-05-12 07:00:39'),
(426, 13, 'sale_out', 99, -1, 3, 2, 7, '2026-05-12 08:10:12'),
(427, 11, 'sale_out', 99, -1, 7, 6, 7, '2026-05-12 08:10:12'),
(428, 17, 'returned', 94, 1, 2, 1, 7, '2026-05-12 09:20:06'),
(429, 23, 'sale_out', 100, -1, 13, 12, 7, '2026-05-12 09:36:45'),
(430, 8, 'sale_out', 101, -2, 160, 158, 7, '2026-05-12 11:04:25'),
(431, 6, 'sale_out', 101, -1, 135, 134, 7, '2026-05-12 11:04:25'),
(432, 7, 'sale_out', 101, -2, 152, 150, 7, '2026-05-12 11:04:25'),
(433, 13, 'sale_out', 99, -1, 3, 2, 7, '2026-05-12 12:07:41'),
(434, 11, 'sale_out', 99, -1, 7, 6, 7, '2026-05-12 12:07:41'),
(435, 24, '', NULL, -10, 10, 0, 1, '2026-05-12 12:26:04'),
(436, 24, 'sale_out', 102, -1, 10, 9, 7, '2026-05-12 12:26:23'),
(437, 8, 'returned', 101, 2, 412, 410, 7, '2026-05-12 13:24:03'),
(438, 6, 'returned', 101, 1, 780, 779, 7, '2026-05-12 13:24:03'),
(439, 7, 'returned', 101, 2, 314, 312, 7, '2026-05-12 13:24:03'),
(440, 8, 'sale_out', 103, -2, 158, 156, 7, '2026-05-12 13:27:53'),
(441, 6, 'sale_out', 103, -1, 134, 133, 7, '2026-05-12 13:27:53'),
(442, 7, 'sale_out', 103, -2, 150, 148, 7, '2026-05-12 13:27:53'),
(443, 24, 'returned', 102, 1, 2, 1, 7, '2026-05-12 14:22:08'),
(444, 23, '', NULL, -10, 20, 10, 1, '2026-05-13 03:30:15'),
(445, 24, 'sale_out', 104, -1, 9, 8, 7, '2026-05-13 06:04:00'),
(446, 20, 'sale_out', 105, -1, 16, 15, 7, '2026-05-13 06:21:49'),
(447, 24, 'sale_out', 106, -1, 8, 7, 7, '2026-05-13 06:35:08'),
(448, 24, 'sale_out', 107, -1, 7, 6, 7, '2026-05-13 07:25:47'),
(449, 13, 'sale_out', 108, -1, 2, 1, 7, '2026-05-13 07:58:16'),
(450, 16, 'sale_out', 108, -1, 11, 10, 7, '2026-05-13 07:58:16'),
(451, 20, 'sale_out', 108, -1, 15, 14, 7, '2026-05-13 07:58:16'),
(452, 22, 'sale_out', 108, -1, 19, 18, 7, '2026-05-13 07:58:16'),
(453, 19, 'sale_out', 108, -1, 12, 11, 7, '2026-05-13 07:58:16'),
(454, 7, 'sale_out', 108, -6, 148, 142, 7, '2026-05-13 07:58:16'),
(455, 10, 'sale_out', 108, -6, 146, 140, 7, '2026-05-13 07:58:16'),
(456, 6, 'sale_out', 108, -8, 133, 125, 7, '2026-05-13 07:58:16'),
(457, 9, 'sale_out', 108, -8, 157, 149, 7, '2026-05-13 07:58:16'),
(458, 8, 'sale_out', 108, -8, 156, 148, 7, '2026-05-13 07:58:16'),
(459, 20, 'sale_out', 109, -1, 14, 13, 7, '2026-05-13 09:55:25'),
(460, 22, 'sale_out', 109, -1, 18, 17, 7, '2026-05-13 09:55:25'),
(461, 10, 'sale_out', 109, -3, 140, 137, 7, '2026-05-13 09:55:25'),
(462, 17, 'sale_out', 109, -1, 12, 11, 7, '2026-05-13 09:55:25'),
(463, 21, 'sale_out', 109, -1, 8, 7, 7, '2026-05-13 09:55:25'),
(464, 24, 'sale_out', 110, -1, 6, 5, 7, '2026-05-13 10:10:20'),
(465, 24, 'sale_out', 111, -1, 5, 4, 7, '2026-05-13 10:14:03'),
(466, 23, 'sale_out', 112, -1, 22, 21, 7, '2026-05-13 10:52:32'),
(467, 13, 'sale_out', 113, -1, 1, 0, 7, '2026-05-14 05:30:03'),
(468, 16, 'sale_out', 113, -1, 10, 9, 7, '2026-05-14 05:30:03'),
(469, 6, 'sale_out', 114, -1, 779, 778, 1, '2026-05-14 07:53:04'),
(470, 9, 'sale_out', 115, -2, 410, 408, 1, '2026-05-14 08:56:40'),
(471, 8, 'sale_out', 115, -2, 412, 410, 1, '2026-05-14 08:56:40'),
(472, 9, 'sale_out', 116, -2, 410, 408, 1, '2026-05-14 09:50:37'),
(473, 8, 'sale_out', 116, -2, 412, 410, 1, '2026-05-14 09:50:37'),
(474, 23, 'sale_out', 117, -1, 21, 20, 7, '2026-05-14 10:25:14'),
(475, 12, 'sale_out', 118, -2, 4, 2, 7, '2026-05-15 05:32:20'),
(476, 18, 'sale_out', 118, -1, 12, 11, 7, '2026-05-15 05:32:20'),
(477, 16, 'sale_out', 118, -1, 9, 8, 7, '2026-05-15 05:32:20'),
(478, 22, 'sale_out', 118, -1, 17, 16, 7, '2026-05-15 05:32:20'),
(479, 21, 'sale_out', 118, -1, 7, 6, 7, '2026-05-15 05:32:20'),
(480, 20, 'sale_out', 118, -1, 13, 12, 7, '2026-05-15 05:32:20'),
(481, 7, 'sale_out', 118, -4, 142, 138, 7, '2026-05-15 05:32:20'),
(482, 10, 'sale_out', 118, -12, 137, 125, 7, '2026-05-15 05:32:20'),
(483, 9, 'sale_out', 118, -6, 149, 143, 7, '2026-05-15 05:32:20'),
(484, 8, 'sale_out', 118, -6, 148, 142, 7, '2026-05-15 05:32:20'),
(485, 6, 'sale_out', 118, -4, 125, 121, 7, '2026-05-15 05:32:20'),
(486, 17, 'sale_out', 118, -1, 11, 10, 7, '2026-05-15 05:32:20'),
(487, 23, 'sale_out', 119, -2, 20, 18, 7, '2026-05-15 06:14:39'),
(488, 11, 'sale_out', 120, -2, 6, 4, 7, '2026-05-15 07:30:06'),
(489, 22, 'sale_out', 120, -1, 16, 15, 7, '2026-05-15 07:30:06'),
(490, 17, 'sale_out', 120, -1, 10, 9, 7, '2026-05-15 07:30:06'),
(491, 21, 'sale_out', 120, -1, 6, 5, 7, '2026-05-15 07:30:06'),
(492, 19, 'sale_out', 120, -1, 11, 10, 7, '2026-05-15 07:30:06'),
(493, 14, 'sale_out', 120, -1, 8, 7, 7, '2026-05-15 07:30:06'),
(494, 23, 'sale_out', 121, -1, 18, 17, 7, '2026-05-15 09:30:40'),
(495, 16, 'sale_out', 122, -1, 8, 7, 7, '2026-05-15 10:17:24'),
(496, 20, 'sale_out', 122, -1, 12, 11, 7, '2026-05-15 10:17:24'),
(497, 12, 'sale_out', 122, -1, 2, 1, 7, '2026-05-15 10:17:24'),
(498, 23, 'sale_out', 123, -1, 17, 16, 7, '2026-05-15 11:11:18'),
(499, 23, 'sale_out', 124, -1, 16, 15, 7, '2026-05-15 11:48:40'),
(500, 23, 'sale_out', 125, -1, 15, 14, 7, '2026-05-15 11:53:59'),
(501, 23, 'returned', 124, 1, 12, 11, 7, '2026-05-15 11:58:34'),
(502, 23, 'returned', 121, 1, 13, 12, 7, '2026-05-15 12:30:35'),
(503, 8, '', 7, -4, 142, 138, 1, '2026-05-16 03:30:08'),
(504, 7, '', 7, -1, 138, 137, 1, '2026-05-16 03:30:08'),
(505, 18, '', 7, -1, 11, 10, 1, '2026-05-16 03:30:08'),
(506, 22, '', 7, -1, 15, 14, 1, '2026-05-16 03:30:08'),
(507, 14, '', 7, -1, 7, 6, 1, '2026-05-16 03:30:08'),
(508, 20, '', 7, -2, 11, 9, 1, '2026-05-16 03:30:08'),
(509, 10, '', 7, -1, 125, 124, 1, '2026-05-16 03:30:08'),
(510, 12, '', 7, 1, 1, 2, 1, '2026-05-16 03:30:08'),
(511, 24, '', 7, -4, 4, 0, 1, '2026-05-16 03:30:08'),
(512, 23, '', 7, -3, 14, 11, 1, '2026-05-16 03:30:08'),
(513, 21, '', 7, -1, 5, 4, 1, '2026-05-16 03:30:08'),
(514, 6, '', 7, 12, 121, 133, 1, '2026-05-16 03:30:08'),
(515, 16, '', 7, -1, 7, 6, 1, '2026-05-16 03:30:08'),
(516, 23, '', NULL, -10, 12, 2, 1, '2026-05-16 03:33:58'),
(517, 23, 'sale_out', 126, -1, 21, 20, 7, '2026-05-16 14:04:09'),
(518, 23, 'sale_out', 127, -1, 20, 19, 7, '2026-05-16 14:05:21'),
(519, 23, 'sale_out', 128, -1, 19, 18, 7, '2026-05-16 14:06:18'),
(520, 23, 'sale_out', 129, -1, 18, 17, 7, '2026-05-16 14:07:35'),
(521, 23, 'sale_out', 130, -1, 17, 16, 7, '2026-05-16 14:08:50'),
(522, 23, 'sale_out', 131, -1, 16, 15, 7, '2026-05-16 14:09:55'),
(523, 6, 'sale_out', 132, -1, 133, 132, 7, '2026-05-16 14:11:24'),
(524, 9, 'sale_out', 132, -1, 143, 142, 7, '2026-05-16 14:11:24'),
(525, 8, 'sale_out', 132, -1, 138, 137, 7, '2026-05-16 14:11:24'),
(526, 10, 'sale_out', 133, -6, 124, 118, 7, '2026-05-16 14:18:10'),
(527, 6, 'sale_out', 133, -6, 132, 126, 7, '2026-05-16 14:18:10'),
(528, 7, 'sale_out', 133, -6, 137, 131, 7, '2026-05-16 14:18:10'),
(529, 9, 'sale_out', 133, -6, 142, 136, 7, '2026-05-16 14:18:10'),
(530, 8, 'sale_out', 133, -6, 137, 131, 7, '2026-05-16 14:18:10'),
(531, 12, 'sale_out', 133, -1, 2, 1, 7, '2026-05-16 14:18:10'),
(532, 11, 'sale_out', 133, -1, 4, 3, 7, '2026-05-16 14:18:10'),
(533, 14, 'sale_out', 133, -1, 6, 5, 7, '2026-05-16 14:18:10'),
(534, 22, 'sale_out', 133, -1, 14, 13, 7, '2026-05-16 14:18:10'),
(535, 16, 'sale_out', 133, -1, 6, 5, 7, '2026-05-16 14:18:10'),
(536, 21, 'sale_out', 133, -1, 4, 3, 7, '2026-05-16 14:18:10'),
(537, 17, 'sale_out', 133, -1, 9, 8, 7, '2026-05-16 14:18:10'),
(538, 20, 'sale_out', 133, -1, 9, 8, 7, '2026-05-16 14:18:10'),
(539, 23, 'sale_out', 133, -2, 15, 13, 7, '2026-05-16 14:18:10'),
(540, 23, 'sale_out', 134, -1, 13, 12, 7, '2026-05-18 05:25:10'),
(541, 7, 'sale_out', 135, -12, 131, 119, 7, '2026-05-18 07:23:49'),
(542, 10, 'sale_out', 135, -24, 118, 94, 7, '2026-05-18 07:23:49'),
(543, 23, 'sale_out', 136, -1, 12, 11, 7, '2026-05-18 09:26:31'),
(544, 10, 'sale_out', 137, -12, 94, 82, 7, '2026-05-18 10:13:48'),
(545, 6, 'sale_out', 137, -12, 126, 114, 7, '2026-05-18 10:13:48'),
(546, 9, 'sale_out', 137, -12, 136, 124, 7, '2026-05-18 10:13:48'),
(547, 8, 'sale_out', 137, -12, 131, 119, 7, '2026-05-18 10:13:48'),
(548, 16, 'sale_out', 137, -1, 5, 4, 7, '2026-05-18 10:13:48'),
(549, 22, 'sale_out', 137, -1, 13, 12, 7, '2026-05-18 10:13:48'),
(550, 14, 'sale_out', 137, -1, 5, 4, 7, '2026-05-18 10:13:48'),
(551, 14, 'sale_out', 140, -1, 1, 0, 1, '2026-05-18 14:17:07'),
(552, 23, 'sale_out', 141, -1, 11, 10, 7, '2026-05-19 04:01:19'),
(553, 10, 'sale_out', 142, -3, 82, 79, 7, '2026-05-19 05:02:09'),
(554, 10, 'returned', 142, 3, 342, 339, 7, '2026-05-19 11:25:12'),
(555, 10, 'sale_out', 143, -24, 79, 55, 7, '2026-05-19 11:30:27'),
(556, 10, '', NULL, -60, 339, 279, 1, '2026-05-21 02:20:05'),
(557, 9, '', 7, -2, 124, 122, 1, '2026-05-21 03:38:33'),
(558, 8, '', 7, 1, 119, 120, 1, '2026-05-21 03:38:33'),
(559, 7, '', 7, -1, 119, 118, 1, '2026-05-21 03:38:33'),
(560, 17, '', 7, -1, 8, 7, 1, '2026-05-21 03:38:33'),
(561, 22, '', 7, -12, 12, 0, 1, '2026-05-21 03:38:33'),
(562, 14, '', 7, -3, 3, 0, 1, '2026-05-21 03:38:33'),
(563, 20, '', 7, -2, 8, 6, 1, '2026-05-21 03:38:33'),
(564, 12, '', 7, 1, 1, 2, 1, '2026-05-21 03:38:33'),
(565, 23, '', 7, -4, 10, 6, 1, '2026-05-21 03:38:33'),
(566, 21, '', 7, -1, 3, 2, 1, '2026-05-21 03:38:33'),
(567, 6, '', 7, -7, 114, 107, 1, '2026-05-21 03:38:33'),
(568, 16, '', 7, -1, 4, 3, 1, '2026-05-21 03:38:33'),
(569, 22, '', NULL, -12, 12, 0, 1, '2026-05-22 06:17:01'),
(570, 14, '', NULL, -3, 3, 0, 1, '2026-05-22 06:17:01'),
(571, 10, '', 144, -5, 115, 110, 7, '2026-05-22 06:19:37'),
(572, 6, '', 144, -5, 107, 102, 7, '2026-05-22 06:19:37'),
(573, 9, '', 144, -5, 122, 117, 7, '2026-05-22 06:19:37'),
(574, 8, '', 144, -5, 120, 115, 7, '2026-05-22 06:19:37'),
(575, 18, '', 144, -1, 10, 9, 7, '2026-05-22 06:19:37'),
(576, 20, '', 144, -2, 6, 4, 7, '2026-05-22 06:19:37'),
(577, 14, '', 144, -1, 3, 2, 7, '2026-05-22 06:19:37'),
(578, 22, '', 144, -1, 12, 11, 7, '2026-05-22 06:19:37'),
(579, 23, '', 145, -1, 6, 5, 7, '2026-05-22 06:20:34'),
(580, 23, '', 146, -1, 5, 4, 7, '2026-05-22 06:42:33'),
(581, 6, '', 147, -24, 102, 78, 7, '2026-05-22 08:50:17'),
(582, 6, '', 147, -1, 102, 101, 7, '2026-05-22 08:50:17'),
(583, 9, '', 147, -12, 117, 105, 7, '2026-05-22 08:50:17'),
(584, 8, '', 147, -12, 115, 103, 7, '2026-05-22 08:50:17'),
(585, 23, '', 148, -1, 4, 3, 7, '2026-05-22 10:21:35'),
(586, 23, '', 149, -1, 3, 2, 7, '2026-05-22 11:14:59'),
(587, 9, 'sale_out', 150, -12, 408, 396, 1, '2026-05-22 13:24:30'),
(588, 8, 'sale_out', 150, -12, 410, 398, 1, '2026-05-22 13:24:30'),
(589, 9, 'sale_out', 151, -8, 404, 396, 1, '2026-05-22 13:30:43'),
(590, 8, 'sale_out', 151, -8, 406, 398, 1, '2026-05-22 13:30:43'),
(591, 7, 'sale_out', 151, -8, 320, 312, 1, '2026-05-22 13:30:43'),
(592, 10, 'sale_out', 151, -8, 287, 279, 1, '2026-05-22 13:30:43'),
(593, 6, 'sale_out', 151, -8, 786, 778, 1, '2026-05-22 13:30:43'),
(594, 13, 'sale_out', 151, -1, 1, 0, 1, '2026-05-22 13:30:43'),
(595, 23, 'sale_out', 151, -1, 1, 0, 1, '2026-05-22 13:30:43'),
(596, 13, 'sale_out', 152, -1, 1, 0, 1, '2026-05-22 13:35:45'),
(597, 23, 'sale_out', 152, -1, 1, 0, 1, '2026-05-22 13:35:45'),
(598, 6, 'sale_out', 152, -8, 786, 778, 1, '2026-05-22 13:35:45'),
(599, 10, 'sale_out', 152, -8, 287, 279, 1, '2026-05-22 13:35:45'),
(600, 7, 'sale_out', 152, -8, 320, 312, 1, '2026-05-22 13:35:45'),
(601, 8, 'sale_out', 152, -8, 406, 398, 1, '2026-05-22 13:35:45'),
(602, 9, 'sale_out', 152, -2, 404, 402, 1, '2026-05-22 13:35:45'),
(603, 9, 'sale_out', 153, -8, 404, 396, 1, '2026-05-22 13:39:24'),
(604, 8, 'sale_out', 153, -8, 406, 398, 1, '2026-05-22 13:39:24'),
(605, 10, 'sale_out', 153, -8, 287, 279, 1, '2026-05-22 13:39:24'),
(606, 6, 'sale_out', 153, -8, 786, 778, 1, '2026-05-22 13:39:24'),
(607, 7, 'sale_out', 153, -8, 320, 312, 1, '2026-05-22 13:39:24'),
(608, 23, 'sale_out', 153, -1, 1, 0, 1, '2026-05-22 13:39:24'),
(609, 13, 'sale_out', 153, -1, 1, 0, 1, '2026-05-22 13:39:24'),
(610, 9, 'sale_out', 154, -8, 408, 400, 1, '2026-05-22 13:58:25'),
(611, 8, 'sale_out', 154, -8, 410, 402, 1, '2026-05-22 13:58:25'),
(612, 10, 'sale_out', 154, -8, 279, 271, 1, '2026-05-22 13:58:25'),
(613, 6, 'sale_out', 154, -8, 778, 770, 1, '2026-05-22 13:58:25'),
(614, 7, 'sale_out', 154, -8, 312, 304, 1, '2026-05-22 13:58:25'),
(615, 13, 'sale_out', 154, -1, 1, 0, 1, '2026-05-22 13:58:25'),
(616, 23, 'sale_out', 154, -1, 1, 0, 1, '2026-05-22 13:58:25'),
(617, 9, 'sale_out', 155, -12, 400, 388, 1, '2026-05-22 13:59:03'),
(618, 8, 'sale_out', 155, -12, 402, 390, 1, '2026-05-22 13:59:03'),
(619, 23, '', 156, -1, 2, 1, 7, '2026-05-23 05:24:25'),
(620, 23, '', 157, -1, 1, 0, 7, '2026-05-23 05:39:11'),
(621, 10, '', 158, -10, 110, 100, 7, '2026-05-23 07:10:37'),
(622, 9, '', 158, -5, 105, 100, 7, '2026-05-23 07:10:37'),
(623, 8, '', 158, -5, 103, 98, 7, '2026-05-23 07:10:37'),
(624, 10, '', 159, -12, 100, 88, 7, '2026-05-25 07:50:45'),
(625, 9, '', 159, -12, 100, 88, 7, '2026-05-25 07:50:45'),
(626, 8, '', 159, -12, 98, 86, 7, '2026-05-25 07:50:45'),
(627, 10, '', 160, -24, 88, 64, 7, '2026-05-25 10:13:18'),
(628, 10, '', 160, -1, 88, 87, 7, '2026-05-25 10:13:18'),
(629, 6, '', 160, -24, 77, 53, 7, '2026-05-25 10:13:18'),
(630, 6, '', 160, -1, 77, 76, 7, '2026-05-25 10:13:18'),
(631, 22, '', 160, -1, 11, 10, 7, '2026-05-25 10:13:18'),
(632, 17, '', 160, -1, 7, 6, 7, '2026-05-25 10:13:18'),
(633, 20, '', 160, -1, 4, 3, 7, '2026-05-25 10:13:18'),
(634, 20, '', 161, -1, 3, 2, 7, '2026-05-25 10:17:21'),
(635, 10, '', 162, -6, 63, 57, 7, '2026-05-26 04:37:04'),
(636, 6, '', 162, -6, 52, 46, 7, '2026-05-26 04:37:04'),
(637, 9, '', 162, -6, 88, 82, 7, '2026-05-26 04:37:04'),
(638, 8, '', 162, -6, 86, 80, 7, '2026-05-26 04:37:04'),
(639, 16, '', 163, -1, 3, 2, 7, '2026-05-26 09:38:51'),
(640, 10, '', 164, -6, 57, 51, 7, '2026-05-27 04:23:09'),
(641, 6, '', 164, -6, 46, 40, 7, '2026-05-27 04:23:09'),
(642, 9, '', 164, -6, 82, 76, 7, '2026-05-27 04:23:09'),
(643, 8, '', 164, -6, 80, 74, 7, '2026-05-27 04:23:09'),
(644, 7, '', 164, -3, 118, 115, 7, '2026-05-27 04:23:09'),
(645, 10, '', NULL, -48, 271, 223, 1, '2026-05-28 03:42:38'),
(646, 6, '', NULL, -24, 770, 746, 1, '2026-05-28 03:42:38'),
(647, 8, '', NULL, -24, 390, 366, 1, '2026-05-28 03:42:38'),
(648, 10, '', 165, -12, 99, 87, 7, '2026-05-28 04:48:21'),
(649, 8, '', 165, -6, 98, 92, 7, '2026-05-28 04:48:21'),
(650, 6, '', 165, -6, 64, 58, 7, '2026-05-28 04:48:21'),
(651, 17, '', 165, -1, 6, 5, 7, '2026-05-28 04:48:21'),
(652, 22, '', 165, -1, 10, 9, 7, '2026-05-28 04:48:21'),
(653, 10, '', 166, -5, 87, 82, 7, '2026-05-28 05:14:24'),
(654, 9, '', 167, -4, 76, 72, 7, '2026-05-28 10:27:56'),
(655, 8, '', 167, -4, 92, 88, 7, '2026-05-28 10:27:56'),
(656, 10, '', 167, -6, 82, 76, 7, '2026-05-28 10:27:56'),
(657, 6, '', 167, -6, 58, 52, 7, '2026-05-28 10:27:56'),
(658, 10, '', 168, -2, 76, 74, 7, '2026-05-28 11:30:54'),
(659, 6, '', 168, -1, 52, 51, 7, '2026-05-28 11:30:54'),
(660, 9, '', 168, -1, 72, 71, 7, '2026-05-28 11:30:54'),
(661, 8, '', 168, -1, 88, 87, 7, '2026-05-28 11:30:54'),
(662, 6, '', 169, -1, 51, 50, 7, '2026-05-28 11:32:22'),
(663, 10, '', 170, -3, 74, 71, 7, '2026-05-28 11:33:48'),
(664, 10, '', NULL, -96, 223, 127, 1, '2026-05-29 03:44:01'),
(665, 6, '', NULL, -24, 746, 722, 1, '2026-05-29 03:44:02'),
(666, 10, '', 171, -1, 167, 166, 7, '2026-05-29 10:06:40'),
(667, 9, '', 171, -1, 71, 70, 7, '2026-05-29 10:06:40'),
(668, 8, '', 171, -1, 87, 86, 7, '2026-05-29 10:06:40'),
(669, 10, '', 172, -6, 166, 160, 7, '2026-05-29 10:08:12'),
(670, 6, '', 172, -6, 74, 68, 7, '2026-05-29 10:08:12'),
(671, 9, '', 172, -6, 70, 64, 7, '2026-05-29 10:08:12'),
(672, 8, '', 172, -6, 86, 80, 7, '2026-05-29 10:08:12'),
(673, 9, '', NULL, -24, 388, 364, 1, '2026-06-02 03:36:02'),
(674, 10, '', 173, -6, 160, 154, 7, '2026-06-02 09:41:47'),
(675, 6, '', 173, -4, 68, 64, 7, '2026-06-02 09:41:47'),
(676, 7, '', 173, -6, 115, 109, 7, '2026-06-02 09:41:47'),
(677, 9, '', 173, -4, 88, 84, 7, '2026-06-02 09:41:47'),
(678, 8, '', 173, -4, 80, 76, 7, '2026-06-02 09:41:47'),
(679, 10, '', 174, -6, 154, 148, 7, '2026-06-02 09:55:55'),
(680, 6, '', 174, -6, 64, 58, 7, '2026-06-02 09:55:55'),
(681, 8, '', NULL, -24, 368, 344, 1, '2026-06-03 03:54:57'),
(682, 6, '', NULL, -24, 723, 699, 1, '2026-06-03 03:54:57'),
(683, 10, '', 176, -10, 148, 138, 7, '2026-06-03 05:32:27'),
(684, 10, '', 177, -3, 138, 135, 7, '2026-06-03 07:28:09'),
(685, 6, '', 177, -3, 82, 79, 7, '2026-06-03 07:28:09'),
(686, 9, '', 177, -3, 84, 81, 7, '2026-06-03 07:28:09'),
(687, 8, '', 177, -3, 100, 97, 7, '2026-06-03 07:28:09'),
(688, 10, '', 178, -6, 135, 129, 7, '2026-06-03 08:00:48'),
(689, 6, '', 178, -6, 79, 73, 7, '2026-06-03 08:00:48'),
(690, 8, '', 178, -6, 97, 91, 7, '2026-06-03 08:00:48'),
(691, 9, '', 178, -12, 81, 69, 7, '2026-06-03 08:00:48'),
(692, 24, '', NULL, -1, 1, 0, 1, '2026-06-03 08:19:21'),
(693, 12, '', 179, -1, 2, 1, 1, '2026-06-03 08:22:52'),
(694, 18, '', 179, -1, 9, 8, 1, '2026-06-03 08:22:52'),
(695, 22, '', 179, -1, 9, 8, 1, '2026-06-03 08:22:52'),
(696, 21, '', 179, -1, 2, 1, 1, '2026-06-03 08:22:52'),
(697, 17, '', 179, -1, 5, 4, 1, '2026-06-03 08:22:52'),
(698, 20, '', 179, -1, 2, 1, 1, '2026-06-03 08:22:52'),
(699, 19, '', 179, -1, 10, 9, 1, '2026-06-03 08:22:52'),
(700, 16, '', 179, -1, 2, 1, 1, '2026-06-03 08:22:52'),
(701, 14, '', 179, -1, 2, 1, 1, '2026-06-03 08:22:52'),
(702, 24, '', 179, -1, 1, 0, 1, '2026-06-03 08:22:52'),
(703, 12, 'sale_out', 179, -1, 2, 1, 1, '2026-06-03 08:23:12'),
(704, 18, 'sale_out', 179, -1, 1, 0, 1, '2026-06-03 08:23:12'),
(705, 22, 'sale_out', 179, -1, 1, 0, 1, '2026-06-03 08:23:12'),
(706, 21, 'sale_out', 179, -1, 1, 0, 1, '2026-06-03 08:23:12'),
(707, 17, 'sale_out', 179, -1, 2, 1, 1, '2026-06-03 08:23:12'),
(708, 20, 'sale_out', 179, -1, 1, 0, 1, '2026-06-03 08:23:12'),
(709, 19, 'sale_out', 179, -1, 1, 0, 1, '2026-06-03 08:23:12'),
(710, 16, 'sale_out', 179, -1, 1, 0, 1, '2026-06-03 08:23:12'),
(711, 14, 'sale_out', 179, -1, 1, 0, 1, '2026-06-03 08:23:12'),
(712, 24, 'sale_out', 179, -1, 1, 0, 1, '2026-06-03 08:23:12'),
(713, 10, '', 180, -24, 129, 105, 7, '2026-06-03 09:24:40'),
(714, 6, '', 180, -12, 73, 61, 7, '2026-06-03 09:24:40'),
(715, 7, '', 180, -12, 109, 97, 7, '2026-06-03 09:24:40'),
(716, 9, '', 180, -12, 69, 57, 7, '2026-06-03 09:24:40'),
(717, 8, '', 180, -12, 91, 79, 7, '2026-06-03 09:24:40'),
(718, 10, '', 181, -3, 105, 102, 7, '2026-06-03 09:55:10'),
(719, 6, '', 181, -3, 61, 58, 7, '2026-06-03 09:55:10'),
(720, 9, '', 181, -3, 57, 54, 7, '2026-06-03 09:55:10'),
(721, 8, '', 181, -3, 79, 76, 7, '2026-06-03 09:55:10'),
(722, 6, '', 182, -3, 58, 55, 7, '2026-06-04 06:52:40'),
(723, 10, '', 183, -6, 102, 96, 7, '2026-06-04 06:54:04'),
(724, 6, '', 183, -6, 55, 49, 7, '2026-06-04 06:54:04'),
(725, 7, '', 183, -6, 97, 91, 7, '2026-06-04 06:54:04'),
(726, 9, '', 183, -6, 54, 48, 7, '2026-06-04 06:54:04'),
(727, 8, '', 183, -6, 76, 70, 7, '2026-06-04 06:54:04'),
(728, 9, '', 184, -6, 48, 42, 7, '2026-06-04 06:55:45'),
(729, 8, '', 184, -6, 70, 64, 7, '2026-06-04 06:55:45'),
(730, 10, '', 185, -4, 96, 92, 7, '2026-06-04 10:57:59'),
(731, 9, '', 185, -4, 42, 38, 7, '2026-06-04 10:57:59'),
(732, 8, '', 185, -4, 64, 60, 7, '2026-06-04 10:57:59'),
(733, 10, '', 186, -12, 92, 80, 7, '2026-06-04 11:02:34'),
(734, 6, '', 186, -12, 49, 37, 7, '2026-06-04 11:02:34'),
(735, 10, '', 187, -12, 80, 68, 7, '2026-06-04 11:06:33'),
(736, 6, '', 187, -12, 37, 25, 7, '2026-06-04 11:06:33'),
(737, 9, '', 187, -12, 38, 26, 7, '2026-06-04 11:06:33'),
(738, 8, '', 187, -12, 60, 48, 7, '2026-06-04 11:06:33'),
(739, 11, '', 187, -1, 3, 2, 7, '2026-06-04 11:06:33'),
(740, 22, '', 187, -1, 8, 7, 7, '2026-06-04 11:06:33'),
(741, 18, '', 187, -1, 8, 7, 7, '2026-06-04 11:06:33'),
(742, 14, '', 187, -1, 1, 0, 7, '2026-06-04 11:06:33'),
(743, 17, '', 187, -1, 4, 3, 7, '2026-06-04 11:06:33'),
(744, 9, '', NULL, -24, 364, 340, 1, '2026-06-05 03:23:00'),
(745, 8, '', NULL, -24, 344, 320, 1, '2026-06-05 03:23:00'),
(746, 10, '', NULL, -24, 129, 105, 1, '2026-06-05 03:23:00'),
(747, 6, '', NULL, -24, 699, 675, 1, '2026-06-05 03:23:00'),
(748, 8, '', NULL, -36, 320, 284, 1, '2026-06-05 03:27:53'),
(749, 9, '', NULL, -48, 340, 292, 1, '2026-06-05 03:27:53'),
(750, 10, '', NULL, -36, 105, 69, 1, '2026-06-05 03:27:53'),
(751, 6, '', NULL, -36, 675, 639, 1, '2026-06-05 03:27:53'),
(752, 7, '', NULL, -12, 306, 294, 1, '2026-06-05 03:27:53'),
(753, 10, '', 188, -12, 128, 116, 7, '2026-06-05 08:53:40'),
(754, 10, '', 189, -3, 116, 113, 7, '2026-06-05 08:54:21'),
(755, 10, '', 190, -6, 113, 107, 1, '2026-06-05 09:03:46'),
(756, 6, '', 190, -4, 85, 81, 1, '2026-06-05 09:03:46'),
(757, 9, '', 190, -4, 98, 94, 1, '2026-06-05 09:03:46'),
(758, 8, '', 190, -4, 108, 104, 1, '2026-06-05 09:03:46'),
(759, 10, '', 191, -6, 107, 101, 7, '2026-06-05 11:18:00'),
(760, 6, '', 191, -6, 81, 75, 7, '2026-06-05 11:18:00'),
(761, 9, '', 191, -6, 94, 88, 7, '2026-06-05 11:18:00'),
(762, 8, '', 191, -6, 104, 98, 7, '2026-06-05 11:18:00'),
(763, 10, '', 192, -6, 101, 95, 1, '2026-06-05 12:51:40'),
(764, 6, '', 192, -2, 75, 73, 1, '2026-06-05 12:51:40'),
(765, 9, '', 192, -2, 88, 86, 1, '2026-06-05 12:51:40'),
(766, 8, '', 192, -2, 98, 96, 1, '2026-06-05 12:51:40'),
(767, 6, '', NULL, -48, 640, 592, 1, '2026-06-06 03:46:18'),
(768, 10, '', NULL, -48, 71, 23, 1, '2026-06-06 03:46:18'),
(769, 7, '', NULL, -48, 294, 246, 1, '2026-06-06 03:46:18'),
(770, 9, '', NULL, -48, 293, 245, 1, '2026-06-06 03:46:18'),
(771, 8, '', NULL, -48, 285, 237, 1, '2026-06-06 03:46:18'),
(772, 10, '', 193, -5, 143, 138, 7, '2026-06-08 06:29:05'),
(773, 9, 'sale_out', 194, -24, 245, 221, 1, '2026-06-08 08:58:23'),
(774, 8, 'sale_out', 194, -24, 237, 213, 1, '2026-06-08 08:58:23'),
(775, 6, 'sale_out', 194, -24, 592, 568, 1, '2026-06-08 08:58:23'),
(776, 6, 'sale_out', 194, -1, 592, 591, 1, '2026-06-08 08:58:23'),
(777, 10, '', 195, -1, 138, 137, 7, '2026-06-08 09:06:09'),
(778, 6, '', 195, -1, 121, 120, 7, '2026-06-08 09:06:09'),
(779, 9, '', 195, -1, 134, 133, 7, '2026-06-08 09:06:09'),
(780, 8, '', 195, -1, 144, 143, 7, '2026-06-08 09:06:09'),
(781, 10, '', 196, -2, 137, 135, 7, '2026-06-08 11:17:41'),
(782, 6, '', 196, -1, 120, 119, 7, '2026-06-08 11:17:41'),
(783, 10, '', 197, -12, 135, 123, 7, '2026-06-08 11:23:14'),
(784, 9, '', 197, -6, 133, 127, 7, '2026-06-08 11:23:14'),
(785, 8, '', 197, -6, 143, 137, 7, '2026-06-08 11:23:14'),
(786, 10, '', 198, -6, 123, 117, 7, '2026-06-08 12:04:05'),
(787, 9, '', 199, -3, 127, 124, 7, '2026-06-09 05:15:41'),
(788, 8, '', 199, -3, 137, 134, 7, '2026-06-09 05:15:41'),
(789, 10, '', 200, -6, 117, 111, 7, '2026-06-09 05:33:05'),
(790, 9, '', 200, -6, 124, 118, 7, '2026-06-09 05:33:05'),
(791, 8, '', 200, -6, 134, 128, 7, '2026-06-09 05:33:05'),
(792, 6, '', 200, -6, 119, 113, 7, '2026-06-09 05:33:05'),
(793, 10, '', 201, -12, 111, 99, 7, '2026-06-09 11:19:02'),
(794, 6, '', 201, -12, 113, 101, 7, '2026-06-09 11:19:02'),
(795, 9, '', 201, -12, 118, 106, 7, '2026-06-09 11:19:02'),
(796, 8, '', 201, -12, 128, 116, 7, '2026-06-09 11:19:02'),
(797, 10, '', 202, -2, 99, 97, 7, '2026-06-09 11:21:30'),
(798, 6, '', 202, -2, 101, 99, 7, '2026-06-09 11:21:30'),
(799, 9, '', 202, -2, 106, 104, 7, '2026-06-09 11:21:30'),
(800, 8, '', 202, -2, 116, 114, 7, '2026-06-09 11:21:30'),
(801, 10, '', 203, -4, 97, 93, 7, '2026-06-10 10:31:46'),
(802, 9, '', 203, -4, 104, 100, 7, '2026-06-10 10:31:46'),
(803, 8, '', 203, -4, 114, 110, 7, '2026-06-10 10:31:46'),
(804, 10, '', 204, -6, 93, 87, 7, '2026-06-10 10:33:28'),
(805, 6, '', 204, -6, 99, 93, 7, '2026-06-10 10:33:28'),
(806, 9, '', 204, -6, 100, 94, 7, '2026-06-10 10:33:28'),
(807, 8, '', 204, -6, 110, 104, 7, '2026-06-10 10:33:28'),
(808, 10, 'returned', 203, 4, 31, 27, 7, '2026-06-10 10:52:14'),
(809, 9, 'returned', 203, 4, 229, 225, 7, '2026-06-10 10:52:14'),
(810, 8, 'returned', 203, 4, 221, 217, 7, '2026-06-10 10:52:14'),
(811, 10, '', 205, -4, 87, 83, 7, '2026-06-10 10:54:10'),
(812, 9, '', 205, -4, 94, 90, 7, '2026-06-10 10:54:10'),
(813, 8, '', 205, -4, 104, 100, 7, '2026-06-10 10:54:10'),
(814, 10, '', 206, -6, 83, 77, 7, '2026-06-10 11:07:22'),
(815, 6, '', 206, -6, 93, 87, 7, '2026-06-10 11:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `email` varchar(150) DEFAULT NULL,
  `tax_id` varchar(50) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `company_name`, `phone`, `address`, `created_at`, `email`, `tax_id`, `website`, `status`, `latitude`, `longitude`) VALUES
(1, 'Ramanathan Vicneswaran', 'Global Star Importers (PVT) LTD', '0768435141', 'No:660/B,Medamandiya, Panagoda, Homagama, Sri Lanka', '2026-04-21 06:24:36', 'globalstarimporters007@gmail.com', '', '', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_payments`
--

CREATE TABLE `supplier_payments` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `method` enum('Cash','Bank Transfer','Cheque','Other') NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_payments`
--

INSERT INTO `supplier_payments` (`id`, `supplier_id`, `amount`, `method`, `reference`, `notes`, `created_at`) VALUES
(1, 1, 2000000.00, 'Bank Transfer', 'Initial Payment', 'Admin Recorded Supplier Payment', '2026-05-19 15:52:12'),
(2, 1, 1643340.00, 'Bank Transfer', 'GRN-000012', 'Initial Payment at GRN Creation', '2026-04-28 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `territories`
--

CREATE TABLE `territories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `territories`
--

INSERT INTO `territories` (`id`, `name`, `description`, `status`, `created_at`) VALUES
(1, 'Colombo Road', '', 'active', '2026-05-18 04:04:32'),
(2, 'Puttalam Road', '', 'active', '2026-05-19 03:22:14'),
(3, 'Kandy Road', '', 'active', '2026-05-23 04:03:41'),
(4, 'Dambulla Road', '', 'active', '2026-05-27 03:11:56'),
(5, 'Rideegama Road', '', 'active', '2026-05-29 03:41:17'),
(6, 'Negombo Road', '', 'active', '2026-06-03 07:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `unproductive_visits`
--

CREATE TABLE `unproductive_visits` (
  `id` int(11) NOT NULL,
  `rep_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unproductive_visits`
--

INSERT INTO `unproductive_visits` (`id`, `rep_id`, `customer_id`, `reason`, `latitude`, `longitude`, `created_at`) VALUES
(3, 7, 88, 'Shop Closed', NULL, NULL, '2026-05-12 09:22:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','supervisor','supplier','rep') NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `name`, `email`, `password`, `role`, `permissions`, `created_at`) VALUES
(1, NULL, 'System Admin', 'admin@candent.com', '$2y$10$93fFVgFwcK7kRVdHOaNap.DK5pTp4FEBpcnVd0nPgv6oKgQ4QrA7a', 'admin', '[]', '2026-04-21 03:53:58'),
(7, 5, 'Chanuka Jeewantha', 'chanuka@candent.com', '$2y$10$DYHKvnOlbRhYHpCJPtwQhO.qGNBUuPJCDdh.mRUn8DWpsoUI2VcSC', 'rep', '[]', '2026-05-05 03:17:18'),
(8, 6, 'Susara Senarathne', 'adminrep@candent.com', '$2y$10$bqTztc6FVurjE9lw6aqQBuuknw5FLVcl4bmSe4Q7b25XxoukHnyKe', 'rep', '[]', '2026-05-05 04:17:06'),
(9, NULL, 'Kushan Senarathne', 'kushan@candent.com', '$2y$10$GhTHP.PRfWTHE9vUu7qAb.1KvfWTYhUtuSMnQIq6y2.GWK52093Ke', 'admin', '[]', '2026-05-06 03:37:10');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_stock`
--

CREATE TABLE `vehicle_stock` (
  `id` int(11) NOT NULL,
  `rep_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock_qty` int(11) NOT NULL DEFAULT 0,
  `last_audit_date` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle_stock`
--

INSERT INTO `vehicle_stock` (`id`, `rep_id`, `product_id`, `stock_qty`, `last_audit_date`, `updated_at`) VALUES
(3, 7, 9, 90, '2026-05-21 03:38:33', '2026-06-10 10:54:10'),
(4, 7, 8, 100, '2026-05-21 03:38:33', '2026-06-10 10:54:10'),
(5, 7, 7, 151, '2026-05-21 03:38:33', '2026-06-06 03:46:18'),
(6, 7, 18, 7, '2026-05-21 03:38:33', '2026-06-04 11:06:33'),
(7, 7, 17, 3, '2026-05-21 03:38:33', '2026-06-04 11:06:33'),
(8, 7, 22, 7, '2026-05-21 03:38:33', '2026-06-04 11:06:33'),
(9, 7, 14, 0, '2026-05-21 03:38:33', '2026-06-04 11:06:33'),
(10, 7, 20, 1, '2026-05-21 03:38:33', '2026-06-03 08:22:52'),
(11, 7, 15, 10, '2026-05-21 03:38:33', '2026-05-21 03:38:33'),
(12, 7, 10, 77, '2026-05-21 03:38:33', '2026-06-10 11:07:22'),
(13, 7, 12, 1, '2026-05-21 03:38:33', '2026-06-03 08:22:52'),
(14, 7, 19, 9, '2026-05-21 03:38:33', '2026-06-03 08:22:52'),
(15, 7, 24, 0, '2026-05-16 03:30:08', '2026-06-03 08:22:52'),
(16, 7, 23, 0, '2026-05-21 03:38:33', '2026-05-23 05:39:11'),
(17, 7, 13, 0, NULL, '2026-05-14 05:30:03'),
(18, 7, 21, 1, '2026-05-21 03:38:33', '2026-06-03 08:22:52'),
(19, 7, 6, 87, '2026-05-21 03:38:33', '2026-06-10 11:07:22'),
(20, 7, 11, 2, '2026-05-21 03:38:33', '2026-06-04 11:06:33'),
(21, 7, 16, 1, '2026-05-21 03:38:33', '2026-06-03 08:22:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_date` (`employee_id`,`work_date`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `fk_main_cat` (`main_category_id`);

--
-- Indexes for table `cheques`
--
ALTER TABLE `cheques`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `company_finances`
--
ALTER TABLE `company_finances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rep_id` (`rep_id`),
  ADD KEY `fk_customers_route` (`route_id`);

--
-- Indexes for table `customer_payments`
--
ALTER TABLE `customer_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `damaged_stock`
--
ALTER TABLE `damaged_stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- Indexes for table `delivery_dispatches`
--
ALTER TABLE `delivery_dispatches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Indexes for table `dispatch_collections`
--
ALTER TABLE `dispatch_collections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispatch_id` (`dispatch_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `dispatch_sessions`
--
ALTER TABLE `dispatch_sessions`
  ADD PRIMARY KEY (`dispatch_id`,`session_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `email_campaigns`
--
ALTER TABLE `email_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_code` (`emp_code`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `finance_logs`
--
ALTER TABLE `finance_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `general_expenses`
--
ALTER TABLE `general_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `grns`
--
ALTER TABLE `grns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `grn_items`
--
ALTER TABLE `grn_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grn_id` (`grn_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `main_categories`
--
ALTER TABLE `main_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `rep_id` (`rep_id`),
  ADD KEY `fk_orders_assignment` (`assignment_id`),
  ADD KEY `fk_order_session` (`rep_session_id`),
  ADD KEY `fk_order_dispatch` (`dispatch_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `fk_order_items_promo` (`promo_id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_month` (`employee_id`,`month`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_supplier_unique` (`product_id`,`supplier_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_category_id` (`target_category_id`),
  ADD KEY `free_product_id` (`free_product_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `po_id` (`po_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `rep_daily_sessions`
--
ALTER TABLE `rep_daily_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rep_location_logs`
--
ALTER TABLE `rep_location_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rep_routes`
--
ALTER TABLE `rep_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rep_id` (`rep_id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `rep_sessions`
--
ALTER TABLE `rep_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rep_id` (`rep_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `rep_targets`
--
ALTER TABLE `rep_targets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rep_month` (`rep_id`,`month`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_expenses`
--
ALTER TABLE `route_expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_route_expenses_rep_assignment` (`assignment_id`);

--
-- Indexes for table `route_loads`
--
ALTER TABLE `route_loads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `fk_route_loads_rep_assignment` (`assignment_id`);

--
-- Indexes for table `sales_returns`
--
ALTER TABLE `sales_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_return_items`
--
ALTER TABLE `sales_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`);

--
-- Indexes for table `stock_logs`
--
ALTER TABLE `stock_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_payments`
--
ALTER TABLE `supplier_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `territories`
--
ALTER TABLE `territories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unproductive_visits`
--
ALTER TABLE `unproductive_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rep_id` (`rep_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `vehicle_stock`
--
ALTER TABLE `vehicle_stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_rep_product` (`rep_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cheques`
--
ALTER TABLE `cheques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `customer_payments`
--
ALTER TABLE `customer_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `damaged_stock`
--
ALTER TABLE `damaged_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_dispatches`
--
ALTER TABLE `delivery_dispatches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dispatch_collections`
--
ALTER TABLE `dispatch_collections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_campaigns`
--
ALTER TABLE `email_campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `finance_logs`
--
ALTER TABLE `finance_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `general_expenses`
--
ALTER TABLE `general_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `grns`
--
ALTER TABLE `grns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `grn_items`
--
ALTER TABLE `grn_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `main_categories`
--
ALTER TABLE `main_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=526;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rep_daily_sessions`
--
ALTER TABLE `rep_daily_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `rep_location_logs`
--
ALTER TABLE `rep_location_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=990;

--
-- AUTO_INCREMENT for table `rep_routes`
--
ALTER TABLE `rep_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `rep_sessions`
--
ALTER TABLE `rep_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rep_targets`
--
ALTER TABLE `rep_targets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `route_expenses`
--
ALTER TABLE `route_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `route_loads`
--
ALTER TABLE `route_loads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sales_returns`
--
ALTER TABLE `sales_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales_return_items`
--
ALTER TABLE `sales_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stock_logs`
--
ALTER TABLE `stock_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=816;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier_payments`
--
ALTER TABLE `supplier_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `territories`
--
ALTER TABLE `territories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `unproductive_visits`
--
ALTER TABLE `unproductive_visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vehicle_stock`
--
ALTER TABLE `vehicle_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_main_cat` FOREIGN KEY (`main_category_id`) REFERENCES `main_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cheques`
--
ALTER TABLE `cheques`
  ADD CONSTRAINT `cheques_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`rep_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_customers_route` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `damaged_stock`
--
ALTER TABLE `damaged_stock`
  ADD CONSTRAINT `damaged_stock_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_dispatches`
--
ALTER TABLE `delivery_dispatches`
  ADD CONSTRAINT `delivery_dispatches_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `delivery_dispatches_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `dispatch_collections`
--
ALTER TABLE `dispatch_collections`
  ADD CONSTRAINT `dispatch_collections_ibfk_1` FOREIGN KEY (`dispatch_id`) REFERENCES `delivery_dispatches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dispatch_collections_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dispatch_sessions`
--
ALTER TABLE `dispatch_sessions`
  ADD CONSTRAINT `dispatch_sessions_ibfk_1` FOREIGN KEY (`dispatch_id`) REFERENCES `delivery_dispatches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dispatch_sessions_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `rep_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `finance_logs`
--
ALTER TABLE `finance_logs`
  ADD CONSTRAINT `finance_logs_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `general_expenses`
--
ALTER TABLE `general_expenses`
  ADD CONSTRAINT `general_expenses_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `grns`
--
ALTER TABLE `grns`
  ADD CONSTRAINT `grns_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `grns_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `grn_items`
--
ALTER TABLE `grn_items`
  ADD CONSTRAINT `grn_items_ibfk_1` FOREIGN KEY (`grn_id`) REFERENCES `grns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grn_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order_dispatch` FOREIGN KEY (`dispatch_id`) REFERENCES `delivery_dispatches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_order_session` FOREIGN KEY (`rep_session_id`) REFERENCES `rep_sessions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_orders_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `rep_routes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`rep_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_items_promo` FOREIGN KEY (`promo_id`) REFERENCES `promotions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD CONSTRAINT `product_suppliers_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_suppliers_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promotions`
--
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`target_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promotions_ibfk_2` FOREIGN KEY (`free_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_orders_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD CONSTRAINT `purchase_order_items_ibfk_1` FOREIGN KEY (`po_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rep_daily_sessions`
--
ALTER TABLE `rep_daily_sessions`
  ADD CONSTRAINT `rep_daily_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rep_location_logs`
--
ALTER TABLE `rep_location_logs`
  ADD CONSTRAINT `rep_location_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rep_routes`
--
ALTER TABLE `rep_routes`
  ADD CONSTRAINT `rep_routes_ibfk_1` FOREIGN KEY (`rep_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rep_routes_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rep_routes_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `rep_sessions`
--
ALTER TABLE `rep_sessions`
  ADD CONSTRAINT `rep_sessions_ibfk_1` FOREIGN KEY (`rep_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rep_sessions_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rep_targets`
--
ALTER TABLE `rep_targets`
  ADD CONSTRAINT `rep_targets_ibfk_1` FOREIGN KEY (`rep_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `route_expenses`
--
ALTER TABLE `route_expenses`
  ADD CONSTRAINT `fk_route_expenses_rep_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `rep_routes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `route_loads`
--
ALTER TABLE `route_loads`
  ADD CONSTRAINT `fk_route_loads_rep_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `rep_routes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `route_loads_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_return_items`
--
ALTER TABLE `sales_return_items`
  ADD CONSTRAINT `sales_return_items_ibfk_1` FOREIGN KEY (`return_id`) REFERENCES `sales_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_logs`
--
ALTER TABLE `stock_logs`
  ADD CONSTRAINT `stock_logs_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_logs_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `unproductive_visits`
--
ALTER TABLE `unproductive_visits`
  ADD CONSTRAINT `unproductive_visits_ibfk_1` FOREIGN KEY (`rep_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `unproductive_visits_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vehicle_stock`
--
ALTER TABLE `vehicle_stock`
  ADD CONSTRAINT `vehicle_stock_ibfk_1` FOREIGN KEY (`rep_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vehicle_stock_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
