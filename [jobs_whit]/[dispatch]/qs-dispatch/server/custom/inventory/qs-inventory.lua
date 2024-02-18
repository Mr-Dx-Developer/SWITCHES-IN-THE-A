if Config.InventorySystem ~= "qs-inventory" then
    return
end

function RemoveIlegalItems(playerId)
    local InventoryData = exports['qs-inventory']:GetInventory(playerId)
    DebugPrint('InventoryData', InventoryData)
    for k, v in pairs(InventoryData) do
        local isIlegal = lib.table.contains(Config.Penitencial.IlegalItems, v.name)
        if isIlegal then
            DebugPrint('isIlegal', isIlegal, v.name)
            exports['qs-inventory']:RemoveItem(playerId, v.name, v.amount)
        end
    end
    DebugPrint('RemovedIlegalItems', playerId)
end

AddEventHandler("qs-dispatch:server:RemoveIlegalItems", RemoveIlegalItems)


-- RegisterCommand("removeilegalitems", function(source, args, rawCommand)
--     RemoveIlegalItems(source)
-- end, false)


-- RegisterCommand("giveilegalitems", function(source, args, rawCommand)
--     for k, v in pairs(Config.Penitencial.IlegalItems) do
--         exports['qs-inventory']:AddItem(source, v, 5)
--     end
-- end, false)