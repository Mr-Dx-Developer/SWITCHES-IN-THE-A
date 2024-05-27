Config = {} -- Do not touch

-- Use only if needed, directed by support or know what you're doing
-- Notice: enabling debug features can significantly increase resmon
-- And should always be disabled in production unless otherwise needed
Config.Debug = false

-- Target system, available options are: 'ox_target', 'qb-target', 'qtarget', 'custom' & 'none'
-- 'custom' needs to be added to client/functions.lua
-- If 'none' then TextUI is used instead of targeting
Config.Target = 'qb-target'

-- If Config.Target is set to 'none' thus using TextUI
-- This is the interaction key(s) that will be used (otherwise can be ignored)
-- All control ID's can be found here: https://docs.fivem.net/docs/game-references/controls/
Config.Interact = {
    openMenu = 38,
    pickupCrate = 38,
    anchorBoat = 38
}

-- Do you want to be notified via server console if an update is available?
-- True if yes, false if no
Config.VersionCheck = true

-- Select your ox_lib progress UI preference
-- Options are 'circle' and 'bar'
Config.ProgressType = 'circle'

-- Do you want to require a job to do Scuba Diving?
-- True if yes, false if no
Config.RequireJob = false

-- If RequireJob is true, what is the job name?
-- If RequireJob is false this can be ignored
Config.JobName = 'diver'

-- The account that will be used when making purchases
-- For boat rentals & Scuba Gear
Config.Account = 'cash'

-- EasyMode when enabled makes the crate blip on the map match the crate location exactly
-- If disabled (false), the blip will be offset to not expose the true crate location
-- You can adjust how much the blip is offset below as well
Config.EasyMode = {
    enabled = true,
    offset = {
        x = { min = 3, max = 10 },
        y = { min = 3, max = 10 }
    }
}

-- How do you want to notify the players? You can use a phone system below or a simple notify
-- Available options: 'gks', 'npwd', 'lb', 'qb-phone', 'quasar', 'yphone', 'custom' or 'none'
-- If 'custom' you have to configure the event(s) via functions.lua (both client & server side)
-- If 'none' it will use default notifications from ox_lib
Config.Phone = 'none'

-- Manage starting location/ped settings
Config.Start = {
    Location = vec4(-1303.7292, -1369.0608, 3.5108, 115.3580), -- Where to start
    Model = 's_m_y_shop_mask' -- Ped model used
}

-- Manage all Scuba Gear related settings
Config.ScubaGear = {
    Item = 'scuba_gear', -- Item spawn name
    Mask = 'p_d_scuba_mask_s', -- Object model name of mask
    Tank = 'p_s_scuba_tank_s', -- Object model name of tank
    Sell = true, -- Enable or disable being sold in main menu
    Price = 1000, -- If Sell = true, how much does it cost?
    Time = 120.0, -- How long in seconds the gear lasts underwater (must include .0)
    Cooldown = false, -- Toggle cooldowns between uses
    Duration = 30, -- If Cooldown = true, how long is the cooldown?
    Notify = true -- If Cooldown = true, notify player about status?
}

-- Manage all boat related settings here
Config.Boat = {
    EnableRental = true, -- Allow players to pay for rental?
    RequirePay = true, -- If EnableRental = true, do they have to pay?
    ReturnDeposit = true, -- Refund some money when boat is returned?
    RentalPrice = 500, -- If RequirePay = true, how much?
    ReturnPrice = 250, -- If ReturnDeposit = true, how much are we giving back?
    Model = 'dinghy', -- What model boat to spawn
    Spawn = vec4(-1520.0493, -1414.7665, 1.0977, 120.5895), -- Where to spawn the boat
    Teleport = false, -- Teleport player into boat when rented?
    Anchor = true, -- Enable the anchoring feature?
    Keys = true, -- Give keys to the player upon rental?
    Fuel = 100.0 -- How much fuel to spawn the boat with?
}

-- Manage all crate related settings here
Config.Crate = {
    Item = 'diving_crate', -- Item spawn name
    Model = 'sm_prop_smug_crate_s_bones', -- Object model name
    MinWait = 50, -- How long it takes minimum to assign a crate
    MaxWait = 180 -- How long it takes maximum to assign a crate
}

-- Config.RewardsCount is how many items from Config.CrateRewards do you want to give the player when a crate is opened?
-- If Config.RewardsCount = 1 then only 1 item will be selected and rewarded to the player. If Config.RewardsCount = 3 then
-- 3 items will be selected from the table and rewarded to the player
Config.RewardsCount = 2

-- Below is the configurations that make the crate item players receive worth searching for
-- The current items in this table are just an example! Replace the item(s) with your own
Config.CrateRewards = {
    -- ['item']: Item spawn name
    -- chance: The percentage chance to reward this item
    -- min: The minimum amount to reward if selected
    -- max: The maximum amount to reward if selected
    ['water'] = { chance = 60, quantity = {min = 1, max = 5} },
    ['burger'] = { chance = 50, quantity = {min = 1, max = 3} },
    ['bandage'] = { chance = 40, quantity = {min = 1, max = 2} },
    ['money'] = { chance = 30, quantity = {min = 500, max = 1000} },
    ['lockpick'] = { chance = 20, quantity = {min = 1, max = 2} },
    ['phone'] = { chance = 5, quantity = {min = 1, max = 1} },
    -- Add more items here, following the same format as above
}

-- Manage blip settings
Config.Blip = {
    startDiving = { -- Starting location blip
        enable = true, -- Do you want to enable this blip?
        sprite = 729, -- Sprite ID: https://docs.fivem.net/docs/game-references/blips/
        color = 3, -- Color: https://docs.fivem.net/docs/game-references/blips/#blip-colors
        scale = 0.9, -- Size/scale
        label = 'Scuba Diving'
    },
    crates = {
        sprite = 478,
        spriteColor = 0,
        scale = 0.9,
        label = 'Crate Location'
    }
}

-- Manage animations
Config.Animations = {
    anchor = { -- Anchoring/unanchoring boat
        label = nil, -- Labels found in strings.lua
        duration = 1000, -- How long this animation plays
        position = 'bottom', -- Position on-screen of progress bar
        useWhileDead = false, -- Can do this while dead?
        canCancel = true, -- Can cancel once started?
        disable = { car = true, move = true, comat = true }, -- Actions to disable
        anim = { dict = 'random@domestic', clip = 'pickup_low' }, -- Animation dict & name
        prop = { }
    },
    crate = { -- Opening crate
        label = 'Opening crate..',
        duration = 2000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = { move = false, car = true, combat = true },
        anim = { dict = 'anim@heists@box_carry@', clip = 'idle' },
        prop = { model = 'hei_prop_heist_box', bone = 60309, pos = vec3(0.025, 0.080, 0.255), rot = vector3(-145.00, 290.00, 0.00) }
    },
    gear = { -- Equipping/unequipping scuba gear
        label = nil, -- Labels found in strings.lua
        duration = 5000,
        position = 'bottom',
        useWhileDead = false,
        allowSwimming = true,
        canCancel = true,
        disable = { car = true },
        anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
        prop = { }
    },
    pickup = { -- Picking up crate
        label = 'Picking up..',
        duration = 3000,
        position = 'bottom',
        useWhileDead = false,
        allowSwimming = true,
        canCancel = false,
        disable = { move = true, car = true, combat = true },
        anim = { },
        prop = { }
    }
}

-- All current crate spawning locations
-- Add, remove or adjust the current spawns as needed
Config.CrateLocations = {
    vec3(1815.497, -2954.997, -45.557),
    vec3(1864.005, -2943.363, -45.155),
    vec3(2087.157, -3039.937, -47.423),
    vec3(2193.762, -3127.483, -94.577),
    vec3(2378.850, -2499.716, -35.834),
    vec3(2627.747, -2413.352, -54.756),
    vec3(2626.367, -2423.335, -55.303),
    vec3(2846.153, -2222.815, -41.333),
    vec3(2859.743, -1891.471, -34.197),
    vec3(2984.129, -1498.414, -27.907),
    vec3(3177.294, -581.0652, -127.739),
    vec3(3281.405, -402.486, -117.204),
    vec3(3299.692, -406.857, -124.827),
    vec3(3299.312, -397.528, -116.688),
    vec3(3256.390, -420.755, -77.033),
    vec3(3201.502, -402.942, -25.675),
    vec3(3412.097, -74.546, -140.977),
    vec3(3460.434, 378.986, -122.711),
    vec3(3422.766, 965.663, -128.906),
    vec3(3317.284, 1120.363, -112.818),
    vec3(3355.995, 1508.012, -139.310),
    vec3(3410.401, 1958.866, -51.6830),
    vec3(3902.610, 3058.500, -29.4393),
    vec3(3883.802, 3039.016, -25.3941),
    vec3(3583.808, 2718.932, -27.3160),
    -- Add more locations here
}