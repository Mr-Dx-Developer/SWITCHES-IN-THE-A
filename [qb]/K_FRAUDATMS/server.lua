local QBCore = GetQBVersion()


RegisterNetEvent('k_fraudatms:enterATM', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local clonedItem = Player.Functions.GetItemByName(KonfigSH.ClonedItem)
    local randomChance = math.random(1,5) -- 1 in 5 chance to alert police
    if clonedItem ~= nil then
        if clonedItem.amount >= 1 then
            if randomChance == 5 then
                Player.Functions.RemoveItem(KonfigSH.ClonedItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[KonfigSH.ClonedItem], "remove")
                TriggerClientEvent('QBCore:Notify', source, 'ATM: Ate card and alerted authorities', "success")
                -- do some alert stuff here or not
            else
                Player.Functions.RemoveItem(KonfigSH.ClonedItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[KonfigSH.ClonedItem], "remove")
                if SetAmount then
                    Player.Functions.AddMoney("cash", KonfigSV.SetAmount)
                    TriggerClientEvent('QBCore:Notify', source, 'ATM: You got: $'..KonfigSV.SetAmount, "success")
                else
                    local max = KonfigSV.CardMaxAmount
                    local min =  KonfigSV.CardMinAmount
                    local rando = math.random(min, max)-- not sure why i need to do this but hey 
                    Player.Functions.AddMoney("cash", rando)
                    TriggerClientEvent('QBCore:Notify', source, 'ATM: You got: $'..rando, "success")
                end
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'not sure what you\'re trying to achive?', "error")
             -- probably add some ban thing here i guess since its not possible to use this event without a card unless they are trying to dupe by dropping the card or something :P
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'not sure what you\'re trying to achive?', "error")
        -- probably add some ban thing here i guess since its not possible to use this event without a card unless they are trying to dupe by dropping the card or something :P
    end
end)