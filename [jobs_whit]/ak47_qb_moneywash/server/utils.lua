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