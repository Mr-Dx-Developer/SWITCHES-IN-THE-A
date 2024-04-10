local recoils = {
    [`weapon_scarsc`] = 0.1,
    [`weapon_sb181`] = 0.1,
    -- Handguns
    [`weapon_pistol`] = 0.1,
    [`weapon_pistol_mk2`] = 0.1,
    [`weapon_combatpistol`] = 0.1,
    [`weapon_appistol`] = 0.1,
    [`weapon_stungun`] = 0.1,
    [`weapon_pistol50`] = 0.1,
    [`weapon_snspistol`] = 0.1,
    [`weapon_heavypistol`] = 0.1,
    [`weapon_vintagepistol`] = 0.1,
    [`weapon_flaregun`] = 0.1,
    [`weapon_marksmanpistol`] = 0.1,
    [`weapon_revolver`] = 0.1,
    [`weapon_revolver_mk2`] = 0.1,
    [`weapon_doubleaction`] = 0.1,
    [`weapon_snspistol_mk2`] = 0.1,
    [`weapon_raypistol`] = 0.1,
    [`weapon_ceramicpistol`] = 0.1,
    [`weapon_navyrevolver`] = 0.1,
    [`weapon_gadgetpistol`] = 0.1,
    [`weapon_pistolxm3`] = 0.1,

    -- Submachine Guns
    [`weapon_microsmg`] = 0.1,
    [`weapon_smg`] = 0.1,
    [`weapon_smg_mk2`] = 0.1,
    [`weapon_assaultsmg`] = 0.1,
    [`weapon_combatpdw`] = 0.1,
    [`weapon_machinepistol`] = 0.1,
    [`weapon_minismg`] = 0.1,
    [`weapon_raycarbine`] = 0.1,
    [`weapon_tecpistol`] = 0.1,

    -- Shotguns
    [`weapon_pumpshotgun`] = 0.1,
    [`weapon_sawnoffshotgun`] = 0.1,
    [`weapon_assaultshotgun`] = 0.1,
    [`weapon_bullpupshotgun`] = 0.1,
    [`weapon_musket`] = 0.1,
    [`weapon_heavyshotgun`] = 0.1,
    [`weapon_dbshotgun`] = 0.1,
    [`weapon_autoshotgun`] = 0.1,
    [`weapon_pumpshotgun_mk2`] = 0.1,
    [`weapon_combatshotgun`] = 0.0,

    -- Assault Rifles
    [`weapon_assaultrifle`] = 0.1,
    [`weapon_assaultrifle_mk2`] = 0.1,
    [`weapon_carbinerifle`] = 0.1,
    [`weapon_carbinerifle_mk2`] = 0.1,
    [`weapon_advancedrifle`] = 0.1,
    [`weapon_specialcarbine`] = 0.1,
    [`weapon_bullpuprifle`] = 0.1,
    [`weapon_compactrifle`] = 0.1,
    [`weapon_specialcarbine_mk2`] = 0.1,
    [`weapon_bullpuprifle_mk2`] = 0.1,
    [`weapon_militaryrifle`] = 0.0,
    [`weapon_heavyrifle`] = 0.1,
    [`weapon_tacticalrifle`] = 0.1,

    -- Light Machine Guns
    [`weapon_mg`] = 0.1,
    [`weapon_combatmg`] = 0.1,
    [`weapon_gusenberg`] = 0.1,
    [`weapon_combatmg_mk2`] = 0.1,

    -- Sniper Rifles
    [`weapon_sniperrifle`] = 0.1,
    [`weapon_heavysniper`] = 0.1,
    [`weapon_marksmanrifle`] = 0.1,
    [`weapon_remotesniper`] = 1.2,
    [`weapon_heavysniper_mk2`] = 0.1,
    [`weapon_marksmanrifle_mk2`] = 0.1,
    [`weapon_precisionrifle`] = 0.1,

    -- Heavy Weapons
    [`weapon_rpg`] = 0.0,
    [`weapon_grenadelauncher`] = 1.0,
    [`weapon_grenadelauncher_smoke`] = 1.0,
    [`weapon_minigun`] = 0.1,
    [`weapon_firework`] = 0.1,
    [`weapon_railgun`] = 2.4,
    [`weapon_hominglauncher`] = 0.0,
    [`weapon_compactlauncher`] = 0.1,
    [`weapon_rayminigun`] = 0.1,



    [`weapon_fmr`] = 0.1,
    [`weapon_galilar`] = 0.1,
    [`weapon_jrbak`] = 0.1,
    [`weapon_howa_2`] = 0.1,
    [`weapon_glacier`] = 0.1,
    [`weapon_anarchy`] = 0.1,
    [`weapon_art64`] = 0.1,
    [`weapon_autosmg`] = 0.1,
    
    	-- CUSTOM WEAPONS
	[GetHashKey("weapon_ak47")] = 0.1,
	[GetHashKey("weapon_de")] = 0.1,
	[GetHashKey("weapon_fnx45")] = 0.1,
	[GetHashKey("weapon_glock17")] = 0.1,
	[GetHashKey("weapon_m4")] = 0.1,
	[GetHashKey("weapon_hk416")] = 0.1,
	[GetHashKey("weapon_mk14")] = 0.1,
	[GetHashKey("weapon_m110")] = 0.1,
	[GetHashKey("weapon_huntingrifle")] = 0.1,
	[GetHashKey("weapon_ar15")] = 0.1,
	[GetHashKey("weapon_m9")] = 0.1,
	[GetHashKey("weapon_m70")] = 0.1,
	[GetHashKey("weapon_m1911")] = 0.1,
	[GetHashKey("weapon_mac10")] = 0.1,
	[GetHashKey("weapon_uzi")] = 0.1,
	[GetHashKey("weapon_mp9")] = 0.1,
	[GetHashKey("weapon_mossberg")] = 0.1,
	[GetHashKey("weapon_remington")] = 0.1,
	[GetHashKey("weapon_scarh")] = 0.1,
}

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedShooting(ped) and not IsPedDoingDriveby(ped) then
            local _, weap = GetCurrentPedWeapon(ped)
            if recoils[weap] and recoils[weap] ~= 0 then
                local tv = 0
                if GetFollowPedCamViewMode() ~= 4 then
                    repeat
                        Wait(0)
                        local p = GetGameplayCamRelativePitch()
                        SetGameplayCamRelativePitch(p + 0.1, 0.2)
                        tv += 0.1
                    until tv >= recoils[weap]
                else
                    repeat
                        Wait(0)
                        local p = GetGameplayCamRelativePitch()
                        if recoils[weap] > 0.1 then
                            SetGameplayCamRelativePitch(p + 0.6, 1.2)
                            tv += 0.6
                        else
                            SetGameplayCamRelativePitch(p + 0.016, 0.333)
                            tv += 0.1
                        end
                    until tv >= recoils[weap]
                end
            end
        end
        Wait(0)
    end
end)