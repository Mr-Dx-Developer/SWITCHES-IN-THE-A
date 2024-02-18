OX INSTALL QUIDE

1. Download all dependencies!
    Dependencies:
    ox_lib | https://github.com/overextended/ox_lib/releases/latest
    es_extended / qb-core
    qtarget / qb-target
    ox_inventory / qb-inventory

2. Add Images to your inventory
	ox_inventory > web > build > images
	Paste images from folder images to ox_inventory > web > build > img

3. Add Items to your inventory
	ox_inventory > data> items.lua

['americano'] = {
	label = 'Americano',
	weight = 10,
	stack = true,
	close = true,
},
['apple_pie'] = {
	label = 'Apple Pie',
	weight = 10,
	stack = true,
	close = true,
},
['apple_pie_dough'] = {
	label = 'Apple Pie Dough',
	weight = 10,
	stack = true,
	close = true,
},
['apples'] = {
	label = 'Apples',
	weight = 10,
	stack = true,
	close = true,
},
['blackberry'] = {
	label = 'Blackberry',
	weight = 10,
	stack = true,
	close = true,
},
['blackberry_muffin'] = {
	label = 'Blackberry Muffin',
	weight = 10,
	stack = true,
	close = true,
},
['breadcrumbs'] = {
	label = 'Breadcrumbs',
	weight = 10,
	stack = true,
	close = true,
},
['butter'] = {
	label = 'Butter',
	weight = 10,
	stack = true,
	close = true,
},
['classic_donut'] = {
	label = 'Classic Donut',
	weight = 10,
	stack = true,
	close = true,
},
['coffee'] = {
	label = 'Coffee',
	weight = 10,
	stack = true,
	close = true,
},
['coffee_beans'] = {
	label = 'Coffee Beans',
	weight = 10,
	stack = true,
	close = true,
},
['coffee_crema'] = {
	label = 'Coffee Crema',
	weight = 10,
	stack = true,
	close = true,
},
['coffee_cup'] = {
	label = 'Coffee Cup',
	weight = 10,
	stack = true,
	close = true,
},
['coffee_cup_dirty'] = {
	label = 'Coffee Cup Dirty',
	weight = 10,
	stack = true,
	close = true,
},
['cookies'] = {
	label = 'Cookies',
	weight = 10,
	stack = true,
	close = true,
},
['cumin'] = {
	label = 'Cumin',
	weight = 10,
	stack = true,
	close = true,
},
['cup'] = {
	label = 'Cup',
	weight = 10,
	stack = true,
	close = true,
},
['czech_bread'] = {
	label = 'Czech Bread',
	weight = 10,
	stack = true,
	close = true,
},
['dough'] = {
	label = 'Dough',
	weight = 10,
	stack = true,
	close = true,
},
['eggs'] = {
	label = 'Eggs',
	weight = 10,
	stack = true,
	close = true,
},
['espresso'] = {
	label = 'Espresso',
	weight = 10,
	stack = true,
	close = true,
},
['flour'] = {
	label = 'Flour',
	weight = 10,
	stack = true,
	close = true,
},
['grated_chocolate'] = {
	label = 'Grated Chocolate',
	weight = 10,
	stack = true,
	close = true,
},
['grater'] = {
	label = 'Grater',
	weight = 10,
	stack = true,
	close = true,
},
['green_tea'] = {
	label = 'Green Tea',
	weight = 10,
	stack = true,
	close = true,
},
['green_tea_box'] = {
	label = 'Green Tea Box',
	weight = 10,
	stack = true,
	close = true,
},
['hersheys'] = {
	label = 'Hersheys',
	weight = 10,
	stack = true,
	close = true,
},
['chocolate'] = {
	label = 'Chocolate',
	weight = 10,
	stack = true,
	close = true,
},
['chocolate_coffee'] = {
	label = 'Chocolate Coffee',
	weight = 10,
	stack = true,
	close = true,
},
['chocolate_croissant'] = {
	label = 'Chocolate Croissant',
	weight = 10,
	stack = true,
	close = true,
},
['chocolate_donut'] = {
	label = 'Chocolate Donut',
	weight = 10,
	stack = true,
	close = true,
},
['chocolate_muffin'] = {
	label = 'Chocolate Muffin',
	weight = 10,
	stack = true,
	close = true,
},
['chocolate_topping'] = {
	label = 'Chocolate Topping',
	weight = 10,
	stack = true,
	close = true,
},
['lemon'] = {
	label = 'Lemon',
	weight = 10,
	stack = true,
	close = true,
},
['lemon_crushedice'] = {
	label = 'Lemon Crushedice',
	weight = 10,
	stack = true,
	close = true,
},
['liquid_dough'] = {
	label = 'Liquid Dough',
	weight = 10,
	stack = true,
	close = true,
},
['milk'] = {
	label = 'Milk',
	weight = 10,
	stack = true,
	close = true,
},
['muffin'] = {
	label = 'Muffin',
	weight = 10,
	stack = true,
	close = true,
},
['muffin_tin'] = {
	label = 'Muffin Tin',
	weight = 10,
	stack = true,
	close = true,
},
['muffin_tin_filled'] = {
	label = 'Muffin Tin Filled',
	weight = 10,
	stack = true,
	close = true,
},
['multivitamin_crushedice'] = {
	label = 'Multivitamin Crushedice',
	weight = 10,
	stack = true,
	close = true,
},
['oil'] = {
	label = 'Oil',
	weight = 10,
	stack = true,
	close = true,
},
['pink_donut'] = {
	label = 'Pink Donut',
	weight = 10,
	stack = true,
	close = true,
},
['pink_topping'] = {
	label = 'Pink Topping',
	weight = 10,
	stack = true,
	close = true,
},
['plum'] = {
	label = 'Plum',
	weight = 10,
	stack = true,
	close = true,
},
['regular_muffin'] = {
	label = 'Regular Muffin',
	weight = 10,
	stack = true,
	close = true,
},
['shortcake'] = {
	label = 'Shortcake',
	weight = 10,
	stack = true,
	close = true,
},
['shortcake_dough'] = {
	label = 'Shortcake Dough',
	weight = 10,
	stack = true,
	close = true,
},
['shortcake_plum'] = {
	label = 'Shortcake Plum',
	weight = 10,
	stack = true,
	close = true,
},
['strawberry'] = {
	label = 'Strawberry',
	weight = 10,
	stack = true,
	close = true,
},
['strawberry_shortcake'] = {
	label = 'Strawberry Shortcake',
	weight = 10,
	stack = true,
	close = true,
},
['sugar'] = {
	label = 'Sugar',
	weight = 10,
	stack = true,
	close = true,
},
['unbaked_croissant_chocolate'] = {
	label = 'Unbaked Croissant Chocolate',
	weight = 10,
	stack = true,
	close = true,
},
['unbaked_donut'] = {
	label = 'Unbaked Donut',
	weight = 10,
	stack = true,
	close = true,
},
['vanilla_sugar'] = {
	label = 'Vnilla Sugar',
	weight = 10,
	stack = true,
	close = true,
},
['yeast_cube'] = {
	label = 'Yeast Cube',
	weight = 10,
	stack = true,
	close = true,
},



4. add ensure drc_bakery into your server.cfg (make sure to start it after ox_lib and your target system!)

5. Enjoy your new Trey Bakery JOB script from DRC SCRIPTS!

-- ESX JOB

1. insert into database

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