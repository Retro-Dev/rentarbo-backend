-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 11, 2023 at 02:02 AM
-- Server version: 5.7.42
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `retrocubedev_rentarbo_qa`
--

-- --------------------------------------------------------

--
-- Table structure for table `ad_banners`
--

CREATE TABLE `ad_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ad_banners`
--

INSERT INTO `ad_banners` (`id`, `slug`, `title`, `description`, `image_url`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '641afbe5646ab', 'Cycle', 'Cycle Media is a burgeoning marketing and content creation conglomerate, which consists of the ad agency Laundry Service and the distributed publisher Cycle. In 2015, Wasserman acquired Laundry Service, which incubated and then spun out the influencer marketing and media network Cycle', 'banners/uOzpqv46WkefENi9UURLrZLCu9os93lyNthRiGHv.jpg', NULL, '2023-03-22 17:00:21', NULL),
(2, '641afbe564dc5', 'Boat', 'Boat Media is a burgeoning marketing and content creation conglomerate, which consists of the ad agency Laundry Service and the distributed publisher Cycle. In 2015, Wasserman acquired Laundry Service, which incubated and then spun out the influencer marketing and media network Cycle', 'banners/uZbmPPp4I5bq3S3yRuV7v4S6aWHZdL7EjeogLUDp.jpg', NULL, '2023-03-22 17:00:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `application_setting`
--

CREATE TABLE `application_setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_file` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `application_setting`
--

INSERT INTO `application_setting` (`id`, `identifier`, `meta_key`, `value`, `is_file`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'application_setting', 'favicon', 'app_setting/V03arKbn6joDkckUAln04MKjHe2RhiBvx7cs2JaX.png', 1, '2023-03-22 17:00:21', NULL, NULL),
(2, 'application_setting', 'logo', 'app_setting/GWrrpg6cvg1epJS0vDp8kqgLrVrXEMLhfKurXXVD.jpg', 1, '2023-03-22 17:00:21', NULL, NULL),
(3, 'application_setting', 'application_name', 'RetroCube', 0, '2023-03-22 17:00:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_owner_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rentar_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `total_charges` decimal(8,2) NOT NULL,
  `admin_tax` decimal(8,2) NOT NULL,
  `net_amount` decimal(8,2) NOT NULL,
  `stripe_fee` decimal(8,2) DEFAULT NULL,
  `from_time` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_time` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_date` date NOT NULL,
  `demo_hosting` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_status` enum('pending','cancelled','rejected','accepted','completed','inprogress') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `returned` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `returned_at` datetime DEFAULT NULL,
  `return_confirmed` datetime DEFAULT NULL,
  `is_repost` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `product_id`, `user_id`, `product_owner_id`, `slug`, `phone_no`, `rentar_name`, `details`, `duration`, `total_charges`, `admin_tax`, `net_amount`, `stripe_fee`, `from_time`, `to_time`, `booking_date`, `demo_hosting`, `booking_status`, `returned`, `returned_at`, `return_confirmed`, `is_repost`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 4, 3, '167954540869002', '+1-20212451345', 'testpm2 testing', 'testing test results and development of the day', 2, 50.00, 0.00, 50.00, 0.00, '09:22', '11:22', '2023-03-23', 'yes', 'completed', '1', '2023-03-23 05:05:37', '2023-03-23 05:05:48', '0', '2023-03-23 08:23:28', '2023-03-23 09:05:48', NULL),
(2, 2, 7, 8, '167965101665820', '+1-8004444895', 'user1 user1', 'ydyf hdyfyf hfycfh hffyfh chhchc hchchc bchch', 1, 522.00, 0.00, 522.00, 0.00, '2023-03-24', '2023-03-24', '2023-03-24', 'yes', 'completed', '1', '2023-03-24 10:22:44', '2023-03-24 10:22:48', '0', '2023-03-24 13:43:36', '2023-03-24 14:22:48', NULL),
(4, 2, 7, 8, '167965349736491', '+1-8004444895', 'user1 user1', 'wefuhfvfyydyf chgcyf chgcdy chcgfy chgchc', 2, 1044.00, 0.00, 1044.00, 0.00, '2023-03-24 00:00:00.000', '2023-03-25 00:00:00.000', '2023-03-24', 'no', 'completed', '1', '2023-03-24 10:25:21', '2023-03-24 10:25:24', '0', '2023-03-24 14:24:57', '2023-03-24 14:25:24', NULL),
(5, 2, 7, 8, '167965404531716', '+1-8004444895', 'user1 user1', 'jchfjf hchcv bhchc bhgcch hvhvhv bhvhv', 1, 522.00, 0.00, 522.00, 0.00, '2023-03-25 00:00:00.000', '2023-03-25 00:00:00.000', '2023-03-24', 'no', 'pending', '0', NULL, NULL, '0', '2023-03-24 14:34:05', '2023-03-24 14:34:05', NULL),
(6, 2, 7, 8, '167965628584726', '+1-8004444895', 'user1 user1', 'gdgdgd dbdbdd bdbd ddvbd ddbdb', 1, 522.00, 0.00, 522.00, 0.00, '2023-03-24 00:00:00.000', '2023-03-24 00:00:00.000', '2023-03-24', 'no', 'completed', '1', '2023-03-27 07:11:53', '2023-03-27 07:12:29', '0', '2023-03-24 15:11:25', '2023-03-27 11:12:29', NULL),
(7, 2, 7, 8, '167990124469938', '+1-8004444895', 'user1 Three', 'hxhcfufuufufuf uffyuff ufuuuf hccjjc fjcj', 1, 522.00, 0.00, 522.00, 0.00, '2023-03-28 00:00:00.000', '2023-03-28 00:00:00.000', '2023-03-27', 'no', 'completed', '1', '2023-03-27 07:18:45', '2023-03-27 07:18:48', '0', '2023-03-27 11:14:04', '2023-03-27 11:18:48', NULL),
(8, 2, 7, 8, '167990157388438', '+1-8004444895', 'user1 Three', 'xbbxdd djdjd djdjd Shan’s djdjd snsjdn', 2, 1044.00, 0.00, 1044.00, 0.00, '2023-03-28 00:00:00.000', '2023-03-29 00:00:00.000', '2023-03-27', 'no', 'completed', '1', '2023-03-27 07:20:12', '2023-03-27 07:20:22', '0', '2023-03-27 11:19:33', '2023-03-27 11:20:22', NULL),
(9, 3, 11, 12, '167998183341679', '+1-2021242512', 'rentarbo one', 'yesting app test app', 2, 50.00, 0.00, 50.00, 0.00, '01:05', '02:37', '2023-03-28', 'yes', 'completed', '1', '2023-03-28 05:41:38', '2023-03-28 05:41:45', '1', '2023-03-28 09:37:13', '2023-03-28 10:19:36', NULL),
(10, 3, 11, 12, '167998265141731', '+1-2021242512', 'rentarbo one', 'yesting project djdjjdjd ejdjjds', 3, 75.00, 0.00, 75.00, 0.00, '01:50', '04:50', '2023-03-28', 'yes', 'completed', '1', '2023-03-28 05:51:27', '2023-03-28 05:51:31', '1', '2023-03-28 09:50:51', '2023-03-28 10:12:12', NULL),
(11, 3, 11, 12, '167998279057461', '+1-2021242512', 'rentarbo one', 'hhdjjdjjd sndjndjd sjdjs', 3, 75.00, 0.00, 75.00, 0.00, '01:52', '04:52', '2023-03-28', 'yes', 'completed', '1', '2023-03-28 05:53:47', '2023-03-28 05:53:50', '1', '2023-03-28 09:53:10', '2023-03-28 10:18:33', NULL),
(12, 3, 11, 12, '167998446071189', '+1-2021242512', 'rentarbo one', 'ndjdjjdje dndnnsje ejdjsjs', 1, 25.00, 0.00, 25.00, 0.00, '01:20', '02:20', '2023-03-28', 'yes', 'completed', '1', '2023-03-28 06:21:32', '2023-03-28 06:21:36', '1', '2023-03-28 10:21:00', '2023-03-28 12:06:48', NULL),
(13, 2, 7, 8, '168017046697862', '+1-8004444895', 'user1 Three', 'hhhhxuf dydhdy dyhddyyd dy dyyd dy', 1, 522.00, 0.00, 522.00, 0.00, '2023-03-30 00:00:00.000', '2023-03-30 00:00:00.000', '2023-03-30', 'no', 'completed', '1', '2023-03-30 10:01:42', '2023-03-30 10:01:45', '0', '2023-03-30 14:01:06', '2023-03-30 14:01:45', NULL),
(14, 5, 8, 7, '168258036762558', '+1-8004447819', 'user2 user2', 'aaaa fffff hhhhh hgggg hhhhh ggvgv', 1, 12.00, 1.59, 9.76, 0.65, '12:25', '13:25', '2023-04-27', 'no', 'completed', '1', '2023-04-27 07:31:56', '2023-04-27 07:32:28', '0', '2023-04-27 11:26:07', '2023-04-27 11:32:28', NULL),
(15, 6, 8, 7, '168267358299868', '+1-8004447819', 'user2 user2', 'kvivig ivivig iviviv ibiviv', 2, 50.00, 6.76, 41.50, 1.75, '14:19', '16:19', '2023-04-28', 'yes', 'pending', '0', NULL, NULL, '0', '2023-04-28 13:19:42', '2023-04-28 13:19:42', NULL),
(16, 6, 8, 7, '168292701863224', '+1-8004447819', 'user2 user2', 'hcchc fufj duf nchuf yfjv cjfvhv cyyc', 3, 75.00, 10.15, 62.37, 2.48, '12:43', '15:43', '2023-05-01', 'no', 'completed', '1', '2023-05-01 07:59:10', '2023-05-01 09:16:22', '0', '2023-05-01 11:43:38', '2023-05-01 13:16:22', NULL),
(17, 8, 7, 8, '168294013448201', '+1-8004444895', 'user1 Three', 'Testing Testing Testing', 1, 60.00, 8.11, 49.85, 2.04, '16:21', '17:21', '2023-05-02', 'yes', 'completed', '1', '2023-05-01 11:27:12', '2023-05-01 11:27:19', '1', '2023-05-01 15:22:14', '2023-05-01 15:30:15', NULL),
(18, 8, 7, 8, '168301189238712', '+1-8004444895', 'user1 Three', 'jcjcjfcjjc. ifgvkvvkfg m hjcc', 2, 120.00, 16.27, 99.95, 3.78, '12:17', '14:17', '2023-05-16', 'no', 'accepted', '1', '2023-05-02 07:21:57', '2023-05-02 07:22:07', '0', '2023-05-02 11:18:12', '2023-05-02 12:02:45', NULL),
(19, 9, 8, 7, '168302031829948', '+1-8004447819', 'user2 user2', 'fhhfgg vvggg vvggh bhghhhh vbbggg bbbhh', 1, 25.00, 3.36, 20.62, 1.03, '14:38', '15:38', '2023-05-02', 'yes', 'completed', '1', '2023-05-02 09:40:41', '2023-05-02 09:40:45', '0', '2023-05-02 13:38:38', '2023-05-02 13:40:45', NULL),
(20, 10, 8, 7, '168302372411196', '+1-8004447819', 'user2 user2', 'ncjcjfigig jcifigig ncjcjf kvkvig jcjf jcif', 2, 50.00, 6.76, 41.50, 1.75, '15:35', '17:35', '2023-05-02', 'yes', 'completed', '1', '2023-05-02 10:38:17', '2023-05-02 10:38:20', '1', '2023-05-02 14:35:24', '2023-05-02 14:39:47', NULL),
(21, 10, 8, 7, '168302403734768', '+1-8004447819', 'user2 user2', 'ncjcjf ncjcjf ncjcjf kgkgkg ncjcjf jfjfif jcjf jfjf', 3, 75.00, 10.15, 62.37, 2.48, '15:40', '18:40', '2023-05-02', 'yes', 'completed', '1', '2023-05-02 10:48:34', '2023-05-02 10:48:39', '1', '2023-05-02 14:40:37', '2023-05-02 14:48:45', NULL),
(22, 10, 8, 7, '168302455976706', '+1-8004447819', 'user2 user2', 'bxjdjfjfjf ncjcjf ncjckf', 2, 50.00, 6.76, 41.50, 1.75, '15:49', '17:49', '2023-05-02', 'yes', 'inprogress', '1', '2023-05-02 11:03:29', NULL, '0', '2023-05-02 14:49:19', '2023-05-02 15:03:29', NULL),
(23, 10, 8, 7, '168302474970450', '+1-8004447819', 'user2 user2', 'hdhdhd ncjcjf ncjcjf jcjf jcjf jfjf', 2, 50.00, 6.76, 41.50, 1.75, '15:52', '17:52', '2023-05-02', 'yes', 'completed', '1', '2023-05-02 10:53:11', '2023-05-02 10:53:16', '1', '2023-05-02 14:52:29', '2023-05-02 15:07:31', NULL),
(24, 10, 8, 7, '168302766720693', '+1-8004447819', 'user2 user2', 'test test test test test test test', 1, 25.00, 3.36, 20.62, 1.03, '16:07', '17:07', '2023-05-02', 'no', 'completed', '1', '2023-05-02 11:42:37', '2023-05-02 11:42:40', '1', '2023-05-02 15:41:07', '2023-05-02 15:43:50', NULL),
(25, 10, 8, 7, '168302789247312', '+1-8004447819', 'user2 user2', 'ncjcjf n jcjf k jcjf kvkcif', 1, 25.00, 3.36, 20.62, 1.03, '16:44', '17:44', '2023-05-02', 'yes', 'completed', '1', '2023-05-02 11:45:35', '2023-05-02 11:45:38', '1', '2023-05-02 15:44:52', '2023-05-02 15:46:35', NULL),
(26, 10, 8, 7, '168302803582343', '+1-8004447819', 'user2 user2', 'jfjfif if ivificig kvkvig kvkvig kvkv', 2, 50.00, 6.76, 41.50, 1.75, '16:46', '18:46', '2023-05-02', 'yes', 'accepted', '0', NULL, NULL, '0', '2023-05-02 15:47:15', '2023-05-02 16:51:37', NULL),
(27, 10, 8, 7, '168303195315621', '+1-8004447819', 'user2 user2', 'gucjfigig kckvkgkg kvkvig kvkvig kvkv', 1, 25.00, 3.36, 20.62, 1.03, '17:52', '18:52', '2023-05-02', 'yes', 'completed', '1', '2023-05-02 12:53:01', '2023-05-02 12:53:04', '0', '2023-05-02 16:52:33', '2023-05-02 16:53:04', NULL),
(28, 7, 8, 7, '168303927937032', '+1-8004447819', 'user2 user2', 'hdhdhdd dbdjd dbdjd dbdjs sbsjs ssn', 2, 50.00, 6.76, 41.50, 1.75, '19:54', '21:54', '2023-05-03', 'no', 'completed', '1', '2023-05-02 14:55:12', '2023-05-02 14:55:18', '1', '2023-05-02 18:54:39', '2023-05-02 18:56:04', NULL),
(29, 7, 8, 7, '168303947014313', '+1-8004447819', 'user2 user2', 'iggigi uguggu fufuuf cuyffu fuuff', 2, 50.00, 6.76, 41.50, 1.75, '19:57', '21:57', '2023-05-04', 'no', 'completed', '1', '2023-05-02 15:02:02', '2023-05-02 15:02:08', '1', '2023-05-02 18:57:50', '2023-05-08 12:05:04', NULL),
(30, 11, 7, 8, '168328724446589', '+1-8004444895', 'user1 Three', 'Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.', 2, 26.00, 3.49, 21.45, 1.05, '2023-05-05 00:00:00.000', '2023-05-06 00:00:00.000', '2023-05-05', 'no', 'completed', '1', '2023-05-05 11:47:56', '2023-05-05 11:48:00', '1', '2023-05-05 15:47:24', '2023-05-05 16:10:02', NULL),
(31, 11, 7, 8, '168328862987945', '+1-8004444895', 'user1 Three', 'Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.Touch and hold a clip to pin it. Unpinned clips will be deleted after 1 hour.', 2, 26.00, 3.49, 21.45, 1.05, '2023-05-05 00:00:00.000', '2023-05-06 00:00:00.000', '2023-05-05', 'no', 'cancelled', '0', NULL, NULL, '0', '2023-05-05 16:10:29', '2023-05-05 16:11:17', NULL),
(32, 11, 7, 8, '168328905772836', '+1-8004444895', 'user1 Three', 'Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.Use the edit icon to pin, add or delete clips.Touch and hold a clip to pin it. Unpinned clips will be deleted after 1 hour.', 2, 26.00, 3.49, 21.45, 1.05, '2023-05-05 00:00:00.000', '2023-05-06 00:00:00.000', '2023-05-05', 'no', 'cancelled', '0', NULL, NULL, '0', '2023-05-05 16:17:37', '2023-05-05 16:29:03', NULL),
(33, 11, 7, 8, '168329020315655', '+1-8004444895', 'user1 Three', 'Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.', 1, 13.00, 1.73, 10.60, 0.68, '2023-05-24 00:00:00.000', '2023-05-24 00:00:00.000', '2023-05-05', 'no', 'completed', '1', '2023-05-05 12:37:23', '2023-05-05 12:37:36', '1', '2023-05-05 16:36:43', '2023-05-05 16:45:45', NULL),
(34, 11, 7, 8, '168329079761210', '+1-8004444895', 'user1 Three', 'Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.', 1, 13.00, 1.73, 10.60, 0.68, '2023-05-06 00:00:00.000', '2023-05-06 00:00:00.000', '2023-05-05', 'no', 'rejected', '0', NULL, NULL, '0', '2023-05-05 16:46:37', '2023-05-05 16:46:44', NULL),
(35, 11, 7, 8, '168329089850294', '+1-8004444895', 'user1 Three', 'Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.', 2, 26.00, 3.49, 21.45, 1.05, '2023-05-05 00:00:00.000', '2023-05-06 00:00:00.000', '2023-05-05', 'no', 'completed', '1', '2023-05-05 12:48:50', '2023-05-05 12:48:53', '1', '2023-05-05 16:48:18', '2023-05-05 16:49:14', NULL),
(36, 11, 7, 8, '168329098873263', '+1-8004444895', 'user1 Three', 'Welcome to Gboard clipboard, any text you copy will be saved here.', 1, 13.00, 1.73, 10.60, 0.68, '2023-05-24 00:00:00.000', '2023-05-24 00:00:00.000', '2023-05-05', 'no', 'cancelled', '0', NULL, NULL, '0', '2023-05-05 16:49:48', '2023-05-05 16:50:08', NULL),
(37, 11, 7, 8, '168329113526370', '+1-8004444895', 'user1 Three', 'Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.', 1, 13.00, 1.73, 10.60, 0.68, '2023-05-18 00:00:00.000', '2023-05-18 00:00:00.000', '2023-05-05', 'no', 'rejected', '0', NULL, NULL, '0', '2023-05-05 16:52:15', '2023-05-05 16:54:06', NULL),
(38, 11, 7, 8, '168329127127652', '+1-8004444895', 'user1 Three', 'Welcome to Gboard clipboard, any text you copy will be saved here.', 1, 13.00, 1.73, 10.60, 0.68, '2023-05-05 00:00:00.000', '2023-05-05 00:00:00.000', '2023-05-05', 'no', 'rejected', '0', NULL, NULL, '0', '2023-05-05 16:54:31', '2023-05-05 16:54:38', NULL),
(39, 11, 7, 8, '168329213512978', '+1-8004444895', 'user1 Three', 'Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.', 2, 26.00, 3.49, 21.45, 1.05, '2023-05-05 00:00:00.000', '2023-05-06 00:00:00.000', '2023-05-05', 'no', 'completed', '1', '2023-05-05 13:09:54', '2023-05-05 13:09:58', '1', '2023-05-05 17:08:55', '2023-05-05 17:18:30', NULL),
(40, 11, 7, 8, '168329273655589', '+1-8004444895', 'user1 Three', 'Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.', 1, 13.00, 1.73, 10.60, 0.68, '2023-05-05 00:00:00.000', '2023-05-05 00:00:00.000', '2023-05-05', 'no', 'cancelled', '0', NULL, NULL, '0', '2023-05-05 17:18:56', '2023-05-05 17:20:03', NULL),
(41, 11, 7, 8, '168329289825358', '+1-8004444895', 'user1 Three', '55Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.', 1, 13.00, 1.73, 10.60, 0.68, '2023-05-24 00:00:00.000', '2023-05-24 00:00:00.000', '2023-05-05', 'no', 'completed', '1', '2023-05-05 13:22:35', '2023-05-05 13:22:40', '1', '2023-05-05 17:21:38', '2023-05-05 17:23:11', NULL),
(42, 11, 7, 8, '168329313362325', '+1-8004444895', 'user1 Three', 'Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.', 1, 13.00, 1.73, 10.60, 0.68, '2023-05-05 00:00:00.000', '2023-05-05 00:00:00.000', '2023-05-05', 'no', 'completed', '1', '2023-05-05 13:26:16', '2023-05-05 13:26:20', '1', '2023-05-05 17:25:33', '2023-05-08 12:33:59', NULL),
(43, 7, 8, 7, '168353315366288', '+1-8004447819', 'user2 user2', 'tasty s jfjfjf fhigfigkm hklhlhoh firing nvkkvkvbcxhd', 1, 25.00, 3.36, 20.62, 1.03, '13:05', '14:05', '2023-05-09', 'no', 'completed', '1', '2023-05-08 08:06:30', '2023-05-08 08:06:34', '0', '2023-05-08 12:05:53', '2023-05-08 12:06:34', NULL),
(44, 11, 10, 8, '168353487072299', '+1-8004444719', 'Retro Cube', 'gijfiffvjg ghhfufyI djcjf cjcj gh jccjjc', 2, 26.00, 3.49, 21.45, 1.05, '2023-05-08 00:00:00.000', '2023-05-09 00:00:00.000', '2023-05-08', 'no', 'completed', '1', '2023-05-08 08:35:19', '2023-05-08 08:35:22', '0', '2023-05-08 12:34:30', '2023-05-08 12:35:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking_statuses`
--

CREATE TABLE `booking_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('return','status','return_confirmed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_value` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_statuses`
--

INSERT INTO `booking_statuses` (`id`, `booking_id`, `user_id`, `type`, `type_value`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'status', 'accepted', NULL, NULL, NULL),
(2, 1, 3, 'status', 'inprogress', NULL, NULL, NULL),
(3, 1, 4, 'return', '1', NULL, NULL, NULL),
(4, 1, 3, 'return_confirmed', '1', NULL, NULL, NULL),
(5, 2, 8, 'status', 'accepted', NULL, NULL, NULL),
(6, 2, 8, 'status', 'inprogress', NULL, NULL, NULL),
(7, 2, 7, 'return', '1', NULL, NULL, NULL),
(8, 2, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(9, 4, 8, 'status', 'accepted', NULL, NULL, NULL),
(10, 4, 8, 'status', 'inprogress', NULL, NULL, NULL),
(11, 4, 7, 'return', '1', NULL, NULL, NULL),
(12, 4, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(13, 6, 8, 'status', 'accepted', NULL, NULL, NULL),
(14, 6, 8, 'status', 'inprogress', NULL, NULL, NULL),
(15, 6, 7, 'return', '1', NULL, NULL, NULL),
(16, 6, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(17, 7, 8, 'status', 'accepted', NULL, NULL, NULL),
(18, 7, 8, 'status', 'inprogress', NULL, NULL, NULL),
(19, 7, 7, 'return', '1', NULL, NULL, NULL),
(20, 7, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(21, 8, 8, 'status', 'accepted', NULL, NULL, NULL),
(22, 8, 8, 'status', 'inprogress', NULL, NULL, NULL),
(23, 8, 7, 'return', '1', NULL, NULL, NULL),
(24, 8, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(25, 9, 12, 'status', 'accepted', NULL, NULL, NULL),
(26, 9, 12, 'status', 'inprogress', NULL, NULL, NULL),
(27, 9, 11, 'return', '1', NULL, NULL, NULL),
(28, 9, 12, 'return_confirmed', '1', NULL, NULL, NULL),
(29, 10, 12, 'status', 'accepted', NULL, NULL, NULL),
(30, 10, 12, 'status', 'inprogress', NULL, NULL, NULL),
(31, 10, 11, 'return', '1', NULL, NULL, NULL),
(32, 10, 12, 'return_confirmed', '1', NULL, NULL, NULL),
(33, 11, 12, 'status', 'accepted', NULL, NULL, NULL),
(34, 11, 12, 'status', 'inprogress', NULL, NULL, NULL),
(35, 11, 11, 'return', '1', NULL, NULL, NULL),
(36, 11, 12, 'return_confirmed', '1', NULL, NULL, NULL),
(37, 12, 12, 'status', 'accepted', NULL, NULL, NULL),
(38, 12, 12, 'status', 'inprogress', NULL, NULL, NULL),
(39, 12, 11, 'return', '1', NULL, NULL, NULL),
(40, 12, 12, 'return_confirmed', '1', NULL, NULL, NULL),
(41, 13, 8, 'status', 'accepted', NULL, NULL, NULL),
(42, 13, 8, 'status', 'inprogress', NULL, NULL, NULL),
(43, 13, 7, 'return', '1', NULL, NULL, NULL),
(44, 13, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(45, 14, 7, 'status', 'accepted', NULL, NULL, NULL),
(46, 14, 7, 'status', 'inprogress', NULL, NULL, NULL),
(47, 14, 7, 'status', 'inprogress', NULL, NULL, NULL),
(48, 14, 7, 'status', 'inprogress', NULL, NULL, NULL),
(49, 14, 7, 'status', 'inprogress', NULL, NULL, NULL),
(50, 14, 7, 'status', 'inprogress', NULL, NULL, NULL),
(51, 14, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(52, 16, 7, 'status', 'accepted', NULL, NULL, NULL),
(53, 16, 7, 'status', 'inprogress', NULL, NULL, NULL),
(54, 16, 7, 'status', 'inprogress', NULL, NULL, NULL),
(55, 16, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(56, 17, 8, 'status', 'accepted', NULL, NULL, NULL),
(57, 17, 8, 'status', 'inprogress', NULL, NULL, NULL),
(58, 17, 8, 'status', 'inprogress', NULL, NULL, NULL),
(59, 17, 8, 'status', 'inprogress', NULL, NULL, NULL),
(60, 17, 8, 'status', 'inprogress', NULL, NULL, NULL),
(61, 17, 8, 'status', 'inprogress', NULL, NULL, NULL),
(62, 17, 7, 'return', '1', NULL, NULL, NULL),
(63, 17, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(64, 18, 8, 'status', 'accepted', NULL, NULL, NULL),
(65, 18, 8, 'status', 'inprogress', NULL, NULL, NULL),
(66, 18, 7, 'return', '1', NULL, NULL, NULL),
(67, 18, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(68, 18, 8, 'status', 'accepted', NULL, NULL, NULL),
(69, 18, 8, 'status', 'accepted', NULL, NULL, NULL),
(70, 18, 8, 'status', 'accepted', NULL, NULL, NULL),
(71, 18, 8, 'status', 'accepted', NULL, NULL, NULL),
(72, 19, 7, 'status', 'accepted', NULL, NULL, NULL),
(73, 19, 7, 'status', 'inprogress', NULL, NULL, NULL),
(74, 19, 8, 'return', '1', NULL, NULL, NULL),
(75, 19, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(76, 20, 7, 'status', 'accepted', NULL, NULL, NULL),
(77, 20, 7, 'status', 'inprogress', NULL, NULL, NULL),
(78, 20, 8, 'return', '1', NULL, NULL, NULL),
(79, 20, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(80, 21, 7, 'status', 'accepted', NULL, NULL, NULL),
(81, 21, 7, 'status', 'inprogress', NULL, NULL, NULL),
(82, 21, 8, 'return', '1', NULL, NULL, NULL),
(83, 21, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(84, 21, 8, 'return', '1', NULL, NULL, NULL),
(85, 21, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(86, 22, 7, 'status', 'accepted', NULL, NULL, NULL),
(87, 22, 7, 'status', 'inprogress', NULL, NULL, NULL),
(88, 22, 8, 'return', '1', NULL, NULL, NULL),
(89, 22, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(90, 23, 7, 'status', 'accepted', NULL, NULL, NULL),
(91, 23, 7, 'status', 'inprogress', NULL, NULL, NULL),
(92, 23, 8, 'return', '1', NULL, NULL, NULL),
(93, 23, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(94, 22, 8, 'return', '1', NULL, NULL, NULL),
(95, 24, 7, 'status', 'accepted', NULL, NULL, NULL),
(96, 24, 7, 'status', 'inprogress', NULL, NULL, NULL),
(97, 24, 8, 'return', '1', NULL, NULL, NULL),
(98, 24, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(99, 25, 7, 'status', 'accepted', NULL, NULL, NULL),
(100, 25, 7, 'status', 'inprogress', NULL, NULL, NULL),
(101, 25, 8, 'return', '1', NULL, NULL, NULL),
(102, 25, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(103, 26, 7, 'status', 'accepted', NULL, NULL, NULL),
(104, 26, 7, 'status', 'inprogress', NULL, NULL, NULL),
(105, 26, 8, 'return', '1', NULL, NULL, NULL),
(106, 26, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(107, 27, 7, 'status', 'accepted', NULL, NULL, NULL),
(108, 27, 7, 'status', 'inprogress', NULL, NULL, NULL),
(109, 27, 8, 'return', '1', NULL, NULL, NULL),
(110, 27, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(111, 28, 7, 'status', 'accepted', NULL, NULL, NULL),
(112, 28, 7, 'status', 'inprogress', NULL, NULL, NULL),
(113, 28, 8, 'return', '1', NULL, NULL, NULL),
(114, 28, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(115, 29, 7, 'status', 'accepted', NULL, NULL, NULL),
(116, 29, 7, 'status', 'inprogress', NULL, NULL, NULL),
(117, 29, 8, 'return', '1', NULL, NULL, NULL),
(118, 29, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(119, 30, 8, 'status', 'accepted', NULL, NULL, NULL),
(120, 30, 8, 'status', 'inprogress', NULL, NULL, NULL),
(121, 30, 7, 'return', '1', NULL, NULL, NULL),
(122, 30, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(123, 31, 8, 'status', 'accepted', NULL, NULL, NULL),
(124, 31, 7, 'status', 'cancelled', NULL, NULL, NULL),
(125, 31, 7, 'status', 'cancelled', NULL, NULL, NULL),
(126, 32, 8, 'status', 'accepted', NULL, NULL, NULL),
(127, 32, 7, 'status', 'cancelled', NULL, NULL, NULL),
(128, 32, 7, 'status', 'cancelled', NULL, NULL, NULL),
(129, 33, 8, 'status', 'accepted', NULL, NULL, NULL),
(130, 33, 8, 'status', 'inprogress', NULL, NULL, NULL),
(131, 33, 7, 'return', '1', NULL, NULL, NULL),
(132, 33, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(133, 34, 8, 'status', 'rejected', NULL, NULL, NULL),
(134, 35, 8, 'status', 'accepted', NULL, NULL, NULL),
(135, 35, 8, 'status', 'inprogress', NULL, NULL, NULL),
(136, 35, 7, 'return', '1', NULL, NULL, NULL),
(137, 35, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(138, 36, 8, 'status', 'accepted', NULL, NULL, NULL),
(139, 36, 7, 'status', 'cancelled', NULL, NULL, NULL),
(140, 37, 8, 'status', 'rejected', NULL, NULL, NULL),
(141, 37, 8, 'status', 'rejected', NULL, NULL, NULL),
(142, 38, 8, 'status', 'rejected', NULL, NULL, NULL),
(143, 39, 8, 'status', 'accepted', NULL, NULL, NULL),
(144, 39, 8, 'status', 'inprogress', NULL, NULL, NULL),
(145, 39, 8, 'status', 'inprogress', NULL, NULL, NULL),
(146, 39, 7, 'return', '1', NULL, NULL, NULL),
(147, 39, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(148, 40, 8, 'status', 'accepted', NULL, NULL, NULL),
(149, 40, 7, 'status', 'cancelled', NULL, NULL, NULL),
(150, 41, 8, 'status', 'accepted', NULL, NULL, NULL),
(151, 41, 8, 'status', 'inprogress', NULL, NULL, NULL),
(152, 41, 8, 'status', 'inprogress', NULL, NULL, NULL),
(153, 41, 7, 'return', '1', NULL, NULL, NULL),
(154, 41, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(155, 42, 8, 'status', 'accepted', NULL, NULL, NULL),
(156, 42, 8, 'status', 'inprogress', NULL, NULL, NULL),
(157, 42, 7, 'return', '1', NULL, NULL, NULL),
(158, 42, 8, 'return_confirmed', '1', NULL, NULL, NULL),
(159, 43, 7, 'status', 'accepted', NULL, NULL, NULL),
(160, 43, 7, 'status', 'inprogress', NULL, NULL, NULL),
(161, 43, 8, 'return', '1', NULL, NULL, NULL),
(162, 43, 7, 'return_confirmed', '1', NULL, NULL, NULL),
(163, 44, 8, 'status', 'accepted', NULL, NULL, NULL),
(164, 44, 8, 'status', 'inprogress', NULL, NULL, NULL),
(165, 44, 10, 'return', '1', NULL, NULL, NULL),
(166, 44, 8, 'return_confirmed', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Property', 'Property', 'A boat is a watercraft of a large range of types and sizes, but generally smaller than a ship, which is distinguished by its larger size, shape, cargo or passenger capacity, or its ability to carry boats', 'category/boat.jpg', 1, '2023-03-22 17:00:21', NULL, NULL),
(2, 'Vehicles', 'Vehicles', 'A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods', 'category/car.jpg', 1, '2023-03-22 17:00:21', NULL, NULL),
(3, 'Bikes', 'Bikes', 'A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods', 'category/car.jpg', 1, '2023-03-22 17:00:21', NULL, NULL),
(4, 'Books', 'Books', 'A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods', 'category/car.jpg', 1, '2023-03-22 17:00:21', NULL, NULL),
(5, 'Electronics', 'Electronics', 'A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods', 'category/car.jpg', 1, '2023-03-22 17:00:21', NULL, NULL),
(6, 'Home Appliances', 'home-appliances', 'A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods', 'category/car.jpg', 1, '2023-03-22 17:00:21', NULL, NULL),
(7, 'Musical Instruments', 'musical-instruments', 'A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods', 'category/car.jpg', 1, '2023-03-22 17:00:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_users`
--

CREATE TABLE `category_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_users`
--

INSERT INTO `category_users` (`id`, `user_id`, `category_id`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 7, '641bd24e92c42167954491090163', NULL, '2023-03-23 08:15:10', NULL),
(2, 3, 6, '641bd24e93204167954491069411', NULL, '2023-03-23 08:15:10', NULL),
(3, 3, 5, '641bd24e934fd167954491096099', NULL, '2023-03-23 08:15:10', NULL),
(4, 3, 4, '641bd24e93cac167954491073529', NULL, '2023-03-23 08:15:10', NULL),
(5, 3, 3, '641bd24e9401e167954491061598', NULL, '2023-03-23 08:15:10', NULL),
(6, 3, 2, '641bd24e9434e167954491081406', NULL, '2023-03-23 08:15:10', NULL),
(7, 3, 1, '641bd24e945f5167954491098768', NULL, '2023-03-23 08:15:10', NULL),
(8, 4, 7, '641bd2e802f9e167954506482252', '2023-03-23 09:54:09', '2023-03-23 08:17:44', '2023-03-23 09:54:09'),
(9, 4, 6, '641bd2e8033aa167954506483501', '2023-03-23 09:54:09', '2023-03-23 08:17:44', '2023-03-23 09:54:09'),
(10, 4, 5, '641bd2e803774167954506438031', '2023-03-23 09:54:09', '2023-03-23 08:17:44', '2023-03-23 09:54:09'),
(11, 4, 4, '641bd2e804503167954506415734', '2023-03-23 09:54:09', '2023-03-23 08:17:44', '2023-03-23 09:54:09'),
(12, 4, 3, '641bd2e804907167954506454842', '2023-03-23 09:54:09', '2023-03-23 08:17:44', '2023-03-23 09:54:09'),
(13, 4, 2, '641bd2e804ce5167954506460150', '2023-03-23 09:54:09', '2023-03-23 08:17:44', '2023-03-23 09:54:09'),
(14, 4, 1, '641bd2e805079167954506460693', '2023-03-23 09:54:09', '2023-03-23 08:17:44', '2023-03-23 09:54:09'),
(15, 4, 7, '641be981cdf11167955084920833', NULL, '2023-03-23 09:54:09', NULL),
(16, 4, 6, '641be981ce3b8167955084967309', NULL, '2023-03-23 09:54:09', NULL),
(17, 4, 3, '641be981ce7a2167955084968959', NULL, '2023-03-23 09:54:09', NULL),
(18, 4, 2, '641be981ceb87167955084996585', NULL, '2023-03-23 09:54:09', NULL),
(19, 4, 1, '641be981cf379167955084988273', NULL, '2023-03-23 09:54:09', NULL),
(20, 5, 7, '641d45d09e901167964001651955', NULL, '2023-03-24 10:40:16', NULL),
(21, 5, 6, '641d45d09efc1167964001640195', NULL, '2023-03-24 10:40:16', NULL),
(22, 5, 5, '641d45d09f352167964001635009', NULL, '2023-03-24 10:40:16', NULL),
(23, 5, 4, '641d45d09f701167964001615813', NULL, '2023-03-24 10:40:16', NULL),
(24, 5, 3, '641d45d09fbb6167964001680072', NULL, '2023-03-24 10:40:16', NULL),
(25, 5, 2, '641d45d0a0598167964001668710', NULL, '2023-03-24 10:40:16', NULL),
(26, 5, 1, '641d45d0a0946167964001656038', NULL, '2023-03-24 10:40:16', NULL),
(27, 6, 7, '641d466848768167964016884650', NULL, '2023-03-24 10:42:48', NULL),
(28, 6, 6, '641d466848b33167964016825212', NULL, '2023-03-24 10:42:48', NULL),
(29, 6, 5, '641d466849340167964016820876', NULL, '2023-03-24 10:42:48', NULL),
(30, 6, 4, '641d4668496bd167964016870743', NULL, '2023-03-24 10:42:48', NULL),
(31, 6, 3, '641d466849b61167964016869411', NULL, '2023-03-24 10:42:48', NULL),
(32, 6, 2, '641d466849ed3167964016876446', NULL, '2023-03-24 10:42:48', NULL),
(33, 6, 1, '641d46684a217167964016887053', NULL, '2023-03-24 10:42:48', NULL),
(34, 7, 7, '641d6830ea036167964881653503', '2023-05-08 12:29:56', '2023-03-24 13:06:56', '2023-05-08 12:29:56'),
(35, 7, 6, '641d6830ea488167964881643600', '2023-05-08 12:29:56', '2023-03-24 13:06:56', '2023-05-08 12:29:56'),
(36, 7, 5, '641d6830ea897167964881630151', '2023-05-08 12:29:56', '2023-03-24 13:06:56', '2023-05-08 12:29:56'),
(37, 7, 4, '641d6830eac29167964881676389', '2023-05-08 12:29:56', '2023-03-24 13:06:56', '2023-05-08 12:29:56'),
(38, 7, 3, '641d6830eaf5f167964881612462', '2023-05-08 12:29:56', '2023-03-24 13:06:56', '2023-05-08 12:29:56'),
(39, 7, 2, '641d6830eb230167964881645745', '2023-05-08 12:29:56', '2023-03-24 13:06:56', '2023-05-08 12:29:56'),
(40, 7, 1, '641d6830ebd48167964881690441', '2023-05-08 12:29:56', '2023-03-24 13:06:56', '2023-05-08 12:29:56'),
(41, 8, 7, '641d6a8322b24167964941158578', NULL, '2023-03-24 13:16:51', NULL),
(42, 8, 6, '641d6a8322f0b167964941190948', NULL, '2023-03-24 13:16:51', NULL),
(43, 8, 5, '641d6a83232c5167964941122157', NULL, '2023-03-24 13:16:51', NULL),
(44, 8, 4, '641d6a83236b5167964941160939', NULL, '2023-03-24 13:16:51', NULL),
(45, 8, 3, '641d6a8323a62167964941165349', NULL, '2023-03-24 13:16:51', NULL),
(46, 8, 2, '641d6a83245de167964941155158', NULL, '2023-03-24 13:16:51', NULL),
(47, 8, 1, '641d6a8324999167964941192901', NULL, '2023-03-24 13:16:51', NULL),
(48, 9, 7, '64214bf910c65167990373780254', NULL, '2023-03-27 11:55:37', NULL),
(49, 9, 6, '64214bf9112f2167990373717251', NULL, '2023-03-27 11:55:37', NULL),
(50, 9, 5, '64214bf91166e167990373767065', NULL, '2023-03-27 11:55:37', NULL),
(51, 9, 4, '64214bf911a94167990373780794', NULL, '2023-03-27 11:55:37', NULL),
(52, 9, 3, '64214bf911eae167990373766721', NULL, '2023-03-27 11:55:37', NULL),
(53, 9, 2, '64214bf9122fe167990373721345', NULL, '2023-03-27 11:55:37', NULL),
(54, 9, 1, '64214bf91274c167990373757400', NULL, '2023-03-27 11:55:37', NULL),
(55, 10, 7, '6421548cb20a0167990593247924', NULL, '2023-03-27 12:32:12', NULL),
(56, 10, 6, '6421548cb256a167990593214908', NULL, '2023-03-27 12:32:12', NULL),
(57, 10, 5, '6421548cb2948167990593226518', NULL, '2023-03-27 12:32:12', NULL),
(58, 10, 4, '6421548cb2d5a167990593228345', NULL, '2023-03-27 12:32:12', NULL),
(59, 10, 3, '6421548cb3145167990593213593', NULL, '2023-03-27 12:32:12', NULL),
(60, 10, 2, '6421548cb357a167990593233133', NULL, '2023-03-27 12:32:12', NULL),
(61, 10, 1, '6421548cb3993167990593220765', NULL, '2023-03-27 12:32:12', NULL),
(62, 11, 7, '6422754e6eedb167997985432335', NULL, '2023-03-28 09:04:14', NULL),
(63, 11, 6, '6422754e6f442167997985482599', NULL, '2023-03-28 09:04:14', NULL),
(64, 11, 5, '6422754e6f847167997985492987', NULL, '2023-03-28 09:04:14', NULL),
(65, 11, 4, '6422754e6fc74167997985411364', NULL, '2023-03-28 09:04:14', NULL),
(66, 11, 3, '6422754e70093167997985467139', NULL, '2023-03-28 09:04:14', NULL),
(67, 11, 2, '6422754e7046f167997985497754', NULL, '2023-03-28 09:04:14', NULL),
(68, 11, 1, '6422754e70835167997985460084', NULL, '2023-03-28 09:04:14', NULL),
(69, 12, 7, '642279842f42b167998093251782', NULL, '2023-03-28 09:22:12', NULL),
(70, 12, 6, '642279842f989167998093271114', NULL, '2023-03-28 09:22:12', NULL),
(71, 12, 5, '6422798430853167998093237739', NULL, '2023-03-28 09:22:12', NULL),
(72, 12, 4, '6422798430da7167998093222841', NULL, '2023-03-28 09:22:12', NULL),
(73, 12, 3, '6422798431236167998093279044', NULL, '2023-03-28 09:22:12', NULL),
(74, 12, 2, '642279843167e167998093253059', NULL, '2023-03-28 09:22:12', NULL),
(75, 12, 1, '6422798431a51167998093212955', NULL, '2023-03-28 09:22:12', NULL),
(76, 7, 7, '6458b3048aa43168353459670460', NULL, '2023-05-08 12:29:56', NULL),
(77, 7, 6, '6458b3048b01d168353459645602', NULL, '2023-05-08 12:29:56', NULL),
(78, 7, 5, '6458b3048b313168353459638093', NULL, '2023-05-08 12:29:56', NULL),
(79, 7, 4, '6458b3048b72c168353459639989', NULL, '2023-05-08 12:29:56', NULL),
(80, 7, 2, '6458b3048bad3168353459699901', NULL, '2023-05-08 12:29:56', NULL),
(81, 7, 1, '6458b3048be24168353459624855', NULL, '2023-05-08 12:29:56', NULL),
(82, 13, 7, '6458b33ac564c168353465089107', NULL, '2023-05-08 12:30:50', NULL),
(83, 13, 6, '6458b33ac5a3e168353465016454', NULL, '2023-05-08 12:30:50', NULL),
(84, 13, 5, '6458b33ac5deb168353465024585', NULL, '2023-05-08 12:30:50', NULL),
(85, 13, 4, '6458b33ac6263168353465054186', NULL, '2023-05-08 12:30:50', NULL),
(86, 13, 3, '6458b33ac6d3c168353465027617', NULL, '2023-05-08 12:30:50', NULL),
(87, 13, 2, '6458b33ac700f168353465010079', NULL, '2023-05-08 12:30:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `chat_room_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `message_type` varchar(33) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `file_url` text COLLATE utf8mb4_unicode_ci,
  `file_data` text COLLATE utf8mb4_unicode_ci,
  `custom_data` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_anonymous` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `user_id`, `chat_room_id`, `message`, `message_type`, `file_url`, `file_data`, `custom_data`, `ip_address`, `is_anonymous`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7, 2, 'hi', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-03-30 13:27:26', NULL, NULL),
(2, 7, 2, 'hi', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-03-30 15:32:56', NULL, NULL),
(3, 8, 2, 'ok', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-03-30 15:33:01', NULL, NULL),
(4, 7, 2, 'hii', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-01 11:43:50', NULL, NULL),
(5, 7, 2, 'hiii', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-01 11:43:56', NULL, NULL),
(6, 7, 2, 'hello', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-01 14:54:22', NULL, NULL),
(7, 7, 2, '??', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-01 14:55:16', NULL, NULL),
(8, 7, 2, 'hi', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-02 19:01:34', NULL, NULL),
(9, 7, 2, 'hiiii', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-05 15:48:13', NULL, NULL),
(10, 7, 2, 'hi', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-05 16:55:30', NULL, NULL),
(11, 8, 2, 'ok', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-05 16:55:44', NULL, NULL),
(12, 7, 2, 'hooo', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-05 16:55:49', NULL, NULL),
(13, 7, 2, 'hiii', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-05 16:56:02', NULL, NULL),
(14, 7, 2, 'hiiii', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-05 17:32:52', NULL, NULL),
(15, 7, 2, 'cjgjjv', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-05 17:33:58', NULL, NULL),
(16, 7, 2, 'jvkvkv', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-05 17:34:08', NULL, NULL),
(17, 8, 2, 'ggtty', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-05 17:34:28', NULL, NULL),
(18, 8, 2, 'fhbfbd', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-05 17:34:35', NULL, NULL),
(19, 8, 2, 'xbnchdgs', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-05 17:34:48', NULL, NULL),
(20, 7, 2, 'hiii', 'text', NULL, NULL, NULL, NULL, 0, 1, '2023-05-08 12:15:54', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_message_status`
--

CREATE TABLE `chat_message_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `chat_room_id` bigint(20) UNSIGNED NOT NULL,
  `chat_message_id` int(11) NOT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_message_status`
--

INSERT INTO `chat_message_status` (`id`, `user_id`, `chat_room_id`, `chat_message_id`, `is_read`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 8, 2, 1, 1, NULL, NULL, NULL),
(2, 7, 2, 1, 1, NULL, NULL, NULL),
(3, 8, 2, 2, 1, NULL, NULL, NULL),
(4, 7, 2, 2, 1, NULL, NULL, NULL),
(5, 8, 2, 3, 1, NULL, NULL, NULL),
(6, 7, 2, 3, 1, NULL, NULL, NULL),
(7, 8, 2, 4, 1, NULL, NULL, NULL),
(8, 7, 2, 4, 1, NULL, NULL, NULL),
(9, 8, 2, 5, 1, NULL, NULL, NULL),
(10, 7, 2, 5, 1, NULL, NULL, NULL),
(11, 8, 2, 6, 1, NULL, NULL, NULL),
(12, 7, 2, 6, 1, NULL, NULL, NULL),
(13, 8, 2, 7, 1, NULL, NULL, NULL),
(14, 7, 2, 7, 1, NULL, NULL, NULL),
(15, 8, 2, 8, 1, NULL, NULL, NULL),
(16, 7, 2, 8, 1, NULL, NULL, NULL),
(17, 8, 2, 9, 1, NULL, NULL, NULL),
(18, 7, 2, 9, 1, NULL, NULL, NULL),
(19, 8, 2, 10, 1, NULL, NULL, NULL),
(20, 7, 2, 10, 1, NULL, NULL, NULL),
(21, 8, 2, 11, 1, NULL, NULL, NULL),
(22, 7, 2, 11, 1, NULL, NULL, NULL),
(23, 8, 2, 12, 1, NULL, NULL, NULL),
(24, 7, 2, 12, 1, NULL, NULL, NULL),
(25, 8, 2, 13, 1, NULL, NULL, NULL),
(26, 7, 2, 13, 1, NULL, NULL, NULL),
(27, 8, 2, 14, 1, NULL, NULL, NULL),
(28, 7, 2, 14, 1, NULL, NULL, NULL),
(29, 8, 2, 15, 1, NULL, NULL, NULL),
(30, 7, 2, 15, 1, NULL, NULL, NULL),
(31, 8, 2, 16, 1, NULL, NULL, NULL),
(32, 7, 2, 16, 1, NULL, NULL, NULL),
(33, 8, 2, 17, 1, NULL, NULL, NULL),
(34, 7, 2, 17, 1, NULL, NULL, NULL),
(35, 8, 2, 18, 1, NULL, NULL, NULL),
(36, 7, 2, 18, 1, NULL, NULL, NULL),
(37, 8, 2, 19, 1, NULL, NULL, NULL),
(38, 7, 2, 19, 1, NULL, NULL, NULL),
(39, 8, 2, 20, 0, NULL, NULL, NULL),
(40, 7, 2, 20, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comments',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(33) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'single',
  `member_limit` int(11) NOT NULL DEFAULT '0',
  `is_anonymous` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_rooms`
--

INSERT INTO `chat_rooms` (`id`, `created_by`, `slug`, `identifier`, `title`, `image_url`, `description`, `type`, `member_limit`, `is_anonymous`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, '641bddfe0346e1679547902', '1679547902', 'Booking', 'ff', 'ff', 'single', 0, 0, 1, '2023-03-23 09:05:02', '2023-03-23 09:05:02', NULL),
(2, 8, '641d79e0d5bea1679653344', '1679653344', 'Booking', 'ff', 'ff', 'single', 0, 0, 1, '2023-03-24 14:22:24', '2023-03-24 14:22:24', NULL),
(3, 12, '64227d827a2d91679981954', '1679981954', 'Booking', 'ff', 'ff', 'single', 0, 0, 1, '2023-03-28 09:39:14', '2023-03-28 09:39:14', NULL),
(4, 8, '6458b4295947f1683534889', '1683534889', 'Booking', 'ff', 'ff', 'single', 0, 0, 1, '2023-05-08 12:34:49', '2023-05-08 12:34:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_room_status`
--

CREATE TABLE `chat_room_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `chat_room_id` bigint(20) UNSIGNED NOT NULL,
  `chat_message_id` bigint(20) UNSIGNED NOT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_room_users`
--

CREATE TABLE `chat_room_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chat_room_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `last_chat_message_id` int(11) NOT NULL,
  `last_message_timestamp` datetime DEFAULT NULL,
  `unread_message_counts` int(11) NOT NULL DEFAULT '0',
  `is_anonymous` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `is_owner` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_room_users`
--

INSERT INTO `chat_room_users` (`id`, `chat_room_id`, `user_id`, `last_chat_message_id`, `last_message_timestamp`, `unread_message_counts`, `is_anonymous`, `status`, `is_owner`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, 0, '2023-03-23 05:05:02', 0, 0, 1, 1, '2023-03-23 09:05:02', NULL, NULL),
(2, 1, 4, 0, '2023-03-23 05:05:02', 0, 0, 1, 0, '2023-03-23 09:05:02', NULL, NULL),
(3, 2, 8, 20, '2023-05-08 08:15:54', 1, 0, 0, 1, '2023-03-24 14:22:24', NULL, NULL),
(4, 2, 7, 20, '2023-05-08 08:15:54', 0, 0, 0, 0, '2023-03-24 14:22:24', NULL, NULL),
(5, 3, 12, 0, '2023-03-28 05:39:14', 0, 0, 0, 1, '2023-03-28 09:39:14', NULL, NULL),
(6, 3, 11, 0, '2023-03-28 05:39:14', 0, 0, 0, 0, '2023-03-28 09:39:14', NULL, NULL),
(7, 4, 8, 0, '2023-05-08 08:34:49', 0, 0, 1, 1, '2023-05-08 12:34:49', NULL, NULL),
(8, 4, 10, 0, '2023-05-08 08:34:49', 0, 0, 1, 0, '2023-05-08 12:34:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_modules`
--

CREATE TABLE `cms_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fa fa-list',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `sort_order` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_modules`
--

INSERT INTO `cms_modules` (`id`, `parent_id`, `name`, `route_name`, `icon`, `status`, `sort_order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'Cms Roles Management', 'cms-roles-management.index', 'fa fa-key', '1', 1.00, '2023-03-22 17:00:21', NULL, NULL),
(2, 0, 'Cms Users Management', 'cms-users-management.index', 'fa fa-users', '1', 2.00, '2023-03-22 17:00:21', NULL, NULL),
(3, 0, 'Application Setting', 'admin.application-setting', 'fa fa-cog', '1', 3.00, '2023-03-22 17:00:21', NULL, NULL),
(4, 0, 'Users Management', 'app-users.index', 'fa fa-users', '1', 4.00, '2023-03-22 17:00:21', NULL, NULL),
(5, 0, 'Content Management', 'content-management.index', 'fa fa-tasks', '1', 5.00, '2023-03-22 17:00:21', NULL, NULL),
(6, 0, 'FAQ`s', 'faq.index', 'fa fa-question-circle-o', '1', 6.00, '2023-03-22 17:00:21', NULL, NULL),
(7, 0, 'Category', 'category.index', 'fa fa-square', '1', 7.00, '2023-03-22 17:00:21', NULL, NULL),
(8, 0, 'Ads', 'product.index', 'fa fa-database', '1', 8.00, '2023-03-22 17:00:21', NULL, NULL),
(9, 0, 'Disputes', 'dispute.index', 'fa fa-question-circle-o', '1', 14.00, '2023-03-22 17:00:21', NULL, NULL),
(10, 0, 'Payment Management', 'user-transaction.index', 'fa fa-money', '1', 10.00, '2023-03-22 17:00:21', NULL, NULL),
(11, 0, 'Reviews', 'reviews.index', 'fa fa-comments', '1', 11.00, '2023-03-22 17:00:21', NULL, NULL),
(12, 0, 'Notification', 'notification.index', 'fa fa-bell', '1', 12.00, '2023-03-22 17:00:21', NULL, NULL),
(13, 0, 'Contact Us', 'contact.index', 'fa fa-address-book', '1', 13.00, '2023-03-22 17:00:21', NULL, NULL),
(14, 0, 'Bookings', 'booking.index', 'fa-solid fa-book', '1', 9.00, '2023-03-22 17:00:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_module_permissions`
--

CREATE TABLE `cms_module_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) UNSIGNED NOT NULL,
  `cms_module_id` bigint(20) UNSIGNED NOT NULL,
  `is_add` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_view` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_update` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_delete` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_module_permissions`
--

INSERT INTO `cms_module_permissions` (`id`, `user_id`, `user_group_id`, `cms_module_id`, `is_add`, `is_view`, `is_update`, `is_delete`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 3, 3, '1', '1', '1', '1', '2023-03-22 17:00:21', NULL, NULL),
(2, 2, 3, 4, '1', '1', '1', '1', '2023-03-22 17:00:21', NULL, NULL),
(3, 2, 3, 5, '1', '1', '1', '1', '2023-03-22 17:00:21', NULL, NULL),
(4, 2, 3, 6, '1', '1', '1', '1', '2023-03-22 17:00:21', NULL, NULL),
(5, 2, 3, 7, '1', '1', '1', '1', '2023-03-22 17:00:21', NULL, NULL),
(6, 2, 3, 8, '1', '1', '1', '1', '2023-03-22 17:00:21', NULL, NULL),
(7, 2, 3, 9, '1', '1', '1', '1', '2023-03-22 17:00:21', NULL, NULL),
(8, 2, 3, 10, '1', '1', '1', '1', '2023-03-22 17:00:21', NULL, NULL),
(9, 2, 3, 11, '1', '1', '1', '1', '2023-03-22 17:00:21', NULL, NULL),
(10, 2, 3, 12, '1', '1', '1', '1', '2023-03-22 17:00:21', NULL, NULL),
(11, 2, 3, 13, '1', '1', '1', '1', '2023-03-22 17:00:21', NULL, NULL),
(12, 2, 3, 14, '1', '1', '1', '1', '2023-03-22 17:00:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_widgets`
--

CREATE TABLE `cms_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `div_column_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_type` enum('small_box','line_chart','bar_chat','pie_chart','map_chart') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sql` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_widgets`
--

INSERT INTO `cms_widgets` (`id`, `title`, `slug`, `description`, `icon`, `color`, `div_column_class`, `link`, `widget_type`, `sql`, `config`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Total User', '1679490021641afbe55fa82', NULL, 'icon-user', '#4b71fa', 'col-md-3', '/admin/app-users', 'small_box', 'Select count(*) from users limit 1', NULL, '0', NULL, NULL, NULL),
(2, 'Total Earnings', '1679490021641afbe55fa88', NULL, 'icon-people', '#7bcb4d', 'col-md-3', '/admin/app-users', 'small_box', 'Select COALESCE(sum(admin_tax),0) from user_transactions limit 1', NULL, '0', NULL, NULL, NULL),
(3, 'Pending Booking', '1679490021641afbe55fa89', NULL, 'icon-user', '#4b71fa', 'col-md-3', '/admin/app-users', 'small_box', 'Select count(*) from bookings where booking_status=\'pending\' limit 1', NULL, '0', NULL, NULL, NULL),
(4, 'Inprogress Booking', '1679490021641afbe55fa8a', NULL, 'icon-people', '#7bcb4d ', 'col-md-3', '/admin/app-users', 'small_box', 'Select count(*) from bookings where booking_status=\'inprogress\' limit 1', NULL, '0', NULL, NULL, NULL),
(5, 'Completed Booking', '1679490021641afbe55fa8b', NULL, 'icon-user', '#fff', 'col-md-12', '/admin/app-users', 'line_chart', 'Select count(*) from bookings where booking_status=\'completed\' limit 1', NULL, '0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_widget_role`
--

CREATE TABLE `cms_widget_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cms_widget_id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_widget_role`
--

INSERT INTO `cms_widget_role` (`id`, `cms_widget_id`, `user_group_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, 2, '2023-03-22 17:00:21', NULL, NULL),
(2, 2, 3, 2, '2023-03-22 17:00:21', NULL, NULL),
(3, 3, 3, 2, '2023-03-22 17:00:21', NULL, NULL),
(4, 4, 3, 2, '2023-03-22 17:00:21', NULL, NULL),
(5, 5, 3, 2, '2023-03-22 17:00:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `booking_id`, `product_id`, `slug`, `comment`, `rating`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 7, 2, 2, '88564comment1679653384', 'aaaa assault aaaa aaa aaa', 4, NULL, '2023-03-24 14:23:04', '2023-03-24 14:23:04'),
(3, 7, 4, 2, '53104comment1679910729', 'tgyhbj', 3, NULL, '2023-03-27 13:52:09', '2023-03-27 13:52:09'),
(4, 11, 9, 3, '11250comment1679982601', 'hdhdjjdjx', 3, NULL, '2023-03-28 09:50:01', '2023-03-28 09:50:01'),
(5, 11, 10, 3, '22482comment1679982731', 'gghu', 3, NULL, '2023-03-28 09:52:11', '2023-03-28 09:52:11'),
(6, 7, 13, 2, '53812comment1680170517', 'hfyxtt ddyysys susysydy  dsyydsy', 3, NULL, '2023-03-30 14:01:57', '2023-03-30 14:01:57'),
(7, 7, 8, 2, '65262comment1682681587', 'ndjdjdndje nsnsn', 3, NULL, '2023-04-28 15:33:07', '2023-04-28 15:33:07'),
(8, 8, 14, 5, '43876comment1682682963', 'jckckckfig kvivig kvkcig', 3, NULL, '2023-04-28 15:56:03', '2023-04-28 15:56:03'),
(9, 8, 16, 6, '74784comment1682932599', '3xfgxfgxdhh chxfg  gbcfh cyv', 3, NULL, '2023-05-01 13:16:39', '2023-05-01 13:16:39'),
(10, 7, 17, 8, '30081comment1682940605', 'ggg', 3, NULL, '2023-05-01 15:30:05', '2023-05-01 15:30:05'),
(11, 7, 18, 8, '45604comment1683012139', 'aaaa fdddd', 3, NULL, '2023-05-02 11:22:19', '2023-05-02 11:22:19'),
(12, 8, 19, 9, '89915comment1683020455', 'gghhhhhhh', 3, NULL, '2023-05-02 13:40:55', '2023-05-02 13:40:55'),
(13, 8, 20, 10, '58472comment1683023916', 'Hdhdhdhd hdhdhd jfjfif', 3, NULL, '2023-05-02 14:38:36', '2023-05-02 14:38:36'),
(14, 8, 21, 10, '51725comment1683024104', 'ncjcjf ncjcjf if ncjcjf jvkv', 3, NULL, '2023-05-02 14:41:44', '2023-05-02 14:41:44'),
(15, 8, 22, 10, '73328comment1683024639', 'ncjcjf ncjcjf mckc', 3, NULL, '2023-05-02 14:50:39', '2023-05-02 14:50:39'),
(16, 8, 23, 10, '68035comment1683024803', 'jcjfiffi kcjcif jcjckf', 3, NULL, '2023-05-02 14:53:23', '2023-05-02 14:53:23'),
(17, 8, 24, 10, '51299comment1683027771', 'hdhdhd jfjfif ifig', 3, NULL, '2023-05-02 15:42:51', '2023-05-02 15:42:51'),
(18, 8, 25, 10, '30435comment1683027946', 'jcjcjvkg kvkvig kvkvig', 3, NULL, '2023-05-02 15:45:46', '2023-05-02 15:45:46'),
(19, 8, 26, 10, '47662comment1683028093', 'djdjdje jfjfjf jcjf', 3, NULL, '2023-05-02 15:48:13', '2023-05-02 15:48:13'),
(20, 8, 27, 10, '13939comment1683031992', 'jfjfif if jfjfif jgig', 3, NULL, '2023-05-02 16:53:12', '2023-05-02 16:53:12'),
(21, 8, 28, 7, '20574comment1683039350', 'gjifvcjjfc  jfffuff cncjf', 5, NULL, '2023-05-02 18:55:50', '2023-05-02 18:55:50'),
(22, 7, 30, 11, '52298comment1683288017', 'Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.Use the edit icon to pin, add or delete clips.Touch and hold a clip to pin it. Unpinned clips will be deleted after 1 hour.', 3, NULL, '2023-05-05 16:00:17', '2023-05-05 16:00:17'),
(23, 7, 35, 11, '68928comment1683290942', 'Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.Use the edit icon to pin, add or delete clips.Touch and hold a clip to pin it. Unpinned clips will be deleted after 1 hour.', 3, NULL, '2023-05-05 16:49:02', '2023-05-05 16:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `user_id`, `slug`, `name`, `email`, `message`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 7, '70501contact1679650151', 'aaaa', 'aaa@ffff.com', 'test test test', NULL, '2023-03-24 13:29:11', '2023-03-24 13:29:11'),
(2, 8, '12693contact1683534002', 'fjjfjfurir', 'ruuur@tfufh.com', 'hddhdh hddhdh shsh hddj', NULL, '2023-05-08 12:20:02', '2023-05-08 12:20:02'),
(3, 8, '89764contact1683534007', 'fjjfjfurir', 'ruuur@tfufh.com', 'hddhdh hddhdh shsh hddj', NULL, '2023-05-08 12:20:07', '2023-05-08 12:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `content_management`
--

CREATE TABLE `content_management` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_management`
--

INSERT INTO `content_management` (`id`, `title`, `slug`, `content`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Terms Condition', 'terms-condition', '<p style=\"padding-bottom:20px ;\">\n                Welcome to PastorStays, a non-profit organization that connects\n                ministers to vacation homes for nominal fees. By using our website and\n                web app, you agree to be bound by the following terms and conditions.\n            </p>\n<div>\n    <ol>\n        <li style=\"margin-left: 17px !important;\">\n            <p style=\"padding-bottom:10px ;\">Eligibility: Our services are available to credentialed ministers\n            who are in good standing with their religious organization. By using\n            our website and web app, you represent and warrant that you are a\n            credentialed minister and that you are in good standing with your\n            religious organization.</p>\n        </li>\n        <li style=\"margin-left: 17px !important;\">\n            <p style=\"padding-bottom:10px ;\">\n            Use of our Services: Our services are intended for personal and\n            non-commercial use. You agree not to reproduce, duplicate, copy,\n            sell, resell or exploit any portion of our website and web app\n            without our express written permission.\n            </p>\n        </li>\n\n        <li style=\"margin-left: 17px !important;\">\n            <p style=\"padding-bottom:10px ;\">\n            User Content: You are solely responsible for the content and\n            information that you submit to our website and web app, including\n            any reviews, comments, or messages. You agree that you will not post\n            any content that is illegal, offensive, or in violation of any third\n            party`s rights.\n            </p>\n        </li>\n\n        <li style=\"margin-left: 17px !important;\">\n            <p style=\"padding-bottom:10px ;\">\n            Intellectual Property: All content on our website and web app,\n            including text, graphics, logos, images, and software, is the\n            property of PastorStays or our licensors and is protected by\n            copyright and trademark laws.\n            </p>\n        </li>\n\n        <li style=\"margin-left: 17px !important;\">\n            <p style=\"padding-bottom:10px ;\">\n            Reservation and Payment: By making a reservation through our website\n            and web app, you agree to pay the nominal fee and any other charges\n            incurred during your stay. You also agree to the host&apos;s\n            cancellation policy.\n            </p>\n        </li>\n\n        <li style=\"margin-left: 17px !important;\">\n            <p style=\"padding-bottom:10px ;\">Responsibilities of Hosts: Hosts are responsible for maintaining the\n            accuracy of the information they post on our website and web app,\n            including property descriptions and availability. Hosts are also\n            responsible for ensuring that the property is safe and in good\n            condition for guests.</p>\n        </li>\n\n        <li style=\"margin-left: 17px !important;\">\n            <p style=\"padding-bottom:10px ;\">\n            Limitation of Liability: To the maximum extent permitted by law,\n            PastorStays will not be liable for any damages arising out of or in\n            connection with your use of our website and web app, including but\n            not limited to direct, indirect, incidental, special, consequential,\n            or punitive damages.\n            </p>\n        </li>\n\n        <li style=\"margin-left: 17px !important;\">\n            <p style=\"padding-bottom:10px ;\">\n            Dispute Resolution: In the event of any dispute arising out of or in\n            connection with our website and web app, the parties agree to first\n            try to resolve the dispute informally. If the dispute cannot be\n            resolved informally, the parties agree to resolve the dispute\n            through binding arbitration.\n            </p>\n        </li>\n\n        <li style=\"margin-left: 17px !important;\">\n            <p style=\"padding-bottom:10px ;\">Governing Law: These terms and conditions shall be governed by and\n            construed in accordance with the laws of the state of Washington,\n            without giving effect to any principles of conflicts of law.</p>\n        </li>\n\n        <li style=\"margin-left: 17px !important;\">\n            <p style=\"padding-bottom:10px ;\">\n            Changes to Terms and Conditions: We reserve the right to make\n            changes to these terms and conditions at any time. Your continued\n            use of our website and web app following any changes indicates your\n            acceptance of the new terms and conditions.\n            </p>\n        </li>\n    </ol>\n</div>\n    <p style=\"margin-left: 17px !important;\">\n        If you have any questions or concerns about these terms and conditions,\n        please contact us at hello@pastorstays.com\n    </p>', '1', '2020-02-11 20:01:25', NULL, NULL),
(2, 'Privacy Policy', 'privacy-policy', '<div>\n				\n					\n                <p style=\"padding-bottom: 20px;\">At PastorStays, we are committed to protecting the privacy and\n                security of our users. This privacy policy explains how we collect,\n                use, and disclose personal information through our website and web\n                app.</p>\n                \n                <div>\n                    <ol style=\"margin-left: 30px !important; padding-bottom: 10px !important;\">\n                        <li><p>Information Collection and Use</p></li>\n                    </ol>\n                </div>\n\n                <p style=\"margin-left:18px !important; \" >\n                    We collect personal information from users when they create an\n                    account, make a reservation, or communicate with us through our\n                    website or web app. This information may include name, contact\n                    information, and payment information. We use this information to\n                    provide the services requested, communicate with users, and\n                    improve the functionality of our website and web app.\n                </p>\n\n                <p style=\"margin-left:18px !important; padding-bottom: 10px !important; \">\n                    We also collect usage data, such as information about how users\n                    interact with our website and web app, to improve the user\n                    experience and understand how our services are being used.\n                </p>\n\n                <div>\n                    <ol start=\"2\" style=\"margin-left: 30px !important; padding-bottom: 10px !important;\">\n                        <li><p>Cookies and Tracking Technologies</p></li>\n                    </ol>\n                </div>\n\n                <p style=\"margin-left:18px !important; \">\n                    We use cookies and other tracking technologies to collect\n                    information about users and their interactions with our website\n                    and web app. Cookies are small text files that are stored on\n                    users&apos; devices when they visit a website. They allow the\n                    website to remember users&apos; preferences, login information,\n                    and other data.\n                </p>\n\n                <p style=\"margin-left:18px !important; padding-bottom: 10px !important; \">\n                    Users can control the use of cookies through their browser\n                    settings. However, please note that disabling cookies may limit\n                    the functionality of our website and web app.\n                </p>\n\n                <div>\n                    <ol start=\"3\" style=\"margin-left: 30px !important; padding-bottom: 10px !important;\">\n                        <li><p>Sharing of Information </p></li>\n                    </ol>\n                </div>\n\n                <p style=\"margin-left:18px !important; \">\n                    We do not share personal information with third parties for their\n                    own marketing or advertising purposes without obtaining explicit\n                    consent from users. We may share personal information with\n                    third-party service providers, such as payment processors, to\n                    assist with providing services to users.\n                </p>\n\n                <p style=\"margin-left:18px !important; padding-bottom: 10px !important; \">\n                    We may also disclose personal information in response to legal\n                    requests, such as a subpoena or court order, or to comply with\n                    applicable laws.\n                </p>\n\n                <div>\n                    <ol start=\"4\" style=\"margin-left: 30px !important; padding-bottom: 10px !important;\">\n                        <li> <p>Security</p></li>\n                    </ol>\n                </div>\n\n                <p style=\"margin-left:18px !important; padding-bottom: 10px !important; \">\n                    We take reasonable measures to protect personal information from\n                    unauthorized access, use, or disclosure. However, please note that\n                    no data transmission over the internet or storage system can be\n                    guaranteed to be 100% secure.\n                </p>\n\n                <div>\n                    <ol start=\"5\" style=\"margin-left: 30px !important; padding-bottom: 10px !important;\">\n                        <li><p>Changes to this Privacy Policy</p></li>\n                    </ol>\n                </div>\n\n                <p style=\"margin-left:18px !important; \">\n                    We may update this privacy policy from time to time. We will\n                    notify users of any changes by updating the &quot;Last\n                    Updated&quot; date at the top of this page. Users are encouraged\n                    to review this privacy policy periodically to stay informed about\n                    how we collect, use, and disclose personal information.\n                </p>\n\n                <p style=\"margin-left:18px !important; padding:20px 0  !important;\">Contact Us</p>\n\n                <p style=\"margin-left:18px !important; \">\n                    If you have any questions or concerns about this privacy policy,\n                    please contact us at hello@pastorstays.com\n                </p>\n            </li>\n        </ol>\n    </div>', '1', '2020-02-11 20:01:25', NULL, NULL),
(3, 'About Us', 'about-us', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', '1', '2020-02-11 20:01:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `disputes`
--

CREATE TABLE `disputes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_owner_id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` bigint(20) NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispute_status` enum('declined','progress','disputed','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `declined_dispute_reason` text COLLATE utf8mb4_unicode_ci,
  `admin_status` enum('pending','resolved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `disputes`
--

INSERT INTO `disputes` (`id`, `user_id`, `product_owner_id`, `module`, `module_id`, `slug`, `description`, `dispute_status`, `declined_dispute_reason`, `admin_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 7, 8, 'bookings', 42, '645505406a7a5', 'xhhf ch. jjv bchjgjv hcjcvj gchcch.  bcn', 'pending', NULL, 'pending', '2023-05-05 17:31:44', '2023-05-05 17:31:44', NULL),
(4, 8, 7, 'bookings', 43, '6458ad9e1fd2b', 'hddhdh shushed hddhdh duh dudu', 'disputed', 'sa dasd asd ada sdasdas dsa ssssssssssssss', 'resolved', '2023-05-08 12:06:54', '2023-05-08 12:09:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `slug`, `question`, `answer`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '641afbe562e7f641afbe562e80', 'How to change the language', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', '1', '2020-02-17 20:45:47', NULL, NULL),
(2, '641afbe562e82641afbe562e83', 'How to restore your chat history', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', '1', '2020-02-17 20:51:16', NULL, NULL),
(3, '642156e07402f1679906528', 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '1', '2023-03-27 12:42:08', '2023-03-27 12:42:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"16851cbb-435c-43b0-b402-134bf2f3fa79\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":14:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":5:{s:7:\\\"content\\\";s:1736:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi user1 user1,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\n                        <p><a href=\\\"https:\\/\\/rentarbo.qa.retrocubedev.com\\/user\\/reset-password\\/RYBwqxBkxYVCZkvpJfnTBlqXKNXTGM7ETkD0CgZbxrcPGleGPpYKVeIH7a1tVHAOyf8dNYGyD0s4zuJoXSPfZSAdelcWDqu8AwBOoM7xTN0m0SH2H6SspndnbGIXrcTBI8JQzSiUynZTnwMEaouEE3\\\">Reset Password<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2023 Rentarbo All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:17:\\\"User1@yopmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1679650299, 1679650299),
(2, 'default', '{\"uuid\":\"808f14d3-250a-4ec5-80fa-03fe636ed66b\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":14:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":5:{s:7:\\\"content\\\";s:1736:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi user2 user2,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\n                        <p><a href=\\\"https:\\/\\/rentarbo.qa.retrocubedev.com\\/user\\/reset-password\\/ZUAMHTg7dcJCeJf4RAQ6aOgcFo8yXKdFknUr9ebxiLbrx9JvDm7e8WLjcP8KbjQcBArOXHmYISuy8KLGjES2f61JHR6kldsEy97BRNChd86WyJ3tgeEFPxQplVqrtBlU0r7czbJzc2vReA7BxPcu7d\\\">Reset Password<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2023 Rentarbo All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:17:\\\"user2@yopmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1679656005, 1679656005),
(3, 'default', '{\"uuid\":\"c04fc5bc-6884-48ae-9b2d-02687e8fefe3\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":14:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":5:{s:7:\\\"content\\\";s:1736:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi user1 Three,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\n                        <p><a href=\\\"https:\\/\\/rentarbo.qa.retrocubedev.com\\/user\\/reset-password\\/kx4JxnqNDR1OWSu4kBHtz4xiis7jggVcVQnyZO37XjOGF6h715MZjS9oLZQUH9PYkat0LaohiuLz3A5oyjcLJ7I0XceXVUbQDUUnMBblrm5ERHv6o3S0VKQmhNG4DC9sWwCqqFhb09klcMXrBEcAZG\\\">Reset Password<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2023 Rentarbo All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:17:\\\"User1@yopmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1683532959, 1683532959),
(4, 'default', '{\"uuid\":\"e259a5db-b5b5-49c9-8cc9-490096baac3b\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":14:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":5:{s:7:\\\"content\\\";s:1736:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi user1 Three,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\n                        <p><a href=\\\"https:\\/\\/rentarbo.qa.retrocubedev.com\\/user\\/reset-password\\/OGhkABXf6Du9UMyUzLeUd5MzILxBzyzZcFPtszEnaonLqBN0mNeXTTEHblljzakmUGvoHduHRVyDPqXts2BulhHYSFTYDUm2N9rKPnbzlCDhMhJNveWFY6tHE6kBQd9SLs98INPKo5jbXTFlGE1X1B\\\">Reset Password<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2023 Rentarbo All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:17:\\\"User1@yopmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1683533005, 1683533005);

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wildcard` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_templates`
--

INSERT INTO `mail_templates` (`id`, `identifier`, `subject`, `body`, `wildcard`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'forgot-password', 'Forgot Password Confirmation', '<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\n    <tr>\n        <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\n                <tr>\n                    <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi [USERNAME],</p>\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :</p>\n                        <p><a href=\"[LINK]\">Reset Password</a></p>\n                        <br>\n                        <br>\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Regards,</p>\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">© [YEAR] [APP_NAME] All Rights reserved.</p>\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n</table>\n', '[USERNAME],[LINK],[YEAR],[APP_NAME]', '2023-03-22 17:00:21', NULL, NULL),
(2, 'user_registration', 'Welcome to [APP_NAME]', '<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\n    <tr>\n        <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\n                <tr>\n                    <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi [USERNAME],</p>\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Your account has been created successfully. First, you need to confirm your account. Just click the below link</p>\n                        <p><a href=\"[LINK]\">Verify Now</a></p>\n                        <br>\n                        <br>\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Regards,</p>\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">© [YEAR] [APP_NAME] All Rights reserved.</p>\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n</table>\n', '[USERNAME],[LINK],[YEAR],[APP_NAME]', '2023-03-22 17:00:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` int(11) NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url_blur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail_url` text COLLATE utf8mb4_unicode_ci,
  `mime_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `media_type` enum('public','private') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `meta` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `module`, `module_id`, `filename`, `original_name`, `file_url`, `file_url_blur`, `thumbnail_url`, `mime_type`, `file_type`, `driver`, `media_type`, `meta`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'products', 1, 'products/snzjERFTMRpAMoqS6iGhESgAEIo4QAYTDue22fUG.jpg', 'scaled_f3528c79-53ea-49c7-8d32-e574a2b1219a4035015322951338285.jpg', 'products/snzjERFTMRpAMoqS6iGhESgAEIo4QAYTDue22fUG.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-03-23 08:21:10', NULL, NULL),
(2, 'bookings', 1, 'bookings/2Ur8aeqCaNG2DdlYVyugFP80bSrDrhmIRpzI9xYl.jpg', 'scaled_9a7556e0-fec8-4e9a-9ccd-2afefa76844a6040832780738551207.jpg', 'bookings/2Ur8aeqCaNG2DdlYVyugFP80bSrDrhmIRpzI9xYl.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-23 08:23:28', NULL, NULL),
(3, 'bookings', 1, 'bookings/KFGHwxV0XBrYBSFKhL2RXASmzYQPk7lIlbyBiFnr.jpg', 'scaled_376e6761-9b14-4e93-88c0-17dee291a7184603132356715926358.jpg', 'bookings/KFGHwxV0XBrYBSFKhL2RXASmzYQPk7lIlbyBiFnr.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-23 08:23:28', NULL, NULL),
(4, 'returned', 1, 'returned/qqtxRtkA7HUVG1CzR0WkYWKqs8sL2pmJhfAVRzAp.jpg', 'scaled_8e21a5cf-4fdc-4e4a-91fc-89ff0d4c436e8963630840453689739.jpg', 'returned/qqtxRtkA7HUVG1CzR0WkYWKqs8sL2pmJhfAVRzAp.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-23 09:05:37', NULL, NULL),
(5, 'products', 2, 'products/xYmLbtnW5gc2vLTSn7DFXdnHfqCwrLFIjxTpEAxE.png', 'image_picker_EE47CFCE-98C1-4AAD-824A-022DDCE7EBBD-1407-0000003C0C8FDDA6.png', 'products/xYmLbtnW5gc2vLTSn7DFXdnHfqCwrLFIjxTpEAxE.png', '', '', 'image/png', 'image', 'local', 'public', NULL, '2023-03-24 13:25:40', '2023-03-30 16:39:20', '2023-03-30 16:39:20'),
(6, 'bookings', 2, 'bookings/7FYKdn17yPmAhYi5kAptAbk7bd8b5U967LIDyu5c.jpg', 'scaled_image_picker2793659882660122648.jpg', 'bookings/7FYKdn17yPmAhYi5kAptAbk7bd8b5U967LIDyu5c.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-24 13:43:36', NULL, NULL),
(7, 'bookings', 2, 'bookings/xYqCrO6etsOra2JUuQYWtjUBg4lRdn2IJwzgjZ5s.jpg', 'scaled_image_picker2489734277829172914.jpg', 'bookings/xYqCrO6etsOra2JUuQYWtjUBg4lRdn2IJwzgjZ5s.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-24 13:43:36', NULL, NULL),
(8, 'returned', 2, 'returned/rY3UDruqu9Q03itmGRQ052km3s65BOR0XihrD8mR.jpg', 'scaled_image_picker8068284904837918866.jpg', 'returned/rY3UDruqu9Q03itmGRQ052km3s65BOR0XihrD8mR.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-24 14:22:44', NULL, NULL),
(9, 'bookings', 4, 'bookings/cRGeu0UmNFBD0Z2FEUPgK9iMssWi8IjKN54GWk91.jpg', 'scaled_image_picker3044468716041900941.jpg', 'bookings/cRGeu0UmNFBD0Z2FEUPgK9iMssWi8IjKN54GWk91.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-24 14:24:57', NULL, NULL),
(10, 'bookings', 4, 'bookings/iwEcDV097X9LDSgoNSzewypTjbNFaqxhsvR7Nr3J.jpg', 'scaled_image_picker6762724534113041247.jpg', 'bookings/iwEcDV097X9LDSgoNSzewypTjbNFaqxhsvR7Nr3J.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-24 14:24:57', NULL, NULL),
(11, 'returned', 4, 'returned/dSRZ1OsgL7Xrbg0noUAn79W71TyVIzOaGI9yFe6A.jpg', 'scaled_image_picker7740618262237476982.jpg', 'returned/dSRZ1OsgL7Xrbg0noUAn79W71TyVIzOaGI9yFe6A.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-24 14:25:21', NULL, NULL),
(12, 'bookings', 5, 'bookings/DWv9VXvRbWKUpjtdDrvsK2iOgeZ3QOa3FkfaDtuN.jpg', 'scaled_image_picker5885697608620318061.jpg', 'bookings/DWv9VXvRbWKUpjtdDrvsK2iOgeZ3QOa3FkfaDtuN.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-24 14:34:05', NULL, NULL),
(13, 'bookings', 5, 'bookings/9YakjIHU8sprmez5E6YFeMrcL5YjPpU6026EAsRc.jpg', 'scaled_image_picker5376002470431313781.jpg', 'bookings/9YakjIHU8sprmez5E6YFeMrcL5YjPpU6026EAsRc.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-24 14:34:06', NULL, NULL),
(14, 'bookings', 6, 'bookings/ZsurA0m26644Nyinxyno1LQrJV0YmMywjS7JvRUp.jpg', 'scaled_image_picker1900387837476229974.jpg', 'bookings/ZsurA0m26644Nyinxyno1LQrJV0YmMywjS7JvRUp.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-24 15:11:25', NULL, NULL),
(15, 'bookings', 6, 'bookings/7UchIUhGtzKdkTGCqMv6JXixVxheuCRSAz6aiair.jpg', 'scaled_image_picker1720641256797887346.jpg', 'bookings/7UchIUhGtzKdkTGCqMv6JXixVxheuCRSAz6aiair.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-24 15:11:25', NULL, NULL),
(16, 'returned', 6, 'returned/S0AXYd7yq7Z66lCBXLYvzDvdIjkkt4P68bRveDZz.jpg', 'image_picker_40554F8D-88A3-49B0-9054-DB6A9D1E8A12-323-0000000B1E23FCAD.jpg', 'returned/S0AXYd7yq7Z66lCBXLYvzDvdIjkkt4P68bRveDZz.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-27 11:11:53', NULL, NULL),
(17, 'bookings', 7, 'bookings/X8k8WgD5QYxScC7zA5FASykhVDg9sCUo27ka74ER.png', 'image_picker_EEC985D5-9DAF-4A86-858F-97E741CF079C-323-0000000BBA1CA8BD.png', 'bookings/X8k8WgD5QYxScC7zA5FASykhVDg9sCUo27ka74ER.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-03-27 11:14:04', NULL, NULL),
(18, 'bookings', 7, 'bookings/ZjAjt0dCsiICOIYRCIUOpw8zp97d7x9ML2YS7QiM.jpg', 'image_picker_044D8616-3347-474F-8C19-7557FDB18818-323-0000000BC7D8174F.jpg', 'bookings/ZjAjt0dCsiICOIYRCIUOpw8zp97d7x9ML2YS7QiM.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-27 11:14:04', NULL, NULL),
(19, 'returned', 7, 'returned/C14masQ1B2gOcc5zt6sGfAxPAKXJ1nW7MxRP1Ett.png', 'image_picker_BA557C10-D219-491E-A71E-18C58E341812-736-0000000D6D045B76.png', 'returned/C14masQ1B2gOcc5zt6sGfAxPAKXJ1nW7MxRP1Ett.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-03-27 11:18:45', NULL, NULL),
(20, 'bookings', 8, 'bookings/gQPckwhisobLakOpRJjLkHPNYaVpc3jFdRUyHDw5.png', 'image_picker_100693F2-7690-4925-A380-8210D7DBC7B7-736-0000000DA303F69D.png', 'bookings/gQPckwhisobLakOpRJjLkHPNYaVpc3jFdRUyHDw5.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-03-27 11:19:33', NULL, NULL),
(21, 'bookings', 8, 'bookings/kMbVLFuGbtKuHXaxF4oUvCEGDPMrkpE300XJNqpj.png', 'image_picker_8E5A2DEC-9BAC-46EC-B132-214ED5F7E52A-736-0000000DAA714FFE.png', 'bookings/kMbVLFuGbtKuHXaxF4oUvCEGDPMrkpE300XJNqpj.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-03-27 11:19:33', NULL, NULL),
(22, 'returned', 8, 'returned/QSLO6ZysKfMg1tKjITnc4TWzKePj4PsrJ91NbHRW.jpg', 'image_picker_1DB11496-88D3-4E87-9DD7-8D29123AC48A-736-0000000DEA2B2EF3.jpg', 'returned/QSLO6ZysKfMg1tKjITnc4TWzKePj4PsrJ91NbHRW.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-27 11:20:12', NULL, NULL),
(23, 'disputes', 1, 'disputes/T3OnvmTM5H5XaXTa47nJVDqM8BK0jmSEokrsdGsk.jpg', 'scaled_image_picker789552959327251321.jpg', 'disputes/T3OnvmTM5H5XaXTa47nJVDqM8BK0jmSEokrsdGsk.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-27 12:55:37', NULL, NULL),
(24, 'products', 3, 'products/AfQnFW1wITm1y9tjAc5CUPuFv88Mv5N77CXCk89c.jpg', 'scaled_f82e74a2-8528-4d17-a807-affdf15414ea8985532340188116191.jpg', 'products/AfQnFW1wITm1y9tjAc5CUPuFv88Mv5N77CXCk89c.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-03-28 09:33:28', NULL, NULL),
(25, 'products', 3, 'products/BJwjXd8lBZpU8Rb3YOQRcAzkUYr2zpzUNNuLdN8M.mp4', 'recording_20230322_045823.mp4', 'products/BJwjXd8lBZpU8Rb3YOQRcAzkUYr2zpzUNNuLdN8M.mp4', '', '/thumbnail/64227c287a2281679981608.jpg', 'video/mp4', 'video', 'local', 'public', NULL, '2023-03-28 09:33:29', NULL, NULL),
(26, 'bookings', 9, 'bookings/YMeczOWvmY91QsdForjbhLx7sEeNzsscdx9sSq6w.jpg', 'scaled_a9528be8-ffd9-4508-abf3-448425e59cd11945092182794752872.jpg', 'bookings/YMeczOWvmY91QsdForjbhLx7sEeNzsscdx9sSq6w.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 09:37:13', NULL, NULL),
(27, 'bookings', 9, 'bookings/2DejwOdyZcxQzMq5yRcKubgOrtto0H9e7grt4oM0.jpg', 'scaled_3d0627c1-0c8b-4540-a629-c0fa4cd7a1c57565399534710060286.jpg', 'bookings/2DejwOdyZcxQzMq5yRcKubgOrtto0H9e7grt4oM0.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 09:37:13', NULL, NULL),
(28, 'returned', 9, 'returned/YoXh3UWIAl1cMOrRkt5lBg9VjnNFtp8N6SLGXHEv.jpg', 'scaled_524de8fc-3475-42c8-9474-e6861d26a2d95297100527138759236.jpg', 'returned/YoXh3UWIAl1cMOrRkt5lBg9VjnNFtp8N6SLGXHEv.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 09:41:38', NULL, NULL),
(29, 'returned', 9, 'returned/vlrLyxKtU2cN39RlU95P1S9He14lQhqTeplRv3ck.jpg', 'scaled_bacf6896-95b0-4c82-86cf-7c143ac9ba1b1651414370501492568.jpg', 'returned/vlrLyxKtU2cN39RlU95P1S9He14lQhqTeplRv3ck.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 09:41:38', NULL, NULL),
(30, 'bookings', 10, 'bookings/Hk51LbkJQFaHmssBswEzArSTrd7ZAxbAz09wiOWO.jpg', 'scaled_b745104d-6c39-45df-bc6f-cfcfce99e9e91397996230300127912.jpg', 'bookings/Hk51LbkJQFaHmssBswEzArSTrd7ZAxbAz09wiOWO.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 09:50:51', NULL, NULL),
(31, 'bookings', 10, 'bookings/aERaFlaR8YxQYdZVNuiHPiHlZYrvBxKyjnvDwtnC.jpg', 'scaled_6f6e7d87-da7b-48fd-a716-e9541c9fe1b33437258404920351775.jpg', 'bookings/aERaFlaR8YxQYdZVNuiHPiHlZYrvBxKyjnvDwtnC.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 09:50:51', NULL, NULL),
(32, 'returned', 10, 'returned/d8nne9cvM2XkcrKbuQ4QHfweQcQihoGszMR500Ol.jpg', 'scaled_56800fe5-551e-4a10-b1e9-85db43a0bca78417727251241525585.jpg', 'returned/d8nne9cvM2XkcrKbuQ4QHfweQcQihoGszMR500Ol.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 09:51:27', NULL, NULL),
(33, 'returned', 10, 'returned/pLU0O35tkVfoX6JZDXb2z51St1hn6HN17efBbZix.jpg', 'scaled_a5436828-b017-4054-bd0b-7a2319caf0688338479095345171478.jpg', 'returned/pLU0O35tkVfoX6JZDXb2z51St1hn6HN17efBbZix.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 09:51:27', NULL, NULL),
(34, 'bookings', 11, 'bookings/zcqd0JtbkhklSEUdRvXX7K8mqHHlSZM264EsFS02.jpg', 'scaled_f96f6f63-4e62-4136-ad2a-f3e4a9597d391208327821187417421.jpg', 'bookings/zcqd0JtbkhklSEUdRvXX7K8mqHHlSZM264EsFS02.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 09:53:10', NULL, NULL),
(35, 'bookings', 11, 'bookings/7s6fdEgIFLM9QAtXd11refJMH3izCe47paqhCPst.jpg', 'scaled_f190b621-b342-49b6-83de-281d20a2228f6677224895732121899.jpg', 'bookings/7s6fdEgIFLM9QAtXd11refJMH3izCe47paqhCPst.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 09:53:10', NULL, NULL),
(36, 'returned', 11, 'returned/m5g6OwuZNfNYfK70xcRarPojCjyOZ4nkz9t98b1o.jpg', 'scaled_d1709638-d4f7-4da9-8700-79c3d76fc5601093968236248518750.jpg', 'returned/m5g6OwuZNfNYfK70xcRarPojCjyOZ4nkz9t98b1o.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 09:53:47', NULL, NULL),
(37, 'returned', 11, 'returned/6Ju6JRIrFS7uSdVnmuXD6zJMHJoWvaYFxgzwLtYG.jpg', 'scaled_fefbd820-e576-4380-b063-534c99fc01d65513342340681209401.jpg', 'returned/6Ju6JRIrFS7uSdVnmuXD6zJMHJoWvaYFxgzwLtYG.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 09:53:47', NULL, NULL),
(38, 'bookings', 12, 'bookings/NQSOA3phRtlnErdzcYEv5KFBBc2m95s0lHdMr3Qk.jpg', 'scaled_1a0f6ee9-10b8-48f2-9bfd-76d2f0ffd1f23981235328394637593.jpg', 'bookings/NQSOA3phRtlnErdzcYEv5KFBBc2m95s0lHdMr3Qk.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 10:21:00', NULL, NULL),
(39, 'bookings', 12, 'bookings/xzNbodEmsDCQS29l0iCFxc7NOPpUZBunT2YJXNi7.jpg', 'scaled_1f78ddd9-8e43-4b9c-9cd2-4f69484fc3e54916367197602430989.jpg', 'bookings/xzNbodEmsDCQS29l0iCFxc7NOPpUZBunT2YJXNi7.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 10:21:00', NULL, NULL),
(40, 'returned', 12, 'returned/UxhAj3U2WldyLQL0Vg3C1ieHfhmEtSlDoWqqIocz.jpg', 'scaled_0345d20e-6e66-42e3-a073-a8e59c599a559051493644139399498.jpg', 'returned/UxhAj3U2WldyLQL0Vg3C1ieHfhmEtSlDoWqqIocz.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-28 10:21:32', NULL, NULL),
(41, 'products', 4, 'products/638LEMBDXaS3AkDHaaY3vGKnxbjgACqelFsGOCIY.jpg', 'image_picker_DF37BF36-FF42-4C8E-8976-514BD93EC73D-10202-000001833CB531D8.jpg', 'products/638LEMBDXaS3AkDHaaY3vGKnxbjgACqelFsGOCIY.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-03-30 13:46:58', '2023-03-30 16:40:24', '2023-03-30 16:40:24'),
(42, 'bookings', 13, 'bookings/IYod1GPcB7YzZg7Zc5J3wK7Rc2YqToAaHDVcX8LG.jpg', 'scaled_Screenshot_20230328_143802.jpg', 'bookings/IYod1GPcB7YzZg7Zc5J3wK7Rc2YqToAaHDVcX8LG.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-30 14:01:06', NULL, NULL),
(43, 'bookings', 13, 'bookings/4be7Vmnkjh5AYPidtUHhQlkstBKy2Nf509mdTpzE.jpg', 'scaled_Screenshot_20230328_143744.jpg', 'bookings/4be7Vmnkjh5AYPidtUHhQlkstBKy2Nf509mdTpzE.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-30 14:01:06', NULL, NULL),
(44, 'returned', 13, 'returned/1PmPXdYqretQjcLes5zEMISMWejZ76yQBpTRp5ji.jpg', 'scaled_Screenshot_20230328_143802.jpg', 'returned/1PmPXdYqretQjcLes5zEMISMWejZ76yQBpTRp5ji.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-30 14:01:42', NULL, NULL),
(45, 'products', 2, 'products/J8vtPNolKewRrOEh5N2IuWkWjLp8SPX33fHVyNu1.jpg', 'scaled_a325ec0e-4287-448f-b502-ff73c088530f799036875319968390.jpg', 'products/J8vtPNolKewRrOEh5N2IuWkWjLp8SPX33fHVyNu1.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-03-30 16:39:50', '2023-03-30 16:51:23', '2023-03-30 16:51:23'),
(46, 'products', 4, 'products/wmGi8pn3FuKAd9qdVgthbJrTYwIyMmSeI0apkY9y.jpg', 'scaled_Screenshot_20230328-115111.jpg', 'products/wmGi8pn3FuKAd9qdVgthbJrTYwIyMmSeI0apkY9y.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-03-30 16:41:25', '2023-03-30 16:41:53', '2023-03-30 16:41:53'),
(47, 'products', 4, 'products/jc9HBOvSnzdEoRsLEbY4OASg0I7RwrgDxbHPMaHA.jpg', 'scaled_1d215550-3ffe-4325-8e13-a2260941ec8f7926204443263844617.jpg', 'products/jc9HBOvSnzdEoRsLEbY4OASg0I7RwrgDxbHPMaHA.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-03-30 16:42:14', '2023-03-30 16:50:48', '2023-03-30 16:50:48'),
(48, 'products', 4, 'products/vkLmtOPxYM8lStsaZrYeEvHAyRjhk8SIO7LYWV5b.jpg', 'scaled_IMG_20230329_093318_Bokeh.jpg', 'products/vkLmtOPxYM8lStsaZrYeEvHAyRjhk8SIO7LYWV5b.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-03-30 16:51:03', '2023-04-13 20:18:33', '2023-04-13 20:18:33'),
(49, 'products', 2, 'products/3hoZ920KDbye6L6yCbmQgVf0GMZYuaCPsKX72DGv.jpg', 'scaled_IMG_20230329_093230_Bokeh.jpg', 'products/3hoZ920KDbye6L6yCbmQgVf0GMZYuaCPsKX72DGv.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-03-30 16:51:35', '2023-04-18 15:18:43', '2023-04-18 15:18:43'),
(50, 'products', 5, 'products/RXWmf1jT6XG0n93KinBzkjUsVBdFKXWSMGAEBoDl.jpg', 'image_picker_ED28E825-B382-4F24-B384-8C86F0B49D6C-8225-000006DD0EDBC76F.jpg', 'products/RXWmf1jT6XG0n93KinBzkjUsVBdFKXWSMGAEBoDl.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-04-08 22:55:47', NULL, NULL),
(51, 'products', 4, 'products/hXLr8tpjNxjnDkG7rsk6w6W7MvctMH6QYGIASAS1.jpg', 'scaled_88ae1610-2504-46db-bcc6-c31d64f5a4847935198705095973460.jpg', 'products/hXLr8tpjNxjnDkG7rsk6w6W7MvctMH6QYGIASAS1.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-04-13 20:18:52', '2023-04-18 15:19:26', '2023-04-18 15:19:26'),
(52, 'products', 2, 'products/UMdq2fyxrfo9FZHfB6KTYpAJPgqERRNiexbhRayS.jpg', 'image_picker_831B069C-CF50-42C4-8D54-46BA1941A17D-75080-000015BA4ADC0B24.jpg', 'products/UMdq2fyxrfo9FZHfB6KTYpAJPgqERRNiexbhRayS.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-04-18 15:18:59', NULL, NULL),
(53, 'products', 4, 'products/JEt6RSYHU8asbaWukUruq6LkgOmQivGzA9Qa90r4.jpg', 'image_picker_D9B9EBB5-1ABD-4318-ACA7-3B46A690E52B-75080-000015C394423886.jpg', 'products/JEt6RSYHU8asbaWukUruq6LkgOmQivGzA9Qa90r4.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-04-18 15:19:38', NULL, NULL),
(54, 'disputes', 4, 'disputes/T3OnvmTM5H5XaXTa47nJVDqM8BK0jmSEokrsdGsk.jpg', 'scaled_image_picker789552959327251321.jpg', 'disputes/T3OnvmTM5H5XaXTa47nJVDqM8BK0jmSEokrsdGsk.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-03-27 12:55:37', NULL, NULL),
(55, 'bookings', 14, 'bookings/ClhYDJTSUM6CtH0ZuqREN8FXaQHjs88h32elfq7I.png', 'image_picker_89D9D4F4-E59C-43BE-9CE8-38C2DDA8674B-374-00000008E08A659E.png', 'bookings/ClhYDJTSUM6CtH0ZuqREN8FXaQHjs88h32elfq7I.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-04-27 11:26:07', NULL, NULL),
(56, 'bookings', 14, 'bookings/tELyfHTYWcCOAXGcGwa4BH3FDOWjer9030j8dEaZ.png', 'image_picker_35AA2AFE-9043-4490-B514-EE987F5C6E6B-374-00000008E63055B8.png', 'bookings/tELyfHTYWcCOAXGcGwa4BH3FDOWjer9030j8dEaZ.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-04-27 11:26:07', NULL, NULL),
(57, 'products', 6, 'products/9JY44Nl30pPX7hyd9B83qWPCl1RSHBc4ySXhDc8X.jpg', 'scaled_da2cbd0a-8967-44b1-a9de-908ff76317a53450949953225774662.jpg', 'products/9JY44Nl30pPX7hyd9B83qWPCl1RSHBc4ySXhDc8X.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-04-28 13:14:28', NULL, NULL),
(58, 'bookings', 15, 'bookings/0ggXXzUcKcMedU01Baxm54PzdosaAZtLr3WOPtIG.jpg', 'image_picker_8B420B15-B212-4E80-9D9C-ABFDC14DA676-969-000000E470440CC3.jpg', 'bookings/0ggXXzUcKcMedU01Baxm54PzdosaAZtLr3WOPtIG.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-04-28 13:19:42', NULL, NULL),
(59, 'bookings', 15, 'bookings/cXEt8lA9bp7WB6G3RPrqtyodHYPJUeAog0INtejZ.jpg', 'image_picker_35C01EA1-0834-4160-8F7A-EABF92DA56FA-969-000000E478C434CA.jpg', 'bookings/cXEt8lA9bp7WB6G3RPrqtyodHYPJUeAog0INtejZ.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-04-28 13:19:42', NULL, NULL),
(60, 'disputes', 5, 'disputes/BEzFm27hWzmO8Ph0rBUNNSPLpa1NEXwaCk6WPq8L.jpg', 'scaled_ea68bb58-13f3-4fea-9263-d6657a341ea9603755892708282274.jpg', 'disputes/BEzFm27hWzmO8Ph0rBUNNSPLpa1NEXwaCk6WPq8L.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-04-28 13:20:29', NULL, NULL),
(61, 'disputes', 6, 'disputes/HrYxwW3aF29TGQUot4cvloHSEDWjsly966JrHcPV.jpg', 'scaled_b94846f3-2441-4aeb-a236-d3fa9f5817c38997979228272243943.jpg', 'disputes/HrYxwW3aF29TGQUot4cvloHSEDWjsly966JrHcPV.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-04-28 15:11:59', NULL, NULL),
(62, 'disputes', 7, 'disputes/Vb53hAfLYJExsjyrciQm4oE54nPZVtb6zV9ASe1j.jpg', 'scaled_8ee752d6-36c8-40fd-9e7f-c632f3122e737734900547973226555.jpg', 'disputes/Vb53hAfLYJExsjyrciQm4oE54nPZVtb6zV9ASe1j.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-04-28 15:21:21', NULL, NULL),
(63, 'products', 7, 'products/rI6DYqaUPMYw8iuWidBvtyeFRR0nHARnPKuIsylO.jpg', 'scaled_ccf91125-c5e0-40fc-afaa-78613388fc3d5400980413555261575.jpg', 'products/rI6DYqaUPMYw8iuWidBvtyeFRR0nHARnPKuIsylO.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-04-28 15:28:50', NULL, NULL),
(64, 'disputes', 8, 'disputes/3AAW0CzO9vinKKv9noWYullSo1oBFMjzz2sdAx9z.jpg', 'scaled_d26c2dde-d931-4521-a9ff-d834de63fec6556897855604864547.jpg', 'disputes/3AAW0CzO9vinKKv9noWYullSo1oBFMjzz2sdAx9z.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-04-28 15:30:57', NULL, NULL),
(65, 'bookings', 16, 'bookings/w2MLflrDeYjC53HBK2A1XI11g4NHAzQ1zGcDnP0W.jpg', 'scaled_Screenshot_20230428-162718_One UI Home.jpg', 'bookings/w2MLflrDeYjC53HBK2A1XI11g4NHAzQ1zGcDnP0W.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-01 11:43:38', NULL, NULL),
(66, 'bookings', 16, 'bookings/kSSMy62jClNCf89oXcnI8gCaKM8aiN2nSObxgSF8.jpg', 'scaled_Screenshot_20230427-133633.jpg', 'bookings/kSSMy62jClNCf89oXcnI8gCaKM8aiN2nSObxgSF8.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-01 11:43:38', NULL, NULL),
(67, 'disputes', 9, 'disputes/RXuhmIXQxySERXfpKSTq6OaxcCe64im4BhIEHvp5.jpg', 'image_picker_586F8E44-265F-4ABA-B710-64E663CB41AE-363-000000256419CB94.jpg', 'disputes/RXuhmIXQxySERXfpKSTq6OaxcCe64im4BhIEHvp5.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-01 13:17:09', NULL, NULL),
(68, 'products', 8, 'products/4cD7nH5PPxF00TfgczWYPkON3hAyIgXvXnKrQVQs.jpg', 'scaled_19f7ec82-44da-48ce-b770-307cf3507bc95152045417339353592.jpg', 'products/4cD7nH5PPxF00TfgczWYPkON3hAyIgXvXnKrQVQs.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-05-01 14:59:14', NULL, NULL),
(69, 'bookings', 17, 'bookings/xon1NIzeDbp8W8k97rPBDCgpbED3RYqUi9Pvmdw4.jpg', 'image_picker_83C8CA92-DFEF-4D14-B02F-7A880567541C-363-0000003E681ADF55.jpg', 'bookings/xon1NIzeDbp8W8k97rPBDCgpbED3RYqUi9Pvmdw4.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-01 15:22:14', NULL, NULL),
(70, 'bookings', 17, 'bookings/s4QnoaE4OSo6lSuptgAfmxhNjEVg44ScQwAuQZSo.jpg', 'image_picker_DAC9E927-BE92-4762-B299-F6CC8202EB75-363-0000003E73EAACAC.jpg', 'bookings/s4QnoaE4OSo6lSuptgAfmxhNjEVg44ScQwAuQZSo.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-01 15:22:14', NULL, NULL),
(71, 'bookings', 17, 'returned/N0SypcBXiHQwYsiKeVQu4b4QZjbWuwaE7VFFsQbJ.jpg', 'image_picker_35EAB352-0431-4EB3-AA2C-44A67E281BDA-363-000000402436805B.jpg', 'returned/N0SypcBXiHQwYsiKeVQu4b4QZjbWuwaE7VFFsQbJ.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-01 15:27:12', NULL, NULL),
(72, 'disputes', 10, 'disputes/2cZokPdtljvuLya0hvFbxAc6qW6nE8aCqrXsKceW.jpg', 'scaled_Screenshot_20230428-162718_One UI Home.jpg', 'disputes/2cZokPdtljvuLya0hvFbxAc6qW6nE8aCqrXsKceW.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-01 15:29:20', NULL, NULL),
(73, 'bookings', 18, 'bookings/sKQphpN3zm7b5hwLUoNiVWHSnnFTX6SMHVLsKl1i.jpg', 'image_picker_4C5AE93A-4873-45BC-8834-B0D9754C771C-815-00000051AC548F88.jpg', 'bookings/sKQphpN3zm7b5hwLUoNiVWHSnnFTX6SMHVLsKl1i.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 11:18:12', NULL, NULL),
(74, 'bookings', 18, 'bookings/8ZPdVd437NmNf0zM7fWLvRJdUJ3xfuHo8FwqqeBI.jpg', 'image_picker_6F56D097-9EC9-488A-BE86-E67FE5CAF707-815-00000051B79FA3FA.jpg', 'bookings/8ZPdVd437NmNf0zM7fWLvRJdUJ3xfuHo8FwqqeBI.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 11:18:12', NULL, NULL),
(75, 'bookings', 18, 'returned/1DDTAMixg8ZZYBTdqgW1QYplN8UakZMkRFYbCEu4.jpg', 'image_picker_E120CBCF-5153-47AD-B075-65D807BACD71-821-0000005283011CE7.jpg', 'returned/1DDTAMixg8ZZYBTdqgW1QYplN8UakZMkRFYbCEu4.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 11:21:57', NULL, NULL),
(76, 'disputes', 11, 'disputes/g7D2mDbcqcovIdNwi24jsVwWsquKXOzTI9cG8Fg2.png', 'image_picker_4566A428-A7F0-402D-B4B8-F28B496696F9-821-0000005302B8DA18.png', 'disputes/g7D2mDbcqcovIdNwi24jsVwWsquKXOzTI9cG8Fg2.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-02 11:23:29', NULL, NULL),
(77, 'products', 9, 'products/qc3WF8fvFTZwTX07Wy3xkRsqguSH0iq0nnRVZBKu.jpg', 'scaled_6c6cf60d-976b-4620-8c3a-95b698fa4f3d1294162284435317806.jpg', 'products/qc3WF8fvFTZwTX07Wy3xkRsqguSH0iq0nnRVZBKu.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-05-02 13:36:11', NULL, NULL),
(78, 'bookings', 19, 'bookings/fPn6bLpx562GIXvMZAZaqVnYmz5VnSU6v4m1rTIr.jpg', 'image_picker_58918674-B4F9-4171-9DAC-3387C0444C91-4274-000001321B162C8A.jpg', 'bookings/fPn6bLpx562GIXvMZAZaqVnYmz5VnSU6v4m1rTIr.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 13:38:38', NULL, NULL),
(79, 'bookings', 19, 'bookings/AHH5A51fWQx9M9WvUAv29hmoUCzbJOJFEXCBMgHO.jpg', 'image_picker_12AAB670-8B53-4260-8473-A9AD82E426E2-4274-00000132220D03AF.jpg', 'bookings/AHH5A51fWQx9M9WvUAv29hmoUCzbJOJFEXCBMgHO.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 13:38:38', NULL, NULL),
(80, 'bookings', 19, 'returned/WCQpp2X1T9UChwraZRPeibHoGy0kJKsH4GWvNL7Z.jpg', 'image_picker_96C49763-DF7F-4BF3-BC5A-A786DFE431C7-4274-00000132E382C58F.jpg', 'returned/WCQpp2X1T9UChwraZRPeibHoGy0kJKsH4GWvNL7Z.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 13:40:41', NULL, NULL),
(81, 'disputes', 12, 'disputes/ShuDxa1vJph7zLsoGwzks1KTF6XV966DLiYs5dzk.jpg', 'scaled_d908e28a-a627-46fd-a70d-1b65b9d35d574932837448356600582.jpg', 'disputes/ShuDxa1vJph7zLsoGwzks1KTF6XV966DLiYs5dzk.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 13:41:17', NULL, NULL),
(82, 'disputes', 13, 'disputes/MprEECdqjGaPmtjOvr8QxE1JNO93Q2bG5NiwcCoZ.jpg', 'image_picker_B24C7E0E-77C3-49BD-9C4A-9A3991D6BBD3-4274-000001334B6E9C1E.jpg', 'disputes/MprEECdqjGaPmtjOvr8QxE1JNO93Q2bG5NiwcCoZ.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 13:41:54', NULL, NULL),
(83, 'disputes', 14, 'disputes/Qdg9nJhljOJtgAE8KDwgu7V38PmoxjKg0WbLAGBo.jpg', 'image_picker_8F461666-7425-41A8-B696-C09BB3EBBCC3-4274-00000133739A21DC.jpg', 'disputes/Qdg9nJhljOJtgAE8KDwgu7V38PmoxjKg0WbLAGBo.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 13:42:25', NULL, NULL),
(84, 'disputes', 15, 'disputes/7fGmY6pzX2HKF4K9YPKVuHY9SzVF3aneGDaROYjy.jpg', 'image_picker_A2821504-7D66-4745-BB1D-B5823E179369-4439-000001355251AD62.jpg', 'disputes/7fGmY6pzX2HKF4K9YPKVuHY9SzVF3aneGDaROYjy.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 13:47:57', NULL, NULL),
(85, 'disputes', 16, 'disputes/lNH0a61U35CZpLRRz81PH51Rn88haJJsmiOdNWKI.jpg', 'image_picker_2C9E0493-1D1E-4B92-B3FF-579670EB6BF9-4439-000001364824EF22.jpg', 'disputes/lNH0a61U35CZpLRRz81PH51Rn88haJJsmiOdNWKI.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 13:50:57', NULL, NULL),
(86, 'disputes', 17, 'disputes/PqeVrJzihjpzqsuBW1OFHmZA4QM7Mlg3nbl97QIJ.jpg', 'image_picker_69C9E755-966F-4B9E-8BD7-73F3327B69C7-4439-00000138579820F4.jpg', 'disputes/PqeVrJzihjpzqsuBW1OFHmZA4QM7Mlg3nbl97QIJ.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 13:56:58', NULL, NULL),
(87, 'disputes', 18, 'disputes/9W51QoUyd5zKM7vUyFiM9RcWowp8cbSxzkssw8yi.jpg', 'image_picker_A8F94965-546B-42AF-9B67-9417A1F122F5-4439-0000013903130AB0.jpg', 'disputes/9W51QoUyd5zKM7vUyFiM9RcWowp8cbSxzkssw8yi.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 13:59:11', NULL, NULL),
(88, 'disputes', 19, 'disputes/S0tzN55Cuw8epXyAPL8R3EpLWQ8tbwTGrAluLPaf.jpg', 'image_picker_6DB7ACA4-367E-448E-878C-D0A531BAB79C-4439-0000013AEBB62BA0.jpg', 'disputes/S0tzN55Cuw8epXyAPL8R3EpLWQ8tbwTGrAluLPaf.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:04:44', NULL, NULL),
(89, 'disputes', 20, 'disputes/vK7cy4k4KT1NmSeeNXZzQq3KzD7Mr9vB1e1qBIDq.jpg', 'image_picker_321023C3-491B-4D22-88EF-B46D9A1F32B7-4439-0000013BB80CF8EA.jpg', 'disputes/vK7cy4k4KT1NmSeeNXZzQq3KzD7Mr9vB1e1qBIDq.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:07:05', NULL, NULL),
(90, 'disputes', 21, 'disputes/TPf0WPE3XWC0SxAwuQWmJt9exqf3zvIZSPt3Vi3A.jpg', 'image_picker_AA30432B-6F7C-449C-962D-D92B571DFACF-4439-0000013EFB0D5027.jpg', 'disputes/TPf0WPE3XWC0SxAwuQWmJt9exqf3zvIZSPt3Vi3A.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:16:49', NULL, NULL),
(91, 'disputes', 22, 'disputes/YT3UYd35iT8Lp9SKp760YRqosyGGNc2mKTe6fwCP.jpg', 'image_picker_43D14CAD-8F0C-4044-92F5-D4EEDAEB737C-4439-000001403544855D.jpg', 'disputes/YT3UYd35iT8Lp9SKp760YRqosyGGNc2mKTe6fwCP.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:20:29', NULL, NULL),
(92, 'disputes', 23, 'disputes/UoV7AdoQnRcJfdcgE9vY3wuYJ1KBNyEYB2ZtNIKx.jpg', 'image_picker_F0CBE987-5FCC-425A-A2EF-342CC2EDC313-4439-00000140B161E45C.jpg', 'disputes/UoV7AdoQnRcJfdcgE9vY3wuYJ1KBNyEYB2ZtNIKx.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:21:55', NULL, NULL),
(93, 'disputes', 24, 'disputes/1TIlSzIm1BSWPA6HX5hE5Dr0HLomPXnY7kreqhnR.jpg', 'image_picker_2C54D7AA-730D-4D0F-AF81-2EEE23439741-4439-000001417D14D30F.jpg', 'disputes/1TIlSzIm1BSWPA6HX5hE5Dr0HLomPXnY7kreqhnR.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:24:31', NULL, NULL),
(94, 'disputes', 25, 'disputes/4hMEwSG7SDtdkaxDLAJ1aiGEhNruSI6B2c8HwVmJ.jpg', 'scaled_41437b4d-0002-4074-9f8b-0e84e11669776125372730104322844.jpg', 'disputes/4hMEwSG7SDtdkaxDLAJ1aiGEhNruSI6B2c8HwVmJ.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:29:29', NULL, NULL),
(95, 'disputes', 26, 'disputes/pC872KW3szsuchfoMbdkvDwvnh5H0KLnzp34HaNE.jpg', 'image_picker_1BFBD546-2A12-4FDC-A4CF-1FED77190C5D-4439-000001444D4DADED.jpg', 'disputes/pC872KW3szsuchfoMbdkvDwvnh5H0KLnzp34HaNE.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:32:42', NULL, NULL),
(96, 'products', 10, 'products/6yqc08WnSTd3VtAeYlBZcpRXWbiQghUsfulqpNPU.jpg', 'scaled_74ea4775-f4b7-491d-adae-647ef2c611405049519962454596316.jpg', 'products/6yqc08WnSTd3VtAeYlBZcpRXWbiQghUsfulqpNPU.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-05-02 14:34:06', NULL, NULL),
(97, 'bookings', 20, 'bookings/EydsGgAOA7kpqWOuXWiX4qyu09mYvLSPx0zs3AjK.jpg', 'image_picker_AB8AB24A-F6F4-4CE3-A87E-D0597CC3379D-4439-0000014531B3A441.jpg', 'bookings/EydsGgAOA7kpqWOuXWiX4qyu09mYvLSPx0zs3AjK.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:35:24', NULL, NULL),
(98, 'bookings', 20, 'bookings/omXnZIWan6daszve4Q7htJYOQO5PWiJ26nJ9uB5o.jpg', 'image_picker_82C7089B-FAAD-439F-B861-36B9B41BEFDD-4439-0000014537EBCF71.jpg', 'bookings/omXnZIWan6daszve4Q7htJYOQO5PWiJ26nJ9uB5o.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:35:24', NULL, NULL),
(99, 'bookings', 20, 'returned/6jkMsslBLR3nBExcHu0O56aBuDOQXcUREOBuKL8P.jpg', 'image_picker_0A59EB0B-6046-44CB-80C2-C3A26C473B35-4439-0000014632E8A5F7.jpg', 'returned/6jkMsslBLR3nBExcHu0O56aBuDOQXcUREOBuKL8P.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:38:17', NULL, NULL),
(100, 'bookings', 21, 'bookings/7sFZ9FL3Udq8w3VqSJ16WVW020CPQJJgDiGs82uA.jpg', 'image_picker_571F79F2-104B-48D9-8C11-92B4697CC56E-4439-00000146F29C9211.jpg', 'bookings/7sFZ9FL3Udq8w3VqSJ16WVW020CPQJJgDiGs82uA.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:40:37', NULL, NULL),
(101, 'bookings', 21, 'bookings/f1lMYkQ2xdiF1L0pN0gZ24Edk8anTXzeQo89jV5p.jpg', 'image_picker_F6376F45-C823-4441-8E7A-6A80F8165125-4439-00000146F9D16DD3.jpg', 'bookings/f1lMYkQ2xdiF1L0pN0gZ24Edk8anTXzeQo89jV5p.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:40:37', NULL, NULL),
(102, 'bookings', 21, 'returned/Ju8vvE4K8N9kFKpZuCUxuZ1pdmHbpBnyenEf9Eks.jpg', 'image_picker_0CCD8555-8410-49A2-A026-45391664C238-4439-00000147453ACFC0.jpg', 'returned/Ju8vvE4K8N9kFKpZuCUxuZ1pdmHbpBnyenEf9Eks.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:41:30', NULL, NULL),
(103, 'bookings', 21, 'returned/p2geaiDc6uzKMAYzTCdw7ezOAO0yCff92Mll775k.jpg', 'image_picker_C64D1CC2-2AB4-47A4-A626-F57C324A4809-4439-00000149A52A2119.jpg', 'returned/p2geaiDc6uzKMAYzTCdw7ezOAO0yCff92Mll775k.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:48:35', NULL, NULL),
(104, 'bookings', 22, 'bookings/SoUXII4Z6lzehFb6WNY0XNDqIx87CHc2n3ZoqkNH.jpg', 'image_picker_380D5632-7BFC-4BC3-AE50-380B78715565-4439-00000149DF78F0DF.jpg', 'bookings/SoUXII4Z6lzehFb6WNY0XNDqIx87CHc2n3ZoqkNH.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:49:19', NULL, NULL),
(105, 'bookings', 22, 'bookings/O6tmPGfJEyGcDFD4er9J9UzPzXnTLyihyUIL0flb.jpg', 'image_picker_C79E078D-B6C1-4A28-8996-8B3292C9016A-4439-00000149E544E95B.jpg', 'bookings/O6tmPGfJEyGcDFD4er9J9UzPzXnTLyihyUIL0flb.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:49:19', NULL, NULL),
(106, 'bookings', 22, 'returned/3LpXyVmhOuZM9YMmwKZU1L4bdvQ2b4YDorbjkSjd.jpg', 'image_picker_AAE04751-2A21-411C-8F71-D8A8FF9CE5A2-4439-0000014A49BB5ADF.jpg', 'returned/3LpXyVmhOuZM9YMmwKZU1L4bdvQ2b4YDorbjkSjd.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:50:29', NULL, NULL),
(107, 'bookings', 23, 'bookings/4OSKiBx5N8pCNXp2mA0A505bAQqDGgMtp49kRepr.jpg', 'image_picker_3A30EEE4-32F3-48DE-83E4-EAE89249BDF3-4439-0000014AEA4A86F0.jpg', 'bookings/4OSKiBx5N8pCNXp2mA0A505bAQqDGgMtp49kRepr.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:52:29', NULL, NULL),
(108, 'bookings', 23, 'bookings/AqEWaQKYsAhoFRycRQdpIMsirBCLw4xuACxPYS8A.jpg', 'image_picker_69ADC2CB-0417-47FF-9AB5-AADD281AECA5-4439-0000014AF1F75996.jpg', 'bookings/AqEWaQKYsAhoFRycRQdpIMsirBCLw4xuACxPYS8A.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:52:29', NULL, NULL),
(109, 'bookings', 23, 'returned/5Wo0Mep4hHnE5KtjQ3XRdOL9EMzmNMN45eJUzDQP.jpg', 'image_picker_7CDD11D1-CF75-47EE-BA78-F823D6662C64-4439-0000014B3218D0EF.jpg', 'returned/5Wo0Mep4hHnE5KtjQ3XRdOL9EMzmNMN45eJUzDQP.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 14:53:13', NULL, NULL),
(110, 'bookings', 22, 'returned/UTksye60gOdkd4gzirxZVyRZyDMJUkixFOByD6Dr.png', 'user-placeholder (1).png', 'returned/UTksye60gOdkd4gzirxZVyRZyDMJUkixFOByD6Dr.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-02 15:03:29', NULL, NULL),
(111, 'bookings', 24, 'bookings/MyURyDWcKh0SFzyN5OdTt3ZV908ngu1LJYj7DwGT.jpg', 'image_picker_5482B042-8043-464E-BDAA-E71DFEEE8ADB-4439-000001503771B7DB.jpg', 'bookings/MyURyDWcKh0SFzyN5OdTt3ZV908ngu1LJYj7DwGT.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 15:41:07', NULL, NULL),
(112, 'bookings', 24, 'bookings/VOR7uwgdxnfwKGtjJxtefmOX0DQKl9KL5ZPF1nB0.jpg', 'image_picker_0530740C-73CF-4033-BDF4-4EF753BF1E23-4439-00000150413345D3.jpg', 'bookings/VOR7uwgdxnfwKGtjJxtefmOX0DQKl9KL5ZPF1nB0.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 15:41:07', NULL, NULL),
(113, 'bookings', 24, 'returned/ONrChme8BN3bxKVaaVI3NOE0AaUkHXugSZlixl9f.jpg', 'image_picker_2A5D756A-C1A2-49DE-9DF5-64D619EBE0DF-4439-0000015BC5521EA6.jpg', 'returned/ONrChme8BN3bxKVaaVI3NOE0AaUkHXugSZlixl9f.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 15:42:38', NULL, NULL),
(114, 'bookings', 25, 'bookings/u6zO1KHZoR70AMCvvCJF44Rfw9ORdWTO2SSjB83v.jpg', 'image_picker_CC90658E-197E-4BA9-BD88-CC3BB0AD0B6F-4439-0000015C7B090C2C.jpg', 'bookings/u6zO1KHZoR70AMCvvCJF44Rfw9ORdWTO2SSjB83v.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 15:44:52', NULL, NULL),
(115, 'bookings', 25, 'bookings/p2FDA71GzTTl4poRoM7ih7Zr8y2aqLM0KJtxlMHK.jpg', 'image_picker_98FED783-2892-4A49-A80D-420CAB4D741A-4439-0000015C82D5367E.jpg', 'bookings/p2FDA71GzTTl4poRoM7ih7Zr8y2aqLM0KJtxlMHK.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 15:44:52', NULL, NULL),
(116, 'bookings', 25, 'returned/MP24ORJW8aUjYz9qMsAv2VUQ2lANx1fqZRMsjopQ.jpg', 'image_picker_FB220530-0AA3-4C98-9175-D91BA91DF130-4439-0000015CC2ACEAD6.jpg', 'returned/MP24ORJW8aUjYz9qMsAv2VUQ2lANx1fqZRMsjopQ.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 15:45:35', NULL, NULL),
(117, 'bookings', 26, 'bookings/PacbcGyJ8EJ3myvLOcCSjxh4BxmmyDh8BN3S0YF2.jpg', 'image_picker_78DEB852-41CA-4C0F-BAC5-89A416BB0F6F-4439-0000015D472F2FEA.jpg', 'bookings/PacbcGyJ8EJ3myvLOcCSjxh4BxmmyDh8BN3S0YF2.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 15:47:15', NULL, NULL),
(118, 'bookings', 26, 'bookings/fkTADyWF8OZ2Q0dX0Y2gkGewzfba7bjnnB8p4HVH.jpg', 'image_picker_89348169-7970-4743-8284-6ED80DDA5110-4439-0000015D511197BF.jpg', 'bookings/fkTADyWF8OZ2Q0dX0Y2gkGewzfba7bjnnB8p4HVH.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 15:47:15', NULL, NULL),
(119, 'bookings', 26, 'returned/LcBWiAkWAUmTs2ZBb3TORrCUJYp9oggHhWBvY6z0.jpg', 'image_picker_EE4C2980-320A-473F-8BFF-68AFC16F4BCC-4439-0000015D9499D8A3.jpg', 'returned/LcBWiAkWAUmTs2ZBb3TORrCUJYp9oggHhWBvY6z0.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 15:48:02', NULL, NULL),
(120, 'bookings', 27, 'bookings/338IKWQPttn5RZF4jmGQF2yVHXdECVO0t5L4pI5f.jpg', 'image_picker_68D6CA0F-474B-4B4F-869C-7FCFD62AB70B-4439-00000165D8D6D85B.jpg', 'bookings/338IKWQPttn5RZF4jmGQF2yVHXdECVO0t5L4pI5f.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 16:52:33', NULL, NULL),
(121, 'bookings', 27, 'bookings/PAyfUBtr39j0Jw1mmYABoB2jGdMKQjqndmYr8Esv.jpg', 'image_picker_AFC996E8-B83B-48CF-A805-B5EDA8FB7C68-4439-00000165DFDC368F.jpg', 'bookings/PAyfUBtr39j0Jw1mmYABoB2jGdMKQjqndmYr8Esv.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 16:52:33', NULL, NULL),
(122, 'bookings', 27, 'returned/LCXdjlJftxBCn0Yr4DY9LoQdqVTTYzaqv5GbrYDz.jpg', 'image_picker_C01FF692-5338-4758-83C5-41A4F3A68D35-4439-0000016609172CB4.jpg', 'returned/LCXdjlJftxBCn0Yr4DY9LoQdqVTTYzaqv5GbrYDz.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 16:53:01', NULL, NULL),
(123, 'disputes', 27, 'disputes/eYOLJkrfStVOEtBh27jivkbqblUCYLDWV8rZVrhk.jpg', 'image_picker_55705A45-7415-44DA-B789-60E0522033BE-4439-000001665AB8F2C4.jpg', 'disputes/eYOLJkrfStVOEtBh27jivkbqblUCYLDWV8rZVrhk.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 16:53:57', NULL, NULL),
(124, 'bookings', 28, 'bookings/lHbZB6CFjCgOb1DIJVf5HLQz4XVxAqods1wJLtPP.jpg', 'scaled_Screenshot_20230428-162718_One UI Home.jpg', 'bookings/lHbZB6CFjCgOb1DIJVf5HLQz4XVxAqods1wJLtPP.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 18:54:39', NULL, NULL),
(125, 'bookings', 28, 'bookings/Ba75NXjz6u5yFyC3ocxTBSuh5WhjsasDquhCsSWA.jpg', 'scaled_IMG_20230411_125849657.jpg', 'bookings/Ba75NXjz6u5yFyC3ocxTBSuh5WhjsasDquhCsSWA.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 18:54:39', NULL, NULL),
(126, 'bookings', 28, 'returned/YJNQphB5GABnqlPRIP28RmfpAasAeNfDIhH3NDMJ.jpg', 'scaled_Screenshot_20230428-162718_One UI Home.jpg', 'returned/YJNQphB5GABnqlPRIP28RmfpAasAeNfDIhH3NDMJ.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 18:55:12', NULL, NULL),
(127, 'disputes', 28, 'disputes/H76I8gStO5JBfPiSY3ly7wKWxBN0fR5IrFcNTkvJ.jpg', 'scaled_Screenshot_20230427-132208.jpg', 'disputes/H76I8gStO5JBfPiSY3ly7wKWxBN0fR5IrFcNTkvJ.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 18:55:35', NULL, NULL),
(128, 'bookings', 29, 'bookings/WS41rnV36FnBQciuEJL8FYRdPym5fKjiJIJfLas1.jpg', 'scaled_IMG_20230411_125849657.jpg', 'bookings/WS41rnV36FnBQciuEJL8FYRdPym5fKjiJIJfLas1.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 18:57:50', NULL, NULL),
(129, 'bookings', 29, 'bookings/Ti5Vx7qfBop4BPZECLNqqZznijpmDYpL02WiuiiI.jpg', 'scaled_IMG_20230410_152115235.jpg', 'bookings/Ti5Vx7qfBop4BPZECLNqqZznijpmDYpL02WiuiiI.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 18:57:50', NULL, NULL),
(130, 'bookings', 29, 'returned/1J8LHQMwjIqLMir9C27vlMsooI5Upd8DFgtpbKGF.jpg', 'scaled_Screenshot_20230428-162718_One UI Home.jpg', 'returned/1J8LHQMwjIqLMir9C27vlMsooI5Upd8DFgtpbKGF.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 19:02:02', NULL, NULL),
(131, 'disputes', 29, 'disputes/hxNrpl8L1zJZmJmbyyr6ca6tPPHhfeTjKgV4G5Hl.jpg', 'scaled_3cc52d47-44cd-45e8-a022-dff8fd0625927369515643451299603.jpg', 'disputes/hxNrpl8L1zJZmJmbyyr6ca6tPPHhfeTjKgV4G5Hl.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-02 19:08:34', NULL, NULL),
(132, 'disputes', 30, 'disputes/sXTrRrtlWh8KFbkeS6H4Q2W4RXqR5JLId6w87I4a.png', 'image_picker_1DECA1C7-7AA7-44A9-8123-F5242F5C149D-312-00000007F4CECA3E.png', 'disputes/sXTrRrtlWh8KFbkeS6H4Q2W4RXqR5JLId6w87I4a.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-02 19:09:58', NULL, NULL),
(133, 'disputes', 31, 'disputes/tEVls53FOZga10arec74Hp0BCjzwMiOAyHuRDkD6.png', 'image_picker_7DF3E72A-5F82-43CB-AE91-D54A3585B364-239-000000039E1217B2.png', 'disputes/tEVls53FOZga10arec74Hp0BCjzwMiOAyHuRDkD6.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-03 11:55:48', NULL, NULL),
(134, 'disputes', 32, 'disputes/M7WrXtXlgbvT1h6py8tJ5mSfQpw7BvgS9at2RagL.png', 'image_picker_EC8DA43D-E39E-4F8A-A1FA-AF55DDBA743D-239-00000003C3E8D25C.png', 'disputes/M7WrXtXlgbvT1h6py8tJ5mSfQpw7BvgS9at2RagL.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-03 11:56:19', NULL, NULL),
(135, 'disputes', 33, 'disputes/IEQ7moe6yLsqYU8aHdcjLIRGLw6DYDxAZsaveCmB.jpg', 'scaled_abdb224c-cf91-44ff-9e37-ec386efc97041279244280685529191.jpg', 'disputes/IEQ7moe6yLsqYU8aHdcjLIRGLw6DYDxAZsaveCmB.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-03 15:08:32', NULL, NULL),
(136, 'products', 11, 'products/HVTCkCzWcsPRgFWDdjRFBwk6mRpLc0Mixrw1Zvpa.jpg', 'image_picker_59A28548-C20B-4EEA-A526-EF9D21B97627-6417-00000116CD4F1C1D.jpg', 'products/HVTCkCzWcsPRgFWDdjRFBwk6mRpLc0Mixrw1Zvpa.jpg', '', '', 'image/jpeg', 'image', 'local', 'public', NULL, '2023-05-05 15:46:01', NULL, NULL),
(137, 'bookings', 30, 'bookings/A3pD0id2S6hSSigj3uDhbC5I8P8HRVyW2QiUtYEY.png', 'scaled_Screenshot_20230419-202816.png', 'bookings/A3pD0id2S6hSSigj3uDhbC5I8P8HRVyW2QiUtYEY.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 15:47:24', NULL, NULL),
(138, 'bookings', 30, 'bookings/KiLjcoCVkInaWsjYwb1Oz16JmIY9hmmqf5JwtRIe.jpg', 'scaled_Screenshot_20230406-135422.png', 'bookings/KiLjcoCVkInaWsjYwb1Oz16JmIY9hmmqf5JwtRIe.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 15:47:24', NULL, NULL),
(139, 'bookings', 30, 'returned/YExOwjoyT3hNeOKtKcrV85FOVy2oyCLnQnWiGY6n.jpg', 'scaled_Screenshot_20230325-153136.png', 'returned/YExOwjoyT3hNeOKtKcrV85FOVy2oyCLnQnWiGY6n.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 15:47:56', NULL, NULL),
(140, 'disputes', 34, 'disputes/GZElQBxbuVD7FljNgMd7vv64ce2dMu6gr5rghk5C.jpg', 'scaled_Screenshot_20230406-135422.png', 'disputes/GZElQBxbuVD7FljNgMd7vv64ce2dMu6gr5rghk5C.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 15:48:39', NULL, NULL),
(141, 'bookings', 31, 'bookings/XGdjx7eqftVtpzc4SplUAfwG4UV8CnEuWJCVKelS.jpg', 'scaled_Screenshot_20230406-135422.png', 'bookings/XGdjx7eqftVtpzc4SplUAfwG4UV8CnEuWJCVKelS.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:10:29', NULL, NULL),
(142, 'bookings', 31, 'bookings/ZemvwnzNbrbt0kOy6D67khWr3F81Csrsx5oix1QD.jpg', 'scaled_Screenshot_20230325-153136.png', 'bookings/ZemvwnzNbrbt0kOy6D67khWr3F81Csrsx5oix1QD.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:10:29', NULL, NULL),
(143, 'bookings', 32, 'bookings/tlFzgveRODtjzeKFOdI6DwUcCGR3BSjZaLcGm2qX.jpg', 'scaled_Screenshot_20230406-135422.png', 'bookings/tlFzgveRODtjzeKFOdI6DwUcCGR3BSjZaLcGm2qX.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:17:37', NULL, NULL),
(144, 'bookings', 32, 'bookings/6ntNgHZzPaYCZLhkA4OwmGkED12dCeNhATwaWDQO.jpg', 'scaled_Screenshot_20230325-153136.png', 'bookings/6ntNgHZzPaYCZLhkA4OwmGkED12dCeNhATwaWDQO.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:17:37', NULL, NULL),
(145, 'bookings', 33, 'bookings/xNK8btsEUBfvQ1Grkbk9rKQQbjbGzIudL0fv4iwt.jpg', 'scaled_Screenshot_20230406-135422.png', 'bookings/xNK8btsEUBfvQ1Grkbk9rKQQbjbGzIudL0fv4iwt.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:36:43', NULL, NULL),
(146, 'bookings', 33, 'bookings/b632A8Y893n7NV5gu1EiwWZH1rIBmIVXGzCDbDr2.jpg', 'scaled_Screenshot_20230325-153136.png', 'bookings/b632A8Y893n7NV5gu1EiwWZH1rIBmIVXGzCDbDr2.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:36:43', NULL, NULL),
(147, 'bookings', 33, 'returned/zoJ8EB4XDFKteNqUfmKLiR8s6zkwDhBZ2p6qzC2G.jpg', 'scaled_c4e936a4-6a58-48da-822b-684d8b979b442451468573542216644.jpg', 'returned/zoJ8EB4XDFKteNqUfmKLiR8s6zkwDhBZ2p6qzC2G.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-05 16:37:23', NULL, NULL),
(148, 'disputes', 35, 'disputes/8GuMwBgnCF21tSmlKgrfNYOFP8XOfFoVtlv6aSjv.jpg', 'image_picker_86A52A65-E21F-40E9-8FFF-4984E2275147-6749-000001283E8BD809.jpg', 'disputes/8GuMwBgnCF21tSmlKgrfNYOFP8XOfFoVtlv6aSjv.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-05 16:38:05', NULL, NULL),
(149, 'bookings', 34, 'bookings/8TlZxaw1iJo9MTVQj5yCVK1d33wGZud7DbVl9hF1.jpg', 'scaled_Screenshot_20230325-153136.png', 'bookings/8TlZxaw1iJo9MTVQj5yCVK1d33wGZud7DbVl9hF1.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:46:37', NULL, NULL),
(150, 'bookings', 34, 'bookings/taerQTiZu0QfhHraqoTVCzzxJ7ssir2lSBwYKO92.jpg', 'scaled_Screenshot_20230405-121612.png', 'bookings/taerQTiZu0QfhHraqoTVCzzxJ7ssir2lSBwYKO92.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:46:37', NULL, NULL),
(151, 'bookings', 35, 'bookings/ikzcWLvUC09miBavsiDiJ7t9PlWPhzhvEbkRks01.png', 'scaled_Screenshot_20230414-163753.png', 'bookings/ikzcWLvUC09miBavsiDiJ7t9PlWPhzhvEbkRks01.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:48:18', NULL, NULL),
(152, 'bookings', 35, 'bookings/JA6zdh91pzY5rvaD33F2T7EGn6Fa3oZOYAj6DlZl.jpg', 'scaled_Screenshot_20230405-142138.png', 'bookings/JA6zdh91pzY5rvaD33F2T7EGn6Fa3oZOYAj6DlZl.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:48:18', NULL, NULL),
(153, 'bookings', 35, 'returned/JbXybaHtsul9ew6mbxc0EDFlDL3OcqU3B8XprY6R.png', 'scaled_Screenshot_20230414-161946.png', 'returned/JbXybaHtsul9ew6mbxc0EDFlDL3OcqU3B8XprY6R.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:48:50', NULL, NULL),
(154, 'bookings', 36, 'bookings/kE9YTnbGl5hbE9867cG5DiXogYjggpQLj4xsygBV.jpg', 'scaled_Screenshot_20230428-151344.png', 'bookings/kE9YTnbGl5hbE9867cG5DiXogYjggpQLj4xsygBV.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:49:48', NULL, NULL),
(155, 'bookings', 36, 'bookings/KdblcHzYIf661Sxi547Sm8MKFR4jrjUjf6mIGQym.jpg', 'scaled_PXL_20230505_052936735.jpg', 'bookings/KdblcHzYIf661Sxi547Sm8MKFR4jrjUjf6mIGQym.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-05 16:49:48', NULL, NULL),
(156, 'bookings', 37, 'bookings/hwx07Iw8wC0uKCKjsVZgW4RKY3zv1FJLhrwyITZL.jpg', 'scaled_Screenshot_20230406-135422.png', 'bookings/hwx07Iw8wC0uKCKjsVZgW4RKY3zv1FJLhrwyITZL.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:52:15', NULL, NULL),
(157, 'bookings', 37, 'bookings/peAsaIuloXX4KYzqKTqHu0JGfWTdmxFWjH0xibWa.jpg', 'scaled_Screenshot_20230405-121612.png', 'bookings/peAsaIuloXX4KYzqKTqHu0JGfWTdmxFWjH0xibWa.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:52:15', NULL, NULL),
(158, 'bookings', 38, 'bookings/awtJGp6Dodlb7FjGDaLLj9d38OlwMS5bW2U9a53Z.jpg', 'scaled_PXL_20230505_052941475.jpg', 'bookings/awtJGp6Dodlb7FjGDaLLj9d38OlwMS5bW2U9a53Z.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-05 16:54:31', NULL, NULL),
(159, 'bookings', 38, 'bookings/rQCQxaLl60a9fWLNabbuL1PGpia6NgWF28NW66aq.jpg', 'scaled_Screenshot_20230504-190212.png', 'bookings/rQCQxaLl60a9fWLNabbuL1PGpia6NgWF28NW66aq.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 16:54:31', NULL, NULL),
(160, 'bookings', 39, 'bookings/BJttxOjP4LHRnaP0TMtRQSCtcT2KE86haMMf6UVd.jpg', 'scaled_PXL_20230505_052941475.jpg', 'bookings/BJttxOjP4LHRnaP0TMtRQSCtcT2KE86haMMf6UVd.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-05 17:08:55', NULL, NULL),
(161, 'bookings', 39, 'bookings/1DPtyjZ9DDbJL5xHnQaR7FNEbMoL1z6ZOmuBOgOF.jpg', 'scaled_Screenshot_20230504-190212.png', 'bookings/1DPtyjZ9DDbJL5xHnQaR7FNEbMoL1z6ZOmuBOgOF.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 17:08:55', NULL, NULL),
(162, 'bookings', 39, 'returned/fQq29EANfd4ssfzhIMPfmYK5KGCcD2MMqW7oandt.jpg', 'scaled_PXL_20230505_052941475.jpg', 'returned/fQq29EANfd4ssfzhIMPfmYK5KGCcD2MMqW7oandt.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-05 17:09:54', NULL, NULL),
(163, 'disputes', 36, 'disputes/6oSaPU4kUlfSQJlQKf1xErB8GzQ2fnAGcNMse93v.jpg', 'scaled_PXL_20230505_052941475.jpg', 'disputes/6oSaPU4kUlfSQJlQKf1xErB8GzQ2fnAGcNMse93v.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-05 17:10:12', NULL, NULL),
(164, 'bookings', 40, 'bookings/3bGozvcdKwYqLV0NFB99ZB1VyYUCh0HzHpswS8ty.png', 'scaled_Screenshot_20230419-202816.png', 'bookings/3bGozvcdKwYqLV0NFB99ZB1VyYUCh0HzHpswS8ty.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 17:18:56', NULL, NULL),
(165, 'bookings', 40, 'bookings/khp8RdHRJmZYW5R4uSvFVOCCe8ojsQ82Vfm9SRxw.jpg', 'scaled_Screenshot_20230406-135422.png', 'bookings/khp8RdHRJmZYW5R4uSvFVOCCe8ojsQ82Vfm9SRxw.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 17:18:56', NULL, NULL),
(166, 'bookings', 41, 'bookings/6r8GIlAVRfzEbqJJO3eikiJb9qaktKNBwlEMrwH6.jpg', 'scaled_PXL_20230505_052936735.jpg', 'bookings/6r8GIlAVRfzEbqJJO3eikiJb9qaktKNBwlEMrwH6.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-05 17:21:38', NULL, NULL),
(167, 'bookings', 41, 'bookings/RwsPtM5OPzOeupW38uta5MxWxkKbFrnVylQCZzsT.png', 'scaled_Screenshot_20230419-202816.png', 'bookings/RwsPtM5OPzOeupW38uta5MxWxkKbFrnVylQCZzsT.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 17:21:38', NULL, NULL),
(168, 'bookings', 41, 'returned/pUCSHrYeUTPPDA778dukLSP8Vim7O2E4xOV506sf.jpg', 'scaled_Screenshot_20230405-121612.png', 'returned/pUCSHrYeUTPPDA778dukLSP8Vim7O2E4xOV506sf.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 17:22:35', NULL, NULL),
(169, 'disputes', 1, 'disputes/tdx96lpW2M6pmObDP1M33tWJ4DT9xkJCqHCFq9CC.png', 'scaled_Screenshot_20230419-202816.png', 'disputes/tdx96lpW2M6pmObDP1M33tWJ4DT9xkJCqHCFq9CC.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 17:22:59', NULL, NULL),
(170, 'bookings', 42, 'bookings/cXxst3RBWNpWTmQZqrnVL3lmxZL2VvZnhHTkA1Lg.jpg', 'scaled_Screenshot_20230406-135422.png', 'bookings/cXxst3RBWNpWTmQZqrnVL3lmxZL2VvZnhHTkA1Lg.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 17:25:33', NULL, NULL),
(171, 'bookings', 42, 'bookings/q3D1QKEWWhLpPk8oyVIBFy6XCbalzHGlS8ZumZ2n.jpg', 'scaled_Screenshot_20230406-135422.png', 'bookings/q3D1QKEWWhLpPk8oyVIBFy6XCbalzHGlS8ZumZ2n.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 17:25:33', NULL, NULL);
INSERT INTO `media` (`id`, `module`, `module_id`, `filename`, `original_name`, `file_url`, `file_url_blur`, `thumbnail_url`, `mime_type`, `file_type`, `driver`, `media_type`, `meta`, `created_at`, `updated_at`, `deleted_at`) VALUES
(172, 'bookings', 42, 'returned/peKvHS1QK2yDfw0nbbW7trMGEw2ZgE4LwtjkN6UV.jpg', 'scaled_PXL_20230505_055812349.jpg', 'returned/peKvHS1QK2yDfw0nbbW7trMGEw2ZgE4LwtjkN6UV.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-05 17:26:16', NULL, NULL),
(173, 'disputes', 2, 'disputes/4XRQCYPrq0ZEqeZ6KzrVnQG8zFrBEeOUSCioUq4N.jpg', 'scaled_Screenshot_20230406-135422.png', 'disputes/4XRQCYPrq0ZEqeZ6KzrVnQG8zFrBEeOUSCioUq4N.jpg', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-05 17:26:41', NULL, NULL),
(174, 'disputes', 3, 'disputes/Z1OlWTjOP6dQ31QfZlmPuFs4h8MZOarJ0lpYWcuV.jpg', 'image_picker_EB6EBC99-369E-45F5-B3A5-E02973F4C6C8-6795-0000013A4453BE02.jpg', 'disputes/Z1OlWTjOP6dQ31QfZlmPuFs4h8MZOarJ0lpYWcuV.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-05 17:31:44', NULL, NULL),
(175, 'bookings', 43, 'bookings/PYZZOcEdiqhEqCayTPbH8aJhBBNF43m7XMtgiEA3.jpg', 'image_picker_0F781F04-564E-43DC-B860-901217F81020-337-00000004B5C55EB1.jpg', 'bookings/PYZZOcEdiqhEqCayTPbH8aJhBBNF43m7XMtgiEA3.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-08 12:05:54', NULL, NULL),
(176, 'bookings', 43, 'bookings/pf8vCLGP06Ybpnu6Q57Id7evXRukkBwdJ0I3bsVB.png', 'image_picker_5BE6500D-DF61-45FF-9501-2EA3C3569F2D-337-00000004C3E69CF9.png', 'bookings/pf8vCLGP06Ybpnu6Q57Id7evXRukkBwdJ0I3bsVB.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-08 12:05:54', NULL, NULL),
(177, 'bookings', 43, 'returned/2urdkUgkcOXIAHHemYCgrBlprFYgp3p2ClS4j8xS.jpg', 'image_picker_500DBD39-465F-4ADF-946E-A3E7AF425213-337-00000004F8668C62.jpg', 'returned/2urdkUgkcOXIAHHemYCgrBlprFYgp3p2ClS4j8xS.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-08 12:06:30', NULL, NULL),
(178, 'disputes', 4, 'disputes/Jg78hjxN8pYTqJdrzv5lYJq3lcfqTjWl9fGqece2.jpg', 'image_picker_D949C611-0F7C-4AF0-AB3F-8F14DC20BF56-337-0000000519EC4793.jpg', 'disputes/Jg78hjxN8pYTqJdrzv5lYJq3lcfqTjWl9fGqece2.jpg', '', NULL, 'image/jpeg', 'jpg', 'local', 'public', NULL, '2023-05-08 12:06:54', NULL, NULL),
(179, 'bookings', 44, 'bookings/i7jloK0KlAKf3As5sbjF2uJEcW1uBzk7sIz47k0o.png', 'image_picker_D0040C1F-DB39-46F9-9EDE-4C7314831A32-2612-0000019B54E44D5D.png', 'bookings/i7jloK0KlAKf3As5sbjF2uJEcW1uBzk7sIz47k0o.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-08 12:34:30', NULL, NULL),
(180, 'bookings', 44, 'bookings/TrLyFPAvsu3r2tzDkckvoHpEOP5xYCSnBXiG2qNz.png', 'image_picker_63443DF7-2F2B-407B-AC5F-12E2C8E61DFD-2612-0000019B597B49FF.png', 'bookings/TrLyFPAvsu3r2tzDkckvoHpEOP5xYCSnBXiG2qNz.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-08 12:34:30', NULL, NULL),
(181, 'bookings', 44, 'returned/MiL195Etv8iOhdV9vvrdlz3nEyUw9ufQ7gsqZojj.png', 'image_picker_16CB63DD-6059-4687-8B8B-07DA25DA2978-2612-0000019B9F590AF1.png', 'returned/MiL195Etv8iOhdV9vvrdlz3nEyUw9ufQ7gsqZojj.png', '', NULL, 'image/png', 'png', 'local', 'public', NULL, '2023-05-08 12:35:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2022_02_22_071424_create_user_groups_table', 1),
(4, '2022_02_22_081152_create_users_table', 1),
(5, '2022_02_22_081416_create_user_api_tokens_table', 1),
(6, '2022_02_22_085937_create_cms_modules_table', 1),
(7, '2022_02_22_085951_create_cms_module_permission_table', 1),
(8, '2022_02_22_090010_create_mail_template_table', 1),
(9, '2022_02_22_090042_create_reset_password_table', 1),
(10, '2022_02_22_090056_create_application_setting_table', 1),
(11, '2022_02_22_090128_create_notifications_table', 1),
(12, '2022_02_22_090139_create_notification_setting_table', 1),
(13, '2022_02_22_090303_create_cms_widgets_table', 1),
(14, '2022_02_22_090319_create_cms_widget_role_table', 1),
(15, '2022_02_22_090354_create_content_management_table', 1),
(16, '2022_02_22_090407_create_faqs_table', 1),
(17, '2022_02_22_090419_create_media_table', 1),
(18, '2022_02_23_110217_create_jobs_table', 1),
(19, '2022_04_07_130259_chat_room', 1),
(20, '2022_04_07_130310_chat_messages', 1),
(21, '2022_04_07_130322_chat_room_status', 1),
(22, '2022_04_07_130332_chat_room_users', 1),
(23, '2022_04_11_113924_users_alter', 1),
(24, '2022_05_06_043959_chat_message_status', 1),
(25, '2022_09_09_052226_create_categories_table', 1),
(26, '2022_09_09_052227_create_products_table', 1),
(27, '2022_09_09_115553_create_bookings_table', 1),
(28, '2022_09_12_114916_create_booking_statuses_table', 1),
(29, '2022_09_13_072219_create_comments_table', 1),
(30, '2022_09_14_071318_create_contact_us_table', 1),
(31, '2022_09_15_064857_create_ad_banners_table', 1),
(32, '2022_09_15_095404_create_category_users_table', 1),
(33, '2022_09_16_055636_create_user_cards_table', 1),
(34, '2022_09_19_042228_create_user_connect_accounts_table', 1),
(35, '2022_09_19_043326_create_user_external_accounts_table', 1),
(36, '2022_09_20_082056_create_user_transactions_table', 1),
(37, '2022_12_26_053058_create_product_sells_table', 1),
(38, '2022_12_26_053059_create_disputes_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actor_id` bigint(20) UNSIGNED NOT NULL,
  `target_id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` int(11) NOT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `reference_module` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_redirect_link` text COLLATE utf8mb4_unicode_ci,
  `is_read` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_view` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `unique_id`, `identifier`, `actor_id`, `target_id`, `module`, `module_id`, `reference_id`, `reference_module`, `title`, `description`, `web_redirect_link`, `is_read`, `is_view`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '6454ffe7b06fd1683292135', 'bookings', 7, 8, 'bookings', 39, 11, 'products', 'Booking', 'You have a new rental request, please tap to view details.', '168329213512978', '1', '0', '2023-05-05 17:08:55', '2023-05-08 12:55:45', NULL),
(2, '645500115061a1683292177', 'bookings', 8, 7, 'bookings', 39, 11, 'products', 'Booking status', 'You have successfully possessed the rented item.', '168329213512978', '1', '0', '2023-05-05 17:09:37', '2023-05-08 12:55:43', NULL),
(3, '6455001900d701683292185', 'bookings', 8, 7, 'bookings', 39, 11, 'products', 'Booking status', 'You have successfully possessed the rented item.', '168329213512978', '1', '0', '2023-05-05 17:09:45', '2023-05-08 12:55:43', NULL),
(4, '64550022d11a11683292194', 'bookings', 7, 8, 'bookings', 39, 11, 'products', 'Booking status', 'Your item has been returned successfully, please tap to view details.', '168329213512978', '1', '0', '2023-05-05 17:09:54', '2023-05-08 12:55:45', NULL),
(5, '64550026907f71683292198', 'bookings', 8, 7, 'bookings', 39, 11, 'products', 'Booking status', 'You have successfully returned the rented item. Please don\'t forget to leave your ratings & reviews.', '168329213512978', '1', '0', '2023-05-05 17:09:58', '2023-05-08 12:55:43', NULL),
(6, '6455024158df51683292737', 'bookings', 7, 8, 'bookings', 40, 11, 'products', 'Booking', 'You have a new rental request, please tap to view details.', '168329273655589', '1', '0', '2023-05-05 17:18:57', '2023-05-08 12:55:45', NULL),
(7, '64550283698301683292803', 'bookings', 7, 8, 'bookings', 40, 11, 'products', 'Booking status', 'user1 Three has cancelled the booking #40', '168329273655589', '1', '0', '2023-05-05 17:20:03', '2023-05-08 12:55:45', NULL),
(8, '645502e285f001683292898', 'bookings', 7, 8, 'bookings', 41, 11, 'products', 'Booking', 'You have a new rental request, please tap to view details.', '168329289825358', '1', '0', '2023-05-05 17:21:38', '2023-05-08 12:55:45', NULL),
(9, '645503070b5be1683292935', 'bookings', 8, 7, 'bookings', 41, 11, 'products', 'Booking status', 'You have successfully possessed the rented item.', '168329289825358', '1', '0', '2023-05-05 17:22:15', '2023-05-08 12:55:43', NULL),
(10, '6455030c848511683292940', 'bookings', 8, 7, 'bookings', 41, 11, 'products', 'Booking status', 'You have successfully possessed the rented item.', '168329289825358', '1', '0', '2023-05-05 17:22:20', '2023-05-08 12:55:43', NULL),
(11, '6455031bec11b1683292955', 'bookings', 7, 8, 'bookings', 41, 11, 'products', 'Booking status', 'Your item has been returned successfully, please tap to view details.', '168329289825358', '1', '0', '2023-05-05 17:22:35', '2023-05-08 12:55:45', NULL),
(12, '64550320c27a71683292960', 'bookings', 8, 7, 'bookings', 41, 11, 'products', 'Booking status', 'You have successfully returned the rented item. Please don\'t forget to leave your ratings & reviews.', '168329289825358', '1', '0', '2023-05-05 17:22:40', '2023-05-08 12:55:43', NULL),
(13, '6455033374ee91683292979', 'disputes', 7, 2, 'bookings', 1, 1, 'disputes', 'New Dispute Request', 'You have new dispute request to resolve.', '6455033371bdb', '0', '0', '2023-05-05 17:22:59', NULL, NULL),
(14, '64550333bf6ff1683292979', 'disputes', 7, 8, 'disputes', 1, 41, 'bookings', 'Dispute Request', 'Your dispute has been submitted.', NULL, '1', '0', '2023-05-05 17:22:59', '2023-05-08 12:55:45', NULL),
(15, '645503cddf4791683293133', 'bookings', 7, 8, 'bookings', 42, 11, 'products', 'Booking', 'You have a new rental request, please tap to view details.', '168329313362325', '1', '0', '2023-05-05 17:25:33', '2023-05-08 12:55:45', NULL),
(16, '645503d52ac181683293141', 'contact', 8, 2, 'payment', 42, 42, 'booking', 'Payment Recieved', 'New Payment Recieved ', 'https://rentarbo.qa.retrocubedev.com/admin/user-transction', '0', '0', '2023-05-05 17:25:41', NULL, NULL),
(17, '645503d56200b1683293141', 'bookings', 8, 7, 'bookings', 42, 11, 'products', 'Booking status', 'Your rental request has been accepted successfully, please tap to view details.', '168329313362325', '1', '0', '2023-05-05 17:25:41', '2023-05-08 12:55:43', NULL),
(18, '645503e5a93a51683293157', 'bookings', 8, 7, 'bookings', 42, 11, 'products', 'Booking status', 'You have successfully possessed the rented item.', '168329313362325', '1', '0', '2023-05-05 17:25:57', '2023-05-08 12:55:43', NULL),
(19, '645503f95f3101683293177', 'bookings', 7, 8, 'bookings', 42, 11, 'products', 'Booking status', 'Your item has been returned successfully, please tap to view details.', '168329313362325', '1', '0', '2023-05-05 17:26:17', '2023-05-08 12:55:45', NULL),
(20, '645503fc42b0e1683293180', 'bookings', 8, 7, 'bookings', 42, 11, 'products', 'Booking status', 'You have successfully returned the rented item. Please don\'t forget to leave your ratings & reviews.', '168329313362325', '1', '0', '2023-05-05 17:26:20', '2023-05-08 12:55:43', NULL),
(21, '6455041127e621683293201', 'disputes', 7, 2, 'bookings', 2, 2, 'disputes', 'New Dispute Request', 'You have new dispute request to resolve.', '64550411238d8', '0', '0', '2023-05-05 17:26:41', NULL, NULL),
(23, '645505406e9681683293504', 'disputes', 7, 2, 'bookings', 3, 3, 'disputes', 'New Dispute Request', 'You have new dispute request to resolve.', '645505406a7a5', '0', '0', '2023-05-05 17:31:44', NULL, NULL),
(24, '64550540ca1811683293504', 'disputes', 7, 8, 'disputes', 3, 42, 'bookings', 'Dispute Request', 'Your dispute has been submitted.', '645505406a7a5', '1', '0', '2023-05-05 17:31:44', '2023-05-08 12:55:45', NULL),
(25, '64550585636a81683293573', 'chat', 7, 8, 'chat', 14, 2, 'chat', 'Chat', 'user1 Three has sent you a message', 'https://rentarbo.qa.retrocubedev.com/pastor/inbox', '1', '0', '2023-05-05 17:32:53', '2023-05-08 12:55:45', NULL),
(26, '645505c74991b1683293639', 'chat', 7, 8, 'chat', 15, 2, 'chat', 'Chat', 'user1 Three has sent you a message', 'https://rentarbo.qa.retrocubedev.com/pastor/inbox', '1', '0', '2023-05-05 17:33:59', '2023-05-08 12:55:45', NULL),
(27, '645505d1205821683293649', 'chat', 7, 8, 'chat', 16, 2, 'chat', 'Chat', 'user1 Three has sent you a message', 'https://rentarbo.qa.retrocubedev.com/pastor/inbox', '1', '0', '2023-05-05 17:34:09', '2023-05-08 12:55:45', NULL),
(28, '645505e4d84851683293668', 'chat', 8, 7, 'chat', 17, 2, 'chat', 'Chat', 'user2 user2 has sent you a message', 'https://rentarbo.qa.retrocubedev.com/pastor/inbox', '1', '0', '2023-05-05 17:34:28', '2023-05-08 12:55:43', NULL),
(29, '645505ec586401683293676', 'chat', 8, 7, 'chat', 18, 2, 'chat', 'Chat', 'user2 user2 has sent you a message', 'https://rentarbo.qa.retrocubedev.com/pastor/inbox', '1', '0', '2023-05-05 17:34:36', '2023-05-08 12:55:43', NULL),
(30, '645505f92eed81683293689', 'chat', 8, 7, 'chat', 19, 2, 'chat', 'Chat', 'user2 user2 has sent you a message', 'https://rentarbo.qa.retrocubedev.com/pastor/inbox', '1', '0', '2023-05-05 17:34:49', '2023-05-08 12:55:43', NULL),
(31, '6458ad63096e71683533155', 'bookings', 8, 7, 'bookings', 43, 7, 'products', 'Booking', 'You have a new rental request, please tap to view details.', '168353315366288', '1', '0', '2023-05-08 12:05:55', '2023-05-08 12:55:43', NULL),
(32, '6458ad6e2ba211683533166', 'contact', 7, 2, 'payment', 43, 43, 'booking', 'Payment Recieved', 'New Payment Recieved ', 'https://rentarbo.qa.retrocubedev.com/admin/user-transction', '0', '0', '2023-05-08 12:06:06', NULL, NULL),
(33, '6458ad6e864241683533166', 'bookings', 7, 8, 'bookings', 43, 7, 'products', 'Booking status', 'Your rental request has been accepted successfully, please tap to view details.', '168353315366288', '1', '0', '2023-05-08 12:06:06', '2023-05-08 12:55:45', NULL),
(34, '6458ad7748e091683533175', 'bookings', 7, 8, 'bookings', 43, 7, 'products', 'Booking status', 'You have successfully possessed the rented item.', '168353315366288', '1', '0', '2023-05-08 12:06:15', '2023-05-08 12:55:45', NULL),
(35, '6458ad86735e31683533190', 'bookings', 8, 7, 'bookings', 43, 7, 'products', 'Booking status', 'Your item has been returned successfully, please tap to view details.', '168353315366288', '1', '0', '2023-05-08 12:06:30', '2023-05-08 12:55:43', NULL),
(36, '6458ad8a5cf311683533194', 'bookings', 7, 8, 'bookings', 43, 7, 'products', 'Booking status', 'You have successfully returned the rented item. Please don\'t forget to leave your ratings & reviews.', '168353315366288', '1', '0', '2023-05-08 12:06:34', '2023-05-08 12:55:45', NULL),
(37, '6458ad9e24b1c1683533214', 'disputes', 8, 2, 'bookings', 4, 4, 'disputes', 'New Dispute Request', 'You have new dispute request to resolve.', '6458ad9e1fd2b', '0', '0', '2023-05-08 12:06:54', NULL, NULL),
(38, '6458ad9e680f81683533214', 'disputes', 8, 7, 'disputes', 4, 43, 'bookings', 'Dispute Request', 'Your dispute has been submitted.', '6458ad9e1fd2b', '1', '0', '2023-05-08 12:06:54', '2023-05-08 12:55:43', NULL),
(39, '6458ae3b646631683533371', 'disputes', 8, 7, 'disputes', 4, 43, NULL, 'Dispute Status', 'Your dispute request status update by admin, please tap to view details.', '6458ad9e1fd2b', '1', '0', '2023-05-08 12:09:31', '2023-05-08 12:55:43', NULL),
(40, '6458ae3b951cf1683533371', 'disputes', 8, 8, 'disputes', 4, 43, NULL, 'Dispute Status', 'Your dispute request status update by admin, please tap to view details.', '6458ad9e1fd2b', '1', '0', '2023-05-08 12:09:31', '2023-05-08 12:55:45', NULL),
(41, '6458afbaedb2f1683533754', 'chat', 7, 8, 'chat', 20, 2, 'chat', 'Chat', 'user1 Three has sent you a message', 'https://rentarbo.qa.retrocubedev.com/pastor/inbox', '1', '0', '2023-05-08 12:15:54', '2023-05-08 12:55:45', NULL),
(42, '6458b0b27976e1683534002', 'contact', 8, 2, 'contact', 2, 2, 'contact', 'New User Query Request', 'You have new query to respond him it.', '12693contact1683534002', '0', '0', '2023-05-08 12:20:02', NULL, NULL),
(43, '6458b0b704f581683534007', 'contact', 8, 2, 'contact', 3, 3, 'contact', 'New User Query Request', 'You have new query to respond him it.', '89764contact1683534007', '0', '0', '2023-05-08 12:20:07', NULL, NULL),
(44, '6458b4173a9021683534871', 'bookings', 10, 8, 'bookings', 44, 11, 'products', 'Booking', 'You have a new rental request, please tap to view details.', '168353487072299', '1', '0', '2023-05-08 12:34:31', '2023-05-08 12:55:45', NULL),
(45, '6458b4295aec51683534889', 'contact', 8, 2, 'payment', 44, 44, 'booking', 'Payment Recieved', 'New Payment Recieved ', 'https://rentarbo.qa.retrocubedev.com/admin/user-transction', '0', '0', '2023-05-08 12:34:49', NULL, NULL),
(46, '6458b447584531683534919', 'bookings', 10, 8, 'bookings', 44, 11, 'products', 'Booking status', 'Your item has been returned successfully, please tap to view details.', '168353487072299', '1', '0', '2023-05-08 12:35:19', '2023-05-08 12:55:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_setting`
--

INSERT INTO `notification_setting` (`id`, `user_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'all', 1, '2023-03-23 08:14:51', NULL, NULL),
(2, 4, 'all', 1, '2023-03-23 08:17:26', NULL, NULL),
(3, 7, 'all', 1, '2023-03-24 13:06:39', NULL, NULL),
(4, 8, 'all', 1, '2023-03-24 13:16:37', NULL, NULL),
(5, 11, 'all', 1, '2023-03-28 09:03:59', NULL, NULL),
(6, 12, 'all', 1, '2023-03-28 09:21:55', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `rent_type` enum('hr','day') COLLATE utf8mb4_unicode_ci NOT NULL,
  `rent_charges` decimal(8,2) NOT NULL,
  `sell_price` decimal(8,2) NOT NULL,
  `pick_up_location_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_lat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_lng` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_location_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_lat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drop_lng` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ssn` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_card` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driving_license` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hosting_demos` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `reviews` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  `is_sell` tinyint(4) NOT NULL DEFAULT '0',
  `is_rent` tinyint(4) NOT NULL DEFAULT '0',
  `sell_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category_id`, `name`, `slug`, `description`, `tags`, `rent_type`, `rent_charges`, `sell_price`, `pick_up_location_address`, `pickup_lat`, `pickup_lng`, `drop_location_address`, `drop_lat`, `drop_lng`, `ssn`, `id_card`, `driving_license`, `hosting_demos`, `status`, `rating`, `reviews`, `is_approved`, `is_sell`, `is_rent`, `sell_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 7, 'testproject01', 'testproject0130672', 'testing for reason', '[\"test\",\"pop\"]', 'hr', 25.00, 0.00, '24, Sindh, 75600', '24.832201262991347', '67.03943856060505', 'R2JQ+WQC, Sindh, 75600', '24.832196090281712', '67.03946303576231', 'bsbshsbsh', 'nsjsjsnsnnenw', 'sbsbsbsnsbsjs', '1', 0, '0', '0', 1, 0, 0, 0, '2023-03-23 08:21:10', '2023-03-23 13:23:59', NULL),
(2, 8, 6, 'product one', 'product one51226', 'product smone jssjd dbdjdd ddbjdndd dbdjdnd dbdbhdbdd dbbdbdd d bdndbd dbdbdbd cbdbdbd bbskss sbnss. ssbbsnss. ssbnsns', '[\"bdhdhd\",\"ddbbdbdbd\",\"dbdbd\",\"dd\",\"bdndd\",\"d\",\"dbhddb\"]', 'day', 522.00, 33.00, 'Khaleeq-uz-Zaman Road (Gizri Road), Sindh,', '24.832302891478026', '67.03957200050353', '15th Street, Sindh,', '24.813337693378603', '67.04504907131195', '123456', '123456', '123456', '0', 0, '3.2500', '4', 1, 1, 0, 1, '2023-03-24 13:25:40', '2023-04-28 15:33:07', NULL),
(3, 12, 7, 'rentarnoPro1', 'rentarnoPro136692', 'testig project for Qa', '[\"test\",\"Qa\"]', 'hr', 25.00, 325.00, 'R2JQ+WQC, Sindh, 75600', '24.832192743234177', '67.0394616946578', 'R2JQ+WQC, Sindh, 75600', '24.832192743234177', '67.0394616946578', '1100000000', 'bsbsbsbsjshjs', 'bsjsjsjjsjsjsjjs', '1', 0, '3.0000', '2', 1, 1, 0, 1, '2023-03-28 09:33:28', '2023-03-28 12:09:08', NULL),
(4, 8, 6, 'hchcc', 'hchcc26073', 'g hcchc hccc hchc. hcchc hchc', '[\"ckcjfc\",\"hccchhc\",\"hcchccy\"]', 'day', 23.00, 0.00, 'University Hospital Dr, AL, 36617', '30.708122', '-88.099462', 'University Hospital Dr, AL, 36617', '30.708121969489504', '-88.09946212917566', '12345', '12345', '12345', '0', 1, '0', '0', 0, 0, 0, 0, '2023-03-30 13:46:58', '2023-03-30 13:46:58', NULL),
(5, 7, 6, 'testproduct', 'testproduct14454', 'test test asdfasfd asdfasdf asdfasdf', '[\"Swim Suit\",\"Lifej\"]', 'hr', 12.00, 0.00, 'Khaleeq-uz-Zaman Road (Gizri Road), Sindh,', '24.834493360650182', '67.03845955431463', 'Khaleeq-uz-Zaman Road (Gizri Road), Sindh,', '24.834941247337976', '67.03811623156072', '123123', '123123', '123123', '1', 0, '3.0000', '1', 1, 0, 0, 0, '2023-04-08 22:55:47', '2023-04-28 15:56:03', NULL),
(6, 7, 7, 'testproy', 'testproy20378', 'test test test test test', '[\"test\"]', 'hr', 25.00, 0.00, 'R2JQ+WQC, Sindh, 75600', '24.832162315525256', '67.03946202993393', 'R2JQ+WQC, Sindh, 75600', '24.832162315525256', '67.03946202993393', 'hdhshshhsbsbs', 'dhsbbshshs', 'bsbsbsbsbbsn', '1', 0, '3.0000', '1', 1, 0, 0, 0, '2023-04-28 13:14:28', '2023-05-01 13:16:39', NULL),
(7, 7, 7, 'testing', 'testing57734', 'hshshs bsnbwjw hshsjsj bsbsb', '[\"test\"]', 'hr', 25.00, 0.00, 'R2JQ+WQC, Sindh, 75600', '24.832166271127832', '67.03942749649286', 'R2JQ+WQC, Sindh, 75600', '24.832162315525256', '67.03944593667984', 'bsnsnsnsnbs', 'jsjejsjsjejje', 'enenenensn', '1', 0, '5.0000', '1', 1, 0, 0, 0, '2023-04-28 15:28:50', '2023-05-08 12:06:15', NULL),
(8, 8, 6, 'Testing 1 Test 1', 'Testing 1 Test 198083', 'Testing Testing Testing', '[\"Test\",\"Test2\",\"Test3\"]', 'hr', 60.00, 0.00, 'R2JR+W33, Sindh, 75600', '24.83218391919935', '67.03991498798132', 'R2GQ+8VP, Sindh, 75600', '24.825831668079747', '67.03984558582306', '123456', '111222334', '987654', '1', 0, '3.0000', '2', 1, 0, 0, 0, '2023-05-01 14:59:14', '2023-05-02 12:02:45', NULL),
(9, 7, 7, 'testApppro', 'testApppro72525', 'test test test', '[\"test\",\"pop\"]', 'hr', 25.00, 0.00, 'R2JQ+WQC, Sindh, 75600', '24.83216353263374', '67.03945230692625', 'R2JQ+WQC, Sindh, 75600', '24.832162315525256', '67.03945498913527', 'bsbsbsbsh', 'snsjsjjsjsns', 'jsjnsjsjsjsjj', '1', 0, '3.0000', '1', 1, 0, 0, 0, '2023-05-02 13:36:11', '2023-05-02 13:40:55', NULL),
(10, 7, 7, 'testproApp1', 'testproApp187486', 'test test test yest test', '[\"test\",\"pop\"]', 'hr', 25.00, 0.00, 'R2JQ+WQC, Sindh, 75600', '24.8321615', '67.0394608', 'R2JQ+WQC, Sindh, 75600', '24.832158664199653', '67.03946437686682', 'bzbsbbsbshsb', 'bxbsbsbbdbd', 'sbsbsbsbbd', '1', 0, '3.0000', '8', 1, 0, 0, 0, '2023-05-02 14:34:06', '2023-05-02 16:53:12', NULL),
(11, 8, 7, 'wwwww', 'wwwww47135', 'wwwwww wwwww wwwwww wwwww', '[\"wwww\",\"wwwwww\"]', 'day', 13.00, 0.00, 'Khaleeq-uz-Zaman Road (Gizri Road), Sindh,', '24.832282200655165', '67.03960854560137', 'Khayaban-e-Rumi, Sindh,', '24.82817196098829', '67.04173352569342', '126', '12674', '12574', '0', 0, '3.0000', '2', 1, 0, 0, 0, '2023-05-05 15:46:01', '2023-05-08 12:34:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_sells`
--

CREATE TABLE `product_sells` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_owner_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_charges` decimal(8,2) DEFAULT NULL,
  `stripe_fee` decimal(8,2) DEFAULT NULL,
  `admin_tax` decimal(8,2) DEFAULT NULL,
  `net_amount` decimal(8,2) DEFAULT NULL,
  `sell_status` enum('pending','rejected','completed','accepted','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `picked_up_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `picked_up` datetime DEFAULT NULL,
  `delivered_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `hosting_demo` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `delivered_at` datetime DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sells`
--

INSERT INTO `product_sells` (`id`, `product_id`, `user_id`, `product_owner_id`, `slug`, `total_charges`, `stripe_fee`, `admin_tax`, `net_amount`, `sell_status`, `picked_up_status`, `picked_up`, `delivered_status`, `hosting_demo`, `delivered_at`, `name`, `phone_number`, `additional_info`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 11, 12, '6422a0915ca421679990929', 325.00, 10.00, 10.00, 305.00, 'completed', '1', '2023-03-28 08:09:08', '1', '1', '2023-03-28 08:16:57', 'rentarbo one', '+1-2021242512', 'ghcuvuvuvug jjgjhvjvuv bjv', '2023-03-28 12:08:49', '2023-03-28 12:16:57', NULL),
(2, 2, 7, 8, '642553f719aa51680167927', 33.00, 10.00, 10.00, 13.00, 'completed', '1', '2023-03-30 11:33:14', '1', '0', '2023-03-30 11:33:23', 'user1 Three', '+1-8004444895', 'fyyffyx xyxxy xgcxy xhhxyxyx dydgyx ydstdt', '2023-03-30 13:18:47', '2023-03-30 15:33:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE `reset_password` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reset_password`
--

INSERT INTO `reset_password` (`id`, `email`, `token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'User1@yopmail.com', 'RYBwqxBkxYVCZkvpJfnTBlqXKNXTGM7ETkD0CgZbxrcPGleGPpYKVeIH7a1tVHAOyf8dNYGyD0s4zuJoXSPfZSAdelcWDqu8AwBOoM7xTN0m0SH2H6SspndnbGIXrcTBI8JQzSiUynZTnwMEaouEE3', '2023-03-24 13:31:39', NULL, NULL),
(2, 'user2@yopmail.com', 'ZUAMHTg7dcJCeJf4RAQ6aOgcFo8yXKdFknUr9ebxiLbrx9JvDm7e8WLjcP8KbjQcBArOXHmYISuy8KLGjES2f61JHR6kldsEy97BRNChd86WyJ3tgeEFPxQplVqrtBlU0r7czbJzc2vReA7BxPcu7d', '2023-03-24 15:06:45', NULL, NULL),
(3, 'user1@yopmail.com', 'kx4JxnqNDR1OWSu4kBHtz4xiis7jggVcVQnyZO37XjOGF6h715MZjS9oLZQUH9PYkat0LaohiuLz3A5oyjcLJ7I0XceXVUbQDUUnMBblrm5ERHv6o3S0VKQmhNG4DC9sWwCqqFhb09klcMXrBEcAZG', '2023-05-08 12:02:39', NULL, NULL),
(4, 'user1@yopmail.com', 'OGhkABXf6Du9UMyUzLeUd5MzILxBzyzZcFPtszEnaonLqBN0mNeXTTEHblljzakmUGvoHduHRVyDPqXts2BulhHYSFTYDUm2N9rKPnbzlCDhMhJNveWFY6tHE6kBQd9SLs98INPKo5jbXTFlGE1X1B', '2023-05-08 12:03:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `blur_image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `is_email_verify` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email_verify_at` datetime DEFAULT NULL,
  `is_mobile_verify` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile_verify_at` datetime DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile_otp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_otp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_customer_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_connect_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_login` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_group_id`, `user_type`, `name`, `first_name`, `last_name`, `username`, `slug`, `email`, `mobile_no`, `password`, `image_url`, `blur_image`, `status`, `is_email_verify`, `email_verify_at`, `is_mobile_verify`, `mobile_verify_at`, `country`, `city`, `state`, `zipcode`, `address`, `latitude`, `longitude`, `online_status`, `mobile_otp`, `email_otp`, `gateway_customer_id`, `gateway_connect_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `is_login`) VALUES
(1, 1, 'admin', 'RetroCube', NULL, NULL, 'retrocube', 'retrocube', 'admin@retrocube.com', '1-8882051816', '$2y$10$MRJoGfxUtxB/oTESBdbCvOq4/L6HUGKlGKpdXOp0wyWHxstf/irTe', NULL, NULL, '1', '1', '2023-03-22 13:00:21', '1', '2023-03-22 13:00:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '2023-03-22 17:00:21', NULL, NULL, 0),
(2, 3, 'admin', 'Admin', NULL, NULL, 'Admin Rentarbo', 'admin-rentarbo', 'admin@rentarbo.com', '1-8882051810', '$2y$10$MaxqppYz.U58tCz9X.G0pemM4qm/xTDJ/Xf49mS1x6APPo6iVKpTu', NULL, NULL, '1', '1', '2023-03-22 13:00:21', '1', '2023-03-22 13:00:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '2023-03-22 17:00:21', NULL, NULL, 0),
(3, 1, 'user', 'testpm1 testings', 'testpm1', 'testings', 'testpm1-testings', 'testpm1-testings', 'testpm1@yopmail.com', '+17152567760', '$2y$10$7rrrz7pOURh6LVsufvNh3eGNKDP0L5Qg.osiNOf8rosK.JuMFchv.', 'users/XAm0m3Af9iW0bIj57URe5cxMG5dnIG8lPDzjEHyM.jpg', 'LBD9Co$*D$~o.TEK9Eo}TLoy-log', '1', '1', '2023-03-23 04:14:51', '1', '2023-03-23 04:14:56', NULL, NULL, NULL, NULL, NULL, 'null', 'null', '1', NULL, NULL, 'cus_NZpCvTKGxZMRcG', 'acct_1MofY52RXqlQ5hF8', NULL, '2023-03-23 08:14:51', '2023-03-23 08:36:58', NULL, 0),
(4, 1, 'user', 'testpm2 testing', 'testpm2', 'testing', 'testpm2-testing', 'testpm2-testing', 'testpm2@yopmail.com', '+15746215096', '$2y$10$7bm2ySMAzv6FNxRj3joB/.pHxXLhlyySsGSTX7ZYq20Mg3E7L5QA2', 'users/zuYn4rJfU7X8tDf9rpU5GFyFBpNsfyrnQtd39kYV.jpg', 'LEGS4JDi~qxb^,aeD*?b55InM{IU', '1', '1', '2023-03-23 04:17:26', '1', '2023-03-23 04:17:33', NULL, NULL, NULL, NULL, NULL, 'null', 'null', '1', NULL, NULL, 'cus_NZpFq7CWhL7jjJ', 'acct_1MofaaClHPB5oqV0', NULL, '2023-03-23 08:17:26', '2023-03-23 10:44:21', NULL, 0),
(5, 2, 'user', 'Azneem Bilwani', 'Azneem', 'Bilwani', 'azneem-bilwani', 'azneem-bilwani', 'admin@reckonmediallc.com', '+1-2021234213', '$2y$10$0JcLxryERzHyeFY2.TVLiuiyNvKc4.HED/L7akXWAeJ6rf7eA9jQi', NULL, NULL, '1', '1', NULL, '1', '2023-03-24 06:40:07', NULL, NULL, NULL, NULL, NULL, '0.0', '0.0', '1', NULL, NULL, 'cus_NaElD7QFPHD98P', 'acct_1Mp4I0ClccgpfK2x', NULL, '2023-03-24 10:39:54', '2023-05-05 17:45:17', NULL, 0),
(6, 2, 'user', 'Tester 002', 'Tester', '002', 'tester-002', 'tester-002', 'tester2019002@gmail.com', '+1-20271777173', '$2y$10$pYktEkXExaqiNFf0XWIKQ.GW1Xlr2a4goW0E2.OsdRdnzxNxlnJ..', 'users/1683294368645508a0eff44.jpg', 'LuIj3QWXXoo#}jWBsks.%Lj[rpjY', '1', '1', NULL, '1', '2023-03-24 06:42:38', NULL, NULL, NULL, NULL, NULL, '0.0', '0.0', '1', NULL, NULL, 'cus_NaEo9qMgBI0gZD', 'acct_1Mp4KRChFQeLI7ro', NULL, '2023-03-24 10:42:25', '2023-05-05 17:46:09', NULL, 0),
(7, 1, 'user', 'user1 Three', 'user1', 'Three', 'user1-user1', 'user1-user1', 'User1@yopmail.com', '+1-8004444895', '$2y$10$Ph65BLn0/qLWXdn378icn.DLkqGkMZJTSstsbX7ovI6GicP0RuKwe', 'users/PhPlew04FJ6o4t7Kb9eSNU53HN6O0K2XIE8TSGwO.jpg', 'LJB4~{n4EMs.GwV@IUX801o}={WX', '1', '1', '2023-03-24 09:06:39', '1', '2023-03-24 09:06:45', NULL, NULL, NULL, NULL, NULL, 'null', 'null', '1', NULL, NULL, 'cus_NaH8qs29wnc4dh', 'acct_1Mp6a2CXmDdM2L3n', NULL, '2023-03-24 13:06:39', '2023-05-08 13:03:15', NULL, 0),
(8, 1, 'user', 'user2 user2', 'user2', 'user2', 'user2-user2', 'user2-user2', 'user2@yopmail.com', '+1-8004447819', '$2y$10$Ll9iVU.2wFfaLMP33kJZAeHyxjnkCLEgzugfTUhm880UIa.KOiSty', 'users/vHxJzZPUwhvFrLd88L8zp8yaTAin0LorT0grrvAW.jpg', 'L6H-iL00%OzU00UG0f?FK$P:00~p', '1', '1', '2023-03-24 09:16:37', '1', '2023-03-24 09:16:41', NULL, NULL, NULL, NULL, NULL, 'null', 'null', '1', NULL, NULL, 'cus_NaHIK4sZK5CXr0', 'acct_1Mp6jfEL4jI01Gtp', NULL, '2023-03-24 13:16:37', '2023-05-01 15:04:26', NULL, 0),
(9, 2, 'user', 'Therry Henry', 'Therry', 'Henry', 'therry-henry', 'therry-henry', 'therryhenry5959@gmail.com', '+1-8004445836', '$2y$10$eLTWDc1vLywo1XjByds99OLon3Nf9vHk/2pjewOUsWqxZgM/AaRCS', 'users/167990364464214b9c42a77.jpg', 'L58FuJoy00X4%fj[M{ay00ay~qof', '1', '1', NULL, '1', '2023-03-27 07:55:27', NULL, NULL, NULL, NULL, NULL, '0.0', '0.0', '1', NULL, NULL, 'cus_NbNdyq05FZ2YDG', 'acct_1MqAsQCcFim7vDiw', NULL, '2023-03-27 11:54:04', '2023-03-27 11:55:27', NULL, 0),
(10, 2, 'user', 'Retro Cube', 'Retro', 'Cube', 'retro-cube', 'retro-cube', 'developer@retrocube.com', '+1-8004444719', '$2y$10$Tyr/iSpwiQHAbj1epuamyuuPpLEjcrp8TljWuIuTD6KGKe7/Lwp7S', 'users/8FNjQfIACv1UXjUUjXNzqmPK7F27KchAJZ93Plls.jpg', 'L.MaO-Rkxuof-;fkR*WC~qj]RjfQ', '1', '1', NULL, '1', '2023-03-27 08:32:02', NULL, NULL, NULL, NULL, NULL, '0.0', '0.0', '1', NULL, NULL, 'cus_NbOFJwrCki0mnb', 'acct_1MqBSsE86rgkZIIe', NULL, '2023-03-27 12:31:44', '2023-05-08 12:31:15', NULL, 0),
(11, 1, 'user', 'rentarbo one', 'rentarbo', 'one', 'rentarbo-one', 'rentarbo-one', 'rentarbo_one@yopmail.com', '+1-2021242512', '$2y$10$CEvjyruv5wgQtu/X1ZAN6eQ67mI2x6eag.piCMXfCCRenU99DEug.', NULL, NULL, '1', '1', '2023-03-28 05:03:59', '1', '2023-03-28 05:04:05', NULL, NULL, NULL, NULL, NULL, 'null', 'null', '1', NULL, NULL, 'cus_Nbi7IYDVsKk6qt', 'acct_1MqUhNCW6pAAI50g', NULL, '2023-03-28 09:03:59', '2023-03-28 09:04:05', NULL, 0),
(12, 1, 'user', 'rentarbo two', 'rentarbo', 'two', 'rentarbo-two', 'rentarbo-two', 'rentarbo_two@yopmail.com', '+1-2021252153', '$2y$10$pXs03BZlMjyi3R/N6E5T5O.AmOqstpZQHBIM1lbcjcgW/HDx5MdA2', NULL, NULL, '1', '1', '2023-03-28 05:21:55', '1', '2023-03-28 05:22:02', NULL, NULL, NULL, NULL, NULL, 'null', 'null', '1', NULL, NULL, 'cus_NbiPU1lhtt0v2d', 'acct_1MqUyjCY04MOLiIv', NULL, '2023-03-28 09:21:55', '2023-03-28 09:22:02', NULL, 0),
(13, 2, 'user', 'Jack Turner', 'Jack', 'Turner', 'jack-turner', 'jack-turner', 'tester2019001@gmail.com', '+1-8004444789000', '$2y$10$XKdb6l0ZSDpZGM9cCX5IQ.Xumb9KnOBtFdBG97hh2KVhcmxNHYp/6', 'users/16835346246458b320bed61.jpg', 'LSMk%~F~G^vy-NtRJ:WALgMxvLT1', '1', '1', NULL, '1', '2023-05-08 08:30:40', NULL, NULL, NULL, NULL, NULL, '0.0', '0.0', '1', NULL, NULL, 'cus_Nr7iBEytfqzb5B', 'acct_1N5PScEKN1PvdwdP', NULL, '2023-05-08 12:30:24', '2023-05-08 12:30:40', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_api_token`
--

CREATE TABLE `user_api_token` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `api_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `udid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci,
  `platform_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `platform_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_api_token`
--

INSERT INTO `user_api_token` (`id`, `user_id`, `api_token`, `refresh_token`, `udid`, `device_type`, `device_token`, `platform_type`, `platform_id`, `ip_address`, `user_agent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 8, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODMwMjU2MDksImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODMwMjU2MDksImV4cCI6MTY4Mzg4OTYwOSwidXNlciI6eyJ1c2VyX2lkIjo4LCJpcF9hZGRyZXNzIjoiMTI0LjI5LjIzOC4xMzEiLCJ1ZGlkIjoiNVF1QVcyL1pzcHFubTRHNHlGYUFONjBFWlUvVWRQNTMxWFdwcm0zWk16eGRVQWE3ckpnNDF5eDZDbSs0LzRBSCIsImRhdGV0aW1lIjoiMjAyMy0wMy0yNFQwOToxNjozNy4wMDAwMDBaIn19.cyokl5I8GfDpngAq_F5Y8TkUOIaHbsTw9yNa2KXdhMo', '1578f96096dfce33fa5a8c2d8a3bba1d71fd045fb9f5b3b199bef82a0b88d075', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'ios', 'cfmhLTflWUT2ioeJD0Y-dD:APA91bFMP59L240ShC9ZDLm9VnnpzgPIwuKYi56s6UXy6x7KzIBESWMTFEcim4bQ3Ck0IhjwCk-UbIEMa-jCuWNc0vPykx-EgBrvivTVytIoaYV7tOy1Z60wdzI5j7VHOY4imxzl5XPs', 'custom', NULL, '124.29.238.131', 'Dart/2.19 (dart:io)', '2023-05-02 15:06:49', '2023-05-02 15:06:49', NULL),
(4, 7, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODMwMjU2MzEsImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODMwMjU2MzEsImV4cCI6MTY4Mzg4OTYzMSwidXNlciI6eyJ1c2VyX2lkIjo3LCJpcF9hZGRyZXNzIjoiMTI0LjI5LjIzOC4xMzEiLCJ1ZGlkIjoiNVF1QVcyL1pzcHFubTRHNHlGYUFONjBFWlUvVWRQNTMxWFdwcm0zWk16eGRVQWE3ckpnNDF5eDZDbSs0LzRBSCIsImRhdGV0aW1lIjoiMjAyMy0wMy0yNFQwOTowNjozOS4wMDAwMDBaIn19.eOB4sn-0a-RYmiicVp1u43Z_2_xGteDSCwNmNqr_Yw0', '51a610a54c973f1c8cb2b7c203d95ba8be7ce8a039a5ccfc76c05841e32da2df', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'android', 'c1yk6yC0SJW5UCp9SOX955:APA91bESI6qKe_duo8diTnNB_k_5gUfAKzB5aK3UZu7KTyCaAoBaoPGLc9CHaaIHtP0N5N0BCncYvzKHtUpqaLvBvUiYJ9prjsfg5NKEAqox8iXZRj9B0eb3d_aQW-EzjtExvKBUXJFQ', 'custom', NULL, '124.29.238.131', 'Dart/2.19 (dart:io)', '2023-05-02 15:07:11', '2023-05-02 15:07:11', NULL),
(5, 7, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODMwMzkxOTksImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODMwMzkxOTksImV4cCI6MTY4MzkwMzE5OSwidXNlciI6eyJ1c2VyX2lkIjo3LCJpcF9hZGRyZXNzIjoiMTI0LjI5LjIzOC4xMzEiLCJ1ZGlkIjoiNVF1QVcyL1pzcHFubTRHNHlGYUFONjBFWlUvVWRQNTMxWFdwcm0zWk16eGRVQWE3ckpnNDF5eDZDbSs0LzRBSCIsImRhdGV0aW1lIjoiMjAyMy0wMy0yNFQwOTowNjozOS4wMDAwMDBaIn19.tNy2mu1zaf5TuTc0rRDwY9eMbhV3PIfgAaGzvGWbSxg', 'c79a16515524054bc1010f58342aa6b63b601b8b2c4c7ed367adcc305091a5e3', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'ios', 'e9bTJXt-W0Sogpcp8sMvWe:APA91bHh3C4ZiEiYJMPsLihZZfulZBVlKLSEAkPUnTCSWQjWN2h9AqMUBzvm30Tjl_93gD_fII8mfO4HK8sHbjQxQBNdWSgzDqgRIAmQ_koyVQnhLIr3hcerlH7cTQ8LTnpHcEgkrWsC', 'custom', NULL, '124.29.238.131', 'Dart/2.19 (dart:io)', '2023-05-02 18:53:19', '2023-05-02 18:53:19', NULL),
(6, 8, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODMwMzkyMjgsImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODMwMzkyMjgsImV4cCI6MTY4MzkwMzIyOCwidXNlciI6eyJ1c2VyX2lkIjo4LCJpcF9hZGRyZXNzIjoiMTI0LjI5LjIzOC4xMzEiLCJ1ZGlkIjoiNVF1QVcyL1pzcHFubTRHNHlGYUFONjBFWlUvVWRQNTMxWFdwcm0zWk16eGRVQWE3ckpnNDF5eDZDbSs0LzRBSCIsImRhdGV0aW1lIjoiMjAyMy0wMy0yNFQwOToxNjozNy4wMDAwMDBaIn19.6Gmq9tv16Lnmf03p_UayMUlQW-ZW9CgOr5nzpm4m1dA', '21df69b8256f555ff205dfcc348ae548d4811f97f06f8279a7daf833dc99e6e9', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'android', 'epMKB1SiSYCyAi0GnV-5I4:APA91bGmJRA_cY5CUCI4d5CZ9CNnZYnhc-BmIqtUWqmawgZQ06tl4kyI_cqbWFyqhsrTOcFHqMtWK1SCGKooxubYI0qZTLLdrbrKqZk2FytoYqIpZQ6efllJ5emwVF66dolBzM0EKauG', 'custom', NULL, '124.29.238.131', 'Dart/2.19 (dart:io)', '2023-05-02 18:53:48', '2023-05-02 18:53:48', NULL),
(8, 7, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODMxOTA4NTUsImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODMxOTA4NTUsImV4cCI6MTY4NDA1NDg1NSwidXNlciI6eyJ1c2VyX2lkIjo3LCJpcF9hZGRyZXNzIjoiMTI0LjI5LjIzOC4xMzEiLCJ1ZGlkIjoiNVF1QVcyL1pzcHFubTRHNHlGYUFONjBFWlUvVWRQNTMxWFdwcm0zWk16eGRVQWE3ckpnNDF5eDZDbSs0LzRBSCIsImRhdGV0aW1lIjoiMjAyMy0wMy0yNFQwOTowNjozOS4wMDAwMDBaIn19.vxSSviQmNmvTWKtOKRZEaK3o6PI0ehz6R0MjTESjCUw', '9bdd54f0fd02b74262909c309dde5484e166716bf99bca4dc51007cf224eee95', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'android', 'can1e5NkS3O-3CSAieJzlX:APA91bHFxaROcgmMdo50UfNYE4w70-TRcl-DeuR5zAwW42fa98d2xNXUeXby9PoZv_E3EW7sM25dagC1UlSzyk2G0CZC7TE4WtQLXAg86oKuSf63jxVabf3nx3gwTXs-rZj9irqqHhh5', 'custom', NULL, '124.29.238.131', 'Dart/2.19 (dart:io)', '2023-05-04 13:00:55', '2023-05-04 13:00:55', NULL),
(9, 8, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODMxOTA5MzMsImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODMxOTA5MzMsImV4cCI6MTY4NDA1NDkzMywidXNlciI6eyJ1c2VyX2lkIjo4LCJpcF9hZGRyZXNzIjoiMTI0LjI5LjIzOC4xMzEiLCJ1ZGlkIjoiNVF1QVcyL1pzcHFubTRHNHlGYUFONjBFWlUvVWRQNTMxWFdwcm0zWk16eGRVQWE3ckpnNDF5eDZDbSs0LzRBSCIsImRhdGV0aW1lIjoiMjAyMy0wMy0yNFQwOToxNjozNy4wMDAwMDBaIn19.LXpnTBt6idcUoWEAyTlpNQOnlbuBgHZAUSlnlCv34nE', 'a245e590bf23ffb669c5f388874c559ccff592ff476020162a2ad9c597714e0c', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'ios', 'ezLEGVg_qElwgsLNRJeUey:APA91bHZImtyXw_MOwwalCH-8o_X6b2z1s0ZgoehnuXbU99ick6kIRN2dvGsYYxTCqtd4tGfV8QMBK6YDP0XeIqd3EBLskkxywqT9GPAP4pBsg8xxAK6U64KnoXz-CJnWpMTk8Ry5jXf', 'custom', NULL, '124.29.238.131', 'Dart/2.19 (dart:io)', '2023-05-04 13:02:13', '2023-05-04 13:02:13', NULL),
(10, 7, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODMyODYxNjgsImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODMyODYxNjgsImV4cCI6MTY4NDE1MDE2OCwidXNlciI6eyJ1c2VyX2lkIjo3LCJpcF9hZGRyZXNzIjoiMTkzLjE5LjEwOS4xMDQiLCJ1ZGlkIjoiNVF1QVcyL1pzcHFubTRHNHlGYUFONjBFWlUvVWRQNTMxWFdwcm0zWk16eGRVQWE3ckpnNDF5eDZDbSs0LzRBSCIsImRhdGV0aW1lIjoiMjAyMy0wMy0yNFQwOTowNjozOS4wMDAwMDBaIn19.tM8y3vJTGFrVFvMW9r7Wf2TyhNUJsQAyov6U9Uu-C2A', 'f9bfdf6c326a14559ece59f38dc3bd4321a1288b4c9fef56147486ed4191ce73', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'android', 'c-YT1xoET_GII3sTMJgozJ:APA91bHplPZjfN2frabrgbgDoyZcpjLQm3NvWEYvagN5rV19YUXq5SyYTdIVAqJOZHP2GrjaVUyou1mezQzdFwlSqpDiloYYxZweyV9IQAKmFcODAS-tgJDu5Um3I8Dn6C5j8c90Y7tS', 'custom', NULL, '193.19.109.104', 'Dart/2.19 (dart:io)', '2023-05-05 15:29:28', '2023-05-05 15:29:28', NULL),
(11, 8, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODMyODcwOTQsImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODMyODcwOTQsImV4cCI6MTY4NDE1MTA5NCwidXNlciI6eyJ1c2VyX2lkIjo4LCJpcF9hZGRyZXNzIjoiMTI0LjI5LjIzOC4xMzEiLCJ1ZGlkIjoiNVF1QVcyL1pzcHFubTRHNHlGYUFONjBFWlUvVWRQNTMxWFdwcm0zWk16eGRVQWE3ckpnNDF5eDZDbSs0LzRBSCIsImRhdGV0aW1lIjoiMjAyMy0wMy0yNFQwOToxNjozNy4wMDAwMDBaIn19.R7lNVCvxA9UGqRHyTJAHjb85kGOCI9FCXt2C9yVtaVY', '21401e3bd342fda2e7004f62e5fc0bfbc83992002bb761af197731ea2a850d5a', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'ios', 'eVZvG-m1ok_2ghl0VMXyiC:APA91bHRqnULLHzwHaNI9AmWCSzYCrKkKNoGXz3-1EHFMEKUt61rYEQTnIsZw2J7IgY9K_HUldUQqXzPgoMQJCTBbaR8qPiPmqqr5OVw3DdRYNT7SnKQoxlig8_cvnpxjzr6sHLl5Cji', 'custom', NULL, '124.29.238.131', 'Dart/2.19 (dart:io)', '2023-05-05 15:44:54', '2023-05-05 15:44:54', NULL),
(12, 7, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODMyODc2MDksImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODMyODc2MDksImV4cCI6MTY4NDE1MTYwOSwidXNlciI6eyJ1c2VyX2lkIjo3LCJpcF9hZGRyZXNzIjoiMTczLjIzOS4yNTQuMzIiLCJ1ZGlkIjoiNVF1QVcyL1pzcHFubTRHNHlGYUFONjBFWlUvVWRQNTMxWFdwcm0zWk16eGRVQWE3ckpnNDF5eDZDbSs0LzRBSCIsImRhdGV0aW1lIjoiMjAyMy0wMy0yNFQwOTowNjozOS4wMDAwMDBaIn19.m8Y0E67UEHU3nYme-jl6dNiyWFyBvVTugPYupFJ6N0U', 'e601380c9e9022503bddf1dc26e4aad33a3bb3519628a6f3ed3cb8fe49ddb086', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'android', 'c-YT1xoET_GII3sTMJgozJ:APA91bF34fW6ZI8ea444mDAeXgLJt6kOjqL8DvpX-t7j95WY4b2ERkN8I9CAGU6Q_fL74TzhZ4JZp3Kt3XqpTDoo9I-aEMOwYuYx79F2VFrUuKIODNVaZzfvcHV60SG8v80l8ef2sSf_', 'custom', NULL, '173.239.254.32', 'Dart/2.19 (dart:io)', '2023-05-05 15:53:29', '2023-05-05 15:53:29', NULL),
(15, 7, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODMyOTE0NDYsImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODMyOTE0NDYsImV4cCI6MTY4NDE1NTQ0NiwidXNlciI6eyJ1c2VyX2lkIjo3LCJpcF9hZGRyZXNzIjoiMTI0LjI5LjIzOC4xMzEiLCJ1ZGlkIjoiNVF1QVcyL1pzcHFubTRHNHlGYUFONjBFWlUvVWRQNTMxWFdwcm0zWk16eGRVQWE3ckpnNDF5eDZDbSs0LzRBSCIsImRhdGV0aW1lIjoiMjAyMy0wMy0yNFQwOTowNjozOS4wMDAwMDBaIn19.j1HimBdS-BopKoqB5U2ZtlXQY3nxMu_wtBMK9NxQHeE', '06b3c3bbf66e53162a48381f0f990c2f378ded81e4c5de66d5d81d233402d8b2', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'android', 'e8qyJ5YqTHK0CMEvm57zIe:APA91bEO81a7Betb6yaddca12mMgX1kmY8B9ZLotcGYgcP_pURndQFUJPq3BPR3F8Zg2e1SjrqDL6apr2xdiDQ5a0qjW2EW9J_8Sm9X37C2OEsUJM9mi2zX1Sm9IwJ6jdwlQveXHTKX2', 'custom', NULL, '124.29.238.131', 'Dart/2.19 (dart:io)', '2023-05-05 16:57:26', '2023-05-05 16:57:26', NULL),
(16, 8, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODMyOTMyMzgsImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODMyOTMyMzgsImV4cCI6MTY4NDE1NzIzOCwidXNlciI6eyJ1c2VyX2lkIjo4LCJpcF9hZGRyZXNzIjoiMTkzLjE5LjEwOS45NyIsInVkaWQiOiI1UXVBVzIvWnNwcW5tNEc0eUZhQU42MEVaVS9VZFA1MzFYV3BybTNaTXp4ZFVBYTdySmc0MXl4NkNtKzQvNEFIIiwiZGF0ZXRpbWUiOiIyMDIzLTAzLTI0VDA5OjE2OjM3LjAwMDAwMFoifX0.4iRUGv4JSlglAzyfNx0_ZuhqIm07uYbggPixXQmheZ8', 'a0e1534a41e23949b4e810034ea68e4a246404aaaa1adafa9a984de523533b20', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'android', 'c-YT1xoET_GII3sTMJgozJ:APA91bFXsMnCeGIKbP-9RNkHf1ok-5Sjv9Fdt1wLRgzdPmHpxJUL9Ya5RnMQ9qggowj308KbA4VlDyI2gLSyD5hCDOzo5KZIYg-tfft_S8p59BEWlHAg1fiQztmubV6MQ1E2KBVKCgj0', 'custom', NULL, '193.19.109.97', 'Dart/2.19 (dart:io)', '2023-05-05 17:27:18', '2023-05-05 17:27:18', NULL),
(20, 6, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODMyOTQzNjksImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODMyOTQzNjksImV4cCI6MTY4NDE1ODM2OSwidXNlciI6eyJ1c2VyX2lkIjo2LCJpcF9hZGRyZXNzIjoiMTI0LjI5LjIzOC4xMzEiLCJ1ZGlkIjoiNVF1QVcyL1pzcHFubTRHNHlGYUFONjBFWlUvVWRQNTMxWFdwcm0zWk16eGRVQWE3ckpnNDF5eDZDbSs0LzRBSCIsImRhdGV0aW1lIjoiMjAyMy0wMy0yNFQwNjo0MjoyNS4wMDAwMDBaIn19.T1N0KlR2TaJKpzZ5r5lCn1oHt5kwUr2g9egMgnKN5Rg', '51370caf331bde553e9329daddad7cae2d4ee745cacd0206676d44bcd1cf48fe', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'ios', 'frtHbd04v0QjlTryEyx3OK:APA91bGX_MZC_6AsJIVGldc3ECPof_XAgLWhG9sW9QQNhvJZjXj1jy-gF55b_u1gmz30d16k6MzO5021JAkdTIoZUXs4KFvOWHKqCgVlmsO0W2cQTt_MCa6Gi3N8nR3V3EcjVLoCn6xk', 'google', 'ojQdT2BAQldi7tgIozTfFDJhKm33', '124.29.238.131', 'Dart/2.19 (dart:io)', '2023-05-05 17:46:09', '2023-05-05 17:46:09', NULL),
(22, 8, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODM1MzMwNzgsImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODM1MzMwNzgsImV4cCI6MTY4NDM5NzA3OCwidXNlciI6eyJ1c2VyX2lkIjo4LCJpcF9hZGRyZXNzIjoiMTkyLjE0MC4xNDUuMjQyIiwidWRpZCI6IjVRdUFXMi9ac3Bxbm00RzR5RmFBTjYwRVpVL1VkUDUzMVhXcHJtM1pNenhkVUFhN3JKZzQxeXg2Q20rNC80QUgiLCJkYXRldGltZSI6IjIwMjMtMDMtMjRUMDk6MTY6MzcuMDAwMDAwWiJ9fQ.YCEVcHWnnxNUsVHMTcUJqNx2zf1MIxFvBULG_uSRBZM', '423974ba9b7dfcafbb53ac5d17c04d35dbfa6ecae87b8687f214003b29fc09d1', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'ios', 'ce3vDkHuFkLYiSR0WfGPmd:APA91bFfXHeLODiBOuWIjWUL18H-MrmopGXDH0n-78FsnsNuqhOSMbxwnrErinNq7IoMlzZQl_G3oEX0mbV7XI5C1xzI9lLC4Jv3ba2VQ7e-Q31Fm_mSbP48iqGjEDDddKoGoifRPMwB', 'custom', NULL, '192.140.145.242', 'Dart/2.19 (dart:io)', '2023-05-08 12:04:38', '2023-05-08 12:04:38', NULL),
(25, 7, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODM1MzYxMzUsImlzcyI6IlcvRyR3fXNtLEclSyFrQFMkemVra21kdmhrbTtDaU1RaiphV3cjdjUiLCJuYmYiOjE2ODM1MzYxMzUsImV4cCI6MTY4NDQwMDEzNSwidXNlciI6eyJ1c2VyX2lkIjo3LCJpcF9hZGRyZXNzIjoiMTkyLjE0MC4xNDUuMjQyIiwidWRpZCI6IjVRdUFXMi9ac3Bxbm00RzR5RmFBTjYwRVpVL1VkUDUzMVhXcHJtM1pNenhkVUFhN3JKZzQxeXg2Q20rNC80QUgiLCJkYXRldGltZSI6IjIwMjMtMDMtMjRUMDk6MDY6MzkuMDAwMDAwWiJ9fQ.WyaiWJeh456Lg-2JVUarM7WWkBChcj8tOolRLZgco_Y', 'e01cdef0c05c17958af5b7c161e3d15819fb5fe06913902009ccb4afba706af4', '5QuAW2/Zspqnm4G4yFaAN60EZU/UdP531XWprm3ZMzxdUAa7rJg41yx6Cm+4/4AH', 'ios', 'cQY-StyRfUpmiTtflETn6L:APA91bGb9DAfcLOLDcQF1yoXJNHv4_rUJ_sQgWwoojqtdn8yQEbKXl0HkZZczU9_YIRjOSrDQ_RxdFT8uCJ8bJ2dOrYKjlotp0lLkf1bbHeNhXIwTM6wgCiKSxtZ6dsRrZs_wIzK-vyA', 'custom', NULL, '192.140.145.242', 'Dart/2.19 (dart:io)', '2023-05-08 12:55:35', '2023-05-08 12:55:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_cards`
--

CREATE TABLE `user_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_4_digit` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_cards`
--

INSERT INTO `user_cards` (`id`, `user_id`, `slug`, `card_id`, `last_4_digit`, `brand`, `is_default`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, '41679545333', 'card_1MoffCCYOXmVqQMpiAM1uVaZ', '4242', 'Visa', '1', '2023-03-23 08:22:13', '2023-03-23 08:22:13', NULL),
(2, 7, '71679649174', 'card_1Mp6g4CYOXmVqQMp1VWoTKDn', '4242', 'Visa', '1', '2023-03-24 13:12:54', '2023-03-24 13:12:54', NULL),
(3, 8, '81679649435', 'card_1Mp6kHCYOXmVqQMpHO1p9buR', '4444', 'MasterCard', '1', '2023-03-24 13:17:15', '2023-03-24 13:17:15', NULL),
(4, 11, '111679979968', 'card_1MqUjSCYOXmVqQMp2u9y1g71', '4242', 'Visa', '1', '2023-03-28 09:06:08', '2023-03-28 09:06:08', NULL),
(5, 12, '121679981341', 'card_1MqV5cCYOXmVqQMpWtguny3X', '4242', 'Visa', '1', '2023-03-28 09:29:01', '2023-03-28 09:29:01', NULL),
(6, 10, '101683534707', 'card_1N5PTxCYOXmVqQMpow93ZxNL', '4242', 'Visa', '1', '2023-05-08 12:31:47', '2023-05-08 12:31:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_connect_accounts`
--

CREATE TABLE `user_connect_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `ssn` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_front` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_back` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','verified','unverified') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `due_fields` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_connect_accounts`
--

INSERT INTO `user_connect_accounts` (`id`, `user_id`, `first_name`, `last_name`, `date_of_birth`, `ssn`, `id_front`, `id_back`, `city`, `state`, `street`, `phone`, `postal_code`, `status`, `due_fields`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'test', 'user', '1994-03-17', '110000000', 'document/0905854488b36e49d3a8c632645ab3c5_id_front.jpg', 'document/0905854488b36e49d3a8c632645ab3c5_id_back.jpg', 'Washington', 'District of Columbia', '1625 14th St NW', '+17152567760', '20009', 'verified', NULL, '2023-03-23 09:04:42', '2023-03-23 09:04:43', NULL),
(2, 7, 'test', 'test', '2006-03-15', '123456789', 'document/f69cfb6f1eaff487328d79ffba2940f7_id_front.jpg', 'document/f69cfb6f1eaff487328d79ffba2940f7_id_back.jpg', 'Mobile', 'Alabama', 'Fillingim EB at Caton St', '+1-8004444895', '36617', 'verified', NULL, '2023-05-02 13:39:24', '2023-05-02 14:37:34', NULL),
(3, 8, 'test', 'test', '1993-03-09', '123456789', 'document/4791af0832af21c2e01cf760d787200d_id_front.jpg', 'document/4791af0832af21c2e01cf760d787200d_id_back.jpg', 'Coffeyville', 'KS', '3773 County Road 2600', '+1-8004447819', '67337', 'verified', NULL, '2023-03-24 13:18:19', '2023-04-02 11:11:15', NULL),
(4, 11, 'test', 'user', '1995-03-09', '110000000', 'document/a084ef16334aaffca116d0acdf1312bb_id_front.jpg', 'document/a084ef16334aaffca116d0acdf1312bb_id_back.jpg', 'Grand Junction', 'CO', '1129 Colorado Ave', '+1-2021242512', '81502', 'verified', NULL, '2023-03-28 09:28:33', '2023-03-28 09:28:34', NULL),
(5, 12, 'test', 'user', '1995-03-08', '110000000', 'document/9278455aba228b1fa941bd9122d9e1c3_id_front.jpg', 'document/9278455aba228b1fa941bd9122d9e1c3_id_back.jpg', 'Unincorporatedo', 'TX', '2472 County Rd 3900', '+1-2021252153', '75938', 'verified', NULL, '2023-03-28 12:16:47', '2023-03-28 12:16:48', NULL),
(6, 10, 'test', 'test', '2003-05-15', '123456789', 'document/59ab533a9f76e97daf27f72b219052e9_id_front.jpg', 'document/59ab533a9f76e97daf27f72b219052e9_id_back.jpg', 'San Antonio', 'TX', 'USAA Blvd', '+1-8004444719', '78240', 'verified', NULL, '2023-05-08 12:33:15', '2023-05-08 12:33:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_external_accounts`
--

CREATE TABLE `user_external_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_external_account_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_holder_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last4_digit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_external_accounts`
--

INSERT INTO `user_external_accounts` (`id`, `user_id`, `gateway_external_account_id`, `account_holder_name`, `last4_digit`, `is_default`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'ba_1Mog8k2RXqlQ5hF8QsRTCUd4', 'testuser', '6789', '1', '2023-03-23 08:52:42', '2023-03-23 08:52:42', NULL),
(2, 7, 'ba_1Mp6cOCXmDdM2L3n2144s1PI', 'test', '6789', '1', '2023-03-24 13:09:05', '2023-03-24 13:09:05', NULL),
(3, 8, 'ba_1Mp6llEL4jI01GtpRoN02nlq', 'test', '6789', '1', '2023-03-24 13:18:46', '2023-03-24 13:18:46', NULL),
(4, 11, 'ba_1MqV3sCW6pAAI50gUi6aexXz', 'testuser', '6789', '1', '2023-03-28 09:27:13', '2023-03-28 09:27:13', NULL),
(5, 12, 'ba_1MqV6ACY04MOLiIvpsTr8I1d', 'test user', '6789', '1', '2023-03-28 09:29:35', '2023-03-28 09:29:35', NULL),
(6, 10, 'ba_1N5PUKE86rgkZIIe6W4cSSxJ', 'test', '6789', '1', '2023-05-08 12:32:09', '2023-05-08 12:32:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `is_super_admin` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `title`, `slug`, `description`, `type`, `is_super_admin`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'super-admin', NULL, 'admin', '1', '1', '2023-03-22 17:00:21', NULL, NULL),
(2, 'App User', 'app-user', NULL, 'user', '0', '1', '2023-03-22 17:00:21', NULL, NULL),
(3, 'Admin', 'admin-user', NULL, 'admin', '0', '1', '2023-03-22 17:00:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_transactions`
--

CREATE TABLE `user_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` int(11) NOT NULL,
  `gateway_transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_charges` decimal(8,2) NOT NULL,
  `admin_tax` decimal(8,2) NOT NULL,
  `net_amount` decimal(8,2) NOT NULL,
  `stripe_fee` decimal(8,2) DEFAULT NULL,
  `gateway` enum('stripe','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `gateway_response` text COLLATE utf8mb4_unicode_ci,
  `is_transfer` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_transactions`
--

INSERT INTO `user_transactions` (`id`, `sender_id`, `receiver_id`, `module`, `module_id`, `gateway_transaction_id`, `total_charges`, `admin_tax`, `net_amount`, `stripe_fee`, `gateway`, `gateway_response`, `is_transfer`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 3, 'booking', 1, 'ch_3MogKeCYOXmVqQMp1KjCkB1y', 50.00, 0.00, 50.00, 0.00, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3MogKeCYOXmVqQMp1KjCkB1y\"},\"gateway_response\":{\"id\":\"ch_3MogKeCYOXmVqQMp1KjCkB1y\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3MogKeCYOXmVqQMp1AuRJWws\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1679547900,\"currency\":\"usd\",\"customer\":\"cus_NZpFq7CWhL7jjJ\",\"description\":\"testing test results and development of the day\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":15,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1MoffCCYOXmVqQMpiAM1uVaZ\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"testpm2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKP2776AGMgb4UBIIzwQ6LBbZCgY14RIqGwabdvVojlf_8mg66B38uv16B0K9Fy8rz3V5F3StqEbgfkqL\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3MogKeCYOXmVqQMp1KjCkB1y\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1MoffCCYOXmVqQMpiAM1uVaZ\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NZpFq7CWhL7jjJ\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-03-23 09:05:02', '2023-03-23 09:05:02', NULL),
(2, 7, 8, 'booking', 2, 'ch_3Mp7lKCYOXmVqQMp1aTRf2FT', 522.00, 0.00, 522.00, 0.00, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3Mp7lKCYOXmVqQMp1aTRf2FT\"},\"gateway_response\":{\"id\":\"ch_3Mp7lKCYOXmVqQMp1aTRf2FT\",\"object\":\"charge\",\"amount\":52200,\"amount_captured\":52200,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3Mp7lKCYOXmVqQMp1glI2OQG\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1679653342,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"ydyf hdyfyf hfycfh hffyfh chhchc hchchc bchch\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":9,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKN_z9aAGMgZH-hfyBHA6LBYDdVPjPvrs2O18GdMmB6KlSiuE8dqp33CA6Nn6sbo0Cfg3h9pZNklFXeqa\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3Mp7lKCYOXmVqQMp1aTRf2FT\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-03-24 14:22:24', '2023-03-24 14:22:24', NULL),
(3, 7, 8, 'booking', 4, 'ch_3Mp7nuCYOXmVqQMp0cqS9S7M', 1044.00, 0.00, 1044.00, 0.00, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3Mp7nuCYOXmVqQMp0cqS9S7M\"},\"gateway_response\":{\"id\":\"ch_3Mp7nuCYOXmVqQMp0cqS9S7M\",\"object\":\"charge\",\"amount\":104400,\"amount_captured\":104400,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3Mp7nuCYOXmVqQMp0eBaLCip\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1679653502,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"wefuhfvfyydyf chgcyf chgcdy chcgfy chgchc\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":25,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKP_09aAGMgaWtwcNBqs6LBaxu0BL9C7sHj96Yu3q-0IAWcNZcyec3L0UKoV8gUWZ5sxBwAlTarCRqToN\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3Mp7nuCYOXmVqQMp0cqS9S7M\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-03-24 14:25:04', '2023-03-24 14:25:04', NULL),
(4, 7, 8, 'booking', 6, 'ch_3Mp8fvCYOXmVqQMp084FiyMv', 522.00, 0.00, 522.00, 0.00, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3Mp8fvCYOXmVqQMp084FiyMv\"},\"gateway_response\":{\"id\":\"ch_3Mp8fvCYOXmVqQMp084FiyMv\",\"object\":\"charge\",\"amount\":52200,\"amount_captured\":52200,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3Mp8fvCYOXmVqQMp0Mn5pzWT\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1679656851,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"gdgdgd dbdbdd bdbd ddvbd ddbdb\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":2,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKJSP9qAGMgbdcivgTdo6LBZtbnaYZNgb3W_3s9CETHQ5qXmGG4n6iDpD_LpgXa_XzJc3IxMw39g-_7ed\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3Mp8fvCYOXmVqQMp084FiyMv\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-03-24 15:20:53', '2023-03-24 15:20:53', NULL),
(5, 7, 8, 'booking', 7, 'ch_3MqAFyCYOXmVqQMp1L7zQwzM', 522.00, 0.00, 522.00, 0.00, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3MqAFyCYOXmVqQMp1L7zQwzM\"},\"gateway_response\":{\"id\":\"ch_3MqAFyCYOXmVqQMp1L7zQwzM\",\"object\":\"charge\",\"amount\":52200,\"amount_captured\":52200,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3MqAFyCYOXmVqQMp18glDW8G\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1679901258,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"hxhcfufuufufuf uffyuff ufuuuf hccjjc fjcj\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":30,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKMuEhaEGMgY7lMscGFQ6LBZnhDYW7bwdT07WB_hYgi9vbIRFA_qzFPHZHo2oZ3csTBbjM3OPEwUYXW6Q\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3MqAFyCYOXmVqQMp1L7zQwzM\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-03-27 11:14:20', '2023-03-27 11:14:20', NULL),
(6, 7, 8, 'booking', 8, 'ch_3MqALFCYOXmVqQMp1alz1Ck7', 1044.00, 0.00, 1044.00, 0.00, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3MqALFCYOXmVqQMp1alz1Ck7\"},\"gateway_response\":{\"id\":\"ch_3MqALFCYOXmVqQMp1alz1Ck7\",\"object\":\"charge\",\"amount\":104400,\"amount_captured\":104400,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3MqALFCYOXmVqQMp1qFQgce5\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1679901585,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"xbbxdd djdjd djdjd Shan\\u2019s djdjd snsjdn\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":35,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKJKHhaEGMgaiWNHmXbg6LBYLRzFXVrWKFLfkyyUZ9Hur6_wMLAsIqhpQQ19b1ZW7nEjS75Mg_xTB91V9\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3MqALFCYOXmVqQMp1alz1Ck7\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-03-27 11:19:46', '2023-03-27 11:19:46', NULL),
(7, 11, 12, 'booking', 9, 'ch_3MqVFUCYOXmVqQMp1ZMACQHL', 50.00, 0.00, 50.00, 0.00, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3MqVFUCYOXmVqQMp1ZMACQHL\"},\"gateway_response\":{\"id\":\"ch_3MqVFUCYOXmVqQMp1ZMACQHL\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3MqVFUCYOXmVqQMp1FhSkoil\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1679981952,\"currency\":\"usd\",\"customer\":\"cus_Nbi7IYDVsKk6qt\",\"description\":\"yesting app test app\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":17,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1MqUjSCYOXmVqQMp2u9y1g71\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"rentarbo_one@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKIH7iaEGMgYGlQ7y2F06LBZIAhnz_V-1d9jY4LBX_kI6uhAmY2NgqBwv8uuW1XFJo3ceYwPbDXaXWp9X\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3MqVFUCYOXmVqQMp1ZMACQHL\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1MqUjSCYOXmVqQMp2u9y1g71\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_Nbi7IYDVsKk6qt\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-03-28 09:39:14', '2023-03-28 09:39:14', NULL),
(8, 11, 12, 'booking', 10, 'ch_3MqVQwCYOXmVqQMp1ctoTIIl', 75.00, 0.00, 75.00, 0.00, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3MqVQwCYOXmVqQMp1ctoTIIl\"},\"gateway_response\":{\"id\":\"ch_3MqVQwCYOXmVqQMp1ctoTIIl\",\"object\":\"charge\",\"amount\":7500,\"amount_captured\":7500,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3MqVQwCYOXmVqQMp1LfDmCtp\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1679982662,\"currency\":\"usd\",\"customer\":\"cus_Nbi7IYDVsKk6qt\",\"description\":\"yesting project djdjjdjd ejdjjds\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":28,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1MqUjSCYOXmVqQMp2u9y1g71\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"rentarbo_one@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKMeAiqEGMgZoqcl7Rsg6LBbLHv1LHanXaxwlmNh4UzEG1n0DffHHK3Qhgms5crcMz2gUV_LrdhZfhgU4\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3MqVQwCYOXmVqQMp1ctoTIIl\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1MqUjSCYOXmVqQMp2u9y1g71\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_Nbi7IYDVsKk6qt\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-03-28 09:51:04', '2023-03-28 09:51:04', NULL),
(9, 11, 12, 'booking', 11, 'ch_3MqVT9CYOXmVqQMp1za4Sy0J', 75.00, 0.00, 75.00, 0.00, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3MqVT9CYOXmVqQMp1za4Sy0J\"},\"gateway_response\":{\"id\":\"ch_3MqVT9CYOXmVqQMp1za4Sy0J\",\"object\":\"charge\",\"amount\":7500,\"amount_captured\":7500,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3MqVT9CYOXmVqQMp1bLZgEcQ\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1679982799,\"currency\":\"usd\",\"customer\":\"cus_Nbi7IYDVsKk6qt\",\"description\":\"hhdjjdjjd sndjndjd sjdjs\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":60,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1MqUjSCYOXmVqQMp2u9y1g71\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"rentarbo_one@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKM-BiqEGMgapWIgBkJ46LBYAO-Q9zuZ9_P-sqGspNNmPv8ZXARhFfbtV_XTQ3F5N5UjTLOBmqCXfhqXl\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3MqVT9CYOXmVqQMp1za4Sy0J\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1MqUjSCYOXmVqQMp2u9y1g71\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_Nbi7IYDVsKk6qt\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-03-28 09:53:21', '2023-03-28 09:53:21', NULL),
(10, 11, 12, 'booking', 12, 'ch_3MqVu5CYOXmVqQMp0v9QXkZx', 25.00, 0.00, 25.00, 0.00, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3MqVu5CYOXmVqQMp0v9QXkZx\"},\"gateway_response\":{\"id\":\"ch_3MqVu5CYOXmVqQMp0v9QXkZx\",\"object\":\"charge\",\"amount\":2500,\"amount_captured\":2500,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3MqVu5CYOXmVqQMp0Z6HBxXp\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1679984469,\"currency\":\"usd\",\"customer\":\"cus_Nbi7IYDVsKk6qt\",\"description\":\"ndjdjjdje dndnnsje ejdjsjs\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":32,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1MqUjSCYOXmVqQMp2u9y1g71\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"rentarbo_one@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKNWOiqEGMgazepRDRPk6LBY3cewO15Yy74H0D_ybew4hppPLWjNOEEErg4bo95ZQ_7b1TEIScFfxqocF\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3MqVu5CYOXmVqQMp0v9QXkZx\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1MqUjSCYOXmVqQMp2u9y1g71\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_Nbi7IYDVsKk6qt\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-03-28 10:21:10', '2023-03-28 10:21:10', NULL),
(11, 11, 12, 'sell', 1, 'ch_3MqXaYCYOXmVqQMp1Id6VVk3', 325.00, 10.00, 305.00, 10.00, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3MqXaYCYOXmVqQMp1Id6VVk3\"},\"gateway_response\":{\"id\":\"ch_3MqXaYCYOXmVqQMp1Id6VVk3\",\"object\":\"charge\",\"amount\":32500,\"amount_captured\":32500,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3MqXaYCYOXmVqQMp1c4Szbso\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1679990946,\"currency\":\"usd\",\"customer\":\"cus_Nbi7IYDVsKk6qt\",\"description\":\"\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":48,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1MqUjSCYOXmVqQMp2u9y1g71\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"rentarbo_one@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKKPBiqEGMga977KYHm46LBZWD33wRctNFnV8NIKswRHp6ianIKG2u3h4wyMdXVdNxL9osau_qwzfLnLv\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3MqXaYCYOXmVqQMp1Id6VVk3\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1MqUjSCYOXmVqQMp2u9y1g71\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_Nbi7IYDVsKk6qt\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-03-28 12:09:08', '2023-03-28 12:09:08', NULL),
(12, 7, 8, 'booking', 13, 'ch_3MrIIDCYOXmVqQMp1t4MldAH', 522.00, 0.00, 522.00, 0.00, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3MrIIDCYOXmVqQMp1t4MldAH\"},\"gateway_response\":{\"id\":\"ch_3MrIIDCYOXmVqQMp1t4MldAH\",\"object\":\"charge\",\"amount\":52200,\"amount_captured\":52200,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3MrIIDCYOXmVqQMp1QBodIo7\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1680170477,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"hhhhxuf dydhdy dyhddyyd dy dyyd dy\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":1,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKO67laEGMgYj8RVLtdA6LBYtAG3TBa2mrGCQVBbZqvd7SBrON3dAd4EHdgVlsYc-krOx0-8L9fOQWq5t\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3MrIIDCYOXmVqQMp1t4MldAH\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-03-30 14:01:19', '2023-03-30 14:01:19', NULL),
(13, 7, 8, 'sell', 2, 'ch_3MrJjBCYOXmVqQMp1uGrBO8O', 33.00, 10.00, 13.00, 10.00, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3MrJjBCYOXmVqQMp1uGrBO8O\"},\"gateway_response\":{\"id\":\"ch_3MrJjBCYOXmVqQMp1uGrBO8O\",\"object\":\"charge\",\"amount\":3300,\"amount_captured\":3300,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3MrJjBCYOXmVqQMp1F8zEsSU\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1680175993,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":16,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKPnmlaEGMgb046pjFC06LBbXLsvCLXLFOUMc_DpkAOnhQrpvrXgW7HJ3QH9vUwFNA_c-sZWLFBolZHwx\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3MrJjBCYOXmVqQMp1uGrBO8O\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-03-30 15:33:14', '2023-03-30 15:33:14', NULL),
(14, 8, 7, 'booking', 14, 'ch_3N1PDoCYOXmVqQMp1g2Z6j7R', 12.00, 1.59, 9.76, 0.65, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N1PDoCYOXmVqQMp1g2Z6j7R\"},\"gateway_response\":{\"id\":\"ch_3N1PDoCYOXmVqQMp1g2Z6j7R\",\"object\":\"charge\",\"amount\":1200,\"amount_captured\":1200,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N1PDoCYOXmVqQMp14l1JwVm\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1682580392,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"aaaa fffff hhhhh hgggg hhhhh ggvgv\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":64,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKKnHqKIGMgaRqWKVLMY6LBZUpjNRgAsO-8n6D6LiH1dM86KDzPmOLBDkgxpAVbPRmbhssTqkZcAEPuip\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N1PDoCYOXmVqQMp1g2Z6j7R\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-04-27 11:26:33', '2023-04-27 11:26:33', NULL),
(15, 8, 7, 'booking', 16, 'ch_3N2ramCYOXmVqQMp13ZaOvpc', 75.00, 10.15, 62.37, 2.48, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N2ramCYOXmVqQMp13ZaOvpc\"},\"gateway_response\":{\"id\":\"ch_3N2ramCYOXmVqQMp13ZaOvpc\",\"object\":\"charge\",\"amount\":7500,\"amount_captured\":7500,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N2ramCYOXmVqQMp1nTKVx6q\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1682927776,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"hcchc fufj duf nchuf yfjv cjfvhv cyyc\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":46,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKKDhvaIGMgZrJRKxPtw6LBYdK_IcLKKasL2GYAqs-hJv1uCDtqVP4Cf6FMRTl4TZ0VHu16uT41xcrCFb\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N2ramCYOXmVqQMp13ZaOvpc\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-01 11:56:17', '2023-05-01 11:56:17', NULL),
(16, 7, 8, 'booking', 17, 'ch_3N2uoiCYOXmVqQMp1eWRI5la', 60.00, 8.11, 49.85, 2.04, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N2uoiCYOXmVqQMp1eWRI5la\"},\"gateway_response\":{\"id\":\"ch_3N2uoiCYOXmVqQMp1eWRI5la\",\"object\":\"charge\",\"amount\":6000,\"amount_captured\":6000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N2uoiCYOXmVqQMp1jGmO6IO\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1682940172,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"Testing Testing Testing\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":30,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKI3CvqIGMgZqlg8YHKU6LBagptstbIh_GwMJldVP-hvFzZWD0LqDThYuHF9uEyF_KUC5gDazRxrJvkwx\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N2uoiCYOXmVqQMp1eWRI5la\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-01 15:22:54', '2023-05-01 15:22:54', NULL);
INSERT INTO `user_transactions` (`id`, `sender_id`, `receiver_id`, `module`, `module_id`, `gateway_transaction_id`, `total_charges`, `admin_tax`, `net_amount`, `stripe_fee`, `gateway`, `gateway_response`, `is_transfer`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 7, 8, 'booking', 18, 'ch_3N3DTfCYOXmVqQMp1xnfFkRI', 120.00, 16.27, 99.95, 3.78, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3DTfCYOXmVqQMp1xnfFkRI\"},\"gateway_response\":{\"id\":\"ch_3N3DTfCYOXmVqQMp1xnfFkRI\",\"object\":\"charge\",\"amount\":12000,\"amount_captured\":12000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3DTfCYOXmVqQMp1svtR0q1\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683011903,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"jcjcjfcjjc. ifgvkvvkfg m hjcc\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":23,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKL_ywqIGMgZX10sxqDI6LBbLwlM5izGRGEbmehw_WFr7G1Aq056XJFEM9eqbztVvrP8PCjaEkuGatPPg\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3DTfCYOXmVqQMp1xnfFkRI\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 11:18:24', '2023-05-02 11:18:24', NULL),
(18, 7, 8, 'booking', 18, 'ch_3N3E3FCYOXmVqQMp1oQ97pum', 120.00, 16.27, 99.95, 3.78, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3E3FCYOXmVqQMp1oQ97pum\"},\"gateway_response\":{\"id\":\"ch_3N3E3FCYOXmVqQMp1oQ97pum\",\"object\":\"charge\",\"amount\":12000,\"amount_captured\":12000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3E3FCYOXmVqQMp1w3HbmcV\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683014109,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"jcjcjfcjjc. ifgvkvvkfg m hjcc\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":57,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKN6Dw6IGMgaXxg8zFv46LBakMxOafx7H3GbiU7zrfIQ-PDuDoUz2DZ0gpJuGZs3GIJgafVhVZtePb7mN\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3E3FCYOXmVqQMp1oQ97pum\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 11:55:11', '2023-05-02 11:55:11', NULL),
(19, 7, 8, 'booking', 18, 'ch_3N3E41CYOXmVqQMp14HYRbXg', 120.00, 16.27, 99.95, 3.78, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3E41CYOXmVqQMp14HYRbXg\"},\"gateway_response\":{\"id\":\"ch_3N3E41CYOXmVqQMp14HYRbXg\",\"object\":\"charge\",\"amount\":12000,\"amount_captured\":12000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3E41CYOXmVqQMp1QIaCazM\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683014157,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"jcjcjfcjjc. ifgvkvvkfg m hjcc\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":35,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKI6Ew6IGMgbw5YlnZqc6LBblInoHlDR8tDsVZXACZ3t-z9xlMwjwYP8MnpNMz70MGxZ9rGem7xeGz7s-\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3E41CYOXmVqQMp14HYRbXg\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 11:55:59', '2023-05-02 11:55:59', NULL),
(20, 7, 8, 'booking', 18, 'ch_3N3E4lCYOXmVqQMp0qR6vQjp', 120.00, 16.27, 99.95, 3.78, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3E4lCYOXmVqQMp0qR6vQjp\"},\"gateway_response\":{\"id\":\"ch_3N3E4lCYOXmVqQMp0qR6vQjp\",\"object\":\"charge\",\"amount\":12000,\"amount_captured\":12000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3E4lCYOXmVqQMp0nCP5zfs\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683014203,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"jcjcjfcjjc. ifgvkvvkfg m hjcc\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":6,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKLyEw6IGMgY7es9NSH86LBbpiYfNpDgPoynEzxbvyaZf_P9RW0EVm9WtmO7XgCTc2LEdvc_j5b69SJvw\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3E4lCYOXmVqQMp0qR6vQjp\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 11:56:45', '2023-05-02 11:56:45', NULL),
(21, 7, 8, 'booking', 18, 'ch_3N3E7MCYOXmVqQMp0k7Xvd1J', 120.00, 16.27, 99.95, 3.78, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3E7MCYOXmVqQMp0k7Xvd1J\"},\"gateway_response\":{\"id\":\"ch_3N3E7MCYOXmVqQMp0k7Xvd1J\",\"object\":\"charge\",\"amount\":12000,\"amount_captured\":12000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3E7MCYOXmVqQMp0Sbivsze\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683014364,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"jcjcjfcjjc. ifgvkvvkfg m hjcc\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":6,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKN2Fw6IGMgYJiAdQuKA6LBbzyjnGihTXTpYGhWeJN-4B-GnweTy450IE1nCAiq1T6G70JFVcM-Xs5-7Q\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3E7MCYOXmVqQMp0k7Xvd1J\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 11:59:26', '2023-05-02 11:59:26', NULL),
(22, 7, 8, 'booking', 18, 'ch_3N3EAZCYOXmVqQMp1KcR0LuU', 120.00, 16.27, 99.95, 3.78, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3EAZCYOXmVqQMp1KcR0LuU\"},\"gateway_response\":{\"id\":\"ch_3N3EAZCYOXmVqQMp1KcR0LuU\",\"object\":\"charge\",\"amount\":12000,\"amount_captured\":12000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3EAZCYOXmVqQMp124S2s1Z\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683014563,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"jcjcjfcjjc. ifgvkvvkfg m hjcc\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":23,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKKSHw6IGMgamknSYRBc6LBbwJlNB5bhONAE9pjg2sVEmJBrRe_m0dHGJaL1USrwIkeVTJHkaQMW_ctDF\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3EAZCYOXmVqQMp1KcR0LuU\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 12:02:45', '2023-05-02 12:02:45', NULL),
(23, 8, 7, 'booking', 19, 'ch_3N3FgMCYOXmVqQMp0mFqoJLZ', 25.00, 3.36, 20.62, 1.03, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3FgMCYOXmVqQMp0mFqoJLZ\"},\"gateway_response\":{\"id\":\"ch_3N3FgMCYOXmVqQMp0mFqoJLZ\",\"object\":\"charge\",\"amount\":2500,\"amount_captured\":2500,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3FgMCYOXmVqQMp0htMg4Gh\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683020378,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"fhhfgg vvggg vvggh bhghhhh vbbggg bbbhh\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":2,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKNq0w6IGMgZ7Cjj7eD86LBaeRRG3XPKpIX1hb-Pmlq-jQloQXQS-57CoO79FNrFGmlmEb--4qlHfyG_u\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3FgMCYOXmVqQMp0mFqoJLZ\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 13:39:39', '2023-05-02 13:39:39', NULL),
(24, 8, 7, 'booking', 20, 'ch_3N3GYTCYOXmVqQMp03ahjkrJ', 50.00, 6.76, 41.50, 1.75, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3GYTCYOXmVqQMp03ahjkrJ\"},\"gateway_response\":{\"id\":\"ch_3N3GYTCYOXmVqQMp03ahjkrJ\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3GYTCYOXmVqQMp0A8dvmtR\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683023733,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"ncjcjfigig jcifigig ncjcjf kvkvig jcjf jcif\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":4,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKPbOw6IGMgZJNaMRU806LBahajR4aiDZSMIciQb73ENn1n4QG6PNNgi2Jen_76I9GbOIUy1XIBcVYsO4\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3GYTCYOXmVqQMp03ahjkrJ\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 14:35:35', '2023-05-02 14:35:35', NULL),
(25, 8, 7, 'booking', 21, 'ch_3N3GdXCYOXmVqQMp1Ejx9z6j', 75.00, 10.15, 62.37, 2.48, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3GdXCYOXmVqQMp1Ejx9z6j\"},\"gateway_response\":{\"id\":\"ch_3N3GdXCYOXmVqQMp1Ejx9z6j\",\"object\":\"charge\",\"amount\":7500,\"amount_captured\":7500,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3GdXCYOXmVqQMp1WdnwGgP\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683024047,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"ncjcjf ncjcjf ncjcjf kgkgkg ncjcjf jfjfif jcjf jfjf\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":11,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKLDRw6IGMgZKJBdfe_w6LBZqvkEjI2UK0XX9BAlOckhimzNE5sV4Gn0XYg8-AuwlH4NClgpEMV3YXCB5\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3GdXCYOXmVqQMp1Ejx9z6j\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 14:40:49', '2023-05-02 14:40:49', NULL),
(26, 8, 7, 'booking', 22, 'ch_3N3GlwCYOXmVqQMp0qz2LaZz', 50.00, 6.76, 41.50, 1.75, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3GlwCYOXmVqQMp0qz2LaZz\"},\"gateway_response\":{\"id\":\"ch_3N3GlwCYOXmVqQMp0qz2LaZz\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3GlwCYOXmVqQMp0gBCvmE5\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683024568,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"bxjdjfjfjf ncjcjf ncjckf\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":25,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKLnVw6IGMgavRF7SQjQ6LBaNA5fP9u5nBMK4rRxA08VErLkrh3e2rsfaDowpmIDvVIuwvbYp4pR3FUKf\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3GlwCYOXmVqQMp0qz2LaZz\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 14:49:30', '2023-05-02 14:49:30', NULL),
(27, 8, 7, 'booking', 23, 'ch_3N3GozCYOXmVqQMp0hw7thdB', 50.00, 6.76, 41.50, 1.75, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3GozCYOXmVqQMp0hw7thdB\"},\"gateway_response\":{\"id\":\"ch_3N3GozCYOXmVqQMp0hw7thdB\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3GozCYOXmVqQMp0UothrAH\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683024757,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"hdhdhd ncjcjf ncjcjf jcjf jcjf jfjf\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":38,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKPbWw6IGMgYLWS1iXYc6LBaflUifoThzLipDA8nPaJehg-XlNazEfZ7VqExuC4Xxu--DLqnm2ZR1rysn\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3GozCYOXmVqQMp0hw7thdB\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 14:52:39', '2023-05-02 14:52:39', NULL),
(28, 8, 7, 'booking', 24, 'ch_3N3Ha9CYOXmVqQMp0UcPsqju', 25.00, 3.36, 20.62, 1.03, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3Ha9CYOXmVqQMp0UcPsqju\"},\"gateway_response\":{\"id\":\"ch_3N3Ha9CYOXmVqQMp0UcPsqju\",\"object\":\"charge\",\"amount\":2500,\"amount_captured\":2500,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3Ha9CYOXmVqQMp0ZtdsFJF\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683027681,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"test test test test test test test\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":45,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKOHtw6IGMgYaKStu-ek6LBZ70iBOKWsNTLVUuZPvAI7njBPq5ZeN9SM8wPGN3bMErc5o1VWYt0evEVJ_\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3Ha9CYOXmVqQMp0UcPsqju\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 15:41:23', '2023-05-02 15:41:23', NULL),
(29, 8, 7, 'booking', 25, 'ch_3N3HdfCYOXmVqQMp0wGjKOZz', 25.00, 3.36, 20.62, 1.03, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3HdfCYOXmVqQMp0wGjKOZz\"},\"gateway_response\":{\"id\":\"ch_3N3HdfCYOXmVqQMp0wGjKOZz\",\"object\":\"charge\",\"amount\":2500,\"amount_captured\":2500,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3HdfCYOXmVqQMp0ytxGkIL\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683027899,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"ncjcjf n jcjf k jcjf kvkcif\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":62,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKLvvw6IGMgZObJAZ-4Q6LBYedKmq7bq9dqtIAfc0xCDAcnB7N_5Vfj8JM-6WqJqXG_9Ev9m__2d625G7\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3HdfCYOXmVqQMp0wGjKOZz\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 15:45:00', '2023-05-02 15:45:00', NULL),
(30, 8, 7, 'booking', 26, 'ch_3N3HfzCYOXmVqQMp16HloXkh', 50.00, 6.76, 41.50, 1.75, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3HfzCYOXmVqQMp16HloXkh\"},\"gateway_response\":{\"id\":\"ch_3N3HfzCYOXmVqQMp16HloXkh\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3HfzCYOXmVqQMp1ikVvo9o\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683028043,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"jfjfif if ivificig kvkvig kvkvig kvkv\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":42,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKMzww6IGMgYjiQvuois6LBbzLAUUDBsx5DCesr6lcnhePHXv3c372vaymKRwpEcn1ktCTOLo-itYErOt\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3HfzCYOXmVqQMp16HloXkh\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 15:47:25', '2023-05-02 15:47:25', NULL),
(31, 8, 7, 'booking', 27, 'ch_3N3Ih9CYOXmVqQMp1H93LxOV', 25.00, 3.36, 20.62, 1.03, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3Ih9CYOXmVqQMp1H93LxOV\"},\"gateway_response\":{\"id\":\"ch_3N3Ih9CYOXmVqQMp1H93LxOV\",\"object\":\"charge\",\"amount\":2500,\"amount_captured\":2500,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3Ih9CYOXmVqQMp1gm8pwU3\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683031959,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"gucjfigig kckvkgkg kvkvig kvkvig kvkv\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":48,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKJiPxKIGMgZeJTNvAeM6LBb-Vp_RtyWv5sn_STfkM6eS4McPEhpBEGAAlCZognlxm0kKWcqweIycUja1\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3Ih9CYOXmVqQMp1H93LxOV\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 16:52:41', '2023-05-02 16:52:41', NULL);
INSERT INTO `user_transactions` (`id`, `sender_id`, `receiver_id`, `module`, `module_id`, `gateway_transaction_id`, `total_charges`, `admin_tax`, `net_amount`, `stripe_fee`, `gateway`, `gateway_response`, `is_transfer`, `created_at`, `updated_at`, `deleted_at`) VALUES
(32, 8, 7, 'booking', 28, 'ch_3N3KbTCYOXmVqQMp0SChgYLu', 50.00, 6.76, 41.50, 1.75, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3KbTCYOXmVqQMp0SChgYLu\"},\"gateway_response\":{\"id\":\"ch_3N3KbTCYOXmVqQMp0SChgYLu\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3KbTCYOXmVqQMp0ZL1L991\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683039295,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"hdhdhdd dbdjd dbdjd dbdjs sbsjs ssn\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":32,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKL_IxKIGMgZfwG7nn3I6LBa4lcShmkLD73GGLNhaiQncGvtt1CeQgGPZP6-G0Z5-USOzz_Nq-fiWpbj1\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3KbTCYOXmVqQMp0SChgYLu\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 18:54:57', '2023-05-02 18:54:57', NULL),
(33, 8, 7, 'booking', 29, 'ch_3N3Ki1CYOXmVqQMp07ejsEdP', 50.00, 6.76, 41.50, 1.75, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N3Ki1CYOXmVqQMp07ejsEdP\"},\"gateway_response\":{\"id\":\"ch_3N3Ki1CYOXmVqQMp07ejsEdP\",\"object\":\"charge\",\"amount\":5000,\"amount_captured\":5000,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N3Ki1CYOXmVqQMp06eYOfmq\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683039701,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"iggigi uguggu fufuuf cuyffu fuuff\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":57,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKNbLxKIGMgaCU9-DX4A6LBYd0AMQQwEpqr-aZM6umqAL8jW5dkINnI63gc_0a0dsfkGXajV7-85VCQsX\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N3Ki1CYOXmVqQMp07ejsEdP\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-02 19:01:43', '2023-05-02 19:01:43', NULL),
(34, 7, 8, 'booking', 30, 'ch_3N4N6lCYOXmVqQMp0kStH9Yt', 26.00, 3.49, 21.45, 1.05, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N4N6lCYOXmVqQMp0kStH9Yt\"},\"gateway_response\":{\"id\":\"ch_3N4N6lCYOXmVqQMp0kStH9Yt\",\"object\":\"charge\",\"amount\":2600,\"amount_captured\":2600,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N4N6lCYOXmVqQMp03EpSIEt\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683287251,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":5,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKNTZ06IGMgaR_lzg3So6LBYRjtMxgMNDjmW6iLsoOjBCUAE26ml48f6W4xJBKbG4qMR3qQLXdoTe5B7u\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N4N6lCYOXmVqQMp0kStH9Yt\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-05 15:47:33', '2023-05-05 15:47:33', NULL),
(35, 7, 8, 'booking', 31, 'ch_3N4NT6CYOXmVqQMp0xEtB41j', 26.00, 3.49, 21.45, 1.05, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N4NT6CYOXmVqQMp0xEtB41j\"},\"gateway_response\":{\"id\":\"ch_3N4NT6CYOXmVqQMp0xEtB41j\",\"object\":\"charge\",\"amount\":2600,\"amount_captured\":2600,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N4NT6CYOXmVqQMp0YMlxTgZ\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683288636,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.Touch and hold a clip to pin it. Unpinned clips will be deleted after 1 hour.\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":5,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKL3k06IGMgZYxH7MN1M6LBafvsxJRLxy0GA7_KAbXc7Cdq_XTJab85Btw1UHVFe77hZTqiy6i5sSw8IX\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N4NT6CYOXmVqQMp0xEtB41j\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-05 16:10:38', '2023-05-05 16:10:38', NULL),
(36, 7, 8, 'booking', 32, 'ch_3N4NZzCYOXmVqQMp0F1jNxLJ', 26.00, 3.49, 21.45, 1.05, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N4NZzCYOXmVqQMp0F1jNxLJ\"},\"gateway_response\":{\"id\":\"ch_3N4NZzCYOXmVqQMp0F1jNxLJ\",\"object\":\"charge\",\"amount\":2600,\"amount_captured\":2600,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N4NZzCYOXmVqQMp0bxSbfvy\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683289063,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.Use the edit icon to pin, add or delete clips.Touch and hold a clip to pin it. Unpinned clips will be deleted after 1 hour.\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":5,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKOjn06IGMgYrjJi3ZeE6LBa94WeryPNmzyN-AIOvNNEfK9IVZDVZEv--IycH1vQwVIwOsCer6acgxcXX\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N4NZzCYOXmVqQMp0F1jNxLJ\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-05 16:17:45', '2023-05-05 16:17:45', NULL),
(37, 7, 8, 'booking', 33, 'ch_3N4NsVCYOXmVqQMp1gtKHXIg', 13.00, 1.73, 10.60, 0.68, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N4NsVCYOXmVqQMp1gtKHXIg\"},\"gateway_response\":{\"id\":\"ch_3N4NsVCYOXmVqQMp1gtKHXIg\",\"object\":\"charge\",\"amount\":1300,\"amount_captured\":1300,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N4NsVCYOXmVqQMp1MxfsrOa\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683290211,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":2,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKOTw06IGMgYW5UX5aEg6LBY9qXmECVZJmpJYHBILT-U3-6Ckz2wdtjEvP5hRlXt4GlEt4DJaKy3wpKd4\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N4NsVCYOXmVqQMp1gtKHXIg\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-05 16:36:53', '2023-05-05 16:36:53', NULL),
(38, 7, 8, 'booking', 35, 'ch_3N4O3gCYOXmVqQMp16w1IZpn', 26.00, 3.49, 21.45, 1.05, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N4O3gCYOXmVqQMp16w1IZpn\"},\"gateway_response\":{\"id\":\"ch_3N4O3gCYOXmVqQMp16w1IZpn\",\"object\":\"charge\",\"amount\":2600,\"amount_captured\":2600,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N4O3gCYOXmVqQMp1XQk987h\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683290904,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":21,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKJn206IGMgYTKAs1WSU6LBZ3RqWo4gx1TXQ2vANLevLVYqzRr84IuWcdx4zdjp6GUpB66vZWWNXu9wfb\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N4O3gCYOXmVqQMp16w1IZpn\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-05 16:48:26', '2023-05-05 16:48:26', NULL),
(39, 7, 8, 'booking', 36, 'ch_3N4O57CYOXmVqQMp0hZ97zlW', 13.00, 1.73, 10.60, 0.68, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N4O57CYOXmVqQMp0hZ97zlW\"},\"gateway_response\":{\"id\":\"ch_3N4O57CYOXmVqQMp0hZ97zlW\",\"object\":\"charge\",\"amount\":1300,\"amount_captured\":1300,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N4O57CYOXmVqQMp0A2t6AXT\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683290993,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"Welcome to Gboard clipboard, any text you copy will be saved here.\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":64,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKPH206IGMgZpPfT6Itc6LBa83Mu5cRYgxOO9WB2LkxTF7GkpcdRzVdo5MRQgyYLt2my1kz_5RI_WevEM\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N4O57CYOXmVqQMp0hZ97zlW\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-05 16:49:54', '2023-05-05 16:49:54', NULL),
(40, 7, 8, 'booking', 39, 'ch_3N4ONtCYOXmVqQMp1laESrtr', 26.00, 3.49, 21.45, 1.05, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N4ONtCYOXmVqQMp1laESrtr\"},\"gateway_response\":{\"id\":\"ch_3N4ONtCYOXmVqQMp1laESrtr\",\"object\":\"charge\",\"amount\":2600,\"amount_captured\":2600,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N4ONtCYOXmVqQMp11oSAOUy\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683292157,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":31,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKP7_06IGMgZORLjfPWE6LBY8R-uZ-fGE9xIEzypH6Bc3B03r8exe4Zw_Lj7NLqcICmAqrjxqutovX3HM\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N4ONtCYOXmVqQMp1laESrtr\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-05 17:09:19', '2023-05-05 17:09:19', NULL),
(41, 7, 8, 'booking', 40, 'ch_3N4OXKCYOXmVqQMp09CFMq7F', 13.00, 1.73, 10.60, 0.68, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N4OXKCYOXmVqQMp09CFMq7F\"},\"gateway_response\":{\"id\":\"ch_3N4OXKCYOXmVqQMp09CFMq7F\",\"object\":\"charge\",\"amount\":1300,\"amount_captured\":1300,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N4OXKCYOXmVqQMp0BQLBCfc\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683292742,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":25,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKMeE1KIGMgb2ui64JBI6LBavdoUB-HQ4eYbR6ts6TcSJiGAsDOLaKnw8Gzl49jAa8aBOXAdhYUfgwkpM\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N4OXKCYOXmVqQMp09CFMq7F\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-05 17:19:04', '2023-05-05 17:19:04', NULL),
(42, 7, 8, 'booking', 41, 'ch_3N4OZvCYOXmVqQMp1gmUu3BJ', 13.00, 1.73, 10.60, 0.68, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N4OZvCYOXmVqQMp1gmUu3BJ\"},\"gateway_response\":{\"id\":\"ch_3N4OZvCYOXmVqQMp1gmUu3BJ\",\"object\":\"charge\",\"amount\":1300,\"amount_captured\":1300,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N4OZvCYOXmVqQMp10ezKGwW\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683292903,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"55Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":54,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKOiF1KIGMgZV04bpHBM6LBaCfoJRhdwsEG_iMc5rdjfWqGadxOWLX7Ijgn0KaKewgHzl9KGHYWduAL4U\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N4OZvCYOXmVqQMp1gmUu3BJ\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-05 17:21:45', '2023-05-05 17:21:45', NULL),
(43, 7, 8, 'booking', 42, 'ch_3N4OdjCYOXmVqQMp0TeWNZSo', 13.00, 1.73, 10.60, 0.68, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N4OdjCYOXmVqQMp0TeWNZSo\"},\"gateway_response\":{\"id\":\"ch_3N4OdjCYOXmVqQMp0TeWNZSo\",\"object\":\"charge\",\"amount\":1300,\"amount_captured\":1300,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N4OdjCYOXmVqQMp0UZSEXx8\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683293139,\"currency\":\"usd\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"description\":\"Welcome to Gboard clipboard, any text you copy will be saved here.Tap on a clip to paste it in the text box.\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":28,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"User1@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKNSH1KIGMgbFG0udYac6LBaPkcT16qBDcv1EheIEOP-T7i8MI7NBl4vdRDIT3EvAankWe6Woem2ODeEd\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N4OdjCYOXmVqQMp0TeWNZSo\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6g4CYOXmVqQMp1VWoTKDn\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NaH8qs29wnc4dh\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":2,\"exp_year\":2042,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-05 17:25:41', '2023-05-05 17:25:41', NULL),
(44, 8, 7, 'booking', 43, 'ch_3N5P56CYOXmVqQMp0OkcOPLt', 25.00, 3.36, 20.62, 1.03, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N5P56CYOXmVqQMp0OkcOPLt\"},\"gateway_response\":{\"id\":\"ch_3N5P56CYOXmVqQMp0OkcOPLt\",\"object\":\"charge\",\"amount\":2500,\"amount_captured\":2500,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N5P56CYOXmVqQMp0B0GM2jl\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"MasterCard\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683533164,\"currency\":\"usd\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"description\":\"tasty s jfjfjf fhigfigkm hklhlhoh firing nvkkvkvbcxhd\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":9,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"payment_method_details\":{\"card\":{\"brand\":\"mastercard\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":null},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4444\",\"mandate\":null,\"network\":\"mastercard\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"user2@yopmail.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKOza4qIGMgbpG_eNi3c6LBavA3VmfHWxQlyP_u-WlY-Lq0J0-LxSkQG0c0BghDYeXqA9hD0JrFbQdxF1\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N5P56CYOXmVqQMp0OkcOPLt\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1Mp6kHCYOXmVqQMpHO1p9buR\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"MasterCard\",\"country\":\"US\",\"customer\":\"cus_NaHIK4sZK5CXr0\",\"cvc_check\":null,\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2044,\"fingerprint\":\"Tl0NNZa1s2Wfafzp\",\"funding\":\"credit\",\"last4\":\"4444\",\"metadata\":[],\"name\":\"MasterCard\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-08 12:06:06', '2023-05-08 12:06:06', NULL),
(45, 10, 8, 'booking', 44, 'ch_3N5PWtCYOXmVqQMp0nlfS7su', 26.00, 3.49, 21.45, 1.05, 'stripe', '{\"code\":200,\"message\":\"Customer has been charged successfully\",\"data\":{\"transaction_id\":\"ch_3N5PWtCYOXmVqQMp0nlfS7su\"},\"gateway_response\":{\"id\":\"ch_3N5PWtCYOXmVqQMp0nlfS7su\",\"object\":\"charge\",\"amount\":2600,\"amount_captured\":2600,\"amount_refunded\":0,\"application\":null,\"application_fee\":null,\"application_fee_amount\":null,\"balance_transaction\":\"txn_3N5PWtCYOXmVqQMp0wQA3UTZ\",\"billing_details\":{\"address\":{\"city\":null,\"country\":null,\"line1\":null,\"line2\":null,\"postal_code\":null,\"state\":null},\"email\":null,\"name\":\"Visa\",\"phone\":null},\"calculated_statement_descriptor\":\"RETROCUBE\",\"captured\":true,\"created\":1683534887,\"currency\":\"usd\",\"customer\":\"cus_NbOFJwrCki0mnb\",\"description\":\"gijfiffvjg ghhfufyI djcjf cjcj gh jccjjc\",\"destination\":null,\"dispute\":null,\"disputed\":false,\"failure_balance_transaction\":null,\"failure_code\":null,\"failure_message\":null,\"fraud_details\":[],\"invoice\":null,\"livemode\":false,\"metadata\":[],\"on_behalf_of\":null,\"order\":null,\"outcome\":{\"network_status\":\"approved_by_network\",\"reason\":null,\"risk_level\":\"normal\",\"risk_score\":40,\"seller_message\":\"Payment complete.\",\"type\":\"authorized\"},\"paid\":true,\"payment_intent\":null,\"payment_method\":\"card_1N5PTxCYOXmVqQMpow93ZxNL\",\"payment_method_details\":{\"card\":{\"brand\":\"visa\",\"checks\":{\"address_line1_check\":null,\"address_postal_code_check\":null,\"cvc_check\":\"pass\"},\"country\":\"US\",\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"installments\":null,\"last4\":\"4242\",\"mandate\":null,\"network\":\"visa\",\"network_token\":{\"used\":false},\"three_d_secure\":null,\"wallet\":null},\"type\":\"card\"},\"receipt_email\":\"developer@retrocube.com\",\"receipt_number\":null,\"receipt_url\":\"https:\\/\\/pay.stripe.com\\/receipts\\/payment\\/CAcaFwoVYWNjdF8xRWFKS0FDWU9YbVZxUU1wKKjo4qIGMgb3NRliArE6LBaZapahbQsjaRt2xJbd6SBCHSBMCSwE83oaUPMEOCR3ntWbS2o8yns4LV_w\",\"refunded\":false,\"refunds\":{\"object\":\"list\",\"data\":[],\"has_more\":false,\"total_count\":0,\"url\":\"\\/v1\\/charges\\/ch_3N5PWtCYOXmVqQMp0nlfS7su\\/refunds\"},\"review\":null,\"shipping\":null,\"source\":{\"id\":\"card_1N5PTxCYOXmVqQMpow93ZxNL\",\"object\":\"card\",\"address_city\":null,\"address_country\":null,\"address_line1\":null,\"address_line1_check\":null,\"address_line2\":null,\"address_state\":null,\"address_zip\":null,\"address_zip_check\":null,\"brand\":\"Visa\",\"country\":\"US\",\"customer\":\"cus_NbOFJwrCki0mnb\",\"cvc_check\":\"pass\",\"dynamic_last4\":null,\"exp_month\":4,\"exp_year\":2024,\"fingerprint\":\"b7LCjJvxCu5QFH4K\",\"funding\":\"credit\",\"last4\":\"4242\",\"metadata\":[],\"name\":\"Visa\",\"tokenization_method\":null,\"wallet\":null},\"source_transfer\":null,\"statement_descriptor\":null,\"statement_descriptor_suffix\":null,\"status\":\"succeeded\",\"transfer_data\":null,\"transfer_group\":null}}', '0', '2023-05-08 12:34:49', '2023-05-08 12:34:49', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad_banners`
--
ALTER TABLE `ad_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `application_setting`
--
ALTER TABLE `application_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_product_id_foreign` (`product_id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_product_owner_id_foreign` (`product_owner_id`),
  ADD KEY `bookings_slug_product_id_user_id_rentar_name_index` (`slug`,`product_id`,`user_id`,`rentar_name`);

--
-- Indexes for table `booking_statuses`
--
ALTER TABLE `booking_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_statuses_booking_id_foreign` (`booking_id`),
  ADD KEY `booking_statuses_user_id_foreign` (`user_id`),
  ADD KEY `booking_statuses_type_booking_id_index` (`type`,`booking_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_name_slug_index` (`name`,`slug`);

--
-- Indexes for table `category_users`
--
ALTER TABLE `category_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_users_user_id_foreign` (`user_id`),
  ADD KEY `category_users_category_id_user_id_index` (`category_id`,`user_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_messages_user_id_foreign` (`user_id`),
  ADD KEY `chat_messages_chat_room_id_foreign` (`chat_room_id`),
  ADD KEY `chat_messages_message_type_status_index` (`message_type`,`status`);

--
-- Indexes for table `chat_message_status`
--
ALTER TABLE `chat_message_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_message_status_chat_room_id_foreign` (`chat_room_id`),
  ADD KEY `chat_message_status_user_id_chat_room_id_chat_message_id_index` (`user_id`,`chat_room_id`,`chat_message_id`);

--
-- Indexes for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_rooms_slug_unique` (`slug`),
  ADD KEY `chat_rooms_created_by_foreign` (`created_by`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `chat_room_status`
--
ALTER TABLE `chat_room_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_room_status_user_id_foreign` (`user_id`),
  ADD KEY `chat_room_status_chat_room_id_foreign` (`chat_room_id`),
  ADD KEY `chat_room_status_chat_message_id_foreign` (`chat_message_id`),
  ADD KEY `chat_room_status_is_read_index` (`is_read`);

--
-- Indexes for table `chat_room_users`
--
ALTER TABLE `chat_room_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_room_users_chat_room_id_foreign` (`chat_room_id`),
  ADD KEY `chat_room_users_user_id_foreign` (`user_id`),
  ADD KEY `chat_room_users_last_message_timestamp_status_is_owner_index` (`last_message_timestamp`,`status`,`is_owner`);

--
-- Indexes for table `cms_modules`
--
ALTER TABLE `cms_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_modules_name_unique` (`name`),
  ADD UNIQUE KEY `cms_modules_route_name_unique` (`route_name`);

--
-- Indexes for table `cms_module_permissions`
--
ALTER TABLE `cms_module_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_module_permissions_user_id_foreign` (`user_id`),
  ADD KEY `cms_module_permissions_user_group_id_foreign` (`user_group_id`),
  ADD KEY `cms_module_permissions_cms_module_id_foreign` (`cms_module_id`);

--
-- Indexes for table `cms_widgets`
--
ALTER TABLE `cms_widgets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_widgets_slug_unique` (`slug`),
  ADD KEY `cms_widgets_widget_type_index` (`widget_type`);

--
-- Indexes for table `cms_widget_role`
--
ALTER TABLE `cms_widget_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_widget_role_cms_widget_id_foreign` (`cms_widget_id`),
  ADD KEY `cms_widget_role_user_group_id_foreign` (`user_group_id`),
  ADD KEY `cms_widget_role_user_id_foreign` (`user_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_booking_id_foreign` (`booking_id`),
  ADD KEY `comments_product_id_foreign` (`product_id`),
  ADD KEY `comments_slug_user_id_booking_id_product_id_index` (`slug`,`user_id`,`booking_id`,`product_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_us_user_id_foreign` (`user_id`),
  ADD KEY `contact_us_slug_user_id_index` (`slug`,`user_id`);

--
-- Indexes for table `content_management`
--
ALTER TABLE `content_management`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_management_slug_unique` (`slug`);

--
-- Indexes for table `disputes`
--
ALTER TABLE `disputes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disputes_user_id_foreign` (`user_id`),
  ADD KEY `disputes_slug_module_module_id_user_id_index` (`slug`,`module`,`module_id`,`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faqs_slug_unique` (`slug`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail_templates_identifier_unique` (`identifier`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_module_module_id_index` (`module`,`module_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `notifications_unique_id_unique` (`unique_id`),
  ADD KEY `notifications_actor_id_foreign` (`actor_id`),
  ADD KEY `notifications_target_id_foreign` (`target_id`),
  ADD KEY `notifications_unique_id_identifier_target_id_index` (`unique_id`,`identifier`,`target_id`);

--
-- Indexes for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_setting_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_name_category_id_user_id_pickup_lng_pickup_lat_index` (`name`,`category_id`,`user_id`,`pickup_lng`,`pickup_lat`);

--
-- Indexes for table `product_sells`
--
ALTER TABLE `product_sells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sells_product_id_foreign` (`product_id`),
  ADD KEY `product_sells_user_id_foreign` (`user_id`),
  ADD KEY `product_sells_product_owner_id_foreign` (`product_owner_id`),
  ADD KEY `product_sells_slug_product_owner_id_user_id_index` (`slug`,`product_owner_id`,`user_id`);

--
-- Indexes for table `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_slug_unique` (`slug`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_no_unique` (`mobile_no`),
  ADD KEY `index1` (`user_group_id`,`slug`,`email`,`mobile_no`,`is_email_verify`,`status`);

--
-- Indexes for table `user_api_token`
--
ALTER TABLE `user_api_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_api_token_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_cards`
--
ALTER TABLE `user_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_cards_slug_unique` (`slug`),
  ADD KEY `user_cards_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_connect_accounts`
--
ALTER TABLE `user_connect_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_connect_accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_external_accounts`
--
ALTER TABLE `user_external_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_external_accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_groups_title_unique` (`title`),
  ADD UNIQUE KEY `user_groups_slug_unique` (`slug`),
  ADD KEY `user_groups_slug_status_index` (`slug`,`status`);

--
-- Indexes for table `user_transactions`
--
ALTER TABLE `user_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_transactions_sender_id_foreign` (`sender_id`),
  ADD KEY `user_transactions_receiver_id_foreign` (`receiver_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ad_banners`
--
ALTER TABLE `ad_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `application_setting`
--
ALTER TABLE `application_setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `booking_statuses`
--
ALTER TABLE `booking_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category_users`
--
ALTER TABLE `category_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `chat_message_status`
--
ALTER TABLE `chat_message_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chat_room_status`
--
ALTER TABLE `chat_room_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_room_users`
--
ALTER TABLE `chat_room_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cms_modules`
--
ALTER TABLE `cms_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cms_module_permissions`
--
ALTER TABLE `cms_module_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cms_widgets`
--
ALTER TABLE `cms_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cms_widget_role`
--
ALTER TABLE `cms_widget_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `content_management`
--
ALTER TABLE `content_management`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `disputes`
--
ALTER TABLE `disputes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `notification_setting`
--
ALTER TABLE `notification_setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_sells`
--
ALTER TABLE `product_sells`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_api_token`
--
ALTER TABLE `user_api_token`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_cards`
--
ALTER TABLE `user_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_connect_accounts`
--
ALTER TABLE `user_connect_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_external_accounts`
--
ALTER TABLE `user_external_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_transactions`
--
ALTER TABLE `user_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_product_owner_id_foreign` FOREIGN KEY (`product_owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_statuses`
--
ALTER TABLE `booking_statuses`
  ADD CONSTRAINT `booking_statuses_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_statuses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_users`
--
ALTER TABLE `category_users`
  ADD CONSTRAINT `category_users_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_chat_room_id_foreign` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_message_status`
--
ALTER TABLE `chat_message_status`
  ADD CONSTRAINT `chat_message_status_chat_room_id_foreign` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_message_status_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD CONSTRAINT `chat_rooms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_room_status`
--
ALTER TABLE `chat_room_status`
  ADD CONSTRAINT `chat_room_status_chat_message_id_foreign` FOREIGN KEY (`chat_message_id`) REFERENCES `chat_messages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_room_status_chat_room_id_foreign` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_room_status_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_room_users`
--
ALTER TABLE `chat_room_users`
  ADD CONSTRAINT `chat_room_users_chat_room_id_foreign` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_room_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_module_permissions`
--
ALTER TABLE `cms_module_permissions`
  ADD CONSTRAINT `cms_module_permissions_cms_module_id_foreign` FOREIGN KEY (`cms_module_id`) REFERENCES `cms_modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_module_permissions_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_module_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_widget_role`
--
ALTER TABLE `cms_widget_role`
  ADD CONSTRAINT `cms_widget_role_cms_widget_id_foreign` FOREIGN KEY (`cms_widget_id`) REFERENCES `cms_widgets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_widget_role_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_widget_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD CONSTRAINT `contact_us_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disputes`
--
ALTER TABLE `disputes`
  ADD CONSTRAINT `disputes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD CONSTRAINT `notification_setting_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_sells`
--
ALTER TABLE `product_sells`
  ADD CONSTRAINT `product_sells_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_sells_product_owner_id_foreign` FOREIGN KEY (`product_owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_sells_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_api_token`
--
ALTER TABLE `user_api_token`
  ADD CONSTRAINT `user_api_token_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_cards`
--
ALTER TABLE `user_cards`
  ADD CONSTRAINT `user_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_connect_accounts`
--
ALTER TABLE `user_connect_accounts`
  ADD CONSTRAINT `user_connect_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_external_accounts`
--
ALTER TABLE `user_external_accounts`
  ADD CONSTRAINT `user_external_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_transactions`
--
ALTER TABLE `user_transactions`
  ADD CONSTRAINT `user_transactions_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_transactions_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
