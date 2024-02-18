function GetPedVehicleData(ped) 
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 then
        return {
            vehicle = vehicle,
            name = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)),
            fuel = GetVehicleFuelLevel(vehicle) or 100,
            engineTemperature = GetVehicleEngineTemperature(vehicle) or 90
        } 
    else
        return nil
    end
end

function ChangePedSeat(ped) 
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 then 
        local maxSeatAmount = GetVehicleMaxNumberOfPassengers(vehicle)
        local pedSeatIndex = nil
        local availableSeats = {}

        for i = -1, maxSeatAmount, 1 do 
            if GetPedInVehicleSeat(vehicle, i) == ped then 
                pedSeatIndex = i
            elseif IsVehicleSeatFree(vehicle, i) then
                table.insert(availableSeats, i)
            end
        end

        local newSeat = nil

        if pedSeatIndex then 
            for _, targetSeat in ipairs(availableSeats) do 
                if targetSeat > pedSeatIndex then 
                    newSeat = targetSeat
                    break
                end
            end

            if not newSeat then 
                for _, targetSeat in ipairs(availableSeats) do 
                    if targetSeat < pedSeatIndex then 
                        newSeat = targetSeat
                        break
                    end
                end
            end

            if newSeat then 
                SetPedIntoVehicle(ped, vehicle, newSeat)
            end
        end
    end
end

function EnableParkCam() 
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

    if vehicle then 
        ParkCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)

        AttachCamToEntity(ParkCam, vehicle, 0.0, -0.5, 5.0, true)

        SetCamActive(ParkCam, true)
        SetCamRot(ParkCam, -90.0, 0.0, -30.0, 2)
        SetCamFov(ParkCam, 80.0)

        RenderScriptCams(true, true, 1000, 0, 0)
    end
end

function DisableParkCam() 
    RenderScriptCams(false, true, 1000, 0, 0)

    DestroyCam(ParkCam, false)

    ParkCam = nil
end