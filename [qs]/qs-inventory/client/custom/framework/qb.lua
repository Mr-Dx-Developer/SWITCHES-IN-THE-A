if Config.Framework ~= 'qb' then
    return
end

QBCore = exports['qb-core']:GetCoreObject()
WeaponList = QBCore.Shared.Weapons
ItemList = QBCore.Shared.Items

function GetPlayerData()
    return QBCore.Functions.GetPlayerData()
end

function TriggerServerCallback(name, cb, ...)
    QBCore.Functions.TriggerCallback(name, cb, ...)
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = GetPlayerData()
    LocalPlayer.state:set('inv_busy', false, true)
    Wait(1250)
    for k, data in pairs(Config.WeaponRepairPoints) do
        Config.WeaponRepairPoints[k].IsRepairing = data.IsRepairing
        Config.WeaponRepairPoints[k].RepairingData = data.RepairingData
    end
    TriggerServerCallback(Config.InventoryPrefix .. ':server:GetCurrentDrops', function(theDrops)
        Drops = theDrops
    end)
    if Config.Crafting then
        CreateBlips()
    end
    TriggerServerEvent(Config.InventoryPrefix .. ':server:OnLoadUpdateCash')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
    LocalPlayer.state:set('inv_busy', true, true)
    RemoveAllNearbyDrops()
    for k in pairs(Config.WeaponRepairPoints) do
        Config.WeaponRepairPoints[k].IsRepairing = false
        Config.WeaponRepairPoints[k].RepairingData = {}
    end
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
    if Config.Crafting then
        CreateBlips()
    end
end)

function GetPlayerIdentifier()
    return GetPlayerData().citizenid
end

function GetPlayersInArea()
    local playerPed = PlayerPedId()
    return QBCore.Functions.GetPlayersFromCoords(GetEntityCoords(playerPed), 3.0)
end

function GetJobName()
    return GetPlayerData()?.job?.name
end

function GetJobGrade()
    return GetPlayerData().job.grade
end

function GetGang()
    return false
end

function GetGangLevel()
    return false
end

function SendTextMessage(msg, type)
    if type == 'inform' then
        QBCore.Functions.Notify(msg, 'primary', 5000)
    end
    if type == 'error' then
        QBCore.Functions.Notify(msg, 'error', 5000)
    end
    if type == 'success' then
        QBCore.Functions.Notify(msg, 'success', 5000)
    end
end

function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry('STRING')
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = string.len(text) / 370
    DrawRect(0.0, 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function ProgressBar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    if GetResourceState('progressbar') ~= 'started' then error('progressbar needs to be started in order for Progressbar to work') end
    exports['progressbar']:Progress({
        name = name:lower(),
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = disableControls,
        animation = animation,
        prop = prop,
        propTwo = propTwo,
    }, function(cancelled)
        if not cancelled then
            if onFinish then
                onFinish()
            end
        else
            if onCancel then
                onCancel()
            end
        end
    end)
end

function ProgressBarSync(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo)
    if GetResourceState('progressbar') ~= 'started' then error('progressbar needs to be started in order for Progressbar to work') end
    local promise = promise.new()
    exports['progressbar']:Progress({
        name = name:lower(),
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = disableControls,
        animation = animation,
        prop = prop,
        propTwo = propTwo,
    }, function(cancelled)
        if not cancelled then
            promise:resolve(true)
        else
            promise:resolve(true)
        end
    end)
    return Citizen.Await(promise)
end

function ToggleHud(bool)
    if bool then
        Debug('Event to show the hud [client/custom/framework/esx.lua line 105]')
        DisplayRadar(false)
    else
        Debug('Event to hide the hud [client/custom/framework/esx.lua line 108]')
        DisplayRadar(true)
    end
end

function DropMarker(coords)
    DrawMarker(20, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 120, 10, 20, 155, false, false, false, 1, false, false, false)
end

function SetPlayerStatus(values)
    for name, value in pairs(values) do
        -- compatibility for ESX style values
        if value > 100 or value < -100 then
            value = value * 0.0001
        end

        if name == 'hunger' then
            TriggerServerEvent('consumables:server:addHunger', QBCore.Functions.GetPlayerData().metadata.hunger + value)
        elseif name == 'thirst' then
            TriggerServerEvent('consumables:server:addThirst', QBCore.Functions.GetPlayerData().metadata.thirst + value)
        elseif name == 'stress' then
            if value > 0 then
                TriggerServerEvent('hud:server:GainStress', value)
            else
                value = math.abs(value)
                TriggerServerEvent('hud:server:RelieveStress', value)
            end
        end
    end
end

function IsPlayerDead()
    local check = false
    local data = GetPlayerData()
    if not data.metadata['isdead'] and not data.metadata['inlaststand'] and not data.metadata['ishandcuffed'] and not IsPauseMenuActive() then
        check = true
    end
    return check
end

function checkEntityDead(id, entity)
    local isDead = false
    TriggerServerCallback(Config.InventoryPrefix .. ':server:checkDead', function(result)
        isDead = result
    end, id)
    repeat Wait(250) until isDead ~= nil
    return isDead
end

function reputationCrafing(rep)
    --- @param rep Name of reputation
    return QBCore.Functions.GetPlayerData().metadata[rep]
end
