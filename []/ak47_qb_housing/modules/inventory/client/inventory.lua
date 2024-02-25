Citizen.CreateThread(function()
	if Config.Inventory.script == 'auto' then
		if GetResourceState('qb-inventory') == 'started' or GetResourceState('qb-inventory') == 'starting' then
			Config.Inventory.script = 'qb-inventory'
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

AddEventHandler('ak47_qb_housing:openinventory', function(hid, uid, weight, slots)
	local identifier = 'housing:'..hid..':'..uid
	if Config.Inventory.script == 'qb-inventory' then
		TriggerServerEvent("inventory:server:OpenInventory", "stash", identifier, {maxweight = weight * 1000, slots = slots})
        TriggerEvent("inventory:client:SetCurrentStash", identifier)
	elseif Config.Inventory.script == 'ox_inventory' then
		TriggerServerEvent('ak47_qb_housing:registeroxinventory', hid, {weight = weight, slots = slots}, uid)
		exports["ox_inventory"]:openInventory('stash', identifier)
	elseif Config.Inventory.script == 'qs-inventory' then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", identifier, {maxweight = weight, slots = slots})
        TriggerEvent("inventory:client:SetCurrentStash", identifier)
    elseif Config.Inventory.script == 'mf-inventory' then
        exports["mf-inventory"]:openOtherInventory(identifier)
    elseif Config.Inventory.script == 'cheeza_inventory' then
        TriggerEvent('inventory:openHouse', 'HousingStash', identifier, "Stash", weight)
    elseif Config.Inventory.script == 'core_inventory' then
        TriggerServerEvent('core_inventory:server:openInventory', identifier, 'stash')
	end
end)