--ONLY CONFIG NAMED sh_config.lua will work!

Config = {}

Config.Debug = false -- Debug
--SERVER SETTINGS
Config.Framework = "auto-detect" -- Framework | types: auto-detect, qbcore, ESX, standalone

Config.NewESX = true

Config.Target = "auto-detect" -- Target | types: auto-detect, qb-target, qtarget, ox_target
Config.BossMenu = "auto-detect" -- BossMenu | types: auto-detect, esx_society, qb-management

Config.NotificationType = "qbcore" -- Notifications | types: ESX, ox_lib, qbcore
Config.Progress = "ox_lib_circle" -- ProgressBar | types: progressBars, ox_lib_square, ox_lib_circle, qbcore | Preview: ox_lib_square = https://imgur.com/bgVWs4u , ox_lib_circle = https://imgur.com/Tfq8CA0 , qbcore = https://imgur.com/ru33FYA
Config.Clothing = "auto-detect" -- Skin / Clothing | types: auto-detect, esx_skin, qb-clothing, fivem-appearance, ox_appearance
Config.Context = "ox_lib" -- Context | types: ox_lib, qbcore
Config.Input = "ox_lib" -- Input | types: ox_lib, qb-input
Config.PoliceJobs = { 'police', 'sheriff' } -- Jobs which can be alerted
Config.Dispatch = { enabled = true, script = "linden_outlawalert" } -- cd_dispatch, linden_outlawalert, ps-disptach
--PLAYER SETTINGS
Config.JobName = "bakery" -- Job name for bakery
Config.BossGrade = 5 -- Boss Grade
Config.NeedDuty = true -- Required duty to make drinks etc.
Config.NeedCleanHands = true -- Required to clean hands to make drinks etc.

Config.Logs = { enabled = true, type = "webhook" } -- use webhook or ox_lib (datadog) Can be changed in server > sv_utils.lua
Config.DropPlayer = false -- Drop (Kick) Player if tries to cheat!
Config.AnticheatBan = false -- Change in server/sv_Utils.lua!!! WIll not work by default you need to add your custom trigger to ban player!

Config.Inventory = "auto-detect" -- auto-detect, ox, quasar, chezza, qb

Config.bakery = {

    CloakRoom = {
        Main = { coords = vector3(48.19, -132.94, 56.01), radius = 0.5, debug = false },
    },

    PolyZone = {
        coords = vector3(52.96, -130.19, 54.46), size = vec3(100.0, 100.0, 100.0), rotation = 270, debug = false, RemovePeds = true, radius = 50.0
    },

    Garage = {
        Ped = {
            { Model = "s_m_y_xmech_01", Coords = vec4(50.47, -108.41, 55.0, 347.12),
                Scenario = "WORLD_HUMAN_CLIPBOARD_FACILITY"
            }
        },
        Vehicles = {
            { Model = "nspeedo", Label = "Vapid Speedo", livery = 0, image = "https://cdn.discordapp.com/attachments/936585783761051658/1107928643906314251/image.png", metadata = {""}, },
        },
        SpawnPoints = {
            { Coords = vector3(45.24, -101.38, 55.18), Heading = 250.21, Radius = 3.0 }
        },
    },

    AlertPolice = vec3(54.12, -132.39, 55.16),

    Delivery = vec3(56.96, -129.97, 55.9),

    SpawnObjects = true,

    Sinks = {
        Zones = {
            Sink = {
                coords = vector3(56.06, -132.69, 55.59),
                radius = 0.35,
                debug = false,
                WaterStream = vector3(56.09, -132.73, 55.57),
            },
        },

        Crafting = {
            CleaCoffeeCup = {
                Title = "Clean Coffee Cup", 
                description = "Required Item: Dirty Coffee Cup",
                image = "https://i.imgur.com/qZHnlrn.png",
                metadata = {""},
                RequiredItems = {
                    { item = "coffee_cup_dirty", count = 1, remove = true },
                },
                AddItems = {
                    { item = "coffee_cup ", count = 1 },
                }
            },
        },
    },

    Duty = {
        Main = { coords = vector3(57.64, -129.8, 55.74), radius = 0.2, debug = false },
    },

    Coffeemachine = {
        Zones = {
            Main = { coords = vector3(56.42, -131.15, 55.76), radius = 0.25, debug = false },
        },

        Crafting = {
            espresso = {
                Title = "Espresso",
                description = "Requirements: Coffee Beans, Coffee Cup, Crema",
                image = "https://i.imgur.com/IwQZNk2.png",
                metadata = {""},
                RequiredItems = {
                    { item = "coffee_cup", count = 1, remove = true },
                    { item = "coffee_beans", count = 1, remove = true },
                    { item = "crema", count = 1, remove = true },
                },
                AddItems = {
                    { item = "espresso", count = 1 },
                }
            },
            americano = {
                Title = "Americano",
                description = "Requirements: Espresso, Coffee Cup",
                image = "https://i.imgur.com/HO7zsMO.png",
                metadata = {""},
                RequiredItems = {
                    { item = "espresso", count = 1, remove = true },
                    { item = "coffee_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "americano", count = 1 },
                }
            },
            coffee = {
                Title = "Classic Coffee",
                description = "Requirements: Milk, Sugar, Coffee Beans, Coffee Cup",
                image = "https://i.imgur.com/Sl7AXVq.png",
                metadata = {""},
                RequiredItems = {
                    { item = "milk", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "coffee_beans", count = 1, remove = true },
                    { item = "coffee_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "coffee", count = 1 },
                }
            },
            ChocolateMilk = {
                Title = "Chocolate Milk / Coffee",
                description = "Requirements: Espresso, Milk, Sugar, Grated Chocolate, Coffee Cup",
                image = "https://i.imgur.com/jj55w6U.png",
                metadata = {""},
                RequiredItems = {
                    { item = "espresso", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "grated_chocolate", count = 1, remove = true },
                    { item = "coffee_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "chocolate_coffee", count = 1 },
                }
            },
            GreenTea = {
                Title = "Green Tea",
                description = "Requirements: Green Tea Box, Coffee Cup",
                image = "https://i.imgur.com/lMccNLH.png",
                metadata = {""},
                RequiredItems = {
                    { item = "green_tea_box", count = 1, remove = true },
                    { item = "coffee_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "green_tea", count = 1 },
                }
            },
        },
    },

    Desert = {
        Zones = {
            Main = { coords = vector3(60.95, -135.09, 55.4), radius = 0.35, debug = false },
        },
        Crafting = {
            ChocolateCroissant = {
                Title = "Chocolate Croissant",
                description = "Required Item: Flour, Milk, Oil, Yeast Cube, Eggs, Sugar",
                image = "https://i.imgur.com/IATheOj.png",
                metadata = {""},
                RequiredItems = {
                    { item = "flour", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "oil", count = 1, remove = true },
                    { item = "yeast_cube", count = 1, remove = true },
                    { item = "eggs", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                },
                AddItems = {
                    { item = "dough", count = 1 },
                }
            },
            ClassicDonut = {
                Title = "Classic Donut",
                description = "Required Item: Flour, Milk, Butter, Sugar, Eggs",
                image = "https://i.imgur.com/IATheOj.png",
                metadata = {""},
                RequiredItems = {
                    { item = "flour", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "butter", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "eggs", count = 1, remove = true },
                },
                AddItems = {
                    { item = "dough", count = 1 },
                }
            },
            ChocolateMuffin = {
                Title = "Chocolate Muffin",
                description = "Required Item: Eggs, Butter, Milk, Sugar, Flour",
                image = "https://i.imgur.com/4sd6d0r.png",
                metadata = {""},
                RequiredItems = {
                    { item = "eggs", count = 1, remove = true },
                    { item = "butter", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "flour", count = 1, remove = true },
                },
                AddItems = {
                    { item = "liquid_dough", count = 1 },
                }
            },
            Cookies = {
                Title = "Cookies",
                description = "Required Item: Chocolate, Flour, Butter, Sugar, Eggs, Milk, Vanilla Sugar",
                image = "https://i.imgur.com/4sd6d0r.png",
                metadata = {""},
                RequiredItems = {
                    { item = "chocolate", count = 1, remove = true },
                    { item = "flour", count = 1, remove = true },
                    { item = "butter", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "eggs", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "vanilla_sugar", count = 1, remove = true },
                },
                AddItems = {
                    { item = "liquid_dough", count = 1 },
                }
            },
            StrawberryShortcake = {
                Title = "Shortcake",
                description = "Required Item: Flour, Sugar, Eggs, Milk, Yeast Cube",
                image = "https://i.imgur.com/IATheOj.png",
                metadata = {""},
                RequiredItems = {
                    { item = "flour", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "eggs", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "yeast_cube", count = 1, remove = true },
                },
                AddItems = {
                    { item = "dough", count = 1 },
                }
            },
            CzechBread = {
                Title = "CzechBread",
                description = "Required Item: Flour, Water, Yeast Cube, Oil, Sugar",
                image = "https://i.imgur.com/IATheOj.png",
                metadata = {""},
                RequiredItems = {
                    { item = "flour", count = 1, remove = true },
                    { item = "water", count = 1, remove = true },
                    { item = "yeast_cube", count = 1, remove = true },
                    { item = "oil", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                },
                AddItems = {
                    { item = "dough", count = 1 },
                }
            },
            ApplePie = {
                Title = "Grandma's Apple pie",
                description = "Required Item: Flour, Butter, Eggs, Apples, Lemon, Sugar, Breadcrumbs",
                image = "https://i.imgur.com/zQDrUOM.png",
                metadata = {""},
                RequiredItems = {
                    { item = "flour", count = 1, remove = true },
                    { item = "butter", count = 1, remove = true },
                    { item = "eggs", count = 1, remove = true },
                    { item = "apples", count = 1, remove = true },
                    { item = "lemon", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "breadcrumbs", count = 1, remove = true },
                },
                AddItems = {
                    { item = "apple_pie_dough", count = 1 },
                }
            },
        },
    },

    Baker = {
        Zones = {
            Main = { coords = vector3(61.91, -129.17, 55.8), radius = 0.35, debug = false },
        },
        Crafting = {
            CroissantChocolate = {
                Title = "Croissant Chocolate",
                description = "Required Item: Unbaked Croissant Chocolate",
                image = "https://i.imgur.com/TS8g5xO.png",
                metadata = {""},
                RequiredItems = {
                    { item = "unbaked_croissant_chocolate", count = 1, remove = true },
                },
                AddItems = {
                    { item = "chocolate_croissant", count = 1 },
                }
            },
            Donut = {
                Title = "Donut",
                description = "Required Item: Unbaked Donut",
                image = "https://i.imgur.com/L58T8gx.png",
                metadata = {""},
                RequiredItems = {
                    { item = "unbaked_donut", count = 1, remove = true },
                },
                AddItems = {
                    { item = "donut", count = 1 },
                }
            },
            Muffin = {
                Title = "Muffin",
                description = "Required Item: Muffin Tin",
                image = "https://i.imgur.com/0dlyP3u.png",
                metadata = {""},
                RequiredItems = {
                    { item = "muffin_tin", count = 1, remove = true },
                },
                AddItems = {
                    { item = "muffin", count = 1 },
                }
            },
            Cookies = {
                Title = "Cookies",
                description = "Required Item: Liquid Dough",
                image = "https://i.imgur.com/HZsHnSV.png",
                metadata = {""},
                RequiredItems = {
                    { item = "liquid_dough", count = 1, remove = true },
                },
                AddItems = {
                    { item = "cookies", count = 1 },
                }
            },
            Shortcake = {
                Title = "Shortcake",
                description = "Required Item: Shortcake Dough",
                image = "https://i.imgur.com/AayU9yM.png",
                metadata = {""},
                RequiredItems = {
                    { item = "shortcake_dough", count = 1, remove = true },
                },
                AddItems = {
                    { item = "shortcake", count = 1 },
                }
            },
            CzechBread = {
                Title = "Czechia Bread",
                description = "Required Item: Dough",
                image = "https://i.imgur.com/S1q0SPs.png",
                metadata = {""},
                RequiredItems = {
                    { item = "dough", count = 1, remove = true },
                },
                AddItems = {
                    { item = "czech_bread", count = 1 },
                }
            },
            GrandmaApplePie = {
                Title = "Grandmas Apple Pie",
                description = "Required Item: Apple Pie Dough",
                image = "https://i.imgur.com/DlQ6Sr4.png",
                metadata = {""},
                RequiredItems = {
                    { item = "apple_pie_dough", count = 1, remove = true },
                },
                AddItems = {
                    { item = "apple_pie", count = 1 },
                }
            },
        },
    },

    Tables = {
        Zones = {
            Main = { coords = vector3(59.40974044799805, -134.51622009277344, 55.39686965942383), radius = 0.55, debug = false },
        },
        
        Crafting = {
            Chocotale = {
                Title = "Chocolate",
                description = "Required Items: Grater, Chocolate",
                image = "https://i.imgur.com/wp6EOvI.png",
                metadata = {""},
                RequiredItems = {
                    { item = "grater", count = 1, remove = false },
                    { item = "chocolate", count = 1, remove = true },
                },
                AddItems = {
                    { item = "grated_chocolate", count = 1 },
                }
            },
            unbaked_croissant_chocolate = {
                Title = "Unbaked Croissant Chocolate",
                description = "Required Items: Dough, Eggs, Hersheys",
                image = "https://i.imgur.com/TS8g5xO.png",
                metadata = {""},
                RequiredItems = {
                    { item = "dough", count = 1, remove = true },
                    { item = "eggs", count = 1, remove = true },
                    { item = "hersheys", count = 1, remove = true },
                },
                AddItems = {
                    { item = "unbaked_croissant_chocolate", count = 1 },
                }
            },
            unbaked_donut = {
                Title = "Unbaked Donut",
                description = "Required Items: Dough",
                image = "https://i.imgur.com/L58T8gx.png",
                metadata = {""},
                RequiredItems = {
                    { item = "dough", count = 1, remove = true },
                },
                AddItems = {
                    { item = "unbaked_donut", count = 1 },
                }
            },
            Muffin = {
                Title = "Unbaked Muffins",
                description = "Required Items: Liquid Dough, Muffin Tin",
                image = "https://i.imgur.com/YdoQFI7.png",
                metadata = {""},
                RequiredItems = {
                    { item = "liquid_dough", count = 1, remove = true },
                    { item = "muffin_tin", count = 1, remove = false },
                },
                AddItems = {
                    { item = "muffin_tin_filled", count = 1 },
                }
            },
            Shortcake = {
                Title = "Unbaked Shortcakes",
                description = "Required Items: Dough",
                image = "https://i.imgur.com/JmCayfJ.png",
                metadata = {""},
                RequiredItems = {
                    { item = "dough", count = 1, remove = true },
                },
                AddItems = {
                    { item = "shortcake_dough", count = 1 },
                }
            },
            DonutFill1 = {
                Title = "Chocolate Donut",
                description = "Required Items: Donut, Chocolate Topping",
                image = "https://i.imgur.com/Ece6UEx.png",
                metadata = {""},
                RequiredItems = {
                    { item = "donut", count = 1, remove = true },
                    { item = "chocolate_topping", count = 1, remove = true },
                },
                AddItems = {
                    { item = "chocolate_donut", count = 1 },
                }
            },
            DonutFill2 = {
                Title = "Pink Donut",
                description = "Required Items: Donut, Pink Topping",
                image = "https://i.imgur.com/JpdyqnJ.png",
                metadata = {""},
                RequiredItems = {
                    { item = "donut", count = 1, remove = true },
                    { item = "pink_topping", count = 1, remove = true },
                },
                AddItems = {
                    { item = "pink_donut", count = 1 },
                }
            },
            MuffinMake1 = {
                Title = "Chocolate Muffin",
                description = "Required Items: Muffin, Chocolate Topping",
                image = "https://i.imgur.com/ynHdLgd.png",
                metadata = {""},
                RequiredItems = {
                    { item = "muffin", count = 1, remove = true },
                    { item = "chocolate_topping", count = 1, remove = true },
                },
                AddItems = {
                    { item = "chocolate_muffin", count = 1 },
                }
            },
            MuffinMake2 = {
                Title = "Blackberry Muffin",
                description = "Required Items: Muffin, Blackberry",
                image = "https://i.imgur.com/bqR1HKR.png",
                metadata = {""},
                RequiredItems = {
                    { item = "muffin", count = 1, remove = true },
                    { item = "blackberry", count = 1, remove = true },
                },
                AddItems = {
                    { item = "blackberry_muffin", count = 1 },
                }
            },
            ShortcakeMake1 = {
                Title = "Shortcake with Strawberries",
                description = "Required Items: Shortcake, Strawberry",
                image = "https://i.imgur.com/GapzglK.png",
                metadata = {""},
                RequiredItems = {
                    { item = "shortcake", count = 1, remove = true },
                    { item = "strawberry", count = 1, remove = true },
                },
                AddItems = {
                    { item = "shortcake_strawberry", count = 1 },
                }
            },
            ShortcakeMake2 = {
                Title = "Shortcake with Plumes",
                description = "Required Items: Shortcake, Plum",
                image = "https://i.imgur.com/bKm7Lsc.png",
                metadata = {""},
                RequiredItems = {
                    { item = "shortcake", count = 1, remove = true },
                    { item = "plum", count = 1, remove = true },
                },
                AddItems = {
                    { item = "shortcake_plum", count = 1 },
                }
            },
        },
    },

    CrushedIce = {
        Zones = {
            Main = { coords = vector3(56.23, -131.9, 55.79), radius = 0.25, debug = false },
        },
        
        Crafting = {
            multivitamin_crushedice = {
                Title = "Multivitamin",
                description = "Required Items: Cup",
                image = "https://i.imgur.com/WLbt94L.png",
                metadata = {""},
                RequiredItems = {
                    { item = "cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "multivitamin_crushedice", count = 1 },
                }
            },
            lemon_crushedice = {
                Title = "Lemon",
                description = "Required Items: Cup",
                image = "https://i.imgur.com/EOQ3vrH.png",
                metadata = {""},
                RequiredItems = {
                    { item = "cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "lemon_crushedice", count = 1 },
                }
            },
        },
    },

    BossMenu = {
        Main = { coords = vector3(57.38087844848633, -130.96160888671875, 55.40564727783203), radius = 0.36, debug = false },
    },

    Registers = {
        FrontBar = { coords = vector3(53.88, -132.76, 55.55), radius = 0.50, debug = false, amount = 0 },
    },


    Stashes = {
        Stash1 = {
            name = "bakery_stash1",
            label = "Stash #1",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 40,
            Weight = 200000, -- 200 KG
            coords = vector3(60.49, -128.66, 55.46),
            radius = 0.4,
            debug = false,
            job = "bakery"
        },

        Stash2 = {
            name = "bakery_stash2",
            label = "Stash #2",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 40,
            Weight = 200000, -- 200 KG
            coords = vector3(63.21, -129.45, 55.9),
            radius = 0.4,
            debug = false,
            job = "bakery"
        },

        Stash3 = {
            name = "bakery_stash3",
            label = "Stash #3",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 40,
            Weight = 200000, -- 200 KG
            coords = vector3(63.15, -129.5, 55.46),
            radius = 0.4,
            debug = false,
            job = "bakery"
        },

        Stash4 = {
            name = "bakery_stash4",
            label = "Stash #4",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 40,
            Weight = 200000, -- 200 KG
            coords = vector3(62.49, -132.36, 55.46),
            radius = 0.4,
            debug = false,
            job = "bakery"
        },

        Stash5 = {
            name = "bakery_stash5",
            label = "Stash #5",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 40,
            Weight = 200000, -- 200 KG
            coords = vector3(59.08, -128.01, 55.46),
            radius = 0.4,
            debug = false
        },
        Stash6 = {
            name = "bakery_stash6",
            label = "Stash #6",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 40,
            Weight = 200000, -- 200 KG
            coords = vector3(54.44, -131.49, 55.46),
            radius = 0.4,
            debug = false
        },

    },
}

--BLIPS
Config.Blips = {
    bakery = { -- do not use same value twice (will result in overwriting of blip)
        BlipCoords = vec3(54.21, -131.92, 55.51), -- Blip coords
        Sprite = 106, -- Blip Icon
        Display = 4, -- keep 4
        Scale = 0.7, -- Size of blip
        Colour = 34, -- colour
        Name = "Trey Bakery" -- Blip name
    },
}

--Job BLIPS
Config.JobBlips = {
    PawnShop = { -- do not use same value twice (will result in overwriting of blip)
        BlipCoords = vec3(375.5, -335.65, 47.3), -- Blip coords
        Sprite = 59, -- Blip Icon
        Display = 4, -- keep 4
        Scale = 0.5, -- Size of blip
        Colour = 34, -- colour
        Name = "Trey Bakery - Shop" -- Blip name
    },
}

--Shop
Config.Shop = {
    Header = "Trey Bakery Shop",
    Items = {
        { label = 'Blackberry', item = 'blackberry', description = "Buy Blackberry for: $", price = 25, MinAmount = 5, MaxAmount = 15, image = "https://i.imgur.com/UEZxgA7.png", metadata = {""}  },
        { label = 'Apples', item = 'apples', description = "Buy Apples for: $", price = 25, MinAmount = 5, MaxAmount = 515, image = "https://i.imgur.com/GKfAvB0.png", metadata = {""}  },
        { label = 'BreadCrumbs', item = 'breadcrumbs', description = "Buy Breadcrumbs for: $", price = 25, MinAmount = 5, MaxAmount = 15, image = "https://i.imgur.com/FDAvZNy.png", metadata = {""}  },
        { label = 'Butter', item = 'butter', description = "Buy Butter for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/cdi2bZZ.png", metadata = {""}  },
        { label = 'Coffee Beans', item = 'coffee_beans', description = "Buy Coffee Beans for: $", price = 25, MinAmount = 5, MaxAmount = 15, image = "https://i.imgur.com/O3j1bUr.png", metadata = {""}  },
        { label = 'Coffee Crema', item = 'coffee_crema', description = "Buy Coffee Crema for: $", price = 25, MinAmount = 5, MaxAmount = 15, image = "https://i.imgur.com/5bJ1bPW.png", metadata = {""}  },
        { label = 'Coffee Cup', item = 'coffee_cup', description = "Buy Coffee Cup for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/NAEk4e9.png", metadata = {""}  },
        { label = 'Cumin', item = 'cumin', description = "Buy Cumin for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/sTPHtbd.png", metadata = {""}  },
        { label = 'Cup', item = 'cup', description = "Buy Cup for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/NKw9PDq.png", metadata = {""}  },
        { label = 'Eggs', item = 'eggs', description = "Buy Eggs for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/e2kgjcP.png", metadata = {""}  },
        { label = 'Flour', item = 'flour', description = "Buy Flour for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/rvxMPS3.png", metadata = {""}  },
        { label = 'Grater', item = 'grater', description = "Buy Grater for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/cUb3dVI.png", metadata = {""}  },
        { label = 'Green Tea Box', item = 'green_tea_box', description = "Buy Green Tea Box for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/17rHrVG.png", metadata = {""}  },
        { label = 'Hersheys', item = 'hersheys', description = "Buy Hersheys for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/g5OpIkU.png", metadata = {""}  },
        { label = 'Chocolate', item = 'chocolate', description = "Buy Chocolate for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/wDvMIk5.png", metadata = {""}  },
        { label = 'Chocolate Topping', item = 'chocolate_topping', description = "Buy Chocolate Topping for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/BN5l1XZ.png", metadata = {""}  },
        { label = 'Lemon', item = 'lemon', description = "Buy Lemon for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/Fu9JWbx.png", metadata = {""}  },
        { label = 'Milk', item = 'milk', description = "Buy Milk for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/QL2feg4.png", metadata = {""}  },
        { label = 'Muffin Tin', item = 'muffin_tin', description = "Buy Muffin Tin for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/yh9FOBn.png", metadata = {""}  },
        { label = 'Oil', item = 'oil', description = "Buy Oil for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/ylSWWLG.png", metadata = {""}  },
        { label = 'Pink Topping', item = 'pink_topping', description = "Buy Pink Topping for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/Llg1xhs.png", metadata = {""}  },
        { label = 'Plum', item = 'plum', description = "Buy Plum for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/3Nsuz5D.png", metadata = {""}  },
        { label = 'Sugar', item = 'sugar', description = "Buy Sugar for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/WpRAhqw.png", metadata = {""}  },
        { label = 'Vanilla Sugar', item = 'vanilla_sugar', description = "Buy Vanilla Sugar for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/iINpRIg.png", metadata = {""}  },
        { label = 'Strawberry', item = 'strawberry', description = "Buy Strawberry for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/iINpRIg.png", metadata = {""}  },
        { label = 'Yeast Cube', item = 'yeast_cube', description = "Buy Yeast Cube for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/nEBmdfo.png", metadata = {""}  },

    },
    Ped = {
        { model = "u_m_y_mani", coords = vec4(375.5, -335.65, 47.3, 252.9), scenario = "WORLD_HUMAN_SMOKING" },
    },
}

-- Consumables / Drinking / Eating  
Config.Consumables = {

    --EAT
    chocolate_donut = { -- Item name
        Log = "You ate Chocolate Donut",
        Remove = true, -- Remove item
        RemoveItem = "chocolate_donut", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { { status = "hunger", add = 100000 }, { status = "thirst", add = 100000 }, },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    pink_donut = { -- Item name
        Log = "You ate Pink Donut",
        Remove = true, -- Remove item
        RemoveItem = "pink_donut", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    chocolate_muffin = { -- Item name
        Log = "You ate Chocolate Muffin",
        Remove = true, -- Remove item
        RemoveItem = "chocolate_muffin", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    blackberry_muffin = { -- Item name
        Log = "You ate Blackberry Muffin",
        Remove = true, -- Remove item
        RemoveItem = "blackberry_muffin", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    shortcake_strawberry = { -- Item name
        Log = "You ate Shortcake Strawberry ",
        Remove = true, -- Remove item
        RemoveItem = "shortcake_strawberry", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    shortcake_plum = { -- Item name
        Log = "You ate Shortcake Plum",
        Remove = true, -- Remove item
        RemoveItem = "shortcake_plum", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    chocolate_croissant = { -- Item name
        Log = "You ate Chocolate Croissant",
        Remove = true, -- Remove item
        RemoveItem = "chocolate_croissant", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    czech_bread = { -- Item name
        Log = "You ate Czech Bread",
        Remove = true, -- Remove item
        RemoveItem = "czech_bread", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'v_res_fa_bread03',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    apple_pie = { -- Item name
        Log = "You ate Apple Pie",
        Remove = true, -- Remove item
        RemoveItem = "apple_pie", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_amb_donut',
                    bone = 18905,
                    pos = vec3(0.13, 0.05, 0.02),
                    rot = vec3(-50.0, 100.0, 270.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    
    --# DRINKING #--
    lemon_crushedice = { -- Item name
        Log = "You drunk Lemon Crushedice",
        Remove = true, -- Remove item
        RemoveItem = "lemon_crushedice", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 28422,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    multivitamin_crushedice = { -- Item name
        Log = "You drunk Multivitamin Crushedice",
        Remove = true, -- Remove item
        RemoveItem = "multivitamin_crushedice", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 28422,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    Espresso = { -- Item name
        Log = "You drunk Espresso",
        Remove = true, -- Remove item
        RemoveItem = "espresso", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    Americano = { -- Item name
        Log = "You drunk Hot Americano",
        Remove = true, -- Remove item
        RemoveItem = "americano", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    Coffee = { -- Item name
        Log = "You drunk Coffee",
        Remove = true, -- Remove item
        RemoveItem = "coffee", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    ChocolateCoffee = { -- Item name
        Log = "You drunk Chocolate Coffee",
        Remove = true, -- Remove item
        RemoveItem = "chocolate_coffee", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    green_tea = { -- Item name
        Log = "You drunk Green Tea",
        Remove = true, -- Remove item
        RemoveItem = "green_tea", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_club_vu_coffeecup',
                    bone = 28422,
                    pos = vec3(0.0, 0.0, -0.06),
                    rot = vec3(0.0, 0.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
}

Config.ChairsDebug = false
Config.Chairs = {
    -- CHAIRS 1
    {
        coords = vector3(52.92, -128.32, 55.05), offsetZ = -0.10, heading = 160.08, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(53.55, -128.55, 54.46, 168.49)
    },
    {
        coords = vector3(52.45, -129.59, 54.99), offsetZ = -0.10, heading = 343.27, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(53.07, -129.79, 54.46, 340.85)
    },
    {
        coords = vector3(52.12, -130.72, 55.05), offsetZ = -0.10, heading = 159.76, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(52.65, -130.89, 54.46, 159.87)
    },
    {
        coords = vector3(51.67, -131.99, 54.98), offsetZ = -0.10, heading = 342.55, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(52.26, -132.2, 54.46, 339.82)
    },
    {
        coords = vector3(49.27, -132.24, 55.05), offsetZ = -0.10, heading = 341.46, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(49.22, -132.75, 54.46, 344.12)
    },
    {
        coords = vector3(48.36, -131.92, 55.05), offsetZ = -0.10, heading = 340.12, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(48.21, -132.41, 54.46, 333.58)
    },
    {
        coords = vector3(49.82, -130.73, 55.05), offsetZ = -0.10, heading = 159.8, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(50.01, -130.22, 54.46, 157.38)
    },
    {
        coords = vector3(48.92, -130.37, 55.05), offsetZ = -0.10, heading = 158.9, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(49.05, -129.81, 54.46, 161.19)
    },
    {
        coords = vector3(49.46, -129.16, 55.05), offsetZ = -0.10, heading = 339.15, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(49.15, -129.67, 54.46, 331.69)
    },
    {
        coords = vector3(49.77, -127.57, 55.05), offsetZ = -0.10, heading = 162.13, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(49.97, -127.03, 54.46, 168.05)
    },
    {
        coords = vector3(50.16, -129.46, 55.0), offsetZ = -0.10, heading = 338.98, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(49.95, -126.97, 53.46, 163.01)
    },
    {
        coords = vector3(50.7, -128.06, 55.0), offsetZ = -0.10, heading = 162.09, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(50.91, -127.4, 53.46, 164.3)
    },
    {
        coords = vector3(50.43, -125.8, 55.0), offsetZ = -0.10, heading = 250.4, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(50.31, -126.91, 55.46, 247.22)
    },
    {
        coords = vector3(50.98, -124.99, 55.0), offsetZ = -0.10, heading = 201.19, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(53.59, -126.92, 55.46, 248.23)
    },
    {
        coords = vector3(55.1, -126.24, 55.05), offsetZ = -0.10, heading = 252.71, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(54.94, -126.85, 54.46, 252.56)
    },
    {
        coords = vector3(56.51, -126.74, 55.05), offsetZ = -0.10, heading = 72.32, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(56.23, -127.38, 54.46, 73.19)
    },
}

Config.Delivery = {
    {     
        item = "apple_pie", -- Item name
        Label = "Apple Pie", -- Item label
        MinPrice = 850, -- Min price
        MaxPrice = 1000, -- Max price
        MinCount = 2, -- Min Count
        MaxCount = 2, -- Max Count
    },
    {   
        item = "lemon_crushedice", -- Item name
        Label = "Lemon Crushed Ice", -- Item label
        MinPrice = 850, -- Min price
        MaxPrice = 1000, -- Max price
        MinCount = 2, -- Min Count
        MaxCount = 2, -- Max Count
    },
    {   
        item = "cookies", -- Item name
        Label = "Cookies", -- Item label
        MinPrice = 850, -- Min price
        MaxPrice = 1000, -- Max price
        MinCount = 2, -- Min Count
        MaxCount = 2, -- Max Count
    },
    {   
        item = "chocolate_croissant", -- Item name
        Label = "Chocolate Croissant", -- Item label
        MinPrice = 850, -- Min price
        MaxPrice = 1000, -- Max price
        MinCount = 2, -- Min Count
        MaxCount = 2, -- Max Count
    },
}