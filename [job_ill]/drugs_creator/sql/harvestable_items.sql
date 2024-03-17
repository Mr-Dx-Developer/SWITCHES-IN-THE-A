CREATE TABLE IF NOT EXISTS `harvestable_items` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`time_to_harvest` INT(11) NOT NULL,
	`min_quantity` INT(11) NOT NULL,
	`max_quantity` INT(11) NOT NULL,
	`icon_type` INT(11) NOT NULL,
	`coords` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`scale` LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`bounce` INT(11) NOT NULL DEFAULT '0',
	`follow_camera` INT(11) NOT NULL DEFAULT '0',
	`rotate` INT(11) NOT NULL DEFAULT '0',
	`color` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
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
