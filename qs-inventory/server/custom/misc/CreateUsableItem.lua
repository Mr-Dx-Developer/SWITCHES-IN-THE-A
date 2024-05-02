--[[
    Usable items that you can edit, do not add more since it is not
    necessary to do it with this method, they are the native and
    important items of the inventory, which bring some useful information.

    Please don't add more, add them in your other scripts with the
    conventional RegisterUsableItem system.
]]

if not ItemList or not WeaponList then return end

-- Documents
CreateUsableItem('driver_license', function(source, item)
    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)
    local players = FrameworkGetPlayers()
    for _, v in pairs(players) do
        v = tonumber(v)
        local targetPed = GetPlayerPed(v)
        local dist = #(playerCoords - GetEntityCoords(targetPed))
        if dist < 3.0 then
            TriggerClientEvent('chat:addMessage', v, {
                template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First Name:</strong> {1} <br><strong>Last Name:</strong> {2} <br><strong>Birth Date:</strong> {3} <br><strong>Licenses:</strong> {4}</div></div>',
                args = {
                    'Drivers License',
                    item.info.firstname,
                    item.info.lastname,
                    item.info.birthdate,
                    item.info.type
                }
            }
            )
        end
    end
end)

CreateUsableItem('id_card', function(source, item)
    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)
    local players = FrameworkGetPlayers()
    for _, v in pairs(players) do
        v = tonumber(v)
        local targetPed = GetPlayerPed(v)
        local dist = #(playerCoords - GetEntityCoords(targetPed))
        if dist < 3.0 then
            TriggerClientEvent('chat:addMessage', v, {
                template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br><strong>CBN:</strong> {1} <br><strong>First Name:</strong> {2} <br><strong>Last Name:</strong> {3} <br><strong>Birthdate:</strong> {4} <br><strong>Gender:</strong> {5} <br><strong>Nationality:</strong> {6}</div></div>',
                args = {
                    'ID Card',
                    item.info.citizenid or 'ID-Card ' .. math.random(11111, 99999),
                    item.info.firstname,
                    item.info.lastname,
                    item.info.birthdate,
                    item.info.gender or 'AH-64 Apache Helicopter',
                    item.info.nationality or 'No information',
                }
            }
            )
        end
    end
end)







-- AMMO
CreateUsableItem('pistol_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_PISTOL', 12, item)
end)

CreateUsableItem('rifle_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_RIFLE', 30, item)
end)

CreateUsableItem('smg_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_SMG', 20, item)
end)

CreateUsableItem('shotgun_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_SHOTGUN', 10, item)
end)

CreateUsableItem('mg_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_MG', 30, item)
end)

CreateUsableItem('sniper_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_SNIPER', 1, item)
end)

CreateUsableItem('emp_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_EMPLAUNCHER', 10, item)
end)

CreateUsableItem('rpg_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_RPG', 1, item)
end)

CreateUsableItem('grenadelauncher_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_GRENADELAUNCHER', 1, item)
end)

CreateUsableItem('snp_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_SNIPER', 1, item)
end)

-- TINTS
for _, tintData in pairs(Config.Tints) do
    CreateUsableItem(tintData.item, function(source, item)
        TriggerClientEvent('weapons:client:EquipAttachment', source, item, tintData.component)
    end)
end

CreateUsableItem('url_weapontint', function(source, item)
    if not item.info.urltint then
        TriggerClientEvent('weapons:client:ConfigureTint', source, item)
    else
        TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'url_weapontint')
    end
end)

-- ATTACHMENTS
CreateUsableItem('pistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('pistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('pistol_flashlight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight')
end)

CreateUsableItem('pistol_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

CreateUsableItem('pistol_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('combatpistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('combatpistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('combatpistol_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('appistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('appistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('appistol_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('pistol50_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('pistol50_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('pistol50_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('heavypistol_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('revolver_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('doubleaction_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('revolver_vipvariant', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'vipvariant')
end)

CreateUsableItem('revolver_bodyguardvariant', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'bodyguardvariant')
end)

CreateUsableItem('snspistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('snspistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('snspistol_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

CreateUsableItem('heavypistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('heavypistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('heavypistol_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

CreateUsableItem('vintagepistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('vintagepistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('combatpistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('microsmg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('microsmg_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

CreateUsableItem('microsmg_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('smg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('smg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('smg_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

CreateUsableItem('smg_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

CreateUsableItem('smg_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

CreateUsableItem('smg_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('assaultsmg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('assaultsmg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('pumpshotgun_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('sawnoffshotgun_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('assaultsmg_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('minismg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('minismg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('machinepistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('machinepistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('machinepistol_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

CreateUsableItem('combatpdw_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('combatpdw_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('combatpistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('emplauncher_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('combatpdw_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

CreateUsableItem('combatpdw_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

CreateUsableItem('combatpdw_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

CreateUsableItem('shotgun_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

CreateUsableItem('pumpshotgun_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('sawnoffshotgun_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('sniper_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('assaultshotgun_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('assaultshotgun_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('heavyshotgun_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('heavyshotgun_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('heavyshotgun_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

CreateUsableItem('assaultrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('assaultrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('assaultrifle_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

CreateUsableItem('rifle_flashlight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight')
end)

CreateUsableItem('rifle_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

CreateUsableItem('rifle_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

CreateUsableItem('sniperrifle_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

CreateUsableItem('assaultrifle_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('carbinerifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('carbinerifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('carbinerifle_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

CreateUsableItem('combatpdw_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

CreateUsableItem('carbinerifle_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

CreateUsableItem('carbinerifle_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('advancedrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('advancedrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('advancedrifle_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('specialcarbine_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('specialcarbine_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('bullpupshotgun_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('specialcarbine_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

CreateUsableItem('specialcarbine_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('bullpuprifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('bullpuprifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('bullpuprifle_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('compactrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('compactrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('compactrifle_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

CreateUsableItem('gusenberg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('gusenberg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('microsmg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('microsmg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('sniperrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('sniper_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

CreateUsableItem('snipermax_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

CreateUsableItem('sniper_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

CreateUsableItem('heavysniper_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('heavysniper_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('marksmanrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

CreateUsableItem('marksmanrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

CreateUsableItem('marksmanrifle_scope', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope')
end)

CreateUsableItem('marksmanrifle_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)

CreateUsableItem('snspistol_luxuryfinish', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish')
end)





exports['qs-inventory']:CreateUsableItem('at_clip_drum_pistol', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

exports['qs-inventory']:CreateUsableItem('at_clip_100_pistol', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, '100roundmag')
end)

exports['qs-inventory']:CreateUsableItem('at_clip_clear', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'clearroundmag')
end)

exports['qs-inventory']:CreateUsableItem('at_clip_drum_pistol', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

exports['qs-inventory']:CreateUsableItem('at_clip_100_pistol', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, '100roundmag')
end)

--[[
    -- Snippet when using an item and it is spent

    CreateUsableItem('firstaid', function(source)
        local item = GetItemByName(source, 'firstaid')
        if item.info.quality >= 10 then
            item.info.quality = item.info.quality - 10
            print("Item:", item.name, "Slot:", item.slot, "Info:", json.encode(item.info))
            SetItemMetadata(source, item.slot, item.info)

            print("You used the item. Remaining durability:", item.info.quality)
        else
            print("The item is broken, you can't use it")
        end
    end)
]]
