ESX = nil

if Config.ESX then
	if not Config.UsingNewExportTriggerEvent then
		TriggerEvent(Config.TriggerEventESX, function(obj) ESX = obj end)
	else
		ESX = exports['es_extended']:getSharedObject()
	end
end

RegisterServerEvent('SleepOrSex:server:diseasetogether') -- dont touch
AddEventHandler('SleepOrSex:server:diseasetogether', function(target, chancesexdisease, hivchance, hepatitischance)
	DebugMode('Target: ' .. target .. 'Chance Disease: ' .. chancesexdisease .. 'HIV Chance: ' .. hivchance .. 'Hepatitis Chance: ' .. hepatitischance)
	local source = source
	TriggerClientEvent('SleepOrSex:client:diseasetarget', target, chancesexdisease, hivchance, hepatitischance)
	TriggerClientEvent('SleepOrSex:client:diseasesource', source, chancesexdisease, hivchance, hepatitischance)
end)

RegisterServerEvent('SleepOrSex:server:diseaseinfecttogether') -- dont touch
AddEventHandler('SleepOrSex:server:diseaseinfecttogether', function(target, diseasesex)
	DebugMode('Target: ' .. target .. 'Disease: ' .. diseasesex)
	local source = source
	TriggerClientEvent('SleepOrSex:client:diseaseinfecttarget', target, diseasesex)
	TriggerClientEvent('SleepOrSex:client:diseaseinfectsource', source, diseasesex)
end)

RegisterCommand('diseaseremove', function(source, args, raw)
	if args[1] and tonumber(args[1]) then
		local xPlayer = ESX.GetPlayerFromId(args[1])
		if xPlayer and xPlayer.identifier then
			if havePermission(xPlayer) then
				TriggerClientEvent('SleepOrSex:client:diseaseinfecttarget', args[1], 'cured')
				--MySQL.Async.execute('UPDATE users SET diseasesex = @diseasesex WHERE identifier = @identifier',
				--{
				--	['@diseasesex'] = 'cured',
				--	['@identifier'] = xPlayer.identifier
				--})

				-- Some notification here for cured
			else
				-- Some notification if not admin
			end
		end
	else
		-- Some notification here if not pass args number
	end
end)

function havePermission(xPlayer, exclude)	-- you can exclude rank(s) from having permission to specific commands 	[exclude only take tables]
	if exclude and type(exclude) ~= 'table' then exclude = nil;print('^3[SleepOrSex] ^1ERROR ^0exclude argument is not table..^0') end	-- will prevent from errors if you pass wrong argument

	local PlayerGroup = xPlayer.getGroup()
	for k,v in pairs(Config.AdminRanks) do
		if v == PlayerGroup then
			if not exclude then
				return true
			else
				for a,b in pairs(exclude) do
					if b == v then
						return false
					end
				end
				return true
			end
		end
	end
	return false
end

ESX.RegisterUsableItem('hiv_cured', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local hiv_cured = xPlayer.getInventoryItem('hiv_cured').count
	if hiv_cured > 0 then
		xPlayer.removeInventoryItem('hiv_cured', 1)
		TriggerClientEvent('SleepOrSex:hiv_cured', source)
	end
end)

ESX.RegisterUsableItem('hepatitis_cured', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local hepatitis_cured = xPlayer.getInventoryItem('hepatitis_cured').count
	if hepatitis_cured > 0 then
		xPlayer.removeInventoryItem('hepatitis_cured', 1)
		TriggerClientEvent('SleepOrSex:hepatitis_cured', source)
	end
end)

ESX.RegisterUsableItem('gonore_cured', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local gonore_cured = xPlayer.getInventoryItem('gonore_cured').count
	if gonore_cured > 0 then
		xPlayer.removeInventoryItem('gonore_cured', 1)
		TriggerClientEvent('SleepOrSex:gonore_cured', source)
	end
end)

ESX.RegisterUsableItem('klamidia_cured', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	local klamidia_cured = xPlayer.getInventoryItem('klamidia_cured').count
	if klamidia_cured > 0 then
		xPlayer.removeInventoryItem('klamidia_cured', 1)
		TriggerClientEvent('SleepOrSex:klamidia_cured', source)
	end
end)