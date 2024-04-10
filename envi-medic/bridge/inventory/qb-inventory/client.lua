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
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', name, { maxweight = stash.weight, slots = stash.slots })
        TriggerEvent('inventory:client:SetCurrentStash', name)
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

Framework.GetItem = function(item, metadata)
    local items = {}
    ---@cast items Item[]
    local PlayerData = QBCore.Functions.GetPlayerData()
    for k, v in pairs(PlayerData.items) do
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
    return items
end

Framework.HasItem = function(items, count, metadata)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local invItems = {}
    for _, v in pairs(PlayerData.items) do
        if metadata then
            if invItems[v.name] and table.matches(v.info, invItems[v.name].info) then
                invItems[v.name].amount = invItems[v.name].amount + v.amount
            else
                invItems[v.name] = { amount = v.amount, info = v.info }
            end
        else
            invItems[v.name] = { amount = (invItems[v.name] and invItems[v.name].amount or 0) + v.amount, info = {} }
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
    return false
end

Framework.LockInventory = function()
    LocalPlayer.state:set('inv_busy', true, true)
end

Framework.UnlockInventory = function()
    LocalPlayer.state:set('inv_busy', false, true)
end