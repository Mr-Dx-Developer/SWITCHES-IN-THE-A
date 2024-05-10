RegisterNetEvent('rcore_prison:server:UnjailPlayer', function(target)
    UnjailPlayer(source, target)
end)

RegisterNetEvent('esx-qalle-jail:unJailPlayer', function(targetIdentifier)
    if Framework == FRAMEWORK_MAP_NAMES_STRING.ESX then
        local frameworkObject = GetSharedObjectSafe()

        if not frameworkObject then
            return
        end

        local target = frameworkObject.GetPlayerFromIdentifier(targetIdentifier)

        if target and GetPlayerPed(target) > 0 then
            UnjailPlayer(source, target, 'qalle')
        end
    end
end)

function UnjailPlayer(source, target, resourceName)
    local playerId = source

    if not Bridge.IsUserAllowedToPerform(playerId, Prison.Commands.Unjail) then
        return Bridge.Notify(playerId, {
            title = '/unjail',
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

    if target and GetPlayerPed(target) then
        local player = Bridge.GetPlayer(target)

        if player then
            local isPrisoner = GetPrisonerData(player.charid)

            if isPrisoner then
                if isPrisonerAtGuard(source, target) then
                    if resourceName then
                        provideDebugEmulator('UNJAIL PLAYER', resourceName, source, 'unjail')
                    end

                    exports['rcore_prison']:Unjail(target)
                else
                    Bridge.Notify(playerId, {
                        title = '/unjail',
                        subtitle = l('PRISON_TITLE'),
                        description = l('UNJAIL_PLAYER_NOT_PRISONER'),
                        position = 'top',
                        lenght = 4000,
                        type = 'error',
                        style = {
                            backgroundColor = '#141517',
                            color = '#909296'
                        },
                    })
                end
            else
                Bridge.Notify(playerId, {
                    title = '/unjail',
                    subtitle = l('PRISON_TITLE'),
                    description = l('UNJAIL_PLAYER_NOT_PRISONER'),
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
    else
        Bridge.Notify(playerId, {
            title = '/unjail',
            subtitle = l('PRISON_TITLE'),
            description = l('UNJAIL_PLAYER_NOT_FOUND'),
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