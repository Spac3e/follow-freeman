-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 28 2023 г., 07:12
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
-- База данных: `rp_stats`
--

-- --------------------------------------------------------

--
-- Структура таблицы `capture_conjunctions`
--

DROP TABLE IF EXISTS `capture_conjunctions`;
CREATE TABLE IF NOT EXISTS `capture_conjunctions` (
  `alliance1` text,
  `alliance2` text,
  `state` varchar(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `capture_conjunctions`
--

INSERT INTO `capture_conjunctions` (`alliance1`, `alliance2`, `state`) VALUES
('Aliance', 'Sunrise', '1'),
('Aliance', 'Legion', '1'),
('Bandits', 'Zombie', '0'),
('Bandits', 'Swat', '2'),
('Bandits', 'Sunrise', '1'),
('Bandits', 'Legion', '0'),
('Zombie', 'Swat', '0'),
('Zombie', 'Sunrise', '1'),
('Zombie', 'Legion', '0'),
('Aliance', 'Swat', '1'),
('Aliance', 'Zombie', '0'),
('Aliance', 'Bandits', '1'),
('Swat', 'Sunrise', '0'),
('Swat', 'Legion', '0'),
('Sunrise', 'Legion', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `capture_data`
--

DROP TABLE IF EXISTS `capture_data`;
CREATE TABLE IF NOT EXISTS `capture_data` (
  `Owner` varchar(64) DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `capture_data`
--

INSERT INTO `capture_data` (`Owner`, `Name`) VALUES
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Zombie'),
('27015_rp_city17_urfim_d4k', 'Zombie'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Sunrise'),
('27015_rp_city17_urfim_d4k', 'Legion'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Bandits'),
('27015_rp_city17_urfim_d4k', 'Legion'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d4k', 'Zombie'),
('27015_rp_city17_urfim_d6', 'Bandits'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Aliance'),
('27015_rp_city17_urfim_d4k', 'Sunrise'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Legion'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d4k', 'Aliance'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Legion'),
('27015_rp_city17_urfim_d4k', 'Swat'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Aliance'),
('27015_rp_city17_urfim_d4k', 'Aliance'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Legion'),
('27015_rp_city17_urfim_d4k', 'Legion'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Swat'),
('27015_rp_city17_urfim_d4k', 'Zombie'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Sunrise'),
('27015_rp_city17_urfim_d4k', 'Sunrise'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Bandits'),
('27015_rp_city17_urfim_d4k', 'Sunrise'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Sunrise'),
('27015_rp_city17_urfim_d4k', 'Sunrise'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Zombie'),
('27015_rp_city17_urfim_d4k', 'Zombie'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d4k', 'Zombie'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Bandits'),
('27015_rp_city17_urfim_d4k', 'Sunrise'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Aliance'),
('27015_rp_city17_urfim_d4k', 'Sunrise'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Legion'),
('27015_rp_city17_urfim_d4k', 'Swat'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Sunrise'),
('27015_rp_city17_urfim_d4k', 'Legion'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Sunrise'),
('27015_rp_city17_urfim_d4k', 'Bandits'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Sunrise'),
('27015_rp_city17_urfim_d4k', 'Bandits'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Aliance'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d4k', 'Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Aliance'),
('27015_rp_city17_urfim_d4k', 'Zombie'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Bandits'),
('27015_rp_city17_urfim_d4k', 'Legion'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Sunrise'),
('27015_rp_city17_urfim_d4k', 'Aliance'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Bandits'),
('27015_rp_city17_urfim_d4k', 'Bandits'),
('27015_rp_city17_urfim_basement_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_streetcapt_org', 'Sons of Sunrise'),
('27015_rp_city17_urfim_d6', 'Bandits'),
('27015_rp_city17_urfim_d4k', 'Legion');

-- --------------------------------------------------------

--
-- Структура таблицы `custom_playtime`
--

DROP TABLE IF EXISTS `custom_playtime`;
CREATE TABLE IF NOT EXISTS `custom_playtime` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `steamid` bigint(20) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `custom_playtime`
--

INSERT INTO `custom_playtime` (`id`, `steamid`, `time`) VALUES
('QEntities', 76561198797549224, 39627251);

-- --------------------------------------------------------

--
-- Структура таблицы `global_chat`
--

DROP TABLE IF EXISTS `global_chat`;
CREATE TABLE IF NOT EXISTS `global_chat` (
  `Server` varchar(50) NOT NULL,
  `Color` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `job_recovery`
--

DROP TABLE IF EXISTS `job_recovery`;
CREATE TABLE IF NOT EXISTS `job_recovery` (
  `steamid` bigint(20) NOT NULL,
  `job` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `mdldata` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`steamid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `job_whitelist`
--

DROP TABLE IF EXISTS `job_whitelist`;
CREATE TABLE IF NOT EXISTS `job_whitelist` (
  `steamid` bigint(30) NOT NULL,
  `job_id` varchar(32) NOT NULL,
  PRIMARY KEY (`steamid`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `orgs`
--

DROP TABLE IF EXISTS `orgs`;
CREATE TABLE IF NOT EXISTS `orgs` (
  `Owner` bigint(20) NOT NULL,
  `Name` text CHARACTER SET utf8 NOT NULL,
  `Color` char(9) CHARACTER SET utf8 NOT NULL,
  `MoTD` text CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `orgs`
--

INSERT INTO `orgs` (`Owner`, `Name`, `Color`, `MoTD`) VALUES
(76561198797549224, 'Sons of Sunrise', '#13E5ED', 'Welcome to Sons of Sunrise!');

-- --------------------------------------------------------

--
-- Структура таблицы `org_banner`
--

DROP TABLE IF EXISTS `org_banner`;
CREATE TABLE IF NOT EXISTS `org_banner` (
  `Org` varchar(80) NOT NULL,
  `Time` bigint(20) DEFAULT NULL,
  `Data` text,
  PRIMARY KEY (`Org`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `org_player`
--

DROP TABLE IF EXISTS `org_player`;
CREATE TABLE IF NOT EXISTS `org_player` (
  `SteamID` bigint(20) NOT NULL,
  `Org` text CHARACTER SET utf8 NOT NULL,
  `Rank` text CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `org_player`
--

INSERT INTO `org_player` (`SteamID`, `Org`, `Rank`) VALUES
(76561198797549224, 'Sons of Sunrise', 'Owner');

-- --------------------------------------------------------

--
-- Структура таблицы `org_rank`
--

DROP TABLE IF EXISTS `org_rank`;
CREATE TABLE IF NOT EXISTS `org_rank` (
  `Org` text CHARACTER SET utf8 NOT NULL,
  `RankName` text CHARACTER SET utf8 NOT NULL,
  `Weight` int(11) NOT NULL,
  `Invite` tinyint(1) NOT NULL,
  `Kick` tinyint(1) NOT NULL,
  `Rank` tinyint(1) NOT NULL,
  `MoTD` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `org_rank`
--

INSERT INTO `org_rank` (`Org`, `RankName`, `Weight`, `Invite`, `Kick`, `Rank`, `MoTD`) VALUES
('Sons of Sunrise', 'Member', 1, 0, 0, 0, 0),
('Sons of Sunrise', 'Owner', 100, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `players_online`
--

DROP TABLE IF EXISTS `players_online`;
CREATE TABLE IF NOT EXISTS `players_online` (
  `steamid` bigint(20) NOT NULL,
  `server_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`steamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `players_online`
--

INSERT INTO `players_online` (`steamid`, `server_id`) VALUES
(76561198797549224, 'hl2_alyx');

-- --------------------------------------------------------

--
-- Структура таблицы `player_cooldowns`
--

DROP TABLE IF EXISTS `player_cooldowns`;
CREATE TABLE IF NOT EXISTS `player_cooldowns` (
  `SteamID` bigint(30) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Cooldown` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `player_cooldowns`
--

INSERT INTO `player_cooldowns` (`SteamID`, `Name`, `Cooldown`) VALUES
(76561198797549224, 'Money', 1685317196),
(76561198797549224, 'Time', 1685320797),
(76561198797549224, 'Armor', 1685264999),
(76561198797549224, 'Event', 1685860800),
(76561198797549224, 'Gun', 1685382002);

-- --------------------------------------------------------

--
-- Структура таблицы `player_data`
--

DROP TABLE IF EXISTS `player_data`;
CREATE TABLE IF NOT EXISTS `player_data` (
  `SteamID` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Money` int(11) NOT NULL,
  `Karma` int(11) NOT NULL,
  `Pocket` text NOT NULL,
  `Unlocked` varchar(526) DEFAULT NULL,
  PRIMARY KEY (`SteamID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `player_data`
--

INSERT INTO `player_data` (`SteamID`, `Name`, `Money`, `Karma`, `Pocket`, `Unlocked`) VALUES
(76561198797549224, 'Tany Ruis', 14032, 50, '{[\'weaponclass;\'swb_shotgun;\'Model;\'models/weapons/w_shotgun.mdl;\'Class;\'spawned_weapon;}}', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `player_emoji`
--

DROP TABLE IF EXISTS `player_emoji`;
CREATE TABLE IF NOT EXISTS `player_emoji` (
  `steamid` bigint(20) NOT NULL,
  `emoji_id` text NOT NULL,
  PRIMARY KEY (`steamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `player_hats`
--

DROP TABLE IF EXISTS `player_hats`;
CREATE TABLE IF NOT EXISTS `player_hats` (
  `SteamID` bigint(20) NOT NULL,
  `Model` varchar(255) NOT NULL,
  `Active` tinyint(4) NOT NULL,
  PRIMARY KEY (`SteamID`,`Model`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pp_blockedtools`
--

DROP TABLE IF EXISTS `pp_blockedtools`;
CREATE TABLE IF NOT EXISTS `pp_blockedtools` (
  `Tool` varchar(50) NOT NULL,
  `Rank` int(11) NOT NULL,
  PRIMARY KEY (`Tool`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pp_whitelist`
--

DROP TABLE IF EXISTS `pp_whitelist`;
CREATE TABLE IF NOT EXISTS `pp_whitelist` (
  `Model` varchar(255) NOT NULL,
  PRIMARY KEY (`Model`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rp_doordata`
--

DROP TABLE IF EXISTS `rp_doordata`;
CREATE TABLE IF NOT EXISTS `rp_doordata` (
  `Index` int(11) NOT NULL,
  `Map` varchar(50) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Team` varchar(50) DEFAULT NULL,
  `Group` varchar(50) DEFAULT NULL,
  `Ownable` int(1) DEFAULT NULL,
  `Locked` int(1) DEFAULT NULL,
  PRIMARY KEY (`Index`,`Map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rp_jobspawn`
--

DROP TABLE IF EXISTS `rp_jobspawn`;
CREATE TABLE IF NOT EXISTS `rp_jobspawn` (
  `id` int(11) NOT NULL,
  `job` char(30) NOT NULL,
  `map` varchar(45) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `z` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `saved_timemultipliers`
--

DROP TABLE IF EXISTS `saved_timemultipliers`;
CREATE TABLE IF NOT EXISTS `saved_timemultipliers` (
  `steamid` bigint(20) NOT NULL,
  `id` varchar(20) NOT NULL,
  `value` int(16) NOT NULL,
  `until` int(12) NOT NULL,
  PRIMARY KEY (`steamid`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
