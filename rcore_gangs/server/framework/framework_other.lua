Framework = Framework or {}

if Config.Framework and Config.Framework == 3 then
    -- Displays a simple notification for the player
    -- @param {number} source - The player's server identifier
    -- @param {string} text - The notification message
    -- @returns {nil}
    Framework.ShowNotification = function(source, text)
    end

    -- Displays an advanced notification for the player
    -- @param {number} source - The player's server identifier
    -- @param {string} title - The notification title
    -- @param {string} subject - The notification subject
    -- @param {string} text - The notification message
    -- @returns {nil}
    Framework.ShowAdvancedNotification = function(source, title, subject, text)
    end

    -- Gets all players on the server registered by the framework
    -- @returns {table} players - The table containing all the players
    Framework.GetPlayers = function()
    end

    -- Gets a unique player identifier typically used in the database
    -- @param {number} source - The player's server identifier
    -- @returns {string | number} identifier - The identifier
    Framework.GetPlayerId = function(source)
    end

    -- Gets the player's current amount of money
    -- @param {number} source - The player's server identifier
    -- @returns {number} amount - The player's current amount of money
    Framework.GetPlayerMoney = function(source)
    end

    -- Adds an amount of money to the player
    -- @param {number} source - The player's server identifier
    -- @param {number} amount - The amount of money to be added
    -- @returns {nil}
    Framework.AddPlayerMoney = function(source, amount)
    end

    -- Adds an amount of dirty money to the player
    -- @param {number} source - The player's server identifier
    -- @param {number} amount - The amount of money to be added
    -- @returns {nil}
    Framework.AddPlayerDirtyMoney = function(source, amount)
    end

    -- Removes an amount of money from the player
    -- @param {number} source - The player's server identifier
    -- @param {number} amount - The amount of money to be removed
    -- @returns {nil}
    Framework.RemovePlayerMoney = function(source, amount)
    end

    -- Checks whether a player is allowed to use admin commands
    -- @param {number} source - The player's server identifier
    -- @returns {boolean} allowed - Value indicating whether player is allowed or not
    Framework.IsPlayerAllowed = function(source)
    end

    -- Gets called when a player joins a gang
    -- @param {number} source - The player's server identifier
    -- @param {table} gang - The table containing all the information about the gang
    Framework.SetPlayerGang = function(source, gang)
    end

    -- Gets called when a new gang gets created
    -- @param {table} gang - The table containing all the information about the gang
    Framework.CreateGang = function(gang)
    end

    -- Gets the current number of police officers on duty
    -- @returns {number} officers - The current number of police officers on duty
    Framework.GetPoliceCount = function()
    end

    -- Modifies a vehicle taken out from the gang garage
    -- @param {Vehicle} vehicle - The handle of the vehicle taken out from the garage
    -- @returns {nil}
    Framework.SetVehicleModifications = function(vehicle)
    end
end