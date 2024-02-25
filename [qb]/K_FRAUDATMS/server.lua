if not KonfigSH.UsingNewESX or ESX == nil then
    ESX = getCore()
end

RegisterNetEvent('k_fraudatms:hasCard', function()
    local Player = ESX.GetPlayerFromId(source)
    local clonedItem = Player.getInventoryItem(KonfigSH.ClonedItem)
    if clonedItem ~= nil then
        if clonedItem.count >= 1 then
            TriggerClientEvent('k_fraud2:atmEvent', source)
        end
    end
end)


RegisterNetEvent('k_fraudatms:enterATM', function(pos)
    local Player = ESX.GetPlayerFromId(source)
    local clonedItem = Player.getInventoryItem(KonfigSH.ClonedItem)
    local randomChance = math.random(1,5) -- 1 in 5 chance to alert police
    if clonedItem ~= nil then
        if clonedItem.count >= 1 then
            if randomChance == 5 then
                Player.removeInventoryItem(KonfigSH.ClonedItem, 1)
                Notify('ATM: Ate card.')
                TriggerEvent('k_fraudalerts:alert', 2, pos)
                LogSale(source)
            else
                Player.removeInventoryItem(KonfigSH.ClonedItem, 1)
            
                if SetAmount then
                    Player.addMoney(KonfigSV.SetAmount)
                    Notify('ATM: You got: $'..KonfigSV.SetAmount)
                else
                    local max = KonfigSV.CardMaxAmount
                    local min =  KonfigSV.CardMinAmount
                    local rando = math.random(min, max)-- not sure why i need to do this but hey 
                    Player.addMoney(rando)
                    Notify('ATM: You got: $'..rando)
                end
                LogSale(source)
            end
        else
            LogSale(source, 'Trying to exploit')
            Notify('not sure what you\'re trying to achive?')
             -- probably add some ban thing here i guess since its not possible to use this event without a card unless they are trying to dupe by dropping the card or something :P
        end
    else
        LogSale(source, 'Trying to exploit')
        Notify('not sure what you\'re trying to achive?')
        -- probably add some ban thing here i guess since its not possible to use this event without a card unless they are trying to dupe by dropping the card or something :P
    end
end)




function LogSale(source, text)
    if text == nil then
        text = ""
    end
    local playername = GetPlayerName(source)
    for k,v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        end
    end
    local embed = {
        {
            ["color"] = 1,
            ["title"] = 'Fraud Logs',
            ["description"] = "Player: **"..playername.."** Just used a cloned card | "..license.." **"..text.."**",
            ["footer"] = {
                ["text"] = 'FRAUD LOGS',
                ["icon_url"] = '',
            },
        }
    }
    PerformHttpRequest(KonfigSV.SaleLogsWebhook, function(err, text, headers) end, 'POST', json.encode({username = "K_FRAUD", embeds = embed}), { ['Content-Type'] = 'application/json' })
end