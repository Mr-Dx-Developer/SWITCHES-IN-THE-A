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

-- Function used to return item count
--- @param source number
--- @param item string
ItemCount = function(source, item)
    if not source then return 0 end
    local player = GetPlayer(source)
    if not player then return 0 end
    if ox_inv then
        local count = exports.ox_inventory:Search(source, 'count', item)
        return count or 0
    else
        if Framework == 'esx' then
            local item = player.getInventoryItem(item)
            if not item then return 0 end
            local count = item.count or item.amount
            return count or 0
        elseif Framework == 'qb' then
            local item = player.Functions.GetItemByName(item)
            if not item then return 0 end
            local count = item.amount or item.count
            return count or 0
        else
            -- Add support for a custom framework here
        end
    end
end

-- Function to check a players group
--- @param source number
--- @param filter string
CheckPlayerGroup = function(source, filter)
    local player = GetPlayer(source)
    if not player then return end
    if Framework == 'esx' then
        local type = type(filter)
        if type == 'string' then
            if player.job.name == filter then
                return player.job.name, player.job.grade
            end
        else
            local tabletype = table.type(filter)
            if tabletype == 'hash' then
                local grade = filter[player.job.name]
                if grade and grade <= player.job.grade then
                    return player.job.name, player.job.grade
                end
            elseif tabletype == 'array' then
                for i = 1, #filter do
                    if player.job.name == filter[i] then
                        return player.job.name, player.job.grade
                    end
                end
            end
        end
    elseif Framework == 'qb' then
        local groups = { 'job', 'gang' }
        local type = type(filter)
        if type == 'string' then
            for i = 1, #groups do
                local data = player.PlayerData[groups[i]]

                if data.name == filter then
                    return data.name, data.grade.level
                end
            end
        else
            local tabletype = table.type(filter)
            if tabletype == 'hash' then
                for i = 1, #groups do
                    local data = player.PlayerData[groups[i]]
                    local grade = filter[data.name]
                    if grade and grade <= data.grade.level then
                        return data.name, data.grade.level
                    end
                end
            elseif tabletype == 'array' then
                for i = 1, #filter do
                    local group = filter[i]
                    for j = 1, #groups do
                        local data = player.PlayerData[groups[j]]
                        if data.name == group then
                            return data.name, data.grade.level
                        end
                    end
                end
            end
        end
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

-- Function used to add money to account
--- @param source number
--- @param moneyType string
--- @param amount number
AddMoney = function(source, moneyType, amount)
    local player = GetPlayer(source)
    if not player then return end
    moneyType = ConvertMoneyType(moneyType)
    if Framework == 'esx' then
        player.addAccountMoney(moneyType, amount)
    elseif Framework == 'qb' then
        player.Functions.AddMoney(moneyType, amount)
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
    if Framework == 'esx' then
        player.removeAccountMoney(moneyType, amount)
    elseif Framework == 'qb' then
        player.Functions.RemoveMoney(moneyType, amount)
    end
end