function AddItem(source, item, amount, slot, info, data, created, lastinventory)
    local originalamount <const> = tonumber(amount) or 1
    local originalslot <const> = slot
    local originalcreated <const> = created
    local originaldata <const> = data
    local originalinfo <const> = info

    if not source then return Error('Could not find [source] in AddItem.') end
    if not item then return Error('Could not find [item] in AddItem.') end

    if type(amount) == 'number' and amount < 1 then
        return error('You cannot give an item with an amount less than 1!')
    end

    TriggerClientEvent(Config.InventoryPrefix .. ':client:UpdatePlayerMoney', source, money, blackMoney, bank) -- Update money hud

    local inventory = lastinventory or inventories[source]
    local totalUsedSlots, totalWeight = GetTotalUsedSlots(source)
    local itemInfo = ItemList[item:lower()]
    local time = os.time()

    if itemInfo then
        if not created then
            itemInfo['created'] = time
        else
            itemInfo['created'] = created
        end

        if not itemInfo then
            TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_MISSING_ITEM'), 'error')
            return false
        end

        amount = tonumber(amount) or 1
        slot = tonumber(slot) or GetFirstSlotByItem(inventory, item)
        info = info or {}
        itemInfo['created'] = created or time

        if type(info) ~= 'table' then
            info = {}
        end

        info.quality = info.quality or 100

        if data then
            info.showItemData = true
            itemInfo['unique'] = true
        end

        if itemInfo['type'] == 'weapon' then
            info.serie = info.serie or CreateSerialNumber()
            info.quality = info.quality or 100
        end

        if notStoredItems(item, source) then
            TriggerClientEvent(Config.InventoryPrefix .. ':client:forceCloseInventory', source)
            return TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_CANT_TAKE_MORE') .. ' ' .. itemInfo['label'], 'inform')
        end

        local newWeight = (totalWeight + (itemInfo['weight'] * amount))
        if Config.DropItemWhenInventoryFull then
            if totalUsedSlots > Config.InventoryWeight.slots or newWeight > Config.InventoryWeight.weight then
                DropItem(source, { name = itemInfo['name'], amount = amount, info = info or '', label = itemInfo['label'], description = itemInfo['description'] or '', weight = itemInfo['weight'], type = itemInfo['type'], unique = itemInfo['unique'], useable = itemInfo['useable'], image = itemInfo['image'], shouldClose = itemInfo['shouldClose'], slot = slot, combinable = itemInfo['combinable'], created = itemInfo['created'] }, amount)
                return true
            end
        end

        if newWeight <= Config.InventoryWeight.weight then
            if (slot and inventory[slot]) and (inventory[slot].name:lower() == item:lower()) and (itemInfo['type'] == 'item' and not itemInfo['unique']) then
                inventory[slot].amount = inventory[slot].amount + amount
                TriggerEvent('esx:onAddInventoryItem', source, item, amount)
                TriggerClientEvent('esx:addInventoryItem', source, item, amount)
                if Config.Framework == 'qb' then
                    local player = GetPlayerFromId(source)
                    player.Functions.SetPlayerData('items', inventory)
                end
                if inventory[slot] and inventory[slot].name == 'money' and Config.Framework == 'esx' then
                    local player = GetPlayerFromId(source)
                    local money = GetItemTotalAmount(source, 'money')
                    player.setAccountMoney('money', money, 'dropped')
                end
                if inventory[slot] and inventory[slot].name == 'black_money' and Config.Framework == 'esx' then
                    local player = GetPlayerFromId(source)
                    local money = GetItemTotalAmount(source, 'black_money')
                    player.setAccountMoney('black_money', money, 'dropped')
                end
                if not ContainsItem(itemsToCheck, inventory[slot].name) then
                    Debug("Item added to player's inventory:", source, 'Item:', inventory[slot].name, 'Amount:', inventory[slot].amount)
                    TriggerClientEvent(Config.InventoryPrefix .. ':getInventory', source, inventory)
                    TriggerClientEvent(Config.InventoryPrefix .. ':client:ItemBox', source, ItemList[inventory[slot].name], 'add')
                end
                return true
            elseif not itemInfo['unique'] and slot or slot and inventory[slot] == nil then
                inventory[slot] = { name = itemInfo['name'], amount = amount, info = info or '', label = itemInfo['label'], description = itemInfo['description'] or '', weight = itemInfo['weight'], type = itemInfo['type'], unique = itemInfo['unique'], useable = itemInfo['useable'], image = itemInfo['image'], shouldClose = itemInfo['shouldClose'], slot = slot, combinable = itemInfo['combinable'], created = itemInfo['created'] }
                TriggerEvent('esx:onAddInventoryItem', source, item, amount)
                TriggerClientEvent('esx:addInventoryItem', source, item, amount)
                if Config.Framework == 'qb' then
                    local player = GetPlayerFromId(source)
                    player.Functions.SetPlayerData('items', inventory)
                end
                if inventory[slot] and inventory[slot].name == 'money' and Config.Framework == 'esx' then
                    local player = GetPlayerFromId(source)
                    local money = GetItemTotalAmount(source, 'money')
                    player.setAccountMoney('money', money, 'dropped')
                end
                if inventory[slot] and inventory[slot].name == 'black_money' and Config.Framework == 'esx' then
                    local player = GetPlayerFromId(source)
                    local money = GetItemTotalAmount(source, 'black_money')
                    player.setAccountMoney('black_money', money, 'dropped')
                end
                if not ContainsItem(itemsToCheck, inventory[slot].name) then
                    Debug("Item added to player's inventory:", source, 'Item:', inventory[slot].name, 'Amount:', inventory[slot].amount)
                    TriggerClientEvent(Config.InventoryPrefix .. ':getInventory', source, inventory)
                    TriggerClientEvent(Config.InventoryPrefix .. ':client:ItemBox', source, ItemList[inventory[slot].name], 'add')
                end
                return true
            elseif itemInfo['unique'] or (not slot or slot == nil) or itemInfo['type'] == 'weapon' then
                for i = 1, Config.InventoryWeight.slots, 1 do
                    if inventory[i] == nil then
                        TriggerEvent('esx:onAddInventoryItem', source, item, amount)
                        TriggerClientEvent('esx:addInventoryItem', source, item, amount)
                        inventory[i] = { name = itemInfo['name'], amount = 1, info = info or '', label = itemInfo['label'], description = itemInfo['description'] or '', weight = itemInfo['weight'], type = itemInfo['type'], unique = itemInfo['unique'], useable = itemInfo['useable'], image = itemInfo['image'], shouldClose = itemInfo['shouldClose'], slot = i, combinable = itemInfo['combinable'], created = itemInfo['created'] }
                        if inventory[slot] and inventory[slot].name == 'money' and Config.Framework == 'esx' then
                            local player = GetPlayerFromId(source)
                            local money = GetItemTotalAmount(source, 'money')
                            player.setAccountMoney('money', money, 'dropped')
                        end
                        if inventory[slot] and inventory[slot].name == 'black_money' and Config.Framework == 'esx' then
                            local player = GetPlayerFromId(source)
                            local money = GetItemTotalAmount(source, 'black_money')
                            player.setAccountMoney('black_money', money, 'dropped')
                        end
                        if Config.Framework == 'qb' then
                            local player = GetPlayerFromId(source)
                            player.Functions.SetPlayerData('items', inventory)
                        end
                        if not ContainsItem(itemsToCheck, inventory[i].name) then
                            Debug("Item added to player's inventory:", source, 'Item:', inventory[i].name, 'Amount:', inventory[i].amount)
                            TriggerClientEvent(Config.InventoryPrefix .. ':getInventory', source, inventory)
                            TriggerClientEvent(Config.InventoryPrefix .. ':client:ItemBox', source, ItemList[inventory[i].name], 'add')
                        end

                        local nextAmmount <const> = originalamount - 1
                        if nextAmmount > 0 then
                            AddItem(source, item, nextAmmount, originalslot, originalinfo, originaldata, originalcreated, inventory)
                        end
                        return true
                    end
                end
            end
        else
            if Config.DropItemWhenInventoryFull then
                DropItem(source, { name = itemInfo['name'], amount = amount, info = info or '', label = itemInfo['label'], description = itemInfo['description'] or '', weight = itemInfo['weight'], type = itemInfo['type'], unique = itemInfo['unique'], useable = itemInfo['useable'], image = itemInfo['image'], shouldClose = itemInfo['shouldClose'], slot = slot, combinable = itemInfo['combinable'], created = itemInfo['created'] }, amount)
                return true
            end
        end
    end
    return false
end

exports('AddItem', AddItem)
