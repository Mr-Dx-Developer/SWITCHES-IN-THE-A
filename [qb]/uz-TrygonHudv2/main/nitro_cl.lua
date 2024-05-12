

--
local particles = {}
local vehicles2 = {}
local particles2 = {}
local NitroVeh = nil
--


Citizen.CreateThread(function()
   while true do
       Citizen.Wait(500) -- Kontrol sıklığını ayarlayabilirsiniz
       local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
       local plate = GetVehicleNumberPlateText(vehicle)
       if NitroVeh ~= nil and NitroVeh[plate] ~= nil then -- NitroVeh ve nitro miktarı kontrolü
           local nitroAmount = NitroVeh[plate]

           SendNUIMessage({
            action = 'NOSS',
            noss = math.ceil(nitroAmount),
         })

           print('Araç ' .. plate .. ' nitro miktarı: ' .. nitroAmount)
       end
   end
end)



RegisterNetEvent('SetupNitro', function()
  local Vehicle = GetVehicleInDirection() 
  if IsPedSittingInAnyVehicle(PlayerPed) then
    -- Soon
  else
    if Vehicle ~= nil and DoesEntityExist(Vehicle) and IsPedOnFoot(PlayerPed) then
      TaskStartScenarioInPlace(PlayerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
      Citizen.SetTimeout(5500, function()
        ClearPedTasksImmediately(PlayerPed)
        TriggerServerEvent('RemoveNitroItem', GetVehicleNumberPlateText(Vehicle))
      end)
    else
      -- Soon
    end
  end
end)


RegisterNetEvent('UpdateData')
AddEventHandler('UpdateData', function(Get)
  print(json.encode(Get))
   NitroVeh = Get
end)




function GetVehicleInDirection()
   PlayerPed = PlayerPedId()
   local playerCoords = GetEntityCoords(PlayerPed)
   local inDirection  = GetOffsetFromEntityInWorldCoords(PlayerPed, 0.0, 5.0, 0.0)
   local rayHandle    = StartShapeTestRay(playerCoords, inDirection, 10, PlayerPed, 0)
   local numRayHandle, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)

   if hit == 1 and GetEntityType(entityHit) == 2 then
      return entityHit
   end

   return nil
end


RegisterKeyMapping('nitros', 'Toggle Nitro', 'keyboard', Config.NitroControl)

local isPressing = false
RegisterCommand('nitros', function()
local playerPed = PlayerPedId()
local vehicle = GetVehiclePedIsIn(playerPed, false)
local plate = GetVehicleNumberPlateText(vehicle)

if vehicle == 0 or NitroVeh[plate] == nil or tonumber(NitroVeh[plate]) <= 0 then
   return
end

isPressing = not isPressing
SetVehicleNitroBoostEnabled(vehicle, isPressing)
SetVehicleLightTrailEnabled(vehicle, isPressing)
SetVehicleNitroPurgeEnabled(vehicle, isPressing)
SetVehicleEnginePowerMultiplier(vehicle, isPressing and 55.0 or 1.0)

if isPressing then
   Citizen.CreateThread(function()
   while isPressing and GetPedInVehicleSeat(vehicle, -1) == playerPed do
      Citizen.Wait(400)
      NitroVeh[plate] = math.max(0, NitroVeh[plate] - Config.RemoveNitroOnpress)
      if tonumber(NitroVeh[plate]) <= 0 then
         isPressing = false
         SetVehicleNitroBoostEnabled(vehicle, false)
         SetVehicleLightTrailEnabled(vehicle, false)
         SetVehicleNitroPurgeEnabled(vehicle, false)
         SetVehicleEnginePowerMultiplier(vehicle, 1.0)
         TriggerServerEvent('UpdateNitro', plate, NitroVeh[plate])
         break
      end
   end
   end)
else
   TriggerServerEvent('UpdateNitro', plate, NitroVeh[plate])
end
end)


function CreateVehicleExhaustBackfire(vehicle, scale)
   local exhaustNames = {
      "exhaust",    "exhaust_2",  "exhaust_3",  "exhaust_4",
      "exhaust_5",  "exhaust_6",  "exhaust_7",  "exhaust_8",
      "exhaust_9",  "exhaust_10", "exhaust_11", "exhaust_12",
      "exhaust_13", "exhaust_14", "exhaust_15", "exhaust_16"
   }

   for _, exhaustName in ipairs(exhaustNames) do
      local boneIndex = GetEntityBoneIndexByName(vehicle, exhaustName)

      if boneIndex ~= -1 then
         local pos = GetWorldPositionOfEntityBone(vehicle, boneIndex)
         local off = GetOffsetFromEntityGivenWorldCoords(vehicle, pos.x, pos.y, pos.z)

         UseParticleFxAssetNextCall('core')
         StartParticleFxNonLoopedOnEntity('veh_backfire', vehicle, off.x, off.y, off.z, 0.0, 0.0, 0.0, scale, false, false, false)
      end
   end
end

function CreateVehiclePurgeSpray(vehicle, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale)
   UseParticleFxAssetNextCall('core')
   return StartParticleFxLoopedOnEntity('ent_sht_steam', vehicle, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale, false, false, false)
end

function CreateVehicleLightTrail(vehicle, bone, scale)
   UseParticleFxAssetNextCall('core')
   local ptfx = StartParticleFxLoopedOnEntityBone('veh_light_red_trail', vehicle, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, bone, scale, false, false, false)
   SetParticleFxLoopedEvolution(ptfx, "speed", 1.0, false)
   return ptfx
end

function StopVehicleLightTrail(ptfx, duration)
   Citizen.CreateThread(function()
   local startTime = GetGameTimer()
   local endTime = GetGameTimer() + duration
   while GetGameTimer() < endTime do
      Citizen.Wait(0)
      local now = GetGameTimer()
      local scale = (endTime - now) / duration
      SetParticleFxLoopedScale(ptfx, scale)
      SetParticleFxLoopedAlpha(ptfx, scale)
   end
   StopParticleFxLooped(ptfx)
   end)
end

function IsVehicleLightTrailEnabled(vehicle)
   return vehicles2[vehicle] == true
end

function SetVehicleLightTrailEnabled(vehicle, enabled)
   if IsVehicleLightTrailEnabled(vehicle) == enabled then
      return
   end

   if enabled then
      local ptfxs = {}

      local leftTrail = CreateVehicleLightTrail(vehicle, GetEntityBoneIndexByName(vehicle, "taillight_l"), 1.0)
      local rightTrail = CreateVehicleLightTrail(vehicle, GetEntityBoneIndexByName(vehicle, "taillight_r"), 1.0)

      table.insert(ptfxs, leftTrail)
      table.insert(ptfxs, rightTrail)

      vehicles2[vehicle] = true
      particles2[vehicle] = ptfxs
   else
      if particles2[vehicle] and #particles2[vehicle] > 0 then
         for _, particleId in ipairs(particles2[vehicle]) do
            StopVehicleLightTrail(particleId, 500)
         end
      end

      vehicles2[vehicle] = nil
      particles2[vehicle] = nil
   end
end
function SetVehicleNitroBoostEnabled(vehicle, enabled)


   if IsPedInVehicle(PlayerPedId(), vehicle) then
      SetNitroBoostScreenEffectsEnabled(enabled)
   end

   SetVehicleBoostActive(vehicle, enabled)
end
function IsVehicleNitroPurgeEnabled(vehicle)
   return NitroVeh[vehicle] == true
end
function SetVehicleNitroPurgeEnabled(vehicle, enabled)
   if IsVehicleNitroPurgeEnabled(vehicle) == enabled then
      return
   end
   if enabled then
      local bone = GetEntityBoneIndexByName(vehicle, 'bonnet')
      local pos = GetWorldPositionOfEntityBone(vehicle, bone)
      local off = GetOffsetFromEntityGivenWorldCoords(vehicle, pos.x, pos.y, pos.z)
      local ptfxs = {}

      for i=0,3 do
         local leftPurge = CreateVehiclePurgeSpray(vehicle, off.x - 0.5, off.y + 0.05, off.z, 40.0, -20.0, 0.0, 0.5)
         local rightPurge = CreateVehiclePurgeSpray(vehicle, off.x + 0.5, off.y + 0.05, off.z, 40.0, 20.0, 0.0, 0.5)

         table.insert(ptfxs, leftPurge)
         table.insert(ptfxs, rightPurge)
      end

      NitroVeh[vehicle] = true
      particles[vehicle] = ptfxs
   else
      if particles[vehicle] and #particles[vehicle] > 0 then
         for _, particleId in ipairs(particles[vehicle]) do
            StopParticleFxLooped(particleId)
         end
      end

      NitroVeh[vehicle] = nil
      particles[vehicle] = nil
   end
end
function SetNitroBoostScreenEffectsEnabled(enabled)
   if enabled then
      StartScreenEffect('RaceTurbo', 0, false)
      SetTimecycleModifier('rply_motionblur')
      ShakeGameplayCam('SKY_DIVING_SHAKE', 0.30)
      TriggerServerEvent("InteractSound_SV:PlayOnSource", "nitro", 0.5)
   else
      StopScreenEffect('RaceTurbo')
      StopGameplayCamShaking(true)
      SetTransitionTimecycleModifier('default', 0.35)
   end
end