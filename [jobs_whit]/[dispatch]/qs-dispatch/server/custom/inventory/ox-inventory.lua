if Config.InventorySystem ~= "ox-inventory" then
    return
end

function RemoveIlegalItems(playerId)
    local InventoryData = exports['ox_inventory']:GetInventoryItems(playerId)
    DebugPrint('InventoryData', InventoryData)
    for k, v in pairs(InventoryData) do
        local isIlegal = lib.table.contains(Config.Penitencial.IlegalItems, v.name)
        if isIlegal then
            DebugPrint('isIlegal', isIlegal, v.name)
            exports['ox_inventory']:RemoveItem(playerId, v.name, v.amount)
        end
    end
    DebugPrint('RemovedIlegalItems', playerId)
end

AddEventHandler("qs-dispatch:server:RemoveIlegalItems", RemoveIlegalItems)