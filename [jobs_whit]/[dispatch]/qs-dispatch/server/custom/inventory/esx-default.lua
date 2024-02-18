if Config.InventorySystem ~= "esx-default" then
    return
end

function RemoveIlegalItems(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId) -- Get the Player Object
    local InventoryData = xPlayer.getInventory(true)

    -- DebugPrint('InventoryData', InventoryData)
    for k, v in pairs(InventoryData) do
        local isIlegal = lib.table.contains(Config.Penitencial.IlegalItems, k)
        if isIlegal then
            DebugPrint('isIlegal', isIlegal, k)
            xPlayer.removeInventoryItem(k, v)
        end
    end

    for _, weapon in pairs(xPlayer.getLoadout()) do
        -- DebugPrint('weapon', weapon)
        local weaponHash = weapon.name
        -- Comprueba si el hash del arma está en la lista de armas ilegales
        local isIllegal = lib.table.contains(Config.Penitencial.IlegalItems, weaponHash)

        if not isIllegal then
            isIllegal = lib.table.contains(Config.Penitencial.IlegalItems, weaponHash:lower())
        end

        -- DebugPrint('isIllegal', isIllegal, weaponHash, Config.Penitencial.IlegalItems)

        if isIllegal then
            -- Si el arma es ilegal, quítala del inventario del jugador
            xPlayer.removeWeapon(weaponHash)
            -- También puedes hacer otras acciones, como mostrar un mensaje al jugador
            TriggerClientEvent('esx:showNotification', source, '¡Tienes un arma ilegal y ha sido confiscada!')
        end
    end

    DebugPrint('RemovedIlegalItems', playerId)
end

AddEventHandler("qs-dispatch:server:RemoveIlegalItems", RemoveIlegalItems)








-- RegisterCommand("removeilegalitems", function(source, args, rawCommand)
--     RemoveIlegalItems(source)
-- end, false)