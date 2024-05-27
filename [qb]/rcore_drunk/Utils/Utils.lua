-------------------------------------------------
-- Variables list
-------------------------------------------------
--- Current camera shake intensity stored there
ShakeCameraIntensity = 0.0

-------------------------------------------------
-- Function list
-------------------------------------------------
--- Will set effect on player camera
--- if we set it again even to same value it will reset
--- the effect, thats why its in function with if statement
function SetCameraDrunkEffect(intensity)
    if ShakeCameraIntensity ~= intensity then
        ShakeGameplayCam("DRUNK_SHAKE", intensity)
        ShakeCameraIntensity = intensity
    end
end

-- will return min and max so I can save 0.5 second of time I would be typing all of these shits ¯\_(ツ)_/¯
--- @param min integer
--- @param max integer
function GetMinMax(min, max)
    return math.min(min, max), math.max(max, min)
end

-- Will draw 3D text
--- @param position vector3
--- @param scale float
--- @param size float
--- @param color table
--- @param text string
function Render3DText(position, scale, size, color, text)
    SetDrawOrigin(position.x, position.y, position.z, 0)
    SetTextScale(scale, size)
    SetTextColour(color.r, color.g, color.b, color.a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

--- Will display help notification
--- @param msg string
--- @param thisFrame boolean
--- @param beep boolean
--- @param duration int
function ShowHelpNotification(msg, thisFrame, beep, duration)
    AddTextEntry('rcore_Tv_help_msg', msg)

    if thisFrame then
        DisplayHelpTextThisFrame('rcore_Tv_help_msg', false)
    else
        if beep == nil then
            beep = false
        end
        BeginTextCommandDisplayHelp('rcore_Tv_help_msg')
        EndTextCommandDisplayHelp(0, false, beep, duration)
    end
end

--- Will display notification text
--- @param text string
function ShowNotification(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(0, 1)
end

-- Will slowly change value to the defined one
--- @param a object
--- @param b object
--- @param t object
function Lerp(a, b, t)
    return a + (b - a) * 0.5 * t
end

--- @param effectName string
--- @param toNewIntensity float
--- @param fromIntensityt float
--- will lerp camera effect in time smoothly
function LerpCameraDrunkEffect(effectName, toNewIntensity, fromIntensity)

    local greater
    if toNewIntensity >= fromIntensity then
        greater = false
    else
        greater = true
    end

    while true do
        Wait(8)
        toNewIntensity = Lerp(toNewIntensity, fromIntensity, 0.05)

        if greater then
            if toNewIntensity >= fromIntensity - 0.01 then
                break
            end
        else
            if toNewIntensity - 0.1 <= fromIntensity then
                break
            end
        end

        SetTimecycleModifier(effectName)
        SetTimecycleModifierStrength(toNewIntensity)
    end
end

-- Will play random headache effect
function PlayRandomHeadache()
    local switch = {
        [1] = function()
            ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.1)
        end,
        [2] = function()
            LerpCameraDrunkEffect("Bloom", 0.0, 1.0)
            Wait(1500)
            LerpCameraDrunkEffect("Bloom", 1.0, 0.0)
        end,
        [2] = function()
            LerpCameraDrunkEffect("CAMERA_secuirity", 0.0, 0.5)
            LerpCameraDrunkEffect("CAMERA_secuirity", 0.5, 0.0)

            SetTimecycleModifier("CAMERA_secuirity")
            SetTimecycleModifierStrength(0.0)
        end,
        [3] = function()
            LerpCameraDrunkEffect("glasses_black", 0.0, 1.3)
            Wait(1500)
            LerpCameraDrunkEffect("glasses_black", 1.3, 0.0)
        end,
        [4] = function()
            ShakeGameplayCam("DRUNK_SHAKE", 0.4)
            Wait(3000)
            ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        end,
    }

    switch[math.random(#switch)]()
end

-- Will return rotation to position
--- @param desiredPosition vector3
function GetHeadingTowardCoords(startPosition, desiredPosition)
    local positionToFace = desiredPosition

    local pedPos = startPosition

    local x = positionToFace.x - pedPos.x
    local y = positionToFace.y - pedPos.y

    local heading = GetHeadingFromVector_2d(x, y)

    return heading
end

-- Will set heading to player to the vector3 position in parameter
--- @param desiredPosition vector3
function RotatePlayerTowardsCoords(desiredPosition)
    local positionToFace = desiredPosition
    local ped = PlayerPedId()

    local pedPos = GetEntityCoords(ped)

    local x = positionToFace.x - pedPos.x
    local y = positionToFace.y - pedPos.y

    local heading = GetHeadingFromVector_2d(x, y)

    SetEntityHeading(ped, heading)
end

-- Will create a local object
--- @param hash string/integer
--- @param pos vector3
function CreateLocalObject(hash, pos)
    local model
    if tonumber(hash) then
        model = hash
    else
        model = GetHashKey(hash)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(16)
    end
    local entity = CreateObject(model, pos.x, pos.y, pos.z, false, false, false)
    SetEntityCoordsNoOffset(entity, pos.x, pos.y, pos.z)
    return entity
end

-- Will create a networked object
--- @param hash string/integer
--- @param pos vector3
function CreateNetworkObject(hash, pos)
    local model
    if tonumber(hash) then
        model = hash
    else
        model = GetHashKey(hash)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(16)
    end
    local entity = CreateObject(model, pos.x, pos.y, pos.z, true, false, false)
    SetEntityCoordsNoOffset(entity, pos.x, pos.y, pos.z)
    return entity
end

--- Will drop player on ground for one second
--- @param ped entity
function DropPlayerToGround(ped, time)
    SetPedToRagdoll(ped, time or 1000, time or 1000, 0, 0, 0, 0)
end

--- Will register a key bind for action defined in "fc" argument name
--- @param fc delegate
--- @param uniqid string
--- @param description string
--- @param key string
--- @param device string
function RegisterKey(fc, uniqid, description, key, device)
    RegisterCommand(uniqid .. key, fc, false)
    RegisterKeyMapping(uniqid .. key, description, device or 'keyboard', key)
end

--- will cast raycast to where player is looking
--- @param entity int
--- @param flags int
function CastRayCast(entity, flags, _distance)
    local ped = PlayerPedId()

    local pos = GetEntityCoords(ped)
    local cameraCoord = GetGameplayCamCoord()
    local direction = RotationToDirection(GetGameplayCamRot())
    local distance = _distance or 15.0
    local destination = {
        x = cameraCoord.x + direction.x * distance,
        y = cameraCoord.y + direction.y * distance,
        z = cameraCoord.z + direction.z * distance
    }

    local ray = StartShapeTestRay(pos.x, pos.y, pos.z, destination.x, destination.y, destination.z, flags or (1 + 16), entity or PlayerPedId(), 1)
    local retval, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(ray)

    return retval, hit, endCoords, surfaceNormal, entityHit
end

--- Will return position of rotation
--- @param rotation vector3
function RotationToDirection(rotation)
    local adjustedRotation = {
        x = (math.pi / 180) * rotation.x,
        y = (math.pi / 180) * rotation.y,
        z = (math.pi / 180) * rotation.z
    }
    local direction = {
        x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        z = math.sin(adjustedRotation.x)
    }
    return direction
end

--- Will play vomiting animation + particle and on the end it will play clean animation.
function PlayVomitAnimation()
    TriggerEvent(TriggerName("PlayerStartPuking"))
    TriggerServerEvent(TriggerName("PlayerStartPuking"))

    local ped = PlayerPedId()

    local dictParticle = "scr_family5"
    local nameParticle = "scr_trev_puke"

    local animDict = "missheistpaletoscore1leadinout"
    local animPuke = "rcore_vomit"
    local animClean = "trv_upperbody_leadout"

    local bzzDict = "xogos@rcore@vomit"

    ClearPedTasks(ped)
    FreezeEntityPosition(ped, true)

    RequestAnimDict(animDict)
    RequestAnimDict(bzzDict)
    while not HasAnimDictLoaded(animDict) and not HasAnimDictLoaded(bzzDict) do
        Wait(100)
    end

    RequestNamedPtfxAsset(dictParticle)
    while not HasNamedPtfxAssetLoaded(dictParticle) do
        Wait(1)
    end

    TaskPlayAnim(ped, bzzDict, animPuke, 8.0, 8.0, -1, 13, 0, false, false, false)

    Wait(1000)

    UseParticleFxAssetNextCall(dictParticle)
    local retval = StartParticleFxLoopedOnEntityBone(nameParticle, ped, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetPedBoneIndex(ped, 31086), 1.0, 0.0, 0.0, 0.0)

    Wait((GetAnimDuration(bzzDict, animPuke) * 1000) - 2000)

    StopParticleFxLooped(retval, 0)
    RemoveParticleFx(retval, false)

    Wait(1000)

    ClearPedTasks(PlayerPedId())

    Wait(300)

    TaskPlayAnim(ped, animDict, animClean, 8.0, 8.0, -1, 13, 0, false, false, false)
    Wait(5000)

    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(ped, false)


    TriggerEvent(TriggerName("PlayerStopPuking"))
    TriggerServerEvent(TriggerName("PlayerStopPuking"))
end