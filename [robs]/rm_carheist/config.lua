--RAINMAD SCRIPTS - discord.gg/rccvdkmA5X - rainmad.tebex.io
Config = {}

Config['CarHeist'] = {
    ['framework'] = {
        name = 'QB', -- Only ESX or QB.
        scriptName = 'qb-core', -- Only for QB users.
        eventName = 'esx:getSharedObject' -- Only for ESX users.
    },
    ['setjobForPolice'] = 'police', -- Setjob for check police count and police alert.
    ['requiredPoliceCount'] = 0, -- Required police count for start heist.
    ['nextRob'] = 7200, -- Seconds for next heist.
    ['requiredItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names.
        'bag',
        'laptop'
    },
    ['removeLaptopItem'] = true, -- If you change to true, item deleted after every minigame
    ['rewardItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names.
        {itemName = 'rolex',       count = 25, sellPrice = 800}, -- For stacks.
        {itemName = 'goldchain', count = 25, sellPrice = 1000}, -- For stacks.
        {itemName = 'cokebaggy', count = 25, sellPrice = 100}, -- For stacks.
    },
    ['rewardMoneys'] = {
        ['stacks'] = function()
            return math.random(250000, 350000) -- Per money stacks
        end,
    },
    ['moneyItem'] = { -- If your server have money item, you can set it here.
        status = false,
        itemName = 'cash'
    },
    ['black_money'] = {  -- If change true, all moneys will convert to black. QBCore players can change itemName.
        status = false,
        itemName = 'black_money'
    },
    ['startHeist'] ={ -- Heist start coords
        pos = vector3(-1435.9, -868.28, 10.9307),
        peds = {
            {pos = vector3(-1436.8, -867.72, 10.9302), heading = 198.22, ped = 's_m_m_highsec_01'},
            {pos = vector3(-1435.9, -868.28, 10.9307), heading = 119.78, ped = 's_m_m_highsec_02'},
            {pos = vector3(-1436.2, -869.03, 10.9306), heading = 27.42,  ped = 's_m_m_highsec_02'}
        }
    },
    ['finishHeist'] = { -- Heist finish coords.
        buyerPos = vector3(2356.88, 3136.20, 47.2087)
    },
}

Config['CarSetup'] = {
    ['main'] = vector3(-1109.446, -3081.029, 5.3891), -- Main heist coords for some checks.
    ['cars'] = { -- You can add new car.
        {coords = vector3(-1069.7, -3096.2, 13.9444),  heading = 293.29, model = 'osiris',   sellPrice = 120},
        {coords = vector3(-1071.8, -3093.5, 13.9444),  heading = 289.92, model = 'zentorno', sellPrice = 120},
        {coords = vector3(-1073.5, -3090.8, 13.9444),  heading = 287.2,  model = 't20',      sellPrice = 120},
        {coords = vector3(-1074.9, -3088.1, 13.9444),  heading = 285.45, model = 'casco',    sellPrice = 120},

        --Dont change those and order. If you want add new car, add it top.
        {coords = vector3(-1038.50, -3081.543, 14.1635),  heading = 329.9,   model = 'tr2'},
        {coords = vector3(-1034.804, -3074.843, 14.1635), heading = 329.9,   model = 'hauler'},
        {coords = vector3(-1109.446, -3081.029, 5.3891),  heading = 60.1143, model = 'cargoplane'},
    },
    ['tables'] = { -- You can add new table with money/gold stacks.
        {coords = vector3(-1124.5, -3070.5, 15.3375), heading = 60.0, type = 'gold'},
        {coords = vector3(-1122.2, -3075.4, 15.3375), heading = 60.0, type = 'coke'},
        {coords = vector3(-1128.0, -3072.3, 15.3375), heading = 60.0, type = 'weed'},
        {coords = vector3(-1118.1, -3074.0, 15.3375), heading = 60.0, type = 'money'},
    },
    ['moneyStacks'] = { -- You can add new money stacks.
        {scenePos = vector3(-1124.6, -3074.2, 15.3375), sceneRot = vector3(0.0, 0.0, 60.0)},
        {scenePos = vector3(-1126.1, -3073.3, 15.3375), sceneRot = vector3(0.0, 0.0, 60.0)},
        {scenePos = vector3(-1121.1, -3072.4, 15.3375), sceneRot = vector3(0.0, 0.0, 60.0)},
        {scenePos = vector3(-1122.5, -3071.5, 15.3375), sceneRot = vector3(0.0, 0.0, 60.0)},
        {scenePos = vector3(-1119.8, -3076.7, 15.3375), sceneRot = vector3(0.0, 0.0, 60.0)},
    },
    ['guards'] = { 
        ['peds'] = {-- These coords are for guard peds, you can add new guard peds.
            {coords = vector3(-1104.2, -3056.0, 14.7165),  heading = 270.87, model = 's_m_m_highsec_02'},
            {coords = vector3(-1084.5, -3067.2, 14.7166),  heading = 354.93, model = 'ig_fbisuit_01'},
            {coords = vector3(-1084.6, -3091.6, 13.9444),  heading = 268.28, model = 's_m_m_highsec_02'},
            {coords = vector3(-1094.9, -3102.7, 13.9444),  heading = 268.3,  model = 's_m_m_highsec_02'},
            {coords = vector3(-1115.2, -3097.9, 13.9444),  heading = 359.44, model = 'ig_fbisuit_01'},
            {coords = vector3(-1099.8, -3024.3, 13.9449),  heading = 174.77, model = 's_m_m_highsec_02'},
            {coords = vector3(-1087.6, -3020.2, 13.9453),  heading = 180.79, model = 'ig_fbisuit_01'},
            {coords = vector3(-1067.8, -3034.7, 13.9457),  heading = 180.79, model = 'ig_fbisuit_01'},
            {coords = vector3(-1059.2, -3060.8, 13.9845),  heading = 180.79, model = 's_m_m_highsec_02'},
            {coords = vector3(-1051.6, -3081.5, 13.9376),  heading = 180.79, model = 'ig_fbisuit_01'},
            {coords = vector3(-1042.1, -3094.3, 13.9450),  heading = 180.79, model = 's_m_m_highsec_02'},
            {coords = vector3(-1043.0, -3109.2, 13.9444),  heading = 180.79, model = 'ig_fbisuit_01'},
            {coords = vector3(-1050.7, -3107.4, 13.9444),  heading = 180.79, model = 's_m_m_highsec_02'},
        },
        ['weapon'] = 'WEAPON_PISTOL', -- You can change this
    },
    ['dealerScene'] = { -- Dealer scene for heist.
        ['start'] = {coords = vector3(2330.81, 3137.90, 48.1683), heading = 259.0},
        ['cam'] = {coords = vector3(2339.76, 3139.47, 49.6085), rotation = vector3(-20.0, 0.0, 170.0)},
        ['finish'] = vector3(2350.62, 3134.56, 47.6018),
    }
}

Strings = {
    ['e_start'] = 'Press ~INPUT_CONTEXT~ to Start Deluxe Car Heist',
    ['start_heist'] = 'Go to Airport. Check your gps!',
    ['start_heist2'] = 'Required things for robbery: A lots of guns, bags and laptop.',
    ['airport_blip'] = 'Airport',
    ['hack_car'] = 'Press ~INPUT_CONTEXT~ to hack the ',
    ['grab_stack'] = 'Press ~INPUT_CONTEXT~ to grab stack',
    ['grab_money'] = 'Press ~INPUT_CONTEXT~ to grab money stacks',
    ['wait_nextrob'] = 'You have to wait this long to undress again',
    ['minute'] = 'minute.',
    ['need_this'] = 'You need this: ',
    ['need_police'] = 'Not enough police in the city.',
    ['total_money'] = 'You got this: ',
    ['police_alert'] = 'Car robbery alert! Check your gps.',
    ['not_cop'] = 'You are not cop!',
    ['buyer_blip'] = 'Buyer',
    ['deliver_to_buyer_with_car'] = 'Deliver the loot to the buyer with car. Check gps.',
    ['deliver_to_buyer'] = 'Deliver the loot to the buyer. Check gps.',

    --Minigame
    ['change'] = 'Change horizontal',
    ['change2'] = 'Change vertical',
    ['exit'] = 'Exit'
}