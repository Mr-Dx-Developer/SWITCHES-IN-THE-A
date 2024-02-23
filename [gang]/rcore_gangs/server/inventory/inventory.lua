Inventory = Inventory or {}

if not Config.Inventory or Config.Inventory == 0 then
    -- Retrieves an item from the player's inventory
    -- @param {number} source - The player's server identifier
    -- @param {string} item - The name of the item
    -- @returns {table} item - The table containing all metadata of the item
    Inventory.GetPlayerItem = function(source, item)
        -- If the inventory you use is not supported by this script, place your code here
        print('^1[GANGS] Inventory not recognized^7')
    end

    -- Adds an item to the player's inventory
    -- @param {number} source - The player's server identifier
    -- @param {string} item - The name of the item
    -- @param {number} amount - The amount to add
    -- @param {number} slot - The item slot
    -- @param {table} info - Additional metadata for the item
    -- @returns {nil}
    Inventory.AddPlayerItem = function(source, item, amount, slot, info)
        -- If the inventory you use is not supported by this script, place your code here
        print('^1[GANGS] Inventory not recognized^7')
    end

    -- Removes an item from the player's inventory
    -- @param {number} source - The player's server identifier
    -- @param {string} item - The name of the item
    -- @param {number} amount - The amount to remove
    -- @param {number} slot - The item slot
    -- @returns {nil}
    Inventory.RemovePlayerItem = function(source, item, amount, slot)
        -- If the inventory you use is not supported by this script, place your code here
        print('^1[GANGS] Inventory not recognized^7')
    end

    -- Checks whether the gang storage is empty or not
    -- @param {string} storage - The name of the storage
    -- @returns {boolean} empty - Value indicating whether or not the storage is empty
    Inventory.IsStorageEmpty = function(storage)
        -- If the inventory you use is not supported by this script, place your code here
        print('^1[GANGS] Inventory not recognized^7')
    end
end