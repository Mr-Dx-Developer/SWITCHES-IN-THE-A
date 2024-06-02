CREATE TABLE IF NOT EXISTS `jobs_shops` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`marker_id` INT(11) NOT NULL,
	`item_name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`item_type` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`item_quantity` INT(11) NOT NULL,
	`price` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `marker_id` (`marker_id`) USING BTREE,
	INDEX `id` (`id`) USING BTREE
);