-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 09 2023 г., 14:47
-- Версия сервера: 5.7.40
-- Версия PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `rp_credits`
--

-- --------------------------------------------------------

--
-- Структура таблицы `donation_invoices`
--

DROP TABLE IF EXISTS `donation_invoices`;
CREATE TABLE IF NOT EXISTS `donation_invoices` (
  `id` int(11) NOT NULL,
  `steamid` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `duration` tinyint(10) DEFAULT NULL,
  `method` varchar(20) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT '0',
  `given` tinyint(1) DEFAULT '0',
  `created` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `server_name` varchar(20) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `donation_users`
--

DROP TABLE IF EXISTS `donation_users`;
CREATE TABLE IF NOT EXISTS `donation_users` (
  `steamid` varchar(20) DEFAULT NULL,
  `data` text,
  `server_name` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `kshop_credits_transactions`
--

DROP TABLE IF EXISTS `kshop_credits_transactions`;
CREATE TABLE IF NOT EXISTS `kshop_credits_transactions` (
  `Time` bigint(20) DEFAULT NULL,
  `SteamID` varchar(40) DEFAULT NULL,
  `Change` int(11) DEFAULT NULL,
  `Note` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `kshop_credits_transactions`
--

INSERT INTO `kshop_credits_transactions` (`Time`, `SteamID`, `Change`, `Note`) VALUES
(1485542275, 'STEAM_0:1:196354056', 2147483647, 'Given by never(STEAM_0:1:196354056)'),
(1485544376, 'STEAM_0:1:196354056', -500, 'Purchase: org_prem'),
(1485544380, 'STEAM_0:1:196354056', -150, 'Purchase: announcement'),
(1485544396, 'STEAM_0:1:196354056', -150, 'Purchase: announcement'),
(1485544415, 'STEAM_0:1:196354056', -2000, 'Purchase: prop_limit_15'),
(1485544416, 'STEAM_0:1:196354056', -4000, 'Purchase: prop_limit_15'),
(1485544417, 'STEAM_0:1:196354056', -6000, 'Purchase: prop_limit_15'),
(1485544418, 'STEAM_0:1:196354056', -8000, 'Purchase: prop_limit_15'),
(1485544419, 'STEAM_0:1:196354056', -10000, 'Purchase: prop_limit_15'),
(1485544419, 'STEAM_0:1:196354056', -12000, 'Purchase: prop_limit_15'),
(1485544422, 'STEAM_0:1:196354056', -300, 'Purchase: pocket_space_2'),
(1485544423, 'STEAM_0:1:196354056', -450, 'Purchase: pocket_space_2'),
(1485544423, 'STEAM_0:1:196354056', -600, 'Purchase: pocket_space_2'),
(1485544426, 'STEAM_0:1:196354056', -300, 'Purchase: perma_ammo'),
(1485544430, 'STEAM_0:1:196354056', -1000, 'Purchase: 250k_rp_cash'),
(1485544431, 'STEAM_0:1:196354056', -1000, 'Purchase: 250k_rp_cash'),
(1485544431, 'STEAM_0:1:196354056', -1000, 'Purchase: 250k_rp_cash'),
(1485544432, 'STEAM_0:1:196354056', -1000, 'Purchase: 250k_rp_cash'),
(1485544441, 'STEAM_0:1:196354056', -350, 'Purchase: event_burger'),
(1485544444, 'STEAM_0:1:196354056', -350, 'Purchase: event_printer'),
(1485544449, 'STEAM_0:1:196354056', -200, 'Purchase: event_salary'),
(1485544451, 'STEAM_0:1:196354056', -350, 'Purchase: event_vip'),
(1485544453, 'STEAM_0:1:196354056', -300, 'Purchase: event_parkour'),
(1485544462, 'STEAM_0:1:196354056', -600, 'Purchase: perma_camera'),
(1485544464, 'STEAM_0:1:196354056', -1000, 'Purchase: perma_crowbar'),
(1485544466, 'STEAM_0:1:196354056', -1250, 'Purchase: perma_stunstick'),
(1485544469, 'STEAM_0:1:196354056', -800, 'Purchase: perma_knife'),
(1485544471, 'STEAM_0:1:196354056', -800, 'Purchase: perma_fists'),
(1485544473, 'STEAM_0:1:196354056', -950, 'Purchase: perma_pimphand'),
(1485544476, 'STEAM_0:1:196354056', -1500, 'Purchase: perma_357'),
(1485544479, 'STEAM_0:1:196354056', -1250, 'Purchase: perma_fiveseven'),
(1485544481, 'STEAM_0:1:196354056', -1400, 'Purchase: perma_deagle'),
(1485544485, 'STEAM_0:1:196354056', -1500, 'Purchase: perma_glock'),
(1485544487, 'STEAM_0:1:196354056', -1250, 'Purchase: perma_usp'),
(1485544489, 'STEAM_0:1:196354056', -1250, 'Purchase: perma_p228'),
(1485544491, 'STEAM_0:1:196354056', -50000, 'Purchase: perma_rpg'),
(1485544518, 'STEAM_0:1:196354056', -4000, 'Purchase: hat_wizard hat'),
(1485619133, 'STEAM_0:1:73742782', 2147483647, 'Given by MrKuBu(STEAM_0:1:73742782)'),
(1485620050, 'STEAM_0:1:73742782', -300, 'Purchase: perma_ammo'),
(1485620054, 'STEAM_0:1:73742782', -300, 'Purchase: pocket_space_2'),
(1485620057, 'STEAM_0:1:73742782', -450, 'Purchase: pocket_space_2'),
(1485620062, 'STEAM_0:1:73742782', -600, 'Purchase: pocket_space_2'),
(1485620062, 'STEAM_0:1:73742782', -750, 'Purchase: pocket_space_2'),
(1485620063, 'STEAM_0:1:73742782', -900, 'Purchase: pocket_space_2'),
(1485620063, 'STEAM_0:1:73742782', -1050, 'Purchase: pocket_space_2'),
(1485620064, 'STEAM_0:1:73742782', -1200, 'Purchase: pocket_space_2'),
(1485620065, 'STEAM_0:1:73742782', -1350, 'Purchase: pocket_space_2'),
(1485620066, 'STEAM_0:1:73742782', -1500, 'Purchase: pocket_space_2'),
(1485620066, 'STEAM_0:1:73742782', -1650, 'Purchase: pocket_space_2'),
(1485620067, 'STEAM_0:1:73742782', -1800, 'Purchase: pocket_space_2'),
(1485620068, 'STEAM_0:1:73742782', -1950, 'Purchase: pocket_space_2'),
(1485620068, 'STEAM_0:1:73742782', -2100, 'Purchase: pocket_space_2'),
(1485620069, 'STEAM_0:1:73742782', -2250, 'Purchase: pocket_space_2'),
(1485620070, 'STEAM_0:1:73742782', -2400, 'Purchase: pocket_space_2'),
(1485620070, 'STEAM_0:1:73742782', -2550, 'Purchase: pocket_space_2'),
(1485620071, 'STEAM_0:1:73742782', -2700, 'Purchase: pocket_space_2'),
(1485620072, 'STEAM_0:1:73742782', -2850, 'Purchase: pocket_space_2'),
(1485620072, 'STEAM_0:1:73742782', -3000, 'Purchase: pocket_space_2'),
(1485620074, 'STEAM_0:1:73742782', -500, 'Purchase: org_prem'),
(1485620077, 'STEAM_0:1:73742782', -2000, 'Purchase: prop_limit_15'),
(1485620077, 'STEAM_0:1:73742782', -4000, 'Purchase: prop_limit_15'),
(1485620078, 'STEAM_0:1:73742782', -6000, 'Purchase: prop_limit_15'),
(1485620079, 'STEAM_0:1:73742782', -8000, 'Purchase: prop_limit_15'),
(1485620080, 'STEAM_0:1:73742782', -10000, 'Purchase: prop_limit_15'),
(1485620080, 'STEAM_0:1:73742782', -12000, 'Purchase: prop_limit_15'),
(1485620081, 'STEAM_0:1:73742782', -14000, 'Purchase: prop_limit_15'),
(1485620082, 'STEAM_0:1:73742782', -16000, 'Purchase: prop_limit_15'),
(1485620082, 'STEAM_0:1:73742782', -18000, 'Purchase: prop_limit_15'),
(1485620083, 'STEAM_0:1:73742782', -20000, 'Purchase: prop_limit_15'),
(1485620084, 'STEAM_0:1:73742782', -22000, 'Purchase: prop_limit_15'),
(1485620084, 'STEAM_0:1:73742782', -24000, 'Purchase: prop_limit_15'),
(1485620085, 'STEAM_0:1:73742782', -26000, 'Purchase: prop_limit_15'),
(1485620086, 'STEAM_0:1:73742782', -28000, 'Purchase: prop_limit_15'),
(1485620087, 'STEAM_0:1:73742782', -30000, 'Purchase: prop_limit_15'),
(1485620089, 'STEAM_0:1:73742782', -150, 'Purchase: announcement'),
(1485620089, 'STEAM_0:1:73742782', -150, 'Purchase: announcement'),
(1485620090, 'STEAM_0:1:73742782', -150, 'Purchase: announcement'),
(1485620091, 'STEAM_0:1:73742782', -150, 'Purchase: announcement'),
(1485620149, 'STEAM_0:1:73742782', -150, 'Purchase: announcement'),
(1485620150, 'STEAM_0:1:73742782', -150, 'Purchase: announcement'),
(1485620151, 'STEAM_0:1:73742782', -150, 'Purchase: announcement'),
(1485620151, 'STEAM_0:1:73742782', -150, 'Purchase: announcement'),
(1485620152, 'STEAM_0:1:73742782', -150, 'Purchase: announcement'),
(1485625318, 'STEAM_0:1:73742782', -6000, 'Purchase: hat_crown'),
(1485625334, 'STEAM_0:1:73742782', -32000, 'Purchase: prop_limit_15'),
(1485625458, 'STEAM_0:1:73742782', -1250, 'Purchase: perma_usp'),
(1485626700, 'STEAM_0:1:73742782', -50000, 'Purchase: perma_rpg'),
(1485627652, 'STEAM_0:1:73742782', -300, 'Purchase: event_parkour'),
(1485628322, 'STEAM_0:1:73742782', -950, 'Purchase: perma_pimphand'),
(1485714982, 'STEAM_0:1:73742782', -100, 'Purchase: hat_stunt helmet'),
(1485715018, 'STEAM_0:1:73742782', -2400, 'Purchase: hat_bandit'),
(1485715198, 'STEAM_0:1:73742782', -2000, 'Purchase: hat_disguise'),
(1485715688, 'STEAM_0:1:73742782', -1600, 'Purchase: hat_shades'),
(1485715782, 'STEAM_0:1:73742782', -5000, 'Purchase: hat_fedora'),
(1486233060, 'STEAM_0:1:73742782', -100, 'Purchase: hat_ÐŸÐ»Ð°Ñ‰ÑŒ'),
(1486236669, 'STEAM_0:1:73742782', -600, 'Purchase: perma_camera'),
(1486578048, 'STEAM_0:1:196354056', -4000, 'Purchase: hat_ÐŸÐ»Ð°Ñ‰ÑŒ'),
(1486659845, 'STEAM_0:1:73742782', -3150, 'Purchase: pocket_space_2'),
(1486659851, 'STEAM_0:1:73742782', -3300, 'Purchase: pocket_space_2'),
(1486659865, 'STEAM_0:1:73742782', -1000, 'Purchase: 250k_rp_cash'),
(1486659876, 'STEAM_0:1:73742782', -500, 'Purchase: 50k_rp_cash'),
(1486659876, 'STEAM_0:1:73742782', -500, 'Purchase: 50k_rp_cash'),
(1486659890, 'STEAM_0:1:73742782', -350, 'Purchase: event_vip'),
(1486659893, 'STEAM_0:1:73742782', -350, 'Purchase: event_burger'),
(1486659897, 'STEAM_0:1:73742782', -350, 'Purchase: event_printer'),
(1486659899, 'STEAM_0:1:73742782', -300, 'Purchase: event_parkour'),
(1486659903, 'STEAM_0:1:73742782', -200, 'Purchase: event_salary'),
(1486659972, 'STEAM_0:1:73742782', -350, 'Purchase: hat_cowboy hat'),
(1486661484, 'STEAM_0:1:73742782', -34000, 'Purchase: prop_limit_15'),
(1486741658, 'STEAM_0:1:73742782', -4000, 'Purchase: hat_123'),
(1486741667, 'STEAM_0:1:73742782', -4000, 'Purchase: hat_123'),
(1486741796, 'STEAM_0:1:73742782', -200, 'Purchase: hat_summer hat'),
(1486741869, 'STEAM_0:1:73742782', -1000, 'Purchase: hat_fez'),
(1486744069, 'STEAM_0:1:73742782', -6000, 'Purchase: hat_crown'),
(1486744382, 'STEAM_0:1:73742782', -4000, 'Purchase: accessories_ÐŸÐ»Ð°Ñ‰ÑŒ'),
(1487008137, 'STEAM_0:1:73742782', -350, 'Purchase: event_burger'),
(1487345656, 'STEAM_0:1:196354056', -350, 'Purchase: event_burger'),
(1487952682, 'STEAM_0:1:73742782', -350, 'Purchase: event_burger'),
(1685169856, 'STEAM_0:0:418641748', 66346, 'Given by Diedr Bartholic(STEAM_0:0:418641748)'),
(1685169865, 'STEAM_0:0:418641748', -500, 'Purchase: 600k_rp_cash'),
(1685169867, 'STEAM_0:0:418641748', -4000, 'Purchase: 1000h'),
(1685252692, 'STEAM_0:0:418641748', -4000, 'Purchase: 1000h'),
(1685252693, 'STEAM_0:0:418641748', -4000, 'Purchase: 1000h'),
(1685252694, 'STEAM_0:0:418641748', -4000, 'Purchase: 1000h'),
(1685252694, 'STEAM_0:0:418641748', -4000, 'Purchase: 1000h'),
(1685252695, 'STEAM_0:0:418641748', -4000, 'Purchase: 1000h'),
(1685252696, 'STEAM_0:0:418641748', -4000, 'Purchase: 1000h'),
(1685252696, 'STEAM_0:0:418641748', -4000, 'Purchase: 1000h'),
(1685252697, 'STEAM_0:0:418641748', -4000, 'Purchase: 1000h'),
(1685252698, 'STEAM_0:0:418641748', -4000, 'Purchase: 1000h'),
(1685252699, 'STEAM_0:0:418641748', -4000, 'Purchase: 1000h');

-- --------------------------------------------------------

--
-- Структура таблицы `kshop_currency_conversions`
--

DROP TABLE IF EXISTS `kshop_currency_conversions`;
CREATE TABLE IF NOT EXISTS `kshop_currency_conversions` (
  `currency` char(3) NOT NULL DEFAULT '',
  `rate` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`currency`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `kshop_ipn_transactions`
--

DROP TABLE IF EXISTS `kshop_ipn_transactions`;
CREATE TABLE IF NOT EXISTS `kshop_ipn_transactions` (
  `pay_status` varchar(32) NOT NULL,
  `payer_email` varchar(128) NOT NULL,
  `custom` varchar(20) NOT NULL,
  `amount` float NOT NULL,
  `currency` varchar(8) NOT NULL,
  `txn_id` varchar(64) NOT NULL,
  `txn_type` varchar(32) NOT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `parent_txn_id` varchar(64) DEFAULT NULL,
  `timestamp` double DEFAULT '0',
  `net` float DEFAULT '0',
  `receiver_email` varchar(128) DEFAULT 'mrkubu122333@gmail.com'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `kshop_purchases`
--

DROP TABLE IF EXISTS `kshop_purchases`;
CREATE TABLE IF NOT EXISTS `kshop_purchases` (
  `Time` bigint(20) DEFAULT NULL,
  `SteamID` varchar(40) DEFAULT NULL,
  `Upgrade` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `kshop_purchases`
--

INSERT INTO `kshop_purchases` (`Time`, `SteamID`, `Upgrade`) VALUES
(1485544376, 'STEAM_0:1:196354056', 'org_prem'),
(10000, 'STEAM_0:1:196354056', '1000000'),
(1485544380, 'STEAM_0:1:196354056', 'announcement'),
(1485544396, 'STEAM_0:1:196354056', 'announcement'),
(1485544415, 'STEAM_0:1:196354056', 'prop_limit_15'),
(1485544416, 'STEAM_0:1:196354056', 'prop_limit_15'),
(1485544417, 'STEAM_0:1:196354056', 'prop_limit_15'),
(1485544418, 'STEAM_0:1:196354056', 'prop_limit_15'),
(1485544419, 'STEAM_0:1:196354056', 'prop_limit_15'),
(1485544419, 'STEAM_0:1:196354056', 'prop_limit_15'),
(1485544422, 'STEAM_0:1:196354056', 'pocket_space_2'),
(1485544423, 'STEAM_0:1:196354056', 'pocket_space_2'),
(1485544423, 'STEAM_0:1:196354056', 'pocket_space_2'),
(1485544426, 'STEAM_0:1:196354056', 'perma_ammo'),
(1485544430, 'STEAM_0:1:196354056', '250k_rp_cash'),
(1485544431, 'STEAM_0:1:196354056', '250k_rp_cash'),
(1485544432, 'STEAM_0:1:196354056', '250k_rp_cash'),
(1485544432, 'STEAM_0:1:196354056', '250k_rp_cash'),
(1485544441, 'STEAM_0:1:196354056', 'event_burger'),
(1485544445, 'STEAM_0:1:196354056', 'event_printer'),
(1485544449, 'STEAM_0:1:196354056', 'event_salary'),
(1485544451, 'STEAM_0:1:196354056', 'event_vip'),
(1485544453, 'STEAM_0:1:196354056', 'event_parkour'),
(1485544462, 'STEAM_0:1:196354056', 'perma_camera'),
(1485544464, 'STEAM_0:1:196354056', 'perma_crowbar'),
(1485544466, 'STEAM_0:1:196354056', 'perma_stunstick'),
(1485544469, 'STEAM_0:1:196354056', 'perma_knife'),
(1485544471, 'STEAM_0:1:196354056', 'perma_fists'),
(1485544473, 'STEAM_0:1:196354056', 'perma_pimphand'),
(1485544476, 'STEAM_0:1:196354056', 'perma_357'),
(1485544479, 'STEAM_0:1:196354056', 'perma_fiveseven'),
(1485544481, 'STEAM_0:1:196354056', 'perma_deagle'),
(1485544485, 'STEAM_0:1:196354056', 'perma_glock'),
(1485544487, 'STEAM_0:1:196354056', 'perma_usp'),
(1485544489, 'STEAM_0:1:196354056', 'perma_p228'),
(1485544491, 'STEAM_0:1:196354056', 'perma_rpg'),
(1485544518, 'STEAM_0:1:196354056', 'hat_wizard hat'),
(1485620050, 'STEAM_0:1:73742782', 'perma_ammo'),
(1485620054, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620057, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620062, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620062, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620063, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620063, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620064, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620065, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620066, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620066, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620067, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620068, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620068, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620069, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620070, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620070, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620071, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620072, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620072, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1485620074, 'STEAM_0:1:73742782', 'org_prem'),
(1485620077, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620077, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620078, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620079, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620080, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620080, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620081, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620082, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620082, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620083, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620084, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620084, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620085, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620086, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620087, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485620089, 'STEAM_0:1:73742782', 'announcement'),
(1485620089, 'STEAM_0:1:73742782', 'announcement'),
(1485620090, 'STEAM_0:1:73742782', 'announcement'),
(1485620091, 'STEAM_0:1:73742782', 'announcement'),
(1485620149, 'STEAM_0:1:73742782', 'announcement'),
(1485620150, 'STEAM_0:1:73742782', 'announcement'),
(1485620151, 'STEAM_0:1:73742782', 'announcement'),
(1485620151, 'STEAM_0:1:73742782', 'announcement'),
(1485620152, 'STEAM_0:1:73742782', 'announcement'),
(1485625318, 'STEAM_0:1:73742782', 'hat_crown'),
(1485625334, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1485625458, 'STEAM_0:1:73742782', 'perma_usp'),
(1485626700, 'STEAM_0:1:73742782', 'perma_rpg'),
(1485627652, 'STEAM_0:1:73742782', 'event_parkour'),
(1485628323, 'STEAM_0:1:73742782', 'perma_pimphand'),
(1485714982, 'STEAM_0:1:73742782', 'hat_stunt helmet'),
(1485715018, 'STEAM_0:1:73742782', 'hat_bandit'),
(1485715198, 'STEAM_0:1:73742782', 'hat_disguise'),
(1485715688, 'STEAM_0:1:73742782', 'hat_shades'),
(1485715782, 'STEAM_0:1:73742782', 'hat_fedora'),
(1486233061, 'STEAM_0:1:73742782', 'hat_ÐŸÐ»Ð°Ñ‰ÑŒ'),
(1486236669, 'STEAM_0:1:73742782', 'perma_camera'),
(1486578048, 'STEAM_0:1:196354056', 'hat_ÐŸÐ»Ð°Ñ‰ÑŒ'),
(1486659845, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1486659851, 'STEAM_0:1:73742782', 'pocket_space_2'),
(1486659865, 'STEAM_0:1:73742782', '250k_rp_cash'),
(1486659876, 'STEAM_0:1:73742782', '50k_rp_cash'),
(1486659877, 'STEAM_0:1:73742782', '50k_rp_cash'),
(1486659890, 'STEAM_0:1:73742782', 'event_vip'),
(1486659893, 'STEAM_0:1:73742782', 'event_burger'),
(1486659897, 'STEAM_0:1:73742782', 'event_printer'),
(1486659899, 'STEAM_0:1:73742782', 'event_parkour'),
(1486659903, 'STEAM_0:1:73742782', 'event_salary'),
(1486659972, 'STEAM_0:1:73742782', 'hat_cowboy hat'),
(1486661484, 'STEAM_0:1:73742782', 'prop_limit_15'),
(1486741658, 'STEAM_0:1:73742782', 'hat_123'),
(1486741667, 'STEAM_0:1:73742782', 'hat_123'),
(1486741796, 'STEAM_0:1:73742782', 'hat_summer hat'),
(1486741869, 'STEAM_0:1:73742782', 'hat_fez'),
(1486744069, 'STEAM_0:1:73742782', 'hat_crown'),
(1486744382, 'STEAM_0:1:73742782', 'accessories_ÐŸÐ»Ð°Ñ‰ÑŒ'),
(1487008137, 'STEAM_0:1:73742782', 'event_burger'),
(1487345656, 'STEAM_0:1:196354056', 'event_burger'),
(1487952682, 'STEAM_0:1:73742782', 'event_burger'),
(1685169865, 'STEAM_0:0:418641748', '600k_rp_cash'),
(1685169867, 'STEAM_0:0:418641748', '1000h'),
(1685252692, 'STEAM_0:0:418641748', '1000h'),
(1685252693, 'STEAM_0:0:418641748', '1000h'),
(1685252694, 'STEAM_0:0:418641748', '1000h'),
(1685252694, 'STEAM_0:0:418641748', '1000h'),
(1685252695, 'STEAM_0:0:418641748', '1000h'),
(1685252696, 'STEAM_0:0:418641748', '1000h'),
(1685252696, 'STEAM_0:0:418641748', '1000h'),
(1685252697, 'STEAM_0:0:418641748', '1000h'),
(1685252698, 'STEAM_0:0:418641748', '1000h'),
(1685252699, 'STEAM_0:0:418641748', '1000h');

-- --------------------------------------------------------

--
-- Структура таблицы `kshop_servers`
--

DROP TABLE IF EXISTS `kshop_servers`;
CREATE TABLE IF NOT EXISTS `kshop_servers` (
  `HostID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `Address` varchar(30) DEFAULT NULL,
  `HostName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`HostID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `kshop_servers`
--

INSERT INTO `kshop_servers` (`HostID`, `Address`, `HostName`) VALUES
(429496729527015, '192.168.1.2:27015', 'MrKuBu Test server');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
