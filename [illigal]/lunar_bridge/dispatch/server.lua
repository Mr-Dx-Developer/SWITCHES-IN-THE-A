Dispatch = {}

--This function dispatches all the calls
function Dispatch.call(coords, data)
    if Config.Dispatch.Type == 'normal' then
        TriggerClientEvent('lunar_bridge:dispatch:call', -1, coords, data)
    elseif Config.Dispatch.Type == 'cd_dispatch' then
        local title = string.format('%s - %s', data.Code, data.Title)

        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = Config.Dispatch.Jobs,
            coords = coords,
            title = title,
            message = data.Message,
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = title,
                time = (5*60*1000),
                radius = 0,
                sound = 1,
            }
        })
    elseif Config.Dispatch.Type == 'qs-dispatch' then
        local title = string.format('%s - %s', data.Code, data.Title)

        TriggerEvent('qs-dispatch:server:CreateDispatchCall', {
            job = Config.Dispatch.Jobs,
            callLocation = coords,
            callCode = { code = data.Code, snippet = data.Title },
            message = data.Message,
            flashes = false,
            image = nil,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = true,
                text = title,
                time = (20 * 1000),     --20 secs
            }
        })
    elseif Config.Dispatch.Type == 'ps-dispatch' then
        TriggerEvent('ps-dispatch:server:notify', {
            message = data.Message,
            codeName = data.Title,
            code = data.Code,
            coords = coords,
            priority = 2,
            jobs = { 'leo' },
            alert = { 
                displayCode = data.Code,
                description = data.Message,
                coords = coords,
                radius = 1.2,
                recipientList = Config.Dispatch.Jobs,
                sprite = 431,
                color = 3,
                scale = 1.2,
                length = 20 * 1000,
                sound = "Lose_1st",
                flash = true
            }
        })
    elseif Config.Dispatch.Type == 'rcore_dispatch' then
        local title = string.format('%s - %s', data.Code, data.Title)
        local data = {
            code = title, -- string -> The alert code, can be for example '10-64' or a little bit longer sentence like '10-64 - Shop robbery'
            default_priority = 'high', -- 'low' | 'medium' | 'high' -> The alert priority
            coords = coords, -- vector3 -> The coords of the alert
            job = Config.Dispatch.Jobs, -- string | table -> The job, for example 'police' or a table {'police', 'ambulance'}
            text = data.Message, -- string -> The alert text
            type = 'alerts', -- alerts | shop_robbery | car_robbery | bank_robbery -> The alert type to track stats
            blip_time = 5, -- number (optional) -> The time until the blip fades
            blip = { -- Blip table (optional)
                sprite = 431, -- number -> The blip sprite: Find them here (https://docs.fivem.net/docs/game-references/blips/#blips)
                colour = 3, -- number -> The blip colour: Find them here (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
                scale = 1.2, -- number -> The blip scale
                text = data.Title, -- number (optional) -> The blip text
                flashes = true, -- boolean (optional) -> Make the blip flash
                radius = 0, -- number (optional) -> Create a radius blip instead of a normal one
            }
        }
        TriggerEvent('rcore_dispatch:server:sendAlert', data)
    else
        error(('%s is not implemented, you can implement it in lunar_bridge/dispatch/server.lua'):format(Config.Dispatch.Type))
    end
end