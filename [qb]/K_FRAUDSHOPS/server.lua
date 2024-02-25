if not KonfigSH.UsingNewESX or ESX == nil then
    ESX = getCore()
end

RegisterNetEvent('k_fraudshops:sellCheck', function(pos)
    local Player = ESX.GetPlayerFromId(source)
    local forgedCheck = Player.getInventoryItem(KonfigSH.ForgedCheckItem)
    local randomChance = math.random(1,10) -- 1 in 10 chance to alert police)
    if forgedCheck ~= nil then
        if forgedCheck.count >= 1 then
            if KonfigSV.PoliceAlert then
                if randomChance == 1 then
                    TriggerEvent('k_fraudalerts:alert', 1, pos)
                end
            end
            Player.removeInventoryItem(KonfigSH.ForgedCheckItem, 1)
            if KonfigSV.SetCheckSellPrice then
                Player.addMoney(KonfigSV.SetCheckSellPrice)
                Notify('You sold a check: $'..KonfigSV.SetCheckSellPrice)
            elseif KonfigSV.SetCheckSellPrice == false then
                local cash = math.random(KonfigSV.CheckSellMin, KonfigSV.CheckSellMax)
                Player.addMoney(cash)
                Notify('You sold a check: $'..cash)
            end
        else
            Notify('You have nothing to sell.')
        end
    else
        Notify('You have nothing to sell.')
    end
end)


RegisterNetEvent('k_fraudalerts:alert', function(alerttype, coords)
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            if alerttype == 1 then -- bank check
                TriggerClientEvent('k_fraud:setblip', xPlayers[i], coords, alerttype)
            else
                TriggerClientEvent('k_fraud:setblip', xPlayers[i], coords, alerttype)
            end
       end
    end
end)


RegisterNetEvent('k_fraudshops:buyItem', function(item)
    local Player = ESX.GetPlayerFromId(source)
    if item == 'skimmer' then
        if Player.getMoney() >= KonfigSH.Prices['Skimmer'] then
            Player.removeMoney(KonfigSH.Prices['Skimmer'])
			Player.addInventoryItem(item, 1)
        else
            Notify('Not enough money!')
        end
    elseif item == 'printer' then
        if Player.getMoney() >=  KonfigSH.Prices['Printer'] then
            Player.removeMoney(KonfigSH.Prices['Printer'])
			Player.addInventoryItem(item, 1)
        else
            Notify('Not enough money!')
        end
    elseif item == 'generator' then
        if Player.getMoney() >= KonfigSH.Prices['Generator'] then
            Player.removeMoney(KonfigSH.Prices['Generator'])
			Player.addInventoryItem(item, 1)
        else
            Notify('Not enough money!')
        end
    elseif item == 'laptop2' then
        if Player.getMoney() >= KonfigSH.Prices['Laptop'] then
            Player.removeMoney(KonfigSH.Prices['Laptop'])
			Player.addInventoryItem(item, 1)
        else
            Notify('Not enough money!')
        end
    elseif item == 'whiteslip' then
        if Player.getMoney() >= KonfigSH.Prices['WhiteSlip'] then
            Player.removeMoney(KonfigSH.Prices['WhiteSlip'])
			Player.addInventoryItem(item, 1)
        else
            Notify('Not enough money!')
        end
    elseif item == 'stolencard' then
        if Player.getMoney() >= KonfigSH.Prices['StolenCard'] then
            Player.removeMoney(KonfigSH.Prices['StolenCard'])
			Player.addInventoryItem(item, 1)
        end
    elseif item == 'blankcard' then
        if Player.getMoney() >= KonfigSH.Prices['Blankcard'] then
            Player.removeMoney(KonfigSH.Prices['Blankcard'])
			Player.addInventoryItem(item, 1)
        else
            Notify('Not enough money!')
        end
    elseif item == 'infousb' then
        if Player.getMoney() >= KonfigSH.Prices['InfoUSB'] then
            Player.removeMoney(KonfigSH.Prices['InfoUSB'])
			Player.addInventoryItem(item, 1)
        else
            Notify('Not enough money!')
        end
    else
        Notify('Why even try?.')
        --probably ban or add a log here since if its not any item from the above then they must be cheating (trying to spawn items not included with k_fraud)
    end
end)