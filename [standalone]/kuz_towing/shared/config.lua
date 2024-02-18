Config = {}
Locale = {}

Config.Debug = false

-- Displayed text (Use these settings to translate to your language)
Locale.press_to_attach = 'Press to attach'
Locale.press_to_detach = 'Detach all ropes'
Locale.vehicles_locked = 'This vehicle is locked and therefore cannot be towed'


-- Enable or disable the use of command which opens up the towing menu
Config.useTowingCommand = false
-- Command that will open the towing menu if enabled (Without the slash /)
Config.towingCommand = 'towpls'


-- How long the towing rope should be (in meters) I highly recommend keeping it between 6 and 10 meters
Config.ropeLength = 15

-- Time in seconds, how long it should take between each re-sync of the ropes, (30 seconds works well, for big servers you can make it higher)
Config.ropeSyncDuration = 30

-- Max speed (in MPH) of vehicles which are towing or being towed (set to -1 to disable speed limiting)
Config.maxTowingSpeed = 300

-- Whether we should disallow players from attaching ropes to locked vehicles
-- (For example. To prevent them from stealing vehicles of other players)
Config.checkForLocks = true

---------- ESX Only Settings -----------
-- If your server is running on ESX you can enable it to use the towing rope item
Config.useEsx = false
-- You need to add the rope item to your database yourself !
Config.towRopeItem = 'towing_rope'
----------------------------------------

-- Classes of which vehicles may not be towed or tow another vehicle
Config.blacklistedClasses = {
    8, -- Motorcycles
    13, -- Cycles
    14, -- Boats
    15, -- Helicopters
    16, -- Planes
    21, -- Trains
}

--[[ All vehicle classes
    0: Compacts
    1: Sedans
    2: SUVs
    3: Coupes
    4: Muscle
    5: Sports Classics
    6: Sports
    7: Super
    8: Motorcycles
    9: Off-road
    10: Industrial
    11: Utility
    12: Vans
    13: Cycles
    14: Boats
    15: Helicopters
    16: Planes
    17: Service
    18: Emergency
    19: Military
    20: Commercial
    21: Trains
]]
