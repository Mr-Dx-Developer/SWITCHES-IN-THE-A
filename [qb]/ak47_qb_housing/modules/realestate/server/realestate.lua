RegisterCommand(Config.Commands.createhouse, function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local isAdmin = Config.AdminWithLicense[GetIdentifier(source, 'license')] or Config.AdminWithCitizenId[xPlayer.PlayerData.citizenid] or false
    if (xPlayer.PlayerData.job.name == Config.Realestate.Job and xPlayer.PlayerData.job.grade.level >= Config.Realestate.createhouserank) or isAdmin then
        TriggerClientEvent('ak47_qb_housing:createhouse', source)
    else
        TriggerClientEvent('ak47_qb_housing:notify', source, _U('nopermission'))
    end
end)

RegisterCommand(Config.Commands.deletehouse, function(source, args)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local isAdmin = Config.AdminWithLicense[GetIdentifier(source, 'license')] or Config.AdminWithCitizenId[xPlayer.PlayerData.citizenid] or false
    if (xPlayer.PlayerData.job.name == Config.Realestate.Job and xPlayer.PlayerData.job.grade.level >= Config.Realestate.deletehouserank) or isAdmin then
        TriggerClientEvent('ak47_qb_housing:deletehouse:agent', source)
    else
        TriggerClientEvent('ak47_qb_housing:notify', source, _U('nopermission'))
    end
end)
