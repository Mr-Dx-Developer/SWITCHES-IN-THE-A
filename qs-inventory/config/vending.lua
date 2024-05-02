--[[
    Vending machine configuration.
    Here you can choose all the Vending
    machines and their items.
]]

Config.VendingMachines = {
    ['drinks'] = {
        ['Label'] = 'Drinks',
        ['Items'] = {
            [1] = {
                ['name'] = 'kurkakola',
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = 'item',
                ['slot'] = 1,
            },
            [2] = {
                ['name'] = 'water_bottle',
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = 'item',
                ['slot'] = 2,
            },
        }
    },
    ['candy'] = {
        ['Label'] = 'Candy',
        ['Items'] = {
            [1] = {
                ['name'] = 'chocolate',
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = 'item',
                ['slot'] = 1,
            },
        }
    },
    ['coffee'] = {
        ['Label'] = 'Coffee',
        ['Items'] = {
            [1] = {
                ['name'] = 'coffee',
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = 'item',
                ['slot'] = 1,
            },
        }
    },
    ['water'] = {
        ['Label'] = 'Water',
        ['Items'] = {
            [1] = {
                ['name'] = 'water_bottle',
                ['price'] = 4,
                ['amount'] = 50,
                ['info'] = {},
                ['type'] = 'item',
                ['slot'] = 1,
            },
        }
    },
}

Config.Vendings = {
    [1] = {
        ['Model'] = 'prop_vend_coffe_01', -- Model name of prop
        ['Category'] = 'coffee',          -- Category from list above
    },
    [2] = {
        ['Model'] = 'prop_vend_water_01',
        ['Category'] = 'water',
    },
    [3] = {
        ['Model'] = 'prop_watercooler',
        ['Category'] = 'water',
    },
    [4] = {
        ['Model'] = 'prop_watercooler_Dark',
        ['Category'] = 'water',
    },
    [5] = {
        ['Model'] = 'prop_vend_snak_01',
        ['Category'] = 'candy',
    },
    [6] = {
        ['Model'] = 'prop_vend_snak_01_tu',
        ['Category'] = 'candy',
    },
    [7] = {
        ['Model'] = 'prop_vend_fridge01',
        ['Category'] = 'drinks',
    },
    [8] = {
        ['Model'] = 'prop_vend_soda_01',
        ['Category'] = 'drinks',
    },
    [9] = {
        ['Model'] = 'prop_vend_soda_02',
        ['Category'] = 'drinks',
    },
}
