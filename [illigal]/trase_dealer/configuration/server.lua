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
        Price = 8000, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [6] = {
        Label = 'Famgoon Dogfood',
        Item = 'famgoon_dogfood',
        Price = 13000, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [7] = {
        Label = 'ACE30',
        Item = 'ace30',
        Price = 7000, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    
    [8] = {
        Label = 'WHAM PACK',
        Item = 'wham_pack',
        Price = 9500, 
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
        Label = 'Famgoon Lean',
        Item = 'famgoon_lean',
        Price = 4000, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [11] = {
        Label = 'Gumbo SnowBall',
        Item = 'gumbo_snowball',
        Price = 2750, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [12] = {
        Label = 'Undertaker',
        Item = 'undertaker',
        Price = 1900, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [13] = {
        Label = 'WhyPhy',
        Item = 'whyphy',
        Price = 3500, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [14] = {
        Label = 'Muddy',
        Item = 'muddy',
        Price = 2500, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [15] = {
        Label = '101 Snow White',
        Item = '101_snowwhite',
        Price = 3750, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [16] = {
        Label = '24 MacBook Pro',
        Item = 'macbook_pro_drug',
        Price = 2000, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [17] = {
        Label = 'Fentanyl Drug',
        Item = 'fentanyl_drug',
        Price = 15000, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [18] = {
        Label = 'TUSI Drug',
        Item = 'tusi_drug',
        Price = 2500, 
        RequiredAmount = 1,
        DenyChance = 0
    },

    [19] = {
        Label = 'fmdblonde_bundlesbox',
        Item = 'fmdblonde_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [20] = {
        Label = 'fmdred_bodywavebox',
        Item = 'fmdred_bodywavebox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [21] = {
        Label = 'fmdbbrown_bundlesbox',
        Item = 'fmdbbrown_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [22] = {
        Label = 'fmdccpink_bundlesbox',
        Item = 'fmdccpink_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [23] = {
        Label = 'fmdauburn_bundlesbox',
        Item = 'fmdauburn_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [24] = {
        Label = 'fmdblack_bundlesbox',
        Item = 'fmdblack_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [25] = {
        Label = 'fmdbrown_bundlesbox',
        Item = 'fmdbrown_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [26] = {
        Label = 'fmdplatinum_bundlesbox',
        Item = 'fmdplatinum_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [27] = {
        Label = 'fmdccblue_bundlesbox',
        Item = 'fmdccblue_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [28] = {
        Label = 'fmdlime_bundlesbox',
        Item = 'fmdlime_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [29] = {
        Label = 'fmdpurple_bundlesbox',
        Item = 'fmdpurple_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [30] = {
        Label = 'fmdmidb_bundlesbox',
        Item = 'fmdmidb_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [31] = {
        Label = 'fmdkblack_bundlesbox',
        Item = 'fmdkblack_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [32] = {
        Label = 'fmdkblonde_bundlesbox',
        Item = 'fmdkblonde_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [33] = {
        Label = 'fmdkblue_bundlesbox',
        Item = 'fmdkblue_bundlesbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },

----------------------- salon
    [34] = {
        Label = 'fmdbaltotebox',
        Item = 'fmdbaltotebox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [35] = {
        Label = 'fmdbalwwalletbox',
        Item = 'fmdbalwwalletbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [36] = {
        Label = 'fmdbalpsbagbox',
        Item = 'fmdbalpsbagbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [37] = {
        Label = 'fmdbalpbagbox',
        Item = 'fmdbalpbagbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [38] = {
        Label = 'fmdchpbox',
        Item = 'fmdchpbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [39] = {
        Label = 'fmdchwbox',
        Item = 'fmdchwbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [40] = {
        Label = 'fmdchbbox',
        Item = 'fmdchbbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [41] = {
        Label = 'fmdbirpsbox',
        Item = 'fmdbirpsbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [42] = {
        Label = 'fmdbirbbox',
        Item = 'fmdbirbbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [43] = {
        Label = 'fmdbirapbox',
        Item = 'fmdbirapbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [44] = {
        Label = 'fmdbirpinkbox',
        Item = 'fmdbirpinkbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [45] = {
        Label = 'fmdlvcbbox',
        Item = 'fmdlvcbbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [46] = {
        Label = 'fmdlvtotebox',
        Item = 'fmdlvtotebox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [47] = {
        Label = 'fmdlvwalletbox',
        Item = 'fmdlvwalletbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [48] = {
        Label = 'fmdlvjunglebox',
        Item = 'fmdlvjunglebox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [49] = {
        Label = 'fmddiorapbox',
        Item = 'fmddiorapbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [50] = {
        Label = 'fmddiorbbox',
        Item = 'fmddiorbbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [51] = {
        Label = 'fmddiorplbox',
        Item = 'fmddiorplbox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [52] = {
        Label = 'fmddiortotebox',
        Item = 'fmddiortotebox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
    [53] = {
        Label = 'fmddiorptotebox',
        Item = 'fmddiorptotebox',
        Price = 800, 
        RequiredAmount = 1,
        DenyChance = 0
    },
   




    [54] = {
        Label = 'Jack Runtz',
        Item = 'jack_runtz',
        Price = 3200, 
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