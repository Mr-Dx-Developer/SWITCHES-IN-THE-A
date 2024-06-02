/*
	Only for ESX with "weight" for items
	For QBCore check documentation
*/

INSERT IGNORE `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('fixkit', 'Fix kit', 1, 0, 1),
	('medikit', 'Medikit', 1, 0, 1),
	('sponge', 'Sponge', 1, 0, 1),
	('handcuffs', 'Handcuffs', 1, 0, 1),
	('lockpick', 'Lockpick', 1, 0, 1),
	('bandage', 'Bandage', 1, 0, 1);