-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 20, 2020 at 04:28 AM
-- Server version: 5.6.45
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teamioss_covid`
--

-- --------------------------------------------------------

--
-- Table structure for table `19_access_keys`
--

CREATE TABLE `19_access_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `19_access_limits`
--

CREATE TABLE `19_access_limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `19_chcs`
--

CREATE TABLE `19_chcs` (
  `chc_id` int(11) NOT NULL,
  `phc_id` int(11) NOT NULL,
  `panchayat_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `chc_name` text NOT NULL,
  `chc_name_mal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_chcs`
--

INSERT INTO `19_chcs` (`chc_id`, `phc_id`, `panchayat_id`, `district_id`, `chc_name`, `chc_name_mal`) VALUES
(1, 0, 1, 1, 'chc1', ''),
(2, 0, 2, 1, 'chc2', ''),
(3, 0, 4, 2, 'chc2', '');

-- --------------------------------------------------------

--
-- Table structure for table `19_custom_info`
--

CREATE TABLE `19_custom_info` (
  `id` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `field_name` text NOT NULL,
  `field_name_mal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `19_custom_info_options`
--

CREATE TABLE `19_custom_info_options` (
  `custom_option_id` int(11) NOT NULL,
  `custom_info_id` int(11) NOT NULL,
  `custom_option` mediumtext NOT NULL,
  `custom_option_mal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `19_districts`
--

CREATE TABLE `19_districts` (
  `district_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `district_name` varchar(200) NOT NULL,
  `district_name_mal` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_districts`
--

INSERT INTO `19_districts` (`district_id`, `state_id`, `district_name`, `district_name_mal`) VALUES
(1, 1, 'kozhikode', ''),
(2, 1, 'Wynad', ''),
(3, 1, 'Kannur', ''),
(4, 2, 'Selam', ''),
(5, 2, 'trichi\r\n\r\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `19_level_user_type`
--

CREATE TABLE `19_level_user_type` (
  `level_type_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `level_id` int(11) NOT NULL,
  `menu_permitted` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_level_user_type`
--

INSERT INTO `19_level_user_type` (`level_type_id`, `name`, `level_id`, `menu_permitted`) VALUES
(1, 'user', 0, '[\"1\",\"2\",\"3\",\"4\"]'),
(2, 'RRT', 4, ''),
(3, 'DC', 1, ''),
(4, 'PHC', 3, '[\"1\",\"2\",\"3\",\"4\"]');

-- --------------------------------------------------------

--
-- Table structure for table `19_login`
--

CREATE TABLE `19_login` (
  `login_id` bigint(20) NOT NULL,
  `mobile_no` varchar(13) NOT NULL COMMENT 'level users username',
  `password` varchar(300) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'yes',
  `last_login` datetime DEFAULT NULL,
  `level_user_type` int(11) NOT NULL DEFAULT '0',
  `registered_by` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_login`
--

INSERT INTO `19_login` (`login_id`, `mobile_no`, `password`, `status`, `last_login`, `level_user_type`, `registered_by`) VALUES
(1, 'rrtlogin1', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', '2020-03-20 07:03:32', 4, 0),
(2, 'rrt2', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', '2020-03-17 14:34:31', 4, 0),
(3, 'rrt3', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', '2020-03-17 16:00:19', 4, 0),
(4, 'rrt4', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(5, 'rrt5', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', '2020-03-18 08:08:51', 4, 0),
(6, 'rrt6', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(7, 'rrt7', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(8, 'rrt8', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(9, 'rrt9', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(10, 'rrt10', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(11, 'rrt11', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(12, 'rrt12', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(13, 'rrt13', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(14, '7543566734', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 3),
(15, 'rrt16', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(16, 'rrt17', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(17, 'rrt18', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(18, 'rrt19', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(19, 'rrt20', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(20, 'rrt21', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(21, 'rrt22', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(22, 'rrt23', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(23, 'rrt24', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(24, 'rrt25', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(25, 'rrt15', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(26, 'rrt15', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(27, 'rrt15', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(28, 'rrt15', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(29, 'rrt26', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(30, 'rrt15', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(31, 'rrt26', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(32, 'rrt27', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(33, 'rrt28', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(34, 'rrt29', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(35, 'rrt30', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(36, 'rrt31', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(37, 'rrt32', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(38, 'rrt33', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(39, 'rrt34', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(40, 'rrt35', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(41, 'rrt36', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(42, 'rrt37', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(43, 'rrt38', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(44, 'rrt39', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(45, 'rrt40', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(46, 'rrt41', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(47, 'rrt42', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(48, 'rrt43', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(49, 'rrt44', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(50, 'rrt45', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(51, 'rrt46', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(52, 'rrt47', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(53, 'rrt48', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(54, 'rrt49', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(55, 'rrt50', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(56, 'rrt51', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(57, 'rrt52', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(58, 'rrt53', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(59, 'rrt54', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(60, 'rrt55', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(61, 'rrt56', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(62, 'rrt57', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(63, 'rrt58', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(64, 'rrt59', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(65, 'rrt60', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(66, 'rrt61', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(67, 'rrt62', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(68, 'rrt63', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(69, 'rrt64', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(70, 'rrt65', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(71, 'rrt66', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(72, 'rrt67', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(73, 'rrt68', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(74, 'rrt69', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(75, 'rrt70', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(76, 'rrt71', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(77, 'rrt72', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(78, 'rrt73', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(79, 'rrt74', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(80, 'rrt75', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(81, 'rrt76', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(82, 'rrt77', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(83, 'rrt78', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(84, 'rrt79', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(85, 'rrt80', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 4, 0),
(98, '9876543210', '85136c79cbf9fe36bb9d05d0639c70c265c18d37', 'yes', NULL, 0, 1),
(99, '9944556633', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', NULL, 0, 2),
(100, '8086605888', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', '2020-03-18 11:07:43', 0, 0),
(101, '9884027037', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'yes', '2020-03-19 13:24:29', 0, 1),
(102, '8606361612', 'b0399d2029f64d445bd131ffaa399a42d2f8e7dc', 'yes', '2020-03-20 08:04:49', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `19_menu`
--

CREATE TABLE `19_menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `parent_id` varchar(2) NOT NULL,
  `link` varchar(150) NOT NULL,
  `target` varchar(10) DEFAULT NULL,
  `status` varchar(5) NOT NULL DEFAULT 'yes',
  `menu_order` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_menu`
--

INSERT INTO `19_menu` (`menu_id`, `menu_name`, `parent_id`, `link`, `target`, `status`, `menu_order`) VALUES
(1, 'Home', '#', 'home/index', 'none', 'yes', 1),
(2, 'Register', '#', 'register/index', 'none', 'yes', 2),
(3, 'Logout', '#', 'login/logout', 'none', 'yes', 10),
(4, 'Report', '#', '', 'none', 'yes', 4),
(5, 'User Report', '4', 'report/user_report', NULL, 'yes', 1),
(6, 'Approve Symptoms', '#', 'approve/approve_symptoms', 'none', 'yes', 1),
(7, 'List Users', '#', 'home/registered_users', 'none', 'yes', 1),
(8, 'User Reprt', '#', 'excel/create_excel_user_data', 'none', 'yes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `19_panchayat`
--

CREATE TABLE `19_panchayat` (
  `panchayat_id` int(8) NOT NULL,
  `district_id` int(2) NOT NULL,
  `panchayat_name` varchar(200) NOT NULL,
  `panchayat_name_mal` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_panchayat`
--

INSERT INTO `19_panchayat` (`panchayat_id`, `district_id`, `panchayat_name`, `panchayat_name_mal`) VALUES
(1, 1, 'Azhiyur ', 'Azhiyur '),
(2, 1, 'Cherode', 'Cherode'),
(3, 1, 'Eramala', 'Eramala'),
(4, 1, 'Onchiyam', 'Onchiyam'),
(5, 1, 'Chekkiad', 'Chekkiad'),
(6, 1, 'Edacheri', 'Edacheri'),
(7, 1, 'Purameri', 'Purameri'),
(8, 1, 'Thuneri', 'Thuneri'),
(9, 1, 'Valayam', 'Valayam'),
(10, 1, 'Vanimel', 'Vanimel'),
(11, 1, 'Kunnummal', 'Kunnummal'),
(12, 1, 'Nadapuram', 'Nadapuram'),
(13, 1, 'Kayakkodi', 'Kayakkodi'),
(14, 1, 'Kavilumpara', 'Kavilumpara'),
(15, 1, 'Kuttiadi', 'Kuttiadi'),
(16, 1, 'Maruthonkara', 'Maruthonkara'),
(17, 1, 'Velom', 'Velom'),
(18, 1, 'Naripatta', 'Naripatta'),
(19, 1, 'Ayancheri', 'Ayancheri'),
(20, 1, 'Villiyappally', 'Villiyappally'),
(21, 1, 'Maniyur', 'Maniyur'),
(22, 1, 'Thiruvallur', 'Thiruvallur'),
(23, 1, 'Thurayur', 'Thurayur'),
(24, 1, 'Keezhariyur', 'Keezhariyur'),
(25, 1, 'Thikkodi', 'Thikkodi'),
(26, 1, 'Meppayur', 'Meppayur'),
(27, 1, 'Cheruvannur', 'Cheruvannur'),
(28, 1, 'Nochad', 'Nochad'),
(29, 1, 'Changaroth', 'Changaroth'),
(30, 1, 'Kayanna', 'Kayanna'),
(31, 1, 'Koothali', 'Koothali'),
(32, 1, 'Perambra', 'Perambra'),
(33, 1, 'Chakkittapara', 'Chakkittapara'),
(34, 1, 'Balussery', 'Balussery'),
(35, 1, 'Naduvannur', 'Naduvannur'),
(36, 1, 'Atholi', 'Atholi'),
(37, 1, 'Ulliyeri', 'Ulliyeri'),
(38, 1, 'Kottur', 'Kottur'),
(39, 1, 'Unnikulum', 'Unnikulum'),
(40, 1, 'Panangad', 'Panangad'),
(41, 1, 'Koorachundu', 'Koorachundu'),
(42, 1, 'Chemanchery', 'Chemanchery'),
(43, 1, 'Arikkulam', 'Arikkulam'),
(44, 1, 'Moodadi', 'Moodadi'),
(45, 1, 'Chengottukavu', 'Chengottukavu'),
(46, 1, 'Kakkodi', 'Kakkodi'),
(47, 1, 'Chelannur', 'Chelannur'),
(48, 1, 'Kakkur', 'Kakkur'),
(49, 1, 'Nanminda', 'Nanminda'),
(50, 1, 'Narikunni', 'Narikunni'),
(51, 1, 'Thalakulathur', 'Thalakulathur'),
(52, 1, 'Thiruvambadi', 'Thiruvambadi'),
(53, 1, 'Koodaranhi', 'Koodaranhi'),
(54, 1, 'Kizhakkoth', 'Kizhakkoth'),
(55, 1, 'Madavoor', 'Madavoor'),
(56, 1, 'Puthuppady', 'Puthuppady'),
(57, 1, 'Thamarasseri', 'Thamarasseri'),
(58, 1, 'Omassery', 'Omassery'),
(59, 1, 'Kattippara', 'Kattippara'),
(60, 1, 'Kodiyathur', 'Kodiyathur'),
(61, 1, 'Kuruvattoor', 'Kuruvattoor'),
(62, 1, 'Mavoor', 'Mavoor'),
(63, 1, 'Karasseri', 'Karasseri'),
(64, 1, 'Kunnamangalam', 'Kunnamangalam'),
(65, 1, 'Chathamangalam', 'Chathamangalam'),
(66, 1, 'Kodencheri', 'Kodencheri'),
(67, 1, 'Peruvayal', 'Peruvayal'),
(68, 1, 'Perumanna', 'Perumanna'),
(69, 1, 'Kadalundi', 'Kadalundi'),
(70, 1, 'Olavanna', 'Olavanna'),
(71, 1, 'Feroke', 'Feroke'),
(72, 1, 'Koduvally ', 'Koduvally '),
(73, 1, 'Koyilandy ', 'Koyilandy '),
(74, 1, 'Mukkam ', 'Mukkam '),
(75, 1, 'Payyoli ', 'Payyoli '),
(76, 1, 'Ramanattukara ', 'Ramanattukara '),
(77, 1, 'Vadakara ', 'Vadakara '),
(78, 1, 'Kozhikode', 'Kozhikode');

-- --------------------------------------------------------

--
-- Table structure for table `19_phcs`
--

CREATE TABLE `19_phcs` (
  `phc_id` int(11) NOT NULL,
  `panchayat_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `phc_name` text NOT NULL,
  `phc_name_mal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_phcs`
--

INSERT INTO `19_phcs` (`phc_id`, `panchayat_id`, `district_id`, `phc_name`, `phc_name_mal`) VALUES
(1, 4, 1, 'CHC Cheruvannur', 'CHC Cheruvannur');

-- --------------------------------------------------------

--
-- Table structure for table `19_questionnaire`
--

CREATE TABLE `19_questionnaire` (
  `id` int(11) NOT NULL,
  `cat_id` int(3) NOT NULL,
  `type` varchar(25) NOT NULL,
  `field_name` text NOT NULL,
  `field_name_mal` text NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_questionnaire`
--

INSERT INTO `19_questionnaire` (`id`, `cat_id`, `type`, `field_name`, `field_name_mal`, `status`) VALUES
(1, 1, 'text', 'Country of Visit/ Arrival', 'നിങ്ങൾ വിദേശയാത്ര നടത്തിയോ?', 1),
(2, 2, 'date', 'Date of arrival from affected country', 'യാത്രയ്ക്കുള്ള കാരണം?', 1),
(3, 1, 'date', 'Date of receipt of information that case is positive', 'ബാധകമെങ്കിൽ എന്തെങ്കിലും തിരഞ്ഞെടുക്കുക', 1),
(4, 1, 'text', 'No. of children under 5 years at their home with contact history to person under isolation', '', 1),
(5, 1, 'text', 'No. of children 5-10 years at their home with contact history to person under isolation', '', 1),
(6, 1, 'text', 'No. of children 10-17 years at their home with contact history to person under isolation', '', 1),
(7, 1, 'radio', 'At home to not', '', 1),
(8, 1, 'radio', 'Sample taken or not', '', 1),
(9, 1, 'radio', 'Local Body', '', 1),
(10, 1, 'radio', 'At home quarantine', '', 1),
(11, 1, 'date', 'Observation started from', '', 1),
(12, 1, 'text', 'No of senior citizens aged 60 years and above', '', 1),
(13, 1, 'radio', 'Pregnant Women', '', 1),
(14, 1, 'date', 'Date of sample taken', '', 1),
(15, 1, 'radio', 'Status of result', '', 1),
(16, 1, 'radio', 'After completing 28 days', '', 1),
(17, 1, 'radio', 'Primary or secondary contacts of positive cases', '', 1),
(18, 1, 'radio', 'Traveled with positive case', '', 1),
(19, 1, 'text', 'Alternative contact numbers of positive cases', '', 1),
(20, 1, 'text', 'Any comments', '', 1),
(21, 1, 'radio', 'Symptomatic', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `19_questionnaire_options`
--

CREATE TABLE `19_questionnaire_options` (
  `custom_option_id` int(11) NOT NULL,
  `custom_info_id` int(11) NOT NULL,
  `custom_option` mediumtext NOT NULL,
  `custom_option_mal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_questionnaire_options`
--

INSERT INTO `19_questionnaire_options` (`custom_option_id`, `custom_info_id`, `custom_option`, `custom_option_mal`) VALUES
(1, 1, 'yes', 'അതെ'),
(2, 1, 'no', 'ഇല്ല'),
(3, 3, 'cough', ''),
(4, 3, 'cold', ''),
(5, 7, 'yes', ''),
(6, 7, 'no', ''),
(7, 8, 'yes', ''),
(8, 8, 'no', ''),
(9, 9, 'Panchayat', ''),
(10, 9, 'Municipality', ''),
(11, 9, 'Corporation', ''),
(12, 10, 'yes', ''),
(13, 10, 'no', ''),
(14, 13, 'yes', ''),
(15, 13, 'no', ''),
(16, 15, 'Positive', ''),
(17, 15, 'Negative', ''),
(18, 15, 'Pending', ''),
(19, 16, 'Discharged', ''),
(20, 16, 'Released', ''),
(21, 16, 'NA', ''),
(22, 17, 'yes', ''),
(23, 17, 'no', ''),
(24, 18, 'yes', ''),
(25, 18, 'no', ''),
(26, 21, 'yes', ''),
(27, 21, 'no', '');

-- --------------------------------------------------------

--
-- Table structure for table `19_question_answers`
--

CREATE TABLE `19_question_answers` (
  `id` int(22) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `done_by` bigint(20) DEFAULT NULL,
  `question_1` text NOT NULL,
  `question_2` text CHARACTER SET latin1 NOT NULL,
  `question_3` varchar(200) CHARACTER SET latin1 NOT NULL,
  `question_4` text NOT NULL,
  `question_5` text NOT NULL,
  `question_6` text NOT NULL,
  `question_7` text NOT NULL,
  `question_8` text NOT NULL,
  `question_9` text NOT NULL,
  `question_10` text NOT NULL,
  `question_11` text NOT NULL,
  `question_12` text NOT NULL,
  `question_13` text NOT NULL,
  `question_14` text NOT NULL,
  `question_15` text NOT NULL,
  `question_16` text NOT NULL,
  `question_17` text NOT NULL,
  `question_18` text NOT NULL,
  `question_19` text NOT NULL,
  `question_20` text NOT NULL,
  `question_21` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_question_answers`
--

INSERT INTO `19_question_answers` (`id`, `user_id`, `date`, `done_by`, `question_1`, `question_2`, `question_3`, `question_4`, `question_5`, `question_6`, `question_7`, `question_8`, `question_9`, `question_10`, `question_11`, `question_12`, `question_13`, `question_14`, `question_15`, `question_16`, `question_17`, `question_18`, `question_19`, `question_20`, `question_21`) VALUES
(1, 3, '2020-03-18 11:11:55', 100, 'China ', '2020-03-13', '2020-03-14', '1', '2', '4', '5', '7', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `19_question_category`
--

CREATE TABLE `19_question_category` (
  `id` int(11) NOT NULL,
  `category` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `19_question_category`
--

INSERT INTO `19_question_category` (`id`, `category`) VALUES
(1, 'HR'),
(2, 'LR');

-- --------------------------------------------------------

--
-- Table structure for table `19_request_aid`
--

CREATE TABLE `19_request_aid` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(100) NOT NULL DEFAULT 'requested'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `19_states`
--

CREATE TABLE `19_states` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_states`
--

INSERT INTO `19_states` (`state_id`, `state_name`) VALUES
(1, 'Kerala'),
(2, 'Tamilnaadu\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `19_symptoms`
--

CREATE TABLE `19_symptoms` (
  `id` int(3) NOT NULL,
  `symptom` text NOT NULL,
  `symptom_mal` text NOT NULL,
  `img_link` varchar(200) DEFAULT NULL,
  `score` int(3) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_symptoms`
--

INSERT INTO `19_symptoms` (`id`, `symptom`, `symptom_mal`, `img_link`, `score`, `status`) VALUES
(1, 'Is at Home', 'വീട്ടിൽ ഉണ്ടോ', NULL, 0, 1),
(2, 'Monitored/ Unmonitored', 'നിരീക്ഷിച്ചു / നിരീക്ഷിച്ചിട്ടില്ല', NULL, 0, 1),
(3, 'Monitoring Team visited with along with police officers', 'പോലീസ് ഉദ്യോഗസ്ഥരോടൊപ്പം മോണിറ്ററിങ് ടീം സന്ദർശിച്ചു ', NULL, 0, 1),
(4, 'Fever', 'പനി', NULL, 0, 1),
(5, 'Cough', 'ചുമ', NULL, 0, 1),
(6, 'Running Nose', 'മൂക്കൊലിപ്പ്', NULL, 0, 1),
(7, 'Sore Throat', 'തൊണ്ടവേദന', NULL, 0, 1),
(8, 'Breathing Difficulty', 'ശ്വാസ തടസ്സം', NULL, 0, 1),
(9, 'Nausea / Vomiting / Diarrhoea', 'ഓക്കാനം / ഛർദ്ദി / വയറിളക്കം', NULL, 0, 1),
(10, 'Chronic Renal Failure/ CAD / Heart Failure', 'വൃക്ക സംബന്ധമായ രോഗം / CAD / ഹൃദയസ്തംഭനം', NULL, 0, 1),
(11, 'Required Food Items', 'ഭക്ഷണസാധനങ്ങൾ ആവശ്യമുണ്ടോ', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `19_symptoms_updation_history`
--

CREATE TABLE `19_symptoms_updation_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `approval_l3` int(11) NOT NULL DEFAULT '0',
  `approval_l2` int(11) NOT NULL DEFAULT '0',
  `symptom_1` int(11) NOT NULL,
  `symptom_2` int(11) NOT NULL,
  `symptom_3` int(11) NOT NULL,
  `symptom_4` int(11) NOT NULL,
  `symptom_5` int(11) NOT NULL,
  `symptom_6` int(11) NOT NULL,
  `symptom_7` int(11) NOT NULL,
  `symptom_8` int(2) NOT NULL,
  `symptom_9` int(2) NOT NULL,
  `symptom_10` int(2) NOT NULL,
  `symptom_11` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `19_symptoms_updation_history`
--

INSERT INTO `19_symptoms_updation_history` (`id`, `user_id`, `date`, `approval_l3`, `approval_l2`, `symptom_1`, `symptom_2`, `symptom_3`, `symptom_4`, `symptom_5`, `symptom_6`, `symptom_7`, `symptom_8`, `symptom_9`, `symptom_10`, `symptom_11`) VALUES
(1, 1, '2020-03-18 08:09:20', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0),
(2, 4, '2020-03-19 13:23:49', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `19_symptom_approval_history`
--

CREATE TABLE `19_symptom_approval_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` int(11) NOT NULL,
  `sym_id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_symptom_approval_history`
--

INSERT INTO `19_symptom_approval_history` (`id`, `user_id`, `user_type`, `sym_id`, `date`) VALUES
(1, 1, 3, 1, '2020-03-19 14:35:20');

-- --------------------------------------------------------

--
-- Table structure for table `19_temp`
--

CREATE TABLE `19_temp` (
  `panchayat` text NOT NULL,
  `Name_of_InstitutionTHCHC` text NOT NULL,
  `id` int(2) NOT NULL,
  `panchayat_id` int(2) NOT NULL,
  `column_4` varchar(2) NOT NULL,
  `column_5` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_temp`
--

INSERT INTO `19_temp` (`panchayat`, `Name_of_InstitutionTHCHC`, `id`, `panchayat_id`, `column_4`, `column_5`) VALUES
('Corporation', 'CHC Cheruvannoor', 1, 0, '', ''),
('Kadalundi', 'PHC Chaliyam', 2, 69, '', ''),
('Corporation', 'PHC Beypore', 3, 0, '', ''),
('Narikkuni', 'CHC Narikkuni', 4, 0, '', ''),
('Nanamanda', 'PHC Kolathoor', 5, 0, '', ''),
('Thamaasseri', 'TH Thamarasseri', 6, 0, '', ''),
('Puthuppadi', 'PHC Puthuppadi', 7, 0, '', ''),
('Omasseri', 'PHC Omasseri', 8, 0, '', ''),
('Kattippara', 'PHC Kattippara', 9, 59, '', ''),
('Koduvalli', 'TH Koduvalli', 10, 0, '', ''),
('Kakkoor', 'PHC Kakkoor', 11, 0, '', ''),
('Madavoor', 'PHC Madavoor', 12, 55, '', ''),
('Kizhakkoth', 'PHC Kizhakkoth', 13, 54, '', ''),
('Thikkodi', 'CHC Meladi', 14, 25, '', ''),
('Moodadi', 'PHC Moodadi', 15, 44, '', ''),
('Payyoli', 'PHC Iringal', 16, 0, '', ''),
('Arikkulam', 'PHC Arikkulam', 17, 43, '', ''),
('Keezhariyur', 'PHC Keezhariyur', 18, 24, '', ''),
('Thurayur', 'PHC Thurayur', 19, 23, '', ''),
('Mavoor', 'MCH Unit Cheruppa', 20, 62, '', ''),
('Peruvayal', 'PHC Peruvayal', 21, 67, '', ''),
('Perumanna', 'PHC Perumanna', 22, 68, '', ''),
('Kuttiadi', 'TH Kuttiadi', 23, 15, '', ''),
('Kavilumpara', 'PHC Kunduthode', 24, 14, '', ''),
('Kayakkodi', 'PHC Kayakkodi', 25, 13, '', ''),
('Kunnummal', 'PHC Kunnummal', 26, 11, '', ''),
('Naripatta', 'PHC Naripetta', 27, 18, '', ''),
('Nadapuram', 'GH Nadapuram', 28, 12, '', ''),
('Maruthonkara', 'PHC Maruthonkara', 29, 16, '', ''),
('Velam', 'PHC Velam', 30, 0, '', ''),
('Purameri', 'PHC Purameri', 31, 7, '', ''),
('Kodiyathur', 'CHC Cheruvadi', 32, 60, '', ''),
('Kunnamangalam', 'PHC Kunnamangalam', 33, 64, '', ''),
('Chathamangaalam', 'PHC Choolur', 34, 0, '', ''),
('Kaarasseri', 'PHC Karasseri', 35, 0, '', ''),
('Thiruvallur', 'CHC Thiruvalloor', 36, 22, '', ''),
('Maniyur', 'PHC Maniyur', 37, 21, '', ''),
('Ayancheri', 'PHC Ayancheri', 38, 19, '', ''),
('Villiappalli', 'PHC Villiappalli', 39, 0, '', ''),
('Eramala', 'CHC Orkkatteri', 40, 3, '', ''),
('Chorode', 'PHC Chorode', 41, 0, '', ''),
('Azhiyur', 'PHC Azhiyur', 42, 0, '', ''),
('Onchiyam', 'PHC Madappalli', 43, 4, '', ''),
('Chemancheri', 'CHC Thiruvangoor', 44, 0, '', ''),
('Chengottukavu', 'PHC Chengottukavu', 45, 45, '', ''),
('Koyilandi Muncipality', 'Koyilandi Muncipality (4 Div)', 46, 0, '', ''),
('Ulliyeri', 'CHC Ulliyeri', 47, 37, '', ''),
('Kottoor', 'PHC Kottoor', 48, 0, '', ''),
('Naduvannur', 'PHC Naduvannoor', 49, 35, '', ''),
('Atholi', 'PHC Atholi', 50, 36, '', ''),
('Kayanna', 'PHC Kayanna', 51, 30, '', ''),
('Valayam', 'CHC Valayam', 52, 9, '', ''),
('Edacheri', 'PHC Edacheri', 53, 6, '', ''),
('Thuneri', 'PHC Thuneri', 54, 8, '', ''),
('Chekkiad', 'PHC Chekkiad', 55, 5, '', ''),
('Vanimel', 'PHC Vanimel', 56, 10, '', ''),
('Olavanna', 'CHC Olavanna', 57, 70, '', ''),
('Feroke', 'TH Feroke', 58, 71, '', ''),
('Ramanattukara', 'PHC Ramanattukara', 59, 0, '', ''),
('Perambra', 'TH Perambra', 60, 32, '', ''),
('Koothali', 'PHC Koothali', 61, 31, '', ''),
('Cheruvannur', 'PHC Avala', 62, 27, '', ''),
('Meppayur', 'PHC Meppayoor', 63, 26, '', ''),
('Chakkittappara', 'PHC Pannikkottoor', 64, 0, '', ''),
('Chakkittappara', 'PHC Peruvanamoozhi', 65, 0, '', ''),
('Changaroth', 'PHC Changaroth', 66, 29, '', ''),
('Nochad', 'PHC Nochad', 67, 28, '', ''),
('Panangad', 'TH Balusseri', 68, 40, '', ''),
('Panangad', 'PHC Vayalada', 69, 40, '', ''),
('Panangad', 'PHC Panangad', 70, 40, '', ''),
('Unnikulam', 'PHC Mangad', 71, 0, '', ''),
('Balusseri', 'PHC Eramangalam', 72, 0, '', ''),
('Koorachundu', 'PHC Koorachundu', 73, 41, '', ''),
('Koorachundu', 'PHC Kakkyam', 74, 41, '', ''),
('Thalakulathur', 'CHC Thalakulathur', 75, 51, '', ''),
('Kakkodi', 'PHC Kakkodi', 76, 46, '', ''),
('Chelannur', 'PHC Irivalloor', 77, 47, '', ''),
('Corporation', 'PHC Puthiyappa', 78, 0, '', ''),
('Mukkam', 'CHC Mukkam', 79, 0, '', ''),
('Koodaranchi', 'PHC Koodaranchi', 80, 0, '', ''),
('Kuruvattoor', 'PHC Kuruvattoor', 81, 61, '', ''),
('Kodancheri', 'PHC Kodancheri', 82, 0, '', ''),
('Thiruvambadi', 'PHC Thiruvambadi', 83, 52, '', ''),
('.', '', 0, 0, '', '.');

-- --------------------------------------------------------

--
-- Table structure for table `19_triage_history`
--

CREATE TABLE `19_triage_history` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `done_by` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `19_users`
--

CREATE TABLE `19_users` (
  `id` bigint(20) NOT NULL,
  `refer_login_id` int(11) NOT NULL DEFAULT '0',
  `login_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(2) NOT NULL,
  `state_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `panchayat_id` int(11) NOT NULL,
  `chc_id` int(11) NOT NULL DEFAULT '0',
  `village_id` int(11) DEFAULT NULL,
  `address` text NOT NULL,
  `contact_1` varchar(16) DEFAULT NULL,
  `contact_2` varchar(16) DEFAULT NULL,
  `contact_3` varchar(16) DEFAULT NULL,
  `health_status` varchar(2) NOT NULL DEFAULT 'P',
  `approve_3` int(3) NOT NULL DEFAULT '0',
  `approve_2` int(3) NOT NULL DEFAULT '0',
  `registered_by` int(11) NOT NULL DEFAULT '0',
  `added_by` int(11) NOT NULL DEFAULT '0',
  `vulnerability_status` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_users`
--

INSERT INTO `19_users` (`id`, `refer_login_id`, `login_id`, `name`, `gender`, `age`, `state_id`, `district_id`, `panchayat_id`, `chc_id`, `village_id`, `address`, `contact_1`, `contact_2`, `contact_3`, `health_status`, `approve_3`, `approve_2`, `registered_by`, `added_by`, `vulnerability_status`, `date_added`) VALUES
(1, 98, 98, 'asdasd', 'male', 45, 1, 1, 1, 1, 1, 'test ', '', '', '', 'P', 0, 0, 1, 1, '', '2020-03-18 07:31:12'),
(2, 99, 99, 'Abhi', 'male', 34, 1, 1, 7, 1, NULL, 'test1', '', '', '', 'P', 0, 0, 2, 2, '', '2020-03-18 08:04:40'),
(3, 100, 100, 'test', 'male', 36, 1, 1, 4, 1, NULL, 'phc 1', '', '', '', 'P', 0, 0, 0, 0, '', '2020-03-18 11:07:37'),
(4, 101, 101, 'Abhijith', 'male', 34, 1, 1, 1, 1, 1, 'Narikkuni', '', '', '', 'P', 0, 0, 1, 1, '', '2020-03-19 13:23:21'),
(5, 102, 102, 'Fuad', 'male', 27, 1, 1, 74, 1, NULL, 'asdf', '', '', '', 'P', 0, 0, 0, 0, '', '2020-03-20 08:03:40');

-- --------------------------------------------------------

--
-- Table structure for table `19_user_custom_info`
--

CREATE TABLE `19_user_custom_info` (
  `user_id` bigint(20) NOT NULL,
  `sample_1` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `19_verification_history`
--

CREATE TABLE `19_verification_history` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `verified_by` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `19_villages`
--

CREATE TABLE `19_villages` (
  `village_id` int(13) NOT NULL,
  `panchayat_id` int(11) NOT NULL,
  `village_name` varchar(200) NOT NULL,
  `village_name_mal` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_villages`
--

INSERT INTO `19_villages` (`village_id`, `panchayat_id`, `village_name`, `village_name_mal`) VALUES
(1, 1, 'village1', ''),
(2, 1, 'village2', ''),
(3, 2, 'village21', ''),
(4, 2, 'village22', ''),
(5, 3, 'village31', ''),
(6, 3, 'village32', '');

-- --------------------------------------------------------

--
-- Table structure for table `19_vulnerability`
--

CREATE TABLE `19_vulnerability` (
  `id` int(3) NOT NULL,
  `name` text NOT NULL,
  `name_mal` text NOT NULL,
  `img_link` varchar(200) DEFAULT NULL,
  `score` int(3) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `19_vulnerability`
--

INSERT INTO `19_vulnerability` (`id`, `name`, `name_mal`, `img_link`, `score`, `status`) VALUES
(1, 'Cancer', 'കാൻസർ', NULL, 0, 1),
(2, 'HIV/AIDS', 'എച്ച്.ഐ.വി', NULL, 0, 1),
(3, 'Others', 'മറ്റുള്ളവ', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `19_vulnerability_updation_history`
--

CREATE TABLE `19_vulnerability_updation_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vulnerability_1` int(11) NOT NULL DEFAULT '0',
  `vulnerability_2` int(11) NOT NULL DEFAULT '0',
  `vulnerability_3` int(11) NOT NULL DEFAULT '0',
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `19_access_keys`
--
ALTER TABLE `19_access_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_access_limits`
--
ALTER TABLE `19_access_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_chcs`
--
ALTER TABLE `19_chcs`
  ADD PRIMARY KEY (`chc_id`);

--
-- Indexes for table `19_custom_info`
--
ALTER TABLE `19_custom_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_custom_info_options`
--
ALTER TABLE `19_custom_info_options`
  ADD PRIMARY KEY (`custom_option_id`);

--
-- Indexes for table `19_districts`
--
ALTER TABLE `19_districts`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `19_level_user_type`
--
ALTER TABLE `19_level_user_type`
  ADD PRIMARY KEY (`level_type_id`);

--
-- Indexes for table `19_login`
--
ALTER TABLE `19_login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `19_menu`
--
ALTER TABLE `19_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `19_panchayat`
--
ALTER TABLE `19_panchayat`
  ADD PRIMARY KEY (`panchayat_id`);

--
-- Indexes for table `19_phcs`
--
ALTER TABLE `19_phcs`
  ADD PRIMARY KEY (`phc_id`);

--
-- Indexes for table `19_questionnaire`
--
ALTER TABLE `19_questionnaire`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_questionnaire_options`
--
ALTER TABLE `19_questionnaire_options`
  ADD PRIMARY KEY (`custom_option_id`);

--
-- Indexes for table `19_question_answers`
--
ALTER TABLE `19_question_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_question_category`
--
ALTER TABLE `19_question_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_request_aid`
--
ALTER TABLE `19_request_aid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_states`
--
ALTER TABLE `19_states`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `19_symptoms`
--
ALTER TABLE `19_symptoms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_symptoms_updation_history`
--
ALTER TABLE `19_symptoms_updation_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_symptom_approval_history`
--
ALTER TABLE `19_symptom_approval_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_temp`
--
ALTER TABLE `19_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_users`
--
ALTER TABLE `19_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_verification_history`
--
ALTER TABLE `19_verification_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_villages`
--
ALTER TABLE `19_villages`
  ADD PRIMARY KEY (`village_id`);

--
-- Indexes for table `19_vulnerability`
--
ALTER TABLE `19_vulnerability`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `19_vulnerability_updation_history`
--
ALTER TABLE `19_vulnerability_updation_history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `19_access_keys`
--
ALTER TABLE `19_access_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `19_access_limits`
--
ALTER TABLE `19_access_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `19_chcs`
--
ALTER TABLE `19_chcs`
  MODIFY `chc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `19_custom_info`
--
ALTER TABLE `19_custom_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `19_custom_info_options`
--
ALTER TABLE `19_custom_info_options`
  MODIFY `custom_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `19_districts`
--
ALTER TABLE `19_districts`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `19_level_user_type`
--
ALTER TABLE `19_level_user_type`
  MODIFY `level_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `19_login`
--
ALTER TABLE `19_login`
  MODIFY `login_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `19_menu`
--
ALTER TABLE `19_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `19_panchayat`
--
ALTER TABLE `19_panchayat`
  MODIFY `panchayat_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `19_phcs`
--
ALTER TABLE `19_phcs`
  MODIFY `phc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `19_questionnaire`
--
ALTER TABLE `19_questionnaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `19_questionnaire_options`
--
ALTER TABLE `19_questionnaire_options`
  MODIFY `custom_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `19_question_answers`
--
ALTER TABLE `19_question_answers`
  MODIFY `id` int(22) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `19_question_category`
--
ALTER TABLE `19_question_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `19_request_aid`
--
ALTER TABLE `19_request_aid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `19_states`
--
ALTER TABLE `19_states`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `19_symptoms`
--
ALTER TABLE `19_symptoms`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `19_symptoms_updation_history`
--
ALTER TABLE `19_symptoms_updation_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `19_symptom_approval_history`
--
ALTER TABLE `19_symptom_approval_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `19_users`
--
ALTER TABLE `19_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `19_verification_history`
--
ALTER TABLE `19_verification_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `19_villages`
--
ALTER TABLE `19_villages`
  MODIFY `village_id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `19_vulnerability`
--
ALTER TABLE `19_vulnerability`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `19_vulnerability_updation_history`
--
ALTER TABLE `19_vulnerability_updation_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
