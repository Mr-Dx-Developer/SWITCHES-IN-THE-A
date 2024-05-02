Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('mf-inventory') == 'starting' or GetResourceState('mf-inventory') == 'started' then
        Config.Inventory = 6
    end
end

if Config.Inventory and Config.Inventory == 6 then
    Inventory.GetPlayerItem = function(source, item)
        return exports['mf-inventory']:getInventoryItem(ServerIdToPlayerId[source], item)
    end

    Inventory.AddPlayerItem = function(source, item, amount, slot, info)
        return exports['mf-inventory']:addInventoryItem(ServerIdToPlayerId[source], item, amount, source, nil, info)
    end

    Inventory.RemovePlayerItem = function(source, item, amount, slot)
        return exports['mf-inventory']:removeInventoryItem(ServerIdToPlayerId[source], item, amount, source)
    end

    Inventory.IsStorageEmpty = function(storage)
        local items = exports['mf-inventory']:getInventoryItems(storage)

        for key, item in pairs(items) do
            if item and item.count and item.count > 0 then
                return false
            end
        end

        return true
    end

    RegisterNetEvent('rcore_gangs:server:mf-inventory')
    AddEventHandler('rcore_gangs:server:mf-inventory', function(storage)
        local src = source
        local result = exports['mf-inventory']:getInventory(storage)

        if not result then
            exports['mf-inventory']:createInventory(storage, 'inventory', 'stash', storage, Config.GangOptions.storageWeight or 100000, Config.GangOptions.storageSlots or 50)
        end

        TriggerClientEvent('rcore_gangs:client:mf-inventory', src, storage)
    end)
end