-- identifier = your player identifier (steam, license...)
-- ped = the child model

whitelisted = {
    {identifier = 'discord:1031391950898729041', ped = 'Baby_12'},
    {identifier = 'discord:1031391950898729041', ped = 'Baby_1'},
    {identifier = 'license:811436286006657025', ped = 'Baby_1'},
    {identifier = 'discord:811436286006657025', ped = 'Baby_12'}
}

function getBabyPed(player)
    local ped = nil
    for i,id in ipairs(whitelisted) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if string.lower(pid) == string.lower(id.identifier) then
                ped = id.ped
            end
        end
    end
    return ped
end

RegisterCommand(Config.SpawnCommand, function(source,args)
	local model = getBabyPed(source)	
	if model ~= nil then
		TriggerClientEvent('av_baby:spawn',source,model)
	else
		TriggerClientEvent('av_baby:notification',source,Config.Lang['not_whitelisted'])
	end
end)