function HandlePlay(pedCoords, hoopId, hoopData)
	local groundPedCoords = pedCoords - vector3(0.0, 0.0, 1.0)

	local hoopIdx, hoopData, playerIdx = GetCurrentPlayersHoopData()

    if hoopData.State.Mode == GAME_ATW then
        if IsCurrentATWPlayersTurn(hoopData) then
            local isHolding = hoopData.State and hoopData.State.BallHolderServerId == MyServerId
    
            if isHolding then
                HandleAroundTheWorld(pedCoords, hoopData, groundPedCoords, playerIdx)
            else
                WantedInstructionalState = STATE_NONE
                HandleBallPickup(hoopData, groundPedCoords)   
            end
        else
            WantedInstructionalState = STATE_NONE
        end
    elseif hoopData.State.Mode == GAME_HORSE then
        HandleHorse(pedCoords, hoopData, groundPedCoords, playerIdx)
    elseif hoopData.State.Mode == GAME_FREE_THROW then
        HandleFreeThrow(pedCoords, hoopData, groundPedCoords, playerIdx)
    else
        print("UNKNOWN MODE", hoopData.State.Mode)
    end
end

function HandleHorse(pedCoords, hoopData, groundPedCoords, playerIdx)
	local groundPedCoords = pedCoords - vector3(0.0, 0.0, 1.0)

    local hoopState = hoopData.State
    -- kdyz jsem first thrower, hodit throw UI, nastavuji throwpoint
    -- kdyz nejsem first thrower, drawnout checkpoint, vejdu do nej, hodim
    local currentShooterPlayerData = hoopState.Players[hoopState.CurrentShooter]
    local currentShotSetterPlayerData = hoopState.Players[hoopState.ShotSetterPlayerIndex]

    if currentShooterPlayerData and currentShooterPlayerData.ServerId == MyServerId then
        local isHolding = hoopData.State and hoopData.State.BallHolderServerId == MyServerId

        DisableControlAction(0, Config.Controls.TRICK_BNR.keyHold, true)
        local isAlt = IsControlPressed(0, Config.Controls.TRICK_SPIN.keyHold) or IsDisabledControlPressed(0, Config.Controls.TRICK_SPIN.keyHold)
        local isCtrl = IsControlPressed(0, Config.Controls.TRICK_BNR.keyHold) or IsDisabledControlPressed(0, Config.Controls.TRICK_BNR.keyHold)
        local isE = IsControlJustPressed(0, Config.Controls.AIM_THROW.key) or IsDisabledControlJustPressed(0, Config.Controls.AIM_THROW.key)

        if isAlt and not isCtrl and isE then
            PlaySpinAnim(PlayerPedId(), hoopData.index)
        elseif not isAlt and isCtrl and isE then
            PlayAroundTheWorldAnim(PlayerPedId(), hoopData.index)
        end

        if isHolding then
            if currentShotSetterPlayerData and currentShotSetterPlayerData.ServerId == currentShooterPlayerData.ServerId and not hoopState.DoNotAdvanceSetter then
                SubtitleText(Config.Text.HORSE_SET)
                WantedInstructionalState = INSTRUCT_PLAY
                
                if not isAlt and not isCtrl and isE then
                    local pathPoints, scoredTime = GetAimParameters(
                        hoopData,
                        hoopData.hoopPlanePoint, 
                        hoopData.hoopPlaneNormal, 
                        hoopData.hoopPlaneNormalLeft, 
                        hoopData.hoopPlaneNormalUp, 
                        hoopData.hoopPos, 
                        hoopData.hoopRadius,
                        hoopData.hoopHeading
                    )
        
                    if pathPoints then
                        hoopData.State.Status = STATUS_THROWN
                        TriggerServerEvent('rcore_basketball:throwBall', pathPoints, scoredTime or 'nil', {ThrowPos = groundPedCoords})
                        PlayThrowAnim(PlayerPedId(), hoopData.index)
                    end
                end
            else
                local throwPos = hoopData.State.ThrowPoints[#hoopData.State.ThrowPoints]

                SubtitleText(Config.Text.HORSE_THROW)

                if #(groundPedCoords - throwPos) <= Config.Marker.Scale/2 then
                    DrawSimpleMarker(
                        throwPos, 
                        Config.Marker.Scale, 
                        255, 0, 0, 150
                    )
                    
                    if not isAlt and not isCtrl and isE then
                        local pathPoints, scoredTime = GetAimParameters(
                            hoopData,
                            hoopData.hoopPlanePoint, 
                            hoopData.hoopPlaneNormal, 
                            hoopData.hoopPlaneNormalLeft, 
                            hoopData.hoopPlaneNormalUp, 
                            hoopData.hoopPos, 
                            hoopData.hoopRadius,
                            hoopData.hoopHeading
                        )
            
                        if pathPoints then
                            hoopData.State.Status = STATUS_THROWN
                            TriggerServerEvent('rcore_basketball:throwBall', pathPoints, scoredTime or 'nil')
                            PlayThrowAnim(PlayerPedId(), hoopData.index)
                        end
                    end
                else
                    if not isAlt and not isCtrl and isE then
                        DisplayMustBeInMarker(Config.Text.MUST_BE_IN_MARKER)
                    end
                    DrawSimpleMarker(throwPos, Config.Marker.Scale, 200, 0, 0, 150)
                end
            end
        else
            WantedInstructionalState = STATE_NONE
            HandleBallPickup(hoopData, groundPedCoords)   
        end
    else
        WantedInstructionalState = STATE_NONE
    end
end

function HandleFreeThrow(pedCoords, hoopData, groundPedCoords, playerIdx)
	local groundPedCoords = pedCoords - vector3(0.0, 0.0, 1.0)

    local hoopState = hoopData.State
    local isHolding = hoopData.State and hoopData.State.BallHolderServerId == MyServerId

    if isHolding then
        WantedInstructionalState = INSTRUCT_PLAY

        DisableControlAction(0, Config.Controls.TRICK_BNR.keyHold, true)
        local isAlt = IsControlPressed(0, Config.Controls.TRICK_SPIN.keyHold) or IsDisabledControlPressed(0, Config.Controls.TRICK_SPIN.keyHold)
        local isCtrl = IsControlPressed(0, Config.Controls.TRICK_BNR.keyHold) or IsDisabledControlPressed(0, Config.Controls.TRICK_BNR.keyHold)
        local isE = IsControlJustPressed(0, Config.Controls.AIM_THROW.key) or IsDisabledControlJustPressed(0, Config.Controls.AIM_THROW.key)

        if isAlt and not isCtrl and isE then
            PlaySpinAnim(PlayerPedId(), hoopData.index)
        elseif not isAlt and isCtrl and isE then
            PlayAroundTheWorldAnim(PlayerPedId(), hoopData.index)
        elseif not isAlt and not isCtrl and isE then
            local pathPoints, scoredTime = GetAimParameters(
                hoopData,
                hoopData.hoopPlanePoint, 
                hoopData.hoopPlaneNormal, 
                hoopData.hoopPlaneNormalLeft, 
                hoopData.hoopPlaneNormalUp, 
                hoopData.hoopPos, 
                hoopData.hoopRadius,
                hoopData.hoopHeading
            )

            
            if pathPoints then
                hoopData.State.Status = STATUS_THROWN
                local points = 3

                if #(hoopData.threePointCircleRoot.xy - pedCoords.xy) < hoopData.threePointRadius then
                    points = 1
                end

                TriggerServerEvent('rcore_basketball:throwBall', pathPoints, scoredTime or 'nil', {ThrowPos = groundPedCoords, Points = points})
                PlayThrowAnim(PlayerPedId(), hoopData.index)
            end
        end
    elseif not hoopData.State.BallHolderServerId then
        WantedInstructionalState = STATE_NONE
        HandleBallPickup(hoopData, groundPedCoords)   
    else
        WantedInstructionalState = STATE_NONE
    end
end

function HandleAroundTheWorld(pedCoords, hoopData, groundPedCoords, playerIdx)
    local finishedThrows = GetCurrentThrowNumber(hoopData.State.Players[playerIdx].Throws)
    local throwPos = hoopData.State.ThrowPoints[finishedThrows+1]

    WantedInstructionalState = INSTRUCT_PLAY

    
    DisableControlAction(0, Config.Controls.TRICK_BNR.keyHold, true)
    local isAlt = IsControlPressed(0, Config.Controls.TRICK_SPIN.keyHold) or IsDisabledControlPressed(0, Config.Controls.TRICK_SPIN.keyHold)
    local isCtrl = IsControlPressed(0, Config.Controls.TRICK_BNR.keyHold) or IsDisabledControlPressed(0, Config.Controls.TRICK_BNR.keyHold)
    local isE = IsControlJustPressed(0, Config.Controls.AIM_THROW.key) or IsDisabledControlJustPressed(0, Config.Controls.AIM_THROW.key)

    if isAlt and not isCtrl and isE then
        PlaySpinAnim(PlayerPedId(), hoopData.index)
    elseif not isAlt and isCtrl and isE then
        PlayAroundTheWorldAnim(PlayerPedId(), hoopData.index)
    end

    if #(groundPedCoords - throwPos) <= Config.Marker.Scale/2 then
        DrawSimpleMarker(
            throwPos, 
            Config.Marker.Scale, 
            255, 0, 0, 150
        )

        if not isAlt and not isCtrl and isE then
            local pathPoints, scoredTime = GetAimParameters(
                hoopData,
                hoopData.hoopPlanePoint, 
                hoopData.hoopPlaneNormal, 
                hoopData.hoopPlaneNormalLeft, 
                hoopData.hoopPlaneNormalUp, 
                hoopData.hoopPos, 
                hoopData.hoopRadius,
                hoopData.hoopHeading
            )

            if pathPoints then
                hoopData.State.Status = STATUS_THROWN
                TriggerServerEvent('rcore_basketball:throwBall', pathPoints, scoredTime or 'nil')
                PlayThrowAnim(PlayerPedId(), hoopData.index)
            end
        end
    else
        if not isAlt and not isCtrl and isE then
            DisplayMustBeInMarker(Config.Text.MUST_BE_IN_MARKER)
        end
        DrawSimpleMarker(throwPos, Config.Marker.Scale, 200, 0, 0, 150)
    end
end

function HandleBallPickup(hoopData, groundPedCoords)
    local ballPos = GetEntityCoords(hoopData.ballEntity) - vector3(0.0, 0.0, 0.13)

    local gf, gz = GetGroundZFor_3dCoord(ballPos.x, ballPos.y, ballPos.z + 0.5, false)

    local isInMarker = RenderBallPickupMarker(hoopData, groundPedCoords, vector3(ballPos.x, ballPos.y, gf and gz or ballPos.z), 150, 1)

    if hoopData.State.DisplayBallResetAt then
        if (hoopData.State.DisplayBallResetAt - GetNetworkTime()) <= 0 and #(ballPos - hoopData.groundPos) > 3.0 then
            local isInMarker2 = RenderBallPickupMarker(hoopData, groundPedCoords, hoopData.groundPos, 75, 2)

            if isInMarker2 then
                isInMarker = true
            end
        end
    end

    if not isInMarker then
        SubtitleText(Config.Text.GO_TO_BALL_PICKUP)
    else
        DisplayHelpTextThisFrame('RC_BASK_PIK')
    end
end

function RenderBallPickupMarker(hoopData, groundPedCoords, pickupPos, opacity, idx)
    if not opacity then 
        opacity = 150
    end

    if Config.TargetResourceName then
        SetTargetingPickupBall(hoopData, pickupPos, idx)
    else
        if #(groundPedCoords - pickupPos) <= Config.Marker.Scale/2 then
            if not Config.HideMarkers then
                DrawSimpleMarker(pickupPos, Config.Marker.Scale, 255, 206, 57, opacity)
            end

            if IsControlJustPressed(0, Config.Controls.AIM_THROW.key) or IsDisabledControlJustPressed(0, Config.Controls.AIM_THROW.key) then
                SetPedLookAtBall(PlayerPedId(), hoopData.ballEntity)
                PlayPickupAnim(PlayerPedId())
                TriggerServerEvent('rcore_basketball:pickupBall')
            end

            return true
        elseif not Config.HideMarkers then
            DrawSimpleMarker(pickupPos, Config.Marker.Scale, 255, 191, 0, opacity)
        end
    end
end

function GetCurrentThrowNumber(throws)
    local total = 0

    for _, vals in pairs(throws) do
        for _, val in pairs(vals) do
            if val > 0 then
                total = total + 1
            end
        end
    end

    return total
end

RegisterNetEvent('rcore_basketball:simulateThrow', function(hoopId, pathPoints, scoredTime)
    AnimState[hoopId].pathPoints = pathPoints
    AnimState[hoopId].scoredTime = scoredTime

end)