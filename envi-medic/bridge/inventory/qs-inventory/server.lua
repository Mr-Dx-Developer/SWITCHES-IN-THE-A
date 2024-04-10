module 'shared/debug'
module 'shared/resource'
module 'shared/table'

Version = resource.version(Bridge.InventoryName)
Bridge.Debug('Inventory', Bridge.InventoryName, Version)

local qs_inventory = exports[Bridge.InventoryName]
Framework.OnReady(qs_inventory, function()
    Framework.Items = {}
    for k, v in pairs(qs_inventory:GetItemList()) do
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
    local result = Database.scalar('SELECT items FROM inventory_stash WHERE stash = ?', { 'Stash_' .. inventory })
    if result then stash = json.decode(result) end
    local itemInfo = qs_inventory:GetItemList()[item:lower()]
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
                info = metadata,
                label = itemInfo["label"],
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
            info = metadata,
            label = itemInfo["label"],
            weight = itemInfo["weight"],
            type = itemInfo["type"],
            unique = itemInfo["unique"],
            useable = itemInfo["useable"],
            image = itemInfo["image"],
            slot = slot,
        }
    end
    Database.insert('INSERT INTO inventory_stash (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {
        ['stash'] = 'Stash_' .. inventory,
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
    local result = Database.scalar('SELECT items FROM inventory_stash WHERE stash = ?', { 'Stash_' .. inventory })
    if result then stash = json.decode(result) else return false end
    count = tonumber(count) or 1
    if type(slot) == "number" and stash[slot] and stash[slot].name == item then
        if metadata and not table.matches(metadata, stash[slot].info) then return false end
        if stash[slot].amount > count then
            stash[slot].amount = stash[slot].amount - count
        else
            stash[slot] = nil
        end
        Database.insert('INSERT INTO inventory_stash (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {
            ['stash'] = 'Stash_' .. inventory,
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
            Database.insert('INSERT INTO inventory_stash (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {
                ['stash'] = 'Stash_' .. inventory,
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
        if not qs_inventory:CanCarryItem(inventory, item, count) then return false end
        return qs_inventory:AddItem(inventory, item, count, slot, metadata)
    end
    return false
end

Framework.RemoveItem = function(inventory, item, count, metadata, slot)
    if type(inventory) == "string" then
        return RemoveStashItem(inventory, item, count, metadata, slot)
    elseif type(inventory) == "number" then
        return qs_inventory:RemoveItem(inventory, item, count, slot, metadata)
    end
    return false
end

Framework.GetItem = function(inventory, item, metadata)
    local items = {}
    ---@cast items Item[]
    if type(inventory) == "string" then
        inventory = inventory:gsub("%-", "_")
        local invItems = qs_inventory:GetStashItems('Stash_' .. inventory)
        for k, v in pairs(invItems) do
            if v.name ~= item then goto skipLoop end
            if metadata and not table.matches(v.info, metadata) then goto skipLoop end
            items[#items + 1] = {
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
    elseif type(inventory) == "number" then
        for k, v in pairs(qs_inventory:GetInventory(inventory)) do
            if v.name ~= item then goto skipLoop end
            if metadata and not table.matches(v.info, metadata) then goto skipLoop end
            items[#items + 1] = {
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
        inventory = inventory:gsub("%-", "_")
        for k, v in pairs(qs_inventory:GetStashItems('Stash_' .. inventory)) do
            if v.name ~= item then goto skipLoop end
            if metadata and not table.matches(v.metadata, metadata) then goto skipLoop end
            count = count + tonumber(v.amount)
            ::skipLoop::
        end
    elseif type(inventory) == "number" then
        for k, v in pairs(qs_inventory:GetInventory(inventory)) do
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
        local stash = qs_inventory:GetStashItems('Stash_' .. inventory)
        if not next(stash) then return false end
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
        local invItems = {}
        for _, v in pairs(qs_inventory:GetInventory(inventory)) do
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
        local stash = qs_inventory:GetStashItems('Stash_' .. inventory)
        for k, item in pairs(stash) do
            if item.slot == slot then
                return item.info
            end
        end
        return {}
    elseif type(inventory) == "number" then
        return qs_inventory:GetItemBySlot(inventory, slot)?.info
    end
    return {}
end

Framework.SetItemMetadata = function(inventory, slot, metadata)
    if type(inventory) == "string" then
        inventory = inventory:gsub("%-", "_")
        local stash = qs_inventory:GetStashItems('Stash_' .. inventory)
        for k, item in pairs(stash) do
            if item.slot == slot then
                stash[k].info = metadata
                break
            end
        end
        if not next(stash) then return end
        qs_inventory:SaveStashItems('Stash_' .. inventory, stash)
    elseif type(inventory) == "number" then
        qs_inventory:SetItemMetadata(inventory, slot, metadata)
    end
end

Framework.GetInventory = function(inventory)
    local items = {}
    if type(inventory) == "string" then 
        inventory = inventory:gsub("%-", "_")
        for _, item in pairs(qs_inventory:GetStashItems('Stash_' .. inventory)) do
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
    elseif type(inventory) == "number" then
        for k, v in pairs(qs_inventory:GetInventory(inventory)) do
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

Framework.CreateUseableItem = function(name, cb)
    qs_inventory:CreateUsableItem(name, function(source, data)
        cb(source, data.name, { weight = data.weight, count = data.amount, slot = data.slot, name = data.name, metadata = data.info, label = data.label })
    end)
end

Framework.ClearInventory = function(inventory, keep)
    if type(inventory) == "string" then
        local stash = {}
        inventory = inventory:gsub("%-", "_")
        if keep then
            local stashItems = qs_inventory:GetStashItems('Stash_' .. inventory)
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
        Database.insert('INSERT INTO inventory_stash (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {
            ['stash'] = 'Stash_' .. inventory,
            ['items'] = json.encode(stash)
        })
    elseif type(inventory) == "number" then
        qs_inventory:ClearInventory(inventory, keep)
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
    local Player = Framework.GetPlayer(src)
    local inventory = qs_inventory:GetInventory(src)
    Framework.RegisterStash('Confiscated_' .. Player.Identifier, 41, 120000, true)
    Framework.ClearInventory('Confiscated_' .. Player.Identifier)
    for i = 1, #inventory do
        local item = inventory[i]
        Framework.AddItem('Confiscated_' .. Player.Identifier, item.name, item.amount, item.info, item.slot)
    end
    Framework.ClearInventory(src)
end

Framework.ReturnInventory = function(source)
    local src = source
    local Player = Framework.GetPlayer(src)
    local confiscated = qs_inventory:GetStashItems('Stash_Confiscated_' .. Player.Identifier)
    for i = 1, #confiscated do
        local item = confiscated[i]
        Framework.AddItem(src, item.name, item.amount, item.info, item.slot)
    end
    Framework.ClearInventory('Confiscated_' .. Player.Identifier)
end