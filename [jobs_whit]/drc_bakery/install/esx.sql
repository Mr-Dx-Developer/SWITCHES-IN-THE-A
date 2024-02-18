INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('americano', 'Americano', 1, 0, 1),
('apple_pie', 'Apple Pie', 1, 0, 1),
('apple_pie_dough', 'Apple Pie Dough', 1, 0, 1),
('apples', 'Apples', 1, 0, 1),
('blackberry', 'Blackberry', 1, 0, 1),
('blackberry_muffin', 'Blackberry Muffin', 1, 0, 1),
('breadcrumbs', 'Breadcrumbs', 1, 0, 1),
('butter', 'Butter', 1, 0, 1),
('classic_donut', 'Classic Donut', 1, 0, 1),
('coffee', 'Coffee', 1, 0, 1),
('coffee_beans', 'Coffee Beans', 1, 0, 1),
('coffee_crema', 'Coffee Crema', 1, 0, 1),
('coffee_cup', 'Coffee Cup', 1, 0, 1),
('coffee_cup_dirty', 'Coffee Cup Dirty', 1, 0, 1),
('cookies', 'Cookies', 1, 0, 1),
('cumin', 'Cumin', 1, 0, 1),
('cup', 'Cup', 1, 0, 1),
('czech_bread', 'Czech Bread', 1, 0, 1),
('dough', 'Dough', 1, 0, 1),
('eggs', 'Eggs', 1, 0, 1),
('espresso', 'Espresso', 1, 0, 1),
('flour', 'Flour', 1, 0, 1),
('grated_chocolate', 'Grated Chocolate', 1, 0, 1),
('grater', 'Grater', 1, 0, 1),
('green_tea', 'Green Tea', 1, 0, 1),
('green_tea_box', 'Green Tea Box', 1, 0, 1),
('hersheys', 'Hersheys', 1, 0, 1),
('chocolate', 'Chocolate', 1, 0, 1),
('chocolate_coffee', 'Chocolate Coffee', 1, 0, 1),
('chocolate_croissant', 'Chocolate Croissant', 1, 0, 1),
('chocolate_donut', 'Chocolate Donut', 1, 0, 1),
('chocolate_muffin', 'Chocolate Muffin', 1, 0, 1),
('chocolate_topping', 'Chocolate Topping', 1, 0, 1),
('lemon', 'Lemon', 1, 0, 1),
('lemon_crushedice', 'Lemon Crushedice', 1, 0, 1),
('liquid_dough', 'Liquid Dough', 1, 0, 1),
('milk', 'Milk', 1, 0, 1),
('muffin', 'Muffin', 1, 0, 1),
('muffin_tin', 'Muffin Tin', 1, 0, 1),
('muffin_tin_filled', 'Muffin Tin Filled', 1, 0, 1),
('multivitamin_crushedice', 'Multivitamin Crushedice', 1, 0, 1),
('oil', 'Oil', 1, 0, 1),
('pink_donut', 'Pink Donut', 1, 0, 1),
('pink_topping', 'Pink Topping', 1, 0, 1),
('plum', 'Plum', 1, 0, 1),
('regular_muffin', 'Regular Muffin', 1, 0, 1),
('shortcake', 'Shortcake', 1, 0, 1),
('shortcake_dough', 'Shortcake Dough', 1, 0, 1),
('shortcake_plum', 'Shortcake Plum', 1, 0, 1),
('strawberry', 'Strawberry', 1, 0, 1),
('strawberry_shortcake', 'Strawberry Shortcake', 1, 0, 1),
('sugar', 'Sugar', 1, 0, 1),
('unbaked_croissant_chocolate', 'Unbaked Croissant Chocolate', 1, 0, 1),
('unbaked_donut', 'Unbaked Donut', 1, 0, 1),
('vanilla_sugar', 'Vanilla Sugar', 1, 0, 1),
('yeast_cube', 'Yeast Cube', 1, 0, 1);


INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_bakery', 'Trey Bakery', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_bakery', 'Trey Bakery', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_bakery', 'Trey Bakery', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('bakery', 'Trey Bakery')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('bakery',0,'recruit','Recruit',120,'{}','{}'),
	('bakery',1,'novice','Novice',240,'{}','{}'),
	('bakery',2,'experienced','Experienced',360,'{}','{}'),
	('bakery',3,'advanced',"Advanced",480,'{}','{}'),
	('bakery',4,'manager',"Manager",480,'{}','{}'),
	('bakery',5,'boss','Boss',500,'{}','{}')
;
