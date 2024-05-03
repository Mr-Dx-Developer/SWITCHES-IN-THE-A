Loc = {}

--[[	LIST OF POSSIBLE VEHICLE MODIFIERS   ]]--
-- Using these will change how each vehicle spawns
-- This can be used for making sure the vehicles comes out exactly how you want it to

-- CustomName = "Police Car", this will show a custom override name for your vehicles so you don't need to add them to your vehicles.lua
-- rank = { 2, 4 }, -- This specifes which grades can see it, and only these grades
-- grade = 4, -- This specifies the lowest grade and above that can see the vehicle
-- colors = { 136, 137 }, -- This is the colour index id of the vehicle, Primary and Secondary in that order
-- bulletproof = true, -- This determines if the tyres are bullet proof (don't ask me why, I was asked to add this)
-- livery = 1, -- This sets the livery id of the vehicle, (most mod menus would number them or have them in number order) 0 = stock
-- extras = { 1, 5 }, -- This enables the selected extras on the vehicle
-- performance = "max", this sets the stats to max if available
-- performance = { 2, 3, 3, 2, 4, true }, -- This allows more specific settings for each upgrade level, in order: engine, brakes, suspension, transmission, armour, turbo
-- trunkItems = { }, -- Use this to add items to the trunk of the vehicle when it is spawned

-- ANY VEHICLE, BOATS, POLICE CARS, EMS VEHICLES OR EVEN PLANES CAN BE ADDED.

Config = {
	Debug = false,  -- Enable to use debug features
	Lan = "en",

	Core = "qb-core",
	Menu = "ox",
	Notify = "ox",

	Fuel = "cdn-fuel", -- Set this to your fuel script folder

	CarDespawn = false, -- Sends the vehicle to hell (removal animation)

	DistCheck = false, -- Require the vehicle to be near by to remove it

	Locations = {
		--[[ { 	zoneEnable = true,
			job = "mechanic",
			garage = {
				spawn = vec4(-179.34, -1285.27, 30.83, 89.24),  -- Where the car will spawn
				out = vec4(-177.1, -1282.25, 31.3, 179.01),	-- Where the parking stand is
				list = {
					["cheburek"] = {
						colors = { 136, 137 },
						grade = 4,
						livery = 5,
						bulletproof = true,
						extras = { 1, 4 },
					},
					["burrito3"] = { },
				},
			},
		}, ]]
		--[[ { 	zoneEnable = true,
			job = "police",
			garage = {
				spawn = vec4(627.046142578125,24.909893035888672,87.816162109375,11.338582038879395),
				out = vec4(633.982421875,21.982419967651367,87.226318359375,351.4960632324219),
				list = {
					["police"] = {
						CustomName = "Police Car",
						livery = 5,
						extras = { 1, 2 },
						performance = "max",
						trunkItems = {
							{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["fbi"] = {
						rank = { 4 },
						performance = { 2, 3, 3, 2, 4, true },
					},
				},
			},
		}, ]]
        {    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "police", -- set this to required job grade
			garage = {
				spawn = vec4(627.046142578125,24.909893035888672,87.816162109375,11.338582038879395),
				out = vec4(633.982421875,21.982419967651367,87.226318359375,351.4960632324219),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["DBChrysler300WBPD"] = {
						CustomName = "DBChrysler300WBPD",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["expeditionbb"] = {
						CustomName = "expeditionbb",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["CID1"] = {
						CustomName = "CID1",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["f150bb"] = {
						CustomName = "f150bb",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["srt8"] = {
						CustomName = "srt8",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["umtahoe"] = {
						CustomName = "umtahoe",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
                    ["taurusbb"] = {
						CustomName = "taurusbb",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
                    ["trhawk"] = {
						CustomName = "trhawk",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
                    ["poldurango"] = {
						CustomName = "poldurango",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
                    ["22g63"] = {
						CustomName = "22g63",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
                    ["polbmwm3"] = {
						CustomName = "polbmwm3",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
                    ["polcharger18"] = {
						CustomName = "polcharger18",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
                    ["polmustang"] = {
						CustomName = "polmustang",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
                    ["nm_z71"] = {
						CustomName = "nm_z71",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
                    ["DL_RS7"] = {
						CustomName = "DL_RS7",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
                    ["m15expedition"] = {
						CustomName = "m15expedition",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
                    ["at420"] = {
						CustomName = "at420",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
                    ["c321escalade"] = {
						CustomName = "c321escalade",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["sou_madmaxpd"] = {
						CustomName = "sou_madmaxpd",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["222"] = {
						CustomName = "222",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["283"] = {
						CustomName = "283",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["452"] = {
						CustomName = "452",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["883"] = {
						CustomName = "883",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["lib114ram"] = {
						CustomName = "lib114ram",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},

					["lib120explorer"] = {
						CustomName = "lib120explorer",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["lib118charger"] = {
						CustomName = "lib118charger",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["lib121tahoe"] = {
						CustomName = "lib121tahoe",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					}



				},
			},
		},
		{ 	zoneEnable = true,
			job = "ambulance",
			garage = {
				spawn = vec4(294.95, -606.92, 43.24, 64.84),
				out = vec4(294.54, -599.52, 43.28, 159.68),
				list = {
					["DBDLM5EMS"] = {
						CustomName = "DBDLM5EMS",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["ambulance"] = {
						CustomName = "EMT 2",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["emslambo"] = {
						CustomName = "emslambo",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["sou_madmaxpd"] = {
						CustomName = "sou_madmaxpd",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["f450amb"] = {
						CustomName = "f450amb",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
				},
			},
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "ambulance", -- set this to required job grade
			garage = {
				spawn = vector4(-490.6681213378906,-331.83294677734375,34.3516845703125,260.78741455078125),  -- Where the vehicle will spawn
				out = vector4(-490.25933837890625,-325.4901123046875,34.4864501953125,170.0787353515625),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["DBDLM5EMS"] = {
						CustomName = "DBDLM5EMS",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["ambulance"] = {
						CustomName = "EMT 2",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["emslambo"] = {
						CustomName = "emslambo",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["sou_madmaxpd"] = {
						CustomName = "sou_madmaxpd",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					
				},
			},
		},









		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "ambulance", -- set this to required job grade
			garage = {
				spawn = vector4(-447.36877441406, -312.50741577148, 78.164588928223, 23.741683959961),  -- Where the vehicle will spawn
				out = vector4(-437.19180297852, -319.03134155273, 78.164512634277, 118.92848968506),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["emsaw139"] = {
						CustomName = "emsaw139 Super",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					}
				},
			},
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "beanmachine", -- set this to required job grade
			garage = {
				spawn = vector4(129.36, -1036.4, 29.43, 338.77),  -- Where the vehicle will spawn
				out = vector4(125.95, -1040.69, 29.22, 262.46),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["starbucksvan"] = {
						CustomName = "Van",
						livery = 27,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["foodbike"] = {
						CustomName = "Bike",
						livery = 27,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
					["foodcar3"] = {
						CustomName = "Van 2",
						livery = 27,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					},
				},
			},
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "atoms", -- set this to required job grade
			garage = {
				spawn = vector4(89.43, 304.86, 110.01, 67.02),  -- Where the vehicle will spawn
				out = vector4(90.66, 312.64, 110.03, 159.33),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["foodcar"] = {
						CustomName = "speed Van",
						livery = 20,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					}
				},
			},
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "koi", -- set this to required job grade
			garage = {
				spawn = vector4(-1019.72, -1464.0, 5.05, 26.37),  -- Where the vehicle will spawn
				out = vector4(-1023.08, -1465.58, 5.05, 302.14),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["foodcar2"] = {
						CustomName = "speed Van",
						livery = 15,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8 },
						performance = "max",
					}
				},
			},
		},
	},
}