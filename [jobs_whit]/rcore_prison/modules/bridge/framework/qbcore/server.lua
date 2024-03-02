CreateThread(function()
    if Prison.Framework == nil or Prison.Framework == 0 then
        if GetResourceState('qb-core') == 'starting' or GetResourceState('qb-core') == 'started' then
            Prison.Framework = 2
        end
    end
    

    if Prison.Framework == 2 then
        if Prison.FrameworkTriggers['notify'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['notify'])) == 'qbcore' then
            Prison.FrameworkTriggers['notify'] = 'QBCore:Notify'
        end
    
        if Prison.FrameworkTriggers['object'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['object'])) == 'qbcore' then
            Prison.FrameworkTriggers['object'] = 'QBCore:GetObject'
        end
    
        if Prison.FrameworkTriggers['resourceName'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['resourceName'])) == 'qbcore' then
            Prison.FrameworkTriggers['resourceName'] = 'qb-core'
        end
    
        if Prison.FrameworkTriggers['playerUnloadedServer'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['playerUnloadedServer'])) == 'qbcore' then
            Prison.FrameworkTriggers['playerUnloadedServer'] = 'QBCore:Server:OnPlayerUnload'
        end
    
        IsResourceLoaded(Prison.FrameworkTriggers.resourceName, function(state, func)
            if state then
                QBCore = GetSharedObjectSafe()
    
                if IsScriptLoaded('qb-prison') then
                    StopResource('qb-prison')
                end
    
                CreateThread(function()
                    local skin_table, identifier
    
                    skin_table = 'playerskins'
                    identifier = 'citizenid'

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
    
                AddEventHandler(Prison.FrameworkTriggers.playerUnloadedServer, function(serverId)
                    local player = Bridge.GetPlayer(serverId)
    
                    -- Set serverId to nil, to remove user from being checked by script (handleDistCheck)
    
                    if Prisoners[player.charid] then
                        Prisoners[player.charid].serverId = nil
                    end
    
                    if CWUsers[serverId] then
                        if CWUsers[serverId].currentDone > 0 then
                            CWUsers[serverId].currentDone = 0
                        end
                    end
    
                    HandleOnlineSentence('logout', serverId, nil)
    
                    Wait(1000)
    
                    TriggerClientEvent('rcore_prison:resetPrisoner', serverId, nil)
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
                    local Player = QBCore.Functions.GetPlayer(serverId)
                    if not Player then return end
    
                    if Player.PlayerData.metadata["ishandcuffed"] then
                        dbg.debug('Citizen [%s] was handcuffed, uncuffing him.', GetPlayerName(serverId))
    
                        if IsResourceOnServer('wasabi_police') then
                            TriggerClientEvent('wasabi_police:uncuff', serverId)
                        elseif IsResourceOnServer('qb-policejob') then
                            SetTimeout(500, function()
                                TriggerClientEvent("police:client:GetCuffed", serverId, serverId, false)
                            end)
                        end
                    else
                        dbg.debug('Citizen [%s] wasnt handcuffed, skipping.', GetPlayerName(serverId))
                    end
                end
    
                AddEventHandler('rcore_prison:prisonerState', function(data)
                    local data = data
                    local state = data and data.state or nil
                    local serverId = data.serverId
                    local jailTime = data.prisoner and data.prisoner.jailTime or 0

                    if state == 'jailed' then
                        local player = getPlayer(serverId)
                        if not player then return end
                        player.Functions.SetMetaData("injail", jailTime)
                    elseif state == 'released' then
                        local player = getPlayer(serverId)
                        if not player then return end
                        player.Functions.SetMetaData("injail", nil)
                    end
                end)
    
                -- Note: Wrapped load logic, when player is fullly loaded, on ground instead of QBCore server-side event.
    
                RegisterNetEvent('rcore_prison:requestInternalLoad', function()
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
    
                Bridge.GetPlayer = function(source)
                    local charData = QBCore.Functions.GetPlayer(source)
    
                    if not charData then
                        return
                    end
    
                    local data = charData.PlayerData
                    local job = data and data.job or nil
                    local variables = data and data.charinfo or nil
                    local charId = data.citizenid
    
                    if variables and charId then
                        return {
                            name = ('%s %s'):format(variables.firstname, variables.lastname),
                            firstname = variables.firstname,
                            lastname = variables.lastname,
                            charid = tostring(charId),
                            job = {
                                name = job.name,
                                grade = job.grade.level,
                                gradeLabel = job.grade.name,
                                gradeName = job.label
                            },
                        }
                    end
                end
    
                shared.framework = 'QBCORE'
            end
        end)
    end
end)