CREATE TABLE IF NOT EXISTS `rcore_prison` (
  `prisoner_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(46) DEFAULT NULL,
  `jail_time` datetime DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '[]',
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`prisoner_id`) USING BTREE,
  KEY `owner` (`owner`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

CREATE TABLE IF NOT EXISTS `rcore_prison_accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(46) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` bigint(20) DEFAULT 0,
  `giftstate` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`account_id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

CREATE TABLE IF NOT EXISTS `rcore_prison_contacts` (
  `account_id` int(11) DEFAULT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `targetowner` varchar(50) DEFAULT NULL,
  KEY `FK_rcore_prison_contacts_rcore_prison_accounts` (`account_id`),
  CONSTRAINT `FK_rcore_prison_contacts_rcore_prison_accounts` FOREIGN KEY (`account_id`) REFERENCES `rcore_prison_accounts` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE IF NOT EXISTS `rcore_prison_stash` (
  `owner` varchar(255) NOT NULL,
  `stash` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `rcore_prison_transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `transaction_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charid` int(11) DEFAULT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT 0,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`transaction_id`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
