Framework:Core()

QBCore.Commands.Add("logout", 'Logout Character (Admin Only)', {}, false, function(source)
    local src = source
    SetPlayerRoutingBucket(src, src)
    QBCore.Player.Logout(src)
    TriggerClientEvent('um-multicharacter:client:logout', src)
end, 'admin')

QBCore.Commands.Add("mcnui", 'Nui Close (stuck maybe?)', {}, false, function(source)
    local src = source
    TriggerClientEvent('um-multicharacter:client:setNuiClose', src)
end)