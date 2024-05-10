Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('esx_inventoryhud') == 'missing' and (GetResourceState('esx_addoninventory') == 'starting' or GetResourceState('esx_addoninventory') == 'started') then
        Config.Inventory = 8
    end
end

if Config.Inventory and Config.Inventory == 8 then
    Inventory.GetItems = function()
        local items = {}

        local inventory = ESX.GetPlayerData().inventory

        for index, item in pairs(inventory) do
            if (item.count and item.count > 0) or (item.amount and item.amount > 0) then
                table.insert(items, item)
            end
        end

        return items
    end

    Inventory.OpenStorage = function(storage)
        print('^1[GANGS] Storage not supported^7')
    end

    Inventory.OpenPlayerInventory = function(player)
        print('^1[GANGS] Robbing not supported^7')
    end
end