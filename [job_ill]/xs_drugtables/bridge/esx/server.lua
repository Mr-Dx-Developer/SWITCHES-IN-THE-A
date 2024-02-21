if GetResourceState('es_extended') ~= 'started' then return end
ESX = exports['es_extended']:getSharedObject()
Framework = 'esx'

function RegisterUsableItem(item, cb)
    ESX.RegisterUsableItem(item, cb)
end

function GetPlayer(source)
    local src = source
    return ESX.GetPlayerFromId(src)
end

function HasItem(source, itemName)
    local src = source
    local player = GetPlayer(src)
    local item = player.getInventoryItem(itemName)
    if item ~= nil then
        return item.count
    else
        return 0
    end
end

function AddItem(source, item, count, slot, metadata)
    local src = source
    local player = GetPlayer(src)
    return player.addInventoryItem(item, count, metadata, slot)
end

function RemoveItem(source, item, count, slot, metadata)
    local src = source
    local player = GetPlayer(src)
    player.removeInventoryItem(item, count, metadata, slot)
end

function KickPlayer(source, reason)
    local src = source
    local player = GetPlayer(src)
    player.kick(reason)
end
