RegisterNetEvent('kq_priv_islands:server:purchase')
AddEventHandler('kq_priv_islands:server:purchase', function(islandKey)
    local player = source
    local islandData = FindIslandByName(islandKey)
    
    if IsIslandOwned(islandKey) then
        Debug('not for sale')
        TriggerClientEvent('kq_priv_islands:client:popup', player, L('Transaction declined'), L('This island is not for sale'))
        return
    end
    
    if DoesPlayerOwnAnyIslands(player) then
        Debug('already owns an island')
        TriggerClientEvent('kq_priv_islands:client:popup', player, L('Transaction declined'), L('You already own an island'))
        return
    end
    
    if not CanPlayerAfford(player, islandData.initialPrice) then
        Debug('cant afford')
        TriggerClientEvent('kq_priv_islands:client:popup', player, L('Transaction declined'), L('You can not afford this purchase'))
        return
    end
    
    CommitIslandOwnership(player, islandKey)
    
    RemovePlayerMoney(player, islandData.initialPrice)
    
    TriggerClientEvent('kq_priv_islands:client:purchaseSuccess', player, islandKey)
end)

function CommitIslandOwnership(player, islandKey)
    local playerIdentifier = _GetPlayerIdentifier(player)
    
    local query = "INSERT INTO kq_islands (`owner`, `island`) VALUES(@owner, @island);"
    local data = {
        ['@owner'] = playerIdentifier,
        ['@island'] = islandKey,
    }
    
    SqlInsert(query, data)
    
    
    LoadOwnedIslands()
end

function UpdateIslandOwnership(player, islandKey)
    local playerIdentifier = _GetPlayerIdentifier(player)
    
    local query = "UPDATE kq_islands SET `owner` = @owner WHERE island = @island;"
    local data = {
        ['@owner'] = playerIdentifier,
        ['@island'] = islandKey,
    }
    
    SqlInsert(query, data)
    
    LoadOwnedIslands()
end
