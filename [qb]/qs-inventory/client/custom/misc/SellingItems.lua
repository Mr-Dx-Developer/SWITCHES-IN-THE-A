if not Config.UseTarget or Config.UseTarget == 'none' then
    local nearby = false
    CreateThread(function()
        while true do
            local sleep = 1000
            if nearby then
                DrawText3Ds(Config.SellItems[nearby].coords.x, Config.SellItems[nearby].coords.y, Config.SellItems[nearby].coords.z, Lang('INVENTORY_TEXT_SELLING'))
                sleep = 1
                if IsControlJustPressed(0, 38) then
                    local PawnshopItems = {}
                    PawnshopItems.label = nearby
                    PawnshopItems.items = Config.SellItems[nearby].items
                    PawnshopItems.slots = #Config.SellItems[nearby].items
                    TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'selling', 'itemselling_' .. nearby, PawnshopItems)
                end
            end
            Wait(sleep)
        end
    end)

    CreateThread(function()
        for k, v in pairs(Config.SellItems) do
            if v.blip and v.blip.active then
                local ff = v.blip
                local blip = AddBlipForCoord(v.coords)
                SetBlipSprite(blip, ff.sprite)
                SetBlipColour(blip, ff.color)
                SetBlipScale(blip, ff.scale)
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentString(ff.name)
                EndTextCommandSetBlipName(blip)
                SetBlipAsShortRange(blip, true)
            end
        end
    end)

    CreateThread(function()
        while true do
            local playercoords = GetEntityCoords(PlayerPedId())
            local finded = false
            for k, v in pairs(Config.SellItems) do
                if #(playercoords - v.coords) <= 2 then finded = k end
            end
            nearby = finded
            Wait(700)
        end
    end)
end