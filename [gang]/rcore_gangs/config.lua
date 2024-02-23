Config = {}

-- Choose your locale
-- 'EN' = English
Config.Locale = 'EN'

Config.Database = 1 --[ 1 = oxmysql / 2 = mysql-async / 3 = ghmattimysql ] Choose your database
Config.Framework = 2 --[ 1 = ESX / 2 = QBCore / 3 = Other ] Choose your framework

-- Choose your inventory script
-- 1 = QBCore Inventory (qb-inventory)
-- 2 = OverExtended Inventory (ox_inventory)
-- 3 = Quasar Inventory (qs-inventory)
-- 4 = Chezza Inventory (inventory)
-- 5 = Core Inventory (core_inventory)
-- 6 = ModFreakz Inventory (mf-inventory)
-- 7 = ESX Inventoryhud (DOES NOT SUPPORT ROBBING/STORAGE)
-- 8 = ESX Addoninventory (DOES NOT SUPPORT ROBBING/STORAGE)
Config.Inventory = 1

-- Choose your dispatch script
-- 1 = Codesign Dispatch (cd_dispatch)
-- 2 = ProjectSloth Dispatch (ps-dispatch)
-- 3 = Core Dispatch (core_dispatch)
-- 4 = Quasar Dispatch (qs-dispatch)
-- 5 = RCore Dispatch (rcore_dispatch)
Config.Dispatch = 4

-- Do not edit these values unless you know what you're doing
Config.FrameworkTriggers = {
    notify = '',
    object = '',
    resourceName = '',
}

-- Do not edit these values unless you know what you're doing
Config.FrameworkSQLTables = {
    table = '',
    identifier = '',
}

-- Permissions required to use restricted commands
Config.CommandPermissions = {
    'god',
    'admin',
    'superadmin',
}

-- This option enables the script to replicate current state and override data in other gang scripts
-- This option only supports qb-gangs at the moment make sure you have the same ranks setup in this config
Config.OverrideGangs = false

-- You can find all the available keys here (https://docs.fivem.net/docs/game-references/controls/)
Config.KeyBinds = {
    target = 19, -- [LEFT ALT] Key bind for targeting script
    checkpoint = 38, -- [E] Key bind to interact with gang checkpoint
    zoneHudInfo = 48, --  [Z] Key bind to show zone hud
}

Config.ZoneOptions = {
    showHudInfo = false, -- Shows custom hud information in the lower right corner of the screen
    showZonesEveryone = false, -- Shows gang zones on the map for everyone

    hourlyDecay = 1.0, -- The percentage of how much loyalty a captured zone loses every hour
    presenceTime = 120, -- The time in minutes that a gang member must be present in a zone to gain loyalty

    maximumSprays = 8, -- The maximum number of sprays that affect zone loyalty, each spray resets every hour
    maximumMurders = 6, -- The maximum number of murders that affect zone loyalty, each murder resets every hour
    maximumHotwires = 8, -- The maximum number of hotwires that affect zone loyalty, each hotwire resets every hour
    maximumVendettas = 6, -- The maximum number of vendettas that affect zone loyalty, each vendetta resets every hour

    rivalryCost = 4000, -- The minimum amount of money needed to start a rivalry in a zone
    rivalryDuration = 48, -- The duration of rivalry in hours
}

Config.GangOptions = {
    garage = true, -- Enable garage checkpoint in gang menu
    storage = true, -- Enable storage checkpoint in gang menu
    reserve = true, -- Enable reserve checkpoint in gang menu

    storageSlots = 50, -- Sets the number of slots in gang storage
    storageWeight = 100000, -- Sets the maximum weight of gang storage

    restrictColors = true, -- Only gang colors can be painted on a vehicle in gang garage
    restrictSpawns = true, -- Only one entity can be spawned for each vehicle in gang garage

    robbing = true, -- Enable robbing feature from actions in gang menu
    kidnapping = true, -- Enable kidnapping feature from actions in gang menu

    zipTie = '', -- Optional ziptie item used when kidnapping is enabled
    paperBag = '', -- Optional paper bag item used when kidnapping is enabled

    maxMembers = 6, -- Maximum number of players in a gang

    robIcon = 'fas fa-sack-dollar', -- The icon for robbing when targeting a player (https://fontawesome.com/)
    restrainIcon = 'fas fa-handcuffs', -- The icon for restraining when targeting a player (https://fontawesome.com/)
    blindfoldIcon = 'fas fa-eye-slash', -- The icon for blindfolding when targeting a player (https://fontawesome.com/)
    transportIcon = 'fas fa-car', -- The icon for transporting when targeting a player (https://fontawesome.com/)
    escortIcon = 'fas fa-hand', -- The icon for escorting when targeting a player (https://fontawesome.com/)
}

Config.DrugOptions = {
    enableSales = true, -- Enables the drug selling feature
    enableGangOnly = false, -- Enables the drug selling feature for gang members only

    saleQuantity = 1, -- How many drugs the player will sell
    saleRandomQuantity = false, -- Enables the randomization of the amount of drugs that the player will sell

    minimumCops = 0, -- The minimum number of police officers on duty required for the drug selling feature

    categoryLowIcon = 'fas fa-cannabis', -- The icon for low category drugs when targeting a ped (https://fontawesome.com/)
    categoryMidIcon = 'fas fa-syringe', -- The icon for medium category drugs when targeting a ped (https://fontawesome.com/)
    categoryHighIcon = 'fas fa-pills', -- The icon for high category drugs when targeting a ped (https://fontawesome.com/)
}

Config.GarageOptions = {
    enableInsert = true, -- The leader can insert vehicles
    enableRemove = true, -- The ledare can remove vehicles
}

Config.TargetOptions = {
    enableDrugs = true, -- Enables the support for targeting scripts for drug selling
    enableActions = true, -- Enables the support for targeting scripts for actions (robbing/kidnapping)
}

Config.OtherOptions = {
    dirtyMoney = false, -- Receive dirty cash instead of clean cash
    anonymousNames = false -- Whether or not to hide a name of a player in the menu and use source instead
}

-- Multipliers that increase the loyalty of a zone
Config.IncreaseMultipliers = {
    VENDETTA   = 15,
    DRUGS      = 20,
    PRESENCE   = 40,
    SPRAY      = 80
}

-- Multipliers that decrease the loyalty of a zone
Config.DecreaseMultipliers = {
    HOTWIRE    = 5,
    MURDER     = 10,
    VENDETTA   = 15,
    SPRAY      = 20,
    ROBBERY    = 60
}

-- Multipliers that decrease the loyalty of a zone for the owner of the zone
Config.DecreaseLoyaltyOfOwner = {
    HOTWIRE    = true,
    MURDER     = true,
    ROBBERY    = true,
}

-- Adding custom access features is not supported at the moment
-- You can edit icon, label and description for each access (https://fontawesome.com/)
Config.RanksAccess = {
    -- Actions
    ['actions.perform'] = {
        icon = 'fa-hand',
        label = 'Rob/Kidnap Others',
        description = 'This rank allows the member to rob and kidnap other people',
    },

    -- Checkpoint
    ['checkpoint.edit'] = {
        icon = 'fa-gear',
        label = 'Edit Checkpoints',
        description = 'This rank allows the member to place and remove checkpoints',
    },

    -- Garage
    ['garage.use'] = {
        icon = 'fa-car',
        label = 'Use Garage',
        description = 'This rank allows the member to use garage vehicles',
    },
    ['garage.edit'] = {
        icon = 'fa-gear',
        label = 'Edit Garage',
        description = 'This rank allows the member to add and remove garage vehicles',
    },

    -- Reserve
    ['reserve.use'] = {
        icon = 'fa-money-bill',
        label = 'Use Reserve',
        description = 'This rank allows the member to view the reserve and give it money',
    },
    ['reserve.edit'] = {
        icon = 'fa-gear',
        label = 'Edit Reserve',
        description = 'This rank allows the member to view the reserve and take money from it',
    },

    -- Storage
    ['storage.use'] = {
        icon = 'fa-box',
        label = 'Use Storage',
        description = 'This rank allows the member to use storage space',
    },

    -- Members
    ['members.rank'] = {
        icon = 'fa-ranking-star',
        label = 'Change Rank',
        description = 'This rank allows the member to change the rank of lower members',
    },
    ['members.kick'] = {
        icon = 'fa-arrow-right-from-bracket',
        label = 'Kick Member',
        description = 'This rank allows the member to kick lower members',
    },
    ['members.invite'] = {
        icon = 'fa-arrow-up-from-bracket',
        label = 'Send Invite',
        description = 'This rank allows the member to invite new members',
    },

    -- Protection
    ['protection.collect'] = {
        icon = 'fa-cash-register',
        label = 'Collect Protection',
        description = 'This rank allows the member to collect protection money from businesses',
    },

    -- Rivalry
    ['rivalry.begin'] = {
        icon = 'fa-shield-halved',
        label = 'Begin Rivalry',
        description = 'This rank allows the member to begin a new rivalry in the zone',
    },
    ['rivalry.claim'] = {
        icon = 'fa-trophy',
        label = 'Claim Rivalry',
        description = 'This rank allows the member to claim a won rivalry in the zone',
    },
}

-- All rank groups used by the script
-- The ranks for each group must be in a hierarchical order to work as expected
-- One of the defined groups must have 'default' set to true to safely migrate from old rank system
-- To create a new group, assign it a unique name, label and add ranks
-- Each rank has label and 'access' table of permissions (Config.RanksAccess), rank with 'leader' set to true has all permissions automatically and can only be set for the last rank
Config.RanksGroups = {}

Config.RanksGroups['MC'] = {
    name = 'MC',
    label = 'Motorcycle Club',
    default = false,
    ranks = {
        {
            label = 'Prospect',
            access = {
                ['reserve.use'] = true,
            },
        },
        {
            label = 'Member',
            access = {
                ['garage.use'] = true,
                ['storage.use'] = true,
            },
        },
        {
            label = 'Road Captain',
            access = {
                ['actions.perform'] = true,
                ['protection.collect'] = true,
            },
        },
        {
            label = 'Sergeant at Arms',
            access = {
                ['reserve.edit'] = true,
                ['members.invite'] = true,
                ['rivalry.begin'] = true,
            },
        },
        {
            label = 'Vice President',
            access = {
                ['members.rank'] = true,
                ['members.kick'] = true,
                ['rivalry.claim'] = true,
            },
        },
        {
            label = 'President',
            leader = true,
            access = {},
        },
    },
}

Config.RanksGroups['GANG'] = {
    name = 'GANG',
    label = 'Gang',
    default = true,
    ranks = {
        {
            label = 'Street Rat',
            access = {
                ['reserve.use'] = true,
            },
        },
        {
            label = 'Thug',
            access = {
                ['garage.use'] = true,
                ['storage.use'] = true,
            },
        },
        {
            label = 'Soldier',
            access = {
                ['actions.perform'] = true,
                ['protection.collect'] = true,
            },
        },
        {
            label = 'Made Man',
            access = {
                ['reserve.edit'] = true,
                ['members.invite'] = true,
                ['rivalry.begin'] = true,
            },
        },
        {
            label = 'Lieutenant',
            access = {
                ['members.rank'] = true,
                ['members.kick'] = true,
                ['rivalry.claim'] = true,
            },
        },
        {
            label = 'Boss',
            leader = true,
            access = {},
        },
    },
}

Config.RanksGroups['MAFIA'] = {
    name = 'MAFIA',
    label = 'Mafia',
    default = false,
    ranks = {
        {
            label = 'Associate',
            access = {
                ['reserve.use'] = true,
            },
        },
        {
            label = 'Soldier',
            access = {
                ['garage.use'] = true,
                ['storage.use'] = true,
            },
        },
        {
            label = 'Capo',
            access = {
                ['actions.perform'] = true,
                ['protection.collect'] = true,
            },
        },
        {
            label = 'Consigliere',
            access = {
                ['reserve.edit'] = true,
                ['members.invite'] = true,
                ['rivalry.begin'] = true,
            },
        },
        {
            label = 'Underboss',
            access = {
                ['members.rank'] = true,
                ['members.kick'] = true,
                ['rivalry.claim'] = true,
            },
        },
        {
            label = 'Boss',
            leader = true,
            access = {},
        },
    },
}

-- Enable this option to create hierarchy of permissions for each rank in a group
-- In simple term this means that every 'access' of the lower rank will be automatically assigned to the higher rank too
Config.RanksInheritance = true

-- All commands used in this script
Config.Commands = {
    MANAGEGANG = 'managegang',
    CREATEGANG = 'creategang',
    DELETEGANG = 'deletegang',
    ACCEPTGANG = 'acceptgang',
    GANGMENU = 'gangmenu',

    SHOWZONES = 'showzones',
    SELLDRUGS = 'selldrugs',

    FREEPLAYER = 'freeplayer',

    PLACEPOINT = 'placepoint',
    REMOVEPOINT = 'removepoint',

    ADDVEHICLE = 'addvehicle',
    DELVEHICLE = 'delvehicle',
}

Config.CommandSuggestion = {}

-- Chat suggestions for all commands
Config.CommandSuggestion['MANAGEGANG'] = {
    description = 'Use this to create/delete and manage gangs (Admin Only)',
    parameters = {}
}
Config.CommandSuggestion['CREATEGANG'] = {
    description = 'Use this to create a new gang (Admin Only)',
    parameters = {
        {
            name = 'leader',
            help = 'Id of the leader'
        },
        {
            name = 'color',
            help = 'Color of the gang'
        },
        {
            name = 'group',
            help = 'Group of the gang'
        },
        {
            name = 'tag',
            help = 'Tag, 10 characters maximum'
        },
        {
            name = 'name',
            help = 'Name, 32 characters maximum'
        }
    }
}
Config.CommandSuggestion['DELETEGANG'] = {
    description = 'Use this to delete an existing gang (Admin Only)',
    parameters = {
        {
            name = 'id/tag/name',
            help = 'Id or Tag or Name of the gang'
        }
    }
}
Config.CommandSuggestion['ACCEPTGANG'] = {
    description = 'Use this to accept a gang invite',
    parameters = {}
}
Config.CommandSuggestion['GANGMENU'] = {
    description = 'Use this to open the gang menu',
    parameters = {}
}
Config.CommandSuggestion['SHOWZONES'] = {
    description = 'Use this to show/hide gang zones on the map',
    parameters = {}
}
Config.CommandSuggestion['SELLDRUGS'] = {
    description = 'Use this to open the drug menu',
    parameters = {}
}
Config.CommandSuggestion['FREEPLAYER'] = {
    description = 'Use this to free the player from zip ties and head bags (Admin Only)',
    parameters = {
        {
            name = 'player',
            help = 'Id of the player.'
        }
    }
}
Config.CommandSuggestion['PLACEPOINT'] = {
    description = 'Use this to place a gang checkpoint (Admin Only)',
    parameters = {
        {
            name = 'id/tag/name',
            help = 'Id or Tag or Name of the gang'
        },
        {
            name = 'type',
            help = 'Type of the checkpoint, garage/storage'
        }
    }
}
Config.CommandSuggestion['REMOVEPOINT'] = {
    description = 'Use this to remove a gang checkpoint (Admin Only)',
    parameters = {
        {
            name = 'id/tag/name',
            help = 'Id or Tag or Name of the gang'
        },
        {
            name = 'type',
            help = 'Type of the checkpoint, garage/storage'
        }
    }
}
Config.CommandSuggestion['ADDVEHICLE'] = {
    description = 'Use this to add a gang vehicle (Admin Only)',
    parameters = {
        {
            name = 'id/tag/name',
            help = 'Id or Tag or Name of the gang'
        },
        {
            name = 'model',
            help = 'Model of the vehicle'
        },
        {
            name = 'color',
            help = 'Color of the vehicle'
        }
    }
}
Config.CommandSuggestion['DELVEHICLE'] = {
    description = 'Use this to remove a gang vehicle (Admin Only)',
    parameters = {
        {
            name = 'id/tag/name',
            help = 'Id or Tag or Name of the gang'
        },
        {
            name = 'model',
            help = 'Model of the vehicle'
        },
        {
            name = 'color',
            help = 'Color of the vehicle'
        }
    }
}

-- Phrases peds say when they buy drugs from a player
Config.AcceptMessages = {
    'This better be good',
    'Show me what you got',
    'Thanks, you ain\'t seen me',
    'You\'re lucky I need this asap',
    'What a trip last time, gimme more'
}
-- Phrases peds say when they refuse to buy drugs from a player
Config.RejectMessages = {
    'No can do',
    'Do I look like an addict?',
    'Whatever you\'re selling, I ain\'t buying',
    'Getting high on your shit, you must be joking',
    'I\'ve seen many but this must be the worst of the worst',
}
-- Phrases peds say when they refuse to buy drugs from a player and want to call the police
Config.ReportMessages = {
    'You\'re done in this hood',
    'Today is not your lucky day',
    'The locals have had enough of your shit',
    'Just because you can smoke it doesn\'t mean that you should smoke it',
    'My brother-in-law is a DOA agent and I will not hesitate to call him',
}
-- Phrases peds say when they already interacted with a player
Config.InteractedMessages = {
    'Get lost dude.',
    'Leave me alone already.',
    'The dope fried your memory?',
    'Are you mad? We just talked.',
    'You should stop getting high on your own supply.',
}

-- All drugs used by the script
-- Each drug must be classified into one of the three categories below
-- Each category corresponds directly to drug preferences in all zones
-- To classify a drug, write its name in the category, followed by its price
Config.Drugs = {
    CATEGORY_LOW = {
        ['weed_ak47'] = 40,
        ['weed_skunk'] = 44,
        ['weed_amnesia'] = 46,
        ['weed_og-kush'] = 52,
        ['weed_purple-haze'] = 56,
        ['weed_white-widow'] = 58,
    },
    CATEGORY_MED = {
        ['meth'] = 52,
        ['crack_baggy'] = 60,
    },
    CATEGORY_HIGH = {
        ['cokebaggy'] = 70,
    }
}

-- Price multipliers
-- Each zone has a set multiplier based on the amount of drugs sold in that zone
Config.DrugSaleMultipliers = {
    { sold = 10, multiply = 1.2 },
    { sold = 30, multiply = 1.0 },
    { sold = 45, multiply = 0.8 },
    { sold = 50, multiply = 0.6 },
    { sold = 60, multiply = 0.4 },
    { sold = 70, multiply = 0.2 }
}

-- Chances of drug sales
-- Each chance is selected based on the amount of drugs that the individual player has sold
-- Each chance has three numbers which make up one hundred
-- The script will randomly generate a number between one and one hundred every time a player tries to sell drugs
-- The first number is the chance of acceptance
-- The second number is the chance of rejection
-- The third number is the chance of rejection and a dispatch to the police
Config.DrugSaleChances = {
    { 100, 0, 0 },
    { 90, 10, 0 },
    { 85, 10, 5 },
    { 85, 15, 0 },
    { 80, 10, 10 },
    { 70, 20, 10 },
    { 70, 10, 20 },
    { 70, 15, 15 },
    { 60, 30, 10 },
    { 60, 20, 20 },
    { 60, 10, 30 },
    { 50, 35, 15 },
    { 50, 40, 10 },
    { 40, 30, 30 },
    { 40, 40, 20 },
    { 40, 20, 40 },
}

-- All businesses used by the script
-- Each business has hourly passive income
-- Each business loses half of its money when it is robbed
-- The owners of the zone where the business is located can collect money for protection
Config.Businesses = {
    ['GLOBE_OIL_DTVINE'] = {
        name = 'GLOBE_OIL_DTVINE',
        label = 'Globe Oil, Downtown Vinewood',
        banner = 'shopui_title_gasstation',
        zone = 'DTVINE',
        hourlyIncome = 70,
        checkpoint = vec3(645.64, 267.62, 103.23)
    },
    ['XERO_GAS_KOREAT'] = {
        name = 'XERO_GAS_KOREAT',
        label = 'Xero Gas, Little Seoul',
        banner = 'shopui_title_gasstation',
        zone = 'KOREAT',
        hourlyIncome = 90,
        checkpoint = vec3(-531.24, -1220.81, 18.45)
    },
    ['XERO_GAS_STRAW'] = {
        name = 'XERO_GAS_STRAW',
        label = 'Xero Gas, Strawberry',
        banner = 'shopui_title_gasstation',
        zone = 'STRAW',
        hourlyIncome = 25,
        checkpoint = vec3(288.69, -1266.93, 29.44)
    },
    ['XERO_GAS_SANDY'] = {
        name = 'XERO_GAS_SANDY',
        label = 'Xero Gas, Sandy Shores',
        banner = 'shopui_title_gasstation',
        zone = 'SANDY',
        hourlyIncome = 20,
        checkpoint = vec3(2001.76, 3779.31, 32.18)
    },
    ['XERO_GAS_PALETO'] = {
        name = 'XERO_GAS_PALETO',
        label = 'Xero Gas, Paleto Bay',
        banner = 'shopui_title_gasstation',
        zone = 'PALETO',
        hourlyIncome = 18,
        checkpoint = vec3(-93.18, 6410.32, 31.64)
    },
    ['LTD_KOREAT'] = {
        name = 'LTD_KOREAT',
        label = 'LTD, Little Seoul',
        banner = 'shopui_title_gasstation',
        zone = 'KOREAT',
        hourlyIncome = 100,
        checkpoint = vec3(-709.26, -905.42, 19.22)
    },
    ['LTD_DAVIS'] = {
        name = 'LTD_DAVIS',
        label = 'LTD, Davis',
        banner = 'shopui_title_gasstation',
        zone = 'DAVIS',
        hourlyIncome = 38,
        checkpoint = vec3(-43.89, -1749.65, 29.42)
    },
    ['LTD_MIRR'] = {
        name = 'LTD_MIRR',
        label = 'LTD, Mirror Park',
        banner = 'shopui_title_gasstation',
        zone = 'MIRR',
        hourlyIncome = 22,
        checkpoint = vec3(1160.19, -315.20, 69.22)
    },
    ['LTD_GRAPES'] = {
        name = 'LTD_GRAPES',
        label = 'LTD, Grapeseed',
        banner = 'shopui_title_gasstation',
        zone = 'GRAPES',
        hourlyIncome = 10,
        checkpoint = vec3(1706.59, 4920.77, 42.06)
    },
    ['RON_MORN'] = {
        name = 'RON_MORN',
        label = 'Ron, Morningwood',
        banner = 'shopui_title_gasstation',
        zone = 'MORN',
        hourlyIncome = 50,
        checkpoint = vec3(-1428.70, -268.84, 46.21)
    },
    ['RON_DAVIS'] = {
        name = 'RON_DAVIS',
        label = 'Ron, Davis',
        banner = 'shopui_title_gasstation',
        zone = 'DAVIS',
        hourlyIncome = 35,
        checkpoint = vec3(167.32, -1553.84, 29.26)
    },
    ['RON_LMESA'] = {
        name = 'RON_LMESA',
        label = 'Ron, La Mesa',
        banner = 'shopui_title_gasstation',
        zone = 'LMESA',
        hourlyIncome = 30,
        checkpoint = vec3(818.17, -1040.34, 26.75)
    },
    ['RON_EBURO'] = {
        name = 'RON_EBURO',
        label = 'Ron, El Burro Heights',
        banner = 'shopui_title_gasstation',
        zone = 'EBURO',
        hourlyIncome = 25,
        checkpoint = vec3(1211.19, -1389.48, 35.38)
    },
    ['RON_PALETO'] = {
        name = 'RON_PALETO',
        label = 'Ron, Paleto Bay',
        banner = 'shopui_title_gasstation',
        zone = 'PALETO',
        hourlyIncome = 22,
        checkpoint = vec3(161.74, 6636.23, 31.57)
    },
    ['ROB_LIQUOR_MORN'] = {
        name = 'ROB_LIQUOR_MORN',
        label = 'Rob\'s Liquor, Morningwoord',
        banner = 'shopui_title_liquorstore2',
        zone = 'MORN',
        hourlyIncome = 33,
        checkpoint = vec3(-1479.83, -373.27, 39.16)
    },
    ['ROB_LIQUOR_VCANA'] = {
        name = 'ROB_LIQUOR_VCANA',
        label = 'Rob\'s Liquor, Vespucci Canals',
        banner = 'shopui_title_liquorstore2',
        zone = 'VCANA',
        hourlyIncome = 22,
        checkpoint = vec3(-1218.73, -915.63, 11.33)
    },
    ['247_DTVINE'] = {
        name = '247_DTVINE',
        label = '24/7, Downtown Vinewood',
        banner = 'shopui_title_conveniencestore',
        zone = 'DTVINE',
        hourlyIncome = 46,
        checkpoint = vec3(379.25, 332.62, 103.57)
    },
    ['247_STRAW'] = {
        name = '247_STRAW',
        label = '24/7, Strawberry',
        banner = 'shopui_title_conveniencestore',
        zone = 'STRAW',
        hourlyIncome = 15,
        checkpoint = vec3(29.45, -1339.67, 29.50)
    },
    ['247_SANDY'] = {
        name = '247_SANDY',
        label = '24/7, Sandy Shores',
        banner = 'shopui_title_conveniencestore',
        zone = 'SANDY',
        hourlyIncome = 13,
        checkpoint = vec3(1960.58, 3749.12, 32.34)
    },
    ['AMMO_KOREAT'] = {
        name = 'AMMO_KOREAT',
        label = 'Ammu-Nation, Little Seoul',
        banner = 'shopui_title_gunclub',
        zone = 'KOREAT',
        hourlyIncome = 80,
        checkpoint = vec3(-666.12, -933.69, 21.83)
    },
    ['AMMO_HAWICK'] = {
        name = 'AMMO_HAWICK',
        label = 'Ammu-Nation, Hawick',
        banner = 'shopui_title_gunclub',
        zone = 'HAWICK',
        hourlyIncome = 75,
        checkpoint = vec3(255.02, -46.89, 69.94)
    },
    ['AMMO_PBOX'] = {
        name = 'AMMO_PBOX',
        label = 'Ammu-Nation, Pillbox Hill',
        banner = 'shopui_title_gunclub',
        zone = 'PBOX',
        hourlyIncome = 45,
        checkpoint = vec3(18.94, -1104.31, 29.80)
    },
    ['AMMO_MORN'] = {
        name = 'AMMO_MORN',
        label = 'Ammu-Nation, Morningwood',
        banner = 'shopui_title_gunclub',
        zone = 'MORN',
        hourlyIncome = 30,
        checkpoint = vec3(-1303.30, -390.89, 36.70)
    },
    ['AMMO_LMESA'] = {
        name = 'AMMO_LMESA',
        label = 'Ammu-Nation, La Mesa',
        banner = 'shopui_title_gunclub',
        zone = 'LMESA',
        hourlyIncome = 22,
        checkpoint = vec3(846.25, -1035.176, 28.26)
    },
    ['AMMO_CYPRE'] = {
        name = 'AMMO_CYPRE',
        label = 'Ammu-Nation, Cypress Flats',
        banner = 'shopui_title_gunclub',
        zone = 'CYPRE',
        hourlyIncome = 20,
        checkpoint = vec3(814.06, -2158.91, 29.62)
    },
    ['AMMO_SANDY'] = {
        name = 'AMMO_SANDY',
        label = 'Ammu-Nation, Sandy Shores',
        banner = 'shopui_title_gunclub',
        zone = 'SANDY',
        hourlyIncome = 13,
        checkpoint = vec3(1689.75, 3758.06, 34.71)
    },
    ['AMMO_PALETO'] = {
        name = 'AMMO_PALETO',
        label = 'Ammu-Nation, Paleto Bay',
        banner = 'shopui_title_gunclub',
        zone = 'PALETO',
        hourlyIncome = 12,
        checkpoint = vec3(-334.26, 6082.17, 31.45)
    },
    ['SECOND_HAND_STRAW'] = {
        name = 'SECOND_HAND_STRAW',
        label = 'Second Hand, Strawberry',
        banner = 'shopui_title_lowendfashion',
        zone = 'STRAW',
        hourlyIncome = 15,
        checkpoint = vec3(71.64, -1391.20, 29.38)
    },
    ['SECOND_HAND_PALETO'] = {
        name = 'SECOND_HAND_PALETO',
        label = 'Second Hand, Paleto Bay',
        banner = 'shopui_title_lowendfashion',
        zone = 'PALETO',
        hourlyIncome = 10,
        checkpoint = vec3(6.23, 6508.64, 31.88)
    },
    ['SECOND_HAND_GRAPES'] = {
        name = 'SECOND_HAND_GRAPES',
        label = 'Second Hand, Grapeseed',
        banner = 'shopui_title_lowendfashion',
        zone = 'GRAPES',
        hourlyIncome = 8,
        checkpoint = vec3(1697.77, 4821.64, 42.06)
    },
    ['SUBURBAN_ALTA'] = {
        name = 'SUBURBAN_ALTA',
        label = 'Suburban, Alta',
        banner = 'shopui_title_midfashion',
        zone = 'ALTA',
        hourlyIncome = 78,
        checkpoint = vec3(117.67, -233.88, 54.56)
    },
    ['SUBURBAN_MOVIE'] = {
        name = 'SUBURBAN_MOVIE',
        label = 'Suburban, Richards Majestic',
        banner = 'shopui_title_midfashion',
        zone = 'MOVIE',
        hourlyIncome = 50,
        checkpoint = vec3(-1180.83, -764.08, 17.33)
    },
    ['PONSON_ROCKF'] = {
        name = 'PONSON_ROCKF',
        label = 'Ponsonbys, Rockford Hills',
        banner = 'shopui_title_highendfashion',
        zone = 'ROCKF',
        hourlyIncome = 50,
        checkpoint = vec3(-700.60, -151.85, 37.42)
    },
    ['PONSON_MORN'] = {
        name = 'PONSON_MORN',
        label = 'Ponsonbys, Morningwood',
        banner = 'shopui_title_highendfashion',
        zone = 'MORN',
        hourlyIncome = 37,
        checkpoint = vec3(-1446.40, -246.05, 49.82)
    },
    ['PONSON_BURTON'] = {
        name = 'PONSON_BURTON',
        label = 'Ponsonbys, Burton',
        banner = 'shopui_title_highendfashion',
        zone = 'BURTON',
        hourlyIncome = 25,
        checkpoint = vec3(-170.50, -296.60, 39.73)
    },
    ['BINCO_VCANA'] = {
        name = 'BINCO_VCANA',
        label = 'Binco, Vespucci Canals',
        banner = 'shopui_title_lowendfashion2',
        zone = 'VCANA',
        hourlyIncome = 45,
        checkpoint = vec3(-822.83, -1069.55, 11.33)
    },
    ['BINCO_TEXTI'] = {
        name = 'BINCO_TEXTI',
        label = 'Binco, Textile City',
        banner = 'shopui_title_lowendfashion2',
        zone = 'TEXTI',
        hourlyIncome = 37,
        checkpoint = vec3(429.27, -807.85, 29.49)
    },
    ['BARBER_ROCKF'] = {
        name = 'BARBER_ROCKF',
        label = 'Bob Mulét, Rockford Hills',
        banner = 'shopui_title_highendsalon',
        zone = 'ROCKF',
        hourlyIncome = 80,
        checkpoint = vec3(-808.94, -180.04, 37.57)
    },
    ['BARBER_VESP'] = {
        name = 'BARBER_VESP',
        label = 'Beachcombover Barbers, Vespucci',
        banner = 'shopui_title_barber2',
        zone = 'VESP',
        hourlyIncome = 40,
        checkpoint = vec3(-1278.78, -1119.22, 6.99)
    },
    ['BARBER_HAWICK'] = {
        name = 'BARBER_HAWICK',
        label = 'Hair on Hawick, Hawick',
        banner = 'shopui_title_barber4',
        zone = 'HAWICK',
        hourlyIncome = 35,
        checkpoint = vec3(-36.33, -155.71, 57.08)
    },
    ['BARBER_DAVIS'] = {
        name = 'BARBER_DAVIS',
        label = 'Herr Kutz Barber, Davis',
        banner = 'shopui_title_barber',
        zone = 'DAVIS',
        hourlyIncome = 32,
        checkpoint = vec3(141.14, -1706.17, 29.29)
    },
    ['BARBER_MIRR'] = {
        name = 'BARBER_MIRR',
        label = 'Herr Kutz Barber, Mirror Park',
        banner = 'shopui_title_barber',
        zone = 'MIRR',
        hourlyIncome = 28,
        checkpoint = vec3(1215.86, -475.74, 66.21)
    },
    ['BARBER_PALETO'] = {
        name = 'BARBER_PALETO',
        label = 'Herr Kutz Barber, Paleto Bay',
        banner = 'shopui_title_barber',
        zone = 'PALETO',
        hourlyIncome = 9,
        checkpoint = vec3(-276.55, 6223.67, 31.70)
    },
    ['BARBER_SANDY'] = {
        name = 'BARBER_SANDY',
        label = 'O\'Sheas Barbers, Sandy Shores',
        banner = 'shopui_title_barber3',
        zone = 'SANDY',
        hourlyIncome = 8,
        checkpoint = vec3(1931.28, 3735.05, 32.84)
    },
    ['TATTOO_DTVINE'] = {
        name = 'TATTOO_DTVINE',
        label = 'Blazing Tattoo, Downtown Vinewood',
        banner = 'shopui_title_tattoos',
        zone = 'DTVINE',
        hourlyIncome = 23,
        checkpoint = vec3(320.78, 183.50, 103.59)
    },
    ['TATTOO_VCANA'] = {
        name = 'TATTOO_VCANA',
        label = 'The Pit, Vespucci Canals',
        banner = 'shopui_title_tattoos3',
        zone = 'VCANA',
        hourlyIncome = 20,
        checkpoint = vec3(-1150.63, -1426.09, 4.95)
    },
    ['TATTOO_EBURO'] = {
        name = 'TATTOO_EBURO',
        label = 'Los Santos Tattoos, El Burro Heights',
        banner = 'shopui_title_tattoos4',
        zone = 'EBURO',
        hourlyIncome = 18,
        checkpoint = vec3(1326.30, -1652.38, 52.28)
    },
    ['TATTOO_SANDY'] = {
        name = 'TATTOO_SANDY',
        label = 'Tattoo Body Art & Piercing, Sandy Shores',
        banner = 'shopui_title_tattoos2',
        zone = 'SANDY',
        hourlyIncome = 7,
        checkpoint = vec3(1865.21, 3749.04, 33.05)
    }
}

-- All gang zones used by the script
-- You can add as many zones as you want
-- Please check out our guide on how to add more gang zones
Config.GangZones = {}

Config.GangZones['ROCKF'] = {
    name = 'ROCKF',
    label = 'Rockford Hills',
    neighbors = {
        'MORN',
        'WVINE',
        'MOVIE',
        'KOREAT',
        'BURTON'
    },
    parts = {
        { x1 = -1379.12, y1 = -257.26, x2 = -1299.88, y2 = -38.12 },
        { x1 = -920.61, y1 = -465.30, x2 = -521.31, y2 = -407.48 },
        { x1 = -1299.5, y1 = -407.3, x2 = -550.21, y2 = -126.82 },
        { x1 = -1299.55, y1 = -126.82, x2 = -743.39, y2 = 445.02 },
        { x1 = -743.39, y1 = -126.82, x2 = -594.91, y2 = 13.48 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 1.3
    }
}
Config.GangZones['MORN'] = {
    name = 'MORN',
    label = 'Morningwood',
    neighbors = {
        'ROCKF',
        'MOVIE'
    },
    parts = {
        { x1 = -1635.47, y1 = -500.0, x2 = -1379.12, y2 = -107.29 },
        { x1 = -1379.12, y1 = -511.5, x2 = -1299.88, y2 = -257.26 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 1.0
    }
}
Config.GangZones['MOVIE'] = {
    name = 'MOVIE',
    label = 'Richards Majestic',
    neighbors = {
        'MORN',
        'KOREAT',
        'ROCKF',
        'VCANA'
    },
    parts = {
        { x1 = -1380.23, y1 = -849.50, x2 = -1172.24, y2 = -511.48 },
        { x1 = -1172.24, y1 = -576.61, x2 = -1072.88, y2 = -543.51 },
        { x1 = -1172.24, y1 = -722.8, x2 = -1127.62, y2 = -576.61 },
        { x1 = -1172.24, y1 = -543.51, x2 = -998.41, y2 = -511.48 },
        { x1 = -1299.88, y1 = -511.48, x2 = -920.5, y2 = -407.23 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.3,
        CATEGORY_MED = 0.3,
        CATEGORY_HIGH = 1.0
    }
}
Config.GangZones['KOREAT'] = {
    name = 'KOREAT',
    label = 'Little Seoul',
    neighbors = {
        'ROCKF',
        'VCANA',
        'MOVIE',
        'STRAW',
        'PBOX'
    },
    parts = {
        { x1 = -1127.62, y1 = -723.01, x2 = -1072.88, y2 = -576.61 },
        { x1 = -1072.88, y1 = -723.01, x2 = -998.41, y2 = -543.51 },
        { x1 = -931.96, y1 = -849.49, x2 = -774.41, y2 = -723.01 },
        { x1 = -865.98, y1 = -907.78, x2 = -774.41, y2 = -849.49 },
        { x1 = -812.41, y1 = -1019.71, x2 = -774.41, y2 = -907.78 },
        { x1 = -998.41, y1 = -723.01, x2 = -403.51, y2 = -511.48 },
        { x1 = -920.61, y1 = -511.48, x2 = -521.31, y2 = -465.30 },
        { x1 = -573.84, y1 = -1425.40, x2 = -403.51, y2 = -1158.02 },
        { x1 = -774.41, y1 = -1158.02, x2 = -354.71, y2 = -723.01 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 1.0,
        CATEGORY_HIGH = 0.5
    }
}
Config.GangZones['MIRR'] = {
    name = 'MIRR',
    label = 'Mirror Park',
    neighbors = {
        'EAST_V',
        'LMESA'
    },
    parts = {
        { x1 = 869.70, y1 = -820.90, x2 = 1391.07, y2 = -282.32 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 0.15,
        CATEGORY_HIGH = 0.05
    }
}
Config.GangZones['LMESA'] = {
    name = 'LMESA',
    label = 'La Mesa',
    neighbors = {
        'MIRR',
        'TEXTI',
        'SKID',
        'RANCHO',
        'CYPRE',
        'EBURO'
    },
    parts = {
        { x1 = 921.45, y1 = -1901.45, x2 = 1118.89, y2 = -1708.33 },
        { x1 = 505.03, y1 = -1158.02, x2 = 934.14, y2 = -1006.57 },
        { x1 = 618.7, y1 = -1708.33, x2 = 1118.89, y2 = -1158.02 },
        { x1 = 505.03, y1 = -1006.57, x2 = 888.46, y2 = -820.90 },
        { x1 = 505.03, y1 = -820.90, x2 = 869.70, y2 = -510.0 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.5,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 0.2
    }
}
Config.GangZones['STRAW'] = {
    name = 'STRAW',
    label = 'Strawberry',
    neighbors = {
        'KOREAT',
        'PBOX',
        'SKID',
        'RANCHO',
        'DAVIS',
        'CHAMH'
    },
    parts = {
        { x1 = -63.92, y1 = -1700.53, x2 = 91.27, y2 = -1425.40 },
        { x1 = -403.51, y1 = -1425.40, x2 = 359.48, y2 = -1158.02 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.7,
        CATEGORY_MED = 1.0,
        CATEGORY_HIGH = 0.3
    }
}
Config.GangZones['RANCHO'] = {
    name = 'RANCHO',
    label = 'Rancho',
    neighbors = {
        'STRAW',
        'CYPRE',
        'SKID',
        'LMESA',
        'DAVIS'
    },
    parts = {
        { x1 = 359.48, y1 = -1761.99, x2 = 618.43, y2 = -1158.02 },
        { x1 = 271.51, y1 = -1761.99, x2 = 359.48, y2 = -1613.16 },
        { x1 = 222.40, y1 = -2022.57, x2 = 505.03, y2 = -1761.99 },
        { x1 = 123.73, y1 = -2168.95, x2 = 505.03, y2 = -2022.57 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.8,
        CATEGORY_MED = 0.9,
        CATEGORY_HIGH = 0.25
    }
}
Config.GangZones['CHAMH'] = {
    name = 'CHAMH',
    label = 'Chamberlain Hills',
    neighbors = {
        'STRAW',
        'DAVIS'
    },
    parts = {
        { x1 = -283.92, y1 = -1761.99, x2 = -63.92, y2 = -1425.40 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.9,
        CATEGORY_MED = 1.2,
        CATEGORY_HIGH = 0.2
    }
}
Config.GangZones['DAVIS'] = {
    name = 'DAVIS',
    label = 'Davis',
    neighbors = {
        'STRAW',
        'RANCHO',
        'CHAHM'
    },
    parts = {
        { x1 = -63.92, y1 = -1761.99, x2 = 271.51, y2 = -1700.53 },
        { x1 = 91.27, y1 = -1700.53, x2 = 271.51, y2 = -1613.16 },
        { x1 = 91.27, y1 = -1613.16, x2 = 359.48, y2 = -1425.40 },
        { x1 = -139.74, y1 = -2022.57, x2 = -9.70, y2 = -1761.99 },
        { x1 = -9.70, y1 = -2022.57, x2 = 115.40, y2 = -1761.99 },
        { x1 = 115.40, y1 = -2022.57, x2 = 222.40, y2 = -1761.99 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.8,
        CATEGORY_MED = 1.0,
        CATEGORY_HIGH = 0.4
    }
}
Config.GangZones['PBOX'] = {
    name = 'PBOX',
    label = 'Pillbox Hill',
    neighbors = {
        'TEXTI',
        'SKID',
        'KOREAT',
        'STRAW'
    },
    parts = {
        { x1 = -276.21, y1 = -722.91, x2 = 285.43, y2 = -573.01 },
        { x1 = -354.71, y1 = -1158.02, x2 = 119.43, y2 = -722.91 },
        { x1 = 199.43, y1 = -877.91, x2 = 285.43, y2 = -722.91 },
        { x1 = 119.43, y1 = -1158.02, x2 = 199.43, y2 = -722.91 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.8,
        CATEGORY_MED = 0.8,
        CATEGORY_HIGH = 1.1
    }
}
Config.GangZones['TEXTI'] = {
    name = 'TEXTI',
    label = 'Textile City',
    neighbors = {
        'LMESA',
        'PBOX',
        'SKID'
    },
    parts = {
        { x1 = 285.43, y1 = -877.91, x2 = 505.03, y2 = -510.0 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.9,
        CATEGORY_MED = 0.7,
        CATEGORY_HIGH = 0.5
    }
}
Config.GangZones['SKID'] = {
    name = 'SKID',
    label = 'Mission Row',
    neighbors = {
        'LMESA',
        'PBOX',
        'TEXTI',
        'RANCHO',
        'STRAW'
    },
    parts = {
        { x1 = 199.43, y1 = -1158.02, x2 = 505.03, y2 = -877.91 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.2,
        CATEGORY_MED = 1.2,
        CATEGORY_HIGH = 1.2
    }
}
Config.GangZones['DTVINE'] = {
    name = 'DTVINE',
    label = 'Downtown Vinewood',
    neighbors = {
        'WVINE',
        'HAWICK',
        'ALTA',
        'EAST_V'
    },
    parts = {
        { x1 = 48.53, y1 = -20.78, x2 = 695.87, y2 = 445.02 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 0.85,
        CATEGORY_HIGH = 1.2
    }
}
Config.GangZones['WVINE'] = {
    name = 'WVINE',
    label = 'West Vinewood',
    neighbors = {
        'BURTON',
        'ROCKF',
        'DTVINE',
        'HAWICK'
    },
    parts = {
        { x1 = -743.39, y1 = 13.47, x2 = 48.53, y2 = 445.02 },
        { x1 = -246.39, y1 = -20.78, x2 = 48.53, y2 = 13.48 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.85,
        CATEGORY_MED = 1.0,
        CATEGORY_HIGH = 1.2
    }
}
Config.GangZones['BURTON'] = {
    name = 'BURTON',
    label = 'Burton',
    neighbors = {
        'WVINE',
        'HAWICK',
        'ALTA',
        'ROCKF'
    },
    parts = {
        { x1 = -594.91, y1 = -126.82, x2 = -246.39, y2 = 13.48 },
        { x1 = -550.21, y1 = -310.80, x2 = -246.39, y2 = -126.82 },
        { x1 = -246.39, y1 = -378.61, x2 = -90.0, y2 = -20.78 },
        { x1 = -246.39, y1 = -452.98, x2 = -90.0, y2 = -378.61 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.8,
        CATEGORY_MED = 0.8,
        CATEGORY_HIGH = 0.7
    }
}
Config.GangZones['VCANA'] = {
    name = 'VCANA',
    label = 'Vespucci Canals',
    neighbors = {
        'MORN',
        'MOVIE',
        'KOREAT',
        'VESP'
    },
    parts = {
        { x1 = -1319.77, y1 = -1074.78, x2 = -1095.41, y2 = -960.49 },
        { x1 = -1272.77, y1 = -960.49, x2 = -1095.41, y2 = -849.49 },
        { x1 = -1250.79, y1 = -1174.30, x2 = -1095.41, y2 = -1074.78 },
        { x1 = -1249.24, y1 = -1237.30, x2 = -1095.41, y2 = -1174.30 },
        { x1 = -1232.34, y1 = -1287.02, x2 = -1095.41, y2 = -1237.30 },
        { x1 = -1202.04, y1 = -1389.87, x2 = -1095.41, y2 = -1287.02 },
        { x1 = -1182.04, y1 = -1450.40, x2 = -1095.41, y2 = -1389.87 },
        { x1 = -1095.41, y1 = -1214.40, x2 = -774.41, y2 = -1019.71 },
        { x1 = -1095.41, y1 = -1019.71, x2 = -812.41, y2 = -907.78 },
        { x1 = -1095.41, y1 = -907.78, x2 = -865.98, y2 = -849.49 },
        { x1 = -1172.0, y1 = -849.49, x2 = -931.96, y2 = -723.01 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.2,
        CATEGORY_MED = 0.4,
        CATEGORY_HIGH = 0.8
    }
}
Config.GangZones['ALTA'] = {
    name = 'ALTA',
    label = 'Alta',
    neighbors = {
        'BURTON',
        'DTVINE',
        'EAST_V',
        'HAWICK'
    },
    parts = {
        { x1 = -90.0, y1 = -480.90, x2 = 695.99, y2 = -177.0 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 1.0,
        CATEGORY_HIGH = 1.0
    }
}
Config.GangZones['EBURO'] = {
    name = 'EBURO',
    label = 'El Burro Heights',
    neighbors = {
        'LMESA'
    },
    parts = {
        { x1 = 1118.89, y1 = -1901.45, x2 = 1485.92, y2 = -1391.50 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.5,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 0.3
    }
}
Config.GangZones['CYPRE'] = {
    name = 'CYPRE',
    label = 'Cypress Flats',
    neighbors = {
        'RANCHO',
        'LMESA'
    },
    parts = {
        { x1 = 618.7, y1 = -2718.48, x2 = 921.45, y2 = -1708.33 },
        { x1 = 921.45, y1 = -2718.48, x2 = 1048.54, y2 = -1901.45 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.5,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 0.2
    }
}
Config.GangZones['VESP'] = {
    name = 'VESP',
    label = 'Vespucci',
    neighbors = {
        'VCANA'
    },
    parts = {
        { x1 = -1450.59, y1 = -1287.02, x2 = -1232.34, y2 = -1237.30 },
        { x1 = -1450.59, y1 = -1237.30, x2 = -1249.24, y2 = -1174.30 },
        { x1 = -1450.59, y1 = -1174.30, x2 = -1250.79, y2 = -1074.78 },
        { x1 = -1450.59, y1 = -1389.87, x2 = -1202.04, y2 = -1287.02 },
        { x1 = -1450.59, y1 = -1600.40, x2 = -1182.04, y2 = -1389.87 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 0.75
    }
}
Config.GangZones['HAWICK'] = {
    name = 'HAWICK',
    label = 'Hawick',
    neighbors = {
        'EAST_V',
        'ALTA',
        'DTVINE',
        'BURTON',
        'WVINE'
    },
    parts = {
        { x1 = -90.0, y1 = -177.0, x2 = 695.87, y2 = -20.78 },
    },
    drugPreference = {
        CATEGORY_LOW = 1.0,
        CATEGORY_MED = 1.0,
        CATEGORY_HIGH = 0.9
    }
}
Config.GangZones['EAST_V'] = {
    name = 'EAST_V',
    label = 'East Vinewood',
    neighbors = {
        'HAWICK',
        'DTVINE',
        'ALTA'
    },
    parts = {
        { x1 = 696.0, y1 = -282.5, x2 = 1391.0, y2 = -35.97 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.5,
        CATEGORY_MED = 0.5,
        CATEGORY_HIGH = 0.6
    }
}
Config.GangZones['GRAPES'] = {
    name = 'GRAPES',
    label = 'Grapeseed',
    neighbors = {
        'SANDY'
    },
    parts = {
        { x1 = 1605.27, y1 = 4543.62, x2 = 2413.98, y2 = 5269.38 },
        { x1 = 2413.98, y1 = 5138.80, x2 = 2498.52, y2 = 5269.38 },
        { x1 = 2413.98, y1 = 4778.17, x2 = 2561.79, y2 = 5138.80 },
        { x1 = 2413.98, y1 = 4417.53, x2 = 2632.58, y2 = 4778.17 },
        { x1 = 2413.98, y1 = 4036.53, x2 = 2734.72, y2 = 4417.53 },
        { x1 = 1605.27, y1 = 4820.46, x2 = 1648.42, y2 = 4931.77 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.3,
        CATEGORY_MED = 0.3,
        CATEGORY_HIGH = 0.2
    }
}
Config.GangZones['SANDY'] = {
    name = 'SANDY',
    label = 'Sandy Shores',
    neighbors = {
        'GRAPES'
    },
    parts = {
        { x1 = 1295.66, y1 = 3455.35, x2 = 2145.09, y2 = 4012.51 },
        { x1 = 2413.98, y1 = 3554.05, x2 = 2807.76, y2 = 4036.53 },
        { x1 = 2145.09, y1 = 3554.05, x2 = 2413.98, y2 = 3819.50 },
        { x1 = 2145.09, y1 = 3294.46, x2 = 2693.05, y2 = 3554.05 },
        { x1 = 2083.31, y1 = 3925.83, x2 = 2145.09, y2 = 3954.88 },
        { x1 = 2057.38, y1 = 3954.88, x2 = 2145.09, y2 = 4012.50 },
        { x1 = 1990.20, y1 = 3973.64, x2 = 2057.38, y2 = 4012.51 },
        { x1 = 1976.69, y1 = 3981.51, x2 = 1990.20, y2 = 3995.50 },
        { x1 = 1752.23, y1 = 3995.50, x2 = 1990.20, y2 = 4012.50 },
        { x1 = 1691.23, y1 = 3983.57, x2 = 1752.23, y2 = 4012.50 },
        { x1 = 1691.23, y1 = 3967.40, x2 = 1713.04, y2 = 3983.58 },
        { x1 = 1446.97, y1 = 3954.97, x2 = 1691.23, y2 = 4012.50 },
        { x1 = 1446.97, y1 = 3930.21, x2 = 1683.75, y2 = 3954.97 },
        { x1 = 1446.97, y1 = 3888.02, x2 = 1508.13, y2 = 3930.21 },
        { x1 = 1508.13, y1 = 3888.02, x2 = 1540.87, y2 = 3904.46 },
        { x1 = 1532.13, y1 = 3856.76, x2 = 1584.82, y2 = 3888.02 },
        { x1 = 1446.97, y1 = 3819.74, x2 = 1532.13, y2 = 3888.02 },
        { x1 = 1295.66, y1 = 3888.02, x2 = 1446.97, y2 = 4012.51 },
        { x1 = 1295.66, y1 = 3812.33, x2 = 1388.96, y2 = 3888.02 },
        { x1 = 1295.66, y1 = 3741.06, x2 = 1356.98, y2 = 3812.33 },
        { x1 = 1295.66, y1 = 3713.35, x2 = 1325.48, y2 = 3741.06 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.4,
        CATEGORY_MED = 0.4,
        CATEGORY_HIGH = 0.1
    }
}
Config.GangZones['PALETO'] = {
    name = 'PALETO',
    label = 'Paleto Bay',
    neighbors = {},
    parts = {
        { x1 = -333.95, y1 = 6006.86, x2 = -188.97, y2 = 6147.87 },
        { x1 = -282.23, y1 = 6147.87, x2 = -137.25, y2 = 6288.88 },
        { x1 = -137.25, y1 = 6195.79, x2 = 7.74, y2 = 6336.80 },
        { x1 = -59.31, y1 = 6336.80, x2 = 66.28, y2 = 6452.00 },
        { x1 = 66.28, y1 = 6409.34, x2 = 211.26, y2 = 6518.35 },
        { x1 = 110.86, y1 = 6518.35, x2 = 516.84, y2 = 6614.36 },
        { x1 = -680.83, y1 = 6147.87, x2 = -282.23, y2 = 6288.88 },
        { x1 = -598.05, y1 = 6288.88, x2 = -137.25, y2 = 6477.81 },
        { x1 = 66.28, y1 = 6518.35, x2 = 110.86, y2 = 6614.36 },
        { x1 = -357.76, y1 = 6477.81, x2 = 66.28, y2 = 6614.36 },
        { x1 = 10.82, y1 = 6614.36, x2 = 133.50, y2 = 7165.53 },
        { x1 = -188.97, y1 = 6006.86, x2 = -39.51, y2 = 6147.87 },
        { x1 = -137.25, y1 = 6147.87, x2 = -39.51, y2 = 6195.79 },
        { x1 = 7.74, y1 = 6195.79, x2 = 66.28, y2 = 6336.80 },
        { x1 = -137.25, y1 = 6336.80, x2 = -59.31, y2 = 6477.81 },
        { x1 = -59.31, y1 = 6452.00, x2 = 66.28, y2 = 6477.81 },
        { x1 = -481.00, y1 = 6006.37, x2 = -333.95, y2 = 6147.87 },
        { x1 = -112.83, y1 = 6614.36, x2 = 10.82, y2 = 6786.93 },
        { x1 = -202.03, y1 = 6614.36, x2 = -112.83, y2 = 6703.23 },
        { x1 = -164.47, y1 = 6703.23, x2 = -112.83, y2 = 6744.03 },
        { x1 = 133.50, y1 = 6614.36, x2 = 465.00, y2 = 6785.33 },
        { x1 = 133.50, y1 = 6785.33, x2 = 387.30, y2 = 6900.54 },
        { x1 = 133.50, y1 = 6900.54, x2 = 284.08, y2 = 6996.90 },
        { x1 = 133.50, y1 = 6996.90, x2 = 224.78, y2 = 7065.80 },
        { x1 = 465.00, y1 = 6705.98, x2 = 617.57, y2 = 6745.77 },
        { x1 = 387.30, y1 = 6785.33, x2 = 473.72, y2 = 6840.19 },
        { x1 = 284.08, y1 = 6900.54, x2 = 386.59, y2 = 6949.75 },
        { x1 = 133.50, y1 = 7065.80, x2 = 193.80, y2 = 7165.53 },
        { x1 = 224.78, y1 = 6996.90, x2 = 277.79, y2 = 7065.80 },
        { x1 = 284.08, y1 = 6949.75, x2 = 332.08, y2 = 6996.90 },
        { x1 = 387.30, y1 = 6840.19, x2 = 430.30, y2 = 6900.54 },
        { x1 = 465.00, y1 = 6745.77, x2 = 541.00, y2 = 6785.33 },
        { x1 = 465.00, y1 = 6614.36, x2 = 617.57, y2 = 6705.98 },
        { x1 = -43.31, y1 = 6882.58, x2 = 10.82, y2 = 7165.53 },
        { x1 = -103.31, y1 = 6786.93, x2 = 10.82, y2 = 6882.58 },
        { x1 = -234.25, y1 = 6006.86, x2 = -188.97, y2 = 6046.44 },
        { x1 = -61.55, y1 = 6006.86, x2 = -39.51, y2 = 6025.03 },
        { x1 = -165.24, y1 = 6006.86, x2 = -149.20, y2 = 6021.46 },
        { x1 = -58.57, y1 = 6115.46, x2 = -39.51, y2 = 6147.87 },
        { x1 = -117.17, y1 = 6056.50, x2 = -39.51, y2 = 6115.46 },
        { x1 = -108.56, y1 = 6006.86, x2 = -88.03, y2 = 6017.70 },
        { x1 = -128.49, y1 = 6020.11, x2 = -93.62, y2 = 6045.88 },
    },
    drugPreference = {
        CATEGORY_LOW = 0.2,
        CATEGORY_MED = 0.2,
        CATEGORY_HIGH = 0.1
    }
}

-- This does not need to be edited as it's complete
Config.ZoneNames = {
    ['AIRP'] = 'Los Santos International Airport',
    ['ALAMO'] = 'Alamo Sea',
    ['ALTA'] = 'Alta',
    ['ARMYB'] = 'Fort Zancudo',
    ['BANHAMC'] = 'Banham Canyon Drive',
    ['BANNING'] = 'Banning',
    ['BEACH'] = 'Vespucci Beach',
    ['BHAMCA'] = 'Banham Canyon',
    ['BRADP'] = 'Braddock Pass',
    ['BRADT'] = 'Braddock Tunnel',
    ['BURTON'] = 'Burton',
    ['CALAFB'] = 'Calafia Bridge',
    ['CANNY'] = 'Raton Canyon',
    ['CCREAK'] = 'Cassidy Creek',
    ['CHAMH'] = 'Chamberlain Hills',
    ['CHIL'] = 'Vinewood Hills',
    ['CHU'] = 'Chumash',
    ['CMSW'] = 'Chiliad Mountain State Wilderness',
    ['CYPRE'] = 'Cypress Flats',
    ['DAVIS'] = 'Davis',
    ['DELBE'] = 'Del Perro Beach',
    ['DELPE'] = 'Del Perro',
    ['DESRT'] = 'Grand Senora Desert',
    ['DOWNT'] = 'Downtown',
    ['DTVINE'] = 'Downtown Vinewood',
    ['EAST_V'] = 'East Vinewood',
    ['EBURO'] = 'El Burro Heights',
    ['ELGORL'] = 'El Gordo Lighthouse',
    ['ELYSIAN'] = 'Elysian Island',
    ['GALFISH'] = 'Galilee',
    ['GOLF'] = 'GWC and Golfing Society',
    ['GRAPES'] = 'Grapeseed',
    ['GREATC'] = 'Great Chaparral',
    ['HARMO'] = 'Harmony',
    ['HAWICK'] = 'Hawick',
    ['HORS'] = 'Vinewood Racetrack',
    ['HUMLAB'] = 'Humane Labs and Research',
    ['JAIL'] = 'Bolingbroke Penitentiary',
    ['KOREAT'] = 'Little Seoul',
    ['LACT'] = 'Land Act Reservoir',
    ['LAGO'] = 'Lago Zancudo',
    ['LDAM'] = 'Land Act Dam',
    ['LEGSQU'] = 'Legion Square',
    ['LMESA'] = 'La Mesa',
    ['LOSPUER'] = 'La Puerta',
    ['MIRR'] = 'Mirror Park',
    ['MORN'] = 'Morningwood',
    ['MOVIE'] = 'Richards Majestic',
    ['MTCHIL'] = 'Mount Chiliad',
    ['MTGORDO'] = 'Mount Gordo',
    ['MTJOSE'] = 'Mount Josiah',
    ['MURRI'] = 'Murrieta Heights',
    ['NCHU'] = 'North Chumash',
    ['NOOSE'] = 'N.O.O.S.E',
    ['OBSERV'] = 'Galileo Observatory',
    ['OCEANA'] = 'Pacific Ocean',
    ['PALCOV'] = 'Paleto Cove',
    ['PALETO'] = 'Paleto Bay',
    ['PALFOR'] = 'Paleto Forest',
    ['PALHIGH'] = 'Palomino Highlands',
    ['PALMPOW'] = 'Palmer-Taylor Power Station',
    ['PBLUFF'] = 'Pacific Bluffs',
    ['PBOX'] = 'Pillbox Hill',
    ['PROCOB'] = 'Procopio Beach',
    ['RANCHO'] = 'Rancho',
    ['RGLEN'] = 'Richman Glen',
    ['RICHM'] = 'Richman',
    ['ROCKF'] = 'Rockford Hills',
    ['RTRAK'] = 'Redwood Lights Track',
    ['SANCHIA'] = 'San Chianski Mountain Range',
    ['SANDY'] = 'Sandy Shores',
    ['SKID'] = 'Mission Row',
    ['SLAB'] = 'Stab City',
    ['STAD'] = 'Maze Bank Arena',
    ['STRAW'] = 'Strawberry',
    ['TATAMO'] = 'Tataviam Mountains',
    ['TERMINA'] = 'Terminal',
    ['TEXTI'] = 'Textile City',
    ['TONGVAH'] = 'Tongva Hills',
    ['TONGVAV'] = 'Tongva Valley',
    ['VCANA'] = 'Vespucci Canals',
    ['VESP'] = 'Vespucci',
    ['VINE'] = 'Vinewood',
    ['WINDF'] = 'RON Alternates Wind Farm',
    ['WVINE'] = 'West Vinewood',
    ['ZANCUDO'] = 'Zancudo River',
    ['ZQ_UAR'] = 'Davis Quartz'
}

-- This does not need to be edited as it's complete
Config.VehicleClasses = {
    [0] = 'Compacts',
    [1] = 'Sedans',
    [2] = 'SUVs',
    [3] = 'Coupes',
    [4] = 'Muscle',
    [5] = 'Sports Classics',
    [6] = 'Sports',
    [7] = 'Super',
    [8] = 'Motorcycles',
    [9] = 'Off-road',
    [10] = 'Industrial',
    [11] = 'Utility',
    [12] = 'Vans',
    [13] = 'Cycles',
    [14] = 'Boats',
    [15] = 'Helicopters',
    [16] = 'Planes',
    [17] = 'Service',
    [18] = 'Emergency',
    [19] = 'Military',
    [20] = 'Commercial',
    [21] = 'Trains',
}

-- This does not need to be edited as it's complete
Config.VehicleColors = {
    black = {
        { index = 0, label = 'Black' },
        { index = 1, label = 'Graphite' },
        { index = 2, label = 'Black Metallic' },
        { index = 3, label = 'Cast Steel' },
        { index = 11, label = 'Black Anthracite' },
        { index = 12, label = 'Matte Black' },
        { index = 15, label = 'Dark Night' },
        { index = 16, label = 'Deep Black' },
        { index = 21, label = 'Oil' },
        { index = 147, label = 'Carbon' }
    },
    white = {
        { index = 106, label = 'Vanilla' },
        { index = 107, label = 'Creme' },
        { index = 111, label = 'White' },
        { index = 112, label = 'Polar White' },
        { index = 113, label = 'Beige' },
        { index = 121, label = 'Matte White' },
        { index = 122, label = 'Snow' },
        { index = 131, label = 'Cotton' },
        { index = 132, label = 'Alabaster' },
        { index = 134, label = 'Pure White' }
    },
    grey = {
        { index = 4, label = 'Silver' },
        { index = 5, label = 'Metallic Grey' },
        { index = 6, label = 'Laminated Steel' },
        { index = 7, label = 'Dark Grey' },
        { index = 8, label = 'Rocky Grey' },
        { index = 9, label = 'Grey Night' },
        { index = 10, label = 'Aluminum' },
        { index = 13, label = 'Matte Grey' },
        { index = 14, label = 'Light Grey' },
        { index = 17, label = 'Asphalt Grey' },
        { index = 18, label = 'Concrete Grey' },
        { index = 19, label = 'Dark Silver' },
        { index = 20, label = 'Magnesite' },
        { index = 22, label = 'Nickel' },
        { index = 23, label = 'Zinc' },
        { index = 24, label = 'Dolomite' },
        { index = 25, label = 'Blue Silver' },
        { index = 26, label = 'Titanium' },
        { index = 66, label = 'Steel Blue' },
        { index = 93, label = 'Champagne' },
        { index = 144, label = 'Hunter Grey' },
        { index = 156, label = 'Grey' }
    },
    red = {
        { index = 27, label = 'Red' },
        { index = 28, label = 'Torino Red' },
        { index = 29, label = 'Poppy' },
        { index = 30, label = 'Copper Red' },
        { index = 31, label = 'Cardinal' },
        { index = 32, label = 'Brick' },
        { index = 33, label = 'Garnet' },
        { index = 34, label = 'Cabernet' },
        { index = 35, label = 'Candy' },
        { index = 39, label = 'Matte Red' },
        { index = 40, label = 'Dark Red' },
        { index = 43, label = 'Red Pupl'},
        { index = 44, label = 'Brilliant Red' },
        { index = 46, label = 'Pale Red' },
        { index = 143, label = 'Wine Red' },
        { index = 150, label = 'Volcano' }
    },
    blue = {
        { index = 54, label = 'Topac' },
        { index = 60, label = 'Light Blue' },
        { index = 61, label = 'Galaxy Blue' },
        { index = 62, label = 'Dark Blue' },
        { index = 63, label = 'Azure' },
        { index = 64, label = 'Navy Blue' },
        { index = 65, label = 'Lapis' },
        { index = 67, label = 'Blue Diamond' },
        { index = 68, label = 'Surfer' },
        { index = 69, label = 'Pastel Blue' },
        { index = 70, label = 'Celeste Blue' },
        { index = 73, label = 'Rally Blue' },
        { index = 74, label = 'Blue Paradise' },
        { index = 75, label = 'Blue Night' },
        { index = 77, label = 'Cyan Blue' },
        { index = 78, label = 'Cobalt' },
        { index = 79, label = 'Eletric Blue' },
        { index = 80, label = 'Horizon Blue' },
        { index = 82, label = 'Metallic Blue' },
        { index = 83, label = 'Aquamarine' },
        { index = 84, label = 'Blue Agathe' },
        { index = 85, label = 'Zirconium' },
        { index = 86, label = 'Spinel' },
        { index = 87, label = 'Tourmaline' },
        { index = 127, label = 'Paradise' },
        { index = 140, label = 'Bubble Gum' },
        { index = 141, label = 'Midnight Blue' },
        { index = 146, label = 'Forbidden Blue' },
        { index = 157, label = 'Glacier Blue' }
    },
    yellow = {
        { index = 42, label = 'Yellow' },
        { index = 88, label = 'Wheat' },
        { index = 89, label = 'Race Yellow' },
        { index = 91, label = 'Pale Yellow' },
        { index = 126, label = 'Light Yellow' }
    },
    orange = {
        { index = 36, label = 'Tangerine' },
        { index = 38, label = 'Orange' },
        { index = 41, label = 'Matte Orange' },
        { index = 123, label = 'Light Orange' },
        { index = 124, label = 'Peach' },
        { index = 130, label = 'Pumpkin' },
        { index = 138, label = 'Orange Lambo' }
    },
    green = {
        { index = 49, label = 'Metallic Dark Green' },
        { index = 50, label = 'Rally Green' },
        { index = 51, label = 'Pine Green' },
        { index = 52, label = 'Olive Green' },
        { index = 53, label = 'Light Green' },
        { index = 55, label = 'Lime Green' },
        { index = 56, label = 'Forest Green' },
        { index = 57, label = 'Lawn Green' },
        { index = 58, label = 'Imperial Green' },
        { index = 59, label = 'Green Bottle' },
        { index = 92, label = 'Citrus Green' },
        { index = 125, label = 'Green Anis' },
        { index = 128, label = 'Khaki' },
        { index = 133, label = 'Army Green' },
        { index = 151, label = 'Dark Green' },
        { index = 152, label = 'Hunter Green' },
        { index = 155, label = 'Matte Foilage Green' }
    },
    purple = {
        { index = 71, label = 'Indigo' },
        { index = 72, label = 'Deep Purple' },
        { index = 76, label = 'Dark Violet' },
        { index = 81, label = 'Amethyst' },
        { index = 142, label = 'Mystical Violet' },
        { index = 145, label = 'Purple Metallic' },
        { index = 148, label = 'Matte Violet' },
        { index = 149, label = 'Matte Deep Purple' }
    },
    pink = {
        { index = 135, label = 'Electric Pink' },
        { index = 136, label = 'Salmon' },
        { index = 137, label = 'Sugar Plum' }
    },
    silver = {
        { index = 117, label = 'Brushed Chrome' },
        { index = 118, label = 'Black Chrome' },
        { index = 119, label = 'Brushed Aluminum' },
        { index = 120, label = 'Chrome' }
    },
    gold = {
        { index = 37, label = 'Gold' },
        { index = 158, label = 'Pure Gold' },
        { index = 159, label = 'Brushed Gold' },
        { index = 160, label = 'Light Gold' }
    },
    brown = {
        { index = 45, label = 'Copper' },
        { index = 47, label = 'Light Brown' },
        { index = 48, label = 'Dark Brown' },
        { index = 90, label = 'Bronze' },
        { index = 94, label = 'Brown Metallic' },
        { index = 95, label = 'Espresso' },
        { index = 96, label = 'Chocolate' },
        { index = 97, label = 'Terracotta' },
        { index = 98, label = 'Marble' },
        { index = 99, label = 'Sand' },
        { index = 100, label = 'Sepia' },
        { index = 101, label = 'Bison' },
        { index = 102, label = 'Palm' },
        { index = 103, label = 'Caramel' },
        { index = 104, label = 'Rust' },
        { index = 105, label = 'Chestnut' },
        { index = 108, label = 'Brown' },
        { index = 109, label = 'Hazelnut' },
        { index = 110, label = 'Shell' },
        { index = 114, label = 'Mahogany' },
        { index = 115, label = 'Cauldron' },
        { index = 116, label = 'Blond' },
        { index = 129, label = 'Gravel' },
        { index = 153, label = 'Dark Earth' },
        { index = 154, label = 'Desert' }
    },
}

-- This does not need to be edited as it's complete
Config.VehicleColorClasses = {
    black  = 'Black',
    white  = 'White',
    grey   = 'Grey',
    red    = 'Red',
    blue   = 'Blue',
    yellow = 'Yellow',
    orange = 'Orange',
    green  = 'Green',
    purple = 'Purple',
    pink   = 'Pink',
    silver = 'Silver',
    gold   = 'Gold',
    brown  = 'Brown',
}

-- All available colors have been configured
Config.ColorToMapColor = {
    black       = 40,
    white       = 0,
    grey        = 39,
    red         = 1,
    redlight    = 35,
    reddark     = 76,
    blue        = 3,
    bluelight   = 32,
    bluedark    = 54,
    yellow      = 5,
    yellowlight = 33,
    yellowdark  = 56,
    orange      = 17,
    orangelight = 9,
    orangedark  = 21,
    green       = 2,
    greenlight  = 43,
    greendark   = 52,
    purple      = 50,
    purplelight = 13,
    purpledark  = 58,
    pink        = 8,
    silver      = 55,
    gold        = 46,
    brown       = 31,
}

-- All available colors have been configured
Config.ColorToTextColor = {
    black       = '~HUD_COLOUR_BLACK~',
    white       = '~HUD_COLOUR_WHITE~',
    grey        = '~HUD_COLOUR_GREY~',
    red         = '~HUD_COLOUR_RED~',
    redlight    = '~HUD_COLOUR_REDLIGHT~',
    reddark     = '~HUD_COLOUR_REDDARK~',
    blue        = '~HUD_COLOUR_BLUE~',
    bluelight   = '~HUD_COLOUR_BLUELIGHT~',
    bluedark    = '~HUD_COLOUR_BLUEDARK~',
    yellow      = '~HUD_COLOUR_YELLOW~',
    yellowlight = '~HUD_COLOUR_YELLOWLIGHT~',
    yellowdark  = '~HUD_COLOUR_YELLOWDARK~',
    orange      = '~HUD_COLOUR_ORANGE~',
    orangelight = '~HUD_COLOUR_ORANGELIGHT~',
    orangedark  = '~HUD_COLOUR_ORANGEDARK~',
    green       = '~HUD_COLOUR_GREEN~',
    greenlight  = '~HUD_COLOUR_GREENLIGHT~',
    greendark   = '~HUD_COLOUR_GREENDARK~',
    purple      = '~HUD_COLOUR_PURPLE~',
    purplelight = '~HUD_COLOUR_PURPLELIGHT~',
    purpledark  = '~HUD_COLOUR_PURPLEDARK~',
    pink        = '~HUD_COLOUR_PINK~',
    silver      = '~HUD_COLOUR_SILVER~',
    gold        = '~HUD_COLOUR_GOLD~',
    brown       = '~HUD_COLOUR_TREVOR_DARK~',
}

-- All available colors have been configured
Config.GangMenuColors = {
    black = {
        foreground = { 255, 255, 255 },
        background = { 0, 0, 0 },
    },
    white = {
        foreground = { 0, 0, 0 },
        background = { 255, 255, 255 },
    },
    grey = {
        foreground = { 0, 0, 0 },
        background = { 155, 155, 155 },
    },
    red = {
        foreground = { 0, 0, 0 },
        background = { 224, 50, 50 },
    },
    redlight = {
        foreground = { 0, 0, 0 },
        background = { 240, 153, 153 },
    },
    reddark = {
        foreground = { 0, 0, 0 },
        background = { 112, 25, 25 },
    },
    blue = {
        foreground = { 0, 0, 0 },
        background = { 93, 182, 229 },
    },
    bluelight = {
        foreground = { 0, 0, 0 },
        background = { 174, 219, 242 },
    },
    bluedark = {
        foreground = { 0, 0, 0 },
        background = { 47, 92, 115 },
    },
    yellow = {
        foreground = { 0, 0, 0 },
        background = { 240, 200, 80 },
    },
    yellowlight = {
        foreground = { 0, 0, 0 },
        background = { 254, 235, 169 },
    },
    yellowdark = {
        foreground = { 0, 0, 0 },
        background = { 126, 107, 41 },
    },
    orange = {
        foreground = { 0, 0, 0 },
        background = { 255, 133, 85 },
    },
    orangelight = {
        foreground = { 0, 0, 0 },
        background = { 255, 194, 170 },
    },
    orangedark = {
        foreground = { 0, 0, 0 },
        background = { 127, 66, 42 },
    },
    green = {
        foreground = { 0, 0, 0 },
        background = { 114, 204, 114 },
    },
    greenlight = {
        foreground = { 0, 0, 0 },
        background = { 185, 230, 185 },
    },
    greendark = {
        foreground = { 0, 0, 0 },
        background = { 57, 102, 57 },
    },
    purple = {
        foreground = { 0, 0, 0 },
        background = { 132, 102, 226 },
    },
    purplelight = {
        foreground = { 0, 0, 0 },
        background = { 192, 179, 239 },
    },
    purpledark = {
        foreground = { 0, 0, 0 },
        background = { 67, 57, 111 },
    },
    pink = {
        foreground = { 0, 0, 0 },
        background = { 203, 54, 148 },
    },
    silver = {
        foreground = { 0, 0, 0 },
        background = { 150, 153, 161 },
    },
    gold = {
        foreground = { 0, 0, 0 },
        background = { 214, 181, 99 },
    },
    brown = {
        foreground = { 0, 0, 0 },
        background = { 127, 81, 43 },
    },
}

-- All whitelisted vehicles for gang garage
-- To whitelist a vehicle, write its model name, followed by its price
Config.GarageVehicles = {
    -- In case you have addon vehicles which display as NULL in the garage menu put them in format shown below
    -- [`bugattiv`] = { label = 'Bugatti Veyron', price = 0 },
    [`asbo`] = 0,
    [`blista`] = 0,
    [`club`] = 0,
    [`dilettante`] = 0,
    [`kanjo`] = 0,
    [`issi2`] = 0,
    [`panto`] = 0,
    [`prairie`] = 0,
    [`rhapsody`] = 0,
    [`cogcabrio`] = 0,
    [`felon`] = 0,
    [`jackal`] = 0,
    [`oracle`] = 0,
    [`sentinel`] = 0,
    [`sentinel2`] = 0,
    [`zion`] = 0,
    [`previon`] = 0,
    [`bf400`] = 0,
    [`enduro`] = 0,
    [`manchez`] = 0,
    [`sanchez`] = 0,
    [`sanchez2`] = 0,
    [`blade`] = 0,
    [`buccaneer`] = 0,
    [`chino`] = 0,
    [`dominator`] = 0,
    [`dukes`] = 0,
    [`faction`] = 0,
    [`gauntlet`] = 0,
    [`gauntlet3`] = 0,
    [`hermes`] = 0,
    [`impaler`] = 0,
    [`imperator`] = 0,
    [`moonbeam`] = 0,
    [`phoenix`] = 0,
    [`picador`] = 0,
    [`ruiner`] = 0,
    [`sabregt`] = 0,
    [`slamvan`] = 0,
    [`stalion`] = 0,
    [`tampa`] = 0,
    [`tulip`] = 0,
    [`vamos`] = 0,
    [`vigero`] = 0,
    [`virgo`] = 0,
    [`voodoo`] = 0,
    [`yosemite`] = 0,
    [`hellion`] = 0,
    [`rancherxl`] = 0,
    [`sandking`] = 0,
    [`sandking2`] = 0,
    [`baller`] = 0,
    [`baller2`] = 0,
    [`bjxl`] = 0,
    [`cavalcade`] = 0,
    [`cavalcade2`] = 0,
    [`dubsta`] = 0,
    [`dubsta2`] = 0,
    [`fq2`] = 0,
    [`granger`] = 0,
    [`gresley`] = 0,
    [`habanero`] = 0,
    [`landstalker`] = 0,
    [`landstalker2`] = 0,
    [`mesa`] = 0,
    [`patriot`] = 0,
    [`radi`] = 0,
    [`rebla`] = 0,
    [`seminole`] = 0,
    [`serrano`] = 0,
    [`xls`] = 0,
    [`asterope`] = 0,
    [`emperor`] = 0,
    [`fugitive`] = 0,
    [`glendale`] = 0,
    [`ingot`] = 0,
    [`intruder`] = 0,
    [`premier`] = 0,
    [`primo`] = 0,
    [`regina`] = 0,
    [`stanier`] = 0,
    [`stratum`] = 0,
    [`tailgater`] = 0,
    [`tailgater2`] = 0,
    [`washington`] = 0,
    [`alpha`] = 0,
    [`blista2`] = 0,
    [`buffalo`] = 0,
    [`buffalo2`] = 0,
    [`comet2`] = 0,
    [`comet5`] = 0,
    [`comet6`] = 0,
    [`coquette`] = 0,
    [`drafter`] = 0,
    [`elegy`] = 0,
    [`elegy2`] = 0,
    [`feltzer2`] = 0,
    [`fusilade`] = 0,
    [`futo`] = 0,
    [`jugular`] = 0,
    [`jester`] = 0,
    [`khamelion`] = 0,
    [`kuruma`] = 0,
    [`lynx`] = 0,
    [`massacro`] = 0,
    [`ninef`] = 0,
    [`ninef2`] = 0,
    [`pariah`] = 0,
    [`penumbra`] = 0,
    [`penumbra2`] = 0,
    [`raiden`] = 0,
    [`rapidgt`] = 0,
    [`rapidgt2`] = 0,
    [`schafter2`] = 0,
    [`schafter3`] = 0,
    [`schwarzer`] = 0,
    [`specter`] = 0,
    [`sugoi`] = 0,
    [`sultan`] = 0,
    [`vstr`] = 0,
    [`jester4`] = 0,
    [`remus`] = 0,
    [`growler`] = 0,
    [`vectre`] = 0,
    [`cypher`] = 0,
    [`sultan3`] = 0,
    [`manana`] = 0,
    [`manana2`] = 0,
    [`peyote`] = 0,
    [`peyote3`] = 0,
    [`pigalle`] = 0,
    [`rapidgt3`] = 0,
    [`tornado`] = 0,
    [`tornado2`] = 0,
    [`tornado5`] = 0,
    [`bison`] = 0,
    [`burrito3`] = 0,
    [`minivan`] = 0,
    [`speedo`] = 0,
    [`youga`] = 0,
}