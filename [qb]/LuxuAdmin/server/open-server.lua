RegisterNetEvent('LuxuAdmin:Server:SaveCar', function(mods, veh, _, plate)
      local src = source
      if Config.Framework == 'qb' then
            --[[ QB ]]
            local Player = QBCore.Functions.GetPlayer(src)
            local result = MySQL.Sync.fetchAll('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
            if result[1] == nil then
                  MySQL.insert(
                        'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)'
                        , {
                              Player.PlayerData.license,
                              Player.PlayerData.citizenid,
                              veh.model,
                              veh.hash,
                              json.encode(mods),
                              plate,
                              0
                        })
                  Notify(src, "success.success_vehicle_owner", 'success', 5000)
            else
                  Notify(src, "error.failed_vehicle_owner", 'error', 3000)
            end
            --[[ ESX ]]
      else
            local category = 'car'
            --[[ find category ]]
            for model, vehicle in pairs(VehiclesInfo) do
                  if model == veh.model then
                        category = vehicle.category
                        break
                  end
            end

            local xPlayer = ESX.GetPlayerFromId(src)
            local plate = mods.plate
            MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, type, stored) VALUES (?, ?, ?, ?, ?)'
            , {
                  xPlayer.getIdentifier(),
                  plate,
                  json.encode({ model = GetHashKey(veh.model), plate = plate }),
                  category,
                  0,

            })
      end

      local name = GetPlayerName(src)
      local targetName = GetPlayerName(target_src)
      DiscordLog(GetPlayerIdentifiers(src), string.format('**%s** used **Slap** on **%s**', name, targetName))
end)

RegisterNetEvent('LuxuAdmin:server:GiveFoodAndWater', function(player)
      local src = source
      if not HasPermission(src, 'luxuadmin.givefoodandwater', true) then return end
      local targetName = GetPlayerName(player)
      if not targetName then return end
      local name = GetPlayerName(src)
      Luxu.SetStatus(player, 'hunger', 100)
      SetTimeout(500, function()
            Luxu.SetStatus(player, 'thirst', 100)
      end)
      DiscordLog(GetPlayerIdentifiers(src),
            string.format('**%s** gave food and water to **%s**', name, targetName))
end)


RegisterNetEvent('LuxuAdmin:server:deletePlayerVeh', function(data)
      local src = source
      if not HasPermission(src, 'luxuadmin.deleteplayerveh', true) then return end
      local target_ped = GetPlayerPed(data and data.src or src)
      local vehicle = GetVehiclePedIsIn(target_ped, false)
      if vehicle ~= 0 then
            Luxu.DeleteVehicle(vehicle)
      end
      --[[ Log ]]
      local name = GetPlayerName(src)
      local targetName = GetPlayerName(data and data.src or src)
      DiscordLog(GetPlayerIdentifiers(src),
            string.format('**%s** destroyed vehicle of %s', name, targetName))
end)


local PossibleSeats = { -1, 0, 1, 2, 3, 4, 5, 6, }
RegisterNetEvent('LuxuAdmin:Server:DeleteUnusedVehicles', function()
      local src = source
      if not HasPermission(src, 'luxuadmin.deleteunusedvehs', true) then return end
      CreateThread(function()
            local vehicles = GetAllVehicles()
            for _, vehicle in ipairs(vehicles) do
                  local isVehicleUsed = false
                  for _, seat in ipairs(PossibleSeats) do
                        local ped = GetPedInVehicleSeat(vehicle, seat)
                        if ped ~= 0 then
                              isVehicleUsed = true
                              break
                        end
                  end
                  if not isVehicleUsed then DeleteEntity(vehicle) end
            end
      end)
      --[[ Log ]]
      local name = GetPlayerName(src)
      DiscordLog(GetPlayerIdentifiers(src),
            string.format('**%s** Deleted all unused vehicles', name))
end)


function Extra_SetBlackout(state)
      -- Add your exports here
end
