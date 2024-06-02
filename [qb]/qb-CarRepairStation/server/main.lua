QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('carfixstation:costRepair')
AddEventHandler('carfixstation:costRepair', function(cost)
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
	
	if Player.Functions.GetMoney("cash") >= cost then		
		Player.Functions.RemoveMoney("cash", cost, "car repair")
		TriggerClientEvent('carfixstation:fixCar', _source)
		TriggerClientEvent('QBCore:Notify', _source, _U('cost_repair', cost))
	else
		TriggerClientEvent('QBCore:Notify', _source, _U('not_enough_money'), "error")
	end
end)