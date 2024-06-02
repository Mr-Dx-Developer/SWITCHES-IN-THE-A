CREATE TABLE IF NOT EXISTS `jobs_garages` (
	`vehicle_id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`marker_id` INT(11) NOT NULL,
	`vehicle` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_bin',
	`vehicle_props` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`plate` VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`vehicle_id`) USING BTREE,
	INDEX `identifier` (`identifier`, `marker_id`) USING BTREE
);