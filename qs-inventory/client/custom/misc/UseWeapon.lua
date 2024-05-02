RegisterNetEvent(Config.InventoryPrefix .. ':client:UseWeapon', function(weaponData, shootbool)
    if FiringWeapon then
        SendTextMessage(Lang('INVENTORY_NOTIFICATION_STOP_FIRING'), 'error')
        return false
    end
    local ped = PlayerPedId()
    local weaponName = tostring(weaponData.name)
    local weaponHash = joaat(weaponData.name)
    for i = 1, #Config.WeaponTints do
        if tostring(GetHashKey(weaponName)) == Config.WeaponTints[i].hash then
            AddReplaceTexture(Config.WeaponTints[i].ytd, Config.WeaponTints[i].texture, Config.WeaponTints[i].ytd, Config.WeaponTints[i].texture)
            break
        end
    end
    if currentWeapon == weaponName then
        TriggerEvent('weapons:client:DrawWeapon', nil)
        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(ped, true)
        TriggerEvent('weapons:client:SetCurrentWeapon', nil, shootbool)
        currentWeapon = nil
    elseif weaponName == 'weapon_stickybomb' or weaponName == 'weapon_pipebomb' or weaponName == 'weapon_smokegrenade' or weaponName == 'weapon_flare' or weaponName == 'weapon_proxmine' or weaponName == 'weapon_ball' or weaponName == 'weapon_molotov' or weaponName == 'weapon_grenade' or weaponName == 'weapon_bzgas' then
        TriggerEvent('weapons:client:DrawWeapon', weaponName)
        GiveWeaponToPed(ped, weaponHash, 1, false, false)
        SetPedAmmo(ped, weaponHash, 1)
        SetCurrentPedWeapon(ped, weaponHash, true)
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        TriggerServerEvent(Config.InventoryPrefix .. ':server:RemoveItem', weaponName, 1)
        currentWeapon = weaponName
    elseif weaponName == 'weapon_snowball' then
        TriggerEvent('weapons:client:DrawWeapon', weaponName)
        GiveWeaponToPed(ped, weaponHash, 10, false, false)
        SetPedAmmo(ped, weaponHash, 10)
        SetCurrentPedWeapon(ped, weaponHash, true)
        TriggerServerEvent(Config.InventoryPrefix .. ':server:snowball', 'remove')
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
    elseif weaponName == 'weapon_petrolcan' then
        GiveWeaponToPed(ped, weaponHash, 10, false, false)
        SetPedAmmo(ped, weaponHash, weaponData.info.ammo or 4500)
        SetCurrentPedWeapon(ped, weaponHash, true)
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
    else
        TriggerEvent('weapons:client:DrawWeapon', weaponName)
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        local ammo = tonumber(weaponData.info.ammo) or 0

        if weaponName == 'weapon_petrolcan' or weaponName == 'weapon_fireextinguisher' then
            ammo = 4000
        end

        GiveWeaponToPed(ped, weaponHash, ammo, false, false)
        SetPedAmmo(ped, weaponHash, ammo)
        SetCurrentPedWeapon(ped, weaponHash, true)

        if weaponData.info.attachments then
            for _, attachment in pairs(weaponData.info.attachments) do
                if attachment.tint then
                    if attachment.urltint ~= 'none' then
                        ChangeWeaponTintWithUrl(weaponHash, attachment.urltint)
                    else
                        SetPedWeaponTintIndex(ped, weaponHash, attachment.tint)
                    end
                else
                    GiveWeaponComponentToPed(ped, weaponHash, joaat(attachment.component))
                end
            end
        end

        currentWeapon = weaponName
    end
end)
