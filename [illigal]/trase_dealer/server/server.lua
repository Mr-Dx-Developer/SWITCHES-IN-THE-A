local SellingDrugs = {}

local function JobBlacklisted(target)
    local Job = GetPlayerJob(target)
    if (next(Config.BlacklistedJobs)) then
        for k, v in pairs(Config.BlacklistedJobs) do
            if (v == Job) then
                return true
            end
        end
    end
    return false
end

local function SellDrugs(src)
    if (JobBlacklisted(src)) then
        return TriggerClientEvent('trase_dealer:client:notify', src, Config.Strings['BlacklistedJob'])
    end

    if (ShouldDeny(src)) then
        return TriggerClientEvent('trase_dealer:client:notify', src, Config.Strings['CantSellHere'])
    end

    if (Config.SellOnlyNight) then
        local isNight = lib.callback.await('trase_dealer:client:isNight', src)
        if (not isNight) then
            return TriggerClientEvent('trase_dealer:client:notify', src, Config.Strings['NotNight'])
        end
    end

    local Options = {}
    
    for k, v in pairs(Config.Drugs) do
        local Count = CountItem(src, v.Item)
        if (Count >= v.RequiredAmount) then
            v.id = k
            Options[#Options +1] = v
        end
    end

    if (not next(Options)) then
        return TriggerClientEvent('trase_dealer:client:notify', src, Config.Strings['NoDrugs'])
    end

    local DrugToSale

    if (Config.EnableSelection and #Options >= 2) then
        DrugToSale = lib.callback.await('trase_dealer:client:getselection', src, Options)
    else
        DrugToSale = Options[math.random(#Options)]
    end

    local Rank = GetRank(src)
    local SellTime = Config.DefaultSellTime * 1000
    if (Rank >= 1) then
        local RankData = Config.Ranks[Rank]
        if (RankData.Modifiers.SellTime) then
            SellTime = RankData.Modifiers.SellTime * 1000
        end
    end

    SellingDrugs[src] = true
    TriggerClientEvent('trase_dealer:client:selldrug', src, DrugToSale, SellTime)
end

local function DoesHaveDiscordAddition(target)
    if (not Config.Discord.Enabled) then return false end

    if (GetResourceState(Config.Discord.ResourceName) ~= 'started') then
        print('^1[ERROR]^0: The discord option is enabled, but the API resource was unable to be found.')
        return false
    end

    for k, v in ipairs(Config.Discord.Roles) do
        if exports[Config.Discord.ResourceName]:hasRole(target, v.RoleId, false) then
            return v.SellPrice
        end
    end

    return false
end


for k, v in pairs(Config.SellCommands) do
    RegisterCommand(v, SellDrugs)
end

RegisterNetEvent('trase_dealer:server:selldrug', function(data)
    local src = source
    local Count = CountItem(src, data.Item)
    if (Count < data.RequiredAmount) then SellingDrugs[src] = nil return end

    local SellAmount = CountDrugs(src)

    local SellPrice = data.Price
    if (Config.RandomizePay) then SellPrice += math.random(1, 200) end

    local Rank = GetRank(src)
    if (Rank >= 1) then
        local RankData = Config.Ranks[Rank]
        if (RankData.Modifiers.SellPrice) then
            local AddMultiplier = (RankData.Modifiers.SellPrice / 100) + 1
            SellPrice = SellPrice * AddMultiplier
            TriggerClientEvent('trase_dealer:client:notify', src, Config.Strings['SellIncrease']:gsub('{DRUG_MULTI}', RankData.Modifiers.SellPrice))
        end
    end

    local HasDiscordAddition = DoesHaveDiscordAddition(src)
    if (HasDiscordAddition) then
        local AddMultiplier = (HasDiscordAddition / 100) + 1
        SellPrice = SellPrice * AddMultiplier
        TriggerClientEvent('trase_dealer:client:notify', src, Config.Strings['SellIncreaseDiscord']:gsub('{DRUG_MULTI}', AddMultiplier))
    end

    local AddMore = ShouldAddMultiplier(src)
    if (AddMore) then
        local AddMultiplier = (AddMore / 100) + 1
        SellPrice = SellPrice * AddMultiplier
    end

    SellingDrugs[src] = nil
    AddMoney(src, Config.PayType, SellPrice)
    RemoveItem(src, data.Item, data.RequiredAmount)
    TriggerClientEvent('trase_dealer:client:notify', src, Config.Strings['SoldDrug']:gsub('{DRUG_NAME}', data.Label):gsub('{DRUG_PRICE}', SellPrice))
    AddDrugCount(src)
end)

RegisterNetEvent('trase_dealer:server:alertpolice', function(coords)
    local src = source
    if (not Config.Police.Enabled or not SellingDrugs[src]) then if (SellingDrugs[src]) then SellingDrugs[src] = nil end return end
    AlertPolice(coords)
end)

-- trase_dealer:server:alertpolice
-- trase_dealer:server:selldrug

if (Config.Command.Enabled) then
    RegisterCommand(Config.Command.Command, function(src)
        local Rank = GetRank(src)
        local Total = CountDrugs(src)
        TriggerClientEvent('trase_dealer:client:notify', src, Config.Strings['CurrentlyDrugRank']:gsub('{DRUG_RANK}', Rank):gsub('{DRUG_TOTALSOLD}', Total))
    end)
end