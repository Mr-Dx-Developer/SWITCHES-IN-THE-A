if GetResourceState('qb-core') ~= 'started' then return end
QBCore = exports['qb-core']:GetCoreObject()
Config.Framework = 1
if (Config.PayType == 'black_money') then Config.PayType = 'markedbills' end
if (Config.PayType == 'money') then Config.PayType = 'cash' end
function GetPlayer(target)
    local player = QBCore.Functions.GetPlayer(target)
    if (player) then
        return player
    end
end

function CountItem(target, item)
    local player = GetPlayer(target)
    if (not player) then return 0 end
    local ItemData = player.Functions.GetItemByName(item)
    return ItemData?.count or ItemData?.amount or 0
end

function AddMoney(target, account, amount)
    local player = QBCore.Functions.GetPlayer(target)
    if (not player) then return end
    if (account == 'markedbills') then
        local info = { worth  = amount }
        player.Functions.AddItem(account, 1, false, info)
    else
        player.Functions.AddMoney(account, amount)
    end
end

function RemoveItem(target, item, amount)
    local player = QBCore.Functions.GetPlayer(target)
    if (not player) then return end
    player.Functions.RemoveItem(item, amount)
end

local CachedSells = {}

function CountDrugs(target)
    if (CachedSells[target]) then return CachedSells[target] end -- Cache the drug count to a table, helps performance so we don't need to query each time.

    local player = GetPlayer(target)
    if (not player) then return 0 end

    local result = MySQL.query.await('SELECT drugssold FROM players WHERE citizenid = ?', { player.PlayerData.citizenid })
    CachedSells[target] = result[1].drugssold
    return result[1].drugssold
end

function AddDrugCount(target)
    local player = GetPlayer(target)
    if (not player) then return end

    CachedSells[target] += 1

    for k, v in pairs(Config.Ranks) do
        if (CachedSells[target] == v.SellRequirement) then
            TriggerClientEvent('trase_dealer:client:notify', target, Config.Strings['RankUp']:gsub('{TOTAL_DRUGSALE}', CachedSells[target]):gsub('{RANK_LABEL}', v.RankLabel))
        end
    end

    MySQL.query.await('UPDATE players SET drugssold = drugssold + 1 WHERE citizenid = ?', { player.PlayerData.citizenid })
end

function GetRank(target)
    local Count = CountDrugs(target)
    local Rank = 0

    for k, v in pairs(Config.Ranks) do
        if (CachedSells[target] >= v.SellRequirement and k > Rank) then
            Rank = k
        end
    end

    return Rank
end

function GetActivePolice()
    if (not Config.Police.Enabled) then return end
    local players = QBCore.Functions.GetPlayers()
    local PD = {}
    for k, v in pairs(players) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player.PlayerData.job.name == Config.Police.Job then
            PD[#PD +1] = v
        end
    end
    return PD
end

function GetPlayerJob(target)
    local player = GetPlayer(target)
    if (not player) then return end
    return player.PlayerData.job.name
end