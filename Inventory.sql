-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 24, 2022 at 11:34 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventry`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `account_user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `account_user_id`, `name`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 10, 'Account 1', '1', NULL, '2021-03-15 05:31:59', '2021-03-15 05:31:59'),
(2, 2, 9, 'nasser', '0', NULL, '2021-03-15 05:37:51', '2021-03-15 05:37:51'),
(3, 2, 2, 'Account USD AIB', '1', NULL, '2021-03-15 05:43:59', '2021-03-15 05:43:59'),
(4, 2, 11, 'Nevada Owen', '1', NULL, '2021-06-08 13:13:06', '2021-06-08 13:13:06'),
(6, 2, 11, 'Todd Walls', '1', NULL, '2021-06-16 16:40:04', '2021-06-16 16:40:04'),
(7, 2, 11, 'Colin Jimenez', '1', NULL, '2021-06-16 16:40:07', '2021-06-16 16:40:07'),
(8, 2, 12, 'Ariana Gray', '1', NULL, '2021-06-16 16:40:12', '2021-06-16 16:40:12'),
(9, 2, 10, 'Emerson Hansen', '1', NULL, '2021-06-16 16:42:43', '2021-06-16 16:42:43'),
(10, 2, 9, 'Amaya Eaton', '1', NULL, '2021-06-16 16:42:55', '2021-06-16 16:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(29, 'default', 'Deleted', 'App\\Models\\Branch', 12, 'App\\Models\\User', 2, '{\"id\":12,\"code\":\"mollie_wilkinson\",\"name\":\"Damian Maddox\",\"address\":\"Imelda Tucker\",\"created_at\":\"2021-05-31T16:38:50.000000Z\",\"updated_at\":\"2021-05-31T16:38:50.000000Z\"}', '2021-06-08 11:37:12', '2021-06-08 11:37:12'),
(30, 'default', 'Updated', 'App\\Models\\Branch', 13, 'App\\Models\\User', 2, '{\"code\":\"dana_armstrong\",\"name\":\"Joel Kerr\",\"address\":\"Phyllis Frye\",\"updated_at\":\"2021-06-08 16:07:45\"}', '2021-06-08 11:37:45', '2021-06-08 11:37:45'),
(31, 'default', 'Created', 'App\\Models\\Branch', 66, 'App\\Models\\User', 2, '[]', '2021-06-08 11:38:29', '2021-06-08 11:38:29'),
(32, 'default', 'Created', 'App\\Models\\Branch', 67, 'App\\Models\\User', 2, '{\"code\":\"price_terrell\",\"name\":\"Amery Campos\",\"address\":\"Austin Wilkinson\",\"updated_at\":\"2021-06-08T17:15:55.000000Z\",\"created_at\":\"2021-06-08T17:15:55.000000Z\",\"id\":67}', '2021-06-08 12:45:55', '2021-06-08 12:45:55'),
(33, 'default', 'Created', 'App\\Models\\Branch', 68, 'App\\Models\\User', 2, '{\"code\":\"garrison_orr\",\"name\":\"Sloane Armstrong\",\"address\":\"Cyrus Kelley\",\"updated_at\":\"2021-06-08T17:42:58.000000Z\",\"created_at\":\"2021-06-08T17:42:58.000000Z\",\"id\":68}', '2021-06-08 13:12:58', '2021-06-08 13:12:58'),
(34, 'default', 'Created', 'App\\Models\\Account', 4, 'App\\Models\\User', 2, '{\"account_user_id\":11,\"name\":\"Nevada Owen\",\"status\":true,\"user_id\":2,\"updated_at\":\"2021-06-08T17:43:06.000000Z\",\"created_at\":\"2021-06-08T17:43:06.000000Z\",\"id\":4}', '2021-06-08 13:13:06', '2021-06-08 13:13:06'),
(35, 'default', 'Created', 'App\\Models\\Customer', 18, 'App\\Models\\User', 2, '{\"name\":\"ziqys@mailinator.com\",\"email\":\"lofasoqyzo@mailinator.com\",\"phone\":\"0767642567\",\"website\":\"muzanykib@mailinator.com\",\"address\":\"hypibuh@mailinator.com\",\"logo\":\"1623174227.jpeg\",\"user_id\":2,\"updated_at\":\"2021-06-08T17:43:47.000000Z\",\"created_at\":\"2021-06-08T17:43:47.000000Z\",\"id\":18}', '2021-06-08 13:13:47', '2021-06-08 13:13:47'),
(36, 'default', 'Deleted', 'App\\Models\\Stock', 4, 'App\\Models\\User', 2, '{\"name\":\"Paki Coleman\",\"code\":\"Patience Morris\",\"phone\":\"0723662366\",\"manager\":\"Jessica Santos\",\"address\":\"Lee Erickson\",\"user_id\":2,\"updated_at\":\"2021-06-08T17:44:11.000000Z\",\"created_at\":\"2021-06-08T17:44:11.000000Z\",\"id\":4}', '2021-06-08 13:14:11', '2021-06-08 13:14:11'),
(37, 'default', 'Updated', 'App\\Models\\Product', 5, 'App\\Models\\User', 2, '{\"id\":5,\"code\":\"Elvis Gregory\",\"name\":\"Yvonne Maxwell\",\"unit\":\"Gareth Riggs\",\"cost\":\"186\",\"price\":\"908\",\"image\":\"1623158669.jpeg\",\"category_id\":2,\"quantity\":\"618\",\"stock\":null,\"stock_id\":1,\"barcode_symbology\":\"Tarik Kirkland\",\"product_details\":\"Voluptatem Sapiente\",\"tax\":\"236\",\"type\":\"Vladimir Wiggins\",\"supplier\":\"Dale Clark\",\"supplier_price\":\"253\",\"sale_unit\":\"Kato Wilcox\",\"purchase_unit\":\"Aurelia Marshall\",\"brand\":\"Arsenio Madden\",\"featured\":\"Jessamine Lowe\",\"user_id\":2,\"created_at\":\"2021-05-31T16:28:51.000000Z\",\"updated_at\":\"2021-06-08T17:45:08.000000Z\"}', '2021-06-08 13:15:08', '2021-06-08 13:15:08'),
(38, 'default', 'Deleted', 'App\\Models\\Product', 5, 'App\\Models\\User', 2, '{\"id\":5,\"code\":\"Elvis Gregory\",\"name\":\"Yvonne Maxwell\",\"unit\":\"Gareth Riggs\",\"cost\":\"186.000\",\"price\":\"908.000\",\"image\":\"1623158669.jpeg\",\"category_id\":2,\"quantity\":618,\"stock\":null,\"stock_id\":1,\"barcode_symbology\":\"Tarik Kirkland\",\"product_details\":\"Voluptatem Sapiente\",\"tax\":\"236.000\",\"type\":\"Vladimir Wiggins\",\"supplier\":\"Dale Clark\",\"supplier_price\":\"253\",\"sale_unit\":\"Kato Wilcox\",\"purchase_unit\":\"Aurelia Marshall\",\"brand\":\"Arsenio Madden\",\"featured\":\"Jessamine Lowe\",\"user_id\":2,\"created_at\":\"2021-05-31T16:28:51.000000Z\",\"updated_at\":\"2021-06-08T17:45:08.000000Z\"}', '2021-06-08 13:15:14', '2021-06-08 13:15:14'),
(39, 'default', 'Created', 'App\\Models\\Product', 6, 'App\\Models\\User', 2, '{\"code\":\"Fredericka Frost\",\"name\":\"Rooney Buckley\",\"unit\":\"Cynthia Patterson\",\"cost\":\"787\",\"price\":\"888\",\"image\":\"1623174476.jpeg\",\"category_id\":1,\"stock_id\":2,\"user_id\":2,\"quantity\":\"967\",\"barcode_symbology\":\"Lacota Espinoza\",\"product_details\":\"Qui consequuntur con\",\"tax\":\"787\",\"type\":\"Cassidy Velez\",\"supplier\":\"Jaime Guerrero\",\"supplier_price\":\"596\",\"sale_unit\":\"Yael Bartlett\",\"purchase_unit\":\"Jenette Wallace\",\"brand\":\"Clare Bradford\",\"featured\":\"Yuri Mcmahon\",\"updated_at\":\"2021-06-08T17:47:56.000000Z\",\"created_at\":\"2021-06-08T17:47:56.000000Z\",\"id\":6}', '2021-06-08 13:17:56', '2021-06-08 13:17:56'),
(41, 'default', 'Updated', 'App\\Models\\Payment', 4, 'App\\Models\\User', 2, '{\"id\":4,\"sale_id\":null,\"purchase_id\":3,\"reference_no\":\"Magni architecto ame\",\"amount\":\"37\",\"paid_by\":\"Unde soluta illo sim\",\"account_id\":2,\"created_by\":\"Non incidunt ex dol\",\"type\":\"Out\",\"note\":\"Accusamus debitis el\",\"approval_code\":\"Dolor consectetur la\",\"user_id\":2,\"created_at\":\"2021-05-31T16:35:29.000000Z\",\"updated_at\":\"2021-06-08T17:52:34.000000Z\"}', '2021-06-08 13:22:34', '2021-06-08 13:22:34'),
(42, 'default', 'Updated', 'App\\Models\\Payment', 4, 'App\\Models\\User', 2, '{\"id\":4,\"sale_id\":null,\"purchase_id\":3,\"reference_no\":\"Magni architecto ame\",\"amount\":\"37\",\"paid_by\":\"Unde soluta illo sim\",\"account_id\":2,\"created_by\":\"Non incidunt ex dol\",\"type\":\"Out\",\"note\":\"Accusamus debitis el\",\"approval_code\":\"Dolor consectetur la\",\"user_id\":2,\"created_at\":\"2021-05-31T16:35:29.000000Z\",\"updated_at\":\"2021-06-08T17:53:23.000000Z\"}', '2021-06-08 13:23:23', '2021-06-08 13:23:23'),
(43, 'default', 'Created', 'App\\Models\\Transaction', 15, 'App\\Models\\User', 2, '{\"type\":\"payment\",\"type_id\":4,\"credit\":0,\"debit\":\"37\",\"account_id\":2,\"status\":\"Out\",\"description\":\"---\",\"user_id\":2,\"updated_at\":\"2021-06-08T17:53:23.000000Z\",\"created_at\":\"2021-06-08T17:53:23.000000Z\",\"id\":15}', '2021-06-08 13:23:23', '2021-06-08 13:23:23'),
(44, 'default', 'Deleted', 'App\\Models\\Stock', 2, 'App\\Models\\User', 2, '{\"id\":2,\"code\":\";flk\",\"name\":\"sa;fdlk\",\"manager\":\";flk\",\"phone\":\";lfk;lfk;\",\"address\":\"lkf;lfk\",\"user_id\":2,\"created_at\":\"2021-03-26T10:46:20.000000Z\",\"updated_at\":\"2021-03-26T10:46:20.000000Z\"}', '2021-06-08 13:25:36', '2021-06-08 13:25:36'),
(45, 'default', 'Deleted', 'App\\Models\\Stock', 1, 'App\\Models\\User', 2, '{\"id\":1,\"code\":\"dslkfj\",\"name\":\"Anietie\",\"manager\":\"lfkdsj\",\"phone\":\"123456789\",\"address\":\"lfj\",\"user_id\":2,\"created_at\":\"2021-03-26T10:41:46.000000Z\",\"updated_at\":\"2021-05-31T16:28:15.000000Z\"}', '2021-06-08 13:25:41', '2021-06-08 13:25:41'),
(46, 'default', 'Deleted', 'App\\Models\\User', 8, 'App\\Models\\User', 2, '{\"id\":8,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"\",\"position\":\"\",\"email\":\"n.karimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T08:09:55.000000Z\",\"updated_at\":\"2021-03-12T08:09:55.000000Z\"}', '2021-06-08 13:28:47', '2021-06-08 13:28:47'),
(47, 'default', 'Created', 'App\\Models\\Branch', 69, 'App\\Models\\User', 2, '{\"code\":\"matthew_roberts\",\"name\":\"Baxter Ballard\",\"address\":\"Jeanette Richardson\",\"updated_at\":\"2021-06-08T17:59:38.000000Z\",\"created_at\":\"2021-06-08T17:59:38.000000Z\",\"id\":69}', '2021-06-08 13:29:38', '2021-06-08 13:29:38'),
(48, 'default', 'Created', 'App\\Models\\Branch', 70, 'App\\Models\\User', 2, '{\"code\":\"hanae_berger\",\"name\":\"Macon Evans\",\"address\":\"Maxine Sanchez\",\"updated_at\":\"2021-06-08T17:59:46.000000Z\",\"created_at\":\"2021-06-08T17:59:46.000000Z\",\"id\":70}', '2021-06-08 13:29:46', '2021-06-08 13:29:46'),
(49, 'default', 'Created', 'App\\Models\\Branch', 71, 'App\\Models\\User', 2, '{\"code\":\"hanae_berger9\",\"name\":\"Deacon Schultz\",\"address\":\"Jessamine Parrish\",\"updated_at\":\"2021-06-08T18:01:09.000000Z\",\"created_at\":\"2021-06-08T18:01:09.000000Z\",\"id\":71}', '2021-06-08 13:31:09', '2021-06-08 13:31:09'),
(50, 'default', 'Created', 'App\\Models\\Branch', 72, 'App\\Models\\User', 11, '{\"code\":\"lskdfjlk_skladfjkj_\",\"name\":\"aslkdflk\",\"address\":\"kjsdafh afghanas\",\"updated_at\":\"2021-06-08T18:03:28.000000Z\",\"created_at\":\"2021-06-08T18:03:28.000000Z\",\"id\":72}', '2021-06-08 13:33:28', '2021-06-08 13:33:28'),
(51, 'default', 'Created', 'App\\Models\\Product', 7, 'App\\Models\\User', 2, '{\"code\":\"Oprah Barr\",\"name\":\"Christine Pennington\",\"unit\":\"Laura Payne\",\"cost\":\"694\",\"price\":\"223\",\"image\":\"1623430532.png\",\"category_id\":1,\"stock_id\":4,\"user_id\":2,\"quantity\":\"152\",\"barcode_symbology\":\"Colette Head\",\"product_details\":\"Sunt aut aut eum et\",\"tax\":\"553\",\"type\":\"Chantale Hunt\",\"supplier\":\"Yuri Knight\",\"supplier_price\":\"376\",\"sale_unit\":\"Jessamine Stewart\",\"purchase_unit\":\"Julie Dodson\",\"brand\":\"Kirestin Huber\",\"featured\":\"Laith Long\",\"updated_at\":\"2021-06-11T16:55:32.000000Z\",\"created_at\":\"2021-06-11T16:55:32.000000Z\",\"id\":7}', '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(52, 'default', 'Created', 'App\\Models\\Sale', 10, 'App\\Models\\User', 2, '{\"date\":\"2021-06-12T00:00:00.000Z\",\"reference_no\":\"573\",\"customer_id\":8,\"biller_id\":11,\"stock_id\":4,\"total\":277056,\"sale_status\":\"active\",\"payment_status\":\"none\",\"due_date\":\"2021-06-12T00:00:00.000Z\",\"note\":\"Labore ex vel volupt\",\"discount\":\"997\",\"product_tax\":\"920\",\"payment_term\":\"532\",\"total_items\":\"189\",\"pos\":\"584\",\"paid\":\"381\",\"user_id\":2,\"customer\":\"Current\",\"biller\":\"Nasser\",\"updated_at\":\"2021-06-12T14:41:18.000000Z\",\"created_at\":\"2021-06-12T14:41:18.000000Z\",\"id\":10}', '2021-06-12 10:11:18', '2021-06-12 10:11:18'),
(53, 'default', 'Created', 'App\\Models\\Payment', 5, 'App\\Models\\User', 2, '{\"reference_no\":\"Amet neque qui fugi\",\"amount\":\"163181\",\"paid_by\":\"Est enim magna lore\",\"created_by\":\"Harum accusamus dese\",\"type\":\"Out\",\"note\":\"Placeat labore volu\",\"approval_code\":\"Animi excepturi nos\",\"sale_id\":10,\"purchase_id\":null,\"account_id\":3,\"user_id\":2,\"updated_at\":\"2021-06-12T15:24:23.000000Z\",\"created_at\":\"2021-06-12T15:24:23.000000Z\",\"id\":5}', '2021-06-12 10:54:23', '2021-06-12 10:54:23'),
(54, 'default', 'Created', 'App\\Models\\Transaction', 16, 'App\\Models\\User', 2, '{\"type\":\"payment\",\"type_id\":5,\"credit\":0,\"debit\":\"163181\",\"account_id\":3,\"status\":\"Out\",\"description\":\"---\",\"user_id\":2,\"updated_at\":\"2021-06-12T15:24:23.000000Z\",\"created_at\":\"2021-06-12T15:24:23.000000Z\",\"id\":16}', '2021-06-12 10:54:23', '2021-06-12 10:54:23'),
(55, 'default', 'Created', 'App\\Models\\Payment', 6, 'App\\Models\\User', 2, '{\"reference_no\":\"Delectus vel sit al\",\"amount\":\"4979\",\"paid_by\":\"Rem eveniet consect\",\"created_by\":\"Corporis totam disti\",\"type\":\"Out\",\"note\":\"Magna quia dolorem s\",\"approval_code\":\"Incididunt voluptate\",\"sale_id\":10,\"purchase_id\":null,\"account_id\":4,\"user_id\":2,\"updated_at\":\"2021-06-12T15:27:29.000000Z\",\"created_at\":\"2021-06-12T15:27:29.000000Z\",\"id\":6}', '2021-06-12 10:57:29', '2021-06-12 10:57:29'),
(56, 'default', 'Created', 'App\\Models\\Transaction', 17, 'App\\Models\\User', 2, '{\"type\":\"payment\",\"type_id\":6,\"credit\":0,\"debit\":\"4979\",\"account_id\":4,\"status\":\"Out\",\"description\":\"---\",\"user_id\":2,\"updated_at\":\"2021-06-12T15:27:29.000000Z\",\"created_at\":\"2021-06-12T15:27:29.000000Z\",\"id\":17}', '2021-06-12 10:57:29', '2021-06-12 10:57:29'),
(57, 'default', 'Created', 'App\\Models\\Payment', 7, 'App\\Models\\User', 2, '{\"reference_no\":\"Deleniti possimus e\",\"amount\":\"63085\",\"paid_by\":\"Consectetur quis et\",\"created_by\":\"Quia necessitatibus\",\"type\":\"Out\",\"note\":\"Enim nesciunt commo\",\"approval_code\":\"Perferendis praesent\",\"sale_id\":10,\"purchase_id\":null,\"account_id\":3,\"user_id\":2,\"updated_at\":\"2021-06-12T15:29:34.000000Z\",\"created_at\":\"2021-06-12T15:29:34.000000Z\",\"id\":7}', '2021-06-12 10:59:34', '2021-06-12 10:59:34'),
(58, 'default', 'Created', 'App\\Models\\Transaction', 18, 'App\\Models\\User', 2, '{\"type\":\"payment\",\"type_id\":7,\"credit\":0,\"debit\":\"63085\",\"account_id\":3,\"status\":\"Out\",\"description\":\"---\",\"user_id\":2,\"updated_at\":\"2021-06-12T15:29:34.000000Z\",\"created_at\":\"2021-06-12T15:29:34.000000Z\",\"id\":18}', '2021-06-12 10:59:34', '2021-06-12 10:59:34'),
(59, 'default', 'Created', 'App\\Models\\Purchase', 6, 'App\\Models\\User', 2, '{\"reference_no\":\"350\",\"date\":\"2021-06-12T00:00:00.000Z\",\"vendor_id\":3,\"vendor\":\"sdoiu\",\"stock_id\":4,\"note\":\"Omnis in reiciendis\",\"total\":490455,\"discount\":\"777\",\"total_tax\":\"67\",\"payment_status\":\"none\",\"due_date\":\"2021-06-12T00:00:00.000Z\",\"user_id\":2,\"updated_at\":\"2021-06-12T15:32:05.000000Z\",\"created_at\":\"2021-06-12T15:32:05.000000Z\",\"id\":6}', '2021-06-12 11:02:05', '2021-06-12 11:02:05'),
(60, 'default', 'Created', 'App\\Models\\Payment', 8, 'App\\Models\\User', 2, '{\"reference_no\":\"Maiores exercitation\",\"amount\":\"396304\",\"paid_by\":\"Exercitation expedit\",\"created_by\":\"Sequi natus rerum qu\",\"type\":\"In\",\"note\":\"Impedit reiciendis\",\"approval_code\":\"Ex laborum velit in\",\"sale_id\":null,\"purchase_id\":6,\"account_id\":4,\"user_id\":2,\"updated_at\":\"2021-06-12T15:32:27.000000Z\",\"created_at\":\"2021-06-12T15:32:27.000000Z\",\"id\":8}', '2021-06-12 11:02:27', '2021-06-12 11:02:27'),
(61, 'default', 'Created', 'App\\Models\\Transaction', 19, 'App\\Models\\User', 2, '{\"type\":\"payment\",\"type_id\":8,\"credit\":\"396304\",\"debit\":0,\"account_id\":4,\"status\":\"In\",\"description\":\"---\",\"user_id\":2,\"updated_at\":\"2021-06-12T15:32:27.000000Z\",\"created_at\":\"2021-06-12T15:32:27.000000Z\",\"id\":19}', '2021-06-12 11:02:27', '2021-06-12 11:02:27'),
(68, 'default', 'Created', 'App\\Models\\Purchase', 13, 'App\\Models\\User', 2, '{\"reference_no\":\"222\",\"date\":\"2021-06-12T00:00:00.000Z\",\"vendor_id\":1,\"vendor\":\"sdoiu\",\"stock_id\":4,\"note\":\"Modi excepteur simil\",\"total\":154298,\"discount\":\"5\",\"total_tax\":\"956\",\"payment_status\":\"none\",\"due_date\":\"2021-06-12T00:00:00.000Z\",\"user_id\":2,\"updated_at\":\"2021-06-12T17:34:21.000000Z\",\"created_at\":\"2021-06-12T17:34:21.000000Z\",\"id\":13}', '2021-06-12 13:04:21', '2021-06-12 13:04:21'),
(69, 'default', 'Updated', 'App\\Models\\Purchase', 13, 'App\\Models\\User', 2, '{\"id\":13,\"reference_no\":\"222\",\"date\":\"2021-06-12T00:00:00.000Z\",\"vendor_id\":1,\"vendor\":\"sdoiu\",\"stock_id\":4,\"note\":\"Modi excepteur simil\",\"total\":\"154298.000\",\"discount\":\"5.000\",\"total_tax\":\"956.000\",\"payment_status\":\"none\",\"user_id\":2,\"due_date\":\"2021-06-12T00:00:00.000Z\",\"created_at\":\"2021-06-12T17:34:21.000000Z\",\"updated_at\":\"2021-06-12T17:34:21.000000Z\"}', '2021-06-12 13:17:17', '2021-06-12 13:17:17'),
(70, 'default', 'Updated', 'App\\Models\\Purchase', 13, 'App\\Models\\User', 2, '{\"id\":13,\"reference_no\":\"222\",\"date\":\"2021-06-12T00:00:00.000Z\",\"vendor_id\":1,\"vendor\":\"sdoiu\",\"stock_id\":4,\"note\":\"Modi excepteur simil\",\"total\":154298,\"discount\":\"5.000\",\"total_tax\":\"956.000\",\"payment_status\":\"none\",\"user_id\":2,\"due_date\":\"2021-06-12T00:00:00.000Z\",\"created_at\":\"2021-06-12T17:47:17.000000Z\",\"updated_at\":\"2021-06-12T17:55:35.000000Z\"}', '2021-06-12 13:25:35', '2021-06-12 13:25:35'),
(71, 'default', 'Updated', 'App\\Models\\Purchase', 13, 'App\\Models\\User', 2, '{\"id\":13,\"reference_no\":\"222\",\"date\":\"2021-06-12T00:00:00.000Z\",\"vendor_id\":1,\"vendor\":\"sdoiu\",\"stock_id\":4,\"note\":\"Modi excepteur simil\",\"total\":1156,\"discount\":\"5.000\",\"total_tax\":\"956.000\",\"payment_status\":\"none\",\"user_id\":2,\"due_date\":\"2021-06-12T00:00:00.000Z\",\"created_at\":\"2021-06-12T17:47:17.000000Z\",\"updated_at\":\"2021-06-12T17:56:37.000000Z\"}', '2021-06-12 13:26:37', '2021-06-12 13:26:37'),
(72, 'default', 'Created', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"source_stock\":4,\"target_stock\":4,\"approval_status\":\"Action!\",\"user_id\":2,\"amount\":259700,\"updated_at\":\"2021-06-12T17:59:59.000000Z\",\"created_at\":\"2021-06-12T17:59:59.000000Z\",\"id\":1}', '2021-06-12 13:29:59', '2021-06-12 13:29:59'),
(75, 'default', 'Updated', 'App\\Models\\Purchase', 13, 'App\\Models\\User', 2, '{\"id\":13,\"reference_no\":\"222\",\"date\":\"2021-06-12T00:00:00.000Z\",\"vendor_id\":1,\"vendor\":\"sdoiu\",\"stock_id\":4,\"note\":\"Modi excepteur simil\",\"total\":784,\"discount\":\"5.000\",\"total_tax\":\"956.000\",\"payment_status\":\"none\",\"user_id\":2,\"due_date\":\"2021-06-12T00:00:00.000Z\",\"created_at\":\"2021-06-12T17:47:17.000000Z\",\"updated_at\":\"2021-06-12T18:04:39.000000Z\"}', '2021-06-12 13:34:39', '2021-06-12 13:34:39'),
(76, 'default', 'Created', 'App\\Models\\Payment', 9, 'App\\Models\\User', 2, '{\"reference_no\":\"Sit repudiandae qui\",\"amount\":\"00\",\"paid_by\":\"Ut est libero inven\",\"created_by\":\"Voluptatum veritatis\",\"type\":\"Out\",\"note\":\"Consectetur quis ex\",\"approval_code\":\"Molestiae esse volu\",\"sale_id\":null,\"purchase_id\":13,\"account_id\":4,\"user_id\":2,\"updated_at\":\"2021-06-12T18:05:50.000000Z\",\"created_at\":\"2021-06-12T18:05:50.000000Z\",\"id\":9}', '2021-06-12 13:35:50', '2021-06-12 13:35:50'),
(77, 'default', 'Created', 'App\\Models\\Transaction', 20, 'App\\Models\\User', 2, '{\"type\":\"payment\",\"type_id\":9,\"credit\":0,\"debit\":\"00\",\"account_id\":4,\"status\":\"Out\",\"description\":\"---\",\"user_id\":2,\"updated_at\":\"2021-06-12T18:05:50.000000Z\",\"created_at\":\"2021-06-12T18:05:50.000000Z\",\"id\":20}', '2021-06-12 13:35:50', '2021-06-12 13:35:50'),
(78, 'default', 'Created', 'App\\Models\\Branch', 73, 'App\\Models\\User', 2, '{\"code\":\"norman_sweet\",\"name\":\"Doris Mcpherson\",\"address\":\"Amery Washington\",\"updated_at\":\"2021-06-14T14:59:17.000000Z\",\"created_at\":\"2021-06-14T14:59:17.000000Z\",\"id\":73}', '2021-06-14 14:59:17', '2021-06-14 14:59:17'),
(79, 'default', 'Created', 'App\\Models\\Branch', 74, 'App\\Models\\User', 2, '{\"code\":\"darrel_chaney\",\"name\":\"Neil Garrison\",\"address\":\"Remedios Barker\",\"updated_at\":\"2021-06-14T14:59:21.000000Z\",\"created_at\":\"2021-06-14T14:59:21.000000Z\",\"id\":74}', '2021-06-14 14:59:21', '2021-06-14 14:59:21'),
(80, 'default', 'Deleted', 'App\\Models\\Branch', 10, 'App\\Models\\User', 2, '{\"id\":10,\"code\":\"maryam_vaughn\",\"name\":\"Iona Justice23\",\"address\":\"Fatima Ramirez\",\"created_at\":\"2021-05-31T12:08:48.000000Z\",\"updated_at\":\"2021-06-08T10:04:46.000000Z\"}', '2021-06-14 14:59:29', '2021-06-14 14:59:29'),
(81, 'default', 'Deleted', 'App\\Models\\Branch', 14, 'App\\Models\\User', 2, '{\"id\":14,\"code\":\"marny_tucker\",\"name\":\"Colleen Avery\",\"address\":\"Zephr York\",\"created_at\":\"2021-05-31T12:08:51.000000Z\",\"updated_at\":\"2021-05-31T12:08:51.000000Z\"}', '2021-06-14 14:59:37', '2021-06-14 14:59:37'),
(82, 'default', 'Created', 'App\\Models\\Branch', 75, 'App\\Models\\User', 2, '{\"code\":\"nina_burks\",\"name\":\"Walker Cline\",\"address\":\"Pascale Henson\",\"updated_at\":\"2021-06-14T15:00:06.000000Z\",\"created_at\":\"2021-06-14T15:00:06.000000Z\",\"id\":75}', '2021-06-14 15:00:06', '2021-06-14 15:00:06'),
(83, 'default', 'Created', 'App\\Models\\Branch', 76, 'App\\Models\\User', 2, '{\"code\":\"magee_morrison\",\"name\":\"Quincy Coffey\",\"address\":\"Josiah Velasquez\",\"updated_at\":\"2021-06-14T15:00:22.000000Z\",\"created_at\":\"2021-06-14T15:00:22.000000Z\",\"id\":76}', '2021-06-14 15:00:22', '2021-06-14 15:00:22'),
(84, 'default', 'Created', 'App\\Models\\Branch', 77, 'App\\Models\\User', 2, '{\"code\":\"sacha_fisher\",\"name\":\"Shannon Snider\",\"address\":\"Quinlan Wooten\",\"updated_at\":\"2021-06-14T15:00:50.000000Z\",\"created_at\":\"2021-06-14T15:00:50.000000Z\",\"id\":77}', '2021-06-14 15:00:50', '2021-06-14 15:00:50'),
(87, 'default', 'Updated', 'App\\Models\\Branch', 6, 'App\\Models\\User', 2, '{\"code\":\"rina_knowles\",\"name\":\"Amethyst Powell\",\"address\":\"Francesca Reynolds\",\"updated_at\":\"2021-06-14 19:32:53\"}', '2021-06-14 15:02:54', '2021-06-14 15:02:54'),
(88, 'default', 'Created', 'App\\Models\\Account', 5, 'App\\Models\\User', 2, '{\"account_user_id\":11,\"name\":\"Haley Morris\",\"status\":true,\"user_id\":2,\"updated_at\":\"2021-06-14T15:03:38.000000Z\",\"created_at\":\"2021-06-14T15:03:38.000000Z\",\"id\":5}', '2021-06-14 15:03:38', '2021-06-14 15:03:38'),
(93, 'default', 'Created', 'App\\Models\\Branch', 84, 'App\\Models\\User', 2, '{\"code\":\"roanna_eaton\",\"name\":\"Carly Hendricks\",\"address\":\"Breanna May\",\"updated_at\":\"2021-06-14T15:07:54.000000Z\",\"created_at\":\"2021-06-14T15:07:54.000000Z\",\"id\":84}', '2021-06-14 15:07:54', '2021-06-14 15:07:54'),
(94, 'default', 'Created', 'App\\Models\\Branch', 85, 'App\\Models\\User', 2, '{\"code\":\"nero_wade\",\"name\":\"Omar Owen\",\"address\":\"Mark Henderson\",\"updated_at\":\"2021-06-14T15:08:20.000000Z\",\"created_at\":\"2021-06-14T15:08:20.000000Z\",\"id\":85}', '2021-06-14 15:08:20', '2021-06-14 15:08:20'),
(95, 'default', 'Created', 'App\\Models\\Branch', 86, 'App\\Models\\User', 2, '{\"code\":\"brooke_cole\",\"name\":\"Marsden Rich\",\"address\":\"Hu Lindsey\",\"updated_at\":\"2021-06-14T15:10:09.000000Z\",\"created_at\":\"2021-06-14T15:10:09.000000Z\",\"id\":86}', '2021-06-14 15:10:09', '2021-06-14 15:10:09'),
(96, 'default', 'Created', 'App\\Models\\Branch', 87, 'App\\Models\\User', 2, '{\"code\":\"hedley_white\",\"name\":\"Lavinia Chavez\",\"address\":\"Catherine Vega\",\"updated_at\":\"2021-06-14T15:10:19.000000Z\",\"created_at\":\"2021-06-14T15:10:19.000000Z\",\"id\":87}', '2021-06-14 15:10:19', '2021-06-14 15:10:19'),
(97, 'default', 'Created', 'App\\Models\\Branch', 88, 'App\\Models\\User', 2, '{\"code\":\"ivor_perkins\",\"name\":\"Hillary Oneal\",\"address\":\"Zephania Cardenas\",\"updated_at\":\"2021-06-14T15:10:54.000000Z\",\"created_at\":\"2021-06-14T15:10:54.000000Z\",\"id\":88}', '2021-06-14 15:10:54', '2021-06-14 15:10:54'),
(98, 'default', 'Deleted', 'App\\Models\\Branch', 88, 'App\\Models\\User', 2, '{\"id\":88,\"code\":\"ivor_perkins\",\"name\":\"Hillary Oneal\",\"address\":\"Zephania Cardenas\",\"created_at\":\"2021-06-14T15:10:54.000000Z\",\"updated_at\":\"2021-06-14T15:10:54.000000Z\"}', '2021-06-14 15:23:22', '2021-06-14 15:23:22'),
(99, 'default', 'Deleted', 'App\\Models\\Branch', 87, 'App\\Models\\User', 2, '{\"id\":87,\"code\":\"hedley_white\",\"name\":\"Lavinia Chavez\",\"address\":\"Catherine Vega\",\"created_at\":\"2021-06-14T15:10:19.000000Z\",\"updated_at\":\"2021-06-14T15:10:19.000000Z\"}', '2021-06-14 15:23:28', '2021-06-14 15:23:28'),
(100, 'default', 'Deleted', 'App\\Models\\Branch', 86, 'App\\Models\\User', 2, '{\"id\":86,\"code\":\"brooke_cole\",\"name\":\"Marsden Rich\",\"address\":\"Hu Lindsey\",\"created_at\":\"2021-06-14T15:10:09.000000Z\",\"updated_at\":\"2021-06-14T15:10:09.000000Z\"}', '2021-06-14 16:09:36', '2021-06-14 16:09:36'),
(101, 'default', 'Deleted', 'App\\Models\\Branch', 15, 'App\\Models\\User', 2, '{\"id\":15,\"code\":\"jameson_hopkins\",\"name\":\"Chase Aguilar\",\"address\":\"Julian Howell\",\"created_at\":\"2021-05-31T12:08:52.000000Z\",\"updated_at\":\"2021-05-31T12:08:52.000000Z\"}', '2021-06-14 16:16:48', '2021-06-14 16:16:48'),
(102, 'default', 'Deleted', 'App\\Models\\Branch', 16, 'App\\Models\\User', 2, '{\"id\":16,\"code\":\"lacy_wilkerson\",\"name\":\"David Graham\",\"address\":\"Galena Hahn\",\"created_at\":\"2021-05-31T12:08:52.000000Z\",\"updated_at\":\"2021-05-31T12:08:52.000000Z\"}', '2021-06-14 16:16:50', '2021-06-14 16:16:50'),
(103, 'default', 'Deleted', 'App\\Models\\Branch', 17, 'App\\Models\\User', 2, '{\"id\":17,\"code\":\"hector_adkins\",\"name\":\"Blair Kent\",\"address\":\"Anthony Buck\",\"created_at\":\"2021-05-31T12:08:53.000000Z\",\"updated_at\":\"2021-05-31T12:08:53.000000Z\"}', '2021-06-14 16:16:52', '2021-06-14 16:16:52'),
(104, 'default', 'Deleted', 'App\\Models\\Branch', 18, 'App\\Models\\User', 2, '{\"id\":18,\"code\":\"simon_reyes\",\"name\":\"Phoebe Ball\",\"address\":\"Brennan Short\",\"created_at\":\"2021-05-31T12:08:53.000000Z\",\"updated_at\":\"2021-05-31T12:08:53.000000Z\"}', '2021-06-14 16:16:54', '2021-06-14 16:16:54'),
(105, 'default', 'Created', 'App\\Models\\Category', 7, 'App\\Models\\User', 2, '{\"name\":\"Zenia Young\",\"slug\":\"Hadassah Colon\",\"user_id\":2,\"updated_at\":\"2021-06-14T17:16:20.000000Z\",\"created_at\":\"2021-06-14T17:16:20.000000Z\",\"id\":7}', '2021-06-14 17:16:20', '2021-06-14 17:16:20'),
(106, 'default', 'Created', 'App\\Models\\Category', 8, 'App\\Models\\User', 2, '{\"name\":\"Clayton Ramsey\",\"slug\":\"Ross Woodward\",\"user_id\":2,\"updated_at\":\"2021-06-14T17:17:02.000000Z\",\"created_at\":\"2021-06-14T17:17:02.000000Z\",\"id\":8}', '2021-06-14 17:17:02', '2021-06-14 17:17:02'),
(107, 'default', 'Created', 'App\\Models\\Category', 9, 'App\\Models\\User', 2, '{\"name\":\"Upton Harrell\",\"slug\":\"Stella Sloan\",\"user_id\":2,\"updated_at\":\"2021-06-14T17:17:03.000000Z\",\"created_at\":\"2021-06-14T17:17:03.000000Z\",\"id\":9}', '2021-06-14 17:17:03', '2021-06-14 17:17:03'),
(108, 'default', 'Created', 'App\\Models\\Category', 10, 'App\\Models\\User', 2, '{\"name\":\"Bo Nguyen\",\"slug\":\"Janna Cole\",\"user_id\":2,\"updated_at\":\"2021-06-14T17:17:04.000000Z\",\"created_at\":\"2021-06-14T17:17:04.000000Z\",\"id\":10}', '2021-06-14 17:17:04', '2021-06-14 17:17:04'),
(109, 'default', 'Deleted', 'App\\Models\\Category', 9, 'App\\Models\\User', 2, '{\"id\":9,\"name\":\"Upton Harrell\",\"slug\":\"Stella Sloan\",\"user_id\":2,\"created_at\":\"2021-06-14T17:17:03.000000Z\",\"updated_at\":\"2021-06-14T17:17:03.000000Z\"}', '2021-06-14 17:17:08', '2021-06-14 17:17:08'),
(110, 'default', 'Deleted', 'App\\Models\\Category', 8, 'App\\Models\\User', 2, '{\"id\":8,\"name\":\"Clayton Ramsey\",\"slug\":\"Ross Woodward\",\"user_id\":2,\"created_at\":\"2021-06-14T17:17:02.000000Z\",\"updated_at\":\"2021-06-14T17:17:02.000000Z\"}', '2021-06-14 17:17:13', '2021-06-14 17:17:13'),
(111, 'default', 'Updated', 'App\\Models\\Category', 10, 'App\\Models\\User', 2, '{\"id\":10,\"name\":\"Bo Nguyen\",\"slug\":\"Janna Cole\",\"user_id\":2,\"created_at\":\"2021-06-14T17:17:04.000000Z\",\"updated_at\":\"2021-06-14T17:17:04.000000Z\"}', '2021-06-14 17:17:30', '2021-06-14 17:17:30'),
(112, 'default', 'Created', 'App\\Models\\Stock', 5, 'App\\Models\\User', 2, '{\"name\":\"Adele Joyner\",\"code\":\"Maisie Valentine\",\"phone\":\"0765432123\",\"manager\":\"Cullen Greene\",\"address\":\"Inga House\",\"user_id\":2,\"updated_at\":\"2021-06-14T17:17:48.000000Z\",\"created_at\":\"2021-06-14T17:17:48.000000Z\",\"id\":5}', '2021-06-14 17:17:48', '2021-06-14 17:17:48'),
(113, 'default', 'Created', 'App\\Models\\Product', 147, 'App\\Models\\User', 2, '{\"code\":\"Driscoll Dickson\",\"name\":\"Cailin Cooley\",\"unit\":\"Christian Guy\",\"cost\":\"456\",\"price\":\"687\",\"image\":\"1623691096.jpeg\",\"category_id\":2,\"stock_id\":5,\"user_id\":2,\"quantity\":\"972\",\"barcode_symbology\":\"Prescott Robertson\",\"product_details\":\"Dolorum quaerat et v\",\"tax\":\"113\",\"type\":\"Linda Carrillo\",\"supplier\":\"Rahim Morrow\",\"supplier_price\":\"594\",\"sale_unit\":\"Marshall Blake\",\"purchase_unit\":\"Renee Maddox\",\"brand\":\"Julie Webster\",\"featured\":\"Calista Rocha\",\"updated_at\":\"2021-06-14T17:18:17.000000Z\",\"created_at\":\"2021-06-14T17:18:17.000000Z\",\"id\":147}', '2021-06-14 17:18:17', '2021-06-14 17:18:17'),
(114, 'default', 'Created', 'App\\Models\\Sale', 11, 'App\\Models\\User', 2, '{\"date\":\"2021-06-14T00:00:00.000Z\",\"reference_no\":\"590\",\"customer_id\":6,\"biller_id\":10,\"stock_id\":5,\"total\":631240,\"sale_status\":\"active\",\"payment_status\":\"none\",\"due_date\":\"2021-06-14T00:00:00.000Z\",\"note\":\"Hic proident in duc\",\"discount\":\"278\",\"product_tax\":\"453\",\"payment_term\":\"866\",\"total_items\":\"890\",\"pos\":\"803\",\"paid\":\"205\",\"user_id\":2,\"customer\":\"sijefyhuj@mailinator.com\",\"biller\":\"Nasser\",\"updated_at\":\"2021-06-14T17:18:40.000000Z\",\"created_at\":\"2021-06-14T17:18:40.000000Z\",\"id\":11}', '2021-06-14 17:18:40', '2021-06-14 17:18:40'),
(115, 'default', 'Created', 'App\\Models\\Sale', 12, 'App\\Models\\User', 2, '{\"date\":\"2021-06-14T00:00:00.000Z\",\"reference_no\":\"34\",\"customer_id\":6,\"biller_id\":10,\"stock_id\":5,\"total\":202120,\"sale_status\":\"active\",\"payment_status\":\"none\",\"due_date\":\"2021-06-14T00:00:00.000Z\",\"note\":\"Dicta tempore quia\",\"discount\":\"501\",\"product_tax\":\"482\",\"payment_term\":\"157\",\"total_items\":\"917\",\"pos\":\"805\",\"paid\":\"192\",\"user_id\":2,\"customer\":\"sijefyhuj@mailinator.com\",\"biller\":\"Nasser\",\"updated_at\":\"2021-06-14T17:19:07.000000Z\",\"created_at\":\"2021-06-14T17:19:07.000000Z\",\"id\":12}', '2021-06-14 17:19:07', '2021-06-14 17:19:07'),
(116, 'default', 'Created', 'App\\Models\\User', 12, 'App\\Models\\User', 2, '{\"first_name\":\"Tasha\",\"last_name\":\"Allen\",\"branch_id\":5,\"user_type\":\"\",\"position\":\"\",\"email\":\"qegufuj@mailinator.com\",\"phone\":\"0766241789\",\"address\":\"Lorem ex fugiat quod\",\"updated_at\":\"2021-06-14T17:26:14.000000Z\",\"created_at\":\"2021-06-14T17:26:14.000000Z\",\"id\":12}', '2021-06-14 17:26:14', '2021-06-14 17:26:14'),
(117, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:50', '2021-06-16 16:06:50'),
(118, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:51', '2021-06-16 16:06:51'),
(119, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:51', '2021-06-16 16:06:51'),
(120, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:51', '2021-06-16 16:06:51'),
(121, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:52', '2021-06-16 16:06:52'),
(122, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:52', '2021-06-16 16:06:52'),
(123, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:52', '2021-06-16 16:06:52'),
(124, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:52', '2021-06-16 16:06:52'),
(125, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:52', '2021-06-16 16:06:52'),
(126, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:53', '2021-06-16 16:06:53'),
(127, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:53', '2021-06-16 16:06:53'),
(128, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:53', '2021-06-16 16:06:53'),
(129, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:54', '2021-06-16 16:06:54'),
(130, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:54', '2021-06-16 16:06:54'),
(131, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:54', '2021-06-16 16:06:54'),
(132, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:54', '2021-06-16 16:06:54'),
(133, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:55', '2021-06-16 16:06:55'),
(134, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:55', '2021-06-16 16:06:55'),
(135, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:55', '2021-06-16 16:06:55'),
(136, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:55', '2021-06-16 16:06:55'),
(137, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:56', '2021-06-16 16:06:56'),
(138, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:56', '2021-06-16 16:06:56'),
(139, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:56', '2021-06-16 16:06:56'),
(140, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:56', '2021-06-16 16:06:56'),
(141, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:56', '2021-06-16 16:06:56'),
(142, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:57', '2021-06-16 16:06:57'),
(143, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:57', '2021-06-16 16:06:57'),
(144, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:57', '2021-06-16 16:06:57'),
(145, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:57', '2021-06-16 16:06:57'),
(146, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:58', '2021-06-16 16:06:58'),
(147, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:58', '2021-06-16 16:06:58'),
(148, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:58', '2021-06-16 16:06:58'),
(149, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:59', '2021-06-16 16:06:59'),
(150, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:59', '2021-06-16 16:06:59'),
(151, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:59', '2021-06-16 16:06:59'),
(152, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:06:59', '2021-06-16 16:06:59'),
(153, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:00', '2021-06-16 16:07:00'),
(154, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:00', '2021-06-16 16:07:00'),
(155, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:00', '2021-06-16 16:07:00'),
(156, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:00', '2021-06-16 16:07:00');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(157, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:01', '2021-06-16 16:07:01'),
(158, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:01', '2021-06-16 16:07:01'),
(159, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:01', '2021-06-16 16:07:01'),
(160, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:01', '2021-06-16 16:07:01'),
(161, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:02', '2021-06-16 16:07:02'),
(162, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:02', '2021-06-16 16:07:02'),
(163, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:02', '2021-06-16 16:07:02'),
(164, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:02', '2021-06-16 16:07:02'),
(165, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:03', '2021-06-16 16:07:03'),
(166, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:03', '2021-06-16 16:07:03'),
(167, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:03', '2021-06-16 16:07:03'),
(168, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:03', '2021-06-16 16:07:03'),
(169, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:04', '2021-06-16 16:07:04'),
(170, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:04', '2021-06-16 16:07:04'),
(171, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:04', '2021-06-16 16:07:04'),
(172, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:04', '2021-06-16 16:07:04'),
(173, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:04', '2021-06-16 16:07:04'),
(174, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:05', '2021-06-16 16:07:05'),
(175, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:07:05', '2021-06-16 16:07:05'),
(176, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-06-16 16:18:04', '2021-06-16 16:18:04'),
(177, 'default', 'Created', 'App\\Models\\Transfer', 2, 'App\\Models\\User', 2, '{\"source_stock\":5,\"target_stock\":5,\"approval_status\":\"Action!\",\"user_id\":2,\"amount\":302080,\"updated_at\":\"2021-06-16T16:18:44.000000Z\",\"created_at\":\"2021-06-16T16:18:44.000000Z\",\"id\":2}', '2021-06-16 16:18:44', '2021-06-16 16:18:44'),
(178, 'default', 'Deleted', 'App\\Models\\Branch', 7, 'App\\Models\\User', 2, '{\"id\":7,\"code\":\"kay_nicholson\",\"name\":\"Oscar Wooten\",\"address\":\"Zelda Glass\",\"created_at\":\"2021-05-31T12:08:46.000000Z\",\"updated_at\":\"2021-05-31T12:08:46.000000Z\"}', '2021-06-16 16:28:34', '2021-06-16 16:28:34'),
(191, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:29:28.000000Z\"}', '2021-06-16 16:29:28', '2021-06-16 16:29:28'),
(192, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:29:29.000000Z\"}', '2021-06-16 16:29:29', '2021-06-16 16:29:29'),
(193, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:29:30.000000Z\"}', '2021-06-16 16:29:30', '2021-06-16 16:29:30'),
(194, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:29:30.000000Z\"}', '2021-06-16 16:29:30', '2021-06-16 16:29:30'),
(195, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:29:31.000000Z\"}', '2021-06-16 16:29:31', '2021-06-16 16:29:31'),
(196, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:29:31.000000Z\"}', '2021-06-16 16:29:31', '2021-06-16 16:29:31'),
(197, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:29:32.000000Z\"}', '2021-06-16 16:29:32', '2021-06-16 16:29:32'),
(198, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:29:32.000000Z\"}', '2021-06-16 16:29:32', '2021-06-16 16:29:32'),
(199, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:29:33.000000Z\"}', '2021-06-16 16:29:33', '2021-06-16 16:29:33'),
(200, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:30:22.000000Z\"}', '2021-06-16 16:30:22', '2021-06-16 16:30:22'),
(201, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:30:23.000000Z\"}', '2021-06-16 16:30:23', '2021-06-16 16:30:23'),
(202, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:30:23.000000Z\"}', '2021-06-16 16:30:23', '2021-06-16 16:30:23'),
(203, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:30:24.000000Z\"}', '2021-06-16 16:30:24', '2021-06-16 16:30:24'),
(204, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:30:24.000000Z\"}', '2021-06-16 16:30:24', '2021-06-16 16:30:24'),
(205, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:30:25.000000Z\"}', '2021-06-16 16:30:25', '2021-06-16 16:30:25'),
(206, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:30:25.000000Z\"}', '2021-06-16 16:30:25', '2021-06-16 16:30:25'),
(207, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:30:26.000000Z\"}', '2021-06-16 16:30:26', '2021-06-16 16:30:26'),
(208, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:30:26.000000Z\"}', '2021-06-16 16:30:26', '2021-06-16 16:30:26'),
(209, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:30:27.000000Z\"}', '2021-06-16 16:30:27', '2021-06-16 16:30:27'),
(210, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:30:27.000000Z\"}', '2021-06-16 16:30:27', '2021-06-16 16:30:27'),
(211, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:30:28.000000Z\"}', '2021-06-16 16:30:28', '2021-06-16 16:30:28'),
(212, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:34:59.000000Z\"}', '2021-06-16 16:34:59', '2021-06-16 16:34:59'),
(213, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:34:59.000000Z\"}', '2021-06-16 16:34:59', '2021-06-16 16:34:59'),
(214, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:35:00.000000Z\"}', '2021-06-16 16:35:00', '2021-06-16 16:35:00'),
(215, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:35:00.000000Z\"}', '2021-06-16 16:35:00', '2021-06-16 16:35:00'),
(216, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:35:01.000000Z\"}', '2021-06-16 16:35:01', '2021-06-16 16:35:01'),
(217, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:35:01.000000Z\"}', '2021-06-16 16:35:01', '2021-06-16 16:35:01'),
(218, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:35:02.000000Z\"}', '2021-06-16 16:35:02', '2021-06-16 16:35:02'),
(219, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:35:02.000000Z\"}', '2021-06-16 16:35:02', '2021-06-16 16:35:02'),
(220, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:35:03.000000Z\"}', '2021-06-16 16:35:03', '2021-06-16 16:35:03'),
(221, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:36:01.000000Z\"}', '2021-06-16 16:36:01', '2021-06-16 16:36:01'),
(222, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:36:02.000000Z\"}', '2021-06-16 16:36:02', '2021-06-16 16:36:02'),
(223, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2021-06-16T16:36:02.000000Z\"}', '2021-06-16 16:36:03', '2021-06-16 16:36:03'),
(224, 'default', 'Deleted', 'App\\Models\\Transfer', 2, 'App\\Models\\User', 2, '{\"id\":2,\"source_stock\":5,\"target_stock\":5,\"amount\":\"302080.000\",\"approval_status\":\"Action!\",\"user_id\":2,\"created_at\":\"2021-06-16T16:18:44.000000Z\",\"updated_at\":\"2021-06-16T16:18:44.000000Z\"}', '2021-06-16 16:36:09', '2021-06-16 16:36:09'),
(225, 'default', 'Deleted', 'App\\Models\\Branch', 20, 'App\\Models\\User', 2, '{\"id\":20,\"code\":\"colt_compton\",\"name\":\"Karina White\",\"address\":\"Hyacinth Wheeler\",\"created_at\":\"2021-05-31T12:08:54.000000Z\",\"updated_at\":\"2021-05-31T12:08:54.000000Z\"}', '2021-06-16 16:36:15', '2021-06-16 16:36:15'),
(226, 'default', 'Deleted', 'App\\Models\\Branch', 21, 'App\\Models\\User', 2, '{\"id\":21,\"code\":\"diana_joyce\",\"name\":\"Jeanette Oneal\",\"address\":\"Alexandra Stephenson\",\"created_at\":\"2021-05-31T12:08:55.000000Z\",\"updated_at\":\"2021-05-31T12:08:55.000000Z\"}', '2021-06-16 16:36:17', '2021-06-16 16:36:17'),
(227, 'default', 'Deleted', 'App\\Models\\Branch', 22, 'App\\Models\\User', 2, '{\"id\":22,\"code\":\"hilary_sawyer\",\"name\":\"Ross Ballard\",\"address\":\"Yael Vargas\",\"created_at\":\"2021-05-31T12:08:55.000000Z\",\"updated_at\":\"2021-05-31T12:08:55.000000Z\"}', '2021-06-16 16:36:19', '2021-06-16 16:36:19'),
(228, 'default', 'Deleted', 'App\\Models\\Branch', 23, 'App\\Models\\User', 2, '{\"id\":23,\"code\":\"sara_mason\",\"name\":\"Acton Bauer\",\"address\":\"Kelly Christian\",\"created_at\":\"2021-05-31T12:08:56.000000Z\",\"updated_at\":\"2021-05-31T12:08:56.000000Z\"}', '2021-06-16 16:36:20', '2021-06-16 16:36:20'),
(229, 'default', 'Deleted', 'App\\Models\\Branch', 24, 'App\\Models\\User', 2, '{\"id\":24,\"code\":\"nolan_calderon\",\"name\":\"Nevada Robbins\",\"address\":\"Fulton Larson\",\"created_at\":\"2021-05-31T12:08:57.000000Z\",\"updated_at\":\"2021-05-31T12:08:57.000000Z\"}', '2021-06-16 16:36:21', '2021-06-16 16:36:21'),
(230, 'default', 'Deleted', 'App\\Models\\Branch', 25, 'App\\Models\\User', 2, '{\"id\":25,\"code\":\"isaiah_howard\",\"name\":\"Uma Holmes\",\"address\":\"Martin Gallagher\",\"created_at\":\"2021-05-31T12:08:57.000000Z\",\"updated_at\":\"2021-05-31T12:08:57.000000Z\"}', '2021-06-16 16:36:23', '2021-06-16 16:36:23'),
(231, 'default', 'Deleted', 'App\\Models\\Branch', 26, 'App\\Models\\User', 2, '{\"id\":26,\"code\":\"kevyn_mitchell\",\"name\":\"Yoshio Golden\",\"address\":\"Oleg Charles\",\"created_at\":\"2021-05-31T12:08:58.000000Z\",\"updated_at\":\"2021-05-31T12:08:58.000000Z\"}', '2021-06-16 16:37:10', '2021-06-16 16:37:10'),
(232, 'default', 'Deleted', 'App\\Models\\Branch', 27, 'App\\Models\\User', 2, '{\"id\":27,\"code\":\"aristotle_hammond\",\"name\":\"Fitzgerald Pennington\",\"address\":\"Jason Day\",\"created_at\":\"2021-05-31T12:08:59.000000Z\",\"updated_at\":\"2021-05-31T12:08:59.000000Z\"}', '2021-06-16 16:39:16', '2021-06-16 16:39:16'),
(233, 'default', 'Deleted', 'App\\Models\\Branch', 28, 'App\\Models\\User', 2, '{\"id\":28,\"code\":\"preston_blanchard\",\"name\":\"Melissa Hyde\",\"address\":\"Nomlanga Patton\",\"created_at\":\"2021-05-31T12:08:59.000000Z\",\"updated_at\":\"2021-05-31T12:08:59.000000Z\"}', '2021-06-16 16:39:18', '2021-06-16 16:39:18'),
(234, 'default', 'Deleted', 'App\\Models\\Branch', 29, 'App\\Models\\User', 2, '{\"id\":29,\"code\":\"dacey_lynch\",\"name\":\"Laura Frost\",\"address\":\"Willow Munoz\",\"created_at\":\"2021-05-31T12:09:00.000000Z\",\"updated_at\":\"2021-05-31T12:09:00.000000Z\"}', '2021-06-16 16:39:28', '2021-06-16 16:39:28'),
(235, 'default', 'Deleted', 'App\\Models\\Account', 5, 'App\\Models\\User', 2, '{\"id\":5,\"user_id\":2,\"account_user_id\":11,\"name\":\"Haley Morris\",\"status\":\"1\",\"description\":null,\"created_at\":\"2021-06-14T15:03:38.000000Z\",\"updated_at\":\"2021-06-14T15:03:38.000000Z\"}', '2021-06-16 16:39:51', '2021-06-16 16:39:51'),
(236, 'default', 'Created', 'App\\Models\\Account', 6, 'App\\Models\\User', 2, '{\"account_user_id\":11,\"name\":\"Todd Walls\",\"status\":true,\"user_id\":2,\"updated_at\":\"2021-06-16T16:40:04.000000Z\",\"created_at\":\"2021-06-16T16:40:04.000000Z\",\"id\":6}', '2021-06-16 16:40:04', '2021-06-16 16:40:04'),
(237, 'default', 'Created', 'App\\Models\\Account', 7, 'App\\Models\\User', 2, '{\"account_user_id\":11,\"name\":\"Colin Jimenez\",\"status\":true,\"user_id\":2,\"updated_at\":\"2021-06-16T16:40:07.000000Z\",\"created_at\":\"2021-06-16T16:40:07.000000Z\",\"id\":7}', '2021-06-16 16:40:07', '2021-06-16 16:40:07'),
(238, 'default', 'Created', 'App\\Models\\Account', 8, 'App\\Models\\User', 2, '{\"account_user_id\":12,\"name\":\"Ariana Gray\",\"status\":true,\"user_id\":2,\"updated_at\":\"2021-06-16T16:40:12.000000Z\",\"created_at\":\"2021-06-16T16:40:12.000000Z\",\"id\":8}', '2021-06-16 16:40:12', '2021-06-16 16:40:12'),
(239, 'default', 'Created', 'App\\Models\\Account', 9, 'App\\Models\\User', 2, '{\"account_user_id\":10,\"name\":\"Emerson Hansen\",\"status\":true,\"user_id\":2,\"updated_at\":\"2021-06-16T16:42:43.000000Z\",\"created_at\":\"2021-06-16T16:42:43.000000Z\",\"id\":9}', '2021-06-16 16:42:43', '2021-06-16 16:42:43'),
(240, 'default', 'Created', 'App\\Models\\Account', 10, 'App\\Models\\User', 2, '{\"account_user_id\":9,\"name\":\"Amaya Eaton\",\"status\":true,\"user_id\":2,\"updated_at\":\"2021-06-16T16:42:55.000000Z\",\"created_at\":\"2021-06-16T16:42:55.000000Z\",\"id\":10}', '2021-06-16 16:42:55', '2021-06-16 16:42:55'),
(241, 'default', 'Created', 'App\\Models\\Payment', 10, 'App\\Models\\User', 2, '{\"reference_no\":\"Ducimus qui volupta\",\"amount\":\"1\",\"paid_by\":\"Soluta rerum dolorem\",\"created_by\":\"Consequatur dolorum\",\"type\":\"In\",\"note\":\"Asperiores doloremqu\",\"approval_code\":\"Nesciunt aliqua Du\",\"sale_id\":12,\"purchase_id\":null,\"account_id\":3,\"user_id\":2,\"updated_at\":\"2021-06-16T16:43:16.000000Z\",\"created_at\":\"2021-06-16T16:43:16.000000Z\",\"id\":10}', '2021-06-16 16:43:16', '2021-06-16 16:43:16'),
(242, 'default', 'Created', 'App\\Models\\Transaction', 21, 'App\\Models\\User', 2, '{\"type\":\"payment\",\"type_id\":10,\"credit\":\"1\",\"debit\":0,\"account_id\":3,\"status\":\"In\",\"description\":\"---\",\"user_id\":2,\"updated_at\":\"2021-06-16T16:43:16.000000Z\",\"created_at\":\"2021-06-16T16:43:16.000000Z\",\"id\":21}', '2021-06-16 16:43:16', '2021-06-16 16:43:16'),
(244, 'default', 'Deleted', NULL, NULL, 'App\\Models\\User', 12, '[\"1\"]', '2021-06-16 18:01:23', '2021-06-16 18:01:23'),
(245, 'default', 'Created', 'App\\Models\\Customer', 19, 'App\\Models\\User', 2, '{\"name\":\"davu@mailinator.com\",\"email\":\"higaly@mailinator.com\",\"phone\":\"0777777777\",\"website\":\"bihyv@mailinator.com\",\"address\":\"teliququ@mailinator.com\",\"logo\":\"1623868099.jpeg\",\"user_id\":2,\"updated_at\":\"2021-06-16T18:28:19.000000Z\",\"created_at\":\"2021-06-16T18:28:19.000000Z\",\"id\":19}', '2021-06-16 18:28:19', '2021-06-16 18:28:19'),
(246, 'default', 'Created', 'App\\Models\\Customer', 20, 'App\\Models\\User', 2, '{\"name\":\"kidyz@mailinator.com\",\"email\":\"sivubev@mailinator.com\",\"phone\":\"0788888888\",\"website\":\"koco@mailinator.com\",\"address\":\"fibusaza@mailinator.com\",\"logo\":\"1623868220.jpeg\",\"user_id\":2,\"updated_at\":\"2021-06-16T18:30:20.000000Z\",\"created_at\":\"2021-06-16T18:30:20.000000Z\",\"id\":20}', '2021-06-16 18:30:21', '2021-06-16 18:30:21'),
(247, 'default', 'Created', 'App\\Models\\User', 15, 'App\\Models\\User', 2, '{\"email\":\"bupoqama@mailinator.com\",\"first_name\":\"nomerened@mailinator.com\",\"last_name\":\"nomerened@mailinator.com\",\"phone\":\"0799999999\",\"address\":\"nicumipoka@mailinator.com\",\"status\":\"Approved\",\"updated_at\":\"2021-06-16T18:31:31.000000Z\",\"created_at\":\"2021-06-16T18:31:31.000000Z\",\"id\":15,\"roles\":[{\"id\":3,\"name\":\"customer\",\"guard_name\":\"web\",\"created_at\":\"2021-06-09T11:48:28.000000Z\",\"updated_at\":\"2021-06-09T11:48:28.000000Z\",\"pivot\":{\"model_id\":15,\"role_id\":3,\"model_type\":\"App\\\\Models\\\\User\"}}]}', '2021-06-16 18:31:31', '2021-06-16 18:31:31'),
(248, 'default', 'Created', 'App\\Models\\Customer', 21, 'App\\Models\\User', 2, '{\"name\":\"nomerened@mailinator.com\",\"email\":\"bupoqama@mailinator.com\",\"phone\":\"0799999999\",\"website\":\"hyboc@mailinator.com\",\"address\":\"nicumipoka@mailinator.com\",\"logo\":\"1623868291.jpeg\",\"user_id\":2,\"updated_at\":\"2021-06-16T18:31:31.000000Z\",\"created_at\":\"2021-06-16T18:31:31.000000Z\",\"id\":21}', '2021-06-16 18:31:31', '2021-06-16 18:31:31'),
(249, 'default', 'Created', 'App\\Models\\Product', 148, 'App\\Models\\User', 2, '{\"code\":\"Lacey Banks\",\"name\":\"Caesar Hart\",\"unit\":\"Blaine Vang\",\"cost\":\"173\",\"price\":\"979\",\"image\":\"1623944237.jpeg\",\"category_id\":7,\"stock_id\":5,\"user_id\":2,\"quantity\":\"442\",\"barcode_symbology\":\"Malik Bradford\",\"product_details\":\"Ea in harum voluptas\",\"tax\":\"462\",\"type\":\"Amena Bates\",\"supplier\":\"Vance Buckley\",\"supplier_price\":\"366\",\"sale_unit\":\"Aristotle Hill\",\"purchase_unit\":\"Kylie Arnold\",\"brand\":\"Stone Walton\",\"featured\":\"Nero Barron\",\"updated_at\":\"2021-06-17T15:37:17.000000Z\",\"created_at\":\"2021-06-17T15:37:17.000000Z\",\"id\":148}', '2021-06-17 15:37:17', '2021-06-17 15:37:17'),
(252, 'default', 'Updated', 'App\\Models\\Sale', 11, 'App\\Models\\User', 2, '{\"id\":11,\"date\":\"2021-06-14T00:00:00.000Z\",\"reference_no\":\"590\",\"customer_id\":6,\"customer\":\"sijefyhuj@mailinator.com\",\"biller_id\":10,\"biller\":\"Nasser\",\"stock_id\":5,\"total\":664452,\"sale_status\":\"active\",\"payment_status\":\"none\",\"due_date\":\"2021-06-14T00:00:00.000Z\",\"note\":\"Hic proident in duc\",\"discount\":\"278.000\",\"product_tax\":\"453.000\",\"payment_term\":\"866\",\"total_items\":\"890\",\"pos\":\"803\",\"paid\":\"205\",\"user_id\":2,\"created_at\":\"2021-06-14T17:18:40.000000Z\",\"updated_at\":\"2021-06-19T12:53:42.000000Z\"}', '2021-06-19 12:53:42', '2021-06-19 12:53:42'),
(253, 'default', 'Deleted', 'App\\Models\\Branch', 30, 'App\\Models\\User', 2, '{\"id\":30,\"code\":\"josephine_black\",\"name\":\"Honorato Evans\",\"address\":\"Zenaida Foley\",\"created_at\":\"2021-05-31T12:09:01.000000Z\",\"updated_at\":\"2021-05-31T12:09:01.000000Z\"}', '2021-06-22 15:41:44', '2021-06-22 15:41:44'),
(254, 'default', 'Created', 'App\\Models\\FixPayment', 1, 'App\\Models\\User', 2, '{\"amount\":\"32\",\"receiver\":\"17-Oct-1999\",\"title\":\"Quod tempora volupta\",\"type\":\"Out\",\"note\":\"Quod tempora volupta\",\"approval_code\":\"18Nov2004\",\"account_id\":6,\"date\":\"2021-06-01T00:00:00.000Z\",\"user_id\":2,\"payment_status\":\"none\",\"updated_at\":\"2021-06-25T13:22:53.000000Z\",\"created_at\":\"2021-06-25T13:22:53.000000Z\",\"id\":1}', '2021-06-25 13:22:53', '2021-06-25 13:22:53'),
(255, 'default', 'Created', 'App\\Models\\Transaction', 46, 'App\\Models\\User', 2, '{\"type\":\"fixpayment\",\"type_id\":1,\"credit\":0,\"debit\":\"32\",\"account_id\":6,\"status\":\"Out\",\"description\":\"---\",\"user_id\":2,\"updated_at\":\"2021-06-25T13:22:53.000000Z\",\"created_at\":\"2021-06-25T13:22:53.000000Z\",\"id\":46}', '2021-06-25 13:22:53', '2021-06-25 13:22:53'),
(256, 'default', 'Created', 'App\\Models\\FixPayment', 2, 'App\\Models\\User', 2, '{\"amount\":\"90\",\"receiver\":\"11-Mar-2007\",\"title\":\"19-Sep-2008\",\"type\":\"In\",\"note\":\"Ratione tempor in hi\",\"approval_code\":\"22-Feb-2008\",\"account_id\":2,\"date\":\"2021-06-25T00:00:00.000Z\",\"user_id\":2,\"payment_status\":\"none\",\"updated_at\":\"2021-06-25T13:23:22.000000Z\",\"created_at\":\"2021-06-25T13:23:22.000000Z\",\"id\":2}', '2021-06-25 13:23:22', '2021-06-25 13:23:22'),
(257, 'default', 'Created', 'App\\Models\\Transaction', 47, 'App\\Models\\User', 2, '{\"type\":\"fixpayment\",\"type_id\":2,\"credit\":\"90\",\"debit\":0,\"account_id\":2,\"status\":\"In\",\"description\":\"---\",\"user_id\":2,\"updated_at\":\"2021-06-25T13:23:22.000000Z\",\"created_at\":\"2021-06-25T13:23:22.000000Z\",\"id\":47}', '2021-06-25 13:23:22', '2021-06-25 13:23:22'),
(258, 'default', 'Deleted', 'App\\Models\\FixPayment', 2, 'App\\Models\\User', 2, '{\"id\":2,\"title\":\"19-Sep-2008\",\"amount\":\"90.000\",\"receiver\":\"11-Mar-2007\",\"account_id\":2,\"date\":\"2021-06-25T00:00:00.000Z\",\"payment_status\":\"none\",\"type\":\"In\",\"approval_code\":\"22-Feb-2008\",\"note\":\"Ratione tempor in hi\",\"user_id\":2,\"created_at\":\"2021-06-25T13:23:22.000000Z\",\"updated_at\":\"2021-06-25T13:23:22.000000Z\"}', '2021-06-25 13:49:23', '2021-06-25 13:49:23'),
(259, 'default', 'Updated', 'App\\Models\\Product', 7, 'App\\Models\\User', 2, '{\"id\":7,\"code\":\"Oprah Barr23\",\"name\":\"Christine Pennington\",\"unit\":\"Laura Payne\",\"cost\":\"694.000\",\"price\":\"223.000\",\"image\":\"1623430532.png\",\"category_id\":1,\"quantity\":152,\"stock\":null,\"stock_id\":4,\"barcode_symbology\":\"Colette Head\",\"product_details\":\"Sunt aut aut eum et\",\"tax\":\"553.000\",\"type\":\"Chantale Hunt\",\"supplier\":\"Yuri Knight\",\"supplier_price\":\"376\",\"sale_unit\":\"Jessamine Stewart\",\"purchase_unit\":\"Julie Dodson\",\"brand\":\"Kirestin Huber\",\"featured\":\"Laith Long\",\"user_id\":2,\"created_at\":\"2021-06-11T12:25:32.000000Z\",\"updated_at\":\"2021-06-25T13:49:39.000000Z\"}', '2021-06-25 13:49:39', '2021-06-25 13:49:39'),
(260, 'default', 'Deleted', 'App\\Models\\Branch', 31, 'App\\Models\\User', 2, '{\"id\":31,\"code\":\"mohammad_richards\",\"name\":\"Slade Rodgers\",\"address\":\"Emi Carroll\",\"created_at\":\"2021-05-31T12:09:02.000000Z\",\"updated_at\":\"2021-05-31T12:09:02.000000Z\"}', '2021-06-25 13:50:02', '2021-06-25 13:50:02'),
(261, 'default', 'Deleted', 'App\\Models\\Branch', 32, 'App\\Models\\User', 2, '{\"id\":32,\"code\":\"deborah_forbes\",\"name\":\"Cecilia Bowers\",\"address\":\"Hector Bird\",\"created_at\":\"2021-05-31T12:09:02.000000Z\",\"updated_at\":\"2021-05-31T12:09:02.000000Z\"}', '2021-06-25 14:15:07', '2021-06-25 14:15:07'),
(262, 'default', 'Deleted', 'App\\Models\\Branch', 33, 'App\\Models\\User', 2, '{\"id\":33,\"code\":\"palmer_stewart\",\"name\":\"Caesar Wheeler\",\"address\":\"Norman Holt\",\"created_at\":\"2021-05-31T12:09:03.000000Z\",\"updated_at\":\"2021-05-31T12:09:03.000000Z\"}', '2021-06-25 14:15:10', '2021-06-25 14:15:10'),
(263, 'default', 'Deleted', 'App\\Models\\Branch', 34, 'App\\Models\\User', 2, '{\"id\":34,\"code\":\"garth_shaffer\",\"name\":\"Whitney Bentley\",\"address\":\"Iona Cervantes\",\"created_at\":\"2021-05-31T12:09:03.000000Z\",\"updated_at\":\"2021-05-31T12:09:03.000000Z\"}', '2021-06-25 14:15:14', '2021-06-25 14:15:14'),
(264, 'default', 'Deleted', 'App\\Models\\Branch', 35, 'App\\Models\\User', 2, '{\"id\":35,\"code\":\"elton_sanders\",\"name\":\"Rebecca Caldwell\",\"address\":\"Dylan Castaneda\",\"created_at\":\"2021-05-31T12:09:04.000000Z\",\"updated_at\":\"2021-05-31T12:09:04.000000Z\"}', '2021-06-25 14:41:57', '2021-06-25 14:41:57'),
(265, 'default', 'Created', 'App\\Models\\Branch', 89, 'App\\Models\\User', 2, '{\"code\":\"asldfk\",\"name\":\"Cain Riggs\",\"address\":\"Rebeccsadfalsk\",\"updated_at\":\"2021-06-25T15:26:35.000000Z\",\"created_at\":\"2021-06-25T15:26:35.000000Z\",\"id\":89}', '2021-06-25 15:26:35', '2021-06-25 15:26:35'),
(266, 'default', 'Updated', 'App\\Models\\Branch', 1, 'App\\Models\\User', 2, '{\"address\":\"herat main street\",\"updated_at\":\"2021-06-25 19:57:37\"}', '2021-06-25 15:27:37', '2021-06-25 15:27:37'),
(269, 'default', 'Updated', 'App\\Models\\Product', 7, 'App\\Models\\User', 2, '{\"id\":7,\"code\":\"Oprah Barr23\",\"name\":\"Christine Pennington\",\"unit\":\"Laura Payne\",\"cost\":\"694.000\",\"price\":\"223.000\",\"image\":\"1624635016.jpeg\",\"category_id\":1,\"quantity\":152,\"stock\":null,\"stock_id\":4,\"barcode_symbology\":\"Colette Head\",\"product_details\":\"Sunt aut aut eum et\",\"tax\":\"553.000\",\"type\":\"Chantale Hunt\",\"supplier\":\"Yuri Knight\",\"supplier_price\":\"376\",\"sale_unit\":\"Jessamine Stewart\",\"purchase_unit\":\"Julie Dodson\",\"brand\":\"Kirestin Huber\",\"featured\":\"Laith Long\",\"user_id\":2,\"created_at\":\"2021-06-11T12:25:32.000000Z\",\"updated_at\":\"2021-06-25T15:30:16.000000Z\"}', '2021-06-25 15:30:16', '2021-06-25 15:30:16'),
(270, 'default', 'Updated', 'App\\Models\\Product', 7, 'App\\Models\\User', 2, '{\"id\":7,\"code\":\"Oprah Barr23\",\"name\":\"Christine Pennington\",\"unit\":\"Laura Payne\",\"cost\":\"694.000\",\"price\":\"223.000\",\"image\":\"1624635016.jpeg\",\"category_id\":1,\"quantity\":152,\"stock\":null,\"stock_id\":4,\"barcode_symbology\":\"Colette Head\",\"product_details\":\"Sunt aut aut eum et\",\"tax\":\"553.000\",\"type\":\"Chantale Hunt\",\"supplier\":\"Yuri Knight\",\"supplier_price\":\"376\",\"sale_unit\":\"Jessamine Stewart\",\"purchase_unit\":\"Julie Dodson\",\"brand\":\"Kirestin Huber\",\"featured\":\"Laith Long\",\"user_id\":2,\"created_at\":\"2021-06-11T12:25:32.000000Z\",\"updated_at\":\"2021-06-25T15:30:16.000000Z\"}', '2021-06-25 15:30:27', '2021-06-25 15:30:27'),
(271, 'default', 'Updated', 'App\\Models\\Product', 7, 'App\\Models\\User', 2, '{\"id\":7,\"code\":\"Oprah Barr23\",\"name\":\"Christine Pennington\",\"unit\":\"Laura Payne\",\"cost\":\"694.000\",\"price\":\"223.000\",\"image\":\"1624635016.jpeg\",\"category_id\":1,\"quantity\":152,\"stock\":null,\"stock_id\":4,\"barcode_symbology\":\"Colette Head\",\"product_details\":\"Sunt aut aut eum et\",\"tax\":\"553.000\",\"type\":\"Chantale Hunt\",\"supplier\":\"Yuri Knight\",\"supplier_price\":\"376\",\"sale_unit\":\"Jessamine Stewart\",\"purchase_unit\":\"Julie Dodson\",\"brand\":\"Kirestin Huber\",\"featured\":\"Laith Long\",\"user_id\":2,\"created_at\":\"2021-06-11T12:25:32.000000Z\",\"updated_at\":\"2021-06-25T15:30:16.000000Z\"}', '2021-06-25 15:31:26', '2021-06-25 15:31:26'),
(272, 'default', 'Updated', 'App\\Models\\Product', 7, 'App\\Models\\User', 2, '{\"id\":7,\"code\":\"Oprah Barr23\",\"name\":\"Christine Pennington\",\"unit\":\"Laura Payne\",\"cost\":\"694.000\",\"price\":\"223.000\",\"image\":\"1624635097.jpeg\",\"category_id\":1,\"quantity\":152,\"stock\":null,\"stock_id\":4,\"barcode_symbology\":\"Colette Head\",\"product_details\":\"Sunt aut aut eum et\",\"tax\":\"553.000\",\"type\":\"Chantale Hunt\",\"supplier\":\"Yuri Knight\",\"supplier_price\":\"376\",\"sale_unit\":\"Jessamine Stewart\",\"purchase_unit\":\"Julie Dodson\",\"brand\":\"Kirestin Huber\",\"featured\":\"Laith Long\",\"user_id\":2,\"created_at\":\"2021-06-11T12:25:32.000000Z\",\"updated_at\":\"2021-06-25T15:31:37.000000Z\"}', '2021-06-25 15:31:37', '2021-06-25 15:31:37'),
(273, 'default', 'Updated', 'App\\Models\\Product', 7, 'App\\Models\\User', 2, '{\"id\":7,\"code\":\"Oprah Barr23\",\"name\":\"Christine Pennington\",\"unit\":\"Laura Payne\",\"cost\":\"694.000\",\"price\":\"223.000\",\"image\":\"1624635097.jpeg\",\"category_id\":1,\"quantity\":152,\"stock\":null,\"stock_id\":4,\"barcode_symbology\":\"Colette Head\",\"product_details\":\"Sunt aut aut eum et\",\"tax\":\"553.000\",\"type\":\"Chantale Hunt\",\"supplier\":\"Yuri Knight\",\"supplier_price\":\"376\",\"sale_unit\":\"Jessamine Stewart\",\"purchase_unit\":\"Julie Dodson\",\"brand\":\"Kirestin Huber\",\"featured\":\"Laith Long\",\"user_id\":2,\"created_at\":\"2021-06-11T12:25:32.000000Z\",\"updated_at\":\"2021-06-25T15:31:37.000000Z\"}', '2021-06-25 15:32:45', '2021-06-25 15:32:45'),
(274, 'default', 'Updated', 'App\\Models\\Product', 7, 'App\\Models\\User', 2, '{\"id\":7,\"code\":\"Oprah Barr23\",\"name\":\"Christine Pennington\",\"unit\":\"Laura Payne\",\"cost\":\"694.000\",\"price\":\"223.000\",\"image\":\"1624635183.jpeg\",\"category_id\":1,\"quantity\":152,\"stock\":null,\"stock_id\":4,\"barcode_symbology\":\"Colette Head\",\"product_details\":\"Sunt aut aut eum et\",\"tax\":\"553.000\",\"type\":\"Chantale Hunt\",\"supplier\":\"Yuri Knight\",\"supplier_price\":\"376\",\"sale_unit\":\"Jessamine Stewart\",\"purchase_unit\":\"Julie Dodson\",\"brand\":\"Kirestin Huber\",\"featured\":\"Laith Long\",\"user_id\":2,\"created_at\":\"2021-06-11T12:25:32.000000Z\",\"updated_at\":\"2021-06-25T15:33:03.000000Z\"}', '2021-06-25 15:33:03', '2021-06-25 15:33:03'),
(275, 'default', 'Created', 'App\\Models\\User', 16, 'App\\Models\\User', 2, '{\"first_name\":\"Nasser\",\"last_name\":\"Karimi\",\"branch_id\":2,\"user_type\":\"\",\"position\":\"\",\"email\":\"siteadmin12@gmail.com\",\"phone\":\"0766241789\",\"address\":\"Jamal Qazna Alley, left hand side, 3rd greed door\",\"updated_at\":\"2021-07-19T07:27:40.000000Z\",\"created_at\":\"2021-07-19T07:27:40.000000Z\",\"id\":16}', '2021-07-19 07:27:40', '2021-07-19 07:27:40'),
(276, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-07-19 07:37:47', '2021-07-19 07:37:47'),
(277, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-07-19 07:37:59', '2021-07-19 07:37:59'),
(278, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-07-19 07:39:28', '2021-07-19 07:39:28'),
(279, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-07-19 07:39:36', '2021-07-19 07:39:36'),
(280, 'default', 'Updated', 'App\\Models\\User', 9, 'App\\Models\\User', 2, '{\"id\":9,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"123456789\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"n.kawerimi@gmail.com\",\"phone\":\"072044920\",\"address\":\"9170 N. Beacon Rd\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T03:50:21.000000Z\",\"updated_at\":\"2021-06-10T13:21:20.000000Z\",\"status\":\"Approved\"}', '2021-07-19 07:40:36', '2021-07-19 07:40:36'),
(281, 'default', 'Updated', 'App\\Models\\User', 10, 'App\\Models\\User', 2, '{\"id\":10,\"branch_id\":2,\"first_name\":\"Nasser\",\"last_name\":\"Karimi\",\"user_type\":\"3\",\"position\":\"\",\"email\":\"karimi@gmail.com\",\"phone\":\"07440462278\",\"address\":\"Kabul, Afghanistan\",\"image\":null,\"deleted_at\":null,\"created_at\":\"2021-03-12T04:58:31.000000Z\",\"updated_at\":\"2021-06-10T13:21:10.000000Z\",\"status\":\"Approved\"}', '2022-02-23 10:15:36', '2022-02-23 10:15:36'),
(282, 'default', 'Updated', 'App\\Models\\Branch', 3, 'App\\Models\\User', 2, '{\"code\":\"7126765376776\",\"name\":\"Jalal Abad\",\"updated_at\":\"2022-03-05 11:49:10\"}', '2022-03-05 07:19:10', '2022-03-05 07:19:10'),
(283, 'default', 'Deleted', 'App\\Models\\Branch', 4, 'App\\Models\\User', 2, '{\"id\":4,\"code\":\"Recusandae Enim dol\",\"name\":\"Nero Davis\",\"address\":\"Voluptatem lorem ape\",\"created_at\":\"2021-03-14T03:20:15.000000Z\",\"updated_at\":\"2021-03-14T03:20:15.000000Z\"}', '2022-03-05 07:19:23', '2022-03-05 07:19:23'),
(284, 'default', 'Updated', 'App\\Models\\Transfer', 1, 'App\\Models\\User', 2, '{\"id\":1,\"source_stock\":4,\"target_stock\":4,\"amount\":259700,\"approval_status\":\"Approved\",\"user_id\":2,\"created_at\":\"2021-06-12T13:29:59.000000Z\",\"updated_at\":\"2022-03-21T14:33:32.000000Z\"}', '2022-03-21 14:33:32', '2022-03-21 14:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `code`, `name`, `address`, `created_at`, `updated_at`) VALUES
(1, 'HERAT-0012', 'Herat', 'herat main street', NULL, '2021-06-25 15:27:37'),
(2, 'KABUL-0012', 'Kabul', 'Kabul, Afghanistan', NULL, '2021-06-06 14:11:32'),
(3, '7126765376776', 'Jalal Abad', 'Ea dicta eum assumen', '2021-03-14 03:16:52', '2022-03-05 07:19:10'),
(5, 'deirdre_odom', 'Sheila Wall done 155', 'Jesse Sweet', '2021-05-31 12:08:43', '2021-06-08 11:03:49'),
(6, 'rina_knowles', 'Amethyst Powell', 'Francesca Reynolds', '2021-05-31 12:08:45', '2021-06-14 15:02:53'),
(8, 'brent_clements', 'Nicole Floyd', 'Nero Burch', '2021-05-31 12:08:47', '2021-05-31 12:08:47'),
(13, 'dana_armstrong', 'Joel Kerr', 'Phyllis Frye', '2021-05-31 12:08:51', '2021-06-08 11:37:45'),
(19, 'vincent_nguyen', 'Vanna Boone', 'Leo Whitfield', '2021-05-31 12:08:54', '2021-05-31 12:08:54'),
(36, 'dahlia_avila', 'Jack Mcclain', 'Benjamin Vang', '2021-05-31 12:09:04', '2021-05-31 12:09:04'),
(37, 'leila_moody', 'Claudia Maynard', 'Ashely Dotson', '2021-05-31 12:09:04', '2021-05-31 12:09:04'),
(38, 'rashad_bolton', 'Nita Booker', 'Thor Pruitt', '2021-05-31 12:09:05', '2021-05-31 12:09:05'),
(39, 'forrest_kaufman', 'Ria Glass', 'Dean Anderson', '2021-05-31 12:09:05', '2021-05-31 12:09:05'),
(40, 'eugenia_padilla', 'Adena Stephenson', 'Hadassah Mcmahon', '2021-05-31 12:09:06', '2021-05-31 12:09:06'),
(41, 'bradley_aguirre', 'Vivien Carlson', 'Selma Nelson', '2021-05-31 12:09:08', '2021-05-31 12:09:08'),
(42, 'angela_zimmerman', 'Brady Sherman', 'Carissa Hodges', '2021-05-31 12:09:08', '2021-05-31 12:09:08'),
(43, 'tiger_walton', 'Hiroko Norton', 'Darius Pacheco', '2021-05-31 12:09:09', '2021-05-31 12:09:09'),
(44, 'zena_mercado', 'Clark Meyer', 'Indigo Moses', '2021-05-31 12:09:09', '2021-05-31 12:09:09'),
(45, 'keith_flowers', 'Boris Kerr', 'Fritz Sloan', '2021-05-31 12:09:10', '2021-05-31 12:09:10'),
(46, 'sierra_nelson', 'Sarah Wong', 'Levi Hall', '2021-05-31 12:09:10', '2021-05-31 12:09:10'),
(47, 'isaiah_eaton', 'Miranda Zamora', 'Maisie Harrison', '2021-05-31 12:09:10', '2021-05-31 12:09:10'),
(48, 'christopher_morrow', 'Olivia Jordan', 'Barbara Kline', '2021-05-31 12:09:11', '2021-05-31 12:09:11'),
(49, 'chancellor_tate', 'Aurelia Little', 'Elton Mccormick', '2021-05-31 12:09:11', '2021-05-31 12:09:11'),
(50, 'salvador_wilkerson', 'Maxine Carney', 'Jada Harmon', '2021-05-31 12:09:12', '2021-05-31 12:09:12'),
(51, 'cole_powell', 'Daniel Munoz', 'Xenos Williamson', '2021-05-31 12:09:12', '2021-05-31 12:09:12'),
(52, 'rebecca_richardson', 'Minerva Fletcher', 'Lesley Francis', '2021-05-31 12:09:12', '2021-05-31 12:09:12'),
(53, 'kiayada_anderson', 'Matthew Owens', 'Clio Barber', '2021-05-31 12:09:13', '2021-05-31 12:09:13'),
(54, 'dacey_bryant', 'Justin Glass', 'Amery Olsen', '2021-05-31 12:09:13', '2021-05-31 12:09:13'),
(55, 'eliana_wooten', 'Meredith Shelton', 'Colby Clark', '2021-05-31 12:09:14', '2021-05-31 12:09:14'),
(56, 'michelle_harrison', 'Alfreda Mack', 'Iliana Horn', '2021-05-31 12:09:15', '2021-05-31 12:09:15'),
(57, 'lareina_gentry', 'Jameson Cummings', 'Thane Sutton', '2021-05-31 12:09:16', '2021-05-31 12:09:16'),
(58, 'burke_anthony', 'Nero Sanford', 'Lenore Valentine', '2021-05-31 12:09:16', '2021-05-31 12:09:16'),
(59, 'sophia_fernandez', 'Driscoll Casey', 'Kiayada Curtis', '2021-05-31 12:09:17', '2021-05-31 12:09:17'),
(60, 'francesca_smith', 'Ethan Foreman', 'Jacob Thompson', '2021-05-31 12:09:18', '2021-05-31 12:09:18'),
(61, 'asdfsfa', 'asdfasfda', 'alskfj', '2021-06-01 12:25:11', '2021-06-01 12:25:11'),
(62, 'brent_bryan', 'Benjamin Weiss', 'Violet Orr', '2021-06-06 11:25:19', '2021-06-06 11:25:19'),
(63, 'herat_center', 'Herat Center', '7463 Wild Rose Street', '2021-06-06 11:54:44', '2021-06-06 11:54:44'),
(64, 'nehru_carroll', 'Natalie Schmidt', 'Chandler Fuentes', '2021-06-07 10:26:47', '2021-06-07 10:26:47'),
(65, 'samuel_marsh', 'Reece Pruitt', 'Nash Jacobson', '2021-06-08 11:15:49', '2021-06-08 11:15:49'),
(66, 'quamar_allen', 'Janna Kaufman', 'Madaline James', '2021-06-08 11:38:29', '2021-06-08 11:38:29'),
(67, 'price_terrell', 'Amery Campos', 'Austin Wilkinson', '2021-06-08 12:45:55', '2021-06-08 12:45:55'),
(68, 'garrison_orr', 'Sloane Armstrong', 'Cyrus Kelley', '2021-06-08 13:12:58', '2021-06-08 13:12:58'),
(69, 'matthew_roberts', 'Baxter Ballard', 'Jeanette Richardson', '2021-06-08 13:29:38', '2021-06-08 13:29:38'),
(70, 'hanae_berger', 'Macon Evans', 'Maxine Sanchez', '2021-06-08 13:29:46', '2021-06-08 13:29:46'),
(71, 'hanae_berger9', 'Deacon Schultz', 'Jessamine Parrish', '2021-06-08 13:31:09', '2021-06-08 13:31:09'),
(72, 'lskdfjlk_skladfjkj_', 'aslkdflk', 'kjsdafh afghanas', '2021-06-08 13:33:28', '2021-06-08 13:33:28'),
(73, 'norman_sweet', 'Doris Mcpherson', 'Amery Washington', '2021-06-14 14:59:17', '2021-06-14 14:59:17'),
(74, 'darrel_chaney', 'Neil Garrison', 'Remedios Barker', '2021-06-14 14:59:21', '2021-06-14 14:59:21'),
(75, 'nina_burks', 'Walker Cline', 'Pascale Henson', '2021-06-14 15:00:06', '2021-06-14 15:00:06'),
(76, 'magee_morrison', 'Quincy Coffey', 'Josiah Velasquez', '2021-06-14 15:00:22', '2021-06-14 15:00:22'),
(77, 'sacha_fisher', 'Shannon Snider', 'Quinlan Wooten', '2021-06-14 15:00:50', '2021-06-14 15:00:50'),
(84, 'roanna_eaton', 'Carly Hendricks', 'Breanna May', '2021-06-14 15:07:54', '2021-06-14 15:07:54'),
(85, 'nero_wade', 'Omar Owen', 'Mark Henderson', '2021-06-14 15:08:20', '2021-06-14 15:08:20'),
(89, 'asldfk', 'Cain Riggs', 'Rebeccsadfalsk', '2021-06-25 15:26:35', '2021-06-25 15:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Daipar', 'd12', 2, '2021-03-16 00:53:38', '2021-03-16 04:49:55'),
(2, 'Category', 'flsfdksnmmm99', 2, '2021-03-16 00:54:57', '2021-03-16 01:34:15'),
(7, 'Zenia Young', 'Hadassah Colon', 2, '2021-06-14 17:16:20', '2021-06-14 17:16:20'),
(10, 'Bo Nguyen', 'Janna Cole', 2, '2021-06-14 17:17:04', '2021-06-14 17:17:04');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `website`, `address`, `logo`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Nasser\'s Tasks', 'adadfj@gmail.com', '2309090', 'salfjo', NULL, NULL, 2, '2021-03-23 01:46:26', '2021-03-23 01:46:26'),
(2, 'Customer 23`', 'c12@gmail.com', '98798239872', 'lsdfj2392039', 'lsdfjalkfs', '1622477204.jpeg', 12, '2021-03-23 01:49:33', '2021-05-31 11:36:44'),
(3, 'duletazec', 'vopyfadufy@mailinator.com', '9285729384', 'wafuzij@mailinator.com', 'lyhe@mailinator.com', '1622477082.jpeg', 10, '2021-03-23 02:28:48', '2021-05-31 11:34:42'),
(5, 'lekiqojy@mailinator.com', 'mugomate@mailinator.com', '091234329847982342', 'bexacokic@mailinator.com', 'jipyho@mailinator.com', NULL, 2, '2021-06-07 08:55:27', '2021-06-07 08:55:27'),
(6, 'sijefyhuj@mailinator.com', 'vyfacaves@mailinator.com', '0766241789', 'tytupoguk@mailinator.com', 'dixujageri@mailinator.com', NULL, 10, '2021-06-07 08:59:50', '2021-06-07 08:59:50'),
(7, 'Current', 'nasseralikarimi@gmail.com', '0766241789', 'jifepogyga@mailinator.com', 'Jamal Qazna Alley, left hand side, 3rd greed door', '1623077252.jpeg', 12, '2021-06-07 09:06:29', '2021-06-07 10:17:32'),
(8, 'Current', 'nasseralikarimi45@gmail.com', '0766241789', 'manidehyj@mailinator.com', 'Jamal Qazna Alley, left hand side, 3rd greed door', NULL, 14, '2021-06-07 10:18:30', '2021-06-07 10:18:30'),
(9, 'hyhuqe@mailinator.com', 'luwygo@mailinator.com', '0744876876', 'kilaweqil@mailinator.com', 'fohodobati@mailinator.com', '1623077336.jpeg', 12, '2021-06-07 10:18:56', '2021-06-07 10:18:56'),
(10, 'cegihug@mailinator.com', 'jeza@mailinator.com', '0766241789', 'syvozyvop@mailinator.com', 'gupadu@mailinator.com', '1623078263.jpeg', 2, '2021-06-07 10:34:23', '2021-06-07 10:34:23'),
(11, 'z', 'minyri@mailinator', '0766241789', 'nezi@mailinator.com', 'nites@mailinator.com', '1623083288.jpeg', 14, '2021-06-07 11:58:08', '2021-06-07 11:58:08'),
(12, 'lybohyzaka@mailinator.com', 'jytalyw@mailinator.com', '0766241789', 'xofoxoj@mailinator.com', 'syrokik@mailinator.com', '1623084694.jpeg', 10, '2021-06-07 12:21:34', '2021-06-07 12:21:34'),
(13, 'lybohyzaka@mailinator.com', 'jytalyw@m9ailinator.com', '0766241789', 'xofoxoj@mailinator.com', 'syrokik@mailinator.com', '1623084707.jpeg', 2, '2021-06-07 12:21:47', '2021-06-07 12:21:47'),
(14, 'xexedyz@mailinator.com', 'buheh@mailinator.com', '0765432176', 'mixu@mailinator.com', 'nuqowipi@mailinator.com', '1623084798.jpeg', 2, '2021-06-07 12:23:18', '2021-06-07 12:23:18'),
(16, 'vatopo@mailinator.com', 'fasyvifa@mailinator.com', '0766241789', 'novitacosa@mailinator.com', 'rapoticici@mailinator.com', '1623084978.jpeg', 2, '2021-06-07 12:26:18', '2021-06-07 12:26:18'),
(18, 'ziqys@mailinator.com', 'lofasoqyzo@mailinator.com', '0767642567', 'muzanykib@mailinator.com', 'hypibuh@mailinator.com', '1623174227.jpeg', 10, '2021-06-08 13:13:47', '2021-06-08 13:13:47'),
(19, 'davu@mailinator.com', 'higaly@mailinator.com', '0777777777', 'bihyv@mailinator.com', 'teliququ@mailinator.com', '1623868099.jpeg', 10, '2021-06-16 18:28:19', '2021-06-16 18:28:19'),
(20, 'kidyz@mailinator.com', 'sivubev@mailinator.com', '0788888888', 'koco@mailinator.com', 'fibusaza@mailinator.com', '1623868220.jpeg', 2, '2021-06-16 18:30:20', '2021-06-16 18:30:20'),
(21, 'nomerened@mailinator.com', 'bupoqama@mailinator.com', '0799999999', 'hyboc@mailinator.com', 'nicumipoka@mailinator.com', '1623868291.jpeg', 10, '2021-06-16 18:31:31', '2021-06-16 18:31:31');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fix_payments`
--

CREATE TABLE `fix_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `receiver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approval_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fix_payments`
--

INSERT INTO `fix_payments` (`id`, `title`, `amount`, `receiver`, `account_id`, `date`, `payment_status`, `type`, `approval_code`, `note`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Quod tempora volupta', '32.000', '17-Oct-1999', 6, '2021-06-01T00:00:00.000Z', 'none', 'Out', '18Nov2004', 'Quod tempora volupta', 2, '2021-06-25 13:22:53', '2021-06-25 13:22:53');

-- --------------------------------------------------------

--
-- Table structure for table `fix_purchases`
--

CREATE TABLE `fix_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ammount` decimal(10,3) NOT NULL,
  `receiver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approval_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_records`
--

CREATE TABLE `item_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `increment` decimal(8,2) NOT NULL,
  `decrement` decimal(8,2) NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `stock_id` bigint(20) UNSIGNED NOT NULL,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_records`
--

INSERT INTO `item_records` (`id`, `type_id`, `type`, `unit`, `increment`, `decrement`, `unit_price`, `total_price`, `stock_id`, `item`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 13, 'purchase', 'sakdjf', '98.00', '0.00', '8.00', '784.00', 4, 'akjhf', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2001_03_02_141919_create_branches_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2019_13_18_000001_create_users_table', 1),
(9, '2021_03_02_140000_create_accounts_table', 1),
(11, '2021_03_02_142015_create_categories_table', 1),
(12, '2021_03_02_142033_create_customers_table', 1),
(13, '2021_03_02_142049_create_vendors_table', 1),
(14, '2021_03_02_142228_create_stocks_table', 1),
(15, '2021_03_02_142300_create_products_table', 1),
(17, '2021_03_02_142313_create_sales_table', 1),
(18, '2021_03_02_142326_create_purchases_table', 1),
(19, '2021_03_02_142421_create_payments_table', 1),
(22, '2021_03_02_142529_create_transactions_table', 1),
(23, '2021_03_11_140548_create_tests_table', 1),
(27, '2021_03_02_142301_create_stock_records_table', 2),
(28, '2021_03_02_142435_create_fix_purchases_table', 3),
(31, '2021_06_08_141757_create_activity_log_table', 6),
(35, '2021_03_02_141708_create_permission_tables', 7),
(36, '2021_03_02_142435_create_fix_payments_table', 8),
(37, '2021_03_02_142513_create_transfers_table', 9),
(41, '2021_07_02_142301_create_item_records_table', 10),
(47, '2021_07_03_142301_create_notifs_table', 11),
(49, '2021_03_02_142314_create_orders_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 14),
(3, 'App\\Models\\User', 15);

-- --------------------------------------------------------

--
-- Table structure for table `notifs`
--

CREATE TABLE `notifs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'primary',
  `msg` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifs`
--

INSERT INTO `notifs` (`id`, `type`, `type_id`, `action`, `color`, `msg`, `status`, `user_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'branch', 86, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-14 16:09:36', NULL),
(2, 'branch', 15, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-14 16:16:48', NULL),
(3, 'branch', 16, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-14 16:16:50', NULL),
(4, 'branch', 17, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-14 16:16:52', NULL),
(5, 'branch', 18, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-14 16:16:54', NULL),
(6, 'category', 7, 'Creation', 'success', 'A new category had been created in the system!', 'read', 2, 2, '2021-06-14 17:16:20', NULL),
(7, 'category', 8, 'Creation', 'success', 'A new category had been created in the system!', 'read', 2, 2, '2021-06-14 17:17:02', NULL),
(8, 'category', 9, 'Creation', 'success', 'A new category had been created in the system!', 'read', 2, 2, '2021-06-14 17:17:03', NULL),
(9, 'category', 10, 'Creation', 'success', 'A new category had been created in the system!', 'read', 2, 2, '2021-06-14 17:17:04', NULL),
(10, 'category', 9, 'Deletion', 'danger', 'A category removed from system!', 'read', 2, 2, '2021-06-14 17:17:08', NULL),
(11, 'category', 8, 'Deletion', 'danger', 'A category removed from system!', 'read', 2, 2, '2021-06-14 17:17:13', NULL),
(12, 'category', 10, 'Modification', 'warning', 'A category had been updated in the system!', 'read', 2, 2, '2021-06-14 17:17:30', NULL),
(13, 'stock', 5, 'Creation', 'success', 'A new stock had been created in the system!', 'read', 2, 2, '2021-06-14 17:17:48', NULL),
(14, 'product', 147, 'Creation', 'success', 'A new product had been created in the system!', 'read', 2, 2, '2021-06-14 17:18:17', NULL),
(15, 'sale', 11, 'Creation', 'primary', 'New Sale created!', 'read', 2, 2, '2021-06-14 17:18:40', NULL),
(16, 'sale', 11, 'Creation', 'success', 'A new sale had been created in the system!', 'read', 2, 2, '2021-06-14 17:18:40', NULL),
(17, 'sale', 12, 'Creation', 'primary', 'New Sale created!', 'read', 2, 2, '2021-06-14 17:19:07', NULL),
(18, 'sale', 12, 'Creation', 'success', 'A new sale had been created in the system!', 'read', 2, 2, '2021-06-14 17:19:07', NULL),
(19, 'user', 12, 'Creation', 'success', 'A new user had been created in the system!', 'read', 2, 2, '2021-06-14 17:26:14', NULL),
(20, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:50', NULL),
(21, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:51', NULL),
(22, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:51', NULL),
(23, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:51', NULL),
(24, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:52', NULL),
(25, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:52', NULL),
(26, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:52', NULL),
(27, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:52', NULL),
(28, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:52', NULL),
(29, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:53', NULL),
(30, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:53', NULL),
(31, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:53', NULL),
(32, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:54', NULL),
(33, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:54', NULL),
(34, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:54', NULL),
(35, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:54', NULL),
(36, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:55', NULL),
(37, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:55', NULL),
(38, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:55', NULL),
(39, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:55', NULL),
(40, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:56', NULL),
(41, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:56', NULL),
(42, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:56', NULL),
(43, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:56', NULL),
(44, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:56', NULL),
(45, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:57', NULL),
(46, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:57', NULL),
(47, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:57', NULL),
(48, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:57', NULL),
(49, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:58', NULL),
(50, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:58', NULL),
(51, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:58', NULL),
(52, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:59', NULL),
(53, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:59', NULL),
(54, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:59', NULL),
(55, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:06:59', NULL),
(56, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:00', NULL),
(57, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:00', NULL),
(58, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:00', NULL),
(59, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:00', NULL),
(60, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:01', NULL),
(61, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:01', NULL),
(62, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:01', NULL),
(63, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:01', NULL),
(64, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:02', NULL),
(65, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:02', NULL),
(66, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:02', NULL),
(67, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:02', NULL),
(68, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:03', NULL),
(69, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:03', NULL),
(70, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:03', NULL),
(71, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:03', NULL),
(72, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:04', NULL),
(73, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:04', NULL),
(74, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:04', NULL),
(75, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:04', NULL),
(76, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:04', NULL),
(77, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:05', NULL),
(78, 'user', 9, 'Modification', 'warning', 'A user removed from system!', 'read', 2, 2, '2021-06-16 16:07:05', NULL),
(79, 'user', 9, 'Modification', 'warning', 'A user updated in the system!', 'read', 2, 2, '2021-06-16 16:18:04', NULL),
(80, 'transfer', 2, 'Creation', 'success', 'A new transfer had been created in the system!', 'read', 2, 2, '2021-06-16 16:18:44', NULL),
(81, 'branch', 7, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-16 16:28:34', NULL),
(94, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:29:28', NULL),
(95, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:29:29', NULL),
(96, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:29:30', NULL),
(97, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:29:30', NULL),
(98, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:29:31', NULL),
(99, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:29:31', NULL),
(100, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:29:32', NULL),
(101, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:29:32', NULL),
(102, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:29:33', NULL),
(103, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:30:22', NULL),
(104, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:30:23', NULL),
(105, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:30:23', NULL),
(106, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:30:24', NULL),
(107, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:30:24', NULL),
(108, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:30:25', NULL),
(109, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:30:25', NULL),
(110, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:30:26', NULL),
(111, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:30:26', NULL),
(112, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:30:27', NULL),
(113, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:30:27', NULL),
(114, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:30:28', NULL),
(115, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:34:59', NULL),
(116, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:34:59', NULL),
(117, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:35:00', NULL),
(118, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:35:00', NULL),
(119, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:35:01', NULL),
(120, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:35:01', NULL),
(121, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:35:02', NULL),
(122, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:35:02', NULL),
(123, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:35:03', NULL),
(124, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:36:01', NULL),
(125, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:36:02', NULL),
(126, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'read', 2, 2, '2021-06-16 16:36:03', NULL),
(127, 'transfer', 2, 'Deletion', 'danger', 'A transfer removed from system!', 'read', 2, 2, '2021-06-16 16:36:09', NULL),
(128, 'branch', 20, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-16 16:36:15', NULL),
(129, 'branch', 21, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-16 16:36:17', NULL),
(130, 'branch', 22, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-16 16:36:19', NULL),
(131, 'branch', 23, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-16 16:36:20', NULL),
(132, 'branch', 24, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-16 16:36:21', NULL),
(133, 'branch', 25, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-16 16:36:23', NULL),
(134, 'branch', 26, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-16 16:37:10', NULL),
(135, 'branch', 27, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-16 16:39:16', NULL),
(136, 'branch', 28, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-16 16:39:18', NULL),
(137, 'branch', 29, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-16 16:39:28', NULL),
(138, 'account', 5, 'Deletion', 'danger', 'An account removed from system!', 'read', 2, 2, '2021-06-16 16:39:51', NULL),
(139, 'account', 6, 'Creation', 'success', 'A new account had been created in the system!', 'read', 2, 2, '2021-06-16 16:40:04', NULL),
(140, 'account', 7, 'Creation', 'success', 'A new account had been created in the system!', 'read', 2, 2, '2021-06-16 16:40:07', NULL),
(141, 'account', 8, 'Creation', 'success', 'A new account had been created in the system!', 'read', 2, 2, '2021-06-16 16:40:12', NULL),
(142, 'account', 9, 'Creation', 'success', 'A new account had been created in the system!', 'read', 2, 2, '2021-06-16 16:42:43', NULL),
(143, 'account', 10, 'Creation', 'success', 'A new account had been created in the system!', 'read', 2, 2, '2021-06-16 16:42:55', NULL),
(144, 'payment', 10, 'Creation', 'success', 'A new payment had been created in the system!', 'read', 2, 2, '2021-06-16 16:43:16', NULL),
(145, 'Order', 1, 'Deletion', 'danger', 'An Order removed from system!', 'unread', 12, 5, '2021-06-16 18:01:23', NULL),
(146, 'customer', 19, 'Creation', 'success', 'A new customer had been created in the system!', 'read', 2, 2, '2021-06-16 18:28:19', NULL),
(147, 'customer', 20, 'Creation', 'success', 'A new customer had been created in the system!', 'read', 2, 2, '2021-06-16 18:30:21', NULL),
(148, 'user', 15, 'Creation', 'success', 'A new user had been created in the system!', 'unread', 12, 3, '2021-06-16 18:31:31', NULL),
(149, 'customer', 21, 'Creation', 'success', 'A new customer had been created in the system!', 'read', 2, 2, '2021-06-16 18:31:31', NULL),
(150, 'product', 148, 'Creation', 'success', 'A new product had been created in the system!', 'read', 2, 2, '2021-06-17 15:37:17', NULL),
(151, 'sale', 11, 'Modification', 'warning', 'A Sale updated in system!', 'read', 2, 2, '2021-06-19 12:53:42', NULL),
(152, 'branch', 30, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-22 15:41:45', NULL),
(153, 'fixpayment', 1, 'Creation', 'success', 'A new fixpayment had been created in the system!', 'read', 2, 2, '2021-06-25 13:22:53', NULL),
(154, 'fixpayment', 2, 'Creation', 'success', 'A new fixpayment had been created in the system!', 'read', 2, 2, '2021-06-25 13:23:22', NULL),
(155, 'fixpayment', 2, 'Deletion', 'danger', 'A Fix payment removed from system!', 'read', 2, 2, '2021-06-25 13:49:23', NULL),
(156, 'product', 7, 'Modification', 'warning', 'A product had been updated in the system!', 'read', 2, 2, '2021-06-25 13:49:39', NULL),
(157, 'branch', 31, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-25 13:50:02', NULL),
(158, 'branch', 32, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-25 14:15:07', NULL),
(159, 'branch', 33, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-25 14:15:10', NULL),
(160, 'branch', 34, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-25 14:15:14', NULL),
(161, 'branch', 35, 'Deletion', 'danger', 'A Branch removed from system!', 'read', 2, 2, '2021-06-25 14:41:57', NULL),
(162, 'branch', 89, 'Creation', 'success', 'A new branch had been created in the system!', 'read', 2, 2, '2021-06-25 15:26:35', NULL),
(163, 'branch', 1, 'Modification', 'warning', 'A branch had been updated in the system!', 'read', 2, 2, '2021-06-25 15:27:37', NULL),
(166, 'product', 7, 'Modification', 'warning', 'A product had been updated in the system!', 'read', 2, 2, '2021-06-25 15:30:16', NULL),
(167, 'product', 7, 'Modification', 'warning', 'A product had been updated in the system!', 'unread', 2, 2, '2021-06-25 15:30:27', NULL),
(168, 'product', 7, 'Modification', 'warning', 'A product had been updated in the system!', 'read', 2, 2, '2021-06-25 15:31:26', NULL),
(169, 'product', 7, 'Modification', 'warning', 'A product had been updated in the system!', 'unread', 2, 2, '2021-06-25 15:31:37', NULL),
(170, 'product', 7, 'Modification', 'warning', 'A product had been updated in the system!', 'read', 2, 2, '2021-06-25 15:32:45', NULL),
(171, 'product', 7, 'Modification', 'warning', 'A product had been updated in the system!', 'read', 2, 2, '2021-06-25 15:33:03', NULL),
(172, 'user', 16, 'Creation', 'success', 'A new user had been created in the system!', 'read', 2, 2, '2021-07-19 07:27:40', NULL),
(173, 'user', 9, 'Modification', 'warning', 'A user updated in the system!', 'read', 2, 2, '2021-07-19 07:37:47', NULL),
(174, 'user', 9, 'Modification', 'warning', 'A user updated in the system!', 'read', 2, 2, '2021-07-19 07:37:59', NULL),
(175, 'user', 9, 'Modification', 'warning', 'A user updated in the system!', 'read', 2, 2, '2021-07-19 07:39:28', NULL),
(176, 'user', 9, 'Modification', 'warning', 'A user updated in the system!', 'read', 2, 2, '2021-07-19 07:39:36', NULL),
(177, 'user', 9, 'Modification', 'warning', 'A user updated in the system!', 'read', 2, 2, '2021-07-19 07:40:36', NULL),
(178, 'user', 10, 'Modification', 'warning', 'A user updated in the system!', 'read', 2, 2, '2022-02-23 10:15:36', NULL),
(179, 'branch', 3, 'Modification', 'warning', 'A branch had been updated in the system!', 'unread', 2, 2, '2022-03-05 07:19:10', NULL),
(180, 'branch', 4, 'Deletion', 'danger', 'A Branch removed from system!', 'unread', 2, 2, '2022-03-05 07:19:23', NULL),
(181, 'transfer', 1, 'Modification', 'warning', 'A transfer had been updated in the system!', 'unread', 2, 2, '2022-03-21 14:33:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('000f2836db2584bf62fbd797c26080d385395bd41557320355a8659ca46c4c1c51461f99f9284f7d', 2, 1, NULL, '[\"*\"]', 0, '2021-05-20 08:52:50', '2021-05-20 08:52:50', '2022-05-20 13:22:50'),
('11188eff051aab163325913a9879291aa15dfe16e8ba3bb221fec325adc23e957b14f6fe280c304b', 2, 1, NULL, '[\"*\"]', 0, '2021-03-12 05:00:19', '2021-03-12 05:00:19', '2022-03-12 09:30:19'),
('151006e687e89dd0edb7473402be08b0fd55ca2aaa6e062525fc6b7bee5834fea49d0a3428d6db94', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:58:00', '2021-06-21 03:58:00', '2022-06-21 08:28:00'),
('17d8a4bcd25963a5bc6ea5bd7b96e78da178a2b021b1c9efceb0d16ddc95b7a5b2bf61cc889bc9ea', 2, 1, NULL, '[\"*\"]', 0, '2021-06-17 15:34:39', '2021-06-17 15:34:39', '2022-06-17 20:04:39'),
('1927d11468d493e361fb6bbac83713958205883586eced42f9c43d2ef042c41cf7410b3925fb59a1', 11, 1, NULL, '[\"*\"]', 0, '2021-06-08 13:33:02', '2021-06-08 13:33:02', '2022-06-08 18:03:02'),
('19f9dc7701b6e3d4e19ca18cd6526fdedaf1e6b99d680f3c2a17053d38cc8ef205cbe00e0b276751', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:34:58', '2021-06-21 03:34:58', '2022-06-21 08:04:58'),
('1d08e7ff1aa37b22263e5f08fe77fb3142247d487d115e0fed2a83886527214bdaff89d96ef4c9bc', 2, 1, NULL, '[\"*\"]', 0, '2021-07-19 07:13:03', '2021-07-19 07:13:03', '2022-07-19 11:43:03'),
('1e02f0b9041bc1d7c3273daae8731e44e0cabfcdf65f5acecdbdb4e0b886cb5db6880af88646b63d', 2, 1, NULL, '[\"*\"]', 0, '2022-03-05 07:15:34', '2022-03-05 07:15:34', '2023-03-05 11:45:34'),
('1ead9398a6bf7170854cb196d2e617b0e03e002fdf60ddbf5fd7131d67f110e828f0a688a9db31d4', 2, 1, NULL, '[\"*\"]', 0, '2021-03-11 11:36:11', '2021-03-11 11:36:11', '2022-03-11 16:06:11'),
('22e803e2ea6253c0790bd3e57b9a4021227c83dd012d419ee4334f383651fd3ccc94da06f5c901be', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:47:33', '2021-06-21 03:47:33', '2022-06-21 08:17:33'),
('25f14fff83ff09dd8a2e8325844af3c4becb1501684a9c3658a1740fe904c6fbe810ec93b064a24b', 2, 1, NULL, '[\"*\"]', 0, '2021-03-12 03:57:51', '2021-03-12 03:57:51', '2022-03-12 08:27:51'),
('2aa468c38b5a33659c306c2eaed29434bef5c17d55c4ebdc105862a50b905366ce0b594d57c01a65', 2, 1, NULL, '[\"*\"]', 0, '2021-03-12 03:56:56', '2021-03-12 03:56:56', '2022-03-12 08:26:56'),
('2db7b80f36805ab76c5f595c9b3e9a196825c852f7f86aea684e2a453c35356c45e5301206541b19', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:59:02', '2021-06-21 03:59:02', '2022-06-21 08:29:02'),
('2ed71b6c8a9d533fb22b00adf780afded563424dcbc4b67ac56f9b0aef3ad7991e0777e306d75554', 2, 1, NULL, '[\"*\"]', 0, '2021-03-11 11:31:35', '2021-03-11 11:31:35', '2022-03-11 16:01:35'),
('34118df118e7c9e9f8c6f5fd161d1fee430b67605698634d03ecb9d67d3242c2d1d6c662a4fc5ece', 2, 1, NULL, '[\"*\"]', 0, '2021-03-14 00:46:45', '2021-03-14 00:46:45', '2022-03-14 05:16:45'),
('39ba28b4a27ada21ebe530d1e33e0c2f0f57bf26556f69b5c90fc7e8faa20da59382238af24f79e6', 2, 1, NULL, '[\"*\"]', 0, '2021-07-19 07:24:32', '2021-07-19 07:24:32', '2022-07-19 11:54:32'),
('43add5b081ccdaaaf74da25f950e7e4dbd8bfd0ea66ed16fd26663aa3215c8e324e0b66c950fce63', 2, 1, NULL, '[\"*\"]', 0, '2021-03-14 03:40:44', '2021-03-14 03:40:44', '2022-03-14 08:10:44'),
('47584bad53fad14874db3cbcd97b6570a0c2520b707f4ecb946871e5a66bf3cd478bc08e761b0503', 2, 1, NULL, '[\"*\"]', 0, '2021-07-19 07:03:45', '2021-07-19 07:03:45', '2022-07-19 11:33:45'),
('493dfef6611d81337ce62e0a7743059322d72422fee20f18f36344d1096c0ac7854c25302058ce22', 12, 1, NULL, '[\"*\"]', 0, '2021-06-14 17:26:48', '2021-06-14 17:26:48', '2022-06-14 21:56:48'),
('51c3cc14c9927c745bba686a1b7c448de12ea98175515054bb6fe38bedc3bd53efd8e0dd931fd6ff', 7, 1, NULL, '[\"*\"]', 0, '2021-03-12 03:28:00', '2021-03-12 03:28:00', '2022-03-12 07:58:00'),
('5a6b88da5cfde0822e20a16ddbfeafd665f658588dc231d39d3b40ffd353694d5b74060b783967f7', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:35:42', '2021-06-21 03:35:42', '2022-06-21 08:05:42'),
('5bd368d44c430a0449489146eef16afe0aaa2e16849d8abf178e6349a1c256fddfd7ac3ade9761ca', 2, 1, NULL, '[\"*\"]', 0, '2022-03-05 07:16:37', '2022-03-05 07:16:37', '2023-03-05 11:46:37'),
('5f4f62b15bedd0e3c7a5f5872cf2ade2f643403fcd20deab9139a0a35071d5d93f637f849c4f0cf5', 2, 1, NULL, '[\"*\"]', 0, '2022-01-02 08:21:32', '2022-01-02 08:21:32', '2023-01-02 12:51:32'),
('6695cea2d2248128acbff325312f9afad91646a9651f297b8bdd288803953bb022f13c36a674052b', 2, 1, NULL, '[\"*\"]', 0, '2021-03-11 11:32:35', '2021-03-11 11:32:35', '2022-03-11 16:02:35'),
('66dbb1983b435af75f8b4b5a06ea5b70f019e83089569dfb65a122b410f330e0f7bb98ad6e4269d0', 2, 1, NULL, '[\"*\"]', 0, '2022-01-09 13:51:55', '2022-01-09 13:51:55', '2023-01-09 18:21:55'),
('6f964907c7cf55a712ddf365edf8ddd6703031555d496415f1ce7ef2216dea67ce2ae35aef4f0f5f', 2, 1, NULL, '[\"*\"]', 0, '2021-06-16 19:16:18', '2021-06-16 19:16:18', '2022-06-16 23:46:18'),
('7834c5374fd98ad5e14f793e924d826e53d6df1cdfe033adefad96c9b379b53046601ffe24f35029', 2, 1, NULL, '[\"*\"]', 0, '2021-03-14 03:32:29', '2021-03-14 03:32:29', '2022-03-14 08:02:29'),
('80bbb0bd06b04dd18ee5daa56cbafa479fcad76a24e8537d013931808199be6a3bb055f0c6d78e84', 6, 1, NULL, '[\"*\"]', 0, '2021-03-12 01:56:07', '2021-03-12 01:56:07', '2022-03-12 06:26:07'),
('82864d1a12ebc27834069a3ac469c68f32f8886608b91e6fffbfd1307ce5e13bd7305eaaeed7e734', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:39:37', '2021-06-21 03:39:37', '2022-06-21 08:09:37'),
('88a3323087db0a4a3a14ec3a323c031dccd18678fa7356e3d1a022500b7c4b456e69acf6aee97ecd', 12, 1, NULL, '[\"*\"]', 0, '2021-06-16 16:45:22', '2021-06-16 16:45:22', '2022-06-16 21:15:22'),
('8b5f567146340029a15159f0a0d49375c492c424dcf576e8d795242cb6507819efa212631fa2ad2b', 2, 1, NULL, '[\"*\"]', 0, '2021-06-16 19:35:40', '2021-06-16 19:35:40', '2022-06-17 00:05:40'),
('9b15b9341f180c9748f86644ab7139189651dade2a296b6b0dca85457730d1799f91a16d2e5febe4', 2, 1, NULL, '[\"*\"]', 0, '2021-06-22 16:50:30', '2021-06-22 16:50:30', '2022-06-22 21:20:30'),
('a160323a846f985c6d17feb8fbdcef7dd1f08fd3cc38c9b1e7d08dc26c1e17731e1f20799d279d37', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:59:54', '2021-06-21 03:59:54', '2022-06-21 08:29:54'),
('a2dba823d829d4821ea4dbde42b22683980a84729ebc315ae012ca592b13f5e1a2b978a163f9310e', 2, 1, NULL, '[\"*\"]', 0, '2021-03-23 00:49:05', '2021-03-23 00:49:05', '2022-03-23 05:19:05'),
('a540c2538d35579a0c88e78db56860167ebcc69124a1d0e712b96594582c9e3ffc0c8b9cef31ff20', 2, 1, NULL, '[\"*\"]', 0, '2021-03-11 11:25:36', '2021-03-11 11:25:36', '2022-03-11 15:55:36'),
('b10e853c1cb0486806a320d8a1925a7e6682045d4eb55b08f08fe5c77d744bb3835b1c050c0675a5', 2, 1, NULL, '[\"*\"]', 0, '2021-06-08 08:40:03', '2021-06-08 08:40:03', '2022-06-08 13:10:03'),
('b7a42fcb9b0ccf7092decefce1c9acfc4f7908c7e86bfa6708c526dcd4169d2e1f42a7a64b4797e0', 10, 1, NULL, '[\"*\"]', 0, '2021-03-12 04:59:40', '2021-03-12 04:59:40', '2022-03-12 09:29:40'),
('b8ed27ad4fbef2be20c93f7deb1f61d5dfd6c0e44cda4223edf813a8adfc9455df65a7b316cfb90a', 2, 1, NULL, '[\"*\"]', 0, '2021-06-10 13:37:13', '2021-06-10 13:37:13', '2022-06-10 18:07:13'),
('ba19ec3af76ea91b2b836ba4d4f70d78c86022380b63a8be5e3871182b54defa59c8f98a121983c0', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:49:47', '2021-06-21 03:49:47', '2022-06-21 08:19:47'),
('c04a81efd81fa0e2ce640c50ee7f09c6d918e53670d743f331ae0fa68e3664c91f809cc47a28ba92', 2, 1, NULL, '[\"*\"]', 0, '2021-08-04 07:46:13', '2021-08-04 07:46:13', '2022-08-04 12:16:13'),
('c0a6152f88c1ee6b1c9f0b64683aebdbe04754b683f5343e7226a3fc2b6dc3dfc3e552bb03fb43e7', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:55:21', '2021-06-21 03:55:21', '2022-06-21 08:25:21'),
('c1b79ffd2b760e59d14f0098e9b8ee268d11e9e238b4b81b2ea10f14e0c2a1be40ad066eeb4c0d37', 2, 1, NULL, '[\"*\"]', 0, '2021-06-06 12:10:17', '2021-06-06 12:10:17', '2022-06-06 16:40:17'),
('c6d8634322a7ac4ffb44eef370b0512138104e25ed9e6cff080bc6455982c53997d6c6ed6afe6bf9', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:59:25', '2021-06-21 03:59:25', '2022-06-21 08:29:25'),
('cd240a71008e510c5cb1842c8ad1c4cfaf9477d30ab214b942ac76a989fdb150eaaf29b00e463a98', 2, 1, NULL, '[\"*\"]', 0, '2021-07-19 07:26:26', '2021-07-19 07:26:26', '2022-07-19 11:56:26'),
('cf1a3547d5bee2ba869f06a733b3a7e130023d01970eea85a9c16e5823d9547b5f5b3c98f9512746', 2, 1, NULL, '[\"*\"]', 0, '2021-06-10 13:32:54', '2021-06-10 13:32:54', '2022-06-10 18:02:54'),
('d955b8126620d24b87e58aa85c851f41b4d3e49ba5248be44c2b4b9707d8638d27cfe3927a2640c0', 2, 1, NULL, '[\"*\"]', 0, '2021-06-01 12:18:53', '2021-06-01 12:18:53', '2022-06-01 16:48:53'),
('deae9d23d48bb251eb966b9781d4e330e48b1cab42dd508988cdddcb1f1b8c772f1c968817da4de1', 2, 1, NULL, '[\"*\"]', 0, '2021-03-23 01:38:41', '2021-03-23 01:38:41', '2022-03-23 06:08:41'),
('e214ebfeb1e6ba178c8142223ee40a5bc4ad3797fb847f1328dc7d62ad8cc67969ddba78d2c5f837', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:31:28', '2021-06-21 03:31:28', '2022-06-21 08:01:28'),
('e4011d34aed739a4e11b40dde8734d71435178e827fd29491d2d6b25185c6ee7ffce030a2c5364ed', 2, 1, NULL, '[\"*\"]', 0, '2021-06-10 13:33:17', '2021-06-10 13:33:17', '2022-06-10 18:03:17'),
('ed40164faf3cb821c35c20b2df21054ad738f0ab185dcd66ee9825f9626ec6c22f2e04ff864328a0', 2, 1, NULL, '[\"*\"]', 0, '2021-05-16 12:40:31', '2021-05-16 12:40:31', '2022-05-16 17:10:31'),
('edbefff2e9cba2e61a1fc1c100b9e20d6860f93a985545a90f5218394fa372e14e4d139c85d4eb39', 2, 1, NULL, '[\"*\"]', 0, '2021-06-16 19:17:47', '2021-06-16 19:17:47', '2022-06-16 23:47:47'),
('ef6d7f80de60ae666c26c249955cc14cc5011251eead4c2d1a8451fc35e22791010e089ac916a98c', 2, 1, NULL, '[\"*\"]', 0, '2021-05-31 10:43:25', '2021-05-31 10:43:25', '2022-05-31 15:13:25'),
('f24a38da335ed648ff585642c6538270ea22fa2a186761a13494116e75ff7d375d891c242d83e776', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:32:05', '2021-06-21 03:32:05', '2022-06-21 08:02:05'),
('f69091c81631fc8e4b8eda16cc746fdf69f071242e182e2e32be2a9575f040a236db1d1c52dcc34f', 15, 1, NULL, '[\"*\"]', 0, '2021-06-16 18:32:57', '2021-06-16 18:32:57', '2022-06-16 23:02:57'),
('f929d05f2791df3f20c43fabbdd195114953904c9d0f49bf0a1e4df11a944cd30ec9a1dae22b2730', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:41:16', '2021-06-21 03:41:16', '2022-06-21 08:11:16'),
('fb3afb811724f412884c78e3ae1bc41b9b1b181baa1f2757f00111a5d052dbc43d360a1138c96d0a', 2, 1, NULL, '[\"*\"]', 0, '2021-06-21 03:41:52', '2021-06-21 03:41:52', '2022-06-21 08:11:52'),
('ffac62af3f5030156609df9565a6122e4881182bebab92a56a107a129018789fc8472a37daa6610c', 2, 1, NULL, '[\"*\"]', 0, '2021-07-19 06:48:55', '2021-07-19 06:48:55', '2022-07-19 11:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, 1, 'main', 'qrD0ZTrHHaXpvwzmRawSc6kr2QR2sKosl1Jpv7Gx', '/', 0, 1, 0, '2021-03-11 11:22:46', '2021-03-11 11:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('0183bca422bce607d2a33ddb71c1f32bd14aff4e6b1475f99ff8a40ef19f05b07f7e26a978e94671', '6695cea2d2248128acbff325312f9afad91646a9651f297b8bdd288803953bb022f13c36a674052b', 0, '2022-03-11 16:02:35'),
('0464909e2f8d685e8d683b6a55ceddcb01d5e0ff6c64063e40075c3b05e8b7d4d6065f15617e4307', 'c1b79ffd2b760e59d14f0098e9b8ee268d11e9e238b4b81b2ea10f14e0c2a1be40ad066eeb4c0d37', 0, '2022-06-06 16:40:17'),
('056f337fc40fd4f9067b21cacdfacb79d610434d82a6c93f5166e738c3444e5418013a483c27fda4', '1ead9398a6bf7170854cb196d2e617b0e03e002fdf60ddbf5fd7131d67f110e828f0a688a9db31d4', 0, '2022-03-11 16:06:11'),
('069a5ea99516ff302258783a2e8bcc6aadedeaf5c838aefbff46ee7a9d3dce475a15ec74c4cd0c11', '66dbb1983b435af75f8b4b5a06ea5b70f019e83089569dfb65a122b410f330e0f7bb98ad6e4269d0', 0, '2023-01-09 18:21:55'),
('075de9a1101a00878abd52d5f679e87917d5b828fd875f2829ec77c1186f5ab03c45f6002dbc7d14', 'f929d05f2791df3f20c43fabbdd195114953904c9d0f49bf0a1e4df11a944cd30ec9a1dae22b2730', 0, '2022-06-21 08:11:16'),
('07adea277fccf468c0897e626d66e2294d5b278952075faefa4d1fe40fe03b1df664320905e3f7a4', 'c04a81efd81fa0e2ce640c50ee7f09c6d918e53670d743f331ae0fa68e3664c91f809cc47a28ba92', 0, '2022-08-04 12:16:13'),
('134476a332d1de10b5f3e018b3ef8d4e17c7180c11d2f18581d44efa12bcb3ad61a5704545933dea', 'ef6d7f80de60ae666c26c249955cc14cc5011251eead4c2d1a8451fc35e22791010e089ac916a98c', 0, '2022-05-31 15:13:25'),
('18b9a5298bece7a5d53904370873f2c30a5a83cafd8570ea681c2f7ff254981a9bb4830fb05cbf3a', '19f9dc7701b6e3d4e19ca18cd6526fdedaf1e6b99d680f3c2a17053d38cc8ef205cbe00e0b276751', 0, '2022-06-21 08:04:58'),
('19a2a6f14521e264cf9814675c1e68301e987647ff49447ad15a5aa9e9d15b1b8c4ff48bad2236dc', 'c6d8634322a7ac4ffb44eef370b0512138104e25ed9e6cff080bc6455982c53997d6c6ed6afe6bf9', 0, '2022-06-21 08:29:25'),
('1bd42ef7ff850acf6ec0bc11c21627e236483cc702acba0f504373ebd73bf44abf3c3425524bd93d', 'e4011d34aed739a4e11b40dde8734d71435178e827fd29491d2d6b25185c6ee7ffce030a2c5364ed', 0, '2022-06-10 18:03:17'),
('345dc8cf7dbd24e8de0012d3036a3890e9e1b475b14869196f52fe44795de08ace08076d2f7ac308', '51c3cc14c9927c745bba686a1b7c448de12ea98175515054bb6fe38bedc3bd53efd8e0dd931fd6ff', 0, '2022-03-12 07:58:00'),
('37a5c349031769621345bae12a5933ae94600621c5c60927922c73af9d538ff8c2081c700fcac1b0', '1927d11468d493e361fb6bbac83713958205883586eced42f9c43d2ef042c41cf7410b3925fb59a1', 0, '2022-06-08 18:03:02'),
('3818e3074d2209258713a72048420c498d37b83f18435f21c67ec532fb76bbea4ad6e3965a1a85be', '151006e687e89dd0edb7473402be08b0fd55ca2aaa6e062525fc6b7bee5834fea49d0a3428d6db94', 0, '2022-06-21 08:28:00'),
('38f6bbe389d077472171b9bb029180086fd986292598393495f3003bf7f86ae0b01b057f7716a0e6', '47584bad53fad14874db3cbcd97b6570a0c2520b707f4ecb946871e5a66bf3cd478bc08e761b0503', 0, '2022-07-19 11:33:45'),
('3cc222a7e43aca017d5814ff33688d564db9426b095ee74db4e38c871a18199fe7138cd5d2c502af', 'e214ebfeb1e6ba178c8142223ee40a5bc4ad3797fb847f1328dc7d62ad8cc67969ddba78d2c5f837', 0, '2022-06-21 08:01:28'),
('3cfe2aaea217bc4f8eaf6ac207b141f330e0652ba074072cce52646de6d2b8e7112eec533f70155b', '11188eff051aab163325913a9879291aa15dfe16e8ba3bb221fec325adc23e957b14f6fe280c304b', 0, '2022-03-12 09:30:19'),
('3db2c2f910d230fa27529941d0125d7c0ff6c5a771b529787740233eebb21365b0ddb828eb35285c', '34118df118e7c9e9f8c6f5fd161d1fee430b67605698634d03ecb9d67d3242c2d1d6c662a4fc5ece', 0, '2022-03-14 05:16:45'),
('3db5bfc3b0c594048fd570c58f525a6ea3ba2c7a0e769f5189cd2901d15a37ec07373eefc15d0ae6', '5a6b88da5cfde0822e20a16ddbfeafd665f658588dc231d39d3b40ffd353694d5b74060b783967f7', 0, '2022-06-21 08:05:42'),
('3f6d96b9b96e15b08845052bc43573c303bd090167654c8112a6b7739c9671e2179d33851e7879ef', '5bd368d44c430a0449489146eef16afe0aaa2e16849d8abf178e6349a1c256fddfd7ac3ade9761ca', 0, '2023-03-05 11:46:37'),
('42a133b2453d186c10fe2d1ef9ee0c70d51ec3f1f4a833ad2413a50666f26fcf02816e4851983e88', 'ffac62af3f5030156609df9565a6122e4881182bebab92a56a107a129018789fc8472a37daa6610c', 0, '2022-07-19 11:18:55'),
('48528e2ebb2c2e369ed068dd11775cc4ca7eb66db12013ff50be03ca0d0776cbf4f4b1e2237fd14f', 'a160323a846f985c6d17feb8fbdcef7dd1f08fd3cc38c9b1e7d08dc26c1e17731e1f20799d279d37', 0, '2022-06-21 08:29:54'),
('4b48bbac0f1b14cf73ad05e7352904df726d41f5039961b0b37a7ba8f797dbfd0561ec490122061f', 'b7a42fcb9b0ccf7092decefce1c9acfc4f7908c7e86bfa6708c526dcd4169d2e1f42a7a64b4797e0', 0, '2022-03-12 09:29:40'),
('52ed064d7dbc92bc1372dac6232da49ff2ea7ea57239b8ec5bc7a8a13002a6af9edf833708a71763', '17d8a4bcd25963a5bc6ea5bd7b96e78da178a2b021b1c9efceb0d16ddc95b7a5b2bf61cc889bc9ea', 0, '2022-06-17 20:04:39'),
('57ba6b546be936bcf740f14de0d31fc60e52ed733195d1cf7bb17ccb3ebf642bc3638479f5f4f2cf', '88a3323087db0a4a3a14ec3a323c031dccd18678fa7356e3d1a022500b7c4b456e69acf6aee97ecd', 0, '2022-06-16 21:15:22'),
('5aeb4208298192eb5e70802a950c6006bbdd07ff44369b5857eea46ea9858c2ccc2b5cfa548e287f', 'b10e853c1cb0486806a320d8a1925a7e6682045d4eb55b08f08fe5c77d744bb3835b1c050c0675a5', 0, '2022-06-08 13:10:03'),
('66ecb54dcc80706804c231ed69ce1418f130af1e5c0b192e3c1a11d16fc69a323564c69f0c3bbc68', 'deae9d23d48bb251eb966b9781d4e330e48b1cab42dd508988cdddcb1f1b8c772f1c968817da4de1', 0, '2022-03-23 06:08:41'),
('7864120dc2ef3d1d026891bac209e686a20fa725b87467a0b856fc495597724752a3ce6ad6a90bfb', '25f14fff83ff09dd8a2e8325844af3c4becb1501684a9c3658a1740fe904c6fbe810ec93b064a24b', 0, '2022-03-12 08:27:51'),
('7f6e95cc28f4535704de2c69e9341214b323867c68857019b27d36369f09ccf35c4d8087292e495e', 'cd240a71008e510c5cb1842c8ad1c4cfaf9477d30ab214b942ac76a989fdb150eaaf29b00e463a98', 0, '2022-07-19 11:56:26'),
('829f626226b5511a4030e4234e8ff87cd2696c33dc36298bcaae76d2fe1e0c36c88e3332c0e70ac4', '000f2836db2584bf62fbd797c26080d385395bd41557320355a8659ca46c4c1c51461f99f9284f7d', 0, '2022-05-20 13:22:50'),
('880876f231d93269b5ace5764e8d4304eae68652f4c195305b82cd3b13c2d036411463adb07525da', 'edbefff2e9cba2e61a1fc1c100b9e20d6860f93a985545a90f5218394fa372e14e4d139c85d4eb39', 0, '2022-06-16 23:47:47'),
('88ebca747ba346f5f9ac5867e90fb8e8b4cdac52c57fe3e0027b4bf9223d6fbd4ca738908f9d4a91', 'b8ed27ad4fbef2be20c93f7deb1f61d5dfd6c0e44cda4223edf813a8adfc9455df65a7b316cfb90a', 0, '2022-06-10 18:07:13'),
('905795cd2e0615bf6612ec273f7d60903b5c95377a3071a9aa884937c7c8f9427ad4f64a18402c86', '2ed71b6c8a9d533fb22b00adf780afded563424dcbc4b67ac56f9b0aef3ad7991e0777e306d75554', 0, '2022-03-11 16:01:35'),
('9495813f911ed1e801d6b2e9cf0ea495d18062b51eadfd2c55ee8506ca2618936b19ed5960dfbee5', 'cf1a3547d5bee2ba869f06a733b3a7e130023d01970eea85a9c16e5823d9547b5f5b3c98f9512746', 0, '2022-06-10 18:02:54'),
('96dccd0f20b8e92538f34dc12edc10cd580fa9f6ed266dea6449d3dd111b2c828a823bacc829d9a6', '493dfef6611d81337ce62e0a7743059322d72422fee20f18f36344d1096c0ac7854c25302058ce22', 0, '2022-06-14 21:56:48'),
('9dcb3117bd43df035c34224dacac7bc1f3e73ab37e97a9a8c2a24d1469a0211db54aae16a5db96f1', '5f4f62b15bedd0e3c7a5f5872cf2ade2f643403fcd20deab9139a0a35071d5d93f637f849c4f0cf5', 0, '2023-01-02 12:51:32'),
('9fab294e0d3efdb1247962d5dc4b97cbf70eec0841c224c4d63afa208b079f23cb2e490abb1a26be', 'c0a6152f88c1ee6b1c9f0b64683aebdbe04754b683f5343e7226a3fc2b6dc3dfc3e552bb03fb43e7', 0, '2022-06-21 08:25:21'),
('a4c4671ab3fb2b3be0d0e648e15f3773f22c19e45c3d31ffd63fbcef84300286cdbe728ff438ec12', 'ed40164faf3cb821c35c20b2df21054ad738f0ab185dcd66ee9825f9626ec6c22f2e04ff864328a0', 0, '2022-05-16 17:10:32'),
('a57ad0143a5d23f3df2d9f536d87a81e1fcb92099e0b843eb2b614f70d38335a105b2299316f996c', 'f24a38da335ed648ff585642c6538270ea22fa2a186761a13494116e75ff7d375d891c242d83e776', 0, '2022-06-21 08:02:05'),
('a5ec70d8c9b2e6844d3fa591144103d4291f4a334e1761fa682c67c7f77aea196507e248c7aacf4d', 'fb3afb811724f412884c78e3ae1bc41b9b1b181baa1f2757f00111a5d052dbc43d360a1138c96d0a', 0, '2022-06-21 08:11:52'),
('a959da0c8b9d7ae2b792f5b4e0ebdd0d9c1985c29fde648b8312eddbb9b191a72eeab5afaa6de66d', 'ba19ec3af76ea91b2b836ba4d4f70d78c86022380b63a8be5e3871182b54defa59c8f98a121983c0', 0, '2022-06-21 08:19:47'),
('b1c835e5063e0a451649f03d67244019939ff69620c2d3c0ba7207c13d66d199c49e9e5f7d0929b2', '22e803e2ea6253c0790bd3e57b9a4021227c83dd012d419ee4334f383651fd3ccc94da06f5c901be', 0, '2022-06-21 08:17:33'),
('b5d526488460583791b8e0f306c430cb7e6a5d35be7d2f69d9156cd496037fc9360d189c7cacfbfd', '7834c5374fd98ad5e14f793e924d826e53d6df1cdfe033adefad96c9b379b53046601ffe24f35029', 0, '2022-03-14 08:02:29'),
('bb6a196e17961c8eed0af69b05705fb480acc47626cbe754470adf52a76e79e5823b2be4c1412344', '80bbb0bd06b04dd18ee5daa56cbafa479fcad76a24e8537d013931808199be6a3bb055f0c6d78e84', 0, '2022-03-12 06:26:07'),
('bc25c8d642ed052aa52d4b5db647e50dce4b199e7c7c9a6cac13f255f989622e77cbc0bbae3a090c', '1d08e7ff1aa37b22263e5f08fe77fb3142247d487d115e0fed2a83886527214bdaff89d96ef4c9bc', 0, '2022-07-19 11:43:03'),
('c93051c8c3f97d44b916f63d17038d6c383d25af7342d6924bfb2fc1192fa841cb94b375dced2cbc', '9b15b9341f180c9748f86644ab7139189651dade2a296b6b0dca85457730d1799f91a16d2e5febe4', 0, '2022-06-22 21:20:30'),
('ce899e2dd34ae27de9581a1c6d9bd6fe587d54e272093623ed9158844d15b763ba3ca55b2b801385', '39ba28b4a27ada21ebe530d1e33e0c2f0f57bf26556f69b5c90fc7e8faa20da59382238af24f79e6', 0, '2022-07-19 11:54:32'),
('d3630a547578453c7f888260b6bd1be2226131e35ce22ce0cdd10b5ddce7d09bfb6777e5ce30f3c9', '6f964907c7cf55a712ddf365edf8ddd6703031555d496415f1ce7ef2216dea67ce2ae35aef4f0f5f', 0, '2022-06-16 23:46:18'),
('d4233b4ad1ed0f6bd4a0885224f89e50bc13772d6d93930463e649ff518274832caa1dba8a3e55d2', '1e02f0b9041bc1d7c3273daae8731e44e0cabfcdf65f5acecdbdb4e0b886cb5db6880af88646b63d', 0, '2023-03-05 11:45:34'),
('d4e5261f100c3f6a35775453c7c32cb7626a06458c4cb5624ce1860618ca73d18053917fa8fae1e1', '2db7b80f36805ab76c5f595c9b3e9a196825c852f7f86aea684e2a453c35356c45e5301206541b19', 0, '2022-06-21 08:29:02'),
('d84b7d51c7a61f4d657ef90c312b7ed598c0ff595bfca42a124dee43d54269d858f5d731a3267af7', '43add5b081ccdaaaf74da25f950e7e4dbd8bfd0ea66ed16fd26663aa3215c8e324e0b66c950fce63', 0, '2022-03-14 08:10:44'),
('d8e396867a3d189d36efa3c412d560beb7d398b69f5ac55a7bedd964201898f80794a40c72c77468', 'd955b8126620d24b87e58aa85c851f41b4d3e49ba5248be44c2b4b9707d8638d27cfe3927a2640c0', 0, '2022-06-01 16:48:54'),
('ea5f2ad523644b88b9f3c960c9212c76f31014951d89ee2aa12aaf504b8667c3f88c61132379fbbd', '2aa468c38b5a33659c306c2eaed29434bef5c17d55c4ebdc105862a50b905366ce0b594d57c01a65', 0, '2022-03-12 08:26:56'),
('eebd894802cc823abbed0481c0eb190cc010ef267e5f54bd828b0af912dddf51377cb52555910afd', 'a2dba823d829d4821ea4dbde42b22683980a84729ebc315ae012ca592b13f5e1a2b978a163f9310e', 0, '2022-03-23 05:19:06'),
('f17042d0304d47cf5eddca76cfdaf9070166a662565c45336fab3b9cc31de4dd1661b5073c15d898', 'f69091c81631fc8e4b8eda16cc746fdf69f071242e182e2e32be2a9575f040a236db1d1c52dcc34f', 0, '2022-06-16 23:02:57'),
('f6b7f13754892b872a757d8f54609b3c37e8d3a9ef745019f484a56f39dd368075bdbe38e6050ef2', 'a540c2538d35579a0c88e78db56860167ebcc69124a1d0e712b96594582c9e3ffc0c8b9cef31ff20', 0, '2022-03-11 15:55:36'),
('fc9c75e16e27163f3e2ec0f36b348e9e6e376062b765f6ded12ec86ad6ec6fa90d9b050c613126ef', '8b5f567146340029a15159f0a0d49375c492c424dcf576e8d795242cb6507819efa212631fa2ad2b', 0, '2022-06-17 00:05:40'),
('fdf5db05bed4472f2293c2096a38869fb3b7654116c920a70fc0772b5651849d16418edf16c4c88b', '82864d1a12ebc27834069a3ac469c68f32f8886608b91e6fffbfd1307ce5e13bd7305eaaeed7e734', 0, '2022-06-21 08:09:37');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `items` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `note`, `title`, `items`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'asdfasfasdf', 'آموزش های یودمی', '[{\"category_id\":{\"id\":2,\"name\":\"Category\",\"slug\":\"flsfdksnmmm99\",\"user_id\":2,\"created_at\":\"2021-03-16T00:54:57.000000Z\",\"updated_at\":\"2021-03-16T01:34:15.000000Z\"},\"item_id\":{\"id\":9,\"code\":\"Oprah Barr\",\"name\":\"Christine Pennington\",\"unit\":\"Laura Payne\",\"cost\":\"694.000\",\"price\":\"223.000\",\"image\":\"1623430532.png\",\"category_id\":1,\"quantity\":152,\"stock\":{\"id\":4,\"code\":\"Patience Morris\",\"name\":\"Paki Coleman\",\"manager\":\"Jessica Santos\",\"phone\":\"0723662366\",\"address\":\"Lee Erickson\",\"user_id\":2,\"created_at\":\"2021-06-08T13:14:11.000000Z\",\"updated_at\":\"2021-06-08T13:14:11.000000Z\"},\"stock_id\":4,\"barcode_symbology\":\"Colette Head\",\"product_details\":\"Sunt aut aut eum et\",\"tax\":\"553.000\",\"type\":\"Chantale Hunt\",\"supplier\":\"Yuri Knight\",\"supplier_price\":\"376\",\"sale_unit\":\"Jessamine Stewart\",\"purchase_unit\":\"Julie Dodson\",\"brand\":\"Kirestin Huber\",\"featured\":\"Laith Long\",\"user_id\":2,\"created_at\":\"2021-06-11T12:25:32.000000Z\",\"updated_at\":\"2021-06-11T12:25:32.000000Z\",\"category\":{\"id\":1,\"name\":\"Daipar\",\"slug\":\"d12\",\"user_id\":2,\"created_at\":\"2021-03-16T00:53:38.000000Z\",\"updated_at\":\"2021-03-16T04:49:55.000000Z\"}},\"unit_id\":{\"id\":2,\"name\":\"Gram\"},\"amount\":\"3223\",\"unit_price\":\"0\",\"total_price\":0}]', 12, '2021-06-16 17:43:12', NULL),
(3, '0799999999', 'a test file that can be deleted and some changes', '[{\"category_id\":{\"id\":7,\"name\":\"Zenia Young\",\"slug\":\"Hadassah Colon\",\"user_id\":2,\"created_at\":\"2021-06-14T17:16:20.000000Z\",\"updated_at\":\"2021-06-14T17:16:20.000000Z\"},\"item_id\":{\"id\":10,\"code\":\"Oprah Barr\",\"name\":\"Christine Pennington\",\"unit\":\"Laura Payne\",\"cost\":\"694.000\",\"price\":\"223.000\",\"image\":\"1623430532.png\",\"category_id\":1,\"quantity\":152,\"stock\":{\"id\":4,\"code\":\"Patience Morris\",\"name\":\"Paki Coleman\",\"manager\":\"Jessica Santos\",\"phone\":\"0723662366\",\"address\":\"Lee Erickson\",\"user_id\":2,\"created_at\":\"2021-06-08T13:14:11.000000Z\",\"updated_at\":\"2021-06-08T13:14:11.000000Z\"},\"stock_id\":4,\"barcode_symbology\":\"Colette Head\",\"product_details\":\"Sunt aut aut eum et\",\"tax\":\"553.000\",\"type\":\"Chantale Hunt\",\"supplier\":\"Yuri Knight\",\"supplier_price\":\"376\",\"sale_unit\":\"Jessamine Stewart\",\"purchase_unit\":\"Julie Dodson\",\"brand\":\"Kirestin Huber\",\"featured\":\"Laith Long\",\"user_id\":2,\"created_at\":\"2021-06-11T12:25:32.000000Z\",\"updated_at\":\"2021-06-11T12:25:32.000000Z\",\"category\":{\"id\":1,\"name\":\"Daipar\",\"slug\":\"d12\",\"user_id\":2,\"created_at\":\"2021-03-16T00:53:38.000000Z\",\"updated_at\":\"2021-03-16T04:49:55.000000Z\"}},\"unit_id\":{\"id\":2,\"name\":\"Gram\"},\"amount\":\"89\",\"unit_price\":\"0\",\"total_price\":0},{\"category_id\":{\"id\":7,\"name\":\"Zenia Young\",\"slug\":\"Hadassah Colon\",\"user_id\":2,\"created_at\":\"2021-06-14T17:16:20.000000Z\",\"updated_at\":\"2021-06-14T17:16:20.000000Z\"},\"item_id\":{\"id\":11,\"code\":\"Oprah Barr\",\"name\":\"Christine Pennington\",\"unit\":\"Laura Payne\",\"cost\":\"694.000\",\"price\":\"223.000\",\"image\":\"1623430532.png\",\"category_id\":1,\"quantity\":152,\"stock\":{\"id\":4,\"code\":\"Patience Morris\",\"name\":\"Paki Coleman\",\"manager\":\"Jessica Santos\",\"phone\":\"0723662366\",\"address\":\"Lee Erickson\",\"user_id\":2,\"created_at\":\"2021-06-08T13:14:11.000000Z\",\"updated_at\":\"2021-06-08T13:14:11.000000Z\"},\"stock_id\":4,\"barcode_symbology\":\"Colette Head\",\"product_details\":\"Sunt aut aut eum et\",\"tax\":\"553.000\",\"type\":\"Chantale Hunt\",\"supplier\":\"Yuri Knight\",\"supplier_price\":\"376\",\"sale_unit\":\"Jessamine Stewart\",\"purchase_unit\":\"Julie Dodson\",\"brand\":\"Kirestin Huber\",\"featured\":\"Laith Long\",\"user_id\":2,\"created_at\":\"2021-06-11T12:25:32.000000Z\",\"updated_at\":\"2021-06-11T12:25:32.000000Z\",\"category\":{\"id\":1,\"name\":\"Daipar\",\"slug\":\"d12\",\"user_id\":2,\"created_at\":\"2021-03-16T00:53:38.000000Z\",\"updated_at\":\"2021-03-16T04:49:55.000000Z\"}},\"unit_id\":{\"id\":3,\"name\":\"Liter\"},\"amount\":\"89898\",\"unit_price\":\"0\",\"total_price\":0},{\"category_id\":{\"id\":10,\"name\":\"Bo Nguyen\",\"slug\":\"Janna Cole\",\"user_id\":2,\"created_at\":\"2021-06-14T17:17:04.000000Z\",\"updated_at\":\"2021-06-14T17:17:04.000000Z\"},\"item_id\":{\"id\":10,\"code\":\"Oprah Barr\",\"name\":\"Christine Pennington\",\"unit\":\"Laura Payne\",\"cost\":\"694.000\",\"price\":\"223.000\",\"image\":\"1623430532.png\",\"category_id\":1,\"quantity\":152,\"stock\":{\"id\":4,\"code\":\"Patience Morris\",\"name\":\"Paki Coleman\",\"manager\":\"Jessica Santos\",\"phone\":\"0723662366\",\"address\":\"Lee Erickson\",\"user_id\":2,\"created_at\":\"2021-06-08T13:14:11.000000Z\",\"updated_at\":\"2021-06-08T13:14:11.000000Z\"},\"stock_id\":4,\"barcode_symbology\":\"Colette Head\",\"product_details\":\"Sunt aut aut eum et\",\"tax\":\"553.000\",\"type\":\"Chantale Hunt\",\"supplier\":\"Yuri Knight\",\"supplier_price\":\"376\",\"sale_unit\":\"Jessamine Stewart\",\"purchase_unit\":\"Julie Dodson\",\"brand\":\"Kirestin Huber\",\"featured\":\"Laith Long\",\"user_id\":2,\"created_at\":\"2021-06-11T12:25:32.000000Z\",\"updated_at\":\"2021-06-11T12:25:32.000000Z\",\"category\":{\"id\":1,\"name\":\"Daipar\",\"slug\":\"d12\",\"user_id\":2,\"created_at\":\"2021-03-16T00:53:38.000000Z\",\"updated_at\":\"2021-03-16T04:49:55.000000Z\"}},\"unit_id\":{\"id\":4,\"name\":\"Pack\"},\"amount\":\"08998\",\"unit_price\":\"0\",\"total_price\":0}]', 15, '2021-06-16 18:34:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `paid_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `sale_id`, `purchase_id`, `reference_no`, `amount`, `paid_by`, `account_id`, `created_by`, `type`, `note`, `approval_code`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 10, NULL, 'Amet neque qui fugi', '163181.000', 'Est enim magna lore', 3, 'Harum accusamus dese', 'Out', 'Placeat labore volu', 'Animi excepturi nos', 2, '2021-05-04 10:54:23', '2021-06-12 10:54:23'),
(6, 10, NULL, 'Delectus vel sit al', '4979.000', 'Rem eveniet consect', 4, 'Corporis totam disti', 'Out', 'Magna quia dolorem s', 'Incididunt voluptate', 2, '2021-06-12 10:57:29', '2021-06-12 10:57:29'),
(7, 10, NULL, 'Deleniti possimus e', '63085.000', 'Consectetur quis et', 3, 'Quia necessitatibus', 'Out', 'Enim nesciunt commo', 'Perferendis praesent', 2, '2021-06-12 10:59:34', '2021-06-12 10:59:34'),
(9, NULL, 13, 'Sit repudiandae qui', '23456.000', 'Ut est libero inven', 4, 'Voluptatum veritatis', 'Out', 'Consectetur quis ex', 'Molestiae esse volu', 2, '2021-06-12 13:35:50', '2021-06-12 13:35:50'),
(10, 12, NULL, 'Ducimus qui volupta', '1.000', 'Soluta rerum dolorem', 3, 'Consequatur dolorum', 'In', 'Asperiores doloremqu', 'Nesciunt aliqua Du', 2, '2021-06-16 16:43:16', '2021-06-16 16:43:16');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` decimal(10,3) NOT NULL,
  `price` decimal(10,3) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `stock` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_id` bigint(20) UNSIGNED NOT NULL,
  `barcode_symbology` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` decimal(10,3) DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `image`, `category_id`, `quantity`, `stock`, `stock_id`, `barcode_symbology`, `product_details`, `tax`, `type`, `supplier`, `supplier_price`, `sale_unit`, `purchase_unit`, `brand`, `featured`, `user_id`, `created_at`, `updated_at`) VALUES
(7, 'Oprah Barr23', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1624635183.jpeg', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-25 15:33:03'),
(8, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(9, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(10, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(11, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(12, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(13, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(14, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(15, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(16, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(17, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(18, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(19, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(20, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(21, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(22, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(23, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(24, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(25, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(26, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(27, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(28, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(29, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(30, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(31, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(32, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(33, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(34, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(35, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(36, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(37, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(38, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(39, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(40, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(41, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(42, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(43, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(44, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(45, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(46, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(47, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(48, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(49, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(50, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(51, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(52, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(53, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(54, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(55, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(56, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(57, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(58, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(59, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(60, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(61, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(62, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(63, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(64, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(65, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(66, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(67, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(68, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(69, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(70, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(71, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(72, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(73, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(74, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(75, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(76, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(77, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(78, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(79, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(80, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(81, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(82, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(83, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(84, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(85, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(86, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(87, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(88, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(89, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(90, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(91, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(92, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(93, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(94, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(95, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(96, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(97, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(98, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(99, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(100, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(101, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(102, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(103, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(104, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(105, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(106, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(107, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(108, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(109, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(110, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(111, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(112, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(113, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(114, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(115, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(116, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(117, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(118, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(119, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(120, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(121, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(122, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(123, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(124, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(125, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(126, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(127, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(128, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(129, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(130, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(131, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(132, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(133, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(134, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(135, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(136, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(137, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(138, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(139, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(140, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(141, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(142, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(143, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(144, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(145, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(146, 'Oprah Barr', 'Christine Pennington', 'Laura Payne', '694.000', '223.000', '1623430532.png', 1, 152, NULL, 4, 'Colette Head', 'Sunt aut aut eum et', '553.000', 'Chantale Hunt', 'Yuri Knight', '376', 'Jessamine Stewart', 'Julie Dodson', 'Kirestin Huber', 'Laith Long', 2, '2021-06-11 12:25:32', '2021-06-11 12:25:32'),
(147, 'Driscoll Dickson', 'Cailin Cooley', 'Christian Guy', '456.000', '687.000', '1623691096.jpeg', 2, 972, NULL, 5, 'Prescott Robertson', 'Dolorum quaerat et v', '113.000', 'Linda Carrillo', 'Rahim Morrow', '594', 'Marshall Blake', 'Renee Maddox', 'Julie Webster', 'Calista Rocha', 2, '2021-06-14 17:18:17', '2021-06-14 17:18:17'),
(148, 'Lacey Banks', 'Caesar Hart', 'Blaine Vang', '173.000', '979.000', '1623944237.jpeg', 7, 442, NULL, 5, 'Malik Bradford', 'Ea in harum voluptas', '462.000', 'Amena Bates', 'Vance Buckley', '366', 'Aristotle Hill', 'Kylie Arnold', 'Stone Walton', 'Nero Barron', 2, '2021-06-17 15:37:17', '2021-06-17 15:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `vendor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_id` bigint(20) UNSIGNED NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(10,3) NOT NULL,
  `discount` decimal(10,3) DEFAULT NULL,
  `total_tax` decimal(10,3) DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `due_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `reference_no`, `date`, `vendor_id`, `vendor`, `stock_id`, `note`, `total`, `discount`, `total_tax`, `payment_status`, `user_id`, `due_date`, `created_at`, `updated_at`) VALUES
(13, '222', '2021-06-12T00:00:00.000Z', 1, 'sdoiu', 4, 'Modi excepteur simil', '784.000', '5.000', '956.000', 'none', 2, '2021-06-12T00:00:00.000Z', '2021-06-12 13:17:17', '2021-06-12 13:34:39');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2021-06-09 11:48:28', '2021-06-09 11:48:28'),
(2, 'accounter', 'web', '2021-06-09 11:48:28', '2021-06-09 11:48:28'),
(3, 'customer', 'web', '2021-06-09 11:48:28', '2021-06-09 11:48:28');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `customer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biller_id` bigint(20) UNSIGNED NOT NULL,
  `biller` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(10,3) NOT NULL,
  `sale_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` decimal(10,3) DEFAULT NULL,
  `product_tax` decimal(10,3) DEFAULT NULL,
  `payment_term` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_items` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `stock_id`, `total`, `sale_status`, `payment_status`, `due_date`, `note`, `discount`, `product_tax`, `payment_term`, `total_items`, `pos`, `paid`, `user_id`, `created_at`, `updated_at`) VALUES
(10, '2021-06-12T00:00:00.000Z', '573', 8, 'Current', 11, 'Nasser', 4, '277056.000', 'active', 'none', '2021-06-12T00:00:00.000Z', 'Labore ex vel volupt', '997.000', '920.000', '532', '189', '584', '381', 2, '2021-06-12 10:11:18', '2021-06-12 10:11:18'),
(11, '2021-06-14T00:00:00.000Z', '590', 6, 'sijefyhuj@mailinator.com', 10, 'Nasser', 5, '664452.000', 'active', 'none', '2021-06-14T00:00:00.000Z', 'Hic proident in duc', '278.000', '453.000', '866', '890', '803', '205', 2, '2021-06-14 17:18:40', '2021-06-19 12:53:42'),
(12, '2021-06-14T00:00:00.000Z', '34', 6, 'sijefyhuj@mailinator.com', 10, 'Nasser', 5, '202120.000', 'active', 'none', '2021-06-14T00:00:00.000Z', 'Dicta tempore quia', '501.000', '482.000', '157', '917', '805', '192', 2, '2021-06-14 17:19:07', '2021-06-14 17:19:07');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `code`, `name`, `manager`, `phone`, `address`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 'Patience Morris', 'Paki Coleman', 'Jessica Santos', '0723662366', 'Lee Erickson', 2, '2021-06-08 13:14:11', '2021-06-08 13:14:11'),
(5, 'Maisie Valentine', 'Adele Joyner', 'Cullen Greene', '0765432123', 'Inga House', 2, '2021-06-14 17:17:48', '2021-06-14 17:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `stock_records`
--

CREATE TABLE `stock_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` int(11) NOT NULL,
  `increment` decimal(8,2) NOT NULL,
  `decrement` decimal(8,2) NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `stock_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_records`
--

INSERT INTO `stock_records` (`id`, `type_id`, `type`, `unit_id`, `increment`, `decrement`, `unit_price`, `total_price`, `category_id`, `stock_id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(36, 10, 'sale', 3, '0.00', '444.00', '624.00', '277056.00', 2, 4, 148, 2, '2021-06-12 10:11:18', '2021-06-12 10:11:18'),
(37, 6, 'purchase', 3, '567.00', '0.00', '865.00', '490455.00', 1, 4, 147, 2, '2021-06-12 11:02:05', '2021-06-12 11:02:05'),
(42, 12, 'sale', 3, '0.00', '815.00', '248.00', '202120.00', 1, 5, 145, 2, '2021-06-14 17:19:07', '2021-06-14 17:19:07'),
(43, 12, 'sale', 4, '0.00', '0.00', '0.00', '0.00', 7, 5, 144, 2, '2021-06-14 17:19:07', '2021-06-14 17:19:07'),
(44, 2, 'in-transfer', 3, '512.00', '0.00', '590.00', '302080.00', 2, 5, 143, 2, '2021-06-16 16:18:44', '2021-06-16 16:18:44'),
(45, 2, 'out-transfer', 3, '0.00', '512.00', '590.00', '302080.00', 2, 5, 148, 2, '2021-06-16 16:18:44', '2021-06-16 16:18:44'),
(114, 11, 'sale', 2, '0.00', '860.00', '734.00', '631240.00', 2, 5, 146, 2, '2021-06-19 12:53:42', '2021-06-19 12:53:42'),
(115, 11, 'sale', 4, '0.00', '2323.00', '12.00', '27876.00', 7, 5, 10, 2, '2021-06-19 12:53:42', '2021-06-19 12:53:42'),
(116, 11, 'sale', 3, '0.00', '232.00', '23.00', '5336.00', 2, 5, 10, 2, '2021-06-19 12:53:42', '2021-06-19 12:53:42'),
(117, 1, 'in-transfer', 3, '265.00', '0.00', '980.00', '259700.00', 2, 4, 144, 2, '2022-03-21 14:33:32', '2022-03-21 14:33:32'),
(118, 1, 'out-transfer', 3, '0.00', '265.00', '980.00', '259700.00', 2, 4, 144, 2, '2022-03-21 14:33:32', '2022-03-21 14:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `credit` decimal(10,3) DEFAULT NULL,
  `debit` decimal(10,3) DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `type`, `type_id`, `credit`, `debit`, `account_id`, `status`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'payment', 2, '99.000', '0.000', 1, 'rejected', '---', 2, '2021-05-23 11:18:25', '2021-05-23 11:34:16'),
(2, 'payment', 2, '99.000', '0.000', 1, 'rejected', '---', 2, '2021-05-23 11:18:43', '2021-05-23 11:34:16'),
(3, 'payment', 2, '99.000', '0.000', 1, 'rejected', '---', 2, '2021-05-23 11:22:07', '2021-05-23 11:34:16'),
(4, 'payment', 2, '99.000', '0.000', 1, 'rejected', '---', 2, '2021-05-23 11:24:29', '2021-05-23 11:34:16'),
(5, 'payment', 2, '0.000', '0.000', 1, 'rejected', '---', 2, '2021-05-23 11:32:52', '2021-05-23 11:34:16'),
(6, 'payment', 2, '0.000', '0.000', 1, 'rejected', '---', 2, '2021-05-23 11:33:17', '2021-05-23 11:34:16'),
(7, 'payment', 2, '0.000', '93.000', 1, 'Out', '---', 2, '2021-05-23 11:34:16', '2021-05-23 11:34:16'),
(8, 'payment', 1, '50.000', NULL, 3, 'Out', '---', 2, '2021-05-23 11:50:51', '2021-05-23 11:50:51'),
(9, 'fixpayment', 1, '340.000', NULL, 3, 'rejected', '---', 2, '2021-05-23 11:51:18', '2021-05-23 11:51:37'),
(10, 'fixpayment', 1, '0.000', '63.000', 3, 'Out', '---', 2, '2021-05-23 11:51:37', '2021-05-23 11:51:37'),
(11, 'fixpayment', 2, '0.000', '39.000', 3, 'Out', '---', 2, '2021-05-23 11:53:39', '2021-05-23 11:53:39'),
(12, 'payment', 3, '0.000', '69.000', 3, 'Out', '---', 2, '2021-05-23 11:53:51', '2021-05-23 11:53:51'),
(13, 'payment', 4, '0.000', '14.000', 2, 'rejected', '---', 2, '2021-05-31 12:05:29', '2021-06-08 13:23:23'),
(14, 'payment', 4, '0.000', '37.000', 2, 'rejected', '---', 2, '2021-06-08 13:22:34', '2021-06-08 13:23:23'),
(15, 'payment', 4, '0.000', '37.000', 2, 'Out', '---', 2, '2021-06-08 13:23:23', '2021-06-08 13:23:23'),
(16, 'payment', 5, '0.000', '16.000', 3, 'Out', '---', 2, '2021-06-12 10:54:23', '2021-06-12 10:54:23'),
(17, 'payment', 6, '0.000', '49.000', 4, 'Out', '---', 2, '2021-06-12 10:57:29', '2021-06-12 10:57:29'),
(18, 'payment', 7, '0.000', '65.000', 3, 'Out', '---', 2, '2021-06-12 10:59:34', '2021-06-12 10:59:34'),
(19, 'payment', 8, '39.000', '0.000', 4, 'In', '---', 2, '2021-06-12 11:02:27', '2021-06-12 11:02:27'),
(20, 'payment', 9, '0.000', '0.000', 4, 'Out', '---', 2, '2021-06-12 13:35:50', '2021-06-12 13:35:50'),
(21, 'payment', 10, '1.000', '0.000', 3, 'In', '---', 2, '2021-06-16 16:43:16', '2021-06-16 16:43:16'),
(22, 'payment', 2, '199.000', '0.000', 1, 'rejected', '---', 2, '2021-02-23 11:18:25', '2021-02-23 11:34:16'),
(23, 'payment', 2, '199.000', '0.000', 1, 'rejected', '---', 2, '2021-02-23 11:18:43', '2021-02-23 11:34:16'),
(24, 'payment', 2, '199.000', '0.000', 1, 'rejected', '---', 2, '2021-02-23 11:22:07', '2021-02-23 11:34:16'),
(25, 'payment', 2, '199.000', '0.000', 1, 'rejected', '---', 2, '2021-02-23 11:24:29', '2021-02-23 11:34:16'),
(26, 'payment', 2, '10.000', '0.000', 1, 'rejected', '---', 2, '2021-02-23 11:32:52', '2021-02-23 11:34:16'),
(27, 'payment', 2, '10.000', '0.000', 1, 'rejected', '---', 2, '2021-02-23 11:33:17', '2021-02-23 11:34:16'),
(28, 'payment', 2, '10.000', '93.000', 1, 'Out', '---', 2, '2021-02-23 11:34:16', '2021-02-23 11:34:16'),
(29, 'payment', 1, '50.000', NULL, 3, 'Out', '---', 2, '2021-02-23 11:50:51', '2021-02-23 11:50:51'),
(30, 'fixpayment', 1, '340.000', NULL, 3, 'rejected', '---', 2, '2021-02-23 11:51:18', '2021-02-23 11:51:37'),
(31, 'fixpayment', 1, '0.000', '63.000', 3, 'Out', '---', 2, '2021-02-23 11:51:37', '2021-02-23 11:51:37'),
(32, 'fixpayment', 2, '10.000', '39.000', 3, 'Out', '---', 2, '2021-02-23 11:53:39', '2021-02-23 11:53:39'),
(33, 'payment', 3, '0.000', '69.000', 3, 'Out', '---', 2, '2021-02-23 11:53:51', '2021-02-23 11:53:51'),
(34, 'payment', 2, '199.000', '0.000', 2, 'rejected', '---', 2, '2021-04-23 11:18:25', '2021-04-23 11:34:16'),
(35, 'payment', 2, '199.000', '0.000', 2, 'rejected', '---', 2, '2021-04-23 11:18:43', '2021-04-23 11:34:16'),
(36, 'payment', 2, '199.000', '0.000', 2, 'rejected', '---', 2, '2021-04-23 11:22:07', '2021-04-23 11:34:16'),
(37, 'payment', 2, '199.000', '0.000', 2, 'rejected', '---', 2, '2021-04-23 11:24:29', '2021-04-23 11:34:16'),
(38, 'payment', 2, '10.000', '0.000', 2, 'rejected', '---', 2, '2021-04-23 11:32:52', '2021-04-23 11:34:16'),
(39, 'payment', 2, '10.000', '0.000', 2, 'rejected', '---', 2, '2021-04-23 11:33:17', '2021-04-23 11:34:16'),
(40, 'payment', 2, '10.000', '93.000', 1, 'Out', '---', 2, '2021-04-23 11:34:16', '2021-04-23 11:34:16'),
(41, 'payment', 1, '50.000', NULL, 4, 'Out', '---', 2, '2021-04-23 11:50:51', '2021-04-23 11:50:51'),
(42, 'fixpayment', 1, '340.000', NULL, 4, 'rejected', '---', 2, '2021-04-23 11:51:18', '2021-04-23 11:51:37'),
(43, 'fixpayment', 1, '0.000', '63.000', 4, 'Out', '---', 2, '2021-04-23 11:51:37', '2021-04-23 11:51:37'),
(44, 'fixpayment', 2, '10.000', '39.000', 4, 'Out', '---', 2, '2021-04-23 11:53:39', '2021-04-23 11:53:39'),
(45, 'payment', 4, '0.000', '69.000', 4, 'Out', '---', 2, '2021-04-23 11:53:51', '2021-04-23 11:53:51'),
(46, 'fixpayment', 1, '0.000', '32.000', 6, 'Out', '---', 2, '2021-06-25 13:22:53', '2021-06-25 13:22:53'),
(47, 'fixpayment', 2, '90.000', '0.000', 2, 'In', '---', 2, '2021-06-25 13:23:22', '2021-06-25 13:23:22');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `source_stock` bigint(20) UNSIGNED NOT NULL,
  `target_stock` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `approval_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `source_stock`, `target_stock`, `amount`, `approval_status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 4, 4, '259700.000', 'Approved', 2, '2021-06-12 13:29:59', '2022-03-21 14:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `branch_id`, `first_name`, `last_name`, `user_type`, `position`, `email`, `phone`, `address`, `password`, `image`, `deleted_at`, `created_at`, `updated_at`, `status`) VALUES
(2, 2, 'Super', 'Admin', '1', 'General Site Admin', 'siteadmin@gmail.com', '0781328723', 'mahdi', '$2y$10$sv6pfKeXBKlACrkwPHeOM.g4K7Mg/RUjtOfyI7WCuDG8Uo3S2L.YW', '1609240818.png', NULL, '2020-12-23 02:18:10', '2021-02-17 00:12:55', 'Approved'),
(9, 2, 'Nasser', '123456789', '3', '', 'n.kawerimi@gmail.com', '072044920', '9170 N. Beacon Rd', '$2y$10$KIH7R4yp1QlEi03BIuqmm.zgHB5CMhvZX2Vq9lPY8gOeEQP48xuVy', NULL, NULL, '2021-03-12 03:50:21', '2021-06-10 13:21:20', 'Approved'),
(10, 2, 'Nasser', 'Karimi', '3', '', 'karimi@gmail.com', '07440462278', 'Kabul, Afghanistan', '$2y$10$bt.yG/KJlVLkGzBb.Ikm1OKCiCotyRFeVVWU7gMqFc.yGVLepnsk2', NULL, NULL, '2021-03-12 04:58:31', '2021-06-10 13:21:10', 'Approved'),
(11, 2, 'Nasser', 'Karimi', '3', '', 'karimi2@gmail.com', '07440462278', 'Kabul, Afghanistan', '$2y$10$6ImNZFVM9yJ7jePyKf7qEO59np2v9VuXXeZREIMYD8LlnlIafmdrC', NULL, NULL, '2021-03-12 04:58:55', '2021-06-10 13:07:58', 'Approved'),
(12, 5, 'Tasha', 'Allen', '', '', 'qegufuj@mailinator.com', '0766241789', 'Lorem ex fugiat quod', '$2y$10$Ykt0FCvFlq/SdLmJ1eOM7u9zB1MiGQY4pk4FuaJRJ3qkGchhRS5D.', NULL, NULL, '2021-06-14 17:26:14', '2021-06-14 17:30:40', 'Approved'),
(13, NULL, 'davu@mailinator.com', 'davu@mailinator.com', NULL, NULL, 'higaly@mailinator.com', '0777777777', 'teliququ@mailinator.com', '$2y$10$vKKlQwo55Pvn62EiWg8Lpu8cD54jY.mZjvgWiToBbALkobkz.Ww5G', NULL, NULL, '2021-06-16 18:28:19', '2021-06-16 18:28:19', 'Pending'),
(14, NULL, 'kidyz@mailinator.com', 'kidyz@mailinator.com', NULL, NULL, 'sivubev@mailinator.com', '0788888888', 'fibusaza@mailinator.com', '$2y$10$jpwhNtfOOgKjaqqYe8f5P..BG8hwGxQrpqPZiO.dS.8DvqZT1fi7m', NULL, NULL, '2021-06-16 18:30:21', '2021-06-16 18:30:21', 'Approved'),
(15, 2, 'nomerened@mailinator.com', 'nomerened@mailinator.com', NULL, NULL, 'bupoqama@mailinator.com', '0799999999', 'nicumipoka@mailinator.com', '$2y$10$mz8YjTtk1K8vr/3mS9r2kuJ/yivvlAQeTI7gvPbyGGVth8Jh2II16', NULL, NULL, '2021-06-16 18:31:31', '2021-06-16 18:31:31', 'Approved'),
(16, 2, 'Nasser', 'Karimi', '', '', 'siteadmin12@gmail.com', '0766241789', 'Jamal Qazna Alley, left hand side, 3rd greed door', '$2y$10$1jhF1ohkxaXv51CxKrGH9upQ0TsAa77zOLox2vjVMO1dHDNQ9CxvC', NULL, NULL, '2021-07-19 07:27:40', '2021-07-19 07:27:40', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `email`, `phone`, `website`, `address`, `logo`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'sdoiu', 'oiuoifdu3s@gmail.com', '0766241789', 'ofuoUF', 'OUF', '1623158306.jpeg', 2, '2021-03-26 03:10:45', '2021-06-08 08:48:26'),
(2, 'afs', 'posiois@gamil..com', '238942842948', 'lfksjdlfk', 'jfl', '1616753026.jpeg', 2, '2021-03-26 05:33:46', '2021-03-26 05:33:46'),
(3, 'sdoiu', 'oiuoifdus@gmail.com', '10293832094', 'ofuoUF', 'OUF', '1622475711.jpeg', 2, '2021-05-31 11:11:51', '2021-05-31 11:11:51'),
(5, 'Current', 'n5asseralikarimi@gmail.com', '0766241789', 'fulafaqybe@mailinator.com', 'Jamal Qazna Alley, left hand side, 3rd greed door', '1623083627.jpeg', 12, '2021-06-07 12:03:47', '2021-06-07 12:03:47'),
(7, 'Current', 'n5as3seralikarimi@gmail.com', '0766241789', 'fulafaqybe@mailinator.com', 'Jamal Qazna Alley, left hand side, 3rd greed door', '1623085212.jpeg', 12, '2021-06-07 12:05:58', '2021-06-07 12:30:12'),
(8, 'Current', 'nasseralikarimi@gmail.com2', '0766241789', 'nizekyci@mailinator.com', 'Jamal Qazna Alley, left hand side, 3rd greed door', '1623085229.jpeg', 12, '2021-06-07 12:06:59', '2021-06-07 12:30:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_user_id_foreign` (`user_id`),
  ADD KEY `accounts_account_user_id_foreign` (`account_user_id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fix_payments`
--
ALTER TABLE `fix_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fix_payments_account_id_foreign` (`account_id`),
  ADD KEY `fix_payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `fix_purchases`
--
ALTER TABLE `fix_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fix_purchases_account_id_foreign` (`account_id`),
  ADD KEY `fix_purchases_user_id_foreign` (`user_id`);

--
-- Indexes for table `item_records`
--
ALTER TABLE `item_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_records_user_id_foreign` (`user_id`),
  ADD KEY `item_records_stock_id_index` (`stock_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifs`
--
ALTER TABLE `notifs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifs_user_id_foreign` (`user_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_sale_id_foreign` (`sale_id`),
  ADD KEY `payments_purchase_id_foreign` (`purchase_id`),
  ADD KEY `payments_account_id_foreign` (`account_id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_stock_id_foreign` (`stock_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_vendor_id_foreign` (`vendor_id`),
  ADD KEY `purchases_stock_id_foreign` (`stock_id`),
  ADD KEY `purchases_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_customer_id_foreign` (`customer_id`),
  ADD KEY `sales_biller_id_foreign` (`biller_id`),
  ADD KEY `sales_stock_id_foreign` (`stock_id`),
  ADD KEY `sales_user_id_foreign` (`user_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocks_user_id_foreign` (`user_id`);

--
-- Indexes for table `stock_records`
--
ALTER TABLE `stock_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_records_user_id_foreign` (`user_id`),
  ADD KEY `stock_records_stock_id_foreign` (`stock_id`),
  ADD KEY `stock_records_product_id_foreign` (`product_id`),
  ADD KEY `stock_records_category_id_foreign` (`category_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_account_id_foreign` (`account_id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers_user_id_foreign` (`user_id`),
  ADD KEY `transfers_source_stock_foreign` (`source_stock`),
  ADD KEY `transfers_target_stock_foreign` (`target_stock`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`),
  ADD KEY `vendors_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fix_payments`
--
ALTER TABLE `fix_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fix_purchases`
--
ALTER TABLE `fix_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_records`
--
ALTER TABLE `item_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `notifs`
--
ALTER TABLE `notifs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stock_records`
--
ALTER TABLE `stock_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_account_user_id_foreign` FOREIGN KEY (`account_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fix_payments`
--
ALTER TABLE `fix_payments`
  ADD CONSTRAINT `fix_payments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fix_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fix_purchases`
--
ALTER TABLE `fix_purchases`
  ADD CONSTRAINT `fix_purchases_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fix_purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_records`
--
ALTER TABLE `item_records`
  ADD CONSTRAINT `item_records_stock_id_foreign` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_records_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifs`
--
ALTER TABLE `notifs`
  ADD CONSTRAINT `notifs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_stock_id_foreign` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_stock_id_foreign` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_biller_id_foreign` FOREIGN KEY (`biller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_stock_id_foreign` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_records`
--
ALTER TABLE `stock_records`
  ADD CONSTRAINT `stock_records_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_records_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_records_stock_id_foreign` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_records_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_source_stock_foreign` FOREIGN KEY (`source_stock`) REFERENCES `stocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_target_stock_foreign` FOREIGN KEY (`target_stock`) REFERENCES `stocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendors`
--
ALTER TABLE `vendors`
  ADD CONSTRAINT `vendors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
