Fonts = {}

for idx, f in pairs(FONTS) do
    Fonts[idx] = f.label
end

SprayFont = 1
SprayText = ''
FormattedSprayText = ''
SprayImage = nil
SprayImageDict = nil

SprayColorRGB = nil
SprayColorHex = nil

SprayScaleMin = 6
SprayScaleMax = 20
SprayScale = 6

IsSpraying = false

local lastFormattedText = nil
function ResetFormattedText()
    local tmp = SprayText

    if tmp ~= lastFormattedText then
        lastFormattedText = tmp

        if FONTS[SprayFont].forceUppercase then
            tmp = tmp:upper()
        end

        FormattedSprayText = RemoveDisallowedCharacters(tmp, FONTS[SprayFont].allowedInverse)
    end
end

function UnsetFormattedText()
    lastFormattedText = ''
    FormattedSprayText = ''
end

RegisterNetEvent('rcore_spray:spray')
AddEventHandler('rcore_spray:spray', function()
    if not IsSpraying and not IsProgressbarDisplayed then
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "open"
        })
    end
end, false)

RegisterNUICallback('disableFocus', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('enableFocus', function()
    SetNuiFocus(true, true)
end)

RegisterNUICallback('previewSpray', function(data)
    local text = data.text
    local image = data.image
    local imageDict = data.imageDict
    local font = data.font

    if text ~= nil and Config.DisableText then
        print("ERROR: Text input is not allowed")
        SetNuiFocus(false, false)
        SendNUIMessage({
            type = 'hide'
        })
        return
    end

    if image and imageDict then
        text = nil
        
        SprayImage = image
        SprayImageDict = imageDict
        SprayFont = nil
        SprayText = nil
        UnsetFormattedText()
    else
        local fontId = 1

        for idx, fontConfig in pairs(FONTS) do
            if fontConfig.font == font then
                fontId = idx
                break
            end
        end
        
        SprayImage = nil
        SprayImageDict = nil
        SprayFont = fontId
        SprayText = text
        SprayColorRGB = data.rgbColor
        SprayColorHex = data.hexColor

        ResetFormattedText()
    end

    if rotCam and DoesCamExist(rotCam) then
        DestroyCam(rotCam, false)
    end
    rotCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)

    IsSpraying = true
    SetNuiFocus(false, false)
end)

function PersistSpray()
    IsSpraying = false
        
    local rayEndCoords, rayNormal, sprayFwdVector = FindRaycastedSprayCoords()
    if rayEndCoords and rayNormal then
        local sprayLocation = rayEndCoords + sprayFwdVector * SPRAY_FORWARD_OFFSET
        

        local ped = PlayerPedId()

        local canPos = vector3(0.072, 0.041, -0.06)
        local canRot = vector3(33.0, 38.0, 0.0)
    
        local canObj = CreateObject(
            `ng_proc_spraycan01b`,
            0.0, 0.0, 0.0,
            true, false, false
        )
        AttachEntityToEntity(
            canObj, ped, 
            GetPedBoneIndex(ped, 57005), 
            canPos.x, canPos.y, canPos.z, 
            canRot.x, canRot.y, canRot.z, 
            true, true, false, true, 1, true
        )

        local isCancelled = false

        Citizen.CreateThread(function()
            Wait(2000)
            while not isCancelled do
                SprayEffects()
                Wait(5000)
            end
        end)

        local finalText = nil

        if FormattedSprayText and FormattedSprayText ~= '' then
            finalText = FormattedSprayText
        end

        CancellableProgress(
            Config.SPRAY_PROGRESSBAR_DURATION, 
            'anim@amb@business@weed@weed_inspecting_lo_med_hi@', 
            'weed_spraybottle_stand_spraying_01_inspector', 
            16,
            function() -- success
                local realScale
                local realFont

                if SprayImageDict then
                    realScale = SprayScale * FastImageMap[SprayImageDict .. SprayImage].scale
                else
                    realScale = SprayScale * FONTS[SprayFont].sizeMult
                end

                if SprayFont then
                    realFont = FONTS[SprayFont].font
                end

                TriggerServerEvent('rcore_spray:addSpray', {
                    location = sprayLocation,
                    realRotation = currentComputedRotation, 
                    realLocation = currentComputedLocation,
                    
                    scale = realScale,
                    text = finalText,
                    image = SprayImage,
                    imageDict = SprayImageDict,
                    font = realFont,
                    color = SprayColorHex,
                    interior = GetInteriorFromEntity(PlayerPedId()) > 0
                })
                ClearPedTasks(ped)
                DeleteObject(canObj)
                isCancelled = true
            end,
            function()
                ClearPedTasks(ped)
                DeleteObject(canObj)
                isCancelled = true
            end
        )
    end
end

function SprayEffects()
    local dict = "scr_recartheft"
    local name = "scr_wheel_burnout"
    
    local ped = PlayerPedId()
    local fwd = GetEntityForwardVector(ped)
    local coords = GetEntityCoords(ped) + fwd * 0.5 + vector3(0.0, 0.0, -0.5)

	RequestNamedPtfxAsset(dict)
    -- Wait for the particle dictionary to load.
    while not HasNamedPtfxAssetLoaded(dict) do
        Citizen.Wait(0)
	end

	local pointers = {}
    
    local color

    if SprayColorRGB then
        color = SprayColorRGB
    else
        color = {255, 255, 255}
    end

    if SprayImage then
        local imgData = FastImageMap[SprayImageDict .. SprayImage]

        if imgData then
            color = imgData.color
        end
    end

    local heading = GetEntityHeading(ped)

    UseParticleFxAssetNextCall(dict)
    SetParticleFxNonLoopedColour(color[1] / 255, color[2] / 255, color[3] / 255)
    SetParticleFxNonLoopedAlpha(1.0)
    local ptr = StartNetworkedParticleFxNonLoopedAtCoord(
        name, 
        coords.x, coords.y, coords.z + 2.0, 
        0.0, 0.0, heading, 
        0.7, 
        0.0, 0.0, 0.0
    )
    RemoveNamedPtfxAsset(dict)
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 100 )
    end
end

function RemoveDisallowedCharacters(str, inverse)
    local replaced, _ = str:gsub(inverse, '')

    return replaced
end