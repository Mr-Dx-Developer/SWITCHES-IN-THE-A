-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

-- Customize these functions to update various things throughout Wasabi Scripts

-- Notifications
RegisterNetEvent('wasabi_bridge:notify', function(title, desc, style, icon, id)
    --Customize with your own notification system.
    --To use framework specific one you can use this function:
    -- WSB.showNotification(msg, style)

    -- Edit code below to use your own notification system (This support wasabi_notify, ox_lib, and framework notify in that priority by default!)
    -- wasabi_notify: https://store.wasabiscripts.com/package/6215100

    if GetResourceState('wasabi_notify') == 'started' then -- If using wasabi_notify, automatic detection
        if style == 'inform' then style = 'info' end

        exports.wasabi_notify:notify(title, desc, 3500, style or 'info', Config.NotificationSound or false, icon, id)
        return
    end

    if GetResourceState('ox_lib') == 'started' then -- If using ox_lib and not wasabi_notfy automatic detection
        if style == 'info' then style = 'inform' end
        exports.ox_lib:notify({
            title = title,
            description = desc or false,
            id = id or false,
            position = 'top-right',
            icon = icon or false,
            duration = 3500,
            type = style or 'inform'
        })
        return
    end

    WSB.showNotification(title, desc, style) -- Remove this and add your own notify


    -- Edit Code above to use your own notification system
end)

-- Text UI
local textUI = false

-- Show text UI
function WSB.showTextUI(msg)
    -- EDIT: Customize with your own text UI system
    if GetResourceState('wasabi_textui') == 'started' then
        exports.wasabi_textui:showTextUI(msg)
        textUI = msg
        return
    end

    if GetResourceState('ox_lib') == 'started' then
        exports.ox_lib:showTextUI(msg)
        textUI = msg
        return
    end
end

-- Hide text UI
function WSB.hideTextUI()
    if GetResourceState('wasabi_textui') == 'started' then
        exports.wasabi_textui:hideTextUI()
        textUI = false
        return
    end

    if GetResourceState('ox_lib') == 'started' then
        exports.ox_lib:hideTextUI()
        textUI = false
        return
    end

    -- EDIT: Customize with your own text UI system
end

-- Checking for text UI
function WSB.isTextUIOpen()
    return textUI and true or false, textUI or false
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
