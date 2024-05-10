local blips = {}

CreateThread(function()
    for _, hoopData in pairs(BasketballHoops) do
        if not hoopData.hideBlip then
            local blip = AddBlipForCoord(hoopData.pos.x, hoopData.pos.y, hoopData.pos.z)

            SetBlipDisplay(blip, 4)
            SetBlipSprite(blip, 128)
            SetBlipColour(blip, 47)
            SetBlipScale(blip, 0.75)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(Config.Text.BLIP)
            EndTextCommandSetBlipName(blip)

            table.insert(blips, blip)
        end
    end
end)

AddEventHandler('onResourceStop', function(name)
    if GetCurrentResourceName() == name then
        for _, b in pairs(blips) do
            RemoveBlip(b)
        end
    end
end)
