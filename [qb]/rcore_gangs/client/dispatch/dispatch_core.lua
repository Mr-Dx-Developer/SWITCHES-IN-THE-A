if not Config.Dispatch or Config.Dispatch == 0 then
    if GetResourceState('core_dispatch') == 'starting' or GetResourceState('core_dispatch') == 'started' then
        Config.Dispatch = 3
    end
end

if Config.Dispatch and Config.Dispatch == 3 then
    RegisterNetEvent('rcore_gangs:client:core_dispatch')
    AddEventHandler('rcore_gangs:client:core_dispatch', function(drug)
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)

        local icon = nil
        local blip = nil

        if Config.Drugs.CATEGORY_LOW[drug] then
            icon = 'fas fa-cannabis'
            blip = 496
        end

        if Config.Drugs.CATEGORY_MED[drug] then
            icon = 'fas fa-syringe'
            blip = 499
        end

        if Config.Drugs.CATEGORY_HIGH[drug] then
            icon = 'fas fa-pills'
            blip = 501
        end

        exports['core_dispatch']:addCall('10-50', 'Drugs are being sold', {
            { icon = icon, info = 'Drug Possession' }
        }, { playerPos.x, playerPos.y, playerPos.z }, 'police', 3000, blip, 5)
    end)
end