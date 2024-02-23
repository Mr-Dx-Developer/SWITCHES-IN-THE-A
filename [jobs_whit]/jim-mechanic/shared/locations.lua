Config.Locations = Config.Locations or {}

Config.Locations[#Config.Locations+1] = { 
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(-365.6389465332, -154.74496459961),
		vec2(-352.03677368164, -180.19702148438),
		vec2(-309.43313598633, -167.66041564941),
		vec2(-304.82751464844, -160.89756774902),
		vec2(-297.51321411133, -120.27662658691),
		vec2(-289.28378295898, -96.42741394043),
		vec2(-346.78524780273, -78.421455383301),
		vec2(-374.47827148438, -68.597633361816),
		vec2(-385.23809814453, -99.778938293457),
		vec2(-357.98147583008, -110.18009185791),
		vec2(-367.24722290039, -137.92770385742)
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(-350.44, -132.11, 42.04, 162.55), w = 1.6, d = 0.6 },
	},
	store = {
		{ coords = vec4(-333.3, -161.58, 39.01, 345), w = 5.6, d = 5.5 },
		{ coords = vec4(-336.07, -128.95, 39.22, 340), w = 1.6, d = 1.5 },
	},
	crafting = {
		{ coords = vec4(-328.42184448242, -165.7989654541, 39.009510040283, 195.7785949707), w = 3.2, d = 1.0 },
	},
	clockin = {
		{ coords = vec4(-337.51, -133.65, 39.15, 0), prop = false, },
	},
	manualRepair = {
		{ coords = vec4(-341.30642700195, -164.86755371094, 39.009391784668, 340.96734619141), prop = true, },
	},
	carLift = {
		{ coords = vec4(-333.95, -135.42, 39.01, 340), },
		{ coords = vec4(-323.76, -155.36, 39.01, 249.59) },
	},
	garage = {
		spawn = vec4(-359.2473449707, -122.99184417725, 38.699180603027, 153.87454223633),
		out = vec4(-353.98, -127.04, 39.43, 74.74),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
		{ coords = vec4(-345.16, -128.24, 38.93, 65.46), prop = true },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-336.84, -136.39, 39.01),
		label = "Los Santos Customs",
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 2571775,
	}
}




Config.Locations[#Config.Locations+1] = { 
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(162.15, -3006.81),
		vec2(115.96, -3002.78),
		vec2(115.68, -3023.22),
		vec2(115.65, -3060.88),
		vec2(160.52, -3061.71),
		vec2(162.03, -3039.05),
		vec2(162.74, -3022.06)
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(124.16, -3052.74, 7.04, 0.0), w = 1.6, d = 0.6 },
	},
	store = {
		{ coords = vec4(123.0, -3046.89, 7.04, 270), w = 5.6, d = 5.5 },
		{ coords = vec4(127.95, -3016.39, 7.04, 0.0), w = 1.6, d = 1.5 },
	},
	crafting = {
		{ coords = vec4(0.0, 0.0, 0.0, 0.0), w = 3.2, d = 1.0 },
	},
	clockin = {
		{ coords = vec4(149.13, -3018.77, 7.04, 0), prop = false, },
	},
	manualRepair = {
		{ coords = vec4(138.63, -3018.97, 7.25, 0.0), prop = false, },
	},
	carLift = {
		{ coords = vec4(-333.95, -135.42, 39.01, 340), },
		{ coords = vec4(-323.76, -155.36, 39.01, 249.59) },
	},
	garage = {
		spawn = vec4(158.46, -3014.25, 6.02, 272.55),
		out = vec4(164.03, -3009.11, 5.92, 270.33),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
		{ coords = vec4(0.0, 0.0, 0.0, 0.0), prop = false },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(148.23, -3032.27, 7.04),
		label = "Benny",
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 2571775,
	}
}



Config.Locations[#Config.Locations+1] = { 
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(250.674, -208.138),
		vec2(276.85, -219.85),
		vec2(295.44, -227.49),
		vec2(311.24, -178.2),
		vec2(290.84, -170.56),
		vec2(265.17, -160.96),
		vec2(255.04, -187.0)
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(302.93, -197.52, 54.06, 255), w = 1.6, d = 0.6 },
	},
	store = {
		{ coords = vec4(301.16, -202.57, 54.06, 340), w = 5.6, d = 5.5 },
		
	},
	crafting = {
		{ coords = vec4(0.0, 0.0, 0.0, 0.0), w = 3.2, d = 1.0 },
	},
	clockin = {
		{ coords = vec4(272.44, -214.17, 54.06, 355), prop = false, },
	},
	manualRepair = {
		{ coords = vec4(0.0, 0.0, 0.0, 0.0), prop = false, },
	},
	carLift = {
		{ coords = vec4(0.0, 0.0, 0.0, 0.0), },
		{ coords = vec4(0.0, 0.0, 0.0, 0.0) },
	},
	garage = {
		spawn = vec4(290.71, -222.78, 53.98, 159.52),
		out = vec4(289.09, -229.61, 53.89, 72.0),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
		{ coords = vec4(0.0, 0.0, 0.0, 0.0), prop = false },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(283.61, -198.65, 54.06),
		label = "Rico Custom",
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 2571775,
	}
}



Config.Locations[#Config.Locations+1] = { 
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(-242.57, -1157.14),
		vec2(-195.25, -1154.97),
		vec2(-153.95, -1154.87),
		vec2(-153.05, -1186.32),
		vec2(-195.18, -1186.37),
		vec2(-228.72, -1186.25),
		vec2(-246.66, -1186.35)
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(-189.42, -1159.61, 23.77, 0), w = 2.0, d = 4.0 },
	},
	store = {
		{ coords = vec4(-183.24, -1159.9, 23.77, 275), w = 5.6, d = 5.5 },
		
	},
	crafting = {
		{ coords = vec4(0.0, 0.0, 0.0, 0.0), w = 3.2, d = 1.0 },
	},
	clockin = {
		{ coords = vec4(-199.16, -1162.93, 23.77, 0), prop = false, },
	},
	manualRepair = {
		{ coords = vec4(0.0, 0.0, 0.0, 0.0), prop = false, },
	},
	carLift = {
		{ coords = vec4(0.0, 0.0, 0.0, 0.0), },
		{ coords = vec4(0.0, 0.0, 0.0, 0.0) },
	},
	garage = {
		spawn = vec4(-218.57, -1172.72, 23.02, 95.92),
		out = vec4(-226.13, -1175.41, 22.96, 93.82),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
		{ coords = vec4(0.0, 0.0, 0.0, 0.0), prop = false },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-193.76, -1167.78, 23.05),
		label = "Big Vroy Customs",
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	discord = {
		link = "",
		color = 2571775,
	}
}