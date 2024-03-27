RegisterNetEvent(Config.InventoryPrefix .. ':client:CraftItems', function(itemName, itemCosts, points, amount, toSlot, rep, time, chance)
    local ped = PlayerPedId()
    local itemData = ItemList[itemName:lower()]
    local randomNum = math.random(1, 100)

    SendNUIMessage({
        action = 'close',
    })
    inInventory = false
    if itemData['type'] == 'weapon' and tonumber(amount) > 1 then
        return SendTextMessage(Lang('INVENTORY_NOTIFICATION_CRAFTING_WEAPONS'), 'error')
    end

    if chance then
        Debug('Crafting started with a chance of ' .. randomNum .. '% and you had ' .. chance .. '%')
    else
        chance = 100
        Debug('There is no chance option in your configuration or in this item, and the crafting chance is set to 100%')
    end

    isCrafting = true
    ProgressBar('crafting_item', Lang('INVENTORY_PROGRESS_CRAFTING'), (time * amount), false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 1,
    }, {}, {}, function()
        if randomNum <= chance then
            Debug('Crafting successful with ' .. randomNum .. '% chance and you had ' .. chance .. '%')
            TriggerEvent(Config.InventoryPrefix .. ':client:ItemBox', ItemList[itemName], 'add')
            StopAnimTask(ped, 'mini@repair', 'fixing_a_player', 1.0)
        else
            Debug('Crafting failed with ' .. randomNum .. '% chance and you had ' .. chance .. '%')
            StopAnimTask(ped, 'mini@repair', 'fixing_a_player', 1.0)
            SendTextMessage(Lang('INVENTORY_NOTIFICATION_CRAFTING_FAILED'), 'inform')
            Wait(550)
            TaskPlayAnim(ped, 'gestures@m@standing@casual', 'gesture_damn', 8.0, -8.0, -1, 1, 0, false, false, false)
            Wait(1250)
            StopAnimTask(ped, 'gestures@m@standing@casual', 'gesture_damn', 1.0)
        end
        TriggerServerEvent(Config.InventoryPrefix .. ':server:CraftItems', itemName, itemCosts, points, amount, toSlot, rep, randomNum, chance)
        isCrafting = false
    end, function()
        StopAnimTask(ped, 'mini@repair', 'fixing_a_player', 1.0)
        isCrafting = false
    end)
    TriggerScreenblurFadeOut(300)
    if Config.Clothing then DeletePedScreen() end
end)
