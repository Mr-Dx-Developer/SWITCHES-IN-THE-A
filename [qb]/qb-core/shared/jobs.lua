QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	unemployed = { label = 'Civilian', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Freelancer', payment = 160 } } },
	bus = { label = 'Bus', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 180 } } },
	judge = { label = 'Honorary', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Judge', payment = 800 } } },
	lawyer = { label = 'Law Firm', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Associate', payment = 175 } } },
	reporter = { label = 'Reporter', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Journalist', payment = 175 } } },
	trucker = { label = 'Trucker', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	tow = { label = 'Towing', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 200 } } },
	garbage = { label = 'Garbage', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Collector', payment = 200 } } },
	vineyard = { label = 'Vineyard', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Picker', payment = 200 } } },
	hotdog = { label = 'Hotdog', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Sales', payment = 200 } } },
	gundealer = { label = 'Gun Dealer', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Recruit', payment = 200 } } },
	fisher = { label = 'Fisher', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Fisher', payment = 200 } } },
	cargo = { label = 'Cargo Delivery', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Cargo Delivery', payment = 200 } } },
	scrap = { label = 'Scrap Miner', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Scrap Miner', payment = 200 } } },


	police = {
		label = 'Law Enforcement',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 800 },
			['1'] = { name = 'Solo Cadet', payment = 800 },
			['2'] = { name = 'Officer', payment = 900 },
			['3'] = { name = 'Senior Officer', payment = 950 },
			['4'] = { name = 'Corporal', payment = 1000 },
			['5'] = { name = 'Sergeant', payment = 1100 },
			['6'] = { name = 'Lieutenant', payment = 1200 },
			['7'] = { name = 'Captain', payment = 1300 },
			['8'] = { name = 'Assistant Chief', isboss = true, payment = 1700 },
			['9'] = { name = 'Chief of Police', isboss = true, payment = 2000 },
		},
	},
	ambulance = {
		label = 'EMS',
		type = 'ems',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Trainee', payment = 350 },
			['1'] = { name = 'EMT', payment = 575 },
			['2'] = { name = 'Therapist', payment = 600 },
			['3'] = { name = 'Nurse', payment = 625 },
			['4'] = { name = 'Surgeon', payment = 750 },
			['5'] = { name = 'Paramedic', payment = 1000 },
			['6'] = { name = 'Lieutenant', payment = 1250 },
			['7'] = { name = 'Captain', payment = 1500 },
			['8'] = { name = 'Assistant Chief', isboss = true, payment = 1150 },
			['9'] = { name = 'Chief of EMS', isboss = true, payment = 2150 },
		},
	},
	
	senator = {
		label = 'Government',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Executive', payment = 250 },
			['1'] = { name = 'Senior Executive', payment = 450 },
			['2'] = { name = 'Public Administrator', payment = 600 },
			['3'] = { name = 'Deputy Senator', payment = 700 },
			['4'] = { name = 'Senator', isboss = true, payment = 1000 },
		},
	},
	limeys = {
		label = 'Limey Juice Shop',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Trainee', payment = 250 },
			['1'] = { name = 'Worker', payment = 450 },
			['2'] = { name = 'manager', payment = 600 },
			['3'] = { name = 'Owner', isboss = true, payment = 1000 },
		},
	},
	cigar = {
		label = 'Cigar Manager',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Sales', payment = 250 },
			['1'] = { name = 'Manager', isboss = true, payment = 1000 },
		},
	},
	thunter = {
		label = 'Treassure Hunter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'TreassureHunter', payment = 250 },
			
		},
	},
	designer = {
		label = 'Designer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			
			['0'] = { name = 'designer', payment = 250 },
			['1'] = { name = 'Shopkeeper', payment = 450 },
			['2'] = { name = 'Shopkeeper', payment = 600 },
			['3'] = { name = 'Manager', payment = 700 },
			['4'] = { name = 'Owner', isboss = true, payment = 1000 },
			
		},
	},
	cookies = {
		label = 'Cookies',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Farmer', payment = 250 },
			['1'] = { name = 'Shopkeeper', payment = 450 },
			['2'] = { name = 'Shopkeeper', payment = 600 },
			['3'] = { name = 'Manager', payment = 700 },
			['4'] = { name = 'Owner', isboss = true, payment = 1000 },
		},
	},
	cannabiscafe = {
		label = 'CannabisCafe',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Farmer', payment = 250 },
			['1'] = { name = 'Shopkeeper', payment = 450 },
			['2'] = { name = 'Shopkeeper', payment = 600 },
			['3'] = { name = 'Manager', payment = 700 },
			['4'] = { name = 'Owner', isboss = true, payment = 1000 },
		},
	},
	realestate = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 250 },
			['1'] = { name = 'House Sales', payment = 450 },
			['2'] = { name = 'Business Sales', payment = 600 },
			['3'] = { name = 'Broker', payment = 700 },
			['4'] = { name = 'Manager', isboss = true, payment = 1470 },
		},
	},
	chickfila = {
		label = 'Chick-fil-A',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 150 },
			['1'] = { name = 'Delivery Driver', payment = 200 },
			['2'] = { name = 'Cook', payment = 300 },
			['3'] = { name = 'Manager', payment = 400 },
			['4'] = { name = 'Owner', isboss = true, payment = 1000 },
		},
	},
	burgershot = {
		label = 'Burgershot',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 150 },
			['1'] = { name = 'Delivery Driver', payment = 200 },
			['2'] = { name = 'Cook', payment = 300 },
			['3'] = { name = 'Manager', payment = 400 },
			['4'] = { name = 'Owner', isboss = true, payment = 1000 },
		},
	},
	dominos = {
		label = 'Dominos',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 200 },
			['1'] = { name = 'Delivery Driver', payment = 150 },
			['2'] = { name = 'Cook', payment = 200 },
			['3'] = { name = 'Manager', payment = 900 },
			['4'] = { name = 'Owner', isboss = true, payment = 1000 },
		},
	},
	dunkin = {
		label = 'Dunkin',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 200 },
			['1'] = { name = 'Delivery Driver', payment = 300 },
			['2'] = { name = 'Cook', payment = 400 },
			['3'] = { name = 'Manager', payment = 500 },
			['4'] = { name = 'Owner', isboss = true, payment = 1000 },
		},
	},
	icebox = {
		label = 'Icebox',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Goldsmith', payment = 900 },
			['1'] = { name = 'Shopkeeper', payment = 1000 },
			['2'] = { name = 'Manager', payment = 1300 },
			['3'] = { name = 'Owner', isboss = true, payment = 1000 },
		},
	},
	mcdonalds = {
		label = 'McDonalds',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 150 },
			['1'] = { name = 'Delivery Driver', payment = 200 },
			['2'] = { name = 'Cook', payment = 300 },
			['3'] = { name = 'Manager', payment = 400 },
			['4'] = { name = 'Owner', isboss = true, payment = 1000 },
		},
	},
	popeyes = {
		label = 'Popeyes',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 150 },
			['1'] = { name = 'Delivery Driver', payment = 300 },
			['2'] = { name = 'Cook', payment = 500 },
			['3'] = { name = 'Manager', payment = 6000 },
			['4'] = { name = 'Owner', isboss = true, payment = 1000 },
		},
	},
	taco = {
		label = 'Taco',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 900 },
			['1'] = { name = 'Delivery Driver', payment = 1000 },
			['2'] = { name = 'Cook', payment = 1200 },
			['3'] = { name = 'Manager', payment = 1300 },
			['4'] = { name = 'Owner', isboss = true, payment = 1400 },
		},
	},
	wingstop = {
		label = 'Wingstop',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 100 },
			['1'] = { name = 'Delivery Driver', payment = 200 },
			['2'] = { name = 'Cook', payment = 300 },
			['3'] = { name = 'Manager', payment = 400 },
			['4'] = { name = 'Owner', isboss = true, payment = 1000 },
		},
	},
	aldentes = {
		label = 'Aldentes',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 900 },
			['1'] = { name = 'Delivery Driver', payment = 1000 },
			['2'] = { name = 'Cook', payment = 1200 },
			['3'] = { name = 'Manager', payment = 1300 },
			['4'] = { name = 'Owner', isboss = true, payment = 1400 },
		},
	},
	cluckinbell = {
		label = 'Cluckinbell',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 900 },
			['1'] = { name = 'Delivery Driver', payment = 1000 },
			['2'] = { name = 'Cook', payment = 1200 },
			['3'] = { name = 'Manager', payment = 1300 },
			['4'] = { name = 'Owner', isboss = true, payment = 1400 },
		},
	},
	craftbar = {
		label = 'Craftbar',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 900 },
			['1'] = { name = 'Delivery Driver', payment = 1000 },
			['2'] = { name = 'Cook', payment = 1200 },
			['3'] = { name = 'Manager', payment = 1300 },
			['4'] = { name = 'Owner', isboss = true, payment = 1400 },
		},
	},
	uwu = {
		label = 'UwU Cat Cafe',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Trainee', payment = 900 },
			['1'] = { name = 'Employee', payment = 1000 },
			['2'] = { name = 'Experienced', payment = 1200 },
			['3'] = { name = 'Manager', payment = 1300 },
			['4'] = { name = 'Owner', isboss = true, payment = 1400 },
		},
	},
	bakery = {
		label = 'Trey Bakery',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 100 },
			['1'] = { name = 'Novice', payment = 200 },
			['2'] = { name = 'Experienced', payment = 300 },
			['3'] = { name = 'Advanced', payment = 400 },
			['4'] = { name = 'Manager', isboss = true, payment = 900 },
			['5'] = { name = 'Boss', isboss = true, payment = 1000 },
		},
	},
	pearls = {
		label = 'Pearls',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Waiter', payment = 100 },
			['1'] = { name = 'Delivery Driver', payment = 200 },
			['2'] = { name = 'Cook', payment = 300 },
			['3'] = { name = 'Manager', payment = 400 },
			['4'] = { name = 'Owner', isboss = true, payment = 1000 },
			
		},
	},
	taxi = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Driver', payment = 0 },
			--[[ ['1'] = { name = 'Driver', payment = 250 },
			['2'] = { name = 'Event Driver', payment = 350 },
			['3'] = { name = 'Sales', payment = 450 },
			['4'] = { name = 'Manager', isboss = true, payment = 550 }, ]]
		},
	},
	delivery = {
		label = 'Amazon',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Delivery man', payment = 0 },
		},
	},
	cardealer = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 250 },
			['1'] = { name = 'Showroom Sales', payment = 350 },
			['2'] = { name = 'Business Sales', payment = 450 },
			['3'] = { name = 'Finance', payment = 550 },
			['4'] = { name = 'Manager', isboss = true, payment = 650 },
		},
	},
	mechanic = {
		label = 'LS Customs',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 300 },
			['1'] = { name = 'Novice', payment = 400 },
			['2'] = { name = 'Experienced', payment = 800 },
			['3'] = { name = 'Advanced', payment = 900 },
			['4'] = { name = 'Manager', isboss = true, payment = 1400 },
		},
	},
	bandoscustom = {
		label = 'Bandos Customs',
		type = 'bandoscustom',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 300 },
			['1'] = { name = 'Novice', payment = 400 },
			['2'] = { name = 'Experienced', payment = 800 },
			['3'] = { name = 'Advanced', payment = 900 },
			['4'] = { name = 'Manager', isboss = true, payment = 1400 },
		},
	},
	ricocustom = {
		label = 'Rico Custom',
		type = 'ricocustom',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 250 },
			['1'] = { name = 'Novice', payment = 375 },
			['2'] = { name = 'Experienced', payment = 800 },
			['3'] = { name = 'Advanced', payment = 925 },
			['4'] = { name = 'Manager', isboss = true, payment = 1500 },
		},
	},
	bigvroycustoms = {
		label = 'Big Vroy Customs',
		type = 'bigvroycustoms',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 250 },
			['1'] = { name = 'Novice', payment = 375 },
			['2'] = { name = 'Experienced', payment = 800 },
			['3'] = { name = 'Advanced', payment = 925 },
			['4'] = { name = 'Manager', isboss = true, payment = 1500 },
		},
	},
	vroyluxury = {
		label = 'Vroy Luxury',
		type = 'vroyluxury',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 250 },
			['1'] = { name = 'Novice', payment = 375 },
			['2'] = { name = 'Experienced', payment = 800 },
			['3'] = { name = 'Advanced', payment = 925 },
			['4'] = { name = 'Manager', isboss = true, payment = 1500 },
		},
	},
	
	beeker = {
		label = 'Beeker\'s Garage',
		type = 'beeker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	bennys = {
		label = 'Benny\'s Original Motor Works',
		type = 'bennys',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 350 },
			['1'] = { name = 'Novice', payment = 375 },
			['2'] = { name = 'Experienced', payment = 600 },
			['3'] = { name = 'Advanced', payment = 950 },
			['4'] = { name = 'Manager', isboss = true, payment = 1500 },
		},
	},
}
