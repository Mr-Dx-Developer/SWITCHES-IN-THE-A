RegisterNetEvent("rcore_drunk:OnBottleFinish", function(drinkName)
    local source = source
    if IsPlayerBusyDrinking[source] then
        TriggerClientEvent(TriggerName("ResetPlayerBottleVariables"), source)
        if Config.FrameworkType.Active ~= FrameworkType.CUSTOM then
            local botttleData = GetDrinkDataByName(drinkName)
            if botttleData.giveEmptyBottle then
                local playerModul = FrameworkObject.GetPlayerFromId(source)

                playerModul.addInventoryItem(botttleData.giveEmptyBottle, 1)
            end
        end

        IsPlayerBusyDrinking[source] = nil
    end
end)