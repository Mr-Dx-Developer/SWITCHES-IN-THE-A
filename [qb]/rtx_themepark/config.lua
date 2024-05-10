Config = {}

Config.Framework = "standalone"  -- types (standalone, qbcore, esx)

Config.ESXFramework = {
	newversion = true, -- use this if you using new esx version (if you get error with old esxsharedobjectmethod in console)
	getsharedobject = "esx:getSharedObject",
	resourcename = "es_extended"
}

Config.QBCoreFrameworkResourceName = "qb-core" -- qb-core resource name, change this if you have different name of main resource of qbcore

Config.OxInventory = false -- enable this if you use ox_inventory

Config.InterfaceColor = "#ff66ff" -- change interface color, color must be in hex

Config.Language = "English" -- text language from code (English, German, French, Italian, Spanish, Portuguese)

Config.ThemeParkCanBeOwned = false -- enable this if you want to want to have theme park for sell for players - settings for management can be found in Config.ThemeParkOwnedSettings

Config.ThemeParkControlAttractions = false -- enable this function if you want to control the attractions manually (after enabling this function, the attractions will no longer turn on automatically) - settings for control attractions can be found in Config.ThemeParkControlMachineSettings

Config.ThemeParkTicketMachineSettings = {usedistance = 2.0, usekey = "E"}

Config.ThemeParkItemsSettings = {givedistance = 2.0, givekey = "G", throwkey = "F", buydistance = 2.0, buykey = "E"}

Config.MaximumParkDistance = 450.0 -- distance of view of attractions

Config.Target = false -- enable this if you want use target

Config.Targettype = "qtarget" -- types - qtarget, qbtarget, oxtarget

Config.TargetIcons = {managmenticon = "fa-solid fa-bars-progress", ticketicon = "fa-solid fa-cart-shopping", buyicon = "fa-solid fa-cart-shopping", seaticon = "fa-solid fa-chair", controlicon = "fa-solid fa-bars-progress"} 

Config.ThemeParkInteractionSystem = 1 -- 1 == Our custom interact system, 2 == 3D Text Interact, 3 == Gta V Online Interaction Style

Config.ThemeParkSeatKey = "E" -- theme park key for sit

Config.ThemeParkExitKey = "F" -- theme park key for exit

Config.ThemeParkAnimChangeKey = "E" -- theme park key for change anim

Config.ThemeParkDisableExit = false -- turn this feature on if you don't want players to leave the attraction during the ride.

Config.ThemeParkPass = false --  -- enable this if you want use theme park pass item, you need create item with name "themeparkpass" in your inventory/framework, also for standalone you need create usable item, example is in server/other.lua

Config.ThemeParkPassTime = 10 -- time when normal theme park expire when player use it (in minutes)

Config.ThemeParkAttractionFallChance = false -- enable this feature if you want the chance that the player will fall from the attraction, you can set the chance in Config.ThemeParkFallSettings

Config.ThemeParkDisabledByDefault = false -- enable this feature if you want to disable all attractions when the server starts, to enable attractions you have to enable them via the /enablethemepark command which is for administrators. (permissions for this command is in other.lua file)

Config.ThemeParkDisableTicketSystem = false -- enable this feature if you want free entry to all attractions

Config.AttractionsSettings = {
	gforce = {
		disable = false, -- enable this if you dont want to use this attraction
		usedistance = 1.5,  -- distance for use attraction
		waitforplayers = 20000, -- in miliseconds
		exitcoords = {coords = vector3(-1640.03, -1075.81, 12.15), heading = 52.5}, -- coordinates for exit the attraction
		animcooldown = 1000, -- in miliseconds
		ticketprice = 10, -- price for ticket
		speedmodifier = 1.0, -- attraction speed, default speed is 1.0
		maxrounds = 10, -- change this you want more rounds at maximum speed (changing this number to a higher number will change the duration of the attraction)
	},
	topscan = {
		disable = false, -- enable this if you dont want to use this attraction
		usedistance = 1.5, -- distance for use attraction
		waitforplayers = 20000, -- in miliseconds	
		exitcoords = {coords = vector3(-1619.91, -1073.14, 12.01), heading = 345.5}, -- coordinates for exit the attraction
		animcooldown = 1000, -- in miliseconds		
		ticketprice = 10, -- price for ticket
		speedmodifier = 1.0, -- attraction speed, default speed is 1.0
		maxrounds = 20, -- change this you want more rounds at maximum speed (changing this number to a higher number will change the duration of the attraction)
		normalstyle = true, -- change this if you want different style of top scan (Top Scan starts spinning at a different angle)
	},	
	vortex = {
		disable = false, -- enable this if you dont want to use this attraction
		usedistance = 1.5, -- distance for use attraction
		waitforplayers = 20000, -- in miliseconds	
		exitcoords = {coords = vector3(-1702.23, -1105.6, 12.15), heading = 321.5}, -- coordinates for exit the attraction
		animcooldown = 1000,			
		ticketprice = 10, -- price for ticket
		speedmodifier = 1.0, -- attraction speed, default speed is 1.0
		maxrounds = 2, -- change this you want more rounds at maximum speed (changing this number to a higher number will change the duration of the attraction)
	},	
	detonator = {
		disable = false, -- enable this if you dont want to use this attraction
		usedistance = 1.5, -- distance for use attraction
		waitforplayers = 20000, -- in miliseconds
		exitcoords = {coords = vector3(-1685.04, -1115.26, 12.15), heading = 352.5}, -- coordinates for exit the attraction		
		ticketprice = 10, -- price for ticket
		speedmodifier = 1.0, -- attraction speed, default speed is 1.0
		timeontop = 10000, -- in miliseconds (the time that the detonator will wait at the top before going down.)
	},	
	boat = {
		disable = false, -- enable this if you dont want to use this attraction
		usedistance = 1.5, -- distance for use attraction
		waitforplayers = 20000, -- in miliseconds
		exitcoords = {coords = vector3(-1660.67, -1115.0, 12.04), heading = 50.5}, -- coordinates for exit the attraction
		animcooldown = 1000, -- in miliseconds		
		ticketprice = 10, -- price for ticket
		speedmodifier = 1.0, -- attraction speed, default speed is 1.0
		maxrounds = 5, -- change this you want more rounds at maximum speed (changing this number to a higher number will change the duration of the attraction)
	},	
	bumpercars = {
		disable = false, -- enable this if you dont want to use this attraction
		bumperdespawncoords = {coords = vector3(-1639.6, -1067.51, 12.5), heading = 230.0}, -- coordinates for exit the attraction
		buydistance = 1.5,  -- distance for buy ticket
		seatdistance = 2.0, -- distance for seat as a passenger.
		minminutes = 1, -- minimum minutes in bumper cars
		maxminutes = 10, -- max minutes in bumper cars
		priceperminute = 10, -- price for ticket per minute
		maxplayers = 15, -- maximum number of players for bumper cars
		bumperusekey = "E", -- bumper cars key for seat as a passenger.
		bumperleavekey = "E",-- bumper cars key for leave bumper cars
		disablebumperkeyboard = true, -- turning off the keyboard when driving bumper cars
	},	
	ferris = {
		disable = false, -- enable this if you dont want to use this attraction
		usedistance = 2.5, -- distance for use attraction
		waitforplayers = 20000, -- in miliseconds
		ferrisseatanimcooldown = 1000, -- in miliseconds
		ferrisseatwait = 5000, -- in miliseconds
		ferrisexitcoords = {coords = vector3(-1686.27, -1098.77, 12.5), heading = 140.0}, -- coordinates for exit the attraction
		ticketprice = 10, -- price for ticket
	},	
	shootingrange = { -- If you have some script which block weapons, you can add some bypass to allow weapon_musket to be used withount inventory item use, we also trigger this event when shooting range is started TriggerEvent("rtx_themepark:Shooter:Started", true) and when shooting range ends TriggerEvent("rtx_themepark:Shooter:Started", false), you can create event handler for our event in your script
		disable = false, -- enable this if you dont want to use this attraction
		usedistance = 2.0, -- distance for use attraction
		maxtargets = 5, -- maximum number of targets
		defaultspeed = 0.010, -- base speed of targets
		maxspeed = 0.035, -- max speed of targets
		maxpeektargets = 50, -- maximum number of target hits
		maxmistakes = 5, -- maximum number of mistakes before cancellation
		timetoshoot = 5, -- maximum number of seconds to hit the target
		shootingrangeweapon = "weapon_musket", -- weapon name which you want to use in shootin range
		ticketprice = 10, -- price for ticket
		shootingrangeusekey = "E", -- shooting range key for start game.
	},	
	rollercoaster = {
		disable = false, -- enable this if you dont want to use this attraction
		soundeffect = true, -- enable this if you want sound effects for rollercoaster
		usedistance = 2.0, -- distance for use attraction
		waitforplayers = 5000, -- in miliseconds
		animcooldown = 1000, -- in miliseconds
		ticketprice = 10, -- price for ticket
		speedmodifier = 1, -- attraction speed, default speed is 1 (for roller coaster always increase the numbers by 1 digit, do not use decimal numbers)
	},		
}

Config.ThemeParkBlip = {
	blip = true, -- enable this if you want display blip on map
	blipcoords = vector3(-1646.97, -1083.27, 12.15), -- location of blip
	blipiconid = 266, -- icon type
	blipdisplay = 4, -- icon display
	blipcolor = 3, -- icon color
	blipshortrange = true, -- icon range
	blipscale = 1.0, -- icon scale
	bliptext = "Theme Park", -- text of blip
}

Config.ThemeParkFallSettings = {
	fallchance = 10, -- in percentage 1-1000
	fallchancecheck = 5, -- in seconds (for example it will trigger fall chance every 10 seconds when player is on the attraction)
	attractions = {
		gforce = true, -- enable this if you want to have chance to fall from this attraction
		topscan = true, -- enable this if you want to have chance to fall from this attraction
		vortex = true, -- enable this if you want to have chance to fall from this attraction
		detonator = true, -- enable this if you want to have chance to fall from this attraction
		boat = true, -- enable this if you want to have chance to fall from this attraction
		rollercoaster = true, -- enable this if you want to have chance to fall from this attraction
	},
}

Config.ThemeParkOwnedSettings = {
	enablepermissionsystem = false, -- enable this if you want use permissions system via ace, job, identifier (if you enable this function, theme park can no longer be purchased normally)
	themeparkcoords = vector3(-1631.3, -1055.77, 13.63),  -- coordinates for theme park managment
	themeparkprice = 10000, -- price of theme park
	themeparkdistance = 2.0, -- distance for theme park managment
	themeparkmaxtransferdistance = 2.0, -- maxdistance for transfer theme park
	sellmultipler = 0.5, -- sell multipler
	ticketmultipler = 0.5, -- the amount the theme park will receive from the ticket
	itemmultipler = 0.5, -- the amount the theme park will receive from the item
	openmanagmentkey = "E", -- key for open managment menu
	disablesell = false, -- enable this if you want disable sell function from managment menu
	disabletransfer = false, -- enable this if you want disable transfer function from managment menu
	acepermissionsforusemanagmentmenu = {enable = false, permission = "themepark.managment"}, -- enable this if you want to use ace permissions
	jobpermissionsforusemanagmentmenu = {enable = false, jobname = "themepark"},  -- enable this if you want to use job permissions (you need create job with name themepark or change the job title to something else)
	identifierspermissionsforusemanagmentmenu = false, -- enable this if you want to use identifiers permissions
	permissionsviaidentifiers = { -- permisisontypes - license, steam, xbox, live, discord, ip
		{permissiontype = "steam", permisisondata = "steam:11000013cc73739"}, -- this is example line
	},
}

Config.ThemeParkControlMachineSettings = {
	usedistance = 2.0, -- distance for theme park control attraction
	usekey = "E", -- key for open control attraction menu
	acepermissionsforusecontrolmenu = {enable = false, permission = "themepark.managment"}, -- enable this if you want to use ace permissions
	jobpermissionsforusecontrolmenu = {enable = false, jobname = "themepark"},  -- enable this if you want to use job permissions (you need create job with name themepark or change the job title to something else)
	identifierspermissionsforcontrolmenu = false, -- enable this if you want to use identifiers permissions
	permissionsviaidentifiers = { -- permisisontypes - license, steam, xbox, live, discord, ip
		{permissiontype = "steam", permisisondata = "steam:11000013cc73739"}, -- this is example line
	},
	attractions = {
		vortex = {
			coords = vector3(-1698.095, -1117.094, 13.12525), -- location of control machine
			rotation = vector3(0.0, 0.0, 140.0), -- rotation of control machine
			label = "VORTEX", -- label of control machine
			musiccoords = vector3(-1711.15, -1116.4, 14.0), -- location of music
			musicmaxdistance = 40.0, -- distance of music
			disablemusic = false, -- enable this if you want disable music
			disablesmoke = false, -- enable this if you want disable smoke
			smokecolor = {r = 255, g = 255, b = 255}, -- default color of smoke
			smokelocations = {
				{coords = vector3(-1704.8, -1115.56, 14.12), scale = 1.50, handler = nil},
				{coords = vector3(-1706.36, -1120.65, 14.12), scale = 1.50, handler = nil},
				{coords = vector3(-1711.06, -1123.14, 14.12), scale = 1.50, handler = nil},
				{coords = vector3(-1716.15, -1121.588, 14.12), scale = 1.50, handler = nil},
				{coords = vector3(-1718.64, -1116.88, 14.12), scale = 1.50, handler = nil},
				{coords = vector3(-1717.08, -1111.8, 14.12), scale = 1.50, handler = nil},
				{coords = vector3(-1712.34, -1109.28, 14.12), scale = 1.50, handler = nil},
				{coords = vector3(-1707.3, -1110.86, 14.12), scale = 1.50, handler = nil},
				{coords = vector3(-1707.3, -1110.86, 14.12), scale = 1.50, handler = nil},
				{coords = vector3(-1711.24, -1115.81, 14.12), scale = 2.0, handler = nil},
			},
		},
		bumpercars = {
			coords = vector3(-1634.112, -1056.608, 13.65577), -- location of control machine
			rotation = vector3(0.0, 0.0, 50.0), -- rotation of control machine
			label = "BUMPER CARS", -- label of control machine
			musiccoords = vector3(-1655.44, -1056.54, 14.0), -- location of music
			musicmaxdistance = 80.0, -- distance of music
			disablemusic = false, -- enable this if you want disable music
			disablesmoke = false, -- enable this if you want disable smoke		
			smokecolor = {r = 255, g = 255, b = 255}, -- default color of smoke
			smokelocations = {
				{coords = vector3(-1648.12, -1048.92, 14.0), scale = 5.0, handler = nil},
				{coords = vector3(-1657.14, -1059.94, 14.0), scale = 5.0, handler = nil},
				{coords = vector3(-1663.79, -1068.07, 14.0), scale = 5.0, handler = nil},
				{coords = vector3(-1669.39, -1074.92, 14.0), scale = 5.0, handler = nil},
				{coords = vector3(-1632.91, -1042.48, 14.0), scale = 5.0, handler = nil},
				{coords = vector3(-1663.57, -1050.88, 14.0), scale = 5.0, handler = nil},
				{coords = vector3(-1649.68, -1061.85, 14.0), scale = 5.0, handler = nil},
				{coords = vector3(-1662.39, -1076.57, 14.0), scale = 5.0, handler = nil},
				{coords = vector3(-1675.04, -1070.14, 14.0), scale = 5.0, handler = nil},
				{coords = vector3(-1643.33, -1053.85, 14.0), scale = 5.0, handler = nil},
			},
		},
		boat = {
			coords = vector3(-1653.704, -1115.887, 15.036606), -- location of control machine
			rotation = vector3(0.0, 0.0, 215.0), -- rotation of control machine
			label = "BOAT", -- label of control machine
			musiccoords = vector3(-1656.05, -1120.58, 20.49), -- location of music
			musicmaxdistance = 40.0, -- distance of music
			disablemusic = false, -- enable this if you want disable music
			disablesmoke = false, -- enable this if you want disable smoke		
			smokecolor = {r = 255, g = 255, b = 255}, -- default color of smoke
			smokelocations = {
				{coords = vector3(-1655.72, -1119.99, 15.4), scale = 2.0, handler = nil},
				{coords = vector3(-1659.06, -1122.29, 15.69), scale = 2.0, handler = nil},
				{coords = vector3(-1653.65, -1118.78, 15.4), scale = 2.0, handler = nil},
			},
		},
		rollercoaster = {
			coords = vector3(-1643.912, -1121.273, 17.34224), -- location of control machine
			rotation = vector3(0.0, 0.0, -40.0), -- rotation of control machine
			label = "ROLLERCOASTER", -- label of control machine
			musiccoords = vector3(-1646.03, -1127.34, 18.21), -- location of music
			musicmaxdistance = 40.0, -- distance of music
			disablemusic = false, -- enable this if you want disable music	
		},	
		detonator = {
			coords = vector3(-1690.872, -1137.998, 12.9149), -- location of control machine
			rotation = vector3(0.0, 0.0, -15.0), -- rotation of control machine
			label = "DETONATOR", -- label of control machine
			musiccoords = vector3(-1689.36, -1130.81, 35.1), -- location of music
			musicmaxdistance = 40.0, -- distance of music
			disablemusic = false, -- enable this if you want disable music
		},	
		gforce = {
			coords = vector3(-1643.50, -1082.98, 12.13256), -- location of control machine
			rotation = vector3(0.0, 0.0, 230.0), -- rotation of control machine
			label = "G-FORCE", -- label of control machine
			musiccoords = vector3(-1638.08, -1078.77, 40.45), -- location of music
			musicmaxdistance = 40.0, -- distance of music
			disablemusic = false, -- enable this if you want disable music	
		},	
		topscan = {
			coords = vector3(-1628.918, -1074.719, 12.05341), -- location of control machine
			rotation = vector3(0.0, 0.0, 210.0), -- rotation of control machine
			label = "TOP SCAN", -- label of control machine
			musiccoords = vector3(-1635.18, -1095.14, 35.75), -- location of music
			musicmaxdistance = 40.0, -- distance of music
			disablemusic = false, -- enable this if you want disable music	
		},
		ferris = {
			coords = vector3(-1679.532, -1099.854, 13.11942), -- location of control machine
			rotation = vector3(0.0, 0.0, 320.0), -- rotation of control machine
			label = "FERRIS WHEEL", -- label of control machine
			musiccoords = vector3(-1683.14, -1096.15, 39.67), -- location of music
			musicmaxdistance = 40.0, -- distance of music
			disablemusic = false, -- enable this if you want disable music	
		},		
	},		
}

Config.BumperCarsSpawnPoints = {
	{coords = vector3(-1665.37, -1084.3, 11.69), heading = 321.5, radius = 2.0},
	{coords = vector3(-1667.66, -1082.97, 11.69), heading = 321.5, radius = 2.0},
	{coords = vector3(-1670.72, -1080.28, 11.69), heading = 321.5, radius = 2.0},
	{coords = vector3(-1674.36, -1077.16, 11.69), heading = 321.5, radius = 2.0},
	{coords = vector3(-1678.63, -1074.1, 11.69), heading = 321.5, radius = 2.0},
	{coords = vector3(-1681.51, -1071.07, 11.69), heading = 321.5, radius = 2.0},
	{coords = vector3(-1628.0, -1042.7, 11.69), heading = 138.0, radius = 2.0},
	{coords = vector3(-1631.84, -1039.84, 11.69), heading = 138.0, radius = 2.0},
	{coords = vector3(-1633.76, -1037.89, 11.69), heading = 138.0, radius = 2.0},
	{coords = vector3(-1637.09, -1034.9, 11.69), heading = 138.0, radius = 2.0},
	{coords = vector3(-1643.35, -1029.65, 11.69), heading = 138.0, radius = 2.0},
	{coords = vector3(-1646.13, -1027.44, 11.69), heading = 138.0, radius = 2.0},
}

Config.Stands = {
	{
		coords = vector3(-1647.5, -1085.73, 12.14),
		standtype = "hotdog", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1649.97, -1090.43, 12.12),
		standtype = "balloon", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},	
	{
		coords = vector3(-1647.4, -1093.0, 12.08),
		standtype = "popcorn", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},	
	{
		coords = vector3(-1635.26, -1103.84, 12.02),
		standtype = "cotton", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},		
	{
		coords = vector3(-1616.14, -1056.79, 12.07),
		standtype = "balloon", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},	
	{
		coords = vector3(-1618.93, -1060.0, 12.07),
		standtype = "popcorn", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},	
	{
		coords = vector3(-1623.27, -1066.29, 12.07),
		standtype = "hotdog", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},	
	{
		coords = vector3(-1613.03, -1047.15, 12.11),
		standtype = "cotton", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},		
	{
		coords = vector3(-1667.91, -1145.63, 12.01),
		standtype = "cotton", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},		
	{
		coords = vector3(-1676.21, -1148.22, 12.01),
		standtype = "popcorn", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},	
	{
		coords = vector3(-1683.27, -1149.94, 12.01),
		standtype = "balloon", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},	
	{
		coords = vector3(-1696.45, -1098.79, 12.15),
		standtype = "balloon", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},	
	{
		coords = vector3(-1694.0, -1100.81, 12.15),
		standtype = "hotdog", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},	
	{
		coords = vector3(-1689.2, -1104.85, 12.15),
		standtype = "popcorn", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},	
	{
		coords = vector3(-1682.61, -1109.75, 12.15),
		standtype = "cotton", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},	
	{
		coords = vector3(-1617.53, -1044.0, 12.15),
		standtype = "burger", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},	
	{
		coords = vector3(-1638.56, -1113.89, 12.02),
		standtype = "burger", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},	
	{
		coords = vector3(-1691.91, -1111.48, 12.15),
		standtype = "burger", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},		
}

Config.ShootingRangePrizes = {
	{ -- score number
		minimumscore = 10, -- minimum score
		prizetype = "money",  -- prize type (you need add your types yourself in server/other.lua
		prizedata = 100, -- prize data example money amount
		prizelabel = "Money", -- prize label
	},
	{ -- score number
		minimumscore = 100, -- minimum score
		prizetype = "money",  -- prize type (you need add your types yourself in server/other.lua
		prizedata = 1000, -- prize data example money amount
		prizelabel = "Money", -- prize label
	},	
}

Config.PlayerLoadedEvent = { -- load methods of theme park
	esx = "esx:playerLoaded", 
	qbcore = "QBCore:Client:OnPlayerLoaded",
	standalone = "playerLoaded",
	customevent = true, -- enable this if you dont want load theme park after player loaded to server. (enable this for example for servers with multicharacter)
	standaloneevent = false, -- enable this if you dont want load theme park after player loaded to server. (for standalone version)
}

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords()) 
	if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 255)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 240
		DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 255, 102, 255, 150)
	end
end

function Notify(text)
	exports["rtx_notify"]:Notify("Theme Park", text, 5000, "info") -- if you get error in this line its because you dont use our notify system buy it here https://rtx.tebex.io/package/5402098 or you can use some other notify system just replace this notify line with your notify system
	--exports["mythic_notify"]:SendAlert("inform", text, 5000)
end

function AddBumperKey(vehicle)
	-- if you use some vehicle key system, add here your function for add keys (name of vehicle is rtxbumper)
end

function IncreaseHunger(itemtype)
	if itemtype == "hotdog" then
		-- You can add here your function for decrease hunger 
	elseif itemtype == "burger" then
		-- You can add here your function for decrease hunger 
	end
end