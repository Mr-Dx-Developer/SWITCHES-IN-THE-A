CreateCallback("snipe-menu:server:fetchPlayerListCustom", function(source, cb)
    local players = {}
    for _, player in ipairs(GetPlayers()) do
        table.insert(players, {
            id = player,
            name = GetPlayerName(player)
        })
    end
    cb(players)
end)