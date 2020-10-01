-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 01, 2020 at 05:57 PM
-- Server version: 5.7.31
-- PHP Version: 7.2.34

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
  `id` int(4) NOT NULL,
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
-- Table structure for table `DEVEL_VSAPP_Settings`
--

CREATE TABLE `DEVEL_VSAPP_Settings` (
  `id` int(2) NOT NULL,
  `site_id` int(2) DEFAULT NULL,
  `maintenanceMode` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_page_id` int(11) NOT NULL,
  `languages` varchar(64) NOT NULL DEFAULT 'en',
  `theme` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DEVEL_VSAPP_Settings`
--

INSERT INTO `DEVEL_VSAPP_Settings` (`id`, `site_id`, `maintenanceMode`, `maintenance_page_id`, `languages`, `theme`) VALUES
(8, 4, 1, 11, 'en', NULL),
(9, NULL, 1, 11, 'en', NULL),
(10, 4, 0, 11, 'en', NULL),
(11, 4, 1, 11, 'en', NULL),
(12, NULL, 1, 11, 'en', NULL),
(13, 4, 0, 11, 'en', NULL),
(14, NULL, 1, 11, 'en', NULL),
(15, NULL, 1, 11, 'en', NULL),
(16, NULL, 1, 11, 'en', NULL),
(17, NULL, 1, 11, 'en', NULL),
(18, 4, 1, 11, 'en', NULL),
(19, 4, 0, 11, 'en', NULL),
(20, NULL, 0, 11, 'en', NULL),
(21, NULL, 1, 11, 'en', NULL),
(22, 5, 1, 11, 'en', NULL),
(23, 4, 1, 11, 'en', NULL),
(24, 4, 0, 11, 'en', NULL),
(25, 4, 1, 11, 'en', NULL),
(26, 4, 0, 11, 'en', NULL),
(27, 5, 0, 11, 'en', NULL),
(28, NULL, 0, 11, 'en', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `DEVEL_VSAPP_SiteSettings`
--

CREATE TABLE `DEVEL_VSAPP_SiteSettings` (
  `id` int(11) NOT NULL,
  `settings_id` int(5) NOT NULL,
  `site_id` int(5) NOT NULL COMMENT 'Taxon ID from taxonomy Sites'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `DEVEL_VSAPP_Taxonomy`
--

CREATE TABLE `DEVEL_VSAPP_Taxonomy` (
  `id` int(2) NOT NULL,
  `root_taxon_id` int(8) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DEVEL_VSAPP_Taxonomy`
--

INSERT INTO `DEVEL_VSAPP_Taxonomy` (`id`, `root_taxon_id`, `name`, `description`) VALUES
(1, 4, 'Test', 'Description'),
(2, 5, 'TEST 2', 'TEST 2'),
(3, 8, 'Page Categories', 'Page Categories'),
(4, 9, 'Test 999', 'Test 999');

-- --------------------------------------------------------

--
-- Table structure for table `DEVEL_VSAPP_Taxons`
--

CREATE TABLE `DEVEL_VSAPP_Taxons` (
  `id` int(8) NOT NULL,
  `code` varchar(64) DEFAULT NULL,
  `tree_left` int(11) NOT NULL,
  `tree_right` int(11) NOT NULL,
  `tree_level` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `tree_root` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DEVEL_VSAPP_Taxons`
--

INSERT INTO `DEVEL_VSAPP_Taxons` (`id`, `code`, `tree_left`, `tree_right`, `tree_level`, `position`, `tree_root`, `parent_id`) VALUES
(1, NULL, 1, 2, 0, NULL, 1, NULL),
(3, NULL, 1, 2, 0, NULL, 3, NULL),
(4, 'taxon_4', 1, 4, 0, NULL, 4, NULL),
(5, NULL, 1, 2, 0, NULL, 5, NULL),
(6, NULL, 2, 3, 1, NULL, 4, 4),
(8, NULL, 1, 2, 0, NULL, 8, NULL),
(9, NULL, 1, 6, 0, NULL, 9, NULL),
(10, NULL, 1, 2, 0, NULL, 10, NULL),
(11, NULL, 2, 5, 1, NULL, 8, 8),
(12, NULL, 1, 2, 0, NULL, 12, NULL),
(13, NULL, 3, 4, 2, NULL, 8, 11);

-- --------------------------------------------------------

--
-- Table structure for table `DEVEL_VSAPP_TaxonTranslations`
--

CREATE TABLE `DEVEL_VSAPP_TaxonTranslations` (
  `id` int(11) NOT NULL,
  `translatable_id` int(8) DEFAULT NULL,
  `locale` varchar(6) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DEVEL_VSAPP_TaxonTranslations`
--

INSERT INTO `DEVEL_VSAPP_TaxonTranslations` (`id`, `translatable_id`, `locale`, `slug`, `name`, `description`) VALUES
(1, 3, 'en_US', 'test', 'TEST', 'TEST'),
(2, 4, 'en_US', 'test-last', 'TEST LAST', 'TEST LAST'),
(3, 5, 'en_US', 'test-2', 'TEST 2', 'Root taxon of Taxonomy: \"TEST 2\"'),
(4, 6, 'en', 'test-999', 'TEST 999', 'TEST 999'),
(6, 8, 'en', 'page-categories', 'Page Categories', 'Root taxon of Taxonomy: \"Page Categories\"'),
(7, 9, 'en_US', 'test-999', 'Test 999', 'Root taxon of Taxonomy: \"Test 999\"'),
(8, 10, 'en_US', 'test-998', 'TEST 998', 'TEST 998'),
(9, 11, 'en_US', 'test-997', 'TEST 997', 'TEST 997'),
(10, 12, 'en_US', 'test-996', 'TEST 996', 'TEST 996'),
(11, 13, 'en_US', 'test-995', 'TEST 995', 'TEST 995');

-- --------------------------------------------------------

--
-- Table structure for table `DEV_VSCMS_PageCategories`
--

CREATE TABLE `DEV_VSCMS_PageCategories` (
  `id` int(11) NOT NULL,
  `page_id` int(5) NOT NULL,
  `taxon_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DEV_VSCMS_PageCategories`
--

INSERT INTO `DEV_VSCMS_PageCategories` (`id`, `page_id`, `taxon_id`) VALUES
(3, 3, 13);

-- --------------------------------------------------------

--
-- Table structure for table `DEV_VSCMS_Pages`
--

CREATE TABLE `DEV_VSCMS_Pages` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `text` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DEV_VSCMS_Pages`
--

INSERT INTO `DEV_VSCMS_Pages` (`id`, `category_id`, `slug`, `title`, `text`, `published`) VALUES
(1, 3, 'Test', 'Introduction ( TEST PAGE )', '<h2>Section Item 1.1</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<p>Code Example: <code>npm install &lt;package&gt;</code></p>\r\n\r\n<p>Unordered List Examples:</p>\r\n\r\n<ul>\r\n	<li><strong>HTML5:</strong> <code>&lt;div id=&quot;foo&quot;&gt;</code></li>\r\n	<li><strong>CSS:</strong> <code>#foo { color: red }</code></li>\r\n	<li><strong>JavaScript:</strong> <code>console.log(&#39;#foo\\bar&#39;);</code></li>\r\n</ul>\r\n\r\n<p>Ordered List Examples:</p>\r\n\r\n<ol>\r\n	<li>Download lorem ipsum dolor sit amet.</li>\r\n	<li>Click ipsum faucibus venenatis.</li>\r\n	<li>Configure fermentum malesuada nunc.</li>\r\n	<li>Deploy donec non ante libero.</li>\r\n</ol>\r\n\r\n<p>Callout Examples:</p>\r\n\r\n<p><!--//icon-holder-->Note</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium <code>&lt;code&gt;</code> , Nemo enim ipsam voluptatem quia voluptas <a href=\"#\">link example</a> sit aspernatur aut odit aut fugit.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Warning</p>\r\n\r\n<p>Nunc hendrerit odio quis dignissim efficitur. Proin ut finibus libero. Morbi posuere fringilla felis eget sagittis. Fusce sem orci, cursus in tortor <a href=\"#\">link example</a> tellus vel diam viverra elementum.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Tip</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\"#\">Link example</a> aenean commodo ligula eget dolor.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Danger</p>\r\n\r\n<p>Morbi eget interdum sapien. Donec sed turpis sed nulla lacinia accumsan vitae ut tellus. Aenean vestibulum <a href=\"#\">Link example</a> maximus ipsum vel dignissim. Morbi ornare elit sit amet massa feugiat, viverra dictum ipsum pellentesque.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p>Alert Examples:</p>\r\n\r\n<p>This is a primary alert&mdash;check it out!</p>\r\n\r\n<p>This is a secondary alert&mdash;check it out!</p>\r\n\r\n<p>This is a success alert&mdash;check it out!</p>\r\n\r\n<p>This is a danger alert&mdash;check it out!</p>\r\n\r\n<p>This is a warning alert&mdash;check it out!</p>\r\n\r\n<p>This is a info alert&mdash;check it out!</p>\r\n\r\n<p>This is a light alert&mdash;check it out!</p>\r\n\r\n<p>This is a dark alert&mdash;check it out!</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.2</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Image Lightbox Example:</p>\r\n\r\n<p><a href=\"assets/images/features/appify-theme-projects-overview-lg.jpg\"><img alt=\"\" src=\"assets/images/features/appify-add-members.gif\" style=\"width:600px\" /></a></p>\r\n\r\n<p>Credit: the above screencast is taken from <a href=\"https://themes.3rdwavemedia.com/bootstrap-templates/product/appify-bootstrap-4-admin-template-for-app-developers/\" target=\"_blank\">Appify theme</a>.</p>\r\n\r\n<p>Custom Table:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><a href=\"#\">Option 1</a></th>\r\n			<td>Option 1 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 2</a></th>\r\n			<td>Option 2 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 3</a></th>\r\n			<td>Option 3 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 4</a></th>\r\n			<td>Option 4 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Stripped Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Bordered Dark Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive--><!--//section-->\r\n\r\n<h2>Section Item 1.3</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Badges Examples:</p>\r\n\r\n<p>Primary Secondary Success Danger Warning Info Light Dark</p>\r\n\r\n<p>Button Examples:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Primary Button</a></li>\r\n	<li><a href=\"#\">Secondary Button</a></li>\r\n	<li><a href=\"#\">Light Button</a></li>\r\n	<li><a href=\"#\">Succcess Button</a></li>\r\n	<li><a href=\"#\">Info Button</a></li>\r\n	<li><a href=\"#\">Warning Button</a></li>\r\n	<li><a href=\"#\">Danger Button</a></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Download Now</a></li>\r\n	<li><a href=\"#\">View Docs</a></li>\r\n	<li><a href=\"#\">View Features</a></li>\r\n	<li><a href=\"#\">Fork Now</a></li>\r\n	<li><a href=\"#\">Find Out Now</a></li>\r\n	<li><a href=\"#\">Report Bugs</a></li>\r\n	<li><a href=\"#\">Submit Issues</a></li>\r\n</ul>\r\n<!--//row-->\r\n\r\n<p>Progress Examples:</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.4</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Pagination Example:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Previous</a></li>\r\n	<li><a href=\"#\">1</a></li>\r\n	<li><a href=\"#\">2</a></li>\r\n	<li><a href=\"#\">3</a></li>\r\n	<li><a href=\"#\">Next</a></li>\r\n</ul>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.5</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.6</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->', 0),
(2, 1, 'under-construction', 'Under Construction', '<h1>Under Construction</h1>', 0),
(5, 3, 'test-2', 'Test', '<h2>Section Item 1.1</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<p>Code Example: <code>npm install &lt;package&gt;</code></p>\r\n\r\n<p>Unordered List Examples:</p>\r\n\r\n<ul>\r\n	<li><strong>HTML5:</strong> <code>&lt;div id=&quot;foo&quot;&gt;</code></li>\r\n	<li><strong>CSS:</strong> <code>#foo { color: red }</code></li>\r\n	<li><strong>JavaScript:</strong> <code>console.log(&#39;#foo\\bar&#39;);</code></li>\r\n</ul>\r\n\r\n<p>Ordered List Examples:</p>\r\n\r\n<ol>\r\n	<li>Download lorem ipsum dolor sit amet.</li>\r\n	<li>Click ipsum faucibus venenatis.</li>\r\n	<li>Configure fermentum malesuada nunc.</li>\r\n	<li>Deploy donec non ante libero.</li>\r\n</ol>\r\n\r\n<p>Callout Examples:</p>\r\n\r\n<p><!--//icon-holder-->Note</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium <code>&lt;code&gt;</code> , Nemo enim ipsam voluptatem quia voluptas <a href=\"#\">link example</a> sit aspernatur aut odit aut fugit.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Warning</p>\r\n\r\n<p>Nunc hendrerit odio quis dignissim efficitur. Proin ut finibus libero. Morbi posuere fringilla felis eget sagittis. Fusce sem orci, cursus in tortor <a href=\"#\">link example</a> tellus vel diam viverra elementum.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Tip</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\"#\">Link example</a> aenean commodo ligula eget dolor.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Danger</p>\r\n\r\n<p>Morbi eget interdum sapien. Donec sed turpis sed nulla lacinia accumsan vitae ut tellus. Aenean vestibulum <a href=\"#\">Link example</a> maximus ipsum vel dignissim. Morbi ornare elit sit amet massa feugiat, viverra dictum ipsum pellentesque.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p>Alert Examples:</p>\r\n\r\n<p>This is a primary alert&mdash;check it out!</p>\r\n\r\n<p>This is a secondary alert&mdash;check it out!</p>\r\n\r\n<p>This is a success alert&mdash;check it out!</p>\r\n\r\n<p>This is a danger alert&mdash;check it out!</p>\r\n\r\n<p>This is a warning alert&mdash;check it out!</p>\r\n\r\n<p>This is a info alert&mdash;check it out!</p>\r\n\r\n<p>This is a light alert&mdash;check it out!</p>\r\n\r\n<p>This is a dark alert&mdash;check it out!</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.2</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Image Lightbox Example:</p>\r\n\r\n<p><a href=\"assets/images/features/appify-theme-projects-overview-lg.jpg\"><img alt=\"\" src=\"assets/images/features/appify-add-members.gif\" style=\"width:600px\" /></a></p>\r\n\r\n<p>Credit: the above screencast is taken from <a href=\"https://themes.3rdwavemedia.com/bootstrap-templates/product/appify-bootstrap-4-admin-template-for-app-developers/\" target=\"_blank\">Appify theme</a>.</p>\r\n\r\n<p>Custom Table:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><a href=\"#\">Option 1</a></th>\r\n			<td>Option 1 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 2</a></th>\r\n			<td>Option 2 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 3</a></th>\r\n			<td>Option 3 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 4</a></th>\r\n			<td>Option 4 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Stripped Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Bordered Dark Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive--><!--//section-->\r\n\r\n<h2>Section Item 1.3</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Badges Examples:</p>\r\n\r\n<p>Primary Secondary Success Danger Warning Info Light Dark</p>\r\n\r\n<p>Button Examples:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Primary Button</a></li>\r\n	<li><a href=\"#\">Secondary Button</a></li>\r\n	<li><a href=\"#\">Light Button</a></li>\r\n	<li><a href=\"#\">Succcess Button</a></li>\r\n	<li><a href=\"#\">Info Button</a></li>\r\n	<li><a href=\"#\">Warning Button</a></li>\r\n	<li><a href=\"#\">Danger Button</a></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Download Now</a></li>\r\n	<li><a href=\"#\">View Docs</a></li>\r\n	<li><a href=\"#\">View Features</a></li>\r\n	<li><a href=\"#\">Fork Now</a></li>\r\n	<li><a href=\"#\">Find Out Now</a></li>\r\n	<li><a href=\"#\">Report Bugs</a></li>\r\n	<li><a href=\"#\">Submit Issues</a></li>\r\n</ul>\r\n<!--//row-->\r\n\r\n<p>Progress Examples:</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.4</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Pagination Example:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Previous</a></li>\r\n	<li><a href=\"#\">1</a></li>\r\n	<li><a href=\"#\">2</a></li>\r\n	<li><a href=\"#\">3</a></li>\r\n	<li><a href=\"#\">Next</a></li>\r\n</ul>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.5</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.6</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->', 0),
(7, 2, 'web-content-thief', 'Web Content Thief', '<h2>Section Item 1.1</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<p>Code Example: <code>npm install &lt;package&gt;</code></p>\r\n\r\n<p>Unordered List Examples:</p>\r\n\r\n<ul>\r\n	<li><strong>HTML5:</strong> <code>&lt;div id=&quot;foo&quot;&gt;</code></li>\r\n	<li><strong>CSS:</strong> <code>#foo { color: red }</code></li>\r\n	<li><strong>JavaScript:</strong> <code>console.log(&#39;#foo\\bar&#39;);</code></li>\r\n</ul>\r\n\r\n<p>Ordered List Examples:</p>\r\n\r\n<ol>\r\n	<li>Download lorem ipsum dolor sit amet.</li>\r\n	<li>Click ipsum faucibus venenatis.</li>\r\n	<li>Configure fermentum malesuada nunc.</li>\r\n	<li>Deploy donec non ante libero.</li>\r\n</ol>\r\n\r\n<p>Callout Examples:</p>\r\n\r\n<p><!--//icon-holder-->Note</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium <code>&lt;code&gt;</code> , Nemo enim ipsam voluptatem quia voluptas <a href=\"#\">link example</a> sit aspernatur aut odit aut fugit.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Warning</p>\r\n\r\n<p>Nunc hendrerit odio quis dignissim efficitur. Proin ut finibus libero. Morbi posuere fringilla felis eget sagittis. Fusce sem orci, cursus in tortor <a href=\"#\">link example</a> tellus vel diam viverra elementum.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Tip</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\"#\">Link example</a> aenean commodo ligula eget dolor.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Danger</p>\r\n\r\n<p>Morbi eget interdum sapien. Donec sed turpis sed nulla lacinia accumsan vitae ut tellus. Aenean vestibulum <a href=\"#\">Link example</a> maximus ipsum vel dignissim. Morbi ornare elit sit amet massa feugiat, viverra dictum ipsum pellentesque.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p>Alert Examples:</p>\r\n\r\n<p>This is a primary alert&mdash;check it out!</p>\r\n\r\n<p>This is a secondary alert&mdash;check it out!</p>\r\n\r\n<p>This is a success alert&mdash;check it out!</p>\r\n\r\n<p>This is a danger alert&mdash;check it out!</p>\r\n\r\n<p>This is a warning alert&mdash;check it out!</p>\r\n\r\n<p>This is a info alert&mdash;check it out!</p>\r\n\r\n<p>This is a light alert&mdash;check it out!</p>\r\n\r\n<p>This is a dark alert&mdash;check it out!</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.2</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Image Lightbox Example:</p>\r\n\r\n<p><a href=\"assets/images/features/appify-theme-projects-overview-lg.jpg\"><img alt=\"\" src=\"assets/images/features/appify-add-members.gif\" style=\"width:600px\" /></a></p>\r\n\r\n<p>Credit: the above screencast is taken from <a href=\"https://themes.3rdwavemedia.com/bootstrap-templates/product/appify-bootstrap-4-admin-template-for-app-developers/\" target=\"_blank\">Appify theme</a>.</p>\r\n\r\n<p>Custom Table:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><a href=\"#\">Option 1</a></th>\r\n			<td>Option 1 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 2</a></th>\r\n			<td>Option 2 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 3</a></th>\r\n			<td>Option 3 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 4</a></th>\r\n			<td>Option 4 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Stripped Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Bordered Dark Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive--><!--//section-->\r\n\r\n<h2>Section Item 1.3</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Badges Examples:</p>\r\n\r\n<p>Primary Secondary Success Danger Warning Info Light Dark</p>\r\n\r\n<p>Button Examples:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Primary Button</a></li>\r\n	<li><a href=\"#\">Secondary Button</a></li>\r\n	<li><a href=\"#\">Light Button</a></li>\r\n	<li><a href=\"#\">Succcess Button</a></li>\r\n	<li><a href=\"#\">Info Button</a></li>\r\n	<li><a href=\"#\">Warning Button</a></li>\r\n	<li><a href=\"#\">Danger Button</a></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Download Now</a></li>\r\n	<li><a href=\"#\">View Docs</a></li>\r\n	<li><a href=\"#\">View Features</a></li>\r\n	<li><a href=\"#\">Fork Now</a></li>\r\n	<li><a href=\"#\">Find Out Now</a></li>\r\n	<li><a href=\"#\">Report Bugs</a></li>\r\n	<li><a href=\"#\">Submit Issues</a></li>\r\n</ul>\r\n<!--//row-->\r\n\r\n<p>Progress Examples:</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.4</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Pagination Example:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Previous</a></li>\r\n	<li><a href=\"#\">1</a></li>\r\n	<li><a href=\"#\">2</a></li>\r\n	<li><a href=\"#\">3</a></li>\r\n	<li><a href=\"#\">Next</a></li>\r\n</ul>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.5</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.6</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->', 0),
(8, 2, 'web-guitar-pro', 'Web Guitar Pro', '<center><h2>MUSIC NOTATION AND GUITAR TABLATURE ONLINE PLAYER</h2></center>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<ul>\r\n	<li><strong>Cross Platform: </strong> <code> alphaTab runs on multiple platforms. Chrome, Firefox, Internet Explorer, Opera, Safari, .net. Java, Android and iOS are on the roadmap. </code></li>\r\n	<li><strong>Open Source:</strong> <code> alphaTab is licensed under LGPL. Use alphaTab anywhere as long you keep our copyright and contribute your changes. </code></li>\r\n</ul>', 0),
(9, 2, 'salary-j-2', 'Salary J-2', '<h2>Section Item 1.1</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<p>Code Example: <code>npm install &lt;package&gt;</code></p>\r\n\r\n<p>Unordered List Examples:</p>\r\n\r\n<ul>\r\n	<li><strong>HTML5:</strong> <code>&lt;div id=&quot;foo&quot;&gt;</code></li>\r\n	<li><strong>CSS:</strong> <code>#foo { color: red }</code></li>\r\n	<li><strong>JavaScript:</strong> <code>console.log(&#39;#foo\\bar&#39;);</code></li>\r\n</ul>\r\n\r\n<p>Ordered List Examples:</p>\r\n\r\n<ol>\r\n	<li>Download lorem ipsum dolor sit amet.</li>\r\n	<li>Click ipsum faucibus venenatis.</li>\r\n	<li>Configure fermentum malesuada nunc.</li>\r\n	<li>Deploy donec non ante libero.</li>\r\n</ol>\r\n\r\n<p>Callout Examples:</p>\r\n\r\n<p><!--//icon-holder-->Note</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium <code>&lt;code&gt;</code> , Nemo enim ipsam voluptatem quia voluptas <a href=\"#\">link example</a> sit aspernatur aut odit aut fugit.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Warning</p>\r\n\r\n<p>Nunc hendrerit odio quis dignissim efficitur. Proin ut finibus libero. Morbi posuere fringilla felis eget sagittis. Fusce sem orci, cursus in tortor <a href=\"#\">link example</a> tellus vel diam viverra elementum.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Tip</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\"#\">Link example</a> aenean commodo ligula eget dolor.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Danger</p>\r\n\r\n<p>Morbi eget interdum sapien. Donec sed turpis sed nulla lacinia accumsan vitae ut tellus. Aenean vestibulum <a href=\"#\">Link example</a> maximus ipsum vel dignissim. Morbi ornare elit sit amet massa feugiat, viverra dictum ipsum pellentesque.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p>Alert Examples:</p>\r\n\r\n<p>This is a primary alert&mdash;check it out!</p>\r\n\r\n<p>This is a secondary alert&mdash;check it out!</p>\r\n\r\n<p>This is a success alert&mdash;check it out!</p>\r\n\r\n<p>This is a danger alert&mdash;check it out!</p>\r\n\r\n<p>This is a warning alert&mdash;check it out!</p>\r\n\r\n<p>This is a info alert&mdash;check it out!</p>\r\n\r\n<p>This is a light alert&mdash;check it out!</p>\r\n\r\n<p>This is a dark alert&mdash;check it out!</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.2</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Image Lightbox Example:</p>\r\n\r\n<p><a href=\"assets/images/features/appify-theme-projects-overview-lg.jpg\"><img alt=\"\" src=\"assets/images/features/appify-add-members.gif\" style=\"width:600px\" /></a></p>\r\n\r\n<p>Credit: the above screencast is taken from <a href=\"https://themes.3rdwavemedia.com/bootstrap-templates/product/appify-bootstrap-4-admin-template-for-app-developers/\" target=\"_blank\">Appify theme</a>.</p>\r\n\r\n<p>Custom Table:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><a href=\"#\">Option 1</a></th>\r\n			<td>Option 1 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 2</a></th>\r\n			<td>Option 2 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 3</a></th>\r\n			<td>Option 3 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 4</a></th>\r\n			<td>Option 4 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Stripped Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Bordered Dark Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive--><!--//section-->\r\n\r\n<h2>Section Item 1.3</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Badges Examples:</p>\r\n\r\n<p>Primary Secondary Success Danger Warning Info Light Dark</p>\r\n\r\n<p>Button Examples:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Primary Button</a></li>\r\n	<li><a href=\"#\">Secondary Button</a></li>\r\n	<li><a href=\"#\">Light Button</a></li>\r\n	<li><a href=\"#\">Succcess Button</a></li>\r\n	<li><a href=\"#\">Info Button</a></li>\r\n	<li><a href=\"#\">Warning Button</a></li>\r\n	<li><a href=\"#\">Danger Button</a></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Download Now</a></li>\r\n	<li><a href=\"#\">View Docs</a></li>\r\n	<li><a href=\"#\">View Features</a></li>\r\n	<li><a href=\"#\">Fork Now</a></li>\r\n	<li><a href=\"#\">Find Out Now</a></li>\r\n	<li><a href=\"#\">Report Bugs</a></li>\r\n	<li><a href=\"#\">Submit Issues</a></li>\r\n</ul>\r\n<!--//row-->\r\n\r\n<p>Progress Examples:</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.4</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Pagination Example:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Previous</a></li>\r\n	<li><a href=\"#\">1</a></li>\r\n	<li><a href=\"#\">2</a></li>\r\n	<li><a href=\"#\">3</a></li>\r\n	<li><a href=\"#\">Next</a></li>\r\n</ul>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.5</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.6</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->', 0),
(10, 2, 'card-games', 'Card Games', '<h2>Section Item 1.1</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id.</p>\r\n\r\n<p>Code Example: <code>npm install &lt;package&gt;</code></p>\r\n\r\n<p>Unordered List Examples:</p>\r\n\r\n<ul>\r\n	<li><strong>HTML5:</strong> <code>&lt;div id=&quot;foo&quot;&gt;</code></li>\r\n	<li><strong>CSS:</strong> <code>#foo { color: red }</code></li>\r\n	<li><strong>JavaScript:</strong> <code>console.log(&#39;#foo\\bar&#39;);</code></li>\r\n</ul>\r\n\r\n<p>Ordered List Examples:</p>\r\n\r\n<ol>\r\n	<li>Download lorem ipsum dolor sit amet.</li>\r\n	<li>Click ipsum faucibus venenatis.</li>\r\n	<li>Configure fermentum malesuada nunc.</li>\r\n	<li>Deploy donec non ante libero.</li>\r\n</ol>\r\n\r\n<p>Callout Examples:</p>\r\n\r\n<p><!--//icon-holder-->Note</p>\r\n\r\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium <code>&lt;code&gt;</code> , Nemo enim ipsam voluptatem quia voluptas <a href=\"#\">link example</a> sit aspernatur aut odit aut fugit.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Warning</p>\r\n\r\n<p>Nunc hendrerit odio quis dignissim efficitur. Proin ut finibus libero. Morbi posuere fringilla felis eget sagittis. Fusce sem orci, cursus in tortor <a href=\"#\">link example</a> tellus vel diam viverra elementum.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Tip</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\"#\">Link example</a> aenean commodo ligula eget dolor.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p><!--//icon-holder-->Danger</p>\r\n\r\n<p>Morbi eget interdum sapien. Donec sed turpis sed nulla lacinia accumsan vitae ut tellus. Aenean vestibulum <a href=\"#\">Link example</a> maximus ipsum vel dignissim. Morbi ornare elit sit amet massa feugiat, viverra dictum ipsum pellentesque.</p>\r\n<!--//content--><!--//callout-block-->\r\n\r\n<p>Alert Examples:</p>\r\n\r\n<p>This is a primary alert&mdash;check it out!</p>\r\n\r\n<p>This is a secondary alert&mdash;check it out!</p>\r\n\r\n<p>This is a success alert&mdash;check it out!</p>\r\n\r\n<p>This is a danger alert&mdash;check it out!</p>\r\n\r\n<p>This is a warning alert&mdash;check it out!</p>\r\n\r\n<p>This is a info alert&mdash;check it out!</p>\r\n\r\n<p>This is a light alert&mdash;check it out!</p>\r\n\r\n<p>This is a dark alert&mdash;check it out!</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.2</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Image Lightbox Example:</p>\r\n\r\n<p><a href=\"assets/images/features/appify-theme-projects-overview-lg.jpg\"><img alt=\"\" src=\"assets/images/features/appify-add-members.gif\" style=\"width:600px\" /></a></p>\r\n\r\n<p>Credit: the above screencast is taken from <a href=\"https://themes.3rdwavemedia.com/bootstrap-templates/product/appify-bootstrap-4-admin-template-for-app-developers/\" target=\"_blank\">Appify theme</a>.</p>\r\n\r\n<p>Custom Table:</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th><a href=\"#\">Option 1</a></th>\r\n			<td>Option 1 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 2</a></th>\r\n			<td>Option 2 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 3</a></th>\r\n			<td>Option 3 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n		<tr>\r\n			<th><a href=\"#\">Option 4</a></th>\r\n			<td>Option 4 desc lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Stripped Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive-->\r\n\r\n<p>Bordered Dark Table:</p>\r\n\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">#</th>\r\n			<th scope=\"col\">First</th>\r\n			<th scope=\"col\">Last</th>\r\n			<th scope=\"col\">Handle</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">1</th>\r\n			<td>Mark</td>\r\n			<td>Otto</td>\r\n			<td>@mdo</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">2</th>\r\n			<td>Jacob</td>\r\n			<td>Thornton</td>\r\n			<td>@fat</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">3</th>\r\n			<td>Larry</td>\r\n			<td>the Bird</td>\r\n			<td>@twitter</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<!--//table-responsive--><!--//section-->\r\n\r\n<h2>Section Item 1.3</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Badges Examples:</p>\r\n\r\n<p>Primary Secondary Success Danger Warning Info Light Dark</p>\r\n\r\n<p>Button Examples:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Primary Button</a></li>\r\n	<li><a href=\"#\">Secondary Button</a></li>\r\n	<li><a href=\"#\">Light Button</a></li>\r\n	<li><a href=\"#\">Succcess Button</a></li>\r\n	<li><a href=\"#\">Info Button</a></li>\r\n	<li><a href=\"#\">Warning Button</a></li>\r\n	<li><a href=\"#\">Danger Button</a></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Download Now</a></li>\r\n	<li><a href=\"#\">View Docs</a></li>\r\n	<li><a href=\"#\">View Features</a></li>\r\n	<li><a href=\"#\">Fork Now</a></li>\r\n	<li><a href=\"#\">Find Out Now</a></li>\r\n	<li><a href=\"#\">Report Bugs</a></li>\r\n	<li><a href=\"#\">Submit Issues</a></li>\r\n</ul>\r\n<!--//row-->\r\n\r\n<p>Progress Examples:</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.4</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n\r\n<p>Pagination Example:</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">Previous</a></li>\r\n	<li><a href=\"#\">1</a></li>\r\n	<li><a href=\"#\">2</a></li>\r\n	<li><a href=\"#\">3</a></li>\r\n	<li><a href=\"#\">Next</a></li>\r\n</ul>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.5</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->\r\n\r\n<h2>Section Item 1.6</h2>\r\n\r\n<p>Vivamus efficitur fringilla ullamcorper. Cras condimentum condimentum mauris, vitae facilisis leo. Aliquam sagittis purus nisi, at commodo augue convallis id. Sed interdum turpis quis felis bibendum imperdiet. Mauris pellentesque urna eu leo gravida iaculis. In fringilla odio in felis ultricies porttitor. Donec at purus libero. Vestibulum libero orci, commodo nec arcu sit amet, commodo sollicitudin est. Vestibulum ultricies malesuada tempor.</p>\r\n<!--//section-->', 0),
(11, 4, 'maintenance', 'Maintenance', '<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n<title>Coming Soon Page</title>\r\n<meta charset=\"UTF-8\">\r\n<meta content=\"IE=edge,chrome=1\" http-equiv=\"X-UA-Compatible\">\r\n<meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\r\n<meta content=\"\" name=\"description\">\r\n<link href=\"https://fonts.googleapis.com/css?family=Neuton|Roboto\" rel=\"stylesheet\">\r\n<style>\r\n.holder{\r\nwidth: 480px;\r\ntext-align: center;\r\nmargin: 0 auto;\r\npadding-top: 120px;\r\n}\r\n.holder h1 {\r\nfont-family: \'loveloblack\', sans-serif;\r\nfont-size:5em;\r\ncolor:#2d2d2d;\r\ntext-shadow: 3px 3px 0 #e3e3e3;\r\nline-height: 27px;\r\nmargin-top: 12px;\r\nmargin-bottom: 10px;\r\n}\r\n.holder h1 span.tbl{\r\nfont-family: Dosis,Tahoma,sans-serif;\r\nfont-size:35px;\r\ncolor:#2d2d2d;\r\nline-height:1em;\r\nfont-weight: bold;\r\nletter-spacing: -1px;\r\nline-height: 1;\r\ntext-shadow: -1px 1px 1px rgba(0, 0, 0, 0.3);\r\n}\r\n.holder h1 span {\r\nfont-family: Dosis,Tahoma,sans-serif;\r\nfont-size:1em;\r\ncolor:#3d9df8;\r\nline-height:1em;\r\nfont-weight: bold;\r\nletter-spacing: -1px;\r\nline-height: 1;\r\ntext-shadow: -1px 1px 1px rgba(0, 0, 0, 0.3);\r\n}  \r\np{\r\nfont-size: 18px;\r\nfont-weight: 600;\r\ncolor: #13447E;\r\nfont-family: \'Neuton\', serif;\r\n}\r\n</style>\r\n</head>\r\n<body>\r\n<div class=\"holder\">\r\n<img src=\"/build/img/coderdocs-logo.svg\" style=\"width:250px\" />\r\n<h1><span class=\"tbl\">Website is currently under maintenance.</span></h1>\r\n<p><span class=\"tbl\">We\'ll be back shortly.</span></p><br>\r\n<br />\r\n</div>\r\n</body>\r\n</html>', 0),
(12, 3, 'FOS CkEditor integration', 'FOS CkEditor integration', '<blockquote>\r\n<pre>\r\n$ composer require friendsofsymfony/ckeditor-bundle\r\n$ ./bin/console ckeditor:install\r\n$ ./bin/console assets:install --symlink</pre>\r\n</blockquote>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `DEV_VSUM_UserGroups`
--

CREATE TABLE `DEV_VSUM_UserGroups` (
  `id` int(11) NOT NULL,
  `name` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `DEV_VSUM_Users`
--

CREATE TABLE `DEV_VSUM_Users` (
  `id` int(11) NOT NULL,
  `preferedLocale` varchar(6) NOT NULL DEFAULT 'en',
  `username` varchar(180) NOT NULL,
  `username_canonical` varchar(180) NOT NULL,
  `email` varchar(180) NOT NULL,
  `email_canonical` varchar(180) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  `subscriptionId` int(11) DEFAULT NULL,
  `user_info_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DEV_VSUM_Users`
--

INSERT INTO `DEV_VSUM_Users` (`id`, `preferedLocale`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `subscriptionId`, `user_info_id`) VALUES
(1, 'en', 'admin', 'admin', 'admin', 'admin', 1, 'ZEAYhdMkJnNRZ0t5JO0Ol5AecbXAwj3ennB0CrmBIBY', '$argon2i$v=19$m=65536,t=4,p=1$MWFNejhXMzFwVFdpVElGMg$qq6lIt3kFlHxPq6plag34jEwsfMvglffqYH9UkKL26Q', '2020-04-18 13:20:04', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', 3, 4),
(2, 'en', 'admin2', 'admin2', 'admin2', 'admin2', 1, '.oHKGUigY1G7Z0zMWuYTGC4DZ2Mc9fQNZ2jBLvkTTn0', '$argon2i$v=19$m=65536,t=4,p=1$MWFNejhXMzFwVFdpVElGMg$qq6lIt3kFlHxPq6plag34jEwsfMvglffqYH9UkKL26Q', NULL, NULL, NULL, 'a:0:{}', NULL, NULL),
(3, 'en', 'admin', 'admin', 'admin', 'admin', 1, 'rID/Lqp8tiUKWL9s7pAPzal3y00yLvBzx0UC88V8.Zk', '$argon2i$v=19$m=65536,t=4,p=1$NkdQVUMuNXYzZGNxL2U1Nw$lMSM2JxwjZNuo53LCGeuEVh0izOxrwUGIb2D5h9a/64', NULL, NULL, NULL, 'a:0:{}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `DEV_VSUM_UsersActivities`
--

CREATE TABLE `DEV_VSUM_UsersActivities` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `activity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `DEV_VSUM_UsersActivities`
--

INSERT INTO `DEV_VSUM_UsersActivities` (`id`, `date`, `userId`, `activity`) VALUES
(1, '2019-11-04 00:00:00', 1, 'Test Activity'),
(2, '2019-11-05 20:13:17', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(3, '2019-11-06 04:30:04', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(4, '2019-11-06 05:04:54', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"stripe\"'),
(5, '2019-11-06 05:13:26', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"stripe\"'),
(6, '2019-11-06 05:17:53', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(7, '2019-11-06 06:00:12', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(8, '2019-11-06 07:49:02', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(9, '2019-11-06 07:49:45', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(10, '2019-11-06 19:27:31', 1, 'User cancel recurring payment for \"paypal_express_checkout_recurring_payment\".'),
(11, '2019-11-13 11:13:37', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(12, '2019-11-14 10:17:34', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"stripe\"'),
(13, '2019-11-14 10:42:39', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"stripe\"'),
(14, '2019-11-14 13:08:16', 1, 'User subscribed to the \"Test Package with Monthly Plan\". Payed with \"paypal_express_checkout_recurring_payment\"'),
(15, '2019-11-14 13:08:31', 1, 'User cancel recurring payment for \"paypal_express_checkout_recurring_payment\".');

-- --------------------------------------------------------

--
-- Table structure for table `DEV_VSUM_UsersInfo`
--

CREATE TABLE `DEV_VSUM_UsersInfo` (
  `id` int(11) NOT NULL,
  `apiToken` varchar(255) DEFAULT NULL,
  `firstName` varchar(128) DEFAULT NULL,
  `lastName` varchar(128) DEFAULT NULL,
  `country` varchar(3) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `website` varchar(64) DEFAULT NULL,
  `occupation` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DEV_VSUM_UsersInfo`
--

INSERT INTO `DEV_VSUM_UsersInfo` (`id`, `apiToken`, `firstName`, `lastName`, `country`, `birthday`, `mobile`, `website`, `occupation`) VALUES
(4, NULL, 'Ivan', 'Atanasov', 'BG', '1977-08-09 00:00:00', '449999999999', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `DEV_VSUM_UsersNotifications`
--

CREATE TABLE `DEV_VSUM_UsersNotifications` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `notification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `DEV_VSUM_UsersNotifications`
--

INSERT INTO `DEV_VSUM_UsersNotifications` (`id`, `date`, `userId`, `notification`) VALUES
(1, '2019-11-04 00:00:00', 1, 'Test Notification');

-- --------------------------------------------------------

--
-- Table structure for table `DEV_VSUM_Users_Groups`
--

CREATE TABLE `DEV_VSUM_Users_Groups` (
  `userId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` int(11) NOT NULL,
  `category_id` int(4) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_type` enum('wget','git','svn','install_manual') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repository` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_root` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_root` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `with_ssl` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `install_manual` text COLLATE utf8mb4_unicode_ci,
  `phpFpmSocket` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reverseProxy` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `category_id`, `name`, `source_type`, `repository`, `branch`, `project_root`, `document_root`, `host`, `with_ssl`, `install_manual`, `phpFpmSocket`, `reverseProxy`) VALUES
(1, 2, 'SalaryJ2', 'git', 'https://gitlab.com/iatanasov77/salary-j-2', 'master', '/projects/SalaryJ2', '/projects/SalaryJ2/public', 'salaryj2.lh', '0', 'NO INSTALL MANUAL', NULL, NULL),
(2, 3, 'SULU', 'install_manual', 'https://github.com/sulu/skeleton', 'master', '/projects/SULU', '/projects/SULU/public', 'sulu.lh', '0', 'READ <a href=\"http://docs.sulu.io/en/latest/book/getting-started.html\" target=\"__blank\">THIS</a>', NULL, NULL),
(3, 3, 'Magento', 'install_manual', 'NO', 'NO', '/projects/Magento', '/projects/Magento/public', 'magento.lh', '0', '<p><a href=\"https://devdocs.magento.com/guides/v2.3/install-gde/composer.html\" target=\"__blank\">Install Magento 2.3 with Composer</a></p>', NULL, NULL),
(4, 3, 'Magento Test Installation', 'install_manual', 'NO', 'NO', '/projects/MagentoNotInstalled', '/projects/Magento/update', 'magento.lh', '0', '<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li><a href=\"https://devdocs.magento.com/guides/v2.3/install-gde/composer.html\" target=\"__blank\">Install Magento 2.3 with Composer</a></li>\r\n	<li>Install with wget: Installation with composer not working.\r\n <a href=\"https://magento.com/tech-resources/download\" target=\"__blank\">Download</a>&nbsp;archive extract and use web install.</li>\r\n	<li>Frontend:<br />\r\n	# php bin/magento setup:static-content:deploy -f</li>\r\n</ol>', NULL, NULL),
(5, 3, 'Sylius', 'install_manual', 'none', 'none', '/projects/Sylius', '/projects/Sylius/public', 'sylius.lh', '0', '<p><a href=\"https://docs.sylius.com/en/1.6/getting-started-with-sylius/installation.html\" target=\"__blank\">Read Installation Manual</a> Version: 1.6</p>', NULL, NULL),
(6, 4, 'VankoSoft.Org', 'install_manual', 'https://gitlab.com/iatanasov77/vankosoft.org.git', 'develop', '/projects/VankoSoft.Org', '/projects/VankoSoft.Org/public', 'vankosoft.lh', '0', NULL, NULL, NULL),
(7, 4, 'BabyMarket 2', 'install_manual', 'https://gitlab.com/iatanasov77/babymarket.bg_2.git', 'develop', '/projects/BabyMarket_2', '/projects/BabyMarket_2/public', 'babymarket2.lh', '0', NULL, NULL, NULL),
(8, 2, 'Okta_AspNetCoreMysql', 'git', 'https://github.com/oktadeveloper/okta-aspnetcore-mysql-twilio-example.git', 'master', '/projects/Okta_AspNetCoreMysql', '/projects/Okta_AspNetCoreMysql/TextTasks/wwwroot', 'oam.lh', '0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `VSAPP_Translations`
--

CREATE TABLE `VSAPP_Translations` (
  `id` int(2) NOT NULL,
  `locale` varchar(8) NOT NULL,
  `object_class` varchar(255) NOT NULL,
  `object_id` int(8) DEFAULT NULL,
  `field` varchar(32) NOT NULL,
  `foreign_key` varchar(64) NOT NULL,
  `content` text CHARACTER SET utf8mb4
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
-- Indexes for table `DEVEL_VSAPP_Settings`
--
ALTER TABLE `DEVEL_VSAPP_Settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DEVEL_VSAPP_SiteSettings`
--
ALTER TABLE `DEVEL_VSAPP_SiteSettings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`settings_id`),
  ADD KEY `taxon_id` (`site_id`);

--
-- Indexes for table `DEVEL_VSAPP_Taxonomy`
--
ALTER TABLE `DEVEL_VSAPP_Taxonomy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DEVEL_VSAPP_Taxons`
--
ALTER TABLE `DEVEL_VSAPP_Taxons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DEVEL_VSAPP_TaxonTranslations`
--
ALTER TABLE `DEVEL_VSAPP_TaxonTranslations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DEV_VSCMS_PageCategories`
--
ALTER TABLE `DEV_VSCMS_PageCategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`),
  ADD KEY `taxon_id` (`taxon_id`);

--
-- Indexes for table `DEV_VSCMS_Pages`
--
ALTER TABLE `DEV_VSCMS_Pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DEV_VSUM_UserGroups`
--
ALTER TABLE `DEV_VSUM_UserGroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D52F22C85E237E06` (`name`);

--
-- Indexes for table `DEV_VSUM_Users`
--
ALTER TABLE `DEV_VSUM_Users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DEV_VSUM_UsersActivities`
--
ALTER TABLE `DEV_VSUM_UsersActivities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DEV_VSUM_UsersInfo`
--
ALTER TABLE `DEV_VSUM_UsersInfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9E6E7D917BA2F5EB` (`apiToken`);

--
-- Indexes for table `DEV_VSUM_UsersNotifications`
--
ALTER TABLE `DEV_VSUM_UsersNotifications`
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
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `DEVEL_VSAPP_Settings`
--
ALTER TABLE `DEVEL_VSAPP_Settings`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `DEVEL_VSAPP_SiteSettings`
--
ALTER TABLE `DEVEL_VSAPP_SiteSettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `DEVEL_VSAPP_Taxonomy`
--
ALTER TABLE `DEVEL_VSAPP_Taxonomy`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `DEVEL_VSAPP_Taxons`
--
ALTER TABLE `DEVEL_VSAPP_Taxons`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `DEVEL_VSAPP_TaxonTranslations`
--
ALTER TABLE `DEVEL_VSAPP_TaxonTranslations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `DEV_VSCMS_PageCategories`
--
ALTER TABLE `DEV_VSCMS_PageCategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `DEV_VSCMS_Pages`
--
ALTER TABLE `DEV_VSCMS_Pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `DEV_VSUM_UserGroups`
--
ALTER TABLE `DEV_VSUM_UserGroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `DEV_VSUM_Users`
--
ALTER TABLE `DEV_VSUM_Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `DEV_VSUM_UsersActivities`
--
ALTER TABLE `DEV_VSUM_UsersActivities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `DEV_VSUM_UsersInfo`
--
ALTER TABLE `DEV_VSUM_UsersInfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `DEV_VSUM_UsersNotifications`
--
ALTER TABLE `DEV_VSUM_UsersNotifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `VSAPP_Translations`
--
ALTER TABLE `VSAPP_Translations`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
