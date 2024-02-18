ALTER TABLE `owned_vehicles`
ADD COLUMN `nosColour` TEXT NULL DEFAULT NULL;
ALTER TABLE `owned_vehicles`
ADD COLUMN `traveldistance` INT(50) NULL DEFAULT 0;
ALTER TABLE `owned_vehicles`
ADD COLUMN `status`text DEFAULT NULL;
ALTER TABLE `owned_vehicles`
ADD COLUMN `noslevel` INT(10) NULL DEFAULT 0;
ALTER TABLE `owned_vehicles`
ADD COLUMN `hasnitro` TINYINT(0) NULL DEFAULT 0;