CREATE TABLE IF NOT EXISTS `jobs_data` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`job_name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`type` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`coords` VARCHAR(300) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',

	`grades_type` VARCHAR(20) DEFAULT NULL,
	`specific_grades` VARCHAR(255) DEFAULT NULL,
	`min_grade` SMALLINT(6) NULL DEFAULT NULL,

	`data` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',

	`blip_id` INT(11) NULL DEFAULT NULL,
	`blip_color` INT(11) NULL DEFAULT '0',
	`blip_scale` FLOAT(12) NULL DEFAULT '1',

	`label` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',

	`marker_type` INT(11) NULL DEFAULT '1',

	`marker_scale_x` FLOAT(12) NULL DEFAULT '1.5',
	`marker_scale_y` FLOAT(12) NULL DEFAULT '1.5',
	`marker_scale_z` FLOAT(12) NULL DEFAULT '0.5',

	`marker_color_red` INT(3) NULL DEFAULT '150',
	`marker_color_green` INT(3) NULL DEFAULT '150',
	`marker_color_blue` INT(3) NULL DEFAULT '0',
	`marker_color_alpha` INT(3) NULL DEFAULT '50',

	`ped` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`ped_heading` FLOAT(12) NULL DEFAULT NULL,
	
	`object` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`object_pitch` FLOAT(12) NULL DEFAULT NULL,
	`object_roll` FLOAT(12) NULL DEFAULT NULL,
	`object_yaw` FLOAT(12) NULL DEFAULT NULL,

	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id` (`id`) USING BTREE
);