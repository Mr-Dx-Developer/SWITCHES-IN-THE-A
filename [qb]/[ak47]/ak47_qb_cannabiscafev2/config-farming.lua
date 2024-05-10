Config.FarmLocation = vector3(178.0087890625,-250.984619140625,53.3077392578125)
Config.FarmRadius = 100.0

Config.FarmGetItem = {
    name = 'weed_leaf',             -- item that you will get after harvest
    max = 5,                        -- maximum per harvest * 5
    min = 1,                        -- minimum per harvest * 5
}
Config.FarmingFertilize = {         
    item = 'weed_fertilizer',       -- item required to fertilize the plant
    quantity = 1,                   -- quantity that required to fertilize
    damageChance = 10,              -- 10% chance will require fertilizer
}
Config.FarmingSpray = {
    item = 'weed_spray',            -- item required to spray the plant
    quantity = 1,                   -- quantity that required to fertilize
    damageChance = 10,              -- 10% chance will require spray
}

Config.FarmingRequired = {          --  required items to plant a new pot
    [1] = {
        item = 'weed_fertilizer',   -- item name
        quantity = 1,               -- item quantity
    },
    [2] = {
        item = 'weed_pot',          -- item name
        quantity = 1,               -- item quantity
    },
    [3] = {
        item = 'seed_weed',         -- item name
        quantity = 1,               -- item quantity
    },
}

Config.FarmingMultiItems = {
    [1] = {
        pos = vector3(176.3208770751953,-247.3054962158203,53.3077392578125),
        items = {
            ['lighter'] = {
                name = 'Lighter',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['cheap_lighter'] = {
                name = 'Cheap Lighter',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['vape'] = {
                name = 'Vape',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['grabba_leaf'] = {
                name = 'Grabba Leaf',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['backwoods_honey'] = {
                name = 'Backwoods Honey',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['backwoods_grape'] = {
                name = 'Backwoods Grape',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['backwoods_russian_cream'] = {
                name = 'Backwoods Russian Cream',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['paxton_pearl_cigars'] = {
                name = 'Paxton Pearl Cigars',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['banana_backwoods'] = {
                name = 'Banana Backwoods',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['raw_cone_king'] = {
                name = 'Raw Cone King',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['blueberry_jam_cookie'] = {
                name = 'Blueberry Jam Cookie',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['butter_cookie'] = {
                name = 'Butter Cookie',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['cookie_craze'] = {
                name = 'Cookie Craze',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['get_figgy'] = {
                name = 'Get Figgy',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['key_lime_cookie'] = {
                name = 'Key Lime Cookie',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['marshmallow_crisp'] = {
                name = 'Marshmallow Crisp',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['no_99'] = {
                name = 'NO 99',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['paris_fog'] = {
                name = 'Paris Fog',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['pogo'] = {
                name = 'Pogo',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['pumpkin_cookie'] = {
                name = 'Pumpkin Cookie',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['shamrock_cookie'] = {
                name = 'Shamrock Cookie',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['strawberry_jam_cookie'] = {
                name = 'Strawberry Jam Cookie',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
            ['cafe_bong'] = {
                name = 'Cafe Bong',                      -- item name
                price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
                slots = 20,                                     -- container size
                available = 20,                                 -- available in stock
                regeneration = 60,                              -- in second
            },
        }
    }
}

Config.FarmingItems = {
    [1] = {
        pos = vector3(175.1868133544922,-251.1692352294922,53.3077392578125), 
        item = 'weed_fertilizer',                       -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 20,                                 -- available in stock
        regeneration = 60,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Fertilizer~s~',
        msgtarget = 'Fertilizer',
    },
    [2] = {
        pos = vector3(176.90109252929688,-251.74945068359375,53.3077392578125), 
        item = 'weed_fertilizer',                       -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 20,                                 -- available in stock
        regeneration = 60,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Fertilizer~s~',
        msgtarget = 'Fertilizer',
    },
    [3] = {
        pos = vector3(178.54945373535156,-252.35604858398438,53.3077392578125), 
        item = 'weed_pot',                       -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 20,                                  -- available in stock
        regeneration = 60,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Weed Pot~s~',
        msgtarget = 'Weed Pot',
    },
    [4] = {
        pos = vector3(180.0263671875,-252.89669799804688,53.3077392578125), 
        item = 'weed_pot',                              -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 10,                                 -- available in stock
        regeneration = 60,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Weed Pot~s~',
        msgtarget = 'Weed Pot',
    },
    [5] = {
        pos = vector3(181.1999969482422,-248.94065856933594,53.3077392578125), 
        item = 'weed_spray',                            -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 10,                                 -- available in stock
        regeneration = 30,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Weed Spray~s~',
        msgtarget = 'Weed Spray',
    },
    [6] = {
        pos = vector3(179.84176635742188,-248.5186767578125,53.3077392578125), 
        item = 'pooch_bag',                             -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 20,                                 -- available in stock
        regeneration = 30,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Pooch Bag~s~',
        msgtarget = 'Pooch Bag',
    },
    [7] = {
        pos = vector3(178.24615478515625,-248.07032775878906,53.3077392578125), 
        item = 'seed_weed',                             -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 20,                                 -- available in stock
        regeneration = 30,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Weed Seed~s~',
        msgtarget = 'Weed Seed',
    },
    [8] = {
        pos = vector3(177.04615783691406,-247.5032958984375,53.3077392578125), 
        item = 'weed_spray',                             -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 20,                                 -- available in stock
        regeneration = 30,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Weed Spray~s~',
        msgtarget = 'Weed Spray',
    },
}

Config.ProcessLocation = {
    pos = vector3(174.54066467285156,-249.92967224121094,53.3077392578125),
    heading = 124.72441101074219,
}

Config.Objects = {
    [1] = "bkr_prop_weed_01_small_01c",
    [2] = "bkr_prop_weed_01_small_01b",
    [3] = "bkr_prop_weed_01_small_01a",
    [4] = "bkr_prop_weed_med_01a",
    [5] = "bkr_prop_weed_med_01b",
    [6] = "bkr_prop_weed_lrg_01a",
    [7] = "bkr_prop_weed_lrg_01b",
    --There is no stage 8. So don't add any prop here
}

Config.Buds = {
    [1] = "bkr_prop_weed_bud_01a",
    [2] = "bkr_prop_weed_bud_01b",
    [3] = "bkr_prop_weed_bud_02a",
    [4] = "bkr_prop_weed_bud_02b",
    [5] = "bkr_prop_weed_bud_pruned_01a",
    --Don't touch this part
}

Config.SageTimer = {
    [1] = 1, --got to next stage in minute
    [2] = 2, --got to next stage in minute
    [3] = 3, --got to next stage in minute
    [4] = 4, --got to next stage in minute
    [5] = 5, --got to next stage in minute
    [6] = 6, --got to next stage in minute
    [7] = 7, --got to next stage in minute
    --There is no stage 8. So don't add any stage here
}

Config.Plants = {
    vector3(183.6791229248047,-254.03076171875,53.3077392578125),
    vector3(184.45713806152344,-252.7120819091797,53.3077392578125),
    vector3(183.1780242919922,-251.93406677246094,53.3077392578125),
    vector3(181.89889526367188,-251.35385131835938,53.3077392578125),
    vector3(181.028564453125,-253.13406372070312,53.3077392578125),
    vector3(182.36044311523438,-253.59561157226562,53.3077392578125),
    vector3(183.41539001464844,-252.88351440429688,53.3077392578125),
    vector3(181.7802276611328,-252.05274963378906,53.3077392578125),
    vector3(180.6593475341797,-251.2087860107422,53.3077392578125),
    vector3(179.10330200195312,-250.1802215576172,53.3077392578125),
    
}