Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    -- Retrieves all items from the player's inventory
    -- @returns {table} items - The table containing all items and their metadata
    Inventory.GetItems = function()
        -- If the inventory you use is not supported by this script, place your code here
        print('^1[GANGS] Inventory not recognized^7')
    end

    -- Gets called when a player wants to open the gang storage
    -- @param {string} storage - The name of the storage
    -- @returns {nil}
    Inventory.OpenStorage = function(storage)
        -- If the inventory you use is not supported by this script, place your code here
        print('^1[GANGS] Inventory not recognized^7')
    end

    -- Gets called when a player wants to rob another player
    -- @param {Player} player - The handle to the player for natives such as GetPlayerServerId
    -- @returns {nil}
    Inventory.OpenPlayerInventory = function(player)
        -- If the inventory you use is not supported by this script, place your code here
        print('^1[GANGS] Inventory not recognized^7')
    end
end