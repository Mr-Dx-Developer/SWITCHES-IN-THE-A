--[[
	Custom license
	Copyright (c) 2021 Philipp Decker /// FiveM: Kiminaze / Discord: Kiminaze#9097
	By acquiring a copy of this code snippet for the "FiveM" modification for "Grand Theft 
	Auto V" you are granted permission to use and modify all of its parts.
	You are allowed to (re-)distribute and sell resources that have been created with the 
	help of this code snippet. You have to include this license when doing so.
	This code snippet is provided "as is" and the copyright holder of this code snippet can 
	not be held accountable for any damages occuring during the usage or modification of 
	this code snippet.
	For ease-of-use I suggest just dropping this file into any of your resources without 
	modifying it. More information on how to use this can be found in the README that is 
	distributed with this file.
--]] --
local isDebug = false

local function Log(text)
  if (isDebug) then
    print(text)
  end
end

local MAX_DEFORM_ITERATIONS = 50 -- iterations for damage application
local DEFORMATION_DAMAGE_THRESHOLD = 0.05 -- the minimum damage value at a deformation point

function Functions.GetVehicleDeformation(vehicle)
  assert(vehicle ~= nil and DoesEntityExist(vehicle), "Parameter \"vehicle\" must be a valid vehicle entity!")

  -- check vehicle size and pre-calc values for offsets
  local min, max = GetModelDimensions(GetEntityModel(vehicle))
  local X = (max.x - min.x) * 0.5
  local Y = (max.y - min.y) * 0.5
  local Z = (max.z - min.z) * 0.5
  local halfY = Y * 0.5

  -- offsets for deformation check
  local positions = {vector3(-X, Y, 0.0), vector3(-X, Y, Z), vector3(0.0, Y, 0.0), vector3(0.0, Y, Z), vector3(X, Y, 0.0), vector3(X, Y, Z), vector3(-X, halfY, 0.0), vector3(-X, halfY, Z), vector3(0.0, halfY, 0.0), vector3(0.0, halfY, Z), vector3(X, halfY, 0.0), vector3(X, halfY, Z),
                     vector3(-X, 0.0, 0.0), vector3(-X, 0.0, Z), vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, Z), vector3(X, 0.0, 0.0), vector3(X, 0.0, Z), vector3(-X, -halfY, 0.0), vector3(-X, -halfY, Z), vector3(0.0, -halfY, 0.0), vector3(0.0, -halfY, Z), vector3(X, -halfY, 0.0),
                     vector3(X, -halfY, Z), vector3(-X, -Y, 0.0), vector3(-X, -Y, Z), vector3(0.0, -Y, 0.0), vector3(0.0, -Y, Z), vector3(X, -Y, 0.0), vector3(X, -Y, Z)}

  -- get deformation from vehicle
  local deformationPoints = {}
  for i, pos in ipairs(positions) do
    -- translate damage from vector3 to a float
    local dmg = #(GetVehicleDeformationAtPos(vehicle, pos))
    if (dmg > DEFORMATION_DAMAGE_THRESHOLD) then
      table.insert(deformationPoints, {pos, dmg})
    end
  end

  Log("Got " .. tostring(#deformationPoints) .. " deformation point" .. (#deformationPoints == 1 and "" or "s") .. " from \"" .. tostring(GetVehicleNumberPlateText(vehicle)) .. "\"")

  return {
    deformation = deformationPoints,
    dirt = GetVehicleDirtLevel(vehicle)
  }
end

function Functions.SetVehicleDeformation(vehicle, deformation, callback)
  assert(vehicle ~= nil and DoesEntityExist(vehicle), "Parameter \"vehicle\" must be a valid vehicle entity!")
  assert(deformation ~= nil and type(deformation) == "table", "Parameter \"deformation\" must be a table!")

  local deformationPoints = deformation.deformation
  local dirt = deformation.dirt

  Citizen.CreateThread(function()
    -- set radius and damage multiplier
    local min, max = GetModelDimensions(GetEntityModel(vehicle))
    local radius = #(max - min) * 40.0 -- might need some more experimentation
    local damageMult = #(max - min) * 30.0 -- might need some more experimentation

    local printMsg = false

    for i, def in ipairs(deformationPoints) do
      def[1] = vector3(def[1].x, def[1].y, def[1].z)
    end

    -- iterate over all deformation points and check if more than one application is necessary
    -- looping is necessary for most vehicles that have a really bad damage model or take a lot of damage (e.g. neon, phantom3)
    local deform = true
    local iteration = 0
    while (deform and iteration < MAX_DEFORM_ITERATIONS) do
      if (not DoesEntityExist(vehicle)) then
        Log("Vehicle \"" .. tostring(GetVehicleNumberPlateText(vehicle)) .. "\" got deleted mid-deformation.")
        return
      end

      deform = false

      -- apply deformation if necessary
      for i, def in ipairs(deformationPoints) do
        if (#(GetVehicleDeformationAtPos(vehicle, def[1])) < def[2]) then
          SetVehicleDamage(vehicle, def[1] * 2.0, def[2] * damageMult, radius, true)

          deform = true

          if (not printMsg) then
            Log("Applying deformation to \"" .. tostring(GetVehicleNumberPlateText(vehicle)) .. "\"")

            printMsg = true
          end
        end
      end

      iteration = iteration + 1

      Citizen.Wait(100)
    end

    -- Apply dirt
    SetVehicleDirtLevel(vehicle, dirt)

    if (printMsg) then
      Log("Applying deformation finished for \"" .. tostring(GetVehicleNumberPlateText(vehicle)) .. "\"")
    end

    if (callback) then
      callback()
    end
  end)
end

--
-- Deformation Events
-- 

RegisterNetEvent("jg-advancedgarages:client:FixVehicle", function(vehicle)
  if (DoesEntityExist(vehicle) and NetworkGetEntityIsNetworked(vehicle)) then
    TriggerServerEvent("jg-advancedgarages:server:FixDamage", NetworkGetNetworkIdFromEntity(vehicle))
  end
end)

RegisterNetEvent("jg-advancedgarages:client:FixDamageClient", function(netId)
  local vehicle = NetworkGetEntityFromNetworkId(netId)

  if (DoesEntityExist(vehicle)) then
    SetVehicleDeformationFixed(vehicle)
  end
end)
