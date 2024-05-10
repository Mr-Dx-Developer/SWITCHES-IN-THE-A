--[[
    Hi dear customer or developer, here you can fully configure your server's
    framework or you could even duplicate this file to create your own framework.
    If you do not have much experience, we recommend you download the base version
    of the framework that you use in its latest version and it will work perfectly.
]]

if Config.Framework ~= 'esx' then
    return
end

ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    Wait(10000)
    StartThread()
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        ESX = exports['es_extended']:getSharedObject()
        Wait(10000)
        StartThread()
    end
end)

function OpenStash(metadata)
    local other = {}
    other.maxweight = metadata.weight
    other.slots = metadata.slots
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'Backpack_' .. metadata.ID, other)
    TriggerEvent('inventory:client:SetCurrentStash', 'Backpack_' .. metadata.ID)
    repeat Wait(1000) until IsNuiFocused() == false
    TriggerEvent('backpacks:client:close', metadata.ID)
end

function SendTextMessage(msg, type) --You can add your notification system here for simple messages.
    if type == 'inform' then
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0, 1)

        -- exports['qs-core']:Notify(msg, "primary")
        -- exports['mythic_notify']:DoHudText('inform', msg)
        -- exports['okokNotify']:Alert('Backpack', msg, 5000, 'info')
        -- QBCore.Functions.Notify(msg, 'primary', 5000)
    end
    if type == 'error' then
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0, 1)

        -- exports['qs-core']:Notify(msg, "error")
        -- exports['mythic_notify']:DoHudText('error', msg)
        -- exports['okokNotify']:Alert('Backpack', msg, 5000, 'error')
        -- QBCore.Functions.Notify(msg, 'error', 5000)
    end
    if type == 'success' then
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0, 1)

        -- exports['qs-core']:Notify(msg, "success")
        -- exports['mythic_notify']:DoHudText('success', msg)
        -- exports['okokNotify']:Alert('Backpack', msg, 5000, 'success')
        -- QBCore.Functions.Notify(msg, 'success', 5000)
    end
end

function Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    exports['progressbar']:Progress({
        name = name:lower(),
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = disableControls,
        animation = animation,
    }, function(cancelled)
        if not cancelled then
            if onFinish ~= nil then
                onFinish()
            end
        else
            if onCancel ~= nil then
                onCancel()
            end
        end
    end)
end
