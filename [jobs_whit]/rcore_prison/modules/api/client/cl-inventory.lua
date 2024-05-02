AddEventHandler('rcore_prison:client:heartbeat', function(actionType, data)
    local actionType = actionType

    if actionType == 'firstSpawn' then
        local plyPed = PlayerPedId()

        if HasResource('qs-inventory') then
            GiveWeaponToPed(plyPed, `WEAPON_UNARMED`, 0, false, true)
            SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
            RemoveAllPedWeapons(plyPed, true)
        elseif HasResource('es_extended') then
            GiveWeaponToPed(plyPed, `WEAPON_UNARMED`, 0, false, true)
            SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)
            RemoveAllPedWeapons(plyPed, true)
        end
    end
end)