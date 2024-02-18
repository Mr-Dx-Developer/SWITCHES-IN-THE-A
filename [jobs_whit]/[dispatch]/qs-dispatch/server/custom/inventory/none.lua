if Config.InventorySystem ~= "none" then
    return
end

function RemoveIlegalItems(playerId)
    WarningPrint('Server Cant Remove Ilegal Items, Inventory System is None, configure your inventory system in config.lua or add custom in server/custom/inventory/*.lua')
end

AddEventHandler("qs-dispatch:server:RemoveIlegalItems", RemoveIlegalItems)