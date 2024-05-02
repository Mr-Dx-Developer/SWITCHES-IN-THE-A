REQUEST_MODEL = RequestModel
RequestModel = function(model)
    REQUEST_MODEL(model)

    if HasModelLoaded(model) then
        return nil
    else
        local loaded = HasModelLoaded(model)

        while not loaded do
            Wait(0)

            loaded = HasModelLoaded(model)

            if loaded then
                Wait(0)
            end
        end

        return nil
    end
end

REQUEST_ANIM_DICT = RequestAnimDict
RequestAnimDict = function(animDict)
    REQUEST_ANIM_DICT(animDict)

    if HasAnimDictLoaded(animDict) then
        return nil
    else
        local loaded = HasAnimDictLoaded(animDict)

        while not loaded do
            Wait(0)

            loaded = HasAnimDictLoaded(animDict)

            if loaded then
                Wait(0)
            end
        end

        return nil
    end
end

function ShapeTestCameraToRay(distance, flags, ignore)
    local cameraPos = GetFinalRenderedCamCoord()
    local cameraRot = GetFinalRenderedCamRot()

    local cameraDir = glm.vec3(-glm.sin(glm.radians(cameraRot.z)), glm.cos(glm.radians(cameraRot.z)), glm.sin(glm.radians(cameraRot.x)))

    local handle = StartExpensiveSynchronousShapeTestLosProbe(cameraPos.x + cameraDir.x, cameraPos.y + cameraDir.y, cameraPos.z + cameraDir.z, cameraPos.x + cameraDir.x * distance, cameraPos.y + cameraDir.y * distance, cameraPos.z + cameraDir.z * distance, flags, ignore, 7)
    local status, hit, endPos, surfaceNormal, hitEntity = GetShapeTestResult(handle)

    return hitEntity
end

function Draw3dText(x, y, z, text)
    local factor = string.len(string.gsub(text, '~%a*~', '')) / 470

    SetTextFont(4)
	SetTextScale(0.35, 0.35)
    SetTextCentre(true)
    SetTextColour(255, 255, 255, 215)

    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    
    SetDrawOrigin(x, y, z, 0)

    DrawText(0.0, 0.0)
    DrawRect(0.0, 0.0125, factor, 0.03, 0, 0, 0, 75)

    ClearDrawOrigin()
end