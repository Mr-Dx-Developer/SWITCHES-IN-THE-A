-- Function used to return a total count of all police online
PoliceCount = function()
    local jobCount = 0
    if Framework == 'esx' then
        for _, player in pairs(ESX.GetExtendedPlayers()) do
            local job = player.getJob()
            for _, jobs in pairs(Config.Police.jobs) do
                local jobNames = jobs
                if job.name == jobNames then
                    jobCount = jobCount + 1
                end
            end
        end
    elseif Framework == 'qb' then
        for _, players in pairs(QBCore.Functions.GetPlayers()) do
            local player = QBCore.Functions.GetPlayer(players)
            local job = player.PlayerData.job
            for _, jobs in pairs(Config.Police.jobs) do
                local jobNames = jobs
                if job.name == jobNames then
                    jobCount = jobCount + 1
                end
            end
        end
    else
        -- Add support for a custom framework here
    end
    return jobCount
end

-- Function used to pay the player upon successful drug sale
--- @param source number Player ID
--- @param amount number Amount of money being paid
PayPlayer = function(source, amount)
    local player = GetPlayer(source)
    -- Check player is a valid player
    if player then
        -- Identify framework
        if Framework == 'esx' then
            -- If Config.Account is an account, then addAccountMoney as normal
            if Config.Account == 'black_money' or Config.Account == 'money' or Config.Account == 'bank' then
                player.addAccountMoney(Config.Account, amount)
            else
                -- Config.Account is not a known account, so give item instead
                AddItem(source, Config.Account, amount)
            end
        elseif Framework == 'qb' then
            -- if Config.Account is a known dirty money item, then proceed with that
            if Config.Account == 'markedbills' or Config.Account == 'cashrolls' or Config.Account == 'bands' then
                -- Check if we're adding value to an existing bag, or creating a new one
                if Config.QBCore.updateValue then
                    -- Check if player already has one of these items
                    local hasBag = HasItem(source, Config.Account)
                    if hasBag and hasBag > 0 then
                        -- Player has one, so we're gonna update the value of it to include the new sale
                        local currentValue = player.Functions.GetItemByName(Config.Account).info.worth
                        local newValue = amount
                        local updatedValue = {worth = math.ceil(currentValue + newValue)}
                        player.Functions.RemoveItem(Config.Account, 1)
                        player.Functions.AddItem(Config.Account, 1, false, updatedValue)
                    else
                        -- Player didn't already have one, so we'll create a new one
                        local worth = {worth = amount}
                        player.Functions.AddItem(Config.Account, 1, false, worth)
                    end
                else
                    -- updateValue is false, so new item for every sale
                    local worth = {worth = amount}
                    player.Functions.AddItem(Config.Account, 1, false, worth)
                end
            -- If not a known dirty money item, check if it's a known account, and AddMoney as normal
            elseif Config.Account == 'cash' or Config.Account == 'bank' then
                AddMoney(source, Config.Account, amount)
            else
                -- Not a known dirty money item or a known account, so give item instead
                AddItem(source, Config.Account, amount)
            end
        else
            -- Add support for a custom framework here
        end
    end
end

-- Empty function triggered on drug sales
-- Can be used with XP systems, territory scripts, etc
--- @param source number Player ID
--- @param zone table Zone data (ex: zone.coords, zone.size, zone.requirePolice, etc)
--- @param drugItem string The item name of the drug sold
--- @param drugLabel string The drug "label" aka name of the drug sold
--- @param price number The price of the drug sale
--- @param quantity number How many of the drugs sold
DrugSold = function(source, zone, drugItem, drugLabel, price, quantity)

end