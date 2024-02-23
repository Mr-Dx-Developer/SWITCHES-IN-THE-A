function SetStatus(type, value)
    nuiMessage("SET_STATUS", {
        type = type,
        value = value,
    })
end

function SetBarVisibility(type, value)
    nuiMessage("SET_BAR_VISIBILITY", {
        type = type,
        value = value,
    }) 
end

local lastHunger = nil
local lastThirst = nil

CreateThread(function()
    WaitCore()
    WaitPlayer()
    while true do
        if Config.Framework == "esx" or Config.Framework == "oldesx" then
            TriggerEvent('esx_status:getStatus', 'hunger', function(hunger)
                TriggerEvent('esx_status:getStatus', 'thirst', function(thirst)
                    
                    local hunger = hunger.getPercent()
                    local thirst = thirst.getPercent()
                    if lastHunger == nil or hunger ~= lastHunger then
                        SetStatus('hunger', hunger)
                        lastHunger = hunger
                    end
                    if lastThirst == nil or thirst ~= lastThirst then
                        SetStatus('thirst', thirst)
                        lastThirst = thirst
                    end
                end)
            end)
        else
            local hunger = Core.Functions.GetPlayerData().metadata["hunger"]
            local thirst = Core.Functions.GetPlayerData().metadata["thirst"]
            if lastHunger == nil or hunger ~= lastHunger then
                SetStatus('hunger', hunger)
                lastHunger = hunger                
            end
            
            if lastThirst == nil or thirst ~= lastThirst then
                SetStatus('thirst', thirst)
                lastThirst = thirst

            end
         
        end
        Wait(6000)
    end
end)

local lastHealth = nil
CreateThread(function()
    WaitCore()
    WaitPlayer()
    while true do
        local playerPed = PlayerPed
        local health = GetEntityHealth(playerPed)
        if not lastHealth  or lastHealth ~= health  then
            local val = health-100
            SetStatus('health', val)
            lastHealth = health
        end
        Wait(1600)
    end
end)

local lastArmor = nil
CreateThread(function()
    WaitCore()
    WaitPlayer()
    while true do
        local playerPed = PlayerPed
        local armor = GetPedArmour(playerPed)
        if not lastArmor  or lastArmor ~= armor  then
            local val = armor
            SetStatus('armor', val)
            lastArmor = armor
        end
        Wait(1600)
    end
end)

local inWater = false
local lastStamina = nil
local lastOxygen = nil
local inHeli = false

CreateThread(function()
    while true do
        local player = PlayerPed
        if IsEntityInWater(player) then
            local value = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10
            if not inWater and not inHeli then
                SetBarVisibility("stamina", false)
                SetBarVisibility("oxygen", true)
                inWater = true
            end
            if value < 0 then
                value = 0
            end
            if lastOxygen == nil or lastOxygen ~= value then
                SetStatus('oxygen', value)
                lastOxygen = value
            end

        else
            if inWater and not inHeli then                
                SetBarVisibility("stamina", true)
                SetBarVisibility("oxygen", false)    
                inWater = false      
            end
            local value = 100 - GetPlayerSprintStaminaRemaining(PlayerId())
            if lastStamina == nil or lastStamina ~= value then
                SetStatus('stamina', value)
                lastStamina = value
            end
        end
        Wait(1500)
    end    
end)

CreateThread(function()
    while true do
        Wait(1700)
        local playerPed = PlayerPed
        if IsPedInAnyHeli(playerPed) or IsPedInAnyPlane(playerPed) or GetPedParachuteState(playerPed) >= 0 then
            if not inHeli then             
                inHeli = true
                SetBarVisibility("altitude", true)
                SetBarVisibility("oxygen", false) 
                SetBarVisibility("stamina", false)
            end
            local veh = GetVehiclePedIsUsing(playerPed)
            if DoesEntityExist(veh) then
                local val = GetEntityHeightAboveGround(veh)
                if val > 2483 then
                    val = 2483
                end
                SetStatus("altitude", val)
            else
                local val = GetEntityHeightAboveGround(playerPed)
                if val > 2483 then
                    val = 2483
                end
                SetStatus("altitude", val)
            end
        else
            if inHeli then
                if inWater then
                    SetBarVisibility("stamina", false)
                    SetBarVisibility("altitude", false) 
                    SetBarVisibility("oxygen", true) 
                else
                    SetBarVisibility("stamina", true)
                    SetBarVisibility("altitude", false) 
                    SetBarVisibility("oxygen", false)    
                end
                inHeli = false
            end
        end
    end
end)


CreateThread(function()
    while true do
        if GetEntityMaxHealth(PlayerPed) ~= 200 then
            SetEntityMaxHealth(PlayerPed, 200)
            SetEntityHealth(PlayerPed, 200)
        end
        Wait(2000)
    end
end)

