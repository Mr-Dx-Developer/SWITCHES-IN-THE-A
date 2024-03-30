Config = Config or {}
Locales = Locales or {}

--[[
    The first thing will be to choose our main language, here you can choose
    between the default languages that you will find within locales/*,
    if yours is not there, feel free to create it!
]]

local esxHas = GetResourceState('es_extended') == 'started'
local qbHas = GetResourceState('qb-core') == 'started'

Config.Framework = esxHas and 'esx' or qbHas and 'qb' or 'esx'

Config.Language = 'en'

--[[
    Target systems pre-configured by default:
        'qb-target'
        'ox_target'

        'none' It means that it is deactivated
]]

Config.UseTarget = 'qb-target'                -- Choose between 'qb-target', 'ox_target' or 'none' disabled!

Config.BlockedSwap = false               -- If set to true, you will not be able to swap between items
Config.BlockedSlot = false               -- This is the sixth slot, the one that does not allow them to steal from that space
Config.GiveItemHideName = false          -- If you enable this, then the player will not be able to see names in giveitem, only id
Config.OpeingProgressBar = false          -- Please leave this set to true to avoid dupes

Config.Handsup = false                    -- Enable or disable Handsup and Robbery button
Config.StealDeadPlayer = true            -- Steal from dead players?
Config.StealWithoutWeapons = false       -- Possibility to draw only if the target player raises his arms (without weapons)
Config.DropItemWhenInventoryFull = true -- Drop the item when the inventory is fully

Config.InventoryWeight = {               -- Configuration of maximum weight and maximum slots of the player
    ['weight'] = 1200000,
    --- CAUTION: If you change this value after the anyone has items. It will cause dupe problems. So don't forget to wipe all the inventories.
    ['slots'] = 61, -- If you want to remove the 6 slot, use 40 here!
}

Config.DropWeight = { -- Configuration of maximum weight and maximum slots of the player
    ['weight'] = 20000000,
    ['slots'] = 130,  -- If you want to remove the 6 slot, use 40 here! (Max 100)
}

Config.LabelChange = false       -- Enable or disable this function here
Config.LabelChangePrice = false -- Set prince or false
Config.BlockedLabelChangeItems = {
    ['money'] = true,
    ['phone'] = true,
}

Config.UsableItemsFromHotbar = true -- Can the items be used with the hotbar? (1, 2, 3, 4, 5)
Config.BlockedItemsHotbar = {       -- Items that you can not use from hotbar, only from the inventory
    'lockpick',
    -- Add more elements here if necessary
}

--[[
    Hello, you do, the one who uses qs-backpack. You have
    all the backpacks in server/custom/misc/UniqueItem.lua,
    there is a list of backpacks, all the ones you see there
    will count as a single item called 'backpack', so if you
    have a backpack2, it will count as a backpack, that is say,
    a single backpack per player. If you need to edit something
    you already know where the corresponding function is!
]]

Config.OnePerItem = { -- Items that cannot be sent to your inventory (item = max amount)
    ['backpack'] = 1,
    -- Add more elements here if necessary
}

Config.notStolenItems = {
    ['id_card'] = true,
    ['water_bottle'] = true,
    ['tosti'] = true
}

Config.notStoredItems = {
    ['backpack'] = true,
}

-- If you enable this in true check the docs
-- ESX: https://docs.quasar-store.com/ Inventory > Functions > Clothing
-- QB: https://docs.quasar-store.com/qbcore/inventory/installations/step-7
Config.Clothing = true                         -- Disable clothing system, this will disable the button too
Config.EnableScreenPed = false                 -- Disable the zoom pad and put it on your screen
Config.TakePreviousClothes = false              -- Set whether you want previous clothes to go to your inventory or be removed

Config.ItemDropObject = `prop_paper_bag_small` -- or false
Config.DropRefreshTime = 15 * 60
Config.MaxDropViewDistance = 9.5

Config.Genders = { -- You can ignore this
    ['m'] = 'Male',
    ['f'] = 'Female',
    [1] = 'Male',
    [2] = 'Female'
}

--[[
    Visual configuration of the resource!
    Here you can configure the animation to open the inventory,
    the logo or even the icons within the item information.

    InventoryOptions are the boxes that you see on the sides of the
    inventory, enable or disable them as you want.

    Regarding the genres of Default config, it is for clothes,
    configure it as you wish, if you have custom clothes, you should
    touch that configuration a lot.
]]

Config.OpenInventoryAnim = true   -- Enable or disable ped animation
Config.OpenInventoryScene = false -- Inventory animation enabled or disabled
Config.Logo = false               -- or 'https://i.imgur.com/xfcHKW6.png'
Config.IdleCamera = true          -- Disable or enable idle camera!

Config.InventoryOptions = {
    -- Generic menu
    ['clothes'] = Config.Clothing, -- Enable or disable in Config.Clothing.
    ['configuration'] = true,
    -- Left menu
    ['health'] = true,
    ['armor'] = true,
    ['hunger'] = true,
    ['thirst'] = true,
    -- Right menu
    ['id'] = true,
    ['money'] = true,
    ['bank'] = true,
    ['blackmoney'] = true,
}

-- https://fontawesome.com/
-- In this section we can give custom icons to the info of the items
Config.getItemicons = {
    ['tosti'] = {
        icon = 'fa-solid fa-utensils',
    },
    ['water_bottle'] = {
        icon = 'fa-solid fa-utensils',
    },
}

-- In case of using custom clothing, modify here
Config.Defaults = {
    ['female'] = {
        torso = 15,
        jeans = 14,
        shoes = 45,
        arms = 15,
        helmet = -1,
        glasses = -1,
        mask = 0,
        tshirt = -1,
        ears = -1,
        bag = 0,
    },
    ['male'] = {
        torso = 15,
        jeans = 14,
        shoes = 45,
        arms = 15,
        helmet = -1,
        glasses = -1,
        mask = 0,
        tshirt = 15,
        ears = -1,
        bag = 0,
    }
}

Config.KeyBinds = { -- They are keymaps, check the docs to know how they work!
    ['inventory'] = 'TAB',
    ['hotbar'] = 'Z',
    ['reload'] = 'R',
    ['handsup'] = 'X',
}

--[[
    Debug mode, you can see all kinds of prints/logs using debug,
    but it's only for development.
]]

Config.Debug = false                 -- Do not touch here if you are not a developer
Config.ZoneDebug = false             -- Do not touch here if you are not a developer
Config.InventoryPrefix = 'inventory' -- Do not touch here if you are not a developer (if you use this you need to modify many more things)
