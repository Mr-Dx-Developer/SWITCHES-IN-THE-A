local last911Time = 0
local lastEMSTime = 0
local lastMECANICTime = 0
local lastPANICime = 0
local commands_timeout = 20000


TriggerEvent('chat:addSuggestion', '/police', 'Call to Police Services', {
    { name = 'message', help = 'Message to send to police' },
})
RegisterCommand("police", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if not message then
        return
    end

    local currentTime = GetGameTimer()
    if currentTime - last911Time < commands_timeout then
        SendTextMessage(Lang('POLICE_COOLDOWN'), 'inform')
        return
    end

    -- Actualizar el tiempo de la última notificación
    last911Time = currentTime
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "Civil call", snippet = "911" },
            message = message,
            flashes = false,
            image = nil, -- IMAGE URL SEE DOCS TO GET MORE INFORMATION... https://docs.quasar-store.com
            blip = {
                sprite = 817,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "911 Call",
                time = (3 * 60 * 1000), -- 3 minutes
            },
            otherData = {
                {
                    text = 'Red Obscure',
                    icon = 'fas fa-user-secret',
                }
            }
        }
    )
end, false)

TriggerEvent('chat:addSuggestion', '/ambulance', 'Call to Ambulance Services', {
    { name = 'message', help = 'Message to send to ambulance' },
})
RegisterCommand("ambulance", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if not message then
        return
    end

    local currentTime = GetGameTimer()
    if currentTime - lastEMSTime < commands_timeout then
        SendTextMessage(Lang('AMBULANCE_COOLDOWN'), 'inform')
        return
    end

    -- Actualizar el tiempo de la última notificación
    lastEMSTime = currentTime
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "ambulance",
            callLocation = playerData.coords,
            callCode = { code = "Civil call", snippet = "EMS" },
            message = message,
            flashes = false,
            image = nil, -- IMAGE URL SEE DOCS TO GET MORE INFORMATION... https://docs.quasar-store.com
            blip = {
                sprite = 817,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "EMS Call",
                time = (3 * 60 * 1000), -- 3 minutes
            }
        }
    )
end, false)

TriggerEvent('chat:addSuggestion', '/mechanic', 'Call to Mechanic Services', {
    { name = 'message', help = 'Message to send to mechanic' },
})
RegisterCommand("mechanic", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if not message then
        return
    end

    local currentTime = GetGameTimer()
    if currentTime - lastMECANICTime < commands_timeout then
        SendTextMessage(Lang('MECHANIC_COOLDOWN'), 'inform')
        return
    end

    -- Actualizar el tiempo de la última notificación
    lastMECANICTime = currentTime
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "mechanic",
            callLocation = playerData.coords,
            callCode = { code = "Civil call", snippet = "Mechanic" },
            message = message,
            flashes = false,
            image = nil, -- IMAGE URL SEE DOCS TO GET MORE INFORMATION... https://docs.quasar-store.com
            blip = {
                sprite = 817,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "MECHANIC Call",
                time = (3 * 60 * 1000), -- 3 minutes
            }
        }
    )
end, false)

TriggerEvent('chat:addSuggestion', '/panic', 'Panic call!!!', {
    { name = 'message', help = 'Message To send' },
})

RegisterCommand("panic", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if not message then
        return
    end

    local currentTime = GetGameTimer()
    if currentTime - lastPANICime < commands_timeout then
        SendTextMessage(Lang('PANIC_COOLDOWN'), 'inform')
        return
    end

    -- Actualizar el tiempo de la última notificación
    lastPANICime = currentTime
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "PANIC CALL", snippet = "POLICE" },
            message = message,
            flashes = true,
            image = nil, -- IMAGE URL SEE DOCS TO GET MORE INFORMATION... https://docs.quasar-store.com
            blip = {
                sprite = 630,
                scale = 1.5,
                colour = 1,
                flashes = true,
                text = "PANIC CALL",
                time = (5 * 60 * 1000), -- 5 minutes
            }
        }
    )
end, false)

RegisterCommand("onduty", function(source, args, rawCommand)
    ToggleDuty(true)
end, false)

RegisterCommand("offduty", function(source, args, rawCommand)
    ToggleDuty(false)
end, false)







local lastTaxiTime = 0

TriggerEvent('chat:addSuggestion', '/taxi', 'Call to Taxi Services', {
    { name = 'message', help = 'Message to send to taxi' },
})
RegisterCommand("taxi", function(source, args, rawCommand)
    local message = table.concat(args, " ")
    if not message then
        return
    end

    local currentTime = GetGameTimer()
    if currentTime - lastTaxiTime < commands_timeout then
        SendTextMessage(Lang('taxi_COOLDOWN'), 'inform')
        return
    end

    -- Actualizar el tiempo de la última notificación
    lastTaxiTime = currentTime
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "taxi",
            callLocation = playerData.coords,
            callCode = { code = "Civil call", snippet = "TAXI" },
            message = message,
            flashes = false,
            image = nil, -- IMAGE URL SEE DOCS TO GET MORE INFORMATION... https://docs.quasar-store.com
            blip = {
                sprite = 817,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Taxi Call",
                time = (3 * 60 * 1000), -- 3 minutes
            }
        }
    )
end, false)