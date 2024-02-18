nitro = {}
local vehicles = {}
local particles = {}
local vehicles2 = {}
local particles2 = {}
if Config.EnableNitro then

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
      return vehicles[vehicle] == true
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

        vehicles[vehicle] = true
        particles[vehicle] = ptfxs
      else
        if particles[vehicle] and #particles[vehicle] > 0 then
          for _, particleId in ipairs(particles[vehicle]) do
            StopParticleFxLooped(particleId)
          end
        end

        vehicles[vehicle] = nil
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
    function GetVehicleInDirection()

        local playerCoords = GetEntityCoords(playerPed)
        local inDirection  = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 5.0, 0.0)
        local rayHandle    = StartShapeTestRay(playerCoords, inDirection, 10, playerPed, 0)
        local numRayHandle, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
    
        if hit == 1 and GetEntityType(entityHit) == 2 then
            return entityHit
        end
    
        return nil
    end
    RegisterNetEvent('codem-blvckhudv2:SetupNitro')
    AddEventHandler('codem-blvckhudv2:SetupNitro', function()
        local vehicle = GetVehicleInDirection() 
        if IsPedSittingInAnyVehicle(playerPed) then
            Config.Notification(Config.Notifications["cant_install_nitro"]["message"], Config.Notifications["cant_install_nitro"]["type"])
        else
            if vehicle ~= nil and DoesEntityExist(vehicle) and IsPedOnFoot(playerPed) then
                TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                Citizen.CreateThread(function()
                    Citizen.Wait(5000)
                    ClearPedTasksImmediately(playerPed)
                    TriggerServerEvent('codem-blvckhudv2:RemoveItem',Config.NitroItem, 1)
                    TriggerServerEvent('codem-blvckhudv2:InstallNitro', GetVehicleNumberPlateText(vehicle))
                end)
            else
                Config.Notification(Config.Notifications["no_veh_nearby"]["message"], Config.Notifications["no_veh_nearby"]["type"])
            end
        end
    end)
    RegisterNetEvent('codem-blvckhudv2:UpdateNitroData')
    AddEventHandler('codem-blvckhudv2:UpdateNitroData', function(nitroData)
        nitro = nitroData
    
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        if playerVeh ~= 0 and nitro[GetVehicleNumberPlateText(playerVeh)] ~= nil then
            SendNUIMessage({ type="set_status",       statustype = "nitro", value = nitro[GetVehicleNumberPlateText(playerVeh)]})
        end
    end)
    
    local isPressing = false
    RegisterCommand('+nitro', function()
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        isPressing = true
        if playerVeh ~= 0 and nitro[GetVehicleNumberPlateText(playerVeh)] ~= nil then
            if tonumber(nitro[GetVehicleNumberPlateText(playerVeh)]) > 0 then
                if GetPedInVehicleSeat(playerVeh, -1) == playerPed then
                    while isPressing do
                        playerVeh = GetVehiclePedIsIn(playerPed, false)
                        if tonumber(nitro[GetVehicleNumberPlateText(playerVeh)]) <= 0 then
                            if  tonumber(nitro[GetVehicleNumberPlateText(playerVeh)]) < 0 then
                                nitro[GetVehicleNumberPlateText(playerVeh)] = 0
                            end
                            isPressing = false
                            SetVehicleNitroBoostEnabled(playerVeh, false)
                            SetVehicleLightTrailEnabled(playerVeh, false)
                            SetVehicleNitroPurgeEnabled(playerVeh, false)     
				            SetVehicleEnginePowerMultiplier(playerVeh,1.0)

                            TriggerServerEvent('codem-blvckhudv2:UpdateNitro', GetVehicleNumberPlateText(playerVeh), nitro[GetVehicleNumberPlateText(playerVeh)])
                            break
    
                        end
                        if playerVeh == 0 then
                            isPressing = false
				            SetVehicleEnginePowerMultiplier(playerVeh,1.0)

                            SetVehicleNitroBoostEnabled(playerVeh, false)
                            SetVehicleLightTrailEnabled(playerVeh, false)
                            SetVehicleNitroPurgeEnabled(playerVeh, false)                            
                            TriggerServerEvent('codem-blvckhudv2:UpdateNitro', GetVehicleNumberPlateText(playerVeh), nitro[GetVehicleNumberPlateText(playerVeh)])
                            break
                        end
                        if GetPedInVehicleSeat(playerVeh, -1) == playerPed then
                            local force = Config.NitroForce
                            nitro[GetVehicleNumberPlateText(playerVeh)] = nitro[GetVehicleNumberPlateText(playerVeh)] - Config.RemoveNitroOnpress
                            SendNUIMessage({ type="set_status",       statustype = "nitro", value = nitro[GetVehicleNumberPlateText(playerVeh)]})
                           
                            SetVehicleNitroBoostEnabled(playerVeh, true)
                            SetVehicleLightTrailEnabled(playerVeh, true)
                            SetVehicleNitroPurgeEnabled(playerVeh, true)
                            CreateVehicleExhaustBackfire(playerVeh, 1.25)
	                        SetVehicleEnginePowerMultiplier(playerVeh,55.0)	
                        else
                            SetVehicleNitroBoostEnabled(playerVeh, false)
                            SetVehicleLightTrailEnabled(playerVeh, false)
                            SetVehicleNitroPurgeEnabled(playerVeh, false)
				            SetVehicleEnginePowerMultiplier(playerVeh,1.0)

                            isPressing = false
                            TriggerServerEvent('codem-blvckhudv2:UpdateNitro', GetVehicleNumberPlateText(playerVeh), nitro[GetVehicleNumberPlateText(playerVeh)])
    
                            break
                        end
                        Citizen.Wait(400)
                    end
                end
            end
        end
    end)
    RegisterCommand('-nitro', function()
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        if playerVeh ~= 0 and nitro[GetVehicleNumberPlateText(playerVeh)] ~= nil  then
            if GetPedInVehicleSeat(playerVeh, -1) == playerPed then
                isPressing = false
                SetVehicleNitroBoostEnabled(playerVeh, false)
                SetVehicleLightTrailEnabled(playerVeh, false)
                SetVehicleNitroPurgeEnabled(playerVeh, false)          
				SetVehicleEnginePowerMultiplier(playerVeh,1.0)
                         
                SendNUIMessage({ type="set_status",       statustype = "nitro", value = nitro[GetVehicleNumberPlateText(playerVeh)]})
                TriggerServerEvent('codem-blvckhudv2:UpdateNitro', GetVehicleNumberPlateText(playerVeh), nitro[GetVehicleNumberPlateText(playerVeh)])
            end
        else
            SendNUIMessage({ type="set_status",       statustype = "nitro", value = 0})
        end
    end)
    
    RegisterKeyMapping('+nitro', 'Toggle Nitro', 'keyboard',  Config.NitroKey)
    
    
end
