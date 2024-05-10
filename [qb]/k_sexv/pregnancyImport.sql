CREATE TABLE `player_pregnant` (
	`citizenid` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`time` INT(11) NOT NULL DEFAULT '0',
	`clothing` TEXT NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`citizenid`) USING BTREE
);
