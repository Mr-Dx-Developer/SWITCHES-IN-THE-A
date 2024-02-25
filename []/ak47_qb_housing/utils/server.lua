QBCore = exports['qb-core']:GetCoreObject()

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

function addSocietyMoney(money)
    if Config.SocietyInManagement then
        exports['qb-management']:AddMoney(Config.Realestate.Job, money)
    else
        exports['qb-banking']:AddMoney(Config.Realestate.Job, money)
    end
end