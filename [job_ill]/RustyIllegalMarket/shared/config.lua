Config = {}

Config.Core = {
    Core = 'QBCore',
    CoreFolder = 'qb-core',
    Target = 'qb-target', -- Don't touch 
    Menu = 'qb-menu', -- Don't touch
}

-----------------------------------------------
Config.GangWhitelist = false
Config.GangWhitelistedGangs = {
    -- 'ballers',
}

-----------------------------------------------

-----------------------------------------------
Config.CitizenIDWhitelist = false -- Only whitelisted CitizenIDs can access the blackmarket.
Config.CitizenIDS = { -- Put the whitelisted user(s) citizenid here.
    'AEO44102',
}
-----------------------------------------------


-----------------------------------------------
Config.DrugPed = vector4(705.7846069335938,-966.6197509765625,30.4088134765625,342.99212646484375)
Config.WeaponsPed = vector4(-597.31, 223.69, 74.15, 267.74)
Config.AmmoPed = vector4(-594.11, 219.45, 74.15, 9.34)
Config.GunPaintsPed = vector4(-593.25, 216.73, 74.15, 86.3)
Config.AttachmentsPed = vector4(-596.34, 217.0, 74.16, 88.62)
-----------------------------------------------             

Config.Melees = {
    label = "Melees",
    slots = 17,
    items = {
        [1] = {
            name = "weapon_dagger",
            price = 2500,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_bat",
            price = 300,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_bottle",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_crowbar",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_flashlight",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapon_golfclub",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "weapon_hammer",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "weapon_hatchet",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "weapon_knuckle",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "weapon_knife",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "weapon_machete",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "weapon_switchblade",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "weapon_nightstick",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "weapon_wrench",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "weapon_battleaxe",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 15,
        },
        [16] = {
            name = "weapon_poolcue",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 16,
        },
        [17] = {
            name = "weapon_stone_hatchet",
            price = 150,
            amount = 1,
            info = {},
            type = "item",
            slot = 17,
        },
    },
}

Config.Pistols = {
    label = "Handguns",
    slots = 12,
    items = {
        [1] = {
            name = "weapon_pistol",
            price = 125000,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_combatpistol",
            price = 130000,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_appistol",
            price = 150000,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_pistol50",
            price = 350000,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_snspistol",
            price = 100000,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapon_heavypistol",
            price = 250000,
            amount = 1,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "weapon_vintagepistol",
            price = 150000,
            amount = 1,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "weapon_flaregun",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "weapon_marksmanpistol",
            price = 150000,
            amount = 1,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "weapon_revolver_mk2",
            price = 250000,
            amount = 1,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "weapon_doubleaction",
            price = 250000,
            amount = 1,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "weapon_snspistol_mk2",
            price = 150000,
            amount = 1,
            info = {},
            type = "item",
            slot = 12,
        },
    },
}


Config.SMGS = {
    label = "SMGS",
    slots = 6,
    items = {
        [1] = {
            name = "weapon_microsmg",
            price = 1500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_smg",
            price = 1000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_smg_mk2",
            price = 1500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_assaultsmg",
            price = 1300000,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_combatpdw",
            price = 1450000,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapon_minismg",
            price = 2000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 6,
        },
    },
}

Config.Shotguns = {
    label = "Shotguns",
    slots = 9,
    items = {
        [1] = {
            name = "weapon_pumpshotgun",
            price = 1700000,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_sawnoffshotgun",
            price = 1300000,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_assaultshotgun",
            price = 1500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_bullpupshotgun",
            price = 1200000,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_heavyshotgun",
            price = 1500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapon_dbshotgun",
            price = 1500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "weapon_autoshotgun",
            price = 1800000,
            amount = 1,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "weapon_pumpshotgun_mk2",
            price = 1300000,
            amount = 1,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "weapon_combatshotgun",
            price = 1400000,
            amount = 1,
            info = {},
            type = "item",
            slot = 9,
        },
    },
}


Config.Assaultrifles = {
    label = "Assault Rifles",
    slots = 11,
    items = {
        [1] = {
            name = "weapon_assaultrifle",
            price = 2500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_assaultrifle_mk2",
            price = 2200000,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_carbinerifle",
            price = 2200000,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_carbinerifle_mk2",
            price = 3000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_advancedrifle",
            price = 3000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapon_specialcarbine",
            price = 3000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "weapon_bullpuprifle",
            price = 3000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "weapon_compactrifle",
            price = 3000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "weapon_specialcarbine_mk2",
            price = 3000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "weapon_bullpuprifle_mk2",
            price = 2200000,
            amount = 1,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "weapon_militaryrifle",
            price = 2200000,
            amount = 1,
            info = {},
            type = "item",
            slot = 11, 
        },



        [12] = {
            name = "WEAPON_PITVIPER",
            price = 2000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 12, 
        },
        [13] = {
            name = "WEAPON_XDME",
            price = 1500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 13, 
        },
        [14] = {
            name = "WEAPON_RUGER57",
            price = 1500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 14, 
        },
        [15] = {
            name = "WEAPON_P2011",
            price = 1500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 15, 
        },
        [16] = {
            name = "WEAPON_G26",
            price = 1600000,
            amount = 1,
            info = {},
            type = "item",
            slot = 16, 
        },
        [17] = {
            name = "WEAPON_GLOCK19S",
            price = 5500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 17, 
        },
        [18] = {
            name = "WEAPON_GLOCK17S",
            price = 5500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 18, 
        },
        [19] = {
            name = "WEAPON_GLOCKBEAMS",
            price = 6500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 19, 
        },
        [20] = {
            name = "WEAPON_BLUEGLOCKS",
            price = 6500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 20, 
        },
        [21] = {
            name = "WEAPON_MIDASGLOCK",
            price = 5500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 21, 
        },
        [22] = {
            name = "WEAPON_ILLGLOCK17",
            price = 5500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 23, 
        },
        [24] = {
            name = "WEAPON_GLOCK40",
            price = 500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 24, 
        },
        [25] = {
            name = "WEAPON_GLOCK40S",
            price = 4500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 25, 
        },
        [26] = {
            name = "WEAPON_GLOCK18C",
            price = 1500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 26, 
        },
        [27] = {
            name = "WEAPON_P30L",
            price = 5500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 27, 
        },
        [28] = {
            name = "WEAPON_GLOCK19S",
            price = 4500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 28, 
        },
        [29] = {
            name = "WEAPON_GLOCK26S",
            price = 3500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 29, 
        },
        [30] = {
            name = "WEAPON_TUZI",
            price = 4500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 30, 
        },

        [31] = {
            name = "WEAPON_ARPISTOL",
            price = 5500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 31, 
        },
        [32] = {
            name = "WEAPON_TEC9S",
            price = 1500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 32, 
        },
        [33] = {
            name = "WEAPON_MICRODRACO",
            price = 4000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 33, 
        },
        [34] = {
            name = "WEAPON_ZIPTIE",
            price = 4000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 34, 
        },
        [35] = {
            name = "WEAPON_P90",
            price = 3000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 35, 
        },
        [36] = {
            name = "WEAPON_BARP",
            price = 3000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 36, 
        },
        [37] = {
            name = "WEAPON_SP",
            price = 3000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 37, 
        },
        [38] = {
            name = "WEAPON_KRISSVECTOR",
            price = 3000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 38, 
        },
        [39] = {
            name = "WEAPON_REDM4A1",
            price = 4000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 39, 
        },
        [40] = {
            name = "WEAPON_REDARP",
            price = 4000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 40, 
        },
        [41] = {
            name = "WEAPON_BLACKARP",
            price = 4200000,
            amount = 1,
            info = {},
            type = "item",
            slot = 41, 
        },
        [42] = {
            name = "WEAPON_WOARP",
            price = 4100000,
            amount = 1,
            info = {},
            type = "item",
            slot = 42, 
        },
        [43] = {
            name = "WEAPON_SCAR",
            price = 4000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 43, 
        },
        [44] = {
            name = "WEAPON_RAM7",
            price = 5500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 44, 
        },
        [45] = {
            name = "WEAPON_L1A1",
            price = 5500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 45, 
        },
        [46] = {
            name = "WEAPON_DMK18",
            price = 5500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 46, 
        },
        [47] = {
            name = "WEAPON_LOK",
            price = 4500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 47, 
        },
        [48] = {
            name = "WEAPON_LBTARP",
            price = 4000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 48, 
        },
        [49] = {
            name = "WEAPON_IA2",
            price = 4000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 49, 
        },
        [50] = {
            name = "WEAPON_TARP",
            price = 4000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 50, 
        },
        [51] = {
            name = "WEAPON_P416",
            price = 4500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 51, 
        },
        [52] = {
            name = "WEAPON_AUGA1",
            price = 5500000,
            amount = 1,
            info = {},
            type = "item",
            slot = 52, 
        },
        [53] = {
            name = "WEAPON_DDM4V5",
            price = 6400000,
            amount = 1,
            info = {},
            type = "item",
            slot = 53, 
        },
        [54] = {
            name = "WEAPON_MPX",
            price = 4000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 54, 
        },
        [55] = {
            name = "WEAPON_PLR",
            price = 4000000,
            amount = 1,
            info = {},
            type = "item",
            slot = 55, 
        },
       


    },
}

Config.GunPaint = {
    label = "Gun Paint",
    slots = 23,
    items = {
        [1] = {
            name = "weapontint_black",
            price = 25000,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapontint_green",
            price = 30000,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapontint_gold",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapontint_pink",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapontint_lspd",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapontint_army",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "weapontint_plat",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "weapontint_orange",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "pistol_luxuryfinish",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "combatpistol_luxuryfinish",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "appistol_luxuryfinish",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "pistol50_luxuryfinish",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "revolver_vipvariant",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "revolver_bodyguardvariant",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "microsmg_luxuryfinish",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 15,
        },
        [16] = {
            name = "smg_luxuryfinish",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 16,
        },
        [17] = {
            name = "pumpshotgun_luxuryfinish",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 17,
        },
        [18] = {
            name = "sawnoffshotgun_luxuryfinish",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 18,
        },
        [19] = {
            name = "assaultrifle_luxuryfinish",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 19,
        },
        [20] = {
            name = "carbinerifle_luxuryfinish",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 20,
        },
        [21] = {
            name = "advancedrifle_luxuryfinish",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 21,
        },
        [22] = {
            name = "specialcarbine_luxuryfinish",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 22,
        },
        [23] = {
            name = "bullpuprifle_luxuryfinish",
            price = 15000,
            amount = 1,
            info = {},
            type = "item",
            slot = 23,
        },
    },
}

Config.Drugs = {
    label = "Drugs",
    slots = 15,
    items = {
        [1] = {
            name = "plastic_table_mushrooms",
            price = 30000,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "plastic_table_weed",
            price = 30000,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "plastic_table_cocaine",
            price = 30000,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "laundrycard",
            price = 250,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
        
       --[[  [4] = {
            name = "plastic_table_heroine",
            price = 30000,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
       
        [5] = {
            name = "plastic_table_ecstasy",
            price = 30000,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "plastic_table_meth",
            price = 30000,
            amount = 1,
            info = {},
            type = "item",
            slot = 6,
        },
       
        [7] = {
            name = "plastic_table_fentanyl",
            price = 30000,
            amount = 1,
            info = {},
            type = "item",
            slot = 7,
        }, ]]

    },
}

Config.Ammo = {
    label = "Ammunition",
    slots = 4,
    items = {
        [1] = {
            name = "pistol_ammo",
            price = 2500,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "rifle_ammo",
            price = 3000,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "smg_ammo",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "shotgun_ammo",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
    },
}

Config.RifleAttachments = {
    label = "Rifle Attachments",
    slots = 21,
    items = {
        [1] = {
            name = "assaultrifle_defaultclip",
            price = 2500,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "assaultrifle_extendedclip",
            price = 3000,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "assaultrifle_drum",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "rifle_flashlight",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "rifle_grip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "rifle_suppressor",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "carbinerifle_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "carbinerifle_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "carbinerifle_scope",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "advancedrifle_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "advancedrifle_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "specialcarbine_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "specialcarbine_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "specialcarbine_drum",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "bullpuprifle_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 15,
        },
        [16] = {
            name = "bullpuprifle_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 16,
        },

        [17] = {
            name = "compactrifle_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 17,
        },
        [18] = {
            name = "compactrifle_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 18,
        },

        [19] = {
            name = "compactrifle_drum",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 19,
        },
        [20] = {
            name = "gusenberg_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 20,
        },
        [21] = {
            name = "gusenberg_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 21,
        },
    },
}

Config.ShotgunAttachments = {
    label = "Shogun Attachments",
    slots = 6,
    items = {
        [1] = {
            name = "shotgun_suppressor",
            price = 25000,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "assaultshotgun_defaultclip",
            price = 3000,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "assaultshotgun_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "heavyshotgun_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "heavyshotgun_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "heavyshotgun_drum",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 6,
        },
    },
}

Config.SmgAttachments = {
    label = "Sub-Machine Gun Attachments",
    slots = 17,
    items = {
        [1] = {
            name = "microsmg_defaultclip",
            price = 25000,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "microsmg_extendedclip",
            price = 3000,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "microsmg_scope",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "smg_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "smg_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "smg_drum",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "smg_scope",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "smg_luxuryfinish",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "assaultsmg_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "machinepistol_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "machinepistol_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "machinepistol_drum",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "combatpdw_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "combatpdw_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "combatpdw_drum",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 15,
        },
        [16] = {
            name = "combatpdw_grip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 16,
        },
        [17] = {
            name = "combatpdw_scope",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 17,
        },
    },
}

Config.PistolAttachments = {
    label = "Handgun Attachments",
    slots = 19,
    items = {
        [1] = {
            name = "pistol_defaultclip",
            price = 2500,
            amount = 1,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "pistol_extendedclip",
            price = 3000,
            amount = 1,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "pistol_flashlight",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "pistol_suppressor",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "pistol_luxuryfinish",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "combatpistol_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "combatpistol_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "appistol_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "appistol_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "pistol50_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "pistol50_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "snspistol_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "snspistol_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "snspistol_grip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "heavypistol_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 15,
        },
        [16] = {
            name = "heavypistol_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 16,
        },
        [17] = {
            name = "heavypistol_grip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 17,
        },
        [18] = {
            name = "vintagepistol_defaultclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 18,
        },
        [19] = {
            name = "vintagepistol_extendedclip",
            price = 1500,
            amount = 1,
            info = {},
            type = "item",
            slot = 19,
        },
    },
}