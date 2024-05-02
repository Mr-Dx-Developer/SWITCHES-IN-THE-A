Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('core_inventory') == 'starting' or GetResourceState('core_inventory') == 'started' then
        Config.Inventory = 5
    end
end

if Config.Inventory and Config.Inventory == 5 then
    Inventory.GetItems = function()
        local items = {}

        local inventory = {}

        if ESX then
            inventory = ESX.GetPlayerData().inventory
        end

        if QBCore then
            inventory = QBCore.Functions.GetPlayerData().items
        end

        for index, item in pairs(inventory) do
            if (item.count and item.count > 0) or (item.amount and item.amount > 0) then
                table.insert(items, item)
            end
        end

        return items
    end

    Inventory.OpenStorage = function(storage)
        TriggerServerEvent('core_inventory:server:openInventory', storage, 'stash')
    end

    Inventory.OpenPlayerInventory = function(player)
        TriggerServerEvent('core_inventory:server:openInventory', GetPlayerServerId(player), 'otherplayer')
    end
end