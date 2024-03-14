INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('condom', 'Condom', 100),
	('levonorgestrel', 'Levonorgestrel', 100),
	('mifepristone', 'Mifepristone', 100),
	('testpack', 'Test Pack', 100),
	('viagra', 'Viagra', 100)
;

CREATE TABLE IF NOT EXISTS `last_pregnant` (
    `identifier` VARCHAR(255),
    `pregnant_time` INT(255),
    `pregnant_estimate` INT(255),
	`pregnant` TINYINT(1) NOT NULL DEFAULT '1',
    PRIMARY KEY (`identifier`)
);

ALTER TABLE `users`
	ADD `diseasesex` VARCHAR(255) NOT NULL DEFAULT 'cured';
;

ALTER TABLE `last_pregnant`
	ADD `dna` VARCHAR(255) NOT NULL DEFAULT 'empty';
;

ALTER TABLE `users`
	ADD `mypartnersex` VARCHAR(255) NOT NULL DEFAULT 'none';
;