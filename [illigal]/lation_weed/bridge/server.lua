-- Check for ox_inventory
local ox_inv = GetResourceState('ox_inventory') == 'started'

-- Get framework
if GetResourceState('es_extended') == 'started' then
    ESX = exports['es_extended']:getSharedObject()
    Framework = 'esx'
elseif GetResourceState('qb-core') == 'started' then
    QBCore = exports['qb-core']:GetCoreObject()
    Framework = 'qb'
else
    -- Add support for a custom framework here
    print('Error: no framework detected')
end

-- Get player from source
--- @param source number Player ID
GetPlayer = function(source)
    if not source then return end
    if Framework == 'esx' then
        return ESX.GetPlayerFromId(source)
    elseif Framework == 'qb' then
        return QBCore.Functions.GetPlayer(source)
    else
        -- Add support for a custom framework here
    end
end

-- Get player from identifier
--- @param identifier string Player identifier/citizenId
GetPlayerByIdentifier = function(identifier)
    if Framework == 'esx' then
        return ESX.GetPlayerFromIdentifier(identifier)
    elseif Framework == 'qb' then
        return QBCore.Functions.GetPlayerByCitizenId(identifier)
    else
        -- Add support for a custom framework here
    end
end

-- Function to get a players identifier
--- @param source number Player ID
GetPlayerIdentifier = function(source)
    local player = GetPlayer(source)
    if not player then return end
    if Framework == 'esx' then
        return player.identifier
    elseif Framework == 'qb' then
        return player.PlayerData.citizenid
    else
        -- Add support for a custom framework here
    end
end

-- Function to return all players
GetAllPlayers = function()
    if Framework == 'esx' then
        return ESX.GetExtendedPlayers()
    elseif Framework == 'qb' then
        return QBCore.Functions.GetQBPlayers()
    else
        -- Add support for a custom framework here
    end
end

-- Function to get a players name
--- @param source number Player ID
GetName = function(source)
    local player = GetPlayer(source)
    if not player then return end
    if Framework == 'esx' then
        return player.getName()
    elseif Framework == 'qb' then
        return player.PlayerData.charinfo.firstname..' '..player.PlayerData.charinfo.lastname
    else
        -- Add support for a custom framework here
    end
end

-- Function to register a usable item
RegisterUsableItem = function(...)
    if Framework == 'esx' then
        ESX.RegisterUsableItem(...)
    elseif Framework == 'qb' then
        QBCore.Functions.CreateUseableItem(...)
    else
        -- Add support for a custom framework here
    end
end

-- Function used to check players weight
--- @param source number
--- @param item string
--- @param count number
CanCarry = function(source, item, count)
    local player = GetPlayer(source)
    if not player then return end
    if ox_inv then
        if exports.ox_inventory:CanCarryItem(source, item, count) then
            return true
        end
        return false
    else
        if Framework == 'esx' then
            if player.canCarryItem(item, count) then
                return true
            end
            TriggerClientEvent('lation_weed:Notify', source, 'You can not carry that much', 'error')
            return false
        elseif Framework == 'qb' then
            local totalWeight = QBCore.Player.GetTotalWeight(player.PlayerData.items)
            local itemData = QBCore.Shared.Items[item:lower()]
            if (totalWeight + (itemData['weight'] * count)) <= 120000 then
                return true
            end
            TriggerClientEvent('lation_weed:Notify', source, 'You can not carry that much', 'error')
            return false
        else
            -- Add support for a custom framework here
        end
    end
end

-- Function to add an item to inventory
--- @param source number Player ID
--- @param item string Item name
--- @param count number Quantity
--- @param metadata table | nil
AddItem = function(source, item, count, metadata)
    if count <= 0 then return end
    local player = GetPlayer(source)
    if not player then return end
    if ox_inv then
        if not exports.ox_inventory:CanCarryItem(source, item, count, metadata) then return end
        exports.ox_inventory:AddItem(source, item, count, metadata)
    else
        if Framework == 'esx' then
            if not player.canCarryItem(item, count) then return end
            player.addInventoryItem(item, count, metadata)
        elseif Framework == 'qb' then
            player.Functions.AddItem(item, count, metadata)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
        else
            -- Add support for a custom framework here
        end
    end
end

-- Function to remove an item from inventory
--- @param source number Player ID
--- @param item string Item name
--- @param count number Quantity
--- @param metadata table | nil
RemoveItem = function(source, item, count, metadata)
    local player = GetPlayer(source)
    if not player then return end
    if ox_inv then
        exports.ox_inventory:RemoveItem(source, item, count, metadata)
    else
        if Framework == 'esx' then
            player.removeInventoryItem(item, count, metadata)
        elseif Framework == 'qb' then
            player.Functions.RemoveItem(item, count, metadata)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
        else
            -- Add support for a custom framework here
        end
    end
end

-- Function used to convert money type
--- @param moneyType string
ConvertMoneyType = function(moneyType)
    if moneyType == 'money' and Framework == 'qb' then
        moneyType = 'cash'
    elseif moneyType == 'cash' and Framework == 'esx' then
        moneyType = 'money'
    end
    return moneyType
end

-- Function used to check players balance
--- @param source number
--- @param moneyType string
GetPlayerAccountFunds = function(source, moneyType)
    local player = GetPlayer(source)
    if not player then return end
    moneyType = ConvertMoneyType(moneyType)
    if Framework == 'qb' then
        return player.PlayerData.money[moneyType]
    elseif Framework == 'esx' then
        return player.getAccount(moneyType).money
    else
        -- Add support for a custom framework here
    end
end

-- Function used to remove money from account
--- @param source number
--- @param moneyType string
--- @param amount number
RemoveMoney = function(source, moneyType, amount)
    local player = GetPlayer(source)
    if not player then return end
    moneyType = ConvertMoneyType(moneyType)
    if player then
        if Framework == 'esx' then
            player.removeAccountMoney(moneyType, amount)
        elseif Framework == 'qb' then
            player.Functions.RemoveMoney(moneyType, amount)
        end
    end
end

-- Function use to count number of players with job are online
--- @param jobName table
GetPlayersWithJob = function(jobName)
    local jobCount = 0
    if Framework == 'esx' then
        for _, player in pairs(GetAllPlayers()) do
            local job = player.getJob()
            for _, jobs in pairs(jobName) do
                local jobNames = jobs
                if job.name == jobNames then
                    jobCount = jobCount + 1
                end
            end
        end
    elseif Framework == 'qb' then
        local players = QBCore.Functions.GetQBPlayers()
        for _, player in pairs(players) do
            local job = player.PlayerData.job
            for _, jobs in pairs(jobName) do
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