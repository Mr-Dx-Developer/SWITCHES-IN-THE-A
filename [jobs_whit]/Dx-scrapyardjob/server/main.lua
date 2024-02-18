local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent("qb-chop:server:getReward") 
AddEventHandler("qb-chop:server:getReward", function() 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(Config.Reward, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Reward], 'add')
end)

QBCore.Functions.CreateCallback('qb-chop:server:getcooldown', function(source, callback)
    local src = source
	local result = MySQL.Sync.fetchAll('SELECT * FROM gammy_scrapyard', {})
	local found = false
    local pData = QBCore.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid

	for i=1, #result, 1 do
		local row = result[i]

		if row ~= nil then
			if row.id == cid then
				if ((row.timestamp + row.cooldown) - os.time()) < 0 then
					callback(0)
				else
					callback((row.timestamp + row.cooldown) - os.time())
				end

				found = true
			end
		end
	end
	if found == false then 
		callback(0)
	end
end)


QBCore.Functions.CreateCallback('qb-chop:server:setcooldown', function(source, callback, seconds)
    local src = source
	local result = MySQL.Sync.fetchAll('SELECT * FROM gammy_scrapyard', {})
	local found = false


    local pData = QBCore.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid

	for i=1, #result, 1 do
		local row = result[i]
   
		if row ~= nil then

			if row.id == cid then
				found = true
			end
		end
	end


	if found == true then
		MySQL.Async.execute('UPDATE gammy_scrapyard SET cooldown=@cooldown, timestamp=@timestamp WHERE id=@id', {
			['id'] = cid,
			['cooldown'] = seconds,
			['timestamp'] = os.time()
		})
	else
		MySQL.Async.insert('INSERT INTO gammy_scrapyard (cooldown, timestamp, id) VALUES (@cooldown, @timestamp, @id)', {
			['id'] = cid,
			['cooldown'] = seconds,
			['timestamp'] = os.time()
		})
	end
	callback(0)
end)