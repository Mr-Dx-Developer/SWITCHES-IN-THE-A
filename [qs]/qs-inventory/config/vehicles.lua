--[[
    Vehicle configuration system!
    Add your custom vehicles, and in BackEngineVehicles, you
    can configure the vehicles that bring the stash in front of it.
]]

Config.IsVehicleOwned = false        -- If you enable this function, only trunks that have an owner will be saved!
Config.UseItemInVehicle = true       -- Disables the use of items in vehicles
Config.WeaponsOnVehicle = true       -- By enabling this, you disable any weapons inside the vehicle (false consume performance)

Config.OpenTrunkAll = true           -- Set to true to allow all players to open the trunk of the vehicles / Set false to allow only the owner of the vehicle to open the trunk
Config.OpenTrunkPolice = true        -- If the option above its set to false, set if the police can open the trunk or not anyways
Config.OpenTrunkPoliceGrade = 0      -- Grade from the police will be able to open the trunks

Config.OpenGloveboxesAll = true      -- Set to true to allow all players to open the glovebox of the vehicles / Set false to allow only the owner of the vehicle to open the glovebox
Config.OpenGloveboxesPolice = true   -- If the option above its set to false, set if the police can open the trunk or not anyways
Config.OpenGloveboxesPoliceGrade = 0 -- Grade from the police will be able to open the gloveboxs

Config.VehicleClass = {
    -- Vehicle class list: https://docs.fivem.net/natives/?_0x29439776AAA00A62
    [0] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 38000, slots = 30 } },
    [1] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 50000, slots = 40 } },
    [2] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 75000, slots = 50 } },
    [3] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 42000, slots = 35 } },
    [4] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 38000, slots = 30 } },
    [5] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 30000, slots = 25 } },
    [6] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 30000, slots = 25 } },
    [7] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 30000, slots = 25 } },
    [8] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 15000, slots = 15 } },
    [9] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 60000, slots = 35 } },
    [10] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 60000, slots = 35 } },
    [11] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 60000, slots = 35 } },
    [12] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 35 } },
    [13] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 0, slots = 0 } },
    [14] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } },
    [15] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } },
    [16] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } },
    [17] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } },
    [18] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } },
    [19] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } },
    [20] = { ['glovebox'] = { maxweight = 100000, slots = 5 }, ['trunk'] = { maxweight = 120000, slots = 50 } }
}

Config.CustomTrunk = {
    [joaat('adder')] = {
        slots = 5,
        maxweight = 100000
    },
}

Config.CustomGlovebox = {
    [joaat('adder')] = {
        slots = 5,
        maxweight = 100000
    },
}

Config.BackEngineVehicles = {
    [`ninef`] = true,
    [`adder`] = true,
    [`vagner`] = true,
    [`t20`] = true,
    [`infernus`] = true,
    [`zentorno`] = true,
    [`reaper`] = true,
    [`comet2`] = true,
    [`comet3`] = true,
    [`jester`] = true,
    [`jester2`] = true,
    [`cheetah`] = true,
    [`cheetah2`] = true,
    [`prototipo`] = true,
    [`turismor`] = true,
    [`pfister811`] = true,
    [`ardent`] = true,
    [`nero`] = true,
    [`nero2`] = true,
    [`tempesta`] = true,
    [`vacca`] = true,
    [`bullet`] = true,
    [`osiris`] = true,
    [`entityxf`] = true,
    [`turismo2`] = true,
    [`fmj`] = true,
    [`re7b`] = true,
    [`tyrus`] = true,
    [`italigtb`] = true,
    [`penetrator`] = true,
    [`monroe`] = true,
    [`ninef2`] = true,
    [`stingergt`] = true,
    [`surfer`] = true,
    [`surfer2`] = true,
    [`gp1`] = true,
    [`autarch`] = true,
    [`tyrant`] = true
}
