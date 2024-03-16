--[[
    Hi dear customer or developer, here you can fully configure your server's
    framework or you could even duplicate this file to create your own framework.

    If you do not have much experience, we recommend you download the base version
    of the framework that you use in its latest version and it will work perfectly.
]]

if Config.Framework ~= 'esx' then
    return
end

CreateThread(function()
    ESX = exports['es_extended']:getSharedObject()

    while ESX.GetPlayerData().job == nil do
        Wait(100)
    end

    PlayerData = ESX.GetPlayerData()
    PlayerHousesLoaded()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    PlayerData = playerData
    TriggerServerCallback('housing:server:getInside', function(inside1)
        TriggerEvent('housing:client:lastLocationHouse', inside1)
    end)
    if Config.EnableCredit and Config.OnlyInGame then
        StartCredit()
    end
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
    PlayerData = {}
    UnloadDecorations(CurrentHouse or closesthouse)
    if Config.EnableCredit and Config.OnlyInGame then
        StopCredit()
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    TriggerEvent('housing:client:OnJobUpdateBlips')
end)

function TriggerServerCallback(name, cb, ...)
    ESX.TriggerServerCallback(name, cb, ...)
end

function GetPlayerIdentifier()
    return ESX.GetPlayerData().identifier
end

function GetPlayerJob()
    return PlayerData.job.name
end

function GetPlayers()
    return ESX.Game.GetPlayers()
end

function GetClosestPlayer()
    return ESX.Game.GetClosestPlayer()
end

function CustomLeaveHouse()
    -- Add your code here
end

function CustomJoinHouse()
    -- Add your code here
end

function SendTextMessage(msg, type)
    if type == 'inform' then
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0, 1)
    end
    if type == 'error' then
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0, 1)
    end
    if type == 'success' then
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0, 1)
    end
end

function ShowHelpNotification(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, 0, false, -1)
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry('STRING')
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 55)
    ClearDrawOrigin()
end
