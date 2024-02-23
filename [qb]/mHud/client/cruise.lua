cruise = false
cruiseSpeedKM = false
cruiseSpeedMPH = false



if Config.EnableRegisterKeyMapping then
    CreateThread(function()
        while true do
            if not alreadyInVehicle and cruise then
                cruise = false
                SetCruiseData()
            end
            Wait(1700)
        end
    end)
    RegisterCommand("hud_cruisecontrol", function()
        if alreadyInVehicle then
            ToggleCruise()
        end
    end)
    RegisterKeyMapping('hud_cruisecontrol', 'Cruise Control', 'keyboard', Config.CruiseControlKey)

else
    CreateThread(function()
        while true do
            local ped = PlayerPed
            if alreadyInVehicle then
                if IsControlJustPressed(0, Config.CruiseControlKey) then
                    ToggleCruise()
                end
            else
                if cruise then
                    cruise = false
                    SetCruiseData()
                end
                Wait(1500)
            end
            Wait(0)
        end
    end)
end


function SetCruiseData()
    nuiMessage("SET_CRUISE", {
        enabled = cruise,
        speed = cruiseSpeedKM,
    })
end

function ToggleCruise()
    local ped = PlayerPed
    local vehicle = Vehicle
    local class = GetVehicleClass(vehicle)
    if class == 14 then
        return
    end
    local cruiseSpeed = GetEntitySpeed(vehicle)
    cruise = not cruise
    cruiseSpeedKM = math.floor(cruiseSpeed * 3.6)
    cruiseSpeedMPH = math.floor(cruiseSpeed * 2.23694)
    SetCruiseData()

    if cruise then
        Config.Notification(Config.Notifications["CRUISE_ENABLED"].message, Config.Notifications["CRUISE_ENABLED"].type)
    else
        Config.Notification(Config.Notifications["CRUISE_DISABLED"].message, Config.Notifications["CRUISE_DISABLED"].type)
    end
    CreateThread(function()    
        while cruise do
            if IsVehicleOnAllWheels(vehicle) and GetEntitySpeed(vehicle) > (cruiseSpeed - 2.0) and not HasEntityCollidedWithAnything(vehicle) then
                SetVehicleForwardSpeed(vehicle, cruiseSpeed)
            else
                cruise = false
                SetCruiseData()

            end
            Wait(350)
        end
    end)
end