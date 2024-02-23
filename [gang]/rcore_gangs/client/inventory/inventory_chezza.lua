Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('inventory') == 'starting' or GetResourceState('inventory') == 'started' then
        Config.Inventory = 4
    end
end

if Config.Inventory and Config.Inventory == 4 then
    Inventory.GetItems = function()
        local items = {}

        local inventory = ESX.GetPlayerData().inventory

        for index, item in pairs(inventory) do
            if (item.count and item.count > 0) or (item.amount and item.amount > 0) then
                table.insert(items, item)
            end
        end

        return items
    end

    Inventory.OpenStorage = function(storage)
        TriggerEvent('inventory:openInventory', {
            type = 'stash',
            id = storage,
            title = storage,
            slots = Config.GangOptions.storageSlots or 50,
            weight = Config.GangOptions.storageWeight or 100000,
            delay = 0,
            save = true
        })
    end

    Inventory.OpenPlayerInventory = function(player)
        TriggerEvent('inventory:openPlayerInventory', GetPlayerServerId(player), true)
    end
end