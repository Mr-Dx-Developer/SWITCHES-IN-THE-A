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
    Framework.ShowNotification = function(text)
        ESX.ShowNotification(text, true, false, 140)
    end

    Framework.ShowAdvancedNotification = function(title, subject, text, textureDict, iconType)
        ESX.ShowAdvancedNotification(title, subject, text, textureDict, iconType)
    end

    Framework.GetPlayerId = function()
        return ESX.GetPlayerData().identifier
    end

    Framework.SetVehicleKeys = function(vehicle)
    end

    Framework.ActionsOnRestrain = function(toggle)
    end

    Framework.ActionsOnBlindfold = function(toggle)
    end
end