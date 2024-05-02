local SmartphoneMetadata = GetResourceState('qs-smartphone-pro') == 'started'

function RemoveItem(source, item, amount, slot, metadata)
    if not source then return Error('Could not find [source] in RemoveItem.') end
    if not item then return Error('Could not find [item] in RemoveItem.') end

    TriggerClientEvent(Config.InventoryPrefix .. ':client:UpdatePlayerMoney', source, money, blackMoney, bank) -- Update money hud

    local inventory = inventories[source]
    amount = tonumber(amount) or 1
    slot = tonumber(slot)

    if ItemList[item] then
        if slot then
            if not inventory[slot] then return false end
            if inventory[slot].amount > amount then
                inventory[slot].amount = inventory[slot].amount - amount
                TriggerEvent('esx:onRemoveInventoryItem', source, item, amount)
                TriggerClientEvent('esx:removeInventoryItem', source, item, amount)
                if Config.Framework == 'qb' then
                    local player = GetPlayerFromId(source)
                    player.Functions.SetPlayerData('items', inventory)
                end
                if not ContainsItem(itemsToCheck, item) then
                    Debug("Item removed to player's inventory:", source, 'Item:', item, 'Amount:', amount)
                    TriggerClientEvent(Config.InventoryPrefix .. ':getInventory', source, inventory)
                    TriggerClientEvent(Config.InventoryPrefix .. ':client:ItemBox', source, ItemList[item], 'remove')
                end
                if item == 'money' and Config.Framework == 'esx' then
                    local player = GetPlayerFromId(source)
                    local money = GetItemTotalAmount(source, 'money')
                    player.setAccountMoney('money', money, 'dropped')
                end
                if item == 'black_money' and Config.Framework == 'esx' then
                    local player = GetPlayerFromId(source)
                    local money = GetItemTotalAmount(source, 'black_money')
                    player.setAccountMoney('black_money', money, 'dropped')
                end
                return true
            elseif inventory[slot].amount == amount then
                TriggerEvent('esx:onRemoveInventoryItem', source, item, amount)
                TriggerClientEvent('esx:removeInventoryItem', source, item, amount)
                inventory[slot] = nil
                if Config.Framework == 'qb' then
                    local player = GetPlayerFromId(source)
                    player.Functions.SetPlayerData('items', inventory)
                end
                if not ContainsItem(itemsToCheck, item) then
                    Debug("Item removed to player's inventory:", source, 'Item:', item, 'Amount:', amount)
                    TriggerClientEvent(Config.InventoryPrefix .. ':getInventory', source, inventory)
                    TriggerClientEvent(Config.InventoryPrefix .. ':client:ItemBox', source, ItemList[item], 'remove')
                end
                if item == 'money' and Config.Framework == 'esx' then
                    local player = GetPlayerFromId(source)
                    local money = GetItemTotalAmount(source, 'money')
                    player.setAccountMoney('money', money, 'dropped')
                end
                if item == 'black_money' and Config.Framework == 'esx' then
                    local player = GetPlayerFromId(source)
                    local money = GetItemTotalAmount(source, 'black_money')
                    player.setAccountMoney('black_money', money, 'dropped')
                end
                return true
            end
        else
            local slots = GetSlotsByItem(inventory, item, metadata)
            local amountToRemove = amount

            if not slots then return false end

            for _, _slot in pairs(slots) do
                if inventory[_slot].amount > amountToRemove then
                    if SmartphoneMetadata then
                        exports['qs-smartphone-pro']:handleDeleteItem(source, inventory[_slot])
                    end
                    TriggerEvent('esx:onRemoveInventoryItem', source, item, amount)
                    TriggerClientEvent('esx:removeInventoryItem', source, item, amount)
                    inventory[_slot].amount = inventory[_slot].amount - amountToRemove
                    if Config.Framework == 'qb' then
                        local player = GetPlayerFromId(source)
                        player.Functions.SetPlayerData('items', inventory)
                    end
                    if not ContainsItem(itemsToCheck, item) then
                        Debug("Item removed to player's inventory:", source, 'Item:', item, 'Amount:', amount)
                        TriggerClientEvent(Config.InventoryPrefix .. ':getInventory', source, inventory)
                        TriggerClientEvent(Config.InventoryPrefix .. ':client:ItemBox', source, ItemList[item], 'remove')
                    end
                    if item == 'money' and Config.Framework == 'esx' then
                        local player = GetPlayerFromId(source)
                        local money = GetItemTotalAmount(source, 'money')
                        player.setAccountMoney('money', money, 'dropped')
                    end
                    if item == 'black_money' and Config.Framework == 'esx' then
                        local player = GetPlayerFromId(source)
                        local money = GetItemTotalAmount(source, 'black_money')
                        player.setAccountMoney('black_money', money, 'dropped')
                    end
                    return true
                elseif inventory[_slot].amount == amountToRemove then
                    if SmartphoneMetadata then
                        exports['qs-smartphone-pro']:handleDeleteItem(source, inventory[_slot])
                    end
                    TriggerEvent('esx:onRemoveInventoryItem', source, item, amount)
                    TriggerClientEvent('esx:removeInventoryItem', source, item, amount)
                    inventory[_slot] = nil
                    if Config.Framework == 'qb' then
                        local player = GetPlayerFromId(source)
                        player.Functions.SetPlayerData('items', inventory)
                    end
                    if not ContainsItem(itemsToCheck, item) then
                        Debug("Item removed to player's inventory:", source, 'Item:', item, 'Amount:', amount)
                        TriggerClientEvent(Config.InventoryPrefix .. ':getInventory', source, inventory)
                        TriggerClientEvent(Config.InventoryPrefix .. ':client:ItemBox', source, ItemList[item], 'remove')
                    end
                    if item == 'money' and Config.Framework == 'esx' then
                        local player = GetPlayerFromId(source)
                        local money = GetItemTotalAmount(source, 'money')
                        player.setAccountMoney('money', money, 'dropped')
                    end
                    if item == 'black_money' and Config.Framework == 'esx' then
                        local player = GetPlayerFromId(source)
                        local money = GetItemTotalAmount(source, 'black_money')
                        player.setAccountMoney('black_money', money, 'dropped')
                    end
                    return true
                else
                    local quantity = GetItemTotalAmount(source, inventory[_slot].name)
                    local _quantity = quantity - amountToRemove
                    inventory[_slot].amount = _quantity
                    SetInventoryItems(source, inventory[_slot].name, _quantity)
                    if SmartphoneMetadata then
                        exports['qs-smartphone-pro']:handleDeleteItem(source, inventory[_slot])
                    end
                    if Config.Framework == 'qb' then
                        local player = GetPlayerFromId(source)
                        player.Functions.SetPlayerData('items', inventory)
                    end
                    if not ContainsItem(itemsToCheck, item) then
                        Debug("Item removed to player's inventory:", source, 'Item:', item, 'Amount:', amount)
                        TriggerClientEvent(Config.InventoryPrefix .. ':getInventory', source, inventory)
                        TriggerClientEvent(Config.InventoryPrefix .. ':client:ItemBox', source, ItemList[item], 'remove')
                    end
                    if item == 'money' and Config.Framework == 'esx' then
                        local player = GetPlayerFromId(source)
                        local money = GetItemTotalAmount(source, 'money')
                        player.setAccountMoney('money', money, 'dropped')
                    end
                    if item == 'black_money' and Config.Framework == 'esx' then
                        local player = GetPlayerFromId(source)
                        local money = GetItemTotalAmount(source, 'black_money')
                        player.setAccountMoney('black_money', money, 'dropped')
                    end
                    return true
                end
            end
        end
    else
        return false
    end
    return false
end

exports('RemoveItem', RemoveItem)
