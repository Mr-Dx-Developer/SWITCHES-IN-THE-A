-- Initialize persistent sender number
local sender = Config.Phone == 'npwd' and exports.npwd:generatePhoneNumber() or math.random(1000000, 9999999)

-- Empty function that's triggered when done chopping a part
-- Useful for various reasons such as XP systems, rewarding items, etc
--- @param source number Player ID
--- @param model string Vehicle model: panto
--- @param type string Part type: wheels, doors or frame
ChoppedPart = function(source, model, type)
    -- Can be used for any purpose, such as rewarding a specific item for a specific model
    -- When chopping a specific part, or any sort of other similar variation(s).
    -- Below is a simplified example:
    if model == 'baller3' then
        if type == 'frame' then
            local chance = math.random(100)
            if chance < 15 then
                -- AddItem(source, 'specialItem', 1)
            end
        end
    end
    -- The simplified example above rewards a "specialItem" with a 15% chance
    -- When a baller3 frame is chopped by a player

    -- This can be expanded on by the use of exports as well. For example, checking
    -- If the player has a certain amount of reputation first. Like so:
    if exports.lation_chopshop:GetData(source, 'reputation') >= 10000 then
        if model == 'baller3' then
            if type == 'frame' then
                local chance = math.random(100)
                if chance < 15 then
                    -- AddItem(source, 'specialItem', 1)
                end
            end
        end
    end
    -- The above example will now only consider a player for this "specialItem" if
    -- They have 10,000 or more reputation. 
end

-- Empty function that's triggered when a player purchases from the tool shop
--- @param source number Player ID
--- @param data table item, label, price, min, max
--- @param quantity number Quantity of item purchased
ToolPurchased = function(source, data, quantity)

end

-- Empty function that's triggered when a player swaps auto parts for an item
--- @param source number Player ID
--- @param data table item, label, price, min, max of item swapped for
--- @param quantity number Quantity of item swapped for
PartsSwapped = function(source, data, quantity)

end

-- Server event that handles sending a text message or email depending on phone
--- @param source number
--- @param data table
--- @param number number | string | nil
RegisterNetEvent('lation_chopshop:phoneMessage', function(source, data, number)
    if not source or not data then return end
    local source = source
    if Config.Phone == 'qb-phone' then
        local identifier = GetIdentifier(source)
        local message = { sender = data.sender, subject = data.subject, message = data.content }
        exports['qb-phone']:sendNewMailToOffline(identifier, message)
    elseif Config.Phone == 'npwd' then
        exports.npwd:emitMessage({
            senderNumber = math.random(1000000, 9999999),
            targetNumber = number,
            message = data.content
        })
    elseif Config.Phone == 'qs-smartphone' then
        local identifier = GetIdentifier(source)
        local message = { sender = data.sender, subject = data.subject, message = data.content }
        TriggerEvent('qs-smartphone:server:sendNewMailToOffline', identifier, message)
    elseif Config.Phone == 'qs-smartphonepro' then
        -- Handled on client side, nothing needed here
    elseif Config.Phone == 'lb-phone' then
        local phoneNumber = exports["lb-phone"]:GetEquippedPhoneNumber(source)
        local email = exports["lb-phone"]:GetEmailAddress(phoneNumber)
        local message = { to = email, subject = data.subject, message = data.content }
        exports["lb-phone"]:SendMail(message)
    elseif Config.Phone == 'gksphone' then
        local messsage = { sender = data.sender, subject = data.subject, message = data.content }
        exports["gksphone"]:SendNewMailOffline(source, messsage)
    elseif Config.Phone == 'yseries' then
        local identifier = GetIdentifier(source)
        local phoneNumber = exports["yseries"]:GetPhoneNumberByIdentifier(identifier)
        local message = { title = data.title, sender = data.sender, senderDisplayName = data.name, content = data.content }
        exports["yseries"]:SendMail(message, 'phoneNumber', phoneNumber)
    elseif Config.Phone == 'custom' then
        -- Configure 'custom' phone system here
    end
end)

-- Function used to return a total count of all police online
PoliceCount = function()
    local jobCount = 0
    if Framework == 'esx' then
        for _, player in pairs(ESX.GetExtendedPlayers()) do
            local job = player.getJob()
            for _, jobs in pairs(Config.Police.jobs) do
                local jobNames = jobs
                if job.name == jobNames then
                    jobCount = jobCount + 1
                end
            end
        end
    elseif Framework == 'qb' then
        for _, players in pairs(QBCore.Functions.GetPlayers()) do
            local player = QBCore.Functions.GetPlayer(players)
            local job = player.PlayerData.job
            for _, jobs in pairs(Config.Police.jobs) do
                local jobNames = jobs
                if job.name == jobNames then
                    jobCount = jobCount + 1
                end
            end
        end
    else
        -- Add support for a custom framework here
    end
    return jobCount
end

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