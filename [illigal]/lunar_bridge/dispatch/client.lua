RegisterNetEvent('lunar_bridge:dispatch:call')
AddEventHandler('lunar_bridge:dispatch:call', function(coords, data)
    if Utils.isPolice() then
        lib.notify({
            title = data.Code,
            description = data.Message,
            position = 'top-right',
            duration = 10000,
            style = {
                width = 330,
                backgroundColor = '#0d3482',
                color = '#FFFFFF',
                padding = 20,
            },
            icon = 'shield-halved',
        })
        local blip = Utils.createBlip(coords, {
            Name = data.Title,
            Sprite = data.Sprite or 161, 
            Size = 2.0, 
            Color = 0
        })
        Citizen.SetTimeout(30000, function()
            blip.remove()
        end)
    end
end)