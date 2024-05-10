if not Config.Dispatch or Config.Dispatch == 0 then
    if GetResourceState('cd_dispatch') == 'starting' or GetResourceState('cd_dispatch') == 'started' then
        Config.Dispatch = 1
    end
end

if Config.Dispatch and Config.Dispatch == 1 then
    Dispatch = function(source, drug)
        TriggerClientEvent('rcore_gangs:client:cd_dispatch', source, drug)
    end
end