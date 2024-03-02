local IMPORT = {
    ['qs-smartphone'] = {
        targetFile = 'config/config_calls_server.lua',
    },
    ['qb-phone'] = {
        targetFile = 'server/main.lua',
    },
}

local IMPORT_STATE = false

GetImportDataByPhone = function(resourceName)
    local retval = nil
    
    if IMPORT[resourceName] then
        retval = IMPORT[resourceName]
    end

    return retval
end

GetImportData = function(resourceName)
    local retval = nil
    
    if resourceName == 'qs-smartphone' then
        retval = QSPHONE_IMPORT
    elseif resourceName == 'qb-phone' then
        retval = QBPHONE_IMPORT
    end

    return retval
end

SetTimeout(1000, function()
    local boothStrings = {
        "GlobalState.Booths"
    }

    if not IMPORT_STATE then
        IMPORT_STATE = true
    end

    local phone = shared.phone and shared.phone:lower() or nil

    if phone then
        if Prison.ImportAPI then
            local data = GetImportDataByPhone(phone)

            if data then
                local targetResource = phone
                local import = GetImportData(phone)
                local targetFile = data.targetFile

                if targetResource then
                    if targetFile then
                        if import then
                            HandleImport(boothStrings, targetFile, targetResource, import)
                        end
                    else
                        dbg.debug('Failed to import because unk targetFile')
                    end
                else
                    dbg.debug('Failed to import because unk targetResource')
                end
            end
        end
    end
end)

GetFrameworkUser = function(serverId)
    if not serverId then return end

    local Framework = GetSharedObjectSafe()
    local retval = {}

    if shared.framework == 'ESX' then
        local data = Framework.GetPlayerFromId(serverId)

        if data then
            local charId = data.getIdentifier()
            local fetchPhone = db.FetchPhoneNumberByCharId(charId)

            if fetchPhone then
                retval = {
                    phone = fetchPhone
                }
            end
        end
    elseif shared.framework == 'QBCORE' then
        local data = Framework.Functions.GetPlayer(serverId)

        if data then
            retval = {
                phone = data.PlayerData.charinfo.phone
            }
        end
    end

    return retval
end


GetSourceByPhone = function(targetNumber)
    local targetData = GetDataByPhoneNumber(targetNumber) or {}
    local playerId = nil
    local players = GetPlayers()

    for k, serverId in pairs(players) do
        local serverId = tonumber(serverId)
        local player = Bridge.GetPlayer(serverId)

        if player then
            if targetData.identifier == player.charid then
                playerId = serverId
                break
            end
        end
    end

    if playerId and playerId > 0 then
        targetData.serverId = playerId
    end

    return playerId
end

GetDataByPhoneNumber = function(number)
    local retval = nil
    local query = db.GetPhoneForGKSPhone(number)

    if query and query[1] then
        retval = query[1]
    end

    return retval
end

GetPlayerByPhone = function(number)
    local p = promise.new()
    local targetNumber = tostring(number)
    local players = GetPlayers()
    local retval = 0

    for i = 1, #players do
        local serverId = tonumber(players[i])
        local user = GetFrameworkUser(serverId)

        if user and (user.phone == targetNumber) then
            retval = serverId
            p:resolve(true)
            break
        end

        if i == #players then
            p:resolve(true)
        end
    end

    return retval
end

function cleanPhoneNumber(phoneNumber)
    local cleanedNumber = string.gsub(phoneNumber, "%D", "")
    return cleanedNumber
end

ExecuteLBPhone = function(serverId, targetNumber, idx)
    local boothNumber = tonumber(GetBoothNumberBySource(serverId))
    local retval = 'Inactive'

    if not boothNumber then
        return
    end

    targetNumber = cleanPhoneNumber(targetNumber)

    if BoothStates[boothNumber] then
        local targetSource = nil

        if shared.phone == 'lb-phone' then
            targetSource = exports["lb-phone"]:GetSourceFromNumber(tostring(targetNumber))
        else
            if shared.framework == 'QBCORE' then
                targetSource = GetPlayerByPhone(targetNumber)
            elseif shared.framework == 'ESX' then
                targetSource = GetSourceByPhone(targetNumber)
            end
        end

        if targetSource == nil then
            return dbg.critical('Failed to get targetSource when executing call! [%s] | FRAMEWORK:  [%s] | PHONE: [%s]', targetSource, shared.framework, shared.phone)
        end

        local player = Bridge.GetPlayer(serverId)
        local prisonerAccount = GetPrisonerAccount(player.charid)

        if prisonerAccount then
            if targetSource and GetPlayerPing(targetSource) > 0 then
                retval = 'Ringing'
                HandleCall(serverId, targetNumber, boothNumber, prisonerAccount.balance)
            else
                retval = 'Inactive number'
                HandleOfflineUser(serverId, boothNumber)
            end
        else
            retval = 'Inactive'
            HandleNoPrisonAccount(serverId, boothNumber)
        end
    end

    return retval
end

ExecuteGKS = function(serverId, targetNumber, idx)
    local boothNumber = tonumber(GetBoothNumberBySource(serverId))
    local retval = 'Inactive'

    if not boothNumber then
        return
    end

    if BoothStates[boothNumber] then
        local targetSource = nil

        if shared.framework == 'QBCORE' then
            targetSource = GetPlayerByPhone(targetNumber)
        elseif shared.framework == 'ESX' then
            targetSource = GetSourceByPhone(targetNumber)
        end

        if targetSource == nil then
            return Utils.Debug('error', 'Failed to get targetSource when executing call! [%s] | FRAMEWORK:  [%s] | PHONE: [%s]', targetSource, shared.framework, shared.phone)
        end

        local player = Bridge.GetPlayer(serverId)
        local prisonerAccount = GetPrisonerAccount(player.charid)

        if prisonerAccount then
            if targetSource and GetPlayerPing(targetSource) > 0 then
                retval = 'Ringing'
                HandleCall(serverId, targetNumber, boothNumber, prisonerAccount.balance)
            else
                retval = 'Inactive number'
                HandleOfflineUser(serverId, boothNumber)
            end
        else
            retval = 'Inactive'
            HandleNoPrisonAccount(serverId, boothNumber)
        end
    end

    return retval
end

ExecuteQBPhone = function(serverId, targetNumber, idx)
    local retval = 'Inactive'

    if not idx then
        return
    end

    local data = shared.data.interaction[idx]

    if not data then
        return
    end

    local boothData = data.booth

    if not boothData then
        return
    end

    local boothNumber = tonumber(boothData.number)

    if not boothNumber then
        return
    end

    if BoothStates[boothNumber] then
        local anonymousCall = false

        local player = Bridge.GetPlayer(serverId)
        local prisonerAccount = GetPrisonerAccount(player.charid)

        if prisonerAccount then
            local targetPhoneNumber = (targetNumber):gsub("-", "")
            local target = GetPlayerByPhone(targetPhoneNumber)

            if target and target > 0 then
                local targetSource = target

                if targetSource and GetPlayerPing(targetSource) > 0 then
                    local targetPlayer = Bridge.GetPlayer(targetSource)

                    dbg.debug('Calling from booth to [%s] | Player: [%s] | %s', targetNumber, targetPlayer.name, targetPhoneNumber)
                    retval = 'Ringing'

                    HandleCall(serverId, targetPhoneNumber, boothNumber, prisonerAccount.balance, {
                        anonymousCall = anonymousCall,
                        targetSource = targetSource
                    })
                else
                    retval = 'Inactive number'
                    HandleOfflineUser(serverId, boothNumber)
                end
            else
                retval = 'Inactive number'
                HandleOfflineUser(serverId, boothNumber)
            end
        else
            retval = 'Inactive'
            HandleNoPrisonAccount(serverId, boothNumber)
        end
    end

    return retval
end

ExecuteNPWD = function(serverId, targetNumber, idx)
    local retval = 'Inactive'

    if not idx then
        return
    end

    local data = shared.data.interaction[idx]

    if not data then
        return
    end

    local boothData = data.booth

    if not boothData then
        return
    end

    local boothNumber = tonumber(boothData.number)

    if not boothNumber then
        return
    end

    if BoothStates[boothNumber] then
        local targetSource = nil
        local targetNumber = tostring(targetNumber)

        local player = Bridge.GetPlayer(serverId)
        local prisonerAccount = GetPrisonerAccount(player.charid)

        if prisonerAccount then
            local target = exports.npwd:getPlayerData({ phoneNumber = targetNumber })

            if target and Utils.tablesize(target) > 0 then
                targetSource = target.source or nil

                if targetSource and GetPlayerPing(targetSource) > 0 then
                    dbg.debug('Calling from booth to [%s] | %s', targetNumber, GetPlayerName(serverId))
                    retval = 'Ringing'
                    HandleCall(serverId, targetNumber, boothNumber, prisonerAccount.balance)
                else
                    retval = 'Inactive number'
                    HandleOfflineUser(serverId, boothNumber)
                end
            else
                retval = 'Inactive number'
                HandleOfflineUser(serverId, boothNumber)
            end
        else
            retval = 'Inactive'
            HandleNoPrisonAccount(serverId, boothNumber)
        end
    end

    return retval
end

HandleInitiateCall = function(Source, targetNumber, idx)
    local retval = 'unk'

    if shared.phone == 'gksphone' then
        retval = ExecuteGKS(Source, targetNumber, idx)
    elseif shared.phone == 'qb-phone' or shared.phone == 'qs-smartphone' then
        retval = ExecuteQBPhone(Source, targetNumber, idx)
    elseif shared.phone == 'npwd' then
        retval = ExecuteNPWD(Source, targetNumber, idx)
    elseif shared.phone == 'lb-phone' then
        retval = ExecuteLBPhone(Source, targetNumber, idx)
    end

    return retval
end

AcceptCall = function(Source, boothNumber, internalType)
    if not BoothStates[boothNumber] then
        return
    end

    if BoothStates[boothNumber] and BoothStates[boothNumber].state == CALL_ENUMS.BOOTH_WAITING_ACCEPT or CALL_ENUMS.BOOTH_WAITING_ACCEPT then
        BoothStates[boothNumber].state = CALL_ENUMS.BOOTH_ACTIVE_CALL

        local boothSource = BoothStates[boothNumber].serverId
        local player = Bridge.GetPlayer(boothSource)

        local prisonerAccount = GetPrisonerAccount(player.charid)
        local prisonerCredits = prisonerAccount.balance

        local boothPrice = Prison.BoothPricePerMinute
        local callPeriod = Prison.BoothTakeCreditsPeriod

        local period = GetGameTimer()

        local callData = BoothStates[boothNumber].callData or nil

        dbg.debug('Accepted call from [%s] - [%s]', boothNumber, GetPlayerName(Source))

        if shared.phone == 'qb-phone' then
            if not callData.targetSource then
                callData.targetSource = Source
            end

            if internalType == 'callBooth' then
                TriggerClientEvent('qb-phone:client:GetCalled', Source, boothNumber, callData.CallId, true)

                Wait(1000)

                TriggerClientEvent('qb-phone:client:AnswerCall', boothSource)
            elseif internalType == 'callPhone' then
                TriggerClientEvent('qb-phone:client:GetCalled', boothSource, boothNumber, callData.CallId, true)

                Wait(1000)

                TriggerClientEvent('qb-phone:client:AnswerCall', boothSource)
                TriggerClientEvent('qb-phone:client:AnswerCall', Source)
            end
        elseif shared.phone == 'qs-smartphone' then
            if not callData.targetSource then
                callData.targetSource = Source
            end

            if internalType == 'callBooth' then
                TriggerClientEvent('qs-smartphone:client:GetCalled', Source, boothNumber, tonumber(callData.CallId), true)

                Wait(1000)

                TriggerClientEvent('qs-smartphone:client:AnswerCall', boothSource)
            elseif internalType == 'callPhone' then
                TriggerClientEvent('qs-smartphone:client:GetCalled', boothSource, boothNumber, tonumber(callData.CallId), true)

                Wait(1000)

                TriggerClientEvent('qs-smartphone:client:AnswerCall', boothSource)
                TriggerClientEvent('qs-smartphone:client:AnswerCall', Source)
            end
        end

        TriggerClientEvent('rcore_prison:setBoothState', boothSource, boothSource, 'Call active')

        SetServerInterval(boothNumber, callPeriod, function()
            if BoothStates[boothNumber].state == CALL_ENUMS.BOOTH_ACTIVE_CALL then
                if (GetGameTimer() - period) > Prison.BoothMaxCallLenght then

                    TriggerClientEvent('rcore_prison:stopInternalCall', boothSource, boothSource, 'enforced')

                    ClearServerInterval(boothNumber)

                    Bridge.Notify(boothSource, {
                        title = l('WARDEN_TITLE'),
                        description = l('BOOTH_CALL_DURATION_REACHED_LIMIT'),
                        subtitle = l('PRISON_TITLE'),
                        position = 'top',
                        lenght = 4000,
                        style = {
                            backgroundColor = '#141517',
                            color = '#909296'
                        },
                    })
                end

                if prisonerCredits >= boothPrice then
                    prisonerAccount.balance = prisonerAccount.balance - boothPrice
                    db.UpdatePrisonAccountBalance(prisonerAccount.balance, player.charid)
                else
                    ClearServerInterval(boothNumber)

                    TriggerClientEvent('rcore_prison:stopInternalCall', boothSource, boothSource)

                    Bridge.Notify(boothSource, {
                        title = l('WARDEN_TITLE'),
                        description = l('BOOTH_NOT_ENOUGH_CREDITS'),
                        subtitle = l('PRISON_TITLE'),
                        position = 'top',
                        lenght = 4000,
                        style = {
                            backgroundColor = '#141517',
                            color = '#909296'
                        },
                    })
                end
            else
                ClearServerInterval(boothNumber)
            end
        end)
    end
end


RegisterNetEvent('gksphone:gksc:acceptCall', function(callData)
    if not callData then
        return
    end

    local callData = callData

    local Source = source
    local boothNumber = tonumber(callData.transmitter_num) or nil

    if not boothNumber then
        return
    end

    AcceptCall(Source, boothNumber)
end)

RegisterNetEvent('rcore_prison:registerCallData', function(callData)
    local boothNumber = tonumber(GetBoothNumberBySource(source))

    if not boothNumber then
        return
    end

    local size = BoothStates[boothNumber].callData and Utils.tablesize(BoothStates[boothNumber].callData) or 1

    if BoothStates[boothNumber] and BoothStates[boothNumber].callData and size <= 0 then
        BoothStates[boothNumber].callData = callData

        dbg.debug('Registering call for booth [%s] | [%s]', boothNumber, GetPlayerName(source))
    end
end)

RegisterNetEvent('gksphone:gksc:rejectCall', function(callData)
    local Source = source

    if not callData then
        return
    end

    if callData.transmitter_src or callData.receiver_src == Source then
        local callData = callData
        local boothNumber = tonumber(callData.transmitter_num)

        if BoothStates[boothNumber] then
            if BoothStates[boothNumber].state == CALL_ENUMS.BOOTH_ACTIVE_CALL or CALL_ENUMS.BOOTH_WAITING_ACCEPT then
                BoothStates[boothNumber].state = CALL_ENUMS.BOOTH_WAITING_CALL

                local boothSrc = BoothStates[boothNumber].serverId

                if BoothStates[boothNumber].callData and Utils.tablesize(BoothStates[boothNumber].callData) > 0 then
                    BoothStates[boothNumber].callData = {}
                end

                if boothSrc then
                    TriggerClientEvent('rcore_prison:stopInternalCall', boothSrc, boothSrc)
                    TriggerClientEvent('rcore_prison:setBoothState', boothSrc, boothSrc, 'Inactive')
                end

                dbg.debug('gksRejectCall - End call for | by [%s]', boothNumber, GetPlayerName(Source))
            end
        end
    end
end)


HandleCall = function(Source, targetNumber, boothNumber, balance, extraData)
    local prisonerCredits = balance
    local boothPrice = Prison.BoothPricePerMinute
    
    if prisonerCredits >= boothPrice then
        TriggerClientEvent('rcore_prison:setBoothState', Source, Source, 'Ringing')

        if shared.phone == 'qb-phone' then
            local targetSource = extraData.targetSource
            local anonymousCall = extraData.anonymousCall or false

            TriggerClientEvent('qb-phone:client:GetCalled', targetSource, boothNumber, targetNumber, anonymousCall)
        elseif shared.phone == 'qs-smartphone' then
            local targetSource = extraData.targetSource
            local anonymousCall = extraData.anonymousCall or false
            
            TriggerClientEvent('qs-smartphone:client:GetCalled', targetSource, boothNumber, targetNumber, anonymousCall)
        elseif shared.phone == 'lb-phone' then
            local callId = exports["lb-phone"]:CreateCall({
                phoneNumber = "Prison Booth",
                source = Source
            }, targetNumber, {
                requirePhone = false,
                hideNumber = true
            })

            dbg.debug('LB-PHONE - Call from booth to phoneNumber -> [%s] | %s', callId, targetNumber)
        else
            TriggerClientEvent('rcore_prison:startInternalCall', Source, Source, targetNumber)
        end

        dbg.debug('Invoked call from [%s] - awaiting target to accept call | [%s]', boothNumber, GetPlayerName(Source))

        BoothStates[boothNumber].callState = true
        BoothStates[boothNumber].state = CALL_ENUMS.BOOTH_WAITING_ACCEPT
    else
        Bridge.Notify(Source, {
            title = l('WARDEN_TITLE'),
            description = l('BOOTH_NOT_ENOUGH_CREDITS'),
            subtitle = l('PRISON_TITLE'),
            position = 'top',
            lenght = 4000,
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })
    end
end

HandleNoPrisonAccount = function(Source, boothNumber)
    dbg.debug('Initiate call failed for [%s] | [%s] | [%s]', boothNumber, GetPlayerName(Source), 'missingPrisonerAccount')

    SetTimeout(1500,  function()
        TriggerClientEvent('rcore_prison:resetState', Source, Source, false)
    end)

    Bridge.Notify(Source, {
        title = l('WARDEN_TITLE'),
        description = l('BOOTH_CALL_ACCOUNT_REQUIREMENT'),
        subtitle = l('PRISON_TITLE'),
        position = 'top',
        lenght = 4000,
        style = {
            backgroundColor = '#141517',
            color = '#909296'
        },
    })
end

HandleOfflineUser = function(Source, boothNumber)
    LevelDebug(3,'inform', 'Initiate call failed for [%s] | [%s] | [%s]', boothNumber, GetPlayerName(Source), 'offlineUser')

    SetTimeout(1500,  function()
        TriggerClientEvent('rcore_prison:resetState', Source, Source, false)
    end)

    Bridge.Notify(Source, {
        title = l('WARDEN_TITLE'),
        description = l('BOOTH_CALL_OFFLINE_USER'),
        subtitle = l('PRISON_TITLE'),
        position = 'top',
        lenght = 4000,
        style = {
            backgroundColor = '#141517',
            color = '#909296'
        },
    })
end

RegisterNetEvent('rcore_prison:endCall')
AddEventHandler('rcore_prison:endCall', function()
    local Source = source

    local boothNumber = tonumber(GetBoothNumberBySource(Source))

    if not boothNumber then
        return
    end

    if BoothStates[boothNumber] then
        if BoothStates[boothNumber] and BoothStates[boothNumber].serverId == Source then
            if BoothStates[boothNumber].state == CALL_ENUMS.BOOTH_ACTIVE_CALL or CALL_ENUMS.BOOTH_WAITING_ACCEPT then
                BoothStates[boothNumber].state = CALL_ENUMS.BOOTH_WAITING_CALL
                if shared.phone == 'gksphone' then
                    local boothData = BoothStates[boothNumber] or nil
                    local callData = boothData.callData

                    if callData and Utils.tablesize(callData) > 0 then
                        dbg.debug('Clearing call for target [%s]', GetPlayerName(callData.receiver_src))

                        TriggerClientEvent('gksphone:gksc:rejectCall', callData.receiver_src)

                        Wait(1000)

                        TriggerClientEvent('gksphone:gksc:rejectCall', callData.transmitter_src)

                        dbg.debug('Clearing call for call initiator [%s]', GetPlayerName(callData.transmitter_src))

                        BoothStates[boothNumber].callData = {}

                        LevelDebug(3,'inform', 'End call for boothNumber [%s] | by [%s]', boothNumber, GetPlayerName(Source))
                    end
                elseif shared.phone == 'npwd' then
                    TriggerClientEvent('rcore_prison:stopInternalCall', Source, Source)
                    LevelDebug(3,'inform', 'End call for boothNumber [%s] | [%s]', boothNumber, GetPlayerName(Source))
                elseif shared.phone == 'lb-phone' then
                    exports["lb-phone"]:EndCall(Source)
                elseif shared.phone == 'qb-phone' or shared.phone == 'qs-smartphone' or Prison.FrameworkTriggers.resourceNamePhone and Prison.SupportedPhones[Prison.FrameworkTriggers.resourceNamePhone]  then
                    callEndQBPhone(boothNumber, Source)
                end
            end
        end
    end
end)


