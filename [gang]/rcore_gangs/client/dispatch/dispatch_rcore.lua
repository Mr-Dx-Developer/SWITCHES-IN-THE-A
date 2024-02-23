if not Config.Dispatch or Config.Dispatch == 0 then
    if GetResourceState('rcore_dispatch') == 'starting' or GetResourceState('rcore_dispatch') == 'started' then
        Config.Dispatch = 5
    end
end

if Config.Dispatch and Config.Dispatch == 5 then
    RegisterNetEvent('rcore_gangs:client:dispatch')
    AddEventHandler('rcore_gangs:client:dispatch', function(drug)
        local sprite = nil

        if Config.Drugs.CATEGORY_LOW[drug] then
            sprite = 496
        end

        if Config.Drugs.CATEGORY_MED[drug] then
            sprite = 499
        end

        if Config.Drugs.CATEGORY_HIGH[drug] then
            sprite = 501
        end

        exports['rcore_dispatch']:DrugSale('Drugs are being sold', 'Drug Possession', {
            job = 'police',
            code = '10-50',
            sprite = sprite,
        })
    end)
end