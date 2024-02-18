--
-- Core Functions
--

local cbWaiting = false
function Framework.Client.TriggerCallback(cbRef, cb, ...)
  local args = {...}
  
  Citizen.CreateThread(function()
    while cbWaiting do Wait(0) end
    cbWaiting = true
    
    if Config.Framework == "QBCore" then
      return QBCore.Functions.TriggerCallback(cbRef, function(res)
        cbWaiting = false
        cb(res)
      end, table.unpack(args))
    elseif Config.Framework == "ESX" then
      return ESX.TriggerServerCallback(cbRef, function(res)
        cbWaiting = false
        cb(res)
      end, table.unpack(args))
    end
  end)
end

function Framework.Client.ShowTextUI(text)
  if Config.DrawText == "jg-textui" then
    exports['jg-textui']:DrawText(text)
  elseif Config.DrawText == "qb-DrawText" then
    exports["qb-core"]:DrawText(text)
  elseif Config.DrawText == "okokTextUI" then
    exports['okokTextUI']:Open(text, 'lightblue', 'left')
  elseif Config.DrawText == "ox_lib" then
    exports['ox_lib']:showTextUI(text, {
      position = "left-center"
    })
  elseif Config.DrawText == "ps-ui" then
    exports['ps-ui']:DisplayText(text, "primary")
  end
end

function Framework.Client.HideTextUI()
  if Config.DrawText == "jg-textui" then
    exports['jg-textui']:HideText()
  elseif Config.DrawText == "qb-DrawText" then
    exports["qb-core"]:HideText()
  elseif Config.DrawText == "okokTextUI" then
    exports['okokTextUI']:Close()
  elseif Config.DrawText == "ox_lib" then
    exports['ox_lib']:hideTextUI()
  elseif Config.DrawText == "ps-ui" then
    exports['ps-ui']:HideText()
  end
end

function Framework.Client.Notify(msg, type, time)
  type = type or 'success'
  time = time or 5000

  if Config.Notifications == "okokNotify" then
    exports['okokNotify']:Alert('Dealerships', msg, time, type)
  elseif Config.Notifications == "ox_lib" then
    exports['ox_lib']:notify({
      title = 'Dealerships',
      description = msg,
      type = type
    })
  elseif Config.Notifications == "ps-ui" then
    exports['ps-ui']:Notify(msg, type, time)
  else
    if Config.Framework == "QBCore" then
      return QBCore.Functions.Notify(msg, type, time)
    elseif Config.Framework == "ESX" then
      return ESX.ShowNotification(msg, type)
    end
  end
end

RegisterNetEvent("jg-dealerships:client:notify", function(...)
  Framework.Client.Notify(...)
end)

function Framework.Client.ToggleHud(toggle)
  DisplayHud(toggle)
  DisplayRadar(toggle)
end

--
-- Vehicle Functions
--

function Framework.Client.GetVehicleProperties(vehicle)
  if Config.Framework == "QBCore" then
    return QBCore.Functions.GetVehicleProperties(vehicle)
  elseif Config.Framework == "ESX" then
    return ESX.Game.GetVehicleProperties(vehicle)
  end
end

function Framework.Client.SetVehicleProperties(vehicle, props)
  if Config.Framework == "QBCore" then
    return QBCore.Functions.SetVehicleProperties(vehicle, props)
  elseif Config.Framework == "ESX" then
    return ESX.Game.SetVehicleProperties(vehicle, props)
  end
end

function Framework.Client.VehicleGetFuel(vehicle)
  if (Config.FuelSystem == "LegacyFuel" or Config.FuelSystem == "ps-fuel" or Config.FuelSystem == "lj-fuel" or Config.FuelSystem == "cdn-fuel" or Config.FuelSystem == "hyon_gas_station" or Config.FuelSystem == "okokGasStation" or Config.FuelSystem == "nd_fuel" or Config.FuelSystem == "myFuel") then
    return exports[Config.FuelSystem]:GetFuel(vehicle)
  elseif Config.FuelSystem == "ti_fuel" then
    local level, type = exports["ti_fuel"]:getFuel(vehicle)
    TriggerServerEvent("jg-dealerships:server:save-ti-fuel-type", Framework.Client.GetPlate(vehicle), type)
    return level
  elseif Config.FuelSystem == "ox_fuel" then
    return GetVehicleFuelLevel(vehicle)
  else
    return 65 -- or set up custom fuel system here...
  end
end

function Framework.Client.VehicleSetFuel(vehicle, fuel)
  if (Config.FuelSystem == "LegacyFuel" or Config.FuelSystem == "ps-fuel" or Config.FuelSystem == "lj-fuel" or Config.FuelSystem == "cdn-fuel" or Config.FuelSystem == "hyon_gas_station" or Config.FuelSystem == "okokGasStation" or Config.FuelSystem == "nd_fuel" or Config.FuelSystem == "myFuel") then
    exports[Config.FuelSystem]:SetFuel(vehicle, fuel)
  elseif Config.FuelSystem == "ti_fuel" then
    Framework.Client.TriggerCallback("jg-dealerships:server:get-ti-fuel-type", function(type)
      exports["ti_fuel"]:setFuel(vehicle, fuel, type or nil)
    end, Framework.Client.GetPlate(vehicle))
  elseif Config.FuelSystem == "ox_fuel" then
    Entity(vehicle).state.fuel = fuel
  else
    -- Setup custom fuel system here
  end
end

function Framework.Client.VehicleGiveKeys(plate, vehicleEntity)
  if Config.VehicleKeys == "qb-vehiclekeys" then
    TriggerEvent("vehiclekeys:client:SetOwner", plate)
  elseif Config.VehicleKeys == "jaksam-vehicles-keys" then
    TriggerServerEvent("vehicles_keys:selfGiveVehicleKeys", plate)
  elseif Config.VehicleKeys == "mk_vehiclekeys" then
    exports["mk_vehiclekeys"]:AddKey(vehicleEntity)
  elseif Config.VehicleKeys == "qs-vehiclekeys" then
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicleEntity))
    exports['qs-vehiclekeys']:GiveKeys(plate, model)
  elseif Config.VehicleKeys == "wasabi_carlock" then
    exports.wasabi_carlock:GiveKey(plate)
  elseif Config.VehicleKeys == "cd_garage" then
    TriggerEvent('cd_garage:AddKeys', plate)
  elseif Config.VehicleKeys == "okokGarage" then
    TriggerServerEvent("okokGarage:GiveKeys", plate)
  elseif Config.VehicleKeys == "t1ger_keys" then
    TriggerServerEvent('t1ger_keys:updateOwnedKeys', plate, true)
  else
    -- Setup custom key system here...
  end
end

function Framework.Client.VehicleRemoveKeys(plate, vehicleEntity)
  if Config.VehicleKeys == "qs-vehiclekeys" then
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicleEntity))
    exports['qs-vehiclekeys']:RemoveKeys(plate, model)
  elseif Config.VehicleKeys == "wasabi_carlock" then
    exports.wasabi_carlock:RemoveKey(plate)
  elseif Config.VehicleKeys == "t1ger_keys" then
    TriggerServerEvent('t1ger_keys:updateOwnedKeys', plate, false)
  else
    -- Setup custom key system here...
  end
end

function Framework.Client.GetPlate(vehicle)
  return string.gsub(GetVehicleNumberPlateText(vehicle), '^%s*(.-)%s*$', '%1')
end

function Framework.Client.GetModelColumn(vehicle)
  if Config.Framework == "QBCore" then
    return vehicle.vehicle or tonumber(vehicle.hash) 
  elseif Config.Framework == "ESX" then
    if not vehicle or not vehicle.vehicle then return nil end

    if type(vehicle.vehicle) == "string" then
      if not json.decode(vehicle.vehicle) then return nil end
      return json.decode(vehicle.vehicle).model
    else
      return vehicle.vehicle.model
    end
  end
end

function Framework.Client.GetVehicleLabel(model)
  if type(model) == "string" and Config.Framework == "QBCore" then
    if not QBCore.Shared.Vehicles then
      print("^1---------------------------------------------------------------------------------------")
      print("^1Error: qb-core/shared/vehicles.lua cannot be parsed. Learn more: jgscripts.com/qbshared")
      print("^1---------------------------------------------------------------------------------------")
    end

    local vehShared = QBCore.Shared.Vehicles[model]
    if vehShared then
      return vehShared.brand .. " " .. vehShared.name
    end
  end

  local hash = type(model) == "string" and joaat(model) or model
  local makeName = GetMakeNameFromVehicleModel(hash)
  local modelName = GetDisplayNameFromVehicleModel(hash)
  local label = GetLabelText(makeName) .. ' ' .. GetLabelText(modelName)

  if makeName == "CARNOTFOUND" or modelName == "CARNOTFOUND" then
    label = model
  else
    if GetLabelText(modelName) == "NULL" and GetLabelText(makeName) == "NULL" then
      label = makeName .. ' ' .. modelName
    elseif GetLabelText(makeName) == "NULL" then
      label = GetLabelText(modelName)
    end
  end

  return label
end

function Framework.Client.GetVehiclesInArea(coords, maxDistance)
  if Config.Framework == "QBCore" then
    local entities = QBCore.Functions.GetVehicles()

    local nearbyEntities = {}
    coords = vector3(coords.x, coords.y, coords.z)

    for k, entity in pairs(entities) do
      local distance = #(coords - GetEntityCoords(entity))
      if distance <= maxDistance then
        nearbyEntities[#nearbyEntities + 1] = entity
      end
    end

    return nearbyEntities
  elseif Config.Framework == "ESX" then
    return ESX.Game.GetVehiclesInArea(coords, maxDistance)
  end
end

--
-- Player Functions
--

function Framework.Client.GetPlayerIdentifier()
  if Config.Framework == "QBCore" then
    return Globals.PlayerData.citizenid
  elseif Config.Framework == "ESX" then
    return Globals.PlayerData.identifier
  end
end

function Framework.Client.GetBalance(type)
  if Config.Framework == "QBCore" then
    return QBCore.Functions.GetPlayerData().money[type]
  elseif Config.Framework == "ESX" then
    if type == "cash" then type = "money" end
    
    for i, acc in pairs(ESX.GetPlayerData().accounts) do
      if acc.name == type then
        return acc.money
      end
    end

    return 0
  end
end

function Framework.Client.GetSocietyBalance(society, type)
  local balance = -1

  Framework.Client.TriggerCallback("jg-dealerships:server:get-society-balance", function(data)
    balance = data
  end, society, type)

  timeout = 0
  while balance == -1 do
    timeout = timeout + 1
    Wait(0)
    if timeout > 250 then
      return Framework.Client.Notify("Error: could not get society balance for " .. society, "error")
    end
  end
  return balance
end

function Framework.Client.GetPlayerJob()
  local player = Globals.PlayerData

  if not player or not player.job then
    return {}
  end

  if Config.Framework == "QBCore" then
    return {
      name = player.job.name,
      label = player.job.label,
      grade = player.job.grade.level
    }
  elseif Config.Framework == "ESX" then
    return {
      name = player.job.name,
      label = player.job.label,
      grade = player.job.grade
    }
  end
end

function Framework.Client.GetPlayerGang()
  if Config.Framework == "QBCore" then
    local player = QBCore.Functions.GetPlayerData()

    if not player or not player.gang then
      return {}
    end

    return {
      name = player.gang.name,
      label = player.gang.label,
      grade = player.gang.grade.level
    }
  elseif Config.Framework == "ESX" then
    error("ESX does not natively support gangs.");
  end
end
