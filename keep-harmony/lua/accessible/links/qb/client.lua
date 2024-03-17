local Player = {}

function Player.PlayerData(Core)
    return Core.Functions.GetPlayerData()
end

function Player.Money(Core)
    return Core.Functions.GetPlayerData().money
end

return {
    Player = Player
}
