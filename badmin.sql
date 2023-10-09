-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 09 2023 г., 14:48
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
-- База данных: `badmin`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ba_bans`
--

DROP TABLE IF EXISTS `ba_bans`;
CREATE TABLE IF NOT EXISTS `ba_bans` (
  `steamid` bigint(20) NOT NULL,
  `ip` varchar(39) NOT NULL,
  `name` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `a_steamid` bigint(20) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  `ban_time` int(11) NOT NULL,
  `ban_len` int(11) NOT NULL,
  `unban_time` int(11) NOT NULL,
  `unban_reason` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `ba_bans`
--

INSERT INTO `ba_bans` (`steamid`, `ip`, `name`, `reason`, `a_steamid`, `a_name`, `ban_time`, `ban_len`, `unban_time`, `unban_reason`) VALUES
(90071996842377216, 'Error!', 'Bot01', '123', 76561198107751293, 'MrKuBu', 1485628630, 60, 1485628690, NULL),
(76561198107751293, '192.168.1.3:27006', 'MrKuBu', '123', 76561198107751293, 'MrKuBu', 1485884149, 60, 1485884209, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ba_cheaters`
--

DROP TABLE IF EXISTS `ba_cheaters`;
CREATE TABLE IF NOT EXISTS `ba_cheaters` (
  `steamid` bigint(20) NOT NULL,
  `date` int(11) NOT NULL,
  `infractions` text NOT NULL,
  `screengrab` longblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `ba_hashlog`
--

DROP TABLE IF EXISTS `ba_hashlog`;
CREATE TABLE IF NOT EXISTS `ba_hashlog` (
  `steamid` bigint(20) NOT NULL,
  `lastseen` int(11) NOT NULL,
  `hashid` char(64) NOT NULL,
  PRIMARY KEY (`steamid`,`hashid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `ba_hashlog`
--

INSERT INTO `ba_hashlog` (`steamid`, `lastseen`, `hashid`) VALUES
(76561198352973841, 1487607280, 'f0c97fa3ea9221fa8d16ce7db30012ebaa1db78b9a350eda7496404bbb337cab'),
(76561198107751293, 1488052145, 'f0c97fa3ea9221fa8d16ce7db30012ebaa1db78b9a350eda7496404bbb337cab'),
(76561198797549224, 1685255891, '4e356f587efbda33e8d2a903d3b0cb6bf8ca00e92398e85cb5961968ea537c00'),
(76561198797549224, 1696861950, 'f6ce2e791a8004a9f4c5d740d65a986c556393ff02cb1a3aa8bbc35fbb5b4e39');

-- --------------------------------------------------------

--
-- Структура таблицы `ba_iplog`
--

DROP TABLE IF EXISTS `ba_iplog`;
CREATE TABLE IF NOT EXISTS `ba_iplog` (
  `steamid` bigint(20) NOT NULL,
  `lastseen` int(11) NOT NULL,
  `ip` varchar(30) NOT NULL,
  PRIMARY KEY (`steamid`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `ba_iplog`
--

INSERT INTO `ba_iplog` (`steamid`, `lastseen`, `ip`) VALUES
(76561198352973841, 1487607233, '192.168.1.3'),
(76561198107751293, 1487528497, '192.168.1.3'),
(76561198352973841, 1487350477, '192.168.1.7'),
(76561198107751293, 1488052015, '192.168.1.4'),
(76561198797549224, 1685255885, '26.119.150.248'),
(76561198797549224, 1696861944, '26.146.253.142');

-- --------------------------------------------------------

--
-- Структура таблицы `ba_keys`
--

DROP TABLE IF EXISTS `ba_keys`;
CREATE TABLE IF NOT EXISTS `ba_keys` (
  `Date` int(11) NOT NULL,
  `Key` varchar(64) NOT NULL,
  PRIMARY KEY (`Date`,`Key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `ba_ranks`
--

DROP TABLE IF EXISTS `ba_ranks`;
CREATE TABLE IF NOT EXISTS `ba_ranks` (
  `steamid` bigint(20) NOT NULL,
  `sv_id` varchar(50) NOT NULL,
  `rank` tinyint(4) NOT NULL,
  `expire_rank` tinyint(4) NOT NULL,
  `expire_time` int(11) NOT NULL,
  PRIMARY KEY (`sv_id`,`steamid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `ba_ranks`
--

INSERT INTO `ba_ranks` (`steamid`, `sv_id`, `rank`, `expire_rank`, `expire_time`) VALUES
(76561198352973841, 'NO_ID', 10, 10, 0),
(76561198107751293, 'NO_ID', 10, 10, 0),
(76561198797549224, 'NO_ID', 10, 10, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ba_server_vars`
--

DROP TABLE IF EXISTS `ba_server_vars`;
CREATE TABLE IF NOT EXISTS `ba_server_vars` (
  `sv_uid` bigint(20) NOT NULL,
  `var` varchar(50) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`sv_uid`,`var`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `ba_server_vars`
--

INSERT INTO `ba_server_vars` (`sv_uid`, `var`, `data`) VALUES
(2352613305, 'jailroom', '{v-4151.0732421875,4882.0112304688,2624.03125;}'),
(2352613305, 'adminroom', '{v1540.3800048828,-2720.8098144531,-97.425491333008;~}'),
(2352613305, 'sv_id', 'RP'),
(2352613305, 'motd', 'vk.com/awesomiumrp');

-- --------------------------------------------------------

--
-- Структура таблицы `ba_users`
--

DROP TABLE IF EXISTS `ba_users`;
CREATE TABLE IF NOT EXISTS `ba_users` (
  `steamid` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `firstjoined` int(11) DEFAULT NULL,
  `lastseen` int(11) NOT NULL,
  `playtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`steamid`),
  KEY `steamid` (`steamid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `ba_users`
--

INSERT INTO `ba_users` (`steamid`, `name`, `firstjoined`, `lastseen`, `playtime`) VALUES
(76561198352973841, 'Kerr//I\'m busy', 1485530512, 1487607633, 23458),
(76561198107751293, 'MrKuBu', 1485618479, 1488054113, 176337),
(76561198797549224, '-Spac3', 1685164707, 1696861944, 39639214);

-- --------------------------------------------------------

--
-- Структура таблицы `custom_playtime`
--

DROP TABLE IF EXISTS `custom_playtime`;
CREATE TABLE IF NOT EXISTS `custom_playtime` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `steamid` bigint(20) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`,`steamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `steamgroupawards`
--

DROP TABLE IF EXISTS `steamgroupawards`;
CREATE TABLE IF NOT EXISTS `steamgroupawards` (
  `SteamID64` bigint(20) DEFAULT NULL,
  `InSteamGroup` tinyint(1) DEFAULT '1',
  `AwardGiven` tinyint(1) DEFAULT '0',
  `NextAskTime` bigint(20) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
