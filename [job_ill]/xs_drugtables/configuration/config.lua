local seconds = 1000
Config = {}

-- Head to xs_drugtables/bridge to make any changes to your framework.

Config.progressCircle = {
    enabled = false,    -- Enable progress circle rather than progress bar?
    location = 'bottom' -- Location if enabled? Options 'bottom', 'center'
}

Config.DrugTables = {

    -- TABLE START --
    ['plastic_table_heroine'] = {       -- Name of usable item for this table

        prop = 'plastic_table_heroine', -- Name of prop within
        setupTime = 4 * seconds,        -- Time to set up table
        pickupTime = 4 * seconds,       -- Time to pack up table
        recipes = {                     -- Where all possible recipes for this specific table

            {

                label = 'Heroin Table',            -- Menu label

                craftingTime = 12 * seconds, -- Time to craft

                reward = {
                    ['heroin_shot'] = 1, -- Reward given after successful craft.

                    -- Add more rewards if desired, ['ITEM_NAME'] = QUANTITY
                },

                requirements = { -- Requirements for this drug to show on menu for craft
                    ['poppy'] = { label = 'Poppy', quantity = 3 }, -- Replace with your own ingredients
                    ['plastic_baggy'] = { label = 'Plastic Baggy', quantity = 1 }, -- Replace with your own ingredients

                    -- Add more required items to craft specific drug if desired, ['ITEM_NAME_NEEDED'] = { label = LABEL, quantity = QUANTITY }
                },

            },

            -- Add more menu options/recipes for this drug table here
        }
    },

    ['plastic_table_cocaine'] = {       -- Name of usable item for this table

        prop = 'plastic_table_cocaine', -- Name of prop within
        setupTime = 4 * seconds,        -- Time to set up table
        pickupTime = 4 * seconds,       -- Time to pack up table
        recipes = {                     -- Where all possible recipes for this specific table

            {

                label = 'Cocaine Table',            -- Menu label

                craftingTime = 12 * seconds, -- Time to craft

                reward = {
                    ['coke_pooch'] = 1, -- Reward given after successful craft.

                    -- Add more rewards if desired, ['ITEM_NAME'] = QUANTITY
                },

                requirements = { -- Requirements for this drug to show on menu for craft
                    ['coca_leaf'] = { label = 'coke_leaf', quantity = 3 }, -- Replace with your own ingredients
                    ['plastic_baggy'] = { label = 'Plastic Baggy', quantity = 1 }, -- -- Replace with your own ingredients
                    ['water_can'] = { label = 'water_can', quantity = 1 }
                    -- Add more required items to craft specific drug if desired, ['ITEM_NAME_NEEDED'] = { label = LABEL, quantity = QUANTITY }
                },

            },

            -- Add more menu options/recipes for this drug table here
        }
    },

    ['plastic_table_ecstasy'] = {       -- Name of usable item for this table

        prop = 'plastic_table_ecstasy', -- Name of prop within
        setupTime = 4 * seconds,        -- Time to set up table
        pickupTime = 4 * seconds,       -- Time to pack up table
        recipes = {                     -- Where all possible recipes for this specific table

            {

                label = 'Ecstasy Table',            -- Menu label

                craftingTime = 12 * seconds, -- Time to craft

                reward = {
                    ['ecstasy'] = 1, -- Reward given after successful craft.

                    -- Add more rewards if desired, ['ITEM_NAME'] = QUANTITY
                },

                requirements = { -- Requirements for this drug to show on menu for craft
                    ['poppy'] = { label = 'Poppy', quantity = 3 }, -- Replace with your own ingredients
                    ['plastic_baggy'] = { label = 'Plastic Baggy', quantity = 1 }, -- -- Replace with your own ingredients

                    -- Add more required items to craft specific drug if desired, ['ITEM_NAME_NEEDED'] = { label = LABEL, quantity = QUANTITY }
                },

            },

            -- Add more menu options/recipes for this drug table here
        }
    },

    ['plastic_table_meth'] = {       -- Name of usable item for this table

        prop = 'plastic_table_meth', -- Name of prop within
        setupTime = 4 * seconds,        -- Time to set up table
        pickupTime = 4 * seconds,       -- Time to pack up table
        recipes = {                     -- Where all possible recipes for this specific table

            {

                label = 'Meth Table',            -- Menu label

                craftingTime = 12 * seconds, -- Time to craft

                reward = {
                    ['meth_pooch'] = 1, -- Reward given after successful craft.

                    -- Add more rewards if desired, ['ITEM_NAME'] = QUANTITY
                },

                requirements = { -- Requirements for this drug to show on menu for craft
                    ['poppy'] = { label = 'Poppy', quantity = 3 }, -- Replace with your own ingredients
                    ['plastic_baggy'] = { label = 'Plastic Baggy', quantity = 1 }, -- -- Replace with your own ingredients

                    -- Add more required items to craft specific drug if desired, ['ITEM_NAME_NEEDED'] = { label = LABEL, quantity = QUANTITY }
                },

            },

            -- Add more menu options/recipes for this drug table here
        }
    },

    ['plastic_table_mushrooms'] = {       -- Name of usable item for this table

        prop = 'plastic_table_mushrooms', -- Name of prop within
        setupTime = 4 * seconds,        -- Time to set up table
        pickupTime = 4 * seconds,       -- Time to pack up table
        recipes = {                     -- Where all possible recipes for this specific table

            {

                label = 'Mushroom Table',            -- Menu label

                craftingTime = 12 * seconds, -- Time to craft

                reward = {
                    ['shroom_pooch'] = 1, -- Reward given after successful craft.

                    -- Add more rewards if desired, ['ITEM_NAME'] = QUANTITY
                },

                requirements = { -- Requirements for this drug to show on menu for craft
                    ['poppy_plant'] = { label = 'poppy_plant', quantity = 3 }, -- Replace with your own ingredients
                    ['plastic_baggy'] = { label = 'Plastic Baggy', quantity = 1 }, -- -- Replace with your own ingredients

                    -- Add more required items to craft specific drug if desired, ['ITEM_NAME_NEEDED'] = { label = LABEL, quantity = QUANTITY }
                },

            },

            -- Add more menu options/recipes for this drug table here
        }
    },

    ['plastic_table_weed'] = {       -- Name of usable item for this table

        prop = 'plastic_table_weed', -- Name of prop within
        setupTime = 4 * seconds,        -- Time to set up table
        pickupTime = 4 * seconds,       -- Time to pack up table
        recipes = {                     -- Where all possible recipes for this specific table

            {

                label = 'Weed Table',            -- Menu label

                craftingTime = 12 * seconds, -- Time to craft

                reward = {
                    ['Weed_pooch'] = 1, -- Reward given after successful craft.

                    -- Add more rewards if desired, ['ITEM_NAME'] = QUANTITY
                },

                requirements = { -- Requirements for this drug to show on menu for craft
                    ['cannabis'] = { label = 'cannabis', quantity = 3 }, -- Replace with your own ingredients
                    ['plastic_baggy'] = { label = 'Plastic Baggy', quantity = 1 }, -- -- Replace with your own ingredients

                    -- Add more required items to craft specific drug if desired, ['ITEM_NAME_NEEDED'] = { label = LABEL, quantity = QUANTITY }
                },

            },

            -- Add more menu options/recipes for this drug table here
        }
    },

    ['plastic_table_fentanyl'] = {       -- Name of usable item for this table

        prop = 'plastic_table_fentanyl', -- Name of prop within
        setupTime = 4 * seconds,        -- Time to set up table
        pickupTime = 4 * seconds,       -- Time to pack up table
        recipes = {                     -- Where all possible recipes for this specific table

            {

                label = 'Fentanyl Table',            -- Menu label

                craftingTime = 12 * seconds, -- Time to craft

                reward = {
                    ['fentanyl'] = 1, -- Reward given after successful craft.

                    -- Add more rewards if desired, ['ITEM_NAME'] = QUANTITY
                },

                requirements = { -- Requirements for this drug to show on menu for craft
                    ['poppy'] = { label = 'Poppy', quantity = 3 }, -- Replace with your own ingredients
                    ['plastic_baggy'] = { label = 'Plastic Baggy', quantity = 1 }, -- -- Replace with your own ingredients

                    -- Add more required items to craft specific drug if desired, ['ITEM_NAME_NEEDED'] = { label = LABEL, quantity = QUANTITY }
                },

            },

            -- Add more menu options/recipes for this drug table here
        }
    },
    -- TABLE END --


    -- Add more here by copying from TABLE START to TABLE END and pasting/customizing
}
