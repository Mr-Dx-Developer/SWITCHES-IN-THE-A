function SendNotification(text)
    lib.notify({ title = text, type = 'info' })
end

function ShowHelpNotification(text)
	BeginTextCommandDisplayHelp('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayHelp(0, false, true, -1)
end

function isPlayerDead()
    return LocalPlayer.state.dead or IsPlayerDead(cache.playerId)
end

function DenySale(CreatedPed)
    local ped = cache.ped
    local entity = CreatedPed

    PlayAmbientSpeech1(entity, 'GENERIC_HI', 'SPEECH_PARAMS_STANDARD')
    TriggerServerEvent('trase_dealer:server:alertpolice', GetEntityCoords(ped))

    SendNotification(Config.DenyStrings[math.random(#Config.DenyStrings)])

    if Config.Agressive.Enabled then
        SetPedCombatAbility(entity, 100)
        SetPedAlertness(entity, 3)
        SetPedAccuracy(entity, 100)
        SetPedFleeAttributes(entity, 0, false)

        if Config.Agressive.Type == 2 then -- Fight the player
            local Weapon = Config.Agressive.WeaponList[math.random(#Config.Agressive.WeaponList)]
            GiveWeaponToPed(entity, Weapon, 255, false, true)

            while not IsPedDeadOrDying(entity) and #(GetEntityCoords(ped) - GetEntityCoords(entity)) <= 7.5 and not isPlayerDead() do
                TaskShootAtEntity(entity, ped, 1000, `FIRING_PATTERN_FULL_AUTO`)
                Wait(500)
            end
        else
            TaskCombatPed(entity, ped, 0, 16)
        end
    else
        SetPedAsNoLongerNeeded(entity)
    end
end

RegisterNetEvent('trase_dealer:client:alertPD', function(coords)
	local blip = AddBlipForCoord(coords.xyz)
    SetBlipSprite(blip, 51)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 1)
    PulseBlip(blip)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Drug Sales')
    EndTextCommandSetBlipName(blip)
	ShowHelpNotification(Config.Strings['AlertPolice'])

    Wait(4 * 60000)

    RemoveBlip(blip)
end)

-- Check if it is night time or not
function isNight()
    local hour = GetClockHours()
    return hour >= 20 or hour < 6 -- Nighttime is typically from 8 PM to 6 AM
end

RegisterNetEvent('trase_dealer:client:notify', SendNotification)