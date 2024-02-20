Config = {               


-- Compatability
UsingCoreSkills = true, --- if you have core skills then set this true, you will get skill experience from working
ExperienceFromFisher = 4,
ExperienceFromThunter = 20,
ExperienceFromScrap = 20,
ExperienceFromCargo = 20,



-- Base Settings
Jobscoords = { -- Jobs locations and their blips
    Thuntercoords = { BlipSprite = 84, BlipColor = 25, BlipText = 'Treasure Hunter', coords = vector3(-1354.140, -139.360, 49.574)},
    Fishercoords = { BlipSprite = 88, BlipColor = 25, BlipText = 'Fisher', coords = vector3(-1810.87,-1225.18,13.01)},
    Cargocoords = { BlipSprite = 478, BlipColor = 25, BlipText = 'Cargo Delivery', coords = vector3(-700.05,-1401.34,5.49)},
    ScrapMinercoords = { BlipSprite = 293, BlipColor = 25, BlipText = 'Scrap Miner', coords = vector3(-1336.24, -937.54, 11.35)},
},

SellingPoints = { --- Places where you can sell the loot
    PawnShops = {NpcModel = 'a_f_y_eastsa_03', BlipSprite = 108, BlipColor = 5, BlipText = 'PawnShop', coords = vector3(-1345.7,-154.76,48.17), text ='[~o~E~w~] To sell Gold Bars'},
    FishMarkets = {NpcModel = 'a_m_m_hillbilly_01', BlipSprite = 356, BlipColor = 5, BlipText = 'Fish Market', coords = vector3(-1804.41,-1244.09,8.61), text = '[~o~E~w~] To sell Fish'},
    ScrapMining = {BlipSprite = 618, BlipColor = 5, BlipText = 'Crypto Miner', coords = vector4(-1319.45, -911.83, 11.31, 289.82), text = '[~o~E~w~] To place Battery'},
},


    Jobs = {

        ----- TREASSURE HUNTER 
        TreasureJob = {
            vehiclemenu = {
                spawnvehicle = vector3(-1363.98, -144.70, 48.65),   ----- Where car spawns
                returnvehicle = vector3(-1359.34,-143.81,48.66),   ---- Where you return the car
                cars = { 
                    ["Bobcatxl"] = { label = "BOBCATXL", level = 0, price = 100},  ----- You can change [] with a car model you want, but it have to be VEHICLES ID
                    ["Sadler"] = { label = "SADLER", level = 5,  price = 1000},  ----- You can change LABEL, LEVEL, PRICE
                    ["SabreGT"] = { label = "SABRE GT", level = 10,  price = 1500},
                    ["Ellie"] = { label = "ELLIE", level = 20,  price = 2000},
                },
            },
            clothingmenu = {  ---- Job Clothes 
                clothes = { --https://wiki.rage.mp/index.php?title=Clothes 
                    ManUniform = {  ----- You can change everything here if you understand it
                        label = "SEARCHER",
                        gender = 0,
                        level = 0,
                        HandsComponent = 3, HandsDrawable = 11, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 46, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 42, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 35, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 24, ShoesTexture = 0, -- Shoes
                    }, 
                    ManUniform2 = {  ----- You can change everything here if you understand it
                        label = "THUNTER",
                        gender = 0,
                        level = 10,
                        HandsComponent = 3, HandsDrawable = 6, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 103, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 118, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 72, PantsTexture = 5, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 24, ShoesTexture = 0, -- Shoes
                    },
                    ManUniform3 = {  ----- You can change everything here if you understand it
                        label = "COLLECTOR",
                        gender = 0,
                        level = 20,
                        HandsComponent = 3, HandsDrawable = 1, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 65, UndershirtTexture = 1, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 70, TopTexture = 4, -- TOP 
                        PantsComponent = 4, PantsDrawable = 103, PantsTexture = 5, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 75, ShoesTexture = 4, -- Shoes
                    },    
                    WomenUniform = {
                        label = "WOMAN",
                        gender = 1,
                        level = 0,
                        HandsComponent = 3, HandsDrawable = 0, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 3, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 9, TopTexture = 2, -- TOP 
                        PantsComponent = 4, PantsDrawable = 34, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 25, ShoesTexture = 0, -- Shoes
                    }, 
                    WomenUniform2 = {
                        label = "WOMAN2",
                        gender = 1,
                        level = 10,
                        HandsComponent = 3, HandsDrawable = 1, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 13, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 31, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 76, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 7, ShoesTexture = 0, -- Shoes
                    },
                    WomenUniform3 = {
                        label = "WOMAN3",
                        gender = 1,
                        level = 20,
                        HandsComponent = 3, HandsDrawable = 1, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 13, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 270, TopTexture = 2, -- TOP 
                        PantsComponent = 4, PantsDrawable = 27, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 77, ShoesTexture = 0, -- Shoes
                    },
                },
            },
            taskmenu = { --- Job Tasks
                tasks = {
                    ["1"] = { label = "BONUS AFTER 10 CHESTS", AmountToFind = 10, xpgain = 30, reward = 2000}, --- You can change the LABEL, XP and REWARD for completing the TASK
                    ["2"] = { label = "BONUS AFTER 20 CHESTS", AmountToFind = 20, xpgain = 45, reward = 4500},
                    ["3"] = { label = "BONUS AFTER 50 CHESTS", AmountToFind = 50, xpgain = 80, reward = 10000},
                },
            },
            Radius = 100.0, --- Size of the zone ( you can make it bigger or smaller you choose)
            TaskZones = {  ------ Locations of Zones that Players will search for a Chest
               
                [1] = vector3(-1157.98, 130.70, 60.65), ----- You can change and add them 
                [2] = vector3(-1783.40, -874.93, 7.43), ------- in one TaskZone [] can be one location
                [3] = vector3(-918.31, -784.89, 15.91),
                [4] = vector3(197.37, -932.57, 30.68), 
            },
            ChestZones = {   ------ Locations of Chests Spawns
                {  ----- NOTE: You can change the locations as much as you want but they HAVE to be inside the TaskZones
                [1] = {vector3(-1161.56, 166.51, 62.61), vector3(-1188.13, 209.92, 66.23), vector3(-1107.05, 160.51, 62.04), vector3(-1079.09, 126.69, 57.85)},  --- This line represents the [1] of the TaskZones
                [2] = {vector3(-1791.07, -854.27, 6.63), vector3(-1789.69, -883.84, 5.28), vector3(-1798.74, -976.44, 0.02), vector3(-1756.55, -952.61, 6.11)}, --- This line represents the [2] of the TaskZones
                [3] = {vector3(-945.04, -799.75, 19.52), vector3(-937.99, -760.23, 16.96), vector3(-884.94, -779.85, 14.91), vector3(-980.82, -764.86, 17.55)}, --- This line represents the [3] of the TaskZones
                [4] = {vector3(160.17, -937.54, 29.05), vector3(186.78, -904.02, 29.69), vector3(194.26, -900.48, 34.58), vector3(201.07, -951.77, 23.14)}, --- This line represents the [4] of the TaskZones
                }, ---- You can add AS many locations AS YOU WANT, but the number in [] have to be the same as the number in TaskZones []
            },    --- for example if TaskZones [1] will be ChestZones [1]
            items = {
                ["nothing"] = {price = 0, xpgain = 0},
                ["goldchain"] = {price = 1500, xpgain = 8},
                ["goldbar"] = {price = 3000, xpgain = 12},
                ["diamond_ring"] = {price = 5000, xpgain = 20},
            },
        },
        ----- TREASSURE HUNTER END




        --- FISHER JOB
        Fisher = {
            boatmenu = {
                spawnvehicle = vector3(-1796.25,-1220.54,-0.20),  ----- Where boat spawns
                returnvehicle = vector3(-1798.26, -1238.27, 1.75),  ---- Where you return the boat
                boats = {
                    ["Suntrap"] = { label = "SUNTRAP", level = 5,  price = 1000}, ----- You can change [] with a boat model you want, but it have to be VEHICLES ID
                    ["Tropic"] = { label = "TROPIC", level = 10,  price = 1500},  ----- You can change LABEL, LEVEL, PRICE
                    ["Toro"] = { label = "TORO", level = 15,  price = 2000},
                    ["Marquis"] = { label = "MARQUIS", level = 20,  price = 2500},
                },
            },
            clothingmenu = {  ---- Job Clothes 
                clothes = { --https://wiki.rage.mp/index.php?title=Clothes 
                    ManUniform = {  ----- You can change everything here if you understand it
                        label = "AMATEUR",
                        gender = 0,
                        level = 0,
                        HandsComponent = 3, HandsDrawable = 2, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 15, UndershirtTexture = 1, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 105, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 15, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 62, ShoesTexture = 0, -- Shoes
                    }, 
                    ManUniform2 = {  ----- You can change everything here if you understand it
                        label = "FISHER",
                        gender = 0,
                        level = 10,
                        HandsComponent = 3, HandsDrawable = 1, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 1, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 86, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 103, PantsTexture = 5, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 5, ShoesTexture = 0, -- Shoes
                    },
                    ManUniform3 = {  ----- You can change everything here if you understand it
                        label = "AQUAMAN",
                        gender = 0,
                        level = 20,
                        HandsComponent = 3, HandsDrawable = 1, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 65, UndershirtTexture = 1, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 70, TopTexture = 1, -- TOP 
                        PantsComponent = 4, PantsDrawable = 103, PantsTexture = 5, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 75, ShoesTexture = 4, -- Shoes
                    },    
                    WomenUniform = {
                        label = "WOMAN",
                        gender = 1,
                        level = 0,
                        HandsComponent = 3, HandsDrawable = 1, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 14, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 96, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 25, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 5, ShoesTexture = 0, -- Shoes
                    }, 
                    WomenUniform2 = {
                        label = "WOMAN2",
                        gender = 1,
                        level = 10,
                        HandsComponent = 3, HandsDrawable = 3, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 14, UndershirtTexture = 1, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 186, TopTexture = 1, -- TOP 
                        PantsComponent = 4, PantsDrawable = 11, PantsTexture = 1, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 2, ShoesTexture = 1, -- Shoes
                    },
                    WomenUniform3 = {
                        label = "WOMAN3",
                        gender = 1,
                        level = 20,
                        HandsComponent = 3, HandsDrawable = 5, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 23, UndershirtTexture = 1, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 248, TopTexture = 3, -- TOP 
                        PantsComponent = 4, PantsDrawable = 44, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 59, ShoesTexture = 1, -- Shoes
                    },
                },
            },
            taskmenu = {  --- Job Tasks
                tasks = {
                    ["1"] = { label = "BONUS AFTER 30 FISHES", AmountToFind = 30, xpgain = 10, reward = 2000},  --- You can change the LABEL, XP and REWARD for completing the TASK
                    ["2"] = { label = "BONUS AFTER 60 FISHES", AmountToFind = 60, xpgain = 20, reward = 4500},
                    ["3"] = { label = "BONUS AFTER 100 FISHES", AmountToFind = 100, xpgain = 30, reward = 10000},
                },
            },
            items = { --- DO NOT change anything that is in [""]
                ["nothing"] = {price = 0, xpgain = 0, weight = 0},   ---- You can change PRICE, XP that you get from catching a fish, WEIGHT of the fish 
                ["fish"] = {price = 200, xpgain = 2, weight = 1},
                ["shark"] = {price = 400, xpgain = 5, weight = 3},     ----- The way WEIGHT works is if you can catch 5 fishes in the zone and you catch shark it will show 3/5 
                ["goldfish"] = {price = 1000, xpgain = 15, weight = 1},
            },
            FishingAreas = {   --------------- You can add as many zones as you want!!     P.S - make sure you are not making mistakes :)
                {  ---- Level 0 Area
                    Center = vector3(-1873.56, -1289.3, -0.96), -- Center of the zone
                    Size = 50.0,                    -- Size of the zone
                    AmountCanCatch = 5,  -- How many fishes can player hold in this zone (this is begginer zone, if player is in level 5 zone or level 10 i suggest you do bigger number)
                    XP = 0,                         -- from which level you can fish in the zone (100xp = 1 lvl)
                    marker= 1, rgba = {255, 255, 255,255}, -- What marker zone will show,   Marker scale (2 x Size), Marker Colour.   
                    text = '[~o~E~w~] To start Fishing',  -- Text in the middle of the Zone
                    textlevel = 'level 0' -- Text in the middle of the Zone
                },
                { ----- level 5 Area
                    Center = vector3(-1779.70,-1590.56,-0.29), -- Center of the zone
                    Size = 50.0,                    -- Size of the zone
                    AmountCanCatch = 10,
                    XP = 500, -- 500xp = 5 lvl
                    marker= 1, rgba = {255, 255, 255,255},
                    text = '[~o~E~w~] To start Fishing',
                    textlevel = 'level 5'
                },
                {----- level 10 Area
                    Center = vector3(-1903.39,-1477.56,0.24), -- Center of the zone
                    Size = 50.0,                    -- Size of the zone
                    AmountCanCatch = 15,
                    XP = 1000, -- 1000xp = 10 lvl
                    marker= 1, rgba = {255, 255, 255,255}, 
                    text = '[~o~E~w~] To start Fishing',
                    textlevel = 'level 10'
                },
                { ----- level 15 Area
                    Center = vector3(-2068.54,-1429.21,-0.25), -- Center of the zone
                    Size = 50.0,                    -- Size of the zone
                    AmountCanCatch = 20,
                    XP = 1500, -- 1500xp = 15 lvl
                    marker= 1, rgba = {255, 255, 255,255},
                    text = '[~o~E~w~] To start Fishing',
                    textlevel = 'level 15'
                },       
            },
        },
        ------FISHER JOB END







        ------ SCRAPYARD MINER
        ScrapMiner = {
            vehiclemenu = {
                spawnvehicle = vector3(-1327.53, -929.67, 11.2),  ----- Where bike spawns
                returnvehicle = vector3(-1316.88, -936.86, 9.73),  ---- Where you return the bike
                bikes = {
                    ["Akuma"] = { label = "AKUMA", level = 0,  price = 100},
                    ["Defiler"] = { label = "DEFILER", level = 5,  price = 1000}, ----- You can change [] with a car model you want, but it have to be VEHICLES ID
                    ["Double"] = { label = "DOUBLE", level = 10,  price = 1500},  ----- You can change LABEL, LEVEL, PRICE
                    ["Carbonrs"] = { label = "CARBON RS", level = 20,  price = 2000},
                },
            },
            clothingmenu = {  ---- Job Clothes 
                clothes = { --https://wiki.rage.mp/index.php?title=Clothes 
                    ManUniform = {  ----- You can change everything here if you understand it
                        label = "STARTER",
                        gender = 0,
                        level = 0,
                        HandsComponent = 3, HandsDrawable = 4, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 2, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 6, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 4, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 1, ShoesTexture = 0, -- Shoes
                    }, 
                    ManUniform2 = {  ----- You can change everything here if you understand it
                        label = "MINER",
                        gender = 0,
                        level = 10,
                        HandsComponent = 3, HandsDrawable = 4, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 106, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 74, TopTexture = 3, -- TOP 
                        PantsComponent = 4, PantsDrawable = 24, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 8, ShoesTexture = 0, -- Shoes
                    },
                    ManUniform3 = {  ----- You can change everything here if you understand it
                        label = "GRINDER",
                        gender = 0,
                        level = 20,
                        HandsComponent = 3, HandsDrawable = 4, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 21, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 101, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 24, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 7, ShoesTexture = 0, -- Shoes
                    },    
                    WomenUniform = {
                        label = "WOMAN",
                        gender = 1,
                        level = 0,
                        HandsComponent = 3, HandsDrawable = 5, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 20, UndershirtTexture = 1, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 8, TopTexture = 1, -- TOP 
                        PantsComponent = 4, PantsDrawable = 47, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 28, ShoesTexture = 0, -- Shoes
                    }, 
                    WomenUniform2 = {
                        label = "WOMAN2",
                        gender = 1,
                        level = 10,
                        HandsComponent = 3, HandsDrawable = 1, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 13, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 35, TopTexture = 6, -- TOP 
                        PantsComponent = 4, PantsDrawable = 37, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 43, ShoesTexture = 6, -- Shoes
                    },
                    WomenUniform3 = {
                        label = "WOMAN3",
                        gender = 1,
                        level = 20,
                        HandsComponent = 3, HandsDrawable = 1, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 13, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 69, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 54, PantsTexture = 2, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 30, ShoesTexture = 0, -- Shoes
                    },
                },
            },
            taskmenu = {  --- Job Tasks
                tasks = {
                    ["1"] = { label = "BONUS AFTER 10 BATTERIES", AmountToFind = 10, xpgain = 10, reward = 2000},  --- You can change the LABEL, XP and REWARD for completing the TASK
                    ["2"] = { label = "BONUS AFTER 20 BATTERIES", AmountToFind = 20, xpgain = 20, reward = 4500},
                    ["3"] = { label = "BONUS AFTER 50 BATTERIES", AmountToFind = 50, xpgain = 30, reward = 10000},
                },
            },
            GainPerMinute = { ----- Once you place all the batteries every 1 minute for 5 minutes you will recieve price you set below 
                level0 = {price = 400, xpgain = 8, AmountCanPlace = 3}, ----- You can change price, xpgain per batteryfound, AmountCanPlace 
                level5 = {price = 500, xpgain = 7, AmountCanPlace = 4}, ----- The Price is how much money you will get PER 1 MINUTE for 5 minutes
                level10 = {price = 600, xpgain = 6, AmountCanPlace = 5},
                level15 = {price = 700, xpgain = 5, AmountCanPlace = 6},
                level20 = {price = 800, xpgain = 4, AmountCanPlace = 7},
            },
            ScrapSearchAreas = {   --------------- You can add as many zones as you want!!     P.S - make sure you understand what you doing:)  
                
                [1] = vector3(2371.94, 3051.57, 50.93), 
                [2] = vector3(-484.42, -1723.88, 25.86),
                [3] = vector3(-557.57, -1658.04, 18.76),

            },
            BatterySearchAreas = {
                {
                [1] = {vector3(2392.05, 3050.54, 48.74), vector3(2376.0, 3081.52, 48.15), vector3(2336.04, 3055.98, 48.22), vector3(2346.25, 3071.73, 48.85)}, 
                [2] = {vector3(-472.31, -1703.07, 18.92), vector3(-447.01, -1715.66, 18.68), vector3(-481.62, -1761.59, 18.84), vector3(-496.97, -1756.4, 18.44)},
                [3] = {vector3(-567.56, -1674.48, 20.4), vector3(-546.73, -1653.38, 19.31), vector3(-538.85, -1619.1, 18.04), vector3(-521.61, -1625.48, 17.8)}, 
                },
            },
        },
        ----- SCRAP MINER END






        ----- CARGO JOB
        Cargo = {
            chopermenu = {
                spawnvehicle = vector3(-724.43,-1443.92,5.00),  ----- Where chopper spawns
                returnvehicle = vector3(-744.98,-1468.30,5.00),  ---- Where you return the chopper
                chopers = {
                    ["Cargobob"] = { label = "Choper", level = 0,  price = 100}, ----- You can change [] with a helicopters model you want, but it have to be VEHICLES ID
                    ["Cargobob2"] = { label = "Choper 2", level = 10,  price = 1500},  ----- You can change LABEL, LEVEL, PRICE
                    ["Cargobob3"] = { label = "Choper 3", level = 15,  price = 2000},
                    ["Cargobob4"] = { label = "Choper 4", level = 20,  price = 2500},
                },
            },
            clothingmenu = {  ---- Job Clothes 
                clothes = { --https://wiki.rage.mp/index.php?title=Clothes 
                    ManUniform = {  ----- You can change everything here if you understand it
                        label = "ROOKIE",
                        gender = 0,
                        level = 0,
                        HandsComponent = 3, HandsDrawable = 4, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 15, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 48, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 30, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 51, ShoesTexture = 0, -- Shoes
                    }, 
                    ManUniform2 = {  ----- You can change everything here if you understand it
                        label = "PILOT",
                        gender = 0,
                        level = 10,
                        HandsComponent = 3, HandsDrawable = 4, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 15, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 54, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 34, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 60, ShoesTexture = 0, -- Shoes
                    },
                    ManUniform3 = {  ----- You can change everything here if you understand it
                        label = "CAPTAIN",
                        gender = 0,
                        level = 20,
                        HandsComponent = 3, HandsDrawable = 4, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 72, UndershirtTexture = 3, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 77, TopTexture = 3, -- TOP 
                        PantsComponent = 4, PantsDrawable = 51, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 15, ShoesTexture = 0, -- Shoes
                    },    
                    WomenUniform = {
                        label = "WOMAN",
                        gender = 1,
                        level = 0,
                        HandsComponent = 3, HandsDrawable = 1, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 2, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 41, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 29, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 26, ShoesTexture = 0, -- Shoes
                    }, 
                    WomenUniform2 = {
                        label = "WOMAN2",
                        gender = 1,
                        level = 10,
                        HandsComponent = 3, HandsDrawable = 1, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 2, UndershirtTexture = 0, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 47, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 33, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 26, ShoesTexture = 0, -- Shoes
                    },
                    WomenUniform3 = {
                        label = "WOMAN3",
                        gender = 1,
                        level = 20,
                        HandsComponent = 3, HandsDrawable = 3, HandsTexture = 0, -- HANDS
                        UndershirtComponent = 8, UndershirtDrawable = 67, UndershirtTexture = 5, -- UNDERSHIRT
                        TopComponent = 11, TopDrawable = 139, TopTexture = 0, -- TOP 
                        PantsComponent = 4, PantsDrawable = 77, PantsTexture = 0, -- Pants
                        ShoesComponent = 6, ShoesDrawable = 27, ShoesTexture = 0, -- Shoes
                    },
                },
            },
            taskmenu = {  --- Job Tasks
                tasks = {
                    ["1"] = { label = "BONUS AFTER 10 DELIVERY", AmountToFind = 10, xpgain = 30, reward = 2000},  --- You can change the LABEL, XP and REWARD for completing the TASK
                    ["2"] = { label = "BONUS AFTER 20 DELIVERY", AmountToFind = 20, xpgain = 45, reward = 4500},
                    ["3"] = { label = "BONUS AFTER 50 DELIVERY", AmountToFind = 50, xpgain = 80, reward = 10000},
                },
            },
            pickupvehicles = {  ----- YOU CAN ADD MORE CARS BUT NOT LEVELS
                level0 = {
                    [1] = {car = "Tempesta", price = 1000, xpgain = 8},   ---- You can change PRICE, XP that you get from selling the vehicle
                    [2] = {car = "Nero", price = 1100, xpgain = 8},
                },
                level5 = {
                    [1] = {car = "Windsor2", price = 1500, xpgain = 7},    
                    [2] = {car = "Comet2", price = 1600, xpgain = 7},
                },
                level10 = {
                    [1] = {car = "Ninef", price = 2000, xpgain = 6},
                    [2] = {car = "Tropos", price = 2100, xpgain = 6},
                },
                level15 = {
                    [1] = {car = "Superd", price = 2500, xpgain = 5},
                    [2] = {car = "Turismo2", price = 2600, xpgain = 5},
                },
                level20 = {
                    [1] = {car = "Zentorno", price = 3000, xpgain = 4},
                    [2] = {car = "ZType", price = 3100, xpgain = 4},
                },
            },
            CargoDropAreas = {   --------------- You can add as many zones as you want!!     P.S - make sure you understand what you doing:)  
                {
                    pickuplocations = 
                    {
                        [1] = vector3(-806.15,428.26,91.02), 
                        [2] = vector3(-1105.92,555.62,102.21),
                        [3] = vector3(1200.36,-3066.77,6.00), 
                        [4] = vector3(1239.24,-2978.34,14.98),
                        [5] = vector3(129.85,-1069.79,29.19),
                        [6] = vector3(23.54,-1065.77,38.15),
                        [7] = vector3(18.56,-1724.85,29.30),
                        [8] = vector3(-457.30,-1713.17,18.64),
                        [9] = vector3(-1556.39,113.40,56.77),
                    },
                    deliverlocations =
                    {
                        [1] = vector3(-1453.39,-54.61,52.84), 
                        [2] = vector3(-1183.93,286.07,69.49),
                        [3] = vector3(-669.83,910.24,230.14),
                        [4] = vector3(-58.29,337.10,111.59),
                        [5] = vector3(604.90,119.74,92.89),
                        [6] = vector3(775.45,224.08,85.76),
                    },
                },
            },
        },
        ----- CARGO JOB END




    },








    Text = {
        ['thunter-holo'] = '[~o~E~w~] Treasure Hunter',
        ['fisher-holo'] = '[~o~E~w~] Fisher',
        ['cargo-holo'] = '[~o~E~w~] Cargo Delivery',
        ['scrap-holo'] = '[~o~E~w~] Scrap Miner',


        ['interferedfisher'] = 'You got distracted, the fish escaped!', 

        ['invehicle'] = 'You already in a Vehicle',
        ['insidevehicle'] = 'You have to get out of the Vehicle',
        ['notinsidevehicle']= 'You have to be sitting in the Vehicle!',
        ['missingmoney'] = 'You do not have enough money',
        ['returncar'] = '[~o~E~w~] To return Work Vehicle',
        ['offduty'] = 'Off Duty!',
        ['onduty'] = 'On Duty!',
        ['wearing'] = 'You have to take off your Job Clothes!',
        ['notwearing'] = 'You have to wear Job Clothes!',
        ['firstreturn'] = 'Return your job vehicle!',
        ['notjobcar'] = 'This car is not a job car!',
        ['noworkcar'] = 'You don\'t have a work Vehicle',


        ['nearchest'] = '[~o~E~w~] to pick up Chest',
        ['opening'] = 'Opening...',
        ['foundnothing'] = 'You found nothing',
        ['foundchain'] = 'You found a Gold Chain',
        ['foundbar'] = 'You found a Gold Bar',
        ['foundring'] = 'You found a Diamond Ring',
        ['noloot'] = 'You have no loot to sell',



        ['working'] = 'Fishing...',
        ['caughtnothing'] = 'A fish escaped',
        ['caughtfish'] = 'You caught a fish',
        ['caughtshark'] = 'You caught a shark',
        ['caughtgoldfish'] = 'You caught a goldfish',
        ['tooheavy'] = 'The fish was too heavy, you released it',
        ['fullbucket'] = 'You already have a full bucket',
        ['notxp'] = 'Your level isn\'t high enough to fish here',
        ['nofish'] = 'You have no Fish to sell',
        ['swimming'] = 'You can\'t do that while swimming...',


        ['foundsuccesfully'] = 'Cargo found, go to the delivery location!',
        ['drop'] = 'Drop the car near the Client',
        ['delivered'] = 'Cargo was delivered successfully!',
        ['damaged'] = 'The cargo was destroyed',
    
    
        ['search'] = '[~o~E~w~] to search for Battery',
        ['searching'] = 'Searching...',
        ['foundbattery'] = 'You found a battery!',
        ["cantmore"] = 'You can\'t hold more!',
        ["minerworking"] = 'The miner is heating up!',
        ["notenough"] = 'You don\'t have enough batteries!',
        ['minerstillworking'] = 'Miner is still working!',
        ['neednew'] = 'Batteries need to be changed!'
    },
}    