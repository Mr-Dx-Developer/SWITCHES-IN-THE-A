if GetResourceState('qb-core') ~= 'started' then return end
QBCore = exports['qb-core']:GetCoreObject()
Framework = 'qb'

function GetPlayer(source)
    local src = source
    return QBCore.Functions.GetPlayer(src)
end

function RegisterUsableItem(item, cb)
    QBCore.Functions.CreateUseableItem(item, cb)
end

function HasItem(source, itemName)
    local src = source
    local player = GetPlayer(src)
    if not player then return 0 end
    local item = player.Functions.GetItemByName(itemName)
    if GetResourceState('ox_inventory') == 'started' then
        return item?.count or 0
    else
        return item?.amount or 0
    end
end

function AddItem(source, item, count, slot, metadata)
    local src = source
    local player = GetPlayer(src)
    if not player then return end
    local giveItem = player.Functions.AddItem(item, count, slot, metadata)
    local itemData = player.Functions.GetItemByName(item)
    TriggerClientEvent('inventory:client:ItemBox', src,  itemData, 'add')
    return giveItem
end

function RemoveItem(source, item, count, slot, metadata)
    local src = source
    local player = GetPlayer(src)
    if not player then return end
    local itemData = player.Functions.GetItemByName(item)
    local removeItem = player.Functions.RemoveItem(item, count, slot, metadata)
    TriggerClientEvent('inventory:client:ItemBox', src,  itemData, 'remove')
    return removeItem
end

function KickPlayer(source, reason)
    local src = source
    local player = GetPlayer(src)
    if not player then return end
    player.Functions.Kick(reason)
end
