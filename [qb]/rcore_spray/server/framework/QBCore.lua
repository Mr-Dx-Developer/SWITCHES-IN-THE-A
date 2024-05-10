if Framework == nil or Framework == 0 then
    if GetResourceState('qb-core') == 'starting' or GetResourceState('qb-core') == 'started' then
        Framework = FW_QBCORE
    end
end

if Framework == FW_QBCORE then
    if FrameworkTriggers['notify'] == '' or string.strtrim(string.lower(FrameworkTriggers['notify'])) == 'qbcore' then
        FrameworkTriggers['notify'] = 'QBCore:Notify'
    end

    if FrameworkTriggers['object'] == '' or string.strtrim(string.lower(FrameworkTriggers['object'])) == 'qbcore' then
        FrameworkTriggers['object'] = 'QBCore:GetObject'
    end

    if FrameworkTriggers['resourceName'] == '' or string.strtrim(string.lower(FrameworkTriggers['resourceName'])) == 'qbcore' then
        FrameworkTriggers['resourceName'] = 'qb-core'
    end
end

Citizen.CreateThread(function()
    if Framework == FW_QBCORE then
        local QBCore = Citizen.Await(GetSharedObjectSafe())
        ESX = {}
        if not UseOxInventory then
            RegisterUsableItem = function(itemName, callBack)
                QBCore.Functions.CreateUseableItem(itemName, callBack)
            end

            GetItemCount = function(serverId, name)
                local qbPlayer = QBCore.Functions.GetPlayer(serverId)
                local item = qbPlayer.Functions.GetItemByName(name)

                if not item then
                    return 0
                end

                return item.amount
            end

            RemoveInventoryItem = function(serverId, name, count)
                local qbPlayer = QBCore.Functions.GetPlayer(serverId)
                qbPlayer.Functions.RemoveItem(name, count)
            end
        end

        GetPlayerIdentifier = function(serverId)
            local qbPlayer = QBCore.Functions.GetPlayer(serverId)
            return qbPlayer.PlayerData.citizenid
        end

        ShowNotification = function(source, text)
            TriggerClientEvent('QBCore:Notify', source, text)
        end
    end
end)