CREATE TABLE IF NOT EXISTS `spawnbookmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `location` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
