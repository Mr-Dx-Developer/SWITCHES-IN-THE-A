if Config.UseStress then
    local stress = 0
    RegisterNetEvent('hud:client:UpdateStress', function(newStress) -- Add this event with adding stress elsewhere
        stress = newStress
        SendNUIMessage({ type="set_status", statustype = "stress", value = newStress})
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
    CreateThread(function() -- Speeding
        if Config.AddStress["on_fastdrive"].enable  then
            while true do
                local ped = playerPed
                if IsPedInAnyVehicle(ped, false) then
                    local speed = GetEntitySpeed(GetVehiclePedIsIn(ped, false)) * speedMultiplier
                    local stressSpeed = 110
                    if speed >= stressSpeed then
                        TriggerServerEvent('hud:server:GainStress', math.random(Config.AddStress["on_fastdrive"].min, Config.AddStress["on_fastdrive"].max))
                    end
                end
             Wait(10000)
            end
        end
     
    end)
    
    CreateThread(function() -- Shooting
        if Config.AddStress["on_shoot"].enable  then
            while true do
                local ped = playerPed
                local weapon = GetSelectedPedWeapon(ped)
                if weapon ~= `WEAPON_UNARMED` then
                    if IsPedShooting(ped) then
                        if math.random() < 0.15 and not IsWhitelistedWeaponStress(weapon) then
                            TriggerServerEvent('hud:server:GainStress', math.random(Config.AddStress["on_shoot"].min, Config.AddStress["on_shoot"].max))
                        end
                    end
                else
                    Wait(900)
                end
                Wait(8)
            end

        end
   
    end)
    
    CreateThread(function()
        while true do
            local ped = playerPed
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
    
end


RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function()
    if Config.RemoveStress["on_eat"].enable then
        local val = math.random(Config.RemoveStress["on_eat"].min, Config.RemoveStress["on_eat"].max)
        TriggerServerEvent('hud:server:RelieveStress', val)
    end
end)

RegisterNetEvent('consumables:client:Eat')
AddEventHandler('consumables:client:Eat', function()
    if Config.RemoveStress["on_eat"].enable then
        local val = math.random(Config.RemoveStress["on_eat"].min, Config.RemoveStress["on_eat"].max)
        TriggerServerEvent('hud:server:RelieveStress', val)
    end
end)


RegisterNetEvent('consumables:client:Drink')
AddEventHandler('consumables:client:Drink', function()
    if Config.RemoveStress["on_drink"].enable then
        local val = math.random(Config.RemoveStress["on_drink"].min, Config.RemoveStress["on_drink"].max)
        TriggerServerEvent('hud:server:RelieveStress', val)
    end
end)
RegisterNetEvent('consumables:client:DrinkAlcohol')
AddEventHandler('consumables:client:DrinkAlcohol', function()
    if Config.RemoveStress["on_drink"].enable then
        local val = math.random(Config.RemoveStress["on_drink"].min, Config.RemoveStress["on_drink"].max)
        TriggerServerEvent('hud:server:RelieveStress', val)
    end
end)

RegisterNetEvent('devcore_needs:client:StartEat')
AddEventHandler('devcore_needs:client:StartEat', function()
    if Config.RemoveStress["on_eat"].enable then
        local val = math.random(Config.RemoveStress["on_eat"].min, Config.RemoveStress["on_eat"].max)
        TriggerServerEvent('hud:server:RelieveStress', val)
    end
end)
RegisterNetEvent('devcore_needs:client:DrinkShot')
AddEventHandler('devcore_needs:client:DrinkShot', function()
    if Config.RemoveStress["on_drink"].enable then
        local val = math.random(Config.RemoveStress["on_drink"].min, Config.RemoveStress["on_drink"].max)
        TriggerServerEvent('hud:server:RelieveStress', val)
    end
end)

RegisterNetEvent('devcore_needs:client:StartDrink')
AddEventHandler('devcore_needs:client:StartDrink', function()
    if Config.RemoveStress["on_drink"].enable then
        local val = math.random(Config.RemoveStress["on_drink"].min, Config.RemoveStress["on_drink"].max)
        TriggerServerEvent('hud:server:RelieveStress', val)
    end
end)

RegisterNetEvent('esx_optionalneeds:onDrink')
AddEventHandler('esx_optionalneeds:onDrink', function()
    if Config.RemoveStress["on_drink"].enable then
        local val = math.random(Config.RemoveStress["on_drink"].min, Config.RemoveStress["on_drink"].max)
        TriggerServerEvent('hud:server:RelieveStress', val)
    end
end)


RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function()
    if Config.RemoveStress["on_drink"].enable then
        local val = math.random(Config.RemoveStress["on_drink"].min, Config.RemoveStress["on_drink"].max)
        TriggerServerEvent('hud:server:RelieveStress', val)
    end
end)

AddEventHandler('esx:onPlayerDeath', function() 
    TriggerServerEvent('hud:server:RelieveStress', 10000)
end)

RegisterNetEvent('hospital:client:RespawnAtHospital')
AddEventHandler('hospital:client:RespawnAtHospital', function() 
    TriggerServerEvent('hud:server:RelieveStress', 10000)
end)

Citizen.CreateThread(function()
    if Config.RemoveStress["on_swimming"].enable then
        while true do
            Citizen.Wait(10000)
            if IsPedSwimming(playerPed) then
                local val = math.random(Config.RemoveStress["on_swimming"].min, Config.RemoveStress["on_swimming"].max)
                TriggerServerEvent('hud:server:RelieveStress', val)
            end
        end
    end
end)

Citizen.CreateThread(function()
    if Config.RemoveStress["on_running"].enable then
        while true do
            Citizen.Wait(10000)
            if IsPedRunning(playerPed) then
                local val = math.random(Config.RemoveStress["on_running"].min, Config.RemoveStress["on_running"].max)
                TriggerServerEvent('hud:server:RelieveStress', val)
            end
        end
    end
end)

