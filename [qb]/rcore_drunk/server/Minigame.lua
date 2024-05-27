local playerRequestQue = {}

RegisterNetEvent(TriggerName("MinigameChallengPlayer"), function(targetID)
    local src = source
    local sourceCoords = GetEntityCoords(GetPlayerPed(src))
    local targetCoords = GetEntityCoords(GetPlayerPed(targetID))

    if #(sourceCoords - targetCoords) < 5 then
        playerRequestQue[targetID] = src
        TriggerClientEvent(TriggerName("AskPlayerForMinigameAccepted"), targetID)
    end
end)

RegisterNetEvent(TriggerName("GiveUpOnMinigame"), function(skipAnimation)
    TriggerClientEvent(TriggerName("GiveUpOnMinigame"), source, skipAnimation) -- accepted challeng ID
    if not playerRequestQue[source] then
        for k,v in pairs(playerRequestQue) do
            if k == source or v == source then
                TriggerClientEvent(TriggerName("WinnerMinigame"), k) -- creator
                playerRequestQue[k] = nil
            end
        end
    else
        TriggerClientEvent(TriggerName("WinnerMinigame"), playerRequestQue[source]) -- creator
        playerRequestQue[source] = nil
    end
end)

RegisterNetEvent(TriggerName("MinigameAcceptedAction"), function()
    if playerRequestQue[source] then
        local initialPlayer = playerRequestQue[source]

        local sourceCoords = GetEntityCoords(GetPlayerPed(source))
        local targetCoords = GetEntityCoords(GetPlayerPed(initialPlayer))

        if #(sourceCoords - targetCoords) < 1 then
            FrameworkObject.GetPlayerFromId(initialPlayer).removeInventoryItem("supervodka", 1)

            TriggerClientEvent(TriggerName("MinigameAccepted"), initialPlayer, source)
            TriggerClientEvent(TriggerName("FreezeTarget"), source, initialPlayer)
        else
            TriggerClientEvent(TriggerName("MinigameTooFarAway"), source)
        end
        --playerRequestQue[source] = nil
    end
end)

RegisterNetEvent(TriggerName("MinigameResetPlayerState"), function(targetID)
    playerRequestQue[targetID] = nil
    TriggerClientEvent(TriggerName("MinigameResetPlayerState"), targetID)
end)

RegisterNetEvent(TriggerName("MinigameDenyTestAction"), function()
    if playerRequestQue[source] then
        TriggerClientEvent(TriggerName("MinigameDenyTestAction"), playerRequestQue[source])
        playerRequestQue[source] = nil
    end
end)