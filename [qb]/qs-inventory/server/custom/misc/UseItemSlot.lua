RegisterNetEvent(Config.InventoryPrefix .. ':server:UseItemSlot', function(slot)
    local src = source
    local itemData = GetItemBySlot(src, slot)
    if not itemData or not Config.UsableItemsFromHotbar then return end

    local isBlocked = false
    for _, blockedItem in ipairs(Config.BlockedItemsHotbar) do
        if blockedItem == itemData.name then
            isBlocked = true
            break
        end
    end

    if isBlocked then
        Debug('The [' .. itemData.name .. '] item cannot be used from hotbar, check Config.BlockedItemsHotbar!')
        TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_CANNOT_BE_USED'), 'inform')
        return
    end

    useItemSlot(src, itemData)
end)
