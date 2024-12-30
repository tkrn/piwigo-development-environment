-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: piwigo-dev-db
-- Generation Time: Dec 30, 2024 at 01:57 PM
-- Server version: 11.6.2-MariaDB-ubu2404
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `piwigo-dev-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_activity`
--

DROP TABLE IF EXISTS `piwigo_activity`;
CREATE TABLE `piwigo_activity` (
  `activity_id` int(11) UNSIGNED NOT NULL,
  `object` varchar(255) NOT NULL,
  `object_id` int(11) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `performed_by` mediumint(8) UNSIGNED NOT NULL,
  `session_idx` varchar(255) NOT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `occured_on` timestamp NULL DEFAULT current_timestamp(),
  `details` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

--
-- Dumping data for table `piwigo_activity`
--

INSERT INTO `piwigo_activity` (`activity_id`, `object`, `object_id`, `action`, `performed_by`, `session_idx`, `ip_address`, `occured_on`, `details`, `user_agent`) VALUES
(1, 'system', 3, 'activate', 0, 'none', '172.19.0.1', '2024-12-30 13:55:52', 'a:3:{s:8:\"theme_id\";s:11:\"smartpocket\";s:7:\"version\";s:6:\"15.3.0\";s:6:\"script\";s:7:\"install\";}', NULL),
(2, 'system', 3, 'activate', 0, 'none', '172.19.0.1', '2024-12-30 13:55:52', 'a:3:{s:8:\"theme_id\";s:5:\"modus\";s:7:\"version\";s:6:\"15.3.0\";s:6:\"script\";s:7:\"install\";}', NULL),
(3, 'system', 1, 'install', 0, 'none', '172.19.0.1', '2024-12-30 13:55:52', 'a:2:{s:7:\"version\";s:6:\"15.3.0\";s:6:\"script\";s:7:\"install\";}', NULL),
(4, 'user', 1, 'login', 1, '4dclj896hki1emmekm8fc47s3a', '172.19.0.1', '2024-12-30 13:55:52', 'a:1:{s:6:\"script\";s:7:\"install\";}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:133.0) Gecko/20100101 Firefox/133.0');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_caddie`
--

DROP TABLE IF EXISTS `piwigo_caddie`;
CREATE TABLE `piwigo_caddie` (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `element_id` mediumint(8) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_categories`
--

DROP TABLE IF EXISTS `piwigo_categories`;
CREATE TABLE `piwigo_categories` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `id_uppercat` smallint(5) UNSIGNED DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `dir` varchar(255) DEFAULT NULL,
  `rank` smallint(5) UNSIGNED DEFAULT NULL,
  `status` enum('public','private') NOT NULL DEFAULT 'public',
  `site_id` tinyint(4) UNSIGNED DEFAULT NULL,
  `visible` enum('true','false') NOT NULL DEFAULT 'true',
  `representative_picture_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `uppercats` varchar(255) NOT NULL DEFAULT '',
  `commentable` enum('true','false') NOT NULL DEFAULT 'true',
  `global_rank` varchar(255) DEFAULT NULL,
  `image_order` varchar(128) DEFAULT NULL,
  `permalink` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `lastmodified` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_comments`
--

DROP TABLE IF EXISTS `piwigo_comments`;
CREATE TABLE `piwigo_comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `image_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `author` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `author_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `anonymous_id` varchar(45) NOT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `validated` enum('true','false') NOT NULL DEFAULT 'false',
  `validation_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_config`
--

DROP TABLE IF EXISTS `piwigo_config`;
CREATE TABLE `piwigo_config` (
  `param` varchar(40) NOT NULL DEFAULT '',
  `value` text DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='configuration table';

--
-- Dumping data for table `piwigo_config`
--

INSERT INTO `piwigo_config` (`param`, `value`, `comment`) VALUES
('activate_comments', 'false', 'Global parameter for usage of comments system'),
('nb_comment_page', '10', 'number of comments to display on each page'),
('log', 'true', 'keep an history of visits on your website'),
('comments_validation', 'false', 'administrators validate users comments before becoming visible'),
('comments_forall', 'false', 'even guest not registered can post comments'),
('comments_order', 'ASC', 'comments order on picture page and cie'),
('comments_author_mandatory', 'false', 'Comment author is mandatory'),
('comments_email_mandatory', 'false', 'Comment email is mandatory'),
('comments_enable_website', 'true', 'Enable \"website\" field on add comment form'),
('user_can_delete_comment', 'false', 'administrators can allow user delete their own comments'),
('user_can_edit_comment', 'false', 'administrators can allow user edit their own comments'),
('email_admin_on_comment_edition', 'false', 'Send an email to the administrators when a comment is modified'),
('email_admin_on_comment_deletion', 'false', 'Send an email to the administrators when a comment is deleted'),
('gallery_locked', 'false', 'Lock your gallery temporary for non admin users'),
('gallery_title', 'Just another Piwigo gallery', 'Title at top of each page and for RSS feed'),
('rate', 'false', 'Rating pictures feature is enabled'),
('rate_anonymous', 'true', 'Rating pictures feature is also enabled for visitors'),
('page_banner', '<h1>%gallery_title%</h1>\n\n<p>Welcome to my photo gallery</p>', 'html displayed on the top each page of your gallery'),
('history_admin', 'false', 'keep a history of administrator visits on your website'),
('history_guest', 'true', 'keep a history of guest visits on your website'),
('allow_user_registration', 'true', 'allow visitors to register?'),
('allow_user_customization', 'true', 'allow users to customize their gallery?'),
('nb_categories_page', '12', 'Param for categories pagination'),
('nbm_send_html_mail', 'true', 'Send mail on HTML format for notification by mail'),
('nbm_send_mail_as', '', 'Send mail as param value for notification by mail'),
('nbm_send_detailed_content', 'true', 'Send detailed content for notification by mail'),
('nbm_complementary_mail_content', '', 'Complementary mail content for notification by mail'),
('nbm_send_recent_post_dates', 'true', 'Send recent post by dates for notification by mail'),
('email_admin_on_new_user', 'none', 'Send an email to theadministrators when a user registers'),
('email_admin_on_comment', 'false', 'Send an email to the administrators when a valid comment is entered'),
('email_admin_on_comment_validation', 'true', 'Send an email to the administrators when a comment requires validation'),
('obligatory_user_mail_address', 'false', 'Mail address is obligatory for users'),
('c13y_ignore', NULL, 'List of ignored anomalies'),
('extents_for_templates', 'a:0:{}', 'Actived template-extension(s)'),
('blk_menubar', '', 'Menubar options'),
('menubar_filter_icon', 'false', 'Display filter icon'),
('index_sort_order_input', 'true', 'Display image order selection list'),
('index_flat_icon', 'false', 'Display flat icon'),
('index_posted_date_icon', 'true', 'Display calendar by posted date'),
('index_created_date_icon', 'true', 'Display calendar by creation date icon'),
('index_slideshow_icon', 'true', 'Display slideshow icon'),
('index_new_icon', 'true', 'Display new icons next albums and pictures'),
('picture_metadata_icon', 'true', 'Display metadata icon on picture page'),
('picture_slideshow_icon', 'true', 'Display slideshow icon on picture page'),
('picture_favorite_icon', 'true', 'Display favorite icon on picture page'),
('picture_download_icon', 'true', 'Display download icon on picture page'),
('picture_navigation_icons', 'true', 'Display navigation icons on picture page'),
('picture_navigation_thumb', 'true', 'Display navigation thumbnails on picture page'),
('picture_menu', 'false', 'Show menubar on picture page'),
('picture_informations', 'a:11:{s:6:\"author\";b:1;s:10:\"created_on\";b:1;s:9:\"posted_on\";b:1;s:10:\"dimensions\";b:0;s:4:\"file\";b:0;s:8:\"filesize\";b:0;s:4:\"tags\";b:1;s:10:\"categories\";b:1;s:6:\"visits\";b:1;s:12:\"rating_score\";b:1;s:13:\"privacy_level\";b:1;}', 'Information displayed on picture page'),
('week_starts_on', 'monday', 'Monday may not be the first day of the week'),
('updates_ignored', 'a:3:{s:7:\"plugins\";a:0:{}s:6:\"themes\";a:0:{}s:9:\"languages\";a:0:{}}', 'Extensions ignored for update'),
('order_by', 'ORDER BY date_available DESC, file ASC, id ASC', 'default photo order'),
('order_by_inside_category', 'ORDER BY date_available DESC, file ASC, id ASC', 'default photo order inside category'),
('original_resize', 'false', NULL),
('original_resize_maxwidth', '2016', NULL),
('original_resize_maxheight', '2016', NULL),
('original_resize_quality', '95', NULL),
('mobile_theme', 'smartpocket', NULL),
('mail_theme', 'clear', NULL),
('picture_sizes_icon', 'true', NULL),
('index_sizes_icon', 'true', NULL),
('index_edit_icon', 'true', NULL),
('index_caddie_icon', 'true', NULL),
('display_fromto', 'false', NULL),
('picture_edit_icon', 'true', NULL),
('picture_caddie_icon', 'true', NULL),
('picture_representative_icon', 'true', NULL),
('show_mobile_app_banner_in_admin', 'true', NULL),
('show_mobile_app_banner_in_gallery', 'false', NULL),
('index_search_in_set_button', 'false', NULL),
('index_search_in_set_action', 'true', NULL),
('upload_detect_duplicate', 'true', NULL),
('webmaster_id', '1', NULL),
('secret_key', 'fc9729ff0a6b8f5aaafb593d75248d9f466e7f3a', 'a secret key specific to the gallery for internal use'),
('piwigo_db_version', '15', NULL),
('smartpocket', 'a:2:{s:4:\"loop\";b:1;s:8:\"autohide\";i:5000;}', NULL),
('modus_theme', 'a:5:{s:4:\"skin\";s:9:\"newspaper\";s:16:\"album_thumb_size\";i:250;s:17:\"index_photo_deriv\";s:6:\"2small\";s:22:\"index_photo_deriv_hdpi\";s:6:\"xsmall\";s:19:\"display_page_banner\";b:0;}', NULL),
('derivatives', 'a:4:{s:1:\"d\";a:9:{s:6:\"square\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1735566956;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:120;i:1;i:120;}s:8:\"max_crop\";i:1;s:8:\"min_size\";a:2:{i:0;i:120;i:1;i:120;}}s:7:\"sharpen\";i:0;}s:5:\"thumb\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1735566956;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:144;i:1;i:144;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:6:\"2small\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1735566956;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:240;i:1;i:240;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:6:\"xsmall\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1735566956;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:432;i:1;i:324;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:5:\"small\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1735566956;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:576;i:1;i:432;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:6:\"medium\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1735566956;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:792;i:1;i:594;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:5:\"large\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1735566956;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:1008;i:1;i:756;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:6:\"xlarge\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1735566956;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:1224;i:1;i:918;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:7:\"xxlarge\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1735566956;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:1656;i:1;i:1242;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}}s:1:\"q\";i:95;s:1:\"w\";O:15:\"WatermarkParams\":7:{s:4:\"file\";s:0:\"\";s:8:\"min_size\";a:2:{i:0;i:500;i:1;i:500;}s:4:\"xpos\";i:50;s:4:\"ypos\";i:50;s:7:\"xrepeat\";i:0;s:7:\"yrepeat\";i:0;s:7:\"opacity\";i:100;}s:1:\"c\";a:0:{}}', NULL),
('piwigo_installed_version', '15.3.0', NULL),
('last_major_update', '2024-12-30 13:55:56', NULL),
('data_dir_checked', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_favorites`
--

DROP TABLE IF EXISTS `piwigo_favorites`;
CREATE TABLE `piwigo_favorites` (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `image_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_groups`
--

DROP TABLE IF EXISTS `piwigo_groups`;
CREATE TABLE `piwigo_groups` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_default` enum('true','false') NOT NULL DEFAULT 'false',
  `lastmodified` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_group_access`
--

DROP TABLE IF EXISTS `piwigo_group_access`;
CREATE TABLE `piwigo_group_access` (
  `group_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `cat_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_history`
--

DROP TABLE IF EXISTS `piwigo_history`;
CREATE TABLE `piwigo_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL DEFAULT '1970-01-01',
  `time` time NOT NULL DEFAULT '00:00:00',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `IP` char(39) NOT NULL DEFAULT '',
  `section` enum('categories','tags','search','list','favorites','most_visited','best_rated','recent_pics','recent_cats') DEFAULT NULL,
  `category_id` smallint(5) DEFAULT NULL,
  `search_id` int(10) UNSIGNED DEFAULT NULL,
  `tag_ids` varchar(50) DEFAULT NULL,
  `image_id` mediumint(8) DEFAULT NULL,
  `image_type` enum('picture','high','other') DEFAULT NULL,
  `format_id` int(11) UNSIGNED DEFAULT NULL,
  `auth_key_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_history_summary`
--

DROP TABLE IF EXISTS `piwigo_history_summary`;
CREATE TABLE `piwigo_history_summary` (
  `year` smallint(4) NOT NULL DEFAULT 0,
  `month` tinyint(2) DEFAULT NULL,
  `day` tinyint(2) DEFAULT NULL,
  `hour` tinyint(2) DEFAULT NULL,
  `nb_pages` int(11) DEFAULT NULL,
  `history_id_from` int(10) UNSIGNED DEFAULT NULL,
  `history_id_to` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_images`
--

DROP TABLE IF EXISTS `piwigo_images`;
CREATE TABLE `piwigo_images` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `date_available` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `date_creation` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `hit` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `filesize` mediumint(9) UNSIGNED DEFAULT NULL,
  `width` smallint(9) UNSIGNED DEFAULT NULL,
  `height` smallint(9) UNSIGNED DEFAULT NULL,
  `coi` char(4) DEFAULT NULL COMMENT 'center of interest',
  `representative_ext` varchar(4) DEFAULT NULL,
  `date_metadata_update` date DEFAULT NULL,
  `rating_score` float(5,2) UNSIGNED DEFAULT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `storage_category_id` smallint(5) UNSIGNED DEFAULT NULL,
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `md5sum` char(32) DEFAULT NULL,
  `added_by` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `rotation` tinyint(3) UNSIGNED DEFAULT NULL,
  `latitude` double(8,6) DEFAULT NULL,
  `longitude` double(9,6) DEFAULT NULL,
  `lastmodified` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_image_category`
--

DROP TABLE IF EXISTS `piwigo_image_category`;
CREATE TABLE `piwigo_image_category` (
  `image_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `category_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `rank` mediumint(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_image_format`
--

DROP TABLE IF EXISTS `piwigo_image_format`;
CREATE TABLE `piwigo_image_format` (
  `format_id` int(11) UNSIGNED NOT NULL,
  `image_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `ext` varchar(255) NOT NULL,
  `filesize` mediumint(9) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_image_tag`
--

DROP TABLE IF EXISTS `piwigo_image_tag`;
CREATE TABLE `piwigo_image_tag` (
  `image_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `tag_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_languages`
--

DROP TABLE IF EXISTS `piwigo_languages`;
CREATE TABLE `piwigo_languages` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '0',
  `name` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

--
-- Dumping data for table `piwigo_languages`
--

INSERT INTO `piwigo_languages` (`id`, `version`, `name`) VALUES
('en_US', '15.3.0', 'English [US]');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_lounge`
--

DROP TABLE IF EXISTS `piwigo_lounge`;
CREATE TABLE `piwigo_lounge` (
  `image_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `category_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_old_permalinks`
--

DROP TABLE IF EXISTS `piwigo_old_permalinks`;
CREATE TABLE `piwigo_old_permalinks` (
  `cat_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `permalink` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `date_deleted` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `last_hit` datetime DEFAULT NULL,
  `hit` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_plugins`
--

DROP TABLE IF EXISTS `piwigo_plugins`;
CREATE TABLE `piwigo_plugins` (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `state` enum('inactive','active') NOT NULL DEFAULT 'inactive',
  `version` varchar(64) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_rate`
--

DROP TABLE IF EXISTS `piwigo_rate`;
CREATE TABLE `piwigo_rate` (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `element_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `anonymous_id` varchar(45) NOT NULL DEFAULT '',
  `rate` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `date` date NOT NULL DEFAULT '1970-01-01'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_search`
--

DROP TABLE IF EXISTS `piwigo_search`;
CREATE TABLE `piwigo_search` (
  `id` int(10) UNSIGNED NOT NULL,
  `search_uuid` char(23) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` mediumint(8) UNSIGNED DEFAULT NULL,
  `forked_from` int(10) UNSIGNED DEFAULT NULL,
  `rules` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_sessions`
--

DROP TABLE IF EXISTS `piwigo_sessions`;
CREATE TABLE `piwigo_sessions` (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `data` mediumtext NOT NULL,
  `expiration` datetime NOT NULL DEFAULT '1970-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

--
-- Dumping data for table `piwigo_sessions`
--

INSERT INTO `piwigo_sessions` (`id`, `data`, `expiration`) VALUES
('AC134dclj896hki1emmekm8fc47s3a', 'pwg_uid|i:1;pwg_device|s:7:\"desktop\";pwg_mobile_theme|b:0;', '2024-12-30 13:55:56');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_sites`
--

DROP TABLE IF EXISTS `piwigo_sites`;
CREATE TABLE `piwigo_sites` (
  `id` tinyint(4) NOT NULL,
  `galleries_url` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

--
-- Dumping data for table `piwigo_sites`
--

INSERT INTO `piwigo_sites` (`id`, `galleries_url`) VALUES
(1, './galleries/');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_tags`
--

DROP TABLE IF EXISTS `piwigo_tags`;
CREATE TABLE `piwigo_tags` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `lastmodified` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_themes`
--

DROP TABLE IF EXISTS `piwigo_themes`;
CREATE TABLE `piwigo_themes` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '0',
  `name` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

--
-- Dumping data for table `piwigo_themes`
--

INSERT INTO `piwigo_themes` (`id`, `version`, `name`) VALUES
('smartpocket', '15.3.0', 'Smart Pocket'),
('modus', '15.3.0', 'modus');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_upgrade`
--

DROP TABLE IF EXISTS `piwigo_upgrade`;
CREATE TABLE `piwigo_upgrade` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `applied` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

--
-- Dumping data for table `piwigo_upgrade`
--

INSERT INTO `piwigo_upgrade` (`id`, `applied`, `description`) VALUES
('61', '2024-12-30 13:55:52', 'upgrade included in installation'),
('62', '2024-12-30 13:55:52', 'upgrade included in installation'),
('63', '2024-12-30 13:55:52', 'upgrade included in installation'),
('64', '2024-12-30 13:55:52', 'upgrade included in installation'),
('65', '2024-12-30 13:55:52', 'upgrade included in installation'),
('66', '2024-12-30 13:55:52', 'upgrade included in installation'),
('67', '2024-12-30 13:55:52', 'upgrade included in installation'),
('68', '2024-12-30 13:55:52', 'upgrade included in installation'),
('69', '2024-12-30 13:55:52', 'upgrade included in installation'),
('70', '2024-12-30 13:55:52', 'upgrade included in installation'),
('71', '2024-12-30 13:55:52', 'upgrade included in installation'),
('72', '2024-12-30 13:55:52', 'upgrade included in installation'),
('73', '2024-12-30 13:55:52', 'upgrade included in installation'),
('74', '2024-12-30 13:55:52', 'upgrade included in installation'),
('75', '2024-12-30 13:55:52', 'upgrade included in installation'),
('76', '2024-12-30 13:55:52', 'upgrade included in installation'),
('77', '2024-12-30 13:55:52', 'upgrade included in installation'),
('78', '2024-12-30 13:55:52', 'upgrade included in installation'),
('79', '2024-12-30 13:55:52', 'upgrade included in installation'),
('80', '2024-12-30 13:55:52', 'upgrade included in installation'),
('81', '2024-12-30 13:55:52', 'upgrade included in installation'),
('82', '2024-12-30 13:55:52', 'upgrade included in installation'),
('83', '2024-12-30 13:55:52', 'upgrade included in installation'),
('84', '2024-12-30 13:55:52', 'upgrade included in installation'),
('85', '2024-12-30 13:55:52', 'upgrade included in installation'),
('86', '2024-12-30 13:55:52', 'upgrade included in installation'),
('87', '2024-12-30 13:55:52', 'upgrade included in installation'),
('88', '2024-12-30 13:55:52', 'upgrade included in installation'),
('89', '2024-12-30 13:55:52', 'upgrade included in installation'),
('90', '2024-12-30 13:55:52', 'upgrade included in installation'),
('91', '2024-12-30 13:55:52', 'upgrade included in installation'),
('92', '2024-12-30 13:55:52', 'upgrade included in installation'),
('93', '2024-12-30 13:55:52', 'upgrade included in installation'),
('94', '2024-12-30 13:55:52', 'upgrade included in installation'),
('95', '2024-12-30 13:55:52', 'upgrade included in installation'),
('96', '2024-12-30 13:55:52', 'upgrade included in installation'),
('97', '2024-12-30 13:55:52', 'upgrade included in installation'),
('98', '2024-12-30 13:55:52', 'upgrade included in installation'),
('99', '2024-12-30 13:55:52', 'upgrade included in installation'),
('100', '2024-12-30 13:55:52', 'upgrade included in installation'),
('101', '2024-12-30 13:55:52', 'upgrade included in installation'),
('102', '2024-12-30 13:55:52', 'upgrade included in installation'),
('103', '2024-12-30 13:55:52', 'upgrade included in installation'),
('104', '2024-12-30 13:55:52', 'upgrade included in installation'),
('105', '2024-12-30 13:55:52', 'upgrade included in installation'),
('106', '2024-12-30 13:55:52', 'upgrade included in installation'),
('107', '2024-12-30 13:55:52', 'upgrade included in installation'),
('108', '2024-12-30 13:55:52', 'upgrade included in installation'),
('109', '2024-12-30 13:55:52', 'upgrade included in installation'),
('110', '2024-12-30 13:55:52', 'upgrade included in installation'),
('111', '2024-12-30 13:55:52', 'upgrade included in installation'),
('112', '2024-12-30 13:55:52', 'upgrade included in installation'),
('113', '2024-12-30 13:55:52', 'upgrade included in installation'),
('114', '2024-12-30 13:55:52', 'upgrade included in installation'),
('115', '2024-12-30 13:55:52', 'upgrade included in installation'),
('116', '2024-12-30 13:55:52', 'upgrade included in installation'),
('117', '2024-12-30 13:55:52', 'upgrade included in installation'),
('118', '2024-12-30 13:55:52', 'upgrade included in installation'),
('119', '2024-12-30 13:55:52', 'upgrade included in installation'),
('120', '2024-12-30 13:55:52', 'upgrade included in installation'),
('121', '2024-12-30 13:55:52', 'upgrade included in installation'),
('122', '2024-12-30 13:55:52', 'upgrade included in installation'),
('123', '2024-12-30 13:55:52', 'upgrade included in installation'),
('124', '2024-12-30 13:55:52', 'upgrade included in installation'),
('125', '2024-12-30 13:55:52', 'upgrade included in installation'),
('126', '2024-12-30 13:55:52', 'upgrade included in installation'),
('127', '2024-12-30 13:55:52', 'upgrade included in installation'),
('128', '2024-12-30 13:55:52', 'upgrade included in installation'),
('129', '2024-12-30 13:55:52', 'upgrade included in installation'),
('130', '2024-12-30 13:55:52', 'upgrade included in installation'),
('131', '2024-12-30 13:55:52', 'upgrade included in installation'),
('132', '2024-12-30 13:55:52', 'upgrade included in installation'),
('133', '2024-12-30 13:55:52', 'upgrade included in installation'),
('134', '2024-12-30 13:55:52', 'upgrade included in installation'),
('135', '2024-12-30 13:55:52', 'upgrade included in installation'),
('136', '2024-12-30 13:55:52', 'upgrade included in installation'),
('137', '2024-12-30 13:55:52', 'upgrade included in installation'),
('138', '2024-12-30 13:55:52', 'upgrade included in installation'),
('139', '2024-12-30 13:55:52', 'upgrade included in installation'),
('140', '2024-12-30 13:55:52', 'upgrade included in installation'),
('141', '2024-12-30 13:55:52', 'upgrade included in installation'),
('142', '2024-12-30 13:55:52', 'upgrade included in installation'),
('143', '2024-12-30 13:55:52', 'upgrade included in installation'),
('144', '2024-12-30 13:55:52', 'upgrade included in installation'),
('145', '2024-12-30 13:55:52', 'upgrade included in installation'),
('146', '2024-12-30 13:55:52', 'upgrade included in installation'),
('147', '2024-12-30 13:55:52', 'upgrade included in installation'),
('148', '2024-12-30 13:55:52', 'upgrade included in installation'),
('149', '2024-12-30 13:55:52', 'upgrade included in installation'),
('150', '2024-12-30 13:55:52', 'upgrade included in installation'),
('151', '2024-12-30 13:55:52', 'upgrade included in installation'),
('152', '2024-12-30 13:55:52', 'upgrade included in installation'),
('153', '2024-12-30 13:55:52', 'upgrade included in installation'),
('154', '2024-12-30 13:55:52', 'upgrade included in installation'),
('155', '2024-12-30 13:55:52', 'upgrade included in installation'),
('156', '2024-12-30 13:55:52', 'upgrade included in installation'),
('157', '2024-12-30 13:55:52', 'upgrade included in installation'),
('158', '2024-12-30 13:55:52', 'upgrade included in installation'),
('159', '2024-12-30 13:55:52', 'upgrade included in installation'),
('160', '2024-12-30 13:55:52', 'upgrade included in installation'),
('161', '2024-12-30 13:55:52', 'upgrade included in installation'),
('162', '2024-12-30 13:55:52', 'upgrade included in installation'),
('163', '2024-12-30 13:55:52', 'upgrade included in installation'),
('164', '2024-12-30 13:55:52', 'upgrade included in installation'),
('165', '2024-12-30 13:55:52', 'upgrade included in installation'),
('166', '2024-12-30 13:55:52', 'upgrade included in installation'),
('167', '2024-12-30 13:55:52', 'upgrade included in installation'),
('168', '2024-12-30 13:55:52', 'upgrade included in installation'),
('169', '2024-12-30 13:55:52', 'upgrade included in installation'),
('170', '2024-12-30 13:55:52', 'upgrade included in installation'),
('171', '2024-12-30 13:55:52', 'upgrade included in installation'),
('172', '2024-12-30 13:55:52', 'upgrade included in installation'),
('173', '2024-12-30 13:55:52', 'upgrade included in installation'),
('174', '2024-12-30 13:55:52', 'upgrade included in installation');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_users`
--

DROP TABLE IF EXISTS `piwigo_users`;
CREATE TABLE `piwigo_users` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `mail_address` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

--
-- Dumping data for table `piwigo_users`
--

INSERT INTO `piwigo_users` (`id`, `username`, `password`, `mail_address`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'noreply@google.com'),
(2, 'guest', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_access`
--

DROP TABLE IF EXISTS `piwigo_user_access`;
CREATE TABLE `piwigo_user_access` (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `cat_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_auth_keys`
--

DROP TABLE IF EXISTS `piwigo_user_auth_keys`;
CREATE TABLE `piwigo_user_auth_keys` (
  `auth_key_id` int(11) UNSIGNED NOT NULL,
  `auth_key` varchar(255) NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `created_on` datetime NOT NULL,
  `duration` int(11) UNSIGNED DEFAULT NULL,
  `expired_on` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_cache`
--

DROP TABLE IF EXISTS `piwigo_user_cache`;
CREATE TABLE `piwigo_user_cache` (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `need_update` enum('true','false') NOT NULL DEFAULT 'true',
  `cache_update_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `forbidden_categories` mediumtext DEFAULT NULL,
  `nb_total_images` mediumint(8) UNSIGNED DEFAULT NULL,
  `last_photo_date` datetime DEFAULT NULL,
  `nb_available_tags` int(5) DEFAULT NULL,
  `nb_available_comments` int(5) DEFAULT NULL,
  `image_access_type` enum('NOT IN','IN') NOT NULL DEFAULT 'NOT IN',
  `image_access_list` mediumtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

--
-- Dumping data for table `piwigo_user_cache`
--

INSERT INTO `piwigo_user_cache` (`user_id`, `need_update`, `cache_update_time`, `forbidden_categories`, `nb_total_images`, `last_photo_date`, `nb_available_tags`, `nb_available_comments`, `image_access_type`, `image_access_list`) VALUES
(1, 'false', 1735566952, '0', 0, NULL, NULL, NULL, 'NOT IN', '0');

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_cache_categories`
--

DROP TABLE IF EXISTS `piwigo_user_cache_categories`;
CREATE TABLE `piwigo_user_cache_categories` (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `cat_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `date_last` datetime DEFAULT NULL,
  `max_date_last` datetime DEFAULT NULL,
  `nb_images` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `count_images` mediumint(8) UNSIGNED DEFAULT 0,
  `nb_categories` mediumint(8) UNSIGNED DEFAULT 0,
  `count_categories` mediumint(8) UNSIGNED DEFAULT 0,
  `user_representative_picture_id` mediumint(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_feed`
--

DROP TABLE IF EXISTS `piwigo_user_feed`;
CREATE TABLE `piwigo_user_feed` (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `last_check` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_group`
--

DROP TABLE IF EXISTS `piwigo_user_group`;
CREATE TABLE `piwigo_user_group` (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_infos`
--

DROP TABLE IF EXISTS `piwigo_user_infos`;
CREATE TABLE `piwigo_user_infos` (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `nb_image_page` smallint(3) UNSIGNED NOT NULL DEFAULT 15,
  `status` enum('webmaster','admin','normal','generic','guest') NOT NULL DEFAULT 'guest',
  `language` varchar(50) NOT NULL DEFAULT 'en_UK',
  `expand` enum('true','false') NOT NULL DEFAULT 'false',
  `show_nb_comments` enum('true','false') NOT NULL DEFAULT 'false',
  `show_nb_hits` enum('true','false') NOT NULL DEFAULT 'false',
  `recent_period` tinyint(3) UNSIGNED NOT NULL DEFAULT 7,
  `theme` varchar(255) NOT NULL DEFAULT 'modus',
  `registration_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `enabled_high` enum('true','false') NOT NULL DEFAULT 'true',
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `activation_key` varchar(255) DEFAULT NULL,
  `activation_key_expire` datetime DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `last_visit_from_history` enum('true','false') NOT NULL DEFAULT 'false',
  `lastmodified` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `preferences` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

--
-- Dumping data for table `piwigo_user_infos`
--

INSERT INTO `piwigo_user_infos` (`user_id`, `nb_image_page`, `status`, `language`, `expand`, `show_nb_comments`, `show_nb_hits`, `recent_period`, `theme`, `registration_date`, `enabled_high`, `level`, `activation_key`, `activation_key_expire`, `last_visit`, `last_visit_from_history`, `lastmodified`, `preferences`) VALUES
(1, 15, 'webmaster', 'en_US', 'false', 'false', 'false', 7, 'modus', '2024-12-30 13:55:52', 'true', 8, NULL, NULL, NULL, 'false', '2024-12-30 13:55:52', 'a:1:{s:17:\"show_whats_new_15\";b:0;}'),
(2, 15, 'guest', 'en_US', 'false', 'false', 'false', 7, 'modus', '2024-12-30 13:55:52', 'true', 0, NULL, NULL, NULL, 'false', '2024-12-30 13:55:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `piwigo_user_mail_notification`
--

DROP TABLE IF EXISTS `piwigo_user_mail_notification`;
CREATE TABLE `piwigo_user_mail_notification` (
  `user_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `check_key` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `enabled` enum('true','false') NOT NULL DEFAULT 'false',
  `last_send` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `piwigo_activity`
--
ALTER TABLE `piwigo_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `piwigo_caddie`
--
ALTER TABLE `piwigo_caddie`
  ADD PRIMARY KEY (`user_id`,`element_id`);

--
-- Indexes for table `piwigo_categories`
--
ALTER TABLE `piwigo_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_i3` (`permalink`),
  ADD KEY `categories_i2` (`id_uppercat`),
  ADD KEY `lastmodified` (`lastmodified`);

--
-- Indexes for table `piwigo_comments`
--
ALTER TABLE `piwigo_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_i2` (`validation_date`),
  ADD KEY `comments_i1` (`image_id`);

--
-- Indexes for table `piwigo_config`
--
ALTER TABLE `piwigo_config`
  ADD PRIMARY KEY (`param`);

--
-- Indexes for table `piwigo_favorites`
--
ALTER TABLE `piwigo_favorites`
  ADD PRIMARY KEY (`user_id`,`image_id`);

--
-- Indexes for table `piwigo_groups`
--
ALTER TABLE `piwigo_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_ui1` (`name`),
  ADD KEY `lastmodified` (`lastmodified`);

--
-- Indexes for table `piwigo_group_access`
--
ALTER TABLE `piwigo_group_access`
  ADD PRIMARY KEY (`group_id`,`cat_id`);

--
-- Indexes for table `piwigo_history`
--
ALTER TABLE `piwigo_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piwigo_history_summary`
--
ALTER TABLE `piwigo_history_summary`
  ADD UNIQUE KEY `history_summary_ymdh` (`year`,`month`,`day`,`hour`);

--
-- Indexes for table `piwigo_images`
--
ALTER TABLE `piwigo_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_i2` (`date_available`),
  ADD KEY `images_i3` (`rating_score`),
  ADD KEY `images_i4` (`hit`),
  ADD KEY `images_i5` (`date_creation`),
  ADD KEY `images_i1` (`storage_category_id`),
  ADD KEY `images_i6` (`latitude`),
  ADD KEY `images_i7` (`path`),
  ADD KEY `lastmodified` (`lastmodified`);

--
-- Indexes for table `piwigo_image_category`
--
ALTER TABLE `piwigo_image_category`
  ADD PRIMARY KEY (`image_id`,`category_id`),
  ADD KEY `image_category_i1` (`category_id`);

--
-- Indexes for table `piwigo_image_format`
--
ALTER TABLE `piwigo_image_format`
  ADD PRIMARY KEY (`format_id`);

--
-- Indexes for table `piwigo_image_tag`
--
ALTER TABLE `piwigo_image_tag`
  ADD PRIMARY KEY (`image_id`,`tag_id`),
  ADD KEY `image_tag_i1` (`tag_id`);

--
-- Indexes for table `piwigo_languages`
--
ALTER TABLE `piwigo_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piwigo_lounge`
--
ALTER TABLE `piwigo_lounge`
  ADD PRIMARY KEY (`image_id`,`category_id`);

--
-- Indexes for table `piwigo_old_permalinks`
--
ALTER TABLE `piwigo_old_permalinks`
  ADD PRIMARY KEY (`permalink`);

--
-- Indexes for table `piwigo_plugins`
--
ALTER TABLE `piwigo_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piwigo_rate`
--
ALTER TABLE `piwigo_rate`
  ADD PRIMARY KEY (`element_id`,`user_id`,`anonymous_id`);

--
-- Indexes for table `piwigo_search`
--
ALTER TABLE `piwigo_search`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piwigo_sessions`
--
ALTER TABLE `piwigo_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piwigo_sites`
--
ALTER TABLE `piwigo_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sites_ui1` (`galleries_url`);

--
-- Indexes for table `piwigo_tags`
--
ALTER TABLE `piwigo_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_i1` (`url_name`),
  ADD KEY `lastmodified` (`lastmodified`);

--
-- Indexes for table `piwigo_themes`
--
ALTER TABLE `piwigo_themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piwigo_upgrade`
--
ALTER TABLE `piwigo_upgrade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piwigo_users`
--
ALTER TABLE `piwigo_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_ui1` (`username`);

--
-- Indexes for table `piwigo_user_access`
--
ALTER TABLE `piwigo_user_access`
  ADD PRIMARY KEY (`user_id`,`cat_id`);

--
-- Indexes for table `piwigo_user_auth_keys`
--
ALTER TABLE `piwigo_user_auth_keys`
  ADD PRIMARY KEY (`auth_key_id`);

--
-- Indexes for table `piwigo_user_cache`
--
ALTER TABLE `piwigo_user_cache`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `piwigo_user_cache_categories`
--
ALTER TABLE `piwigo_user_cache_categories`
  ADD PRIMARY KEY (`user_id`,`cat_id`);

--
-- Indexes for table `piwigo_user_feed`
--
ALTER TABLE `piwigo_user_feed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piwigo_user_group`
--
ALTER TABLE `piwigo_user_group`
  ADD PRIMARY KEY (`group_id`,`user_id`);

--
-- Indexes for table `piwigo_user_infos`
--
ALTER TABLE `piwigo_user_infos`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `lastmodified` (`lastmodified`);

--
-- Indexes for table `piwigo_user_mail_notification`
--
ALTER TABLE `piwigo_user_mail_notification`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_mail_notification_ui1` (`check_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `piwigo_activity`
--
ALTER TABLE `piwigo_activity`
  MODIFY `activity_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `piwigo_categories`
--
ALTER TABLE `piwigo_categories`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `piwigo_comments`
--
ALTER TABLE `piwigo_comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `piwigo_groups`
--
ALTER TABLE `piwigo_groups`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `piwigo_history`
--
ALTER TABLE `piwigo_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `piwigo_images`
--
ALTER TABLE `piwigo_images`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `piwigo_image_format`
--
ALTER TABLE `piwigo_image_format`
  MODIFY `format_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `piwigo_search`
--
ALTER TABLE `piwigo_search`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `piwigo_sites`
--
ALTER TABLE `piwigo_sites`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `piwigo_tags`
--
ALTER TABLE `piwigo_tags`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `piwigo_users`
--
ALTER TABLE `piwigo_users`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `piwigo_user_auth_keys`
--
ALTER TABLE `piwigo_user_auth_keys`
  MODIFY `auth_key_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
