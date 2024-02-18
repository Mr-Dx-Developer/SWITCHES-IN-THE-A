Config = {}

Config['DrugBoatHeist'] = {
    ['framework'] = {
        name = 'QB', -- Only ESX or QB.
        scriptName = 'qb-core', -- Only for QB users.
        eventName = 'esx:getSharedObject', -- Only for ESX.
    },
    ['setjobForPolice'] = 'police', -- Setjob for check police count and police alert
    ['requiredPoliceCount'] = 0, -- Required police count for start heist
    ['nextRob'] = 7200, -- Seconds for next heist
    ['requiredItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names
        'bag',
    },
    ['rewardItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names. Also dont forget glass cutting and painting item names.(in bottom)
        {itemName = 'cokebaggy', count = 25, sellPrice = 100}, -- For drugs grab
        {itemName = 'crack_baggy', count = 25, sellPrice = 100}, -- For drugs grab
    },
    ['black_money'] = {  -- If change true, all moneys will convert to black. QBCore players can change itemName
        status = false,
        itemName = 'black_money'
    },
    ['startHeist'] ={ -- Heist start coords
        pos = vector3(1136.96, -1338.4, 34.6567),
        peds = {
            {pos = vector3(1136.96, -1338.2, 34.6567), heading = 280.22, ped = 's_m_m_highsec_01'},
            {pos = vector3(1137.33, -1337.7, 34.6567), heading = 200.78, ped = 's_m_m_highsec_02'},
            {pos = vector3(1137.59, -1338.6, 34.6617), heading = 10.42, ped = 's_m_m_fiboffice_02'}
        }
    },
    ['finishHeist'] = { -- Heist finish coords
        buyerPos = vector3(899.269, -1054.8, 31.8280)
    }
}

Config['DrugBoatSetup'] = {
    ['boatLocations'] = { -- You can add new boat location, when start heist select randomly
        {pos = vector3(-1964.2, -2102.2, -2.73480), heading = 190.0}
    },
    ['guards'] = { 
        ['peds'] = {-- These offset are for guard peds, you can add new guard peds but you need take offset from boat
            {offset = vector3(1.460129, 10.322418, 1.114410),  heading = 270.87, model = 'ig_fabien'},
            {offset = vector3(-1.436447, 10.398788, 1.122208), heading = 177.93, model = 'ig_stevehains'},
            {offset = vector3(-0.102081, 11.481186, 1.273041), heading = 354.93, model = 'ig_cletus'},
            {offset = vector3(-3.655228, 6.290695, 0.696960),  heading = 177.88, model = 'ig_tylerdix'},
            {offset = vector3(-3.824203, -2.111862, 0.350464), heading = 268.28, model = 'ig_fabien'},
            {offset = vector3(3.873230, -4.572037, 0.357071),  heading = 268.3,  model = 'ig_stevehains'},
            {offset = vector3(3.868134, 1.926559, 0.497414),   heading = 359.44, model = 'ig_fabien'},
            {offset = vector3(0.365448, -15.011490, 1.366837), heading = 265.05, model = 'ig_tylerdix'},
            {offset = vector3(-1.770233, -1.888733, 3.112183), heading = 174.77, model = 'ig_fabien'},
            {offset = vector3(1.419403, -0.847137, 3.112389),  heading = 180.79, model = 'ig_cletus'},
            {offset = vector3(-1.981165, 8.465599, 0.915565),  heading = 180.79, model = 'ig_fabien'},
            {offset = vector3(-3.660142, 2.173296, 0.507736),  heading = 180.79, model = 'ig_cletus'},
            {offset = vector3(-3.070521, -6.186534, 0.361992), heading = 180.79, model = 'ig_fabien'},
            {offset = vector3(-1.732450, -14.310625, 1.280685), heading = 180.79, model = 'ig_cletus'},
            {offset = vector3(1.532046, -14.033877, 1.242504),  heading = 180.79, model = 'ig_tylerdix'},
            {offset = vector3(2.810292, -8.938755, 0.540218),  heading = 180.79, model = 'ig_cletus'},
            {offset = vector3(-2.163944, -3.483561, 3.112377),  heading = 180.79, model = 'ig_stevehains'},
            {offset = vector3(-1.749885, 7.040260, 3.112507),  heading = 180.79, model = 'ig_cletus'},
            {offset = vector3(1.661025, 6.888834, 3.112507),  heading = 180.79, model = 'ig_stevehains'},
        },
        ['weapon'] = 'WEAPON_PISTOL', -- You can change this
    },
    ['drugs'] = { -- These offsets are for tables, every new table is a new drug
        {type = 'weed', offset = vector3(-0.039307, 1.482666, 3.112457), heading = 180.0},
        {type = 'coke', offset = vector3(-0.002686, 5.083179, 3.112457), heading = 360.0},
        {type = 'weed', offset = vector3(-0.047729, 8.736328, 1.020518), heading = 180.0},
        {type = 'coke', offset = vector3(-0.991089, -6.52331, 0.386162), heading = 360.0}
    },
}

Strings = {
    ['e_start'] = 'Press ~INPUT_CONTEXT~ to Start Drug Boat Heist',
    ['start_heist'] = 'Go to Drug Boat. Check your gps!',
    ['start_heist2'] = 'Required things for robbery: A lots of guns and bags',
    ['grab'] = 'Press ~INPUT_CONTEXT~ to grab drugs',
    ['wait_nextrob'] = 'You have to wait this long to undress again',
    ['minute'] = 'minute.',
    ['need_this'] = 'You need this: ',
    ['deliver_to_buyer'] = 'Deliver the loot to the buyer. Check gps.',
    ['drugboat_blip'] = 'Drug Boat',
    ['buyer_blip'] = 'Buyer',
    ['need_police'] = 'Not enough police in the city.',
    ['total_money'] = 'You got this: ',
    ['police_alert'] = 'Drug boat robbery alert! Check your gps.',
    ['not_cop'] = 'You are not cop!',
    ['not_enough'] = 'Not enough space in your inventory!',
}