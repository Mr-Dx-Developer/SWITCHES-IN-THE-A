local function TransferMoney(itemName, source, target)
	if Config.Framework ~= 'esx' then return end
	if itemName ~= 'money' and itemName ~= 'black_money' then return end

	local Player = GetPlayerFromId(source)
	local money = GetItemTotalAmount(source, itemName)
	Player.setAccountMoney(itemName, money, 'dropped')

	local targetPlayer = GetPlayerFromId(target)
	local targetMoney = GetItemTotalAmount(target, itemName)
	targetPlayer.setAccountMoney(itemName, targetMoney, 'dropped')

	local itemType = (itemName == 'money') and 'Money' or 'Black money'
	Debug(itemType .. ' sent by src: ' .. json.encode(money) .. ', target: ' .. json.encode(targetMoney))
end

RegisterServerEvent(Config.InventoryPrefix .. ':server:GiveItem', function(target, name, amount, slot)
	local src = source
	target = tonumber(target)
	local dist = #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(target)))

	if src == target then return TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_CANT_GIVE'), 'error') end
	if dist > 2 then return TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_GIVE_FAR'), 'error') end
	local item = GetItemBySlot(src, slot)
	if not item then
		TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_GIVE_NOT_FOUND'), 'error')
		return
	end
	if item.name ~= name then
		TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_GIVE_INCORRECT'), 'error')
		return
	end

	if notStoredItems(item.name, target) then
		TriggerClientEvent(Config.InventoryPrefix .. ':client:forceCloseInventory', src)
		TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_CANT_TAKE_MORE_OTHER') .. ' ' .. item.name, 'inform')
		return TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', target, Lang('INVENTORY_NOTIFICATION_CANT_TAKE_MORE') .. ' ' .. item.name, 'inform')
	end

	if not amount then
		return TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, 'You must place a minimum amount of 0, not empty', 'error')
	end

	if amount <= item.amount then
		if amount == 0 then
			amount = item.amount
		end

		if RemoveItem(src, item.name, amount, item.slot) then
			if AddItem(target, item.name, amount, false, item.info, nil, item.created) then
				TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', target, Lang('INVENTORY_NOTIFICATION_GIVE_RECEIVED') .. ' ' .. amount .. ' ' .. item.label, 'inform')
				TriggerClientEvent(Config.InventoryPrefix .. ':client:UpdatePlayerInventory', target, true)
				TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_GAVE') .. ' ' .. amount .. ' ' .. item.label, 'inform')
				TriggerClientEvent(Config.InventoryPrefix .. ':client:UpdatePlayerInventory', src, true)
				TriggerClientEvent(Config.InventoryPrefix .. ':client:giveAnim', src)
				TriggerClientEvent(Config.InventoryPrefix .. ':client:giveAnim', target)
				TriggerClientEvent(Config.InventoryPrefix .. ':client:closeinv', target)
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, item, amount, 'remove')
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', target, item, amount, 'add')
				TransferMoney(item.name, src, target)
				SendWebhook(Webhooks.giveitem, 'Give Item To Player (Trade)', 7393279, '**' .. GetPlayerName(src) .. '(id: ' .. src .. ') sent a item to player: ' .. target .. '!**\nName:** ' .. item.name .. '**\nAmount:** ' .. amount)
			else
				TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_OTHER_INVENTORY_FULL'), 'error')
				TriggerClientEvent(Config.InventoryPrefix .. ':client:UpdatePlayerInventory', src, false)
				TriggerClientEvent(Config.InventoryPrefix .. ':client:UpdatePlayerInventory', target, false)
				TriggerClientEvent(Config.InventoryPrefix .. ':client:closeinv', target)
			end
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_INVALID_AMOUNT'), 'error')
		end
	else
		TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_INVALID_AMOUNT'), 'error')
	end
end)
