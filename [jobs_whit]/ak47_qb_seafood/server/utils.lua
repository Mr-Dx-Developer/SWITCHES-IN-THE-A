QBCore = exports['qb-core']:GetCoreObject()

function getSocietyMoney()
    if Config.SocietyInManagement then
        return exports['qb-management']:GetAccount('pearls')
    else
        return exports['qb-banking']:GetAccountBalance('pearls')
    end
end

function addSocietyMoney(money)
    if Config.SocietyInManagement then
        exports['qb-management']:AddMoney('pearls', money)
    else
        exports['qb-banking']:AddMoney('pearls', money)
    end
end

function removeSocietyMoney(money)
    if Config.SocietyInManagement then
        exports['qb-management']:RemoveMoney('pearls', money)
    else
        exports['qb-banking']:RemoveMoney('pearls', money)
    end
end

function CanCarryItem(id, item, amount)
    return true -- There is no way to check can caryy item in latest qb.
end

function GetItemLabel(item)
    return QBCore.Shared.Items[item].label
end

function GetPlayerFromId(id)
    return QBCore.Functions.GetPlayer(id).Functions
end

function getMoney(id)
    local xPlayer = QBCore.Functions.GetPlayer(id)
    return xPlayer.PlayerData.money['cash']
end