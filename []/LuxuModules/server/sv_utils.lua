--[[ Functions ]]
function Luxu.GetPlayerFrameworkIdentifier(id)
      if CurrentFramework == 'qb' then
            local player = type(id) == 'table' and id or QBCore.Functions.GetPlayer(id)
            if not player then return end
            return player.PlayerData.citizenid
      elseif CurrentFramework == 'esx' then
            local player = type(id) == 'table' and id or ESX.GetPlayerFromId(id)
            if not player then return end
            return player.getIdentifier()
      end
end

function Luxu.KillPlayer(id)
      if id == nil then return end
      if not GetPlayerName(id) then return end
      lib.callback('LuxuModules:Client:KillSelf', id)
      return true
end

function Luxu.SetStatus(id, status, value)
      if CurrentFramework == 'qb' then
            local Player = QBCore.Functions.GetPlayer(id)
            Player.Functions.SetMetaData(status, value)
            if status == 'hunger' or status == 'thirst' then
                  TriggerClientEvent('hud:client:UpdateNeeds', id, Player.PlayerData.metadata['hunger'],
                        Player.PlayerData.metadata['thirst'])
            end
      elseif CurrentFramework == 'esx' then
            if value == 100 then
                  TriggerClientEvent('esx_status:set', id, status, 1000000)
            end
      end
end

function Luxu.RevivePlayer(id)
      if id == nil then return end
      if not GetPlayerName(id) then return end

      TriggerClientEvent('visn_are:resetHealthBuffer', id)

      if Luxu.utils:IsResourceRunning('wasabi_ambulance') then
            exports.wasabi_ambulance:RevivePlayer(id)
      elseif Luxu.utils:IsResourceRunning('ars_ambulancejob') then
            TriggerClientEvent('ars_ambulancejob:healPlayer', id, { revive = true })
      else
            if CurrentFramework == 'qb' then
                  TriggerClientEvent('hospital:client:Revive', id)
            elseif CurrentFramework == 'esx' then
                  TriggerClientEvent('esx_ambulancejob:revive', id)
            end
            lib.callback('LuxuModules:Client:ReviveSelf', id, nil)
      end

      return true
end

function Luxu.GetCharacterName(playerObj)
      if CurrentFramework == 'qb' then
            local firstName = playerObj.PlayerData.charinfo.firstname
            local lastName  = playerObj.PlayerData.charinfo.lastname
            return string.format('%s %s', firstName, lastName)
      elseif CurrentFramework == 'esx' then
            return playerObj.getName()
      end
end

function Luxu.GiveClothingMenu(id)
      if Luxu.utils:IsResourceRunning('illenium-appearance') then
            -- Just a placeholder since it uses the default framework events
      end

      -- codem apperance seems to use these events aswell


      if CurrentFramework == 'qb' then
            TriggerClientEvent('qb-clothing:client:openMenu', id)
      elseif CurrentFramework == 'esx' then
            TriggerClientEvent('esx_skin:openSaveableMenu', id)
      end
end

function Luxu.GetOwnedVehicles(id)
      if CurrentFramework == 'qb' then
            local playerObj = Luxu.GetPlayerObject(id)
            if not playerObj then return end
            local identifier = Luxu.GetFrameworkIdentifier(playerObj)

            local result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = @citizenid', {
                  ['@citizenid'] = identifier
            })
            return result
      elseif CurrentFramework == 'esx' then
            local playerObj = Luxu.GetPlayerObject(id)
            if not playerObj then return end
            local identifier = Luxu.GetFrameworkIdentifier(playerObj)
            local result = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', {
                  ['@owner'] = identifier
            })
            return result
      end
end

function Luxu.GetPlayerAccounts(id)
      local playerObj = type(id) == 'table' and id or Luxu.GetPlayerObject(id)
      local data = {}
      if CurrentFramework == 'qb' then
            local accounts = playerObj.PlayerData.money

            for k, v in pairs(accounts) do
                  table.insert(data, {
                        name = k,
                        money = v
                  })
            end
      elseif CurrentFramework == 'esx' then
            local accounts = playerObj.getAccounts()

            for k, v in pairs(accounts) do
                  table.insert(data, {
                        name = v.name,
                        money = v.money
                  })
            end
      end
      return data
end

function Luxu.GetAccountMoney(id, account)
      local playerObj = type(id) == 'table' and id or Luxu.GetPlayerObject(id)
      if CurrentFramework == 'qb' then
            local accounts = playerObj.PlayerData.money
            for k, v in pairs(accounts) do
                  if k == account then return v end
            end
      elseif CurrentFramework == 'esx' then
            local accounts = playerObj.getAccounts()

            for k, v in pairs(accounts) do
                  if v.name == account then return v.money end
            end
      end
end

function Luxu.SetAccountMoney(id, account, operation, amount)
      local playerObj = Luxu.GetPlayerObject(id)
      local accounts = Luxu.GetPlayerAccounts(id)
      local balance
      for _, v in ipairs(accounts) do
            if v.name == account then
                  balance = v.money
                  break
            end
      end
      if type(balance) ~= 'number' then return end
      if not playerObj then return end
      if CurrentFramework == 'qb' then
            if operation == 'add' then
                  playerObj.Functions.AddMoney(account, amount)
            elseif operation == 'remove' then
                  playerObj.Functions.RemoveMoney(account, amount)
            elseif operation == 'set' then
                  playerObj.Functions.SetMoney(account, amount)
            end
      elseif CurrentFramework == 'esx' then
            if operation == 'add' then
                  playerObj.addAccountMoney(account, amount)
            elseif operation == 'remove' then
                  playerObj.removeAccountMoney(account, amount)
            elseif operation == 'set' then
                  playerObj.setAccountMoney(account, amount)
            end
      end
      return true
end

function Luxu.SetTime(hours, minutes)
      if Luxu.utils:IsResourceRunning('cd_easytime') then
            exports['cd_easytime']:forceUpdate({ hours = hours, minutes = minutes })
      elseif Luxu.utils:IsResourceRunning('qb-weathersync') then
            exports["qb-weathersync"]:setTime(hours, minutes)
      end

      return true
end

function Luxu.SetWeather(weather)
      if Luxu.utils:IsResourceRunning('cd_easytime') then
            exports['cd_easytime']:forceUpdate({ weather = weather, instantweather = true })
      elseif Luxu.utils:IsResourceRunning('qb-weathersync') then
            exports["qb-weathersync"]:setWeather(weather)
      end

      return true
end

function Luxu.FreezeTime()
      if Luxu.utils:IsResourceRunning('cd_easytime') then
            local data = exports['cd_easytime']:GetWeather()
            status = not data.freeze
            exports['cd_easytime']:forceUpdate({ freeze = status })
      elseif Luxu.utils:IsResourceRunning('qb-weathersync') then
            status = exports["qb-weathersync"]:setTimeFreeze();
      end

      return true, status
end

function Luxu.SetBlackout(state)
      if Luxu.utils:IsResourceRunning('cd_easytime') then
            exports['cd_easytime']:forceUpdate({ blackout = state })
      elseif Luxu.utils:IsResourceRunning('qb-weathersync') then
            exports["qb-weathersync"]:setBlackout(state)
      end
end

function Luxu.GiveVehicle(src, model)
      local playerObj = Luxu.GetPlayerObject(src)
      if not playerObj then return end

      local CarInfo = lib.callback.await('LuxuModules:Client:SpawnCarAndReturnInfo', src, model)


      if not CarInfo then return false end

      local identifier = Luxu.GetFrameworkIdentifier(playerObj)
      local result
      if CurrentFramework == 'qb' then
            local license = playerObj.PlayerData.license
            result = MySQL.Sync.execute(
                  'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, garage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)'
                  , {
                        license,
                        identifier,
                        CarInfo.model,
                        CarInfo.modelHash,
                        json.encode(CarInfo.mods),
                        CarInfo.plate,
                        1,
                        Config.DefaultParkingGarage?.qb and Config.DefaultParkingGarage.qb or "pillboxgarage"
                  })
      elseif CurrentFramework == 'esx' then
            result = MySQL.Sync.execute(
                  'INSERT INTO owned_vehicles (owner, plate, vehicle, stored, parking) VALUES (?, ?, ?, ?, ?)'
                  , {
                        identifier,
                        CarInfo.plate,
                        json.encode({ model = CarInfo.modelHash, plate = CarInfo.plate }),
                        1,
                        Config.DefaultParkingGarage?.esx and Config.DefaultParkingGarage.esx or "SanAndreasAvenue"
                  })
      end
      return result
end

function Luxu.SaveVehicleToDB(license, identifier, modelName, plate, props)
      local result
      if CurrentFramework == 'qb' then
            result = MySQL.Sync.execute(
                  'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, garage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)'
                  , {
                        license,
                        identifier,
                        modelName,
                        GetHashKey(modelName),
                        json.encode(props),
                        plate,
                        1,
                        Config.DefaultParkingGarage?.qb and Config.DefaultParkingGarage.qb or "pillboxgarage"
                  })
      elseif CurrentFramework == 'esx' then
            result = MySQL.Sync.execute(
                  'INSERT INTO owned_vehicles (owner, plate, vehicle, stored, parking) VALUES (?, ?, ?, ?, ?)'
                  , {
                        identifier,
                        plate,
                        json.encode({ model = GetHashKey(modelName), plate = plate }),
                        1,
                        Config.DefaultParkingGarage?.esx and Config.DefaultParkingGarage.esx or "SanAndreasAvenue"
                  }
            )
      end
      return result
end

function Luxu.GivePlayerItem(source, item, amount, metadata)
      local PlayerObj = Luxu.GetPlayerObject(source)

      if Luxu.utils:IsResourceRunning('ox_inventory') then
            exports.ox_inventory:AddItem(source, item, amount, metadata, nil, nil)
      elseif Luxu.utils:IsResourceRunning('core_inventory') then
            local inventory = 'content-' .. PlayerObj.identifier:gsub(':', '')
            exports['core_inventory']:addItem(inventory, item, amount, metadata, nil)
      elseif Luxu.utils:IsResourceRunning('qs-inventory') then
            exports['qs-inventory']:AddItem(source, item, amount, nil, metadata)
      else
            if CurrentFramework == 'qb' then
                  local result = PlayerObj.Functions.AddItem(item, amount, nil, metadata)
                  return result
            elseif CurrentFramework == 'esx' then
                  PlayerObj.addInventoryItem(item, amount)
            end
      end
      return true
end

function Luxu.CanCarryItem(source, item, amount)
      local PlayerObj = Luxu.GetPlayerObject(source)

      if Luxu.utils:IsResourceRunning('ox_inventory') then
            return exports.ox_inventory:CanCarryItem(source, item, amount)
      elseif Luxu.utils:IsResourceRunning('core_inventory') then
            local inventory = 'content-' .. PlayerObj.identifier:gsub(":", "")
            return exports['core_inventory']:canCarry(inventory, item, amount)
      elseif Luxu.utils:IsResourceRunning('qs-inventory') then
            return exports['qs-inventory']:CanCarryItem(source, item, amount)
      else
            if CurrentFramework == 'qb' then
                  local totalWeight = QBCore.Player.GetTotalWeight(PlayerObj.PlayerData.items)
                  local info = QBCore.Shared.Items[item:lower()]
                  return (totalWeight + (info['weight'] * amount)) <= 120000
            elseif CurrentFramework == 'esx' then
                  return PlayerObj.canCarryItem(item, amount)
            end
      end
end

function Luxu.HasItem(source, item, amount)
      local PlayerObj = Luxu.GetPlayerObject(source)
      if Luxu.utils:IsResourceRunning('ox_inventory') then
            local count = exports.ox_inventory:GetItem(source, item, nil, true)
            return count >= amount
      elseif Luxu.utils:IsResourceRunning('core_inventory') then
            local inventory = 'content-' .. PlayerObj.identifier:gsub(":", "")
            local count = exports['core_inventory']:getItem(inventory, itemName)
            return count >= amount
      elseif Luxu.utils:IsResourceRunning('qs-inventory') then
            local count = exports['qs-inventory']:GetItemTotalAmount(source, item)
            return count >= amount
      else
            if CurrentFramework == 'qb' then
                  local items = PlayerObj.PlayerData.items
                  local count = 0
                  for k, v in pairs(items) do
                        if item == v.name then
                              count = count + v.amount
                        end
                  end
                  return count >= amount
            elseif CurrentFramework == 'esx' then
                  return PlayerObj.getInventoryItem(item).count >= amount
            end
      end
end

function Luxu.RemoveItem(source, item, amount)
      local PlayerObj = Luxu.GetPlayerObject(source)

      if Luxu.utils:IsResourceRunning('ox_inventory') then
            exports.ox_inventory:RemoveItem(source, item, amount)
      elseif Luxu.utils:IsResourceRunning('core_inventory') then
            local inventory = 'content-' .. PlayerObj.identifier:gsub(":", "")
            exports['core_inventory']:removeItem(inventory, item, tonumber(amount))
      elseif Luxu.utils:IsResourceRunning('qs-inventory') then
            exports['qs-inventory']:RemoveItem(source, item, amount)
      else
            if CurrentFramework == 'qb' then
                  PlayerObj.Functions.RemoveItem(item, amount)
            elseif CurrentFramework == 'esx' then
                  PlayerObj.removeInventoryItem(item, amount)
            end
      end
end

function Luxu.SetPlayerJob(id, job, grade)
      local PlayerObj = type(id) == 'number' and Luxu.GetPlayerObject(id) or id
      if not PlayerObj then return end
      if CurrentFramework == 'qb' then
            PlayerObj.Functions.SetJob(job, grade)
      elseif CurrentFramework == 'esx' then
            if not ESX.DoesJobExist(job, grade) then return end
            PlayerObj.setJob(job, grade)
      end
      return true
end

function Luxu.ToggleJobDuty(id, mode)
      local PlayerObj = type(id) == 'number' and Luxu.GetPlayerObject(id) or id
      if not PlayerObj then return end
      if CurrentFramework == 'qb' then
            Player.Functions.SetJobDuty(mode)
      elseif CurrentFramework == 'esx' then
            --[[ Unknown ]]
      end
end

function Luxu.GetVehicleList()
      if CurrentFramework == 'qb' then
            local vehs = require '@qb-core.shared.vehicles'
            local l = {}
            for k, v in pairs(vehs) do
                  l[#l + 1] = { name = v.name, model = v.model, category = v.category }
            end
            return l
      elseif CurrentFramework == 'esx' then
            local result = MySQL.await.fetchAll('SELECT name,model,category FROM vehicles')
            return result
      end
end

function Luxu.DeleteVehicle(vehicle)
      if not DoesEntityExist(vehicle) then return end
      if Luxu.utils:IsResourceRunning('cd_garage') then
            local plate = Luxu.GetVehiclePlate(vehicle)
            TriggerEvent('cd_garage:RemovePersistentVehicles', plate)
      end
      if Luxu.utils:IsResourceRunning('jg-advancedgarages') then
            TriggerEvent('jg-advancedgarages:server:DeleteVehicleEntity', vehicle)
      end
      DeleteEntity(vehicle)
end
