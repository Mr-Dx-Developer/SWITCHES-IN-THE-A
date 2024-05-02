function AddToStash(stashId, slot, otherslot, itemName, amount, info, created)
    amount = tonumber(amount) or 1
    local ItemData = ItemList[itemName]
    if not ItemData.unique then
        if Stashes[stashId].items[slot] and Stashes[stashId].items[slot].name == itemName then
            if notStoredItems(itemName, source) then
                return
            end
            Stashes[stashId].items[slot].amount = Stashes[stashId].items[slot].amount + amount
        else
            local itemInfo = ItemList[itemName:lower()]
            Stashes[stashId].items[slot] = {
                name = itemInfo['name'],
                amount = amount,
                info = info or '',
                label = item?.info?.label or itemInfo['label'],
                description = itemInfo['description'] or '',
                weight = itemInfo['weight'],
                type = itemInfo['type'],
                unique = itemInfo['unique'],
                useable = itemInfo['useable'],
                image = itemInfo['image'],
                created = created,
                slot = slot,
            }
        end
    else
        if Stashes[stashId].items[slot] and Stashes[stashId].items[slot].name == itemName then
            local itemInfo = ItemList[itemName:lower()]
            Stashes[stashId].items[otherslot] = {
                name = itemInfo['name'],
                amount = amount,
                info = info or '',
                label = item?.info?.label or itemInfo['label'],
                description = itemInfo['description'] or '',
                weight = itemInfo['weight'],
                type = itemInfo['type'],
                unique = itemInfo['unique'],
                useable = itemInfo['useable'],
                image = itemInfo['image'],
                created = created,
                slot = otherslot,
            }
        else
            local itemInfo = ItemList[itemName:lower()]
            Stashes[stashId].items[slot] = {
                name = itemInfo['name'],
                amount = amount,
                info = info or '',
                label = item?.info?.label or itemInfo['label'],
                description = itemInfo['description'] or '',
                weight = itemInfo['weight'],
                type = itemInfo['type'],
                unique = itemInfo['unique'],
                useable = itemInfo['useable'],
                image = itemInfo['image'],
                created = created,
                slot = slot,
            }
        end
    end
end

exports('AddToStash', AddToStash)
