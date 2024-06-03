CREATE TABLE IF NOT EXISTS `luxuadmin_misc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uuid` (`uuid`),
  KEY `int` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE IF NOT EXISTS `luxu_banlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `givenby` varchar(255) NOT NULL,
  `expiration` int(10) unsigned NOT NULL DEFAULT 0,
  `date` int(10) unsigned NOT NULL DEFAULT 0,
  `identifiers` longtext NOT NULL,
  `hwids` longtext DEFAULT NULL,
  `uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE IF NOT EXISTS `luxu_warnings` (
  `key` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `identifier` (`identifier`),
  KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

