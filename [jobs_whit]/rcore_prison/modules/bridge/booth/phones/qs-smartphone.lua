RegisterNetEvent('qs-smartphone:server:CancelCall', function(callData)
    local Source = source
    local callData = callData

    if not callData then
        return
    end

    local targetNumber = tonumber(callData.TargetData.number)

    if not BoothStates[targetNumber] then
        return
    end

    if BoothStates[targetNumber] and BoothStates[targetNumber].state == CALL_ENUMS.BOOTH_ACTIVE_CALL then
        BoothStates[targetNumber].state = CALL_ENUMS.BOOTH_WAITING_CALL

        local src = BoothStates[targetNumber].serverId

        if src then
            TriggerClientEvent('qs-smartphone:client:CancelCall', src)
        end
    end
end)

RegisterNetEvent('qs-smartphone:server:CallContact', function(callData, callId, anonymousCall)
    local Source = source
    local callData = callData

    if not callData then
        return
    end

    local targetNumber = tonumber(callData.number)

    if not BoothStates[targetNumber] then
        return
    end

    if BoothStates[targetNumber] and BoothStates[targetNumber].state == CALL_ENUMS.BOOTH_ACTIVE_CALL or CALL_ENUMS.BOOTH_WAITING_ACCEPT then

        local size = BoothStates[targetNumber].callData and Utils.tablesize(BoothStates[targetNumber].callData) or 0

        if BoothStates and BoothStates[targetNumber] and BoothStates[targetNumber].callData and size <= 0 then
            if not BoothStates[targetNumber].targetSource then
                BoothStates[targetNumber].targetSource = Source
            end
 
            BoothStates[targetNumber].callData = {
                InCall = true,
                CallType = 'incoming',
                TargetData = {
                    anonymous = false,
                    number = callData.number,
                    name = callData.name
                },
                CallTime = 0,
                CallId = tonumber(callId),
                AnsweredCall = false
            }

            AcceptCall(Source, targetNumber, 'callPhone')
        end
    end
end)

RegisterNetEvent('qs-smartphone:server:AnswerCall', function(CallData)
    local Source = source
    local data = CallData

    if shared.phone == 'qs-smartphone' then
        local boothNumber = tonumber(data.TargetData.number)

        if BoothStates[boothNumber] then
            if BoothStates[boothNumber].state == CALL_ENUMS.BOOTH_ACTIVE_CALL or CALL_ENUMS.BOOTH_WAITING_ACCEPT then
                local boothUser = BoothStates[boothNumber].serverId
                local size = BoothStates[boothNumber].callData and Utils.tablesize(BoothStates[boothNumber].callData) or 0

                if BoothStates[boothNumber] and BoothStates[boothNumber].callData and size <= 0 then
                    if not CallData.targetSource then
                        CallData.targetSource = Source
                    end
                    
                    BoothStates[boothNumber].callData = CallData

                    if boothUser and GetPlayerPing(boothUser) > 0 then
                        AcceptCall(boothUser, boothNumber, 'callBooth')
                    end 
                end
            end
        end
    end
end)