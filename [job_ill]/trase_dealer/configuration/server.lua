while (not Config) do Wait(100) end

Config.PayType = 'cash' -- ESX = "money", "bank", "black_money" | QBCore = "cash", "markedbills"
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
    [5] = {
        Label = '101 Brick',
        Item = '101_brick',
        Price = 6000, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [6] = {
        Label = 'Famgoon Dogfood',
        Item = 'famgoon_dogfood',
        Price = 23500, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [7] = {
        Label = 'ACE30',
        Item = 'ace30',
        Price = 10000, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    
    [8] = {
        Label = 'WHAM PACK',
        Item = 'wham_pack',
        Price = 2500, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    
    [9] = {
        Label = 'Gumbo',
        Item = 'gumbo',
        Price = 2500, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    
    [10] = {
        Label = '101 Cups',
        Item = '101_cups',
        Price = 4300, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [11] = {
        Label = 'Gumbo SnowBall',
        Item = 'gumbo_snowball',
        Price = 1200, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [12] = {
        Label = 'Undertaker',
        Item = 'undertaker',
        Price = 5200, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [13] = {
        Label = 'WhyPhy',
        Item = 'whyphy',
        Price = 7000, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [14] = {
        Label = 'Muddy',
        Item = 'muddy',
        Price = 2750, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [15] = {
        Label = '101 Snow White',
        Item = '101_snowwhite',
        Price = 4750, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [16] = {
        Label = '24 MacBook Pro',
        Item = 'macbook_pro_drug',
        Price = 2575, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [17] = {
        Label = 'Fentanyl Drug',
        Item = 'fentanyl_drug',
        Price = 25000, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [18] = {
        Label = 'TUSI Drug',
        Item = 'tusi_drug',
        Price = 12000, 
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