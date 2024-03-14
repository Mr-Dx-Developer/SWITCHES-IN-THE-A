CREATE TABLE IF NOT EXISTS `last_pregnant` (
    `identifier` VARCHAR(255),
    `pregnant_time` INT(255),
    `pregnant_estimate` INT(255),
	`pregnant` TINYINT(1) NOT NULL DEFAULT '1',
    PRIMARY KEY (`identifier`)
);

ALTER TABLE `players`
	ADD `diseasesex` VARCHAR(255) NOT NULL DEFAULT 'cured';
;

ALTER TABLE `last_pregnant`
	ADD `dna` VARCHAR(255) NOT NULL DEFAULT 'empty';
;

ALTER TABLE `players`
	ADD `mypartnersex` VARCHAR(255) NOT NULL DEFAULT 'none';