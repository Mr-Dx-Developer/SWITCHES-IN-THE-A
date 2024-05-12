local QBCore = exports['qb-core']:GetCoreObject()
local SLOTS = Config.Slots

local hasDonePreloading = {}
local starters = {}

QBCore.Functions.CreateCallback("vms_multichars:getSkin", function(_, cb, cid)
    local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', {cid, 1})
    if result[1] ~= nil then
        cb(result[1].model, result[1].skin)
    else
        cb(nil)
    end
end)

local function SetupCharacters(source)
	local identifier = QBCore.Functions.GetIdentifier(source, 'license')
	local slots = MySQL.scalar.await('SELECT slots FROM multichars_slots WHERE identifier = ?', {identifier}) or SLOTS
	MySQL.query('SELECT * FROM players WHERE license = ?', {identifier}, function(result)
		local characters
		if result then
			local characterCount = #result
			characters = table.create(0, characterCount)
			for i = 1, characterCount, 1 do
				local v = result[i]
				characters[v.cid] = v
				characters[v.cid].charinfo = json.decode(v.charinfo)
            	characters[v.cid].money = json.decode(v.money)
            	characters[v.cid].job = json.decode(v.job)
			end
		end
		TriggerClientEvent('vms_multichars:SetupUI', source, characters, slots)
	end)
end

RegisterNetEvent('vms_multichars:SetupCharacters', function()
	SetupCharacters(source)
end)

RegisterNetEvent('vms_multichars:CharacterChosen', function(cData)
	local src = source
    if QBCore.Player.Login(src, cData.citizenid) then
        repeat
            Wait(10)
        until hasDonePreloading[src]
        QBCore.Commands.Refresh(src)
		if Config.SkipSpawnSelector then
			local coords = json.decode(cData.position)
            TriggerClientEvent('vms_multichars:spawnLastLocation', src, coords)
		else
			openSpawnSelector(src, cData)
		end
    end
end)

RegisterNetEvent('vms_multichars:createCharacter', function(data)
    local src = source
    local newData = {}
    newData.cid = data.cid
    newData.charinfo = data
    if QBCore.Player.Login(src, false, newData) then
        repeat
            Wait(10)
        until hasDonePreloading[src]
        QBCore.Commands.Refresh(src)
        starters[src] = true
        TriggerClientEvent('vms_multichars:charcreator', src)
    end
end)

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    Wait(1000)
    hasDonePreloading[Player.PlayerData.source] = true
end)

AddEventHandler('QBCore:Server:OnPlayerUnload', function(src)
    hasDonePreloading[src] = false
	TriggerClientEvent('vms_multichars:SetupCharacters', src)
end)

RegisterNetEvent('vms_multichars:DeleteCharacter', function(citizenid)
    local src = source
	if Config.CanDelete and citizenid then
    	QBCore.Player.DeleteCharacter(src, citizenid)
        Citizen.Wait(500)
        SetupCharacters(src)
	end
end)

RegisterNetEvent('vms_multichars:relog', function()
	QBCore.Player.Logout(source)
end)

RegisterNetEvent('vms_multichars:starterPack', function()
	local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
	if not xPlayer then
		return
	end
	if starters[src] then
		if Config.EnableStarterItems then
			for _, v in pairs(Config.StarterItems) do
				if v then
                    xPlayer.Functions.AddItem(v.name, v.count)
				end
			end
		end
		if Config.EnableStarterMoney then
			for _, v in pairs(Config.StarterMoney) do
				if v then
                    xPlayer.Functions.AddMoney(v.account, v.amount)
				end
			end
		end
		starters[src] = false
	else
		print('Player '..src..' trying to use "vms_multichars:starterPack" illegaly.')
	end
end)