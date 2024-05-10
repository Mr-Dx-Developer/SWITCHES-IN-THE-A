CREATE TABLE IF NOT EXISTS `drugs_fields` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`label` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`coords` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`radius` INT(11) NOT NULL,
	`object_model` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`max_objects` INT(11) NOT NULL,
	`items` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`time` INT(11) NOT NULL,
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
