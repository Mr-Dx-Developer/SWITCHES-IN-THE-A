---@diagnostic disable: duplicate-set-field
-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
-- Use this file to add support for another inventory by simply copying the file and replacing the logic within the functions
local found = GetResourceState('codem-inventory')
if found ~= 'started' and found ~= 'starting' then return end

WSB.inventory = {}
WSB.inventorySystem = 'codem-inventory'

function WSB.inventory.getItemSlot(source, itemName)
    return GetItemSlot(source, itemName) or false
end

function WSB.inventory.getItemMetadata(source, slot)
    local player = WSB.getPlayer(source)
    if not player then return end
    return exports['codem-inventory']:GetItemBySlot(source, slot).info
end

function WSB.inventory.setItemMetadata(source, slot, metadata)
    if not slot then return false end
    if not metadata then metadata = {} end

    exports['codem-inventory']:SetItemMetadata(source, slot, metadata)
end
