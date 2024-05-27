-- Empty function that is ran when an item is found
--- @param source number Player ID
--- @param model string Metal detector model (ex: blue_metaldetector)
--- @param item string Item spawn name (ex: md_bottlecap)
--- @param label string Item "label" (ex: Bottle Cap)
--- @param quantity number Quanaity of item found
FoundItem = function(source, model, item, label, quantity)

end

-- Function that produces Discord Webhook logs
--- @param link string Webhook link
--- @param title string Title of the log
--- @param message string Message contents
--- @param color number Decimal value embed color
--- @param image string | nil Link of the image or nothing
DiscordLogs = function(link, title, message, color, image)
    local embed = {{["color"] = color, ["title"] = "**".. title .."**", ["description"] = message, ["image"] = {["url"] = image or ''}, ["footer"] = {["text"] = os.date("%a %b %d, %I:%M%p"), ["icon_url"] = Logs.Footer}}}
    PerformHttpRequest(link, function(err, text, headers) end, 'POST', json.encode({username = Logs.Name, embeds = embed, avatar_url = Logs.Image}), { ['Content-Type'] = 'application/json' })
end