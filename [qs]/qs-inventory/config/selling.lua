--[[
    Store setup!
    Now we have some news here, such as a new system for
    the sale of items, you can configure all this here.

    You will also find the vending system and little else :)
]]

Config.SellItems = {
    ['Seller item'] = {
        coords = vec3(2682.7588, 3284.8857, 55.2103),
        blip = {
            active = true,
            name = 'Seller',
            sprite = 89,
            color = 1,
            scale = 0.5,
            account = 'money' -- Account associated with the seller's blip
        },
        items = {
            {
                name = 'sandwich',
                price = 3,
                amount = 1,
                info = {},
                type = 'item',
                slot = 1
            },
            {
                name = 'tosti',
                price = 2,
                amount = 1,
                info = {},
                type = 'item',
                slot = 2
            },
        }
    },
    ['24/7'] = {
        coords = vec3(2679.9326, 3276.6897, 54.4058),
        blip = {
            active = true,
            name = 'Seller',
            sprite = 89,
            color = 1,
            scale = 0.5,
            account = 'money' -- Account associated with the seller's blip
        },
        items = {
            {
                name = 'tosti',
                price = 1,
                amount = 1,
                info = {},
                type = 'item',
                slot = 1
            },
        }
    }
}
