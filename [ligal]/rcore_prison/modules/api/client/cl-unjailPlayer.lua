RegisterNetEvent('rcore_prison:client:UnjailPlayer', function(target)
    UnjailPlayer(target)
end)

function UnjailPlayer(target)
    dbg.debugAPI('Getting request from resource: %s for prison event: %s\n Logic path: rcore_prison/modules/api/client/cl-unjailPlayer.lua', GetInvokingResource(), 'rcore_prison:client:UnjailPlayer')

    if target and type(target) == 'number' then
        UnjailPlayerCustom(target)
    elseif not target then
        dbg.debugAPI('[UNJAIL PLAYER] - Enforce load UnjailClosestPlayer since not received: %s', target and 'TARGET_PLAYER_ID')
        UnjailClosestPlayer()
    else
        UnjailClosestPlayer()
    end
end

--- @param target number playerId
function UnjailPlayerCustom(target)
    assert(type(target) == "number" and GetPlayerFromServerId(target) > 0, ('Target needs to a number & online user!'):format(target))

    dbg.debugAPI('[UNJAIL PLAYER] - Loading custom hook, since found data from resource: %s', GetInvokingResource())

    if target then
        Bridge.Notify({
            description = l('UNJAIL_PLAYER_CLOSEST_PLAYER_JAIL_SUCC'),
            type = 'succ',
        })

        dbg.debugAPI('[UNJAIL PLAYER CUSTOM] - Unjailed target user: %s', target)

        TriggerServerEvent('rcore_prison:server:UnjailPlayer', target)
    else
        Bridge.Notify({
            description = l('UNJAIL_PLAYER_CLOSEST_PLAYER_JAIL_FAIL'),
            type = 'error',
        })

        dbg.debugAPI('[UNJAIL PLAYER CUSTOM] - Failed to unjail target user since: %s')
    end
end

-- Jail closest player
function UnjailClosestPlayer()
    dbg.debugAPI('[UNJAIL PLAYER] - Loading closest player unjail type, since data not found from resource: %s', GetInvokingResource())

    local closestPlayer, distance = Bridge.getClosestPlayer(Prison.ClientJail.ClosestPlayerCheckDist, false)

    if closestPlayer and distance <= Prison.ClientJail.ClosestPlayerDist then
        local confirmState = KeyboardInput(l('UNJAIL_PLAYER_INPUT_LABEL') .. ' - [' .. closestPlayer .. ']', l('UNJAIL_PLAYER_INPUT_DESC'), 32)

        if confirmState and #confirmState > 0 then
            if type(confirmState) == 'string' then
                Bridge.Notify({
                    description = l('UNJAIL_PLAYER_CLOSEST_PLAYER_JAIL_SUCC'),
                    type = 'succ',
                })

                TriggerServerEvent('rcore_prison:server:UnjailPlayer', closestPlayer)
            else
                Bridge.Notify({
                    description = l('UNJAIL_PLAYER_NOT_CONFIRM'),
                    type = 'error',
                })
                dbg.debugAPI('[UNJAIL PLAYER] - You dont confirm the unjail of closest player.')
            end
        else
            Bridge.Notify({
                description = l('UNJAIL_PLAYER_NOT_CONFIRM_EMPTY'),
                type = 'error',
            })
            dbg.debugAPI('[UNJAIL PLAYER] - Confirm state was empty - you need to press enter in cofirmation form.')
        end
    else
        Bridge.Notify({
            description = l('UNJAIL_PLAYER_CLOSEST_PLAYER_NOT_FOUND'),
            type = 'error',
        })
        dbg.debugAPI('[UNJAIL PLAYER] - No closest player found.')
    end
end

provideExport('unjail', 'esx_tk_jail', UnjailPlayer)
provideExport('Unjail', 'rcore_prison', UnjailPlayer)
