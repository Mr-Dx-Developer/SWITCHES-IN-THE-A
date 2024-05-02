Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('ox_inventory') == 'starting' or GetResourceState('ox_inventory') == 'started' then
        Config.Inventory = 2
    end
end

if Config.Inventory and Config.Inventory == 2 then
    Inventory.GetPlayerItem = function(source, item)
        return exports['ox_inventory']:GetItem(source, item, nil, false)
    end

    Inventory.AddPlayerItem = function(source, item, amount, slot, info)
        return exports['ox_inventory']:AddItem(source, item, amount, info, slot)
    end

    Inventory.RemovePlayerItem = function(source, item, amount, slot)
        return exports['ox_inventory']:RemoveItem(source, item, amount, nil, slot)
    end

    Inventory.IsStorageEmpty = function(storage)
        local result = exports['ox_inventory']:GetInventory(storage, false)

        local items = result.items

        if type(items) == 'table' then
            return next(items) == nil
        else
            return false
        end
    end

    RegisterNetEvent('rcore_gangs:server:ox_inventory')
    AddEventHandler('rcore_gangs:server:ox_inventory', function(storage)
        local result = exports['ox_inventory']:GetInventory(storage, false)

        if not result then
            exports['ox_inventory']:RegisterStash(storage, storage, Config.GangOptions.storageSlots or 50, Config.GangOptions.storageWeight or 100000, false)
        end
    end)
end