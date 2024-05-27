local playerRequestQue = {}

RegisterNetEvent(TriggerName("PlayerGiveBreathTest"), function(targetID)
    local src = source
    local sourceCoords = GetEntityCoords(GetPlayerPed(src))
    local targetCoords = GetEntityCoords(GetPlayerPed(targetID))

    playerRequestQue[targetID] = src

    if #(sourceCoords - targetCoords) < 15 then
        TriggerClientEvent(TriggerName("AskPlayerForTest"), targetID, source)
    end
end)

RegisterNetEvent(TriggerName("ShowResultTest"), function(targetID, drunk, level)
    local src = source
    local sourceCoords = GetEntityCoords(GetPlayerPed(src))
    local targetCoords = GetEntityCoords(GetPlayerPed(targetID))

    if #(sourceCoords - targetCoords) < 2 then
        TriggerClientEvent(TriggerName("ShowResultTest"), targetID,  drunk, level)
    end
end)

RegisterNetEvent(TriggerName("AcceptTestAction"), function()
    if playerRequestQue[source] then
        local initialPlayer = playerRequestQue[source]

        local sourceCoords = GetEntityCoords(GetPlayerPed(source))
        local targetCoords = GetEntityCoords(GetPlayerPed(initialPlayer))

        if #(sourceCoords - targetCoords) < 2 then
            TriggerClientEvent(TriggerName("PlayerGiveBreathTest"), initialPlayer, "give", source)
            TriggerClientEvent(TriggerName("PlayerGiveBreathTest"), source, "take", initialPlayer)
        end
        playerRequestQue[source] = nil
    end
end)

RegisterNetEvent(TriggerName("ResetPlayerState"), function(targetID)
    playerRequestQue[targetID] = nil
    TriggerClientEvent(TriggerName("ResetPlayerState"), targetID)
end)

RegisterNetEvent(TriggerName("DenyTestAction"), function()
    if playerRequestQue[source] then
        TriggerClientEvent(TriggerName("PlayerDeclinedTest"), playerRequestQue[source])
        playerRequestQue[source] = nil
    end
end)