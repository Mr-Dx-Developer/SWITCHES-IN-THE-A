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
    return
end

-- Get player from source
--- @param source number
GetPlayer = function(source)
    if Framework == 'esx' then
        return ESX.GetPlayerFromId(source)
    elseif Framework == 'qb' then
        return QBCore.Functions.GetPlayer(source)
    else
        -- Add support for a custom framework here
    end
end

-- Function to get a player identifier by source
--- @param source number
GetIdentifier = function(source)
    local player = GetPlayer(source)
    if player then
        if Framework == 'esx' then
            return player.getIdentifier()
        elseif Framework == 'qb' then
            return player.PlayerData.citizenid
        else
            -- Add support for custom framework here
        end
    end
end

-- Function to get a players name
--- @param source number
GetName = function(source)
    local player = GetPlayer(source)
    if player then
        if Framework == 'esx' then
            return player.getName()
        elseif Framework == 'qb' then
            return player.PlayerData.charinfo.firstname..' '..player.PlayerData.charinfo.lastname
        end
    end
end

-- Function to return the specific amount of an item
--- @param source number
--- @param item string
HasItem = function(source, item)
    local player = GetPlayer(source)
    if player == nil then
        return 0
    end
    if ox_inv then
        local count = exports.ox_inventory:Search(source, 'count', item)
        return count
    else
        if Framework == 'esx' then
            local item = player.getInventoryItem(item)
            if item ~= nil then
                return item.count
            else
                return 0
            end
        elseif Framework == 'qb' then
            local item = player.Functions.GetItemByName(item)
            if item ~= nil then
                return item.amount
            else
                return 0
            end
        else
            -- Add support for a custom framework here
        end
    end
end

-- Function to add an item to inventory
--- @param source number
--- @param item string
--- @param count number
--- @param slot any
--- @param metadata any
AddItem = function(source, item, count, slot, metadata)
    local player = GetPlayer(source)
    if ox_inv then
        return exports.ox_inventory:AddItem(source, item, count, metadata, slot)
    else
        if Framework == 'esx' then
            return player.addInventoryItem(item, count, metadata, slot)
        elseif Framework == 'qb' then
            player.Functions.AddItem(item, count, slot, metadata)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
        else
            -- Add support for a custom framework here
        end
    end
end

-- Function to remove an item from inventory
--- @param source number
--- @param item string
--- @param count number
--- @param slot any
--- @param metadata any
RemoveItem = function(source, item, count, slot, metadata)
    local player = GetPlayer(source)
    if ox_inv then
        return exports.ox_inventory:RemoveItem(source, item, count, metadata, slot)
    else
        if Framework == 'esx' then
            return player.removeInventoryItem(item, count, metadata, slot)
        elseif Framework == 'qb' then
            player.Functions.RemoveItem(item, count, slot, metadata)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove")
        else
            -- Add support for a custom framework here
        end
    end
end

-- Function to convert moneyType to match framework
--- @param moneyType string
ConvertMoneyType = function(moneyType)
    if moneyType == 'money' and Framework == 'qb' then
        moneyType = 'cash'
    elseif moneyType == 'cash' and Framework == 'esx' then
        moneyType = 'money'
    else
        -- Add support for a custom framework here
    end
    return moneyType
end

-- Function to add money to a players account
--- @param source number
--- @param moneyType string
--- @param amount number
AddMoney = function(source, moneyType, amount)
    local player = GetPlayer(source)
    moneyType = ConvertMoneyType(moneyType)
    if player then
        if Framework == 'esx' then
            player.addAccountMoney(moneyType, amount)
        elseif Framework == 'qb' then
            player.Functions.AddMoney(moneyType, amount)
        else
            -- Add support for a custom framework here
        end
    end
end

-- Function to remove money from a player's account
--- @param source number
--- @param moneyType string
--- @param amount number
RemoveMoney = function(source, moneyType, amount)
    local player = GetPlayer(source)
    moneyType = ConvertMoneyType(moneyType)
    if player then
        if Framework == 'esx' then
            player.removeAccountMoney(moneyType, amount)
        elseif Framework == 'qb' then
            player.Functions.RemoveMoney(moneyType, amount)
        else
            -- Add support for a custom framework here
        end
    end
end

-- Function to get the amount of money in a player's account of a specific type
--- @param source number
--- @param moneyType string
GetPlayerAccountFunds = function(source, moneyType)
    local player = GetPlayer(source)
    moneyType = ConvertMoneyType(moneyType)
    if Framework == 'qb' then
        return player.PlayerData.money[moneyType]
    elseif Framework == 'esx' then
        return player.getAccount(moneyType).money
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

-- Returns true or false if player has specified job
--- @param source number
--- @param filter string
HasJob = function(source, filter)
    local player = GetPlayer(source)
    if Framework == 'esx' then
        local type = type(filter)
        if type == 'string' then
            if player.job.name == filter then
                return true
            end
        end
        return false
    elseif Framework == 'qb' then
        local groups = { 'job', 'gang' }
        local type = type(filter)
        if type == 'string' then
            for i = 1, #groups do
                local data = player.PlayerData[groups[i]]
                if data.name == filter then
                    if groups[i] == 'job' and not player.PlayerData.job.onduty then
                        return false
                    end
                    return true
                end
            end
            return false
        end
    end
end