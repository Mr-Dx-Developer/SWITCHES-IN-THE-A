if not Config.Dispatch or Config.Dispatch == 0 then
    if GetResourceState('ps-dispatch') == 'starting' or GetResourceState('ps-dispatch') == 'started' then
        Config.Dispatch = 2
    end
end

if Config.Dispatch and Config.Dispatch == 2 then
    RegisterNetEvent('rcore_gangs:client:ps-dispatch')
    AddEventHandler('rcore_gangs:client:ps-dispatch', function(drug)
        exports['ps-dispatch']:DrugSale()
    end)
end