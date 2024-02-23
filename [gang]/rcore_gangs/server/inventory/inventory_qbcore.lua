Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('qb-inventory') == 'starting' or GetResourceState('qb-inventory') == 'started' then
        Config.Inventory = 1
    end
end

if Config.Inventory and Config.Inventory == 1 then
    Inventory.GetPlayerItem = function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)

        if Player and Player.Functions.GetItemByName then
            return Player.Functions.GetItemByName(item)
        else
            return exports['qb-inventory']:GetItemByName(source, item)
        end
    end

    Inventory.AddPlayerItem = function(source, item, amount, slot, info)
        local Player = QBCore.Functions.GetPlayer(source)

        if Player and Player.Functions.AddItem then
            return Player.Functions.AddItem(item, amount, slot, info)
        else
            return exports['qb-inventory']:AddItem(source, item, amount, slot, info)
        end
    end

    Inventory.RemovePlayerItem = function(source, item, amount, slot)
        local Player = QBCore.Functions.GetPlayer(source)

        if Player and Player.Functions.RemoveItem then
            return Player.Functions.RemoveItem(item, amount, slot)
        else
            return exports['qb-inventory']:RemoveItem(source, item, amount, slot)
        end
    end

    Inventory.IsStorageEmpty = function(storage)
        local result = SQL.Scalar('SELECT items FROM stashitems WHERE stash = @storage', { ['@storage'] = storage })

        local items = json.decode(result)

        if type(items) == 'table' then
            return next(items) == nil
        else
            return false
        end
    end
end