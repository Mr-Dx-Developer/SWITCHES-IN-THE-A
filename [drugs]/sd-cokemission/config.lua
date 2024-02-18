Config = {}

-- General Settings

Config.MinimumPolice = 0
Config.RunCost = 100000 
Config.PedCooldown = 3800 -- Seconds * Recommended to have some form of cooldown!

Config.BlackoutRestoration = 15 -- Minutes

-- Starting Ped

Config.Peds = {
    {
        type = 'cokeman',
        position = vector4(-1200.94, -266.44, 37.92, 32.82)
    },
    {
        type = 'cokeman2',
        position = vector4(1152.57, -431.85, 67.01, 76.41)
    }
}

-- Blip Creation

Config.UseBlip = false

Config.BlipLocation = {
    {title="Shady Dealer", colour=2, id=514, x = 1151.38, y = -431.12, z = 67.01},
    {title="Los Santos Department of Power & Water", colour=0, id=354, x = 682.72, y = 113.96, z = 93.81},
    {title="Mysterious Man", colour=0, id=499, x = -1202.47, y = -264.84, z = 37.77},
}

-- Coke Breaking down..

Config.CokeMainItem = 'coke_brick'

Config.CokeBaggyItem = 'cokebaggy'
Config.CokeAmount = 15

-- Boat Spawn

Config.EnableBoat = true
Config.Boatspawn = vector3(2225.68, 4018.5, 36.33)

-- Submerged Vehicle Spawns

Config.CarSpawn = vector3(-3426.81, 1700.72, -61.1)
Config.CarSpawn2 = vector3(-3604.48, 867.09, -51.46)
Config.CarSpawn3 = vector3(-3085.08, 2819.58, -35.47)

-- Email

Config.SendEmail = true

-- Set to true if you don't want to do a Blackout

Config.DisableBlackoutRequirement = true

-- Vehicle Trunk Contents

Config.Package = {
    [1] = {
        name = "sealedpackage",
        amount = 1,
        info = {},
        type = "item",
        slot = 1,
    },
}

Config.Package2 = {
    [1] = {
        name = "sealedpackage",
        amount = 1,
        info = {},
        type = "item",
        slot = 1,
    },
}

Config.Package3 = {
    [1] = {
        name = "sealedpackage",
        amount = 1,
        info = {},
        type = "item",
        slot = 1,
    },
}

-- Selling Item

Config.EnableSelling = true

Config.SellItem = "sealedpackage"

Config.SellInfo  = {
    { item = "sealedpackage", price = 100000 },
}

