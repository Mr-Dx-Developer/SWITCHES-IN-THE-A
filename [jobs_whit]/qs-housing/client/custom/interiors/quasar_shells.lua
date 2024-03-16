CreateThread(function()
    local quasar_shells = {
        {
            nameTier = `playerhouse_tier1`,
            offset = { x = 4.251012802124, y = -15.901171875, z = 2.5, h = 2.2633972168 },
            label = 'House 1',
            inventory = { weight = 500000, slots = 15 }
        },
        {
            nameTier = `trevors_shell`,
            offset = { x = 0.1, y = -3.9, z = 7.9, h = 358.633972168 },
            label = 'Trevor',
            inventory = { weight = 500000, slots = 15 }
        },
        {
            nameTier = `micheal_shell`,
            offset = { x = -10.572736328125, y = 2.65636328125, z = 1.4, h = 265.633972168 },
            label = 'Michael',
            inventory = { weight = 500000, slots = 15 }
        },
        {
            nameTier = `appartment`,
            offset = { x = 4.7, y = -6.2, z = 1.2, h = 358.633972168 },
            label = 'Apartment',
            inventory = { weight = 500000, slots = 15 }
        },
        {
            nameTier = `caravan_shell`,
            offset = { x = -1.4, y = -2.1, z = 2.3, h = 358.633972168 },
            label = 'Caravan',
            inventory = { weight = 500000, slots = 15 }
        },
        {
            nameTier = `frankelientje`,
            offset = { x = 10.8, y = 7.8, z = 6.7, h = 125.5 },
            label = 'Frankelientje',
            inventory = { weight = 500000, slots = 15 }
        },
        {
            nameTier = `tante_shell`,
            offset = { x = -0.4, y = -5.7, z = 2.7, h = 358.633972168 },
            label = 'Tante',
            inventory = { weight = 500000, slots = 15 }
        },
    }

    insertInteriors(quasar_shells)
end)
