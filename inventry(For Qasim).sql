-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 12, 2021 at 05:01 PM
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
(3, 2, 2, 'Account USD AIB', '1', NULL, '2021-03-15 05:43:59', '2021-03-15 05:43:59');

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
(1, 'HERAT-0012', 'Herat', 'herat', NULL, NULL),
(2, 'KABUL-0012', 'Kabul', 'kabul', NULL, NULL),
(3, 'Qui aut sint volupta', 'Abra Rose', 'Ea dicta eum assumen', '2021-03-14 03:16:52', '2021-03-14 03:16:52'),
(4, 'Recusandae Enim dol', 'Nero Davis', 'Voluptatem lorem ape', '2021-03-14 03:20:15', '2021-03-14 03:20:15');

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
(2, 'Category', 'flsfdksnmmm99', 2, '2021-03-16 00:54:57', '2021-03-16 01:34:15');

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
(2, 'Customer 23`', 'c12@gmail.com', 'laskjf029039', 'lsdfj2392039', 'lsdfjalkfs', NULL, 2, '2021-03-23 01:49:33', '2021-03-23 01:49:33'),
(3, 'wr', 'wr', 'wer', NULL, NULL, '1616482728.png', 2, '2021-03-23 02:28:48', '2021-03-23 02:28:48'),
(4, 'alskfdj', 'lkfajsflk', 'jflkjfl', 'fjlsajf', 'ljflkj', '1616752339.jpeg', 2, '2021-03-26 05:22:19', '2021-03-26 05:22:19');

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
-- Table structure for table `fix_purchases`
--

CREATE TABLE `fix_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `receiver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_account_id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(10, '2021_03_02_141708_create_permission_tables', 1),
(11, '2021_03_02_142015_create_categories_table', 1),
(12, '2021_03_02_142033_create_customers_table', 1),
(13, '2021_03_02_142049_create_vendors_table', 1),
(14, '2021_03_02_142228_create_stocks_table', 1),
(15, '2021_03_02_142300_create_products_table', 1),
(16, '2021_03_02_142301_create_stock_records_table', 1),
(17, '2021_03_02_142313_create_sales_table', 1),
(18, '2021_03_02_142326_create_purchases_table', 1),
(19, '2021_03_02_142421_create_payments_table', 1),
(20, '2021_03_02_142435_create_fix_purchases_table', 1),
(21, '2021_03_02_142513_create_transfers_table', 1),
(22, '2021_03_02_142529_create_transactions_table', 1),
(23, '2021_03_11_140548_create_tests_table', 1);

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
('11188eff051aab163325913a9879291aa15dfe16e8ba3bb221fec325adc23e957b14f6fe280c304b', 2, 1, NULL, '[\"*\"]', 0, '2021-03-12 05:00:19', '2021-03-12 05:00:19', '2022-03-12 09:30:19'),
('1ead9398a6bf7170854cb196d2e617b0e03e002fdf60ddbf5fd7131d67f110e828f0a688a9db31d4', 2, 1, NULL, '[\"*\"]', 0, '2021-03-11 11:36:11', '2021-03-11 11:36:11', '2022-03-11 16:06:11'),
('25f14fff83ff09dd8a2e8325844af3c4becb1501684a9c3658a1740fe904c6fbe810ec93b064a24b', 2, 1, NULL, '[\"*\"]', 0, '2021-03-12 03:57:51', '2021-03-12 03:57:51', '2022-03-12 08:27:51'),
('2aa468c38b5a33659c306c2eaed29434bef5c17d55c4ebdc105862a50b905366ce0b594d57c01a65', 2, 1, NULL, '[\"*\"]', 0, '2021-03-12 03:56:56', '2021-03-12 03:56:56', '2022-03-12 08:26:56'),
('2ed71b6c8a9d533fb22b00adf780afded563424dcbc4b67ac56f9b0aef3ad7991e0777e306d75554', 2, 1, NULL, '[\"*\"]', 0, '2021-03-11 11:31:35', '2021-03-11 11:31:35', '2022-03-11 16:01:35'),
('34118df118e7c9e9f8c6f5fd161d1fee430b67605698634d03ecb9d67d3242c2d1d6c662a4fc5ece', 2, 1, NULL, '[\"*\"]', 0, '2021-03-14 00:46:45', '2021-03-14 00:46:45', '2022-03-14 05:16:45'),
('43add5b081ccdaaaf74da25f950e7e4dbd8bfd0ea66ed16fd26663aa3215c8e324e0b66c950fce63', 2, 1, NULL, '[\"*\"]', 0, '2021-03-14 03:40:44', '2021-03-14 03:40:44', '2022-03-14 08:10:44'),
('51c3cc14c9927c745bba686a1b7c448de12ea98175515054bb6fe38bedc3bd53efd8e0dd931fd6ff', 7, 1, NULL, '[\"*\"]', 0, '2021-03-12 03:28:00', '2021-03-12 03:28:00', '2022-03-12 07:58:00'),
('6695cea2d2248128acbff325312f9afad91646a9651f297b8bdd288803953bb022f13c36a674052b', 2, 1, NULL, '[\"*\"]', 0, '2021-03-11 11:32:35', '2021-03-11 11:32:35', '2022-03-11 16:02:35'),
('7834c5374fd98ad5e14f793e924d826e53d6df1cdfe033adefad96c9b379b53046601ffe24f35029', 2, 1, NULL, '[\"*\"]', 0, '2021-03-14 03:32:29', '2021-03-14 03:32:29', '2022-03-14 08:02:29'),
('80bbb0bd06b04dd18ee5daa56cbafa479fcad76a24e8537d013931808199be6a3bb055f0c6d78e84', 6, 1, NULL, '[\"*\"]', 0, '2021-03-12 01:56:07', '2021-03-12 01:56:07', '2022-03-12 06:26:07'),
('8fc637c91c3a11151a5ca66aa4bdc04278d7e11309b2fd85b6371892094a580a0f0c04ce06a85d0e', 2, 1, NULL, '[\"*\"]', 0, '2021-03-27 06:47:02', '2021-03-27 06:47:02', '2022-03-27 11:17:02'),
('a2dba823d829d4821ea4dbde42b22683980a84729ebc315ae012ca592b13f5e1a2b978a163f9310e', 2, 1, NULL, '[\"*\"]', 0, '2021-03-23 00:49:05', '2021-03-23 00:49:05', '2022-03-23 05:19:05'),
('a540c2538d35579a0c88e78db56860167ebcc69124a1d0e712b96594582c9e3ffc0c8b9cef31ff20', 2, 1, NULL, '[\"*\"]', 0, '2021-03-11 11:25:36', '2021-03-11 11:25:36', '2022-03-11 15:55:36'),
('b6ffe6763fdf3f7015f9a329cf5d66157b4a1d04236d96db5bf0580c8f9f2519dc683df1ac7c215f', 2, 1, NULL, '[\"*\"]', 0, '2021-04-06 03:54:16', '2021-04-06 03:54:16', '2022-04-06 08:24:16'),
('b7a42fcb9b0ccf7092decefce1c9acfc4f7908c7e86bfa6708c526dcd4169d2e1f42a7a64b4797e0', 10, 1, NULL, '[\"*\"]', 0, '2021-03-12 04:59:40', '2021-03-12 04:59:40', '2022-03-12 09:29:40'),
('deae9d23d48bb251eb966b9781d4e330e48b1cab42dd508988cdddcb1f1b8c772f1c968817da4de1', 2, 1, NULL, '[\"*\"]', 0, '2021-03-23 01:38:41', '2021-03-23 01:38:41', '2022-03-23 06:08:41');

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
('056f337fc40fd4f9067b21cacdfacb79d610434d82a6c93f5166e738c3444e5418013a483c27fda4', '1ead9398a6bf7170854cb196d2e617b0e03e002fdf60ddbf5fd7131d67f110e828f0a688a9db31d4', 0, '2022-03-11 16:06:11'),
('345dc8cf7dbd24e8de0012d3036a3890e9e1b475b14869196f52fe44795de08ace08076d2f7ac308', '51c3cc14c9927c745bba686a1b7c448de12ea98175515054bb6fe38bedc3bd53efd8e0dd931fd6ff', 0, '2022-03-12 07:58:00'),
('3cfe2aaea217bc4f8eaf6ac207b141f330e0652ba074072cce52646de6d2b8e7112eec533f70155b', '11188eff051aab163325913a9879291aa15dfe16e8ba3bb221fec325adc23e957b14f6fe280c304b', 0, '2022-03-12 09:30:19'),
('3db2c2f910d230fa27529941d0125d7c0ff6c5a771b529787740233eebb21365b0ddb828eb35285c', '34118df118e7c9e9f8c6f5fd161d1fee430b67605698634d03ecb9d67d3242c2d1d6c662a4fc5ece', 0, '2022-03-14 05:16:45'),
('4b48bbac0f1b14cf73ad05e7352904df726d41f5039961b0b37a7ba8f797dbfd0561ec490122061f', 'b7a42fcb9b0ccf7092decefce1c9acfc4f7908c7e86bfa6708c526dcd4169d2e1f42a7a64b4797e0', 0, '2022-03-12 09:29:40'),
('66afe56e55a5c208845ca45a0914da59996dad1a27b1b120edd1af04f6bf7e6f1873601a186b2f17', 'b6ffe6763fdf3f7015f9a329cf5d66157b4a1d04236d96db5bf0580c8f9f2519dc683df1ac7c215f', 0, '2022-04-06 08:24:16'),
('66ecb54dcc80706804c231ed69ce1418f130af1e5c0b192e3c1a11d16fc69a323564c69f0c3bbc68', 'deae9d23d48bb251eb966b9781d4e330e48b1cab42dd508988cdddcb1f1b8c772f1c968817da4de1', 0, '2022-03-23 06:08:41'),
('7864120dc2ef3d1d026891bac209e686a20fa725b87467a0b856fc495597724752a3ce6ad6a90bfb', '25f14fff83ff09dd8a2e8325844af3c4becb1501684a9c3658a1740fe904c6fbe810ec93b064a24b', 0, '2022-03-12 08:27:51'),
('905795cd2e0615bf6612ec273f7d60903b5c95377a3071a9aa884937c7c8f9427ad4f64a18402c86', '2ed71b6c8a9d533fb22b00adf780afded563424dcbc4b67ac56f9b0aef3ad7991e0777e306d75554', 0, '2022-03-11 16:01:35'),
('9b2c04363a45b7a7fbf5cfe83a59bcef0261a113af8486d1a77c3ce5f76bef585590a26c434c65cb', '8fc637c91c3a11151a5ca66aa4bdc04278d7e11309b2fd85b6371892094a580a0f0c04ce06a85d0e', 0, '2022-03-27 11:17:02'),
('b5d526488460583791b8e0f306c430cb7e6a5d35be7d2f69d9156cd496037fc9360d189c7cacfbfd', '7834c5374fd98ad5e14f793e924d826e53d6df1cdfe033adefad96c9b379b53046601ffe24f35029', 0, '2022-03-14 08:02:29'),
('bb6a196e17961c8eed0af69b05705fb480acc47626cbe754470adf52a76e79e5823b2be4c1412344', '80bbb0bd06b04dd18ee5daa56cbafa479fcad76a24e8537d013931808199be6a3bb055f0c6d78e84', 0, '2022-03-12 06:26:07'),
('d84b7d51c7a61f4d657ef90c312b7ed598c0ff595bfca42a124dee43d54269d858f5d731a3267af7', '43add5b081ccdaaaf74da25f950e7e4dbd8bfd0ea66ed16fd26663aa3215c8e324e0b66c950fce63', 0, '2022-03-14 08:10:44'),
('ea5f2ad523644b88b9f3c960c9212c76f31014951d89ee2aa12aaf504b8667c3f88c61132379fbbd', '2aa468c38b5a33659c306c2eaed29434bef5c17d55c4ebdc105862a50b905366ce0b594d57c01a65', 0, '2022-03-12 08:26:56'),
('eebd894802cc823abbed0481c0eb190cc010ef267e5f54bd828b0af912dddf51377cb52555910afd', 'a2dba823d829d4821ea4dbde42b22683980a84729ebc315ae012ca592b13f5e1a2b978a163f9310e', 0, '2022-03-23 05:19:06'),
('f6b7f13754892b872a757d8f54609b3c37e8d3a9ef745019f484a56f39dd368075bdbe38e6050ef2', 'a540c2538d35579a0c88e78db56860167ebcc69124a1d0e712b96594582c9e3ffc0c8b9cef31ff20', 0, '2022-03-11 15:55:36');

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
(1, 'dslkfj', 'Anietie', 'lfkdsj', 'lfdj', 'lfj', 2, '2021-03-26 06:11:46', '2021-03-26 06:11:46'),
(2, ';flk', 'sa;fdlk', ';flk', ';lfk;lfk;', 'lkf;lfk', 2, '2021-03-26 06:16:20', '2021-03-26 06:16:20'),
(3, 'fj', 'asdlkfjl', 'lkjf', '09732761768', 'lkfj', 2, '2021-03-26 06:18:01', '2021-03-26 06:18:01');

-- --------------------------------------------------------

--
-- Table structure for table `stock_records`
--

CREATE TABLE `stock_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `increment` decimal(8,2) NOT NULL,
  `decrement` decimal(8,2) NOT NULL,
  `product_price` decimal(8,2) NOT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `source_account` bigint(20) UNSIGNED NOT NULL,
  `target_account` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `approval_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `branch_id`, `first_name`, `last_name`, `user_type`, `position`, `email`, `phone`, `address`, `password`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 1, 'Super', 'Admin', '1', 'General Site Admin', 'siteadmin@gmail.com', '0781328723', 'mahdi', '$2y$10$6ImNZFVM9yJ7jePyKf7qEO59np2v9VuXXeZREIMYD8LlnlIafmdrC', '1609240818.png', NULL, '2020-12-23 02:18:10', '2021-02-17 00:12:55'),
(8, NULL, 'Nasser', '123456789', '', '', 'n.karimi@gmail.com', '072044920', '9170 N. Beacon Rd', '$2y$10$ieyTBmfLHf9ZVtSZyBFZH.dDWkB8Hy0cEM.tSRpXLLZReD3J5xDZe', NULL, NULL, '2021-03-12 03:39:55', '2021-03-12 03:39:55'),
(9, 2, 'Nasser', '123456789', '', '', 'n.kawerimi@gmail.com', '072044920', '9170 N. Beacon Rd', '$2y$10$KIH7R4yp1QlEi03BIuqmm.zgHB5CMhvZX2Vq9lPY8gOeEQP48xuVy', NULL, NULL, '2021-03-12 03:50:21', '2021-03-12 03:50:21'),
(10, 2, 'Nasser', 'Karimi', '', '', 'karimi@gmail.com', '07440462278', 'Kabul, Afghanistan', '$2y$10$bt.yG/KJlVLkGzBb.Ikm1OKCiCotyRFeVVWU7gMqFc.yGVLepnsk2', NULL, NULL, '2021-03-12 04:58:31', '2021-03-12 04:58:31'),
(11, 2, 'Nasser', 'Karimi', '', '', 'karimi2@gmail.com', '07440462278', 'Kabul, Afghanistan', '$2y$10$JG8BRCi3Er4ftT5adb/F4O67X0w1YddLqnkWlGE3dbcRJQPLJsC.6', NULL, NULL, '2021-03-12 04:58:55', '2021-03-12 04:58:55');

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
(1, 'sdoiu', 'oiuoifdus', 'ofudsoiuf', 'ofuoUF', 'OUF', NULL, 2, '2021-03-26 03:10:45', '2021-03-26 03:10:45'),
(2, 'afs', 'posiois@gamil..com', '238942842948', 'lfksjdlfk', 'jfl', '1616753026.jpeg', 2, '2021-03-26 05:33:46', '2021-03-26 05:33:46');

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
-- Indexes for table `fix_purchases`
--
ALTER TABLE `fix_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fix_purchases_source_account_id_foreign` (`source_account_id`),
  ADD KEY `fix_purchases_user_id_foreign` (`user_id`);

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
  ADD KEY `stock_records_source_id_foreign` (`source_id`),
  ADD KEY `stock_records_product_id_foreign` (`product_id`);

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
  ADD KEY `transfers_source_account_foreign` (`source_account`),
  ADD KEY `transfers_target_account_foreign` (`target_account`),
  ADD KEY `transfers_user_id_foreign` (`user_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fix_purchases`
--
ALTER TABLE `fix_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stock_records`
--
ALTER TABLE `stock_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Constraints for table `fix_purchases`
--
ALTER TABLE `fix_purchases`
  ADD CONSTRAINT `fix_purchases_source_account_id_foreign` FOREIGN KEY (`source_account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fix_purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `stock_records_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_records_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `stocks` (`id`) ON DELETE CASCADE,
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
  ADD CONSTRAINT `transfers_source_account_foreign` FOREIGN KEY (`source_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_target_account_foreign` FOREIGN KEY (`target_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
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
