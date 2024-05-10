CREATE TABLE IF NOT EXISTS `laboratories` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`coords` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`allowed_recipes` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`allowed_jobs` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`icon_type` INT(11) NOT NULL,
	`scale` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`bounce` INT(11) NOT NULL DEFAULT '0',
	`follow_camera` INT(11) NOT NULL DEFAULT '0',
	`rotate` INT(11) NOT NULL DEFAULT '0',
	`color` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	`opacity` INT(11) NOT NULL DEFAULT '0',
	`blip_name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`blip_sprite` INT(11) NULL DEFAULT NULL,
	`blip_color` INT(11) NULL DEFAULT NULL,
	`blip_scale` FLOAT NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id` (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
