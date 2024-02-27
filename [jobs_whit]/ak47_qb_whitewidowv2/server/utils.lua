QBCore = exports['qb-core']:GetCoreObject()

function getSocietyMoney()
    if Config.SocietyInManagement then
        return exports['qb-management']:GetAccount('cookies')
    else
        return exports['qb-banking']:GetAccountBalance('cookies')
    end
end

function addSocietyMoney(money)
    if Config.SocietyInManagement then
        exports['qb-management']:AddMoney('cookies', money)
    else
        exports['qb-banking']:AddMoney('cookies', money)
    end
end

function removeSocietyMoney(money)
    if Config.SocietyInManagement then
        exports['qb-management']:RemoveMoney('cookies', money)
    else
        exports['qb-banking']:RemoveMoney('cookies', money)
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

function PlayerCanPay(xPlayer, price, payment)
    if payment == 'cash' then
        return xPlayer.PlayerData.money['cash'] >= price
    else
        return xPlayer.PlayerData.money['bank'] >= price
    end
end

function PayTheBill(xPlayer, payment, price)
    if payment == 'cash' then
        xPlayer.Functions.RemoveMoney('cash', price)
    else
        xPlayer.Functions.RemoveMoney('bank', price)
    end
end