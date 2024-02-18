local weapons = {
    'WEAPON_DDM4V7',
	'WEAPON_G2C',
	'WEAPON_PMR',
	'WEAPON_G19G4',
	'WEAPON_GS',
	'WEAPON_SP320',
	'WEAPON_BP',
	'WEAPON_TGLOCK',
	'WEAPON_G19X',
	'WEAPON_AWP',
	'WEAPON_TUZI',
	'WEAPON_BROOM',
	'WEAPON_TOMAHAWK',
	'WEAPON_TRIDAGGER',
	'WEAPON_SHAMMER',
    'WEAPON_DILDO',
	'WEAPON_UK',
	'WEAPON_SD',
	'WEAPON_M200',
	'WEAPON_SCAR',
	'WEAPON_552',
	'WEAPON_L1A1',
	'WEAPON_FAL',
	'WEAPON_MCX',
	'WEAPON_P2011',
	'WEAPON_P416',
	'WEAPON_HIPOINT',
	'WEAPON_DE',
	'WEAPON_AUGA1',
	'WEAPON_P90',
	'WEAPON_VESPER',
	'WEAPON_H12',
	'WEAPON_G26',
	'WEAPON_IA2',
	'WEAPON_AS50',

    'WEAPON_GLOCK19X',
	'WEAPON_GLOCK19',
	'WEAPON_GLOCK40',
	'WEAPON_GLOCK40S',
	'WEAPON_DDM4V5',
	'WEAPON_MPX',
	'WEAPON_PD509',
	'WEAPON_APS',
	'WEAPON_PPK',
	'WEAPON_PITVIPER',
	'WEAPON_BARP',
	'WEAPON_RDP',
	'WEAPON_LOK',
	'WEAPON_PLR',
	'WEAPON_XDS9',
	'WEAPON_PPS',
	'WEAPON_XDME',
	'WEAPON_SP',
	'WEAPON_GLOCK17S',
	'WEAPON_GLOCK18C',
	'WEAPON_GLOCK19S',
	'WEAPON_ARPISTOL',
	'WEAPON_GLOCK26S',
	'WEAPON_GRENADES',
	'WEAPON_M32S',
	'WEAPON_MICRODRACO',
	'WEAPON_RUGER57',
	'WEAPON_MK18',
	'WEAPON_680',
	'WEAPON_ZIPTIE',

    'WEAPON_BAR15',
	'WEAPON_AXE',
	'WEAPON_BLACKARP',
	'WEAPON_BSCAR',
	'WEAPON_THOMPSON',
	'WEAPON_BLUEGLOCKS',
	'WEAPON_CHAIR',
	'WEAPON_DMK18',
	'WEAPON_FN57',
	'WEAPON_GLOCK21',
	'WEAPON_GLOCK41',
	'WEAPON_GLOCKBEAMS',
	'WEAPON_P30L',
	'WEAPON_ILLGLOCK17',
	'WEAPON_KRISSVECTOR',
	'WEAPON_LBTARP',
	'WEAPON_MGGLOCK',
	'WEAPON_MIDASGLOCK',
	'WEAPON_M500',
	'WEAPON_P210',
	'WEAPON_RAM7',
	'WEAPON_REDARP',
	'WEAPON_REDM4A1',
	'WEAPON_R590',
	'WEAPON_SR40',
	'WEAPON_T1911',
	'WEAPON_TARP',
	'WEAPON_TGLOCK19',
	'WEAPON_TEC9S',
	'WEAPON_WOARP',
    

    'WEAPON_KNIFE',
    'WEAPON_NIGHTSTICK',
    'WEAPON_BREAD',
    'WEAPON_FLASHLIGHT',
    'WEAPON_HAMMER',
    'WEAPON_BAT',
    'WEAPON_GOLFCLUB',
    'WEAPON_CROWBAR',
    'WEAPON_BOTTLE',
    'WEAPON_DAGGER',
    'WEAPON_HATCHET',
    'WEAPON_MACHETE',
    'WEAPON_SWITCHBLADE',
    'WEAPON_BATTLEAXE',
    'WEAPON_POOLCUE',
    'WEAPON_WRENCH',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_REVOLVER',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_MICROSMG',
    'WEAPON_SMG',
    'WEAPON_ASSAULTSMG',
    'WEAPON_MINISMG',
    'WEAPON_MACHINEPISTOL',
    'WEAPON_COMBATPDW',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_SAWNOFFSHOTGUN',
    'WEAPON_ASSAULTSHOTGUN',
    'WEAPON_BULLPUPSHOTGUN',
    'WEAPON_HEAVYSHOTGUN',
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_CARBINERIFLE',
    'WEAPON_ADVANCEDRIFLE',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_COMPACTRIFLE',
    'WEAPON_MG',
    'WEAPON_COMBATMG',
    'WEAPON_GUSENBERG',
    'WEAPON_SNIPERRIFLE',
    'WEAPON_HEAVYSNIPER',
    'WEAPON_MARKSMANRIFLE',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_RPG',
    'WEAPON_STINGER',
    'WEAPON_MINIGUN',
    'WEAPON_GRENADE',
    'WEAPON_STICKYBOMB',
    'WEAPON_SMOKEGRENADE',
    'WEAPON_BZGAS',
    'WEAPON_MOLOTOV',
    'WEAPON_DIGISCANNER',
    'WEAPON_FIREWORK',
    'WEAPON_MUSKET',
    'WEAPON_STUNGUN',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_PROXMINE',
    'WEAPON_FLAREGUN',
    'WEAPON_MARKSMANPISTOL',
    'WEAPON_RAILGUN',
    'WEAPON_DBSHOTGUN',
    'WEAPON_AUTOSHOTGUN',
    'WEAPON_COMPACTLAUNCHER',
    'WEAPON_PIPEBOMB',
    'WEAPON_DOUBLEACTION',
    
	-- Custom-Weapons
	'WEAPON_uzi',
	'WEAPON_mac10',
	'WEAPON_groza',
	'WEAPON_mp9',
	'WEAPON_dp9',
	'WEAPON_browning',
	'WEAPON_dildo',
	'WEAPON_riftedge',
	'WEAPON_m4a1',
	'WEAPON_katana',
    'WEAPON_keyboard',
    'WEAPON_krambit',
    'WEAPON_gepard',
    'WEAPON_draco',
    'WEAPON_g18c',
    'WEAPON_glock22',
    'WEAPON_mp5',
    'weapon_sword',
    'WEAPON_M67',
    'WEAPON_BEANBAG',
    'WEAPON_M4',
    'WEAPON_M45A1',
}

local holstered = true
local canFire = true
local currWeapon = `WEAPON_UNARMED`
local currentHolster = nil
local currentHolsterTexture = nil
local WearingHolster = nil

local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

local function CheckWeapon(newWeap)
    for i = 1, #weapons do
        if joaat(weapons[i]) == newWeap then
            return true
        end
    end
    return false
end

local function IsWeaponHolsterable(weap)
    for i = 1, #Config.HolsterableWeapons do
        if joaat(Config.HolsterableWeapons[i]) == weap then
            return true
        end
    end
    return false
end

RegisterNetEvent('weapons:ResetHolster', function()
    holstered = true
    canFire = true
    currWeapon = `WEAPON_UNARMED`
    currentHolster = nil
    currentHolsterTexture = nil
    WearingHolster = nil
end)

RegisterNetEvent('weapons:client:DrawWeapon', function()
    if GetResourceState('qb-inventory') == 'missing' then return end -- This part is only made to work with qb-inventory, other inventories might conflict
    local sleep
    local weaponcheck = 0
    while true do
       -- if exports['VL-arcade']:isPlayerInArena() then goto skip end -- HERE
        local ped = PlayerPedId()
        sleep = 250
        if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInParachuteFreeFall(ped) and not IsPedFalling(ped) and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) then
            sleep = 0
            if currWeapon ~= GetSelectedPedWeapon(ped) then
                local pos = GetEntityCoords(ped, true)
                local rot = GetEntityHeading(ped)

                local newWeap = GetSelectedPedWeapon(ped)
                SetCurrentPedWeapon(ped, currWeapon, true)
                loadAnimDict("reaction@intimidation@1h")
                loadAnimDict("reaction@intimidation@cop@unarmed")
                loadAnimDict("rcmjosh4")
                loadAnimDict("weapons@pistol@")

                local HolsterVariant = GetPedDrawableVariation(ped, 7)
                WearingHolster = false
                for i = 1,#Config.HolsterVariant,1 do
                    if HolsterVariant == Config.HolsterVariant[i] then
                        WearingHolster = true
                    end
                end
                if CheckWeapon(newWeap) then
                    if holstered then
                        if WearingHolster then
                            --TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
                            canFire = false
                            CeaseFire()
                            currentHolster = GetPedDrawableVariation(ped, 7)
                            currentHolsterTexture = GetPedTextureVariation(ped, 7)
                            TaskPlayAnimAdvanced(ped, "rcmjosh4", "josh_leadout_cop2", pos.x, pos.y, pos.z, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
                            Wait(300)
                            SetCurrentPedWeapon(ped, newWeap, true)

                            if IsWeaponHolsterable(newWeap) then
                                SetPedComponentVariation(ped, 7, currentHolster == 156 and 163 or currentHolster == 162 and 164 or currentHolster == 166 and 165, currentHolsterTexture, 2)
                            end
                            currWeapon = newWeap
                            Wait(300)
                            ClearPedTasks(ped)
                            holstered = false
                            canFire = true
                        else
                            canFire = false
                            CeaseFire()
                            TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", pos.x, pos.y, pos.z, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
                            Wait(1000)
                            SetCurrentPedWeapon(ped, newWeap, true)
                            currWeapon = newWeap
                            Wait(1400)
                            ClearPedTasks(ped)
                            holstered = false
                            canFire = true
                        end
                    elseif newWeap ~= currWeapon and CheckWeapon(currWeapon) then
                        if WearingHolster then
                            canFire = false
                            CeaseFire()

                            TaskPlayAnimAdvanced(ped, "reaction@intimidation@cop@unarmed", "intro", pos.x, pos.y, pos.z, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
                            Wait(500)

                            if IsWeaponHolsterable(currWeapon) then
                                SetPedComponentVariation(ped, 7, currentHolster, currentHolsterTexture, 2)
                            end

                            SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
                            currentHolster = GetPedDrawableVariation(ped, 7)
                            currentHolsterTexture = GetPedTextureVariation(ped, 7)

                            TaskPlayAnimAdvanced(ped, "rcmjosh4", "josh_leadout_cop2", pos.x, pos.y, pos.z, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
                            Wait(300)
                            SetCurrentPedWeapon(ped, newWeap, true)

                            if IsWeaponHolsterable(newWeap) then
                                SetPedComponentVariation(ped, 7, currentHolster == 156 and 163 or currentHolster == 162 and 164 or currentHolster == 166 and 165, currentHolsterTexture, 2)
                            end

                            Wait(500)
                            currWeapon = newWeap
                            ClearPedTasks(ped)
                            holstered = false
                            canFire = true
                        else
                            canFire = false
                            CeaseFire()
                            TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "outro", pos.x, pos.y, pos.z, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
                            Wait(1600)
                            SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
                            TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", pos.x, pos.y, pos.z, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
                            Wait(1000)
                            SetCurrentPedWeapon(ped, newWeap, true)
                            currWeapon = newWeap
                            Wait(1400)
                            ClearPedTasks(ped)
                            holstered = false
                            canFire = true
                        end
                    else
                        if WearingHolster then
                            SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
                            currentHolster = GetPedDrawableVariation(ped, 7)
                            currentHolsterTexture = GetPedTextureVariation(ped, 7)
                            TaskPlayAnimAdvanced(ped, "rcmjosh4", "josh_leadout_cop2", pos.x, pos.y, pos.z, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
                            Wait(300)
                            SetCurrentPedWeapon(ped, newWeap, true)

                            if IsWeaponHolsterable(newWeap) then
                                SetPedComponentVariation(ped, 7, currentHolster == 156 and 163 or currentHolster == 162 and 164 or currentHolster == 166 and 165, currentHolsterTexture, 2)
                            end

                            currWeapon = newWeap
                            Wait(300)
                            ClearPedTasks(ped)
                            holstered = false
                            canFire = true
                        else
                            SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
                            TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", pos.x, pos.y, pos.z, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
                            Wait(1000)
                            SetCurrentPedWeapon(ped, newWeap, true)
                            currWeapon = newWeap
                            Wait(1400)
                            ClearPedTasks(ped)
                            holstered = false
                            canFire = true
                        end
                    end
                else
                    if not holstered and CheckWeapon(currWeapon) then
                        if WearingHolster then
                            canFire = false
                            CeaseFire()
                            TaskPlayAnimAdvanced(ped, "reaction@intimidation@cop@unarmed", "intro", pos.x, pos.y, pos.z, 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
                            Wait(500)

                            if IsWeaponHolsterable(currWeapon) then
                                SetPedComponentVariation(ped, 7, currentHolster, currentHolsterTexture, 2)
                            end

                            SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
                            ClearPedTasks(ped)
                            SetCurrentPedWeapon(ped, newWeap, true)
                            holstered = true
                            canFire = true
                            currWeapon = newWeap
                        else
                            canFire = false
                            CeaseFire()
                            TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "outro", pos.x, pos.y, pos.z, 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
                            Wait(1400)
                            SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
                            ClearPedTasks(ped)
                            SetCurrentPedWeapon(ped, newWeap, true)
                            holstered = true
                            canFire = true
                            currWeapon = newWeap
                        end
                    else
                        SetCurrentPedWeapon(ped, newWeap, true)
                        holstered = false
                        canFire = true
                        currWeapon = newWeap
                    end
                end
            end
        end
        Wait(sleep)
        if currWeapon == nil or currWeapon == `WEAPON_UNARMED` then
            weaponcheck = weaponcheck + 1
            if weaponcheck == 2 then
                break
            end
        end
        ::skip::
    end
end)

function CeaseFire()
    CreateThread(function()
        if GetResourceState('qb-inventory') == 'missing' then return end -- This part is only made to work with qb-inventory, other inventories might conflict
        while not canFire do
            DisableControlAction(0, 25, true)
            DisablePlayerFiring(PlayerId(), true)
            Wait(0)
        end
    end)
end