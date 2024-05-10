if Config.Framework == nil or Config.Framework == 0 then
    if GetResourceState('es_extended') == 'starting' or GetResourceState('es_extended') == 'started' then
        Config.Framework = 1
    end
end

if Config.Framework == 1 then
    if Config.FrameworkTriggers['notify'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['notify'])) == 'esx' then
        Config.FrameworkTriggers['notify'] = 'esx:showNotification'
    end

    if Config.FrameworkTriggers['object'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['object'])) == 'esx' then
        Config.FrameworkTriggers['object'] = 'esx:getSharedObject'
    end

    if Config.FrameworkTriggers['resourceName'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['resourceName'])) == 'esx' then
        Config.FrameworkTriggers['resourceName'] = 'es_extended'
    end
end

CreateThread(function()
    if Config.Framework == 1 then
        local ESX = Citizen.Await(GetSharedObjectSafe())

        SendNotification = function(source, text)
            TriggerClientEvent(Config.FrameworkTriggers['notify'], source, text)
        end

        GetPlayerMoney = function(source)
            return ESX.GetPlayerFromId(source).getMoney()
        end

        PlayerHasMoney = function(serverId, amount)
            return GetPlayerMoney(serverId) >= amount
        end

        PlayerGiveMoney = function(source, amount)
            return ESX.GetPlayerFromId(source).addMoney(amount)
        end

        PlayerTakeMoney = function(source, amount)
            return ESX.GetPlayerFromId(source).removeMoney(amount)
        end
        
        GetPlayerIdentifier = function(serverId)
            local xPlayer = ESX.GetPlayerFromId(serverId)

            return xPlayer.identifier
        end

        SafeGetItem = function(xPlayer, name)
            local item = xPlayer.getInventoryItem(name)

            if item and item[1] and item[1].count then
                return item[1]
            end

            return item
        end

        PlayerHasItem = function(serverId, itemName)
            local xPlayer = ESX.GetPlayerFromId(serverId)
            local item = SafeGetItem(xPlayer, itemName)
    
            return item and item.count and item.count > 0
        end

        PlayerTakeItem = function(serverId, itemName)
            local xPlayer = ESX.GetPlayerFromId(serverId)
            xPlayer.removeInventoryItem(itemName, 1)
        end

        PlayerGiveItem = function(serverId, itemName)
            local xPlayer = ESX.GetPlayerFromId(serverId)
            xPlayer.addInventoryItem(itemName, 1)
        end

        if Config.OxInventory then
            ESX.RegisterUsableItem = function(itemName, cb)
                exports(itemName, function(event, item, inventory, slot, data)
                    cb(inventory.id)
                end)
            end
        end

        if Config.AllowPlacingHoops then
            ESX.RegisterUsableItem(Config.HoopItemName, function(serverId)
                TriggerClientEvent('rcore_basketball:startPlacingHoop', serverId)
            end)
        end
    end
end)
