---TAKEN FROM rcore framework
---https://githu.com/Isigar/relisoft_core
---https://docs.rcore.cz
local serverCallbacks = {}
local callbacksRequestsHistory = {}

function registerCallback(cbName, callback)
    serverCallbacks[cbName] = callback
end

RegisterNetEvent(TriggerName('callCallback'))
AddEventHandler(TriggerName('callCallback'), function(name, requestId, ...)
    local source = source
    if serverCallbacks[name] == nil then
        return
    end
    callbacksRequestsHistory[requestId] = {
        name = name,
        source = source,
    }
    local call = serverCallbacks[name]
    call(source, function(...)
        TriggerClientEvent(TriggerName('callback'), source, requestId, ...)
    end, ...)
end)

if Config.DisableMySQL then
    MySQL = {}
    MySQL.Sync = {}
    MySQL.Async = {}

    MySQL.Async.fetchAll = function(query, table_, cb)
        return {}
    end

    MySQL.Sync.fetchAll = function(query, table_, cb)
        return {}
    end

    MySQL.Async.execute = function(query, table_, cb)
        return 1
    end

    MySQL.Sync.execute = function(query, table_, cb)
        return 1
    end

    MySQL.Async.fetchScalar = function(query, table_, cb)
        return {}
    end

    MySQL.Sync.fetchScalar = function(query, table_, cb)
        return {}
    end

    MySQL.ready = function()

    end
end