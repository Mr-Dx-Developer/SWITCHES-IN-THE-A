---@diagnostic disable: duplicate-set-field
-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
-- Use this file to add support for another inventory by simply copying the file and replacing the logic within the functions
local found = GetResourceState('qb-inventory')
local qsFound = GetResourceState('qs-inventory')
if found ~= 'started' and found ~= 'starting' then return end
if qsFound == 'started' or qsFound == 'starting' then return end

WSB.inventory = {}
WSB.inventorySystem = 'qb-inventory'

function WSB.inventory.getItemSlot(source, itemName)
    return GetItemSlot(source, itemName) or false
end

function WSB.inventory.getItemMetadata(source, slot)
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.Functions.GetItemBySlot(slot).info
end

function WSB.inventory.setItemMetadata(source, slot, metadata)
    if not slot then return false end
    local player = WSB.getPlayer(source)
    if not player then return end
    local item = player.Functions.GetItemBySlot(slot)
    if not item then return false end
    item.info = metadata
    player.PlayerData.items[slot] = item
    player.Functions.SetPlayerData("items", player.PlayerData.items)
    return true
end
