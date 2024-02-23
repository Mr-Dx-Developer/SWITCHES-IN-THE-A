Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('inventory') == 'starting' or GetResourceState('inventory') == 'started' then
        Config.Inventory = 4
    end
end

if Config.Inventory and Config.Inventory == 4 then
    Inventory.GetPlayerItem = function(source, item)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer then
            return xPlayer.getInventoryItem(item)
        end
    end

    Inventory.AddPlayerItem = function(source, item, amount, slot, info)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer then
            return xPlayer.addInventoryItem(item, amount)
        end
    end

    Inventory.RemovePlayerItem = function(source, item, amount, slot)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer then
            return xPlayer.removeInventoryItem(item, amount)
        end
    end

    Inventory.IsStorageEmpty = function(storage)
        local result = SQL.Scalar('SELECT data FROM inventories WHERE identifier = @storage', { ['@storage'] = storage })

        local items = json.decode(result)

        if type(items) == 'table' then
            return next(items) == nil
        else
            return false
        end
    end
end