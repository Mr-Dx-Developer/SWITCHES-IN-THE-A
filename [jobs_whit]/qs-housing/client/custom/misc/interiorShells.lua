--[[
    Welcome to the interior system, here you can add more yourself or
    ask the creator to send you this file with its previously placed interiors.
    You can also see how to do it manually from the documentation.
]]

Config.IplData = {
	{
		-- Apartment
		export = function()
			return exports['bob74_ipl']:GetExecApartment1Object()
		end,
		defaultTheme = 'seductive',
		themes = {
			{ label = 'Modern',     value = 'modern',     price = 500 },
			{ label = 'Moody',      value = 'moody',      price = 500 },
			{ label = 'Vibrant',    value = 'vibrant',    price = 500 },
			{ label = 'Sharp',      value = 'sharp',      price = 500 },
			{ label = 'Monochrome', value = 'monochrome', price = 500 },
			{ label = 'Seductive',  value = 'seductive',  price = 500 },
			{ label = 'Regal',      value = 'regal',      price = 500 },
			{ label = 'Aqua',       value = 'aqua',       price = 500 }
		},
		exitCoords = vec3(-787.44, 315.81, 217.64),
		iplCoords = vec3(-787.78050000, 334.92320000, 215.83840000),
		inventory = { weight = 5000, slots = 20 },
	},
	{
		-- Office
		export = function()
			return exports['bob74_ipl']:GetFinanceOffice1Object()
		end,
		defaultTheme = 'warm',
		themes = {
			{ label = 'Warm',         value = 'warm',         price = 500 },
			{ label = 'Classical',    value = 'classical',    price = 500 },
			{ label = 'Cintage',      value = 'vintage',      price = 500 },
			{ label = 'Contrash',     value = 'contrast',     price = 500 },
			{ label = 'Rich',         value = 'rich',         price = 500 },
			{ label = 'Cool',         value = 'cool',         price = 500 },
			{ label = 'Ice',          value = 'ice',          price = 500 },
			{ label = 'Conservative', value = 'conservative', price = 500 },
			{ label = 'Polished',     value = 'polished',     price = 500 }
		},
		exitCoords = vec3(-1579.756, -565.0661, 108.523),
		iplCoords = vec3(-1576.127441, -575.050537, 108.507690),
		inventory = { weight = 75000, slots = 5 },
	},
	{
		-- Night Club
		exitCoords = vec3(-1569.402222, -3017.604492, -74.413940),
		iplCoords = vec3(-1604.664, -3012.583, -78.000),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Clubhouse 1
		exitCoords = vec3(1121.037354, -3152.782471, -37.074707),
		iplCoords = vec3(1107.04, -3157.399, -37.51859),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Clubhouse 2
		exitCoords = vec3(997.028564, -3158.136230, -38.911377),
		iplCoords = vec3(998.4809, -3164.711, -38.90733),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Cocaine Lab
		exitCoords = vec3(1088.703247, -3187.463623, -38.995605),
		iplCoords = vec3(1093.6, -3196.6, -38.99841),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Meth Lab
		exitCoords = vec3(996.896729, -3200.914307, -36.400757),
		iplCoords = vec3(1009.5, -3196.6, -38.99682),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Weed Lab
		exitCoords = vec3(1066.298950, -3183.586914, -39.164062),
		iplCoords = vec3(1056.975830, -3194.571533, -39.164062),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Counterfeit Cash Factory
		exitCoords = vec3(1138.101074, -3199.107666, -39.669556),
		iplCoords = vec3(1121.897, -3195.338, -40.4025),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Document Forgery
		exitCoords = vec3(1173.7, -3196.73, -39.01),
		iplCoords = vec3(1165, -3196.6, -39.01306),
		inventory = { weight = 500000, slots = 15 },
	},

	-- Credit [RTQC]ThePurpleRats#9624
	{
		-- Penthouse Casino
		exitCoords = vec3(980.83, 56.51, 116.16),
		iplCoords = vec3(976.636, 70.295, 115.164),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- NightClub Warehouse
		exitCoords = vec3(-1520.88, -2978.54, -80.45),
		iplCoords = vec3(-1505.783, -3012.587, -80.000),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- 2 Car
		exitCoords = vec3(179.15, -1000.15, -99.0),
		iplCoords = vec3(173.2903, -1003.6, -99.65707),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- 6 Car
		exitCoords = vec3(212.4, -998.97, -99.0),
		iplCoords = vec3(197.8153, -1002.293, -99.65749),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- 10 Car
		exitCoords = vec3(240.67, -1004.69, -99.0),
		iplCoords = vec3(229.9559, -981.7928, -99.66071),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Casino NightClub
		exitCoords = vec3(1545.57, 254.22, -46.01),
		iplCoords = vec3(1550.0, 250.0, -48.0),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Warehouse Small
		exitCoords = vec3(1087.43, -3099.48, -39.0),
		iplCoords = vec3(1094.988, -3101.776, -39.00363),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Warehouse Medium
		exitCoords = vec3(1048.12, -3097.28, -39.0),
		iplCoords = vec3(1056.486, -3105.724, -39.00439),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Warehouse Large
		exitCoords = vec3(992.38, -3098.08, -39.0),
		iplCoords = vec3(1006.967, -3102.079, -39.0035),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Vehicle Warehouse
		exitCoords = vec3(956.12, -2987.24, -39.65),
		iplCoords = vec3(994.5925, -3002.594, -39.64699),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Old Bunker Interior
		exitCoords = vec3(899.5518, -3246.038, -98.04907),
		iplCoords = vec3(899.5518, -3246.038, -98.04907),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Arcadius Garage 1
		exitCoords = vec3(-198.666, -580.515, 136.00),
		iplCoords = vec3(-191.0133, -579.1428, 135.0000),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Arcadius Garage 2
		exitCoords = vec3(-124.532, -571.478, 136.00),
		iplCoords = vec3(-117.4989, -568.1132, 135.0000),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Arcadius Garage 3
		exitCoords = vec3(-135.412, -622.440, 136.00),
		iplCoords = vec3(-136.0780, -630.1852, 135.0000),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- Arcadius Mod Shop
		exitCoords = vec3(-139.388, -587.917, 167.00),
		iplCoords = vec3(-146.6166, -596.6301, 166.0000),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- 2133 Mad Wayne Thunder
		exitCoords = vec3(-1289.89, 449.83, 97.9),
		iplCoords = vec3(-1288, 440.748, 97.69459),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- 2868 Hillcrest Avenue
		exitCoords = vec3(-753.04, 618.82, 144.14),
		iplCoords = vec3(-763.107, 615.906, 144.1401),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- EclipseTowers, Apt 3	
		exitCoords = vec3(-785.12, 323.75, 212.0),
		iplCoords = vec3(-773.407, 341.766, 211.397),
		inventory = { weight = 500000, slots = 15 },
	},
	{
		-- 	Dell Perro Heights, Apt 7
		exitCoords = vec3(-1453.86, -517.64, 56.93),
		iplCoords = vec3(-1477.14, -538.7499, 55.5264),
		inventory = { weight = 500000, slots = 15 },
	}
}
