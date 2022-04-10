-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 10, 2022 at 02:27 PM
-- Server version: 8.0.26
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `VsMyWebProjects`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(2, 'VS OpenSource Projects'),
(3, 'Third-Party Projects'),
(4, 'VS Enterprise Projects');

-- --------------------------------------------------------

--
-- Table structure for table `phpbrew_extensions`
--

CREATE TABLE `phpbrew_extensions` (
  `id` int NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) NOT NULL,
  `github_repo` varchar(128) NOT NULL,
  `branch` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `phpbrew_extensions`
--

INSERT INTO `phpbrew_extensions` (`id`, `name`, `description`, `github_repo`, `branch`) VALUES
(1, 'cassandra', 'DataStax PHP Extension', 'datastax/php-driver', 'master');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `source_type` enum('wget','git','svn') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repository` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_root` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `install_manual` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `predefinedType` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `predefinedTypeParams` json DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `category_id`, `name`, `description`, `source_type`, `repository`, `branch`, `project_root`, `install_manual`, `predefinedType`, `predefinedTypeParams`, `url`) VALUES
(1, 2, 'VS SalaryJ', NULL, 'git', 'https://gitlab.com/iatanasov77/salary-j-2', 'master', '/projects/VS_SalaryJ', 'NO INSTALL MANUAL', NULL, NULL, NULL),
(2, 3, 'SULU', NULL, NULL, 'https://github.com/sulu/skeleton', 'master', '/projects/SULU', 'READ <a href=\"http://docs.sulu.io/en/latest/book/getting-started.html\" target=\"__blank\">THIS</a>', NULL, NULL, NULL),
(3, 3, 'Magento', NULL, NULL, 'NO', 'NO', '/projects/Magento', '<p><a href=\"https://devdocs.magento.com/guides/v2.3/install-gde/composer.html\" target=\"__blank\">Install Magento 2.3 with Composer</a></p>', NULL, NULL, NULL),
(5, 3, 'Sylius', NULL, NULL, 'none', 'none', '/projects/Sylius', '<p><a href=\"https://docs.sylius.com/en/1.6/getting-started-with-sylius/installation.html\" target=\"__blank\">Read Installation Manual</a> Version: 1.6</p>', NULL, NULL, NULL),
(6, 4, 'VankoSoft.Org', NULL, NULL, 'https://gitlab.com/iatanasov77/vankosoft.org.git', 'develop', '/projects/VankoSoft.Org', NULL, NULL, NULL, NULL),
(7, 4, 'BabyMarket 2', NULL, NULL, 'https://gitlab.com/iatanasov77/babymarket.bg_2.git', 'develop', '/projects/BabyMarket_2', NULL, NULL, NULL, NULL),
(8, 2, 'Okta_AspNetCoreMysql', NULL, 'git', 'https://github.com/oktadeveloper/okta-aspnetcore-mysql-twilio-example.git', 'master', '/projects/Okta_AspNetCoreMysql', NULL, NULL, NULL, NULL),
(11, 2, 'TestHosts', NULL, NULL, NULL, NULL, '/projects/TestHosts', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects_hosts`
--

CREATE TABLE `projects_hosts` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `host_type` varchar(32) NOT NULL,
  `options` json NOT NULL,
  `host` varchar(32) NOT NULL,
  `document_root` varchar(128) NOT NULL,
  `with_ssl` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `projects_hosts`
--

INSERT INTO `projects_hosts` (`id`, `project_id`, `host_type`, `options`, `host`, `document_root`, `with_ssl`) VALUES
(1, 1, 'Lamp', 'null', 'junona.lh', '/projects-myspace/Test', 0),
(13, 11, 'Lamp', 'null', 'lamp.lh', '/projects/TestHosts/TestLamp', 0),
(16, 1, 'Lamp', '{\"phpVersion\": \"default\"}', 'salary-j.lh', '/projects/VS_SalaryJ/public/salary-j', 0),
(17, 1, 'Lamp', '{\"phpVersion\": \"default\"}', 'admin.salary-j.lh', '/projects/VS_SalaryJ/public/admin_panel', 0);

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Applications`
--

CREATE TABLE `VSAPP_Applications` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hostname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `VSAPP_Applications`
--

INSERT INTO `VSAPP_Applications` (`id`, `title`, `hostname`, `code`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 'My Web Projects', 'myprojects.lh', 'my-web-projects', 1, '2022-04-09 21:43:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Applications_Users`
--

CREATE TABLE `VSAPP_Applications_Users` (
  `application_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_InstalationInfo`
--

CREATE TABLE `VSAPP_InstalationInfo` (
  `id` int NOT NULL,
  `version` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Locale`
--

CREATE TABLE `VSAPP_Locale` (
  `id` int NOT NULL,
  `code` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_LogEntries`
--

CREATE TABLE `VSAPP_LogEntries` (
  `id` int NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `logged_at` datetime NOT NULL,
  `object_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_class` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `version` int NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `username` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Migrations`
--

CREATE TABLE `VSAPP_Migrations` (
  `version` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `VSAPP_Migrations`
--

INSERT INTO `VSAPP_Migrations` (`version`, `executed_at`, `execution_time`) VALUES
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20210615143142', '2022-04-09 21:32:25', 814),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20210617123114', '2022-04-09 21:32:26', 230),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20210702092552', '2022-04-09 21:32:26', 173),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20210702150353', '2022-04-09 21:32:26', 295),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20210703173305', '2022-04-09 21:32:26', 473),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20210705031111', '2022-04-09 21:32:27', 392),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20210707064607', '2022-04-09 21:32:27', 187),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20211003124448', '2022-04-09 21:32:27', 181),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20211005095015', '2022-04-09 21:32:27', 142),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20211009103709', '2022-04-09 21:32:28', 116),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20211107182831', '2022-04-09 21:32:28', 245),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20211111192634', '2022-04-09 21:32:28', 150),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20211113233004', '2022-04-09 21:32:28', 116),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20211115132821', '2022-04-09 21:32:28', 128),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20211118173601', '2022-04-09 21:32:28', 93),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20211119221152', '2022-04-09 21:32:28', 153),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20211207165617', '2022-04-09 21:32:29', 212),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20211209053140', '2022-04-09 21:32:29', 98),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20220117151900', '2022-04-09 21:32:29', 82),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20220126184317', '2022-04-09 21:32:29', 107),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20220223055448', '2022-04-09 21:32:29', 329),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20220225121209', '2022-04-09 21:32:29', 211),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20220226092115', '2022-04-09 21:32:30', 104),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20220226182542', '2022-04-09 21:32:30', 203),
('Vankosoft\\ApplicationBundle\\DoctrineMigrations\\Version20220228081322', '2022-04-09 21:32:30', 154);

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Settings`
--

CREATE TABLE `VSAPP_Settings` (
  `id` int NOT NULL,
  `maintenanceMode` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'This Application is In Maintenace Mode.',
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `application_id` int DEFAULT NULL,
  `maintenance_page_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `VSAPP_Settings`
--

INSERT INTO `VSAPP_Settings` (`id`, `maintenanceMode`, `theme`, `application_id`, `maintenance_page_id`) VALUES
(1, 0, NULL, NULL, NULL),
(2, 0, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_TaxonImage`
--

CREATE TABLE `VSAPP_TaxonImage` (
  `id` int NOT NULL,
  `owner_id` int NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Taxonomy`
--

CREATE TABLE `VSAPP_Taxonomy` (
  `id` int NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `root_taxon_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Taxons`
--

CREATE TABLE `VSAPP_Taxons` (
  `id` int NOT NULL,
  `tree_root` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tree_left` int NOT NULL,
  `tree_right` int NOT NULL,
  `tree_level` int NOT NULL,
  `position` int DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_TaxonTranslations`
--

CREATE TABLE `VSAPP_TaxonTranslations` (
  `id` int NOT NULL,
  `translatable_id` int DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Translations`
--

CREATE TABLE `VSAPP_Translations` (
  `id` int NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `object_class` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSCMS_DocumentCategories`
--

CREATE TABLE `VSCMS_DocumentCategories` (
  `id` int NOT NULL,
  `taxon_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSCMS_Documents`
--

CREATE TABLE `VSCMS_Documents` (
  `id` int NOT NULL,
  `toc_root_page_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSCMS_FileManager`
--

CREATE TABLE `VSCMS_FileManager` (
  `id` int NOT NULL,
  `taxon_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSCMS_FileManagerFile`
--

CREATE TABLE `VSCMS_FileManagerFile` (
  `id` int NOT NULL,
  `owner_id` int NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `original_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'The Original Name of the File.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSCMS_PageCategories`
--

CREATE TABLE `VSCMS_PageCategories` (
  `id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `taxon_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSCMS_Pages`
--

CREATE TABLE `VSCMS_Pages` (
  `id` int NOT NULL,
  `published` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSCMS_Pages_Categories`
--

CREATE TABLE `VSCMS_Pages_Categories` (
  `page_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSCMS_TocPage`
--

CREATE TABLE `VSCMS_TocPage` (
  `id` int NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `tree_root` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSUM_AvatarImage`
--

CREATE TABLE `VSUM_AvatarImage` (
  `id` int NOT NULL,
  `owner_id` int NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSUM_ResetPasswordRequests`
--

CREATE TABLE `VSUM_ResetPasswordRequests` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `selector` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `hashedToken` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `requestedAt` datetime NOT NULL,
  `expiresAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSUM_UserRoles`
--

CREATE TABLE `VSUM_UserRoles` (
  `id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `taxon_id` int DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSUM_Users`
--

CREATE TABLE `VSUM_Users` (
  `id` int NOT NULL,
  `info_id` int DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles_array` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prefered_locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSUM_UsersActivities`
--

CREATE TABLE `VSUM_UsersActivities` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `activity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSUM_UsersInfo`
--

CREATE TABLE `VSUM_UsersInfo` (
  `id` int NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `occupation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSUM_UsersNotifications`
--

CREATE TABLE `VSUM_UsersNotifications` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `notification` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `VSUM_Users_Roles`
--

CREATE TABLE `VSUM_Users_Roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phpbrew_extensions`
--
ALTER TABLE `phpbrew_extensions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects_hosts`
--
ALTER TABLE `projects_hosts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSAPP_Applications`
--
ALTER TABLE `VSAPP_Applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_7797295A77153098` (`code`),
  ADD KEY `IDX_7797295AE551C011` (`hostname`);

--
-- Indexes for table `VSAPP_Applications_Users`
--
ALTER TABLE `VSAPP_Applications_Users`
  ADD PRIMARY KEY (`application_id`,`user_id`),
  ADD KEY `IDX_4F97A75D3E030ACD` (`application_id`),
  ADD KEY `IDX_4F97A75DA76ED395` (`user_id`);

--
-- Indexes for table `VSAPP_InstalationInfo`
--
ALTER TABLE `VSAPP_InstalationInfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSAPP_Locale`
--
ALTER TABLE `VSAPP_Locale`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_3DB0A7DB77153098` (`code`);

--
-- Indexes for table `VSAPP_LogEntries`
--
ALTER TABLE `VSAPP_LogEntries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `versions_lookup_unique_idx` (`object_class`,`object_id`,`version`),
  ADD KEY `versions_lookup_idx` (`object_class`,`object_id`);

--
-- Indexes for table `VSAPP_Migrations`
--
ALTER TABLE `VSAPP_Migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `VSAPP_Settings`
--
ALTER TABLE `VSAPP_Settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4A491FD3E030ACD` (`application_id`),
  ADD KEY `IDX_4A491FD507FAB6A` (`maintenance_page_id`);

--
-- Indexes for table `VSAPP_TaxonImage`
--
ALTER TABLE `VSAPP_TaxonImage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E31A81167E3C61F9` (`owner_id`);

--
-- Indexes for table `VSAPP_Taxonomy`
--
ALTER TABLE `VSAPP_Taxonomy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1CF3890577153098` (`code`),
  ADD UNIQUE KEY `UNIQ_1CF38905A54E9E96` (`root_taxon_id`);

--
-- Indexes for table `VSAPP_Taxons`
--
ALTER TABLE `VSAPP_Taxons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2661B30B77153098` (`code`),
  ADD KEY `IDX_2661B30BA977936C` (`tree_root`),
  ADD KEY `IDX_2661B30B727ACA70` (`parent_id`);

--
-- Indexes for table `VSAPP_TaxonTranslations`
--
ALTER TABLE `VSAPP_TaxonTranslations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug_uidx` (`locale`,`slug`),
  ADD UNIQUE KEY `VSAPP_TaxonTranslations_uniq_trans` (`translatable_id`,`locale`),
  ADD KEY `IDX_AFE16CB02C2AC5D3` (`translatable_id`);

--
-- Indexes for table `VSAPP_Translations`
--
ALTER TABLE `VSAPP_Translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lookup_unique_idx` (`locale`,`object_class`,`field`,`foreign_key`),
  ADD KEY `translations_lookup_idx` (`locale`,`object_class`,`foreign_key`);

--
-- Indexes for table `VSCMS_DocumentCategories`
--
ALTER TABLE `VSCMS_DocumentCategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E0054AF0DE13F470` (`taxon_id`);

--
-- Indexes for table `VSCMS_Documents`
--
ALTER TABLE `VSCMS_Documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_E15A147FB4CE9742` (`toc_root_page_id`),
  ADD KEY `IDX_E15A147F12469DE2` (`category_id`);

--
-- Indexes for table `VSCMS_FileManager`
--
ALTER TABLE `VSCMS_FileManager`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8B912DE4DE13F470` (`taxon_id`);

--
-- Indexes for table `VSCMS_FileManagerFile`
--
ALTER TABLE `VSCMS_FileManagerFile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_57157B017E3C61F9` (`owner_id`);

--
-- Indexes for table `VSCMS_PageCategories`
--
ALTER TABLE `VSCMS_PageCategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_98A43648DE13F470` (`taxon_id`),
  ADD KEY `IDX_98A43648727ACA70` (`parent_id`);

--
-- Indexes for table `VSCMS_Pages`
--
ALTER TABLE `VSCMS_Pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_345A075A989D9B62` (`slug`);

--
-- Indexes for table `VSCMS_Pages_Categories`
--
ALTER TABLE `VSCMS_Pages_Categories`
  ADD PRIMARY KEY (`page_id`,`category_id`),
  ADD KEY `IDX_88D3BD76C4663E4` (`page_id`),
  ADD KEY `IDX_88D3BD7612469DE2` (`category_id`);

--
-- Indexes for table `VSCMS_TocPage`
--
ALTER TABLE `VSCMS_TocPage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6B1FF241A977936C` (`tree_root`),
  ADD KEY `IDX_6B1FF241727ACA70` (`parent_id`);

--
-- Indexes for table `VSUM_AvatarImage`
--
ALTER TABLE `VSUM_AvatarImage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D917FB667E3C61F9` (`owner_id`);

--
-- Indexes for table `VSUM_ResetPasswordRequests`
--
ALTER TABLE `VSUM_ResetPasswordRequests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D6C66D0A76ED395` (`user_id`);

--
-- Indexes for table `VSUM_UserRoles`
--
ALTER TABLE `VSUM_UserRoles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_7F8AAD7E57698A6A` (`role`),
  ADD UNIQUE KEY `UNIQ_7F8AAD7EDE13F470` (`taxon_id`),
  ADD KEY `IDX_7F8AAD7E727ACA70` (`parent_id`);

--
-- Indexes for table `VSUM_Users`
--
ALTER TABLE `VSUM_Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_CAFDCD035D8BC1F8` (`info_id`);

--
-- Indexes for table `VSUM_UsersActivities`
--
ALTER TABLE `VSUM_UsersActivities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_54103277A76ED395` (`user_id`);

--
-- Indexes for table `VSUM_UsersInfo`
--
ALTER TABLE `VSUM_UsersInfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VSUM_UsersNotifications`
--
ALTER TABLE `VSUM_UsersNotifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8D75FA15A76ED395` (`user_id`);

--
-- Indexes for table `VSUM_Users_Roles`
--
ALTER TABLE `VSUM_Users_Roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `IDX_82E26E77A76ED395` (`user_id`),
  ADD KEY `IDX_82E26E77D60322AC` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `phpbrew_extensions`
--
ALTER TABLE `phpbrew_extensions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `projects_hosts`
--
ALTER TABLE `projects_hosts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `VSAPP_Applications`
--
ALTER TABLE `VSAPP_Applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `VSAPP_InstalationInfo`
--
ALTER TABLE `VSAPP_InstalationInfo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSAPP_Locale`
--
ALTER TABLE `VSAPP_Locale`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSAPP_LogEntries`
--
ALTER TABLE `VSAPP_LogEntries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSAPP_Settings`
--
ALTER TABLE `VSAPP_Settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `VSAPP_TaxonImage`
--
ALTER TABLE `VSAPP_TaxonImage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSAPP_Taxonomy`
--
ALTER TABLE `VSAPP_Taxonomy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSAPP_Taxons`
--
ALTER TABLE `VSAPP_Taxons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSAPP_TaxonTranslations`
--
ALTER TABLE `VSAPP_TaxonTranslations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSAPP_Translations`
--
ALTER TABLE `VSAPP_Translations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSCMS_DocumentCategories`
--
ALTER TABLE `VSCMS_DocumentCategories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSCMS_Documents`
--
ALTER TABLE `VSCMS_Documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSCMS_FileManager`
--
ALTER TABLE `VSCMS_FileManager`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSCMS_FileManagerFile`
--
ALTER TABLE `VSCMS_FileManagerFile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSCMS_PageCategories`
--
ALTER TABLE `VSCMS_PageCategories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSCMS_Pages`
--
ALTER TABLE `VSCMS_Pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSCMS_TocPage`
--
ALTER TABLE `VSCMS_TocPage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSUM_AvatarImage`
--
ALTER TABLE `VSUM_AvatarImage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSUM_ResetPasswordRequests`
--
ALTER TABLE `VSUM_ResetPasswordRequests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSUM_UserRoles`
--
ALTER TABLE `VSUM_UserRoles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSUM_Users`
--
ALTER TABLE `VSUM_Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSUM_UsersActivities`
--
ALTER TABLE `VSUM_UsersActivities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSUM_UsersInfo`
--
ALTER TABLE `VSUM_UsersInfo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `VSUM_UsersNotifications`
--
ALTER TABLE `VSUM_UsersNotifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `VSAPP_Applications_Users`
--
ALTER TABLE `VSAPP_Applications_Users`
  ADD CONSTRAINT `FK_4F97A75D3E030ACD` FOREIGN KEY (`application_id`) REFERENCES `VSAPP_Applications` (`id`),
  ADD CONSTRAINT `FK_4F97A75DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `VSUM_Users` (`id`);

--
-- Constraints for table `VSAPP_Settings`
--
ALTER TABLE `VSAPP_Settings`
  ADD CONSTRAINT `FK_4A491FD3E030ACD` FOREIGN KEY (`application_id`) REFERENCES `VSAPP_Applications` (`id`),
  ADD CONSTRAINT `FK_4A491FD507FAB6A` FOREIGN KEY (`maintenance_page_id`) REFERENCES `VSCMS_Pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `VSAPP_TaxonImage`
--
ALTER TABLE `VSAPP_TaxonImage`
  ADD CONSTRAINT `FK_E31A81167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `VSAPP_Taxons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `VSAPP_Taxonomy`
--
ALTER TABLE `VSAPP_Taxonomy`
  ADD CONSTRAINT `FK_1CF38905A54E9E96` FOREIGN KEY (`root_taxon_id`) REFERENCES `VSAPP_Taxons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `VSAPP_Taxons`
--
ALTER TABLE `VSAPP_Taxons`
  ADD CONSTRAINT `FK_2661B30B727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `VSAPP_Taxons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2661B30BA977936C` FOREIGN KEY (`tree_root`) REFERENCES `VSAPP_Taxons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `VSAPP_TaxonTranslations`
--
ALTER TABLE `VSAPP_TaxonTranslations`
  ADD CONSTRAINT `FK_AFE16CB02C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `VSAPP_Taxons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `VSCMS_DocumentCategories`
--
ALTER TABLE `VSCMS_DocumentCategories`
  ADD CONSTRAINT `FK_E0054AF0DE13F470` FOREIGN KEY (`taxon_id`) REFERENCES `VSAPP_Taxons` (`id`);

--
-- Constraints for table `VSCMS_Documents`
--
ALTER TABLE `VSCMS_Documents`
  ADD CONSTRAINT `FK_E15A147F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `VSCMS_DocumentCategories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E15A147FB4CE9742` FOREIGN KEY (`toc_root_page_id`) REFERENCES `VSCMS_TocPage` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `VSCMS_FileManager`
--
ALTER TABLE `VSCMS_FileManager`
  ADD CONSTRAINT `FK_8B912DE4DE13F470` FOREIGN KEY (`taxon_id`) REFERENCES `VSAPP_Taxons` (`id`);

--
-- Constraints for table `VSCMS_FileManagerFile`
--
ALTER TABLE `VSCMS_FileManagerFile`
  ADD CONSTRAINT `FK_57157B017E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `VSCMS_FileManager` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `VSCMS_PageCategories`
--
ALTER TABLE `VSCMS_PageCategories`
  ADD CONSTRAINT `FK_98A43648727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `VSCMS_PageCategories` (`id`),
  ADD CONSTRAINT `FK_98A43648DE13F470` FOREIGN KEY (`taxon_id`) REFERENCES `VSAPP_Taxons` (`id`);

--
-- Constraints for table `VSCMS_Pages_Categories`
--
ALTER TABLE `VSCMS_Pages_Categories`
  ADD CONSTRAINT `FK_88D3BD7612469DE2` FOREIGN KEY (`category_id`) REFERENCES `VSCMS_PageCategories` (`id`),
  ADD CONSTRAINT `FK_88D3BD76C4663E4` FOREIGN KEY (`page_id`) REFERENCES `VSCMS_Pages` (`id`);

--
-- Constraints for table `VSCMS_TocPage`
--
ALTER TABLE `VSCMS_TocPage`
  ADD CONSTRAINT `FK_6B1FF241727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `VSCMS_TocPage` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6B1FF241A977936C` FOREIGN KEY (`tree_root`) REFERENCES `VSCMS_TocPage` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `VSUM_AvatarImage`
--
ALTER TABLE `VSUM_AvatarImage`
  ADD CONSTRAINT `FK_D917FB667E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `VSUM_UsersInfo` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `VSUM_ResetPasswordRequests`
--
ALTER TABLE `VSUM_ResetPasswordRequests`
  ADD CONSTRAINT `FK_D6C66D0A76ED395` FOREIGN KEY (`user_id`) REFERENCES `VSUM_Users` (`id`);

--
-- Constraints for table `VSUM_UserRoles`
--
ALTER TABLE `VSUM_UserRoles`
  ADD CONSTRAINT `FK_7F8AAD7E727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `VSUM_UserRoles` (`id`),
  ADD CONSTRAINT `FK_7F8AAD7EDE13F470` FOREIGN KEY (`taxon_id`) REFERENCES `VSAPP_Taxons` (`id`);

--
-- Constraints for table `VSUM_Users`
--
ALTER TABLE `VSUM_Users`
  ADD CONSTRAINT `FK_CAFDCD035D8BC1F8` FOREIGN KEY (`info_id`) REFERENCES `VSUM_UsersInfo` (`id`);

--
-- Constraints for table `VSUM_UsersActivities`
--
ALTER TABLE `VSUM_UsersActivities`
  ADD CONSTRAINT `FK_54103277A76ED395` FOREIGN KEY (`user_id`) REFERENCES `VSUM_Users` (`id`);

--
-- Constraints for table `VSUM_UsersNotifications`
--
ALTER TABLE `VSUM_UsersNotifications`
  ADD CONSTRAINT `FK_8D75FA15A76ED395` FOREIGN KEY (`user_id`) REFERENCES `VSUM_Users` (`id`);

--
-- Constraints for table `VSUM_Users_Roles`
--
ALTER TABLE `VSUM_Users_Roles`
  ADD CONSTRAINT `FK_82E26E77A76ED395` FOREIGN KEY (`user_id`) REFERENCES `VSUM_Users` (`id`),
  ADD CONSTRAINT `FK_82E26E77D60322AC` FOREIGN KEY (`role_id`) REFERENCES `VSUM_UserRoles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
