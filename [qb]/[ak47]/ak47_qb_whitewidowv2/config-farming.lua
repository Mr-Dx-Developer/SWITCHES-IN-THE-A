Config.FarmLocation = vector3(-925.69, -1189.82, -1.85)
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
        pos = vector3(-931.15, -1169.71, 4.11),
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
            ['vape'] = {
                name = 'Vape',                      -- item name
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
        pos = vector3(-926.52, -1172.31, -1.86), 
        item = 'weed_fertilizer',                       -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 10,                                 -- available in stock
        regeneration = 60,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Fertilizer~s~',
        msgtarget = 'Fertilizer',
    },
    [2] = {
        pos = vector3(-927.61, -1180.54, -1.3), 
        item = 'weed_fertilizer',                       -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 0,                                  -- available in stock
        regeneration = 60,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Fertilizer~s~',
        msgtarget = 'Fertilizer',
    },
    [3] = {
        pos = vector3(-925.44, -1174.95, -1.86), 
        item = 'weed_pot',                              -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 10,                                 -- available in stock
        regeneration = 60,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Weed Pot~s~',
        msgtarget = 'Weed Pot',
    },
    [4] = {
        pos = vector3(-930.5, -1172.91, -1.87), 
        item = 'seed_weed',                             -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 10,                                 -- available in stock
        regeneration = 30,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Weed Seed~s~',
        msgtarget = 'Weed Seed',
    },
    [5] = {
        pos = vector3(-930.01, -1174.7, -1.3), 
        item = 'weed_spray',                            -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 10,                                 -- available in stock
        regeneration = 30,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Weed Spray~s~',
        msgtarget = 'Weed Spray',
    },
    [6] = {
        pos = vector3(-929.4, -1175.9, -1.3), 
        item = 'pooch_bag',                             -- item name
        price = 10,                                     -- price of the item. set it 0 if you don't want to buy with society money
        slots = 20,                                     -- container size
        available = 10,                                 -- available in stock
        regeneration = 30,                              -- in second
        msg = 'Press ~g~[E]~s~ to get ~b~Pooch Bag~s~',
        msgtarget = 'Pooch Bag',
    },
}


Config.ProcessLocation = {
    pos = vector3(-928.68, -1171.83, -1.89),
    heading = 27.29,
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
    vector3(-929.63702392578,-1195.1181640625,-1.8223652839661),
    vector3(-933.28857421875,-1191.5411376953,-1.767626285553),
    vector3(-914.58312988281,-1194.6530761719,-1.762834072113),
    vector3(-920.97589111328,-1203.4528808594,-1.7220101356506),
    vector3(-916.48913574219,-1197.0592041016,-1.762834072113),
    vector3(-920.53637695312,-1200.1071777344,-1.7220101356506),
    vector3(-914.01391601562,-1195.6343994141,-1.762834072113),
    vector3(-912.85168457031,-1197.6383056641,-1.762834072113),
    vector3(-913.39892578125,-1196.6947021484,-1.762834072113),
    vector3(-917.61279296875,-1195.1218261719,-1.762834072113),
    vector3(-930.2587890625,-1196.8624267578,-1.8223652839661),
    vector3(-919.38818359375,-1202.5319824219,-1.7220101356506),
    vector3(-920.70593261719,-1196.6059570312,-1.7810201644897),
    vector3(-930.89263916016,-1195.76953125,-1.8223652839661),
    vector3(-929.05212402344,-1193.6671142578,-1.8223652839661),
    vector3(-927.96478271484,-1195.5318603516,-1.8223652839661),
    vector3(-915.14227294922,-1193.6889648438,-1.762834072113),
    vector3(-917.78057861328,-1201.599609375,-1.7220101356506),
    vector3(-921.40026855469,-1195.2514648438,-1.7810182571411),
    vector3(-924.35223388672,-1195.2672119141,-1.7398643493652),
    vector3(-915.42529296875,-1198.8934326172,-1.762834072113),
    vector3(-919.09490966797,-1199.3334960938,-1.7220101356506),
    vector3(-934.27520751953,-1189.8400878906,-1.767626285553),
    vector3(-923.71185302734,-1196.4693603516,-1.7810163497925),
    vector3(-923.05212402344,-1197.9256591797,-1.7810163497925),
    vector3(-922.17498779297,-1200.9771728516,-1.7810163497925),
    vector3(-933.76635742188,-1190.7174072266,-1.767626285553),
    vector3(-922.05035400391,-1193.9321289062,-1.7810163497925),
    vector3(-932.80755615234,-1192.5867919922,-1.767626285553),
    vector3(-932.375,-1193.3325195312,-1.767626285553),
    vector3(-931.39782714844,-1189.6226806641,-1.767626285553),
    vector3(-930.84069824219,-1190.5832519531,-1.767626285553),
    vector3(-931.85845947266,-1188.6166992188,-1.767626285553),
    vector3(-915.92901611328,-1198.0249023438,-1.762834072113),
    vector3(-917.08966064453,-1196.0238037109,-1.762834072113),
    vector3(-928.53649902344,-1194.5817871094,-1.8223652839661),
    vector3(-929.05932617188,-1196.1667480469,-1.8223652839661),
    vector3(-932.33587646484,-1187.7935791016,-1.767626285553),
    vector3(-930.03375244141,-1191.974609375,-1.767626285553),
    vector3(-922.65563964844,-1187.1378173828,-1.8354721069336),
    vector3(-921.69006347656,-1186.5075683594,-1.8354721069336),
    vector3(-920.67388916016,-1185.9345703125,-1.8354721069336),
    vector3(-920.04254150391,-1187.0230712891,-1.8354721069336),
    vector3(-919.43676757812,-1188.0675048828,-1.8354721069336),
    vector3(-920.35388183594,-1188.5993652344,-1.8354721069336),
    vector3(-921.30078125,-1189.1485595703,-1.8354721069336),
    vector3(-921.09869384766,-1187.6566162109,-1.8354721069336),
    vector3(-928.04754638672,-1185.9921875,-1.8353300094604),
    vector3(-927.57080078125,-1186.8142089844,-1.8353300094604),
    vector3(-929.75543212891,-1187.9744873047,-1.8353300094604),
    vector3(-928.92547607422,-1189.4055175781,-1.8353300094604),
    vector3(-930.18579101562,-1187.232421875,-1.8353300094604),
    vector3(-927.08520507812,-1187.6514892578,-1.8353300094604),
    vector3(-929.12042236328,-1186.6145019531,-1.8353300094604),
    vector3(-929.337890625,-1188.6944580078,-1.8353300094604),
    vector3(-918.34161376953,-1189.6256103516,-1.8354721069336),
    vector3(-917.66156005859,-1190.7982177734,-1.8354721069336),
    vector3(-917.03515625,-1191.8782958984,-1.8354721069336),
    vector3(-918.17779541016,-1192.541015625,-1.8354721069336),
    vector3(-919.07550048828,-1193.0616455078,-1.8354721069336),
    vector3(-918.61285400391,-1191.5469970703,-1.8354721069336),
    vector3(-919.71203613281,-1192.1844482422,-1.8354721069336),
    vector3(-920.41137695312,-1190.9787597656,-1.8354721069336),
    vector3(-928.30560302734,-1198.1064453125,-1.8223571777344),
    vector3(-927.00842285156,-1197.3898925781,-1.8223571777344),
    vector3(-929.39636230469,-1198.7775878906,-1.8223462104797),
    vector3(-926.37969970703,-1198.4738769531,-1.8223571777344),
    vector3(-927.892578125,-1199.3513183594,-1.8223571777344),
}
