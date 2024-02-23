Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('ox_inventory') == 'starting' or GetResourceState('ox_inventory') == 'started' then
        Config.Inventory = 2
    end
end

if Config.Inventory and Config.Inventory == 2 then
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
        TriggerServerEvent('rcore_gangs:server:ox_inventory', storage)

        exports['ox_inventory']:openInventory('stash', storage)
    end

    Inventory.OpenPlayerInventory = function(player)
        exports['ox_inventory']:openInventory('player', GetPlayerServerId(player))
    end
end