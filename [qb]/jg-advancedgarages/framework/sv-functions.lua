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
  TriggerClientEvent('jg-advancedgarages:client:Notify', src, msg, type, 5000)
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

function Framework.Server.PayIntoSocietyFund(jobName, money)
  local usingNewQBBanking = GetResourceState("qb-banking") == "started" and tonumber(string.sub(GetResourceMetadata("qb-banking", "version"), 1, 3)) >= 2

  if Config.Framework == "QBCore" then
    if usingNewQBBanking then
      exports['qb-banking']:AddMoney(jobName, money)
    else
      exports['qb-management']:AddMoney(jobName, money)
    end
  elseif Config.Framework == "ESX" then
    TriggerEvent('esx_society:getSociety', jobName, function(society)
      TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
        account.addMoney(money)
      end)
    end)
  end
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

  if not player then
    return {}
  end

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

function Framework.Server.GetPlayerJob(src)
  local player = Framework.Server.GetPlayer(src)

  if not player then
    return {}
  end

  if Config.Framework == "QBCore" then
    return {
      name = player.PlayerData.job.name,
      grade = player.PlayerData.job.grade.level
    }
  elseif Config.Framework == "ESX" then
    return {
      name = player.job.name,
      grade = player.job.grade
    }
  end
end

function Framework.Server.GetPlayerGang(src)
  if Config.Framework == "QBCore" then
    local player = Framework.Server.GetPlayer(src)

    if not player then
      return {}
    end

    return {
      name = player.PlayerData.gang.name,
      grade = player.PlayerData.gang.grade.level
    }
  elseif Config.Framework == "ESX" then
    error("ESX does not natively support gangs.");
  end
end

function Framework.Server.GetPlayerIdentifier(src)
  local player = Framework.Server.GetPlayer(src)

  if not player then
    return false
  end

  if Config.Framework == "QBCore" then
    return player.PlayerData.citizenid
  elseif Config.Framework == "ESX" then
    return player.getIdentifier()
  end
end

function Framework.Server.GetSrcFromIdentifier(identifier)
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

function Framework.Server.PlayerRemoveMoney(src, amount)
  local player = Framework.Server.GetPlayer(src)

  if Config.Framework == "QBCore" then
    player.Functions.RemoveMoney('bank', amount)
  elseif Config.Framework == "ESX" then
    player.removeAccountMoney('bank', amount)
  end
end

function Framework.Server.GetPlayers()
  local players = {}

  if Config.Framework == "QBCore" then
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
      table.insert(players, {
        id = k,
        identifier = v.PlayerData.citizenid,
        name = v.PlayerData.charinfo.firstname .. " " .. v.PlayerData.charinfo.lastname
      })
    end
  elseif Config.Framework == "ESX" then
    for _, xPlayer in pairs(ESX.GetExtendedPlayers()) do
      table.insert(players, {
        id = xPlayer.source,
        identifier = xPlayer.getIdentifier(),
        name = xPlayer.getName()
      })
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

function Framework.Server.GetGangs()
  if Config.Framework == "QBCore" then
    return QBCore.Shared.Gangs
  elseif Config.Framework == "ESX" then
    error("ESX does not natively support gangs.");
  end
end

function Framework.Server.GetPlate(vehicle)
  return string.gsub(GetVehicleNumberPlateText(vehicle), '^%s*(.-)%s*$', '%1')
end
