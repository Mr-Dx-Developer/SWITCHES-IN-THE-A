-- player_vehicles
ALTER TABLE `player_vehicles` ADD COLUMN IF NOT EXISTS `damage` LONGTEXT DEFAULT '';
ALTER TABLE `player_vehicles` ADD COLUMN IF NOT EXISTS `in_garage` TINYINT(1) DEFAULT '1';
ALTER TABLE `player_vehicles` ADD COLUMN IF NOT EXISTS `garage_id` VARCHAR(255) DEFAULT 'Legion Square';
ALTER TABLE `player_vehicles` ADD COLUMN IF NOT EXISTS `job_vehicle` TINYINT(1) DEFAULT '0';
ALTER TABLE `player_vehicles` ADD COLUMN IF NOT EXISTS `job_vehicle_rank` INT(10) DEFAULT '0'; -- NEW
ALTER TABLE `player_vehicles` ADD COLUMN IF NOT EXISTS `gang_vehicle` TINYINT(1) DEFAULT '0';
ALTER TABLE `player_vehicles` ADD COLUMN IF NOT EXISTS `gang_vehicle_rank` INT(10) DEFAULT '0';
ALTER TABLE `player_vehicles` ADD COLUMN IF NOT EXISTS `impound` INT(10) DEFAULT '0';
ALTER TABLE `player_vehicles` ADD COLUMN IF NOT EXISTS `impound_retrievable` INT(10) DEFAULT '0';
ALTER TABLE `player_vehicles` ADD COLUMN IF NOT EXISTS `impound_data` LONGTEXT DEFAULT '';
ALTER TABLE `player_vehicles` ADD COLUMN IF NOT EXISTS `nickname` VARCHAR(255) DEFAULT '';

-- player_priv_garages
CREATE TABLE IF NOT EXISTS `player_priv_garages` (
	`id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
	`owners` longtext,
	`name` VARCHAR(255),
	`type` VARCHAR(50),
	`x` FLOAT,
	`y` FLOAT,
	`z` FLOAT,
	`h` FLOAT,
	`distance` INT(11) DEFAULT '10',
	PRIMARY KEY (`id`)
);