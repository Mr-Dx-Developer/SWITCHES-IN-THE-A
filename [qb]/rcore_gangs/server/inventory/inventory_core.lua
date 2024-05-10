Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('core_inventory') == 'starting' or GetResourceState('core_inventory') == 'started' then
        Config.Inventory = 5
    end
end

if Config.Inventory and Config.Inventory == 5 then
    Inventory.GetPlayerItem = function(source, item)
        return exports['core_inventory']:getItem('content-' .. Framework.GetPlayerId(source), item)
    end

    Inventory.AddPlayerItem = function(source, item, amount, slot, info)
        return exports['core_inventory']:addItem('content-' .. Framework.GetPlayerId(source), item, amount, info)
    end

    Inventory.RemovePlayerItem = function(source, item, amount, slot)
        return exports['core_inventory']:removeItem('content-' .. Framework.GetPlayerId(source), item, amount)
    end

    Inventory.IsStorageEmpty = function(storage)
        local result = SQL.Scalar('SELECT data FROM coreinventories WHERE name = @storage', { ['@storage'] = storage })

        local items = json.decode(result).content

        if type(items) == 'table' then
            return next(items) == nil
        else
            return false
        end
    end
end