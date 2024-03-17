CREATE TABLE IF NOT EXISTS `crafting_recipes` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`result_items` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`perfect_recipe_reward` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`ingredients` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`time` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id` (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
