ALTER TABLE `users` ADD COLUMN `warns` INT(11) NOT NULL DEFAULT 0;

CREATE TABLE `team5m_banlist` (
	`name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`admin` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`steam` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`rockstar` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`xbox` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`live` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`discord` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`ip` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`reason` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci'
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
