Framework = Framework or {}

if Config.Framework == nil or Config.Framework == 0 then
    if GetResourceState('es_extended') == 'starting' or GetResourceState('es_extended') == 'started' then
        Config.Framework = 1
    end
end

if Config.Framework and Config.Framework == 1 then
    if not Config.FrameworkTriggers then
        Config.FrameworkTriggers = {
            notify = 'esx:showNotification',
            object = 'esx:getSharedObject',
            resourceName = 'es_extended'
        }
    end

    if not Config.FrameworkTriggers.notify or Config.FrameworkTriggers.notify == '' or Config.FrameworkTriggers.notify:lower():strtrim() == 'esx' then
        Config.FrameworkTriggers.notify = 'esx:showNotification'
    end

    if not Config.FrameworkTriggers.object or Config.FrameworkTriggers.object == '' or Config.FrameworkTriggers.object:lower():strtrim() == 'esx' then
        Config.FrameworkTriggers.object = 'esx:getSharedObject'
    end

    if not Config.FrameworkTriggers.resourceName or Config.FrameworkTriggers.resourceName == '' or Config.FrameworkTriggers.resourceName:lower():strtrim() == 'esx' then
        Config.FrameworkTriggers.resourceName = 'es_extended'
    end

    if not Config.FrameworkSQLTables then
        Config.FrameworkSQLTables = {
            table = 'users',
            identifier = 'identifier'
        }
    end

    if not Config.FrameworkSQLTables.table or Config.FrameworkSQLTables.table == '' or Config.FrameworkSQLTables.table:lower():strtrim() == 'esx' then
        Config.FrameworkSQLTables.table = 'users'
    end

    if not Config.FrameworkSQLTables.identifier or Config.FrameworkSQLTables.identifier == '' or Config.FrameworkSQLTables.identifier:lower():strtrim() == 'esx' then
        Config.FrameworkSQLTables.identifier = 'identifier'
    end
end

if Config.Framework and Config.Framework == 1 then
    Framework.ShowNotification = function(source, text)
        TriggerClientEvent(Config.FrameworkTriggers.notify, source, text)
    end

    Framework.ShowAdvancedNotification = function(source, title, subject, text)
        TriggerClientEvent('rcore_gangs:client:advanced_notification', source, title, subject, text, 'CHAR_DEFAULT', 8)
    end

    Framework.GetPlayers = function()
        return ESX.GetPlayers()
    end

    Framework.GetPlayerId = function(source)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer then
            return xPlayer.getIdentifier()
        end
    end

    Framework.GetPlayerMoney = function(source)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer then
            return xPlayer.getMoney()
        end
    end

    Framework.AddPlayerMoney = function(source, amount)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer then
            xPlayer.addMoney(amount)
        end
    end

    Framework.AddPlayerDirtyMoney = function(source, amount)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer then
            xPlayer.addAccountMoney('black_money', amount)
        end
    end

    Framework.RemovePlayerMoney = function(source, amount)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer then
            xPlayer.removeMoney(amount)
        end
    end

    Framework.IsPlayerAllowed = function(source)
        local xPlayer = ESX.GetPlayerFromId(source)

        local group = 'user'

        if xPlayer then
            group = xPlayer.getGroup()
        end

        for index, permission in ipairs(Config.CommandPermissions) do
            if IsPlayerAceAllowed(source, permission) or IsPlayerAceAllowed(source, 'command') or permission == group then
                return true
            end
        end

        return false
    end

    Framework.SetPlayerGang = function(source, gang)
    end

    Framework.CreateGang = function(gang)
    end

    Framework.GetPoliceCount = function()
        local policeCount = 0

        for _, serverId in pairs(ESX.GetPlayers()) do
            Wait(0)
            
            local xPlayer = ESX.GetPlayerFromId(serverId)

            if xPlayer and xPlayer.job.name == 'police' then
                policeCount += 1
            end
        end

        return policeCount
    end

    Framework.SetVehicleModifications = function(vehicle)
    end
end