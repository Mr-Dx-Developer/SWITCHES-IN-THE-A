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
        item.image = k .. '.png'
        if v.client and v.client.image then 
            item.image = (v.client.image):gsub(('nui://%s/web/images/'):format(Bridge.InventoryName), "")
        end
        if v.weapon then item.type = 'weapon' end
        Framework.Items[v.name] = item
    end
end)

Framework.OpenStash = function(name)
    Framework.TriggerCallback(Bridge.Resource .. ':bridge:GetStash', function(stash)
        if not stash then return end
        local isAllowed = false
        if stash.groups and Framework.HasJob(stash.groups, Framework.Player) then isAllowed = true end
        if stash.groups and Framework.HasGang(stash.groups, Framework.Player) then isAllowed = true end
        if stash.groups and not isAllowed then return end
        ox_inventory:openInventory('stash', name)
    end, name)
end

Framework.OpenShop = function(name)
    ox_inventory:openInventory('shop', { type = name, id = 1 })
end

Framework.CloseInventory = function()
    ox_inventory:closeInventory()
end

Framework.GetItem = function(item, metadata)
    return ox_inventory:Search('slots', item, metadata)
end

Framework.HasItem = function(items, count, metadata)
    if table.type(items) == 'hash' then
        for item, amount in pairs(items) do
            if ox_inventory:GetItemCount(item, metadata, true) < amount then return false end
        end
        return true
    else
        return ox_inventory:GetItemCount(items, metadata, true) >= (count or 1)
    end
end

Framework.LockInventory = function()
    LocalPlayer.state:set('invBusy', true, false)
end

Framework.UnlockInventory = function()
    LocalPlayer.state:set('invBusy', false, false)
end
