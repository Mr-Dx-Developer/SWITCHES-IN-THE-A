if Config.Framework == nil or Config.Framework == 0 then
    if GetResourceState('qb-core') == 'starting' or GetResourceState('qb-core') == 'started' then
        Config.Framework = 2
    end
end

if Config.Framework == 2 then
    if Config.FrameworkTriggers['notify'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['notify'])) == 'qbcore' then
        Config.FrameworkTriggers['notify'] = 'QBCore:Notify'
    end

    if Config.FrameworkTriggers['object'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['object'])) == 'qbcore' then
        Config.FrameworkTriggers['object'] = 'QBCore:GetObject'
    end

    if Config.FrameworkTriggers['resourceName'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['resourceName'])) == 'qbcore' then
        Config.FrameworkTriggers['resourceName'] = 'qb-core'
    end
end


function tprint (tbl, indent)
    if not indent then indent = 0 end
    if type(tbl) == 'table' then
       for k, v in pairs(tbl) do
          formatting = string.rep("  ", indent) .. k .. ": "
          if type(v) == "table" then
             print(formatting)
             tprint(v, indent+1)
          elseif type(v) == 'boolean' then
             print(formatting .. tostring(v))      
          else
             print(formatting .. v)
          end
       end
    else
       print(tbl)
    end
 end


CreateThread(function()
    if Config.Framework == 2 then
        local QBCore = Citizen.Await(GetSharedObjectSafe())

        SendNotification = function(source, text)
            TriggerClientEvent(Config.FrameworkTriggers['notify'], source, text)
        end

        GetPlayerMoney = function(source)
            return QBCore.Functions.GetPlayer(source).PlayerData.money.cash
        end
        
        PlayerHasMoney = function(serverId, amount)
            return GetPlayerMoney(serverId) >= amount
        end

        PlayerGiveMoney = function(source, amount)
            return QBCore.Functions.GetPlayer(source).Functions.AddMoney('cash', amount)
        end

        PlayerTakeMoney = function(source, amount)
            return QBCore.Functions.GetPlayer(source).Functions.RemoveMoney('cash', amount)
        end
        
        GetPlayerIdentifier = function(serverId)
            local qbPlayer = QBCore.Functions.GetPlayer(serverId)

            return qbPlayer.PlayerData.citizenid
        end

        PlayerHasItem = function(serverId, itemName)
            local qbPlayer = QBCore.Functions.GetPlayer(serverId)
            
            local result = qbPlayer.Functions.GetItemByName(itemName)

            if result and result.amount > 0 then
                return true
            end

            return false
        end

        PlayerTakeItem = function(serverId, itemName)
            local qbPlayer = QBCore.Functions.GetPlayer(serverId)
            local result = qbPlayer.Functions.RemoveItem(itemName, 1)

            if result then
			    TriggerClientEvent('inventory:client:ItemBox', serverId, QBCore.Shared.Items[itemName], 'remove')
                return true
            end
        end

        PlayerGiveItem = function(serverId, itemName)
            local qbPlayer = QBCore.Functions.GetPlayer(serverId)
            qbPlayer.Functions.AddItem(itemName, 1)
            TriggerClientEvent('inventory:client:ItemBox', serverId, QBCore.Shared.Items[itemName], 'add')
        end
        
        if Config.OxInventory then
            QBCore.Functions.CreateUseableItem = function(itemName, cb)
                exports(itemName, function(event, item, inventory, slot, data)
                    cb(inventory.id)
                end)
            end
        end

        if Config.AllowPlacingHoops then
            QBCore.Functions.CreateUseableItem(Config.HoopItemName, function(serverId)
                TriggerClientEvent('rcore_basketball:startPlacingHoop', serverId)
            end)
        end

    end
end)

