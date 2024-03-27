--[[
    Crafting system independent from the DLC,
    now qs-inventory includes an automated and
    friendly crafting system, configure it to
    your liking using the examples below!

    Don't forget to set a level of 1-100 chance to craft on each item!
]]

Config.Crafting = true -- Enable or disable crafting system!

--[[
    Reputation system (QBCore only)
    In case you want to use this system, you must add the type of
    reputation in the "rep" value, remember that it must be one of the
    previously created metadata of your server. Once you have selected
    this, you can add the corresponding amount of reputation in points.

    QBCore by default includes these:
        'craftingrep'
        'attachmentcraftingrep'
]]

Config.CraftingReputation = false -- Read above how to run and use
Config.ThresholdItems = false     -- Only for qbcore (You will only see items that are higher threshold than your crafting rep (rep >= threshold))

--[[
    Example to add items, you can also add more crafting
    points as shown in the examples below!

    [1] = {
        name = "weapon_pistol", -- item you craft
        amount = 50, -- quantity available, place what you want
        info = {}, -- ignore this if you don't know the qb info
        costs = {
            ["iron"] = 80, -- these are the dependency items for the craft
            ["metalscrap"] = 120,
            ["rubber"] = 8,
            ["steel"] = 133,
            ["lockpick"] = 5,
        },
        type = "weapon", -- put if it is 'item' or 'weapon'
        slot = 1, -- this is the slot inside crafting, keep order
        rep = 'attachmentcraftingrep', -- type of reputation, read above its configuration (qb only)
        points = 1,
                threshold = 0, -- points that you will receive when crafting, is reputation (qb only)
        time = 5500, -- progress bar time
        chance = 100 -- chance of breaking, 1-100 (100 imposible breaking)
    },
]]

--[[

    Exportable event, can be used in external scripts

    function OpenCrafting()
        local CustomCrafting = {
            [1] = {
                name = 'weapon_pistol',
                amount = 50,
                info = {},
                costs = {
                    ['tosti'] = 1,
                },
                type = 'weapon',
                slot = 1,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 5500,
                chance = 100
            },
            [2] = {
                name = 'water_bottle',
                amount = 1,
                info = {},
                costs = {
                    ['tosti'] = 1,
                },
                type = 'item',
                slot = 2,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 8500,
                chance = 100
            },
        }

        local crafting = {
            label = 'Craft',
            items = exports['qs-inventory']:SetUpCrafing(CustomCrafting)
        }
        TriggerServerEvent('inventory:server:SetInventoryItems', CustomCrafting)
        TriggerServerEvent('inventory:server:OpenInventory', 'customcrafting', crafting.label, crafting)
    end
]]

Config.CraftingTables = {
    [1] = {
        name = 'Police Crafting',
        isjob = 'police', --job name or false
        grades = 'all',   -- 'all' to allow all grades, { 0 } to allow an specefic grade or { 0, 1, 2 } to a allow more than one grade.
        text = '[E] - Police Craft',
        blip = {
            enabled = true,
            title = 'Police Crafting',
            scale = 1.0,
            display = 4,
            colour = 0,
            id = 365
        },
        location = vec3(459.771423, -989.050537, 24.898926),
        items = {
            [1] = {
                name = 'weapon_pistol',
                amount = 50,
                info = {},
                costs = {
                    ['iron'] = 80,
                    ['metalscrap'] = 70,
                    ['rubber'] = 8,
                    ['steel'] = 60,
                    ['lockpick'] = 5,
                },
                type = 'weapon',
                slot = 1,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 5500,
                chance = 100
            },
            [2] = {
                name = 'weapon_smg',
                amount = 1,
                info = {},
                costs = {
                    ['iron'] = 80,
                    ['metalscrap'] = 120,
                    ['rubber'] = 10,
                    ['steel'] = 65,
                    ['lockpick'] = 10,
                },
                type = 'weapon',
                slot = 2,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 8500,
                chance = 100
            },
            [3] = {
                name = 'weapon_carbinerifle',
                amount = 1,
                info = {},
                costs = {
                    ['iron'] = 120,
                    ['metalscrap'] = 120,
                    ['rubber'] = 20,
                    ['steel'] = 90,
                    ['lockpick'] = 14,
                },
                type = 'weapon',
                slot = 3,
                rep = 'craftingrep',
                points = 2,
                threshold = 0,
                time = 12000,
                chance = 100
            }
        }
    },
    [2] = {
        name = 'Attachment Crafting',
        isjob = false,
        grades = 'all',
        text = '[E] - Craft Attachment',
        blip = {
            enabled = true,
            title = 'Attachment Crafting',
            scale = 1.0,
            display = 4,
            colour = 0,
            id = 365
        },
        location = vec3(90.303299, 3745.503418, 40.771484),
        items = {
            [1] = {
                name = 'pistol_extendedclip',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 140,
                    ['steel'] = 250,
                    ['rubber'] = 60,
                },
                type = 'item',
                slot = 1,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 8000,
                chance = 90
            },
            [2] = {
                name = 'pistol_suppressor',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 165,
                    ['steel'] = 285,
                    ['rubber'] = 75,
                },
                type = 'item',
                slot = 2,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 8000,
                chance = 90
            },
            [3] = {
                name = 'assaultrifle_extendedclip',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 190,
                    ['steel'] = 305,
                    ['rubber'] = 85,
                    ['smg_extendedclip'] = 1,
                },
                type = 'item',
                slot = 7,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 8000,
                chance = 90
            },
            [4] = {
                name = 'assaultrifle_drum',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 205,
                    ['steel'] = 340,
                    ['rubber'] = 110,
                    ['smg_extendedclip'] = 2,
                },
                type = 'item',
                slot = 8,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 12000,
                chance = 90
            },
            [5] = {
                name = 'smg_drum',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 230,
                    ['steel'] = 365,
                    ['rubber'] = 130,
                },
                type = 'item',
                slot = 3,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 12000,
                chance = 90
            },
            [6] = {
                name = 'smg_extendedclip',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 255,
                    ['steel'] = 390,
                    ['rubber'] = 145,
                },
                type = 'item',
                slot = 4,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 10000,
                chance = 90
            },
            [7] = {
                name = 'microsmg_extendedclip',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 270,
                    ['steel'] = 435,
                    ['rubber'] = 155,
                },
                type = 'item',
                slot = 5,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 18000,
                chance = 90
            },
            [8] = {
                name = 'smg_scope',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 300,
                    ['steel'] = 469,
                    ['rubber'] = 170,
                },
                type = 'item',
                slot = 6,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 11000,
                chance = 90
            },
        }
    },
    [3] = {
        name = 'Crafting Items',
        isjob = false,
        grades = 'all',
        text = '[E] - Craft Items',
        blip = {
            enabled = true,
            title = 'Crafting Items',
            scale = 1.0,
            display = 4,
            colour = 0,
            id = 365
        },
        location = vec3(1537.423, 6340.951, 24.117),
        items = {
            [1] = {
                name = 'lockpick',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 22,
                    ['plastic'] = 32,
                },
                type = 'item',
                slot = 1,
                rep = 'craftingrep',
                points = 1,
                threshold = 0,
                time = 5000,
                chance = 90
            },
            [2] = {
                name = 'screwdriverset',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 30,
                    ['plastic'] = 42,
                },
                type = 'item',
                slot = 2,
                rep = 'craftingrep',
                points = 1,
                threshold = 0,
                time = 10000,
                chance = 90
            },
            [3] = {
                name = 'electronickit',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 30,
                    ['plastic'] = 45,
                    ['aluminum'] = 28,
                },
                type = 'item',
                slot = 3,
                rep = 'craftingrep',
                points = 1,
                threshold = 0,
                time = 15000,
                chance = 90
            },
            [4] = {
                name = 'radioscanner',
                amount = 50,
                info = {},
                costs = {
                    ['electronickit'] = 2,
                    ['plastic'] = 52,
                    ['steel'] = 40,
                },
                type = 'item',
                slot = 4,
                rep = 'craftingrep',
                points = 1,
                threshold = 0,
                time = 25000,
                chance = 90
            },
            [5] = {
                name = 'gatecrack',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 10,
                    ['plastic'] = 50,
                    ['aluminum'] = 30,
                    ['iron'] = 17,
                    ['electronickit'] = 1,
                },
                type = 'item',
                slot = 5,
                rep = 'craftingrep',
                points = 1,
                threshold = 0,
                time = 17000,
                chance = 90
            },
            [6] = {
                name = 'handcuffs',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 36,
                    ['steel'] = 24,
                    ['aluminum'] = 28,
                },
                type = 'item',
                slot = 6,
                rep = 'craftingrep',
                points = 1,
                threshold = 0,
                time = 15000,
                chance = 90
            },
            [7] = {
                name = 'repairkit',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 32,
                    ['steel'] = 43,
                    ['plastic'] = 61,
                },
                type = 'item',
                slot = 7,
                rep = 'craftingrep',
                points = 1,
                threshold = 0,
                time = 8000,
                chance = 90
            },
            [8] = {
                name = 'pistol_ammo',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 50,
                    ['steel'] = 37,
                    ['copper'] = 26,
                },
                type = 'item',
                slot = 8,
                rep = 'craftingrep',
                points = 1,
                threshold = 0,
                time = 7000,
                chance = 90
            },
            [9] = {
                name = 'ironoxide',
                amount = 50,
                info = {},
                costs = {
                    ['iron'] = 60,
                    ['glass'] = 30,
                },
                type = 'item',
                slot = 9,
                rep = 'craftingrep',
                points = 1,
                threshold = 0,
                time = 5000,
                chance = 90
            },
            [10] = {
                name = 'aluminumoxide',
                amount = 50,
                info = {},
                costs = {
                    ['aluminum'] = 60,
                    ['glass'] = 30,
                },
                type = 'item',
                slot = 10,
                rep = 'craftingrep',
                points = 1,
                threshold = 0,
                time = 4000,
                chance = 80
            },
            [11] = {
                name = 'armor',
                amount = 50,
                info = {},
                costs = {
                    ['iron'] = 33,
                    ['steel'] = 44,
                    ['plastic'] = 55,
                    ['aluminum'] = 22,
                },
                type = 'item',
                slot = 11,
                rep = 'craftingrep',
                points = 1,
                threshold = 0,
                time = 17000,
                chance = 60
            },
            [12] = {
                name = 'drill',
                amount = 50,
                info = {},
                costs = {
                    ['iron'] = 50,
                    ['steel'] = 50,
                    ['screwdriverset'] = 3,
                    ['advancedlockpick'] = 2,
                },
                type = 'item',
                slot = 12,
                rep = 'craftingrep',
                points = 1,
                threshold = 0,
                time = 35000,
                chance = 50
            },
        }
    },
}
