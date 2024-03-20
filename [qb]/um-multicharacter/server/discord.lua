if not Slots.DiscordPerm.status then return end

local discordConfig = {
    guild_id = '',
    bot_token = '',
}

-- @see error_codes_defined from here: https://github.com/JaredScar/Badger_Discord_API/blob/main/server.lua#L3
local error_codes_defined = {
	[200] = 'OK - The request was completed successfully..!',
	[204] = 'OK - No Content',
	[400] = "^1[Discord Request Error] - The request was improperly formatted, or the server couldn't understand it..!",
	[401] = '^1[Discord Request Error] - The Authorization header was missing or invalid..! Your Discord Token is probably wrong or does not have correct permissions attributed to it.',
	[403] = '^1[Discord Request Error] - The Authorization token you passed did not have permission to the resource..! Your Discord Token is probably wrong or does not have correct permissions attributed to it.',
	[404] = '^1[Discord Request Error] - The resource at the location specified doesn\'t exist.',
	[429] = '^1[Discord Request Error] - Too many requests, you hit the Discord rate limit. https://discord.com/developers/docs/topics/rate-limits',
	[502] = '^1[Discord Request Error] - Discord API may be down?...'
}

local function getDiscordID(src)
    local discordID = GetPlayerIdentifierByType(src, 'discord') or 'undefined'
        if discordID:find('discord'..':') then
            discordID = discordID:gsub('discord'..':', '')
        end
    return discordID
end

function ReqDiscord(src)
    local discord = getDiscordID(src)
    local responseData = nil
    local totalSlots = nil
    if discord == 'undefined' then
        print('^1Discord ID not found')
        return Config.DefaultSlots
    end
    PerformHttpRequest(('https://discord.com/api/v8/guilds/%s/members/%s'):format(discordConfig.guild_id, discord), function(err, data, headers)
        if err ~= 200 then
            print(error_codes_defined[err])
            totalSlots = Config.DefaultSlots
            return
        end
        if data then
            responseData = json.decode(data)
            local roles = responseData.roles or {}

            for _, role in pairs(roles) do
                for _, slotRole in pairs(Slots.DiscordPerm.role) do
                    if tostring(role) == tostring(slotRole.id) then
                       totalSlots = Config.DefaultSlots + slotRole.addExtraSlot
                       return
                    end
                end
            end

            totalSlots = Config.DefaultSlots
        end

    end, 'GET', '', {
        ['Content-Type'] = 'application/json',
        ['Authorization'] = ('Bot %s'):format(discordConfig.bot_token)
    })

    while totalSlots == nil do
        Debug('Waiting for Discord API Response', 'warn')
        Wait(0)
    end

    return totalSlots
end