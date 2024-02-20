if Config.Framework ~= 'es_extended' then return end

local framework = 'es_extended'
local state = GetResourceState(framework)

if state == 'missing' or state == "unknown" then
    -- Framework can't be used if it's missing or unknown
    return
end

ESX, PlayerData, isLoggedIn = nil, {}, false
isDead = false
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end

    while ESX.GetPlayerData().job == nil do
        Wait(1000)
    end
    PlayerData = ESX.GetPlayerData()
    isLoggedIn = true
end)

RegisterNetEvent("esx:onPlayerDeath", function()
    isDead = true
end)

RegisterNetEvent("esx_ambulancejob:revive", function()
    isDead = false
end)

function CanUseFavKeyBind()
    return not isDead
end

-- Added events
RegisterNetEvent('animations:client:PlayEmote', function(args)
    if not isDead then
        EmoteCommandStart(source, args)
    end
end)

if Config.SqlKeybinding then
    RegisterNetEvent('animations:client:BindEmote', function(args)
        if not isDead then
            EmoteBindStart(source, args)
        end
    end)

    RegisterNetEvent('animations:client:EmoteBinds', function()
        if not isDead then
            EmoteBindsStart()
        end
    end)
end

RegisterNetEvent('animations:client:EmoteMenu', function()
    if not isDead then
        OpenEmoteMenu()
    end
end)

RegisterNetEvent('animations:client:ListEmotes', function()
    if not isDead then
        EmotesOnCommand()
    end
end)

RegisterNetEvent('animations:client:Walk', function(args)
    if not isDead then
        WalkCommandStart(source, args)
    end
end)

RegisterNetEvent('animations:client:ListWalks', function()
    if not isDead then
        WalksOnCommand()
    end
end)

CanDoEmote = true
RegisterNetEvent('animations:ToggleCanDoAnims', function(bool)
    CanDoEmote = bool
end)

RegisterNetEvent('animations:client:EmoteCommandStart', function(args)
    if CanDoEmote then
        EmoteCommandStart(source, args)
    end
end)
