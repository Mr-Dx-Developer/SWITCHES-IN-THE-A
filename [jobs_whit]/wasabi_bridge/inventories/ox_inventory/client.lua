---@diagnostic disable: duplicate-set-field
-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

-- Use this file to add support for another inventory by simply copying the file and replacing the logic within the functions
local found = GetResourceState('ox_inventory')
if found ~= 'started' and found ~= 'starting' then return end

WSB.inventorySystem = 'ox_inventory'
WSB.inventory = {}

function WSB.inventory.openStash(data)
    -- data = {name = name, unique = true, maxWeight = maxWeight, slots = slots}
    local stashRegistered = WSB.awaitServerCallback('wasabi_bridge:registerStash', data)
    if not stashRegistered then return end

    exports.ox_inventory:openInventory('stash', data.name)
end

function WSB.inventory.openShop(data)
    --[[
data = {
    identifier = 'shop_identifier',
    name = 'Shop Name',
    inventory = {
        { name = 'item_name', price = 100 },
    }
}
]]
    local shopRegistered = WSB.awaitServerCallback('wasabi_bridge:registerShop', data)
    if not shopRegistered then return end

    exports.ox_inventory:openInventory('shop', { type = data.identifier, id = 1 })
end
