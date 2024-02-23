local WebHooks = {
    ["exploit"] = "https://discordapp.com/api/webhooks/1210731246934687834/EjDkZohYxJvGI1xGLeHouHSVgB7Z4BoKwMM3I9S0navCm-mPhw-CHT4I5eJWuaqRIHqS",
    ["triggered"] = "https://discordapp.com/api/webhooks/1210731307869409320/0_Xz95W5dBV9zqrnCrxgfXDf17gKYwXYoCNrNe3l03Y9gGn5M5w8HYS14stj0-Ilk1w0",
    ["report"] = "https://discordapp.com/api/webhooks/1210731365230841977/GzROB3SP0UUmMfTg7Ie9km5J3_-9VkAcNCTdXhIrrLU2eaHLAvERXAzLaWppJgdo37VI",
    ["transcript"] = "https://discordapp.com/api/webhooks/1210731424378912818/f7Acfxu3jJkQgVNKMWHW5qjQtwLNstVH0r-rKnx-MH8Sf0XvRxVcqm8tp1ovIWha3GPz",
    ["bans"] = "https://discordapp.com/api/webhooks/1210731479575826464/0KxYOAMqokMZntFosUo3xkQi9WrY9-yANoYkJwZWo7PctVB_76HvGxhRjpdsrk98s1JU",
}

function SendLogs(source, type, message)
    local colorcode = 5763719
    if type == "exploit" then
        colorcode = 16711680
    end
    local description = ""
    if source == 0 then
        description = "**"..message.."**"
    else
        description = "**"..GetPlayerName(source).."** ("..source..")\n"..message
    end
    if type == "report" then
        description = "**"..GetPlayerName(source).."** ".. message
    end
    local embedData = {
        {
            ["title"] = "Admin Menu Logs" ,
            ["color"] = colorcode,
            ["footer"] = {
                ["text"] = os.date("%c"),
            },
            ["description"] = description,
            ["author"] = {
            ["name"] = 'Snipe Admin Menu Logs',
            },
        }
    }
    if type == "transcript" then
        embedData[1].title = "Chat Transcript (Closed by "..GetPlayerName(source)..")"
        embedData[1].footer.text = "Closed on "..os.date("%c")
        embedData[1].description = message
        description = ""
    end
    PerformHttpRequest(WebHooks[type], function(err, text, headers) end, 'POST', json.encode({ username = "Snipe Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end


RegisterServerEvent("snipe-menu:server:sendLogs", function(type, message)
    if type == "exploit" then
        SendLogs(source, type, message)
    elseif type == "triggered" then
        SendLogs(source, type, message)
    end
end)