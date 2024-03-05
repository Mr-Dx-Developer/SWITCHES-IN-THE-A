local QBCore = GetQBVersion()


RegisterNetEvent('k_fraudshops:sellCheck', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local forgedCheck = Player.Functions.GetItemByName(KonfigSH.ForgedCheckItem)
    local randomChance = math.random(1,5) -- 1 in 5 chance to alert police
    if forgedCheck ~= nil then
        if forgedCheck.amount >= 1 then
            if randomChance then
                --alert police code here
            end
            Player.Functions.RemoveItem(KonfigSH.ForgedCheckItem, 1)
            if KonfigSV.SetCheckSellPrice then
                Player.Functions.AddMoney("cash", KonfigSV.SetCheckSellPrice)
                TriggerClientEvent('QBCore:Notify', source, 'You sold a check: $'..KonfigSV.SetCheckSellPrice, "success")
            elseif KonfigSV.SetCheckSellPrice == false then
                local cash = math.random(KonfigSV.CheckSellMin, KonfigSV.CheckSellMax)
                Player.Functions.AddMoney("cash", cash)
                TriggerClientEvent('QBCore:Notify', source, 'You sold a check: $'..cash, "success")
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'You have nothing to sell.', "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'You have nothing to sell.', "error")
    end
end)