module 'shared/debug'
module 'shared/resource'

Version = resource.version(Bridge.InventoryName)
Bridge.Debug('Inventory', Bridge.InventoryName, Version)
 
local ox_inventory = exports[Bridge.InventoryName]
Framework.OnReady(ox_inventory, function()
    Framework.Items = {}
    for k, v in pairs(ox_inventory:Items()) do
        local item = {}
        item.name = k
        item.label = v.label
        item.description = v.description
        item.stack = v.stack
        item.weight = v.weight or 0
        item.close = v.close
        if v.weapon then item.type = 'weapon' end
        Framework.Items[v.name] = item
    end
end)

Framework.AddItem = function(inventory, item, count, metadata, slot)
    if not ox_inventory:CanCarryItem(inventory, item, count, metadata) then return false end
    local success = ox_inventory:AddItem(inventory, item, count, metadata, slot)
    return success
end

Framework.RemoveItem = function(inventory, item, count, metadata, slot)
    local success = ox_inventory:RemoveItem(inventory, item, count, metadata, slot)
    return success
end

Framework.GetItem = function(inventory, item, metadata)
    return ox_inventory:Search(inventory, 'slots', item, metadata)
end

Framework.GetItemCount = function(inventory, item, metadata)
    return ox_inventory:GetItem(inventory, item, metadata, true)
end

Framework.HasItem = function(inventory, items, count, metadata)
    if table.type(items) == 'hash' then
        for item, amount in pairs(items) do
            if ox_inventory:GetItemCount(inventory, item, nil, true) < amount then return false end
        end
        return true
    else
        return ox_inventory:GetItemCount(inventory, items, metadata, true) >= count
    end
end

Framework.GetItemMetadata = function(inventory, slot)
    return ox_inventory:GetSlot(inventory, slot)?.metadata
end

Framework.SetItemMetadata = function(inventory, slot, metadata)
    ox_inventory:SetMetadata(inventory, slot, metadata)
end

Framework.GetInventory = function(inventory)
    return ox_inventory:GetInventoryItems(inventory, false)
end

Framework.ClearInventory = function(inventory, keep)
    ox_inventory:ClearInventory(inventory, keep)
end

local stashes = {}
Framework.RegisterStash = function(name, slots, weight, owner, groups)
    if not stashes[name] then
        stashes[name] = { slots = slots, weight = weight, owner = owner, groups = groups }
    end
    ox_inventory:RegisterStash(name, name, slots, weight, owner)
end

Framework.CreateCallback(Bridge.Resource .. ':bridge:GetStash', function(source, cb, name)
    cb(stashes[name] and stashes[name] or nil)
end)

Framework.RegisterShop = function(name, data)
    exports.ox_inventory:RegisterShop(name, {
        name = data.name,
        inventory = data.items,
        groups = data.groups
    })
end

Framework.ConfiscateInventory = function(source)
    ox_inventory:ConfiscateInventory(source)
end

Framework.ReturnInventory = function(source)
    ox_inventory:ReturnInventory(source)
end