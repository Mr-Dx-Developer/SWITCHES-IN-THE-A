module 'shared/debug'
module 'shared/resource'
module 'shared/table'

Version = resource.version(Bridge.InventoryName)
Bridge.Debug('Inventory', Bridge.InventoryName, Version)

Framework.OnReady(QBCore, function()
    Framework.Items = {}
    for k, v in pairs(QBCore.Shared.Items) do
        local item = {}
        if not v.name then v.name = k end
        item.name = v.name
        item.label = v.label
        item.description = v.description
        item.stack = not v.unique and true
        item.weight = v.weight or 0
        item.close = v.shouldClose == nil and true or v.shouldClose
        item.type = v.type
        Framework.Items[v.name] = item
    end
end)

---Get Stash Items
---@return Item[]
local function GetStashItems(inventory)
    inventory = inventory:gsub("%-", "_")
    local items = {}
	local result = Database.scalar('SELECT items FROM stashitems WHERE stash = ?', {inventory})
	if not result then return items end

	local stashItems = json.decode(result)
	if not stashItems then return items end

	for _, item in pairs(stashItems) do
		local itemInfo = Framework.Items[item.name:lower()]
		if itemInfo then
            items[item.slot] = {
                name = itemInfo.name,
                count = tonumber(item.amount),
                label = itemInfo.label,
                description = itemInfo.description,
                metadata = item.info,
                stack = itemInfo.stack,
                weight = itemInfo.weight,
                close = itemInfo.close,
                image = itemInfo.image,
                type = itemInfo.type,
                slot = item.slot,
            }
		end
	end
	return items
end

---Add Item To Stash
---@param inventory string
---@param item string
---@param count number
---@param metadata? table
---@param slot? number
---@return boolean
local function AddStashItem(inventory, item, count, metadata, slot)
    inventory = inventory:gsub("%-", "_")
    count = tonumber(count) or 1
    local stash = {}
    local result = Database.scalar('SELECT items FROM stashitems WHERE stash = ?', {inventory})
    if result then stash = json.decode(result) end
	local itemInfo = QBCore.Shared.Items[item:lower()]
    metadata = metadata or {}
    metadata.created = metadata.created or os.time()
    metadata.quality = metadata.quality or 100
    if itemInfo['type'] == 'weapon' then
        metadata.serie = metadata.serie or tostring(Framework.RandomInteger(2) .. Framework.RandomString(3) .. Framework.RandomInteger(1) .. Framework.RandomString(2) .. Framework.RandomInteger(3) .. Framework.RandomString(4))
    end
	if not itemInfo.unique then
        if type(slot) == "number" and stash[slot] and stash[slot].name == item and table.matches(metadata, stash[slot].info) then
            stash[slot].amount = stash[slot].amount + count
        else
            slot = #stash + 1
            stash[slot] = {
                name = itemInfo["name"],
				amount = count,
				info = metadata or {},
				label = itemInfo["label"],
				description = itemInfo["description"] or "",
				weight = itemInfo["weight"],
				type = itemInfo["type"],
				unique = itemInfo["unique"],
				useable = itemInfo["useable"],
				image = itemInfo["image"],
				slot = slot,
            }
        end
	else
        slot = #stash + 1
        stash[slot] = {
            name = itemInfo["name"],
			amount = count,
			info = metadata or {},
			label = itemInfo["label"],
			description = itemInfo["description"] or "",
			weight = itemInfo["weight"],
			type = itemInfo["type"],
			unique = itemInfo["unique"],
			useable = itemInfo["useable"],
			image = itemInfo["image"],
			slot = slot,
        }
    end
    Database.insert('INSERT INTO stashitems (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {
		['stash'] = inventory,
		['items'] = json.encode(stash)
	})
    return true
end

---Remove Item From Stash
---@param inventory string
---@param item string
---@param count number
---@param metadata? table
---@param slot? number
---@return boolean
local function RemoveStashItem(inventory, item, count, metadata, slot)
    inventory = inventory:gsub("%-", "_")
    local stash = {}
    local result = Database.scalar('SELECT items FROM stashitems WHERE stash = ?', {inventory})
    if result then stash = json.decode(result) else return false end
    count = tonumber(count) or 1
	if type(slot) == "number" and stash[slot] and stash[slot].name == item then
        if metadata and not table.matches(metadata, stash[slot].info) then return false end
        if stash[slot].amount > count then
            stash[slot].amount = stash[slot].amount - count
        else
            stash[slot] = nil
        end
        Database.insert('INSERT INTO stashitems (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {
            ['stash'] = inventory,
            ['items'] = json.encode(stash)
        })
        return true
	else
        local removed = count
        local newstash = stash
        for _, v in pairs(stash) do
            if v.name == item then
                if metadata and table.matches(metadata, v.info) then 
                    if removed >= v.amount then
                        newstash[v.slot] = nil
                        removed = removed - v.amount
                    else
                        newstash[v.slot].amount = newstash[v.slot].amount - removed
                        removed = removed - removed
                    end
                elseif not metadata then
                    if removed >= v.amount then
                        newstash[v.slot] = nil
                        removed = removed - v.amount
                    else
                        newstash[v.slot].amount = newstash[v.slot].amount - removed
                        removed = removed - removed
                    end
                end
            end
            
            if removed == 0 then
                break
            end
        end

        if removed == 0 then
            Database.insert('INSERT INTO stashitems (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {
                ['stash'] = inventory,
                ['items'] = json.encode(newstash)
            })
            return true
        else
            return false
        end
	end
end

Framework.AddItem = function(inventory, item, count, metadata, slot)
    if type(inventory) == "string" then
        return AddStashItem(inventory, item, count, metadata, slot)
    elseif type(inventory) == "number" then
        local Player = QBCore.Functions.GetPlayer(inventory)
        if Player.Functions.AddItem(item, count, slot, metadata) then
            TriggerClientEvent('inventory:client:ItemBox', inventory, QBCore.Shared.Items[item], 'add', count)
            return true
        end
        return false
    end
    return false
end

Framework.RemoveItem = function(inventory, item, count, metadata, slot)
    if type(inventory) == "string" then
        return RemoveStashItem(inventory, item, count, metadata, slot)
    elseif type(inventory) == "number" then
        local Player = QBCore.Functions.GetPlayer(inventory)
        if slot then
            if metadata then
                if table.matches(metadata, Framework.GetItemMetadata(inventory, slot)) then
                    Player.Functions.RemoveItem(item, count, slot)
                    TriggerClientEvent('inventory:client:ItemBox', inventory, QBCore.Shared.Items[item], "remove", count)
                end
                return false
            else
                if Player.Functions.GetItemBySlot(slot) and Player.Functions.RemoveItem(item, count, slot) then
                    TriggerClientEvent('inventory:client:ItemBox', inventory, QBCore.Shared.Items[item], "remove", count)
                    return true
                else
                    return false
                end
            end
        else
            local removed = count
            local removedItems = {}
            local items = Player.Functions.GetItemsByName(item)
            for _, v in pairs(items) do
                if metadata and table.matches(metadata, Framework.GetItemMetadata(inventory, v.slot)) then
                    if removed >= v.amount and Player.Functions.RemoveItem(item, v.amount, v.slot) then
                        removedItems[#removedItems+1] = v
                        removed = removed - v.amount
                    elseif Player.Functions.RemoveItem(item, removed, v.slot) then
                        removedItems[#removedItems+1] = v
                        removed = removed - removed
                    end
                elseif not metadata then
                    if removed >= v.amount and Player.Functions.RemoveItem(item, v.amount, v.slot) then
                        removedItems[#removedItems+1] = v
                        removed = removed - v.amount
                    elseif Player.Functions.RemoveItem(item, removed, v.slot) then
                        removedItems[#removedItems+1] = v
                        removed = removed - removed
                    end
                end
                if removed == 0 then
                    break
                end
            end

            if removed == 0 then
                TriggerClientEvent('inventory:client:ItemBox', inventory, QBCore.Shared.Items[item], "remove", count)
                return true
            else
                for _, v in pairs(removedItems) do
                    Framework.AddItem(inventory, item, v.amount, v.slot, v.info)
                end
                return false
            end
        end
    end
    return false
end

Framework.GetItem = function(inventory, item, metadata)
    local items = {}
    ---@cast items Item[]
    if type(inventory) == "string" then
        for k, v in pairs(GetStashItems(inventory)) do
            if v.name ~= item then goto skipLoop end
            if metadata and not table.matches(v.metadata, metadata) then goto skipLoop end
            items[#items + 1] = v
            ::skipLoop::
        end
    elseif type(inventory) == "number" then
        local Player = QBCore.Functions.GetPlayer(inventory)
        for k, v in pairs(Player.PlayerData.items) do 
            if v.name ~= item then goto skipLoop end
            if metadata and not table.matches(v.info, metadata) then goto skipLoop end
            items[#items+1] = {
                name = v.name,
                count = tonumber(v.amount),
                label = v.label,
                description = v.description,
                metadata = v.info,
                stack = not v.unique and true,
                weight = v.weight or 0,
                close = v.shouldClose == nil and true or v.shouldClose,
                image = v.image,
                type = v.type,
                slot = v.slot,
            }
            ::skipLoop::
        end
    end
    return items
end

Framework.GetItemCount = function(inventory, item, metadata)
    local count = 0
    if type(inventory) == "string" then
        for k, v in pairs(GetStashItems(inventory)) do
            if v.name ~= item then goto skipLoop end
            if metadata and not table.matches(v.metadata, metadata) then goto skipLoop end
            count = count + tonumber(v.count)
            ::skipLoop::
        end
    elseif type(inventory) == "number" then
        local Player = QBCore.Functions.GetPlayer(inventory)
        local items = Player.Functions.GetItemsByName(item)
        for k, v in pairs(items) do
            if v.name ~= item then goto skipLoop end
            if metadata and not table.matches(v.info, metadata) then goto skipLoop end
            count = count + tonumber(v.amount)
            ::skipLoop::
        end
    end
    return count
end

Framework.HasItem = function(inventory, items, count, metadata)
    if type(inventory) == "string" then
        inventory = inventory:gsub("%-", "_")
        local result = Database.scalar('SELECT items FROM stashitems WHERE stash = ?', { inventory })
        if not result then return false end
        local stash = json.decode(result)
        local invItems = {}
        for _, v in pairs(stash) do
            if metadata then
                if invItems[v.name] and table.matches(v.info, invItems[v.name].info) then
                    invItems[v.name].amount = invItems[v.name].amount + v.amount
                else
                    invItems[v.name] = { amount = v.amount, info = v.info }
                end
            else
                invItems[v.name] = { amount = (invItems[v.name] and invItems[v.name].amount or 0 ) + v.amount, info = {} }
            end
        end

        if type(items) == "string" then
            if invItems[items] and invItems[items].amount >= (count or 1) then
                if metadata and not table.matches(invItems[items].info, metadata) then return false end
                return true
            else
                return false
            end
        elseif type(items) == "table" then
            if table.type(items) == 'hash' then
                for item, amount in pairs(items) do
                    if not invItems[item] or invItems[item].amount < amount then
                        return false
                    end
                end
                return true
            elseif table.type(items) == 'array' then
                for i = 1, #items do
                    local item = items[i]
                    if not invItems[item] or invItems[item].amount < (count or 1) then
                        return false
                    end
                end
                return true
            end
        end
    elseif type(inventory) == "number" then
        local Player = QBCore.Functions.GetPlayer(inventory)
        local invItems = {}
        for _, v in pairs(Player.PlayerData.items) do
            if metadata then
                if invItems[v.name] and table.matches(v.info, invItems[v.name].info) then
                    invItems[v.name].amount = invItems[v.name].amount + v.amount
                else
                    invItems[v.name] = { amount = v.amount, info = v.info }
                end
            else
                invItems[v.name] = { amount = (invItems[v.name] and invItems[v.name].amount or 0 ) + v.amount, info = {} }
            end
        end

        if type(items) == "string" then
            if invItems[items] and invItems[items].amount >= (count or 1) then
                if metadata and not table.matches(invItems[items].info, metadata) then return false end
                return true
            else
                return false
            end
        elseif type(items) == "table" then
            if table.type(items) == 'hash' then
                for item, amount in pairs(items) do
                    if not invItems[item] or invItems[item].amount < amount then
                        return false
                    end
                end
                return true
            elseif table.type(items) == 'array' then
                for i = 1, #items do
                    local item = items[i]
                    if not invItems[item] or invItems[item].amount < (count or 1) then
                        return false
                    end
                end
                return true
            end
        end
    end
    return false
end

Framework.GetItemMetadata = function(inventory, slot)
    if type(inventory) == "string" then
        inventory = inventory:gsub("%-", "_")
        local result = Database.scalar('SELECT items FROM stashitems WHERE stash = ?', {inventory})
        if not result then return nil end
        local stash = json.decode(result)
        for k, item in pairs(stash) do
            if item.slot == slot then
                return item.info
            end
        end
        return {}
    elseif type(inventory) == "number" then
        local Player = QBCore.Functions.GetPlayer(inventory)
        return Player.Functions.GetItemBySlot(slot)?.info
    end
    return {}
end

Framework.SetItemMetadata = function(inventory, slot, metadata)
    if type(inventory) == "string" then
        inventory = inventory:gsub("%-", "_")
        local result = Database.scalar('SELECT items FROM stashitems WHERE stash = ?', {inventory})
        if not result then return end
        local stash = json.decode(result)
        for k, item in pairs(stash) do
            if item.slot == slot then
                stash[k].info = metadata
                break
            end
        end
        if not next(stash) then return end
        Database.insert('INSERT INTO stashitems (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {
            ['stash'] = inventory,
            ['items'] = json.encode(stash)
        })
    elseif type(inventory) == "number" then
        local Player = QBCore.Functions.GetPlayer(inventory)
        if Player.PlayerData.items[slot] then
            Player.PlayerData.items[slot].info = metadata
            Player.Functions.SetInventory(Player.PlayerData.items)
        end
    end
end

Framework.GetInventory = function(inventory)
    local items = {}
    if type(inventory) == "string" then
        items = GetStashItems(inventory)
    elseif type(inventory) == "number" then
        local Player = QBCore.Functions.GetPlayer(inventory)
        for k, v in pairs(Player.PlayerData.items) do
            items[k] = {
                name = v.name,
                count = tonumber(v.amount),
                label = v.label,
                description = v.description,
                metadata = v.info,
                stack = not v.unique and true,
                weight = v.weight or 0,
                close = v.shouldClose == nil and true or v.shouldClose,
                image = v.image,
                type = v.type,
                slot = v.slot,
            }
        end
    end
    return items
end

Framework.ClearInventory = function(inventory, keep)
    if type(inventory) == "string" then
        inventory = inventory:gsub("%-", "_")
        local stash = {}
        if keep then
            local result = Database.scalar('SELECT items FROM stashitems WHERE stash = ?', { inventory })
            if not result then return end
            
            local stashItems = json.decode(result)
            if not next(stashItems) then return end

            local keepType = type(keep)
            if keepType == "string" then
                for k, v in pairs(stashItems) do
                    if v.name == keep then
                        stash[k] = v
                    end
                end
            elseif keepType == "table" and table.type(keep) == "array" then
                for k, v in pairs(stashItems) do
                    for i = 1, #keep do
                        if v.name == keep[i] then
                            stash[k] = v
                        end
                    end
                end
            end
        end

        Database.insert('INSERT INTO stashitems (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {
            ['stash'] = inventory,
            ['items'] = json.encode(stash)
        })
    elseif type(inventory) == "number" then
        local Player = QBCore.Functions.GetPlayer(inventory)
        Player.Functions.ClearInventory(keep)
    end
end

local stashes = {}
Framework.RegisterStash = function(name, slots, weight, owner, groups)
    name = name:gsub("%-", "_")
    if not stashes[name] then
        stashes[name] = { slots = slots, weight = weight, owner = owner, groups = groups }
    end
end

Framework.CreateCallback(Bridge.Resource .. ':bridge:GetStash', function(source, cb, name)
    name = name:gsub("%-", "_")
    cb(stashes[name] and stashes[name] or nil)
end)

local shops = {}
Framework.RegisterShop = function(name, data)
    if shops[name] then return end
    shops[name] = data
end

Framework.CreateCallback(Bridge.Resource .. ':bridge:OpenShop', function(source, cb, name)
    if not shops[name] then cb({}) end
    local isAllowed = false
    local Player = Framework.GetPlayer(source)
    if shops[name].groups and Framework.HasJob(shops[name].groups, Player) then isAllowed = true end
    if shops[name].groups and Framework.HasGang(shops[name].groups, Player) then isAllowed = true end
    if type(shops[name].groups) == "table" and (shops[name].groups and not isAllowed) then cb({}) end
    cb(shops[name])
end)

Framework.ConfiscateInventory = function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetMetaData("jailitems", {})
    local items = {}
    for i = 1, #Player.PlayerData.items do
        local item = Player.PlayerData.items[i]
        if item then items[i] = item end
    end
    Player.Functions.SetMetaData("jailitems", items)
    Player.Functions.ClearInventory()
end

Framework.ReturnInventory = function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local items = {}
    for i = 1, #Player.PlayerData.metadata["jailitems"] do
        local item = Player.PlayerData.metadata["jailitems"][i]
        items[item.name] = (items[item.name] and items[item.name] + item.amount or item.amount)
        Player.Functions.AddItem(item.name, item.amount, item.slot, item.info)
    end
    for k, v in pairs(items) do
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[k], 'add', v)
    end
    Player.Functions.SetMetaData("jailitems", {})
end