if Config.FrameworkType.Active == FrameworkType.CUSTOM then
    FrameworkObject = {}
    FrameworkObject.RegisterUsableItem = function(...)

    end

    function PlayerIdentifier(source)
        local identifier = "none"

        for k, v in ipairs(GetPlayerIdentifiers(source)) do
            if string.match(v, 'license:') then
                identifier = string.sub(v, 9)
                break
            end
        end

        return identifier
    end

    FrameworkObject.GetPlayerFromId = function(source)
        local xPlayer = {}
        ---------
        xPlayer.removeInventoryItem = function(itemName, count)

        end
        ---------
        xPlayer.identifier = PlayerIdentifier(source)
        ---------
        return xPlayer
    end
end