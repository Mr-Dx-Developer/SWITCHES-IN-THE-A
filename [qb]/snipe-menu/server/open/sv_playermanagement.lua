CreateCallback("snipe-menu:server:getAllUniquePlayers", function(source, cb)
    local addedLicenses = {}
    local returnData = {}
    if Config.Core == "QBCore" then
        -- grab firstname and lastname from players table
        local player = MySQL.query.await('SELECT citizenid, JSON_VALUE(players.charinfo, "$.firstname") as firstname, JSON_VALUE(players.charinfo, "$.lastname") as lastname FROM players')
        if player ~= nil then
            for k, v in pairs(player) do
                returnData[#returnData + 1] = {
                    id = v.citizenid,
                    name = v.firstname.." "..v.lastname
                }
            end
        end
    elseif Config.Core == "ESX" then
        local player = MySQL.query.await('SELECT DISTINCT identifier, firstname, lastname FROM users')
        if player ~= nil then
            
            for k, v in pairs(player) do
                local extracted = v.identifier
                if not addedLicenses[extracted] then
                    returnData[#returnData + 1] = {
                        id = extracted,
                        name = v.firstname .. " " .. v.lastname
                    }
                    addedLicenses[extracted] = true
                end
            end
        end
    end
    cb(returnData)
end)

local wipeTables = {
    QBCore = {
        ['players'] = "citizenid",
        ["player_vehicles"] = "citizenid",
        ['player_houses'] = "citizenid",
    },
    ESX = {
        ['users'] = "identifier",
        ["owned_vehicles"] = "owner"
    }
}


RegisterServerEvent("snipe-menu:server:wipePlayer", function(id)
    local src = source
    if onlineAdmins[src] then
        SendLogs(source, "triggered", Config.Locales["wiped_player"]..id)
        if Config.Core == "QBCore" then
            for k, v in pairs(wipeTables.QBCore) do
                MySQL.Async.execute('DELETE FROM '..k..' WHERE '..v..' = @id', {
                    ['@id'] = id
                }, function(rowsChanged)
                    print("Wiped "..rowsChanged.." rows from "..k)
                end)
            end
        elseif Config.Core == "ESX" then
            for k, v in pairs(wipeTables.ESX) do
                MySQL.Async.execute('DELETE FROM '..k..' WHERE '..v..' = @id', {
                    ['@id'] = id
                }, function(rowsChanged)
                    print("Wiped "..rowsChanged.." rows from "..k)
                end)
            end
        end
    end
end)

AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    deferrals.defer()
    local playerId = source -- added
    local isBanned, Reason = IsPlayerBanned(playerId) -- added
    
        
    if isBanned then -- added
        deferrals.done(Reason) -- added
    else -- added
        deferrals.done()
    end -- added
end)