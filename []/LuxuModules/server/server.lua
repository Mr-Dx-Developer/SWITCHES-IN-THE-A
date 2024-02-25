--[[ Functions ]]
--[[ Callbacks ]]
lib.callback.register('LuxuModules:Server:GetTargetMugshot', function(source, target)
      if not GetPlayerName(target) then return end
      local mugshot = Luxu.GetTargetMugshot(target)
      return mugshot
end)

function Luxu.GetFrameworkObject()
      return exports.LuxuModules.GetFrameworkObject()
end

function Luxu.Notify(src, msg, ntype, duration)
      local data = { msg = msg, type = ntype, duration = duration }
      if type(src) == 'number' then
            src = tostring(src)
      end
      TriggerClientEvent('LuxuModules:Client:Notify', src, data)
end

function Luxu.GetTargetMugshot(targetSource)
      local mug = lib.callback.await('LuxuModules:Client:GetMugshot', targetSource)
      return mug
end

function Luxu.GetPlayerData(id)
      local fivemName = GetPlayerName(id)
      if not fivemName then return end
      local bucket    = GetPlayerRoutingBucket(id)
      local playerObj = Luxu.GetPlayerObject(id)
      if not playerObj then return end
      local accounts      = Luxu.GetPlayerAccounts(playerObj)
      local identifier    = Luxu.GetFrameworkIdentifier(playerObj)
      local jobinfo       = Luxu.GetPlayerJob(playerObj)
      local characterName = Luxu.GetCharacterName(playerObj)
      local identifiers   = {}

      for _, iden in ipairs(GetPlayerIdentifiers(id)) do
            if string.find(iden, 'ip:') and not Config.ShowPlayerIPinStats then
                  goto skip
            end
            table.insert(identifiers, iden)
            :: skip ::
      end

      local data = {
            name = fivemName,
            characterName = characterName,
            identifier = identifier,
            job = jobinfo,
            accounts = accounts,
            bucket = bucket,
            identifiers = identifiers
      }
      return data
end

function Luxu.GetPlayerObject(id)
      if CurrentFramework == 'qb' then
            local data = QBCore.Functions.GetPlayer(id)
            return type(data) == 'string' and json.decode(data) or data
      elseif CurrentFramework == 'esx' then
            return ESX.GetPlayerFromId(id)
      end
end

function Luxu.GetFrameworkIdentifier(playerObj)
      if CurrentFramework == 'qb' then
            return playerObj.PlayerData.citizenid
      elseif CurrentFramework == 'esx' then
            return playerObj.getIdentifier()
      end
end

function Luxu.GetSourceFromIdentifier(identifier)
      local players = GetPlayers()
      for i = 1, #players do
            local id = players[i]
            local player_identifier = Luxu.GetPlayerFrameworkIdentifier(id)
            if player_identifier == identifier then
                  return id
            end
      end
end

function Luxu.GetPlayerJob(playerObj)
      local jobInfo = {
            name = nil,
            grade = nil,
      }
      if CurrentFramework == 'qb' then
            local jobData = playerObj.PlayerData.job
            jobInfo.name = jobData.name
            jobInfo.grade = jobData.grade.level
      elseif CurrentFramework == 'esx' then
            local jobData = playerObj.getJob()
            jobInfo.name = jobData.name
            jobInfo.grade = jobData.grade
      end
      return jobInfo
end

function Luxu.GetVehicleInfoByPlate(plate)
      if CurrentFramework == 'qb' then
            local result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE plate = @plate', {
                  ['@plate'] = plate
            })
            if not result[1] then return end
            local owner = result[1].citizenid
            local PlayerObj = QBCore.Functions.GetPlayerByCitizenId(owner)
            local name = Luxu.GetCharacterName(PlayerObj)
            local vehicle = result[1].vehicle

            return {
                  name = name,
                  vehicle = vehicle
            }
      elseif CurrentFramework == 'esx' then
            local result = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
                  ['@plate'] = plate
            })
            if not result[1] then return end
            local owner = result[1].owner
            local PlayerObj = ESX.GetPlayerFromIdentifier(owner)
            local name = Luxu.GetCharacterName(PlayerObj)
            local vehicle = result[1].vehicle

            return {
                  name = name,
                  vehicle = vehicle
            }
      end
end

function Luxu.GetFrameworkPlayers()
      local function fallback()
            local tbl = {}
            for _, id in ipairs(GetPlayers()) do
                  local playerObj = Luxu.GetPlayerObject(id)
                  table.insert(tbl, playerObj)
            end
            return tbl
      end

      if CurrentFramework == 'qb' then
            return QBCore.Functions.GetQBPlayers and QBCore.Functions.GetQBPlayers() or fallback()
      elseif CurrentFramework == 'esx' then
            return ESX.GetExtendedPlayers and ESX.GetExtendedPlayers() or fallback()
      end
end
