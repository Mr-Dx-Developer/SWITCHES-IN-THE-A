-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
ESX = exports.es_extended:getSharedObject() -- Customize ESX?

RegisterNetEvent('wasabi_multijob:notify', function(title, desc, style) -- Custom notification?
    lib.notify({
        title = title,
        description = desc,
        duration = 3500,
        type = style
    })
end)