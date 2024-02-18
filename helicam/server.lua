local helicopters = {}
GlobalState.heliSpotlightsActive = 0

RegisterServerEvent('helicam:enterCamera')
AddEventHandler('helicam:enterCamera', function(heliNetId)
    local helicopter = Entity(NetworkGetEntityFromNetworkId(heliNetId))
    if helicopter and not helicopter.state.heliCamInUse then
        helicopter.state.heliCamInUse = true
        helicopter.state.heliCamTargetBlip = false
        helicopter.state.heliCamSpotlightData = nil
        if not helicopter.state.heliCamMarkers then
            helicopter.state.heliCamMarkers = {}
        end
        helicopters[source] = heliNetId
        TriggerClientEvent('helicam:enterCamera', source, true)
    else
        TriggerClientEvent('helicam:enterCamera', source, false)
    end
end)

RegisterServerEvent('helicam:leaveCamera')
AddEventHandler('helicam:leaveCamera', function(heliNetId)
    local helicopter = Entity(NetworkGetEntityFromNetworkId(heliNetId))
    helicopter.state.heliCamInUse = false
    helicopter.state.heliCamTargetBlip = nil
    if source ~= nil and source ~= "" then
        helicopters[source] = nil
    end
end)

RegisterServerEvent('helicam:setStateBag')
AddEventHandler('helicam:setStateBag', function(heliNetId, bagName, value)
    local helicopter = Entity(NetworkGetEntityFromNetworkId(heliNetId))
    helicopter.state[bagName] = value
end)

RegisterServerEvent('helicam:toggleSpotlight')
AddEventHandler('helicam:toggleSpotlight', function(state)
    if state then
        GlobalState.heliSpotlightsActive += 1
    else
        GlobalState.heliSpotlightsActive -= 1
    end
end)

-- If a player crashes/leaves while in the camera
AddEventHandler('playerDropped', function(reason)
    if helicopters[source] then
        TriggerEvent('helicam:leaveCamera', helicopters[source])
        Player(source).state.heliCamSpotlightData = { position = false, helicopter = helicopters[source] }
        helicopters[source] = nil
    end
end)
