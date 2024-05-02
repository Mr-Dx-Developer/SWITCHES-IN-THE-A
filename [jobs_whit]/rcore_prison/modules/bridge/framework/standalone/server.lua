AddEventHandler('playerDropped', function()
    local Source = source
    local player = Bridge.GetPlayer(Source)
    local idx = getUserCW(Source)

    if player and Prisoners[player.charid] then
        Prisoners[player.charid].serverId = nil
    end

    if CWUsers[idx] then
        if CWUsers[idx].currentDone > 0 then
            CWUsers[idx].currentDone = 0
        end
    end

    if Source then
        HandleOnlineSentence('exit', Source, nil)

        Wait(1000)

        TriggerClientEvent('rcore_prison:resetPrisoner', Source, nil)
    end
end)

RegisterNetEvent('rcore_prison:requestInternalLoad', function()
    if shared.framework == 'unk' then
        local Source = source
        local player = Bridge.GetPlayer(Source)
        local loadTimeout = 2000
    
        if not player then return end
    
        local data = GetPrisonerData(player.charid)
    
        if data and data.state == 'jailed' then
            local state = IsUserInPrison(Source)
    
            if not state then
                dbg.debug('Player was teleported back to prison. [%s]', player.name)
            end
        end
    
        SetTimeout(loadTimeout, function()
            InternalCharacterLoaded(Source)
        end)
    end
end)

IsUserInPrison = function(Source)
    local retval = false
    local place = shared.data.prisonYard

    local plyPed = GetPlayerPed(Source)
    local plyCoords = GetEntityCoords(plyPed)

    local dist = #(vec3(place.x, place.y, place.z) - plyCoords)

    if dist <= Prison.CheckEscapeDist then
        retval = true
    else
        SetEntityCoords(plyPed, place.x, place.y, place.z)
    end

    return retval
end


Bridge.HandleCuffs = function(serverId)
    dbg.debug('HandleCuffs - is not defined, standalone')
end

Bridge.isAdmin = function(serverId, commandName)
    local isAllowedPerformCommand = false

    if Ace.Can(serverId, commandName) then
        isAllowedPerformCommand = true
    end

    return isAllowedPerformCommand
end

Bridge.IsUserAllowedToPerform = function(source, commandName)
    local player = Bridge.GetPlayer(source)
    local job = player and player.job or nil
    local retval = false

    if job and Prison.Jobs[job.name:lower()] or Bridge.isAdmin(source, commandName) then
        retval = true
    end

    dbg.debug('IsUserAllowedToPerform: User: %s (%s) tried access command: %s with state result: %s', GetPlayerName(source), source, commandName, retval)

    return retval
end

function GetIdentifiers(playerId, identifierName)
    local identifiers = {}
    local numIdentifiers = GetNumPlayerIdentifiers(playerId)
   
    for i = 0, numIdentifiers - 1 do
        local identifier = GetPlayerIdentifier(playerId, i)

        if string.find(identifier, "license:") then
            identifiers['license'] = identifier
        elseif string.find(identifier, "discord:") then
            identifiers['discord'] = identifier
        end
    end

    return identifiers and identifiers[identifierName]
end

CreateThread(function()
    Wait(2000)

    if shared.framework == 'unk' then
        dbg.debug('Bridge: Standalone mode is active, no framework detected.')
        Prison.Notify.DefaultNotify = true
    end
end)

Bridge.GetPlayer = function(source)
    return {
        name = GetPlayerName(source),
        firstname = '',
        lastname = '',
        charid = GetPlayerIdentifierByType and GetPlayerIdentifierByType(source, 'license') or GetIdentifiers(source, 'license'), -- Fetch the license via native or custom func as fallback.
        job = {
            name = '',
            grade = '',
            gradeLabel = '',
            gradeName = '',
        },
    }
end