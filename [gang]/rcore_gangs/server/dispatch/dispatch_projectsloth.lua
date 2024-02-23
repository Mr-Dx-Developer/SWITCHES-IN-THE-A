if not Config.Dispatch or Config.Dispatch == 0 then
    if GetResourceState('ps-dispatch') == 'starting' or GetResourceState('ps-dispatch') == 'started' then
        Config.Dispatch = 2
    end
end

if Config.Dispatch and Config.Dispatch == 2 then
    Dispatch = function(source, drug)
        TriggerClientEvent('rcore_gangs:client:ps-dispatch', source, drug)
    end
end