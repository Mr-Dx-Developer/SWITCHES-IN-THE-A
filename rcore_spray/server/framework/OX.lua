if GetResourceState('ox_inventory') == "started" or GetResourceState('ox_inventory') == "starting" then
    UseOxInventory = true
end

if UseOxInventory then
    RegisterUsableItem = function(itemName, callBack)
        exports(itemName, function(event, item, inventory, slot, data)
            callBack(inventory.id)
        end)
    end

    GetItemCount = function(serverId, name)
        local item = exports.ox_inventory:GetItem(serverId, name, nil, false)

        return item.count
    end

    RemoveInventoryItem = function(serverId, name, count)
        exports.ox_inventory:RemoveItem(serverId, name, count)
    end
end