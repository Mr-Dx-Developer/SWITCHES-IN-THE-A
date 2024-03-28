Config = {}

Config.TVs = {}

Config.Framework = "qbcore"  -- types (standalone, qbcore, esx, custom)

Config.ESXFramework = {
	newversion = false, -- use this if you using new esx version (if you get error with old esxsharedobjectmethod in console)
	getsharedobject = "esx:getSharedObject",
	resourcename = "es_extended"
}

Config.QBCoreFrameworkResourceName = "qb-core" -- qb-core resource name, change this if you have different name of main resource of qbcore

Config.InterfaceColor = "#ff66ff" -- change interface color, color must be in hex

Config.Language = "English" -- text language from code, if you want translate interface, you need do it manually in html folder.

Config.TvForItem = true -- this will enable tv open via item

Config.TvForCommand = false -- this will enable tv open via command

Config.TvCommand = "tv" -- command for open tv

Config.TelevisionObjectPlacer = false -- while is this enable, it will spawn television objects which is in config Config.TelevisionObjectsLocations

Config.TelevisionPermissions = false -- enable this if you want use permission system for some locations, you need define locations in Config.TelevisionPermissionsLocations

Config.VehicleTelevisionOffSetsCreator = true --enable this only on dev server, you can open offset menu via /tvcreator command

Config.VehicleTelevision = true -- this will enable vehicle television system

Config.VehicleTelevisionForEveryVehicle = true -- if you enable this, television will work on every vehicles, if its disabled, it will work only in vehicles which is writed in Config.TelevisonVehicles. 

Config.VehicleTelevisionBlacklist = false -- if you enable this, television will work not for vehicles which is in blacklisted config, you need put vehicles in Config.TelevisonBlacklistedVehicles. 

Config.VehicleTelevisionoForOnlySpecifiedTypeOfVehicle = false --- if you enable this, television will work only for specified vehicle (Vehicle Class) you need enable class in Config.TelevisonVehiclesClasses

Config.VehicleTelevisionItem = false -- if you enable this, vehicle television will work only for vehicles which have installed tv via item or via event. Only works for qbcore and esx!

Config.VehicleTelevisionEvent = false --TriggerServerEvent("rtx_tv:InstallVehicleTVCustom", vehicleplate, vehiclenetworkid) --clientside export for check if vehicle have installed tv exports["rtx_tv"]:HasVehicleTV(vehicle) Only works for qbcore and esx!

Config.EditorColor = {r = 255, g = 102, b = 255} -- television editor color

Config.EnableRoutingBucketTv = true -- enable this if you want "instanced tvs" for example if you use some apartment system which use same interior for x players.

Config.EnableImagesForTv = false -- enable putting images to tv (png, gif, jpg)

Config.EnableWebsitesForTv = true -- enable other websites for tv, you can view any website in tv (you cannot scroll or interact with it) (be sure to add websites in blacklist if you want blacklist some website)

Config.EnableVideosFromFolder = true -- enable this if you want play videos which is in rtx_tv/html/videos folder, you must add also video name and filename in Config.VideoList

Config.StreamerModeCommand = "streamermode" -- command for disable music for example for streamers, when player will use this command he will not hear music from televisions

Config.BlacklistedWebsites = {
    "websitelink.com",
}	

Config.VideoList = {
	["video1"] = {
		videoname = "test", -- video name, this name you will write to the video url in the input of the tv to play it
		filename = "video2.mp4", -- video file name (you need place the video to rtx_tv/html/videos folder)
	},
	["video2"] = {
		videoname = "test", -- video name, this name you will write to the video url in the input of the tv to play it
		filename = "video2.mp4", -- video file name (you need place the video to rtx_tv/html/videos folder)
	},
}

Config.EnabledLinkTypes = { -- you can enable or disable the link type here
    ["youtube"] = true,
    ["twitch"] = true,
    ["streamable"] = true,
    ["facebook"] = true,
    ["dailymotion"] = true,
    ["vimeo"] = true,
	["soundcloud"] = true,
	["mp4"] = true,
	["mp3"] = true,
    ["bilibili"] = true,
    ["huya"] = true,
    ["aparat"] = true,
	["kick"] = true,
}	

Config.TelevisionObjects = {
	{
		object = "prop_tv_flat_01", --object name
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target
		rendertargetname = "tvscreen", -- render target name
	},
	{
		object = "v_ilev_cin_screen", --object name
		maxdistance = 40.0, --max distance for display screen
		maxcontroldistance = 20.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target
		rendertargetname = "cinscreen", -- render target name
	},
	{
		object = "vw_prop_vw_cinema_tv_01", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},
	{
		object = "prop_tv_flat_michael", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "prop_trev_tv_01", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},
	{
		object = "prop_tv_flat_03b", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "prop_tv_flat_03", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "prop_tv_flat_02b", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "prop_tv_flat_02", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},		
	{
		object = "hei_heist_str_avunitl_03", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "mp_b_str_avunitl_03", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "mp_b_str_avunits_01", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "mp_b_str_avunitl_01", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "hei_heist_str_avunitl_01", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "hei_heist_str_avunits_01", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},		
	{
		object = "apa_mp_h_str_avunitl_04", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "apa_mp_h_str_avunitl_01_b", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "apa_mp_h_str_avunits_01", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},		
	{
		object = "apa_mp_h_str_avunits_04", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},
	{
		object = "prop_tv_01", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "prop_tv_02", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},
	{
		object = "prop_tv_03", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "prop_tv_04", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "prop_tv_05", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "prop_tv_06", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},		
	{
		object = "prop_tv_07", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "ex_prop_ex_tv_flat_01", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "ex_tvscreen"
	},	
	{
		object = "sm_prop_smug_tv_flat_01", 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tv_flat_01"
	},
	{
		object = "prop_tv_test", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "des_tvsmash_root", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{
		object = "des_tvsmash_start", --object name 
		maxdistance = 15.0, --max distance for display screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = true, -- enable render target 
		rendertargetname = "tvscreen", -- render target name
	},	
	{ --  Armitage Games Club
		scale = vector3(0.380, 0.158, 1.0), -- rendertarget scale
		maxdistance = 100.0, --max distance for display screen--max distance for view screen
		maxcontroldistance = 50.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = false, -- enable render target
		nonobject = true,  -- enable this if you want use just screen, withount rendering on object
		nonobjectcoords = vector3(2399.82, 3016.64, 34.8), -- screen cordinates
		nonobjectrotation = vector3(0.0, 0.0, 180.0), -- screen rotation
	},			
	--[[ --This is example for television withount rendertarget with gfx (you need download generic_texture_renderer_gfx for this https://forum.cfx.re/t/release-generic-dui-2d-3d-renderer/131208)
	{
		object = "prop_tv_flat_01", --object name
		scale = vector3(0.05, 0.05, 1.0), -- rendertarget scale
		position = vector3(-0.925, -0.055, 1.0),  -- rendertarget position
		rotation = vector3(0.0, 0.0, 0.0), -- rendertarget rotation
		maxdistance = 15.0, --max distance for display screen--max distance for view screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = false, -- enable render target
		nonobject = false, -- enable this if you want use just screen, withount rendering on object
	},	
	]]--
	--[[ --This is example for television withount rendertarget with gfx withount object (you need download generic_texture_renderer_gfx for this https://forum.cfx.re/t/release-generic-dui-2d-3d-renderer/131208)
	{
		scale = vector3(0.465, 0.263, 1.0), -- rendertarget scale
		maxdistance = 100.0, --max distance for display screen--max distance for view screen
		maxcontroldistance = 15.0, -- max distance for control tv (its cannot be higher than maxdistance)
		rendertarget = false, -- enable render target
		nonobject = true,  -- enable this if you want use just screen, withount rendering on object
		nonobjectcoords = vector3(137.982, -986.145, 42.751), -- screen cordinates
		nonobjectrotation = vector3(0.0, 0.0, 289.1), -- screen rotation
	},	
	]]--	
}

Config.TelevisionObjectsLocations = { -- You need enable Config.TelevisionObjectPlacer for use this
	{
		objectname = "prop_tv_flat_01", -- object name
		coords = vector3(244.47, -876.58, 30.49), -- object coords
		rotation = vector3(0.0, 0.0, 0.0), -- object coords
		handler = nil,
	},
}

Config.TelevisionPermissionsLocations = { -- You need enable Config.TelevisionPermissions for use this
	{
		coords = vector3(320.1257, 248.6608, 86.56934), -- tv coords
		acepermissions = {enable = false, permission = "rtxtv.cinema"}, -- enable this if you want to use ace permissions (-- example in server.cfg add_ace identifier.steam:11000013cc73739 "rtxtv.cinema" allow)
		jobpermissions = {enable = false, jobname = "cinema"},  -- enable this if you want to use job permissions (you need create job with name themepark or change the job title to something else)
		identifierspermissions = false, -- enable this if you want to use identifiers permissions
		permissionsviaidentifiers = { -- permisisontypes - license, steam, xbox, live, discord, ip
			{permissiontype = "steam", permisisondata = "steam:11000013cc73739"}, -- this is example line
		},
	},
}

Config.TelevisonVehicles = {
	{
		vehiclename = "bullet", -- vehicle name
	},
	{
		vehiclename = "infernus", -- vehicle name
	},		
}

Config.TelevisonBlacklistedVehicles = {
	{
		vehiclename = "rhino", -- vehicle name
	},
	{
		vehiclename = "thruster", -- vehicle name
	},	
}

Config.TelevisonVehiclesClasses = {
	[0] = true,
	[1] = true,
	[2] = true,
	[3] = true,
	[4] = true,
	[5] = true,
	[6] = true,
	[7] = true,
	[8] = true,
	[9] = true,
	[10] = true,
	[11] = true,
	[12] = true,
	[13] = false,
	[14] = false,
	[15] = false,
	[16] = false,
	[17] = true,
	[18] = true,
	[19] = true,
	[20] = true,
	[21] = true,
	[22] = true,
}

Config.TelevisonVehiclesOffsetsDefault = {
	vehiclebone = "windscreen", -- vehicle bone name, 
	offsetx = 0.0, -- screen offset x
	offsety = 0.40, -- screen offset y
	offsetz = 0.41, -- screen offset z
	rotation = vector3(0.0, 0.0, 0.0), -- screen rotation
}

Config.TelevisonVehiclesOffsets = {
	{
		vehiclename = "bullet", -- vehicle name 
		televisions = {
			{	
				vehiclebone = "windscreen",
				offsetx = 0.0,
				offsety = 0.40,
				offsetz = 0.41,
				rotation = vector3(0.0, 0.0, 0.0),
			},
		},		
	},
	{
		vehiclename = "tyrant", -- vehicle name 
		televisions = {
			{	
				vehiclebone = "windscreen",
				offsetx = 0.0,
				offsety = 0.82,
				offsetz = 0.71,
				rotation = vector3(0.0, 0.0, 0.0),
			},
		},
	},	
	{
		vehiclename = "schafter6", -- vehicle name
		televisions = {
			{	
				vehiclebone = "windscreen",
				offsetx = 0.0,
				offsety = 0.40,
				offsetz = 0.41,
				rotation = vector3(0.0, 0.0, 0.0),
			},
			{	
				vehiclebone = "windscreen",
				offsetx = 0.40,
				offsety = -0.53,
				offsetz = 0.62,
				rotation = vector3(0.0, 0.0, 0.0),
			},	
			{	
				vehiclebone = "windscreen",
				offsetx = -0.40,
				offsety = -0.53,
				offsetz = 0.62,
				rotation = vector3(0.0, 0.0, 0.0),
			},					
		},
	},	
	{
		vehiclename = "baller2", -- vehicle name 
		televisions = {
			{	
				vehiclebone = "windscreen",
				offsetx = 0.0,
				offsety = 0.63,
				offsetz = 0.4,
				rotation = vector3(0.0, 0.0, 0.0),
			},
			{	
				vehiclebone = "windscreen",
				offsetx = 0.505,
				offsety = -0.525,
				offsetz = 0.5,
				rotation = vector3(0.0, 0.0, 0.0),
			},
			{	
				vehiclebone = "windscreen",
				offsetx = -0.505,
				offsety = -0.525,
				offsetz = 0.5,
				rotation = vector3(0.0, 0.0, 0.0),
			},				
		},
	},	
	{
		vehiclename = "luxor2", -- vehicle name 
		televisions = {
			{	
				vehiclebone = "windscreen",
				offsetx = 0.0,
				offsety = 3.81499999,
				offsetz = 1.04,
				rotation = vector3(31.0, 0.0, 0.0),
			},	
			{	
				vehiclebone = "windscreen",
				offsetx = 0.0,
				offsety = 1.9,
				offsetz = 1.04,
				rotation = vector3(31.0, 0.0, 180.75),
			},				
		},		
	},	
}


function Notify(text)
	exports["rtx_notify"]:Notify("Television", text, 5000, "info") -- if you get error in this line its because you dont use our notify system buy it here https://rtx.tebex.io/package/5402098 or you can use some other notify system just replace this notify line with your notify system
	--exports["mythic_notify"]:SendAlert("inform", text, 5000)
end