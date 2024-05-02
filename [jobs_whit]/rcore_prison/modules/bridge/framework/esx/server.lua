CreateThread(function()
    if Prison.Framework == nil or Prison.Framework == 0 then
        if GetResourceState('es_extended') == 'starting' or GetResourceState('es_extended') == 'started' then
            Prison.Framework = 1
        end
    end
    
    if Prison.Framework == 1 then
        if Prison.FrameworkTriggers['notify'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['notify'])) == 'esx' then
            Prison.FrameworkTriggers['notify'] = 'esx:showNotification'
        end
    
        if Prison.FrameworkTriggers['object'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['object'])) == 'esx' then
            Prison.FrameworkTriggers['object'] = 'esx:getSharedObject'
        end
    
        if Prison.FrameworkTriggers['resourceName'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['resourceName'])) == 'esx' then
            Prison.FrameworkTriggers['resourceName'] = 'es_extended'
        end
    
        if Prison.FrameworkTriggers['playerUnloadedServer'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['playerUnloadedServer'])) == 'esx' then
            Prison.FrameworkTriggers['playerUnloadedServer'] = 'esx:playerLogout'
        end
    
        if Prison.FrameworkTriggers['playerLoadedServer'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['playerLoadedServer'])) == 'esx' then
            Prison.FrameworkTriggers['playerLoadedServer'] = 'esx:playerLoaded'
        end
    
        IsResourceLoaded(Prison.FrameworkTriggers['resourceName'], function(state, func)
            if state then
                local ESX = func:getSharedObject()
    
                CreateThread(function()
                    local skin_table, identifier
        
                    skin_table = 'users'
                    identifier = 'identifier'
        
                    for k, v in pairs(db.Queries.FRAMEWORK) do
                        db.Queries.FRAMEWORK[k] = v:gsub('{skin_table}', skin_table):gsub('{identifier}', identifier)
                    end
                end)
                
                AddEventHandler('playerDropped', function()
                    local Source = source
                    local idx = getUserCW(Source)


                    if CWUsers[idx] then
                        if CWUsers[idx].currentDone > 0 then
                            CWUsers[idx].currentDone = 0
                        end
                    end
    
                    if Source then
                        HandleOnlineSentence('exit', Source, nil)
                    end

                    local player = Bridge.GetPlayer(Source)
                
                    if not player then
                        return
                    end

                    local charId = player and player.charid
                
                    if charId and Prisoners[charId] then
                        Prisoners[charId].serverId = nil
                        dbg.debug('Clearing serverId since user exit the game.')
                    end
                end)
    
                if not IsScriptLoaded('cd_spawnselect') then
                    AddEventHandler(Prison.FrameworkTriggers.playerLoadedServer, function(serverId, xPlayer)
                        SetTimeout(3000, function()
                            SyncZones(serverId)
                            InternalCharacterLoaded(serverId)
                        end)
                    end)
                else
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
    
                    -- Note: Wrapped load logic, when player is fullly loaded, on ground instead of QBCore server-side event.
    
                    RegisterNetEvent('rcore_prison:requestInternalLoad', function()
                        local Source = source
                        local player = Bridge.GetPlayer(Source)
                        local loadTimeout = 3000
    
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
                    end)
                end
        
                AddEventHandler(Prison.FrameworkTriggers.playerUnloadedServer, function(serverId)
                    local player = Bridge.GetPlayer(serverId)
                    -- Set serverId to nil, to remove user from being checked by script (handleDistCheck)
    
                    if player and player.charid and Prisoners[player.charid] then
                        Prisoners[player.charid].serverId = nil
                    end
    
                    if CWUsers[serverId] then
                        if CWUsers[serverId].currentDone > 0 then
                            CWUsers[serverId].currentDone = 0
                        end
                    end
    
                    HandleOnlineSentence('logout', serverId, nil)
    
                    TriggerClientEvent('rcore_prison:resetPrisoner', serverId, nil)
                end)
    
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
    
                    return retval
                end
    
                Bridge.HandleCuffs = function(serverId)
                    local Player = ESX.GetPlayerFromId(serverId)
    
                    if not Player then return end
    
                    dbg.debug('Citizen [%s] was handcuffed, uncuffing him.', GetPlayerName(serverId))

                    SetTimeout(1000, function()
                        if IsResourceOnServer('wasabi_police') then
                            TriggerClientEvent('wasabi_police:uncuff', serverId)
                        elseif IsResourceOnServer('esx_policejob') then
                            TriggerClientEvent("esx_policejob:unrestrain", serverId)
                        end
                    end)
                end

                Bridge.GetPlayer = function(source)
                    local charData = ESX.GetPlayerFromId(source)
        
                    if not charData then
                        return
                    end
        
                    local job = charData and charData.job or nil
                    local variables = charData and charData.variables or nil
                    local charId = charData.getIdentifier()
        
                    if charId then
                        return {
                            name = ('%s %s'):format(variables and variables.firstName or GetPlayerName(source), variables and variables.lastName or ''),
                            firstname = variables and variables.firstName or GetPlayerName(source),
                            lastname = variables and variables.lastName or '',
                            charid = charId,
                            job = {
                                name = job.name,
                                grade = job.grade,
                                gradeLabel = job.grade_label,
                                gradeName = job.grade_name
                            },
                        }
                    end
                end
        
                shared.framework = 'ESX'
            end
        end)
    end
end)
