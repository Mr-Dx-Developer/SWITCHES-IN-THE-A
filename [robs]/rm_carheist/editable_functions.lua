RegisterNetEvent('carheist:client:giveVehicleKey')
AddEventHandler('carheist:client:giveVehicleKey', function(vehiclePlate)
    local plate = string.gsub(vehiclePlate, '^%s*(.-)%s*$', '%1')
    --Write your give vehicle key event for cars
    TriggerEvent('vehiclekeys:client:SetOwner', plate)
end)

function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end

function ShowNotification(msg)
    exports['okokNotify']:Alert('Heist', msg, 7000, 'warning', true)
end

RegisterNetEvent('carheist:client:showNotification')
AddEventHandler('carheist:client:showNotification', function(str)
    ShowNotification(str)
end)

--This event send to all police players
RegisterNetEvent('carheist:client:policeAlert')
AddEventHandler('carheist:client:policeAlert', function(targetCoords)
    exports['ps-dispatch']:CarHeist()
end)
