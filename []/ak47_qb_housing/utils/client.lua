QBCore = exports['qb-core']:GetCoreObject()

Scaleforms = {}

-- Load scaleforms
Scaleforms.LoadMovie = function(name)
    local scaleform = RequestScaleformMovie(name)
    while not HasScaleformMovieLoaded(scaleform) do Wait(0); end
    return scaleform
end

Scaleforms.LoadInteractive = function(name)
    local scaleform = RequestScaleformMovieInteractive(name)
    while not HasScaleformMovieLoaded(scaleform) do Wait(0); end
return scaleform
end

Scaleforms.UnloadMovie = function(scaleform)
    SetScaleformMovieAsNoLongerNeeded(scaleform)
end

-- Text & labels
Scaleforms.LoadAdditionalText = function(gxt, count)
    for i = 0, count, 1 do
        if not HasThisAdditionalTextLoaded(gxt, i) then
            ClearAdditionalText(i, true)
            RequestAdditionalText(gxt, i)
            while not HasThisAdditionalTextLoaded(gxt, i) do Wait(0); end
        end
    end
end

Scaleforms.SetLabels = function(scaleform, labels)
    PushScaleformMovieFunction(scaleform, "SET_LABELS")
    for i = 1, #labels, 1 do
        local txt = labels[i]
        BeginTextCommandScaleformString(txt)
        EndTextCommandScaleformString()
    end
    PopScaleformMovieFunctionVoid()
end

-- Push method vals wrappers
Scaleforms.PopMulti = function(scaleform, method, ...)
    PushScaleformMovieFunction(scaleform, method)
    for _, v in pairs({...}) do
        local trueType = Scaleforms.TrueType(v)
        if trueType == "string" then
            PushScaleformMovieFunctionParameterString(v)
        elseif trueType == "boolean" then
            PushScaleformMovieFunctionParameterBool(v)
        elseif trueType == "int" then
            PushScaleformMovieFunctionParameterInt(v)
        elseif trueType == "float" then
            PushScaleformMovieFunctionParameterFloat(v)
        end
    end
    PopScaleformMovieFunctionVoid()
end

Scaleforms.PopFloat = function(scaleform, method, val)
    PushScaleformMovieFunction(scaleform, method)
    PushScaleformMovieFunctionParameterFloat(val)
    PopScaleformMovieFunctionVoid()
end

Scaleforms.PopInt = function(scaleform, method, val)
    PushScaleformMovieFunction(scaleform, method)
    PushScaleformMovieFunctionParameterInt(val)
    PopScaleformMovieFunctionVoid()
end

Scaleforms.PopBool = function(scaleform, method, val)
    PushScaleformMovieFunction(scaleform, method)
    PushScaleformMovieFunctionParameterBool(val)
    PopScaleformMovieFunctionVoid()
end

-- Push no args
Scaleforms.PopRet = function(scaleform, method)
    PushScaleformMovieFunction(scaleform, method)
    return PopScaleformMovieFunction()
end

Scaleforms.PopVoid = function(scaleform, method)
    PushScaleformMovieFunction(scaleform, method)
    PopScaleformMovieFunctionVoid()
end

-- Get return
Scaleforms.RetBool = function(ret)
    return GetScaleformMovieFunctionReturnBool(ret)
end

Scaleforms.RetInt = function(ret)
    return GetScaleformMovieFunctionReturnInt(ret)
end

-- Util functions
Scaleforms.TrueType = function(val)
    if type(val) ~= "number" then return type(val); end

    local s = tostring(val)
    if string.find(s, '.') then
        return "float"
    else
        return "int"
    end
end

-- DrawText3Ds = function(x, y, z, text, rect)
--     local onScreen, _x, _y = World3dToScreen2d(x, y, z)
--     local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
--     SetTextScale(0.35, 0.35)
--     SetTextFont(4)
--     SetTextProportional(1)
--     SetTextEntry("STRING")
--     SetTextCentre(1)
--     SetTextColour(255, 255, 255, 215)
--     AddTextComponentString(text)
--     DrawText(_x, _y)
--     if rect then
--         local factor = (string.len(text)) / 280
--         DrawRect(_x, _y + 0.0125, 0.025 + factor, 0.03, 0, 0, 0, 75)
--     end
-- end

DrawText3Ds = function(_x, _y, _z, text, rect)
    local coords = vector3(_x, _y, _z)
    local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local camCoords = GetGameplayCamCoords()
    local dist = GetDistanceBetweenCoords(camCoords, coords.x, coords.y, coords.z, true)
    local size = 0.5

    local scale = (size / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(8)
        SetTextColour(255, 255, 255, 220)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(1)

        AddTextComponentString(text)
        DrawText(x, y)
    end
    if rect then
        local factor = (string.len(text)) / 280
        DrawRect(_x, _y + 0.0125, 0.025 + factor, 0.03, 0, 0, 0, 75)
    end
end

RegisterNetEvent('ak47_qb_housing:notify', function(msg)
    QBCore.Functions.Notify(msg)
end)

rotationToDirection = function(rot)
    if (rot == nil) then
        rot = GetGameplayCamRot(2)
    end
    local rotZ = rot.z * (3.141593 / 180.0)
    local rotX = rot.x * (3.141593 / 180.0)
    local c = math.cos(rotX)
    local multXY = math.abs(c)
    local res = vector3((math.sin(rotZ) * -1) * multXY, math.cos(rotZ) * multXY, math.sin(rotX))
    return res
end

GetCoordsInFrontOfCam = function(cam, ...)
    local unpack = table.unpack
    local coords, direction = GetGameplayCamCoord(), rotationToDirection()
    coords, direction = GetCamCoord(cam), rotationToDirection(GetCamRot(cam))
    local inTable = {...}
    local retTable = {}
    if (#inTable == 0) or (inTable[1] < 0.000001) then
        inTable[1] = 0.000001
    end
    for k, distance in pairs(inTable) do
        if (type(distance) == "number") then
            if (distance == 0) then
                retTable[k] = coords
            else
                retTable[k] =
                vector3(
                    coords.x + (distance * direction.x),
                    coords.y + (distance * direction.y),
                    coords.z + (distance * direction.z)
                )
            end
        end
    end
    return unpack(retTable)
end

VecDist = function(v1, v2)
    if not v1 or not v2 or not v1.x or not v2.x then
        return 0
    end
    return math.sqrt(
        ((v1.x or 0) - (v2.x or 0)) * ((v1.x or 0) - (v2.x or 0)) +
        ((v1.y or 0) - (v2.y or 0)) * ((v1.y or 0) - (v2.y or 0)) +
        ((v1.z or 0) - (v2.z or 0)) * ((v1.z or 0) - (v2.z or 0))
    )
end

clampVecLength = function(v, maxLength)
    if vecSqMagnitude(v) > (maxLength * maxLength) then
        v = vecSetNormalize(v)
        v = vecMulti(v, maxLength)
    end
    return v
end

vecSqMagnitude = function(v)
    return ((v.x * v.x) + (v.y * v.y) + (v.z * v.z))
end

vecMulti = function(v, q)
    local x, y, z
    local retVec
    if type(q) == "number" then
        x = v.x * q
        y = v.y * q
        z = v.z * q
        retVec = vector3(x, y, z)
    end
    return retVec
end

vecLength = function(v)
    return math.sqrt((v.x * v.x) + (v.y * v.y) + (v.z * v.z))
end

vecSetNormalize = function(v)
    local num = vecLength(v)
    if num == 1 then
        return v
    elseif num > 1e-5 then
        return vecDiv(v, num)
    else
        return vector3(0, 0, 0)
    end
end

vecDiv = function(v, d)
    local x = v.x / d
    local y = v.y / d
    local z = v.z / d
    return vector3(x, y, z)
end

CreateInstructionalScaleform = function(controls)
    local scaleform = Scaleforms.LoadMovie('INSTRUCTIONAL_BUTTONS')
    Scaleforms.PopVoid(scaleform, 'CLEAR_ALL')
    Scaleforms.PopInt(scaleform, 'SET_CLEAR_SPACE', 200)
    for i = 1, #controls, 1 do
        PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
        PushScaleformMovieFunctionParameterInt(i - 1)
        for k = 1, #controls[i].codes, 1 do
            ScaleformMovieMethodAddParamPlayerNameString(GetControlInstructionalButton(0, controls[i].codes[k], true))
        end
        BeginTextCommandScaleformString("STRING")
        AddTextComponentScaleform(controls[i].label)
        EndTextCommandScaleformString()
        PopScaleformMovieFunctionVoid()
    end
    Scaleforms.PopVoid(scaleform, 'DRAW_INSTRUCTIONAL_BUTTONS')
    return scaleform
end

rotationToDirection = function(rot)
    if (rot == nil) then
        rot = GetGameplayCamRot(2)
    end
    local rotZ = rot.z * (3.141593 / 180.0)
    local rotX = rot.x * (3.141593 / 180.0)
    local c = math.cos(rotX)
    local multXY = math.abs(c)
    local res = vector3((math.sin(rotZ) * -1) * multXY, math.cos(rotZ) * multXY, math.sin(rotX))
    return res
end

getCoordsInFrontOfCam = function(...)
    local unpack = table.unpack
    local coords, direction = GetCamCoord(MainCamera), rotationToDirection(GetCamRot(MainCamera))
    local inTable = {...}
    local retTable = {}
    if (#inTable == 0) or (inTable[1] < 0.000001) then
        inTable[1] = 0.000001
    end
    for k, distance in pairs(inTable) do
        if (type(distance) == "number") then
            if (distance == 0) then
                retTable[k] = coords
            else
                retTable[k] =
                vector3(
                    coords.x + (distance * direction.x),
                    coords.y + (distance * direction.y),
                    coords.z + (distance * direction.z)
                )
            end
        end
    end
    return unpack(retTable)
end
