RegisterNetEvent('rcore_prison:client:JailPlayer', function(target, jailTime)
    JailPlayer(target, jailTime)
end)

function JailPlayer(target, jailTime)
    dbg.debugAPI('Getting request from resource: %s for prison event: %s\n Logic path: rcore_prison/modules/api/client/cl-jailPlayer.lua', GetInvokingResource(), 'rcore_prison:client:JailPlayer')

    if target and jailTime then
        JailPlayerCustom(target, jailTime)
    elseif not target or not jailTime then
        if not target then
            dbg.debugAPI('[JAIL PLAYER] - Enforce load JailClosestPlayer since not received: %s', 'TARGET_PLAYER_ID')
        elseif not jailTime then
            dbg.debugAPI('[JAIL PLAYER] - Enforce load JailClosestPlayer since not received: %s', 'JAIL_TIME')
        end

        JailClosestPlayer()
    else
        JailClosestPlayer()
    end
end

function isNumber(inputString)
    return inputString and inputString:match("^%d+$") ~= nil
end

--- @return any jailTime, any receivedTime, string stateCode
function isJailTimeValid(jailTime)
    if not jailTime then return end

    local retval = nil
    local stateCode = JAIL_TIME_VALIDATION_STATES.IS_INVALID

    if type(jailTime) == 'string' then
        if isNumber(jailTime) then
           retval = tonumber(jailTime)
           stateCode = JAIL_TIME_VALIDATION_STATES.IS_VALID
        end
    elseif type(jailTime) == 'number' then
        retval = jailTime
        stateCode = JAIL_TIME_VALIDATION_STATES.IS_VALID
    end

    return retval, jailTime, stateCode
end

--- @param target number playerId
--- @param time any jailTime: accept string/number
function JailPlayerCustom(target, time)
    assert(type(target) == "number" and GetPlayerFromServerId(target) > 0, ('Target needs to a number & online user!'):format(target))
    if not time then return dbg.critical('JAIL PLAYER - received empty time, failure.') end

    dbg.debugAPI('[JAIL PLAYER] - Loading custom hook, since found data from resource: %s', GetInvokingResource())

    local jailTime, receivedTime, stateCode = isJailTimeValid(time)

    if jailTime then
        Bridge.Notify({
            description = l('JAIL_PLAYER_CLOSEST_PLAYER_JAIL_SUCC'),
            type = 'succ',
        })
        dbg.debugAPI('[JAIL PLAYER] - Jailed target user: %s | received time: %s', target, receivedTime)
        TriggerServerEvent('rcore_prison:server:JailPlayer', target, jailTime)
    else
        Bridge.Notify({
            description = l('JAIL_PLAYER_CLOSEST_PLAYER_JAIL_FAIL'),
            type = 'error',
        })
        dbg.debugAPI('[JAIL PLAYER] - Failed to jailed target user since: %s | received time: %s', stateCode, receivedTime)
    end
end

-- Jail closest player
function JailClosestPlayer()
    dbg.debugAPI('[JAIL PLAYER] - Loading closest player jail type, since data not found from resource: %s', GetInvokingResource())

    local closestPlayer, distance = Bridge.getClosestPlayer(Prison.ClientJail.ClosestPlayerCheckDist, false)

    if closestPlayer and distance <= Prison.ClientJail.ClosestPlayerDist then
        local jailTime = KeyboardInput(l('JAIL_PLAYER_INPUT_LABEL') .. ' - [' .. closestPlayer .. ']', l('JAIL_PLAYER_INPUT_DESC'), 32)

        if jailTime and #jailTime > 0 then
            if isNumber(jailTime) then
                Bridge.Notify({
                    description = l('JAIL_PLAYER_CLOSEST_PLAYER_JAIL_SUCC'),
                    type = 'succ',
                })
                TriggerServerEvent('rcore_prison:server:JailPlayer', closestPlayer, tonumber(jailTime))
            else
                Bridge.Notify({
                    description = l('JAIL_PLAYER_JAIL_TIME_NOT_NUMBER'),
                    type = 'error',
                })
                dbg.debugAPI('[JAIL PLAYER] - Jail time is not a number.')
            end
        else
            Bridge.Notify({
                description = l('JAIL_PLAYER_JAIL_TIME_REQUIRED'),
                type = 'error',
            })
            dbg.debugAPI('[JAIL PLAYER] - Jail time is required.')
        end
    else
        Bridge.Notify({
            description = l('JAIL_PLAYER_CLOSEST_PLAYER_NOT_FOUND'),
            type = 'error',
        })
        dbg.debugAPI('[JAIL PLAYER] - No closest player found.')
    end
end

provideExport('jail', 'esx_tk_jail', JailPlayer)
provideExport('Jail', 'rcore_prison', JailPlayer)