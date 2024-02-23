

if Config.EnableStress then
    stressData = {}
    function IsWhitelisted(source)
        local player = GetPlayer(source)
        if player then
            if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
                for _,v in pairs(Config.StressWhitelistJobs) do
                    if player.job.name == v then
                        return true
                    end
                end
            else
                for _,v in pairs(Config.StressWhitelistJobs) do
                    if player.PlayerData.job.name == v then
                        return true
                    end
                end
            end
        end
        return false
    end

    RegisterServerEvent("mHud:CheckPlayerStress")
    AddEventHandler("mHud:CheckPlayerStress", function()
        local src = source
        Wait(1500)
        local identifier = GetIdentifier(src)
        local data = ExecuteSql("SELECT * FROM `"..Config.StressMysqlTable.."` WHERE identifier = '"..identifier.."' ")
        if not data[1] then
            ExecuteSql("INSERT INTO `"..Config.StressMysqlTable.."` (`identifier`, `stress`) VALUES ('"..identifier.."', '0')")
            stressData[identifier] = 0
            TriggerClientEvent('hud:client:UpdateStress', src, stressData[identifier])
        else
            stressData[identifier] = data[1].stress
            TriggerClientEvent('hud:client:UpdateStress', src, stressData[identifier])
        end
    end)

    RegisterServerEvent("esx:playerLogout")
    AddEventHandler("esx:playerLogout", function(source)
        local src = source
        local identifier = GetIdentifier(src)
        if stressData[identifier] then
            ExecuteSql("UPDATE `"..Config.StressMysqlTable.."` SET stress = '"..stressData[identifier].."' WHERE identifier = '"..identifier.."'")
        end
    end)

    RegisterServerEvent("QBCore:Server:OnPlayerUnload")
    AddEventHandler("QBCore:Server:OnPlayerUnload", function(source)
        local src = source
        local identifier = GetIdentifier(src)
        if stressData[identifier] then
            ExecuteSql("UPDATE `"..Config.StressMysqlTable.."` SET stress = '"..stressData[identifier].."' WHERE identifier = '"..identifier.."'")
        end
    end)
    AddEventHandler('playerDropped', function()
        local src = source
        local identifier = GetIdentifier(src)
        if identifier and stressData[identifier] then
            ExecuteSql("UPDATE `"..Config.StressMysqlTable.."` SET stress = '"..stressData[identifier].."' WHERE identifier = '"..identifier.."'")
        end        
    end)
    
    RegisterNetEvent('hud:server:GainStress', function(amount)
    
        local src = source
        local identifier = GetIdentifier(src)
        local newStress
        if IsWhitelisted(src) then
            return
        end
        if stressData[identifier] == nil then
            stressData[identifier] = 0
        end
        newStress = tonumber(stressData[identifier]) + amount
        if newStress <= 0 then newStress = 0 end
    
        if newStress > 100 then
            newStress = 100
        end
        stressData[identifier] = newStress
        -- ExecuteSql("UPDATE `"..Config.StressMysqlTable.."` SET stress = '"..newStress.."' WHERE identifier = '"..identifier.."'")
        TriggerClientEvent('hud:client:UpdateStress', src, newStress)
        if newStress > 0 then
            Config.Notification(Config.Notifications["GETTING_STRESSED"].message, Config.Notifications["GETTING_STRESSED"].type, true, src)
        end
    end)
    
    RegisterNetEvent('hud:server:RelieveStress', function(amount)
        local src = source
        local identifier = GetIdentifier(src)
    
        local newStress
            
        if stressData[identifier] == nil then
            stressData[identifier] = 0
        end
        newStress = tonumber(stressData[identifier]) - amount
        if newStress <= 0 then newStress = 0 end

        if newStress > 100 then
            newStress = 100
        end
        stressData[identifier] = newStress
        -- ExecuteSql("UPDATE `"..Config.StressMysqlTable.."` SET stress = '"..newStress.."' WHERE identifier = '"..identifier.."'")
        TriggerClientEvent('hud:client:UpdateStress', src, newStress)
        if newStress > 0 then
            Config.Notification(Config.Notifications["RELIEVED_STRESS"].message, Config.Notifications["RELIEVED_STRESS"].type, true, src)
        end
    end)
end
