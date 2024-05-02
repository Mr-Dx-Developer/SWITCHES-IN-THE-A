INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('tvremote', 'TV Remote', 1, 0, 1),
	('vehicletv', 'Vehicle TV', 1, 0, 1);
	
ALTER TABLE `owned_vehicles`
	ADD `vehicletv` TINYINT(1) NULL DEFAULT '0'
;	