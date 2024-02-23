SQL = {}

if not Config.Database or Config.Database == 0 then
    if GetResourceState('oxmysql') == 'started' or GetResourceState('oxmysql') == 'starting' then
        Config.Database = 1
    end

    if GetResourceState('mysql-async') == 'started' or GetResourceState('mysql-async') == 'starting' then
        Config.Database = 2
    end

    if GetResourceState('ghmattimysql') == 'started' or GetResourceState('ghmattimysql') == 'starting' then
        Config.Database = 3
    end

    if not Config.Database or Config.Database == 0 then
        print('^1[GANGS] Database not recognized^7')
    end
end

if Config.Database and Config.Database == 1 then
    if GetResourceMetadata('oxmysql', 'provide', 0) == 'mysql-async' then
        SQL.Query = function(query, params)
            return MySQL.query.await(query, params)
        end

        SQL.Scalar = function(query, params)
            return MySQL.scalar.await(query, params)
        end

        SQL.Execute = function(query, params)
            return MySQL.query.await(query, params)
        end
    else
        SQL.Query = function(query, params)
            return exports['oxmysql']:executeSync(query, params)
        end

        SQL.Scalar = function(query, params)
            return exports['oxmysql']:scalarSync(query, params)
        end

        SQL.Execute = function(query, params)
            return exports['oxmysql']:executeSync(query, params)
        end
    end
end

if Config.Database and Config.Database == 2 then
    SQL.Query = function(query, params)
        return MySQL.Sync.fetchAll(query, params)
    end

    SQL.Scalar = function(query, params)
        return MySQL.Sync.fetchScalar(query, params)
    end

    SQL.Execute = function(query, params)
        return MySQL.Sync.execute(query, params)
    end
end

if Config.Database and Config.Database == 3 then
    SQL.Query = function(query, params)
        return exports['ghmattimysql']:executeSync(query, params)
    end

    SQL.Scalar = function(query, params)
        return exports['ghmattimysql']:scalarSync(query, params)
    end

    SQL.Execute = function(query, params)
        return exports['ghmattimysql']:executeSync(query, params)
    end
end