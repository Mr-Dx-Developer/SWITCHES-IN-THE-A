CREATE TABLE IF NOT EXISTS `paintball_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `readoutfit` text DEFAULT NULL,
  `blueoutfit` text DEFAULT NULL,
  `main` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;