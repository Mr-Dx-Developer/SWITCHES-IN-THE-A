local Player = {}
local ox_inventory = exports.ox_inventory

function Player.PlayerData(ESX)
    return { items = ox_inventory:GetPlayerItems() }
end

function Player.Money(ESX)
    return ESX.PlayerData.money
end

return {
    Player = Player
}
