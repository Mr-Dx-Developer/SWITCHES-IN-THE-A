if Config.Core == "ESX" then
    ESX = Config.CoreExport()

    ESX.RegisterServerCallback('vms_spawnselector:getLastPosition', function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        local result = MySQL.query.await('SELECT position FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier})
        if result[1] then
            cb(json.decode(result[1].position))
        else
            cb(nil)
        end
    end)

    ESX.RegisterServerCallback('vms_spawnselector:getDeadStatus', function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        local result = MySQL.query.await('SELECT is_dead FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier})
        if result[1] then
            cb(result[1].is_dead)
        else
            cb(nil)
        end
    end)
elseif Config.Core == "QB-Core" then
    QBCore = Config.CoreExport()

end