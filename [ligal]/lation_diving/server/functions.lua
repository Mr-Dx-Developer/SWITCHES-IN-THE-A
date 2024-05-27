-- Initialize persistent sender number
local sender = Config.Phone == 'npwd' and exports.npwd:generatePhoneNumber() or math.random(1000000, 9999999)

-- Empty function that's triggered when a boat is rented
--- @param source number Player ID
BoatRented = function(source)

end

-- Empty function that's triggered when Scuba Gear is purchased
--- @param source number Player ID
GearPurchased = function(source)

end

-- Empty function that's triggered when a group is created
--- @param source number Player ID
GroupCreated = function(source)

end

-- Empty function that's triggered when a crate is found
--- @param source number Player ID
CrateFound = function(source)

end

-- Empty function that's triggered when a crate is opened
--- @param source number Player ID
CrateOpened = function(source)

end

-- Server event that handles sending a text message or email depending on phone
--- @param source number
--- @param number number | string
--- @param data table
RegisterNetEvent('lation_diving:phoneMessage', function(source, number, data)
    local source = source
    if Config.Phone == 'npwd' then
        exports.npwd:emitMessage({
            senderNumber = sender,
            targetNumber = number,
            message = data.content
        })
    elseif Config.Phone == 'gks' then
        local message = {sender = data.sender, subject = data.subject, message = data.content}
        exports["gksphone"]:SendNewMailOffline(source, message)
    elseif Config.Phone == 'lb' then
        local convertSender = tostring(sender)
        number = exports["lb-phone"]:GetEquippedPhoneNumber(source)
        exports["lb-phone"]:SendMessage(convertSender, number, data.content, nil, cb, nil)
    elseif Config.Phone == 'qb-phone' then
        local citizenId = GetPlayerIdentifier(source)
        local message = {sender = data.sender, subject = data.subject, message = data.content}
        exports['qb-phone']:sendNewMailToOffline(citizenId, message)
    elseif Config.Phone == 'quasar' then
        local playerIdentifier = GetPlayerIdentifier(source)
        local message = {sender = data.sender, subject = data.subject, message = data.content}
        TriggerEvent('qs-smartphone:server:sendNewMailToOffline', playerIdentifier, message)
    elseif Config.Phone == 'yphone' then
        local playerIdentifier = GetPlayerIdentifier(source)
        number = exports["yflip-phone"]:GetPhoneNumberByIdentifier(playerIdentifier)
        exports["yflip-phone"]:SendMail({
            title = data.title,
            sender = data.sender,
            senderDisplayName = data.name,
            content = data.content,
        }, 'phoneNumber', number)
    else
        -- Configure 'custom' phone option here
    end
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