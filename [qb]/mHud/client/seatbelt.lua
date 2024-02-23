if Config.EnableSeatbelt then
    seatbelt = false
    lastSpeed = 0
    lastVelocity = vector3(0, 0, 0)
    
    function ToggleSeatbelt()
        if DoesEntityExist(Vehicle) and CheckVehicleHasSeatbelt(Vehicle) then
            seatbelt = not seatbelt
            if seatbelt then
                Config.Notification(Config.Notifications["TOOK_SEATBELT"].message, Config.Notifications["TOOK_SEATBELT"].type)
            else
                Config.Notification(Config.Notifications["TOOK_OFF_SEATBELT"].message, Config.Notifications["TOOK_OFF_SEATBELT"].type)
            end
            SetSeatbeltEnabled()
            CreateThread(function()
                while seatbelt do
                    Wait(0)
                    DisableControlAction(0, 75)
                end
            end)
        end
    end
    
    function SetSeatbeltEnabled()
        nuiMessage("SET_SEATBELT", seatbelt)
    end
    
    if Config.EnableRegisterKeyMapping then
        RegisterCommand('hud_seatbelt', function()
            local ped = PlayerPed
            if IsPedInAnyVehicle(ped) and CheckVehicleHasSeatbelt(Vehicle) then
                
                ToggleSeatbelt()
            end
        end)
        RegisterKeyMapping('hud_seatbelt', 'Toggle Seatbelt', 'keyboard',  Config.SeatbeltKey)
    else
        CreateThread(function()
            while true do
                local ped = PlayerPed
                if IsPedInAnyVehicle(ped) then
                    if IsControlJustPressed(0, Config.SeatbeltKey) then
                        if CheckVehicleHasSeatbelt(Vehicle) then
                            ToggleSeatbelt()
                        end
                    end
                else
                    Wait(1000)
                end
                Wait(0)
            end
        end)
    end
    
    
    function Fwv(entity)
        local hr = GetEntityHeading(entity) + 90.0
        if hr < 0.0 then hr = 360.0 + hr end
        hr = hr * 0.0174533
        return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
    end
    function CheckVehicleHasSeatbelt(vehicle)
        if DoesEntityExist(vehicle) then
            local class = GetVehicleClass(vehicle)
            if class == 0 or class == 1 or class == 2  or class == 3 or class == 4 or class == 5 or class == 6 or class == 7 or class == 9 or class == 12 or class == 22 or class == 20 or class == 18 or class == 17   then
                return true 
            end
            return false
        else
            return false
        end
    end
    RegisterNetEvent("mHud:EjectPlayer")
    AddEventHandler("mHud:EjectPlayer", function()
        if not seatbelt then
            local ped = PlayerPed
            local coords = GetEntityCoords(ped)
            local fw = Fwv(ped)
            lastSpeed = 0
            SetEntityCoords(ped, coords.x + fw.x, coords.y + fw.y, coords.z - .47, true, true, true)
            SetEntityVelocity(ped, lastVelocity.x, lastVelocity.y, lastVelocity.z)
            Wait(500)
            ApplyDamageToPed(ped, math.random(10, 30),false)
            SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)     
        end
    end)
    if Config.SeatbeltSound then
        CreateThread(function()
            while true do
                local ped = PlayerPed
                if DoesEntityExist(Vehicle) and CheckVehicleHasSeatbelt(Vehicle) then
                    if not seatbelt then
                        local speed = GetEntitySpeed(Vehicle) * 3.6
                        if speed > 40 then
                            nuiMessage("PLAY_SEATBELT_SOUND")
                        end
                    end
                end
                Wait(3500)
            end
        end)
    end
    CreateThread(function()
        while true do
            local ped = PlayerPed
            if IsPedInAnyVehicle(ped) and CheckVehicleHasSeatbelt(Vehicle) then
                if not inPassengerSeat then            
                    local vehicle = Vehicle
                    local speed = GetEntitySpeed(vehicle) * 3.6
                    if lastSpeed > (Config.SeatbeltEjectSpeed ) and (lastSpeed - speed) > (speed * 1.7) then
                        local seatPlayerId = {}
                        for i=1, GetVehicleModelNumberOfSeats(GetEntityModel(vehicle)) do                       
                            if not IsVehicleSeatFree(vehicle, i-2) then 
                                local otherPlayerId = GetPedInVehicleSeat(vehicle, i-2) 
                                local playerHandle = NetworkGetPlayerIndexFromPed(otherPlayerId)
                                local playerServerId = GetPlayerServerId(playerHandle)
                                table.insert(seatPlayerId, playerServerId)
                            end
                        end
                        if #seatPlayerId > 0 then TriggerServerEvent("mHud:EjectPlayers", seatPlayerId) end                    
                    end   
                    lastSpeed = speed
                    lastVelocity = GetEntityVelocity(vehicle)
                end
            else
                if seatbelt then
                    seatbelt = false
                    SetSeatbeltEnabled()
                    lastSpeed = 0
                end
                Wait(2000)
    
            end
            Wait(150)
        end
    end)
end