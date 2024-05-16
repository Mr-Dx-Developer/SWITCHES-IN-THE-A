--
-- Custom code for common events
--
RegisterNetEvent("jg-advancedgarages:client:InsertVehicle:config", function(vehicle, vehicleDbData, type)
  -- PARAMS:
  -- vehicle: Current vehicle FiveM native data
  -- vehicleDbData: The row of the owned vehicle from the datbase (NOT available if it's a vehicle from a "spawner" garage)
  -- type: is either "public", "gang" or "job"

  -- Code placed in here will be run when the player inserts their vehicle (if the vehicle is owned; and passes all the checks)
end)

RegisterNetEvent("jg-advancedgarages:client:ImpoundVehicle:config", function(vehicle)
  -- PARAMS:
  -- vehicle: Current vehicle FiveM native data

  -- Code placed in here will be run just before the vehicle is set to impounded in the DB, and before the entity is deleted
end)

RegisterNetEvent("jg-advancedgarages:client:TakeOutVehicle:config", function(vehicle, vehicleDbData, type)
  -- PARAMS:
  -- vehicle: Vehicle FiveM native data
  -- vehicleDbData: The row of the owned vehicle from the datbase (NOT available if it's a vehicle from a "spawner" garage)
  -- type: is either "public", "gang" or "job"

  -- Code placed in here will be run after a vehicle has been taken out of a garage
end)

RegisterNetEvent("jg-advancedgarages:client:TransferVehicle:config", function(plate, newOwnerPlayerId, vehicleModel)
  -- PARAMS:
  -- plate: Vehicle plate
  -- newOwnerPlayerId: new player ID
  -- vehicleModel: vehicle spawn code

  -- Code placed in here will be fired when a vehicle is transferred to another player via a public garage
end)

--
-- Blips
--
local blips, jobGarageBlips, gangGarageBlips = {}, {}, {}

local function createBlip(name, coords, blipId, blipColour, blipScale)
  local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
  SetBlipSprite(blip, blipId)
  SetBlipColour(blip, blipColour)
  SetBlipScale(blip, blipScale)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(name)
  EndTextCommandSetBlipName(blip)
  return blip
end

function createPublicPrivateGarageBlips()
  CreateThread(function()
    local identifier = Framework.Client.GetPlayerIdentifier()

    while not identifier do
      identifier = Framework.Client.GetPlayerIdentifier()
      Wait(100)
    end

    Framework.Client.TriggerCallback("jg-advancedgarages:server:get-private-garages", function(privateGarages)
      for id, garage in pairs(privateGarages) do
        Globals.Garages[garage.name] = {
          coords = vector3(garage.x, garage.y, garage.z),
          spawn = vector4(garage.x, garage.y, garage.z, garage.h),
          distance = garage.distance,
          type = garage.type,
          blip = {
            id = 357,
            color = 0,
            scale = 0.6,
          },
        }
      end

      if Config.GarageShowBlips then
        for _, blip in pairs(blips) do
          RemoveBlip(blip)
        end

        for id, garage in pairs(Globals.Garages) do
          if garage and not garage.hideBlip and not garage.job and not garage.gang then
            local blipName = Locale.garage
            if Config.GarageUniqueBlips then
              blipName = Locale.garage .. ": " .. id
            end
            if not garage.blip then
              garage.blip = {
                id = 357,
                color = 0,
                scale = 0.6
              }
            end
            local blip = createBlip(blipName, garage.coords, garage.blip.id, garage.blip.color, garage.blip.scale + 0.0)
            table.insert(blips, blip)
          end
        end
      end
    end, identifier)
  end)
end

function createJobGarageBlips()
  CreateThread(function()
    if Config.JobGarageShowBlips then
      for _, blip in pairs(jobGarageBlips) do
        RemoveBlip(blip)
      end

      for id, garage in pairs(Config.JobGarageLocations) do
        if not garage.hideBlip then
          if garage.job == Framework.Client.GetPlayerJob().name then
            local blipName = Locale.jobGarage
            if Config.JobGarageUniqueBlips then
              blipName = Locale.jobGarage .. ": " .. id
            end
            if not garage.blip then
              garage.blip = {
                id = 357,
                color = 0,
                scale = 0.6
              }
            end
            local blip = createBlip(blipName, garage.coords, garage.blip.id, garage.blip.color, garage.blip.scale + 0.0)
            table.insert(jobGarageBlips, blip)
          end
        end
      end
    end
  end)
end

function createGangGarageBlips()
  CreateThread(function()
    if Config.GangGarageShowBlips then
      for _, blip in pairs(gangGarageBlips) do
        RemoveBlip(blip)
      end

      for id, garage in pairs(Config.GangGarageLocations) do
        if not garage.hideBlip then
          if garage.gang == Framework.Client.GetPlayerGang().name then
            local blipName = Locale.gangGarage
            if Config.GangGarageUniqueBlips then
              blipName = Locale.gangGarage .. ": " .. id
            end
            if not garage.blip then
              garage.blip = {
                id = 357,
                color = 0,
                scale = 0.6
              }
            end
            local blip = createBlip(blipName, garage.coords, garage.blip.id, garage.blip.color, garage.blip.scale + 0.0)
            table.insert(gangGarageBlips, blip)
          end
        end
      end
    end
  end)
end

function createImpoundBlips()
  CreateThread(function()
    if Config.ImpoundShowBlips then
      for id, impound in pairs(Config.ImpoundLocations) do
        if not impound.hideBlip then
          local blipName = Locale.impound
          if Config.ImpoundUniqueBlips then
            blipName = Locale.impound .. ": " .. id
          end
          if not impound.blip then
            impound.blip = {
              id = 357,
              color = 0,
              scale = 0.6
            }
          end
          createBlip(blipName, impound.coords, impound.blip.id, impound.blip.color, impound.blip.scale + 0.0)
        end
      end
    end
  end)
end

createPublicPrivateGarageBlips()
createImpoundBlips()
createJobGarageBlips()
if Config.Framework == "QBCore" then
  createGangGarageBlips()
end

--
-- DrawText UI Prompts
--

local drawTextVisible, currentText
local sleep = 1000

function showDrawText(id, text)
  if drawTextVisible ~= id or currentText ~= text then
    drawTextVisible = id
    currentText = text
    Framework.Client.ShowTextUI(text)
  end
end

function hideDrawText(id)
  if drawTextVisible == id then
    drawTextVisible = nil
    Framework.Client.HideTextUI()
  end
end

local function toggleMarker(coords, marker)
  local distance = 20 -- hardcoded for now

  local ped = PlayerPedId()
  local pos = GetEntityCoords(ped)
  local dist = #(pos - vector3(coords.x, coords.y, coords.z))
  local distZ = math.abs(pos.z - coords.z)

  if dist < distance and distZ < 3 then
    sleep = 0
    DrawMarker(marker.id, coords.x, coords.y, coords.z, 0, 0, 0, 0, 0, 0, marker.size.x, marker.size.y, marker.size.z, marker.color.r, marker.color.g, marker.color.b, marker.color.a, marker.bobUpAndDown, marker.faceCamera, 0, marker.rotate, marker.drawOnEnts)
  end
end

local function toggleDrawText(id, coords, distance, openEvent, insertEvent, isImpound)
  local pos = GetEntityCoords(PlayerPedId())
  local dist = #(pos - coords)
  local distZ = math.abs(pos.z - coords.z)

  if dist < distance and distZ < 3 then
    if IsPedInAnyVehicle(PlayerPedId()) and not isImpound then
      sleep = 0
      showDrawText(id, Config.InsertVehiclePrompt)
      if IsControlJustPressed(0, Config.InsertVehicleKeyBind) then
        TriggerEvent("jg-advancedgarages:client:" .. insertEvent, id)
      end
    else
      sleep = 0
      showDrawText(id, isImpound and Config.OpenImpoundPrompt or Config.OpenGaragePrompt)
      if IsControlJustPressed(0, isImpound and Config.OpenImpoundKeyBind or Config.OpenGarageKeyBind) then
        TriggerEvent("jg-advancedgarages:client:" .. openEvent, id)
      end
    end
  else
    hideDrawText(id)
  end
end

local function createToggleThread(func)
  CreateThread(function()
    while true do
      sleep = 1000
      func()
      Wait(sleep)
    end
  end)
end

-- Public & Private garages
createToggleThread(function()
  for id, garage in pairs(Globals.Garages) do
    if garage and not garage.job and not garage.gang then
      toggleDrawText(id, garage.coords, garage.distance, "ShowGarage", "InsertVehicle", false)
      if not garage.hideMarkers and garage.markers then toggleMarker(garage.coords, garage.markers) end
    end
  end
end)

-- Job garages
createToggleThread(function()
  local playerJob = Framework.Client.GetPlayerJob().name

  for id, garage in pairs(Config.JobGarageLocations) do
    if garage.job == playerJob then
      if garage.vehiclesType == "personal" then
        toggleDrawText(id, garage.coords, garage.distance, "ShowGarage", "InsertVehicle", false)
        if not garage.hideMarkers and garage.markers then toggleMarker(garage.coords, garage.markers) end
      else
        toggleDrawText(id, garage.coords, garage.distance, "ShowJobGarage", "JobGarageInsertVehicle", false)
        if not garage.hideMarkers and garage.markers then toggleMarker(garage.coords, garage.markers) end
      end
    end
  end
end)

-- Gang garages
if Config.Framework == "QBCore" then
  createToggleThread(function()
    local playerGang = Framework.Client.GetPlayerGang().name

    for id, garage in pairs(Config.GangGarageLocations) do
      if garage.gang == playerGang then
        if garage.vehiclesType == "personal" then
          toggleDrawText(id, garage.coords, garage.distance, "ShowGarage", "InsertVehicle", false)
          if not garage.hideMarkers and garage.markers then toggleMarker(garage.coords, garage.markers) end
        else
          toggleDrawText(id, garage.coords, garage.distance, "ShowGangGarage", "GangGarageInsertVehicle", false)
          if not garage.hideMarkers and garage.markers then toggleMarker(garage.coords, garage.markers) end
        end
      end
    end
  end)
end

-- Impound
createToggleThread(function()
  for id, impound in pairs(Config.ImpoundLocations) do
    toggleDrawText(id, impound.coords, impound.distance, "ShowImpound", nil, true)
    if not impound.hideMarkers and impound.markers then toggleMarker(impound.coords, impound.markers) end
  end
end)

