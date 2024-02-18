-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

-- Customize these functions to update various things throughout Wasabi Scripts

-- Notifications
RegisterNetEvent('wasabi_bridge:notify', function(title, desc, style, icon, id)
    --Customize with your own notification system.
    --To use framework specific one you can use this function:
    -- WSB.showNotification(msg, style)
    lib.notify({
        title = title,
        description = desc or false,
        id = id or false,
        position = Config.NotificationLocation or 'top-right',
        icon = icon or false,
        duration = 3500,
        type = style or 'inform'
    })
end)

-- Show text UI
function WSB.showTextUI(msg)
    lib.showTextUI(msg)
end

-- Hide text UI
function WSB.hideTextUI()
    lib.hideTextUI()
end

-- Add car keys
function WSB.giveCarKeys(plate, _model, _vehicle)
    if WSB.framework == 'qb' then
        TriggerEvent('vehiclekeys:client:SetOwner', plate)
    else
        exports.wasabi_carlock:GiveKey(plate) -- Leave like this if using wasabi_carlock
    end
end

function WSB.removeCarKeys(plate, _model, _vehicle)
    -- Put remove key logic here
end
