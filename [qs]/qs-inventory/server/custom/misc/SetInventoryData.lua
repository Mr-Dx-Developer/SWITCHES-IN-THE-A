RegisterNetEvent(Config.InventoryPrefix .. ':server:SetInventoryData', function(fromInventory, toInventory, fromSlot, toSlot, fromAmount, toAmount, fromInventoryIsClothesInventory, toInventoryIsClothesInventory, craftingKey)
	local src = source
	local Player = GetPlayerFromId(src)
	local identifier = GetPlayerIdentifier(src)
	fromSlot = tonumber(fromSlot)
	toSlot = tonumber(toSlot)

	if (fromInventory == 'player' or fromInventory == 'hotbar') and (SplitStr(toInventory, '-')[1] == 'itemshop' or toInventory == 'crafting' or toInventory == 'customcrafting') then
		return
	end

	if fromInventoryIsClothesInventory and toInventoryIsClothesInventory then
		return
	end

	if (SplitStr(fromInventory, '-')[1] == 'selling') then
		return
	end

	if fromInventoryIsClothesInventory then
		if not ClotheItems?[identifier] then return end
		local item = ClotheItems?[identifier]?.items?[fromSlot]
		if not item then return end
		local itemIsClothPart = checkItemIsClothingPart(item.name)
		if not itemIsClothPart then
			TriggerClientEvent(Config.InventoryPrefix .. ':client:UpdatePlayerInventory', src, true)
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_CANT_MOVE'), 'inform')
			return
		end
		TriggerClientEvent('clothes:takeOffClothes', src, item.name)
		AddItem(src, item.name, 1, toSlot, item.info)
		RemoveFromClothes(identifier, fromSlot, item.name, 1)
		TriggerClientEvent(Config.InventoryPrefix .. ':saveClothes', src)
		return
	elseif toInventoryIsClothesInventory then
		local item = GetItemBySlot(src, fromSlot)
		if not item then return end
		local itemIsClothPart = checkItemIsClothingPart(item.name)
		if not itemIsClothPart then
			TriggerClientEvent(Config.InventoryPrefix .. ':client:UpdatePlayerInventory', src, true)
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_CANT_MOVE'), 'inform')
			return
		end
		UseItem(item.name, src, item)
		AddToClothes(identifier, item.name, item.info)
		RemoveItem(src, item.name, 1, fromSlot)
		TriggerClientEvent(Config.InventoryPrefix .. ':saveClothes', src)
		return
	end

	if SplitStr(toInventory, '-')[1] == 'selling' then
		if fromInventory ~= 'player' and fromInventory ~= 'hotbar' then return end
		local fromItemData = GetItemBySlot(src, fromSlot)
		fromAmount = tonumber(fromAmount) and tonumber(fromAmount) or fromItemData.amount
		if fromItemData and fromItemData.amount >= fromAmount then
			local sell_id = SplitStr(toInventory, '-')[2]
			local toItemData = SellItems[sell_id].items[toSlot]
			Debug(toItemData.name, fromItemData.name)
			if toItemData and toItemData.name == fromItemData.name then
				RemoveItem(src, fromItemData.name, fromAmount, fromSlot)
				local price, account = getPriceItemForSelling(fromItemData.name)
				if not price then return end
				if fromAmount == 0 then
					return TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_SELLING_AMOUNT'), 'error')
				end
				AddAccountMoney(src, account, price * fromAmount)
				TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, price * fromAmount .. ' ' .. Lang('INVENTORY_NOTIFICATION_SELLING_SUCCESS'), 'success')
				SendWebhook(Webhooks.sell, 'Item Sale', 7393279, '**' .. GetPlayerName(src) .. '(id: ' .. src .. ') sold an item!**\n**Name:** ' .. fromItemData.name .. '\n**Price:** ' .. price * fromAmount .. '\n**Amount:** ' .. fromAmount)
			else
				TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_SELLING_BAD_ITEM'), 'error')
			end
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_SELLING_BAD_ITEM'), 'error')
		end
		return
	end

	if fromInventory == 'player' or fromInventory == 'hotbar' then
		local fromItemData = GetItemBySlot(src, fromSlot)
		fromAmount = tonumber(fromAmount) or fromItemData.amount
		if fromItemData and fromItemData.amount >= fromAmount then
			if toInventory == 'player' or toInventory == 'hotbar' then
				local toItemData = GetItemBySlot(src, toSlot)
				RemoveItem(src, fromItemData.name, fromAmount, fromSlot)
				TriggerClientEvent(Config.InventoryPrefix .. ':client:CheckWeapon', src, fromItemData.name)
				if toItemData then
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							RemoveItem(src, toItemData.name, toAmount, toSlot)
							AddItem(src, toItemData.name, toAmount, fromSlot, toItemData.info, nil, fromItemData['created'])
							SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') swapped item!**\n**Name:** ' .. toItemData.name .. '\n**Amount:** ' .. toAmount .. ' with name: ' .. fromItemData.name .. '\n**Amount:** ' .. fromAmount)
						end
					else
						print('Dupe Blocked - 1')
					end
				end
				AddItem(src, fromItemData.name, fromAmount, toSlot, fromItemData.info, nil, fromItemData['created'])
			elseif SplitStr(toInventory, '-')[1] == 'otherplayer' then
				local playerId = tonumber(SplitStr(toInventory, '-')[2])
				local toItemData = inventories[playerId][toSlot]
				RemoveItem(src, fromItemData.name, fromAmount, fromSlot)
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'remove')
				TriggerClientEvent(Config.InventoryPrefix .. ':client:CheckWeapon', src, fromItemData.name)
				if toItemData then
					local itemInfo = ItemList[toItemData.name:lower()]
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.name ~= fromItemData.name then
						RemoveItem(playerId, itemInfo['name'], toAmount, fromSlot)
						TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', playerId, toItemData, toAmount, 'remove')
						AddItem(src, toItemData.name, toAmount, fromSlot, toItemData.info, nil, fromItemData['created'])
						TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'add')
					end
				end
				local itemInfo = ItemList[fromItemData.name:lower()]
				AddItem(playerId, itemInfo['name'], fromAmount, toSlot, fromItemData.info, nil, fromItemData['created'])
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'add')
			elseif SplitStr(toInventory, '-')[1] == 'trunk' then
				local plate = SplitStr(toInventory, '-')[2]
				local toItemData = Trunks[plate].items[toSlot]
				RemoveItem(src, fromItemData.name, fromAmount, fromSlot)
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'remove')
				TriggerClientEvent(Config.InventoryPrefix .. ':client:CheckWeapon', src, fromItemData.name)
				if toItemData then
					local itemInfo = ItemList[toItemData.name:lower()]
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							RemoveFromTrunk(src, plate, fromSlot, itemInfo['name'], toAmount)
							AddItem(src, toItemData.name, toAmount, fromSlot, toItemData.info, nil, fromItemData['created'])
							TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'add')
							SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') swapped item!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. toAmount .. '\n**With name:** ' .. fromItemData.name .. '\n**Amount:** ' .. fromAmount .. '\n**Plate:** ' .. plate)
						end
					else
						print('Dupe Blocked - 3')
					end
				end
				local itemInfo = ItemList[fromItemData.name:lower()]
				AddToTrunk(plate, toSlot, fromSlot, itemInfo['name'], fromAmount, fromItemData.info, fromItemData['created'])
				SendWebhook(Webhooks.trunk, 'Deposit Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') deposit item in trunk!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Plate:** ' .. plate)
			elseif SplitStr(toInventory, '-')[1] == 'glovebox' then
				local plate = SplitStr(toInventory, '-')[2]
				local toItemData = Gloveboxes[plate].items[toSlot]
				RemoveItem(src, fromItemData.name, fromAmount, fromSlot)
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'remove')
				TriggerClientEvent(Config.InventoryPrefix .. ':client:CheckWeapon', src, fromItemData.name)
				if toItemData then
					local itemInfo = ItemList[toItemData.name:lower()]
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							RemoveFromGlovebox(plate, fromSlot, itemInfo['name'], toAmount)
							AddItem(src, toItemData.name, toAmount, fromSlot, toItemData.info, nil, fromItemData['created'])
							TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'add')
							SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') swapped item!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. toAmount .. '\n**With name:** ' .. fromItemData.name .. '\n**Amount:** ' .. fromAmount .. '\n**Plate:** ' .. plate)
						end
					else
						print('Dupe Blocked - 4')
					end
				end
				local itemInfo = ItemList[fromItemData.name:lower()]
				AddToGlovebox(plate, toSlot, fromSlot, itemInfo['name'], fromAmount, fromItemData.info, fromItemData['created'])
				SendWebhook(Webhooks.glovebox, 'Deposit Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') deposit item in glovebox!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Plate:** ' .. plate)
			elseif SplitStr(toInventory, '-')[1] == 'stash' then
				local stashId = SplitStr(toInventory, '-')[2]
				local toItemData = Stashes[stashId].items[toSlot]
				RemoveItem(src, fromItemData.name, fromAmount, fromSlot)
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'remove')
				TriggerClientEvent(Config.InventoryPrefix .. ':client:CheckWeapon', src, fromItemData.name)
				if toItemData then
					local itemInfo = ItemList[toItemData.name:lower()]
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							RemoveFromStash(src, stashId, toSlot, itemInfo['name'], toAmount)
							AddItem(src, toItemData.name, toAmount, fromSlot, toItemData.info, nil, fromItemData['created'])
							TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'add')
							SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') swapped item!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. toAmount .. '\n**With name:** ' .. fromItemData.name .. '\n**Amount:** ' .. fromAmount .. '\n**Stash id:** ' .. stashId)
						end
					else
						print('Dupe Blocked - 5')
					end
				end
				local itemInfo = ItemList[fromItemData.name:lower()]
				AddToStash(stashId, toSlot, fromSlot, itemInfo['name'], fromAmount, fromItemData.info, fromItemData['created'])
				SendWebhook(Webhooks.stash, 'Deposit Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') deposit item in stash!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Stash id:** ' .. stashId)
			elseif SplitStr(toInventory, '_')[1] == 'garbage' then
				local garbageId = SplitStr(toInventory, '_')[2]
				local toItemData = GarbageItems[garbageId].items[toSlot]
				RemoveItem(src, fromItemData.name, fromAmount, fromSlot)
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'remove')
				TriggerClientEvent(Config.InventoryPrefix .. ':client:CheckWeapon', src, fromItemData.name)
				if toItemData then
					local itemInfo = ItemList[toItemData.name:lower()]
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							RemoveFromGarbage(garbageId, toSlot, itemInfo['name'], toAmount)
							TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', playerId, toItemData, toAmount, 'remove')
							AddItem(src, toItemData.name, toAmount, fromSlot, toItemData.info, nil, fromItemData['created'])
							TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'add')
							SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') swapped item!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. toAmount .. '\n**With name:** ' .. fromItemData.name .. '\n**Amount:** ' .. fromAmount .. '\n**Garbage id:** ' .. garbageId)
						end
					else
						print('Dupe Blocked - 6')
					end
				end
				local itemInfo = ItemList[fromItemData.name:lower()]
				AddToGarbage(garbageId, toSlot, fromSlot, itemInfo['name'], fromAmount, fromItemData.info, fromItemData['created'])
				SendWebhook(Webhooks.garbage, 'Deposit Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') deposit item in garbage!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Garbage id:** ' .. garbageId)
			elseif SplitStr(toInventory, '-')[1] == 'traphouse' then
				-- Traphouse
				local traphouseId = SplitStr(toInventory, '_')[2]
				local toItemData = exports['qb-traphouse']:GetInventoryData(traphouseId, toSlot)
				local IsItemValid = exports['qb-traphouse']:CanItemBeSaled(fromItemData.name:lower())
				if IsItemValid then
					RemoveItem(src, fromItemData.name, fromAmount, fromSlot)
					TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'remove')
					TriggerClientEvent(Config.InventoryPrefix .. ':client:CheckWeapon', src, fromItemData.name)
					if toItemData then
						local itemInfo = ItemList[toItemData.name:lower()]
						toAmount = tonumber(toAmount) or toItemData.amount
						if toItemData.amount >= toAmount then
							if toItemData.name ~= fromItemData.name then
								exports['qb-traphouse']:RemoveHouseItem(traphouseId, fromSlot, itemInfo['name'], toAmount)
								TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', playerId, toItemData, toAmount, 'remove')
								AddItem(src, toItemData.name, toAmount, fromSlot, toItemData.info, nil, fromItemData['created'])
								TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'add')
								SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') swapped item!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. toAmount .. '\n**With name:** ' .. fromItemData.name .. '\n**Amount:** ' .. fromAmount .. '\n**Traphouse id:** ' .. traphouseId)
							end
						else
							print('Dupe Blocked - 7')
						end
					end
					local itemInfo = ItemList[fromItemData.name:lower()]
					exports['qb-traphouse']:AddHouseItem(traphouseId, toSlot, itemInfo['name'], fromAmount, fromItemData.info, fromItemData['created'], src)
					SendWebhook(Webhooks.swap, 'Deposit Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') deposit item in traphouse!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Traphouse id:** ' .. traphouseId)
				else
					TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_CANT_SELL'), 'error')
				end
			else
				-- drop
				toInventoryFormatter = SplitStr(toInventory, '-')[2]
				toInventory = tonumber(toInventoryFormatter)
				if toInventory == nil or toInventory == 0 then
					CreateNewDrop(src, fromSlot, toSlot, fromAmount, fromItemData['created'])
					Debug('[SetInventoryData, function CreateNewDrop]', fromSlot, toSlot, fromAmount, fromItemData['created'])
					TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'remove')
					SendWebhook(Webhooks.drop, 'Create New Drop', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') create new drop!**\n**Name:** ' .. fromItemData['name'] .. '\n**Amount:** ' .. fromAmount)
				else
					local toItemData = Drops[toInventory].items[toSlot]
					RemoveItem(src, fromItemData.name, fromAmount, fromSlot)
					TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'remove')
					TriggerClientEvent(Config.InventoryPrefix .. ':client:CheckWeapon', src, fromItemData.name)
					if toItemData then
						local itemInfo = ItemList[toItemData.name:lower()]
						toAmount = tonumber(toAmount) or toItemData.amount
						if toItemData.amount >= toAmount then
							if toItemData.name ~= fromItemData.name then
								AddItem(src, toItemData.name, toAmount, fromSlot, toItemData.info, nil, fromItemData['created'])
								TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'add')
								RemoveFromDrop(toInventory, fromSlot, itemInfo['name'], toAmount)
								SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') swapped item!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. toAmount .. '\n**With name:** ' .. fromItemData.name .. '\n**mount:** ' .. fromAmount .. '\n**Drop id:** ' .. toInventory)
							end
						else
							print('Dupe Blocked - 8')
						end
					end
					local itemInfo = ItemList[fromItemData.name:lower()]
					AddToDrop(toInventory, toSlot, itemInfo['name'], fromAmount, fromItemData.info, fromItemData['created'])
					SendWebhook(Webhooks.drop, 'Deposit Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') deposit item in drop!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Drop id:** ' .. toInventory)
					if itemInfo['name'] == 'radio' then
						TriggerClientEvent('Radio.Set', src, false)
					elseif itemInfo['name'] == 'money' and Config.Framework == 'esx' then
						local money = GetItemTotalAmount(src, 'money')
						Player.setAccountMoney('money', money, 'dropped')
					elseif itemInfo['name'] == 'black_money' and Config.Framework == 'esx' then
						local money = GetItemTotalAmount(src, 'black_money')
						Player.setAccountMoney('black_money', money, 'dropped')
					end
					TriggerClientEvent(Config.InventoryPrefix .. ':ClearWeapons', src)
				end
			end
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_GIVE_DONT_HAVE'), 'error')
		end
	elseif SplitStr(fromInventory, '-')[1] == 'otherplayer' then
		local playerId = tonumber(SplitStr(fromInventory, '-')[2])
		local fromItemData = inventories[playerId][fromSlot]
		fromAmount = tonumber(fromAmount) or fromItemData.amount
		if fromItemData and fromItemData.amount >= fromAmount then
			local itemInfo = ItemList[fromItemData.name:lower()]
			if toInventory == 'player' or toInventory == 'hotbar' then
				local toItemData = GetItemBySlot(src, toSlot)
				RemoveItem(playerId, itemInfo['name'], fromAmount, fromSlot)
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', playerId, fromItemData, fromAmount, 'remove')
				SendWebhook(Webhooks.robbery, 'Deposit Item (robbery)', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') deposit item in inventory (robbery)!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Otherplayer id:** ' .. playerId)
				TriggerClientEvent(Config.InventoryPrefix .. ':client:CheckWeapon', playerId, fromItemData.name)
				if toItemData then
					itemInfo = ItemList[toItemData.name:lower()]
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.name ~= fromItemData.name then
						RemoveItem(src, toItemData.name, toAmount, toSlot)
						TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'remove')
						AddItem(playerId, itemInfo['name'], toAmount, fromSlot, toItemData.info, nil, fromItemData['created'])
						TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', playerId, toItemData, toAmount, 'add')
					end
				end
				-- Weapon Parts
				if fromItemData.type == 'weapon' and Config.CanStealWeaponParts then
					local chance = math.random(1, 100)
					if chance <= Config.WeaponPartStealChance then
						Debug('The complete weapon was stolen with a probability of:', chance)
						AddItem(src, fromItemData.name, fromAmount, toSlot, fromItemData.info, nil, fromItemData['created'])
					else
						Debug('The theft of the weapon was failed with a probability of:', chance, 'random items added!')
						RemoveItem(src, fromItemData.name, fromAmount, toSlot)

						for i = 1, 5 do
							local randomItem = Config.AvailableWeaponParts[math.random(1, #Config.AvailableWeaponParts)]
							AddItem(src, randomItem, math.random(1, 5))
						end

						Wait(200)
						TriggerClientEvent(Config.InventoryPrefix .. ':client:forceCloseInventory', src)
						TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_STEAL_BROKEN_WEAPON'), 'inform')
					end
				else
					AddItem(src, fromItemData.name, fromAmount, toSlot, fromItemData.info, nil, fromItemData['created'])
					TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'add')
				end
				-- Weapon Parts
			else
				local toItemData = inventories[playerId][toSlot]
				RemoveItem(playerId, itemInfo['name'], fromAmount, fromSlot)
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', playerId, fromItemData, fromAmount, 'remove')
				if toItemData then
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							itemInfo = ItemList[toItemData.name:lower()]
							RemoveItem(playerId, itemInfo['name'], toAmount, toSlot)
							TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'remove')
							AddItem(playerId, itemInfo['name'], toAmount, fromSlot, toItemData.info, nil, fromItemData['created'])
							TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', playerId, toItemData, toAmount, 'add')
						end
					else
						print('Dupe Blocked - 10')
					end
				end
				itemInfo = ItemList[fromItemData.name:lower()]
				AddItem(playerId, itemInfo['name'], fromAmount, toSlot, fromItemData.info, nil, fromItemData['created'])
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'add')
			end
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_MISSING_ITEM'), 'error')
		end
	elseif SplitStr(fromInventory, '-')[1] == 'trunk' then
		local plate = SplitStr(fromInventory, '-')[2]
		local fromItemData = Trunks[plate].items[fromSlot]
		fromAmount = tonumber(fromAmount) or fromItemData.amount
		if fromItemData and fromItemData.amount >= fromAmount then
			local itemInfo = ItemList[fromItemData.name:lower()]
			if toInventory == 'player' or toInventory == 'hotbar' then
				local toItemData = GetItemBySlot(src, toSlot)
				RemoveFromTrunk(src, plate, fromSlot, itemInfo['name'], fromAmount)
				-- TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'remove')
				SendWebhook(Webhooks.trunk, 'Remove Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') remove item from trunk!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Plate:** ' .. plate)
				if toItemData then
					itemInfo = ItemList[toItemData.name:lower()]
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							RemoveItem(src, toItemData.name, toAmount, toSlot)
							TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'remove')
							AddToTrunk(plate, fromSlot, toSlot, itemInfo['name'], toAmount, toItemData.info, fromItemData['created'])
							SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') swapped item!**\n**Name:** ' .. toItemData.name .. '\n**Amount:** ' .. toAmount .. '\n**With item:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. toAmount .. '\n**Plate:** ' .. plate)
						end
					else
						print('Dupe Blocked - 11')
					end
				end
				AddItem(src, fromItemData.name, fromAmount, toSlot, fromItemData.info, nil, fromItemData['created'])
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'add')
			else
				local toItemData = Trunks[plate].items[toSlot]
				RemoveFromTrunk(src, plate, fromSlot, itemInfo['name'], fromAmount)
				if toItemData then
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							itemInfo = ItemList[toItemData.name:lower()]
							RemoveFromTrunk(src, plate, toSlot, itemInfo['name'], toAmount)
							AddToTrunk(plate, fromSlot, toSlot, itemInfo['name'], toAmount, toItemData.info, fromItemData['created'])
						end
					else
						print('Dupe Blocked - 12')
					end
				end
				itemInfo = ItemList[fromItemData.name:lower()]
				AddToTrunk(plate, toSlot, fromSlot, itemInfo['name'], fromAmount, fromItemData.info, fromItemData['created'])
				SendWebhook(Webhooks.trunk, 'Deposit Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') deposit item in trunk!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Plate:** ' .. plate)
			end
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_MISSING_ITEM'), 'error')
		end
	elseif SplitStr(fromInventory, '-')[1] == 'glovebox' then
		local plate = SplitStr(fromInventory, '-')[2]
		local fromItemData = Gloveboxes[plate].items[fromSlot]
		fromAmount = tonumber(fromAmount) or fromItemData.amount
		if fromItemData and fromItemData.amount >= fromAmount then
			local itemInfo = ItemList[fromItemData.name:lower()]
			if toInventory == 'player' or toInventory == 'hotbar' then
				local toItemData = GetItemBySlot(src, toSlot)
				RemoveFromGlovebox(plate, fromSlot, itemInfo['name'], fromAmount)
				SendWebhook(Webhooks.glovebox, 'Remove Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') remove item from glovebox!**\nName:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Plate:** ' .. plate)
				if toItemData then
					itemInfo = ItemList[toItemData.name:lower()]
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							RemoveItem(src, toItemData.name, toAmount, toSlot)
							TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'remove')
							AddToGlovebox(plate, fromSlot, toSlot, itemInfo['name'], toAmount, toItemData.info, fromItemData['created'])
							SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: *' .. src .. ')* swapped item!**\n**Name:** ' .. toItemData.name .. '\n**Amount:** ' .. toAmount .. '\n**With item:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. toAmount .. '\n**Plate:** ' .. plate)
						end
					else
						print('Dupe Blocked - 13')
					end
				end
				AddItem(src, fromItemData.name, fromAmount, toSlot, fromItemData.info, nil, fromItemData['created'])
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'add')
			else
				local toItemData = Gloveboxes[plate].items[toSlot]
				RemoveFromGlovebox(plate, fromSlot, itemInfo['name'], fromAmount)
				if toItemData then
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							itemInfo = ItemList[toItemData.name:lower()]
							RemoveFromGlovebox(plate, toSlot, itemInfo['name'], toAmount)
							AddToGlovebox(plate, fromSlot, toSlot, itemInfo['name'], toAmount, toItemData.info, fromItemData['created'])
						end
					else
						print('Dupe Blocked - 14')
					end
				end
				itemInfo = ItemList[fromItemData.name:lower()]
				AddToGlovebox(plate, toSlot, fromSlot, itemInfo['name'], fromAmount, fromItemData.info, fromItemData['created'])
				SendWebhook(Webhooks.glovebox, 'Deposit Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') deposit item in glovebox!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Plate:** ' .. plate)
			end
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_MISSING_ITEM'), 'error')
		end
	elseif SplitStr(fromInventory, '-')[1] == 'stash' then
		local stashId = SplitStr(fromInventory, '-')[2]
		local fromItemData = Stashes[stashId].items[fromSlot]
		fromAmount = tonumber(fromAmount) or fromItemData.amount
		if fromItemData and fromItemData.amount >= fromAmount then
			local itemInfo = ItemList[fromItemData.name:lower()]
			if toInventory == 'player' or toInventory == 'hotbar' then
				local toItemData = GetItemBySlot(src, toSlot)
				RemoveFromStash(src, stashId, fromSlot, itemInfo['name'], fromAmount)
				SendWebhook(Webhooks.stash, 'Remove Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') remove item from stash!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Stash id:** ' .. stashId)

				if toItemData then
					itemInfo = ItemList[toItemData.name:lower()]
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							RemoveItem(src, toItemData.name, toAmount, toSlot)
							TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'remove')
							AddToStash(stashId, fromSlot, toSlot, itemInfo['name'], toAmount, toItemData.info, fromItemData['created'])
							SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') swapped item!**\n**Name:** ' .. toItemData.name .. '\n**Amount:** ' .. toAmount .. '\n**With item:** ' .. fromItemData.name .. '\n**Amount:** ' .. fromAmount .. '\n**Stash id:** ' .. stashId)
						end
					else
						print('Dupe Blocked - 15')
					end
				end
				SaveStashItems(stashId, Stashes[stashId].items)
				AddItem(src, fromItemData.name, fromAmount, toSlot, fromItemData.info, nil, fromItemData['created'])
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'add')
			else
				local toItemData = Stashes[stashId].items[toSlot]
				RemoveFromStash(src, stashId, fromSlot, itemInfo['name'], fromAmount)
				if toItemData then
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							itemInfo = ItemList[toItemData.name:lower()]
							RemoveFromStash(src, stashId, toSlot, itemInfo['name'], toAmount)
							AddToStash(stashId, fromSlot, toSlot, itemInfo['name'], toAmount, toItemData.info, fromItemData['created'])
						end
					else
						print('Dupe Blocked - 16')
					end
				end
				itemInfo = ItemList[fromItemData.name:lower()]
				AddToStash(stashId, toSlot, fromSlot, itemInfo['name'], fromAmount, fromItemData.info, fromItemData['created'])
				SendWebhook(Webhooks.stash, 'Deposit Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') deposit item in stash!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Stash id:** ' .. stashId)
			end
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_MISSING_ITEM'), 'error')
		end
	elseif SplitStr(fromInventory, '_')[1] == 'garbage' then
		local garbageId = SplitStr(fromInventory, '_')[2]
		local fromItemData = GarbageItems[garbageId].items[fromSlot]
		fromAmount = tonumber(fromAmount) or fromItemData.amount
		if fromItemData and fromItemData.amount >= fromAmount then
			local itemInfo = ItemList[fromItemData.name:lower()]
			if toInventory == 'player' or toInventory == 'hotbar' then
				local toItemData = GetItemBySlot(src, toSlot)
				RemoveFromGarbage(garbageId, fromSlot, itemInfo['name'], fromAmount)
				SendWebhook(Webhooks.garbage, 'Remove Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') remove item from drop!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Garbage id:** ' .. garbageId)
				if toItemData then
					itemInfo = ItemList[toItemData.name:lower()]
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							RemoveItem(src, toItemData.name, toAmount, toSlot)
							TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'remove')
							AddToGarbage(garbageId, fromSlot, toSlot, itemInfo['name'], toAmount, toItemData.info, fromItemData['created'])
							SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') swapped item!**\n**Name:** **' .. toItemData.name .. '\n**Amount:** ' .. toAmount .. '\n**With item:** ' .. fromItemData.name .. '\n**Amount:** ' .. fromAmount .. '\n**Garbage id:** ' .. garbageId)
						end
					else
						print('Dupe Blocked - 17')
					end
				end
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'add')
				AddItem(src, fromItemData.name, fromAmount, toSlot, fromItemData.info, nil, fromItemData['created'])
			else
				local toItemData = GarbageItems[garbageId].items[toSlot]
				RemoveFromGarbage(garbageId, fromSlot, itemInfo['name'], fromAmount)
				if toItemData then
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							itemInfo = ItemList[toItemData.name:lower()]
							RemoveFromGarbage(garbageId, toSlot, itemInfo['name'], toAmount)
							AddToGarbage(garbageId, fromSlot, toSlot, itemInfo['name'], toAmount, toItemData.info, fromItemData['created'])
						end
					else
						print('Dupe Blocked - 18')
					end
				end
				itemInfo = ItemList[fromItemData.name:lower()]
				AddToGarbage(garbageId, toSlot, fromSlot, itemInfo['name'], fromAmount, fromItemData.info, fromItemData['created'])
				SendWebhook(Webhooks.garbage, 'Deposit Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') deposit item in garbage!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Garbage id:** ' .. garbageId)
			end
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_MISSING_ITEM'), 'error')
		end
	elseif SplitStr(fromInventory, '-')[1] == 'traphouse' then
		local traphouseId = SplitStr(fromInventory, '-')[2]
		local fromItemData = exports['qb-traphouse']:GetInventoryData(traphouseId, fromSlot)
		fromAmount = tonumber(fromAmount) or fromItemData.amount
		if fromItemData and fromItemData.amount >= fromAmount then
			local itemInfo = ItemList[fromItemData.name:lower()]
			if toInventory == 'player' or toInventory == 'hotbar' then
				local toItemData = GetItemBySlot(src, toSlot)
				exports['qb-traphouse']:RemoveHouseItem(traphouseId, fromSlot, itemInfo['name'], fromAmount)
				if toItemData then
					itemInfo = ItemList[toItemData.name:lower()]
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							RemoveItem(src, toItemData.name, toAmount, toSlot)
							TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'remove')
							exports['qb-traphouse']:AddHouseItem(traphouseId, fromSlot, itemInfo['name'], toAmount, toItemData.info, fromItemData['created'], src)
							SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') swapped item!**\n**Name:** ' .. toItemData.name .. '\n**Amount:** ' .. toAmount .. '\n**With item:** ' .. fromItemData.name .. '\n**Amount:** ' .. fromAmount .. '\n**Stash id:** ' .. traphouseId)
						end
					else
						print('Dupe Blocked - 19')
					end
				end
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'add')
				AddItem(src, fromItemData.name, fromAmount, toSlot, fromItemData.info, nil, fromItemData['created'])
			else
				local toItemData = exports['qb-traphouse']:GetInventoryData(traphouseId, toSlot)
				exports['qb-traphouse']:RemoveHouseItem(traphouseId, fromSlot, itemInfo['name'], fromAmount)
				if toItemData then
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							itemInfo = ItemList[toItemData.name:lower()]
							exports['qb-traphouse']:RemoveHouseItem(traphouseId, toSlot, itemInfo['name'], toAmount)
							exports['qb-traphouse']:AddHouseItem(traphouseId, fromSlot, itemInfo['name'], toAmount, toItemData.info, fromItemData['created'], src)
						end
					else
						print('Dupe Blocked - 20')
					end
				end
				itemInfo = ItemList[fromItemData.name:lower()]
				exports['qb-traphouse']:AddHouseItem(traphouseId, toSlot, itemInfo['name'], fromAmount, fromItemData.info, fromItemData['created'], src)
				SendWebhook(Webhooks.traphouse, 'Deposit Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') deposit item in traphouse!\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Traphouse id:** ' .. traphouseId)
			end
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_MISSING_ITEM'), 'error')
		end
	elseif SplitStr(fromInventory, '-')[1] == 'itemshop' then
		local shopType = SplitStr(fromInventory, '-')[2]
		local itemData = ShopItems[shopType].items[fromSlot]
		local itemInfo = ItemList[itemData.name:lower()]
		local bankBalance = GetAccountMoney(src, 'bank')
		local price = tonumber((itemData.price * fromAmount))
		local money = GetAccountMoney(src, ShopItems[shopType].account)

		if notStoredItems(itemData.name, src) then
			TriggerClientEvent(Config.InventoryPrefix .. ':client:forceCloseInventory', source)
			return TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_CANT_TAKE_MORE') .. ' ' .. itemInfo['label'], 'inform')
		end

		if SplitStr(shopType, '_')[1] == 'Dealer' then
			local isWeapon = SplitStr(itemData.name, '_')[1] == 'weapon'
			if isWeapon then
				price = tonumber(itemData.price)
				if money >= price then
					RemoveAccountMoney(src, 'money', price or 0)
					itemData.info.serie = CreateSerialNumber()
					itemData.info.quality = 100
					AddItem(src, itemData.name, 1, toSlot, itemData.info, nil)
					TriggerClientEvent('qb-drugs:client:updateDealerItems', src, itemData, 1)
					TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, itemInfo['label'] .. ' ' .. Lang('INVENTORY_NOTIFICATION_BOUGHT'), 'success')
					SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. '** bought a ' .. itemInfo['label'] .. ' for €' .. price)
					if isWeapon then
						TriggerClientEvent(Config.InventoryPrefix .. ':client:forceCloseInventory', src)
					end
				else
					TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_NO_MONEY'), 'error')
					return
				end
			else
				if money >= price then
					AddItem(src, itemData.name, fromAmount, toSlot, itemData.info, nil)
					TriggerClientEvent('qb-drugs:client:updateDealerItems', src, itemData, fromAmount)
					TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, itemInfo['label'] .. ' ' .. Lang('INVENTORY_NOTIFICATION_BOUGHT'), 'success')
					SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. '** bought a ' .. itemInfo['label'] .. '  for €' .. price)
				else
					TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_NO_MONEY'), 'error')
					return
				end
			end
		elseif SplitStr(shopType, '_')[1] == 'Itemshop' then
			if itemData.name == 'tradingcard_psa' then
				local StringCharset = {}
				local NumberCharset = {}
				for i = 48, 57 do table.insert(NumberCharset, string.char(i)) end
				for i = 65, 90 do table.insert(StringCharset, string.char(i)) end
				for i = 97, 122 do table.insert(StringCharset, string.char(i)) end

				RandomStr = function(length)
					if length > 0 then
						return RandomStr(length - 1) .. StringCharset[math.random(1, #StringCharset)]
					else
						return ''
					end
				end

				RandomInt = function(length)
					if length > 0 then
						return RandomInt(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
					else
						return ''
					end
				end

				local psaId = tostring(RandomStr(3) .. RandomInt(2) .. RandomStr(1) .. RandomInt(2) .. RandomInt(3))
				itemData.info = {
					serial = psaId
				}
			end
			if money >= price then
				RemoveAccountMoney(src, ShopItems[shopType].account, price or 0)
				local isWeapon = SplitStr(itemData.name, '_')[1] == 'weapon'
				if isWeapon then
					itemData.info.serie = CreateSerialNumber()
					itemData.info.quality = 100
				end
				AddItem(src, itemData.name, fromAmount, toSlot, itemData.info)
				TriggerClientEvent('shops:client:UpdateShop', src, SplitStr(shopType, '_')[2], itemData, fromAmount)
				TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, itemInfo['label'] .. ' ' .. Lang('INVENTORY_NOTIFICATION_BOUGHT'), 'success')
				SendWebhook(Webhooks.bought, 'Shop item bought', 7393279, '**' .. GetPlayerName(src) .. '** bought a ' .. itemInfo['label'] .. ' for €' .. price)
				if isWeapon then
					TriggerClientEvent(Config.InventoryPrefix .. ':client:forceCloseInventory', src)
				end
			else
				TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_NO_MONEY'), 'error')
				return
			end
		else
			if money >= price then
				RemoveAccountMoney(src, 'money', price or 0)
				AddItem(src, itemData.name, fromAmount, toSlot, itemData.info)
				TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, itemInfo['label'] .. ' ' .. Lang('INVENTORY_NOTIFICATION_BOUGHT'), 'success')
				SendWebhook(Webhooks.bought, 'Shop item bought', 7393279, '**' .. GetPlayerName(src) .. '** bought a ' .. itemInfo['label'] .. ' for €' .. price)
			else
				TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_NO_MONEY'), 'error')
				return
			end
		end
	elseif fromInventory == 'crafting' then
		local itemData = Config.CraftingTables[craftingKey].items[fromSlot]

		if hasCraftItems(src, itemData.costs, fromAmount) then
			TriggerClientEvent(Config.InventoryPrefix .. ':client:CraftItems', src, itemData.name, itemData.costs, itemData.points, fromAmount, toSlot, itemData.rep, itemData.time, itemData.chance)
			SendWebhook(Webhooks.crafting, 'Crafting item', 7393279, '**' .. GetPlayerName(src) .. '**\n**Crafted item in:** ' .. Config.CraftingTables[craftingKey].name .. '\n**Item crafted:** ' .. itemData.name .. '\n**Timer:** ' .. itemData.time * fromAmount .. '\n**Amount:** ' .. fromAmount)
			Debug('Started ' .. itemData.name .. ' crafting in ' .. Config.CraftingTables[craftingKey].name .. ' with a delay time of ' .. itemData.time * fromAmount .. ', quantity ' .. fromAmount)
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:UpdatePlayerInventory', src, true)
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_MISSING_ITEMS'), 'error')
		end
	elseif fromInventory == 'customcrafting' then
		local itemData = (CustomCraftingInfos)[fromSlot]
		if hasCraftItems(src, itemData.costs, fromAmount) then
			TriggerClientEvent(Config.InventoryPrefix .. ':client:CraftItems', src, itemData.name, itemData.costs, itemData.points, fromAmount, toSlot, itemData.rep, itemData.time, itemData.chance)
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:UpdatePlayerInventory', src, true)
			TriggerClientEvent('qs-inventory:sendMessage', src, Lang('CRAFTING_ERROR'), 'error')
		end
	else
		-- drop
		fromInventoryFormatter = SplitStr(fromInventory, '-')[2]
		fromInventory = tonumber(fromInventoryFormatter)
		local fromItemData = Drops[fromInventory].items[fromSlot]
		fromAmount = tonumber(fromAmount) or fromItemData.amount
		if fromItemData and fromItemData.amount >= fromAmount then
			local itemInfo = ItemList[fromItemData.name:lower()]
			if toInventory == 'player' or toInventory == 'hotbar' then
				local toItemData = GetItemBySlot(src, toSlot)
				RemoveFromDrop(fromInventory, fromSlot, itemInfo['name'], fromAmount)
				SendWebhook(Webhooks.drop, 'Remove Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') remove item from drop!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Drop id:** ' .. fromInventory)
				if toItemData then
					toAmount = tonumber(toAmount) and tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							itemInfo = ItemList[toItemData.name:lower()]
							RemoveItem(src, toItemData.name, toAmount, toSlot)
							TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, toItemData, toAmount, 'remove')
							AddToDrop(fromInventory, toSlot, itemInfo['name'], toAmount, toItemData.info, fromItemData['created'])
							SendWebhook(Webhooks.swap, 'Swapped Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') swapped item!**\n**Name:** ' .. toItemData.name .. '\n**Amount:** ' .. toAmount .. '\n**With item:** ' .. fromItemData.name .. '\n**Amount:** ' .. fromAmount .. '\n**Dropid:** ' .. fromInventory)
							if itemInfo['name'] == 'radio' then
								TriggerClientEvent('Radio.Set', src, false)
							elseif itemInfo['name'] == 'money' and Config.Framework == 'esx' then
								local money = GetItemTotalAmount(src, 'money')
								Player.setAccountMoney('money', money, 'dropped')
							elseif itemInfo['name'] == 'black_money' and Config.Framework == 'esx' then
								local money = GetItemTotalAmount(src, 'black_money')
								Player.setAccountMoney('black_money', money, 'dropped')
							end
							TriggerClientEvent(Config.InventoryPrefix .. ':ClearWeapons', src)
						end
					else
						print('Dupe Blocked - 21')
					end
				end
				AddItem(src, fromItemData.name, fromAmount, toSlot, fromItemData.info, nil, fromItemData['created'])
				TriggerEvent(Config.InventoryPrefix .. ':server:updateCash', src, fromItemData, fromAmount, 'add')
			else
				toInventoryFormatter = SplitStr(toInventory, '-')[2]
				toInventory = tonumber(toInventoryFormatter)
				local toItemData = Drops[toInventory].items[toSlot]
				RemoveFromDrop(fromInventory, fromSlot, itemInfo['name'], fromAmount)
				if toItemData then
					toAmount = tonumber(toAmount) or toItemData.amount
					if toItemData.amount >= toAmount then
						if toItemData.name ~= fromItemData.name then
							itemInfo = ItemList[toItemData.name:lower()]
							RemoveFromDrop(toInventory, toSlot, itemInfo['name'], toAmount)
							AddToDrop(fromInventory, fromSlot, itemInfo['name'], toAmount, toItemData.info, fromItemData['created'])
							if itemInfo['name'] == 'radio' then
								TriggerClientEvent('Radio.Set', src, false)
							elseif itemInfo['name'] == 'money' and Config.Framework == 'esx' then
								local money = GetItemTotalAmount(src, 'money')
								Player.setAccountMoney('money', money, 'dropped')
							elseif itemInfo['name'] == 'black_money' and Config.Framework == 'esx' then
								local money = GetItemTotalAmount(src, 'black_money')
								Player.setAccountMoney('black_money', money, 'dropped')
							end
							TriggerClientEvent(Config.InventoryPrefix .. ':ClearWeapons', src)
						end
					else
						print('Dupe Blocked - 22')
					end
				end
				itemInfo = ItemList[fromItemData.name:lower()]
				AddToDrop(toInventory, toSlot, itemInfo['name'], fromAmount, fromItemData.info, fromItemData['created'])
				SendWebhook(Webhooks.drop, 'Deposit Item', 7393279, '**' .. GetPlayerName(src) .. ' (id: ' .. src .. ') deposit item in drop!**\n**Name:** ' .. itemInfo['name'] .. '\n**Amount:** ' .. fromAmount .. '\n**Drop id:** ' .. toInventory)
				if itemInfo['name'] == 'radio' then
					TriggerClientEvent('Radio.Set', src, false)
				elseif itemInfo['name'] == 'money' and Config.Framework == 'esx' then
					local money = GetItemTotalAmount(src, 'money')
					Player.setAccountMoney('money', money, 'dropped')
				elseif itemInfo['name'] == 'black_money' and Config.Framework == 'esx' then
					local money = GetItemTotalAmount(src, 'black_money')
					Player.setAccountMoney('black_money', money, 'dropped')
				end
				TriggerClientEvent(Config.InventoryPrefix .. ':ClearWeapons', src)
			end
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', src, Lang('INVENTORY_NOTIFICATION_MISSING_ITEM'), 'error')
		end
	end
end)
