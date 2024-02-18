stressData = {}


if Config.UseStress then


    function IsWhitelisted(source)
        local player = Config.Framework == 'esx' and frameworkObject.GetPlayerFromId(source) or frameworkObject.Functions.GetPlayer(source)
        if player then
            if Config.Framework == 'esx' then
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
        ExecuteSql("UPDATE `codem-hud-data` SET stress = '"..newStress.."' WHERE identifier = '"..identifier.."'")
        TriggerClientEvent('hud:client:UpdateStress', src, newStress)
        Config.Notification(Config.Notifications["stress_gained"].message, Config.Notifications["stress_gained"].type, true, src)
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
        ExecuteSql("UPDATE `codem-hud-data` SET stress = '"..newStress.."' WHERE identifier = '"..identifier.."'")
        TriggerClientEvent('hud:client:UpdateStress', src, newStress)
        Config.Notification(Config.Notifications["stress_relive"].message, Config.Notifications["stress_relive"].type, true, src)

    end)

end
