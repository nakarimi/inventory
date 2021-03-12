-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2021 at 09:02 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

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

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `code`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'HERAT-0012', 'Herat', 'herat', NULL, NULL),
(2, 'KABUL-0012', 'Kabul', 'kabul', NULL, NULL);

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('1ead9398a6bf7170854cb196d2e617b0e03e002fdf60ddbf5fd7131d67f110e828f0a688a9db31d4', 2, 1, NULL, '[\"*\"]', 0, '2021-03-11 11:36:11', '2021-03-11 11:36:11', '2022-03-11 16:06:11'),
('2ed71b6c8a9d533fb22b00adf780afded563424dcbc4b67ac56f9b0aef3ad7991e0777e306d75554', 2, 1, NULL, '[\"*\"]', 0, '2021-03-11 11:31:35', '2021-03-11 11:31:35', '2022-03-11 16:01:35'),
('51c3cc14c9927c745bba686a1b7c448de12ea98175515054bb6fe38bedc3bd53efd8e0dd931fd6ff', 7, 1, NULL, '[\"*\"]', 0, '2021-03-12 03:28:00', '2021-03-12 03:28:00', '2022-03-12 07:58:00'),
('6695cea2d2248128acbff325312f9afad91646a9651f297b8bdd288803953bb022f13c36a674052b', 2, 1, NULL, '[\"*\"]', 0, '2021-03-11 11:32:35', '2021-03-11 11:32:35', '2022-03-11 16:02:35'),
('80bbb0bd06b04dd18ee5daa56cbafa479fcad76a24e8537d013931808199be6a3bb055f0c6d78e84', 6, 1, NULL, '[\"*\"]', 0, '2021-03-12 01:56:07', '2021-03-12 01:56:07', '2022-03-12 06:26:07'),
('a540c2538d35579a0c88e78db56860167ebcc69124a1d0e712b96594582c9e3ffc0c8b9cef31ff20', 2, 1, NULL, '[\"*\"]', 0, '2021-03-11 11:25:36', '2021-03-11 11:25:36', '2022-03-11 15:55:36');

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, 1, 'main', 'qrD0ZTrHHaXpvwzmRawSc6kr2QR2sKosl1Jpv7Gx', '/', 0, 1, 0, '2021-03-11 11:22:46', '2021-03-11 11:22:46');

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('0183bca422bce607d2a33ddb71c1f32bd14aff4e6b1475f99ff8a40ef19f05b07f7e26a978e94671', '6695cea2d2248128acbff325312f9afad91646a9651f297b8bdd288803953bb022f13c36a674052b', 0, '2022-03-11 16:02:35'),
('056f337fc40fd4f9067b21cacdfacb79d610434d82a6c93f5166e738c3444e5418013a483c27fda4', '1ead9398a6bf7170854cb196d2e617b0e03e002fdf60ddbf5fd7131d67f110e828f0a688a9db31d4', 0, '2022-03-11 16:06:11'),
('345dc8cf7dbd24e8de0012d3036a3890e9e1b475b14869196f52fe44795de08ace08076d2f7ac308', '51c3cc14c9927c745bba686a1b7c448de12ea98175515054bb6fe38bedc3bd53efd8e0dd931fd6ff', 0, '2022-03-12 07:58:00'),
('905795cd2e0615bf6612ec273f7d60903b5c95377a3071a9aa884937c7c8f9427ad4f64a18402c86', '2ed71b6c8a9d533fb22b00adf780afded563424dcbc4b67ac56f9b0aef3ad7991e0777e306d75554', 0, '2022-03-11 16:01:35'),
('bb6a196e17961c8eed0af69b05705fb480acc47626cbe754470adf52a76e79e5823b2be4c1412344', '80bbb0bd06b04dd18ee5daa56cbafa479fcad76a24e8537d013931808199be6a3bb055f0c6d78e84', 0, '2022-03-12 06:26:07'),
('f6b7f13754892b872a757d8f54609b3c37e8d3a9ef745019f484a56f39dd368075bdbe38e6050ef2', 'a540c2538d35579a0c88e78db56860167ebcc69124a1d0e712b96594582c9e3ffc0c8b9cef31ff20', 0, '2022-03-11 15:55:36');

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `branch_id`, `first_name`, `last_name`, `user_type`, `position`, `email`, `phone`, `address`, `password`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 1, 'Super', 'Admin', '1', 'General Site Admin', 'siteadmin@gmail.com', '0781328723', 'mahdi', '$2y$10$6ImNZFVM9yJ7jePyKf7qEO59np2v9VuXXeZREIMYD8LlnlIafmdrC', '1609240818.png', NULL, '2020-12-23 02:18:10', '2021-02-17 00:12:55');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
