if not Config.Dispatch or Config.Dispatch == 0 then
    if GetResourceState('qs-dispatch') == 'starting' or GetResourceState('qs-dispatch') == 'started' then
        Config.Dispatch = 4
    end
end

if Config.Dispatch and Config.Dispatch == 4 then
    RegisterNetEvent('rcore_gangs:client:qs-dispatch')
    AddEventHandler('rcore_gangs:client:qs-dispatch', function(drug)
        local data = exports['qs-dispatch']:GetPlayerInfo()

        exports['qs-dispatch']:getSSURL(function(image)
            TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
                job = { 'police' },
                callLocation = data.coords,
                callCode = { code = 'Drug Possession', snippet = '10-50' },
                message = 'A ' .. data.sex .. ' selling drugs at ' .. data.street_1,
                flashes = false,
                image = image,
                blip = {
                    sprite = 51,
                    scale = 1.5,
                    colour = 2,
                    flashes = false,
                    text = '911 - Drug Possession',
                    time = 5 * 60 * 1000,
                }
            })
        end)
    end)
end