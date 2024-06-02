if Config.esxSettings.enabled then
    ESX = nil
    
    if Config.esxSettings.useNewESXExport then
        ESX = exports['es_extended']:getSharedObject()
    else
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
    
    function IsPlayerPolice(player)
        local xPlayer = ESX.GetPlayerFromId(player)
        if not xPlayer then
            return false
        end
        local job = xPlayer.getJob()
        
        return Contains(Config.policeJobs, job.name)
    end
    
    function GetPoliceCount()
        local currentOfficers = 0
        for _, playerId in ipairs(GetPlayers()) do
            playerId = tonumber(playerId)
            if IsPlayerPolice(playerId) then
                currentOfficers = currentOfficers + 1
            end
        end
        return currentOfficers
    end
    
    function AddPlayerMoney(player, amount, account)
        local xPlayer = ESX.GetPlayerFromId(player)
        if not xPlayer then
            return false
        end
        
        xPlayer.addAccountMoney(account or Config.esxSettings.moneyAccount, amount)
    end
    
    function CanPlayerAfford(player, amount)
        local xPlayer = ESX.GetPlayerFromId(player)
        
        if xPlayer.getAccount(Config.esxSettings.moneyAccount or 'bank').money < amount then
            return false
        end
        
        return true
    end
    
    function RemovePlayerMoney(player, amount)
        local xPlayer = ESX.GetPlayerFromId(player)
        if not xPlayer then
            return false
        end
        
        if not CanPlayerAfford(player, amount) then
            return false
        end
    
        if xPlayer.getAccount(Config.esxSettings.moneyAccount or 'bank').money >= amount then
            xPlayer.removeAccountMoney(Config.esxSettings.moneyAccount or 'bank', amount)
            return true
        end
        
        return false
    end
    
    function DoesPlayerHaveItem(player, item, amount)
        local xPlayer = ESX.GetPlayerFromId(player)
        
        return xPlayer.getInventoryItem(item).count >= (amount or 1)
    end
    
    function GetPlayerItemAmount(player, item)
        local xPlayer = ESX.GetPlayerFromId(player)
        
        return xPlayer.getInventoryItem(item).count
    end
    
    function RemovePlayerItem(player, item, amount)
        local xPlayer = ESX.GetPlayerFromId(tonumber(player))
        xPlayer.removeInventoryItem(item, amount or 1)
    end

    function AddPlayerItem(player, item, amount)
        local xPlayer = ESX.GetPlayerFromId(tonumber(player))

        -- Support for old esx which didn't use weight for inventory size but rather item limit per item type
        if Config.esxSettings.oldEsx then
            local esxItem = xPlayer.getInventoryItem(item)

            if esxItem.limit == -1 or (esxItem.count + amount) <= esxItem.limit then
                xPlayer.addInventoryItem(item, amount or 1)
                return true
            else
                return false
            end
        else
            if xPlayer.canCarryItem(item, amount or 1) then
                xPlayer.addInventoryItem(item, amount or 1)
                return true
            else
                return false
            end
        end
    end
    
    function _GetPlayerIdentifier(player)
        local xPlayer = ESX.GetPlayerFromId(player)
        
        return xPlayer.identifier
    end
end
