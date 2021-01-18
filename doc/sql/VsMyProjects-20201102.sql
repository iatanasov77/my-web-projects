-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 04, 2020 at 09:38 PM
-- Server version: 8.0.21
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190909134550', '2019-11-01 17:11:38');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `source_type` enum('wget','git','svn') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repository` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_root` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_root` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `with_ssl` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `install_manual` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `phpFpmSocket` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reverseProxy` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `predefinedType` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `category_id`, `name`, `description`, `source_type`, `repository`, `branch`, `project_root`, `document_root`, `host`, `with_ssl`, `install_manual`, `phpFpmSocket`, `reverseProxy`, `predefinedType`) VALUES
(1, 2, 'SalaryJ2', NULL, 'git', 'https://gitlab.com/iatanasov77/salary-j-2', 'master', '/projects/SalaryJ2', '/projects/SalaryJ2/public', 'salaryj2.lh', '0', 'NO INSTALL MANUAL', NULL, NULL, NULL),
(2, 3, 'SULU', NULL, NULL, 'https://github.com/sulu/skeleton', 'master', '/projects/SULU', '/projects/SULU/public', 'sulu.lh', '0', 'READ <a href=\"http://docs.sulu.io/en/latest/book/getting-started.html\" target=\"__blank\">THIS</a>', NULL, NULL, NULL),
(3, 3, 'Magento', NULL, NULL, 'NO', 'NO', '/projects/Magento', '/projects/Magento/public', 'magento.lh', '0', '<p><a href=\"https://devdocs.magento.com/guides/v2.3/install-gde/composer.html\" target=\"__blank\">Install Magento 2.3 with Composer</a></p>', NULL, NULL, NULL),
(5, 3, 'Sylius', NULL, NULL, 'none', 'none', '/projects/Sylius', '/projects/Sylius/public', 'sylius.lh', '0', '<p><a href=\"https://docs.sylius.com/en/1.6/getting-started-with-sylius/installation.html\" target=\"__blank\">Read Installation Manual</a> Version: 1.6</p>', NULL, NULL, NULL),
(6, 4, 'VankoSoft.Org', NULL, NULL, 'https://gitlab.com/iatanasov77/vankosoft.org.git', 'develop', '/projects/VankoSoft.Org', '/projects/VankoSoft.Org/public', 'vankosoft.lh', '0', NULL, NULL, NULL, NULL),
(7, 4, 'BabyMarket 2', NULL, NULL, 'https://gitlab.com/iatanasov77/babymarket.bg_2.git', 'develop', '/projects/BabyMarket_2', '/projects/BabyMarket_2/public', 'babymarket2.lh', '0', NULL, NULL, NULL, NULL),
(8, 2, 'Okta_AspNetCoreMysql', NULL, 'git', 'https://github.com/oktadeveloper/okta-aspnetcore-mysql-twilio-example.git', 'master', '/projects/Okta_AspNetCoreMysql', '/projects/Okta_AspNetCoreMysql/TextTasks/wwwroot', 'oam.lh', '0', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Translations`
--

CREATE TABLE `VSAPP_Translations` (
  `id` int NOT NULL,
  `locale` varchar(8) NOT NULL,
  `object_class` varchar(255) NOT NULL,
  `object_id` int DEFAULT NULL,
  `field` varchar(32) NOT NULL,
  `foreign_key` varchar(64) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `VSAPP_Translations`
--

INSERT INTO `VSAPP_Translations` (`id`, `locale`, `object_class`, `object_id`, `field`, `foreign_key`, `content`) VALUES
(1, 'en', 'App\\Entity\\Cms\\PageCategory', NULL, 'name', '1', 'Main Category'),
(2, 'en', 'App\\Entity\\Cms\\PageCategory', NULL, 'name', '2', 'Projects'),
(3, 'en', 'App\\Entity\\Cms\\Page', 1, 'title', '1', 'Introduction ( TEST PAGE )'),
(4, 'en', 'App\\Entity\\Cms\\Page', NULL, 'text', '1', '<h2>Section Item 1.1</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<p>Code Example: <code>npm install &lt;package&gt;</code></p>\r\n\r\n<p>Unordered List Examples:</p>\r\n\r\n<ul>\r\n	<li><strong>HTML5:</strong> <code>&lt;div id=&quot;foo&quot;&gt;</code></li>\r\n	<li><strong>CSS:</strong> <code>#foo { color: red }</code></li>\r\n	<li><strong>JavaScript:</strong> <code>console.log(&#39;#foo\\bar&#39;);</code></li>\r\n</ul>\r\n\r\n<p>Ordered List Examples:</p>\r\n\r\n<ol>\r\n	<li>Download lorem ipsum dolor sit amet.</li>\r\n	<li>Click ipsum faucibus venenatis.</li>\r\n	<li>Configure fermentum malesuada nunc.</li>\r\n	<li>Deploy donec non ante libero.</li>\r\n</ol>\r\n\r\n<p>Callout Examples:</p>\r\n\r\n<p><!--//icon-holder-->Note</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium <code>&lt;code&gt;</code> , Nemo enim ipsam voluptatem quia voluptas <a href=\"#\">link example</a> sit aspernatur aut odit aut fugit.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Warning</p>\r\n\r\n<p>Nunc hendrerit odio quis dignissim efficitur. Proin ut finibus libero. Morbi posuere fringilla felis eget sagittis. Fusce sem orci, cursus in tortor <a href=\"#\">link example</a> tellus vel diam viverra elementum.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Tip</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\"#\">Link example</a> aenean commodo ligula eget dolor.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Danger</p>\r\n\r\n<p>Morbi eget interdum sapien. Donec sed turpis sed nulla lacinia accumsan vitae ut tellus. Aenean vestibulum <a href=\"#\">Link example</a> maximus ipsum vel dignissim. Morbi ornare elit sit amet massa feugiat, viverra dictum ipsum pellentesque.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p>Alert Examples:</p>\r\n\r\n<p>This is a primary alert&mdash;check it out!</p>\r\n\r\n<p>This is a secondary alert&mdash;check it out!</p>\r\n\r\n<p>This is a success alert&mdash;check it out!</p>\r\n\r\n<p>This is a danger alert&mdash;check it out!</p>\r\n\r\n<p>This is a warning alert&mdash;check it out!</p>\r\n\r\n<p>This is a info alert&mdash;check it out!</p>\r\n\r\n<p>This is a light alert&mdash;check it out!</p>\r\n\r\n<p>This is a dark alert&mdash;check it out!</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.2</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Image Lightbox Example:</p>\r\n\r\n<p><a href=\"assets/images/features/appify-theme-projects-overview-lg.jpg\"><img alt=\"\" src=\"assets/images/features/appify-add-members.gif\" style=\"width:600px\" /></a></p>\r\n\r\n<p>Credit: the above screencast is taken from <a href=\"https://themes.3rdwavemedia.com/bootstrap-templates/product/appify-bootstrap-4-admin-template-for-app-developers/\" target=\"_blank\">Appify theme</a>.</p>\r\n\r\n<p>Custom Table:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><a href=\"#\">Option 1</a></th>\r\n			<td>Option 1 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 2</a></th>\r\n			<td>Option 2 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 3</a></th>\r\n			<td>Option 3 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 4</a></th>\r\n			<td>Option 4 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Stripped Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Bordered Dark Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive--><!--//section-->\r\n\r\n<h2>Section Item 1.3</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Badges Examples:</p>\r\n\r\n<p>Primary Secondary Success Danger Warning Info Light Dark</p>\r\n\r\n<p>Button Examples:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Primary Button</a></li>\r\n	<li><a href=\"#\">Secondary Button</a></li>\r\n	<li><a href=\"#\">Light Button</a></li>\r\n	<li><a href=\"#\">Succcess Button</a></li>\r\n	<li><a href=\"#\">Info Button</a></li>\r\n	<li><a href=\"#\">Warning Button</a></li>\r\n	<li><a href=\"#\">Danger Button</a></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Download Now</a></li>\r\n	<li><a href=\"#\">View Docs</a></li>\r\n	<li><a href=\"#\">View Features</a></li>\r\n	<li><a href=\"#\">Fork Now</a></li>\r\n	<li><a href=\"#\">Find Out Now</a></li>\r\n	<li><a href=\"#\">Report Bugs</a></li>\r\n	<li><a href=\"#\">Submit Issues</a></li>\r\n</ul>\r\n<!--//row-->\r\n\r\n<p>Progress Examples:</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.4</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Pagination Example:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Previous</a></li>\r\n	<li><a href=\"#\">1</a></li>\r\n	<li><a href=\"#\">2</a></li>\r\n	<li><a href=\"#\">3</a></li>\r\n	<li><a href=\"#\">Next</a></li>\r\n</ul>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.5</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.6</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->'),
(5, 'bg', 'App\\Entity\\Cms\\Page', NULL, 'title', '1', 'TEST'),
(6, 'bg', 'App\\Entity\\Cms\\Page', NULL, 'text', '1', '<p>TEST</p>'),
(7, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', NULL, 'name', '1', 'TEST'),
(8, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', NULL, 'description', '1', 'TEST'),
(9, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', NULL, 'name', '2', 'TEST 2'),
(10, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', NULL, 'description', '2', 'TEST 2'),
(11, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', NULL, 'name', '3', 'Page Categories'),
(12, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', NULL, 'description', '3', 'Page Categories'),
(13, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', NULL, 'name', '4', 'Test 999'),
(14, 'en_US', 'App\\Entity\\Taxonomy\\Taxonomy', NULL, 'description', '4', 'Test 999'),
(15, 'en_US', 'App\\Entity\\Cms\\Page', NULL, 'title', '1', 'TEST'),
(16, 'en_US', 'App\\Entity\\Cms\\Page', NULL, 'text', '1', '<p>TEST</p>');

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
-- Indexes for table `VSAPP_Translations`
--
ALTER TABLE `VSAPP_Translations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `VSAPP_Translations`
--
ALTER TABLE `VSAPP_Translations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
