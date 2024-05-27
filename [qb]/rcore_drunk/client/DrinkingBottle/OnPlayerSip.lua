function OnPlayerSip(drinkName, leftSips, drinkData)
    AddPlayerDrunkPercentage(drinkData.eachSipGiveDrunk)
    ShowHelpNotification(_U("drink_help_text", leftSips), false, false, 99999999)

    SendNUIMessage({
        type = "drunk",
        value = GetPlayerDrunkPercentage(),
    })

    AddPlayerHeadachePercentage(drinkData.eachSipGiveDrunk / 2)

    SendNUIMessage({
        type = "headache",
        value = GetPlayerHeadachePercentage(),
    })

    TriggerEvent("rcore_drunk:PlayerSippedDrink", drinkName)
    TriggerServerEvent("rcore_drunk:PlayerSippedDrink", drinkName)

    if leftSips == 0 then
        TriggerEvent("rcore_drunk:OnBottleFinish", drinkName)
        TriggerServerEvent("rcore_drunk:OnBottleFinish", drinkName)
    end
end