CREATE TABLE IF NOT EXISTS `jobs_armories` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`weapon` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`components` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`ammo` INT(10) UNSIGNED NOT NULL,
	`tint` INT(11) NOT NULL,
	`marker_id` INT(11) NOT NULL,
	`identifier` VARCHAR(80) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id` (`id`, `marker_id`, `identifier`) USING BTREE
);