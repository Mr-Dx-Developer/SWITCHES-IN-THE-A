RegisterCommand('searchplayer', function(source)
	TriggerClientEvent(Config.InventoryPrefix .. ':client:search', source)
end, false)

RegisterCommand('openinventorytarget', function(source, args, rawCommand)
	local Player = GetPlayerFromId(source)
	local group = PlayerIsAdmin(source)

	if args[1] and group then
		local id = tonumber(args[1])
		local targetPlayer = GetPlayerFromId(id)

		if targetPlayer then
			TriggerClientEvent(Config.InventoryPrefix .. ':client:OpenInventoryAdmin', source, id)
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_PLAYER_OFFLINE'), 'error')
		end
	end
end)

RegisterCommand('giveitem', function(source, args)
	local group = PlayerIsAdmin(source)
	if not group then return TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_ADMIN'), 'error') end
	local id = tonumber(args[1])
	local target = GetPlayerFromId(id)
	local item = args[2]
	local amount = tonumber(args[3]) or 1
	if not target then return TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_PLAYER_OFFLINE'), 'error') end
	GiveItemToPlayer(id, item, amount)
end)

RegisterCommand('giveweapon', function(source, args)
	local group = PlayerIsAdmin(source)
	if not group then return TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_ADMIN'), 'error') end
	local id = tonumber(args[1])
	local target = GetPlayerFromId(id)
	local item = args[2]
	local amount = tonumber(args[3]) or 1
	if not target then return TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_PLAYER_OFFLINE'), 'error') end
	GiveWeaponToPlayer(id, item, amount)
end)

RegisterCommand('clearinv', function(source, args)
	local group = PlayerIsAdmin(source)
	if not group then return end
	local playerId = args[1] ~= '' and tonumber(args[1]) or source
	local target = GetPlayerFromId(playerId)
	if target then
		ClearInventory(playerId)
		SetCurrentPedWeapon(playerId, `WEAPON_UNARMED`, true)
		RemoveAllPedWeapons(playerId, true)
	else
		TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_PLAYER_OFFLINE'), 'error')
	end
end)

RegisterCommand('repairweapon', function(source, args)
	local isAdmin = PlayerIsAdmin(source)
	if not isAdmin then return end
	TriggerClientEvent('weapons:client:SetWeaponQuality', source, tonumber(args[1]))
end, true)

RegisterCommand('randomitems', function(source, args)
	local group = PlayerIsAdmin(source)
	if not group then return end
	local filteredItems = {}
	for k, v in pairs(ItemList) do
		if ItemList[k]['type'] ~= 'weapon' then
			filteredItems[#filteredItems + 1] = v
		end
	end
	for _ = 1, 10, 1 do
		local randitem = filteredItems[math.random(1, #filteredItems)]
		local amount = math.random(1, 10)
		if randitem['unique'] then
			amount = 1
		end
		if AddItem(source, randitem['name'], amount) then
			TriggerClientEvent(Config.InventoryPrefix .. ':client:ItemBox', source, ItemList[randitem['name']], 'add')
			Wait(500)
		end
	end
end, false)

RegisterCommand('dataitem', function(source)
	local src = source
	local group = PlayerIsAdmin(src)
	if not group then return end

	local plate = math.random(1111, 9999)
	local model = 'Zentorno'
	AddItem(src, 'lockpick', 1, nil, { Plate = plate, Model = model, Info = 'Is a good car!' }, true)
end, false)

RegisterCommand('resetinv', function(source, args)
	if not PlayerIsAdmin(source) then return end
	local invType = args[1]:lower()
	table.remove(args, 1)
	local invId = table.concat(args, ' ')
	if invType and invId then
		if invType == 'trunk' then
			if Trunks[invId] then
				Trunks[invId].isOpen = false
			end
		elseif invType == 'glovebox' then
			if Gloveboxes[invId] then
				Gloveboxes[invId].isOpen = false
			end
		elseif invType == 'stash' then
			if Stashes[invId] then
				Stashes[invId].isOpen = false
			end
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_INVALID_TYPE'), 'error')
		end
	else
		TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_INVALID_ARGUMENTS'), 'error')
	end
end)

RegisterCommand('checkitem', function(source)
	local item = GetItemByName(source, 'tosti')
	return print('Tosti item amount:', item and item.amount or 0)
end)

RegisterCommand('rob', function(source)
	if Config.Framework == 'esx' then return end
	TriggerClientEvent('police:client:RobPlayer', source)
end)

RegisterCommand('invitems', function(source)
	if Config.Framework == 'qb' then return end
	local playerId = tonumber(source)
	local xPlayer = GetPlayerFromId(playerId)
	local inventory = xPlayer.getInventory(playerId)

	if not inventory or #inventory == 0 then
		return print('Your inventory is empty')
	end

	for _, item in pairs(inventory) do
		print('Item: ' .. item.name .. ' - Amount: ' .. item.count)
	end
end)
