Config = {} -- Do not touch

-- DO NOT LEAVE TRUE IF DEPLOYING ON PRODUCTION SERVER
-- This command can be used like so: /simulate [metal detector level] [number of finds]
-- For example: /simulate 1 500 will print the results of 500 finds with the level 1 metal detector
-- Can be used to test and refine your "chance" settings on each item for each level
Config.DebugCommand = false

-- Do you want to be notified via server console if an update is available?
-- True if yes, false if no
Config.VersionCheck = true

-- Optional target system support, available options are: 'ox_target', 'qb-target', 'qtarget' & 'none'
-- If set to 'none', TextUI labels will be used instead of targeting
Config.Target = 'qb-target'

Config.Volume = 0.25 -- The volume of the metal detector beeping (values range from 0.0 to 1.0)
Config.Shovel = 'md_shovel' -- The item name of the shovel
Config.ShovelPrice = 250 -- How much a shovel costs to purchase
Config.AddShovelToShop = true -- If true this makes the shovel purchasable from the sell shop
Config.MenuCommand = 'metaldetecting' -- The command used to open metal detecting stats
Config.OpenShop = 38 -- Key pressed to open shop(s) (https://docs.fivem.net/docs/game-references/controls/#controls)
Config.Account = 'money' -- The account used for purchasing detectors, shovels & when selling items
Config.RequireJob = false -- Do you want to require the player has a specific job for metal detecting?
Config.JobName = 'metal_detector' -- If Config.RequireJob is true, what is the job name?

-- If true, when a player uses a metal detector it'll make sure they are the correct level to use it
-- If false, it'll let a player use any metal detector (ex: a player level 3 gives his detector to a level 1)
Config.CheckLevel = true

-- Manage all shop peds, locations, etc
Config.Shops = {
    detectors = {
        type = 'detector_shop', -- Do not change type
        enabled = true, -- Optionally, disable this shop by setting to false
        ped = 'a_m_y_beach_02', -- Ped model
        coords = vec4(-1234.3484, -1476.9872, 3.3116, 79.8191), -- Location
        radius = 50, -- How close a player must be to render/spawn NPC
        blip = {
            enabled = true, -- Enable or disable this blip
            sprite = 103, -- Blip sprite ID (https://docs.fivem.net/docs/game-references/blips/)
            color = 0, -- Blip color (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
            scale = 0.8, -- Size of blip
            label = 'Metal Detectors' -- Label
        }
    },
    sellShop = {
        type = 'sell_shop', -- Do not change type
        enabled = true,
        ped = 'a_m_o_genstreet_01',
        coords = vec4(412.6790, 314.3495, 102.0208, 207.4230),
        radius = 50,
        blip = {
            enabled = true,
            sprite = 207,
            color = 2,
            scale = 0.8,
            label = 'Detectors Sell Shop'
        }
    }
}

-- While a player is metal detecting, these keys are disabled until they stop
Config.DisabledKeys = {
    200, -- ESC
    22, -- Spacebar
    24, -- Left click / attack
    140, -- R / attack
    36, -- Left CTRL / duck
    44, -- Q / cover
    -- Add or remove as you wish
}

-- The amount of XP required to reach each level
-- [level] = experience (5 is the max level and cannot be exceeded)
Config.Leveling = {
    [1] = 0,
    [2] = 12500,
    [3] = 25000,
    [4] = 50000,
    [5] = 100000
}

-- Manage all animations
Config.Animations = {
    detecting = {
        dict = 'mini@golfai',
        clip = 'wood_idle_a',
        bone = 60309,
        pos = { x = 0.849, y = 0.050, z = 0.059 },
        rot = { x = -176.460, y = 86.093, z = 5.054 }
    },
    digging = {
        prop = 'prop_tool_shovel',
        dict = 'random@burial',
        clip = 'a_burial',
        bone = 28422,
        pos = { x = 0.000, y = 0.000, z = 0.240 },
        rot = { x = 0.000, y = 0.000, z = 0.000 },
        duration = 7250
    }
}

-- Do you want to allow detecting only on specific soil types?
-- True if yes, false if no - soil types can be configured below
Config.SoilCheck = true

-- Soil types the player can metal detect on
-- Need to know how to find soil types? Go to client/functions.lua line 137
-- And uncomment it! Then, try detecting, and it'll tell you the
-- Soil type in your F8 client console
Config.SoilTypes = {
    [-1595148316] = true, -- Sand/beach
}

-- Create specific zones/areas in which a player cannot metal detect
-- Even if that area has the approved soil type or not
Config.RestrictedZones = {
    [1] = { coords = vec3(0, 0, 0), radius = 20 },
    -- Add more restricted zones following the same format as above
    -- Be sure to increment the number, [2], [3], etc
}

-- If you do not want to allow players to metal detect everywhere and/or
-- Anywhere the soil type matches the SoilTypes list, you can set enabled to true
-- And players will only be able to metal detect in these designed areas
Config.DesignatedAreas = {
    enabled = false,
    areas = {
        [1] = { coords = vec3(0, 0, 0), radius = 20 },
        -- Add more designated areas following the same format as above
        -- Be sure to increment the number, [2], [3], etc
    }
}

-- NOT RECOMMENDED TO ENABLE, LEAVE FALSE --
-- This is for specific use-cases where a server may be experiencing
-- Unstable conditions and needs a more routine method to ensure database
-- is updated
Config.ForceUpdates = {
    enabled = false,
    interval = 60000
}

-- Got pesky players? Ban them from the activity altogether!
-- Simply add their identifier to the list like the example below
-- ESX: use default identifier: char1:abcdefghijklmnopqrstuv123456789
-- QBCore: use citizen ID: ABC12345
Config.Bans = {
    ['identifier'] = true
}

-- Manage all detector settings here
Config.Detectors = {
    [1] = { -- Level required to purchase this detector
        requiredXP = 0, -- The XP required to reach this level
        price = 2750, -- How much this metal detector costs in shop
        prop = 'blue_metaldetector', -- Prop
        item = 'blue_metaldetector', -- Item name
        radius = 15, -- How far it can detect items
        cooldown = math.random(10000, 20000), -- How often an item can be found
        loot = { -- All loot available with this detector
            -- ['item']: Item name of possible loot with this detector
            -- chance: The percentage chance to find this item
            -- quantity: The quantity of this item to reward (can also be math.random(x, x))
            -- addXP: How much XP is rewarded for finding this item
            ['md_bottlecap'] = {chance = 60, quantity = 1, addXP = 40},
            ['md_brokenjunk'] = {chance = 60, quantity = 1, addXP = 40},
            ['md_crushedcan'] = {chance = 60, quantity = 1, addXP = 40},
            ['md_lighter'] = {chance = 55, quantity = 1, addXP = 45},
            ['md_metalcan'] = {chance = 55, quantity = 1, addXP = 45},
            ['md_nails'] = {chance = 55, quantity = 1, addXP = 45},
            ['md_needle'] = {chance = 55, quantity = 1, addXP = 45},
            ['md_nut'] = {chance = 55, quantity = 1, addXP = 45},
            ['md_oldshotgunshell'] = {chance = 55, quantity = 1, addXP = 45},
            ['md_paperclip'] = {chance = 50, quantity = 1, addXP = 50},
            ['md_pulltab'] = {chance = 50, quantity = 1, addXP = 50},
            ['md_rustyball'] = {chance = 50, quantity = 1, addXP = 50},
            ['md_rustyironball'] = {chance = 50, quantity = 1, addXP = 50},
            ['md_rustyjunk'] = {chance = 50, quantity = 1, addXP = 50},
            ['md_rustynails'] = {chance = 50, quantity = 1, addXP = 50},
            ['md_rustypliers'] = {chance = 45, quantity = 1, addXP = 75},
            ['md_rustyring'] = {chance = 45, quantity = 1, addXP = 75},
            ['md_rustyscissors'] = {chance = 45, quantity = 1, addXP = 75},
            ['md_rustyscrewdriver'] = {chance = 45, quantity = 1, addXP = 75},
            ['md_rustyspring'] = {chance = 45, quantity = 1, addXP = 75},
            ['md_screw'] = {chance = 45, quantity = 1, addXP = 75},
            ['md_wheatpenny'] = {chance = 40, quantity = 1, addXP = 100},
            ['md_nickle'] = {chance = 40, quantity = 1, addXP = 100},
            ['md_silverdime'] = {chance = 35, quantity = 1, addXP = 125},
            ['md_quarter'] = {chance = 30, quantity = 1, addXP = 150},
            ['md_halfdollar'] = {chance = 25, quantity = 1, addXP = 200},
            ['md_blackwatch'] = {chance = 20, quantity = 1, addXP = 250},
            ['md_coppernugget'] = {chance = 15, quantity = 1, addXP = 300},
            ['md_ironnugget'] = {chance = 15, quantity = 1, addXP = 300},
            ['md_earpod'] = {chance = 10, quantity = 1, addXP = 400},
            ['md_relicrevolver'] = {chance = 5, quantity = 1, addXP = 450},
            ['md_silverearings'] = {chance = 4, quantity = 1, addXP = 500},
            ['md_silverring'] = {chance = 4, quantity = 1, addXP = 500},
            ['md_silverounce'] = {chance = 4, quantity = 1, addXP = 500},
            ['md_ancientcoin'] = {chance = 3, quantity = 1, addXP = 600},
            ['md_golddollar'] = {chance = 3, quantity = 1, addXP = 600},
            ['md_goldearings'] = {chance = 2, quantity = 1, addXP = 750},
            ['md_goldnecklace'] = {chance = 2, quantity = 1, addXP = 750},
            ['md_goldnugget'] = {chance = 2, quantity = 1, addXP = 750},
            ['md_goldounce'] = {chance = 2, quantity = 1, addXP = 750},
            ['md_goldring'] = {chance = 2, quantity = 1, addXP = 750},
            ['md_diamondearings'] = {chance = 1, quantity = 1, addXP = 1200},
            ['md_diamondnecklace'] = {chance = 1, quantity = 1, addXP = 1200},
            ['md_diamondring'] = {chance = 1, quantity = 1, addXP = 1200},
            ['md_platinumnugget'] = {chance = 1, quantity = 1, addXP = 1200},
            ['md_presidentialwatch'] = {chance = 1, quantity = 1, addXP = 1200}
        }
    },
    [2] = { -- Level 2
        requiredXP = 12500,
        price = 5250,
        prop = 'green_metaldetector',
        item = 'green_metaldetector',
        radius = 25,
        cooldown = math.random(15000, 30000),
        loot = {
            ['md_bottlecap'] = {chance = 45, quantity = 1, addXP = 20},
            ['md_brokenjunk'] = {chance = 45, quantity = 1, addXP = 20},
            ['md_crushedcan'] = {chance = 45, quantity = 1, addXP = 20},
            ['md_lighter'] = {chance = 45, quantity = 1, addXP = 20},
            ['md_metalcan'] = {chance = 45, quantity = 1, addXP = 25},
            ['md_nails'] = {chance = 45, quantity = 1, addXP = 25},
            ['md_needle'] = {chance = 45, quantity = 1, addXP = 25},
            ['md_nut'] = {chance = 45, quantity = 1, addXP = 25},
            ['md_oldshotgunshell'] = {chance = 45, quantity = 1, addXP = 25},
            ['md_paperclip'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_pulltab'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_rustyball'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_rustyironball'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_rustyjunk'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_rustynails'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_rustypliers'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_rustyring'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_rustyscissors'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_rustyscrewdriver'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_rustyspring'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_screw'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_wheatpenny'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_nickle'] = {chance = 50, quantity = 1, addXP = 40},
            ['md_silverdime'] = {chance = 45, quantity = 1, addXP = 45},
            ['md_quarter'] = {chance = 45, quantity = 1, addXP = 45},
            ['md_halfdollar'] = {chance = 40, quantity = 1, addXP = 50},
            ['md_blackwatch'] = {chance = 40, quantity = 1, addXP = 50},
            ['md_coppernugget'] = {chance = 35, quantity = 1, addXP = 55},
            ['md_ironnugget'] = {chance = 35, quantity = 1, addXP = 55},
            ['md_earpod'] = {chance = 35, quantity = 1, addXP = 55},
            ['md_relicrevolver'] = {chance = 30, quantity = 1, addXP = 60},
            ['md_silverearings'] = {chance = 25, quantity = 1, addXP = 75},
            ['md_silverring'] = {chance = 25, quantity = 1, addXP = 75},
            ['md_silverounce'] = {chance = 20, quantity = 1, addXP = 100},
            ['md_ancientcoin'] = {chance = 20, quantity = 1, addXP = 100},
            ['md_golddollar'] = {chance = 15, quantity = 1, addXP = 200},
            ['md_goldearings'] = {chance = 15, quantity = 1, addXP = 200},
            ['md_goldnecklace'] = {chance = 10, quantity = 1, addXP = 300},
            ['md_goldnugget'] = {chance = 10, quantity = 1, addXP = 300},
            ['md_goldounce'] = {chance = 10, quantity = 1, addXP = 300},
            ['md_goldring'] = {chance = 10, quantity = 1, addXP = 300},
            ['md_diamondearings'] = {chance = 5, quantity = 1, addXP = 400},
            ['md_diamondnecklace'] = {chance = 5, quantity = 1, addXP = 400},
            ['md_diamondring'] = {chance = 5, quantity = 1, addXP = 400},
            ['md_platinumnugget'] = {chance = 3, quantity = 1, addXP = 480},
            ['md_presidentialwatch'] = {chance = 1, quantity = 1, addXP = 600}
        }
    },
    [3] = { -- Level 3
        requiredXP = 25000,
        price = 8825,
        prop = 'red_metaldetector',
        item = 'red_metaldetector',
        radius = 35,
        cooldown = math.random(20000, 40000),
        loot = {
            ['md_bottlecap'] = {chance = 30, quantity = 1, addXP = 10},
            ['md_brokenjunk'] = {chance = 30, quantity = 1, addXP = 10},
            ['md_crushedcan'] = {chance = 30, quantity = 1, addXP = 10},
            ['md_lighter'] = {chance = 35, quantity = 1, addXP = 25},
            ['md_metalcan'] = {chance = 35, quantity = 1, addXP = 25},
            ['md_nails'] = {chance = 35, quantity = 1, addXP = 25},
            ['md_needle'] = {chance = 35, quantity = 1, addXP = 25},
            ['md_nut'] = {chance = 35, quantity = 1, addXP = 25},
            ['md_oldshotgunshell'] = {chance = 35, quantity = 1, addXP = 25},
            ['md_paperclip'] = {chance = 40, quantity = 1, addXP = 30},
            ['md_pulltab'] = {chance = 40, quantity = 1, addXP = 30},
            ['md_rustyball'] = {chance = 40, quantity = 1, addXP = 30},
            ['md_rustyironball'] = {chance = 45, quantity = 1, addXP = 35},
            ['md_rustyjunk'] = {chance = 45, quantity = 1, addXP = 35},
            ['md_rustynails'] = {chance = 45, quantity = 1, addXP = 35},
            ['md_rustypliers'] = {chance = 45, quantity = 1, addXP = 35},
            ['md_rustyring'] = {chance = 45, quantity = 1, addXP = 35},
            ['md_rustyscissors'] = {chance = 45, quantity = 1, addXP = 35},
            ['md_rustyscrewdriver'] = {chance = 45, quantity = 1, addXP = 35},
            ['md_rustyspring'] = {chance = 45, quantity = 1, addXP = 35},
            ['md_screw'] = {chance = 45, quantity = 1, addXP = 35},
            ['md_wheatpenny'] = {chance = 45, quantity = 1, addXP = 35},
            ['md_nickle'] = {chance = 45, quantity = 1, addXP = 35},
            ['md_silverdime'] = {chance = 40, quantity = 1, addXP = 45},
            ['md_quarter'] = {chance = 40, quantity = 1, addXP = 45},
            ['md_halfdollar'] = {chance = 40, quantity = 1, addXP = 45},
            ['md_blackwatch'] = {chance = 40, quantity = 1, addXP = 45},
            ['md_coppernugget'] = {chance = 40, quantity = 1, addXP = 45},
            ['md_ironnugget'] = {chance = 40, quantity = 1, addXP = 45},
            ['md_earpod'] = {chance = 40, quantity = 1, addXP = 45},
            ['md_relicrevolver'] = {chance = 35, quantity = 1, addXP = 50},
            ['md_silverearings'] = {chance = 35, quantity = 1, addXP = 50},
            ['md_silverring'] = {chance = 35, quantity = 1, addXP = 50},
            ['md_silverounce'] = {chance = 30, quantity = 1, addXP = 55},
            ['md_ancientcoin'] = {chance = 30, quantity = 1, addXP = 55},
            ['md_golddollar'] = {chance = 25, quantity = 1, addXP = 65},
            ['md_goldearings'] = {chance = 25, quantity = 1, addXP = 65},
            ['md_goldnecklace'] = {chance = 25, quantity = 1, addXP = 65},
            ['md_goldnugget'] = {chance = 20, quantity = 1, addXP = 75},
            ['md_goldounce'] = {chance = 20, quantity = 1, addXP = 75},
            ['md_goldring'] = {chance = 20, quantity = 1, addXP = 75},
            ['md_diamondearings'] = {chance = 15, quantity = 1, addXP = 100},
            ['md_diamondnecklace'] = {chance = 15, quantity = 1, addXP = 100},
            ['md_diamondring'] = {chance = 15, quantity = 1, addXP = 100},
            ['md_platinumnugget'] = {chance = 10, quantity = 1, addXP = 200},
            ['md_presidentialwatch'] = {chance = 5, quantity = 1, addXP = 300}
        }
    },
    [4] = { -- Level 4
        requiredXP = 50000,
        price = 13250,
        prop = 'orange_metaldetector',
        item = 'orange_metaldetector',
        radius = 45,
        cooldown = math.random(25000, 50000),
        loot = {
            ['md_bottlecap'] = {chance = 20, quantity = 1, addXP = 5},
            ['md_brokenjunk'] = {chance = 20, quantity = 1, addXP = 5},
            ['md_crushedcan'] = {chance = 20, quantity = 1, addXP = 5},
            ['md_lighter'] = {chance = 25, quantity = 1, addXP = 5},
            ['md_metalcan'] = {chance = 25, quantity = 1, addXP = 5},
            ['md_nails'] = {chance = 25, quantity = 1, addXP = 5},
            ['md_needle'] = {chance = 25, quantity = 1, addXP = 5},
            ['md_nut'] = {chance = 25, quantity = 1, addXP = 5},
            ['md_oldshotgunshell'] = {chance = 25, quantity = 1, addXP = 5},
            ['md_paperclip'] = {chance = 30, quantity = 1, addXP = 10},
            ['md_pulltab'] = {chance = 30, quantity = 1, addXP = 10},
            ['md_rustyball'] = {chance = 30, quantity = 1, addXP = 10},
            ['md_rustyironball'] = {chance = 35, quantity = 1, addXP = 15},
            ['md_rustyjunk'] = {chance = 35, quantity = 1, addXP = 15},
            ['md_rustynails'] = {chance = 35, quantity = 1, addXP = 15},
            ['md_rustypliers'] = {chance = 35, quantity = 1, addXP = 15},
            ['md_rustyring'] = {chance = 35, quantity = 1, addXP = 15},
            ['md_rustyscissors'] = {chance = 35, quantity = 1, addXP = 15},
            ['md_rustyscrewdriver'] = {chance = 35, quantity = 1, addXP = 15},
            ['md_rustyspring'] = {chance = 35, quantity = 1, addXP = 15},
            ['md_screw'] = {chance = 35, quantity = 1, addXP = 15},
            ['md_wheatpenny'] = {chance = 40, quantity = 1, addXP = 20},
            ['md_nickle'] = {chance = 40, quantity = 1, addXP = 20},
            ['md_silverdime'] = {chance = 40, quantity = 1, addXP = 20},
            ['md_quarter'] = {chance = 40, quantity = 1, addXP = 20},
            ['md_halfdollar'] = {chance = 40, quantity = 1, addXP = 20},
            ['md_blackwatch'] = {chance = 40, quantity = 1, addXP = 20},
            ['md_coppernugget'] = {chance = 45, quantity = 1, addXP = 30},
            ['md_ironnugget'] = {chance = 45, quantity = 1, addXP = 30},
            ['md_earpod'] = {chance = 45, quantity = 1, addXP = 30},
            ['md_relicrevolver'] = {chance = 45, quantity = 1, addXP = 30},
            ['md_silverearings'] = {chance = 40, quantity = 1, addXP = 40},
            ['md_silverring'] = {chance = 40, quantity = 1, addXP = 40},
            ['md_silverounce'] = {chance = 40, quantity = 1, addXP = 40},
            ['md_ancientcoin'] = {chance = 35, quantity = 1, addXP = 50},
            ['md_golddollar'] = {chance = 30, quantity = 1, addXP = 55},
            ['md_goldearings'] = {chance = 30, quantity = 1, addXP = 55},
            ['md_goldnecklace'] = {chance = 30, quantity = 1, addXP = 55},
            ['md_goldnugget'] = {chance = 25, quantity = 1, addXP = 65},
            ['md_goldounce'] = {chance = 25, quantity = 1, addXP = 65},
            ['md_goldring'] = {chance = 25, quantity = 1, addXP = 65},
            ['md_diamondearings'] = {chance = 20, quantity = 1, addXP = 75},
            ['md_diamondnecklace'] = {chance = 20, quantity = 1, addXP = 75},
            ['md_diamondring'] = {chance = 20, quantity = 1, addXP = 75},
            ['md_platinumnugget'] = {chance = 15, quantity = 1, addXP = 100},
            ['md_presidentialwatch'] = {chance = 10, quantity = 1, addXP = 150}
        }
    },
    [5] = { -- Level 5
        requiredXP = 100000,
        price = 19575,
        prop = 'black_metaldetector',
        item = 'black_metaldetector',
        radius = 60,
        cooldown = math.random(30000, 60000),
        loot = {
            ['md_bottlecap'] = {chance = 10, quantity = 1, addXP = 2},
            ['md_brokenjunk'] = {chance = 10, quantity = 1, addXP = 2},
            ['md_crushedcan'] = {chance = 10, quantity = 1, addXP = 2},
            ['md_lighter'] = {chance = 15, quantity = 1, addXP = 3},
            ['md_metalcan'] = {chance = 15, quantity = 1, addXP = 3},
            ['md_nails'] = {chance = 15, quantity = 1, addXP = 3},
            ['md_needle'] = {chance = 20, quantity = 1, addXP = 4},
            ['md_nut'] = {chance = 20, quantity = 1, addXP = 4},
            ['md_oldshotgunshell'] = {chance = 20, quantity = 1, addXP = 4},
            ['md_paperclip'] = {chance = 25, quantity = 1, addXP = 5},
            ['md_pulltab'] = {chance = 25, quantity = 1, addXP = 5},
            ['md_rustyball'] = {chance = 25, quantity = 1, addXP = 5},
            ['md_rustyironball'] = {chance = 30, quantity = 1, addXP = 6},
            ['md_rustyjunk'] = {chance = 30, quantity = 1, addXP = 6},
            ['md_rustynails'] = {chance = 30, quantity = 1, addXP = 6},
            ['md_rustypliers'] = {chance = 35, quantity = 1, addXP = 7},
            ['md_rustyring'] = {chance = 35, quantity = 1, addXP = 7},
            ['md_rustyscissors'] = {chance = 35, quantity = 1, addXP = 7},
            ['md_rustyscrewdriver'] = {chance = 40, quantity = 1, addXP = 8},
            ['md_rustyspring'] = {chance = 40, quantity = 1, addXP = 8},
            ['md_screw'] = {chance = 40, quantity = 1, addXP = 8},
            ['md_wheatpenny'] = {chance = 45, quantity = 1, addXP = 9},
            ['md_nickle'] = {chance = 45, quantity = 1, addXP = 9},
            ['md_silverdime'] = {chance = 45, quantity = 1, addXP = 9},
            ['md_quarter'] = {chance = 50, quantity = 1, addXP = 10},
            ['md_halfdollar'] = {chance = 50, quantity = 1, addXP = 10},
            ['md_blackwatch'] = {chance = 50, quantity = 1, addXP = 10},
            ['md_coppernugget'] = {chance = 55, quantity = 1, addXP = 15},
            ['md_ironnugget'] = {chance = 55, quantity = 1, addXP = 15},
            ['md_earpod'] = {chance = 55, quantity = 1, addXP = 15},
            ['md_relicrevolver'] = {chance = 50, quantity = 1, addXP = 20},
            ['md_silverearings'] = {chance = 45, quantity = 1, addXP = 25},
            ['md_silverring'] = {chance = 45, quantity = 1, addXP = 25},
            ['md_silverounce'] = {chance = 45, quantity = 1, addXP = 25},
            ['md_ancientcoin'] = {chance = 40, quantity = 1, addXP = 30},
            ['md_golddollar'] = {chance = 35, quantity = 1, addXP = 35},
            ['md_goldearings'] = {chance = 35, quantity = 1, addXP = 35},
            ['md_goldnecklace'] = {chance = 35, quantity = 1, addXP = 35},
            ['md_goldnugget'] = {chance = 30, quantity = 1, addXP = 40},
            ['md_goldounce'] = {chance = 30, quantity = 1, addXP = 40},
            ['md_goldring'] = {chance = 30, quantity = 1, addXP = 40},
            ['md_diamondearings'] = {chance = 25, quantity = 1, addXP = 50},
            ['md_diamondnecklace'] = {chance = 25, quantity = 1, addXP = 50},
            ['md_diamondring'] = {chance = 25, quantity = 1, addXP = 50},
            ['md_platinumnugget'] = {chance = 20, quantity = 1, addXP = 60},
            ['md_presidentialwatch'] = {chance = 15, quantity = 1, addXP = 75}
        }
    }
}

-- Manage miscellaneous options for items 
-- ['itemName']: The item name itself
-- label: Item name to be displayed in shop, notifications, etc
-- price: How much this item sells for in the sell shop
-- image: The image used for this item in Discord logs, etc
-- sell: Disable (false) or enable (true) selling of this item
Config.Items = {
    ['md_bottlecap'] = {label = 'Bottle Cap', price = 5, image = 'https://i.imgur.com/nETNrxU.png', sell = true},
    ['md_brokenjunk'] = {label = 'Broken Junk', price = 5, image = 'https://i.imgur.com/2XOYgRI.png', sell = true},
    ['md_crushedcan'] = {label = 'Crushed Can', price = 5, image = 'https://i.imgur.com/v2fbe1W.png', sell = true},
    ['md_lighter'] = {label = 'Lighter', price = 5, image = 'https://i.imgur.com/YJb6U3o.png', sell = true},
    ['md_metalcan'] = {label = 'Metal Can', price = 5, image = 'https://i.imgur.com/UNguNq8.png', sell = true},
    ['md_nails'] = {label = 'Nails', price = 10, image = 'https://i.imgur.com/kgkJLNl.png', sell = true},
    ['md_needle'] = {label = 'Needle', price = 10, image = 'https://i.imgur.com/crllSHH.png', sell = true},
    ['md_nut'] = {label = 'Nut', price = 10, image = 'https://i.imgur.com/fqilDbe.png', sell = true},
    ['md_oldshotgunshell'] = {label = 'Old Shotgun Shell', price = 10, image = 'https://i.imgur.com/5Zj6QbG.png', sell = true},
    ['md_paperclip'] = {label = 'Paper Clip', price = 10, image = 'https://i.imgur.com/kOXJmSR.png', sell = true},
    ['md_pulltab'] = {label = 'Pull Tab', price = 15, image = 'https://i.imgur.com/EaH2g64.png', sell = true},
    ['md_rustyball'] = {label = 'Rusty Ball', price = 15, image = 'https://i.imgur.com/q1VNDkL.png', sell = true},
    ['md_rustyironball'] = {label = 'Rusty Iron Ball', price = 15, image = 'https://i.imgur.com/kcmq6aV.png', sell = true},
    ['md_rustyjunk'] = {label = 'Rusty Junk', price = 15, image = 'https://i.imgur.com/F2Jil3d.png', sell = true},
    ['md_rustynails'] = {label = 'Rusty Nails', price = 15, image = 'https://i.imgur.com/5B4AE8B.png', sell = true},
    ['md_rustypliers'] = {label = 'Rusty Pliers', price = 20, image = 'https://i.imgur.com/T4y35Ir.png', sell = true},
    ['md_rustyring'] = {label = 'Rusty Ring', price = 20, image = 'https://i.imgur.com/wQ285YF.png', sell = true},
    ['md_rustyscissors'] = {label = 'Rusty Scissors', price = 20, image = 'https://i.imgur.com/joeopJB.png', sell = true},
    ['md_rustyscrewdriver'] = {label = 'Rusty Screwdriver', price = 20, image = 'https://i.imgur.com/qijJWm7.png', sell = true},
    ['md_rustyspring'] = {label = 'Rusty Spring', price = 30, image = 'https://i.imgur.com/FMUi1nK.png', sell = true},
    ['md_screw'] = {label = 'Screw', price = 30, image = 'https://i.imgur.com/dPXfzlZ.png', sell = true},
    ['md_wheatpenny'] = {label = 'Wheat Penny', price = 30, image = 'https://i.imgur.com/oJrmWFb.png', sell = true},
    ['md_nickle'] = {label = 'Nickle', price = 40, image = 'https://i.imgur.com/UwfCKpH.png', sell = true},
    ['md_silverdime'] = {label = 'Silver Dime', price = 40, image = 'https://i.imgur.com/L4f13a0.png', sell = true},
    ['md_quarter'] = {label = 'Quarter', price = 50, image = 'https://i.imgur.com/Dp19B6l.png', sell = true},
    ['md_halfdollar'] = {label = 'Half Dollar', price = 75, image = 'https://i.imgur.com/xpi4czE.png', sell = true},
    ['md_blackwatch'] = {label = 'Black Watch', price = 125, image = 'https://i.imgur.com/uEpzmAa.png', sell = true},
    ['md_coppernugget'] = {label = 'Copper Nugget', price = 150, image = 'https://i.imgur.com/UjDahA4.png', sell = true},
    ['md_ironnugget'] = {label = 'Iron Nugget', price = 175, image = 'https://i.imgur.com/S5RcaQG.png', sell = true},
    ['md_earpod'] = {label = 'Ear Pod', price = 200, image = 'https://i.imgur.com/X78EF82.png', sell = true},
    ['md_relicrevolver'] = {label = 'Relic Revolver', price = 250, image = 'https://i.imgur.com/1vZczzx.png', sell = true},
    ['md_silverearings'] = {label = 'Silver Earrings', price = 500, image = 'https://i.imgur.com/3pCLT6L.png', sell = true},
    ['md_silverring'] = {label = 'Silver Ring', price = 500, image = 'https://i.imgur.com/xzDGnu0.png', sell = true},
    ['md_silverounce'] = {label = '1oz Silver Bar', price = 750, image = 'https://i.imgur.com/2VsJOyg.png', sell = true},
    ['md_ancientcoin'] = {label = 'Ancient Coin', price = 1000, image = 'https://i.imgur.com/G0Gu7L0.png', sell = true},
    ['md_golddollar'] = {label = 'Gold Dollar', price = 1250, image = 'https://i.imgur.com/YygpfbP.png', sell = true},
    ['md_goldearings'] = {label = 'Gold Earrings', price = 1500, image = 'https://i.imgur.com/EghrnF6.png', sell = true},
    ['md_goldnecklace'] = {label = 'Gold Necklace', price = 1750, image = 'https://i.imgur.com/CIERjol.png', sell = true},
    ['md_goldnugget'] = {label = 'Gold Nugget', price = 2000, image = 'https://i.imgur.com/LimrhLW.png', sell = true},
    ['md_goldounce'] = {label = '1oz Gold Bar', price = 2250, image = 'https://i.imgur.com/3dB7Qxu.png', sell = true},
    ['md_goldring'] = {label = 'Gold Ring', price = 2500, image = 'https://i.imgur.com/CksERb4.png', sell = true},
    ['md_diamondearings'] = {label = 'Diamond Earrings', price = 3000, image = 'https://i.imgur.com/sYsaT0b.png', sell = true},
    ['md_diamondnecklace'] = {label = 'Diamond Necklace', price = 3250, image = 'https://i.imgur.com/hVZbgb8.png', sell = true},
    ['md_diamondring'] = {label = 'Diamond Ring', price = 3500, image = 'https://i.imgur.com/YUpQIaF.png', sell = true},
    ['md_platinumnugget'] = {label = 'Platinum Nugget', price = 4000, image = 'https://i.imgur.com/s46YycI.png', sell = true},
    ['md_presidentialwatch'] = {label = 'Presidential Watch', price = 5000, image = 'https://i.imgur.com/EvojnG1.png', sell = true}
}