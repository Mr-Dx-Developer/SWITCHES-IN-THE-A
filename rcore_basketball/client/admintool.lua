local spawnedHoop = nil

local MOVE_LEFT = 'MOVE_LEFT'
local MOVE_RIGHT = 'MOVE_RIGHT'
local MOVE_FORWARD = 'MOVE_FORWARD'
local MOVE_BACKWARD = 'MOVE_BACKWARD'
local MOVE_UP = 'MOVE_UP'
local MOVE_DOWN = 'MOVE_DOWN'
local ROTATE_LEFT = 'ROTATE_LEFT'
local ROTATE_RIGHT = 'ROTATE_RIGHT'

RegisterNetEvent('rcore_basketball:admintool', function()
    if spawnedHoop then
        return
    end

    RequestModel(`prop_basketball_net`)

	while not HasModelLoaded(`prop_basketball_net`) do
		Wait(0)
	end

    local ped = PlayerPedId()
    
    local _, camNormal = GetWorldCoordFromScreenCoord(0.5, 0.5)
    local spawnCamFwdPos = vector3(camNormal.x, camNormal.y, 0.0)
    spawnCamFwdPos = spawnCamFwdPos/#spawnCamFwdPos
    local hoopSpawnPos = GetEntityCoords(ped) + spawnCamFwdPos * 2

    spawnedHoop = CreateObject(
        `prop_basketball_net`, 
        hoopSpawnPos.x, hoopSpawnPos.y, hoopSpawnPos.z - 1.0, 
        false, false, false
    )
    SetEntityCollision(spawnedHoop, false, false)
    FreezeEntityPosition(spawnedHoop, true)
    SetEntityAlpha(spawnedHoop, 0, true)
    SetEntityVisible(spawnedHoop, false, 0)

    local pedHead = GetHeadingFromVector_2d(camNormal.x, camNormal.y)
    SetEntityRotation(spawnedHoop, 0.0, 0.0, pedHead, 2, 0)

    while true do
        Wait(0)

        RenderInstructions()

        local moveSpeed = 1

        if IsControlPressed(0, 19) or IsDisabledControlPressed(0, 19) then
            moveSpeed = 0.3
        end


        local resolvedMovement = ResolveMovement()

        local hoopCoords = GetEntityCoords(spawnedHoop)
        local hoopRotation = GetEntityRotation(spawnedHoop, 2)
        
        RenderHoopInConfig(spawnedHoop, hoopCoords)

        _, camNormal = GetWorldCoordFromScreenCoord(0.5, 0.5)

        fwdPos = vector3(camNormal.x, camNormal.y, 0.0)

        if resolvedMovement == MOVE_LEFT then
            hoopCoords = hoopCoords + vector3(-fwdPos.y, fwdPos.x, 0.0) * GetFrameTime() * moveSpeed
        elseif resolvedMovement == MOVE_RIGHT then
            hoopCoords = hoopCoords - vector3(-fwdPos.y, fwdPos.x, 0.0) * GetFrameTime() * moveSpeed
        elseif resolvedMovement == MOVE_FORWARD then
            hoopCoords = hoopCoords + fwdPos * GetFrameTime() * moveSpeed
        elseif resolvedMovement == MOVE_BACKWARD then
            hoopCoords = hoopCoords - fwdPos * GetFrameTime() * moveSpeed
        elseif resolvedMovement == MOVE_UP then
            hoopCoords = hoopCoords + vector3(0.0, 0.0, 1.0) * GetFrameTime() * moveSpeed
        elseif resolvedMovement == MOVE_DOWN then
            hoopCoords = hoopCoords - vector3(0.0, 0.0, 1.0) * GetFrameTime() * moveSpeed
        elseif resolvedMovement == ROTATE_LEFT then
            hoopRotation = hoopRotation - vector3(0.0, 0.0, 45.0) * GetFrameTime() * moveSpeed
        elseif resolvedMovement == ROTATE_RIGHT then
            hoopRotation = hoopRotation + vector3(0.0, 0.0, 45.0) * GetFrameTime() * moveSpeed
        end

        SetEntityCoordsNoOffset(spawnedHoop, hoopCoords)
        SetEntityRotation(spawnedHoop, hoopRotation.x, hoopRotation.y, hoopRotation.z, 2)

        if IsControlJustPressed(0, 176) or IsDisabledControlJustPressed(0, 176) then -- enter
            local qx, qy, qz, qw = GetEntityQuaternion(spawnedHoop)
            TriggerServerEvent('rcore_basketball:printConfig', hoopCoords, vector4(qx, qy, qz, qw))
            DeleteObject(spawnedHoop)
            spawnedHoop = nil
            return
        elseif IsControlJustPressed(0, 177) or IsDisabledControlJustPressed(0, 177) then -- backspace
            DeleteObject(spawnedHoop)
            spawnedHoop = nil
            return
        end
    end
end)

function RenderHoopInConfig(hoopObj, hoopCoords)
    local qx, qy, qz, qw = GetEntityQuaternion(hoopObj)
    local hoopPos, hoopRadius, hoopPlanePoint, hoopPlaneNormal, hoopPlaneNormalLeft, hoopPlaneNormalUp, hoopHeading = GetBasketHoopDimensions(`prop_basketball_net`, hoopCoords, vector4(qx, qy, qz, qw))


    local backboardTopLeft = hoopPlanePoint + hoopPlaneNormalLeft/2 + hoopPlaneNormalUp/2
    local backboardBottomLeft = hoopPlanePoint + hoopPlaneNormalLeft/2 - hoopPlaneNormalUp * 0.2
    
    local backboardTopRight = hoopPlanePoint - hoopPlaneNormalLeft/2 + hoopPlaneNormalUp/2
    local backboardBottomRight = hoopPlanePoint - hoopPlaneNormalLeft/2 - hoopPlaneNormalUp * 0.2

    DrawPoly(
        backboardTopLeft, 
        backboardBottomRight, 
        backboardBottomLeft, 
        255, 0, 0, 100
    )
    DrawPoly(
        backboardTopLeft, 
        backboardBottomLeft, 
        backboardBottomRight, 
        255, 0, 0, 100
    )
    

    DrawPoly(
        backboardTopLeft, 
        backboardBottomRight, 
        backboardTopRight, 
        255, 0, 0, 100
    )
    DrawPoly(
        backboardTopLeft, 
        backboardTopRight, 
        backboardBottomRight, 
        255, 0, 0, 100
    )


    local topVertices = ComputeHoopVertices(hoopPos, hoopRadius, 0.02, 0, 0.0)
    local midVertices = ComputeHoopVertices(hoopPos, hoopRadius, -0.08 + 0.02, 10, -0.225)
    local botVertices = ComputeHoopVertices(hoopPos, hoopRadius, -0.11 + 0.02, 20, -0.45)

    RenderHoopNet(
        hoopPos,
        -1,
        0, 
        0, 
        topVertices, midVertices, botVertices, {255, 255, 255, 200}
    )
end

function ResolveMovement()
    local isShift = IsControlPressed(0, 21) or IsDisabledControlPressed(0, 21)

    if isShift and (IsControlPressed(0, 174) or IsDisabledControlPressed(0, 174)) then	--ARROW LEFT
        return ROTATE_LEFT
    end

    if isShift and (IsControlPressed(0, 175) or IsDisabledControlPressed(0, 175)) then	--ARROW RIGHT
        return ROTATE_RIGHT
    end

    if not isShift and (IsControlPressed(0, 172) or IsDisabledControlPressed(0, 172)) then	--ARROW UP
        return MOVE_FORWARD
    end

    if not isShift and (IsControlPressed(0, 173) or IsDisabledControlPressed(0, 173)) then	--ARROW DOWN
        return MOVE_BACKWARD
    end

    if not isShift and (IsControlPressed(0, 174) or IsDisabledControlPressed(0, 174)) then	--ARROW LEFT
        return MOVE_LEFT
    end

    if not isShift and (IsControlPressed(0, 175) or IsDisabledControlPressed(0, 175)) then	--ARROW RIGHT
        return MOVE_RIGHT
    end
    
    if (IsControlPressed(0, 97) or IsDisabledControlPressed(0, 97)) then	-- NUM+
        return MOVE_DOWN
    end
    
    if (IsControlPressed(0, 96) or IsDisabledControlPressed(0, 96)) then	-- NUM-
        return MOVE_UP
    end
end

Citizen.CreateThread(function()
    local instLines = {
        '~y~Left Arrow~s~ Left',
        '~y~Right Arrow~s~ Right',
        '~y~Shift + Left Arrow~s~ Rotate Left',
        '~y~Shift + Right Arrow~s~ Rotate Right',
        '~y~Up Arrow~s~ Forward',
        '~y~Down Arrow~s~ Back',
        '~y~+~s~ Up',
        '~y~-~s~ Down',
        '~y~Backspace~s~ Close',
        '~y~Enter~s~ Confirm',
    }

    AddTextEntry('B_AT_INS', table.concat(instLines, '~n~'))
end)

function RenderInstructions()
    SetTextScale(0.7, 0.7)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("B_AT_INS")
    SetTextOutline()
    DrawText(0.7,0.4)
end

AddEventHandler('onResourceStop', function(name)
    if GetCurrentResourceName() == name then
        if spawnedHoop then
            DeleteEntity(spawnedHoop)
        end
    end
end)