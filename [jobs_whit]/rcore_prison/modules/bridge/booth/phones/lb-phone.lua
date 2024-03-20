RegisterNetEvent('phone:phone:call', function(data)
    if not data then
        return
    end

    local initiatiorSrc = source
    local targetNumber = tonumber(data.number)

    if BoothStates[targetNumber] then
        if BoothStates[targetNumber].state == CALL_ENUMS.BOOTH_WAITING_CALL then
            local size = BoothStates[targetNumber].callData and Utils.tablesize(BoothStates[targetNumber].callData) or 0

            if BoothStates[targetNumber] and BoothStates[targetNumber].callData and size <= 0 then
                local boothUserSrc = BoothStates[targetNumber].serverId

                if boothUserSrc then
                    local number = exports["lb-phone"]:GetEquippedPhoneNumber(initiatiorSrc)
                    local callId = exports["lb-phone"]:CreateCall({
                        phoneNumber = tostring(targetNumber),
                        source = boothUserSrc
                    }, number, {
                        requirePhone = false,
                        hideNumber = true
                    })

                    dbg.debug('Creating call for %s to target booth [%s] | %s | CALL-ID : %s', initiatiorSrc, targetNumber, number, callId) 
                end
            end
        end
    end
end)
