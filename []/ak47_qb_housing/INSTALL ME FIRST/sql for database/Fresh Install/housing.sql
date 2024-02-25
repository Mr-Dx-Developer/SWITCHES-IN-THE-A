DROP TABLE IF EXISTS `ak47_qb_housing`;
CREATE TABLE IF NOT EXISTS `ak47_qb_housing` (
  `id` int(11) NOT NULL,
  `owner` varchar(100) COLLATE armscii8_bin DEFAULT NULL,
  `agent` varchar(100) COLLATE armscii8_bin DEFAULT NULL,
  `needagent` tinyint(1) DEFAULT NULL,
  `agentinfo` longtext COLLATE armscii8_bin DEFAULT NULL,
  `access` longtext COLLATE armscii8_bin DEFAULT NULL,
  `labs` longtext COLLATE armscii8_bin DEFAULT NULL,
  `model` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `polyzone` longtext COLLATE armscii8_bin DEFAULT NULL,
  `position` longtext COLLATE armscii8_bin DEFAULT NULL,
  `enter` longtext COLLATE armscii8_bin DEFAULT NULL,
  `exit` longtext COLLATE armscii8_bin DEFAULT NULL,
  `board` longtext COLLATE armscii8_bin DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `sold` tinyint(1) DEFAULT NULL,
  `interior` tinyint(1) DEFAULT NULL,
  `reseller` varchar(100) COLLATE armscii8_bin DEFAULT NULL,
  `furnitures` longtext COLLATE armscii8_bin DEFAULT NULL,
  `cam` longtext COLLATE armscii8_bin DEFAULT NULL,
  `exterior` longtext COLLATE armscii8_bin DEFAULT NULL,
  `garage` longtext COLLATE armscii8_bin DEFAULT NULL,
  `garagevehicles` longtext COLLATE armscii8_bin DEFAULT NULL,
  `doors` longtext COLLATE armscii8_bin DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `inventory` longtext COLLATE armscii8_bin DEFAULT NULL,
  `rent` longtext COLLATE armscii8_bin DEFAULT NULL,
  `installment` longtext COLLATE armscii8_bin DEFAULT NULL,
  `maxweed` int(11) DEFAULT NULL,
  `shellopened` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;


DROP TABLE IF EXISTS `ak47_qb_housing_commissions`;
CREATE TABLE IF NOT EXISTS `ak47_qb_housing_commissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) COLLATE armscii8_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;
