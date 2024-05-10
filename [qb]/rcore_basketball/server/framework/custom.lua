OGIdents = GetPlayerIdentifier

CreateThread(function()
    if Config.Framework == 3 then
        PlayerHasMoney = function(serverId, amount)
            print("Checking has money", serverId, amount)
            return true
        end

        PlayerTakeMoney = function(serverId, amount)
            print("Deducting money", serverId, amount)
        end

        PlayerGiveMoney = function(serverId, amount)
            print("Giving money", serverId, amount)
        end

        SendNotification = function(serverId, msg)
            print("Send notification", serverId, msg)
        end

        GetPlayerIdentifier = function(serverId)
            local ids = parsePlayerIdentifiers(
                {},
                CustomGetPlayerIdentifiers(serverId)
            )
        
            return ids.license and ids.license or ids.steam
        end

        PlayerHasItem = function(serverId, itemName)
            print("Checking has item", serverId, itemName)
            return true
        end

        PlayerTakeItem = function(serverId, itemName)
            print("Taking item", serverId, itemName)
        end

        PlayerGiveItem = function(serverId, itemName)
            print("Give item", serverId, itemName)
        end

        RegisterCommand('placehoop', function(serverId)
            TriggerClientEvent('rcore_basketball:startPlacingHoop', serverId)
        end, false)
    end
end)

function parsePlayerIdentifiers(ids, identifiers)
    for k,v in ipairs(identifiers)do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            ids.steam = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            ids.license = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            ids.discord = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            ids.ip = v
        elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
            ids.fivem = v
        end
    end
    
    return ids
end


function CustomGetPlayerIdentifiers(player)
    if player then
        local numIds = GetNumPlayerIdentifiers(player)
        local t = {}
        
        for i = 0, numIds - 1 do
            table.insert(t, OGIdents(player, i))
        end
        
        return t
    else
        error("COULD NOT GET PLAYER IDENTIFIERS, NO PLAYER PROVIDED")
    end
end