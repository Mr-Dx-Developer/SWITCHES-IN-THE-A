Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('qs-inventory') == 'starting' or GetResourceState('qs-inventory') == 'started' then
        Config.Inventory = 3
    end
end

if Config.Inventory and Config.Inventory == 3 then
    Inventory.GetPlayerItem = function(source, item)
        if ESX then
            local xPlayer = ESX.GetPlayerFromId(source)

            if xPlayer then
                return xPlayer.getInventoryItem(item)
            end
        end
        
        if QBCore then
            local Player = QBCore.Functions.GetPlayer(source)

            if Player then
                return Player.Functions.GetItemByName(item)
            end
        end

        return nil
    end

    Inventory.AddPlayerItem = function(source, item, amount, slot, info)
        exports['qs-inventory']:AddItem(source, item, amount, slot, info)
        return
    end

    Inventory.RemovePlayerItem = function(source, item, amount, slot)
        exports['qs-inventory']:RemoveItem(source, item, amount, slot)
        return
    end

    Inventory.IsStorageEmpty = function(storage)
        local result = SQL.Scalar('SELECT items FROM inventory_stash WHERE stash = @storage', { ['@storage'] = storage })

        local items = json.decode(result)

        if type(items) == 'table' then
            return next(items) == nil
        else
            return false
        end
    end
end