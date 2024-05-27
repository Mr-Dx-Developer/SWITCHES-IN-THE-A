CREATE TABLE IF NOT EXISTS `metal_detecting` (
  `player_identifier` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `experience` int(11) NOT NULL,
  `items_found` int(11) NOT NULL,
  `money_earned` int(11) NOT NULL,
  PRIMARY KEY (`player_identifier`)
);
