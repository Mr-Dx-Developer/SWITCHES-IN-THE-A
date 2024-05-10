---@diagnostic disable: duplicate-set-field
-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
-- Use this file to add support for another inventory by simply copying the file and replacing the logic within the functions
local found = GetResourceState('ox_inventory')
if found ~= 'started' and found ~= 'starting' then return end

WSB.inventorySystem = 'ox_inventory'
WSB.inventory = {}

local registeredStashes = {}
local registeredShops = {}

function WSB.inventory.getItemSlot(source, item)
    return exports.ox_inventory:GetSlotIdWithItem(source, item) or false
end

function WSB.inventory.getItemMetadata(source, slot)
    local item = exports.ox_inventory:GetSlot(source, slot)
    return item.metadata
end

function WSB.inventory.setItemMetadata(source, slot, metadata)
    return exports.ox_inventory:SetMetadata(source, slot, metadata)
end

WSB.registerCallback('wasabi_bridge:registerStash', function(_source, cb, data)
    if registeredStashes[data.name] then
        cb(true)
        return
    end
    exports.ox_inventory:RegisterStash(data.name, data.name, data.slots, data.maxWeight, data.unique or false, nil, nil)
    registeredStashes[data.name] = true
    cb(true)
end)

WSB.registerCallback('wasabi_bridge:registerShop', function(_source, cb, data)
    if registeredShops[data.identifier] then
        cb(true)
        return
    end

    exports.ox_inventory:RegisterShop(data.identifier, {
        name = data.name,
        inventory = data.inventory,
        locations = data.locations
    })
    cb(true)
end)
