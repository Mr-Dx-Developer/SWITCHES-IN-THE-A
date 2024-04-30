local bool, PlacingObject, foundMatch = false, false, false
local time = 1000
local CurrentModel, CurrentObject, CurrentObjectType, CurrentObjectName, CurrentSpawnRange, CurrentCoords = nil, nil, nil, nil, nil, nil
ObjectList = {}

function CancelPlacement()
    if CurrentObject then
        if IsEntityAVehicle(CurrentObject) then
            DeleteVehicle(CurrentObject)
        else
            DeleteObject(CurrentObject)
        end
        CurrentObject = nil
    end
    
    PlacingObject = false
    CurrentObjectType = nil
    CurrentObjectName = nil
    CurrentSpawnRange = nil
    CurrentCoords = nil
end

function ButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function Button(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function setupScaleform(scaleform)
    local scaleformHandle = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleformHandle) do Citizen.Wait(0) end

    -- draw it once to set up layout
    DrawScaleformMovieFullscreen(scaleformHandle, 255, 255, 255, 0, 0)

    PushScaleformMovieFunction(scaleformHandle, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleformHandle, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleformHandle, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    Button(GetControlInstructionalButton(2, Config.Controls.cancelKey, true))
    ButtonMessage(Config.Locales["cancel"])
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleformHandle, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    Button(GetControlInstructionalButton(2, Config.Controls.placeKey, true))
    ButtonMessage(Config.Locales["place_object"])
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleformHandle, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(2)
    Button(GetControlInstructionalButton(2, Config.Controls.rotateLeftKey, true))
    Button(GetControlInstructionalButton(2, Config.Controls.rotateRightKey, true))
    ButtonMessage(Config.Locales["rotate_object"])
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleformHandle, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(3)
    Button(GetControlInstructionalButton(2, Config.Controls.upKey, true))
    Button(GetControlInstructionalButton(2, Config.Controls.downKey, true))
    ButtonMessage(Config.Locales["adjust_height"])
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleformHandle, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleformHandle, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()

    return scaleformHandle
end

function RotationToDirection(rotation)
    local adjustedRotation =
    {
        x = (math.pi / 180) * rotation.x,
        y = (math.pi / 180) * rotation.y,
        z = (math.pi / 180) * rotation.z
    }
    local direction =
    {
        x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        z = math.sin(adjustedRotation.x)
    }
    return direction
end

function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
    local cameraCoord = GetGameplayCamCoord()
    local direction = RotationToDirection(cameraRotation)
    local destination =
    {
        x = cameraCoord.x + direction.x * distance,
        y = cameraCoord.y + direction.y * distance,
        z = cameraCoord.z + direction.z * distance
    }
    local _, hit, coords, _, entity = GetShapeTestResult(StartShapeTestSweptSphere(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, 0.2, 339, PlayerPedId(), 4))
    return hit, coords, entity
end

function spawnAndPositionProp(objectId, propModel)
    local player = PlayerPedId()
    local playerPos = GetEntityCoords(player)
    local forward = GetEntityForwardVector(player)
    local spawnLocation = (playerPos + forward * 10.0)  -- Adjust the distance as needed
    local propPosition = spawnLocation 
    local heading = 0.0
    local prop = CreateObject(propModel, spawnLocation.x, spawnLocation.y, spawnLocation.z, true, false, false)
    local propID = math.random(100000, 999999)
    local propData = {
        id = propID,
        model = propModel,
        x = spawnLocation.x,
        y = spawnLocation.y,
        z = spawnLocation.z,
        rx = 0,
        ry = 0,
        rz = 0,
        roll = 0,
        pitch = 0,
        heading = GetEntityHeading(player)
    }

    Citizen.Wait(25)
    if DoesEntityExist(prop) then
        SetEntityAlpha(prop, 255)
        SetEntityCollision(prop, false, true)
        
        PlacingObject = true
        CurrentObjectType = 'prop'
        CurrentModel = propModel

        local minDistance = 2.0
        local maxDistance = 15.0
        local moveSpeed = 0.01 -- Adjust this to change the speed of movement
        local propHeight = 0.0 -- Add this variable to store the prop's height

        Citizen.CreateThread(function()
            local form = setupScaleform("instructional_buttons")
            while PlacingObject do
                local hit, coords, _ = RayCastGamePlayCamera(Config.RaycastDistance)
                CurrentCoords = coords

                DrawScaleformMovieFullscreen(form, 255, 255, 255, 255, 0)

                -- Draw a vertical line in the center of the vehicle
                local lineLength = 6.0 -- Adjust the length of the line
                local lineColor = { r = Config.LineColor.r, g = Config.LineColor.g, b = Config.LineColor.b, a = Config.LineColor.a } -- Adjust the color of the line
                local lineStart = vector3(coords.x, coords.y, coords.z - (lineLength / 2))
                local lineEnd = vector3(coords.x, coords.y, coords.z + (lineLength / 2))
                DrawLine(lineStart.x, lineStart.y, lineStart.z, lineEnd.x, lineEnd.y, lineEnd.z, lineColor.r, lineColor.g, lineColor.b, lineColor.a)

                if hit then
                    local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, GetGameplayCamCoords())
                    if distance >= minDistance and distance <= maxDistance then
                        SetEntityCoordsNoOffset(prop, coords.x, coords.y, coords.z, true, true, true)
                    end
                end

                DisableControlAction(0, 24, true)

                if IsControlPressed(0, Config.Controls.rotateLeftKey) then -- Scroll wheel up
                    heading = heading + 5
                    if heading > 360 then heading = 0.0 end
                end

                if IsControlPressed(0, Config.Controls.rotateRightKey) then -- Scroll wheel down
                    heading = heading - 5
                    if heading < 0 then heading = 360.0 end
                end

                -- If the up arrow key is pressed, increase the prop's height
                if IsControlPressed(0, Config.Controls.upKey) then -- Up Arrow
                    propHeight = propHeight + moveSpeed
                end

                -- If the down arrow key is pressed, decrease the prop's height
                if IsControlPressed(0, Config.Controls.downKey) then -- Down Arrow
                    propHeight = propHeight - moveSpeed
                end

                -- Update the prop's position including the height adjustment
                SetEntityCoordsNoOffset(prop, coords.x, coords.y, coords.z + propHeight, true, true, true)

                -- Update the prop's height when saving the prop position
                propData.z = GetEntityCoords(prop).z - propHeight

                -- Update the prop's height in the ObjectList
                coords = vector3(propData.x, propData.y, propData.z + propHeight)

                if IsControlJustPressed(0, Config.Controls.cancelKey) then
                    CancelPlacement()
                    DeleteEntity(prop)
                    bool = false
                    foundMatch = false
                    StudioProps()
                    break
                end

                SetEntityHeading(prop, heading)

                if IsControlJustPressed(0, Config.Controls.placeKey) then
                    SetEntityCollision(prop, true, true)
                    FreezeEntityPosition(prop, true)                    
                    Citizen.Wait(100)
                    propData.id = propID
                    propData.model = propModel
                    propData.x = GetEntityCoords(prop).x
                    propData.y = GetEntityCoords(prop).y
                    propData.z = GetEntityCoords(prop).z
                    propData.heading = GetEntityHeading(prop) + 0.01   
                    Citizen.Wait(100)     
                    if Config.SaveProps then TriggerServerEvent('maximum_housingprops:server:savePropPosition', propData) end
                    TargetObject(prop)
                    ObjectList[objectId] = {
                        id = objectId,
                        object = prop,
                        coords = vector3(propData.x, propData.y, propData.z),
                        heading = propData.heading,
                    }
                    PlacingObject = false
                    bool = false
                    StudioProps()                   
                    break
                end               

                Citizen.Wait(1)
            end
        end)

        EnableControlAction(0, 24, true)
    end
end

-- Function to find the closest prop
function findClosestProp(playerCoords, searchRadius)
    local closestProp = nil
    local closestDistance = searchRadius

    for _, propType in pairs(Config.Props) do
        for _, model in ipairs(propType) do
            local propHash = GetHashKey(model.model)
            local propObject = GetClosestObjectOfType(playerCoords, searchRadius, propHash, false, false, false)
            
            if propObject then
                local propDistance = #(playerCoords - GetEntityCoords(propObject))
                
                if propDistance < closestDistance then
                    closestProp = propObject
                    closestDistance = propDistance
                end
            end
        end
    end

    return closestProp
end