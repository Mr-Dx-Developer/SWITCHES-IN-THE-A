/*
	Only for ESX with "limit" for items
	For QBCore check documentation
*/

INSERT IGNORE `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('fixkit', 'Fix kit', 100, 0, 1),
	('medikit', 'Medikit', 100, 0, 1),
	('sponge', 'Sponge', 100, 0, 1),
	('handcuffs', 'Handcuffs', 100, 0, 1),
	('lockpick', 'Lockpick', 100, 0, 1),
	('bandage', 'Bandage', 100, 0, 1);