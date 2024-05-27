if Config.FrameworkType.Active == FrameworkType.QBCORE then
    FrameworkObject = {}

    FrameworkObject.RegisterUsableItem = function(itemName, callBack)
        SharedObject.Functions.CreateUseableItem(itemName, callBack)
    end

    FrameworkObject.GetPlayerFromId = function(source)
        local xPlayer = {}
        local qbPlayer = SharedObject.Functions.GetPlayer(source)
        if not qbPlayer then
            return nil
        end
        ---------
        xPlayer.removeInventoryItem = function(itemName, count)
            qbPlayer.Functions.RemoveItem(itemName, count)
        end
        ---------
        xPlayer.addInventoryItem = function(itemName, count)
            qbPlayer.Functions.AddItem(itemName, count, false)
        end
        ---------
        xPlayer.identifier = qbPlayer.PlayerData.citizenid
        ---------
        return xPlayer
    end
end