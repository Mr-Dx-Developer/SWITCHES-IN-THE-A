Config = {}

-- General Settings

Config.MinimumPolice = 2
Config.CallCopsChance = 50 -- %Chance to alert police
Config.RunCost = 500

Config.EnableCooldown = false
Config.Cooldown = 600 -- Seconds * Recommended to have some form of cooldown!

Config.SendEmail = true -- The E-Mail received upon taking on a job
Config.EnableAnimation = true -- Animation that plays upon talking to the boss
Config.Animation = "argue" -- Full list of emotes from dpEmotes can be found on the forum release page.

Config.PrintChance = true  -- This will print the chance numbers, when someone delivers a package into your server console.

-- Blip Creation

Config.UseBlip = false

Config.BlipLocation = {
	{title="Mysterious Person", colour=1, id=51, x = -1564.62, y = -441.77, z = 36.8}
} 

-- Blip Settings for Supplier/Routes

Config.OxySupplierColour = 11 -- This is the color or the marking that shows from your location to the location
Config.OxySupplierRoute = true -- true/false to turn of the route markings and only show blips

Config.OxyRouteColour = 11 -- This is the color or the marking that shows from your location to the location
Config.OxyRouteGPS = true -- true/false to turn of the route markings and only show blips

-- Ped Spawns

Config.BossPed = {
    `a_m_m_mlcrisis_01`,
}

Config.SupplierPeds = {
    `a_m_y_skater_01`,
    `a_m_y_vinewood_03`,
    `a_m_y_soucent_02`,
    `a_m_y_soucent_03`,
    `a_m_y_methhead_01`,
    `a_m_m_eastsa_01`,
    `a_m_m_genfat_01`,
    `a_m_m_mexlabor_01`,
}

Config.BossLocation = {
    vector4(-1563.99, -441.44, 36.89, 101.3)
}

Config.PickUpLocations = {
    vector4(608.79, -459.17, 24.74, 181.92),
    vector4(1250.83, -2562.04, 42.71, 219.28),
    vector4(740.43, -2634.68, 6.47, 189.84),
    vector4(-1161.83, -1250.07, 6.8, 306.16),
    vector4(-2223.13, -365.75, 13.32, 260.99),
    vector4(-2982.84, 1585.71, 23.82, 359.91),
    vector4(-287.47, 2535.68, 75.47, 271.17),
    vector4(1583.08, 3620.96, 38.78, 134.18)
}

-- Items

Config.GiveItem = true 
Config.ItemReward = "oxy"
Config.MaxItemReward = 5
Config.MinItemReward = 3

Config.SpecialRewardChance = 5
Config.SpecialItem = "security_card_01"
Config.MaxSpecialReward = 1
Config.MinSpecialReward = 1

-- Money

Config.CleanMoney = true

Config.BagChance = 25 -- Marked Bills

Config.BandMaxPayout = 2000
Config.BandMinPayout = 750
Config.BandChance = 15 

Config.RollMaxPayout = 750
Config.RollMinPayout = 250
Config.RollChance = 20


-- NPC Route Spawn

Config.DriveStyle = 39 -- THIS CAN BE CHANGED AT https://www.vespura.com/fivem/drivingstyle/
Config.MaxDeliveries = 6
Config.MinDeliveries = 4 
Config.Cars = {"glendale", "ingot", "buccaneer2"} 
Config.MaxTimeBetweenCars = 30 
Config.MinTimeBetweenCars = 15 
Config.DriverPed = "s_m_m_gentransport" 

Config.Routes = { -- HERE YOU CAN ADD AS MANY LOCATIONS AS YOU WANT TO

{
    info = {
        occupied = false,
        hash = "", -- DON'T TOUCH
        oxyNum = 1, -- DON'T TOUCH
        routeNum = 1, -- NEENDS TO BE SET TO THE ORDER IT COMES IN THE LIST
        startHeading = 121.76 -- HEADING OF CAR WHEN IT SPAWNS IN
    },
    locations = {
        { pos = vector3(-691.34, -1058.22, 14.5), stop = false }, -- SPAWN POINT
        { pos = vector3(-742.16, -1047.58, 12.3), stop = true }, -- WAIT FOR DELIVER
        { pos = vector3(-745.23, -915.48, 19.34), stop = false }, -- DESPAWN POINT
    }
},
{
    info = {
        occupied = false,
        hash = "", -- DON'T TOUCH
        oxyNum = 1, -- DON'T TOUCH
        routeNum = 2, -- NEENDS TO BE SET TO THE ORDER IT COMES IN THE LIST
        startHeading = 46.79 -- HEADING OF CAR WHEN IT SPAWNS IN
    },
    locations = {
        { pos = vector3(-166.94, -1700.22, 31.75), stop = false }, -- SPAWN POINT FORUM DRIVE
        { pos = vector3(-118.38, -1610.66, 31.4), stop = true }, -- WAIT FOR DELIVER
        { pos = vector3(-51.5, -1601.91, 28.71), stop = false }, -- DESPAWN POINT
    }
},
{
    info = {
        occupied = false,
        hash = "", -- DON'T TOUCH
        oxyNum = 1, -- DON'T TOUCH
        routeNum = 3, -- NEENDS TO BE SET TO THE ORDER IT COMES IN THE LIST
        startHeading = 159.00 -- HEADING OF CAR WHEN IT SPAWNS IN
    },
    locations = {
        { pos = vector3(253.96, -141.63, 64.63), stop = false }, -- SPAWN POINT ALTA PLACE
        { pos = vector3(220.58, -166.64, 56.64), stop = true }, -- WAIT FOR DELIVER
        { pos = vector3(18.89, -90.41, 58.64), stop = false }, -- DESPAWN POINT
    }
},
{
    info = { 
        occupied = false,
        hash = "", -- DON'T TOUCH
        oxyNum = 1, -- DON'T TOUCH
        routeNum = 4, -- NEENDS TO BE SET TO THE ORDER IT COMES IN THE LIST
        startHeading = 157.19 -- HEADING OF CAR WHEN IT SPAWNS IN
    },
    locations = {
        { pos = vector3(19.9, -51.4, 64.95), stop = false }, -- SPAWN POINT
        { pos = vector3(-15.09, -77.05, 57.07), stop = true }, -- WAIT FOR DELIVER
        { pos = vector3(-80.28, 43.64, 71.83), stop = false }, -- DESPAWN POINT
    }
},
}