--[[
    In this section you will find the configuration of the garage that you have selected, in
    case your system is not found here, you can ask the creator of your garage to add its exports
    in any of these files, or use these files to create your own, that would help our community!
]]

if Config.Garage ~= 'loaf_garage' then
    return
end

function StoreVehicle(house)
    local garage = house
    local vehicle = GetVehiclePedIsUsing(PlayerPedId())
    if DoesEntityExist(vehicle) and garage then
        local vehprops = ESX.Game.GetVehicleProperties(vehicle)
        local damages = {}
        TriggerServerEvent('loaf_garage:storeVehicle', garage, damages, vehprops)
        DeleteVehicle(vehicle)
        TriggerEvent('loaf_garage:deleteStoredVehicle', GetVehicleNumberPlateText(vehicle))
        FreezeEntityPosition(PlayerPedId(-1), false)
    end
end

function OpenGarage(house)
    TriggerEvent('loaf_garage:viewVehicles', house, GetEntityCoords(GetPlayerPed(-1)), GetEntityHeading(GetPlayerPed(-1)), function()
        FreezeEntityPosition(PlayerPedId(-1), false)
    end, false)
end

--[[
    If you don't need a marker or text, remove all this!
]]

CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        if closesthouse ~= nil and hasKey and Config.Houses and Config.Houses[closesthouse] and Config.Houses[closesthouse].garage then
            local dist = GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].garage.x, Config.Houses[closesthouse].garage.y, Config.Houses[closesthouse].garage.z, true)

            if dist < 5.0 then
                DrawMarker(20, Config.Houses[closesthouse].garage.x, Config.Houses[closesthouse].garage.y, Config.Houses[closesthouse].garage.z + 0.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 120, 10, 20, 155, false, false, false, 1, false, false, false)

                if dist < 2.0 then
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    if Config.Houses[closesthouse].garage and Config.Houses[closesthouse].garage.x and Config.Houses[closesthouse].garage.y and Config.Houses[closesthouse].garage.z then
                        if vehicle and vehicle ~= 0 then
                            if Config.HelpNotification == 'ShowHelpNotification' then
                                ShowHelpNotification(Lang('HOUSING_SHOWHELP_GARAGE_STORE'))
                            elseif Config.HelpNotification == 'DrawText3D' then
                                DrawText3D(Config.Houses[closesthouse].garage.x, Config.Houses[closesthouse].garage.y, Config.Houses[closesthouse].garage.z + 0.3, Lang('HOUSING_DRAWTEXT_GARAGE_STORE'))
                            end

                            if IsControlJustPressed(0, Keys['E']) or IsDisabledControlJustPressed(0, Keys['E']) then
                                if not StoreVehicle then return DebugPrint('Your client/custom/garages/*.lua is not correctly configured') end
                                StoreVehicle(closesthouse)
                            end
                        else
                            if Config.HelpNotification == 'ShowHelpNotification' then
                                ShowHelpNotification(Lang('HOUSING_SHOWHELP_GARAGE_MENU'))
                            elseif Config.HelpNotification == 'DrawText3D' then
                                DrawText3D(Config.Houses[closesthouse].garage.x, Config.Houses[closesthouse].garage.y, Config.Houses[closesthouse].garage.z + 0.3, Lang('HOUSING_DRAWTEXT_GARAGE_STORE'))
                            end

                            if IsControlJustPressed(0, Keys['E']) or IsDisabledControlJustPressed(0, Keys['E']) then
                                if not OpenGarage then return DebugPrint('Your client/custom/garages/*.lua is not correctly configured') end
                                OpenGarage(closesthouse)
                            end
                        end
                    end
                end
            else
                Wait(1000)
            end
        end
    end
end)
