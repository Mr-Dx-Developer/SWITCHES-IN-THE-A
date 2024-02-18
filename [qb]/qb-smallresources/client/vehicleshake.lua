CreateThread(function()
    local lastDamage = 0.0
    local vehicle = nil
    local SLEEP_TIME_IN_VEHICLE = 100
    local SLEEP_TIME_OUTSIDE_VEHICLE = 1000
    local SHAKE_RATE_CONSTANT = 250.0

    while true do
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed) then
            local curVehicle = GetVehiclePedIsIn(playerPed, false)
            local shakeRate = GetEntitySpeed(curVehicle) / SHAKE_RATE_CONSTANT
            local curVehicleHealth = GetVehicleBodyHealth(curVehicle)

            if curVehicleHealth ~= lastDamage then
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", shakeRate)
            end

            lastDamage = curVehicleHealth
            vehicle = curVehicle
            Wait(SLEEP_TIME_IN_VEHICLE)
        else
            vehicle = nil
            Wait(SLEEP_TIME_OUTSIDE_VEHICLE)
        end
    end
end)
