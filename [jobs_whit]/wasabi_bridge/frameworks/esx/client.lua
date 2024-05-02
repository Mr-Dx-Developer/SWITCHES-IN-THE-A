-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local found = GetResourceState('es_extended')
if found ~= 'started' and found ~= 'starting' then return end

ESX = exports['es_extended']:getSharedObject()
WSB = {}
WSB.framework, WSB.playerLoaded, WSB.playerData = 'esx', nil, {}
local isDead
---@diagnostic disable: duplicate-set-field

function WSB.getCore()
    return ESX
end

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    SwitchHandler('isLoggedIn', xPlayer)
end)

AddEventHandler('esx:onPlayerSpawn', function(noAnim)
    if type(noAnim) ~= 'boolean' then noAnim = false end
    TriggerEvent('wasabi_bridge:onPlayerSpawn', noAnim)
    isDead = nil
end)

AddEventHandler('esx:onPlayerDeath', function(data)
    TriggerEvent('wasabi_bridge:onPlayerDeath', data)
    isDead = true
end)

RegisterNetEvent('esx:onPlayerLogout', function()
    SwitchHandler('isLoggedOut')
end)

RegisterNetEvent('esx:setJob', function(job)
    SwitchHandler('setJob', job)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName or not ESX.PlayerLoaded then return end
    SwitchHandler('start')
end)

AddEventHandler('esx:setPlayerData', function(key, value)
    if GetInvokingResource() ~= 'es_extended' then return end
    SwitchHandler('esx:setPlayerData', { key = key, value = value })
end)

---@diagnostic disable: duplicate-set-field

function WSB.showNotification(_title, msg, type)
    if type == 'inform' then type = 'info' end
    ESX.ShowNotification(msg, type)
end

function WSB.serverCallback(name, cb, ...)
    ESX.TriggerServerCallback(name, cb, ...)
end

function WSB.awaitServerCallback(name, ...)
    local args = { ... }
    local promise = promise.new()
    ESX.TriggerServerCallback(name, function(...)
        promise:resolve(...)
    end, table.unpack(args))
    return table.unpack({ Citizen.Await(promise) })
end

function WSB.hasGroup(filter)
    local type = type(filter)

    if type == 'string' then
        if WSB.playerData and WSB.playerData.job and WSB.playerData.job.name == filter then
            return WSB.playerData.job.name, WSB.playerData.job.grade
        end
    else
        local tabletype = table.type(filter)

        if tabletype == 'hash' then
            local grade
            if WSB.playerData and WSB.playerData.job then grade = filter[WSB.playerData.job.name] end
            if grade and grade <= WSB.playerData.job.grade then
                return WSB.playerData.job.name, WSB.playerData.job.grade
            end
        elseif tabletype == 'array' then
            for i = 1, #filter do
                if WSB.playerData and WSB.playerData.job and WSB.playerData.job.name == filter[i] then
                    return WSB.playerData.job.name, WSB.playerData.job.grade
                end
            end
        end
    end
end

function WSB.getGroup()
    if not WSB.playerData or not WSB.playerData.job then return end
    return WSB.playerData.job.name, WSB.playerData.job.grade
end

function WSB.isOnDuty()
    if not WSB.playerData or not WSB.playerData.job then return end
    if WSB.playerData.job.name:sub(0, 3) == 'off' then
        return false
    else
        return true
    end
end

function WSB.openBossMenu()
    if not WSB.playerData or not WSB.playerData.job then return end
    TriggerEvent('esx_society:openBossMenu', WSB.playerData.job.name, function(menu)
        --ESX.CloseContext()
    end, { wash = false })
end

function WSB.getGender()
    if not WSB.playerData and not WSB.playerData.sex then return end
    return WSB.playerData.sex
end

function WSB.isPlayerDead()
    return isDead
end
