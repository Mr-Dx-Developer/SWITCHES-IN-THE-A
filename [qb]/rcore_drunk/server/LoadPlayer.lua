function GenerateToughnessForPlayer()
    local RandomPercentage = GetRandomPercentage()
    if 0 < RandomPercentage and 70 > RandomPercentage then
        return 0
    end
    if 71 < RandomPercentage and 89 > RandomPercentage then
        return 1
    end
    if 90 < RandomPercentage and 100 > RandomPercentage then
        return 2
    end
    return 0
end

RegisterNetEvent(TriggerName("FetchPlayerDrunkLevel"), function()
    local src = source
    local xPlayer = FrameworkObject.GetPlayerFromId(src)
    if xPlayer then
        if xPlayer.identifier then
            MySQL.Async.fetchAll("SELECT * FROM drunk_stats WHERE identifier = @identifier", {
                ["@identifier"] = xPlayer.identifier
            }, function(result)
                if next(result) == nil then
                    local toughness = GenerateToughnessForPlayer()
                    MySQL.Async.execute("INSERT INTO `drunk_stats` (`identifier`, `drunk_level`, `headache_level`, `toughness`) VALUES (@identifier, @drunk_level, @headache_level, @toughness)", {
                        ["@identifier"] = xPlayer.identifier,
                        ["@drunk_level"] = 0,
                        ["@headache_level"] = 0,
                        ["@toughness"] = toughness,
                    })

                    TriggerClientEvent(TriggerName("SetPlayerData"), src, {
                        drunk_level = 0,
                        headache_level = 0,
                        toughness = toughness,
                    })
                else
                    TriggerClientEvent(TriggerName("SetPlayerData"), src, result[1])
                end
            end)
        end
    end
end)