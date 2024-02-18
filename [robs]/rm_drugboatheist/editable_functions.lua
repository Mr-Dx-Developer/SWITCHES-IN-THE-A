function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end

function ShowNotification(msg)
    exports['okokNotify']:Alert('Heist', msg, 7000, 'warning', true)
end

RegisterNetEvent('drugboatheist:client:showNotification')
AddEventHandler('drugboatheist:client:showNotification', function(str)
    ShowNotification(str)
end)

--This event send to all police players
RegisterNetEvent('drugboatheist:client:policeAlert')
AddEventHandler('drugboatheist:client:policeAlert', function(targetCoords)
    exports['ps-dispatch']:DrugBoatRobbery()
end)
