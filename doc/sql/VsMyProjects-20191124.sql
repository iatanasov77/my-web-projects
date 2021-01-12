-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 24 ное 2019 в 10:32
-- Версия на сървъра: 5.7.28
-- PHP Version: 7.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `VsMyProjects`
--

-- --------------------------------------------------------

--
-- Структура на таблица `categories`
--

CREATE TABLE `categories` (
  `id` int(4) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Схема на данните от таблица `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(2, 'VS OpenSource Projects'),
(3, 'Third-Party Projects');

-- --------------------------------------------------------

--
-- Структура на таблица `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190909134550', '2019-11-01 17:11:38');

-- --------------------------------------------------------

--
-- Структура на таблица `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `category_id` int(4) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_type` enum('wget','git','svn','install_manual') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repository` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_root` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_root` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `with_ssl` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `install_manual` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Схема на данните от таблица `projects`
--

INSERT INTO `projects` (`id`, `category_id`, `name`, `source_type`, `repository`, `branch`, `project_root`, `document_root`, `host`, `with_ssl`, `install_manual`) VALUES
(1, 2, 'SalaryJ2', 'git', 'https://gitlab.com/iatanasov77/salary-j-2', 'master', '/projects/SalaryJ2', '/projects/SalaryJ2/public', 'salaryj2.lh', '0', 'NO INSTALL MANUAL'),
(2, 3, 'SULU', 'install_manual', 'https://github.com/sulu/skeleton', 'master', '/projects/SULU', '/projects/SULU/public', 'sulu.lh', '0', 'READ <a href=\"http://docs.sulu.io/en/latest/book/getting-started.html\" target=\"__blank\">THIS</a>'),
(3, 3, 'Magento', 'install_manual', 'NO', 'NO', '/projects/Magento', '/projects/Magento/public', 'magento.lh', '0', '<p><a href=\"https://devdocs.magento.com/guides/v2.3/install-gde/composer.html\" target=\"__blank\">Install Magento 2.3 with Composer</a></p>'),
(4, 3, 'Magento Test Installation', 'install_manual', 'NO', 'NO', '/projects/MagentoNotInstalled', '/projects/Magento/update', 'magento.lh', '0', '<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li><a href=\"https://devdocs.magento.com/guides/v2.3/install-gde/composer.html\" target=\"__blank\">Install Magento 2.3 with Composer</a></li>\r\n	<li>Install with wget: Installation with composer not working.\r\n <a href=\"https://magento.com/tech-resources/download\" target=\"__blank\">Download</a>&nbsp;archive extract and use web install.</li>\r\n	<li>Frontend:<br />\r\n	# php bin/magento setup:static-content:deploy -f</li>\r\n</ol>'),
(5, 3, 'Sylius', 'install_manual', 'none', 'none', '/projects/Sylius', '/projects/Sylius/public', 'sylius.lh', '0', '<p><a href=\"https://docs.sylius.com/en/1.6/getting-started-with-sylius/installation.html\" target=\"__blank\">Read Installation Manual</a> Version: 1.6</p>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
