Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('qs-inventory') == 'starting' or GetResourceState('qs-inventory') == 'started' then
        Config.Inventory = 3
    end
end

if Config.Inventory and Config.Inventory == 3 then
    Inventory.GetItems = function()
        local items = {}

        local inventory = {}

        if ESX then
            inventory = ESX.GetPlayerData().inventory
        end

        if QBCore then
            inventory = QBCore.Functions.GetPlayerData().items
        end

        for index, item in pairs(inventory) do
            if (item.count and item.count > 0) or (item.amount and item.amount > 0) then
                table.insert(items, item)
            end
        end

        return items
    end

    Inventory.OpenStorage = function(storage)
        local other = {}

        other.slots = Config.GangOptions.storageSlots or 50
        other.maxweight = Config.GangOptions.storageWeight or 100000

        TriggerEvent('inventory:client:SetCurrentStash', storage)
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', storage, other)
    end

    Inventory.OpenPlayerInventory = function(player)
        TriggerServerEvent('inventory:server:OpenInventory', 'otherplayer', GetPlayerServerId(player))
    end
end