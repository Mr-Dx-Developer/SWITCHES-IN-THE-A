
RegisterNetEvent('rcore_basketball:requestHoopOwnership', function(hoopId, playerName, gameMode, difficulty, wager)
    local Source = source
    local newState, err = RequestHoopOwnership(Source, hoopId, playerName, gameMode, difficulty, wager)
    if newState then
        SentStateToSubscribers(newState.Id, newState)
    else
        print('rcore_basketball:requestHoopOwnership error', Source, err)
    end
end)

RegisterNetEvent('rcore_basketball:addThrowPoint', function(pos)
    local Source = source
    local newState = AddThrowPoint(Source, pos)

    if newState then
        SentStateToSubscribers(newState.Id, newState)
    else
        print('rcore_basketball:addThrowPoint error')
    end
end)

RegisterNetEvent('rcore_basketball:removeThrowPoint', function(posToRemove)
    local Source = source
    local newState = RemoveThrowPoint(Source, posToRemove)

    if newState then
        SentStateToSubscribers(newState.Id, newState)
    else
        print('rcore_basketball:removeThrowPoint error')
    end
end)

RegisterNetEvent('rcore_basketball:finishHoopSetup', function()
    local Source = source
    local newState = FinishHoopSetup(Source)

    if newState then
        SentStateToSubscribers(newState.Id, newState)
    else
        print('rcore_basketball:finishHoopSetup error')
    end
end)

RegisterNetEvent('rcore_basketball:joinHoop', function(hoopId, name)
    local Source = source
    local newState = JoinHoop(hoopId, Source, name)

    if newState then
        SentStateToSubscribers(newState.Id, newState)
    else
        print('rcore_basketball:joinHoop error')
    end
end)

RegisterNetEvent('rcore_basketball:startHoop', function()
    local Source = source
    local newState = StartHoop(Source)

    if newState then
        SentStateToSubscribers(newState.Id, newState)
    else
        print('rcore_basketball:startHoop error')
    end
end)

RegisterNetEvent('rcore_basketball:pickupBall', function()
    local Source = source
    local hoopState = GetPlayersHoopData(Source)
    
    if hoopState then
        if hoopState.Mode == GAME_ATW then
            if GetCurrentATWTurnPlayerServerId(hoopState) ~= Source then
                print("ERROR: Wrong user trying to pickup ball")
                return
            end
        end
        
        if hoopState.Mode == GAME_HORSE then
            if hoopState.Players[hoopState.CurrentShooter].ServerId ~= Source then
                print("ERROR: Wrong user trying to pickup ball")
                return
            end
        end

        hoopState.DisplayBallResetAt = nil
        hoopState.BallHolderServerId = Source
        
        if Config.TricksRPGProgression then
            SendTricksRPGProgression(Source)
        end

        SentStateToSubscribers(hoopState.Id, hoopState)
    end
end)

function OnPlayerWin(state, winnerServerIndices, wagerReward)
    local partReward = tonumber(math.floor(wagerReward / #winnerServerIndices))

    if Config.AllowWager then
        for _, plyIdx in pairs(winnerServerIndices) do
            local serverId = state.Players[plyIdx].ServerId
            if partReward > 0 then
                PlayerGiveMoney(serverId, partReward)
                SendNotification(serverId, string.format(Config.Text.WON_WAGER, partReward))
            else
                SendNotification(serverId, Config.Text.WON_NO_WAGER)
            end
        end
    end
end

function EndGame(hoopStateIdx, hoopState)
    table.remove(State, hoopStateIdx)
    SentStateToSubscribers(hoopState.Id, {Id = hoopState.Id, Status = STATUS_FREE}, true)
end

AddEventHandler('playerDropped', function()
    local Source = source
    RemovePlayerFromAnyOngoingGame(Source)
end)

RegisterCommand('leavebasketball', function(source)
    local Source = source
    RemovePlayerFromAnyOngoingGame(Source)
end, false)

RegisterNetEvent('rcore_basketball:leave', function()
    local Source = source
    RemovePlayerFromAnyOngoingGame(Source)
end)

RegisterNetEvent('rcore_basketball:removePlayer', function(serverId)
    local Source = source
    
    local hoopState = GetPlayersHoopData(Source)

    if hoopState and hoopState.OwnerServerId == Source then
        RemovePlayerFromAnyOngoingGame(serverId)
    end
end)

function SendTricksRPGProgression(Source)
    local score = DbGetScore(GetPlayerIdentifier(Source))

    if not score then
        score = 0
    end

    TriggerClientEvent('rcore_basketball:setTrickAvailable', Source, {
        TRICK_SPIN = score >= Config.TrickScoreRequirement.TRICK_SPIN,
        TRICK_BNR = score >= Config.TrickScoreRequirement.TRICK_BNR,
    })
end

RegisterNetEvent('rcore_basketball:requestOpenSetup', function(hoopId)
    local Source = source

    if PlayerHasItem(Source, Config.BasketballItemName) then
        TriggerClientEvent('rcore_basketball:openNui', Source, {hoopId = hoopId})
    else
        SendNotification(Source, Config.Text.NEED_BASKETBALL)
    end
end)