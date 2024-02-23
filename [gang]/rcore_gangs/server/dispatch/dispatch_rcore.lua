if not Config.Dispatch or Config.Dispatch == 0 then
    if GetResourceState('rcore_dispatch') == 'starting' or GetResourceState('rcore_dispatch') == 'started' then
        Config.Dispatch = 5
    end
end

if Config.Dispatch and Config.Dispatch == 5 then
    Dispatch = function(source, drug)
        TriggerClientEvent('rcore_gangs:client:dispatch', source, drug)
    end
end