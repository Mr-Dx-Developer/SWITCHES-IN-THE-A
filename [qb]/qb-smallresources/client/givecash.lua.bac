CreateThread(function()
    exports['qb-target']:AddGlobalPlayer({
        options = {
            { 
                type = "client",
                event = "qb-smallresources:client:menu",
                icon = "fas fa-money",
                label = "Give Cash",
            },
        },
        distance = 3.0 
    })
end)


RegisterNetEvent('qb-smallresources:client:menu', function()
    local input = exports['qb-input']:ShowInput({
        header = "Give Cash",
        submitText = "Give Cash",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'id',
                text = 'ID Of Player'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = '$ amount'
            }
        }
    })
    if input then
        if not input.id or not input.amount then return end
        TriggerServerEvent("qb-smallresources:server:charge", input.id, input.amount)
    end
end)