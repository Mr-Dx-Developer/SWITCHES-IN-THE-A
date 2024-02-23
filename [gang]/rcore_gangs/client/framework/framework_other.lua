Framework = Framework or {}

if Config.Framework and Config.Framework == 3 then
    -- Displays a simple notification for the player
    -- @param {string} text - The notification message
    -- @return {nil}
    Framework.ShowNotification = function(text)
    end

    -- Displays an advanced notification for the player
    -- @param {string} title - The notification title
    -- @param {string} subject - The notification subject
    -- @param {string} text - The notification message
    -- @param {string} textureDict - The texture dictionary for the icon
    -- @param {string | number} iconType - The icon type
    -- @returns {nil}
    Framework.ShowAdvancedNotification = function(title, subject, text, textureDict, iconType)
    end

    -- Gets a unique player identifier typically used in the database
    -- @returns {string | number} identifier - The identifier
    Framework.GetPlayerId = function()
    end

    -- Gets called when a local player spawns in a vehicle from the gang garage
    -- @param {Vehicle} vehicle - The entity of the vehicle
    -- @returns {nil}
    Framework.SetVehicleKeys = function(vehicle)
    end

    -- Gets called when a local player is to be restrained or unrestrained
    -- @param {boolean} toggle - Whether or not to block the actions
    -- @returns {nil}
    Framework.ActionsOnRestrain = function(toggle)
    end

    -- Gets called when a local player is to be headbagged or unheadbagged
    -- @param {boolean} toggle - Whether or not to block the actions
    -- @returns {nil}
    Framework.ActionsOnBlindfold = function(toggle)
    end
end