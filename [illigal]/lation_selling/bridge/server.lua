local invState = GetResourceState('ox_inventory')

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
GetPlayer = function(source)
    if Framework == 'esx' then
        return ESX.GetPlayerFromId(source)
    elseif Framework == 'qb' then
        return QBCore.Functions.GetPlayer(source)
    else
        -- Add support for a custom framework here
    end
end

-- Function to get a players name
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
HasItem = function(source, item)
    local player = GetPlayer(source)
    if player == nil then
        return 0
    end
    if invState == 'started' then
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
AddItem = function(source, item, count, slot, metadata)
    local player = GetPlayer(source)
    if invState == 'started' then
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
RemoveItem = function(source, item, count, slot, metadata)
    local player = GetPlayer(source)
    if invState == 'started' then
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