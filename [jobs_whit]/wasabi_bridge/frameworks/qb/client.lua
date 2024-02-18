if GetResourceState('qb-core') ~= 'started' then return end
QBCore = exports['qb-core']:GetCoreObject()
WSB = {}
WSB.framework, WSB.playerLoaded, WSB.playerData = 'qb', nil, {}
---@diagnostic disable: duplicate-set-field

function WSB.getCore()
    return QBCore
end

AddStateBagChangeHandler('isLoggedIn', '', function(_bagName, _key, value, _reserved, _replicated)
    if value then
       SwitchHandler('isLoggedIn', WSB.playerData)
    else
        SwitchHandler('isLoggedOut')
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName or not LocalPlayer.state.isLoggedIn then return end
    SwitchHandler('start')
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    if not job or not job.name then return end
    SwitchHandler('setJob', job)
end)

AddEventHandler('gameEventTriggered', function(event, data)
    if event ~= 'CEventNetworkEntityDamage' then return end
    local playerPed = cache.ped
    local victim, victimDied = data[1], data[4]
    if not IsPedAPlayer(victim) then return end
    local player = PlayerId()
    if victimDied and NetworkGetPlayerIndexFromPed(victim) == player and (IsPedDeadOrDying(victim, true) or IsPedFatallyInjured(victim)) then
        local deathCause = GetPedCauseOfDeath(playerPed)
        local data = {
            deathCause = deathCause,
            victimCoords = GetEntityCoords(victim)
        }
        TriggerEvent('wasabi_bridge:onPlayerDeath', data)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerEvent('wasabi_bridge:onPlayerSpawn')
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(newPlayerData)
    if source ~= '' and GetInvokingResource() ~= 'qb-core' then return end
    SwitchHandler('QBCore:Player:SetPlayerData', newPlayerData)
end)

---@diagnostic disable: duplicate-set-field

function WSB.showNotification(msg, type)
    QBCore.Functions.Notify(msg, type)
end

function WSB.serverCallback(name, cb, ...)
    QBCore.Functions.TriggerCallback(name, cb, ...)
end

function WSB.hasGroup(filter)
    local groups = { 'job', 'gang' }
    local type = type(filter)

    if type == 'string' then
        for i = 1, #groups do
            local data = WSB.playerData[groups[i]]

            if data and data.name == filter then
                return data.name, data.grade.level
            end
        end
    else
        local tabletype = table.type(filter)

        if tabletype == 'hash' then
            for i = 1, #groups do
                local data = WSB.playerData[groups[i]]
                local grade
                if data then grade = filter[data.name] end

                if data and grade and grade <= data.grade.level then
                    return data.name, data.grade.level
                end
            end
        elseif tabletype == 'array' then
            for i = 1, #filter do
                local group = filter[i]

                for j = 1, #groups do
                    local data = WSB.playerData[groups[j]]

                    if data and data.name == group then
                        return data.name, data.grade.level
                    end
                end
            end
        end
    end
end

function WSB.getGroup()
    if not WSB.playerLoaded then return end
    local data = WSB.playerData['job']
    return data.name, data.grade.level
end

function WSB.isOnDuty()
    if not WSB.playerLoaded then return end
    WSB.playerData = QBCore.Functions.GetPlayerData()
    return WSB.playerData.job.onduty
end

function WSB.openBossMenu(_job)
    TriggerEvent('qb-bossmenu:client:OpenMenu')
end

function WSB.getGender()
    if not WSB.playerLoaded then return 0 end
    return (WSB.playerData.charinfo.gender or 0)
end

function WSB.isPlayerDead()
    if not WSB.playerLoaded then return end
    WSB.playerData = QBCore.Functions.GetPlayerData()
    return (WSB.playerData.metadata.isdead or WSB.playerData.metadata.inlaststand)
end
