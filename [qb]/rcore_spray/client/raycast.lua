LastRayStart = nil
LastRayDirection = nil

LastComputedRayEndCoords = nil
LastComputedRayNormal = nil
LastError = nil

if Config.BlacklistZoneDebug then
    Citizen.CreateThread(function()
        while true do
            Wait(0)

            for _, zone in pairs(Config.BlacklistZones) do
                DrawMarker(
                    28, 
                    zone.pos.x, zone.pos.y, zone.pos.z, 
                    0.0, 0.0, 0.0, 
                    0.0, 0.0, 0.0, 
                    zone.range, zone.range, zone.range, 
                    255, 255, 255, 100, 
                    false, false, false, false, nil, nil, false)
            end
        end
    end)
end

function IsInBlacklistZone(pos)
    if Config.BlacklistZones and #Config.BlacklistZones > 0 then
        for _, zone in pairs(Config.BlacklistZones) do
            if not zone.pos or not zone.range then
                print("ERROR: Blacklist zone is missing either pos or range")
            end

            if #(zone.pos - pos) <= zone.range then
                return true
            end
        end

        return false
    end
end

function FindRaycastedSprayCoords()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    local rayStart, rayDirection = GetWorldCoordFromScreenCoord(0.52, 0.35)

    if not LastRayStart or not LastRayDirection or ((not LastComputedRayEndCoords or not LastComputedRayNormal) and not LastError) or rayStart ~= LastRayStart or rayDirection ~= LastRayDirection then
        LastRayStart = rayStart
        LastRayDirection = rayDirection

        local result, error, rayEndCoords, rayNormal = FindRaycastedSprayCoordsNotCached(ped, coords, rayStart, rayDirection)

        if rayEndCoords and IsInBlacklistZone(rayEndCoords) then
            result = false
            error = Config.Text.SPRAY_ERRORS.IN_BLACKLIST_ZONE or "You can't grafitti in this area"
        end

        if rayEndCoords and IsOverlappingSpray(rayEndCoords) then
            result = false
            error = Config.Text.SPRAY_ERRORS.CANT_OVERLAP or "Graffiti can't overlap"
        end

        if result then
            LastComputedRayEndCoords = rayEndCoords
            LastComputedRayNormal = rayNormal
            LastError = nil
            ClearErrorMessage(error)

            return LastComputedRayEndCoords, LastComputedRayNormal, LastComputedRayNormal
        else
            LastComputedRayEndCoords = nil
            LastComputedRayNormal = nil
            LastError = error
            EnsureErrorMessage(error)
        end
    else
        return LastComputedRayEndCoords, LastComputedRayNormal, LastComputedRayNormal
    end
end

function IsOverlappingSpray(rayEndCoords)
    for _, s in pairs(SPRAYS) do
        if #(s.location - rayEndCoords) < 1.5 then
            return true
        end
    end

    return false
end


function FindRaycastedSprayCoordsNotCached(ped, coords, rayStart, rayDirection)
    local rayHit, rayEndCoords, rayNormal, materialHash = CheckRay(ped, rayStart, rayDirection)
    local ray2Hit, ray2EndCoords, ray2Normal, _ = CheckRay(ped, rayStart + vector3(0.0, 0.0, 0.2), rayDirection)
    local ray3Hit, ray3EndCoords, ray3Normal, _ = CheckRay(ped, rayStart + vector3(1.0, 0.0, 0.0), rayDirection)
    local ray4Hit, ray4EndCoords, ray4Normal, _ = CheckRay(ped, rayStart + vector3(-1.0, 0.0, 0.0), rayDirection)
    local ray5Hit, ray5EndCoords, ray5Normal, _ = CheckRay(ped, rayStart + vector3(0.0, 1.0, 0.0), rayDirection)
    local ray6Hit, ray6EndCoords, ray6Normal, _ = CheckRay(ped, rayStart + vector3(0.0, -1.0, 0.0), rayDirection)

    local isOnGround = ray2Normal.z > 0.9

    if not isOnGround and rayHit and ray2Hit and ray3Hit and ray4Hit and ray5Hit and ray6Hit then
        if #(coords - rayEndCoords) < 3.0 then
            if not FORBIDDEN_MATERIALS[materialHash] then
                if (IsNormalSame(rayNormal, ray2Normal)
                and IsNormalSame(rayNormal, ray3Normal)
                and IsNormalSame(rayNormal, ray4Normal)
                and IsNormalSame(rayNormal, ray5Normal)
                and IsNormalSame(rayNormal, ray6Normal)
                and IsOnPlane(rayEndCoords, ray2EndCoords, ray3EndCoords, ray4EndCoords, ray5EndCoords, ray6EndCoords)) then
                    return true, '', rayEndCoords, rayNormal, rayNormal
                else
                    return false, Config.Text.SPRAY_ERRORS.NOT_FLAT
                end
            else 
                return false, Config.Text.SPRAY_ERRORS.INVALID_SURFACE
            end
        else
            return false, Config.Text.SPRAY_ERRORS.TOO_FAR
        end
    else
        return false, Config.Text.SPRAY_ERRORS.AIM
    end
end

LastSubtitleText = nil
function EnsureErrorMessage(text)
    if text ~= LastSubtitleText then
        LastSubtitleText = text
        SendNUIMessage({
            type = "setError",
            data = {
                message = text,
            }
        })
    end
end

function ClearErrorMessage()
    if LastSubtitleText then
        LastSubtitleText = nil
        SendNUIMessage({
            type = "clearError",
            data = {
            }
        })
    end
end



function RotationToDirection(rotation)
	local adjustedRotation = 
	{ 
		x = (math.pi / 180) * rotation.x, 
		y = (math.pi / 180) * rotation.y, 
		z = (math.pi / 180) * rotation.z 
	}
	return vector3(
        -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		math.sin(adjustedRotation.x)
    )
end



function CanSeeSpray(camCoords, sprayCoords)
    local rayHandle = StartShapeTestRay(
        camCoords.x,
        camCoords.y,
        camCoords.z,
    
        sprayCoords.x,
        sprayCoords.y,
        sprayCoords.z,
        1, 
        PlayerPedId()
    )

    local retval --[[ integer ]], 
        hit --[[ boolean ]], 
        endCoords --[[ vector3 ]], 
        surfaceNormal --[[ vector3 ]], 
        entityHit --[[ Entity ]] = GetShapeTestResult(rayHandle)

    return hit == 0
end

function CheckRay(ped, coords, direction)
    local rayEndPoint = coords + direction * 30.0

    local rayHandle = StartShapeTestRay(
        coords.x,
        coords.y,
        coords.z,
    
        rayEndPoint.x,
        rayEndPoint.y,
        rayEndPoint.z,
        1, 
        ped
    )

    local retval --[[ integer ]], 
            hit --[[ boolean ]], 
            endCoords --[[ vector3 ]], 
            surfaceNormal --[[ vector3 ]], 
            materialHash,
            entityHit --[[ Entity ]] = GetShapeTestResultEx(rayHandle)

    return hit == 1, endCoords, surfaceNormal, materialHash
end

function MoveVector3(coords, rot, distance, zMod)
    if not zMod then
        zMod = 0.0
    end

    local newX = math.cos(math.rad(rot))*distance
    local newY = math.sin(math.rad(rot))*distance

    return vector3(
        coords.x + newX,
        coords.y + newY,
        coords.z + zMod
    )
end

function IsNormalSame(norm1, norm2)
    local xDist = math.abs(norm1.x - norm2.x)
    local yDist = math.abs(norm1.y - norm2.y)
    local zDist = math.abs(norm1.z - norm2.z)

    return xDist < 0.01 and yDist < 0.01 and zDist < 0.01
end