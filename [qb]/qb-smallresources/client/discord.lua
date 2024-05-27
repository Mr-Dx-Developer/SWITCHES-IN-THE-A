local QBCore = exports['qb-core']:GetCoreObject()

--[[ CreateThread(function()
    while Config.Discord.isEnabled do
        SetDiscordAppId(Config.Discord.applicationId)
        SetDiscordRichPresenceAsset(Config.Discord.iconLarge)
        SetDiscordRichPresenceAssetText(Config.Discord.iconLargeHoverText)
        SetDiscordRichPresenceAssetSmall(Config.Discord.iconSmall)
        SetDiscordRichPresenceAssetSmallText(Config.Discord.iconSmallHoverText)

        if Config.Discord.showPlayerCount then
            QBCore.Functions.TriggerCallback('smallresources:server:GetCurrentPlayers', function(result)
                SetRichPresence('Players: ' .. result .. '/' .. Config.Discord.maxPlayers)
            end)
        end

        if Config.Discord.buttons and type(Config.Discord.buttons) == "table" then
            for i, v in pairs(Config.Discord.buttons) do
                SetDiscordRichPresenceAction(i - 1, v.text, v.url)
            end
        end

        Wait(Config.Discord.updateRate)
    end
end)
 ]]



local appid = '1221275994808127539' 
local image1 = 'logo'
local image2 = 'logo'
local prevtime = GetGameTimer()
local prevframes = GetFrameCount()
local fps = -1
local disocrd = 'https://discord.gg/switchesinthea'
local fivem = "fivem://connect/cfx.re/join/4v33yo"

function location()
    local coords = GetEntityCoords(PlayerPedId())
    local location = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
    return 'Location: ' .. location
end

function SetRP()
    SetDiscordAppId(appid)
    SetDiscordRichPresenceAsset(image1)
    SetDiscordRichPresenceAssetSmall(image2)
    SetDiscordRichPresenceAssetText('discord.gg/switchesinthea')
end

CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do         
        Wait(500)
    end

    while true do         
        local curtime = GetGameTimer()
        local curframes = GetFrameCount()       

        if (curtime - prevtime) > 1000 then
            fps = curframes - prevframes
            prevtime = curtime
            prevframes = curframes
        end

        Wait(350)
    end    
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Adjust the wait time to update the rich presence less frequently
        
        SetRP()

        SetRichPresence("FPS: " .. fps .. "\n" .. GetPlayerName(PlayerId()) .. " | ID: " .. GetPlayerServerId(PlayerId()) .. " | " .. location())

        SetDiscordRichPresenceAction(0, "Discord!", disocrd)
        SetDiscordRichPresenceAction(1, "FiveM!", fivem)
    end
end)