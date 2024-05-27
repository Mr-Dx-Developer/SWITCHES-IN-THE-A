Config = {}
Config.Debug = false -- Used for debugging purposes, keep false unless needed and know what you are doing

-- Set your dispatch system below
-- Available options: 'cd_dispatch', 'linden_outlawalert', 'ps-dispatch', 'qs-dispatch' and 'custom'
-- 'custom' needs to be added manually to client/functions.lua
Config.Dispatch = 'ps-dispatch'

-- Target system, available options are: 'ox_target', 'qb-target', 'qtarget' & 'custom'
-- 'custom' needs to be added to client/functions.lua
Config.Target = 'qb-target'

-- Do you want to be notified via server console if an update is available?
-- True if yes, false if no
Config.VersionCheck = true

-- Do you want the script to check the players inventory upon zone entry
-- for drugs and if 1 or more are found, then show target/TextUI options?
-- If false, it won't perform any checks and will persistently show target/TextUI
Config.CheckInv = true

-- Optionally, use the TextUI instead of a target system
Config.TextUI = {
    enabled = true, -- If enabled is true, then the target system will not be used
    interact = 38, -- What key to press to interact? (https://docs.fivem.net/docs/game-references/controls/)
}

-- These jobs will be unable to sell drugs
Config.BlacklistJobs = { 'ambulance', 'police' }
Config.Police = {
    jobs = { 'police', 'sheriff' }, -- List all your police jobs here (these will receive dispatch notifications & impact risk features)
    enableRisk = false, -- If true will only increase drug prices by specific percentage when ANY amount of police are online
    riskFactor = 10, -- The percentage all drug prices increase if police are online (doesn't matter how many)
    advancedRisk = true, -- More advanced risk feature, this increases drug price for every police officer online
    advancedRiskFactor = 5 -- The percentage all drug prices will increase for EACH police officer online (2 cops = 10% increase, because 5 * 2 = 10)
}

-- Config.Account is the account (cash, money, bank) or item (black_money, markedbills, cashrolls, etc) a player
-- Will receive upon a succesful drug sale. If your using QBCore, please configure the options further below
Config.Account = 'cash'
Config.QBCore = { -- QBCore specific option(s), does not apply to ESX
    -- updateValue, if using 'markedbills' or a similar item then this feature will
    -- "add" money to the existing item instead of creating a new one.
    -- For example, if true, and a player makes two separate sales worth $200
    -- each, they will have 1 item worth $400. And will continue to be added too
    -- for each sale. If false, they will have two items worth $200 each, and a new one for each sale after.
    updateValue = true,
}

-- Configure all animations here
Config.Animations = {
    BuyerRejects = { -- Animation configs when buyer rejects sale
        phoneModel = 'prop_npc_phone_02', -- Model used during animation
        phonePos = {x = 0.0, y = 0.0, z = 0.0}, -- Position of model from entity's right hand bone index
        phoneRot = {x = 0.0, y = 0.0, z = 0.0}, -- Rotation of model
        animDict = 'cellphone@', -- Animation dictionary
        animClip = 'cellphone_call_listen_base' -- Animation name
    },
    BuyerAccepts = {
        drugModel = 'prop_weed_bottle',
        drugPos = {x = 0.13, y = 0.02, z = 0.0},
        drugRot = {x = -90.0, y = 0.0, z = 0.0},
        cashModel = 'hei_prop_heist_cash_pile',
        cashPos = {x = 0.13, y = 0.02, z = 0.0},
        cashRot = {x = -90.0, y = 0.0, z = 0.0},
        animDict = 'mp_common',
        animClip = 'givetake1_a'
    },
    ClaimRobbedItems = {
        animDict = 'pickup_object',
        animClip = 'pickup_low'
    }
}

-- Here you can fully customize each and every zone to your needs
Config.DebugZones = false -- Option to enable zone debug (can visually see the zone in-game)
Config.Zones = { -- The main config option for creating & editing selling zones
    [1] = { -- Each zone must start like this, incrementing by 1 with every zone (This is Vinewood)
        name = 'Vinewood',
        coords = vec3(284.3999, -86.8160, 70.1332), -- The center-most part of the zone/area
        size = 500, -- The size (radius) of the zone
        daySelling = true, -- Can players sell drugs in this zone during daytime?
        requirePolice = false, -- Do you want to require police be online to sell here?
        policeRequired = 1, -- If requirePolice = true, then how many are required?
        allowRobbery = true, -- Allow chance for players to get robbed here?
        robberyChance = 5, -- If allowRobbery, what percentage chance does a player get robbed?
        cooldown = false, -- Do you want to enable cooldowns between drug sales?
        cooldownTime = 15000, -- If cooldown = true, how long should the cooldown be? (in milliseconds)
        drugs = { -- The drugs that can be sold inside this zone
            ['shroom_pooch'] = { -- The actual drug item name
                label = 'Shroom Pooch', -- Just a label/name of the item used for displays, etc
                icon = 'fas fa-cannabis', -- The icon to display next to this drug in the menu (https://fontawesome.com/search?o=r&m=free)
                callChance = 10, -- The percentage chance the NPC rejects & calls police
                randomPrice = true, -- Do you want to use base price, or randomized pricing (min/max)?
                basePrice = 100, -- Base price used if randomPrice is false
                minPrice = 90, -- Minimum selling price if randomPrice is true
                maxPrice = 120, -- Maximum selling price if randomPrice is true
                randomQuantity = true, -- Do you want to use base quantity, or randomized quantities (min/max)?
                baseQuantity = 1, -- Base quantity sold per interaction if randomQuantity is false
                minQuantity = 1, -- Minimum amount sold per interaction if randomQuantity is true
                maxQuantity = 2 -- Maximum amount sold per interaction if randomQuantity is true
            },
            ['weed_bag'] = {
                label = 'Weed Bag',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 650,
                minPrice = 650,
                maxPrice = 650,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['coke_pooch'] = {
                label = 'Coke Pooch',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 600,
                minPrice = 600,
                maxPrice = 600,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['meth_bag'] = {
                label = 'Meth Bag',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 615,
                minPrice = 615,
                maxPrice = 300,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['101_brick'] = {
                label = '101 Brick',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 10000,
                minPrice = 10000,
                maxPrice = 10000,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['famgoon_dogfood'] = {
                label = 'Famgoon Dogfood',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 615,
                minPrice = 615,
                maxPrice = 300,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['ace30'] = {
                label = 'ACE30',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 7000,
                minPrice = 7000,
                maxPrice = 7000,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['wham_pack'] = {
                label = 'WHAM PACK',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 9500,
                minPrice = 9500,
                maxPrice = 9500,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['gumbo'] = {
                label = 'Gumbo',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 2500,
                minPrice = 2500,
                maxPrice = 2500,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['famgoon_lean'] = {
                label = 'Famgoon Lean',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 4000,
                minPrice = 4000,
                maxPrice = 4000,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['gumbo_snowball'] = {
                label = 'Gumbo SnowBall',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 2750,
                minPrice = 2750,
                maxPrice = 2750,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['undertaker'] = {
                label = 'Undertaker',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 1900,
                minPrice = 1900,
                maxPrice = 1900,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['whyphy'] = {
                label = 'WhyPhy',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 3500,
                minPrice = 3500,
                maxPrice = 3500,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['muddy'] = {
                label = 'Muddy',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 2500,
                minPrice = 2500,
                maxPrice = 2500,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['101_snowwhite'] = {
                label = '101 Snow White',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 3750,
                minPrice = 3750,
                maxPrice = 3750,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['macbook_pro_drug'] = {
                label = '24 MacBook Pro',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 2000,
                minPrice = 2000,
                maxPrice = 2000,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['fentanyl_drug'] = {
                label = 'Fentanyl Drug',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 15000,
                minPrice = 15000,
                maxPrice = 15000,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['tusi_drug'] = {
                label = 'TUSI Drug',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 2500,
                minPrice = 2500,
                maxPrice = 2500,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['jack_runtz'] = {
                label = 'Jack Runtz',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 3200,
                minPrice = 3200,
                maxPrice = 3200,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            }
            
        },
        blip = {
            enabled = false, -- Do you want this zone to be visible on the map via blip?
            radiusBlip = true, -- Do you want a radius blip to show the size of the zone?
            sprite = 51, -- Sprite: https://docs.fivem.net/docs/game-references/blips/
            color = 1, -- Color: https://docs.fivem.net/docs/game-references/blips/#blip-colors
            scale = 0.8, -- Size of the blip
            label = 'Drug Selling Zone' -- Blip label
        },
        ignoreModels = { -- Do not allow drug sales to these specific ped models
            'a_m_m_beach_01',
            'a_m_m_bevhills_02',
            -- Add more models here
        }
    },
    [2] = { -- Grove Street
        name = 'Grove Street',
        coords = vec3(41.7646, -1806.0198, 25.4974),
        size = 250,
        daySelling = false,
        requirePolice = false,
        policeRequired = 1,
        allowRobbery = true,
        robberyChance = 15,
        cooldown = false,
        cooldownTime = 15000,
        drugs = {
            ['shroom_pooch'] = { -- The actual drug item name
                label = 'Shroom Pooch', -- Just a label/name of the item used for displays, etc
                icon = 'fas fa-cannabis', -- The icon to display next to this drug in the menu (https://fontawesome.com/search?o=r&m=free)
                callChance = 10, -- The percentage chance the NPC rejects & calls police
                randomPrice = true, -- Do you want to use base price, or randomized pricing (min/max)?
                basePrice = 100, -- Base price used if randomPrice is false
                minPrice = 90, -- Minimum selling price if randomPrice is true
                maxPrice = 120, -- Maximum selling price if randomPrice is true
                randomQuantity = true, -- Do you want to use base quantity, or randomized quantities (min/max)?
                baseQuantity = 1, -- Base quantity sold per interaction if randomQuantity is false
                minQuantity = 1, -- Minimum amount sold per interaction if randomQuantity is true
                maxQuantity = 2 -- Maximum amount sold per interaction if randomQuantity is true
            },
            ['weed_bag'] = {
                label = 'Weed Bag',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 650,
                minPrice = 650,
                maxPrice = 650,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['coke_pooch'] = {
                label = 'Coke Pooch',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 600,
                minPrice = 600,
                maxPrice = 600,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['meth_bag'] = {
                label = 'Meth Bag',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 615,
                minPrice = 615,
                maxPrice = 300,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['101_brick'] = {
                label = '101 Brick',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 10000,
                minPrice = 10000,
                maxPrice = 10000,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['famgoon_dogfood'] = {
                label = 'Famgoon Dogfood',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 615,
                minPrice = 615,
                maxPrice = 300,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['ace30'] = {
                label = 'ACE30',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 7000,
                minPrice = 7000,
                maxPrice = 7000,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['wham_pack'] = {
                label = 'WHAM PACK',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 9500,
                minPrice = 9500,
                maxPrice = 9500,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['gumbo'] = {
                label = 'Gumbo',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 2500,
                minPrice = 2500,
                maxPrice = 2500,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['famgoon_lean'] = {
                label = 'Famgoon Lean',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 4000,
                minPrice = 4000,
                maxPrice = 4000,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['gumbo_snowball'] = {
                label = 'Gumbo SnowBall',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 2750,
                minPrice = 2750,
                maxPrice = 2750,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['undertaker'] = {
                label = 'Undertaker',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 1900,
                minPrice = 1900,
                maxPrice = 1900,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['whyphy'] = {
                label = 'WhyPhy',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 3500,
                minPrice = 3500,
                maxPrice = 3500,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['muddy'] = {
                label = 'Muddy',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 2500,
                minPrice = 2500,
                maxPrice = 2500,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['101_snowwhite'] = {
                label = '101 Snow White',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 3750,
                minPrice = 3750,
                maxPrice = 3750,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['macbook_pro_drug'] = {
                label = '24 MacBook Pro',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 2000,
                minPrice = 2000,
                maxPrice = 2000,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['fentanyl_drug'] = {
                label = 'Fentanyl Drug',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 15000,
                minPrice = 15000,
                maxPrice = 15000,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['tusi_drug'] = {
                label = 'TUSI Drug',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 2500,
                minPrice = 2500,
                maxPrice = 2500,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            },
            ['jack_runtz'] = {
                label = 'Jack Runtz',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 3200,
                minPrice = 3200,
                maxPrice = 3200,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 2
            }
        },
        blip = {
            enabled = false,
            radiusBlip = true,
            sprite = 51,
            color = 1,
            scale = 0.8,
            label = 'Drug Selling Zone'
        },
        ignoreModels = {
            'a_m_m_beach_01',
            'a_m_m_bevhills_02'
        }
    },
    --[[ [3] = { -- Rockford Hills
        name = 'Rockford Hills',
        coords = vec3(-788.5231, -271.2880, 37.0597),
        size = 400,
        daySelling = true,
        requirePolice = false,
        policeRequired = 1,
        allowRobbery = true,
        robberyChance = 5,
        cooldown = false,
        cooldownTime = 15000,
        drugs = {
            ['regweed_bud'] = {
                label = 'Weed',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 100,
                minPrice = 50,
                maxPrice = 100,
                randomQuantity = true,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 4
            },
            ['purplehaze_bud'] = {
                label = 'Purple Haze',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 150,
                minPrice = 100,
                maxPrice = 200,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 2,
                maxQuantity = 6
            },
            ['bluedream_bud'] = {
                label = 'Blue Dream',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 200,
                minPrice = 150,
                maxPrice = 250,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 3,
                maxQuantity = 7
            },
            ['bananakush_bud'] = {
                label = 'Banana Kush',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 250,
                minPrice = 200,
                maxPrice = 300,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 4,
                maxQuantity = 8
            }
        },
        blip = {
            enabled = false,
            radiusBlip = true,
            sprite = 51,
            color = 1,
            scale = 0.8,
            label = 'Drug Selling Zone'
        },
        ignoreModels = {
            'a_m_m_beach_01',
            'a_m_m_bevhills_02'
        }
    },
    [4] = { -- Vespucci
        name = 'Vespucci',
        coords = vec3(-1156.7509, -1346.9380, 5.1421),
        size = 250,
        daySelling = true,
        requirePolice = true,
        policeRequired = 1,
        allowRobbery = true,
        robberyChance = 5,
        cooldown = false,
        cooldownTime = 15000,
        drugs = {
            ['regweed_bud'] = {
                label = 'Weed',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = false,
                basePrice = 100,
                minPrice = 50,
                maxPrice = 100,
                randomQuantity = false,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 4
            },
            ['purplehaze_bud'] = {
                label = 'Purple Haze',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 150,
                minPrice = 100,
                maxPrice = 250,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 2,
                maxQuantity = 6
            },
            ['bluedream_bud'] = {
                label = 'Blue Dream',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 200,
                minPrice = 150,
                maxPrice = 350,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 3,
                maxQuantity = 7
            },
            ['bananakush_bud'] = {
                label = 'Banana Kush',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 250,
                minPrice = 200,
                maxPrice = 450,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 4,
                maxQuantity = 8
            }
        },
        blip = {
            enabled = false,
            radiusBlip = true,
            sprite = 51,
            color = 1,
            scale = 0.8,
            label = 'Drug Selling Zone'
        },
        ignoreModels = {
            'a_m_m_beach_01',
            'a_m_m_bevhills_02'
        }
    },
    [5] = { -- Little Seoul
        name = 'Little Seoul',
        coords = vec3(-639.7375, -959.1450, 21.4762),
        size = 250,
        daySelling = true,
        requirePolice = true,
        policeRequired = 1,
        allowRobbery = true,
        robberyChance = 5,
        cooldown = false,
        cooldownTime = 15000,
        drugs = {
            ['regweed_bud'] = {
                label = 'Weed',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = false,
                basePrice = 100,
                minPrice = 50,
                maxPrice = 100,
                randomQuantity = false,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 4
            },
            ['purplehaze_bud'] = {
                label = 'Purple Haze',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 150,
                minPrice = 100,
                maxPrice = 250,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 2,
                maxQuantity = 6
            },
            ['bluedream_bud'] = {
                label = 'Blue Dream',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 200,
                minPrice = 150,
                maxPrice = 350,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 3,
                maxQuantity = 7
            },
            ['bananakush_bud'] = {
                label = 'Banana Kush',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 250,
                minPrice = 200,
                maxPrice = 450,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 4,
                maxQuantity = 8
            }
        },
        blip = {
            enabled = false,
            radiusBlip = true,
            sprite = 51,
            color = 1,
            scale = 0.8,
            label = 'Drug Selling Zone'
        },
        ignoreModels = {
            'a_m_m_beach_01',
            'a_m_m_bevhills_02'
        }
    },
    [6] = { -- Los Santos International Airport
        name = 'LSIA',
        coords = vec3(-950.7200, -2581.1265, 13.9808),
        size = 250,
        daySelling = true,
        requirePolice = true,
        policeRequired = 1,
        allowRobbery = true,
        robberyChance = 5,
        cooldown = false,
        cooldownTime = 15000,
        drugs = {
            ['regweed_bud'] = {
                label = 'Weed',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = false,
                basePrice = 100,
                minPrice = 50,
                maxPrice = 100,
                randomQuantity = false,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 4
            },
            ['purplehaze_bud'] = {
                label = 'Purple Haze',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 150,
                minPrice = 100,
                maxPrice = 250,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 2,
                maxQuantity = 6
            },
            ['bluedream_bud'] = {
                label = 'Blue Dream',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 200,
                minPrice = 150,
                maxPrice = 350,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 3,
                maxQuantity = 7
            },
            ['bananakush_bud'] = {
                label = 'Banana Kush',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 250,
                minPrice = 200,
                maxPrice = 450,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 4,
                maxQuantity = 8
            }
        },
        blip = {
            enabled = false,
            radiusBlip = true,
            sprite = 51,
            color = 1,
            scale = 0.8,
            label = 'Drug Selling Zone'
        },
        ignoreModels = {
            'a_m_m_beach_01',
            'a_m_m_bevhills_02'
        }
    },
    [7] = { -- Downtown
        name = 'Downtown',
        coords = vec3(73.9965, -855.3434, 30.7511),
        size = 300,
        daySelling = true,
        requirePolice = true,
        policeRequired = 1,
        allowRobbery = true,
        robberyChance = 5,
        cooldown = false,
        cooldownTime = 15000,
        drugs = {
            ['regweed_bud'] = {
                label = 'Weed',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = false,
                basePrice = 100,
                minPrice = 50,
                maxPrice = 100,
                randomQuantity = false,
                baseQuantity = 1,
                minQuantity = 1,
                maxQuantity = 4
            },
            ['purplehaze_bud'] = {
                label = 'Purple Haze',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 150,
                minPrice = 100,
                maxPrice = 250,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 2,
                maxQuantity = 6
            },
            ['bluedream_bud'] = {
                label = 'Blue Dream',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 200,
                minPrice = 150,
                maxPrice = 350,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 3,
                maxQuantity = 7
            },
            ['bananakush_bud'] = {
                label = 'Banana Kush',
                icon = 'fas fa-cannabis',
                callChance = 10,
                randomPrice = true,
                basePrice = 250,
                minPrice = 200,
                maxPrice = 450,
                randomQuantity = true,
                baseQuantity = 2,
                minQuantity = 4,
                maxQuantity = 8
            }
        },
        blip = {
            enabled = false,
            radiusBlip = true,
            sprite = 51,
            color = 1,
            scale = 0.8,
            label = 'Drug Selling Zone'
        },
        ignoreModels = {
            'a_m_m_beach_01',
            'a_m_m_bevhills_02'
        }
    }, ]]
    -- Add more zones here (must follow the same exact format as zones above)
}