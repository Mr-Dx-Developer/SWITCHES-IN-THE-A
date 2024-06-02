local sqlDriver = Config.sql.driver

function SqlFetch(query, data)
    if sqlDriver == 'mysql' then
        return MySQL.Sync.fetchAll(query, data or {})
    end
    
    if sqlDriver == 'oxmysql' then
        if Config.sql.newOxMysql then
            return exports[sqlDriver]:fetchSync(query, data)
        end
        return exports[sqlDriver]:query_async(query, data)
    else
        return exports[sqlDriver]:executeSync(query, data)
    end
end

function SqlInsert(query, data)
    if sqlDriver == 'mysql' then
        MySQL.Sync.insert(query, data)
        return
    end
    
    if sqlDriver == 'oxmysql' then
        exports[sqlDriver]:insertSync(query, data)
    else
        exports[sqlDriver]:executeSync(query, data)
    end
end

if Config.purchasing.adminCommand then
    RegisterCommand('setIslandOwner', function(source, args)
        local source_ = source
        local player = tonumber(args[1])
        local islandKey = args[2]

        if not FindIslandByName(islandKey) then
            TriggerClientEvent('kq_priv_islands:client:popup', source_, L('Error'), L('Invalid island name'))
            return
        end
    
        if IsIslandOwned(islandKey) then
            TriggerClientEvent('kq_priv_islands:client:popup', source_, L('Error'), L('This island is already owned by another player'))
            return
        end
    
        if GetPlayerPed(player) == 0 then
            TriggerClientEvent('kq_priv_islands:client:popup', source_, L('Error'), L('This player is not online'))
            return
        end
    
        if DoesPlayerOwnAnyIslands(player) then
            TriggerClientEvent('kq_priv_islands:client:popup', source_, L('Error'), L('This player already owns an island'))
            return
        end
    
    
        CommitIslandOwnership(player, islandKey)
        
        TriggerClientEvent('kq_priv_islands:client:popup', source_, L('Success'), L('{PLAYER} now owns an island'):gsub('{PLAYER}', GetPlayerName(player)), 'OKAY')
    end, true)
end

if Config.purchasing.transferCommand.enabled then
    RegisterCommand('transferIsland', function(source, args)
        local source_ = source
        local player = tonumber(args[1])
        
        local doesOwn, islandKey = DoesPlayerOwnAnyIslands(source_)
        if not doesOwn then
            TriggerClientEvent('kq_priv_islands:client:popup', source_, L('Error'), L('You do not own any islands'))
            return
        end
        
        if GetPlayerPed(player) == 0 then
            TriggerClientEvent('kq_priv_islands:client:popup', source_, L('Error'), L('This player is not online'))
            return
        end
        
        if DoesPlayerOwnAnyIslands(player) then
            TriggerClientEvent('kq_priv_islands:client:popup', source_, L('Error'), L('This player already owns an island'))
            return
        end
        
        UpdateIslandOwnership(player, islandKey)
        local island = FindIslandByName(islandKey)
        
        TriggerClientEvent('kq_priv_islands:client:popup', source_, L('Success'), L('{PLAYER} now owns ' .. island.label):gsub('{PLAYER}', GetPlayerName(player)), 'OKAY')
    end, Config.purchasing.transferCommand.adminOnly)
end
