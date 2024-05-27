Config = {} -- Do not alter

-- Use only if needed, directed by support or know what you're doing
-- Notice: enabling debug features will significantly increase resmon
-- And should always be disabled in production
Config.Debug = false

-- Target system, available options are: 'ox_target', 'qb-target', 'qtarget', 'custom' & 'none'
-- 'custom' needs to be added to client/functions.lua
-- If 'none' then TextUI is used instead of targeting
Config.Target = 'qb-target'

-- Select your ox_lib progress UI preference
-- Options are 'circle' and 'bar'
Config.ProgressType = 'circle'

-- Do you want to be notified via server console if an update is available?
-- True if yes, false if no
Config.VersionCheck = true

-- Set the maximum number of plants a player can have down/growing at once
Config.MaxPlantCount = 12

-- Render distance is the number of units from the closest plant a player
-- Must be within in order for the prop to spawn and be visible
-- (outside this radius the props are deleted)
Config.RenderDistance = 50

-- Adds strain & "low" or "high" quality metadata to buds harvested
-- Feature is currently DISABLED but coming soon!
Config.UseMetadata = false

-- Do you want to allow planting only on specific soil types?
-- True if yes, false if no - soil types can be configured below
Config.SoilCheck = true

-- Approved soil types to plant on if Config.SoilCheck is true
-- if Config.SoilCheck is false, this can be ignored
Config.SoilTypes = {
    [2409420175] = true,
    [3008270349] = true,
    [3833216577] = true,
    [223086562] = true,
    [1333033863] = true,
    [4170197704] = true,
    [3594309083] = true,
    [2461440131] = true,
    [1109728704] = true,
    [2352068586] = true,
    [1144315879] = true,
    [581794674] = true,
    [2128369009] = true,
    [-461750719] = true,
    [-1286696947] = true,
    [-1885547121] = true,
    [-1907520769] = true
}

-- If you wish to keep the SoilCheck feature active but want to allow planting
-- In certain locations (such as warehouses, etc) you can put the location & the
-- General size (radius) of the area here and the soil checking will be bypassed
Config.IgnoreSoil = {
    [1] = { coords = vec3(0, 0, 0), radius = 5 },
    [2] = { coords = vec3(1, 1, 1), radius = 25 }
}

-- Looking for Discord logging options?
-- You can find them in logs.lua!

-- Create & manage various types of weed strains here
-- By default the props set are our custom weed props! We have more options
-- available and/or if you wish to not use custom props, follow the link below:
-- https://docs.lationscripts.com/premium-resources/advanced-weed-growing/custom-props
Config.Strains = {
    [1] = {
        label = 'Regular Weed', -- name of this type of weed, used in menu's, etc
        seed = 'regweed_seed', -- seed item name to reward upon harvest if applicable
        bud = 'regweed_bud', -- bud item name to reward upon harvest
        harvest = { -- min & max quantity of bud and seeds to reward upon harvest
            buds = { min = 4, max = 18 },
            seeds = { min = 1, max = 3 }
        },
        props = { -- the prop model to use for stage 1, 2 & 3
            [1] = 'shoe_shuffler_prop_weed_01_small_green_01a',
            [2] = 'shoe_shuffler_prop_weed_med_green_01a',
            [3] = 'shoe_shuffler_prop_weed_lrg_green_01a'
        }
    },
    [2] = {
        label = 'Banana Kush Weed',
        seed = 'bananakush_seed',
        bud = 'bananakush_bud',
        harvest = {
            buds = { min = 4, max = 18 },
            seeds = { min = 1, max = 3 }
        },
        props = {
            [1] = 'shoe_shuffler_prop_weed_01_small_yellow_01a',
            [2] = 'shoe_shuffler_prop_weed_med_yellow_01a',
            [3] = 'shoe_shuffler_prop_weed_lrg_yellow_01a'
        }
    },
    [3] = {
        label = 'Blue Dream Weed',
        seed = 'bluedream_seed',
        bud = 'bluedream_bud',
        harvest = {
            buds = { min = 4, max = 18 },
            seeds = { min = 1, max = 3 }
        },
        props = {
            [1] = 'shoe_shuffler_prop_weed_01_small_cyan_01a',
            [2] = 'shoe_shuffler_prop_weed_med_cyan_01a',
            [3] = 'shoe_shuffler_prop_weed_lrg_cyan_01a'
        }
    },
    [4] = {
        label = 'Purple Haze Weed',
        seed = 'purplehaze_seed',
        bud = 'purplehaze_bud',
        harvest = {
            buds = { min = 4, max = 18 },
            seeds = { min = 1, max = 3 }
        },
        props = {
            [1] = 'shoe_shuffler_prop_weed_01_small_purple_01a',
            [2] = 'shoe_shuffler_prop_weed_med_purple_01a',
            [3] = 'shoe_shuffler_prop_weed_lrg_purple_01a'
        }
    },
    -- Add more strains here following the same format as above
    -- Be sure to increment each number, ex: [5], [6] & so on
}

-- **WARNING** - Please read before proceeding - **WARNING**
-- All the configuration options below have significant impacts on the
-- Plant growth system. It is NOT recommend to alter or change any of
-- The settings below (Growth, Care, Needs & Quality). Doing so can 
-- Have unintended consequences. However, of course if you wish to change
-- How the growth system works, these options are available to you.

-- Growth configuration
Config.Growth = {
    -- UpdateInterval is roughly how often in milliseconds each plant's data is updated 
    -- Rate is the percentage growth increases between each UpdateInterval
    -- Stages is the growth percentage threshold for advancing to that stage
    -- InitialThirst/Hunger is the percentage thirst/hunger are when first planted
    UpdateInterval = 15000,
    Rate = { min = 0.15, max = 0.35 },
    Stages = { stage2 = 40, stage3 = 90 },
    InitialThirst = 85,
    InitialHunger = 85
}

-- Plant care configuration
Config.Care = {
    -- How much the plants thirst/hunger percentage increases per action
    -- Consume is how many Config.Items.Water/Fertilizer is removed from player
    Watering = { min = 8.0, max = 13.0, consume = 1 },
    Fertilizing = { min = 10.0, max = 15.0, consume = 1 }
}

-- Hunger & thirst configuration
Config.Needs = {
    -- Hunger/ThirstDecrease is the percentage decrease in each per UpdateInterval
    -- DeathThreshold is when a plants hunger or thirst reaches that number, it dies
    HungerDecrease = { min = 0.15, max = 0.4 },
    ThirstDecrease = { min = 0.15, max = 0.4 },
    DeathThreshold = 35
}

-- Quality configuration
Config.Quality = {
    -- GoodQuality is the quality percent at which a plant is considered good quality
    -- and will yield the maximum buds + seeds in return upon harvesting at full growth.
    -- Threshold is when a plants hunger/thirst reaches that percent, quality starts to degrade
    -- DeathThreshold is when a plants quality reaches that percent, it dies
    -- Decrease is how much percentage quality will degrade per UpdateInterval when below threshold
    GoodQuality = 94,
    Threshold = 70,
    DeathThreshold = 40,
    Decrease = { min = 0.4, max = 0.9 }
}

-- Manage all item names if needed due to naming conflicts, etc
-- And to alter the requirements when planting/harvesting if desired
Config.Items = {
    Water = 'watering_can',
    Fertilizer = 'fertilizer',
    PlantPot = {
        item = 'plant_pot',
        require = true, -- Require a plant pot when planting?
        remove = true, -- Remove the plant pot when planting?
        consume = 1, -- How many to remove if enabled
        returnPot = true, -- Return a plant pot when harvesting?
        chance = 70 -- Percentage chance the plant pot gets returned (1-100)
    },
    Shovel = {
        item = 'plant_shovel',
        require = true, -- Require a shovel when planting?
        remove = false, -- Remove the shovel when planting?
        consume = 1 -- How many to remove if enabled
    },
    Shears = {
        item = 'plant_shears',
        require = true, -- Require shears when harvesting?
        remove = false, -- Remove the shears when harvesting?
        consume = 1 -- How many to remove if enabled
    }
    -- It's possible to add further requirements if desired
    -- By editing lation_weed:CheckConditions callback in client/functions.lua
    -- If you are knowledgable enough
}

-- Set your police jobs below, so when police find a plant, they can interact
-- With it and are displayed a specific menu that allows them to destroy the plant.
Config.Police = {
    jobs = { 'police', 'sheriff' },
    require = false, -- Do you want to require police be online to plant seeds?
    count = 3, -- If require = true, how many should be online?
    labAccess = true -- Allow police access to the lab ignoring all requirements?
}

-- Customize the built-in shop that sells all the necessary supplies
Config.Shop = {
    enable = true, -- Do you want this shop enabled?
    location = vec4(-1171.0409, -1571.1124, 3.6636, 122.0094),
    model = 'a_m_y_beach_02',
    -- You can limit the hours at which the supply shop is available here
    -- Min is the earliest the shop is available (default 6:00AM)
    -- Max is the latest the shop is available (detault 21:00 aka 9PM)
    -- If you want it available 24/7, set min to 1 and max to 24
    hour = { min = 6, max = 21 },
    account = 'cash', -- Use cash or bank when purchasing here?
    items = {
        -- item: item spawn name
        -- price: how much it costs
        -- label: display name
        -- icon: icon for this item or nil
        -- min: minimum amount the player must purchase at once
        -- max: maximum amount the player can purchase at once or nil
        [1] = { item = Config.Items.Water, price = 15, label = 'Water', icon = 'droplet', min = 1, max = 100 },
        [2] = { item = Config.Items.Fertilizer, price = 20, label = 'Fertilizer', icon = 'burger', min = 1, max = 100 },
        [3] = { item = Config.Items.PlantPot.item, price = 10, label = 'Plant Pot', icon = 'plant-wilt', min = 1, max = 100 },
        [4] = { item = Config.Items.Shovel.item, price = 275, label = 'Shovel', icon = 'trowel', min = 1, max = 1 },
        [5] = { item = Config.Items.Shears.item, price = 150, label = 'Shears', icon = 'scissors', min = 1, max = 1 }
        -- Add more items if desired here following the same format as above
        -- Or remove items from this list if you want - just be sure to update the number scheme [1], [2], etc
    },
    blip = {
        enabled = true, -- Enable or disable the blip for this shop
        sprite = 140, -- Sprite ID (https://docs.fivem.net/docs/game-references/blips/)
        color = 2, -- Color (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
        scale = 0.8, -- Size/scale
        label = 'Smoke on the Water' -- Label
    }
}

Config.Cooldown = 45 -- In seconds, how long cooldown lasts on each plant when searched
Config.SeedFarms = { -- The location(s) at which seeds are obtained
    [1] = {
        spawn = false, -- Do you need the script to spawn the plants here?
        model = 'prop_weed_01', -- If spawn = true, what model to spawn?
        center = vec3(2225.805, 5576.971, 53.857), -- The center-most coords here
        size = 15, -- The size (or radius) of the zone (Config.Debug to see zone)
        coords = { -- The location of each plant here (or location to spawn each)
            -- If you need help grabbing the exact coords of existing plants
            -- We recommend using dolu_tool: https://github.com/dolutattoo/dolu_tool/releases/latest
            [1] = vec3(2216.251, 5577.534, 52.839),
            [2] = vec3(2215.845, 5575.269, 52.699),
            [3] = vec3(2218.534, 5577.353, 52.857),
            [4] = vec3(2218.279, 5575.158, 52.720),
            [5] = vec3(2218.917, 5579.656, 52.955),
            [6] = vec3(2220.535, 5577.247, 52.850),
            [7] = vec3(2221.015, 5574.937, 52.721),
            [8] = vec3(2222.687, 5574.870, 52.723),
            [9] = vec3(2223.059, 5577.105, 52.842),
            [10] = vec3(2223.790, 5579.327, 52.931),
            [11] = vec3(2225.323, 5576.916, 52.859),
            [12] = vec3(2225.409, 5579.195, 52.937),
            [13] = vec3(2227.682, 5576.773, 52.875),
            [14] = vec3(2227.326, 5574.560, 52.819),
            [15] = vec3(2230.170, 5576.593, 52.956),
            [16] = vec3(2230.674, 5574.298, 52.915),
            [17] = vec3(2232.641, 5576.405, 53.036),
            [18] = vec3(2233.875, 5578.694, 53.122)
        },
        seeds = { -- The seeds that can be found at this location
            [1] = { seed = 'regweed_seed', chance = 60, min = 1, max = 4 },
            [2] = { seed = 'bananakush_seed', chance = 30, min = 1, max = 3 },
            [3] = { seed = 'bluedream_seed', chance = 20, min = 1, max = 2 },
            [4] = { seed = 'purplehaze_seed', chance = 10, min = 1, max = 1 },
            -- Add or remove seeds here following the same format as above
        },
        nothing = 15 -- The percentage chance to find nothing when searching here
    },
    -- Add more farms here following the same format as above
    -- Notice: ensure no zones overlap each other
    -- You can double check & verify by setting Config.Debug = true
}

-- If you do not want to allow players to plant freely around the map
-- You can restrict planting to designated locations and customize the
-- Size (radius) of each location planting will be enabled at below.
Config.Planting = {
    RestrictToDesignatedAreas = false,
    DesignatedAreas = {
        [1] = { coords = vec3(0, 0, 0), radius = 50 }, -- Example 1
        [2] = { coords = vec3(0, 0, 0), radius = 100 }, -- Example 2
        -- Add more locations here following the same format as above
    }
}

-- If you want to disable planting in specific locations
-- You can do so here by setting the coords and radius size
Config.DisableLocations = {
    [1] = { coords = vec3(0, 0, 0), radius = 50 }, -- Example 1
    [2] = { coords = vec3(0, 0, 0), radius = 100 } -- Example 2
    -- Add more locations here following the same format as above
}

-- Manage the placement system settings here
Config.Controls = {
    interactKey = 38, -- E (used for interactions if TextUI is enabled)
    movementKeys = { -- The controls used to move the plant during placement
        rotateLeft = 44, -- Q
        rotateRight = 38, -- E
        moveForward = 32, -- W
        moveBackward = 33, -- S
        moveLeft = 34, -- A
        moveRight = 35, -- D
        cancel = 73, -- X
        confirm = 22 -- Space
    },
    disableKeys = { -- The controls disabled during plant placement
        30, -- Disables left/right movement
        31, -- Disables forward/backward movement
        32, -- Disables W
        33, -- Disables S
        34, -- Disables A
        35, -- Disables D
        44, -- Disables Q (crouch)
        22, -- Disables Spacebar (jump)
        200, -- Disables Escape
        -- Add more here if needed to suit your specific needs
    }
}

-- Manage all rolling related configurations here
Config.Rolling = {
    lab = {
        enable = false, -- Do you want to enable enter/exit points for the rolling lab?
        enter = vec4(416.1885, 6520.8638, 27.7308, 86.4887), -- Where do they enter at?
        exit = vec4(1066.3086, -3183.4487, -39.1636, 272.1406), -- Where do they exit at?
        rotate = 180, -- Amount of degrees to turn the player upon exit/enter
        requireItem = true, -- Do you want to require an item to enter?
        item = 'lab_access_card', -- If requireItem = true, what item?
        requirePolice = false, -- Do you want to require police online to enter?
        count = 3 -- If requirePolice = true, how many?
    },
    tables = {
        -- spawn: If true it will spawn tables that can be used for rolling in the locations
        -- you set in the coords table. If false, it will not spawn tables
        -- model: If spawn is enabled, this is the table model/object to spawn
        -- coords: The location at which to create targets or TextUI interaction points
        -- as well as spawn tables if enabled. Leave empty to not create targets/TextUI
        spawn = false,
        model = 'bkr_prop_weed_table_01a',
        coords = {
            vec4(1038.3824, -3205.8552, -39.1231, 85.0345),
            vec4(1033.7921, -3206.0498, -39.1231, 85.0345),
            -- You can add more tables here if desired (using vector4 coords)
        }
    },
    buds = {
        -- Customize the rolling experience per-bud type here
        ['regweed_bud'] = { -- Bud item name that can be rolled at the tables
            label = 'Weed Bud', -- A display label to be used in the menu(s)
            remove = 1, -- How many of the item to remove per roll
            requireItem = true, -- Require another item in order to roll this?
            requiredItem = 'rolling_paper', -- Item name of the required item if requireItem is true
            removeRequired = 1, -- How many of the required item to remove per roll
            add = 'regweed_joint', -- Item name (joint) to add upon a successful roll
            addQuantity = 1, -- How many of the joint item above to add upon succesful roll
            rollDuration = 2500, -- How many milliseconds it takes to roll one of these joints
            max = 25, -- Maximum amount you can roll before having to start again
            icon = 'fas fa-cannabis', -- Icon used to display this option in the menu
            iconColor = '#92EE84' -- Icon color in the menu (leave blank for default or set an HTML color: #92EE84)
        },
        ['bananakush_bud'] = {
            label = 'Banana Kush Bud',
            remove = 1,
            requireItem = true,
            requiredItem = 'rolling_paper',
            removeRequired = 1,
            add = 'bananakush_joint',
            addQuantity = 1,
            rollDuration = 3500,
            max = 20,
            icon = 'fas fa-cannabis',
            iconColor = '#EEEE84'
        },
        ['bluedream_bud'] = {
            label = 'Blue Dream Bud',
            remove = 1,
            requireItem = true,
            requiredItem = 'rolling_paper',
            removeRequired = 1,
            add = 'bluedream_joint',
            addQuantity = 1,
            rollDuration = 4000,
            max = 20,
            icon = 'fas fa-cannabis',
            iconColor = '#84D5EE'
        },
        ['purplehaze_bud'] = {
            label = 'Purple Haze Bud',
            remove = 1,
            requireItem = true,
            requiredItem = 'rolling_paper',
            removeRequired = 1,
            add = 'purplehaze_joint',
            addQuantity = 1,
            rollDuration = 5000,
            max = 15,
            icon = 'fas fa-cannabis',
            iconColor = '#DF90DF'
        },
        -- Add more here if desired following the same format
    }
}

-- Manage all joint configurations
Config.Joints = {
    ['regweed_joint'] = { -- Joint item name
        usable = true, -- Do you want to make this joint usable?
        effects = {
            -- enable: Do you want to enable this effect?
            -- amount: For health & armor, how much to apply if enabled?
            -- max: The maximum amount that can be applied
            -- multiplier: If enabled, how much to increase player speed (maximum is 1.49)
            -- duration: If enabled, how long (in milliseconds) to activate the effect
            -- effect: The timecycle modifier (more can be found at: https://forge.plebmasters.de/timecyclemods)
            -- clipset: The movement clipset to apply (more can be found at: https://github.com/DurtyFree/gta-v-data-dumps/blob/master/movementClipsetsCompact.json)
            -- name: The camera shake name (more can be found at: https://docs.fivem.net/natives/?_0xFD55E49555E017CF)
            health = { enable = true, amount = 50, max = 200 },
            armor = { enable = true, amount = 20, max = 100 },
            speed = { enable = false, multiplier = 1.49, duration = 30000 },
            screen = { enable = true, effect = 'stoned_monkeys', duration = 30000 },
            walk = { enable = true, clipset = 'move_m@drunk@a', duration = 30000 },
            shake = { enable = true, name = 'DRUNK_SHAKE', intensity = 2.0, duration = 30000 }
        }
    },
    ['bananakush_joint'] = {
        usable = true,
        effects = {
            health = { enable = true, amount = 50, max = 200 },
            armor = { enable = true, amount = 20, max = 100 },
            speed = { enable = false, multiplier = 1.49, duration = 30000 },
            screen = { enable = true, effect = 'stoned_monkeys', duration = 30000 },
            walk = { enable = true, clipset = 'move_m@drunk@a', duration = 30000 },
            shake = { enable = true, name = 'DRUNK_SHAKE', intensity = 2.0, duration = 30000 }
        }
    },
    ['bluedream_joint'] = {
        usable = true,
        effects = {
            health = { enable = true, amount = 50, max = 200 },
            armor = { enable = true, amount = 20, max = 100 },
            speed = { enable = false, multiplier = 1.49, duration = 30000 },
            screen = { enable = true, effect = 'stoned_monkeys', duration = 30000 },
            walk = { enable = true, clipset = 'move_m@drunk@a', duration = 30000 },
            shake = { enable = true, name = 'DRUNK_SHAKE', intensity = 2.0, duration = 30000 }
        }
    },
    ['purplehaze_joint'] = {
        usable = true,
        effects = {
            health = { enable = true, amount = 50, max = 200 },
            armor = { enable = true, amount = 20, max = 100 },
            speed = { enable = false, multiplier = 1.49, duration = 30000 },
            screen = { enable = true, effect = 'stoned_monkeys', duration = 30000 },
            walk = { enable = true, clipset = 'move_m@drunk@a', duration = 30000 },
            shake = { enable = true, name = 'DRUNK_SHAKE', intensity = 2.0, duration = 30000 }
        }
    }
}

-- Manage all animations here
Config.Animations = {
    placingPot = { -- Animation(s) used during initial start of plant placement
        part1 = { -- Played when player first "uses" a seed
            label = 'Placing pot..',
            duration = 1200,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = { move = true, car = true, combat = true },
            anim = { dict = 'pickup_object', clip = 'pickup_low' },
            prop = { }
        },
        part2 = { -- Played after part1, and continues until confirmation/cancellation of placement
            anim = { dict = 'missheist_jewelleadinout', clip = 'jh_int_outro_loop_a', flag = 51 }
        }
    },
    watering = { -- Animation(s) used when watering a plant
        part1 = { -- Played when player waters the plant
            label = 'Watering..',
            duration = 4000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = { move = true, car = true, combat = true },
            anim = { dict = 'weapon@w_sp_jerrycan', clip = 'fire', flag = 1 },
            prop = { }
        },
        part2 = { -- Played concurrently with part1 and handles the prop & effects
            prop = { model = 'prop_wateringcan', bone = 28422, pos = vec3(0.4, 0.125, -0.05), rot = vec3(90.0, 180.0, 0.0) },
            fx = { dict = 'core', name = 'ent_sht_water', offset = vec3(0.35, 0.0, 0.25), rot = vec3(0.0, 0.0, 0.0), scale = 2.0 }
        }
    },
    fertilizing = { -- Animation(s) used when fertilizing a plant
        part1 = { -- Played when a player fertilizes a plant
            label = 'Fertilizing..',
            duration = 4000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = { move = true, car = true, combat = true },
            anim = { dict = 'weapon@w_sp_jerrycan', clip = 'fire', flag = 1 },
            prop = { }
        },
        part2 = { -- Played concurrently with part1 and handles the prop & effects
            prop = { model = 'p_cs_sack_01_s', bone = 28422, pos = vec3(0.3239, -0.0328, 0.1253), rot = vec3(49.4678, -18.1732, -79.2577) },
            fx = { dict = 'scr_fbi3', name = 'scr_fbi3_dirty_water_pour', offset = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0), scale = 2.0 }
        }
    },
    destroying = { -- Animation(s) used when deleting a plant
        label = 'Destroying..',
        duration = 4000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disable = { move = true, car = true, combat = true },
        anim = { dict = 'amb@prop_human_bum_bin@base', clip = 'base' },
        prop = { }
    },
    harvesting = { -- Animation(s) used when harvesting a plant
        label = 'Harvesting..',
        duration = 4000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disable = { move = true, car = true, combat = true },
        anim = { dict = 'amb@prop_human_bum_bin@base', clip = 'base' },
        prop = { }
    },
    searching = { -- Animation(s) used when searching a plant
        label = 'Searching..',
        duration = 6000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disable = { move = true, car = true, combat = true },
        anim = { scenario = 'WORLD_HUMAN_GARDENER_PLANT' },
        prop = { }
    },
    rolling = { -- Animation(s) used when rolling joints
        label = 'Rolling..',
        duration = nil,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = { car = true, move = true, combat = true },
        anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' },
        prop = { }
    },
    smoking = { -- Animation(s) used when smoking joints
        label = 'Smoking..',
        duration = 10000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = { car = true, move = true, combat = true },
        anim = { scenario = 'WORLD_HUMAN_SMOKING_POT' },
        prop = { }
    },
}

-- This option is recommended to be left to "false" unless you are sure you need it.
-- ForceUpdates, if enabled will update all plants data in the database at the frequency 
-- You set with Config.Interval (which is in minutes). Plants are by default updated
-- In the database upon fertilizing, watering, stage changes & server restarts (via txAdmin).
-- The default behaviour should be more than sufficient, however this is a redundancy
-- Measure for those you may find it's absolutely needed.
Config.ForceUpdates = false
Config.Interval = 15

-- The ModelWait option below is how long the client should wait for a model to load
-- Do not edit unless you know what you are doing or are directed via support
Config.ModelWait = 3500