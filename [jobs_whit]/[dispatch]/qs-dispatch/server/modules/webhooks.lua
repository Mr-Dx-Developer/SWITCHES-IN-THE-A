local function SendWebhook(link, title, color, message, imageUrl)
    local embedMsg = {
        {
            color = tonumber(color:sub(2), 16) or 16777215, -- Convierte el código Hex a un número decimal
            title = title,
            description = message,
            footer = {
                text = os.date("%c") .. " (Server Time)."
            },
            image = {
                url = imageUrl
            }
        }
    }
    PerformHttpRequest(link, function(err, text, headers) end, 'POST', json.encode({ embeds = embedMsg }), { ['Content-Type'] = 'application/json' })
end

exports('SendWebhook', SendWebhook)