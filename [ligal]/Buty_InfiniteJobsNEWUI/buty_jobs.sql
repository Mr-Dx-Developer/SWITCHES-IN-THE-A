CREATE TABLE IF NOT EXISTS `buty_jobs` (
  `identifier` varchar(80) DEFAULT NULL,
  `job` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `experience` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;