if Prison.MySQL == nil then
    if IsScriptLoaded("oxmysql") then
        Prison.MySQL = 0
    elseif IsScriptLoaded("mysql-async") then
        Prison.MySQL = 1
    elseif IsScriptLoaded("ghmattimysql") then 
        Prison.MySQL = 2
    end
end

if Prison.MySQL == 2 then
    MySQL = {}
    MySQL.Sync = {}
    MySQL.Async = {}

    MySQL.transaction = function(queries, parameters, cb) 
        return exports['ghmattimysql']:transactionSync(queries, parameters, cb)
    end

    MySQL.Sync.prepare = function(query, table_, cb)
        return exports['ghmattimysql']:prepare(query, table_, cb)
    end

    MySQL.Sync.fetchSingle = function(query, table_, cb)
        return exports['ghmattimysql']:single(query, table_, cb)
    end

    MySQL.Async.fetchAll = function(query, table_, cb)
        return exports['ghmattimysql']:execute(query, table_, cb)
    end

    MySQL.Sync.fetchAll = function(query, table_, cb)
        return exports['ghmattimysql']:executeSync(query, table_, cb)
    end

    MySQL.Async.execute = function(query, table_, cb)
        return exports['ghmattimysql']:execute(query, table_, cb)
    end

    MySQL.Sync.insert = function(query, table_, cb)
        return exports['ghmattimysql']:executeSync(query, table_, cb)
    end

    MySQL.Sync.execute = function(query, table_, cb)
        return exports['ghmattimysql']:executeSync(query, table_, cb)
    end

    MySQL.Async.fetchScalar = function(query, table_, cb)
        return exports['ghmattimysql']:scalar(query, table_, cb)
    end

    MySQL.Sync.fetchScalar = function(query, table_, cb)
        return exports['ghmattimysql']:scalarSync(query, table_, cb)
    end
end