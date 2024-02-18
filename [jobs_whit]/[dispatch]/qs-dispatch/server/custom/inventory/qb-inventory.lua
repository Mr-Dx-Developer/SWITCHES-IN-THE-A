if Config.InventorySystem ~= "qb-inventory" then
    return
end

function RemoveIlegalItems(playerId)
    local xPlayer = QBCore.Functions.GetPlayer(playerId)

    if xPlayer then
        local illegalItems = Config.Penitencial.IlegalItems

        for _, itemName in pairs(illegalItems) do
            local item = xPlayer.Functions.GetItemByName(itemName)

            if item then
                xPlayer.Functions.RemoveItem(itemName, item.amount) -- Elimina todos los items del mismo tipo
                TriggerClientEvent('QBCore:Notify', playerId, "Has perdido " .. item.amount .. "x " .. itemName, "error")
            end
        end
    end
end

AddEventHandler("qs-dispatch:server:RemoveIlegalItems", RemoveIlegalItems)


-- RegisterCommand("removeilegalitems", function(source, args, rawCommand)
--     RemoveIlegalItems(source)
-- end, false)


-- RegisterCommand("giveilegalitems", function(source, args, rawCommand)
--     for k, v in pairs(Config.Penitencial.IlegalItems) do
--         exports['qb-inventory']:AddItem(source, v, 3)
--     end
-- end, false)
