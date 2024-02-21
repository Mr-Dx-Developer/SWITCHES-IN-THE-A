RegisterNetEvent('xs_drugcraft:notify', function(title, desc, style, icon, id)
    --Customize with your own notification system.

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
