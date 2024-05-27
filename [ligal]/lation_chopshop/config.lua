Config, Seconds, Minutes = {}, 1000, 60000 -- Do not touch

-- Use only if needed, directed by support or know what you're doing
-- Notice: enabling debug features can significantly increase resmon
-- And should always be disabled in production unless otherwise needed
Config.Debug = false

-- Do you want to be notified via server console if an update is available?
-- True if yes, false if no
Config.VersionCheck = true

-- Target system, available options are: 'ox_target', 'qb-target', 'qtarget' and 'custom'
-- If 'custom' you have to configure the event via client/functions.lua
Config.Target = 'qb-target'

-- Select your ox_lib progress UI preference
-- Options are 'circle' and 'bar'
Config.ProgressType = 'circle'

-- You can set your phone system below or set to 'none' to use a default alert
-- Options: 'qb-phone', 'npwd', 'qs-smartphone', 'qs-smartphonepro', 'lb-phone', 'gksphone', 'yseries', 'custom' or 'none'
-- If 'custom' you will have to configure your event(s) via client & server functions.lua
-- If 'none' then it will use a default alert dialog from ox_lib
Config.Phone = 'lb-phone'

-- Set your police related options below
Config.Police = {
    -- Set your police jobs below
    jobs = { 'police', 'sheriff '},
    -- Do you want to require police be online to chop?
    require = false,
    -- If require = true, how many should be online?
    count = 3,
    -- Options are: 'cd_dispatch', 'linden_outlawalert', 'ps-dispatch', 'qs-dispatch' and 'custom'
    dispatch = 'ps-dispatch'
}

-- If true, the main starting NPC will be spawned as normal
-- If false, there will be no starting NPC at all
-- This option exists for those who want to handle where
-- When and how to open the main menu via exports, etc
Config.StartNPC = true

-- The location at which the NPC is spawned to request/start a job
-- Multiple NPCs can be spawned in multiple locations if desired
Config.StartLocation = {
    vec4(-169.0171, -1352.3877, 29.9817, 91.8764),
    -- Add more spawns here if desired
}

-- If enabled, the NPC spawned from above will be spawned randomly
-- At only one of the locations listed. If false, the ped will spawn
-- Normally at all locations listed
Config.RandomizeSpawn = false

-- How long (in seconds) until a job assignment is given after requesting a job
-- By default, it will take anywhere from 1 to 3 minutes to receive a job after started
Config.Cooldown = { min = 60, max = 180 }

-- Optional feature that will add "Learn More" buttons in the main menu
-- To explain the main features to the player
Config.Documentation = true

-- If enabled, this allows players to cancel their current job assigned
-- From the "Request a Job" option. If false, they can not cancel it
Config.AllowCancel = true

-- Reputation settings configuration
-- max: The maximum amount of reputation a player can earn
-- displayScale: A scaling factor used for displaying reputation progress in the menu.
-- This value scales the max reputation to a range of 0 to 100 for display purposes.
-- For example, if max reputation is 100,000 and displayScale is 1,000, 
-- a reputation of 10,000 will be displayed as 10 in the menu (10,000 / 1,000 = 10)
-- mastery: The number of reputation points required to earn one mastery point
Config.Reputation = {
    max = 100000,
    displayScale = 1000,
    mastery = 5000
}

-- Once a player has begun breaking the lock on a vehicle
-- How long should the alarm last?
Config.Alarm = 90 * Seconds

-- This works in tandem with the above vehicle alarm
-- When the vehicle alarm is active, these keys will be disabled
-- The default two keys disable horn (86) and headlight (74) controls
-- Ensuring the vehicle's alarm remains active during its cycle
-- All control ID's can be found here: https://docs.fivem.net/docs/game-references/controls/
Config.Disable = {74, 86}

-- This option is for QBCore only
-- If your on QBCore and you wish to reward players in dirty money (markedbills or similar)
-- For various settings like the Swap Shop or vehicle sales and you use metadata
-- On your markedbills or similar dirty money, then make sure this is true
-- If you use markedbills without metadata (like 1:1 conversion), then set this to false
Config.Metadata = true

-- This option should rarely, if ever, need to be adjusted
-- However, this is the size of the zone you bring your assigned vehicle too
-- To begin the chopping process. If you need a larger/smaller zone, you can
-- Make that adjustment here
Config.ChopZoneRadius = 20

-- Manage all item names if needed due to naming conflicts, etc
-- And to alter the requirements when chopping if desired
Config.Items = {
    autoParts = {
        item = 'auto_parts'
    },
    lockpick = {
        item = 'chop_lockpick', -- Item name in inventory resource
        require = true, -- Require this item when breaking locks on vehicles?
        remove = false, -- Remove this item on each use?
        breakChance = true, -- If remove = false, want to enable chance to "break" the item when failing skillcheck?
        breakPercent = 20 -- If breakChance = true, what percentage chance to break?
    },
    torch = { -- Optional item requirement when removing doors/frame
        item = 'chop_torch',
        require = true,
        remove = false,
        breakChance = true,
        breakPercent = 10
    },
    lugWrench = { -- Optional item requirement when removing wheels
        item = 'chop_lugwrench',
        require = true,
        remove = false,
        breakChance = true,
        breakPercent = 10,
    }
}

-- Manage the various shop settings here
Config.Shops = {
    toolShop = {
        enable = true, -- Enable this shop?
        location = vec4(452.9195, -1305.5288, 30.1209, 321.7650), -- Where this shop is located
        model = 'a_m_m_eastsa_02', -- Shop's ped model (https://docs.fivem.net/docs/game-references/ped-models/)
        -- You can limit the hours at which the supply shop is available here
        -- Min is the earliest the shop is available (default 6:00AM)
        -- Max is the latest the shop is available (detault 21:00 aka 9PM)
        -- If you want it available 24/7, set min to 1 and max to 24
        hours = { min = 6, max = 21 },
        account = 'cash', -- Use cash or bank when purchasing here?
        items = {
            -- item: item spawn name
            -- price: how much it costs
            -- label: display name
            -- icon: icon for this item
            -- iconColor: color code for this icon
            -- min: minimum amount the player must purchase at once
            -- max: maximum amount the player can purchase at once
            [1] = { item = Config.Items.lockpick.item, price = 250, label = 'Lockpick', icon = 'unlock', iconColor = '', min = 1, max = 3 },
            [2] = { item = Config.Items.lugWrench.item, price = 750, label = 'Lug Wrench', icon = 'wrench', iconColor = '', min = 1, max = 3 },
            [3] = { item = Config.Items.torch.item, price = 1250, label = 'Torch', icon = 'fire-flame-curved', iconColor = '', min = 1, max = 3 },
            -- See example below on how to add more items here:
            -- [4] = { item = 'something', price = 100, label = 'Something', icon = 'user', min = 1, max = 100 }
            -- Add more items if desired here following the same format as above
            -- Or remove items from this list if you want - just be sure to update the number scheme [1], [2], etc
        },
        blip = {
            enable = true, -- Enable or disable the blip for this shop
            sprite = 380, -- Sprite ID (https://docs.fivem.net/docs/game-references/blips/)
            color = 0, -- Color (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
            scale = 0.8, -- Size/scale
            label = 'Chop Shop' -- Label
        }
    },
    swapShop = {
        enable = true,
        location = vec4(1175.8860, -1378.6080, 34.9780, 2.7024),
        model = 'a_m_m_og_boss_01',
        hours = { min = 6, max = 21 },
        -- Instead of using cash or bank like above, this shop is for 
        -- Swapping the "auto_parts" item received when chopping vehicles
        -- Into something else, such as money, materials or even limited
        -- Or exclusive items used for robberies, etc - build this shop how you wish!
        currency = Config.Items.autoParts.item,
        items = {
            -- item: item spawn name
            -- price: how much it costs in auto_parts
            -- label: display name
            -- icon: icon for this item
            -- iconColor: color code for this icon
            -- quantity: how many of this item are rewarded (for example: 'cash' with a price of 1 and quantity of 5, means 5 cash per 1 auto_part)
            -- min: minimum amount the player must purchase at once
            -- max: maximum amount the player can purchase at once
            [1] = { item = 'black_money', price = 1, label = 'Dirty Money', icon = 'fas fa-sack-dollar', iconColor = '', quantity = 5, min = 1, max = 5000 },
            [2] = { item = 'plastic', price = 5, label = 'Plastic', icon = 'fas fa-sheet-plastic', iconColor = '', quantity = 1, min = 1, max = 50 },
            [3] = { item = 'iron', price = 10, label = 'Iron', icon = 'fas fa-layer-group', quantity = 1, iconColor = '', min = 1, max = 50 },
            [4] = { item = 'aluminum', price = 15, label = 'Aluminum', icon = 'fas fa-cubes-stacked', iconColor = '', quantity = 1, min = 1, max = 50 },
            [5] = { item = 'usb', price = 5000, label = 'Illegal USB', icon = 'fab fa-usb', min = 1, iconColor = '', quantity = 1, max = 1 },
            -- See example below on how to add more items here:
            -- [6] = { item = 'something', price = 100, label = 'Something', icon = 'user', min = 1, max = 100 }
            -- Add more items if desired here following the same format as above
            -- Or remove items from this list if you want - just be sure to update the number scheme [1], [2], etc
        },
        blip = {
            enable = true,
            sprite = 728,
            color = 0,
            scale = 0.8,
            label = 'Swap Shop'
        }
    }
}

-- Manage all contract (client request) related options here
Config.ClientRequests = {
    unlocksAt = 50000, -- At what reputation level does Client Requests unlock?
    maxRequests = 3, -- How many contracts/requests per server session per eligible player?
    driverModel = 'a_m_m_business_01', -- Ped model used for driver (https://docs.fivem.net/docs/game-references/ped-models/)
    seatPosition = -1, -- Ped's seat position (-1 is driver seat)
    vehicleSpeed = 20.0, -- Average vehicle speed (not KM/H or MPH, but a scale - lower is slower, higher is faster)
    drivingStyle = 447, -- Driving style flag (useful tool for this: https://vespura.com/fivem/drivingstyle/)
    armDriver = true, -- Arm the driver with a weapon?
    weaponHash = 453432689, -- If armDriver = true, what weapon? (default is pistol, find more here: https://gtahash.ru/weapons/?page=1)
    ammoCount = 150, -- If armDriver = true, how much ammo does the ped have?
    accuracy = 100, -- If armDriver = true, how accurate is the ped? (ranges from 0 to 100)
    givePedArmour = true, -- Apply armour to the ped?
    armourAmount = 100, -- If givePedArmour = true, how much? (ranges from 0 to 100)
    sellAccount = 'black_money', -- When selling a vehicle, how does player receive payment? (bank, cash, markedbills, etc)
    tracking = { -- Various options for the tracking blip settings
        visibleTime = 5000, -- How long is the blip visible for?
        inbetweenTime = 30000, -- How long in between blip being visible?
        retry = false, -- If a player fails to obtain the vehicle in time, do you want to add the contract back/allow them to try again?
        blip = { -- Blip settings
            shortRange = false, -- True to display the blip on minimap only if nearby and false to display the blip from any distance
            sprite = 225, -- Sprite ID (https://docs.fivem.net/docs/game-references/blips/)
            scale = 1.0, -- Size/scale of blip
            colors = { -- The color of the blip will update based on how much time is remaining for the contract
                strong = 2, -- When the time remaining is greater than or equal to 66%+, its this color (green)
                medium = 66, -- When the time remaining is less than 66% but greater than 33%, its this color (yellow)
                weak = 1 -- When the time remaining is less than 33%, its this color (red)
            }
        }
    }
}

-- Manage mission related blip settings here
Config.Blips = {
    start = { -- Optional blip settings for the start location if desired
        enabled = false,
        sprite = 225,
        color = 2,
        scale = 0.9,
        label = 'Vehicle Chopping'
    },
    vehicle = { -- Radius blip displayed showing general location of vehicle
        offset = { min = -70, max = 70 }, -- The offset from the vehicle (currently at max possible for 100 unit radius)
        radius = { size = 100.0, color = 1, alpha = 100 } -- The size, color and alpha of the radius
    },
    dropoff = { -- Blip displayed for the drop off location once vehicle is unlocked
        sprite = 225, -- Sprite ID (https://docs.fivem.net/docs/game-references/blips/)
        color = 0, -- Color ID (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
        scale = 0.8, -- Size/scale of blip
        label = 'Drop off' -- Label
    },
    client = {
        sprite = 810,
        color = 7,
        scale = 0.9,
        label = 'Client'
    }
}

-- The following lockpicking difficulties are used when trying
-- To unlock a vehicle. You can assign a vehicles difficulty (easy, medium, etc)
-- To any of these options below, or create your own!
Config.Lockpicking = {
    ['easy'] = {
        difficulty = { 'easy', 'easy', 'easy', 'easy' },
        inputs = { 'E' }
    },
    ['medium'] = {
        difficulty = { 'easy', 'easy', 'easy', 'medium', },
        inputs = { 'E', 'Q' }
    },
    ['hard'] = {
        difficulty = { 'easy', 'easy', 'medium', 'medium', 'medium' },
        inputs = { 'W', 'A', 'S', 'D' }
    },
    -- Add as many options as you wish, following the same format
    -- But ensure each entry has a unique name: ['extreme'], etc
    -- They can then be applied to specific vehicle(s) 'lockpick' option below!
}

-- Manage the skillcheck difficulty per vehicle part here
-- Do not alter order as the numbers represent the vehicles
-- Door or wheel IDs. To learn more about how to customize the
-- Skillcheck system, visit here: https://overextended.dev/ox_lib/Modules/Interface/Client/skillcheck
-- Processing is the duration at which how long it takes to remove
-- The specific part from the vehicle after completing the skillcheck
Config.Chops = {
    wheels = {
        [0] = { -- Front left tire
            difficulty = { 'easy', 'easy', 'easy', 'easy' },
            inputs = { 'E' },
            processing = 10000
        },
        [1] = { -- Front right tire
            difficulty = { 'easy', 'easy', 'easy', 'easy' },
            inputs = { 'E' },
            processing = 10000
        },
        [2] = { -- Rear left tire
            difficulty = { 'easy', 'easy', 'easy', 'easy' },
            inputs = { 'E' },
            processing = 10000
        },
        [3] = { -- Rear right tire
            difficulty = { 'easy', 'easy', 'easy', 'easy' },
            inputs = { 'E' },
            processing = 10000
        }
    },
    doors = {
        [0] = { -- Front driver door
            difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy' },
            inputs = { 'E' },
            processing = 12500
        },
        [1] = { -- Front passenger door
            difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy' },
            inputs = { 'E' },
            processing = 12500
        },
        [2] = { -- Rear driver door
            difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy' },
            inputs = { 'E' },
            processing = 12500
        },
        [3] = { -- Rear passenger door
            difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy' },
            inputs = { 'E' },
            processing = 12500
        },
        [4] = { -- Hood
            difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy' },
            inputs = { 'E' },
            processing = 15000
        },
        [5] = { -- Trunk
            difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy' },
            inputs = { 'E' },
            processing = 15000
        },
    },
    frame = { -- The frame/chassis
        difficulty = { 'easy', 'easy', 'easy', 'easy', 'easy', 'easy' },
        inputs = { 'E' },
        processing = 25000
    }
}

-- Manage all Mastery related settings here
Config.Mastery = {
    [1] = {
        enabled = true, -- You can disable (false) or enable (true) this benefit
        label = 'Faster Dismantling', -- Label in Mastery main menu for this category
        description = 'Increase your vehicle chopping speed', -- Description in Mastery main menu for this category
        icon = 'gauge-high', -- Icon in Mastery main menu for this category
        iconColor = '', -- Optional icon color
        levels = { -- Unlockable levels for this category
            [1] = {
                description = 'Increase your vehicle chopping speed by +5%', -- Description for level 1
                percent = 5, -- Percent increase/improvement in this skill
                repReq = 10000, -- Reputation needed to be able to unlock this level
                points = 1 -- Mastery points spent (removed) to unlock this level
            },
            [2] = {
                description = 'Increase your vehicle chopping speed by +10%',
                percent = 10,
                repReq = 20000,
                points = 1
            },
            [3] = {
                description = 'Increase your vehicle chopping speed by +15%',
                percent = 15,
                repReq = 35000,
                points = 1
            },
            [4] = {
                description = 'Increase your vehicle chopping speed by +20%',
                percent = 20,
                repReq = 55000,
                points = 1
            },
            [5] = {
                description = 'Increase your vehicle chopping speed by +25%',
                percent = 25,
                repReq = 85000,
                points = 1
            },
            -- Add more levels if desired following the same format as above
            -- Ensure to increment the numbers appropriately [5], [6], [7], etc
        }
    },
    [2] = {
        enabled = true,
        label = 'Increased Parts',
        description = 'Earn more parts per vehicle chopped',
        icon = 'screwdriver-wrench',
        iconColor = '',
        levels = {
            [1] = {
                description = 'Increase the numbers of parts you receive by +5%',
                percent = 5,
                repReq = 10000,
                points = 1
            },
            [2] = {
                description = 'Increase the numbers of parts you receive by +10%',
                percent = 10,
                repReq = 20000,
                points = 1
            },
            [3] = {
                description = 'Increase the numbers of parts you receive by +15%',
                percent = 15,
                repReq = 35000,
                points = 1
            },
            [4] = {
                description = 'Increase the numbers of parts you receive by +20%',
                percent = 20,
                repReq = 55000,
                points = 1
            },
            [5] = {
                description = 'Increase the numbers of parts you receive by +25%',
                percent = 25,
                repReq = 85000,
                points = 1
            },
            -- Add more levels if desired following the same format as above
            -- Ensure to increment the numbers appropriately [5], [6], [7], etc
        }
    },
    [3] = {
        enabled = true,
        label = 'Faster Lockpicking',
        description = 'Improve your lockpicking ability',
        icon = 'unlock',
        iconColor = '',
        levels = {
            [1] = {
                description = 'Increase your lockpicking speed by +5%',
                percent = 5,
                repReq = 10000,
                points = 1
            },
            [2] = {
                description = 'Increase your lockpicking speed by +10%',
                percent = 10,
                repReq = 20000,
                points = 1
            },
            [3] = {
                description = 'Increase your lockpicking speed by +15%',
                percent = 15,
                repReq = 35000,
                points = 1
            },
            [4] = {
                description = 'Increase your lockpicking speed by +20%',
                percent = 20,
                repReq = 55000,
                points = 1
            },
            [5] = {
                description = 'Increase your lockpicking speed by +25%',
                percent = 25,
                repReq = 85000,
                points = 1
            },
            -- Add more levels if desired following the same format as above
            -- Ensure to increment the numbers appropriately [5], [6], [7], etc
        }
    },
    [4] = {
        enabled = true,
        label = 'Higher Payouts',
        description = 'Sell vehicles for more money',
        icon = 'sack-dollar',
        iconColor = '',
        levels = {
            [1] = {
                description = 'Sell vehicles for +5% more money',
                percent = 5,
                repReq = 10000,
                points = 1
            },
            [2] = {
                description = 'Sell vehicles for +10% more money',
                percent = 10,
                repReq = 20000,
                points = 1
            },
            [3] = {
                description = 'Sell vehicles for +15% more money',
                percent = 15,
                repReq = 35000,
                points = 1
            },
            [4] = {
                description = 'Sell vehicles for +20% more money',
                percent = 20,
                repReq = 55000,
                points = 1
            },
            [5] = {
                description = 'Sell vehicles for +25% more money',
                percent = 25,
                repReq = 85000,
                points = 1
            },
            -- Add more levels if desired following the same format as above
            -- Ensure to increment the numbers appropriately [5], [6], [7], etc
        }
    }
}

-- Manage all animation settings here
Config.Animations = {
    lockpick = { -- Animation(s) played during vehicle lockpicking
        part1 = { -- Played while player is doing the skillcheck
            dict = 'missheistfbisetup1',
            clip = 'hassle_intro_loop_f'
        },
        part2 = { -- Played after completing the skillcheck
            label = 'Lockpicking..',
            duration = 15000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = { move = true, car = true, combat = true },
            anim = { },
            prop = { }
        }
    },
    chopWheels = { -- Animation(s) played during chopping wheels
        part1 = { -- Played while player is doing the skillcheck
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer'
        },
        part2 = { -- Played after completing the skillcheck
            label = 'Removing part..',
            duration = nil,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = { move = true, car = true, combat = true },
            anim = { },
            prop = { }
        }
    },
    chopDoors = { -- Animation(s) played during chopping doors
        part1 = { -- Played while player is doing the skillcheck
            dict = 'amb@world_human_welding@male@base',
            clip = 'base',
            fx = {
                dict = 'scr_ih_fin',
                name = 'scr_ih_fin_torch_lock_cutting',
                pos = vec3(-0.18, 0.15, 0.0),
                rot = vec3(0.0, 0.0, 0.0),
                scale = 1.0
            },
            prop = {
                model = 'prop_weld_torch',
                pos = vec3(-0.01, 0.03, 0.02),
                rot = vec3(0.0, 0.0, -1.5)
            }
        },
        part2 = { -- Played after completing the skillcheck
            label = 'Removing part..',
            duration = nil,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = { move = true, car = true, combat = true },
            anim = { },
            prop = { }
        }
    },
    chopFrame = { -- Animation(s) played during chopping frame
        part1 = { -- Played while player is doing the skillcheck
            dict = 'amb@world_human_welding@male@base',
            clip = 'base',
            fx = {
                dict = 'scr_ih_fin',
                name = 'scr_ih_fin_torch_lock_cutting',
                pos = vec3(-0.18, 0.15, 0.0),
                rot = vec3(0.0, 0.0, 0.0),
                scale = 1.0
            },
            prop = {
                model = 'prop_weld_torch',
                pos = vec3(-0.01, 0.03, 0.02),
                rot = vec3(0.0, 0.0, -1.5)
            }
        },
        part2 = { -- Played after completing the skillcheck
            label = 'Scrapping frame..',
            duration = nil,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = { move = true, car = true, combat = true },
            anim = { },
            prop = { }
        }
    },
    selling = { -- Animation(s) played during selling a vehicle
        dict = 'mp_common',
        clip = 'givetake1_a',
        cash = {
            model = 'w_am_case',
            bone = 57005,
            pos = vec3(0.02292, 0.0, 0.02109),
            rot = vec3(90.6801, 14.3385, -96.1508)
        },
        keys = {
            model = 'lr_prop_carkey_fob',
            bone = 57005,
            pos = vec3(0.1559368, 0.0469596, -0.0087782),
            rot = vec3(0, 0, 0)
        }
    }
}

-- Manage all possible vehicle spawns & their settings here
Config.Vehicles = {
    ['panto'] = { -- Vehicle spawn name
        label = 'Panto', -- Vehicle label for menu's, etc
        repRequired = 0, -- Reputation required to get this vehicle as an option
        spawnChance = 60, -- Chance percentage to get this vehicle if eligible
        callChance = 50, -- Percentage chance police get called when lockpicking
        lockpick = 'easy', -- The lockpicking skillcheck difficulty
        clientRequest = false, -- Is this vehicle a Client Request vehicle or no?
        canSell = false, -- If this is a Client Request vehicle, can the player sell it?
        sellPrice = { min = 1000, max = 5000 }, -- If the player can sell this vehicle, how much?
        addRep = { min = 5, max = 10 }, -- When this vehicle is chopped or sold, how much reputation to add?
        parts = { -- How many auto parts are received for each chopping action
            wheels = { min = 1, max = 3 }, -- Min/max auto parts received when chopping wheels
            doors = { min = 2, max = 4 }, -- Min/max auto parts received when chopping doors
            frame = { min = 5, max = 10 } -- Min/max auto parts received when chopping frame
        },
    },
    ['prairie'] = {
        label = 'Prairie',
        repRequired = 0,
        spawnChance = 60,
        callChance = 50,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 5, max = 10 },
        parts = {
            wheels = { min = 1, max = 3 },
            doors = { min = 2, max = 4 },
            frame = { min = 5, max = 10 }
        },
    },
    ['asbo'] = {
        label = 'Asbo',
        repRequired = 0,
        spawnChance = 60,
        callChance = 50,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 5, max = 10 },
        parts = {
            wheels = { min = 1, max = 3 },
            doors = { min = 2, max = 4 },
            frame = { min = 5, max = 10 }
        },
    },
    ['blista'] = {
        label = 'Blista',
        repRequired = 0,
        spawnChance = 60,
        callChance = 50,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 5, max = 10 },
        parts = {
            wheels = { min = 1, max = 3 },
            doors = { min = 2, max = 4 },
            frame = { min = 5, max = 10 }
        },
    },
    ['dilettante'] = {
        label = 'Dilettante',
        repRequired = 0,
        spawnChance = 60,
        callChance = 50,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 5, max = 10 },
        parts = {
            wheels = { min = 1, max = 3 },
            doors = { min = 2, max = 4 },
            frame = { min = 5, max = 10 }
        },
    },
    ['rhapsody'] = {
        label = 'Rhapsody',
        repRequired = 0,
        spawnChance = 60,
        callChance = 50,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 5, max = 10 },
        parts = {
            wheels = { min = 1, max = 3 },
            doors = { min = 2, max = 4 },
            frame = { min = 5, max = 10 }
        },
    },
    ['asea'] = {
        label = 'Asea',
        repRequired = 0,
        spawnChance = 55,
        callChance = 55,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 6, max = 12 },
        parts = {
            wheels = { min = 2, max = 4 },
            doors = { min = 3, max = 5 },
            frame = { min = 6, max = 12 }
        },
    },
    ['primo'] = {
        label = 'Primo',
        repRequired = 0,
        spawnChance = 55,
        callChance = 55,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 6, max = 12 },
        parts = {
            wheels = { min = 2, max = 4 },
            doors = { min = 3, max = 5 },
            frame = { min = 6, max = 12 }
        },
    },
    ['regina'] = {
        label = 'Regina',
        repRequired = 0,
        spawnChance = 55,
        callChance = 55,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 6, max = 12 },
        parts = {
            wheels = { min = 2, max = 4 },
            doors = { min = 3, max = 5 },
            frame = { min = 6, max = 12 }
        },
    },
    ['stratum'] = {
        label = 'Stratum',
        repRequired = 0,
        spawnChance = 55,
        callChance = 55,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 6, max = 12 },
        parts = {
            wheels = { min = 2, max = 4 },
            doors = { min = 3, max = 5 },
            frame = { min = 6, max = 12 }
        },
    },
    ['stanier'] = {
        label = 'Stanier',
        repRequired = 0,
        spawnChance = 55,
        callChance = 55,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 6, max = 12 },
        parts = {
            wheels = { min = 2, max = 4 },
            doors = { min = 3, max = 5 },
            frame = { min = 6, max = 12 }
        },
    },
    ['ingot'] = {
        label = 'Ingot',
        repRequired = 0,
        spawnChance = 55,
        callChance = 55,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 6, max = 12 },
        parts = {
            wheels = { min = 2, max = 4 },
            doors = { min = 3, max = 5 },
            frame = { min = 6, max = 12 }
        },
    },
    ['premier'] = {
        label = 'Premier',
        repRequired = 0,
        spawnChance = 55,
        callChance = 55,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 6, max = 12 },
        parts = {
            wheels = { min = 2, max = 4 },
            doors = { min = 3, max = 5 },
            frame = { min = 6, max = 12 }
        },
    },
    ['intruder'] = {
        label = 'Intruder',
        repRequired = 0,
        spawnChance = 55,
        callChance = 55,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 6, max = 12 },
        parts = {
            wheels = { min = 2, max = 4 },
            doors = { min = 3, max = 5 },
            frame = { min = 6, max = 12 }
        },
    },
    ['asterope'] = {
        label = 'Asterope',
        repRequired = 1500,
        spawnChance = 50,
        callChance = 60,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 7, max = 14 },
        parts = {
            wheels = { min = 3, max = 5 },
            doors = { min = 4, max = 6 },
            frame = { min = 7, max = 14 }
        },
    },
    ['blade'] = {
        label = 'Blade',
        repRequired = 1500,
        spawnChance = 50,
        callChance = 60,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 7, max = 14 },
        parts = {
            wheels = { min = 3, max = 5 },
            doors = { min = 4, max = 6 },
            frame = { min = 7, max = 14 }
        },
    },
    ['buccaneer'] = {
        label = 'Buccaneer',
        repRequired = 1500,
        spawnChance = 50,
        callChance = 60,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 7, max = 14 },
        parts = {
            wheels = { min = 3, max = 5 },
            doors = { min = 4, max = 6 },
            frame = { min = 7, max = 14 }
        },
    },
    ['chino'] = {
        label = 'Chino',
        repRequired = 1500,
        spawnChance = 50,
        callChance = 60,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 7, max = 14 },
        parts = {
            wheels = { min = 3, max = 5 },
            doors = { min = 4, max = 6 },
            frame = { min = 7, max = 14 }
        },
    },
    ['coquette3'] = {
        label = 'Coquette BlackFin',
        repRequired = 1500,
        spawnChance = 50,
        callChance = 60,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 7, max = 14 },
        parts = {
            wheels = { min = 3, max = 5 },
            doors = { min = 4, max = 6 },
            frame = { min = 7, max = 14 }
        },
    },
    ['deviant'] = {
        label = 'Deviant',
        repRequired = 1500,
        spawnChance = 50,
        callChance = 60,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 7, max = 14 },
        parts = {
            wheels = { min = 3, max = 5 },
            doors = { min = 4, max = 6 },
            frame = { min = 7, max = 14 }
        },
    },
    ['dukes'] = {
        label = 'Dukes',
        repRequired = 1500,
        spawnChance = 50,
        callChance = 60,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 7, max = 14 },
        parts = {
            wheels = { min = 3, max = 5 },
            doors = { min = 4, max = 6 },
            frame = { min = 7, max = 14 }
        },
    },
    ['impaler'] = {
        label = 'Impaler',
        repRequired = 1500,
        spawnChance = 50,
        callChance = 60,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 7, max = 14 },
        parts = {
            wheels = { min = 3, max = 5 },
            doors = { min = 4, max = 6 },
            frame = { min = 7, max = 14 }
        },
    },
    ['fugitive'] = {
        label = 'Fugitive',
        repRequired = 3000,
        spawnChance = 45,
        callChance = 65,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 8, max = 16 },
        parts = {
            wheels = { min = 4, max = 6 },
            doors = { min = 5, max = 7 },
            frame = { min = 8, max = 16 }
        },
    },
    ['dominator'] = {
        label = 'Dominator',
        repRequired = 3000,
        spawnChance = 45,
        callChance = 65,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 8, max = 16 },
        parts = {
            wheels = { min = 4, max = 6 },
            doors = { min = 5, max = 7 },
            frame = { min = 8, max = 16 }
        },
    },
    ['ellie'] = {
        label = 'Ellie',
        repRequired = 3000,
        spawnChance = 45,
        callChance = 65,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 8, max = 16 },
        parts = {
            wheels = { min = 4, max = 6 },
            doors = { min = 5, max = 7 },
            frame = { min = 8, max = 16 }
        },
    },
    ['gauntlet'] = {
        label = 'Gauntlet',
        repRequired = 3000,
        spawnChance = 45,
        callChance = 65,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 8, max = 16 },
        parts = {
            wheels = { min = 4, max = 6 },
            doors = { min = 5, max = 7 },
            frame = { min = 8, max = 16 }
        },
    },
    ['felon'] = {
        label = 'Felon',
        repRequired = 3000,
        spawnChance = 45,
        callChance = 65,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 8, max = 16 },
        parts = {
            wheels = { min = 4, max = 6 },
            doors = { min = 5, max = 7 },
            frame = { min = 8, max = 16 }
        },
    },
    ['jackal'] = {
        label = 'Jackal',
        repRequired = 3000,
        spawnChance = 45,
        callChance = 65,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 8, max = 16 },
        parts = {
            wheels = { min = 4, max = 6 },
            doors = { min = 5, max = 7 },
            frame = { min = 8, max = 16 }
        },
    },
    ['oracle2'] = {
        label = 'Oracle',
        repRequired = 3000,
        spawnChance = 45,
        callChance = 65,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 8, max = 16 },
        parts = {
            wheels = { min = 4, max = 6 },
            doors = { min = 5, max = 7 },
            frame = { min = 8, max = 16 }
        },
    },
    ['sentinel2'] = {
        label = 'Sentinel',
        repRequired = 3000,
        spawnChance = 45,
        callChance = 65,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 8, max = 16 },
        parts = {
            wheels = { min = 4, max = 6 },
            doors = { min = 5, max = 7 },
            frame = { min = 8, max = 16 }
        },
    },
    ['baller'] = {
        label = 'Baller',
        repRequired = 7500,
        spawnChance = 40,
        callChance = 70,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 9, max = 18 },
        parts = {
            wheels = { min = 5, max = 7 },
            doors = { min = 6, max = 8 },
            frame = { min = 9, max = 18 }
        },
    },
    ['bjxl'] = {
        label = 'BeeJay XL',
        repRequired = 7500,
        spawnChance = 40,
        callChance = 70,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 9, max = 18 },
        parts = {
            wheels = { min = 5, max = 7 },
            doors = { min = 6, max = 8 },
            frame = { min = 9, max = 18 }
        },
    },
    ['cavalcade'] = {
        label = 'Cavalcade',
        repRequired = 7500,
        spawnChance = 40,
        callChance = 70,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 9, max = 18 },
        parts = {
            wheels = { min = 5, max = 7 },
            doors = { min = 6, max = 8 },
            frame = { min = 9, max = 18 }
        },
    },
    ['dubsta'] = {
        label = 'Dubsta',
        repRequired = 7500,
        spawnChance = 40,
        callChance = 70,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 9, max = 18 },
        parts = {
            wheels = { min = 5, max = 7 },
            doors = { min = 6, max = 8 },
            frame = { min = 9, max = 18 }
        },
    },
    ['fq2'] = {
        label = 'FQ 2',
        repRequired = 7500,
        spawnChance = 40,
        callChance = 70,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 9, max = 18 },
        parts = {
            wheels = { min = 5, max = 7 },
            doors = { min = 6, max = 8 },
            frame = { min = 9, max = 18 }
        },
    },
    ['granger'] = {
        label = 'Granger',
        repRequired = 7500,
        spawnChance = 40,
        callChance = 70,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 9, max = 18 },
        parts = {
            wheels = { min = 5, max = 7 },
            doors = { min = 6, max = 8 },
            frame = { min = 9, max = 18 }
        },
    },
    ['gresley'] = {
        label = 'Gresley',
        repRequired = 7500,
        spawnChance = 40,
        callChance = 70,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 9, max = 18 },
        parts = {
            wheels = { min = 5, max = 7 },
            doors = { min = 6, max = 8 },
            frame = { min = 9, max = 18 }
        },
    },
    ['habanero'] = {
        label = 'Habanero',
        repRequired = 7500,
        spawnChance = 40,
        callChance = 70,
        lockpick = 'easy',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 9, max = 18 },
        parts = {
            wheels = { min = 5, max = 7 },
            doors = { min = 6, max = 8 },
            frame = { min = 9, max = 18 }
        },
    },
    ['huntley'] = {
        label = 'Huntley S',
        repRequired = 12000,
        spawnChance = 35,
        callChance = 75,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 10, max = 20 },
        parts = {
            wheels = { min = 6, max = 8 },
            doors = { min = 7, max = 9 },
            frame = { min = 10, max = 20 }
        },
    },
    ['patriot'] = {
        label = 'Patriot',
        repRequired = 12000,
        spawnChance = 35,
        callChance = 75,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 10, max = 20 },
        parts = {
            wheels = { min = 6, max = 8 },
            doors = { min = 7, max = 9 },
            frame = { min = 10, max = 20 }
        },
    },
    ['exemplar'] = {
        label = 'Exemplar',
        repRequired = 12000,
        spawnChance = 35,
        callChance = 75,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 10, max = 20 },
        parts = {
            wheels = { min = 6, max = 8 },
            doors = { min = 7, max = 9 },
            frame = { min = 10, max = 20 }
        },
    },
    ['cogcabrio'] = {
        label = 'Cognoscenti Cabrio',
        repRequired = 12000,
        spawnChance = 35,
        callChance = 75,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 10, max = 20 },
        parts = {
            wheels = { min = 6, max = 8 },
            doors = { min = 7, max = 9 },
            frame = { min = 10, max = 20 }
        },
    },
    ['f620'] = {
        label = 'F620',
        repRequired = 12000,
        spawnChance = 35,
        callChance = 75,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 10, max = 20 },
        parts = {
            wheels = { min = 6, max = 8 },
            doors = { min = 7, max = 9 },
            frame = { min = 10, max = 20 }
        },
    },
    ['cog55'] = {
        label = 'Cognoscenti 55',
        repRequired = 12000,
        spawnChance = 35,
        callChance = 75,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 10, max = 20 },
        parts = {
            wheels = { min = 6, max = 8 },
            doors = { min = 7, max = 9 },
            frame = { min = 10, max = 20 }
        },
    },
    ['baller2'] = {
        label = 'Baller',
        repRequired = 12000,
        spawnChance = 35,
        callChance = 75,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 10, max = 20 },
        parts = {
            wheels = { min = 6, max = 8 },
            doors = { min = 7, max = 9 },
            frame = { min = 10, max = 20 }
        },
    },
    ['dubsta2'] = {
        label = 'Dubsta',
        repRequired = 12000,
        spawnChance = 35,
        callChance = 75,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 10, max = 20 },
        parts = {
            wheels = { min = 6, max = 8 },
            doors = { min = 7, max = 9 },
            frame = { min = 10, max = 20 }
        },
    },
    ['alpha'] = {
        label = 'Alpha',
        repRequired = 20000,
        spawnChance = 25,
        callChance = 80,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 12, max = 24 },
        parts = {
            wheels = { min = 7, max = 9 },
            doors = { min = 8, max = 10 },
            frame = { min = 12, max = 24 }
        },
    },
    ['banshee'] = {
        label = 'Banshee',
        repRequired = 20000,
        spawnChance = 25,
        callChance = 80,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 12, max = 24 },
        parts = {
            wheels = { min = 7, max = 9 },
            doors = { min = 8, max = 10 },
            frame = { min = 12, max = 24 }
        },
    },
    ['fusilade'] = {
        label = 'Fusilade',
        repRequired = 20000,
        spawnChance = 25,
        callChance = 80,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 12, max = 24 },
        parts = {
            wheels = { min = 7, max = 9 },
            doors = { min = 8, max = 10 },
            frame = { min = 12, max = 24 }
        },
    },
    ['khamelion'] = {
        label = 'Khamelion',
        repRequired = 20000,
        spawnChance = 25,
        callChance = 80,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 12, max = 24 },
        parts = {
            wheels = { min = 7, max = 9 },
            doors = { min = 8, max = 10 },
            frame = { min = 12, max = 24 }
        },
    },
    ['schwarzer'] = {
        label = 'Schwartzer',
        repRequired = 20000,
        spawnChance = 25,
        callChance = 80,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 12, max = 24 },
        parts = {
            wheels = { min = 7, max = 9 },
            doors = { min = 8, max = 10 },
            frame = { min = 12, max = 24 }
        },
    },
    ['surano'] = {
        label = 'Surano',
        repRequired = 20000,
        spawnChance = 25,
        callChance = 80,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 12, max = 24 },
        parts = {
            wheels = { min = 7, max = 9 },
            doors = { min = 8, max = 10 },
            frame = { min = 12, max = 24 }
        },
    },
    ['verlierer2'] = {
        label = 'Verlierer',
        repRequired = 20000,
        spawnChance = 25,
        callChance = 80,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 12, max = 24 },
        parts = {
            wheels = { min = 7, max = 9 },
            doors = { min = 8, max = 10 },
            frame = { min = 12, max = 24 }
        },
    },
    ['ninef'] = {
        label = '9F',
        repRequired = 35000,
        spawnChance = 15,
        callChance = 90,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 14, max = 28 },
        parts = {
            wheels = { min = 8, max = 10 },
            doors = { min = 9, max = 12 },
            frame = { min = 14, max = 28 }
        },
    },
    ['drafter'] = {
        label = '8F Drafter',
        repRequired = 35000,
        spawnChance = 15,
        callChance = 90,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 14, max = 28 },
        parts = {
            wheels = { min = 8, max = 10 },
            doors = { min = 9, max = 12 },
            frame = { min = 14, max = 28 }
        },
    },
    ['carbonizzare'] = {
        label = 'Carbonizzare',
        repRequired = 35000,
        spawnChance = 15,
        callChance = 90,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 14, max = 28 },
        parts = {
            wheels = { min = 8, max = 10 },
            doors = { min = 9, max = 12 },
            frame = { min = 14, max = 28 }
        },
    },
    ['comet2'] = {
        label = 'Comet',
        repRequired = 35000,
        spawnChance = 15,
        callChance = 90,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 14, max = 28 },
        parts = {
            wheels = { min = 8, max = 10 },
            doors = { min = 9, max = 12 },
            frame = { min = 14, max = 28 }
        },
    },
    ['comet5'] = {
        label = 'Comet SR',
        repRequired = 35000,
        spawnChance = 15,
        callChance = 90,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 14, max = 28 },
        parts = {
            wheels = { min = 8, max = 10 },
            doors = { min = 9, max = 12 },
            frame = { min = 14, max = 28 }
        },
    },
    ['coquette'] = {
        label = 'Coquette',
        repRequired = 35000,
        spawnChance = 15,
        callChance = 90,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 14, max = 28 },
        parts = {
            wheels = { min = 8, max = 10 },
            doors = { min = 9, max = 12 },
            frame = { min = 14, max = 28 }
        },
    },
    ['feltzer2'] = {
        label = 'Feltzer',
        repRequired = 35000,
        spawnChance = 15,
        callChance = 90,
        lockpick = 'medium',
        clientRequest = false,
        canSell = false,
        sellPrice = { min = 1000, max = 5000 },
        addRep = { min = 14, max = 28 },
        parts = {
            wheels = { min = 8, max = 10 },
            doors = { min = 9, max = 12 },
            frame = { min = 14, max = 28 }
        },
    },

    ---------- Start of Client Request vehicles ----------

    -- These vehicles are not available in "Request a Job" missions
    -- Any vehicle with clientRequest = true is only for client requests
    -- And will not be available for the average "Request a Job" missions

    -- NOTE: there is an addition of a new variable here: signalDuration
    -- This is how long in minutes the player has to succesfully obtain
    -- The vehicle.

    -- If the players fails to succesfully obtain the vehicle within
    -- that time frame, the contract is lost and cannot be repeated.
    -- However, if desired you can set "retry" to true in Config.ClientRequests
    -- To allow players to get multiple chances on a failed contract.

    -- There is also no lockpicking at this point as police will be notified
    -- Via your dispatching system likely for gun shots or car jacking
    -- If not, you can manually configure an additional dispatch in
    -- client/functions.lua at the VehicleHijacked() function

    ['landstalker2'] = {
        label = 'Landstalker XL',
        repRequired = 50000,
        spawnChance = 60,
        callChance = 100,
        clientRequest = true,
        signalDuration = 20 * Minutes,
        canSell = false,
        sellPrice = { min = 0, max = 0 },
        addRep = { min = 15, max = 30 },
        parts = {
            wheels = { min = 10, max = 15 },
            doors = { min = 12, max = 17 },
            frame = { min = 20, max = 40 }
        },
    },
    ['flashgt'] = {
        label = 'Flash GT',
        repRequired = 50000,
        spawnChance = 55,
        callChance = 100,
        clientRequest = true,
        signalDuration = 20 * Minutes,
        canSell = true,
        sellPrice = { min = 5000, max = 10000 },
        addRep = { min = 15, max = 30 },
        parts = {
            wheels = { min = 10, max = 15 },
            doors = { min = 12, max = 17 },
            frame = { min = 20, max = 40 }
        },
    },
    ['toros'] = {
        label = 'Toros',
        repRequired = 50000,
        spawnChance = 50,
        callChance = 100,
        clientRequest = true,
        signalDuration = 20 * Minutes,
        canSell = false,
        sellPrice = { min = 0, max = 0 },
        addRep = { min = 15, max = 30 },
        parts = {
            wheels = { min = 10, max = 15 },
            doors = { min = 12, max = 17 },
            frame = { min = 20, max = 40 }
        },
    },
    ['cypher'] = {
        label = 'Cypher',
        repRequired = 50000,
        spawnChance = 45,
        callChance = 100,
        clientRequest = true,
        signalDuration = 20 * Minutes,
        canSell = true,
        sellPrice = { min = 6000, max = 12000 },
        addRep = { min = 15, max = 30 },
        parts = {
            wheels = { min = 10, max = 15 },
            doors = { min = 12, max = 17 },
            frame = { min = 20, max = 40 }
        },
    },
    ['sugoi'] = {
        label = 'Sugoi',
        repRequired = 50000,
        spawnChance = 40,
        callChance = 100,
        clientRequest = true,
        signalDuration = 20 * Minutes,
        canSell = false,
        sellPrice = { min = 0, max = 0 },
        addRep = { min = 15, max = 30 },
        parts = {
            wheels = { min = 10, max = 15 },
            doors = { min = 12, max = 17 },
            frame = { min = 20, max = 40 }
        },
    },
    ['vstr'] = {
        label = 'V-STR',
        repRequired = 50000,
        spawnChance = 35,
        callChance = 100,
        clientRequest = true,
        signalDuration = 20 * Minutes,
        canSell = true,
        sellPrice = { min = 7000, max = 14000 },
        addRep = { min = 15, max = 30 },
        parts = {
            wheels = { min = 10, max = 15 },
            doors = { min = 12, max = 17 },
            frame = { min = 20, max = 40 }
        },
    },
    ['specter'] = {
        label = 'Specter',
        repRequired = 50000,
        spawnChance = 35,
        callChance = 100,
        clientRequest = true,
        signalDuration = 20 * Minutes,
        canSell = false,
        sellPrice = { min = 0, max = 0 },
        addRep = { min = 15, max = 30 },
        parts = {
            wheels = { min = 10, max = 15 },
            doors = { min = 12, max = 17 },
            frame = { min = 20, max = 40 }
        },
    },
    ['coquette4'] = {
        label = 'Coquette D10',
        repRequired = 50000,
        spawnChance = 30,
        callChance = 100,
        clientRequest = true,
        signalDuration = 15 * Minutes,
        canSell = false,
        sellPrice = { min = 0, max = 0 },
        addRep = { min = 18, max = 36 },
        parts = {
            wheels = { min = 12, max = 17 },
            doors = { min = 14, max = 19 },
            frame = { min = 23, max = 46 }
        },
    },
    ['seven70'] = {
        label = 'Seven-70',
        repRequired = 50000,
        spawnChance = 30,
        callChance = 100,
        clientRequest = true,
        signalDuration = 15 * Minutes,
        canSell = true,
        sellPrice = { min = 7500, max = 15000 },
        addRep = { min = 18, max = 36 },
        parts = {
            wheels = { min = 12, max = 17 },
            doors = { min = 14, max = 19 },
            frame = { min = 23, max = 46 }
        },
    },
    ['windsor'] = {
        label = 'Windsor',
        repRequired = 51000,
        spawnChance = 25,
        callChance = 100,
        clientRequest = true,
        signalDuration = 15 * Minutes,
        canSell = true,
        sellPrice = { min = 8000, max = 16000 },
        addRep = { min = 18, max = 36 },
        parts = {
            wheels = { min = 12, max = 17 },
            doors = { min = 14, max = 19 },
            frame = { min = 23, max = 46 }
        },
    },
    ['cheetah2'] = {
        label = 'Cheetah Classic',
        repRequired = 51000,
        spawnChance = 25,
        callChance = 100,
        clientRequest = true,
        signalDuration = 15 * Minutes,
        canSell = false,
        sellPrice = { min = 0, max = 0 },
        addRep = { min = 18, max = 36 },
        parts = {
            wheels = { min = 12, max = 17 },
            doors = { min = 14, max = 19 },
            frame = { min = 23, max = 46 }
        },
    },
    ['bestiagts'] = {
        label = 'Bestia GTS',
        repRequired = 52000,
        spawnChance = 20,
        callChance = 100,
        clientRequest = true,
        signalDuration = 15 * Minutes,
        canSell = false,
        sellPrice = { min = 0, max = 0 },
        addRep = { min = 18, max = 36 },
        parts = {
            wheels = { min = 12, max = 17 },
            doors = { min = 14, max = 19 },
            frame = { min = 23, max = 46 }
        },
    },
    ['infernus2'] = {
        label = 'Infernus Classic',
        repRequired = 52000,
        spawnChance = 20,
        callChance = 100,
        clientRequest = true,
        signalDuration = 15 * Minutes,
        canSell = true,
        sellPrice = { min = 8500, max = 17000 },
        addRep = { min = 18, max = 36 },
        parts = {
            wheels = { min = 12, max = 17 },
            doors = { min = 14, max = 19 },
            frame = { min = 23, max = 46 }
        },
    },
    ['neon'] = {
        label = 'Neon',
        repRequired = 53000,
        spawnChance = 15,
        callChance = 100,
        clientRequest = true,
        signalDuration = 15 * Minutes,
        canSell = true,
        sellPrice = { min = 9000, max = 18000 },
        addRep = { min = 18, max = 36 },
        parts = {
            wheels = { min = 12, max = 17 },
            doors = { min = 14, max = 19 },
            frame = { min = 23, max = 46 }
        },
    },
    ['t20'] = {
        label = 'T20',
        repRequired = 53000,
        spawnChance = 15,
        callChance = 100,
        clientRequest = true,
        signalDuration = 15 * Minutes,
        canSell = false,
        sellPrice = { min = 0, max = 0 },
        addRep = { min = 18, max = 36 },
        parts = {
            wheels = { min = 12, max = 17 },
            doors = { min = 14, max = 19 },
            frame = { min = 23, max = 46 }
        },
    },
    ['turismo2'] = {
        label = 'Turismo Classic',
        repRequired = 53000,
        spawnChance = 15,
        callChance = 100,
        clientRequest = true,
        signalDuration = 15 * Minutes,
        canSell = true,
        sellPrice = { min = 9500, max = 19000 },
        addRep = { min = 18, max = 36 },
        parts = {
            wheels = { min = 12, max = 17 },
            doors = { min = 14, max = 19 },
            frame = { min = 23, max = 46 }
        },
    },
    ['pariah'] = {
        label = 'Pariah',
        repRequired = 54000,
        spawnChance = 10,
        callChance = 100,
        clientRequest = true,
        signalDuration = 15 * Minutes,
        canSell = true,
        sellPrice = { min = 10000, max = 20000 },
        addRep = { min = 18, max = 36 },
        parts = {
            wheels = { min = 12, max = 17 },
            doors = { min = 14, max = 19 },
            frame = { min = 23, max = 46 }
        },
    },
    ['italigto'] = {
        label = 'Itali GTO',
        repRequired = 54000,
        spawnChance = 10,
        callChance = 100,
        clientRequest = true,
        signalDuration = 15 * Minutes,
        canSell = false,
        sellPrice = { min = 0, max = 0 },
        addRep = { min = 18, max = 36 },
        parts = {
            wheels = { min = 12, max = 17 },
            doors = { min = 14, max = 19 },
            frame = { min = 23, max = 46 }
        },
    },
    ['reaper'] = {
        label = 'Reaper',
        repRequired = 55000,
        spawnChance = 5,
        callChance = 100,
        clientRequest = true,
        signalDuration = 10 * Minutes,
        canSell = true,
        sellPrice = { min = 10500, max = 21000 },
        addRep = { min = 20, max = 40 },
        parts = {
            wheels = { min = 14, max = 19 },
            doors = { min = 16, max = 21 },
            frame = { min = 25, max = 50 }
        },
    },
    ['italigtb'] = {
        label = 'Reaper',
        repRequired = 56000,
        spawnChance = 5,
        callChance = 100,
        clientRequest = true,
        signalDuration = 10 * Minutes,
        canSell = false,
        sellPrice = { min = 0, max = 0 },
        addRep = { min = 20, max = 40 },
        parts = {
            wheels = { min = 14, max = 19 },
            doors = { min = 16, max = 21 },
            frame = { min = 25, max = 50 }
        },
    },
    ['tempesta'] = {
        label = 'Tempesta',
        repRequired = 57000,
        spawnChance = 5,
        callChance = 100,
        clientRequest = true,
        signalDuration = 10 * Minutes,
        canSell = true,
        sellPrice = { min = 11000, max = 22000 },
        addRep = { min = 20, max = 40 },
        parts = {
            wheels = { min = 14, max = 19 },
            doors = { min = 16, max = 21 },
            frame = { min = 25, max = 50 }
        },
    },
}

-- Various locations that are chosen at random
-- To spawn the assigned vehicle at (not client requests)
Config.Locations = {
    vec4(121.0055, -131.9715, 54.7626, 68.0149),
    vec4(294.2778, 73.9549, 99.8127, 160.1953),
    vec4(114.8204, 100.2908, 80.8043, 251.1810),
    vec4(62.3006, 150.7281, 104.5387, 340.6199),
    vec4(181.0110, 392.9565, 108.7011, 173.7102),
    vec4(-212.8631, 314.8044, 96.8715, 180.4437),
    vec4(-443.7731, 301.2591, 83.1613, 175.4075),
    vec4(-495.6465, 54.0917, 52.5056, 84.2725),
    vec4(-471.4145, -56.9746, 44.4404, 267.3782),
    vec4(-726.3648, -404.9857, 34.9452, 86.0966),
    vec4(-810.9850, -574.2256, 30.0527, 300.5989),
    vec4(-703.2698, -1109.3358, 14.4514, 212.8098),
    vec4(-817.4587, -1201.6503, 6.8608, 140.3604),
    vec4(-820.2675, -1274.2000, 4.9257, 169.9126),
    vec4(-641.2374, -1220.5305, 11.3998, 303.4112),
    vec4(-642.8250, -1167.9261, 9.5434, 35.3164),
    vec4(-720.9465, -732.8727, 35.7022, 180.0196),
    vec4(-829.6481, -760.5531, 21.9703, 89.2101),
    vec4(-673.5502, -620.6348, 25.2329, 268.9625),
    vec4(-486.4743, -2182.5537, 8.6913, 46.8636),
    vec4(-310.7322, -2219.9202, 8.4093, 325.4993),
    vec4(-122.7546, -2130.2681, 16.6307, 199.5983),
    vec4(-59.9464, -1991.4426, 17.9434, 160.1056),
    vec4(329.5643, -2042.2260, 20.7365, 322.3551),
    vec4(366.8192, -1976.9310, 24.1268, 342.0582),
    vec4(453.8660, -1966.3721, 22.8918, 179.5917),
    vec4(571.0711, -1922.5863, 24.6447, 122.0021),
    vec4(544.4983, -1782.4716, 29.0247, 154.5768),
    vec4(116.6260, -1213.1117, 29.2210, 94.5704),
    vec4(138.8711, -1069.8245, 29.1185, 0.1335),
    vec4(-1455.1437, -369.1428, 43.3894, 4.4084),
    vec4(-1509.9993, -431.6277, 35.3692, 85.0948),
    vec4(-1566.2281, -252.7292, 48.1978, 233.7664),
    vec4(-1493.3301, -206.0446, 50.4512, 38.8922),
    vec4(-1331.2999, -226.1853, 42.8977, 305.6592),
    vec4(-1299.1564, -189.8687, 46.9711, 215.8107),
    vec4(-1311.9814, -198.3246, 60.5799, 215.4586),
    vec4(-973.6294, -182.8694, 37.7269, 207.9127),
    vec4(-902.1754, -159.5544, 41.8065, 27.0876),
    vec4(-754.7176, -93.5658, 37.3836, 241.6278),
    vec4(-694.8244, -149.8790, 37.6020, 299.9706),
    vec4(-773.7374, 373.2846, 87.8018, 179.6356),
    vec4(-947.1989, 308.1951, 71.0853, 179.9822),
    vec4(-1358.4945, -19.9810, 53.2720, 54.5537),
    vec4(-1677.4188, 41.5794, 63.3887, 161.5854),
    vec4(-1285.1692, 252.0674, 63.1808, 358.8617),
    vec4(850.0930, -2180.5352, 30.2583, 180.4208),
    vec4(1004.1105, -1955.5149, 30.8893, 177.8150),
    vec4(1025.9476, -1865.0956, 30.8164, 85.6842),
    vec4(969.3527, -1823.1350, 31.0256, 354.1493),
    vec4(907.2542, -1732.3190, 30.5082, 172.3155),
    vec4(725.3997, -2031.9608, 29.2110, 354.8260),
    vec4(967.0807, -1873.6721, 31.0639, 220.8344),
    vec4(-325.3332, -1009.0129, 30.3114, 249.0183),
    vec4(-327.6315, -924.4581, 31.0066, 69.8743),
    vec4(-323.0623, -751.4844, 33.8944, 339.8417),
    vec4(-321.9873, -752.5498, 53.1731, 158.8262),
    vec4(-314.4682, -694.1981, 32.6854, 89.9905),
    vec4(-1420.8829, -961.2053, 6.8836, 59.9635),
    vec4(-1619.3702, -854.0281, 9.6618, 139.8009),
    vec4(-1696.1467, -884.3199, 7.9707, 319.8009),
    vec4(-1585.2772, -1031.1715, 12.6446, 23.8280),
    vec4(-1553.7355, -974.4046, 12.6429, 255.4870),
    vec4(-1519.7397, -707.4255, 27.4922, 2.3083),
    vec4(-1447.9017, -675.6489, 26.0925, 213.2588),
    vec4(-1396.1052, -654.0490, 28.2989, 36.3722),
    vec4(-1353.9103, -890.5259, 13.4822, 37.6470),
    vec4(-1319.2081, -1148.3262, 4.1251, 91.1792),
    vec4(-1273.4314, -1158.6523, 5.7664, 115.7493),
    vec4(171.4287, -1518.3112, 28.7670, 135.8890),
    vec4(256.0810, -1519.6664, 28.7678, 31.1821),
    vec4(34.0573, -1704.9487, 28.9231, 202.5280),
    vec4(8.8643, -1758.5660, 28.9269, 50.2356),
    vec4(179.0361, -1816.3035, 28.4371, 50.6750),
    vec4(208.7032, -1859.9275, 26.7620, 139.9131),
    vec4(194.6370, -2026.1433, 17.9000, 166.9838),
    vec4(281.1707, -2081.2441, 16.4430, 111.0523),
    vec4(248.7658, -743.8975, 30.4465, 161.4855),
    vec4(263.9244, -759.0359, 34.2677, 70.7621),
    vec4(306.9643, -1094.1843, 28.9783, 121.0578),
    vec4(359.0821, -1162.9084, 28.9177, 88.9305),
    vec4(431.0551, -1164.0171, 28.9175, 269.5249),
    vec4(361.2653, -951.0291, 29.0234, 131.6813),
    vec4(27.9696, -1031.8810, 29.0225, 250.2451),
    vec4(12.8320, -1108.4305, 37.7775, 70.1921),
    vec4(-4.3257, -1043.4818, 37.7773, 250.1253),
    vec4(-239.9015, -1475.2179, 31.0779, 319.1745),
    vec4(-333.7069, -1529.9653, 27.1768, 359.9020),
    vec4(-228.3602, -1692.2864, 33.4213, 181.1845),
    vec4(-204.3261, -1935.8564, 27.2458, 208.2384),
    vec4(822.5568, -759.0858, 26.3535, 121.5359),
    vec4(691.0272, -832.3442, 23.9717, 178.9223),
    vec4(706.3214, -979.5227, 23.7649, 225.3820),
    vec4(757.4804, -304.6051, 59.5075, 304.4463),
    vec4(702.2476, -295.7529, 58.8049, 11.9843),
    vec4(629.9601, 172.6103, 95.9440, 69.6721),
    vec4(623.6597, 119.4243, 92.2713, 249.4992),
    vec4(512.7377, -61.6626, 88.4823, 63.8289),
    vec4(281.2185, -198.4431, 61.1966, 339.3150),
    vec4(-70.4570, -212.0696, 45.0706, 160.6534),
    vec4(-359.2644, -102.2434, 45.2896, 340.2768),
    -- Add or remove locations as you wish
}

-- Various locations that are chosen at random
-- To spawn the assigned vehicle at (for client requests)
-- These are recommended to be near the road way so the ped
-- Has a clear path to join traffic, otherwise may get stuck
Config.ContractLocations = {
    vec4(-467.0779, 20.9529, 44.9404, 87.0371),
    vec4(-487.8148, -198.1449, 36.5994, 210.3986),
    vec4(294.5605, -232.9000, 53.5352, 14.6311),
    vec4(166.5162, -33.4574, 67.4906, 3.8387),
    vec4(-1123.8448, -813.7557, 15.9014, 241.6680),
    vec4(-834.2293, -1167.9933, 6.1975, 252.2660),
    vec4(-896.6371, -2593.4624, 13.4189, 330.2037),
    vec4(-62.8604, -1840.6299, 26.2723, 320.3263),
    vec4(309.2967, -1352.5089, 31.4289, 139.5462),
    vec4(340.9799, -950.0955, 28.9876, 138.0668),
    vec4(174.2403, -1011.6236, 28.8668, 28.5479),
    vec4(96.9143, 248.2399, 107.8314, 69.9437),
    vec4(-667.7917, 986.2451, 238.1728, 265.6741),
    vec4(273.4301, 1175.7993, 224.4116, 124.5887),
    vec4(305.6136, 936.0198, 205.8490, 169.8940),
    vec4(1290.2345, 860.0432, 105.1792, 345.6187),
    vec4(885.7494, -66.5091, 78.3523, 238.4475),
    vec4(861.7056, -227.0664, 69.9124, 2.6913),
    vec4(338.6765, 340.7383, 104.7896, 165.5599),
    vec4(-4.2159, -1647.0026, 28.7520, 231.0349),
    vec4(833.2452, -1078.9431, 27.5850, 91.2032),
    vec4(768.7962, -913.7181, 24.8352, 275.5888),
    vec4(-622.7997, 190.2284, 68.8521, 159.0297),
    vec4(-561.1064, 337.3643, 84.0014, 173.8307),
    -- Add or remove locations as you wish
}

-- Various locations that are chosen at random after picking
-- Up the assigned chop vehicle to bring it to & break it down
Config.ChopSites = {
    vec3(1565.1211, -2161.1277, 77.5340),
    vec3(1134.0985, -793.7753, 57.5917),
    vec3(-84.7814, -2225.9697, 7.8117),
    vec3(-467.7876, -1678.4623, 19.0395),
    vec3(1596.7920, -1709.7660, 88.1285),
    vec3(833.9869, -1405.5132, 26.1511),
    vec3(970.2102, -1632.1747, 30.1107),
    vec3(248.3347, 380.5432, 105.5951),
    vec3(-69.7967, 83.2294, 71.5020),
    vec3(-1315.3870, -1257.1395, 4.5771),
    vec3(-443.0953, -2282.7065, 7.6081),
    vec3(-1597.3135, -1008.8568, 7.6894),
    -- Add or remove locations as you wish
}

-- Various locations that are chosen at random
-- For client request vehicles that will be sold
-- These are the locations a ped will meet to buy the vehicle
Config.SellSites = {
    vec4(-333.9571, -1026.8979, 30.5305, 340.1899),
    vec4(-643.6304, -1227.4497, 11.5476, 302.8482),
    vec4(452.2550, -1232.1274, 30.0541, 13.4026),
    vec4(487.4106, -1520.3782, 29.2909, 147.4061),
    vec4(280.2859, -1925.6035, 25.8307, 235.5993),
    vec4(598.9858, -2227.0095, 6.0685, 185.9130),
    vec4(229.3900, -1766.1421, 28.6809, 230.20260),
    vec4(-1408.6815, -632.6735, 28.6734, 214.4133),
    vec4(-1745.6428, -724.7009, 10.4254, 322.4088),
    vec4(-1677.3850, -247.5141, 54.4764, 250.20600),
    vec4(-734.0511, 374.8066, 88.0216, 88.46090),
    vec4(-459.3790, 304.8376, 83.2458, 263.1675),
    vec4(1120.9355, 61.6788, 80.8903, 233.9510),
    vec4(959.0397, -1035.5709, 41.0304, 280.1571),
    vec4(704.0132, -1391.1458, 26.2872, 192.5469),
    vec4(853.8427, -2118.1245, 30.6103, 270.6398),
    vec4(-445.9975, -443.6805, 33.1587, 169.9240),
    -- Add or remove locations as you wish
}

-- GTA V/FiveM color codes, used to obtain color of vehicles
-- Should never be necessary to edit this, changing anything
-- Other than the labels will break the resource
Config.Colors = {
    [0] = 'Metallic Black',
    [1] = 'Metallic Graphite Black',
    [2] = 'Metallic Black Steel',
    [3] = 'Metallic Dark Silver',
    [4] = 'Metallic Silver',
    [5] = 'Metallic Blue Silver',
    [6] = 'Metallic Steel Gray',
    [7] = 'Metallic Shadow Silver',
    [8] = 'Metallic Stone Silver',
    [9] = 'Metallic Midnight Silver',
    [10] = 'Metallic Gun Metal',
    [11] = 'Metallic Anthracite Grey',
    [12] = 'Matte Black',
    [13] = 'Matte Gray',
    [14] = 'Matte Light Grey',
    [15] = 'Util Black',
    [16] = 'Util Black Poly',
    [17] = 'Util Dark silver',
    [18] = 'Util Silver',
    [19] = 'Util Gun Metal',
    [20] = 'Util Shadow Silver',
    [21] = 'Worn Black',
    [22] = 'Worn Graphite',
    [23] = 'Worn Silver Grey',
    [24] = 'Worn Silver',
    [25] = 'Worn Blue Silver',
    [26] = 'Worn Shadow Silver',
    [27] = 'Metallic Red',
    [28] = 'Metallic Torino Red',
    [29] = 'Metallic Formula Red',
    [30] = 'Metallic Blaze Red',
    [31] = 'Metallic Graceful Red',
    [32] = 'Metallic Garnet Red',
    [33] = 'Metallic Desert Red',
    [34] = 'Metallic Cabernet Red',
    [35] = 'Metallic Candy Red',
    [36] = 'Metallic Sunrise Orange',
    [37] = 'Metallic Classic Gold',
    [38] = 'Metallic Orange',
    [39] = 'Matte Red',
    [40] = 'Matte Dark Red',
    [41] = 'Matte Orange',
    [42] = 'Matte Yellow',
    [43] = 'Util Red',
    [44] = 'Util Bright Red',
    [45] = 'Util Garnet Red',
    [46] = 'Worn Red',
    [47] = 'Worn Golden Red',
    [48] = 'Worn Dark Red',
    [49] = 'Metallic Dark Green',
    [50] = 'Metallic Racing Green',
    [51] = 'Metallic Sea Green',
    [52] = 'Metallic Olive Green',
    [53] = 'Metallic Green',
    [54] = 'Metallic Gasoline Blue Green',
    [55] = 'Matte Lime Green',
    [56] = 'Util Dark Green',
    [57] = 'Util Green',
    [58] = 'Worn Dark Green',
    [59] = 'Worn Green',
    [60] = 'Worn Sea Wash',
    [61] = 'Metallic Midnight Blue',
    [62] = 'Metallic Dark Blue',
    [63] = 'Metallic Saxony Blue',
    [64] = 'Metallic Blue',
    [65] = 'Metallic Mariner Blue',
    [66] = 'Metallic Harbor Blue',
    [67] = 'Metallic Diamond Blue',
    [68] = 'Metallic Surf Blue',
    [69] = 'Metallic Nautical Blue',
    [70] = 'Metallic Bright Blue',
    [71] = 'Metallic Purple Blue',
    [72] = 'Metallic Spinnaker Blue',
    [73] = 'Metallic Ultra Blue',
    [74] = 'Metallic Bright Blue',
    [75] = 'Util Dark Blue',
    [76] = 'Util Midnight Blue',
    [77] = 'Util Blue',
    [78] = 'Util Sea Foam Blue',
    [79] = 'Util Lightning Blue',
    [80] = 'Util Maui Blue Poly',
    [81] = 'Util Bright Blue',
    [82] = 'Matte Dark Blue',
    [83] = 'Matte Blue',
    [84] = 'Matte Midnight Blue',
    [85] = 'Worn Dark Blue',
    [86] = 'Worn Blue',
    [87] = 'Worn Light Blue',
    [88] = 'Metallic Taxi Yellow',
    [89] = 'Metallic Race Yellow',
    [90] = 'Metallic Bronze',
    [91] = 'Metallic Yellow Bird',
    [92] = 'Metallic Lime',
    [93] = 'Metallic Champagne',
    [94] = 'Metallic Pueblo Beige',
    [95] = 'Metallic Dark Ivory',
    [96] = 'Metallic Choco Brown',
    [97] = 'Metallic Golden Brown',
    [98] = 'Metallic Light Brown',
    [99] = 'Metallic Straw Beige',
    [100] = 'Metallic Moss Brown',
    [101] = 'Metallic Biston Brown',
    [102] = 'Metallic Beechwood',
    [103] = 'Metallic Dark Beechwood',
    [104] = 'Metallic Choco Orange',
    [105] = 'Metallic Beach Sand',
    [106] = 'Metallic Sun Bleeched Sand',
    [107] = 'Metallic Cream',
    [108] = 'Util Brown',
    [109] = 'Util Medium Brown',
    [110] = 'Util Light Brown',
    [111] = 'Metallic White',
    [112] = 'Metallic Frost White',
    [113] = 'Worn Honey Beige',
    [114] = 'Worn Brown',
    [115] = 'Worn Dark Brown',
    [116] = 'Worn straw beige',
    [117] = 'Brushed Steel',
    [118] = 'Brushed Black steel',
    [119] = 'Brushed Aluminium',
    [120] = 'Chrome',
    [121] = 'Worn Off White',
    [122] = 'Util Off White',
    [123] = 'Worn Orange',
    [124] = 'Worn Light Orange',
    [125] = 'Metallic Securicor Green',
    [126] = 'Worn Taxi Yellow',
    [127] = 'police car blue',
    [128] = 'Matte Green',
    [129] = 'Matte Brown',
    [130] = 'Worn Orange',
    [131] = 'Matte White',
    [132] = 'Worn White',
    [133] = 'Worn Olive Army Green',
    [134] = 'Pure White',
    [135] = 'Hot Pink',
    [136] = 'Salmon pink',
    [137] = 'Metallic Vermillion Pink',
    [138] = 'Orange',
    [139] = 'Green',
    [140] = 'Blue',
    [141] = 'Mettalic Black Blue',
    [142] = 'Metallic Black Purple',
    [143] = 'Metallic Black Red',
    [144] = 'hunter green',
    [145] = 'Metallic Purple',
    [146] = 'Metaillic V Dark Blue',
    [147] = 'Modshop Black',
    [148] = 'Matte Purple',
    [149] = 'Matte Dark Purple',
    [150] = 'Metallic Lava Red',
    [151] = 'Matte Forest Green',
    [152] = 'Matte Olive Drab',
    [153] = 'Matte Desert Brown',
    [154] = 'Matte Desert Tan',
    [155] = 'Matte Foilage Green',
    [156] = 'Default Alloy',
    [157] = 'Epsilon Blue',
    [158] = 'Pure Gold',
    [159] = 'Brushed Gold'
}