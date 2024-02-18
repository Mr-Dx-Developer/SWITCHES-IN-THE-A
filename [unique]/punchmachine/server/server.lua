UMPunchMachine.GetCore()
local BoxMachineList = {}
local insert,query = nil

CreateThread(function()
  for k, v in pairs(UMPunchMachine.Coords) do
    local objectId = math.random(100,9999)
    BoxMachineList[objectId] = {
      id = objectId,
      status = false,
      coords = {x = v["coords"].x, y = v["coords"].y, z = v["coords"].z, h = v["coords"].w},
      prop = v["prop"],
      offset = {x = v["offset"].x, y = v["offset"].y}
    }
  end
end)

if UMPunchMachine.SQL == 'oxmysql' then 
    insert = MySQL.insert
    query = MySQL.query.await
elseif UMPunchMachine.SQL == 'mysql-async' then 
    insert = MySQL.Async.insert
    query = MySQL.Sync.fetchAll
end

RegisterNetEvent('um-punchmachine:server:objectsync', function()
    local src = source
    for k, v in pairs(BoxMachineList) do
        TriggerClientEvent('um-punchmachine:client:BoxMachine', src, BoxMachineList[k].id, BoxMachineList[k].coords, BoxMachineList[k].prop, BoxMachineList[k].offset)
    end
    TriggerClientEvent("um-punchmachine:client:updateStatus", -1, BoxMachineList)
end)

RegisterNetEvent('um-punchmachine:server:updateStatus', function(objectId, status)
    BoxMachineList[objectId].status = status
    TriggerClientEvent('um-punchmachine:client:updateStatus', -1, BoxMachineList)
end)

RegisterNetEvent('um-punchmachine:server:syncBmuc', function(objectId, bmuc, boxmachinepos, rottype, h)
    TriggerClientEvent('um-punchmachine:client:syncBmuc', -1 ,objectId, bmuc, boxmachinepos, rottype ,h)
end)

RegisterNetEvent('um-punchmachine:server:MaxDistance', function(score)
    TriggerClientEvent('um-punchmachine:client:MaxDistance', -1, GetEntityCoords(GetPlayerPed(source)), 4, score)
end)


RegisterNetEvent('um-punchmachine:server:newscore', function(randomscore)
    local src = source
    local name = nil
    if UMPunchMachine.Framework == 'qb-core' then 
       local Player = QBCore.Functions.GetPlayer(src)
       name = Player.PlayerData.charinfo.firstname  .. ' ' .. Player.PlayerData.charinfo.lastname
    elseif UMPunchMachine.Framework == 'esx' then 
      local xPlayer = ESX.GetPlayerFromId(src)
      name = xPlayer.getName()
    end
    if UMPunchMachine.SQL == 'oxmysql' then 
      insert('INSERT INTO punchmachine (`name`, `score`) VALUES (?, ?)', {name,randomscore})
    elseif UMPunchMachine.SQL == 'mysql-async' then 
      insert('INSERT INTO punchmachine (name, score) VALUES (@name, @score)', {['@name'] = name, ['@score'] = randomscore})
    end
  end)

  if UMPunchMachine.Framework == 'qb-core' then 
    QBCore.Functions.CreateCallback('um-punchmachine:server:leaderboard', function(source, cb)
       local result = query('SELECT * FROM punchmachine ORDER BY score DESC LIMIT 3', {})
        cb(result)
    end)
elseif UMPunchMachine.Framework == 'esx' then 
    ESX.RegisterServerCallback('um-punchmachine:server:leaderboard', function(source, cb)
      local result = query('SELECT * FROM punchmachine ORDER BY score DESC LIMIT 3', {})
        cb(result)
    end)
end
