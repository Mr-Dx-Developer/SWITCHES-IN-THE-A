RegisterNetEvent(TriggerName("SavePlayerData"), function(drunk_level, headache_level)
    local src = source

    if FrameworkObject then
        if FrameworkObject.GetPlayerFromId(src) then
            MySQL.Async.execute("UPDATE `drunk_stats` SET drunk_level = @drunk_level, headache_level = @headache_level  WHERE identifier = @identifier", {
                ["@identifier"] = FrameworkObject.GetPlayerFromId(src).identifier,
                ["@drunk_level"] = drunk_level,
                ["@headache_level"] = headache_level,
            })
        end
    end
end)