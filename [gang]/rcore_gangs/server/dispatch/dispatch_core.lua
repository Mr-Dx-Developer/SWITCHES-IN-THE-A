if not Config.Dispatch or Config.Dispatch == 0 then
    if GetResourceState('core_dispatch') == 'starting' or GetResourceState('core_dispatch') == 'started' then
        Config.Dispatch = 3
    end
end

if Config.Dispatch and Config.Dispatch == 3 then
    Dispatch = function(source, drug)
        TriggerClientEvent('rcore_gangs:client:core_dispatch', source, drug)
    end
end