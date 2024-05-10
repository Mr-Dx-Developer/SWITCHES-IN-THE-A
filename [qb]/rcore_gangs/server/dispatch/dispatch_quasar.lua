if not Config.Dispatch or Config.Dispatch == 0 then
    if GetResourceState('qs-dispatch') == 'starting' or GetResourceState('qs-dispatch') == 'started' then
        Config.Dispatch = 4
    end
end

if Config.Dispatch and Config.Dispatch == 4 then
    Dispatch = function(source, drug)
        TriggerClientEvent('rcore_gangs:client:qs-dispatch', source, drug)
    end
end