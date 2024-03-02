RegisterNetEvent('rcore_prison:server:JailPlayer', function(target, jailTime)
    JailPlayer(source, target, jailTime)
end)

RegisterNetEvent('police:server:JailPlayer', function(target, jailTime)
    JailPlayer(source, target, jailTime, 'qbcore')
end)

RegisterNetEvent('esx-qalle-jail:jailPlayer', function(target, jailTime, jailReason)
    JailPlayer(source, target, jailTime, 'qalle')
end)

RegisterNetEvent('qb-communityservice:server:StartCommunityService', function(target, jailTime)
    JailPlayer(source, target, jailTime, 'qbcore', 'coms')
end)

RegisterNetEvent('qs-dispatch:server:addPenalListToPlayer', function(array)
    if IsResourceOnServer('qs-dispatch') then
        local data = array
        local player = data.player
        
        if not player then return end
        
        local targetPlayerId = player and player.info and player.info.source
        local jailData = data[1] and data[1]
        local jailTime = jailData and jailData.jailTime or 0
            
        JailPlayer(source, targetPlayerId, jailTime, 'quasar')
    end
end)

function JailPlayer(source, target, jailTime, resourceName, jailType)
    local playerId = source
    local emulatorName = 'JAIL PLAYER'

    if not Bridge.IsUserAllowedToPerform(playerId, Prison.Commands.Jail) then
        return Bridge.Notify(playerId, {
            title = '/jail',
            subtitle = l('PRISON_TITLE'),
            description = l('JOB_CHECK_REQUIREMENT'),
            position = 'top',
            lenght = 4000,
            type = 'error',
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })
    end

    if not jailType then
        jailType = 'jail'
    else
        jailType = 'coms'
        emulatorName = 'COMMUNITY SERVICE'
    end

    if target and GetPlayerPed(target) then
        if jailTime and jailTime > 0 then
            if isPrisonerAtGuard(source, target) then
                if resourceName then
                    provideDebugEmulator(emulatorName, resourceName, source, jailType)
                end

                if jailType == 'jail' then
                    exports['rcore_prison']:Jail(target, jailTime)
                elseif jailType == 'coms' then
                    TriggerEvent('rcore_prison:startSentence', {
                        issuedBy = {
                            serverId = source
                        },
                        target = {
                            serverId = target,
                            time = jailTime,
                            state = 'cw',
                        }
                    })
                end
            else
                Bridge.Notify(source, {
                    title = '/jail',
                    subtitle = l('PRISON_TITLE'),
                    description = l('PRISONER_FAR_AWAY'),
                    position = 'top',
                    lenght = 4000,
                    style = {
                        backgroundColor = '#141517',
                        color = '#909296'
                    },
                })
            end
        else
            Bridge.Notify(playerId, {
                title = '/jail',
                subtitle = l('PRISON_TITLE'),
                description = l('JAIL_PLAYER_JAIL_TIME_REQUIRED'),
                position = 'top',
                lenght = 4000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })
        end
    else
        Bridge.Notify(playerId, {
            title = '/jail',
            subtitle = l('PRISON_TITLE'),
            description = l('JAIL_PLAYER_CLOSEST_PLAYER_NOT_FOUND'),
            position = 'top',
            lenght = 4000,
            type = 'error',
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })
    end
end