--
-- Core Functions
--
function Framework.Server.CreateCallback(cbRef, cb)
  if Config.Framework == "QBCore" then
    return QBCore.Functions.CreateCallback(cbRef, function(...)
      cb(...)
    end)
  elseif Config.Framework == "ESX" then
    ESX.RegisterServerCallback(cbRef, function(...)
      cb(...)
    end)
  end
end

function Framework.Server.Notify(src, msg, type)
  TriggerClientEvent('jg-dealerships:client:notify', src, msg, type, 5000)
end

function Framework.Server.RegisterCommand(name, help, arguments, argsrequired, callback)
  if Config.Framework == "QBCore" then
    QBCore.Commands.Add(name, help, arguments, argsrequired, callback)
  elseif Config.Framework == "ESX" then
    RegisterCommand(name, callback)
  end
end

function Framework.Server.IsAdmin(src)
  if Config.Framework == "QBCore" then
    return QBCore.Functions.HasPermission(src, "command")
  elseif Config.Framework == "ESX" then
    return ESX.GetPlayerFromId(src).getGroup() == "admin"
  end
end

-- 
-- Society
--
local usingNewQBBanking = GetResourceState("qb-banking") == "started" and tonumber(string.sub(GetResourceMetadata("qb-banking", "version"), 1, 3)) >= 2

function Framework.Server.RemoveFromSocietyFund(societyName, type, amount)
  if Config.Framework == "QBCore" then
    if usingNewQBBanking then
      exports['qb-banking']:RemoveMoney(societyName, amount)
    else
      if type == "job" then
        exports['qb-management']:RemoveMoney(societyName, amount)
      elseif type == "gang" then
        exports['qb-management']:RemoveGangMoney(societyName, amount)
      end
    end
  elseif Config.Framework == "ESX" then
    if type == "cash" then type = "money" end

    TriggerEvent('esx_society:getSociety', societyName, function(society)
      TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
        account.removeMoney(amount)
      end)
    end)
  end
end

Framework.Server.CreateCallback("jg-dealerships:server:get-society-balance", function(src, cb, society, type)
  if Config.Framework == "QBCore" then
    if usingNewQBBanking then
      cb(exports['qb-banking']:GetAccountBalance(society))
    else
      if type == "job" then
        cb(exports['qb-management']:GetAccount(society))
      elseif type == "gang" then
        cb(exports['qb-management']:GetGangAccount(society))
      end
    end
  elseif Config.Framework == "ESX" then
    if type == "cash" then type = "money" end

    TriggerEvent('esx_society:getSociety', society, function(data)
      if not data then return cb(0) end
      TriggerEvent('esx_addonaccount:getSharedAccount', data.account, function(account)
        cb(account.money)
      end)
    end)
  end
end)

function Framework.Server.SaveVehicleToGarage(src, purchaseType, society, societyType, model, plate, financed, financeData)
  if Config.Framework == "QBCore" then
    local playerData = Framework.Server.GetPlayer(src).PlayerData
    local license = playerData.license
    local citizenid = playerData.citizenid

    if purchaseType == "society" then
      if societyType == "job" then
        MySQL.insert.await("INSERT INTO player_vehicles (license,citizenid,vehicle,hash,plate,financed,finance_data,job_vehicle,job_vehicle_rank) VALUES(?,?,?,?,?,?,?,?,?)", {license, society, model, joaat(model), plate, financed, json.encode(financeData), 1, 0})
      elseif societyType == "gang" then
        MySQL.insert.await("INSERT INTO player_vehicles (license,citizenid,vehicle,hash,plate,financed,finance_data,gang_vehicle,gang_vehicle_rank) VALUES(?,?,?,?,?,?,?,?,?)", {license, society, model, joaat(model), plate, financed, json.encode(financeData), 1, 0})
      end
    else
      MySQL.insert.await("INSERT INTO player_vehicles (license,citizenid,vehicle,hash,plate,financed,finance_data) VALUES(?,?,?,?,?,?,?)", {license, citizenid, model, joaat(model), plate, financed, json.encode(financeData)})
    end
  elseif Config.Framework == "ESX" then
    local identifier = Framework.Server.GetPlayerIdentifier(src)

    if purchaseType == "society" then
      if societyType == "job" then
        MySQL.insert.await("INSERT INTO owned_vehicles (owner,plate,financed,finance_data,job_vehicle,job_vehicle_rank) VALUES(?,?,?,?,?,?)", {society, plate, financed, json.encode(financeData), 1, 0})
      elseif societyType == "gang" then
        MySQL.insert.await("INSERT INTO owned_vehicles (owner,plate,financed,finance_data,gang_vehicle,gang_vehicle_rank) VALUES(?,?,?,?,?,?)", {society, plate, financed, json.encode(financeData), 1, 0})
      end
    else
      MySQL.insert.await("INSERT INTO owned_vehicles (owner,plate,financed,finance_data) VALUES(?,?,?,?)", {identifier, plate, financed, json.encode(financeData)})
    end
  end
end

function Framework.Server.VehicleGeneratePlate()
  local plateFormat = Config.PlateFormat or "1AA111AA"
  local attempts = 0

  while attempts < 20 do
    local charsetNumbers = "0123456789"
    local charsetLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local plate = ""
    local i = 0

    while i <= 8 do
      local c = plateFormat:sub(i, i)
      if c == "A" then
        local randLetterPos = math.random(1, #charsetLetters)
        local randLetter = charsetLetters:sub(randLetterPos, randLetterPos)
        plate = plate .. randLetter -- Ensure only one character is added
      elseif c == "1" then
        local randNumberPos = math.random(1, #charsetNumbers)
        local randNumber = charsetNumbers:sub(randNumberPos, randNumberPos)
        plate = plate .. randNumber -- Ensure only one character is added
      elseif c == "^" then
        i = i + 1 -- Skip the caret and use the next character
        if i <= #plateFormat then
          plate = plate .. plateFormat:sub(i, i)
        end
      else
        plate = plate .. c
      end
      i = i + 1
    end

    local result = MySQL.scalar.await("SELECT plate FROM " .. Framework.VehiclesTable .. " WHERE plate = ?", {plate})
    if not result then
      return plate:upper()
    end

    attempts = attempts + 1
  end

  return false
end

--
-- Player Functions
--
function Framework.Server.GetPlayer(src)
  if Config.Framework == "QBCore" then
    return QBCore.Functions.GetPlayer(src)
  elseif Config.Framework == "ESX" then
    return ESX.GetPlayerFromId(src)
  end
end

function Framework.Server.GetPlayerInfo(src)
  local player = Framework.Server.GetPlayer(src)
  if not player then return false end

  if Config.Framework == "QBCore" then
    return {
      name = player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname
    }
  elseif Config.Framework == "ESX" then
    return {
      name = player.getName()
    }
  end
end

function Framework.Server.GetPlayerInfoFromIdentifier(identifier)
  local player = MySQL.single.await("SELECT * FROM " .. Framework.PlayersTable .. " WHERE " .. Framework.PlayersTableId .. " = ?", {identifier})
  if not player then return false end

  if Config.Framework == "QBCore" then
    local charinfo = json.decode(player.charinfo)
    return {
      name = charinfo.firstname .. " " .. charinfo.lastname
    }
  elseif Config.Framework == "ESX" then
    return {
      name = player.firstname .. " " .. player.lastname
    }
  end
end

function Framework.Server.GetPlayerIdentifier(src)
  local player = Framework.Server.GetPlayer(src)
  if not player then return false end

  if Config.Framework == "QBCore" then
    return player.PlayerData.citizenid
  elseif Config.Framework == "ESX" then
    return player.getIdentifier()
  end
end

function Framework.Server.GetPlayerFromIdentifier(identifier)
  if Config.Framework == "QBCore" then
    local player = QBCore.Functions.GetPlayerByCitizenId(identifier)
    if not player then return false end
    return player.PlayerData.source
  elseif Config.Framework == "ESX" then
    local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
    if not xPlayer then return false end
    return xPlayer.source
  end
end

function Framework.Server.GetPlayerBalance(src, type)
  local player = Framework.Server.GetPlayer(src)
  if not player then return 0 end

  if Config.Framework == "QBCore" then
    return player.PlayerData.money[type]
  elseif Config.Framework == "ESX" then
    if type == "cash" then type = "money" end

    for i, acc in pairs(player.getAccounts()) do
      if acc.name == type then
        return acc.money
      end
    end

    return 0
  end
end

function Framework.Server.PlayerAddMoney(src, amount, account)
  local player = Framework.Server.GetPlayer(src)
  account = account or 'bank'

  if Config.Framework == "QBCore" then
    player.Functions.AddMoney(account, roundVal(amount))
  elseif Config.Framework == "ESX" then
    if account == "cash" then account = "money" end
    player.addAccountMoney(account, roundVal(amount))
  end
end

function Framework.Server.PlayerRemoveMoney(src, amount, account)
  local player = Framework.Server.GetPlayer(src)
  account = account or 'bank'

  if Config.Framework == "QBCore" then
    player.Functions.RemoveMoney(account, roundVal(amount))
  elseif Config.Framework == "ESX" then
    if account == "cash" then account = "money" end
    player.removeAccountMoney(account, roundVal(amount))
  end
end

function Framework.Server.PlayerSetJob(src, job, role)
  local player = Framework.Server.GetPlayer(src)

  -- Adjust this as necessary for your job setup
  local rank = 1 -- sales
  if role == "supervisor" then rank = 2 end
  if role == "manager" then rank = 3 end

  if Config.Framework == "QBCore" then
    player.Functions.SetJob(job, rank)
  elseif Config.Framework == "ESX" then
    player.setJob(job, rank)
  end
end

function Framework.Server.PlayerSetJobOffline(identifier, job, role)
  -- Adjust this as necessary for your job setup
  local rank = 1 -- sales
  if role == "supervisor" then rank = 2 end
  if role == "manager" then rank = 3 end

  if Config.Framework == "QBCore" then
    if not QBCore.Shared.Jobs[job] then return false end

    local jobData = {
      name = job,
      label = QBCore.Shared.Jobs[job].label,
      onduty = QBCore.Shared.Jobs[job].defaultDuty,
      type = QBCore.Shared.Jobs[job].type or 'none',
      grade = {
        name = 'No Grades',
        level = 0,
      },
      payment = 30,
      isboss = false
    }

    if QBCore.Shared.Jobs[job].grades[tostring(rank)] then
      local jobgrade = QBCore.Shared.Jobs[job].grades[tostring(rank)]
      jobData.grade = {}
      jobData.grade.name = jobgrade.name
      jobData.grade.level = rank
      jobData.payment = jobgrade.payment or 30
      jobData.isboss = jobgrade.isboss or false
    end

    MySQL.update.await("UPDATE players SET job = ? WHERE citizenid = ?", {json.encode(jobData), identifier})
  elseif Config.Framework == "ESX" then
    MySQL.update.await("UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?", {job, rank, identifier})
  end
end

function Framework.Server.GetPlayers()
  local players = {}
  if Config.Framework == "QBCore" then
    players = QBCore.Functions.GetQBPlayers()
  elseif Config.Framework == "ESX" then
    players = ESX.GetExtendedPlayers()
  end

  for id, player in pairs(players) do
    if Config.Framework == "QBCore" then
      players[id].player_id = player.PlayerData.source
    elseif Config.Framework == "ESX" then
      players[id].player_id = player.source
    end
  end

  return players
end

function Framework.Server.GetJobs()
  if Config.Framework == "QBCore" then
    return QBCore.Shared.Jobs
  elseif Config.Framework == "ESX" then
    return ESX.GetJobs()
  end
end

--
-- ti_fuel
--

RegisterNetEvent("jg-dealerships:server:save-ti-fuel-type", function(plate, type)
  MySQL.query.await("ALTER TABLE " .. Framework.VehiclesTable .. " ADD COLUMN IF NOT EXISTS `ti_fuel_type` VARCHAR(100) DEFAULT '';")
  MySQL.update.await("UPDATE " .. Framework.VehiclesTable .. " SET ti_fuel_type = ? WHERE plate = ?", {type, plate});
end)

Framework.Server.CreateCallback('jg-dealerships:server:get-ti-fuel-type', function(src, cb, plate)
  MySQL.query.await("ALTER TABLE " .. Framework.VehiclesTable .. " ADD COLUMN IF NOT EXISTS `ti_fuel_type` VARCHAR(100) DEFAULT '';")
  local data = MySQL.single.await("SELECT ti_fuel_type FROM  " .. Framework.VehiclesTable .. " WHERE plate = ?", {plate});
  cb(data.ti_fuel_type)
end)