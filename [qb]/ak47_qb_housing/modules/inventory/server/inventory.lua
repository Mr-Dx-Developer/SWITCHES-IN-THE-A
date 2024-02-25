Citizen.CreateThread(function()
	if Config.Inventory.script == 'auto' then
		if GetResourceState('ak47_inventory') == 'started' or GetResourceState('ak47_inventory') == 'starting' then
			Config.Inventory.script = 'ak47_inventory'
			return
		end
		if GetResourceState('ox_inventory') == 'started' or GetResourceState('ox_inventory') == 'starting' then
			Config.Inventory.script = 'ox_inventory'
			return
		end
		if GetResourceState('qs-inventory') == 'started' or GetResourceState('qs-inventory') == 'starting' then
			Config.Inventory.script = 'qs-inventory'
			return
		end
		if GetResourceState('mf-inventory') == 'started' or GetResourceState('mf-inventory') == 'starting' then
			Config.Inventory.script = 'mf-inventory'
			return
		end
		if GetResourceState('cheeza_inventory') == 'started' or GetResourceState('cheeza_inventory') == 'starting' then
			Config.Inventory.script = 'cheeza_inventory'
			return
		end
		if GetResourceState('core_inventory') == 'started' or GetResourceState('core_inventory') == 'starting' then
			Config.Inventory.script = 'core_inventory'
			return
		end
	end
end)

RegisterNetEvent('ak47_qb_housing:registerinventory', function(hid, data, uid)
	local identifier = 'housing:'..hid..':'..uid
	if Config.Inventory.script == 'ak47_inventory' then
		if not exports['ak47_inventory']:getRegisteredInventory(identifier) then
            exports["ak47_inventory"]:createInventory(identifier, "inventory", "housing", "Stash", data.weight, data.slots, {})
        end
	elseif Config.Inventory.script == 'ox_inventory' then
		exports["ox_inventory"]:RegisterStash(identifier, identifier, data.slots, data.weight * 1000)
	elseif Config.Inventory.script == 'mf-inventory' then
		exports["mf-inventory"]:onReady(function()
            if not exports["mf-inventory"]:getInventory(identifier) then
                exports["mf-inventory"]:createInventory(identifier, "inventory", "housing", "Stash", data.weight, data.slots, {})
            end
        end)
	elseif Config.Inventory.script == 'cheeza_inventory' then

	elseif Config.Inventory.script == 'core_inventory' then
		
	end
	Houses[hid].weight = Houses[hid].weight - data.weight
	TriggerClientEvent('ak47_qb_housing:sync:weight', -1, hid, Houses[hid].weight)
	MySQL.Async.execute('UPDATE `ak47_qb_housing` SET weight = ? WHERE id = ?', {Houses[hid].weight, tonumber(hid)})
end)

RegisterNetEvent('ak47_qb_housing:registeroxinventory', function(hid, data, uid)
	local identifier = 'housing:'..hid..':'..uid
	exports["ox_inventory"]:RegisterStash(identifier, identifier, data.slots, data.weight * 1000)
end)

RegisterNetEvent('ak47_qb_housing:removeinventory', function(hid, uid, weight)
	local identifier = 'housing:'..hid..':'..uid
	if Config.Inventory.script == 'ak47_inventory' then
		if exports['ak47_inventory']:getRegisteredInventory(identifier) then
            exports["ak47_inventory"]:deleteInventory(identifier)
        end
	elseif Config.Inventory.script == 'ox_inventory' then
		exports["ox_inventory"]:ClearInventory(identifier)
	elseif Config.Inventory.script == 'mf-inventory' then
		exports["mf-inventory"]:onReady(function()
            if not exports["mf-inventory"]:getInventory(identifier) then
                exports["mf-inventory"]:deleteInventory(identifier)
            end
        end)
	elseif Config.Inventory.script == 'cheeza_inventory' then

	elseif Config.Inventory.script == 'core_inventory' then
		
	end
	Wait(100)
	if Houses[hid] and Houses[hid].weight then
		Houses[hid].weight = Houses[hid].weight + weight
		TriggerClientEvent('ak47_qb_housing:sync:weight', -1, hid, Houses[hid].weight)
		MySQL.Async.execute('UPDATE `ak47_qb_housing` SET weight = ? WHERE id = ?', {Houses[hid].weight, tonumber(hid)})
	end
end)