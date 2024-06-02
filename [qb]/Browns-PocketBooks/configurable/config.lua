Config = {}

-- Framework Settings
Config.Framework = 'qb' -- 'qb' or 'esx'
Config.Inventory = 'qb' -- 'qb' or 'ox', 
Config.Target = 'qb' -- 'qb' or 'ox'
Config.Menu = 'qb' -- 'qb' or 'ox' 
Config.Notifications = 'qb' -- 'qb', 'ox', 'okok', or 'esx'
Config.ProgressBar = 'qb' -- 'qb', 'ox', or 'rprogress'

-- *POCKETBOOK STORAGE SETTINGS NOTICE:*

-- *PLEASE BE CAREFUL:*
-- IF YOU DECREASE THE POCKETBOOK STORAGE AMOUNTS, THEN FOR ANY PLAYER
-- THAT HAD STUFF IN THEIR BAG BEFORE THE AMOUNT WAS DECREASED
-- WILL LOSE SOME OF THE ITEMS WITHIN DUE TO THE FACT THAT
-- BEFORE THE AMOUNTS WERE HIGHER ALLOWING MORE STUFF IN THE POCKETBOOK
-- AND SINCE ITS BEEN DECREASED ANYTHING IN THE INVENTORY EXCEEDING THE AMOUNT WILL BE GONE

-- *HOWEVER:*
-- IF AMOUNTS INCREASED BACK TO WHAT IT WAS BEFORE DECREASED THEN ALL THE ITEMS
-- WILL BE THERE AGAIN 

-- PocketBook Storage Settings
Config.SlotCount = 30 -- amount of inventory slots the pocketbook will have
Config.WeightCount = 30000 -- amount of inventory weight the pocketbook will have

-- Developer Settings
Config.DebugProps = false -- true/false prints into the client console if the bag props are still loading incase you have issues with it not showing and cant figure out why

-- Shop Settings
Config.UseShop = true -- true/false enables or disables the built in shop system for buying materials (if false you have to make your own way for players to get materials)
Config.ShopPed = 's_m_y_construct_02' -- shop ped model (only needed if Config.UseShop = true)
Config.ShopPedCoords = vector3(173.66, 2778.97, 45.08) -- vector3 coords of shop ped (only needed if Config.UseShop = true)
Config.ShopPedHeading = 187.82 -- heading of shop ped (only needed if Config.UseShop = true)
Config.MaterialShopPrices = { -- Prices of materials in the shop and the amounts available for purchase (only needed if Config.UseShop = true)
    ['Leather'] = {price = 50, amount = 999}, -- amount configuration not needed if using ox_inventory (just leave it, dont touch it)
    ['Cotton'] = {price = 10, amount = 999}, -- amount configuration not needed if using ox_inventory (just leave it, dont touch it)
    ['Suede'] = {price = 25, amount = 999}  -- amount configuration not needed if using ox_inventory (just leave it, dont touch it)
}

-- Crafting Settings
Config.AllowCrafting = true -- true/false enables or disables the ability to craft pocketbooks (if false then you have to make your own way for players to get pocketbooks)
Config.CraftingLocation = vector3(716.28, -963.35, 30.4) -- vector3 Crafting Location (automatically makes it a targetable 2x2 box PolyZone) [ignore if Config.AllowCrafting = false]
Config.CraftingRequirments = { -- Requirements needed to Craft PocketBooks at Crafting Location [ignore if Config.AllowCrafting = false]
    ['Givenchy'] = {leather = 200, cotton = 500, suede = 200}, -- [ignore if Config.AllowCrafting = false]  
    ['Gucci'] = {leather = 200, cotton = 1000, suede = 400}, -- [ignore if Config.AllowCrafting = false] 
    ['Teflar'] = {leather = 100, cotton = 250, suede = 100} -- [ignore if Config.AllowCrafting = false]
}

-- DrawText Settings (Warning: Increases Script Resmon when enabled)
-- Please see "Optimization (RESMON)" section of README file to read more on the scripts optimization and how this effects its optimization)
-- DrawText only shows when the player is near the crafting location.
Config.ShowCraftingDrawText = true -- true/false (shows a 3D Text UI/DrawText above the Crafting Location that shows a message saying whatever you put in Config.DrawTextMessage)
Config.DrawTextMessage = 'Target Area Below to Begin Crafting PocketBooks' -- the message that the DrawText UI will show (not needed if Config.ShowCraftingDrawText = false)

-- Blip Settings
Config.BlipSettings = {
    ['ShopLocation'] = {
        enabled = true, -- true/false (show or hide the blip on the map)
        label = 'PocketBook Materials Shop', -- the name that will show for the blip on the map
        sprite = 365, -- the sprite/icon of the blip (to change blip see blip number reference: https://docs.fivem.net/docs/game-references/blips/#blips)
        color = 8, -- the color of the blip (to change see blip color reference: https://docs.fivem.net/docs/game-references/blips/#blip-colors)
        scale = 0.8 -- the size of the blip (0.1 - 1.0)
    },
    ['CraftingLocation'] = {
        enabled = true, -- true/false (show or hide the blip on the map)
        label = 'PocketBook Crafting', -- the name that will show for the blip on the map
        sprite = 402, -- the sprite/icon of the blip (to change blip see blip number reference: https://docs.fivem.net/docs/game-references/blips/#blips)
        color = 8, -- the color of the blip (to change see blip color reference: https://docs.fivem.net/docs/game-references/blips/#blip-colors)
        scale = 0.8 -- the size of the blip (0.1 - 1.0)
    },
}