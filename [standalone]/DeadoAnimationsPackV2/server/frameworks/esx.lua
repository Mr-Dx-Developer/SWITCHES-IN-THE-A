if Config.Framework ~= 'es_extended' then return end

local framework = 'es_extended'
local state = GetResourceState(framework)
if state == 'missing' or state == "unknown" then
    -- Framework can't be used if it's missing or unknown
    return
end


-- https://github.com/qbcore-framework/dpemotes/blob/master/Server/Server.lua#L101-L141
RegisterCommand('e', function(source, args)
    TriggerClientEvent('animations:client:PlayEmote', source, args)
end)

RegisterCommand('emote', function(source, args)
    TriggerClientEvent('animations:client:PlayEmote', source, args)
end)

if Config.SqlKeybinding then
    RegisterCommand('emotebind', function(source, args)
		TriggerClientEvent('animations:client:BindEmote', source, args)
    end)

    RegisterCommand('emotebinds', function(source)
        TriggerClientEvent('animations:client:EmoteBinds', source)
    end)
end

RegisterCommand('emotemenu', function(source)
	TriggerClientEvent('animations:client:EmoteMenu', source)
end)

RegisterCommand('em', function(source)
    TriggerClientEvent('animations:client:EmoteMenu', source)
end)

RegisterCommand('emotes', function(source)
	TriggerClientEvent('animations:client:ListEmotes', source)
end)

RegisterCommand('walk', function(source, args)
	TriggerClientEvent('animations:client:Walk', source, args)
end)

RegisterCommand('walks', function(source)
    TriggerClientEvent('animations:client:ListWalks', source)
end)

RegisterCommand('nearby', function(source, args)
	TriggerClientEvent('animations:client:Nearby', source, args)
end)

























































































---------------------- 1061145395469754399