if Config.qbSettings.enabled then

    if Config.qbSettings.useNewQBExport then
        QBCore = exports['qb-core']:GetCoreObject()
    end
    
    function IsPlayerPolice(player)
        local xPlayer = QBCore.Functions.GetPlayer(player)
        if not xPlayer then
            return false
        end
        
        local job = xPlayer.PlayerData.job
        
        return Contains(Config.policeJobs, job.name)
    end
    
    function GetPoliceCount()
        local currentOfficers = 0
        for _, playerId in ipairs(GetPlayers()) do
            playerId = tonumber(playerId)
            if IsPlayerPolice(playerId) then
                Debug('check successful')
                currentOfficers = currentOfficers + 1
            end
        end
        return currentOfficers
    end
    
    function AddPlayerMoney(player, amount, account)
        local xPlayer = QBCore.Functions.GetPlayer(player)
        
        if not xPlayer then
            return false
        end
        
        xPlayer.Functions.AddMoney(account or Config.qbSettings.moneyAccount, amount)
    end
    
    function CanPlayerAfford(player, amount)
        local xPlayer = QBCore.Functions.GetPlayer(player)
        
        if xPlayer.Functions.GetMoney(Config.qbSettings.moneyAccount) == nil then
            Debug('^6Invalid money account set!')
        end
        
        if xPlayer.Functions.GetMoney(Config.qbSettings.moneyAccount) < amount then
            return false
        end
        
        return true
    end
    
    function DoesPlayerHaveItem(player, item, amount)
        local xPlayer = QBCore.Functions.GetPlayer(player)
        
        return xPlayer.Functions.GetItemByName(item) and xPlayer.Functions.GetItemByName(item).amount >= (amount or 1)
    end
    
    function GetPlayerItemAmount(player, item)
        local xPlayer = QBCore.Functions.GetPlayer(player)
        
        return xPlayer.Functions.GetItemByName(item).amount
    end
    
    function RemovePlayerMoney(player, amount)
        local xPlayer = QBCore.Functions.GetPlayer(player)
        
        if not xPlayer then
            return false
        end
        
        return xPlayer.Functions.RemoveMoney(Config.qbSettings.moneyAccount, amount)
    end

    function RemovePlayerItem(player, item, amount)
        local xPlayer = QBCore.Functions.GetPlayer(tonumber(player))
        xPlayer.Functions.RemoveItem(item, amount or 1)
    end

    function AddPlayerItem(player, item, amount)
        local xPlayer = QBCore.Functions.GetPlayer(tonumber(player))
        return xPlayer.Functions.AddItem(item, amount or 1)
    end
    
    function _GetPlayerIdentifier(player)
        local xPlayer = QBCore.Functions.GetPlayer(tonumber(player))
        
        return xPlayer.PlayerData.citizenid
    end
end
