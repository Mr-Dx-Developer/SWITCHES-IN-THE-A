-- Empty function thats triggered when a player finds a seed
--- @param source number Player ID
--- @param item string Item name
--- @param amount number Quantity of items received
SeedsFound = function(source, item, amount)

end


-- Empty function thats triggered when a player plants a seed
--- @param source number Player ID
--- @param data table id, x, y, z, strain, hunger, thirst, quality, growth, props, stage, bucket, owner
SeedPlanted = function(source, data)

end

-- Empty function thats triggered when a player fertilizes a plant
--- @param source number Player ID
PlantFed = function(source)

end

-- Empty function thats triggered when a player waters a plant
--- @param source number PlayerID
PlantWatered = function(source)

end

-- Empty function thats triggered when a player harvests a plant
--- @param source number Player ID
--- @param item string Item name
--- @param amount number Quantity of items received
PlantHarvested = function(source, item, amount)

end

-- Empty function thats triggered when a player rolls joints
--- @param source number Player ID
--- @param item string Item name
--- @param amount number Quantity of items received
JointRolled = function(source, item, amount)

end

-- Empty function thats triggered when a player smokes a joint
--- @param source number Player ID
--- @param item string Item name
JointSmoked = function(source, item)

end

-- Empty function thats triggered when a player buys from supply shop
--- @param source number Player ID
--- @param item string Item name
--- @param quantity number Quantity of item purchased
ItemPurchased = function(source, item, quantity)

end

-- Register command to open plant management menu
lib.addCommand('plants', {
    help = 'Administrative plant management menu',
    restricted = 'group.admin'
}, function(source)
    local source = source
    TriggerClientEvent('lation_weed:OpenAdminMenu', source)
end)

-- Function that produces Discord Webhook logs
--- @param link string Webhook link
--- @param title string Title of the log
--- @param message string Message contents
--- @param color number Decimal value embed color
DiscordLogs = function(link, title, message, color)
    local embed = {{["color"] = color, ["title"] = "**".. title .."**", ["description"] = message, ["footer"] = {["text"] = os.date("%a %b %d, %I:%M%p"), ["icon_url"] = Logs.Footer}}}
    PerformHttpRequest(link, function(err, text, headers) end, 'POST', json.encode({username = Logs.Name, embeds = embed, avatar_url = Logs.Image}), { ['Content-Type'] = 'application/json' })
end

-- Function used to print events if Config.Debug is enabled
--- @param string string Event message
EventLog = function(string)
    if not string or not Config.Debug then return end
    print(string)
end