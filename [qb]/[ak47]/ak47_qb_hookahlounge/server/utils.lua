QBCore = exports['qb-core']:GetCoreObject()

function getSocietyMoney()
    if Config.SocietyInManagement then
        return exports['qb-management']:GetAccount('hookahlounge')
    else
        return exports['qb-banking']:GetAccountBalance('hookahlounge')
    end
end

function addSocietyMoney(money)
    if Config.SocietyInManagement then
        exports['qb-management']:AddMoney('hookahlounge', money)
    else
        exports['qb-banking']:AddMoney('hookahlounge', money)
    end
end

function removeSocietyMoney(money)
    if Config.SocietyInManagement then
        exports['qb-management']:RemoveMoney('hookahlounge', money)
    else
        exports['qb-banking']:RemoveMoney('hookahlounge', money)
    end
end

function CanCarryItem(id, item, amount)
	return true -- There is no way to check can caryy item in latest qb.
end

function hasEnoughItem(source, item, quantity)
    local quantity = quantity or 1
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local inv = xPlayer.Functions.GetItemByName(item)
    if inv and ((inv.amount and inv.amount >= quantity) or (inv.count and inv.count >= quantity)) then
        return true
    end
    return false
end

function GetItemLabel(item)
    if QBCore.Shared and QBCore.Shared.Items and QBCore.Shared.Items[item] then
	   return QBCore.Shared.Items[item].label
    else
        print('^1Item: ^3['..item..']^1 missing in qb-core/shared/items.lua^0')
        return item
    end
end

function GetPlayerFromId(id)
	return QBCore.Functions.GetPlayer(id).Functions
end

function getMoney(id)
	local xPlayer = QBCore.Functions.GetPlayer(id)
	return xPlayer.PlayerData.money['cash']
end

RegisterServerEvent('ak47_qb_hookahlounge:PlayWithinDistance')
AddEventHandler('ak47_qb_hookahlounge:PlayWithinDistance', function(coords , maxDistance, soundFile)
    TriggerClientEvent('ak47_qb_hookahlounge:PlayWithinDistance', -1, coords, maxDistance, soundFile)
end)
