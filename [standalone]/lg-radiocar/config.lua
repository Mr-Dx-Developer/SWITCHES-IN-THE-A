Config = {}

--Change this only if you have ESX
Config.ESX = "esx:getSharedObject"

-- Debug
Config.Debug = false

-- Should this be opened only from command ?
Config.EnableCommand = true

-- Name for the command ?
Config.CommandLabel = "carradio"

-- Key to open radio
Config.KeyForRadio = nil

-- Distance playing from car
Config.DistancePlaying = 10

--  if the engine is off the music will be disabled until the engine is on
Config.DisableMusicAfterEngineIsOFF = false

-- Only owner of the car can play a music from the vehicle.
Config.OnlyOwnerOfTheCar = false

-- Radio in car can be used only for people who own the car
-- this can prevent from trolling streamers, i believe many kids
-- will try play some troll music and try to get streamer banned.
Config.OnlyOwnedCars = false

-- this will only let use cars that have installed radio as an item in the car
-- means no car without installed radio before can use it..
-- you have to implement it somewhere by yourself.
-- if you wish to know more about this, please read "readme.md"
Config.OnlyCarWhoHaveRadio = false

-- Default music volume
Config.defaultVolume = 0.3

-- who can touch the radio from what seat?
-- https://docs.fivem.net/natives/?_0xBB40DD2270B65366
Config.AllowedSeats = {
    [-1] = true,
    [0] = true,
}

-- if you have some car that has big speakers or something like that
-- you can increase/decrease distance of playing music
Config.CustomDistanceForVehicles = {
    --[GetHashKey("bus")] = 25,
}


-- Blacklisted vehicles
Config.blacklistedCars = {
    -- bikes
    GetHashKey("bmx"),
    GetHashKey("cruiser"),
    GetHashKey("fixter"),
    GetHashKey("scorcher"),
    GetHashKey("tribike"),
    GetHashKey("tribike2"),
    GetHashKey("tribike3"),

    -- other
    GetHashKey("thruster"),
}

-- this whitelist isnt really a whitelist..
-- if you set for an example "anyBoat = false"
-- you can allow one boat from other many to use radio.
Config.whitelistedCars = {
    -- car
    --GetHashKey("car name here"),
}

-- Blacklisted categories vehicles
Config.blackListedCategories = {
	anyVehicle= true,
    anyBoat   = true,
    anyHeli   = false,
    anyPlane  = true,
    anyCopCar = true,
    anySub    = false,
    anyTaxi   = true,
    anyTrain  = true,
}

-- List default station for radio
-- please dont add more than 6.. if you add more than 6 you need to edit html
Config.defaultList = {
    {
        label = "Music 1",
        url   = "",
    },
    {
        label = "Music 2",
        url   = "",
    },
    {
        label = "Music 3",
        url   = "",
    },
    {
        label = "Music 4",
        url   = "",
    },
    {
        label = "Music 5",
        url   = "",
    },
    {
        label = "Music 6",
        url   = "",
    },
}

