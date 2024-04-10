local cacheKey = nil
local cachePathPoints = nil
local cacheScoredTime = nil
local cacheComputedBallPathVertices = nil


function GetAimParameters(hoopDataPtr, hoopPlanePos, hoopPlaneNormal, hoopPlaneNormalLeft, hoopPlaneNormalUp, hoopPos, hoopRadius, hoopHeading)
    WantedInstructionalState = INSTRUCT_THROW

    TriggerEvent('rcore_basketball:startAim')

    local ballStartPos = nil
    local throwDestination = nil
    local throwVector = nil
    local strengthOffset = 0.0

    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local headVec = hoopPos - pedCoords
    local heading = GetHeadingFromVector_2d(headVec.x, headVec.y)

    if IsEntityPlayingAnim(ped, 'divined@bsktball@new', 'pickupball', 3) then
        TriggerEvent('rcore_basketball:stopAim')
        return
    end

    SetEntityCoordsNoOffset(PlayerPedId(), pedCoords.x, pedCoords.y, pedCoords.z)
    SetEntityHeading(PlayerPedId(), heading)

    while hoopDataPtr.State and hoopDataPtr.State.BallHolderServerId == MyServerId do
        local stopUpdating = not (IsControlPressed(0, Config.Controls.AIM_LOCK.key) or IsDisabledControlPressed(0, Config.Controls.AIM_LOCK.key))

        if stopUpdating or not ballStartPos then
            ballStartPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.2, 1.2)
        end

        local strStep = 0.5

        if IsControlPressed(0, Config.Controls.POWER_SPEED.key) or IsDisabledControlPressed(0, Config.Controls.POWER_SPEED.key) then
            strStep = 2.0
        end
        
        if IsControlJustPressed(0, Config.Controls.LOWER_POWER.keyHold) or IsDisabledControlJustPressed(0, Config.Controls.LOWER_POWER.keyHold) then
            strengthOffset = strengthOffset + strStep
        elseif IsControlJustPressed(0, Config.Controls.LOWER_POWER.key) or IsDisabledControlJustPressed(0, Config.Controls.LOWER_POWER.key) then
            strengthOffset = strengthOffset - strStep
        end

        DisableAllControlActions(0)
        EnableControlAction(0, 249, true)
        EnableControlAction(0, 245, true)

        EnableControlAction(0, 1, true) -- mouse
        EnableControlAction(0, 2, true) -- mouse
        
        DisplayHelpTextThisFrame('RC_BASK_ET')

        if IsDisabledControlJustPressed(0, Config.Controls.EXIT.key) then
            TriggerEvent('rcore_basketball:stopAim')
            return
        end

        local worldVector, normalVector = GetWorldCoordFromScreenCoord(0.52, 0.15)
        local aimFarPoint = worldVector + normalVector * 100
        local camPos = GetFinalRenderedCamCoord()

        if stopUpdating or not throwDestination then
            throwDestination = intersectPoint(aimFarPoint - camPos, camPos, hoopPlaneNormal, hoopPlanePos)
            throwDestination = ComputeBoundedThrowDestination(throwDestination, hoopPlaneNormal, hoopPlaneNormalLeft, hoopPlaneNormalUp, hoopPlanePos, hoopHeading)

            throwVector = throwDestination - ballStartPos
            throwVector = throwVector / #throwVector
        end
        

        local throwVector2d = throwVector.xy
        throwVector2d = throwVector2d / #throwVector2d

        -- local zDiff = math.max(-2.5, math.min(2.5, throwDestination.z - hoopPlanePos.z))
        local zDiff = throwDestination.z - hoopPlanePos.z
        local baseZ = 5 + (throwDestination.z - hoopPlanePos.z) * 2
        -- print(baseZ)

        local xyMultiplier = 8.0 + strengthOffset

        local finalThrowVelocity = vector3(
            throwVector2d.x,
            throwVector2d.y,
            baseZ / 12
        )
        finalThrowVelocity = finalThrowVelocity / #finalThrowVelocity
        finalThrowVelocity = finalThrowVelocity * xyMultiplier

        local newCacheKey = ComputeThrowCacheKey(ballStartPos, finalThrowVelocity)
        
        if cacheKey ~= newCacheKey then
            cachePathPoints, cacheScoredTime = SimulateThrow(hoopPos, ballStartPos, finalThrowVelocity, true)
            cacheComputedBallPathVertices = ComputeBallPathVertices(cachePathPoints)
            cacheKey = newCacheKey
        end

        -- if IsControlJustPressed(0, 24) or IsDisabledControlJustPressed(0, 24) then
        if IsControlJustPressed(0, Config.Controls.THROW.key) or IsDisabledControlJustPressed(0, Config.Controls.THROW.key) then
            WantedInstructionalState = INSTRUCT_NONE
            local optimizedPath, optimizedScoredTime = OptimizeThrow(hoopPos, ballStartPos, finalThrowVelocity, hoopDataPtr.State.Difficulty)

            if optimizedScoredTime then
                TriggerEvent('rcore_basketball:stopAim')
                return optimizedPath, optimizedScoredTime
            end
            
            -- necessary, coz previous call is optimized for viewing
            cachePathPoints, cacheScoredTime = SimulateThrow(hoopPos, ballStartPos, finalThrowVelocity, false)

            TriggerEvent('rcore_basketball:stopAim')
            return cachePathPoints, cacheScoredTime
        end

        -- RenderDebugPath(cachePathPoints, false, 255)
        if #cachePathPoints >= 2 then
            RenderBallPath(
                cacheComputedBallPathVertices,
                cachePathPoints[1].p
            )
        end
        
        Wait(0)
    end
    
    TriggerEvent('rcore_basketball:stopAim')
end

function ComputeThrowCacheKey(ballPos, velocity)
    return math.ceil(ballPos.x*100) .. '_' .. math.ceil(ballPos.y*100) .. '_' .. math.ceil(velocity.x*100) .. '_' .. math.ceil(velocity.y*100) .. '_' .. math.ceil(velocity.z*100) .. '_' .. math.ceil(GetGameTimer()/500)
end

function ComputeBoundedThrowDestination(throwDestination, hoopPlaneNormal, hoopPlaneNormalLeft, hoopPlaneNormalUp, hoopPlanePos, hoopHeading)
    -- s = dot(hoopPlaneNormal, throwDestination-hoopPlanePos)
    planeX = dot(hoopPlaneNormalLeft, throwDestination-hoopPlanePos)    
    planeZ = dot(hoopPlaneNormalUp, throwDestination-hoopPlanePos)

    planeX = math.max(-2.5, math.min(2.5, planeX))
    planeZ = math.max(-2.5, math.min(4.0, planeZ))

    -- local yMult = 1.0
    -- local zMult = 1.0

    -- if hoopHeading > 0 and hoopHeading < 90 then
    --     zMult = -1.0
    -- elseif hoopHeading > 90 and hoopHeading < 180 then
    -- elseif hoopHeading > 180 and hoopHeading < 270 then
    --     yMult = -1.0
    -- elseif hoopHeading > 270 and hoopHeading < 360 then
    --     zMult = -1.0
    --     yMult = -1.0
    -- else
    --     print("ERROR: Unsupported heading", hoopHeading)
    -- end

    -- xAxisVect = cross(hoopPlaneNormal, vector3(0.0, 0.0, zMult))
    -- zAxisVect = cross(hoopPlaneNormal, vector3(0.0, yMult, 0.0))


    return hoopPlanePos + hoopPlaneNormalLeft * planeX * 1.3 + hoopPlaneNormalUp * planeZ
end

function ScreenRelToWorld(camPos, camRot, coord, camDist)
    local camForward = RotationToDirection(camRot)
    local rotUp = camRot + vector3(camDist, 0.0, 0.0)
    local rotDown = camRot + vector3(-camDist, 0.0, 0.0)
    local rotLeft = camRot + vector3(0.0, 0.0, -camDist)
    local rotRight = camRot + vector3(0.0, 0.0, camDist)

    local camRight = RotationToDirection(rotRight) - RotationToDirection(rotLeft)
    local camUp = RotationToDirection(rotUp) - RotationToDirection(rotDown)

    local rollRad = -math.rad(camRot.y)

    local camRightRoll = camRight * math.cos(rollRad) - camUp * math.sin(rollRad)
    local camUpRoll = camRight * math.sin(rollRad) + camUp * math.cos(rollRad)

    local point3D = camPos + camForward * camDist + camRightRoll + camUpRoll

    local found, x, y = GetScreenCoordFromWorldCoord(point3D.x, point3D.y, point3D.z)
    if not found then
        return camPos + camForward * camDist
    end

    local point2D = vector2(x,y)

    local point3DZero = camPos + camForward * camDist
    local foundZero, xZero, yZero = GetScreenCoordFromWorldCoord(point3DZero.x, point3DZero.y, point3DZero.z)
    if not foundZero then
        return camPos + camForward * camDist
    end
    local point2DZero = vector2(xZero, yZero)

    local eps = 0.001
    if (math.abs(point2D.x - point2DZero.x) < eps or math.abs(point2D.y - point2DZero.y) < eps) then
        return camPos + camForward * camDist
    end

    local scaleX = (coord.x - point2DZero.x) / (point2D.x - point2DZero.x)
    local scaleY = (coord.y - point2DZero.y) / (point2D.y - point2DZero.y)
    local point3Dret = camPos + camForward * camDist + camRightRoll * scaleX + camUpRoll * scaleY

    return point3Dret
end

function RotationToDirection(rotation)
    local z = math.rad(rotation.z)
    local x = math.rad(rotation.x)
    local num = math.abs(math.cos(x))
    return vector3(
        (-math.sin(z) * num),
        (math.cos(z) * num),
         math.sin(x)
    )
end


function plus(lhs, rhs)
    return vector3(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
end
 
function minus(lhs, rhs)
    return vector3(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
end
 
function times(lhs, scale)
    return vector3(scale * lhs.x, scale * lhs.y, scale * lhs.z)
end
 
function dot(lhs, rhs)
    return lhs.x * rhs.x + lhs.y * rhs.y + lhs.z * rhs.z
end
 
function tostr(val)
    return "(" .. val.x .. ", " .. val.y .. ", " .. val.z .. ")"
end
 
function intersectPoint(rayVector, rayPoint, planeNormal, planePoint)
    diff = minus(rayPoint, planePoint)
    prod1 = dot(diff, planeNormal)
    prod2 = dot(rayVector, planeNormal)
    prod3 = prod1 / prod2
    local f = minus(rayPoint, times(rayVector, prod3))

    return f
end


-- Citizen.CreateThread(function()
--     local throwPath, isOptimized = ComputeOptimizedThrow(
--         vector3(-213.765, -1523.489, 30.60864),
--         vector4(0.0, 0.0, -0.9396927, -0.3420199),
--         vec3(-210.051239, -1518.397461, 32.816097),
--         vec3(-4.520895, -5.729956, 6.385582),
--         1
--     )
--     RenderDebugPath(
--         vector3(-213.765, -1523.489, 30.60864),
--         throwPath,
--         isOptimized
--     )
-- end)


function RenderDebugPath(throwPath, isOptimized, opacityIfNotOptimized)
    -- Citizen.CreateThread(function()
        -- while true do
            -- Wait(0)
            for i = 1, #throwPath-1 do

                DrawBox(
                    throwPath[i+1].p - 0.002,
                    throwPath[i+1].p + 0.002, 0, 255, 255, 255
                )

                DrawLine(
                    throwPath[i].p, 
                    throwPath[i+1].p, 
                    isOptimized and 0 or 255, isOptimized and 255 or 0, isOptimized and 255 or 0, 
                    isOptimized and 200 or (opacityIfNotOptimized or 200)
                )
            end
        -- end
    -- end)
end

function lerp(a,b,t) return a * (1-t) + b * t end
