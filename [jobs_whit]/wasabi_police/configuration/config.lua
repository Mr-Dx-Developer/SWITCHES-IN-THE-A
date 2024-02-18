-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local seconds, minutes = 1000, 60000
Config = {}

Config.jobMenu = 'F6'          -- Default job menu key
Config.useTarget = true        -- Enable target for police functions (Supports qtarget, qb-target, and ox_target)
Config.MobileMenu = {          -- THIS WILL USE A OX_LIB MENU RATHER THAN OX_LIB CONTEXT MENU!
    enabled = false,           -- Use a mobile menu from ox_lib rather than context? (Use arrow keys to navigate menu rather than mouse)
    position =
    'bottom-right'             -- Choose where menu is positioned. Options : 'top-left' or 'top-right' or 'bottom-left' or 'bottom-right'
}
Config.UseRadialMenu = false   -- Enable use of radial menu built in to ox_lib? (REQUIRES OX_LIB 3.0 OR HIGHER - Editable in client/radial.lua)

Config.customCarlock = false   -- If you use wasabi_carlock OR qb-carlock set to true(Add your own carlock system in client/cl_customize.lua)
Config.billingSystem = false   -- Current options: 'esx' (For esx_billing) / 'qb' (QBCore) / 'okok' (For okokBilling) (Easy to add more/fully customize in client/cl_customize.lua)
Config.skinScript =
'qb'                          -- Current options: 'esx' (For esx_skin) / 'appearance' (For wasabi-fivem-appearance) / 'qb' for qb-clothing / 'custom' for custom (Custom can be added in client/cl_customize.lua) / false for disabled
Config.AdvancedParking = false -- Delete vehicles with their exports(Script named advanced parking)
Config.Jail = {
    enabled = true,           -- Enable jail feature?
    input = true,              -- Enable input? Some needs it
    jail = 'qb',                 -- Current options: 'qb' (For qb-prison) / 'rcore' (For rcore-prison) / 'tk_jail' (For tk_jail) / 'hd_jail' (For hd_jail) / 'myPrison' (For myPrison) / 'qalle-jail' (For qalle-jail) / 'plouffe ' (For Plouffe Jail) / 'mx' (For mxJail) / 'custom' (For custom)
}
-- NOTE: If using qb-prison, you must make one small change to qb-prison.
-- SEE https://docs.wasabiscripts.com/scripts/wasabi_police/customizations#qb-prison-integration

Config.inventory =
'qb'                             -- NEEDED FOR SEARCHING PLAYERS - Current options: 'ox' (For ox_inventory) / 'qb' (For QbCore Inventory) / 'mf' (For mf inventory) / 'qs' (For qs_inventory) / 'cheeza' (For cheeza_inventory) / 'custom' (Custom can be added in client/cl_customize.lua)
Config.searchPlayers = false     -- Allow police jobs to search players (Must set correct inventory above)
Config.weaponsAsItems = true     -- (If you're unsure leave as true!)This is typically for older ESX and inventories that still use weapons as weapons and not items

Config.spikeStripsEnabled = true -- Enable functionality of spike strips (Disable if you use difference script for spike strips)

--[[ These resources can trigger:
    wasabi_police:handcuffPlayer
    wasabi_police:escortPlayer
    wasabi_police:inVehiclePlayer
    wasabi_police:outVehiclePlayer
]]
Config.AllowedResources = {
    'qb-core',
    'qb-radialmenu', -- For civilians to be able to use radial menu features(Already had compatibility without edit)
}

Config.AllowedJobs = { -- THIS HAS NOTHING TO DO with Config.policeJobs, only with triggering events above
    --'bloods'
}

Config.GrantWeaponLicenses = {
    enabled = true,          -- If you want police to have option to grant/revoke weapons licenses
    license_name = 'weapon', -- Name of license
    minGrade = 0,            -- Min grade to use this function
    menuPosition =
    'bottom-right'           -- Choose where menu of player select is positioned. Options : 'top-left' or 'top-right' or 'bottom-left' or 'bottom-right'
}

Config.GSR = {                 -- Gunshot residue settings
    enabled = false,           -- Enabled?
    cleanInWater = true,       -- Can clean GSR while in water?
    timeToClean = 5 * seconds, -- How long to clean GSR in water if enabled
    autoClean = 600,           -- (IN SECONDS)How long before residue clears itself? Set to false if undesired to auto clean GSR
    command = 'gsr'            -- Command for testing for GSR? Set to false if undesired
}

Config.tackle = {
    enabled = true,    -- Enable tackle?
    policeOnly = true, -- Police jobs only use tackle?
    hotkey = 'G'       -- What key to press while sprinting to start tackle of target
}

Config.handcuff = {                             -- Config in regards to cuffing
    defaultCuff = 'hard',                       -- Default cuff type (Options: 'soft' / 'hard') Changing this will be the default hotkey cuff type
    timer = 20 * minutes,                       -- Time before player is automatically unrestrained(Set to false if not desired)
    hotkey = 'J',                               -- What key to press to handcuff people(Set to false for no hotkey)
    skilledEscape = {
        enabled = true,                         -- Allow criminal to simulate resisting by giving them a chance to break free from cuffs via skill check
        difficulty = { 'easy', 'easy', 'easy' } -- Options: 'easy' / 'medium' / 'hard' (Can be stringed along as they are in config)
    },
    cuffItem = {                                -- Have handcuffs as usable item? (ITEM NAME MUST BE IN ITEMS / YOU MUST ADD YOURSELF)
        enabled = false,                        -- Enable a handcuff usable item?? Must be in items table/database with name defined below
        required = true,                        -- Requires handcuff item to be in inventory when any handcuff function is used
        item = 'handcuffs'                      -- Item name (DONT FORGET to make sure its in your items)
    },
    lockpicking = {                             -- Lockpicking someone else out of handcuffs
        enabled = false,                        -- Enable handcuffs to be able to be lockpicked off(MUST HAVE LOCKPICK ITEM IN ITEMS)
        item = 'lockpick',
        breakChance = 50,                       -- Chance of lockpick breaking if failed (Set to 100 for 100% or 0 for never breaking)
        difficulty = { 'easy', 'easy', 'easy' } -- Options: 'easy' / 'medium' / 'hard' (Can be stringed along as they are in config)
    }
}

Config.policeJobs = { -- Police jobs
    'police',
    --    'sheriff'
}

Config.GPSBlips = {  -- Warning: May experience high usage when at high player count. Possibly turn up refreshrate as remedy!
    enabled = false, -- Enabled?
    refreshrate = 5, -- In Seconds Note: it could impact the server performance
    item = false,    -- Item required? Note: You have to use it then
    blip = {
        sprite = 1,
        color = 1,
        scale = 1.0,
        short = false,
    }
}

Config.Props = { -- What props are avaliable in the "Place Objects" section of the job menu

    {
        title = 'Barrier',             -- Label
        description = '',              -- Description (optional)
        model = `prop_barrier_work05`, -- Prop name within `
        groups = {                     -- ['job_name'] = min_rank
            ['police'] = 0,
            --            ['sheriff'] = 0,
        }
    },
    {
        title = 'Barricade',
        description = '',
        model = `prop_mp_barrier_01`,
        groups = {
            ['police'] = 0,
            --            ['sheriff'] = 0,
        }
    },
    {
        title = 'Traffic Cones',
        description = '',
        model = `prop_roadcone02a`,
        groups = {
            ['police'] = 0,
            --            ['sheriff'] = 0,
        }
    },
    {
        title = 'Spike Strip',
        description = '',
        model = `p_ld_stinger_s`,
        groups = {
            ['police'] = 0,
            --            ['sheriff'] = 0,
        }
    },

}

Config.Locations = {
    LSPD = {
        blip = {
            enabled = true,
            coords = vec3(464.57, -992.0, 30.69),
            sprite = 60,
            color = 29,
            scale = 1.0,
            string = 'Mission Row PD'
        },

        clockInAndOut = {
            enabled = false,                       -- Enable clocking in and out at a set location? (If using ESX you must have a off duty job for each e.x. offpolice for police offsheriff for sheriff AND have grades for each pd grade - QBCORE REQUIRES NOTHING)
            jobLock = 'police',                    -- This must be set to which job will be utilizing (ESX MUST HAVE OFF DUTY JOB / GRADES FOR THIS - ex. offpolice or offsheriff)
            coords = vec3(464.87, -977.37, 30.69), -- Location of where to go on and off duty(If not using target)
            label = '[E] - Go On/Off Duty',        -- Text to display(If not using target)
            distance = 3.0,                        -- Distance to display text UI(If not using target)
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Go On/Off Duty',
                coords = vec3(464.87, -977.37, 30.69),
                heading = 91.06,
                width = 2.0,
                length = 1.0,
                minZ = 30.69 - 0.9,
                maxZ = 30.69 + 0.9
            }
        },

        bossMenu = {
            enabled = true,                        -- Enable boss menu?
            jobLock = 'police',                    -- Lock to specific police job? Set to false if not desired
            coords = vec3(460.64, -985.64, 30.73), -- Location of boss menu (If not using target)
            label = '[E] - Access Boss Menu',      -- Text UI label string (If not using target)
            distance = 3.0,                        -- Distance to allow access/prompt with text UI (If not using target)
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Access Boss Menu',
                coords = vec3(460.64, -985.64, 30.73),
                heading = 269.85,
                width = 2.0,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            }
        },

        armoury = {
            enabled = true,                                                                 -- Set to false if you don't want to use
            coords = vec3(480.32, -996.67, 30.69 - 0.9),                                    -- Coords of armoury
            heading = 86.95,                                                                -- Heading of armoury NPC
            ped = 's_f_y_cop_01',
            label = '[E] - Access Armoury',                                                 -- String of text ui
            jobLock = 'police',                                                             -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            weapons = {
                [0] = {                                                                     -- Grade number will be the name of each table(this would be grade 0)
                    ['WEAPON_PISTOL'] = { label = 'Pistol', multiple = false, price = 75 }, -- Set price to false if undesired
                    ['WEAPON_NIGHTSTICK'] = { label = 'Night Stick', multiple = false, price = 50 },
                    --                    ['ammo-9'] = { label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --                    ['armour'] = { label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example

                },
                [1] = { -- This would be grade 1
                    ['WEAPON_COMBATPISTOL'] = { label = 'Combat Pistol', multiple = false, price = 150 },
                    ['WEAPON_NIGHTSTICK'] = { label = 'Night Stick', multiple = false, price = 50 },
                    --                    ['ammo-9'] = { label = '9mm Ammo', multiple = true, price = 10 }, -- Example
                    --                    ['armour'] = { label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
                [2] = { -- This would be grade 2
                    ['WEAPON_COMBATPISTOL'] = { label = 'Combat Pistol', multiple = false, price = 150 },
                    ['WEAPON_NIGHTSTICK'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['WEAPON_ASSAULTRIFLE'] = { label = 'Assault Rifle', multiple = false, price = 1100 },
                    --                    ['ammo-9'] = { label = '9mm Ammo', multiple = true, price = 10 }, -- Example
                    --                    ['ammo-rifle'] = { label = '5.56 Ammo', multiple = true, price = 20 }, -- Example
                    --                    ['armour'] = { label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
                [3] = { -- This would be grade 3
                    ['WEAPON_COMBATPISTOL'] = { label = 'Combat Pistol', multiple = false, price = 150 },
                    ['WEAPON_NIGHTSTICK'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['WEAPON_ASSAULTRIFLE'] = { label = 'Assault Rifle', multiple = false, price = 1100 },
                    --    ['ammo-9'] = { label = '9mm Ammo', multiple = true, price = 10 }, -- Example
                    --    ['ammo-rifle'] = { label = '5.56 Ammo', multiple = true, price = 20 }, -- Example
                    --    ['armour'] = { label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
            }
        },

        cloakroom = {
            enabled = false,                       -- WILL NOT SHOW IN QBCORE INSTEAD USE QB-CLOTHING CONFIG! Set to false if you don't want to use (Compatible with esx_skin & wasabi fivem-appearance fork)
            jobLock = 'police',                    -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            coords = vec3(462.36, -999.62, 30.69), -- Coords of cloakroom
            label = '[E] - Change Clothes',        -- String of text ui of cloakroom
            range = 2.0,                           -- Range away from coords you can use.
            uniforms = {                           -- Uniform choices

                [1] = {                            -- Name of outfit that will display in menu
                    label = 'Recruit',
                    minGrade = 0,                  -- minimum grade level to access? Set to false or 0 for all grades
                    male = {                       -- Male variation
                        ['tshirt_1'] = 15,
                        ['tshirt_2'] = 0,
                        ['torso_1'] = 5,
                        ['torso_2'] = 2,
                        ['arms'] = 5,
                        ['pants_1'] = 6,
                        ['pants_2'] = 1,
                        ['shoes_1'] = 16,
                        ['shoes_2'] = 7,
                        ['helmet_1'] = 44,
                        ['helmet_2'] = 7,
                    },
                    female = { -- Female variation
                        ['tshirt_1'] = 15,
                        ['tshirt_2'] = 0,
                        ['torso_1'] = 4,
                        ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,
                        ['pants_2'] = 1,
                        ['shoes_1'] = 16,
                        ['shoes_2'] = 4,
                    }
                },

                [2] = {
                    label = 'Patrol',
                    minGrade = 0, -- minimum grade level to access? Set to false or 0 for all grades
                    male = {
                        ['tshirt_1'] = 58,
                        ['tshirt_2'] = 0,
                        ['torso_1'] = 55,
                        ['torso_2'] = 0,
                        ['arms'] = 30,
                        ['pants_1'] = 24,
                        ['pants_2'] = 0,
                        ['shoes_1'] = 10,
                        ['shoes_2'] = 0,
                        ['helmet_1'] = 46,
                        ['helmet_2'] = 0,
                    },
                    female = {
                        ['tshirt_1'] = 15,
                        ['tshirt_2'] = 0,
                        ['torso_1'] = 4,
                        ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,
                        ['pants_2'] = 1,
                        ['shoes_1'] = 16,
                        ['shoes_2'] = 4,
                    }
                },

                [3] = {
                    label = 'Chief',
                    minGrade = 0, -- minimum grade level to access? Set to false or 0 for all grades
                    male = {
                        ['tshirt_1'] = 15,
                        ['tshirt_2'] = 0,
                        ['torso_1'] = 5,
                        ['torso_2'] = 2,
                        ['arms'] = 5,
                        ['pants_1'] = 6,
                        ['pants_2'] = 1,
                        ['shoes_1'] = 16,
                        ['shoes_2'] = 7,
                        ['helmet_1'] = 44,
                        ['helmet_2'] = 7,
                    },
                    female = {
                        ['tshirt_1'] = 15,
                        ['tshirt_2'] = 0,
                        ['torso_1'] = 4,
                        ['torso_2'] = 14,
                        ['arms'] = 4,
                        ['pants_1'] = 25,
                        ['pants_2'] = 1,
                        ['shoes_1'] = 16,
                        ['shoes_2'] = 4,
                    }
                },
            }
        },

        vehicles = {                                   -- Vehicle Garage
            enabled = true,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
            jobLock = 'police',                        -- Job lock? or access to all police jobs by using false
            zone = {
                coords = vec3(463.69, -1019.72, 28.1), -- Area to prompt vehicle garage
                range = 5.5,                           -- Range it will prompt from coords above
                label = '[E] - Access Garage',
                return_label = '[E] - Return Vehicle'
            },
            spawn = {
                land = {
                    coords = vec3(449.37, -1025.46, 28.59), -- Coords of where land vehicle spawn/return
                    heading = 3.68
                },
                air = {
                    coords = vec3(449.29, -981.76, 43.69), -- Coords of where air vehicles spawn/return
                    heading = 0.01
                }
            },
            options = {

                [0] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [1] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [2] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [3] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },
            }
        }
    },
}
