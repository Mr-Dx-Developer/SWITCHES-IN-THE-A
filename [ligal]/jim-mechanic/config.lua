Config = {
	Lan = "en", -- Pick your language file here
	System = {
		Debug = false, -- Set to true to show green debug boxes to help track any issues

		Menu = "ox",  				-- "qb", "ox", "gta"
		Notify = "ox",				-- "qb", "ox", "gta", "esx"
		ProgressBar = "ox", 		-- "qb", "ox", "gta", "esx"

		distkph = false, 			-- Set to false to read distance travelled in Miles.

		RenewedBanking = false, 	-- This is used for manualrepair benches, enable to use
	},

	General = {
		JimShops = false,			-- Enable to open shops in jim-shops menu's
		showClockInTill = true,		-- Enable to show toggle duty options at payment tills
		showBossMenuTill = true,	-- Enable to show bossmenu options at payment tills
	},

	Main = { -- Main variables
		isVehicleOwned = false, 	-- Keep this true if you only want changes to be made to owned vehicles
		ItemRequiresJob = true, 	-- Do the specfic items require the mechanic job?
		JobLocationRequired = true, -- Are the mecahanics locked to specific locations?
		LocationBlips = true, 		-- Enable to grab the blip locations from locations.lua
		CosmeticsJob = false, 		-- Do vehicle cosmetics require a mechanic job role?
		JobRoles = { "mechanic", "ricocustom", "bigvroycustoms", "bandoscustom", "vroyluxury", "slatlanta", "famgooncustoms", "eastcustom", "vroyhouse" }, -- These are the job roles who can use items if RequiresJob is enabled.
									-- Add your extra job roles here or just leave as "mechanic"
									-- Example-- --JobRoles = { "mechanic", "tuner" }
	},

	Overrides = {
		CosmeticItemRemoval = true, -- If "true" items will be removed on successful application of a mod
									-- If "false" items will not be removed on use

		receiveMaterials = false,	-- If true, when removing parts like engines, recieve materials instead of the full engine
									-- This is based on material recipes in recipes.lua

		updateServerDelay = 20, 	-- default 20 second database update delay from the LAST upgrade done to a vehicle
									-- This stops overloading of server databases when many changes are happening, it adds a cooldown
		ChameleonPaints = true, 	-- Enable this if you want to use chameleon paints (ONLY GAME BUILD 2545 AND ABOVE)
		WaxFeatures = true, 		-- Enable this if you want to use Car Wax Features

		DoorAnimations = true,		-- Enable door openning animations when repairing/fixing

		disableNos = false,			-- Disable nos if you wish to use a separate script


		disablePreviewPlate = false,-- enable this to disable temporary plate while previewing

		saveOnExit = true,			-- Enable this to save a vehicle to database when player exits their vehicle
									-- Does not work if they "delete" it, eg. If your garage system doesn't remove the player from the car before parking
	},

	Crafting = {
		craftCam = true,
		MultiCraft = true,
		MultiCraftAmounts = { [1], [2], [3], [4], [5], [6], [7], [8], [9], [10] },
		showItemBox = true,			-- toggle itemBox for adding/removing items, helpful if using custom item change events
	},

	Harness = {
		JobOnly = false,			-- Only allow job roles to add a Harness to vehicle
		HarnessControl = true,		-- Enable harness AND seatbelt features of the script, requires edits to smallresources and hud scripts
		seatbeltEasyLeave = false,	-- if true players can exit vehicled before removing seatbelt
		harnessEasyLeave = false,	-- if true players can exit vehicled before removing harness

		progOn = true,				-- if true add a progressBar to buckle harness
		progOff = true,				-- if true add a progressBar to unbuckle harness

		seatbeltNotify = false,		-- if true, show a notification when seatbelt is put on or off

		timeOn = 3000,				-- Time for the progress bar to put on harness
		timeOff = 2000,				-- Time for the progress bar to take off harness

		minimumSpeed = 700,			-- Minimum speed for crash logic to be triggered
		minimumSeatBeltSpeed = 1100, -- Minimuim speed for ejecting with a seatbelt attached
		minimumDamage = 15.0, 		-- Minimum body damage for ejecting a player (default 15 = .15%)

		crashKill = false,			-- Set to true if you want ejecting when crashing to kill/injure

		AltEjection = false,		-- Enabling this may make some varibles above not be used
									-- Requires adding a couple lines to your server.cfg to activate
									-- Attempts to use in engine logic for crashes but its still theres a chance it may not work in your server
									-- Can't hurt to try
									-- add these lines to your server.cfg and restart
									-- setr game_enableFlyThroughWindscreen true
									-- setr game_enablePlayerRagdollOnCollision true

	},

	vehFailure = { 						-- Enabling these will make allow you to no longer need qb-vehiclefailure
										-- ONLY ENABLE IF NOT USING VEHICLEFAILURE OR ANOTHER SCRIPT TO REPLACE IT
		damages = true,					-- Makes jim-mechanic automatically handle extra damages instead of needing an edit to vehfailure
		repairKits = false,				-- Takes control of repairkit and advancedrepairkit
		fixCommand = true,				-- takes control of /fix command
		PreventRoll = true,			-- takes control of preventing rolling your car back over when upside down
		increaseEngDamage = true,		-- enabling this adds extra damage based on what the body damage has just taken

		damageLimits = {
			petrolTank = 750.0,			-- Prevents tankHealth ever going below ( if this goes too low fuel leaks and instantly destorys the engine)
			engine = 50.0,				-- Prevents engine Damage ever going below 50.0
			engineUndriveable = true,	-- If engine is at the above level, make it undriveable
			body = 50.0,				-- Prevent body damage going below 50.0
		}
	},

	CarLifts = {
		Enable = true,					-- Disable this if using a different carlift script
		Sound = true,					-- Enable/Disable carlift movement noises
		CarLiftModelReplace = {			-- if Enable is true, this table will be used to replace revious models that are in the way of set locations
			`tr_prop_tr_car_lift_01a`,
			`v_45_carlift`,
			`v_71_carlift`,
			`imp_prop_impexp_carrack`,
			`imp_prop_impexp_postlift`,
			`imp_prop_impexp_postlift_up`,
		},
		CarLiftUse = {					-- Make use of carlifts in mlos, if they have separated parts + collision, they can be used
			-- Gabz Tuners Lifts
			[`denis3d_carlift_02`] = {
				lift = `denis3d_carlift_01`,
				offset = vec3(3.0, -1.3, 1.4)
			},
			-- Gabz Bennys Lifts
			[`gabz_bennys_prop_carlift_03`] = {
				lift = `gabz_bennys_prop_carlift_01`,
				offset = vec3(-1.5, -2.8, 1.4)
			},
			-- RFC LS CUSTOMS
			[1802445854] = {
				lift = -1174339517,
				offset = vec3(-3.0, -2.0, 1.4)
			}
		},
	},

	Repairs = {	--Repair Related
		FreeRepair = false,  		-- Are repairs free? True means yes
		StashRepair = true, 		-- Enable for repair materials to be removed from a job stash (disabled if RequiresJob = false)

		ExtraDamages = true,		-- When enabled, it will use the built in extra damage systems (Like qb-mechanicjobs functions)

		EffectLevels = {			-- What level the parts need to be below before the effects kick in when crashing
			["oil"] = 50,
			["axle"] = 30,
			["spark"] = 20,
			["battery"] = 10,
			["fuel"] = 10,
		},

		--Vehicle Part Repair Costs
		Parts = {  --- Part repair item and its MAX cost
			["engine"] = { { part = "steel", cost = 8 }, { part = "iron", cost = 8 }, },
			["body"] = { part = "plastic", cost = 8 },
			["oil"] = { part = "newoil", cost = 1 },
			["axle"] = { part = "axleparts", cost = 1 },
			["spark"] = { part = "sparkplugs", cost = 1 },
			["battery"] = { part = "carbattery", cost = 1 },
			["fuel"] = { part = "steel", cost = 8 },
			["wheels"] = { part = "sparetire" }, -- Has no cost, 1 per damaged wheel
		},

		RepairWheelsWithEngine = false,
		RepairWheelsWithBody = false,
	},

	Previews = {
		oldOxLibMenu = true,		-- Enable this to use default context menu for previews when using ox_lib
		PreviewPhone = true, 		-- Enable this is preview menu generates an email, False if you want to give an item
		PreviewJob = false, 		-- Enable this if you want /preview to require a Job Role
		PreviewLocation = false, 	-- Enable this if you want to lock /preview to a job location (ignored if LocationRequired is false)

		PhoneItems = {				-- list of phones/items that are needed to get emails. IF you don't have any you will get a clipboard with the list on instead
			"phone",
			"classic_phone",
			"black_phone",
			"blue_phone",
			"gold_phone",
			"red_phone",
			"green_phone",
			"greenlight_phone",
			"pink_phone",
			"white_phone"
		}
	},

	StoreCraft = {
		Crafting = true, 				-- Set true to turn on crafting features
		StashCraft = false,  			-- Set true to grab materials from mechaincs stash for crafting
		Stores = true, 					-- Set true to turn on shop store features
	},

	Odometer = {
		ShowOdo = true, 					-- Wether the distance is showed in car by default

		ShowToAll = true,					-- Show Odometer to passengers aswell as driver
		ShowPassengersAllIcons = false, 	-- Enabling this will only show passengers the buckle/harness icon
		OdoAlwaysShowIcons = false, 			-- Enable this to show the icons even when not damaged
		OdoShowLimit = 70,					-- If OdoAlwaysShowIcons, the damage icons only will be shown if below this percent

		SeatbeltHideWhenBuckled = false, 	-- Hide seatlbelt icon when buckled
		HarnessHideWhenBuckled = false, 	-- Hide Harness icon when buckled

		showSpeedometer = false,

		OdoIconsToShow = {
			["engine"] = true,
			["body"] = true,
			["oil"] = true,
			["spark"] = true,
			["fuel"] = true,
			["axle"] = true,
			["battery"] = true,
			["wheel"] = true,
			["headlight"] = true,
			["seatbelt"] = true,
			["harness"] = true,
			["underglow"] = true,
			["doors"] = true,
			["manual"] = true,
			["antilag"] = true,
			["mileage"] = true,
			["lowfuel"] = true,
			["nos"] = true,
		},

		odoCustomisation = {
			showHealthValues = false,								-- Always show health numbers on icons (otherwise only shows in debug mode)

			screenPosition = { top = 95, left = 25 },				-- where on the screen it will appear (percentages) default bottom right
			backgroundColor = { 0, 0, 0 },							-- the colour of the huds background
			backgroundColorTransparency = 0.5,						-- the transparency of the huds background

			backgroundBorderTransparency = 1.0,						-- background outline transparency (0.0 hides it, max 1.0)
			backgroundBorderColor = { 0, 0, 0 },					-- background outline colour
			backgroundBorderWidth = "0px",							-- background outline width

			backgroundcornerRadius = "0.5rem",						-- background corner radius

			backgroundShadowTransparency = 0.5,						-- background shadow/glow transparency (0.0 hides it, max 1.0)
			backgroundShadow = '0px 0px 10px',						-- background shadow/glow location (0px 0px 10px adds a 10px shadow all around the box)
			backgroundShadowColor = { 0, 0, 0 },					-- background shadow/glow colour

			backgroundInnerShadowTransparency = 0.7,				-- background shadow/glow transparency (0.0 hides it, max 1.0)
			backgroundInnerShadow = 'inset 0px 0px 10px',			-- background shadow/glow location (0px 0px 10px adds a 10px shadow all around the box)
			backgroundInnerShadowColor = { 0, 0, 0 },				-- background shadow/glow colour

			iconGlow = true,										-- Toggle icons glow
			iconSize = 0.35,										-- How big the icons will be (attempts to scale between resolutions)
			iconColorMax = { 0, 255, 0 },							-- The colour icons will be if full health
			iconColorMin = { 255, 0, 0 },							-- The colour icons will be if a low health

			iconBoxShadow = false,									-- Adds shadow for each image box
			iconBoxShadowStyle = 'inset black 0px 0px 50px',		-- Fine tune the shadow here
			iconBoxShadowCorners = "0.5rem",						-- Add rounded corners to the box

			font = 'DigitalFont',

			inlayTextSize = '1.4vh',								-- Text size of the text that appears over icons (by default on nos boost level)
			inlayTextPosition = { top = "42%", left = "0.2rem" },	-- Specific placement of the text
			inlayTextColor = { 255, 255, 255 },						-- Colour of the text
			inlayTextGlow = '0 0 3px #000000, 0 0 5px #ffffff',		-- Specific CSS of the glow/shadow

			mileagetextSize = '2.3vh',								-- Milage text size
			mileagetextColor = { 255, 255, 255 },					-- Milage Colour
			mileagetextGlow = '0 0 10px',							-- Glow/Shadow effect
			mileagetextGlowColor = { 255, 255, 255 },				-- Glow/Shadow effect colour
			mileagetextGlowTransparency = 1.0,						-- Glow/Shadow effect transparency
		},

		speedCustomisation = {
			SpeedLocation = { top = '80%', left = '28%' },			-- Location of the whole speedometer on the screen
			SpeedSize = '14vh',

			-- Both the Speedometer and RPM settings
			BorderWidth = '0.15vh',									-- The semi-circle border width
			BorderCol = { 255, 255, 255 },							-- The semi-circle border colour
			BorderStyle = 'solid',									-- The semi-circle border tyle ('solid', 'dashed', 'dotted')
			BorderTrans = 1.0,										-- The semi-circle border transparency

			BackgroundCol = { 0, 0, 0 },							-- Background colour
			BackgroundTrans = 0.6,									-- Background Transparency
			BackgroundShadow = '0 0 10px',							-- Background Shadow style
			BackgroundShadowColor = { 0, 0, 0 },					-- Background Shadow colour
			BackgroundShadowTrans = 0.8,							-- Background Shadw Transparency

			font = 'DigitalFont',
			TextColour = 'rgba(255, 255, 255)',						-- Colour of speed text around the meter
			TextSize = '1.0vh',										-- Size of text around the meter
			ColourHigh = 'rgba(255, 0, 0)',							-- Colour the text should be if classed as "High"

			MarkerColour = {255, 255, 255},				-- Colour of text if classed as "High"
			MarkerColourHigh = {255, 0, 0},				-- Colour of marker if classed as "High", if not use BorderCol
			MarkerTrans = 1.0,

			SpeedHighlight = false,									-- Hightlight the text on the speedometer the faster you go
			HighSpeedHighlight = true,								-- Highlight high speeds on the speedometer

			ShowDigitalSpeed = false,								-- Shows digital speed numbers on the speedometer
			digitalSpeedLoc = { top = 40, left = 17 },				-- Location of the numbers (defaults to the center)
			digitalSpeedSize = '3vh',								-- The font size

			NeedleType = 1,											-- Change between 1, 2, 3

			SpeedNeedleLength = '7.0vh',							-- Speedometer Needle Length
			SpeedNeedleWidth = '0.6vh',								-- Speedometer Needle Width
			SpeedNeedleCol = { 255, 0, 0 },							-- Speedometer Needle Colour
			SpeedNeedleTrans = 0.9,									-- Speedometer Needle Transparency
			SpeedNeedleShadow = '0px 0px 5px',						-- Speedometer Needle Shadow Style
			SpeedNeedleShadowCol = { 0, 0, 0 },						-- Speedometer Needle Shadow Colour
			SpeedNeedleShadowTrans = 0.9,							-- Speedometer Needle Shadow Transparency

			showRpmMeter = true,									-- Show RpmMeter
			rpmMeterLocation = 'translate(8.5vh, 4.5vh)',			-- RPM Meter location in relation to the speedometer
			rpmMeterSize = '5vh',
			rpmNeedleLength = '2.5vh',								-- Speedometer Needle Length
			rpmNeedleWidth = '0.1vh',								-- Speedometer Needle Width
			rpmNeedleCol = { 255, 0, 0 },								-- Speedometer Needle Colour
			rpmNeedleTrans = 0.9,									-- Speedometer Needle Transparency
			rpmNeedleShadow = '0px 0px 5px',						-- Speedometer Needle Shadow Style
			rpmNeedleShadowCol = { 0, 0, 0 },						-- Speedometer Needle Shadow Colour
			rpmNeedleShadowTrans = 0.9,								-- Speedometer Needle Shadow Transparency

			showFuelMeter = true,									-- Show FuelMeter
			fuelMeterLocation = 'translate(-8.5vh, 4.5vh)',			-- Fuel Meter location in relation to the speedometer
			fuelMeterSize = '5vh',

			fuelNeedleLength = '2.5vh',								-- Speedometer Needle Length
			fuelNeedleWidth = '0.1vh',								-- Speedometer Needle Width
			fuelNeedleCol = { 255, 0, 0 },								-- Speedometer Needle Colour
			fuelNeedleTrans = 0.9,									-- Speedometer Needle Transparency
			fuelNeedleShadow = '0px 0px 5px',						-- Speedometer Needle Shadow Style
			fuelNeedleShadowCol = { 0, 0, 0 },						-- Speedometer Needle Shadow Colour
			fuelNeedleShadowTrans = 0.9,							-- Speedometer Needle Shadow Transparency

		},

	},
	Emergency = {
		requireDutyCheck = false,	-- if true, when a mechanic is online, the repair button won't show
									-- if false, the repair option will always be available
		Jobs = {
			["police"] = 0, -- Job and Job Grade
			["ambulance"] = 0,
			["mechanic"] = 0,
			["ricocustom"] = 0,
			["bigvroycustoms"] =0,
			["bandoscustom"] =0,
			["vroyluxury"] =0,
			["slatlanta"] =0,
			["famgooncustoms"] =0,
			["eastcustom"] =0,
			["vroyhouse"] =0,
		},
		LockEmergency = false,  -- Enable this to lock make only "Emergency" (Class 18) vehicles to be used with the bench
		Locations = {
			{ coords = vec4(451.05, -973.19, 25.7, 180.0), prop = true, }, -- MRPD UNDERGROUND PARKING
			{ coords = vec4(342.51, -570.98, 28.8, 70.0), prop = true, }, -- PILL BOX GARAGE
			{ coords = vec4(-1163.01, -2009.41, 13.18, 117.71), prop = true },
		},
		CosmeticTable = { 			-- This controls what will appear in the emergency mech bench, "false" to hide it
			["Repair" ] = true,
			["Paints"] = true,
			["Horn"] = true,
			["Hood"] = true,
			["Exhaust"] = true,
			["RollCage"] = true,
			["Roof"] = true,
			["Spoiler"] = true,
			["Seats"] = true,
			["PlateHolder"] = true,
			["VanityPlate"] = true,
			["CustomPlate"] = true,
			["Skirts"] = true,
			["RightFender"] = true,
			["LeftFender"] = true,
			["Liverys"] = true,
			["OldLiverys"] = true,
			["RoofLiverys"] = true,
			["Grille"] = true,
			["FrontBumper"] = true,
			["BackBumper"] = true,
			["TrimA"] = true,
			["TrimB"] = true,
			["Trunk"] = true,
			["EngineBlock"] = true,
			["Filter"] = true,
			["Struts"] = true,
			["Hydraulics"] = true,
			["ArchCovers"] = true,
			["FuelTank"] = true,
			["Aerials"] = true,
			["Extras"] = true,
			["Ornaments"] = true,
			["DashBoard"] = true,
			["Dials"] = true,
			["DoorSpeakers"] = true,
			["SteeringWheels"] = true,
			["ShifterLeavers"] = true,
			["Plaques"] = true,
			["Speakers"] = true,
			["WindowTints"] = true,
			["Rims"] = true,
		},
		PreformaceTable = {
			["Engine"] = true,
			["Brakes"] = true,
			["Suspension"] = true,
			["Transmission"] = true,
			["Armour"] = true,
			["Turbo"] = true,
			["Harness"] = true,
		}
	},

	ManualRepairs = { -- Player vehicle repair config
		ManualRepairCost = 5000, 	-- Set this to a high amount to get people to talk to mechanics rather than use automated systems
		ManualRepairCostBased = false, 	-- Set this to true if you want the cost to ALWAYS be the amount set at "ManualRepairCost"
									-- Set this to false if you want it to "ManualRepairCost" to be the max and cost is calculated by damage

		ManualRepairBased = true, 	-- Set this to true if you want to set the repair cost to be based on Core.Shared.Vehicle costs(overrides the cost setting above)
		ManualRepairPercent = 5,	-- Set this to the percent of the vehicle price (Only works if ManualRepairBased is true)
									-- Default is 5% because $200,000 would be $10,000 max to repair by this system
									-- 5% of a $10,000 car would be $500

		repairEngine = true, 		-- Set this to true if automated repairs also repair engine (not just body)
		repairExtras = true, 		-- Set this to true for automated repairs to also repair extra damages (if mechanicjob is available and repairEngine is true)

		requireDutyCheck = false, 	-- if set to true, the repair bench will only be usable if there are no mechanics in the server ON DUTY
		dutyMessage = "There is a Mechanic on duty!", -- This is the notification that pops up when a person tries to repair when a mechanic is on duty, choose what you want for it.

		repairAnimate = false,		-- Better than staring at a progress bar, "damaged" parts will be removed and replaced. Making it look more authentic
		repairSpeed = 1500, 		-- The time between each task while using repairAnimate. 1500 Seems to be a reasonable time for it
	},

	antiLag = {
		antiLagDis = 30.0,			-- Max distance players can hear antiLag explosions
		maxAudio = 0.4,				-- This is adjusted by distance to enchance the effect, this is the max volume
	},

	NOS = { -- NOS STUF
		JobOnly = false,			-- Only allow job roles to change NOS
		NosRefillCharge = 1000, 	-- amount in dollars required to refill a nos can

		NosBoostPower = { 			-- NOS boost acceleration power
			20.0, -- Level 1
			35.0, -- Level 2
			50.0, -- Level 3
		},

		NitrousUseRate = 0.3, 		-- How fast the nitrous drains (halved for level1, doubled for level3)

		NitrousCoolDown = 7, 		-- 7 Seconds for nitrous cooldown, set to 0 to disable
		CooldownConfirm = true, 	-- Will play a confirmation beep when cooldown is done

		nosDamage = true, 			-- This enables NOS causing damage to engine while boosting
		boostExplode = true, 		-- If boosting too long at level 3 boost, tank will explode.

		-- Effects
		PurgeDis = 60.0,			-- How far from the vehicle players can see Purge Smoke

		EnableFlame = true, 		-- True adds exhaut flame effects while boosting
		FlameDis = 50.0,			-- How far from the vehicle players can see Boost flames

		EnableTrails = true, 		-- True adds taillight effects while boosting

		EnableScreen = true, 		-- True adds screen effects while boosting

		skillcheck = "qb-skillbar", -- When adding Nos to a vehicle there are three script options available
									-- "qb-skillbar" "qb-lock" "ps-ui" "ox_lib"

		explosiveFail = true, 		-- Better not fail that skill check. (1 in 10 chance of explosion)
		explosiveFailJob = true, 	-- if true, mechanics can trigger an explosion on failure to add nos
									-- if false, mechanics will never trigger an explosion

		HandlingChange = false,		-- Changes handling during nos boost, Disable this if affecting other scripts
	},
	Discord = { -- Discord preview receipts
		-- You will need to set custom info in each job location in locations.lua
		-- But for the ones you don't add info to, it will default to these numbers
		DiscordPreview = true, 	-- Set to true if you want to use discord receipts
		DiscordDefault = "", 		-- Set this to the default channel API link if one isn't set for a location
		DiscordColour = 16753920, 	-- This is the default "decimal" number colour
	},
--DuctTape Controllers
	DuctTape = {
		DuctSimpleMode = true, 		-- This will repair the engine to the max (set below)
		MaxDuctEngine = 450.0, 		-- 450.0 is 45% health, this will be the max amount that it can be repaired to
		DuctAmountEngine = 100.0, 	-- Repairs the engine by 10% each use

		DuctTapeBody = true,  		--Enable if you want duct tape to repair body at the same time as engine
		MaxDuctBody = 450.0,
		DuctAmountBody = 100.0, 	-- Repairs the engine by 10% each use

		RemoveDuctTape = true, 		--If Enabled it will remove 1 duct after use. If false it will be constantly reusable
	},
}

-- No touch --
Crafting, Stores, VehicleNitrous, VehicleStatus, purgemode, purgeSize, boostLevel = {}, {}, {}, {}, true, 0.4, 1