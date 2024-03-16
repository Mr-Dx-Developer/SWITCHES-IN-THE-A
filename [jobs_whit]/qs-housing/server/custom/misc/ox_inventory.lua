if Config.Inventory ~= 'ox_inventory' then return end

function GetItem(player, item)
    return exports.ox_inventory:GetItem(player.source, item, nil, false)
end

function GetItemCount(item, player)
    return exports.ox_inventory:GetItem(player.source, item.name, nil, true)
end

function AddItem(player, item, count)
    exports.ox_inventory:AddItem(player.source, item, count)
end

function RemoveItem(player, item, count)
    exports.ox_inventory:RemoveItem(player.source, item, count)
end