local QBCore = exports['qb-core']:GetCoreObject()
local knockedOut = false
local wait = 15
local count = 60

CreateThread(function()
    while true do
        -- DO NOT TOUCH
        -- Unless you know what your doing
        Wait(1)
        local myPed = PlayerPedId()
        PlayerData = QBCore.Functions.GetPlayerData(source)
        if  IsPedInMeleeCombat(myPed) and not (PlayerData.metadata["inlaststand"] or PlayerData.metadata["isdead"]) then
            if GetEntityHealth(myPed) < 140  then
                SetPlayerInvincible(PlayerId(), true)
                SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)

                -- Added Sounds Using Interact-Sound
                TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'heartmondead', 1.0)
                QBCore.Functions.Notify('You were knocked out!', 'error', 14000)
                -- Added Progressbar
                QBCore.Functions.Progressbar('knocked_out', 'Knocked Out', 14000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true
                    }, {}, {}, {}, function()
                        
                    end, function()
                        --
                end)
                wait = 15
                knockedOut = true
            end
        end
        if knockedOut then
            SetPlayerInvincible(PlayerId(), true)
            DisablePlayerFiring(PlayerId(), true)
            SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
            ResetPedRagdollTimer(myPed)
            -- Black Screen Effect
            --DoScreenFadeOut(100)
            --
            -- Taser Effect
            SetTimecycleModifier("REDMIST_blend")
            ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
            --
            -- DO NOT TOUCH
            -- Unless you know what your doing
            if wait >= 0 then
                count = count - 1
                if count == 0 then
                    count = 60
                    wait = wait - 1
                    SetEntityHealth(myPed, GetEntityHealth(myPed)+2)
                end
            else
                -- Black Screen Effect Clear
                --DoScreenFadeIn(100)
                --
                -- Taser Effect Clear
                SetTimecycleModifier("")
                SetTransitionTimecycleModifier("")
                StopGameplayCamShaking()
                -- DONT TOUCH
                -- Unless you know what your doing
                SetPlayerInvincible(PlayerId(), false)
                knockedOut = false
            end
        end
    end
end)