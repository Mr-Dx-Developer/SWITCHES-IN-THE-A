Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('esx_inventoryhud') == 'starting' or GetResourceState('esx_inventoryhud') == 'started' then
        Config.Inventory = 7
    end
end

if Config.Inventory and Config.Inventory == 7 then
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
        print('^1[GANGS] Storage not supported^7')
    end
end