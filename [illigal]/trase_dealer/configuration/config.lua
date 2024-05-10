Config = {}

-- Configure all drugs on server config.

Config.Framework = 1 -- ESX = 0, QBCore = 1, Custom = 2 (For custom, setup in frameworks/custom.lua)
Config.SellCommands = { 'dealer', 'selldrugs', 'trap' } -- Commands that are used to sell drugs
Config.EnableSelection = false -- Enable the context menu to select the drug IF they have more then 1
Config.SpawnDistance = 50.0 -- The distance the peds are spawned from the player
Config.DefaultSellTime = 12 -- Time (in seconds) it takes to sell on level 1
Config.SellOnlyNight = false -- true/false if enabled it will only allow them to sell at night
Config.EnableProps = true -- true/false if enabled it will spawn props on the peds when selling
Config.SyncPeds = true -- true/false if enabled it will sync the peds to all players

Config.Agressive = { -- What happens when drug is denied (deny chance is in the drug config [server-sided])
    Enabled = true,
    Type = 1, -- 1 = Melee, 2 = Gun (Will select a random weapon from the list below)
    WeaponList = { `WEAPON_PISTOL`, `WEAPON_COMBATPISTOL` } -- List of weapons to select from (Only used if Type = 2)
}

Config.Props = {
    Enabled = true,
    Duration = 2, -- How long the props stay on the ped (in seconds)
    Prop1 = {
        Model = `prop_weed_bottle`,
        Bone = 57005,
        Coords = {X = 0.13, Y = 0.02, Z = 0.0},
        Rotation = {XRot = -90.0, YRot = 0, ZRot = 0},
    },
    Prop2 = {
        Model = `hei_prop_heist_cash_pile`,
        Bone = 57005,
        Coords = {X = 0.13, Y = 0.02, Z = 0.0},
        Rotation = {XRot = -90.0, YRot = 0, ZRot = 0},
    },
}

Config.BlacklistedJobs = { -- A list of jobs that cannot do /dealer
    'police',
    'ambulance'
}

Config.BlacklistedLocations = {
    vec4(0.0, 0.0, 0.0, 25.0), -- X, Y, Z, Radius
}

--------------------------------------------------------------------------------------
-- Supported Dispatch Systems (server/open.lua to configure and add more)
-- It will automatically detect if you have one of these installed and use it.
-- If you don't have any of these installed, it will use the default dispatch system.
--------------------------------------------------------------------------------------


Config.Police = {
    Enabled = true,
    Jobs = { 'police' },
}

Config.DenyStrings = {
    'This stuff is shitty!',
    'I want the real shit, what is this?!',
    'This shit wack.',
}

Config.Strings = {
    ['NoDrugs'] = 'You have no drugs to sell!',
    ['MenuTitle'] = 'Select Drug Option',
    ['NoClientFound'] = 'No clients were found, try moving around.',
    ['ClientFound'] = 'Client found, they\'re approaching now.',
    ['ClientScared'] = 'The client got scared and ran away.',
    ['NoInVeh'] = 'You can\'t sell drugs while in a vehicle.',
    ['SoldDrug'] = 'You sold {DRUG_NAME} for ${DRUG_PRICE}.',
    ['RankUp'] = 'Congrats! You have sold a total of {TOTAL_DRUGSALE} drugs and ranked up to {RANK_LABEL}!',
    ['SellIncrease'] = 'You got a {DRUG_MULTI}% sell increase due to your rank!',
    ['SellIncreaseDiscord'] = 'You got a {DRUG_MULTI}% sell increase due to being a donator!',
    ['AlertPolice'] = 'A suspect spotted selling drugs!',
    ['BlacklistedJob'] = 'You are not allowed to sell drugs with this job!',
    ['CantSellHere'] = 'You cannot sell drugs here!',
    ['CurrentlyDrugRank'] = 'You are currently rank {DRUG_RANK}, and have sold a total of x{DRUG_TOTALSOLD} drugs!',
    ['NotNight'] = 'You can only sell drugs during night time!',
    ['Dispatch_Title'] = 'Drug Selling',
    ['Dispatch_Code'] = '10-32',
    ['Dispatch_Description'] = 'A suspect has been spotted selling drugs!',
}

Config.PedModels = { -- List of peds that are selected when selling
    `a_m_m_salton_04`,
    `a_m_m_salton_03`,
    `a_m_m_rurmeth_01`,
    `a_m_m_skidrow_01`,
    `a_m_m_socenlat_01`,
    `a_m_m_soucent_01`,
    `a_m_m_soucent_03`,
    `a_m_m_soucent_04`,
    `a_m_o_acult_02`,
    `a_m_o_soucent_02`,
    `a_m_o_soucent_03`,
    `a_m_o_tramp_01`,
    `csb_tonya`,
    `g_f_y_ballas_01`,
    `g_f_y_families_01`,
    `g_f_y_lost_01`,
    `g_f_y_vagos_01`,
}

Config.Ranks = {
    [1] = {
        RankLabel = 'Rank: 2',
        SellRequirement = 1500,
        Modifiers = {
            SellTime = 10, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 10 -- Sell 10% more
        }
    },
    [2] = {
        RankLabel = 'Rank: 3',
        SellRequirement = 2500,
        Modifiers = {
            SellTime = 8, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 15 -- Sell 15% more
        }
    },
    [3] = {
        RankLabel = 'Rank: 4',
        SellRequirement = 3500,
        Modifiers = {
            SellTime = 6, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 20 -- Sell 20% more
        }
    },
    [4] = {
        RankLabel = 'Rank: 5',
        SellRequirement = 5000,
        Modifiers = {
            SellTime = 4, -- The time (in seconds) it takes to sell the drug on the phone with the ped
            SellPrice = 25 -- Sell 25% more
        }
    },
}