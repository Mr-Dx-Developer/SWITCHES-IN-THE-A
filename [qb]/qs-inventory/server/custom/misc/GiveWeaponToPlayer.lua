function GiveWeaponToPlayer(source, item, amount)
	local id = source
	local identifier = GetPlayerIdentifier(id)
	amount = tonumber(amount)
	local itemData = ItemList[item:lower()]
	if not identifier then return end
	if itemData then
		local info = {}
		if itemData['type'] == 'weapon' then
			info.serie = CreateSerialNumber()
			info.quality = 100
			info.ammo = amount
		end

		if itemData['type'] ~= 'weapon' then return end
		if amount > 1000 then
			return TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_GIVEWEAPON_LIMIT'), 'error')
		end

		if AddItem(id, itemData['name'], 1, false, info) then
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_GIVE_ITEM') .. ' ' .. amount .. ' ' .. itemData['label'], 'success')
			SendWebhook(Webhooks.admin, 'Give Weapon To Player (Admin)', 7393279, '**' .. GetPlayerName(source) .. ' (id: ' .. source .. ') sent a weapon!**\n**Name:** ' .. itemData['name'] .. '\n**Bullets:** ' .. amount)
		else
			TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_CANT_GIVE'), 'error')
		end
	else
		TriggerClientEvent(Config.InventoryPrefix .. ':client:sendTextMessage', source, Lang('INVENTORY_NOTIFICATION_MISSING_ITEM'), 'error')
	end
end

exports('GiveWeaponToPlayer', GiveWeaponToPlayer)
