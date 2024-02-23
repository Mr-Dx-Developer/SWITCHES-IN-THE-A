Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    if GetResourceState('mf-inventory') == 'starting' or GetResourceState('mf-inventory') == 'started' then
        Config.Inventory = 6
    end
end

if Config.Inventory and Config.Inventory == 6 then
    Inventory.GetItems = function()
        local items = {}

        exports['mf-inventory']:getInventoryItems(Framework.GetPlayerId(), function(inventory) items = inventory end)

        while next(items) == nil do
            Wait(0)
        end

        return items
    end

    Inventory.OpenStorage = function(storage)
        TriggerServerEvent('rcore_gangs:server:mf-inventory', storage)
    end

    Inventory.OpenPlayerInventory = function(player)
        ESX.TriggerServerCallback('esx:getOtherPlayerData', function(data)
            exports['mf-inventory']:openOtherInventory(data.identifier)
        end, GetPlayerServerId(player))
    end

    RegisterNetEvent('rcore_gangs:client:mf-inventory')
    AddEventHandler('rcore_gangs:client:mf-inventory', function(storage)
        exports['mf-inventory']:openOtherInventory(storage) 
    end)
end