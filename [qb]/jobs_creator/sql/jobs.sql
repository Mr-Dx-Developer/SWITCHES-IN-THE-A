CREATE TABLE IF NOT EXISTS `jobs` (
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`label` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`whitelisted` INT(1) NOT NULL DEFAULT '0',
	`enable_billing` INT(1) NULL DEFAULT '0',
	`can_rob` INT(1) NULL DEFAULT '0',
	`can_handcuff` INT(1) NULL DEFAULT '0',
	`can_lockpick_cars` INT(1) NULL DEFAULT '0',
	`can_wash_vehicles` INT(1) NULL DEFAULT '0',
	`can_repair_vehicles` INT(1) NULL DEFAULT '0',
	`can_impound_vehicles` INT(1) NULL DEFAULT '0',
	`can_check_identity` INT(1) NULL DEFAULT '0',
	`can_check_vehicle_owner` INT(1) NULL DEFAULT '0',
	`can_check_driving_license` INT(1) NULL DEFAULT '0',
	`can_check_weapon_license` INT(1) NULL DEFAULT '0',
	`can_heal` INT(1) NULL DEFAULT '0',
	`can_revive` INT(1) NULL DEFAULT '0',
	`actions_menu_enabled` INT(1) NULL DEFAULT '1',
	`placeable_objects` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	PRIMARY KEY (`name`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
