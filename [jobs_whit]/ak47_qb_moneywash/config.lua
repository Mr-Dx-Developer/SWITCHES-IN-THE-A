Config = {}
Config.Locale = 'en'

Config.WashAll = true           -- if disabled, it will wash 1 marked bill at a time
Config.RemoveOnUse = false      -- you will not get back your laundrycard if enabled
Config.WashTimeMultiplier = 30  -- 30 sec per 10k
Config.WashingTax = 0.80        -- player will get 80% money
Config.WaitAfterWash = 5        -- minutes (this is also the cooldown time, you can't disable cooldown)

Config.Item = 'markedbills'
Config.HasMetaData = true --if you are using any different item then make it false

Config.Keys = {
    [1] = 38, --E
    [2] = 74, --H
}

Config.LoadDistance = 10.0

Config.LaundryPlaces = {
    [1] = {
        pos = vector3(1122.47, -3194.43, -40.4), -- marker position
        machine = {
            pos = vector4(1122.42, -3193.51, -41.39, 0.0),
            state = 1,
        }
    },
    [2] = {
        pos = vector3(1123.91, -3194.42, -40.4),
        machine = {
            pos = vector4(1123.88, -3193.49, -41.39, 0.0),
            state = 1,
        }
    },
    [3] = {
        pos = vector3(1125.37, -3194.44, -40.4),
        machine = {
            pos = vector4(1125.35, -3193.49, -41.39, 0.0),
            state = 1,
        }
    },
    [4] = {
        pos = vector3(1126.83, -3194.46, -40.4),
        machine = {
            pos = vector4(1126.82, -3193.49, -41.39, 0.0),
            state = 1,
        }
    },
}

Config.Blips = {
    {enable = true, pos = vector3(255.76, 274.29, 105.81), name = 'Money Wash', sprite = 207, size = 1.0, color = 40}, -- to disable blip, remove this line or make enable = false
}

Config.Teleports = {
    ['Money Wash'] = {enter = vector3(255.76, 274.29, 105.81), exit = vector3(1138.05, -3199.19, -39.67)},
}

Config.Props = {
    [1] = `bkr_prop_prtmachine_dryer`,
    [2] = `bkr_prop_prtmachine_dryer_op`,
    [3] = `bkr_prop_prtmachine_dryer_spin`,
}