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
        item.image = v.image
        item.type = v.type
        Framework.Items[v.name] = item
    end
end)

Framework.OpenStash = function(name)
    name = name:gsub("%-", "_")
    Framework.TriggerCallback(Bridge.Resource .. ':bridge:GetStash', function(stash)
        if not stash then return end
        local isAllowed = false
        if stash.groups and Framework.HasJob(stash.groups, Framework.Player) then isAllowed = true end
        if stash.groups and Framework.HasGang(stash.groups, Framework.Player) then isAllowed = true end
        if stash.groups and not isAllowed then return end
        if stash.owner and type(stash.owner) == 'string' and Framework.Player.Identifier ~= stash.owner then return end
        if stash.owner and type(stash.owner) == 'boolean' then name = name .. Framework.Player.Identifier end
        qs_inventory:RegisterStash(name, stash.slots, stash.weight)
    end, name)
end

Framework.OpenShop = function(name)
    Framework.TriggerCallback(Bridge.Resource .. ':bridge:OpenShop', function(shopdata)
        if table.type(shopdata) ~= 'empty' then
            local Shop = {}
            Shop.label = shopdata.name
            Shop.items = {}
            for i = 1, #shopdata.items do
                Shop.items[i] = {
                    name = shopdata.items[i].name,
                    price = shopdata.items[i].price,
                    amount = shopdata.items[i].count or 1,
                    info = shopdata.items[i].metadata or {},
                    type = Framework.Items[shopdata.items[i].name].type,
                    slot = i
                }
            end
            TriggerServerEvent("inventory:server:OpenInventory", "shop", shopdata.name, Shop)
        end
    end, name)
end

Framework.CloseInventory = function()
    ExecuteCommand('closeinv')
end

Framework.GetItem = function(item, metadata, strict)
    local items = {}
    ---@cast items Item[]
    for k, v in pairs(qs_inventory:getUserInventory()) do
        if v.name ~= item then goto skipLoop end
        if metadata and (strict and not table.matches(v.info, metadata) or not table.contains(v.info, metadata)) then goto skipLoop end
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
    return items
end

Framework.HasItem = function(items, count, metadata, strict)
    if type(items) == "string" then
        local counted = 0
        for _, v in pairs(Framework.GetItem(items, metadata, strict)) do
            counted+=v.count
        end
        return counted >= (count or 1)
    elseif type(items) == "table" then
        if table.type(items) == 'hash' then
            for item, amount in pairs(items) do
                local counted = 0
                for _, v in pairs(Framework.GetItem(item, metadata, strict)) do
                    counted+=v.count
                end
                if counted < amount then return false end
            end
            return true
        elseif table.type(items) == 'array' then
            local counted = 0
            for i = 1, #items do
                local item = items[i]
                for _, v in pairs(Framework.GetItem(item, metadata, strict)) do
                    counted+=v.count
                end
                if counted < (count or 1) then return false end
            end
            return true
        end
    end
end

Framework.LockInventory = function()
    LocalPlayer.state:set('inv_busy', true, true)
end

Framework.UnlockInventory = function()
    LocalPlayer.state:set('inv_busy', false, true)
end