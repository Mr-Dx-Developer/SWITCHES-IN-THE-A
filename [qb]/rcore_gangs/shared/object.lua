if Config.Framework and Config.Framework == 1 then
    CreateThread(function()
        xpcall(function() ESX = exports[Config.FrameworkTriggers.resourceName]:getSharedObject(); if ESX == nil then TriggerEvent(Config.FrameworkTriggers.object, function(object) ESX = object end) end end, function() TriggerEvent(Config.FrameworkTriggers.object, function(object) ESX = object end) end)
    end)

    AddEventHandler('rcore_gangs:server:database_ready', function()
        Wait(1000)

        if ESX then
            TriggerEvent('rcore_gangs:server:framework_ready')
        else
            print('^1[GANGS] Could not load shared object^7')
        end
    end)
end

if Config.Framework and Config.Framework == 2 then
    CreateThread(function()
        xpcall(function() QBCore = exports[Config.FrameworkTriggers.resourceName]:GetCoreObject() end, debug.traceback)
        xpcall(function() QBCore = exports[Config.FrameworkTriggers.resourceName]:GetSharedObject() end, debug.traceback)
        xpcall(function() TriggerEvent(Config.FrameworkTriggers.object, function(object) QBCore = object end) end, debug.traceback)
    end)

    AddEventHandler('rcore_gangs:server:database_ready', function()
        Wait(1000)

        if QBCore then
            TriggerEvent('rcore_gangs:server:framework_ready')
        else
            print('^1[GANGS] Could not load shared object^7')
        end
    end)
end