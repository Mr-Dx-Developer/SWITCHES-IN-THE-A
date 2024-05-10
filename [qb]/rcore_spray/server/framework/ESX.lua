if Framework == nil or Framework == 0 then
    if GetResourceState('es_extended') == 'starting' or GetResourceState('es_extended') == 'started' then
        Framework = FW_ESX
    end
end

if Framework == FW_ESX then
    if FrameworkTriggers['notify'] == '' or string.strtrim(string.lower(FrameworkTriggers['notify'])) == 'esx' then
        FrameworkTriggers['notify'] = 'esx:showNotification'
    end

    if FrameworkTriggers['object'] == '' or string.strtrim(string.lower(FrameworkTriggers['object'])) == 'esx' then
        FrameworkTriggers['object'] = 'esx:getSharedObject'
    end

    if FrameworkTriggers['resourceName'] == '' or string.strtrim(string.lower(FrameworkTriggers['resourceName'])) == 'esx' then
        FrameworkTriggers['resourceName'] = 'es_extended'
    end
end

Citizen.CreateThread(function()
    if Framework == FW_ESX then
        local ESX = Citizen.Await(GetSharedObjectSafe())

        GetPlayerIdentifier = function(serverId)
            local xPlayer = ESX.GetPlayerFromId(serverId)
            return xPlayer.identifier
        end

        ShowNotification = function(source, text)
            TriggerClientEvent('esx:showNotification', source, text)
        end

        if not UseOxInventory then
            GetItemCount = function(serverId, name)
                local xPlayer = ESX.GetPlayerFromId(serverId)
                local item = xPlayer.getInventoryItem(name)

                if item and item[1] and item[1].count then
                    return item[1].count
                end

                if item and item.count then
                    return item.count
                end

                return 0
            end

            RemoveInventoryItem = function(serverId, name, count)
                local xPlayer = ESX.GetPlayerFromId(serverId)
                xPlayer.removeInventoryItem(name, count)
            end

            Citizen.CreateThread(function()
                while not ESX do Wait(100) end
                RegisterUsableItem = function(itemName, callBack)
                    ESX.RegisterUsableItem(itemName, callBack)
                end
            end)
        end
    end
end)