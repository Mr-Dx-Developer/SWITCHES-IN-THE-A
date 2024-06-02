if Config.framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()
else
    QBCore = exports['qb-core']:GetCoreObject()
end

local playersList = {}
local AdminPlayers = {}
local chat = {}
local admins = {}

local messageID = 0
local isMale = false

local discordToken = "Bot " .. Settings["botToken"]

-- Functions
function getPlayers()
	if Config.framework == "esx" then
		playersList = {}
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			local src = xPlayer.source
			local name = getName(xPlayer.identifier)
			playersList[tostring(src)] = {name = name, image = getDiscordInfo(src).image}
		end
	else
		playersList = {}
		local xPlayers = QBCore.Functions.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = QBCore.Functions.GetPlayer(xPlayers[i])
			local src = xPlayer.PlayerData.source
			local name = xPlayer.PlayerData.charinfo["firstname"].." "..xPlayer.PlayerData.charinfo["lastname"]
			playersList[tostring(src)] = {name = name, image = getDiscordInfo(src).image}
		end
	end
end

function getInfo(source)
	if Config.framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(source)
		for k,v in pairs(Config.Admins) do
			if v.identifier == xPlayer.identifier then
				return v
			end
		end
		return "None"
	else
		local xPlayer = QBCore.Functions.GetPlayer(source)
		for k,v in pairs(Config.Admins) do
			if v.identifier == xPlayer.PlayerData.citizenid then
				return v
			end
		end
		return "None"
	end
end

function getAdminRank(id)
	local info = getInfo(id)
	
	if info then
		if info.rank then
			return info.rank
		else
			return getMessage('player')
		end
	end

end

function getName(identifier)
	local Info = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {["@identifier"] = identifier})
	return Info[1].firstname.." "..Info[1].lastname
end

function getJobLabel(job)
    local Info = MySQL.Sync.fetchAll("SELECT * FROM jobs WHERE name = @name", {["@name"] = job})
    return Info[1].label
end

function getGrade(grade, job)
    local Info = MySQL.Sync.fetchAll("SELECT * FROM job_grades WHERE job_name = @job_name", {["@job_name"] = job})

    for k,v in pairs(Info) do
        if Info[k].grade == grade then
            return Info[k].label
        end        
    end
end

function fixGender(sex)
	if sex == 0 or sex == "m" then
		isMale = true
		return "Male"
	else
		return "Female"
	end
end

function getDiscord(id)
	for i = 0, GetNumPlayerIdentifiers(id) - 1 do
		local id = GetPlayerIdentifier(id, i)
		if string.find(id, "discord") then
			return string.gsub(id, "discord:", "")
		end
	end
end

function getDiscordInfo(id)
	local discordId = getDiscord(id)
	if discordId then
		local endpoint = ("users/%s"):format(discordId)
		local member = DiscordRequest("GET", endpoint, {})
		local data = json.decode(member.data)
		local lastData = {
			nick = data.username.."#"..data.discriminator,
			image = "https://cdn.discordapp.com/avatars/"..discordId.."/"..data.avatar.."",
			id = data.id
		}
		return lastData
	else
		local lastData = {
			nick = getMessage('notFound'),
			image = "images/avatarImg.png",
			id = nil
		}
		return lastData
	end
end

function DiscordRequest(method, endpoint, jsondata, reason)
    local data = nil
    PerformHttpRequest("https://discordapp.com/api/"..endpoint, function(errorCode, resultData, resultHeaders)
		data = {data=resultData, code=errorCode, headers=resultHeaders}
    end, method, #jsondata > 0 and jsondata or "", {["Content-Type"] = "application/json", ["Authorization"] = discordToken, ['X-Audit-Log-Reason'] = reason})

    while data == nil do
        Citizen.Wait(0)
    end
	
    return data
end

function loadAdmin(source, identifier, name, image, rank)
	if not admins[identifier] then
		admins[identifier] = {
			name = name,
			image = image,
			rank = rank,
			identifier = identifier
		}
	end
end

-- CallBacks
if Config.framework == "esx" then
	ESX.RegisterServerCallback('team5m-admin:getPersonal', function(source, cb)
		local xPlayer = ESX.GetPlayerFromId(source)
		local job = xPlayer.getJob()
		local Info = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier})
		cb({
			name = Info[1].firstname.." "..Info[1].lastname,
			gender = fixGender(Info[1].sex),
			isMale = isMale,
			birth = Info[1].dateofbirth,
			job = getJobLabel(job.name),
			grade = getGrade(Info[1].job_grade, job.name),
			money = xPlayer.getMoney(),
			image = getDiscordInfo(source).image,
			id = source
		})
		loadAdmin(source, xPlayer.identifier, Info[1].firstname.." "..Info[1].lastname, getDiscordInfo(source).image, getAdminRank(source))
	end)

	ESX.RegisterServerCallback('team5m-admin:getIdentifier', function(source, cb)
		local xPlayer = ESX.GetPlayerFromId(source)
		cb(xPlayer.identifier)
	end)

	ESX.RegisterServerCallback('team5m-admin:getIdentifier', function(source, cb)
		local xPlayer = ESX.GetPlayerFromId(source)
		cb(xPlayer.identifier)
	end)

	ESX.RegisterServerCallback('team5m-admin:getPlayerInfo', function(source, cb, id)
		local src = id
		local xPlayer = ESX.GetPlayerFromId(src)
		local job = xPlayer.getJob()
		local Info = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier})
		cb({
			name = Info[1].firstname.." "..Info[1].lastname,
			gender = fixGender(Info[1].sex),
			isMale = isMale,
			birth = Info[1].dateofbirth,
			job = getJobLabel(job.name),
			grade = getGrade(Info[1].job_grade, job.name),
			money = xPlayer.getMoney(),
			image = getDiscordInfo(src).image,
			warns = Info[1].warns,
			nick = getDiscordInfo(src).nick,
			discord = getDiscordInfo(src).id,
			admin = getAdminRank(src),
			id = src,
			ping = GetPlayerPing(src)
		})
	end)

	ESX.RegisterServerCallback('team5m-admin:getPlayers', function(source, cb)
		getPlayers()
		cb(playersList)
	end)

	ESX.RegisterServerCallback('team5m-admin:getChat', function(source, cb)
		local xPlayer = ESX.GetPlayerFromId(source)
		cb({
			identifier = xPlayer.identifier,
			chat = chat
		})
	end)
else
	QBCore.Functions.CreateCallback('team5m-admin:getPersonal', function(source, cb)
		local xPlayer = QBCore.Functions.GetPlayer(source)
		cb({
			name = xPlayer.PlayerData.charinfo["firstname"].." "..xPlayer.PlayerData.charinfo["lastname"],
			gender = fixGender(xPlayer.PlayerData.charinfo.gender),
			isMale = isMale,
			birth = "",
			job = xPlayer.PlayerData.job["label"],
			grade = xPlayer.PlayerData.job["grade"]["name"],
			money = xPlayer.PlayerData.money["cash"],
			image = getDiscordInfo(source).image,
			id = source
		})
		loadAdmin(source, xPlayer.PlayerData.citizenid, xPlayer.PlayerData.charinfo["firstname"].." "..xPlayer.PlayerData.charinfo["lastname"], getDiscordInfo(source).image, getAdminRank(source))
	end)
	
	QBCore.Functions.CreateCallback('team5m-admin:getIdentifier', function(source, cb)
		local xPlayer = QBCore.Functions.GetPlayer(source)
		cb(xPlayer.PlayerData.citizenid)
	end)
	
	QBCore.Functions.CreateCallback('team5m-admin:getPlayerInfo', function(source, cb, id)
		local src = tonumber(id)
		local xPlayer = QBCore.Functions.GetPlayer(src)
		local Info = MySQL.Sync.fetchAll("SELECT warns FROM players WHERE citizenid = @citizenid", {["@citizenid"] = xPlayer.PlayerData.citizenid})
		cb({
			name = xPlayer.PlayerData.charinfo["firstname"].." "..xPlayer.PlayerData.charinfo["lastname"],
			gender = fixGender(xPlayer.PlayerData.charinfo.gender),
			isMale = isMale,
			birth = "",
			job = xPlayer.PlayerData.job["label"],
			grade = xPlayer.PlayerData.job["grade"]["name"],
			money = xPlayer.PlayerData.money["cash"],
			image = getDiscordInfo(src).image,
			warns = Info[1].warns,
			nick = getDiscordInfo(src).nick,
			discord = getDiscordInfo(src).id,
			admin = getAdminRank(src),
			id = src,
			ping = GetPlayerPing(src)
		})
	end)
	
	QBCore.Functions.CreateCallback('team5m-admin:getPlayers', function(source, cb)
		getPlayers()
		cb(playersList)
	end)
	
	QBCore.Functions.CreateCallback('team5m-admin:getChat', function(source, cb)
		local xPlayer = QBCore.Functions.GetPlayer(source)
		cb({
			identifier = xPlayer.PlayerData.citizenid,
			chat = chat
		})
	end)
end


-- Events
RegisterNetEvent('team5m-admin:sendMessage')
AddEventHandler('team5m-admin:sendMessage', function (message)
	if Config.framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(source)
		if admins[xPlayer.identifier].name then
			local info = admins[xPlayer.identifier]
			messageID = messageID+1
			chat[messageID] = {
				name = info.name,
				rank = info.rank,
				image = info.image,
				identifier = xPlayer.identifier,
				messageID = messageID,
				message = message
			}
			TriggerClientEvent('team5m-admin:sendMessage', -1, chat[messageID])
		end
	else
		local xPlayer = QBCore.Functions.GetPlayer(source)
		if admins[xPlayer.PlayerData.citizenid].name then
			local info = admins[xPlayer.PlayerData.citizenid]
			messageID = messageID+1
			chat[messageID] = {
				name = info.name,
				rank = info.rank,
				image = info.image,
				identifier = xPlayer.PlayerData.citizenid,
				messageID = messageID,
				message = message
			}
			TriggerClientEvent('team5m-admin:sendMessage', -1, chat[messageID])
		end
	end
end)

RegisterServerEvent('team5m-admin:ban')
AddEventHandler('team5m-admin:ban', function(target, reason)
    local src = source
	local license, identifier, liveid, xblid, discord, playerip = nil, nil, nil, nil, nil, nil
	for k, v in ipairs(GetPlayerIdentifiers(target))do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
		elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
			identifier = v
		elseif string.sub(v, 1, string.len("live:")) == "live:" then
			liveid = v
		elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
			xblid  = v
		elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v
		elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
			playerip = v
		end
	end
	MySQL.Async.execute('INSERT INTO team5m_banlist (name, admin, steam, rockstar, xbox, live, discord, ip, reason) VALUES (@name, @admin, @steam, @rockstar, @xbox, @live, @discord, @ip, @reason)',
	{ ['@name'] = GetPlayerName(target), ['@admin'] = GetPlayerName(src), ['@steam'] = identifier, ['@rockstar'] = license, ['@xbox'] = xblid, ['@live'] = liveid, ['@discord'] = discord, ['@ip'] = playerip, ['@reason'] = reason})
	
	DropPlayer(target, getMessage('banned').." "..reason)
end)

AddEventHandler('playerConnecting', function(name, setCallback, deferrals) 
    local src = source
    local license, identifier, liveid, xblid, discord, playerip = nil, nil, nil, nil, nil, nil
	for k,v in ipairs(GetPlayerIdentifiers(src))do
        if string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
            identifier = v
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xblid  = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            playerip = v
        end
    end

	deferrals.defer()
    deferrals.update(getMessage('banCheck'))

    MySQL.Async.fetchAll('SELECT * FROM team5m_banlist WHERE steam = @steam OR rockstar = @rockstar OR xbox = @xbox OR live = @live OR discord = @discord OR ip = @ip', {
        ['@steam'] = identifier,
        ['@rockstar'] = license,
        ['@xbox'] = xblid,
        ['@live'] = liveid,
        ['@discord'] = discord,
        ['@ip'] = playerip    
    }, function(results)
        if results[1] ~= nil or #results > 0 then
            for k = 1, #results, 1 do
                deferrals.done(getMessage('bannedText')..'\n'..getMessage('banReason')..' '..results[k].reason)
                return
            end
        else
            deferrals.done()
        end
    end)
end)

RegisterNetEvent('team5m-admin:kick')
AddEventHandler('team5m-admin:kick', function (id, reason)
	if Config.framework == "esx" then
		local src = tonumber(id)
		local zPlayer = ESX.GetPlayerFromId(src)

		zPlayer.kick(GetPlayerName(source)..": "..reason)
	else
		local src = tonumber(id)
		local zPlayer = QBCore.Functions.GetPlayer(src)
	
		DropPlayer(src, GetPlayerName(source)..": "..reason)
	end
end)

RegisterNetEvent('team5m-admin:addVehicle')
AddEventHandler('team5m-admin:addVehicle', function (vehData)
	if Config.framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(source)
		MySQL.Async.fetchAll("INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)", { 
			["@owner"] = xPlayer.identifier,
			["@plate"] = vehData.plate,
			["@vehicle"] = json.encode(vehData)
		}, function(a)
		end)
	else
		local xPlayer = QBCore.Functions.GetPlayer(source)
		MySQL.Async.fetchAll("INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (@license, @citizenid, @vehicle, @hash, @mods, @plate, @garage, @state)", { 
			["@license"] = xPlayer.PlayerData.license,
			["@citizenid"] = xPlayer.PlayerData.citizenid,
			["@vehicle"] = vehData["model"],
			["@hash"] = GetHashKey(vehData["model"]),
			["@mods"] = "{}",
			["@plate"] = vehData["plate"],
			["@garage"] = "pillboxgarage",
			["@state"] = 0
		}, function(a)
		end)
	end
end)

RegisterNetEvent('team5m-admin:deleteVehicle')
AddEventHandler('team5m-admin:deleteVehicle', function (plate)
	MySQL.update('DELETE FROM owned_vehicles WHERE plate = ?', {plate})
end)

RegisterNetEvent('team5m-admin:changeJob')
AddEventHandler('team5m-admin:changeJob', function (name, grade)
	if Config.framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(source)

		xPlayer.setJob(name, tonumber(grade))
	else
		local xPlayer = QBCore.Functions.GetPlayer(source)

		xPlayer.Functions.SetJob(name, tonumber(grade))
	end
end)

RegisterNetEvent('team5m-admin:giveWeaponPlayer')
AddEventHandler('team5m-admin:giveWeaponPlayer', function (id, weapon)
	if Config.framework == "esx" then
		local src = tonumber(id)
		local zPlayer = ESX.GetPlayerFromId(src)

		if Config.weaponWithItem then
			zPlayer.addInventoryItem(weapon, 1)
		else
			zPlayer.addWeapon(weapon, 1)
		end

		TriggerClientEvent('team5m-admin:giveWeaponPlayer', src, weapon)
	else
		local src = tonumber(id)
		local zPlayer = QBCore.Functions.GetPlayer(src)
	
		zPlayer.Functions.AddItem(weapon, 1)
		TriggerClientEvent('team5m-admin:giveWeaponPlayer', src, weapon)
	end
end)

RegisterNetEvent('team5m-admin:deleteWeaponPlayer')
AddEventHandler('team5m-admin:deleteWeaponPlayer', function (id, weapon)
	if Config.framework == "esx" then
		local src = tonumber(id)
		local zPlayer = ESX.GetPlayerFromId(src)

		if Config.weaponWithItem then
			zPlayer.removeInventoryItem(weapon, 1)
		else
			zPlayer.removeWeapon(weapon)
		end

		TriggerClientEvent('team5m-admin:deleteWeaponPlayer', src, weapon)
	else
		local src = tonumber(id)
		local zPlayer = QBCore.Functions.GetPlayer(src)
	
		zPlayer.Functions.RemoveItem(weapon, 1)
		TriggerClientEvent('team5m-admin:deleteWeaponPlayer', src, weapon)
	end
end)

RegisterNetEvent('team5m-admin:spawnWeapon')
AddEventHandler('team5m-admin:spawnWeapon', function (weapon)
	if Config.framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(source)

		if Config.weaponWithItem then
			xPlayer.addInventoryItem(weapon, 1)
		else
			xPlayer.addWeapon(weapon, 1)
		end
	else
		local xPlayer = QBCore.Functions.GetPlayer(source)

		xPlayer.Functions.AddItem(weapon, 1)
	end
end)

RegisterNetEvent('team5m-admin:getScreenShot')
AddEventHandler('team5m-admin:getScreenShot', function (id)
	TriggerClientEvent('team5m-admin:getScreenShot', tonumber(id), source, Settings["screenShotWebhook"])
end)

RegisterNetEvent('team5m-admin:sendScreenShot')
AddEventHandler('team5m-admin:sendScreenShot', function (id, image)
	TriggerClientEvent('team5m-admin:sendScreenShot', tonumber(id), image)
end)

RegisterNetEvent('team5m-admin:reviveAll')
AddEventHandler('team5m-admin:reviveAll', function ()
	TriggerClientEvent(Config.reviveTrigger, -1)
end)

RegisterNetEvent('team5m-admin:clearObjects')
AddEventHandler('team5m-admin:clearObjects', function ()
	TriggerClientEvent('team5m-admin:clearObjects', -1)
end)

RegisterNetEvent('team5m-admin:clearPeds')
AddEventHandler('team5m-admin:clearPeds', function ()
	TriggerClientEvent('team5m-admin:clearPeds', -1)
end)

RegisterNetEvent('team5m-admin:announcement')
AddEventHandler('team5m-admin:announcement', function (text, delay)
	TriggerClientEvent('team5m-admin:announcement', -1, text, delay)
end)

RegisterNetEvent('team5m-admin:allKick')
AddEventHandler('team5m-admin:allKick', function (reason)
	if Config.framework == "esx" then
		local name = GetPlayerName(source)
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.source ~= source then
				xPlayer.kick(name..": "..reason)
			end
		end
	else
		local name = GetPlayerName(source)
		local xPlayers = QBCore.Functions.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = QBCore.Functions.GetPlayer(xPlayers[i])
			if xPlayer.PlayerData.source ~= source then
				xPlayer.Functions.Kick(name..": "..reason)
			end
		end
	end
end)

RegisterNetEvent('team5m-admin:addTag')
AddEventHandler('team5m-admin:addTag', function (value)	
	if value then
		local info = getInfo(source)
		AdminPlayers[source] = { source = source, info = info }
	else
		AdminPlayers[source] = nil
		TriggerClientEvent('team5m-admin:removeTag', -1, source)
	end
	TriggerClientEvent('team5m-admin:updateTags', -1, AdminPlayers)	
end)

RegisterNetEvent('team5m-admin:deleteVehicles')
AddEventHandler('team5m-admin:deleteVehicles', function ()
	if Config.framework == "esx" then
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			local Vehicles = ESX.OneSync.GetVehiclesInArea(GetEntityCoords(GetPlayerPed(xPlayer.source)), tonumber(500) or 5.0)
			for i=1, #Vehicles do 
				local Vehicle = NetworkGetEntityFromNetworkId(Vehicles[i])
				if DoesEntityExist(Vehicle) then
					DeleteEntity(Vehicle)
				end
			end  
		end
	else
		TriggerClientEvent('team5m-admin:deleteVehicles', -1)
	end
end)

RegisterNetEvent('team5m-admin:revive')
AddEventHandler('team5m-admin:revive', function (id)
	TriggerClientEvent(Config.reviveTrigger, id)
end)

RegisterNetEvent('team5m-admin:heal')
AddEventHandler('team5m-admin:heal', function (id)
	TriggerClientEvent("team5m-admin:heal", id)
end)

RegisterNetEvent('team5m-admin:freeze')
AddEventHandler('team5m-admin:freeze', function (id)
	TriggerClientEvent("team5m-admin:freeze", id)
end)

RegisterNetEvent('team5m-admin:giveArmor')
AddEventHandler('team5m-admin:giveArmor', function (id)
	TriggerClientEvent("team5m-admin:giveArmor", id)
end)

RegisterNetEvent('team5m-admin:giveBankMoney')
AddEventHandler('team5m-admin:giveBankMoney', function (id, money)
	if Config.framework == "esx" then
		local src = tonumber(id)
		local zPlayer = ESX.GetPlayerFromId(src)

		zPlayer.addAccountMoney('bank', tonumber(money))
		TriggerClientEvent("team5m-admin:giveBankMoney", src, "$"..money)
	else
		local src = tonumber(id)
		local zPlayer = QBCore.Functions.GetPlayer(src)
	
		zPlayer.Functions.AddMoney('bank', tonumber(money), "Bank depost")
		TriggerClientEvent("team5m-admin:giveBankMoney", src, "$"..money)
	end
end)

RegisterNetEvent('team5m-admin:giveBlackMoney')
AddEventHandler('team5m-admin:giveBlackMoney', function (id, money)
	if Config.framework == "esx" then
		local src = tonumber(id)
		local zPlayer = ESX.GetPlayerFromId(src)

		zPlayer.addAccountMoney('black_money', tonumber(money))
		TriggerClientEvent("team5m-admin:giveBankMoney", src, "$"..money)
	else
		
	end
end)

RegisterNetEvent('team5m-admin:teleport')
AddEventHandler('team5m-admin:teleport', function (id, money)
	local src = tonumber(id)

	TriggerClientEvent("team5m-admin:getTeleportCoord", src, source)
end)

RegisterNetEvent('team5m-admin:getTeleportCoord')
AddEventHandler('team5m-admin:getTeleportCoord', function (coords, id)
	TriggerClientEvent("team5m-admin:teleport", tonumber(id), coords)
end)

RegisterNetEvent('team5m-admin:giveItem')
AddEventHandler('team5m-admin:giveItem', function (id, name, amount)
	if Config.framework == "esx" then
		local src = tonumber(id)
		local zPlayer = ESX.GetPlayerFromId(src)
		
		zPlayer.addInventoryItem(name, tonumber(amount))

		TriggerClientEvent("team5m-admin:giveItem", src, name, amount)
	else
		local src = tonumber(id)
		local zPlayer = QBCore.Functions.GetPlayer(src)
		
		zPlayer.Functions.AddItem(name, tonumber(amount))
	
		TriggerClientEvent("team5m-admin:giveItem", src, name, amount)
	end
end)

RegisterNetEvent('team5m-admin:bring')
AddEventHandler('team5m-admin:bring', function (id, coords)
	local src = tonumber(id)
	
	TriggerClientEvent("team5m-admin:bring", src, coords)
end)

RegisterNetEvent('team5m-admin:giveWeapon')
AddEventHandler('team5m-admin:giveWeapon', function (id, name)
	if Config.framework == "esx" then
		local src = tonumber(id)
		local zPlayer = ESX.GetPlayerFromId(src)

		if Config.weaponWithItem then
			zPlayer.addInventoryItem(name, 1)
		else
			zPlayer.addWeapon(name, 1)
		end

		TriggerClientEvent("team5m-admin:giveWeapon", src, name)
	else
		local src = tonumber(id)
		local zPlayer = QBCore.Functions.GetPlayer(src)
	
		zPlayer.Functions.AddItem(name, 1)
	
		TriggerClientEvent("team5m-admin:giveWeapon", src, name)
	end
end)

RegisterNetEvent('team5m-admin:giveWarn')
AddEventHandler('team5m-admin:giveWarn', function (id, reason)
	if Config.framework == "esx" then
		local src = tonumber(id)
		local zPlayer = ESX.GetPlayerFromId(src)
		local Info = MySQL.Sync.fetchAll("SELECT warns FROM users WHERE identifier = @identifier", {["@identifier"] = zPlayer.identifier})
		local warns = tonumber(Info[1].warns)

		MySQL.Async.execute('UPDATE users SET warns = @warns WHERE identifier = @identifier', {
			['@identifier'] = zPlayer.identifier,
			['@warns'] = warns+1
		})

		TriggerClientEvent('team5m-admin:warn', src, reason)
		TriggerClientEvent('team5m-admin:updateWarn', src, warns+1)
	else
		local src = tonumber(id)
		local zPlayer = QBCore.Functions.GetPlayer(src)
		local Info = MySQL.Sync.fetchAll("SELECT warns FROM players WHERE citizenid = @citizenid", {["@citizenid"] = zPlayer.PlayerData.citizenid})
		local warns = tonumber(Info[1].warns)
	
		MySQL.Async.execute('UPDATE players SET warns = @warns WHERE citizenid = @citizenid', {
			['@citizenid'] = zPlayer.PlayerData.citizenid,
			['@warns'] = warns+1
		})
	
		TriggerClientEvent('team5m-admin:warn', src, reason)
		TriggerClientEvent('team5m-admin:updateWarn', src, warns+1)
	end
end)






-- Other
local isOk = false

Citizen.CreateThread(function()
	while not isOk do
		Citizen.Wait(3000)
		if Settings["botToken"] == "" or Settings["screenShotWebhook"] == "" then
			print("Script is not working correctly! please fill in the required information from team5m-admin/settings.lua!")
		else
			isOk = true
		end
	end
end)

-- ticket
local ticketID = 0
local tickets = {}

RegisterNetEvent('team5m-admin:createTicket')
AddEventHandler('team5m-admin:createTicket', function (category, title)
	if Config.framework == "esx" then
		local src = source
		local xPlayer = ESX.GetPlayerFromId(src)
		local Info = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier})
		ticketID = ticketID+1
		tickets[ticketID] = {
			name = Info[1].firstname.." "..Info[1].lastname,
			rank = getMessage('player'),
			category = category,
			image = getDiscordInfo(src).image,
			messageID = 0,
			messages = {},
			identifier = xPlayer.identifier,
			closed = false
		}
		TriggerClientEvent('team5m-admin:updateTickets', -1, tickets)
		addMessage(src, title)
		TriggerClientEvent('team5m-admin:openTicket', src, ticketID)
	else
		local src = source
		local xPlayer = QBCore.Functions.GetPlayer(src)
		ticketID = ticketID+1
		tickets[ticketID] = {
			name = xPlayer.PlayerData.charinfo["firstname"].." "..xPlayer.PlayerData.charinfo["lastname"],
			rank = getMessage('player'),
			category = category,
			image = getDiscordInfo(src).image,
			messageID = 0,
			messages = {},
			identifier = xPlayer.PlayerData.citizenid,
			closed = false
		}
		TriggerClientEvent('team5m-admin:updateTickets', -1, tickets)
		addMessage(src, title)
		TriggerClientEvent('team5m-admin:openTicket', src, ticketID)
	end
end)

function addMessage(src, message)
	if Config.framework == "esx" then
		local xPlayer = ESX.GetPlayerFromId(src)
		local Info = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier})
		local info = tickets[ticketID]
		tickets[ticketID]["messageID"] = info.messageID+1
		
		local info = tickets[ticketID]
		tickets[ticketID]["messages"][info.messageID] = {
			name = Info[1].firstname.." "..Info[1].lastname,
			rank = getAdminRank(src),
			image = getDiscordInfo(src).image,
			identifier = xPlayer.identifier,
			message = message
		}
	else
		local xPlayer = QBCore.Functions.GetPlayer(src)
		local info = tickets[ticketID]
		tickets[ticketID]["messageID"] = info.messageID+1
		
		local info = tickets[ticketID]
		tickets[ticketID]["messages"][info.messageID] = {
			name = xPlayer.PlayerData.charinfo["firstname"].." "..xPlayer.PlayerData.charinfo["lastname"],
			rank = getAdminRank(src),
			image = getDiscordInfo(src).image,
			identifier = xPlayer.PlayerData.citizenid,
			message = message
		}
	end
end

if Config.framework == "esx" then
	ESX.RegisterServerCallback('team5m-admin:getTicket', function(source, cb, id)
		cb(tickets[tonumber(id)]["messages"])
	end)

	ESX.RegisterServerCallback('team5m-admin:getIdentifier', function(source, cb, id)
		local xPlayer = ESX.GetPlayerFromId(source)
		cb(xPlayer.identifier)
	end)
else
	QBCore.Functions.CreateCallback('team5m-admin:getTicket', function(source, cb, id)
		cb(tickets[tonumber(id)]["messages"])
	end)
	
	QBCore.Functions.CreateCallback('team5m-admin:getIdentifier', function(source, cb, id)
		local xPlayer = QBCore.Functions.GetPlayer(source)
		cb(xPlayer.PlayerData.citizenid)
	end)
end

RegisterNetEvent('team5m-admin:updateTickets')
AddEventHandler('team5m-admin:updateTickets', function ()
	TriggerClientEvent('team5m-admin:updateTickets', -1, tickets)
end)

RegisterNetEvent('team5m-admin:sendTicketMessage')
AddEventHandler('team5m-admin:sendTicketMessage', function (message, id)
	addMessage(source, message)
	TriggerClientEvent('team5m-admin:updateTicketMessage', -1, tickets[tonumber(id)]["messages"], id)
end)

RegisterNetEvent('team5m-admin:closeTicket')
AddEventHandler('team5m-admin:closeTicket', function (id)
	tickets[tonumber(id)] = nil
	TriggerClientEvent('team5m-admin:closeTicket', -1, id)
end)

if Config.framework == "esx" then
	ESX.RegisterServerCallback('team5m-admin:checkTicket', function(source, cb)
		local xPlayer = ESX.GetPlayerFromId(source)
		for k,v in pairs(tickets) do
			local info = tickets[k]
			if info["identifier"] == xPlayer.identifier and not info["closed"] then
				cb(k)
			end
		end
		cb(false)
	end)
else
	QBCore.Functions.CreateCallback('team5m-admin:checkTicket', function(source, cb)
		local xPlayer = QBCore.Functions.GetPlayer(source)
		for k,v in pairs(tickets) do
			local info = tickets[k]
			if info["identifier"] == xPlayer.PlayerData.citizenid and not info["closed"] then
				cb(k)
			end
		end
		cb(false)
	end)
end

RegisterNetEvent('team5m-admin:inviteTicket')
AddEventHandler('team5m-admin:inviteTicket', function (id, ticket)
	TriggerClientEvent('team5m-admin:inviteTicket', tonumber(id), ticket)
end)