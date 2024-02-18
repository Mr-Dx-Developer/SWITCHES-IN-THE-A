DELETE FROM items WHERE name = 'burncream';
DELETE FROM items WHERE name = 'defib';
DELETE FROM items WHERE name = 'icepack';
DELETE FROM items WHERE name = 'medbag';
DELETE FROM items WHERE name = 'medikit';
DELETE FROM items WHERE name = 'sedative';
DELETE FROM items WHERE name = 'suturekit';
DELETE FROM items WHERE name = 'tweezers';
DELETE FROM items WHERE name = 'morphine30';
DELETE FROM items WHERE name = 'morphine15';
DELETE FROM items WHERE name = 'perc30';
DELETE FROM items WHERE name = 'perc10';
DELETE FROM items WHERE name = 'perc5';
DELETE FROM items WHERE name = 'vic10';
DELETE FROM items WHERE name = 'vic5';


INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('burncream', 'Burn Cream', 1),
	('defib', 'Defibrillator', 1),
	('icepack', 'Ice Pack', 1),
	('medbag', 'Medical Bag', 1),
	('medikit', 'Medkit', 1),
	('sedative', 'Sedative', 1),
	('suturekit', 'Suture Kit', 1),
	('tweezers', 'Tweezers', 1),
	('morphine30', 'Morphine 30MG', 1),
	('morphine15', 'Morphine 15MG', 1),
	('perc30', 'Percocet 30MG', 1),
	('perc10', 'Percocet 10MG', 1),
	('perc5', 'Percocet 5MG', 1),
	('vic10', 'Vicodin 10MG', 1),
	('vic5', 'Vicodin 5MG', 1)
;