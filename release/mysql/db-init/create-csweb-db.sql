-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: May 16, 2023 at 08:55 PM
-- Server version: 8.0.33
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cspro`
--
CREATE DATABASE IF NOT EXISTS `cspro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `cspro`;

-- --------------------------------------------------------

--
-- Table structure for table `cspro_apps`
--

CREATE TABLE `cspro_apps` (
  `id` int NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `build_time` datetime NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `files` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `cspro_apps`
--
DELIMITER $$
CREATE TRIGGER `tr_cspro_apps` BEFORE INSERT ON `cspro_apps` FOR EACH ROW SET NEW.`created_time` = CURRENT_TIMESTAMP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cspro_config`
--

CREATE TABLE `cspro_config` (
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cspro_config`
--

INSERT INTO `cspro_config` (`name`, `value`, `modified_time`, `created_time`) VALUES
('schema_version', '6', '2023-05-16 20:54:14', '2023-05-16 20:54:14'),
('server_device_id', 'a18e7854-98b5-4b22-b8d9-4148a03d047a', '2023-05-16 20:54:14', '2023-05-16 20:54:14');

--
-- Triggers `cspro_config`
--
DELIMITER $$
CREATE TRIGGER `tr_cspro_config` BEFORE INSERT ON `cspro_config` FOR EACH ROW SET NEW.`created_time` = CURRENT_TIMESTAMP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cspro_dictionaries`
--

CREATE TABLE `cspro_dictionaries` (
  `id` smallint UNSIGNED NOT NULL,
  `dictionary_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dictionary_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dictionary_full_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `cspro_dictionaries`
--
DELIMITER $$
CREATE TRIGGER `tr_cspro_dictionaries` BEFORE INSERT ON `cspro_dictionaries` FOR EACH ROW SET NEW.`created_time` = CURRENT_TIMESTAMP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cspro_dictionaries_schema`
--

CREATE TABLE `cspro_dictionaries_schema` (
  `dictionary_id` smallint UNSIGNED NOT NULL,
  `host_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schema_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schema_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `schema_password` varbinary(255) NOT NULL,
  `map_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `cspro_dictionaries_schema`
--
DELIMITER $$
CREATE TRIGGER `tr_dictionaries_schema` BEFORE INSERT ON `cspro_dictionaries_schema` FOR EACH ROW SET NEW.`created_time` = CURRENT_TIMESTAMP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cspro_permissions`
--

CREATE TABLE `cspro_permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Permissions Table';

--
-- Dumping data for table `cspro_permissions`
--

INSERT INTO `cspro_permissions` (`id`, `name`, `modified_time`, `created_time`) VALUES
(1, 'data_all', '2023-05-16 20:54:13', '2023-05-16 20:54:13'),
(2, 'apps_all', '2023-05-16 20:54:13', '2023-05-16 20:54:13'),
(3, 'users_all', '2023-05-16 20:54:13', '2023-05-16 20:54:13'),
(4, 'roles_all', '2023-05-16 20:54:13', '2023-05-16 20:54:13'),
(5, 'reports_all', '2023-05-16 20:54:13', '2023-05-16 20:54:13'),
(6, 'dictionary_sync_upload', '2023-05-16 20:54:13', '2023-05-16 20:54:13'),
(7, 'dictionary_sync_download', '2023-05-16 20:54:13', '2023-05-16 20:54:13'),
(8, 'settings_all', '2023-05-16 20:54:13', '2023-05-16 20:54:13');

--
-- Triggers `cspro_permissions`
--
DELIMITER $$
CREATE TRIGGER `tr_cspro_permissions` BEFORE INSERT ON `cspro_permissions` FOR EACH ROW SET NEW.`created_time` = CURRENT_TIMESTAMP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cspro_roles`
--

CREATE TABLE `cspro_roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Roles Table';

--
-- Dumping data for table `cspro_roles`
--

INSERT INTO `cspro_roles` (`id`, `name`, `modified_time`, `created_time`) VALUES
(1, 'Standard User', '2023-05-16 20:54:13', '2023-05-16 20:54:13'),
(2, 'Administrator', '2023-05-16 20:54:13', '2023-05-16 20:54:13');

--
-- Triggers `cspro_roles`
--
DELIMITER $$
CREATE TRIGGER `tr_cspro_roles` BEFORE INSERT ON `cspro_roles` FOR EACH ROW SET NEW.`created_time` = CURRENT_TIMESTAMP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cspro_role_dictionary_permissions`
--

CREATE TABLE `cspro_role_dictionary_permissions` (
  `role_id` int UNSIGNED NOT NULL,
  `dictionary_id` smallint UNSIGNED NOT NULL,
  `permission_id` int UNSIGNED NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Role Dictionary Permissions Table';

--
-- Triggers `cspro_role_dictionary_permissions`
--
DELIMITER $$
CREATE TRIGGER `tr_cspro_role_dictionary_permissions` BEFORE INSERT ON `cspro_role_dictionary_permissions` FOR EACH ROW SET NEW.`created_time` = CURRENT_TIMESTAMP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cspro_role_permissions`
--

CREATE TABLE `cspro_role_permissions` (
  `role_id` int UNSIGNED NOT NULL,
  `permission_id` int UNSIGNED NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Role Permissions Table';

--
-- Triggers `cspro_role_permissions`
--
DELIMITER $$
CREATE TRIGGER `tr_cspro_role_permissions` BEFORE INSERT ON `cspro_role_permissions` FOR EACH ROW SET NEW.`created_time` = CURRENT_TIMESTAMP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cspro_sync_history`
--

CREATE TABLE `cspro_sync_history` (
  `revision` int UNSIGNED NOT NULL,
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dictionary_id` smallint UNSIGNED NOT NULL,
  `universe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` enum('put','get','both') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cspro_users`
--

CREATE TABLE `cspro_users` (
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int UNSIGNED NOT NULL,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` timestamp NULL DEFAULT '1971-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cspro_users`
--

INSERT INTO `cspro_users` (`username`, `password`, `first_name`, `last_name`, `email`, `phone`, `role`, `modified_time`, `created_time`) VALUES
('admin', '$2y$10$4AcMrY736BEjcnuJ/fgGHuX/tHssHcfKGnbbuAk0iL6665oEkcS42', 'System', 'Administrator', NULL, NULL, 2, '2023-05-16 20:54:14', '2023-05-16 20:54:14');

--
-- Triggers `cspro_users`
--
DELIMITER $$
CREATE TRIGGER `tr_cspro_users` BEFORE INSERT ON `cspro_users` FOR EACH ROW SET NEW.`created_time` = CURRENT_TIMESTAMP
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`access_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('5d82eb8f4161b590142b0a886596327c68fb2a41', 'cspro_android', 'admin', '2023-05-16 21:55:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_authorization_codes`
--

CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_uri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_uri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `grant_types` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`) VALUES
('cspro_android', 'cspro', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_jwt`
--

CREATE TABLE `oauth_jwt` (
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public_key` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`refresh_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('9b47678c750219e0cac1a419587d2368285e07a6', 'cspro_android', 'admin', '2023-05-30 20:55:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_scopes`
--

CREATE TABLE `oauth_scopes` (
  `scope` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_users`
--

CREATE TABLE `oauth_users` (
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cspro_apps`
--
ALTER TABLE `cspro_apps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `cspro_config`
--
ALTER TABLE `cspro_config`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `cspro_dictionaries`
--
ALTER TABLE `cspro_dictionaries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dictionary_name` (`dictionary_name`);

--
-- Indexes for table `cspro_dictionaries_schema`
--
ALTER TABLE `cspro_dictionaries_schema`
  ADD PRIMARY KEY (`dictionary_id`),
  ADD UNIQUE KEY `schema_name` (`schema_name`);

--
-- Indexes for table `cspro_permissions`
--
ALTER TABLE `cspro_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cspro_roles`
--
ALTER TABLE `cspro_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rolename_unique` (`name`);

--
-- Indexes for table `cspro_role_dictionary_permissions`
--
ALTER TABLE `cspro_role_dictionary_permissions`
  ADD KEY `cspro_role_dictionary_role_id_constraint` (`role_id`),
  ADD KEY `cspro_role_dictionary_id_constraint` (`dictionary_id`),
  ADD KEY `cspro_role_dictionary_permission_id_constraint` (`permission_id`);

--
-- Indexes for table `cspro_role_permissions`
--
ALTER TABLE `cspro_role_permissions`
  ADD KEY `cspro_role_id_constraint` (`role_id`),
  ADD KEY `cspro_permission_id_constraint` (`permission_id`);

--
-- Indexes for table `cspro_sync_history`
--
ALTER TABLE `cspro_sync_history`
  ADD PRIMARY KEY (`revision`),
  ADD KEY `dictionary_id` (`dictionary_id`);

--
-- Indexes for table `cspro_users`
--
ALTER TABLE `cspro_users`
  ADD PRIMARY KEY (`username`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`access_token`);

--
-- Indexes for table `oauth_authorization_codes`
--
ALTER TABLE `oauth_authorization_codes`
  ADD PRIMARY KEY (`authorization_code`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `oauth_jwt`
--
ALTER TABLE `oauth_jwt`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`refresh_token`);

--
-- Indexes for table `oauth_users`
--
ALTER TABLE `oauth_users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cspro_apps`
--
ALTER TABLE `cspro_apps`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cspro_dictionaries`
--
ALTER TABLE `cspro_dictionaries`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cspro_permissions`
--
ALTER TABLE `cspro_permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cspro_roles`
--
ALTER TABLE `cspro_roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cspro_sync_history`
--
ALTER TABLE `cspro_sync_history`
  MODIFY `revision` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cspro_dictionaries_schema`
--
ALTER TABLE `cspro_dictionaries_schema`
  ADD CONSTRAINT `schema_dict_id_constraint` FOREIGN KEY (`dictionary_id`) REFERENCES `cspro_dictionaries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cspro_role_dictionary_permissions`
--
ALTER TABLE `cspro_role_dictionary_permissions`
  ADD CONSTRAINT `cspro_role_dictionary_id_constraint` FOREIGN KEY (`dictionary_id`) REFERENCES `cspro_dictionaries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cspro_role_dictionary_permission_id_constraint` FOREIGN KEY (`permission_id`) REFERENCES `cspro_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cspro_role_dictionary_role_id_constraint` FOREIGN KEY (`role_id`) REFERENCES `cspro_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cspro_role_permissions`
--
ALTER TABLE `cspro_role_permissions`
  ADD CONSTRAINT `cspro_permission_id_constraint` FOREIGN KEY (`permission_id`) REFERENCES `cspro_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cspro_role_id_constraint` FOREIGN KEY (`role_id`) REFERENCES `cspro_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cspro_sync_history`
--
ALTER TABLE `cspro_sync_history`
  ADD CONSTRAINT `cspro_dict_id_constraint` FOREIGN KEY (`dictionary_id`) REFERENCES `cspro_dictionaries` (`id`);

--
-- Constraints for table `cspro_users`
--
ALTER TABLE `cspro_users`
  ADD CONSTRAINT `role_id_constraint` FOREIGN KEY (`role`) REFERENCES `cspro_roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
