function getPriceItemForSelling(name)
	for k, v in pairs(Config.SellItems) do
		for s, x in pairs(v.items) do
			if x.name == name then
				return x.price, v.blip.account
			end
		end
	end
	return false
end

RegisterNetEvent(Config.InventoryPrefix .. ':server:RemoveItem', function(itemName, count)
	local src = source
	RemoveItem(src, itemName, count)
end)

function SetupSellingItems(shop, shopItems)
	local items = {}
	if shopItems ~= nil and next(shopItems) ~= nil then
		for k, item in pairs(shopItems) do
			local itemInfo = ItemList[item.name:lower()]
			if not itemInfo then return Error('There is an item that does not exist in this selling store!') end
			items[item.slot] = {
				name = itemInfo['name'],
				amount = tonumber(item.amount),
				info = item.info ~= nil and item.info or '',
				label = item?.info?.label or itemInfo['label'],
				description = itemInfo['description'] ~= nil and itemInfo['description'] or '',
				weight = itemInfo['weight'],
				type = itemInfo['type'],
				unique = itemInfo['unique'],
				useable = itemInfo['useable'],
				price = item.price,
				image = item.info and item.info.image and item.info.image .. '.png' or itemInfo['image'],
				slot = item.slot,
			}
		end
	end
	return items
end
