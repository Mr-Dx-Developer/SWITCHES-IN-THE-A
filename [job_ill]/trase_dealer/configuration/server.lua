while (not Config) do Wait(100) end

Config.PayType = 'markedbills' -- ESX = "money", "bank", "black_money" | QBCore = "cash", "markedbills"
Config.RandomizePay = false -- If enabled, it will add a random number 1-200
-- Please keep in mind, if you use marked bills disable the option above and change the prices. (QBCore)

Config.Command = {
    Enabled = true,
    Command = 'dealerrank'
}

Config.Drugs = {
    [1] = {
        Label = 'Shroom Pooch',
        Item = 'shroom_pooch',
        Price = 350, 
        RequiredAmount = 1,
        DenyChance = 1000
    },
    [2] = {
        Label = 'Weed Bag',
        Item = 'weed_bag',
        Price = 650, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [3] = {
        Label = 'Coke Pooch',
        Item = 'coke_pooch',
        Price = 600, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [4] = {
        Label = 'Meth Bag',
        Item = 'meth_bag',
        Price = 615, 
        RequiredAmount = 1,
        DenyChance = 0
    },
}

Config.Discord = {
    Enabled = false, -- Requires: https://github.com/ImTrase/trase_discord
    ResourceName = 'trase_discord', -- In case you renamed the resource.
    Roles = {
        [1] = {
            RoleID = 1094982744133619782,
            SellPrice = 25 -- Sell 25% more (adds on to the rank)
        }
    }
}