CREATE TABLE IF NOT EXISTS `boss_menus` (
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `settings` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_salon', 'Salon', 1)
;

INSERT INTO `addon_account_data` (account_name, money, owner) VALUES
	('society_salon', 10000, '')
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_salon', 'Salon', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    ('society_salon', 'Salon', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
	('salon', 'Salon', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('salon', 0, 'beautician', 'Beautician', 300, '{}', '{}'),
	('salon', 1, 'boss', 'Boss', 600, '{}', '{}')
;

DELETE FROM `items` WHERE `name`='blonde_bundles';
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('fmdblonde_bundles', 'Blonde Bundles', 5, 0, 1);
DELETE FROM `items` WHERE `name`='blonde_bundlesbox';
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('fmdblonde_bundlesbox', 'Box Blonde Bundles', 5, 0, 1);
DELETE FROM `items` WHERE `name`='blonde_hair';
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('fmdblonde_hair', 'Blonde Dye', 5, 0, 1);
DELETE FROM `items` WHERE `name`='pinkremy_box';
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('fmdccpink_bundlesbox', 'Boxed Pink Remy Bundles', 5, 0, 1);
DELETE FROM `items` WHERE `name`='pinkremy_bundles';
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('fmdccpink_bundles', 'Pink Remy Bundles', 5, 0, 1);
DELETE FROM `items` WHERE `name`='pinkremy_hair';
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('fmdccpink_hair', 'Pink Remy Dye', 5, 0, 1);
DELETE FROM `items` WHERE `name`='red_bodywave';
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('fmdred_bodywave', 'Red Bodywave', 5, 0, 1);
DELETE FROM `items` WHERE `name`='red_bodywavebox';
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('fmdred_bodywavebox', 'Boxed Red Bodywave', 5, 0, 1);
DELETE FROM `items` WHERE `name`='red_hair';
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('fmdred_hair', 'Red Dye', 5, 0, 1);
DELETE FROM `items` WHERE `name`='wrapper';
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('fmdwrapper', 'Bundle Boxes', 5, 0, 1);

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('fmdbbrown_hair', '4-27 dye', 1),
	('fmdauburn_hair', 'Auburn dye', 1),
	('fmdblack_hair', 'Black dye', 1),
	('fmdbrown_hair', 'Brown dye', 1),
	('fmdplatinum_hair', 'Platinum dye', 1),
	('fmdccblue_hair', 'Cotton Candy Blue dye', 1),
	('fmdlime_hair', 'Lime Green dye', 1),
	('fmdpurple_hair', 'Purple dye', 1),
	('fmdmidb_hair', 'Midnight Blue dye', 1),
	('fmdkblack_hair', 'Curly Black dye', 1),
	('fmdkblonde_hair', 'Curly Blonde dye', 1),
	('fmdkblue_hair', 'Curly Blue dye', 1),

	('fmdbbrown_bundles', '4-27 bundles', 1),
	('fmdauburn_bundles', 'Auburn bundles', 1),
	('fmdblack_bundles', 'Black bundles', 1),
	('fmdbrown_bundles', 'Brown bundles', 1),
	('fmdplatinum_bundles', 'Platinum bundles', 1),
	('fmdccblue_bundles', 'Cotton Candy Blue bundles', 1),
	('fmdlime_bundles', 'Lime Green bundles', 1),
	('fmdpurple_bundles', 'Purple bundles', 1),
	('fmdmidb_bundles', 'Midnight Blue bundles', 1),
	('fmdkblack_bundles', 'Curly Black bundles', 1),
	('fmdkblonde_bundles', 'Curly Blonde bundles', 1),
	('fmdkblue_bundles', 'Curly Blue bundles', 1),

	('fmdbbrown_bundlesbox', '4-27 boxed bundles', 1),
	('fmdauburn_bundlesbox', 'Auburn boxed bundles', 1),
	('fmdblack_bundlesbox', 'Black boxed bundles', 1),
	('fmdbrown_bundlesbox', 'Brown boxed bundles', 1),
	('fmdplatinum_bundlesbox', 'Platinum boxed bundles', 1),
	('fmdccblue_bundlesbox', 'CC Blue boxed bundles', 1),
	('fmdlime_bundlesbox', 'Lime Green boxed bundles', 1),
	('fmdpurple_bundlesbox', 'Purple boxed bundles', 1),
	('fmdmidb_bundlesbox', 'Midnight Blue boxed bundles', 1),
	('fmdkblack_bundlesbox', 'Curly Black boxed bundles', 1),
	('fmdkblonde_bundlesbox', 'Curly Blonde boxed bundles', 1),
	('fmdkblue_bundlesbox', 'Curly Blue boxes bundles', 1)
	
;