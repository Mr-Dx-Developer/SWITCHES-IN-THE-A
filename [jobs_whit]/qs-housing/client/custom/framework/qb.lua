--[[
    Hi dear customer or developer, here you can fully configure your server's
    framework or you could even duplicate this file to create your own framework.

    If you do not have much experience, we recommend you download the base version
    of the framework that you use in its latest version and it will work perfectly.
]]

if Config.Framework ~= 'qb' then
    return
end

CreateThread(function()
    QBCore = exports['qb-core']:GetCoreObject()

    while QBCore.Functions.GetPlayerData().job == nil do
        Wait(10)
    end
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerHousesLoaded()
end)

qbcoreMenu = 'qb-menu'         -- Only if use a custom name of qb-menu
qbcoreInput = 'qb-input'       -- Only if use a custom name of qb-input
qbcoreRadial = 'qb-radialmenu' -- Only if use a custom name of qb-radialmenu

RegisterNetEvent('QBCore:Player:SetPlayerData')
AddEventHandler('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
    UnloadDecorations(CurrentHouse or closesthouse)
    if Config.EnableCredit and Config.OnlyInGame then
        StopCredit()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    if Config.EnableCredit and Config.OnlyInGame then
        StartCredit()
    end    
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    TriggerEvent('housing:client:OnJobUpdateBlips')
end)



function TriggerServerCallback(name, cb, ...)
    QBCore.Functions.TriggerCallback(name, cb, ...)
end

function GetPlayerJob()
    return PlayerData.job.name
end

function GetPlayerIdentifier()
    return QBCore.Functions.GetPlayerData().citizenid
end

function GetPlayers()
    return QBCore.Functions.GetPlayers()
end

function GetClosestPlayer()
    return QBCore.Functions.GetClosestPlayer()
end

function CustomLeaveHouse()
    -- Add your code here
end

function CustomJoinHouse()
    -- Add your code here
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

function SpawnInHouse(house)
    enterOwnedHouse(house)
end

exports('SpawnInHouse',SpawnInHouse)