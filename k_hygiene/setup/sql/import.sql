CREATE TABLE `player_hygiene` (
	`citizenid` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`hygiene` TEXT NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`citizenid`) USING BTREE
);