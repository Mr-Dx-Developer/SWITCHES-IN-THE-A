CREATE TABLE `multichars_slots` (
	`identifier` VARCHAR(60) NOT NULL,
	`slots` INT(11) NOT NULL,
	PRIMARY KEY (`identifier`) USING BTREE,
	INDEX `slots` (`slots`) USING BTREE
) ENGINE=InnoDB;

ALTER TABLE `players` ADD COLUMN
	`disabled` TINYINT(1) NULL DEFAULT '0';