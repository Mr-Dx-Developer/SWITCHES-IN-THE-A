PlayerLoaded, PlayerData = nil, {}
local libState = GetResourceState('ox_lib')

-- Get framework
if GetResourceState('es_extended') == 'started' then
    ESX = exports['es_extended']:getSharedObject()
    Framework = 'esx'

    RegisterNetEvent('esx:playerLoaded', function(xPlayer)
        TriggerEvent('lation_selling:onPlayerLoaded')
        PlayerData = xPlayer
        PlayerLoaded = true
    end)

    RegisterNetEvent('esx:onPlayerLogout', function()
        table.wipe(PlayerData)
        PlayerLoaded = false
    end)

    AddEventHandler('onResourceStart', function(resourceName)
        if GetCurrentResourceName() ~= resourceName or not ESX.PlayerLoaded then
            return
        end
        TriggerEvent('lation_selling:onPlayerLoaded')
        PlayerData = ESX.GetPlayerData()
        PlayerLoaded = true
    end)

elseif GetResourceState('qb-core') == 'started' then
    QBCore = exports['qb-core']:GetCoreObject()
    Framework = 'qb'

    AddStateBagChangeHandler('isLoggedIn', '', function(_bagName, _key, value, _reserved, _replicated)
        if value then
            PlayerData = QBCore.Functions.GetPlayerData()
        else
            table.wipe(PlayerData)
        end
        PlayerLoaded = value
    end)

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        TriggerEvent('lation_selling:onPlayerLoaded')
    end)

    AddEventHandler('onResourceStart', function(resourceName)
        if GetCurrentResourceName() ~= resourceName or not LocalPlayer.state.isLoggedIn then
            return
        end
        PlayerData = QBCore.Functions.GetPlayerData()
        PlayerLoaded = true
    end)
else
    -- Add support for a custom framework here
    return
end

-- Function to show a notification
ShowNotification = function(message, type)
    if libState == 'started' then
        lib.notify({
            title = Strings.Notify.title,
            description = message,
            type = type or 'inform',
            position = Strings.Notify.position,
            icon = Strings.Notify.icon
        })
    else
        if Framework == 'esx' then
            ESX.ShowNotification(message)
        elseif Framework == 'qb' then
            QBCore.Functions.Notify(message, type)
        else
            -- Add support for a custom framework here
        end
    end
end