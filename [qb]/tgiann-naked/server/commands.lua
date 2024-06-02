local adminPerm = config.framework == "qb" and "god" or "admin"

tgiCore.CommandsAdd("nakedrandom", "Reset Player's Nudity Data", { { name = "id", help = "Player Server ID" } }, true,
    function(source, args)
        nakedrandom(source, args[1])
    end, adminPerm)

tgiCore.CommandsAdd(config.commads.unclothe, config.text.unclotheDecs, {}, false, function(source, args)
    if not checkNakedDataForCommands() then return end
    local src = source
    local xPlayer = tgiCore.getPlayer(src)
    if not canUse(src, xPlayer) then return end
    local xPlayerCitizenId = tgiCore.getCid(xPlayer)
    local data = getData(xPlayerCitizenId)
    if not data or config.test then
        data = setPlayerData(src, xPlayerCitizenId)
    end
    TriggerClientEvent("tgiann-naked:setPlayerNaked", src, data)
end)

tgiCore.CommandsAdd(config.commads.unclothecolor, config.text.unclothecolorDecs, {}, false,
    function(source, _)
        local src = source
        local xPlayer = tgiCore.getPlayer(src)
        local data = getData(tgiCore.getCid(xPlayer))
        TriggerClientEvent("tgiann-naked:setPlayerNakedColor", src, data)
    end)

tgiCore.CommandsAdd(config.commads.unclothehair, config.text.unclothehairDecs, {}, false,
    function(source, _)
        local src = source
        local xPlayer = tgiCore.getPlayer(src)
        local data = getData(tgiCore.getCid(xPlayer))
        TriggerClientEvent("tgiann-naked:setPlayerNakedHairType", src, data)
    end)

tgiCore.CommandsAdd(config.commads.unclotheErect, config.text.unclotheErectDecs, {}, false,
    function(source, _)
        local src = source
        local xPlayer = tgiCore.getPlayer(src)
        local data = getData(tgiCore.getCid(xPlayer))
        TriggerClientEvent("tgiann-naked:forceErect", src, data)
    end)

tgiCore.CommandsAdd(config.commads.censor, config.text.censorDecs, {}, false, function(source, args)
    censorCommand(source)
end)
