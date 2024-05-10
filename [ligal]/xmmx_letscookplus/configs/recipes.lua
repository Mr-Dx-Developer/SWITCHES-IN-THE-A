Cooking = Cooking or {}

Cooking = { -- Create new ingredients, adjust the ingredients below, or move them around to the object of your choice!                                                                                                                         
	Stoves = {
		{ lclemonlobster    = { lclobstertails = 1, lcbutter = 1,       lclemon = 1,      }, amount = 2, },
        { lccheeseburger    = { lcbeefpatty = 1,    lcburgerbun = 1,    lccheese = 1,     }, amount = 2, },
        { lcsausagedog      = { lcsausage = 1,      lcbread = 1,        lcveggiepack = 1, }, amount = 2, },
        { lcgumbo           = { lcsausage = 1,      lcveggiepack = 1,   lcseasoning = 1,  }, amount = 2, },
        { lccurrgoat        = { lcrawgoat = 1,      lcdryrice = 1,      lcseasoning = 1,  }, amount = 2, },
        { lcricepeas        = { lccanpeas = 1,      lcdryrice = 1,      lcseasoning = 1,  }, amount = 2, },
        { lcyellrice        = { lcdryrice = 1,      lcpeppers = 1,      lcseasoning = 1,  }, amount = 2, },
        { lcoxtails         = { lcrawoxtail = 1,    lcdryrice = 1,      lccanpeas = 1,    lcseasoning = 1, }, amount = 2, },
        { lcpepshrimp       = { lcrawshrimp = 1,    lcdryrice = 1,      lcseasoning = 1,  lcplantain = 1,  }, amount = 2, },

        -- Example of adding a drug to stove:
        --{ crack_baggy = { coke_brick = math.random(1, 3), baking_soda = math.random(1, 5), water_jug = math.random(3, 5), }, amount = math.random(40, 60), },
	},
	Microwaves = {
		{ lcmaccheesy       = { lcmaccheese = 1,    lcbutter = 1,       water_bottle = 1,   }, amount = 2, },
        { lchotcakes        = { lcpancakes = 1,     lcbutter = 1,       lcsyrup = 1,        }, amount = 2, },
        { lcricebowl        = { lcdryrice = 1,      lcbutter = 1,       water_bottle = 1,   }, amount = 2, },
        { lcramennoodle     = { lcramenpack = 1,    water_bottle = 1,   lcseasoning = 1,    }, amount = 2, },
        { lcquickpizza      = { lcfrozenpizza = 1,  lcsausage = 1,      lccheese = 1,       }, amount = 2, },
	},
    Juicers = {
		{ lcgrapejuice      = { lcgrapes = 1,       lcsugar = 1,        water_bottle = 1,   }, amount = 2, },
        { lcapplejuice      = { lcapple = 1,        lcsugar = 1,        water_bottle = 1,   }, amount = 2, },
        { lcorangejuice     = { lcorange = 1,       lcsugar = 1,        water_bottle = 1,   }, amount = 2, },
        { lcnanasmoothie    = { lcbanana = 1,       lcicecubes = 1,     lcmilk = 1,         }, amount = 2, },
        { lcberrysmoothie   = { lcstrawberry = 1,   lcicecubes = 1,     lcmilk = 1,         }, amount = 2, },
	},
    Coffees = {
		{ lccuptea          = { lcteabag = 1,       lcsugar = 1,        water_bottle = 1,   }, amount = 2, },
        { lccupcoffee       = { lccoffeepod = 1,    lccreamer = 1,      water_bottle = 1,   }, amount = 2, },
        { lchotcocoa        = { lccocoapod = 3,     lcsugar = 1,        water_bottle = 1,   }, amount = 2, },
        { lcgreentea        = { lcgteapod = 1,      lcsugar = 1,        water_bottle = 1,   }, amount = 2, },
        { lccappucino       = { lccoffeepod = 5,    lcmilk = 1,         water_bottle = 1,   }, amount = 2, },
	},
    Grills = {
		{ lcribs            = { lcrawribs = 1,      lcseasoning = 1,    lcbbqsauce = 1,     }, amount = 2, },
        { lclegquarter      = { lcrawchicken = 1,   lcseasoning = 1,    lcbbqsauce = 1,     }, amount = 2, },
        { lcsteak           = { lcrawbeef = 1,      lcbutter = 1,       lcseasoning = 1,    }, amount = 2, },
        { lcgrillcorn       = { lccorncob = 1,      lcseasoning = 1,    lcbutter = 1,       }, amount = 2, },
        { lcgrillveggies    = { lcveggiepack = 1,   lcseasoning = 1,    lcbutter = 1,       }, amount = 2, },
	},
    Toasters = {
		{ lctoast           = { lcbread = 1,        lcpbutter = 1,      lcjelly = 1,        }, amount = 2, },
        { lcpoptart         = { lcptartpk = 1,      lcbutter = 1,       lcicing = 1,        }, amount = 2, },
        { lcwaffle          = { lcfrozewaff = 1,    lcbutter = 1,       lcsyrup = 1,        }, amount = 2, },
        { lctoasti          = { lcbread = 1,        lccheese = 1,       lcbutter = 1,       }, amount = 2, },
        { lchamtoastie      = { lcbread = 1,        lchamslice = 1,     lccheese = 1,       }, amount = 2, },
	},
    Fryers = {
		{ lcfriedchicken    = { lcrawchicken = 1,   lcflour = 1,        lcvegoil = 1,       }, amount = 2, },
        { lccheesesticks    = { lccheestkpk = 1,    lcvegoil = 1,       lcmarinara = 1,     }, amount = 2, },
        { lcfrenchfries     = { lcpotato = 1,       lcseasoning = 1,    lcvegoil = 1,       }, amount = 2, },
        { lclambchops       = { lcrawchops = 1,     lcflour = 1,        lcvegoil = 1,       }, amount = 2, },
        { lcfriedfish       = { lcrawfish = 1,      lcflour = 1,        lcvegoil = 1,       }, amount = 2, },
        { lccurrgoat        = { lcrawgoat = 1,      lcdryrice = 1,      lcseasoning = 1,    }, amount = 2, },
        { lcricepeas        = { lccanpeas = 1,      lcdryrice = 1,      lcseasoning = 1,    }, amount = 2, },
        { lcyellrice        = { lcdryrice = 1,      lcpeppers = 1,      lcseasoning = 1,    }, amount = 2, },
	},
    Griddles = {
		{ lcsalmon          = { lcrawsalmon = 1,    lcseasoning = 1,    lclemon = 1,        }, amount = 2, },
        { lcbstirfry        = { lcbeefstrips = 1,   lcveggiepack = 1,   lcbutter = 1,       }, amount = 2, },
        { lcchickensand     = { lcrawbreast = 1,    lcveggiepack = 1,   lcbread = 1,        }, amount = 2, },
        { lcbffriedrice     = { lcricebowl = 1,     lcveggiepack = 1,   lcbeefstrips = 1,   }, amount = 2, },
        { lcckfriedrice     = { lcricebowl = 1,     lcveggiepack = 1,   lcrawchicken = 1,   }, amount = 2, },
        { lcpepshrimp       = { lcrawshrimp = 1,    lcdryrice = 1,      lcseasoning = 1,    lcplantain = 1, }, amount = 2, },
	},
    Processors = {
		{ lcapplesauce      = { lcapple = 1,        lcsugar = 1,        lcapplejuice = 1,   }, amount = 2, },
        { lcnanacream       = { lcbanana = 1,       lcchoccream = 1,    lcberrycream = 1,   }, amount = 2, },
        { lcberrycream      = { lcstrawberry = 1,   lcmilk = 1,         lcicecubes = 1,     }, amount = 2, },
        { lcchoccream       = { lccocoapod = 1,     lcmilk = 1,         lcicecubes = 1,     }, amount = 2, },
        { lcbpudding        = { lcbanana = 1,       lcvaniwafers = 1,   lcpudding = 1,      }, amount = 2, },
	},
    HoboStove = {
        { lceggsandwich     = { lcegg = 1,          lcbread = 1,        }, amount = 1, },
        { lcbakedbeans      = { lccanbeans = 1,     lcbutter = 1,       }, amount = 1, },
        { lcsoupbowl        = { lccansoup = 1,      lcseasoning = 1,    }, amount = 1, },
        { lccupcoffee       = { lccoffeepod = 1,    water_bottle = 1,   }, amount = 1, },
    },                                                                                                                                                                                                                                                                  
    Moonshines = { 
        { lcmshine_mash         = { lcmshine_yeast = 5,     lcmshine_corn = 5,  lcmshine_sugar = 5,         water_jug = 5, }, amount = 12, },
        { lcwhite_lighting      = { lcmshine_mash = 2,      water_jug = 5,      lcmshine_corn = 5,          }, amount = 5, },
        { lcsour_watermelon     = { lcmshine_mash = 2,      water_jug = 5,      lcmshine_melon = 5,         }, amount = 5, },
        { lcmountain_java       = { lcmshine_mash = 2,      water_jug = 5,      lcmshine_coffebean = 5,     }, amount = 5, },
        { lcstrawberry_shine    = { lcmshine_mash = 2,      water_jug = 5,      lcmshine_strawberry = 5,    }, amount = 5, },
        { lcblkberry_shine      = { lcmshine_mash = 2,      water_jug = 5,      lcmshine_blkberry = 5,      }, amount = 5, },

        --{ MOONSHINE_ITEM    = { ITEM_NEEDED = 2, ITEM_NEEDED = 5, ITEM_NEEDED = 5,   }, amount = 5, },
	},                                                                                                                                                                                                                                                                                                                                                                                                        
    Weapons = {
        -- QB/QS Weapons
        -- PISTOLS
        --{ weapon_machinepistol      = { lcglassjar = math.random(10, 30), lcaluminum = math.random(10, 30), lcsteelcan = math.random(10, 30), lcstyrofoam = math.random(10, 30), goldore = math.random(5, 15),     copperore = math.random(10, 15), }, amount = 1, }, -- QB/QS
        --{ weapon_appistol           = { lcglassjar = math.random(10, 30), lcaluminum = math.random(10, 30), lcsteelcan = math.random(10, 30), lcstyrofoam = math.random(10, 30), silverore = math.random(5, 15),   ironore = math.random(10, 15), },   amount = 1, }, -- QB/QS
        --{ weapon_heavypistol        = { lcglassjar = math.random(10, 30), lcaluminum = math.random(10, 30), lcsteelcan = math.random(10, 30), lcstyrofoam = math.random(10, 30), silverore = math.random(5, 15),   carbon = math.random(10, 15), },    amount = 1, }, -- QB/QS
        --{ weapon_pistol50           = { lcglassjar = math.random(10, 30), lcaluminum = math.random(10, 30), lcsteelcan = math.random(10, 30), lcstyrofoam = math.random(10, 30), goldore = math.random(5, 15),     copperore = math.random(10, 15), }, amount = 1, }, -- QB/QS
        --{ weapon_pistol_mk2         = { lcglassjar = math.random(10, 30), lcaluminum = math.random(20, 50), lcsteelcan = math.random(20, 40), lcstyrofoam = math.random(10, 30), silverore = math.random(5, 15),   carbon = math.random(10, 15), },    amount = 1, }, -- QB/QS
        
        -- SHOTGUNS
        --{ weapon_pumpshotgun_mk2    = { lcglassjar = math.random(10, 30), lcaluminum = math.random(20, 50), lcsteelcan = math.random(20, 40), lcstyrofoam = math.random(10, 30), silverore = math.random(5, 15),   ironore = math.random(10, 15), },   amount = 1, }, -- QB/QS
                
        -- RIFLES
        --{ weapon_carbinerifle       = { lcglassjar = math.random(10, 30), lcaluminum = math.random(10, 30), lcsteelcan = math.random(10, 30), lcstyrofoam = math.random(10, 30), silverore = math.random(5, 15),   carbon = math.random(10, 15), },    amount = 1, }, -- QB/QS
        --{ weapon_compactrifle       = { lcglassjar = math.random(10, 30), lcaluminum = math.random(10, 30), lcsteelcan = math.random(10, 30), lcstyrofoam = math.random(10, 30), goldore = math.random(5, 15),     copperore = math.random(10, 15), }, amount = 1, }, -- QB/QS
        --{ weapon_assaultrifle_mk2   = { lcglassjar = math.random(10, 30), lcaluminum = math.random(20, 50), lcsteelcan = math.random(20, 40), lcstyrofoam = math.random(10, 30), silverore = math.random(5, 15),   ironore = math.random(10, 15), },   amount = 1, }, -- QB/QS
        --{ weapon_smg_mk2            = { lcglassjar = math.random(10, 30), lcaluminum = math.random(20, 50), lcsteelcan = math.random(20, 40), lcstyrofoam = math.random(10, 30), goldore = math.random(5, 15),     copperore = math.random(10, 15), }, amount = 1, }, -- QB/QS
        --{ weapon_microsmg           = { lcglassjar = math.random(10, 30), lcaluminum = math.random(10, 30), lcsteelcan = math.random(10, 30), lcstyrofoam = math.random(10, 30), silverore = math.random(5, 15),   carbon = math.random(10, 15), },    amount = 1, }, -- QB/QS
        --{ weapon_combatpdw          = { lcglassjar = math.random(10, 30), lcaluminum = math.random(10, 30), lcsteelcan = math.random(10, 30), lcstyrofoam = math.random(10, 30), goldore = math.random(5, 15),     ironore = math.random(10, 15), },   amount = 1, }, -- QB/QS

        --{ WEAPON_ITEM               = { ITEM_NEEDED = 2, ITEM_NEEDED = 5, ITEM_NEEDED = 5,   }, amount = 5, }, --]]
        


        -- OX/ESX Weapons
        --[[
        { WEAPON_PISTOL_MK2         = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, }, -- OX-ESX
        { WEAPON_PUMPSHOTGUN_MK2    = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, }, -- OX-ESX
        { WEAPON_ASSAULTRIFLE_MK2   = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, }, -- OX-ESX
        { WEAPON_SMG_MK2            = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, }, -- OX-ESX
        { WEAPON_HEAVYSNIPER_MK2    = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, }, -- OX-ESX
        
        --{ WEAPON_ITEM               = { ITEM_NEEDED = 2, ITEM_NEEDED = 5, ITEM_NEEDED = 5,   }, amount = 5, }, --]]

    },

    Attachments = {
        -- OX/ESX Attachments: (These are only examples, edit/replace with the weapon names of your server)  Delete this section if using QBCore 
        --[[ 
        { at_clip_extended_pistol      = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, },
        { at_suppressor_light          = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, },
        { at_clip_extended_shotgun     = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, },
        { at_muzzle_tactical           = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, },
        { at_suppressor_heavy          = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, },
        { at_clip_extended_smg         = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, },
        { at_scope_macro               = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, },
        { at_skin_luxe                 = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, },
        { at_skin_dollar               = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, },
        { at_skin_patriotic            = { lcglassjar = 10, lcaluminum = 13, lcsteelcan = 18, lcstyrofoam = 9, }, amount = 1, }, --]]

        -- QBCore/QSCore Attachments: (These are only examples, edit/replace with the weapon names of your server) -- Delete this section if using ESX
        --
        --{ pistol_extendedclip           = { lcglassjar = math.random(1, 5), lcaluminum = math.random(1, 5), lcsteelcan = math.random(1, 5), lcstyrofoam = math.random(1, 5), }, amount = 1, },
        --{ pistol_suppressor             = { lcglassjar = math.random(1, 5), lcaluminum = math.random(1, 5), lcsteelcan = math.random(1, 5), lcstyrofoam = math.random(1, 5), }, amount = 1, },
        --{ shotgun_suppressor            = { lcglassjar = math.random(1, 5), lcaluminum = math.random(1, 5), lcsteelcan = math.random(1, 5), lcstyrofoam = math.random(1, 5), }, amount = 1, },
        --{ assaultrifle_extendedclip     = { lcglassjar = math.random(1, 5), lcaluminum = math.random(1, 5), lcsteelcan = math.random(1, 5), lcstyrofoam = math.random(1, 5), }, amount = 1, },
        --{ assaultrifle_luxuryfinish     = { lcglassjar = math.random(1, 5), lcaluminum = math.random(1, 5), lcsteelcan = math.random(1, 5), lcstyrofoam = math.random(1, 5), }, amount = 1, },
        --{ smg_extendedclip              = { lcglassjar = math.random(1, 5), lcaluminum = math.random(1, 5), lcsteelcan = math.random(1, 5), lcstyrofoam = math.random(1, 5), }, amount = 1, },
        --{ smg_drum                      = { lcglassjar = math.random(1, 5), lcaluminum = math.random(1, 5), lcsteelcan = math.random(1, 5), lcstyrofoam = math.random(1, 5), }, amount = 1, },
        --{ smg_scope                     = { lcglassjar = math.random(1, 5), lcaluminum = math.random(1, 5), lcsteelcan = math.random(1, 5), lcstyrofoam = math.random(1, 5), }, amount = 1, },
        --{ sniper_scope                  = { lcglassjar = math.random(1, 5), lcaluminum = math.random(1, 5), lcsteelcan = math.random(1, 5), lcstyrofoam = math.random(1, 5), }, amount = 1, },
        --{ sniper_grip                   = { lcglassjar = math.random(1, 5), lcaluminum = math.random(1, 5), lcsteelcan = math.random(1, 5), lcstyrofoam = math.random(1, 5), }, amount = 1, },
        --{ ATTACHMENT_ITEM               = { ITEM_NEEDED = 2, ITEM_NEEDED = 5, ITEM_NEEDED = 5,   }, amount = 5, },]]
    },

    Ammunition = {
        -- QBCore/QSCore AMMO: (These are only examples, edit/replace with the weapon names of your server) -- Delete this section if using ESX
        --{ pistol_ammo                   = { lcglassjar = math.random(10, 30), lcaluminum = math.random(10, 30), lcsteelcan = math.random(10, 30), lcstyrofoam = math.random(10, 30), silverore = math.random(1, 3), }, amount = 50, },
        --{ rifle_ammo                    = { lcglassjar = math.random(10, 30), lcaluminum = math.random(10, 30), lcsteelcan = math.random(10, 30), lcstyrofoam = math.random(10, 30), goldore = math.random(1, 3),   }, amount = 50, },
        --{ smg_ammo                      = { lcglassjar = math.random(10, 30), lcaluminum = math.random(10, 30), lcsteelcan = math.random(10, 30), lcstyrofoam = math.random(10, 30), copperore = math.random(1, 3), }, amount = 50, },
        --{ mg_ammo                       = { lcglassjar = math.random(10, 30), lcaluminum = math.random(10, 30), lcsteelcan = math.random(10, 30), lcstyrofoam = math.random(10, 30), ironore = math.random(1, 3),   }, amount = 50, },
        --{ shotgun_ammo                  = { lcglassjar = math.random(10, 30), lcaluminum = math.random(10, 30), lcsteelcan = math.random(10, 30), lcstyrofoam = math.random(10, 30), copperore = math.random(1, 3), }, amount = 50, },
        --{ weapon_smokegrenade           = { hydrochloricacid = math.random(5, 10), silverore = 10, baking_soda = math.random(5, 10), copperore = 12, }, amount = 1, },
        --{ c4                            = { hydrochloricacid = math.random(2, 4), metalscrap = 5, electronickit = math.random(5, 10), baking_soda = 2, }, amount = 1, },
        --{ weapon_smokegrenade                     = { ITEM_NEEDED = 2, ITEM_NEEDED = 5, ITEM_NEEDED = 5,   }, amount = 5, }, --]]

        -- OX/ESX AMMO: (These are only examples, edit/replace with the weapon names of your server) -- Delete this section if using QBCore
        --[[
        { ammo-9                  = { lcglassjar = 1, lcaluminum = 1, lcsteelcan = 1, lcstyrofoam = 1, }, amount = 5, },
        { ammo-rifle              = { lcglassjar = 1, lcaluminum = 1, lcsteelcan = 1, lcstyrofoam = 1, }, amount = 5, },
        { ammo-44                 = { lcglassjar = 1, lcaluminum = 1, lcsteelcan = 1, lcstyrofoam = 1, }, amount = 5, },
        { ammo-sniper             = { lcglassjar = 1, lcaluminum = 1, lcsteelcan = 1, lcstyrofoam = 1, }, amount = 5, },
        { ammo-shotgun            = { lcglassjar = 1, lcaluminum = 1, lcsteelcan = 1, lcstyrofoam = 1, }, amount = 5, },
        --{ AMMO_ITEM                     = { ITEM_NEEDED = 2, ITEM_NEEDED = 5, ITEM_NEEDED = 5,   }, amount = 5, }, --]] 
    },
}
