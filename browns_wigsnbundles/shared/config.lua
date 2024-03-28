return {

    ['core'] = { -- configure core stuff
        framework = 'qb-core', -- 'esx', 'qb-core', 'qbx-core', or 'nd_core'
        inventory = 'qs-inventory', -- 'qb-inventory', 'ox_inventory', 'qs-inventory', 'lj-inventory', 'ps-inventory', 'chezza-inventory', or 'ak47-inventory'
        target = 'qb-target', -- 'qb-target', 'ox_target', or 'qtarget'
        notify = function(message, types, duration) -- notification function

            ---@param message: the notification message
            ---@param types: the notification type ('success' or 'error')
            ---@param duration: the notification duration (in ms)

            -- uses ox lib by default (replace with your own client sided exports/events if needed):

            lib.notify({
                title = 'Wigs N Bundles',
                description = message,
                type = types,
                duration = duration,
                position = 'top',
                style = {
                    backgroundColor = '#E0115F',
                    color = '#FFFFFF',
                    ['.description'] = {
                      color = '#FFFFFF'
                    }
                },
                icon = {'fas', 'heart'},
                iconColor = '#FFB6C1',
                iconAnimation = 'bounce'
            })

        end
    },

    ['settings'] = { -- configure settings
        femaleOnly = { -- female only settings (for selling wigs)
            enable = false, -- enable female only?
            customFemalePeds = { -- incase players use custom female peds please list their ped name here
                ['my_custom_ped1'] = true,
                -- ['my_custom_ped2'] = true,
            }
        },
    
        phone = { -- configure clientale phone settings
            enable = false, -- enable the ability to randomly get a clientale phone (sends you on a mission to sell wigs for 1x profit)
            chance = 0, -- chance of getting this rare phone item (% out of 100)
            locations = { -- list of house locations where you will be sent to do these missions
                {coords = vec3(281.6472, -1694.5334, 29.6479)},
                {coords = vec3(338.9823, -1829.2081, 28.3375)},
                {coords = vec3(-63.9830, -1449.5394, 32.5249)},
                {coords = vec3(-1667.2485, -441.4140, 40.3558)},
                {coords = vec3(-1215.9135, 458.1824, 92.0638)},
                {coords = vec3(1261.2694, -1616.4596, 54.7429)},
                {coords = vec3(1222.3796, -697.0182, 60.8087)},
                -- add as many as you want 
                -- {coords = vec3(0, 0, 0)},
            }
        },

        clearPeds = { -- delete peds after selling wigs to them so they dont overcrowd when they walk away
            enable = true, -- enable?
            wait = 15 -- how long should it wait to delete the ped after they walk away (in seconds)
        },

        maxSell = { -- making it to where there is a maximum amount of wigs you can sell per transaction (except for when doing clientale phone missions)
            enable = false, -- enable?
            amount = 1 -- max amount of wigs you can spawn per transaction
        },

        pedSpawnDistance = 20.0, -- distance of how far infront of the player will peds spawn when selling wigs

        command = 'wigdealer' -- command to start selling wigs
    },

    ['sell'] = { -- configure sell profits
        ['wig_bang'] = 60, -- how much you make from each bang wig sold
        ['wig_curly'] = 97, -- how much you make from each curly wig sold
        ['wig_braids'] = 120, -- how much you make from each braids wig sold
        ['wig_40inches'] = 130, -- how much you make from each 40 inch wig sold
    },

    ['shop'] = { -- configure shop
        pedModel = 'a_f_m_soucentmc_01', -- shop ped (see ref: https://docs.fivem.net/docs/game-references/ped-models/)
        coords = vec4(179.73626708984375, -1810.773681640625, 28.2799072265625, 48.18897247314453), -- shop coords
        items = { -- configure shop item prices
            ['wig_table'] = 1000, -- price for wig table
            ['wig_cap'] = 5, -- price for wig cap
            ['wig_sewin'] = 5, -- price for sewin kit
            ['hair_bundles'] = 20, -- price for hair bundles
        },
        blip = { -- configure blip
            enable = true, -- enable or disable built in blip for shop location
            label = 'Wigs N Bundles Shop', -- name of the blip
            sprite = 621, -- blip sprite/icon (see ref: https://docs.fivem.net/docs/game-references/blips/)
            color = 48, -- blip color (see ref: https://docs.fivem.net/docs/game-references/blips/#blip-colors)
            scale = 0.8, -- blip scale/size (0.1 - 1.0)
        },
    },

    ['craft'] = { -- configure craft requirements
        ['wig_bang'] = { -- craft requirements for bang wig
            ['wig_cap'] = 1, -- amount of required wig caps
            ['wig_sewin'] = 1, -- amount of required sewin kits
            ['hair_bundles'] = 2, -- amount of required hair bundles
        },
    
        ['wig_curly'] = { -- craft requirements for curly wig
            ['wig_cap'] = 1, -- amount of required wig caps
            ['wig_sewin'] = 1, -- amount of required sewin kits
            ['hair_bundles'] = 4, -- amount of required hair bundles  
        },
    
        ['wig_braids'] = { -- craft requirements for braids wig
            ['wig_cap'] = 1, -- amount of required wig caps
            ['wig_sewin'] = 1, -- amount of required sewin kits
            ['hair_bundles'] = 6, -- amount of required hair bundles  
        },
    
        ['wig_40inches'] = { -- craft requirements for 40 inch wig
            ['wig_cap'] = 1, -- amount of required wig caps
            ['wig_sewin'] = 1, -- amount of required sewin kits
            ['hair_bundles'] = 8, -- amount of required hair bundles  
        },
    },

    ['peds'] = { -- list of peds used by the script (for buying wigs etc. see ref: https://docs.fivem.net/docs/game-references/ped-models/) 
        -- feel free to add or remove peds from this list
        'a_f_m_bevhills_01',
        'a_f_m_bevhills_02',
        'a_f_m_downtown_01',
        'a_f_m_eastsa_01',
        'a_f_m_eastsa_02',
        'a_f_m_fatbla_01',
        'a_f_m_fatwhite_01',
        'a_f_m_ktown_01',
        'a_f_m_ktown_02',
        'a_f_m_prolhost_01',
        'a_f_o_genstreet_01',
        'a_f_m_tourist_01',
        'a_f_o_soucent_02',
        'a_f_y_bevhills_02',
        'a_f_y_business_03',
        'a_f_y_genhot_01',
        'a_f_y_fitness_01',
        'a_f_y_hiker_01',
        'a_f_y_hipster_03',
        'a_f_y_indian_01',
        'a_f_y_runner_01',
        'a_f_y_soucent_02',
        'a_f_y_soucent_03',
        'a_f_y_tennis_01',
        'a_f_y_yoga_01',
    }
    
}
