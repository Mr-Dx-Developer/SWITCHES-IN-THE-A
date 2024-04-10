local spawnedPlaceableEnt = nil

RegisterNetEvent('rcore_basketball:startPlacingHoop', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    local hoop = SpawnPlaceableProp(coords)
    spawnedPlaceableEnt = hoop

    local savedHoopPos, savedHoopQuat = nil, nil

    while true do
        DisableControlAction(0, Config.Controls.EXIT.key, true)
        if IsDisabledControlJustPressed(0, Config.Controls.EXIT.key) then
            DeleteEntity(spawnedPlaceableEnt)
            spawnedPlaceableEnt = nil
            return
        end

        if not savedHoopPos then
            local hoopPos, hoopQuat = HandlePropPlacement(ped, hoop)

            if not hoopPos then
                SubtitleText(Config.Text.PLACE_AIM)
            else
                DisplayHelpTextThisFrame('RC_BASK_P1')

                if IsControlJustPressed(0, Config.Controls.CHECKPOINT_INTERACT.key) or IsDisabledControlJustPressed(0, Config.Controls.CHECKPOINT_INTERACT.key) then
                    savedHoopPos, savedHoopQuat = hoopPos, hoopQuat
                end
            end
        else
            local groundPos = HandleGroundPosPlacement(ped)

            if #(groundPos - savedHoopPos) < 8.0 then
                DisplayHelpTextThisFrame('RC_BASK_P1')
                DrawSimpleMarker(
                    groundPos, 
                    Config.Marker.Scale, 
                    255, 0, 0, 150
                )


                if IsControlJustPressed(0, Config.Controls.CHECKPOINT_INTERACT.key) or IsDisabledControlJustPressed(0, Config.Controls.CHECKPOINT_INTERACT.key) then
                    TriggerServerEvent('rcore_basketball:placeHoop', savedHoopPos, savedHoopQuat, groundPos)
                    DeleteEntity(spawnedPlaceableEnt)
                    spawnedPlaceableEnt = nil
                    return
                end
            else
                SubtitleText(Config.Text.PLACE_TOO_FAR)
            end
        end

        Wait(0)
    end
end)

function HandleGroundPosPlacement(ped)
    local coords = GetEntityCoords(ped)
    local found, z = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, false)

    if found then 
        return vector3(coords.x, coords.y, z)
    end

    return nil
end

function HandlePropPlacement(ped, hoop)
    local worldVector, normalVector = GetWorldCoordFromScreenCoord(0.52, 0.3)

    local ray = StartExpensiveSynchronousShapeTestLosProbe(
        worldVector.x, 
        worldVector.y, 
        worldVector.z, 
        worldVector.x + normalVector.x*15, 
        worldVector.y + normalVector.y*15, 
        worldVector.z + normalVector.z*15, 
        1 + 16, 
        PlayerPedId(), 
        4
    )

    local retval, hit, endCoords, surfaceNormal, materialHash, entityHit = GetShapeTestResultIncludingMaterial(ray)
    ReleaseScriptGuidFromEntity(entityHit)

	if hit == 1 and #(GetEntityCoords(ped) - endCoords) < 8.0 then
        local heading = GetHeadingFromVector_2d(surfaceNormal.x, surfaceNormal.y) + 180
        SetEntityCoordsNoOffset(hoop, endCoords.x + surfaceNormal.x*0.05, endCoords.y + surfaceNormal.y*0.05, endCoords.z + surfaceNormal.z*0.05, false, false, false)
        SetEntityRotation(hoop, 0.0, 0.0, heading, 2, 0)

        local qx, qy, qz, qw = GetEntityQuaternion(hoop)
        return GetEntityCoords(hoop), vector4(qx, qy, qz, qw)
    end

    local pedCoords = GetEntityCoords(ped)
    SetEntityCoordsNoOffset(hoop, pedCoords.x, pedCoords.y, pedCoords.z - 100, false, false, false)

    return nil
end

function SpawnPlaceableProp(pedCoords)
    local hoop = CreateObject('prop_basketball_net2', pedCoords.x, pedCoords.y, pedCoords.z+50.0, false, false, false)
    SetEntityCollision(hoop, false, false)
    SetEntityAlpha(hoop, 180, true)

    return hoop
end

AddEventHandler('onResourceStop', function(name)
    if GetCurrentResourceName() == name then
        if spawnedPlaceableEnt then
            DeleteEntity(spawnedPlaceableEnt)
        end
    end
end)

RegisterNetEvent('rcore_basketball:setPlacedHoop', function(idx, data)
    
	if data.State == nil then data.State = nil end
	if data.Model == nil then data.Model = `prop_basketball_net2` end
	if data.IsSubscribed == nil then data.IsSubscribed = false end
    if data.spawn == nil then data.spawn = true end
	if data.threePointFwdDist == nil then data.threePointFwdDist = 0.0 end
	if data.threePointSideDist == nil then data.threePointSideDist = 0.0 end
	if data.threePointRadius == nil then data.threePointRadius = 30.35 end

    BasketballHoops[idx] = data
end)

RegisterNetEvent('rcore_basketball:removePlacedHoop', function(idx)
    BasketballHoops[idx].destroy = true
end)


CreateThread(function()
    while (not HasCollisionLoadedAroundEntity(PlayerPedId())) do
        Citizen.Wait(500)
    end
    
    TriggerServerEvent('rcore_basketball:loadPlacedHoops')
end)