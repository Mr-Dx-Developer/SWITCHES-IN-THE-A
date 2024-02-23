if Config.EnableStress then
    local stress = 0
    RegisterNetEvent('hud:client:UpdateStress', function(newStress) -- Add this event with adding stress elsewhere
        stress = newStress
        SetStatus("stress", stress)
    end)
    function IsWhitelistedWeaponStress(weapon)
        if weapon then
            for _, v in pairs(Config.WhitelistedWeaponStress) do
                if weapon == v then
                    return true
                end
            end
        end
        return false
    end
   
    for _,data in pairs(Config.AddStress) do
        if data.enable then

            data.func()
        end
    end
    for _,data in pairs(Config.RemoveStress) do
        if data.enable then
            data.func()
        end
    end
    CreateThread(function()
        while true do
            local ped = PlayerPed
            if stress >= 100 then
    
                local ShakeIntensity = GetShakeIntensity(stress)
                local FallRepeat = math.random(2, 4)
                local RagdollTimeout = (FallRepeat * 1750)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
                SetFlash(0, 0, 500, 3000, 500)
    
                if not IsPedRagdoll(ped) and IsPedOnFoot(ped) and not IsPedSwimming(ped) then
                    SetPedToRagdollWithFall(ped, RagdollTimeout, RagdollTimeout, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
                end
    
                Wait(500)
                for i=1, FallRepeat, 1 do
                    Wait(750)
                    DoScreenFadeOut(200)
                    Wait(1000)
                    DoScreenFadeIn(200)
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
                    SetFlash(0, 0, 200, 750, 200)
                end
            elseif stress >= 50 then
                local ShakeIntensity = GetShakeIntensity(stress)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
                SetFlash(0, 0, 500, 2500, 500)
            end
            Wait(GetEffectInterval(stress))
        end
    end)
    
    function GetShakeIntensity(stresslevel)
        local retval = 0.05
        local Intensity = {
            ["shake"] = {
                [1] = {
                    min = 50,
                    max = 60,
                    intensity = 0.12,
                },
                [2] = {
                    min = 60,
                    max = 70,
                    intensity = 0.17,
                },
                [3] = {
                    min = 70,
                    max = 80,
                    intensity = 0.22,
                },
                [4] = {
                    min = 80,
                    max = 90,
                    intensity = 0.28,
                },
                [5] = {
                    min = 90,
                    max = 100,
                    intensity = 0.32,
                },
            }
        }
        for k, v in pairs(Intensity['shake']) do
            if stresslevel >= v.min and stresslevel <= v.max then
                retval = v.intensity
                break
            end
        end
        return retval
    end
    
    function GetEffectInterval(stresslevel)
        local EffectInterval = {
            [1] = {
                min = 50,
                max = 60,
                timeout = math.random(14000, 15000)
            },
            [2] = {
                min = 60,
                max = 70,
                timeout = math.random(12000, 13000)
            },
            [3] = {
                min = 70,
                max = 80,
                timeout = math.random(10000, 11000)
            },
            [4] = {
                min = 80,
                max = 90,
                timeout = math.random(8000, 9000)
            },
            [5] = {
                min = 90,
                max = 100,
                timeout = math.random(6000, 7000)
            }
        }
        local retval = 10000
        for k, v in pairs(EffectInterval) do
            if stresslevel >= v.min and stresslevel <= v.max then
                retval = v.timeout
                break
            end
        end
        return retval
    end
else
    CreateThread(function()
        WaitCore()
        WaitPlayer()
        WaitNUI()
        SetStatus("stress", 0)
    end)
end







