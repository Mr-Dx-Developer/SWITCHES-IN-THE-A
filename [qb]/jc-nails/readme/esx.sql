INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_nail', 'nail', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_nail', 'nail', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_nail', 'nail', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
	('nail','Nails Shop', 1)
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('nail', 0, 'employed', 'Employed', 100, '{}', '{}'),
('nail', 1, 'submanager', 'Submanager', 100, '{}', '{}'),
('nail', 2, 'manager', 'Manager', 100, '{}', '{}'),
('nail', 3, 'boss', 'Boss', 100, '{}', '{}');
