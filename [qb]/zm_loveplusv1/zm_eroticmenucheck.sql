CREATE TABLE IF NOT EXISTS `zm_eroticmenucheck` (
  `citizenid` varchar(255) NOT NULL,
  `license` varchar(255) DEFAULT NULL,
  `checked` boolean DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;