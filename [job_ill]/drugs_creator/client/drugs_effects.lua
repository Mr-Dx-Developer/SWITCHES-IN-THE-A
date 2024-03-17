DrugsCreator.allEffects = {}
DrugsCreator.activeEffects = {}

local function startTimecycle(timecycleName, maxTimecycleStrenght)
    maxTimecycleStrenght = maxTimecycleStrenght or 1.0

    local time = 10000 -- Time to reach max strenght
    local interval = 100 -- Strenght increases each interval

    local streghtToAddEachInterval = maxTimecycleStrenght / (time/interval)

    local timecycleStrength = 0.0

    SetTimecycleModifier(timecycleName)
    
    while time >= 0 do
        SetTimecycleModifierStrength(timecycleStrength)
        Citizen.Wait(interval)
        time = time - interval

        timecycleStrength = timecycleStrength + streghtToAddEachInterval
    end
end

local function startShakingGameplayCam(shakeName, maxAmplitude)
    local time = 10000
    local interval = 100

    local streghtToAddEachInterval = maxAmplitude / (time/interval)

    local amplitude = 0.0
    ShakeGameplayCam(shakeName, amplitude)

    while time >= 0 do
        SetGameplayCamShakeAmplitude(amplitude)

        Citizen.Wait(interval)
        time = time - interval

        amplitude = amplitude + streghtToAddEachInterval
    end
end

DrugsCreator.allEffects.pink_visual = function(duration)
    local effectName = "visual_color"
    
    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local timer = 0

        local currentTimecycle = GetTimecycleModifierIndex()

        local timecycleName = "drug_flying_02"
        local timecycleStrenght = 1.0

        startTimecycle(timecycleName, timecycleStrenght)

        while timer <= DrugsCreator.activeEffects[effectName] do
            if(GetTimecycleModifierIndex() == -1 or GetTimecycleModifierIndex() == currentTimecycle) then
                SetTimecycleModifier(timecycleName)
                SetTimecycleModifierStrength(timecycleStrenght)
            end
            
            Citizen.Wait(1000)
            timer = timer + 1000
        end

        ClearTimecycleModifier()
        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end

DrugsCreator.allEffects.visual_shaking = function(duration) 
    local effectName = "visual_shaking"

    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local shakeName = "FAMILY5_DRUG_TRIP_SHAKE"
        local shakeStrenght = 0.6

        startShakingGameplayCam(shakeName, shakeStrenght)

        local timer = 0

        while timer <= DrugsCreator.activeEffects[effectName] do
            if(not IsGameplayCamShaking()) then
                ShakeGameplayCam(shakeName, shakeStrenght)
            end

            Citizen.Wait(1000)
            timer = timer + 1000
        end

        StopGameplayCamShaking()
        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end

DrugsCreator.allEffects.drunk_walk = function(duration) 
    local effectName = "drunk_walk"
    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local plyPed = PlayerPedId()

        local timer = 0

        local animSet = "move_m@drunk@moderatedrunk"
        local transitionSpeed = 5.0

        RequestAnimSet(animSet)

        while not HasAnimSetLoaded(animSet) do
            Citizen.Wait(0)
        end
        
        while timer <= DrugsCreator.activeEffects[effectName] do
            SetPedMovementClipset(plyPed, animSet, transitionSpeed)

            Citizen.Wait(1000)
            timer = timer + 1000
        end

        ResetPedMovementClipset(plyPed, transitionSpeed)
        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end

DrugsCreator.allEffects.green_visual = function(duration)
    local effectName = "visual_color"

    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local timer = 0

        local currentTimecycle = GetTimecycleModifierIndex()
        
        local timecycleName = "stoned"
        local timecycleStrenght = 0.54

        startTimecycle(timecycleName, timecycleStrenght)

        while timer <= DrugsCreator.activeEffects[effectName] do
            if(GetTimecycleModifierIndex() == -1 or GetTimecycleModifierIndex() == currentTimecycle) then
                SetTimecycleModifier(timecycleName)
                SetTimecycleModifierStrength(timecycleStrenght)
            end
            
            Citizen.Wait(1000)
            timer = timer + 1000
        end

        ClearTimecycleModifier()
        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end

DrugsCreator.allEffects.confused_visual = function(duration)
    local effectName = "visual_color"

    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local timer = 0

        local currentTimecycle = GetTimecycleModifierIndex()

        local timecycleName = "drug_wobbly"
        local timecycleStrenght = 1.0

        startTimecycle(timecycleName, timecycleStrenght)

        while timer <= DrugsCreator.activeEffects[effectName] do
            if(GetTimecycleModifierIndex() == -1 or GetTimecycleModifierIndex() == currentTimecycle) then
                SetTimecycleModifier(timecycleName)
                SetTimecycleModifierStrength(timecycleStrenght)
            end
            
            Citizen.Wait(1000)
            timer = timer + 1000
        end

        ClearTimecycleModifier()
        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end


DrugsCreator.allEffects.yellow_visual = function(duration)
    local effectName = "visual_color"

    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local timer = 0

        local currentTimecycle = GetTimecycleModifierIndex()

        local timecycleName = "BeastIntro01"
        local timecycleStrenght = 1.0

        startTimecycle(timecycleName, timecycleStrenght)

        while timer <= DrugsCreator.activeEffects[effectName] do
            if(GetTimecycleModifierIndex() == -1 or GetTimecycleModifierIndex() == currentTimecycle) then
                SetTimecycleModifier(timecycleName)
                SetTimecycleModifierStrength(timecycleStrenght)
            end
            
            Citizen.Wait(1000)
            timer = timer + 1000
        end

        ClearTimecycleModifier()
        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end

DrugsCreator.allEffects.blurred_visual = function(duration)
    local effectName = "visual_color"

    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local timer = 0

        local currentTimecycle = GetTimecycleModifierIndex()

        local timecycleName = "BlackOut"
        local timecycleStrenght = 0.84

        startTimecycle(timecycleName, timecycleStrenght)

        while timer <= DrugsCreator.activeEffects[effectName] do
            if(GetTimecycleModifierIndex() == -1 or GetTimecycleModifierIndex() == currentTimecycle) then
                SetTimecycleModifier(timecycleName)
                SetTimecycleModifierStrength(timecycleStrenght)
            end
            
            Citizen.Wait(1000)
            timer = timer + 1000
        end

        ClearTimecycleModifier()
        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end

DrugsCreator.allEffects.red_visual = function(duration)
    local effectName = "visual_color"

    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local timer = 0

        local currentTimecycle = GetTimecycleModifierIndex()

        local timecycleName = "damage"
        local timecycleStrenght = 2.16

        startTimecycle(timecycleName, timecycleStrenght)

        while timer <= DrugsCreator.activeEffects[effectName] do
            if(GetTimecycleModifierIndex() == -1 or GetTimecycleModifierIndex() == currentTimecycle) then
                SetTimecycleModifier(timecycleName)
                SetTimecycleModifierStrength(timecycleStrenght)
            end
            
            Citizen.Wait(1000)
            timer = timer + 1000
        end

        ClearTimecycleModifier()
        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end

DrugsCreator.allEffects.foggy_visual = function(duration)
    local effectName = "visual_color"

    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local timer = 0

        local currentTimecycle = GetTimecycleModifierIndex()

        local timecycleName = "graveyard_shootout"
        local timecycleStrenght = 0.48

        startTimecycle(timecycleName, timecycleStrenght)

        while timer <= DrugsCreator.activeEffects[effectName] do
            if(GetTimecycleModifierIndex() == -1 or GetTimecycleModifierIndex() == currentTimecycle) then
                SetTimecycleModifier(timecycleName)
                SetTimecycleModifierStrength(timecycleStrenght)
            end
            
            Citizen.Wait(1000)
            timer = timer + 1000
        end

        ClearTimecycleModifier()
        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end

DrugsCreator.allEffects.blue_visual = function(duration)
    local effectName = "visual_color"

    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local timer = 0

        local currentTimecycle = GetTimecycleModifierIndex()

        local timecycleName = "MichaelColorCodeBright"
        local timecycleStrenght = 1.04

        startTimecycle(timecycleName, timecycleStrenght)

        while timer <= DrugsCreator.activeEffects[effectName] do
            if(GetTimecycleModifierIndex() == -1 or GetTimecycleModifierIndex() == currentTimecycle) then
                SetTimecycleModifier(timecycleName)
                SetTimecycleModifierStrength(timecycleStrenght)
            end
            
            Citizen.Wait(1000)
            timer = timer + 1000
        end

        ClearTimecycleModifier()
        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end

DrugsCreator.allEffects.armor50 = function()
    AddArmourToPed(PlayerPedId(), 50)
end

DrugsCreator.allEffects.armor100 = function()
    AddArmourToPed(PlayerPedId(), 100)
end

DrugsCreator.allEffects.health50 = function()
    local plyPed = PlayerPedId()
    local currentHealth = GetEntityHealth(plyPed)

    local newHealth = currentHealth + 50

    local maxHealth = GetEntityMaxHealth(plyPed)

    if(newHealth > maxHealth) then
        SetEntityHealth(plyPed, maxHealth)
    else
        SetEntityHealth(plyPed, newHealth)
    end
end

DrugsCreator.allEffects.health100 = function()
    local plyPed = PlayerPedId()

    local maxHealth = GetEntityMaxHealth(plyPed)
    SetEntityHealth(plyPed, maxHealth)
end

DrugsCreator.allEffects.sprint_faster = function(duration)
    local effectName = "sprint_faster"

    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local ply = PlayerId()

        local timer = 0

        while timer <= DrugsCreator.activeEffects[effectName] do
            SetRunSprintMultiplierForPlayer(ply, 1.2)
            
            Citizen.Wait(1000)
            timer = timer + 1000
        end

        SetRunSprintMultiplierForPlayer(ply, 1.0)
        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end

DrugsCreator.allEffects.swim_faster = function(duration)
    local effectName = "swim_faster"

    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local ply = PlayerId()

        local timer = 0

        while timer <= DrugsCreator.activeEffects[effectName] do
            SetSwimMultiplierForPlayer(ply, 1.2)
            
            Citizen.Wait(1000)
            timer = timer + 1000
        end

        SetSwimMultiplierForPlayer(ply, 1.0)
        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end

DrugsCreator.allEffects.fall = function(duration)
    local effectName = "fall"

    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local plyPed = PlayerPedId()

        local timer = 0

        while timer <= DrugsCreator.activeEffects[effectName] do
            local randomNumber = math.random(1, 3)

            if(randomNumber == 1) then
                SetPedToRagdollWithFall(plyPed, 1500, 2000, 1, GetEntityForwardVector(plyPed), 5.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            end
            
            Citizen.Wait(5000)
            timer = timer + 5000
        end

        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end

DrugsCreator.allEffects.infinite_stamina = function(duration)
    local effectName = "infinite_stamina"

    if(not DrugsCreator.activeEffects[effectName]) then
        DrugsCreator.activeEffects[effectName] = duration

        local ply = PlayerId()

        local timer = 0

        while timer <= DrugsCreator.activeEffects[effectName] do
            ResetPlayerStamina(ply)
            
            Citizen.Wait(1000)
            timer = timer + 1000
        end

        DrugsCreator.activeEffects[effectName] = false
    else
        DrugsCreator.activeEffects[effectName] = DrugsCreator.activeEffects[effectName] + duration
    end
end

DrugsCreator.allEffects.remove_old_effects = function()
    for effectName, effectTime in pairs(DrugsCreator.activeEffects) do
        if(effectTime) then
            DrugsCreator.activeEffects[effectName] = 0
        end
    end
end

local function assumeDrug(type)
    local plyPed = PlayerPedId()

    if(type == "pill") then
        local animDict = "mp_suicide"
        local anim = "pill"

        RequestAnimDict(animDict)

        while not HasAnimDictLoaded(animDict) do
            Citizen.Wait(0)
        end

        local animDuration = 3200

        TaskPlayAnim(plyPed, animDict, anim, 4.0, 4.0, animDuration, 49, 0.0, 0, 0, 0)

        Citizen.Wait(animDuration)
    elseif(type == "drink") then
        if(IsPedInAnyVehicle(plyPed, false)) then return end

        TaskStartScenarioInPlace(plyPed, "world_human_drinking", 0, true)

        Citizen.Wait(10000)

        ClearPedTasks(plyPed)
    elseif(type == "smoke") then
        if(IsPedInAnyVehicle(plyPed, false)) then return end

        TaskStartScenarioInPlace(plyPed, "WORLD_HUMAN_SMOKING_POT", 0, true)

        Citizen.Wait(10000)

        ClearPedTasks(plyPed)
    elseif(type == "needle") then
        local syringeProp = GetHashKey('prop_syringe_01')
        local syringeDict = "rcmpaparazzo1ig_4"
        local syringeAnim = "miranda_shooting_up"
        local syringeBone = 28422
        local syringeOffset = vector3(0, 0, -0.045)
        local syringeRot = vector3(0, 0, 0)

        RequestAnimDict(syringeDict)
        while not HasAnimDictLoaded(syringeDict) do
            Citizen.Wait(150)
        end

        RequestModel(syringeProp)
        while not HasModelLoaded(syringeProp) do
            Citizen.Wait(150)
        end

        local syringeObj = CreateObject(syringeProp, 0.0, 0.0, 0.0, true, true, false)
        local syringeBoneIndex = GetPedBoneIndex(plyPed, syringeBone)

        SetCurrentPedWeapon(plyPed, "weapon_unarmed", true)
        AttachEntityToEntity(syringeObj, plyPed, syringeBoneIndex, syringeOffset.x, syringeOffset.y, syringeOffset.z, syringeRot.x, syringeRot.y, syringeRot.z, false, false, false, false, 2, true)
        SetModelAsNoLongerNeeded(syringeProp)

        local pos = GetEntityCoords(plyPed)
        local he = GetEntityHeading(plyPed)

        TaskPlayAnim(plyPed, syringeDict, syringeAnim, 8.0, 8.0, 6000, 49, 0, 0, 0, 0)

        RemoveAnimDict(syringeDict)

        Citizen.Wait(1)
        SetEntityAnimCurrentTime(plyPed, syringeDict, syringeAnim, 0.55)

        while(IsEntityPlayingAnim(plyPed, syringeDict, syringeAnim, 3)) do
            Citizen.Wait(0)
            DisableControlAction(0,21,true) -- no sprint
            DisableControlAction(0,24,true) -- no attack
            DisableControlAction(0,25,true) -- no aim
            DisableControlAction(0,47,true) -- no weapon
            DisableControlAction(0,58,true) -- no weapon
            DisableControlAction(0,263,true) -- no melee
            DisableControlAction(0,264,true) -- no melee
            DisableControlAction(0,257,true) -- no melee
            DisableControlAction(0,140,true) -- no melee
            DisableControlAction(0,141,true) -- no melee
            DisableControlAction(0,142,true) -- no melee
            DisableControlAction(0,143,true) -- no melee
            DisableControlAction(0,37,true) -- no weapon select
            DisableControlAction(0,22,true) -- no jump
        end

        SetEntityAsMissionEntity(syringeObj, false, false)
        DeleteObject(syringeObj)
    end
end

local function drugEffects(type, effects, duration)
    assumeDrug(type)
    
    duration = duration * 1000
    for k, effect in pairs(effects) do
        Citizen.CreateThread(function() 
            DrugsCreator.allEffects[effect](duration)
        end)
    end
end

RegisterNetEvent(Utils.eventsPrefix .. ':drugEffects', drugEffects)