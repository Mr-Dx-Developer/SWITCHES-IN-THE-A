QBCore = nil

if Config.QBCore then
	QBCore = exports[Config.TriggerEventQBCore]:GetCoreObject()
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
		local xPlayer = QBCore.Functions.GetPlayer(args[1])
		if xPlayer and xPlayer.PlayerData.citizenid then
			if havePermission(xPlayer) then
				TriggerClientEvent('SleepOrSex:client:diseaseinfecttarget', args[1], 'cured')
				--MySQL.Async.execute('UPDATE players SET diseasesex = @diseasesex WHERE citizenid = @citizenid',
				--{
				--	['@diseasesex'] = 'cured',
				--	['@citizenid'] = xPlayer.PlayerData.citizenid
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

-- i;m not pretty sure if this correct for qbcore
function havePermission(xPlayer, exclude)	-- you can exclude rank(s) from having permission to specific commands 	[exclude only take tables]
	if exclude and type(exclude) ~= 'table' then exclude = nil;print('^3[SleepOrSex] ^1ERROR ^0exclude argument is not table..^0') end	-- will prevent from errors if you pass wrong argument

	local PlayerGroup = xPlayer.Functions.GetPermission()
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

QBCore.Functions.CreateUseableItem('hiv_cured', function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local hiv_cured = xPlayer.Functions.GetItemByName('hiv_cured')
	if hiv_cured ~= nil then
		xPlayer.Functions.RemoveItem('hiv_cured', 1)
		TriggerClientEvent('SleepOrSex:hiv_cured', source)
	end
end)

QBCore.Functions.CreateUseableItem('hepatitis_cured', function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local hepatitis_cured = xPlayer.Functions.GetItemByName('hepatitis_cured')
	if hepatitis_cured ~= nil then
		xPlayer.Functions.RemoveItem('hepatitis_cured', 1)
		TriggerClientEvent('SleepOrSex:hepatitis_cured', source)
	end
end)

QBCore.Functions.CreateUseableItem('gonore_cured', function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local gonore_cured = xPlayer.Functions.GetItemByName('gonore_cured')
	if gonore_cured ~= nil then
		xPlayer.Functions.RemoveItem('gonore_cured', 1)
		TriggerClientEvent('SleepOrSex:gonore_cured', source)
	end
end)

QBCore.Functions.CreateUseableItem('klamidia_cured', function(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local klamidia_cured = xPlayer.Functions.GetItemByName('klamidia_cured')
	if klamidia_cured ~= nil then
		xPlayer.Functions.RemoveItem('klamidia_cured', 1)
		TriggerClientEvent('SleepOrSex:klamidia_cured', source)
	end
end)