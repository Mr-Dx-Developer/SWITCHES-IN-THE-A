RegisterServerEvent('snipe-menu:server:reviveplayer', function(otherPlayerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["revive_player_used"]..GetPlayerName(otherPlayerId))
        if Config.Ambulance == "wasabi" then
            TriggerClientEvent('wasabi_ambulance:revive', otherPlayerId)
        else
            if Config.Core == "QBCore" then
                TriggerClientEvent('hospital:client:Revive', otherPlayerId)
            elseif Config.Core == "ESX" then
                TriggerClientEvent('esx_ambulancejob:revive', otherPlayerId)
            end
        end

    else
        SendLogs(src, "exploit", Config.Locales["revive_exploit_event"])
    end
end)

RegisterServerEvent('snipe-menu:server:healPlayer', function(otherPlayerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["heal_player_used"]..GetPlayerName(otherPlayerId))
        if Config.Core == "QBCore" then
            TriggerClientEvent('hospital:client:Revive', otherPlayerId)
        elseif Config.Core == "ESX" then
            TriggerClientEvent("esx_basicneeds:healPlayer", otherPlayerId)
        end
    else
        SendLogs(src, "exploit", Config.Locales["heal_player_exploit"])
    end
end)

RegisterServerEvent("snipe-menu:server:reviveall", function()
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["revive_all_used"])
        if Config.Ambulance == "wasabi" then
            local playersList = GetPlayers()
            for k, v in pairs(playersList) do
                TriggerClientEvent('wasabi_ambulance:revive', tonumber(v))
            end
        else
            TriggerClientEvent("snipe-menu:client:reviveall", -1, src)
        end
    else
        TriggerServerEvent("snipe-menu:server:sendLogs", "exploit", Config.Locales["revive_all_exploit"])
    end
end)

RegisterServerEvent('snipe-menu:server:reviveInRadius', function(otherPlayerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["revive_radius_used"])
        if Config.Ambulance == "wasabi" then
            local playerCoords = GetEntityCoords(GetPlayerPed(src))
            local playersList = GetPlayers()
            for k, v in pairs(playersList) do
                if #(playerCoords - GetEntityCoords(GetPlayerPed(tonumber(v))) ) < 5.0 then
                    TriggerClientEvent('wasabi_ambulance:revive', tonumber(v))
                end
            end
        else
            TriggerClientEvent('snipe-menu:client:reviveInRadius', -1, GetEntityCoords(GetPlayerPed(src)))
        end
    else
        SendLogs(src, "exploit", Config.Locales["revive_radius_exploit_event"])
    end
end)


RegisterServerEvent("snipe-menu:server:removeStress", function(otherPlayerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["remove_stress_used"]..GetPlayerName(otherPlayerId))
        TriggerClientEvent("snipe-menu:client:removeStress", otherPlayerId, src)
    else
        SendLogs(src, "exploit", Config.Locales["remove_stress_exploit"])
    end
end)