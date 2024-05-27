CREATE TABLE IF NOT EXISTS `lation_chopshop` (
  `player_identifier` varchar(255) NOT NULL,
  `reputation` int(11) NOT NULL DEFAULT 0,
  `points` int(11) NOT NULL DEFAULT 0,
  `rep_since` int(11) NOT NULL DEFAULT 0,
  `dismantle_lvl` int(11) NOT NULL DEFAULT 0,
  `parts_lvl` int(11) NOT NULL DEFAULT 0,
  `lockpick_lvl` int(11) NOT NULL DEFAULT 0,
  `payout_lvl` int(11) NOT NULL DEFAULT 0,
  `total_chopped` int(11) NOT NULL DEFAULT 0,
  `total_parts` int(11) NOT NULL DEFAULT 0,
  `total_money` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`player_identifier`)
);
