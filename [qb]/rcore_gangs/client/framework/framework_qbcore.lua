Framework = Framework or {}

if not Config.Framework or Config.Framework == 0 then
    if GetResourceState('qb-core') == 'starting' or GetResourceState('qb-core') == 'started' then
        Config.Framework = 2
    end
end

if Config.Framework and Config.Framework == 2 then
    if not Config.FrameworkTriggers then
        Config.FrameworkTriggers = {
            notify = 'QBCore:Notify',
            object = 'QBCore:GetObject',
            resourceName = 'qb-core'
        }
    end

    if not Config.FrameworkTriggers.notify or Config.FrameworkTriggers.notify == '' or Config.FrameworkTriggers.notify:lower():strtrim() == 'qbcore' then
        Config.FrameworkTriggers.notify = 'QBCore:Notify'
    end

    if not Config.FrameworkTriggers.object or Config.FrameworkTriggers.object == '' or Config.FrameworkTriggers.object:lower():strtrim() == 'qbcore' then
        Config.FrameworkTriggers.object = 'QBCore:GetObject'
    end

    if not Config.FrameworkTriggers.resourceName or Config.FrameworkTriggers.resourceName == '' or Config.FrameworkTriggers.resourceName:lower():strtrim() == 'qbcore' then
        Config.FrameworkTriggers.resourceName = 'qb-core'
    end

    if not Config.FrameworkSQLTables then
        Config.FrameworkSQLTables = {
            table = 'players',
            identifier = 'citizenid'
        }
    end

    if not Config.FrameworkSQLTables.table or Config.FrameworkSQLTables.table == '' or Config.FrameworkSQLTables.table:lower():strtrim() == 'qbcore' then
        Config.FrameworkSQLTables.table = 'players'
    end

    if not Config.FrameworkSQLTables.identifier or Config.FrameworkSQLTables.identifier == '' or Config.FrameworkSQLTables.identifier:lower():strtrim() == 'qbcore' then
        Config.FrameworkSQLTables.identifier = 'citizenid'
    end
end

if Config.Framework and Config.Framework == 2 then
    Framework.ShowNotification = function(text)
        QBCore.Functions.Notify(text, nil, 5000)
    end

    Framework.ShowAdvancedNotification = function(title, subject, text, textureDict, iconType)
        QBCore.Functions.Notify(title .. ' / ' .. subject .. ' - ' .. text, nil, 5000)
    end

    Framework.GetPlayerId = function()
        return QBCore.Functions.GetPlayerData().citizenid
    end

    Framework.SetVehicleKeys = function(vehicle)
        TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(vehicle))
    end

    Framework.ActionsOnRestrain = function(toggle)
        if toggle then
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "Cuff", 0.2)
        else
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "Uncuff", 0.2)
        end

        TriggerServerEvent('police:server:SetHandcuffStatus', toggle)
    end

    Framework.ActionsOnBlindfold = function(toggle)
    end
end