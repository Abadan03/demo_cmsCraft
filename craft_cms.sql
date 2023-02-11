-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2023 at 08:14 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `craft_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, '2023-02-10 12:04:35', '2023-02-10 12:04:35', 'aaaf478d-20c7-4e0d-9cbe-7e66aef080fc');

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2023-02-10 12:04:35', '2023-02-10 12:04:35', NULL, NULL, '90ab7299-26a9-458b-b63c-095ed893ce7b');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2023-02-10 12:04:35', '2023-02-10 12:04:35', '913b25d9-ffd7-4746-ae56-fa2e97f8ae49');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2023-02-10 12:04:35', '2023-02-10 12:04:35', NULL, '519a8808-cb5b-424d-986b-6707552ad694');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.7.65.2', '3.7.33', 0, 'dfxknfyosrgq', '3@ckrnxmcevf', '2023-02-10 12:04:35', '2023-02-11 07:02:26', '0f9f6558-40cd-4933-afc4-70e0e3f73571');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'b7c8b07f-52e0-4bea-99d9-dba34091d947'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'e472c69a-2201-4626-8cad-32924c145874'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '6965d9a4-9f53-42c1-baeb-695354ef11d0'),
(4, 'craft', 'm150403_184533_field_version', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'ae7f0015-63a3-4762-b0ee-fad4c987f551'),
(5, 'craft', 'm150403_184729_type_columns', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '09b3bf67-c952-4c04-ad09-c7e220dcb71c'),
(6, 'craft', 'm150403_185142_volumes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'cd623f76-6d62-41ec-9ae1-d158df81449b'),
(7, 'craft', 'm150428_231346_userpreferences', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'b21bfffb-7e8d-4a5d-8451-21461bda3b93'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '121fafb5-7dda-4526-9ace-c27a45111150'),
(9, 'craft', 'm150617_213829_update_email_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '4691782a-cb1a-4bf2-a1d9-7c0061c2bd32'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '59baa6dc-301d-4cac-bb1e-fe47e7d50643'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'a2029150-de8f-4883-88cb-d109c2c64db3'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '6f949e1d-aa95-47dc-9537-6c3b70d807fa'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '34cba8cd-7c16-411e-b475-f062b6b0f4ec'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '58657478-61fb-425e-9a70-b3302da29000'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '1acfe1ac-cd67-4439-ae2b-b6923ce0d707'),
(16, 'craft', 'm151209_000000_move_logo', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'dee03f42-8100-4ea3-b8da-c1d97a245dbc'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '67e0a509-1c6d-4d2d-a976-510679524b06'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '84996b71-401c-4ac0-9a4a-ed14713a8588'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '73f264e1-a60e-402f-a1c8-e139c49cbeb9'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'a7dc7c01-759d-49ed-9a91-6930e59f916a'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'd57e41e8-32af-4401-b57e-c0caee609a6d'),
(22, 'craft', 'm160727_194637_column_cleanup', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '019dd47c-fd27-4046-9063-b2d418bf9145'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'a0269092-1410-4f45-a4be-9b3cc91d5d23'),
(24, 'craft', 'm160807_144858_sites', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '9d846b1c-5bb9-498c-80ca-272f79ea7e2e'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2d4dda0a-859d-49a6-90a2-bdae34d16d7d'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2a49352d-d804-4ca4-9457-e46b0f6e7b07'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '269e2d42-d82d-4d1d-b790-1a4620a8b797'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '171d4b0c-892b-4840-9ca3-6a5e37721e25'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '9bbf06c1-9ee5-474a-ba07-e740b902937e'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'dfa70f20-087c-4632-9635-6ead34ccdb1b'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'f8adaad1-0363-4027-8a87-04a4c6782f23'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'bf692022-26c6-4e84-ad13-f5c5f2966d64'),
(33, 'craft', 'm161007_130653_update_email_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'dbc3c9ae-7881-4f2b-ab5c-4e0588998935'),
(34, 'craft', 'm161013_175052_newParentId', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '99f2f20a-61a0-4906-9923-cc165ba2a63b'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '6c366049-d163-4792-ad5c-9a8350784839'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '1fe7a953-ab1d-4083-8013-21495afd0aab'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '4a78bb35-5cce-48e4-b0fe-93761cd4c190'),
(38, 'craft', 'm161029_124145_email_message_languages', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '68deedb3-59dd-45a5-85d5-913c709d7a03'),
(39, 'craft', 'm161108_000000_new_version_format', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'd6a2f43a-f395-4527-917b-1272f0d9414b'),
(40, 'craft', 'm161109_000000_index_shuffle', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'dc48de68-c5a4-4872-9f04-adf6e7e5f2ef'),
(41, 'craft', 'm161122_185500_no_craft_app', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'c9a326c3-963d-4df8-ae1b-cfee7d326695'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'af07a123-6c72-4caf-bb7f-fe9e32ee99a7'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '3109be5a-762c-40f0-a0a8-6059604f09a1'),
(44, 'craft', 'm170114_161144_udates_permission', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '9f53024c-1fad-4976-bf38-d39ffdc6ad52'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2c07d3f9-071a-4e18-ae9a-a30204b35cd1'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '83dc3199-8bef-43d2-b13a-bcd627d4d30a'),
(47, 'craft', 'm170206_142126_system_name', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '0f3147e7-a39c-4924-88b4-114e35a17d12'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'cb21ef4d-9374-4abf-9e96-53e41a12fd03'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '9450c7bd-ff4e-487b-8b3f-1a23091857b9'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '21b48729-7e32-4faf-863c-7cf61b242206'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'f152857f-9a0b-415e-8b85-6481fa200032'),
(52, 'craft', 'm170228_171113_system_messages', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'c084d9d2-1f13-4bae-b682-9f4c248b9e66'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '4be072bd-135c-49c2-8c52-aa9b40940126'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '63e8f4ca-baef-430e-8c17-f4b092db513e'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'd280059b-2eca-4595-ac11-f9b43889edc5'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '51378de8-a072-445a-97b7-5ed23135cfd2'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '255ec7bb-07ea-4a40-9ff2-e0a1035c2f89'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '835c30fa-a18e-4ef8-a9cc-4f547eb2a9b3'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '7279a34c-d83f-4b8f-959e-ed2ca8ec8dc5'),
(60, 'craft', 'm170704_134916_sites_tables', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'a8f891a4-6f08-4348-bb3c-32d5e63b0154'),
(61, 'craft', 'm170706_183216_rename_sequences', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'eaa89cc8-ea09-4dd3-99dd-857fda776083'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'c975a4b3-deb5-4b3f-adaf-207e5cff5127'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '953bbb1e-32d8-43ca-9476-efca4a453dcd'),
(64, 'craft', 'm170810_201318_create_queue_table', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '28028dfe-1b7a-4931-bc41-d06b2af13c31'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '60780f47-7c35-44b3-9e92-eb3006768de2'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '79c85fea-fe4a-4565-90f2-5ef730a3a570'),
(67, 'craft', 'm171011_214115_site_groups', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '63224eac-e45f-426b-a34f-73f1b44b38d0'),
(68, 'craft', 'm171012_151440_primary_site', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'be5bcb75-5ba2-4ff1-b0f8-c54a1f6c0eb4'),
(69, 'craft', 'm171013_142500_transform_interlace', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '73907e59-073a-4865-bbe7-4b5aaedbe2a8'),
(70, 'craft', 'm171016_092553_drop_position_select', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '0a0b2cfc-2ad1-4d1d-931d-d033ab4bb6a6'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'd89084d0-29fd-45c9-8d71-9dbfbad95e09'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '4772da1c-4a8e-41d6-91dc-287aac36d392'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '4b123d80-b8de-4fd9-ae05-01eacb645e90'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'abda0c1c-e5ee-4969-9038-508dc8506de3'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'eeb1bd58-d241-4a02-80d0-8290abac20cc'),
(76, 'craft', 'm171202_004225_update_email_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '5f1ec9e0-9957-468a-9924-c67e434da08b'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '25a53c3a-a3b3-4b20-a97f-4884a48b5e4e'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2e359d4e-4af9-4271-8e85-185af8b13057'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'eed595b8-3141-4de7-a773-a101b1ad6058'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'ece002fe-d667-4f45-bb4f-a070f3f46162'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '5e435e13-68cb-4f75-b914-8e0136c527ad'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '7bf99cce-fc64-44ad-ae2a-cfdc0d563175'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '59362880-a69c-4d6d-bae2-07cb34496dc0'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '7b867b93-0aa5-48b6-84cb-bc3703a37665'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '46631ef5-3430-4f72-af2f-1f4f9e40c900'),
(86, 'craft', 'm180217_172123_tiny_ints', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'f0472028-5985-42e7-9ca0-0ff79de2869d'),
(87, 'craft', 'm180321_233505_small_ints', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '1b5ce81b-f9f7-43f4-ab78-6cfd51c11451'),
(88, 'craft', 'm180404_182320_edition_changes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '57c9b3e9-e5ea-4a5b-b478-e87b300755a8'),
(89, 'craft', 'm180411_102218_fix_db_routes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'ac9bad4e-7933-4798-9425-d0a34939cf71'),
(90, 'craft', 'm180416_205628_resourcepaths_table', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '8a650e67-01b2-41be-8faf-5303bfb9ff11'),
(91, 'craft', 'm180418_205713_widget_cleanup', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'e2c41438-d303-436a-8950-c1809fb5abf9'),
(92, 'craft', 'm180425_203349_searchable_fields', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'ba9c158c-7e4b-4ea0-8a91-8d128655a28a'),
(93, 'craft', 'm180516_153000_uids_in_field_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '4a1c5044-a655-4cb6-b022-0cb8dbccb971'),
(94, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '13d4af6e-d0ab-4fe4-afff-573defe8d6ef'),
(95, 'craft', 'm180518_173000_permissions_to_uid', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '0a60a81c-0e9c-4f65-bdd9-0e16f7cae6cf'),
(96, 'craft', 'm180520_173000_matrix_context_to_uids', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '395c34ed-24a9-477c-ad71-7c389f9b6fb3'),
(97, 'craft', 'm180521_172900_project_config_table', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'e67da15e-d2e1-4166-9b2e-70831561a87c'),
(98, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '334fc95b-c053-4be8-8931-745271afee5e'),
(99, 'craft', 'm180731_162030_soft_delete_sites', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '7366d0d3-40a3-447c-8a05-f34bc4c808f5'),
(100, 'craft', 'm180810_214427_soft_delete_field_layouts', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '06a4fb64-8407-4752-9d23-a13e4aa8f469'),
(101, 'craft', 'm180810_214439_soft_delete_elements', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '9802a07b-3dcc-4e71-af51-0233324520fb'),
(102, 'craft', 'm180824_193422_case_sensitivity_fixes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '638f9ef0-eb31-441d-b802-64a1c5f60c0b'),
(103, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '097e64c3-5138-441f-b572-c151277057a1'),
(104, 'craft', 'm180904_112109_permission_changes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2e7fbac7-e117-4125-b11e-cbe95a6e8126'),
(105, 'craft', 'm180910_142030_soft_delete_sitegroups', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'd42ea365-6c00-4357-be1f-4420f98faf00'),
(106, 'craft', 'm181011_160000_soft_delete_asset_support', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '8853ad28-bf58-49b6-8868-0619af459531'),
(107, 'craft', 'm181016_183648_set_default_user_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '12fa97f6-df5b-4df2-9067-9328b3513a45'),
(108, 'craft', 'm181017_225222_system_config_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '45bac0f5-46a2-4cc6-a57c-0733447368b8'),
(109, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'a62bbbf8-ba3d-4c04-9af1-87f3812e8a8f'),
(110, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'b6aef74d-cc24-45b4-9b0c-07c487bb11a7'),
(111, 'craft', 'm181112_203955_sequences_table', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'be00e57d-b949-46a2-b6b8-5c3fa0424858'),
(112, 'craft', 'm181121_001712_cleanup_field_configs', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '644b683a-c3af-4f29-9ad3-e836e9515cfa'),
(113, 'craft', 'm181128_193942_fix_project_config', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '0ddacc99-0415-4cbc-911e-18d08ec093de'),
(114, 'craft', 'm181130_143040_fix_schema_version', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '3f7fca83-ab74-4534-bd87-416a7ca261ce'),
(115, 'craft', 'm181211_143040_fix_entry_type_uids', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'f9507e33-f688-4b4e-9143-cbf741bd5025'),
(116, 'craft', 'm181217_153000_fix_structure_uids', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '0f9001f9-aa95-4bf4-a3d2-b6cc2fa1f086'),
(117, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'df3c93f7-e98b-47fa-a0e9-dd39ab7755a8'),
(118, 'craft', 'm190108_110000_cleanup_project_config', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '31fb9766-756b-4e9c-8169-3d177ac09390'),
(119, 'craft', 'm190108_113000_asset_field_setting_change', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '4069ad4f-e650-437c-9e75-ec03fe1ef835'),
(120, 'craft', 'm190109_172845_fix_colspan', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '62d05cff-a49d-4687-9fad-507af3dde199'),
(121, 'craft', 'm190110_150000_prune_nonexisting_sites', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'da868bcf-7986-4455-8760-906f2a3d7e21'),
(122, 'craft', 'm190110_214819_soft_delete_volumes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'c1257b0b-27e8-4148-b590-f5d1ae6df8ce'),
(123, 'craft', 'm190112_124737_fix_user_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'b531c417-855f-43b3-bf23-00c97e65e725'),
(124, 'craft', 'm190112_131225_fix_field_layouts', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'c57ac833-662a-4151-abb9-c92c621e6cc3'),
(125, 'craft', 'm190112_201010_more_soft_deletes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '720a857b-a498-4bff-a788-2c7aa0a0b2ce'),
(126, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '3f810e80-fead-4b43-9251-763173987632'),
(127, 'craft', 'm190121_120000_rich_text_config_setting', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '9de25598-51db-42ac-a9a6-4422ae7f0686'),
(128, 'craft', 'm190125_191628_fix_email_transport_password', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '4f0e012c-a8c9-42a1-ae7a-ada906822e91'),
(129, 'craft', 'm190128_181422_cleanup_volume_folders', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '58b65768-c1ec-4414-94ab-6d38873f69ff'),
(130, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'fa266210-9f75-474b-8072-1470e934a1bf'),
(131, 'craft', 'm190218_143000_element_index_settings_uid', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '7c591b21-602a-4643-8d0b-5498a251ec28'),
(132, 'craft', 'm190312_152740_element_revisions', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '77dc3cb6-8a13-4012-80fb-a33e2ce3624a'),
(133, 'craft', 'm190327_235137_propagation_method', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'e1c4145c-9908-4652-9d20-f9828f3eb6e5'),
(134, 'craft', 'm190401_223843_drop_old_indexes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2d47348e-8893-47ee-af5c-31ae2e53b135'),
(135, 'craft', 'm190416_014525_drop_unique_global_indexes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '8e74796f-5fe6-4254-a755-82e97c8e3280'),
(136, 'craft', 'm190417_085010_add_image_editor_permissions', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '69124aff-ac47-4400-9d6e-071b702f49b1'),
(137, 'craft', 'm190502_122019_store_default_user_group_uid', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '700b8b9e-cafb-41cf-b12d-acb7cf487811'),
(138, 'craft', 'm190504_150349_preview_targets', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'ad401300-1a75-4073-b953-88ea9b096c18'),
(139, 'craft', 'm190516_184711_job_progress_label', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'f66561de-b584-40a8-841b-9d511ba7b3f8'),
(140, 'craft', 'm190523_190303_optional_revision_creators', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '5770cf68-bd07-4608-9c15-913a1e6750e0'),
(141, 'craft', 'm190529_204501_fix_duplicate_uids', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '8bc1f04a-0cb2-4f47-b1f7-b757fc836ad5'),
(142, 'craft', 'm190605_223807_unsaved_drafts', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'aef46bba-9045-4857-b5cb-544524ae5b55'),
(143, 'craft', 'm190607_230042_entry_revision_error_tables', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '8966c329-6c5c-4667-94cf-ca2f924d95b8'),
(144, 'craft', 'm190608_033429_drop_elements_uid_idx', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'ab3c0bd3-0459-4de2-a1be-4e9af87b62f0'),
(145, 'craft', 'm190617_164400_add_gqlschemas_table', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '21995dc5-4cb5-4169-b416-1ea00e876959'),
(146, 'craft', 'm190624_234204_matrix_propagation_method', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '6c7ef39d-1418-4a39-8f28-ec9766f74341'),
(147, 'craft', 'm190711_153020_drop_snapshots', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'a83fd458-2733-4661-ab40-d052577d0073'),
(148, 'craft', 'm190712_195914_no_draft_revisions', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'd38ea7dc-decb-4664-8c24-4f7e1cb14973'),
(149, 'craft', 'm190723_140314_fix_preview_targets_column', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'd445b704-fb61-4c21-901b-47ce342be8d1'),
(150, 'craft', 'm190820_003519_flush_compiled_templates', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'd8506f18-2245-4325-b8dc-5f9e3945f490'),
(151, 'craft', 'm190823_020339_optional_draft_creators', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '9f49772a-afc1-4449-9398-89210216753a'),
(152, 'craft', 'm190913_152146_update_preview_targets', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'ca433fae-945e-40e0-bfd7-cc2118025222'),
(153, 'craft', 'm191107_122000_add_gql_project_config_support', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'a027f587-8717-4494-8e58-a59f57a2ffd2'),
(154, 'craft', 'm191204_085100_pack_savable_component_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '434f4d84-4bdf-41ea-9128-66ca8d99d8a8'),
(155, 'craft', 'm191206_001148_change_tracking', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'b8c58de2-75b0-4dfe-bf34-b1d63ebda17c'),
(156, 'craft', 'm191216_191635_asset_upload_tracking', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'a79ccccd-cce3-463f-a545-86276bab7a93'),
(157, 'craft', 'm191222_002848_peer_asset_permissions', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '7cd08886-1096-4cb3-9fef-25ca8ef1e8ea'),
(158, 'craft', 'm200127_172522_queue_channels', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '161d53e5-e55f-4f1e-9e87-1116f5b1151b'),
(159, 'craft', 'm200211_175048_truncate_element_query_cache', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '35ff5b41-0924-43c5-8484-97e2ab67281e'),
(160, 'craft', 'm200213_172522_new_elements_index', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'c0081232-2098-4e90-b234-655c079297ff'),
(161, 'craft', 'm200228_195211_long_deprecation_messages', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '6c04e88f-a6d6-4c60-a605-22f0b90b49a8'),
(162, 'craft', 'm200306_054652_disabled_sites', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '5f3ba285-6799-46ad-9130-37d326713010'),
(163, 'craft', 'm200522_191453_clear_template_caches', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '331d4573-cfc5-49f3-a893-35e7e49a424e'),
(164, 'craft', 'm200606_231117_migration_tracks', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'f68a14c9-cf15-43c3-b7f9-a0064a4a589a'),
(165, 'craft', 'm200619_215137_title_translation_method', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '6e31da47-75bd-4d83-9f44-9ec5f50cf11f'),
(166, 'craft', 'm200620_005028_user_group_descriptions', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '3e52fc57-f18d-454a-9788-6b11fb8f2397'),
(167, 'craft', 'm200620_230205_field_layout_changes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '3d335cab-d6be-45b7-ae83-b8ce76cf4066'),
(168, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'b70ea0a5-b5ce-43fe-bda1-853c57fcfde5'),
(169, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'e52cedd1-96b9-4ab9-b83e-5d385dc0c61d'),
(170, 'craft', 'm200630_183000_drop_configmap', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'fa559542-2f99-4088-bc23-97c8df73a038'),
(171, 'craft', 'm200715_113400_transform_index_error_flag', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '9519772b-5633-41b3-9b6e-8d0bb2fb571f'),
(172, 'craft', 'm200716_110900_replace_file_asset_permissions', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '77e19e42-29c4-4b07-9c4b-ab27c07b8e99'),
(173, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '29426ee2-5913-4f77-bdd7-c5cdaa07f842'),
(174, 'craft', 'm200720_175543_drop_unique_constraints', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'd780d574-c43c-4c07-9f08-40d77b8de295'),
(175, 'craft', 'm200825_051217_project_config_version', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'e0edb164-3e87-4663-9142-b73a46de8912'),
(176, 'craft', 'm201116_190500_asset_title_translation_method', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '7b7b47d7-e7ab-4808-88da-459bc49d6c43'),
(177, 'craft', 'm201124_003555_plugin_trials', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'ae2b059c-9cc0-4fdc-84b9-cacef28c278d'),
(178, 'craft', 'm210209_135503_soft_delete_field_groups', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'b83416b5-6b47-4a0c-8f24-959c3990652d'),
(179, 'craft', 'm210212_223539_delete_invalid_drafts', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '26d5c1cf-db69-4ad8-95f1-b7d7dc5fc314'),
(180, 'craft', 'm210214_202731_track_saved_drafts', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'c697c059-34cc-477a-9495-df766a9b9cb7'),
(181, 'craft', 'm210223_150900_add_new_element_gql_schema_components', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'e79867c3-c643-43ca-b3d3-270b2bd1393d'),
(182, 'craft', 'm210302_212318_canonical_elements', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '71df16e1-6334-4d9d-9a6b-9db0e709cb03'),
(183, 'craft', 'm210326_132000_invalidate_projectconfig_cache', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '5deff08d-a09f-4237-acd1-08bc8f3a028e'),
(184, 'craft', 'm210329_214847_field_column_suffixes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '59f8f0d1-d667-4905-81ef-0e82731017d9'),
(185, 'craft', 'm210331_220322_null_author', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '88df53bd-b8c0-4468-a176-8a9cabbda1e3'),
(186, 'craft', 'm210405_231315_provisional_drafts', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '0b014f7c-b76c-4432-95a8-448010a93685'),
(187, 'craft', 'm210602_111300_project_config_names_in_config', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '870d0a68-5d13-4dad-8f74-c21a5a7a0402'),
(188, 'craft', 'm210611_233510_default_placement_settings', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '48e5c7f8-6a41-48af-bad8-3acf1d7f6dd4'),
(189, 'craft', 'm210613_145522_sortable_global_sets', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '31d2175b-d239-470a-b7bc-ea58dc1a527c'),
(190, 'craft', 'm210613_184103_announcements', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'e6630cca-90e2-489b-903b-4ba67f1ce8af'),
(191, 'craft', 'm210829_000000_element_index_tweak', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '9020d4dd-0e9d-4c5b-806b-19f5cb605a09'),
(192, 'craft', 'm220209_095604_add_indexes', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '5b897112-3970-4f78-a160-176f15e13558'),
(193, 'craft', 'm220214_000000_truncate_sessions', '2023-02-10 12:04:36', '2023-02-10 12:04:36', '2023-02-10 12:04:36', 'b2da7ea4-bd9b-4cbf-b071-7aaefcea3e28');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1676098946'),
('email.fromEmail', '\"admin@gmail.com\"'),
('email.fromName', '\"test\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('fieldGroups.519a8808-cb5b-424d-986b-6707552ad694.name', '\"Common\"'),
('meta.__names__.4688c068-40fa-49a0-8eae-bbc3044b2d6b', '\"test\"'),
('meta.__names__.519a8808-cb5b-424d-986b-6707552ad694', '\"Common\"'),
('meta.__names__.f16b3a10-00d9-4808-830a-27b922ebc153', '\"http://localhost/demo3/web/\"'),
('siteGroups.4688c068-40fa-49a0-8eae-bbc3044b2d6b.name', '\"test\"'),
('sites.f16b3a10-00d9-4808-830a-27b922ebc153.baseUrl', 'null'),
('sites.f16b3a10-00d9-4808-830a-27b922ebc153.enabled', 'true'),
('sites.f16b3a10-00d9-4808-830a-27b922ebc153.handle', '\"default\"'),
('sites.f16b3a10-00d9-4808-830a-27b922ebc153.hasUrls', 'true'),
('sites.f16b3a10-00d9-4808-830a-27b922ebc153.language', '\"en-US\"'),
('sites.f16b3a10-00d9-4808-830a-27b922ebc153.name', '\"http://localhost/demo3/web/\"'),
('sites.f16b3a10-00d9-4808-830a-27b922ebc153.primary', 'true'),
('sites.f16b3a10-00d9-4808-830a-27b922ebc153.siteGroup', '\"4688c068-40fa-49a0-8eae-bbc3044b2d6b\"'),
('sites.f16b3a10-00d9-4808-830a-27b922ebc153.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"test\"'),
('system.schemaVersion', '\"3.7.33\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('12151129', '@bower/jquery/dist'),
('17f50ec1', '@craft/web/assets/elementresizedetector/dist'),
('18f2813f', '@craft/web/assets/jqueryui/dist'),
('24e095d6', '@craft/web/assets/routes/dist'),
('376a1174', '@craft/web/assets/dashboard/dist'),
('412cb856', '@craft/web/assets/velocity/dist'),
('44bbbae1', '@craft/web/assets/jquerypayment/dist'),
('44e86583', '@craft/web/assets/jquerytouchevents/dist'),
('4e2937bf', '@craft/web/assets/feed/dist'),
('550c600d', '@craft/web/assets/vue/dist'),
('6895794', '@craft/web/assets/fileupload/dist'),
('713c0afb', '@craft/web/assets/craftsupport/dist'),
('7358dd3f', '@craft/web/assets/xregexp/dist'),
('78e0603f', '@craft/web/assets/picturefill/dist'),
('793abd36', '@craft/web/assets/login/dist'),
('86368b97', '@craft/web/assets/fabric/dist'),
('88c48f8a', '@craft/web/assets/sites/dist'),
('ae84bc80', '@craft/web/assets/garnish/dist'),
('c0a6872b', '@craft/web/assets/selectize/dist'),
('c1927eb5', '@craft/web/assets/installer/dist'),
('c595151e', '@craft/web/assets/pluginstore/dist'),
('ccee2563', '@craft/web/assets/cp/dist'),
('d690fcf2', '@craft/web/assets/updateswidget/dist'),
('d6db032a', '@craft/web/assets/d3/dist'),
('ddba0a9d', '@craft/web/assets/iframeresizer/dist'),
('dfbfa8a9', '@craft/web/assets/generalsettings/dist'),
('e82abe9c', '@craft/web/assets/recententries/dist'),
('f0df2bc5', '@craft/web/assets/axios/dist');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' admin gmail com '),
(1, 'slug', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'NrTorB2noSpgCasaVHbo1lUqoIWargq-hpuUFpfmxN_D7MhJgbEgZQf4uj7tD6zGLlXob9lgE4nh9hM3jF_EagoCNDxrLTExAIyw', '2023-02-10 12:09:46', '2023-02-10 13:27:46', 'c8bbb006-f4c9-44d7-ba3b-7d7b8f5bb49d'),
(2, 1, '_9HJOaUbKxZZ8PwqG_dz35ogIoMKEPc8qcUxyYxT4uFuOLBUtx5mDQzM7mHMS9BoW5UcA9C06g9rpR85-ObMaik0k1JPEtJ6PNPT', '2023-02-11 06:44:56', '2023-02-11 07:13:38', '846bd348-dc76-4aa8-9620-c90f4988895b');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'test', '2023-02-10 12:04:35', '2023-02-10 12:04:35', NULL, '4688c068-40fa-49a0-8eae-bbc3044b2d6b');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'http://localhost/demo3/web/', 'default', 'en-US', 1, NULL, 1, '2023-02-10 12:04:35', '2023-02-11 07:02:26', NULL, 'f16b3a10-00d9-4808-830a-27b922ebc153');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'admin@gmail.com', '$2y$13$MewR6znIKiWUy5OyEO1Yg.pHQABbiHitkqFUCq.xDvPNBx5OSP/tS', 1, 0, 0, 0, '2023-02-11 06:44:56', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2023-02-10 12:04:35', '2023-02-10 12:04:35', '2023-02-11 06:44:56', '3a0c94f4-b207-4470-a3f1-77a943d9e3f0');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2023-02-10 12:09:47', '2023-02-10 12:09:47', 'ae3c544e-8504-4ebb-9f77-f7190c4b65eb'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2023-02-10 12:09:47', '2023-02-10 12:09:47', 'b9200e50-5023-45c3-bea8-b540f66424a9'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2023-02-10 12:09:47', '2023-02-10 12:09:47', 'b667d2b0-44f6-4282-96a5-9022712c5de6'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2023-02-10 12:09:47', '2023-02-10 12:09:47', '5a637fdf-0274-4c94-9b01-971f3d98fb6e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nbwvxbksiicnuyhzywoiubnkqgxwjadyopxy` (`userId`,`unread`,`dateRead`,`dateCreated`),
  ADD KEY `idx_lwsvvelfzbbapxhpsjejsnnaybtvgrddflez` (`dateRead`),
  ADD KEY `fk_ncjjxlbeotudtojfsffuacwqaalxudddiqul` (`pluginId`);

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vggfzmbklkmujppnjvtguazhglktkylvogcg` (`sessionId`,`volumeId`),
  ADD KEY `idx_iowrgmpuwigczhmeosqobeaqdnpfmxaluavi` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mfucxxibtccoyiwfdqikdnppxrtvwkumfoze` (`filename`,`folderId`),
  ADD KEY `idx_gppwtmjziimhgtetyqlahobdazgemlomhrew` (`folderId`),
  ADD KEY `idx_dakupsnllardgmerdvpegqstbbpcsrwlcvrk` (`volumeId`),
  ADD KEY `fk_kdcihfesjkyepsagfpklwbfxxoudkycmsxbd` (`uploaderId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lmyqmoobjtatlkbmxmpbljndnrcsydgtvcxe` (`volumeId`,`assetId`,`location`),
  ADD KEY `idx_brofdmpwtpiiiszwalfedizolvsxnydnojad` (`assetId`,`format`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ywpoqoaeeebbrqzkxijgtgruktxurebrdgyj` (`name`),
  ADD KEY `idx_prdegsiuwkkmrikpasmtuqewfrtxuycieizk` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qbdlqgiostdaklaojetvwnckrdrwkgvmxgis` (`groupId`),
  ADD KEY `fk_iomsjxrtprfxzhlfppyereheocvccojdbzsb` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jondbturxrehewxgpnzpdfymxgxwudntipzb` (`name`),
  ADD KEY `idx_fpleurigigcebjvmesvpqyoshccnunsemnft` (`handle`),
  ADD KEY `idx_aajrsbamkmespwbwgarnavsddjdimvpyvzgw` (`structureId`),
  ADD KEY `idx_ntrtnocqbiunbymwyjmspoxuirjlfjabbrek` (`fieldLayoutId`),
  ADD KEY `idx_hfbtcmaaugdmpychubwkeggwbibdvabfbpkv` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_gnrhtavddmfuwttpgmthjyslsbutjliaopyt` (`groupId`,`siteId`),
  ADD KEY `idx_hplsfyoxpcqqlspwevjckoachnnrjietvlcq` (`siteId`);

--
-- Indexes for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `idx_qgwjylyfvvylsworfrgrcsvruuspfdzgrbdl` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_zddlqghangwawvdmbpndsdyfbcotpqwujqhc` (`siteId`),
  ADD KEY `fk_nduhmgtumlcpkfdtqkczvwxbaljrfitrxbie` (`userId`);

--
-- Indexes for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `idx_ovawlfkmdvrwnisceasnmdxldhdhfwdltzyv` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_ltrsrfrospbenziaaetezaelzgpdqfkhyvao` (`siteId`),
  ADD KEY `fk_erbjxpktouzvozoehqnajkbzhtakpwwzylgk` (`fieldId`),
  ADD KEY `fk_aucrtjorttmmmdbqwycbrtzibimwkwyqmxeu` (`userId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_quccnuizxamvfwmacuwsihiqlepcqhprqcin` (`elementId`,`siteId`),
  ADD KEY `idx_jormkygzrrrzrllwgqnuubgzsmgctkyxbwnc` (`siteId`),
  ADD KEY `idx_sakezdmgxnelzeiwnkcruddrnznomcedhfaj` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_eopqockrraqrpcoeratxysgstnfayuavwfrf` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_qesxandjargtsvwffpjwermboasirxuyzviy` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rfblnhwgfnjxtinpktfiyvqjccdddkwhnaxr` (`creatorId`,`provisional`),
  ADD KEY `idx_muopnpcdqesptfjeigotmasgqtwtlbletelt` (`saved`),
  ADD KEY `fk_rftykhclbdibkeiajcyeqdgqrudvlvtwexec` (`sourceId`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_hvxnhedueqkiwcxqawndsuganuknbmttildt` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tfosoqoytqjyfvzziuscccxamlajjjxzyoqd` (`dateDeleted`),
  ADD KEY `idx_zhdmlnvhdisspwwcazbchibbxidpysdaqipg` (`fieldLayoutId`),
  ADD KEY `idx_chxsjpxskypwarliwucffbrmxbrbgjkxlnlv` (`type`),
  ADD KEY `idx_xkbicymavjqvoodtctjuhcxogjlgwwlnlzoh` (`enabled`),
  ADD KEY `idx_tokrphzugzkxhejinjjekyfjcougzcuaspan` (`archived`,`dateCreated`),
  ADD KEY `idx_yrzexrgcphxwtmujotzycbprbmlrnznatzfl` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  ADD KEY `idx_vxxixlfttioeclcgomhjpmnghxcctcrzcmjv` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  ADD KEY `fk_fcupiuudjjeoreqalighswwzgpwoafczvfbx` (`canonicalId`),
  ADD KEY `fk_yhqgapnrdzvshwevmxytfooozqrlgnjpvbae` (`draftId`),
  ADD KEY `fk_lybaxvqgnhsqvhrqvzilujmwbyhkridvhhic` (`revisionId`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_wcjnscmzhwptuwqwnenqyuggijifwxfrqilx` (`elementId`,`siteId`),
  ADD KEY `idx_lkqgltkedneiebpgbiqpquhizwivyjisvhbi` (`siteId`),
  ADD KEY `idx_bigmszgwgvzhtexxxsjabxzydjumnbmgafoz` (`slug`,`siteId`),
  ADD KEY `idx_utuhkixsvfzzhtimvcwjtujkfmavbmoqrgty` (`enabled`),
  ADD KEY `idx_hpboktzspqkwtwqwwrgmbolzeyvaouotthmq` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_laohwfxolaorncnlyblmcimldtcbzbnmnlgo` (`postDate`),
  ADD KEY `idx_fdmylbxsuamvzwfommwwyuwhasvrfqllcdbq` (`expiryDate`),
  ADD KEY `idx_savmhabynxpovopfpwhuheildrwwpfrnrzac` (`authorId`),
  ADD KEY `idx_qgzhwcyvmigwlsugfmyekeeveztiqgfzskjv` (`sectionId`),
  ADD KEY `idx_uwsugzjwpzcsorqslaoxjawgbbqdnmqytuij` (`typeId`),
  ADD KEY `fk_nvxpyzsojwjiimabrgwlikojkevyuvaumakr` (`parentId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xtybhyyhvmgwdwtndrhlzqubcadxbqbplqtr` (`name`,`sectionId`),
  ADD KEY `idx_yboyphfyjdbmhnffwayffzjpektwpdjrncdx` (`handle`,`sectionId`),
  ADD KEY `idx_uusuqzmvvespbjflathdxrgeqqarggmfcclp` (`sectionId`),
  ADD KEY `idx_nbmokbaywvuusnawpnxoxorufjfnchbpgkur` (`fieldLayoutId`),
  ADD KEY `idx_swwtqktsdxumnfnzjietavkryfyneqogxgek` (`dateDeleted`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_huvgicwzmqgzojlrjdexbayzyacfmlqravvq` (`name`),
  ADD KEY `idx_owzuvpchgoqtbtvoewrfbyezbzlpppeceqir` (`dateDeleted`,`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_zmxjugnuqgeawatomxyjxscdffmqjjhwfgxd` (`layoutId`,`fieldId`),
  ADD KEY `idx_ruqkixpapxbdnvublscyawdezylzztyjpuuf` (`sortOrder`),
  ADD KEY `idx_qyalowpexxdoprvdnemuxffzuhjosthdccdx` (`tabId`),
  ADD KEY `idx_nanvdrqmdrblcyotxhqsvatdqhrrdxomhysm` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fdaamyvgsinhzmjzaowgavgagvxyzcqacekq` (`dateDeleted`),
  ADD KEY `idx_nnepxijfitdpmgupjzztddsthzwkmpfxpmry` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zijtpxmtszcuolkejynsbnfwtpdsgqmrwndb` (`sortOrder`),
  ADD KEY `idx_gkuaneglqrzepljhzdchfsvtvqdjsykxlieh` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fcowhnmisbpczezmohlykgzxlrzpgbwiwbsq` (`handle`,`context`),
  ADD KEY `idx_chexkbdenanztusmpqjlqguqfjletexsllku` (`groupId`),
  ADD KEY `idx_tycffreneofjzqunphzjxtipxvpzjkcprkqw` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lbauvhpiggomiclffhvgqmxkqsuojmdnlqsr` (`name`),
  ADD KEY `idx_djaysekfoztsrsmujmyttrtnrihxkzhudide` (`handle`),
  ADD KEY `idx_xogmzhmtxxvphglzjvpvaztrjorwlqiewkrh` (`fieldLayoutId`),
  ADD KEY `idx_zzemksfrjyywjsdlimrvlaslsuxeqmnqlftc` (`sortOrder`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_eqnxpyovandmvxiryxofhqutnmdpgejukwgw` (`accessToken`),
  ADD UNIQUE KEY `idx_igxatlngwzmxwflrfzxlfpetqowecygqppzt` (`name`),
  ADD KEY `fk_nfohmudiiplvztanmmsworxwglbzrtvlwjij` (`schemaId`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ymyyoiciruvguoxttkeukjciqooceetxefej` (`ownerId`),
  ADD KEY `idx_fvsydiuyozjegaaraxisjuagbngyaklajiku` (`fieldId`),
  ADD KEY `idx_wbdrfhiybrdtdsutaxiyxhiuxnyzvuxyidhg` (`typeId`),
  ADD KEY `idx_jmilygmzzvxxvtmjmppgzhaiwrkzwgbyvzht` (`sortOrder`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_slbbnaclrjtbjpvgwxfbzkcesxjyomfpxjtd` (`name`,`fieldId`),
  ADD KEY `idx_envnlbeanwmwgnoxubnhxbbgspliuuahbntj` (`handle`,`fieldId`),
  ADD KEY `idx_eznvzptezygnjfufialbhvunhakbnmxrescx` (`fieldId`),
  ADD KEY `idx_xmtzhjrvdadtpcqrlptywbczyxoqnmidytqc` (`fieldLayoutId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_rpaqwnjntsbnuccdilqhqwarvoxkpwkeeiyi` (`track`,`name`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_dxkvpfqfdzdfcttssdswzmyszkbwlcjkxynb` (`handle`);

--
-- Indexes for table `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_orzgzhgtymdfjculjwmucnhpbobxvsafdfrl` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `idx_zohxismkmamwjnhowylrdqhxphhtyqqjtied` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_xbxigkjzjgqfbzoupflpjmyfkzyomrkrfilp` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `idx_axufyeiqacbjugleexbdoeevxrljpmpnpdiu` (`sourceId`),
  ADD KEY `idx_btzcnmscccelvtllezlrsawkjbofqhtyjxlh` (`targetId`),
  ADD KEY `idx_ndboqmzijpycjrhnhzcytzjyvwgjhahwzakj` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_tacbyezhjbmyrihydiuaynaojvbpxaxvnfcr` (`sourceId`,`num`),
  ADD KEY `fk_tyxviwkzkaoyksfwybgcdyutglknkvzyvxmh` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_ltyrvksqionyrrwoqraqkhaswwcghzhohrwc` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jszvfojkeqmlurercaargcjvmnulkvomektr` (`handle`),
  ADD KEY `idx_uklfkyhgmomhpcicfkenjlkmckqpxocusxff` (`name`),
  ADD KEY `idx_jyvyepnohvphyzheyxzaretbcxdbzmntohqw` (`structureId`),
  ADD KEY `idx_clvaxopmesdhqisbambvcovpppfdppsfkdlk` (`dateDeleted`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_uhuacnahgpkqlqfcmflwesqxcznlthzzadot` (`sectionId`,`siteId`),
  ADD KEY `idx_qbwrmirzumequerdxfarqvtrcwolgwpyajtq` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jsunbpxqqbpcfuutflzrzhuiqvqzkahxuvvn` (`uid`),
  ADD KEY `idx_awynxkkecwtjhdrlzcfsbdjwjgvzyjebasbj` (`token`),
  ADD KEY `idx_bgygoukcguqxuqgsatzqzswbgvabrhgnimhq` (`dateUpdated`),
  ADD KEY `idx_fhgzzafoeddgaokbqygdzjpcvdkjvnbhhatw` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_sjfeahwqslnuklnugwqhokowpoymeykbfkve` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lxmfopoqoqrqsbplcyognyvqjpemdxtvtdpb` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dtiwhvuslwiyergoykkmkxlyndekbvuhtoif` (`dateDeleted`),
  ADD KEY `idx_mwzjluiagjhnyjyzzwktknfpdhmwqfvwceps` (`handle`),
  ADD KEY `idx_xbsttruymupsfqllnxjuwgvuzncvdollzznw` (`sortOrder`),
  ADD KEY `fk_nxmdtddbjnhmzudohuklsospiccbbxpxldzz` (`groupId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_pfgqtuhmedzbgwlfrnpruvkobskivsbzldff` (`structureId`,`elementId`),
  ADD KEY `idx_ssvpytmsjiigkihjwooefaaxjojqxruwiigp` (`root`),
  ADD KEY `idx_goikfpuhiqlppnhtkbbxyueksemgcpaqekjm` (`lft`),
  ADD KEY `idx_zkezagvkohqqocacvefmnzcquvwxvxsiwxyj` (`rgt`),
  ADD KEY `idx_faznysqmafuqbaejnahyqvadpnwwxhnndwbq` (`level`),
  ADD KEY `idx_ucsjqxugsrebwbfspzncferuwhyivkkhydxf` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vwznkvgallzkhstglnypyrffexphzopejhxj` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_tjiuwmjtbuwlkirozugbgqvwkchgrnmaqhkx` (`key`,`language`),
  ADD KEY `idx_truudagcudturbkitazonmlpdshdoekskfsa` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rxqhhnpmiklxvslcoiwjmfgafpttjomoqetr` (`name`),
  ADD KEY `idx_wldbzaedwzbdejwrcisyybqwziqbzxesuifl` (`handle`),
  ADD KEY `idx_fjjhbcwkthpvqaykvlzsbkckmuyakgusgjgu` (`dateDeleted`),
  ADD KEY `fk_iwjkpsvmymnwsmqmhrdjqhxeakyymofomlxu` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pipfppomsfzruamsljpjrpwjndyjbicjdkov` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ggzwjdkbqeasivuonvgjealrxaokjutwvymd` (`cacheId`),
  ADD KEY `idx_ewagkzxwxstmjhrkvoyjmjrrxahbxcenfido` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hpanvvgknzleehisgsdbrkoxdsoficmymqjb` (`cacheId`),
  ADD KEY `idx_wqeixpmifdiacenjwxsepiogexwkyijwumtu` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nzyajjhrfhdnjtlsftdkwkbxwgxbgorhvbre` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `idx_nwomrdbpqamzbjqxmurbqdsjoewxgwaopviq` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `idx_mqtpggrxkjvqkozwxcugrufyuyolnzsfhqee` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_qwqiymfcttoxhrajozsaurlscbnvlxhjiusv` (`token`),
  ADD KEY `idx_exmqahuackwubxejsazvxuzjuzlykesaavzh` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dbtlflosxzngepgsgqmtatkowltgwwfdzqsq` (`handle`),
  ADD KEY `idx_omqrjgafvchgrzkeknvmgzjtpjrudewprqby` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_munifcboudtarqfzooyqvdukloibtldwfmxk` (`groupId`,`userId`),
  ADD KEY `idx_ixihsoautqiyfxnuqtoqwyiqsyzjkvunoihl` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_sgsljundcwbltwzgyahkmqvonxgneypoajix` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ymkbbllqxtxermppykthvxnicgzdwiodvpnk` (`permissionId`,`groupId`),
  ADD KEY `idx_uvhoiwltwjqbwfnhbbvucuzvavugllbghvfj` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_jzzxjonfpautsjvwmpwfzveihzfqipmbmukr` (`permissionId`,`userId`),
  ADD KEY `idx_jtqyizjvrqiezbjtahdoeuvjenhiyyxdcovb` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qtywiayhevuvkguwhhzdgwhqgjyagqpdesqw` (`uid`),
  ADD KEY `idx_vpcgcdbidslvklmgrcbimsimqwdcyzidhfur` (`verificationCode`),
  ADD KEY `idx_fgvzuvqxekpilwbxtdlboamjbusitlmlqbyo` (`email`),
  ADD KEY `idx_nukayugjioldebekhirqmphsmyofgbysidlk` (`username`),
  ADD KEY `fk_qekbyuaacjwmwjfvwlvykowufmotppyivmlx` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_wxprxgmguugaqtflktcmqptvfxtbqhhgeimz` (`name`,`parentId`,`volumeId`),
  ADD KEY `idx_vaprynjcpgherxlcfmcegblwikkaigzkvhrb` (`parentId`),
  ADD KEY `idx_xrzahjjrpjdwhismblvgedipxzturdjcjhbl` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rtatfqlqrqracjhcecrfxsfvogemycziyjie` (`name`),
  ADD KEY `idx_azjadodfnkmyeszawjadyvzbglftbmwoozfb` (`handle`),
  ADD KEY `idx_bdzincupblgslyonnbkpjvgqoprqcfzqvtfq` (`fieldLayoutId`),
  ADD KEY `idx_csqtqtrzpjbrkffydwuwiqiidrubtxpvfchh` (`dateDeleted`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uqlavcwywgxlzpnbfwugzqgdwbqmdspjcpfz` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_jysjjrsouhxdewcmcpwjpangaplnllzxigda` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ncjjxlbeotudtojfsffuacwqaalxudddiqul` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_nfcvkqcbmtbecmeokrjyzgklkwdgdtrspdqc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_fmrwrgtcwalqbnqqzqtfvoietrzqjqwcboql` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_kdcihfesjkyepsagfpklwbfxxoudkycmsxbd` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_qvuqakdwsomeadbqsnxaswabvfcmxmarhckw` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wcmwfgbuzgtdyadkomznblvlrxfryrdcwwit` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_bkbfnlpqaiedbpznafsvblmmgbbxfmftpswm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ifqhkdsxotjcjdtoxotsonriuscixqfnaqzj` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_iomsjxrtprfxzhlfppyereheocvccojdbzsb` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_eoorsoqqiorhwaianqdbcaidsekpmnpcbjly` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_jiyfepmfsjdtnzomsdqogogiebsoolsdmold` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_moswxoqroaaniuzqubssafyhdgqqswzmjoqz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pagmldnmjnnduylwtytxlokhfodoeehlkuvd` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_acegutdnswenfpwhqerswacjpbpbhrlwxcfg` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nduhmgtumlcpkfdtqkczvwxbaljrfitrxbie` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zddlqghangwawvdmbpndsdyfbcotpqwujqhc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_aucrtjorttmmmdbqwycbrtzibimwkwyqmxeu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_erbjxpktouzvozoehqnajkbzhtakpwwzylgk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ltrsrfrospbenziaaetezaelzgpdqfkhyvao` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vjypzebzdfgcqzsrlcztdpmvgazqwwbplzgv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk_ahagteozpqmaukuucdrufftcjszsycjytbgz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qbiixiceffkgbiyvtiqpprgpmejpcvrcruzo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_eopqockrraqrpcoeratxysgstnfayuavwfrf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_fpricrjpdmrykqbzkszuuaiqpryrxpfsimum` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_rftykhclbdibkeiajcyeqdgqrudvlvtwexec` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_fcupiuudjjeoreqalighswwzgpwoafczvfbx` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ixovpkbmodarjvlzxtxynmojdftatpikfyvd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_lybaxvqgnhsqvhrqvzilujmwbyhkridvhhic` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yhqgapnrdzvshwevmxytfooozqrlgnjpvbae` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_eutvjjwtzqnoljjvkmqszqapcsweaijvnhar` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_oupsflfkcrkilurfryhygcheimlfijxdblkh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_advzfgbbhngbhfmzpyxfxmbtibfkfcwmzcfy` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_muxgnpwowejyybgfdnupulheevjehedbwnxn` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nvxpyzsojwjiimabrgwlikojkevyuvaumakr` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_prygnrlljbqodecsmmsoxgnnkhwvjxkncnfk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_uxpajguxzhfrfdxrfkpetktzfekvwlfjphnh` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_vbzrswblhyuydynoceadfgktaktlaawnhqrt` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vhbvymzjhjezqlgbmmjyfcacvkuguomrreuh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fk_frgdhbzuaxrsgrtmvshhscsixqnrnywvzcno` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jlzcwpcgdgeahnlmlrpxhcvqtqkfqdbbdoub` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jzldfxndpwythrbqolueumxfsujzwcnczlyn` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fk_zssnuedturzpuzganwuvoikdbtbzpxawdumu` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fk_ssfbmikkkrxnkcyblldhhngblvnomgndvlpu` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_cilmoolzafljbyetnhaxepvvrkjlehwpmwsu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rntfvjoxejhqzaadeofmwdwptgrbdydqivqi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_nfohmudiiplvztanmmsworxwglbzrtvlwjij` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `fk_axjboxzjbltiwzzzqueyzjyqyjnevrwcmnbl` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cwytqyirrwvcaiqmgnitezwfxpzesolacfbl` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_iznarpqqzthtbtfijpbrzlbwxwcvblsipiaz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wpbaicikjkbtymiajpjwmvyyonwdqyhhzxsg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `fk_imrmldvfhqhsrnphkhnctyveueufvoxylewk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yzkspkouidysisculaogujmsbjrtanolvimo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_gjkycqhgmdcxolwqqyyzeaqoyxplixcmuptx` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ifxuqiqrjtdzurktrbyssmtkwcaaibofyaia` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ojjmktlcfmeaxhmdujcsmcbvlatpwwmjryfz` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zjlffwqwitflbngnjwwxqfhhjqeupalgjxjl` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_sdkaybbccgikjlfjuekaoxwirwlrxqsopqkn` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tyxviwkzkaoyksfwybgcdyutglknkvzyvxmh` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_rcnnpftpudrmhetjknnsgytmjwtqheaybhmy` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_ppnowwgmaqaubizianwfirwqdvjxjrrrenaz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_twxmhpludqlwesjagzinrbmhmdsfwodipvvu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_qtjmvxhsmaxfdoeunvrzcgcxykgvvjrpmmph` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_tqktasbujwxskqofuysrtqtzxpiqmawiyien` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_nxmdtddbjnhmzudohuklsospiccbbxpxldzz` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_qnqsixucokndfjczndqypterxoxkxmornadg` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vaovgsaofllrkmlbtevidxoyhcdrgkmqhztx` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_iwjkpsvmymnwsmqmhrdjqhxeakyymofomlxu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_fvmqinjochczidiftqgyiidgzerutnbxicje` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pnoqwclgnjbhksgbvdqqwbbzqbeiholxwdor` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `fk_wigsvvmeqzxzurdkkyawckxmebvmdpymgglh` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xbnzzpmznwvyjfsjhtjmtehgbdzqioxqfvmu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `fk_dtbqbvbhcjbwnfuduktgelljajkqsncitlln` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `fk_klcgkmhmeikpwushpusoaglnmbhkytdycunl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_qfapwwhnohfcvkervgvhcochvfjefqkmbqef` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sajfvddnzrnjoxcwwkbjctagdrqbstucbxne` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_qibbztrmpipqzpurwuomruwmjeljmyqkwyey` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vlwuofdeqyjqbwinhvmjozkjvfdljlkgiryc` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_mkkrhbiqkhtnmweawhlhixqgjxthwstjteuc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pusbzuakblxpkhcnpacrngegnysfzscluezl` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_osxbpvhmrrkeiyfqrvyfiaqrdwqosepzleri` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_kpnjynxxkgbrglwiqjqavodejukjjlnbuesm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qekbyuaacjwmwjfvwlvykowufmotppyivmlx` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_czmgjgqwxfeaxueitwrknsaxwjvbogepsczu` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_kdmozoqsirrwyzqtlmquwozphaxwagwzihrk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_hctildisbxnqfussolaslphkedbohpieqfan` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_wxfesqdyzwniccodihwmqvregccrfjcnjujm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
