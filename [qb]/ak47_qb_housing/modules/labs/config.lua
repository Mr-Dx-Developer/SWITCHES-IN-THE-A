Config.EnableLabs = true
Config.LabObjects = {
    [`v_ret_ml_tablea`]             = true,
    [`v_ret_ml_tableb`]             = true,
    [`v_ret_ml_tablec`]             = true,
    [`bkr_prop_weed_table_01a`]     = true,
    [`bkr_prop_coke_table01a`]      = true,
    [`bkr_prop_meth_table01a`]      = true,
    [`imp_prop_impexp_coke_trolly`] = true,
}
Config.Labs = { -- each block can have collecting or processing or both
    weedlab = {
        name = "Weed Lab",
        collecting = {
            auto        = false, --No need to press E everytime (not recomended)
            item        = 'weed_leaf',
            quantity    = {minimum = 1, maximum = 5},
            delay       = 3, -- in seconds
            skillCheck  = function()
                --return lib.skillCheck({areaSize = 80, speedMultiplier = 0.5}, {'w', 'a', 's', 'd'})   --https://overextended.dev/ox_lib/Modules/Interface/Client/skillcheck
                return true --use this if you don't need skill check
            end
        },
        processing = {
            auto   = false, --No need to press E everytime (not recomended)
            recipe = {
                {item = 'weed_leaf', quantity = 5, willremove = true},
                {item = 'pooch_bag', quantity = 1, willremove = true},
                {item = 'lighter',   quantity = 1, willremove = false},
            },
            reward = {item = 'weed_pooch', quantity = 1},
            delay       = 8, -- in seconds
            skillCheck  = function()
                return lib.skillCheck({areaSize = 80, speedMultiplier = 0.5}, {'w', 'a', 's', 'd'})   --https://overextended.dev/ox_lib/Modules/Interface/Client/skillcheck
                --return true --use this if you don't need skill check
            end
        },
    },
    cokelab = {
        name = "Coke Lab",
        collecting = {
            auto        = false, --No need to press E everytime (not recomended)
            item        = 'cokebrick',
            quantity    = {minimum = 1, maximum = 1},
            delay       = 10, -- in seconds
            skillCheck  = function()
                return lib.skillCheck({areaSize = 80, speedMultiplier = 0.5}, {'w', 'a', 's', 'd'})   --https://overextended.dev/ox_lib/Modules/Interface/Client/skillcheck
                --return true --use this if you don't need skill check
            end
        },
        processing = {
            auto   = false, --No need to press E everytime (not recomended)
            recipe = {
                {item = 'cokebrick', quantity = 1, willremove = true},
                {item = 'pooch_bag', quantity = 5, willremove = true},
                {item = 'lighter',   quantity = 1, willremove = false},
            },
            reward = {item = 'coke_pooch', quantity = 5},
            delay       = 20, -- in seconds
            skillCheck  = function()
                return lib.skillCheck({areaSize = 80, speedMultiplier = 0.5}, {'w', 'a', 's', 'd'})   --https://overextended.dev/ox_lib/Modules/Interface/Client/skillcheck
                --return true --use this if you don't need skill check
            end
        },
    },
    methlab = {
        name = "Meth Lab",
        collecting = {
            auto        = false, --No need to press E everytime (not recomended)
            item        = 'meth_raw',
            quantity    = {minimum = 1, maximum = 1},
            delay       = 2, -- in seconds
            skillCheck  = function()
                return lib.skillCheck({areaSize = 80, speedMultiplier = 0.5}, {'w', 'a', 's', 'd'})   --https://overextended.dev/ox_lib/Modules/Interface/Client/skillcheck
                --return true --use this if you don't need skill check
            end
        },
        processing = {
            auto   = false, --No need to press E everytime (not recomended)
            recipe = {
                {item = 'meth_raw',  quantity = 5, willremove = true},
                {item = 'pooch_bag', quantity = 1, willremove = true},
                {item = 'lighter',   quantity = 1, willremove = false},
            },
            reward = {item = 'meth_pooch', quantity = 1},
            delay       = 5, -- in seconds
            skillCheck  = function()
                return lib.skillCheck({areaSize = 80, speedMultiplier = 0.5}, {'w', 'a', 's', 'd'})   --https://overextended.dev/ox_lib/Modules/Interface/Client/skillcheck
                --return true --use this if you don't need skill check
            end
        },
    },
}