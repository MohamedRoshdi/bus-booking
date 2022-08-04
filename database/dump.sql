-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 05, 2022 at 12:21 AM
-- Server version: 8.0.29-0ubuntu0.20.04.3
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus-booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Bus 1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cairo', NULL, NULL),
(2, 'AlFayyum', NULL, NULL),
(3, 'AlMinya', NULL, NULL),
(4, 'Asyut', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lines`
--

CREATE TABLE `lines` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lines`
--

INSERT INTO `lines` (`id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(12, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(13, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(14, '2016_06_01_000004_create_oauth_clients_table', 2),
(15, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(81, '2022_08_04_025600_create_cities_table', 3),
(82, '2022_08_04_025605_create_buses_table', 3),
(83, '2022_08_04_025613_create_seats_table', 3),
(84, '2022_08_04_025730_create_lines_table', 3),
(89, '2022_08_04_025735_create_trips_table', 4),
(90, '2022_08_04_032032_create_tickets_table', 4),
(91, '2022_08_04_032202_create_stops_table', 4),
(92, '2022_08_04_032222_create_tickets_stops_table', 4),
(93, '2022_08_04_202241_create_sub_trips_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('96f007d7-7448-4845-8ea2-b37ee0ca1645', NULL, 'Laravel Personal Access Client', 'MAQJPE3LYWOE3ukuREKMdFJGoMfGqFdVtU67Jw3j', NULL, 'http://localhost', 1, 0, 0, '2022-08-03 23:31:18', '2022-08-03 23:31:18'),
('96f007d7-76cb-49ee-b18f-a765edaf21a9', NULL, 'Laravel Password Grant Client', 'EPCg6MCKLIYmahfIrCFqkYlwaAJ9ua7fJC3sRgww', 'users', 'http://localhost', 0, 1, 0, '2022-08-03 23:31:18', '2022-08-03 23:31:18'),
('96f0181e-de28-406e-86ad-d423c0781730', NULL, 'Laravel Personal Access Client', 'vnipZFGxswoVei5sIM99mMFriV9L5DjktFWzvUPR', NULL, 'http://localhost', 1, 0, 0, '2022-08-04 00:16:49', '2022-08-04 00:16:49'),
('96f0181e-e13f-4e44-aaea-d24b62ac76ac', NULL, 'Laravel Password Grant Client', 'EjIZCNJPLSnVCQ0oAzyrYLXWPp2CD4eAHePyAJnd', 'users', 'http://localhost', 0, 1, 0, '2022-08-04 00:16:49', '2022-08-04 00:16:49');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '96f007d7-7448-4845-8ea2-b37ee0ca1645', '2022-08-03 23:31:18', '2022-08-03 23:31:18'),
(2, '96f0181e-de28-406e-86ad-d423c0781730', '2022-08-04 00:16:49', '2022-08-04 00:16:49');

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

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bus_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `name`, `bus_id`, `created_at`, `updated_at`) VALUES
(1, 'Seat 1', 1, NULL, NULL),
(2, 'Seat 2', 1, NULL, NULL),
(3, 'Seat 3', 1, NULL, NULL),
(4, 'Seat 4', 1, NULL, NULL),
(5, 'Seat 5', 1, NULL, NULL),
(6, 'Seat 6', 1, NULL, NULL),
(7, 'Seat 7', 1, NULL, NULL),
(8, 'Seat 8', 1, NULL, NULL),
(9, 'Seat 9', 1, NULL, NULL),
(10, 'Seat 10', 1, NULL, NULL),
(11, 'Seat 11', 1, NULL, NULL),
(12, 'Seat 12', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stops`
--

CREATE TABLE `stops` (
  `id` bigint UNSIGNED NOT NULL,
  `line_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stops`
--

INSERT INTO `stops` (`id`, `line_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_trips`
--

CREATE TABLE `sub_trips` (
  `id` bigint UNSIGNED NOT NULL,
  `trip_id` bigint UNSIGNED NOT NULL,
  `sub_trip_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_trips`
--

INSERT INTO `sub_trips` (`id`, `trip_id`, `sub_trip_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL),
(2, 3, 1, NULL, NULL),
(3, 3, 2, NULL, NULL),
(4, 5, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `bus_id` bigint UNSIGNED NOT NULL,
  `line_id` bigint UNSIGNED NOT NULL,
  `seat_id` bigint UNSIGNED NOT NULL,
  `trip_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets_stops`
--

CREATE TABLE `tickets_stops` (
  `id` bigint UNSIGNED NOT NULL,
  `bus_id` bigint UNSIGNED NOT NULL,
  `line_id` bigint UNSIGNED NOT NULL,
  `seat_id` bigint UNSIGNED NOT NULL,
  `stop_id` bigint UNSIGNED NOT NULL,
  `trip_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` bigint UNSIGNED NOT NULL,
  `bus_id` bigint UNSIGNED NOT NULL,
  `line_id` bigint UNSIGNED NOT NULL,
  `start_city_id` bigint UNSIGNED NOT NULL,
  `end_city_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `bus_id`, `line_id`, `start_city_id`, `end_city_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, NULL, NULL),
(2, 1, 1, 1, 3, NULL, NULL),
(3, 1, 1, 1, 4, NULL, NULL),
(4, 1, 1, 2, 3, NULL, NULL),
(5, 1, 1, 2, 4, NULL, NULL),
(6, 1, 1, 3, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@jumia', NULL, '$2y$10$TZyfL1BI8QYmtZDC8GxQOeIcZ0z5qyjj44Qbe78PTsV9pABp1w0Y6', NULL, '2022-08-03 08:58:53', '2022-08-03 08:58:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `lines`
--
ALTER TABLE `lines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seats_bus_id_foreign` (`bus_id`);

--
-- Indexes for table `stops`
--
ALTER TABLE `stops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stops_line_id_foreign` (`line_id`);

--
-- Indexes for table `sub_trips`
--
ALTER TABLE `sub_trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_trips_trip_id_foreign` (`trip_id`),
  ADD KEY `sub_trips_sub_trip_id_foreign` (`sub_trip_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_bus_id_foreign` (`bus_id`),
  ADD KEY `tickets_line_id_foreign` (`line_id`),
  ADD KEY `tickets_seat_id_foreign` (`seat_id`),
  ADD KEY `tickets_trip_id_foreign` (`trip_id`);

--
-- Indexes for table `tickets_stops`
--
ALTER TABLE `tickets_stops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_stops_bus_id_foreign` (`bus_id`),
  ADD KEY `tickets_stops_line_id_foreign` (`line_id`),
  ADD KEY `tickets_stops_seat_id_foreign` (`seat_id`),
  ADD KEY `tickets_stops_stop_id_foreign` (`stop_id`),
  ADD KEY `tickets_stops_trip_id_foreign` (`trip_id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trips_bus_id_foreign` (`bus_id`),
  ADD KEY `trips_line_id_foreign` (`line_id`),
  ADD KEY `trips_start_city_id_foreign` (`start_city_id`),
  ADD KEY `trips_end_city_id_foreign` (`end_city_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lines`
--
ALTER TABLE `lines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `stops`
--
ALTER TABLE `stops`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_trips`
--
ALTER TABLE `sub_trips`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tickets_stops`
--
ALTER TABLE `tickets_stops`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`);

--
-- Constraints for table `stops`
--
ALTER TABLE `stops`
  ADD CONSTRAINT `stops_line_id_foreign` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`);

--
-- Constraints for table `sub_trips`
--
ALTER TABLE `sub_trips`
  ADD CONSTRAINT `sub_trips_sub_trip_id_foreign` FOREIGN KEY (`sub_trip_id`) REFERENCES `trips` (`id`),
  ADD CONSTRAINT `sub_trips_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`),
  ADD CONSTRAINT `tickets_line_id_foreign` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`),
  ADD CONSTRAINT `tickets_seat_id_foreign` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`),
  ADD CONSTRAINT `tickets_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Constraints for table `tickets_stops`
--
ALTER TABLE `tickets_stops`
  ADD CONSTRAINT `tickets_stops_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`),
  ADD CONSTRAINT `tickets_stops_line_id_foreign` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`),
  ADD CONSTRAINT `tickets_stops_seat_id_foreign` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`),
  ADD CONSTRAINT `tickets_stops_stop_id_foreign` FOREIGN KEY (`stop_id`) REFERENCES `stops` (`id`),
  ADD CONSTRAINT `tickets_stops_trip_id_foreign` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`);

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_bus_id_foreign` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`),
  ADD CONSTRAINT `trips_end_city_id_foreign` FOREIGN KEY (`end_city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `trips_line_id_foreign` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`),
  ADD CONSTRAINT `trips_start_city_id_foreign` FOREIGN KEY (`start_city_id`) REFERENCES `cities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
