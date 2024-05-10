module 'shared/debug'
module 'shared/resource'

include(Bridge.DatabaseName, 'lib/MySQL')

Version = resource.version(Bridge.DatabaseName)
Bridge.Debug('Database', Bridge.DatabaseName, Version)

Database.insert = function(query, data, cb)
    if cb then
        MySQL.insert(query, data, cb)
    else
        return MySQL.insert.await(query, data)
    end
end

Database.prepare = function(query, data, cb)
    if cb then
        MySQL.prepare(query, data, cb)
    else
        return MySQL.prepare.await(query, data)
    end
end

Database.query = function(query, data, cb)
    if cb then
        MySQL.query(query, data, cb)
    else
        return MySQL.query.await(query, data)
    end
end

Database.scalar = function(query, data, cb)
    if cb then
        MySQL.scalar(query, data, cb)
    else
        return MySQL.scalar.await(query, data)
    end
end

Database.single = function(query, data, cb)
    if cb then
        MySQL.single(query, data, cb)
    else
        return MySQL.single.await(query, data)
    end
end

Database.transaction = function(queries, cb)
    if cb then
        MySQL.transaction(queries, cb)
    else
        return MySQL.transaction.await(queries)
    end
end

Database.update = function(query, data, cb)
    if cb then
        MySQL.update(query, data, cb)
    else
        return MySQL.update.await(query, data)
    end
end