RegisterNetEvent("2na_carcontrol:Client:Open")
AddEventHandler("2na_carcontrol:Client:Open", function() 
    if ShowingMenu then 
        TriggerEvent("2na_carcontrol:Client:HideMenu")
    else
        TriggerEvent("2na_carcontrol:Client:ShowMenu")
    end
end)