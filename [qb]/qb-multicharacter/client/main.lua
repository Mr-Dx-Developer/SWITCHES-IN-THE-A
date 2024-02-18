QBCore = exports[CoreConfig.core]:GetCoreObject()

Config = {
    ped = vector4(302.56298, -1467.94, 46.509521, 319.43402),
    hidden = vector4(311.63803, -1460.509, 46.509487, 132.23925),
    cam = vector4(307.86514, -1468.126, 46.509475, 138.3394),
    rightped = vector4(300.7308, -1464.396, 46.509517, 212.80793),
    leftped = vector4(307.04284, -1469.9, 46.509532, 232.09597),
}

local CreatedPeds = {}
local PlayerCharacters = {}
local currentChar = nil
local currentClothing = {}
local startCam, cam, cam2 = nil, nil, nil

CreateThread(function()
	while true do
        Wait(0)
        if NetworkIsSessionStarted() and QBCore then
            Wait(1500)
            createPeds()
			return
		end
	end
end)

function createPeds()
    local ped = PlayerPedId()

    SetEntityVisible(ped, false, 0)
    SetEntityCoords(ped, Config['hidden'])
    FreezeEntityPosition(ped, true)
    
    QBCore.Functions.TriggerCallback('qb-multicharacter:server:get', function(chars, max)
        if #chars > 0 and chars[1] then
            QBCore.Functions.TriggerCallback('qb-multicharacter:server:getSkin', function(data)
                local model = tonumber(data.model)
                local loaded = loadModel(model)
                if loaded then
                    CreatedPeds['default'] = CreatePed(3, model, Config['ped'].x, Config['ped'].y, Config['ped'].z - 1.0, Config['ped'].w, false, false)
                    if CoreConfig.clothing_base == 'qb' then 
                        TriggerEvent(CoreConfig.clothing_name .. ':client:loadPlayerClothing', data.skin, CreatedPeds['default'])
                    elseif CoreConfig.clothing_base == 'raid' then
                        exports[CoreConfig.clothing_name]:SetPedMetadata(CreatedPeds['default'], data)
                    elseif CoreConfig.clothing_base == 'fivem-appearance' then
                        exports[CoreConfig.clothing_name]:setPedAppearance(CreatedPeds['default'], data.skin)
                    else
                        -- @other clothing function here
                        print('clothing is undefined :(')
                    end
                end
                
                currentClothing = {i = chars[1].citizenid, d = data}

                Wait(150)
                loadAnimDict("amb@world_human_leaning@male@wall@back@foot_up@idle_a")
                TaskPlayAnim(CreatedPeds['default'], "amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", 2.0, 2.0, -1, 49, 0, false, false, false)
            end, chars[1].citizenid)
        end
        SetModelAsNoLongerNeeded(model)
        
        -- Collisions Stuff
        RequestCollisionAtCoord(Config['hidden'].x, Config['hidden'].y, Config['hidden'].z)
        RequestAdditionalCollisionAtCoord(Config['hidden'].x, Config['hidden'].y, Config['hidden'].z)
        SetEntityCoordsNoOffset(ped, Config['hidden'].x, Config['hidden'].y, Config['hidden'].z, false, false, false, true)
        NetworkResurrectLocalPlayer(Config['hidden'].x, Config['hidden'].y, Config['hidden'].z, 247.83258056641, true, true, false)
        SetEntityCoords(PlayerPedId(), Config['hidden'])
        Wait(50)
        local pped = PlayerPedId()
        for i = 1, 250 do
            if HasCollisionLoadedAroundEntity(pped) then break end
            Wait(10)
        end
        
        -- Loading Screen
        ShutdownLoadingScreenNui()
        DoScreenFadeOut(0)
        while not IsScreenFadedOut() do
            Wait(0)
        end

        if GetIsLoadingScreenActive() then
            ShutdownLoadingScreen()
            ShutdownLoadingScreenNui()
        end

        if not IsScreenFadedOut() then DoScreenFadeOut(0) end
        while not IsScreenFadedOut() do Citizen.Wait(0) end

        -- Cameras
        startCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
        SetCamCoord(startCam, 319.57733, -1443.237, 555.54321)
        SetCamActive(startCam, true)
        PointCamAtCoord(startCam, 319.57733, -1443.237, 555.54321)
        SetCamRot(startCam, -90.0, 0.0, -0.0, 2)
        RenderScriptCams(true, true, 0, true, true)

        DoScreenFadeIn(2000)
        while not IsScreenFadedIn() do
            Wait(1)
        end

        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
        SetCamCoord(cam, 317.35238, -1453.057, 180.04902)
        SetCamRot(cam, -90.0, 0.0, -220.0, 2)
        SetCamActive(cam, true)
        SetCamActiveWithInterp(cam, startCam, 2500, true, true)
        cam2 = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
        SetCamCoord(cam2, 304.58065, -1466.345, 46.909502, 136.39781)
        SetCamRot(cam2, 0.0, 0.0, -220.0, 2)
        SetCamFov(cam2, 30.0)
        SetCamActiveWithInterp(cam2, cam, 3500, true, true)
        RenderScriptCams(true, true, 3500, true, true)

        Wait(3500)
        SetNuiFocus(true, true)
        SendNUIMessage({ event = "open", characters = chars, max = max})
        currentChar = 1
        PlayerCharacters = chars
    end)
end

RegisterNUICallback('switch', function(data, cb)
    local selectedChar = tonumber(data.char)
    if currentChar == -1 then
        QBCore.Functions.TriggerCallback('qb-multicharacter:server:getSkin', function(data)
            local model = tonumber(data.model)
            local loaded = loadModel(model)
            if loaded then
                CreatedPeds['default'] = CreatePed(3, model, Config['rightped'].x, Config['rightped'].y, Config['rightped'].z - 1.0, Config['rightped'].w, false, false)
                if CoreConfig.clothing_base == 'qb' then 
                    TriggerEvent(CoreConfig.clothing_name .. ':client:loadPlayerClothing', data.skin, CreatedPeds['default'])
                elseif CoreConfig.clothing_base == 'raid' then
                    exports[CoreConfig.clothing_name]:SetPedMetadata(CreatedPeds['default'], data)
                elseif CoreConfig.clothing_base == 'fivem-appearance' then
                    exports[CoreConfig.clothing_name]:setPedAppearance(CreatedPeds['default'], data.skin)
                else
                    -- @other clothing function here
                    print('clothing is undefined :(')
                end
            end
            currentClothing = {i = data.citizenid, d = data}

            Wait(150)
            TaskGoStraightToCoord(CreatedPeds['default'], Config['ped'].x, Config['ped'].y, Config['ped'].z - 1.0, 1.4, 8000, Config['ped'].w)
            Wait(1500)
            cb(true)
            loadAnimDict("amb@world_human_leaning@male@wall@back@foot_up@idle_a")
            TaskPlayAnim(CreatedPeds['default'], "amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", 2.0, 2.0, -1, 49, 0, false, false, false)
            currentChar = selectedChar
        end, data.citizenid)
    elseif selectedChar and selectedChar ~= currentChar then
        if selectedChar > currentChar then
            QBCore.Functions.TriggerCallback('qb-multicharacter:server:getSkin', function(data)
                ClearPedTasks(CreatedPeds['default'])
                TaskGoStraightToCoord(CreatedPeds['default'], Config['leftped'].x, Config['leftped'].y, Config['leftped'].z, 1.4, 8000, Config['leftped'].w)

                local model = tonumber(data.model)
                local loaded = loadModel(model)
                if loaded then
                    CreatedPeds['right'] = CreatePed(3, model, Config['rightped'].x, Config['rightped'].y, Config['rightped'].z - 1.0, Config['rightped'].w, false, false)
                    if CoreConfig.clothing_base == 'qb' then 
                        TriggerEvent(CoreConfig.clothing_name .. ':client:loadPlayerClothing', data.skin, CreatedPeds['right'])
                    elseif CoreConfig.clothing_base == 'raid' then
                        exports[CoreConfig.clothing_name]:SetPedMetadata(CreatedPeds['right'], data)
                    elseif CoreConfig.clothing_base == 'fivem-appearance' then
                        exports[CoreConfig.clothing_name]:setPedAppearance(CreatedPeds['right'], data.skin)
                    else
                        -- @other clothing function here
                        print('clothing is undefined :(')
                    end
                end

                currentClothing = {i = data.citizenid, d = data}
                Wait(150)

                TaskGoStraightToCoord(CreatedPeds['right'], Config['ped'].x, Config['ped'].y, Config['ped'].z - 1.0, 1.4, 8000, Config['ped'].w)
                Wait(1500)
                cb(true)
                loadAnimDict("amb@world_human_leaning@male@wall@back@foot_up@idle_a")
                TaskPlayAnim(CreatedPeds['right'], "amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", 2.0, 2.0, -1, 49, 0, false, false, false)
                DeletePed(CreatedPeds['default'])
                CreatedPeds['default'] = CreatedPeds['right']
                CreatedPeds['right'] = nil
            end, data.citizenid)
        else
            QBCore.Functions.TriggerCallback('qb-multicharacter:server:getSkin', function(data)
                ClearPedTasks(CreatedPeds['default'])
                TaskGoStraightToCoord(CreatedPeds['default'], Config['rightped'].x, Config['rightped'].y, Config['rightped'].z, 1.4, 8000, Config['rightped'].w)
            
                local model = tonumber(data.model)
                local loaded = loadModel(model)
                if loaded then
                    CreatedPeds['left'] = CreatePed(3, model, Config['leftped'].x, Config['leftped'].y, Config['leftped'].z - 1.0, Config['leftped'].w, false, false)
                    if CoreConfig.clothing_base == 'qb' then 
                        TriggerEvent(CoreConfig.clothing_name .. ':client:loadPlayerClothing', data.skin, CreatedPeds['left'])
                    elseif CoreConfig.clothing_base == 'raid' then
                        exports[CoreConfig.clothing_name]:SetPedMetadata(CreatedPeds['left'], data)
                    elseif CoreConfig.clothing_base == 'fivem-appearance' then
                        exports[CoreConfig.clothing_name]:setPedAppearance(CreatedPeds['left'], data.skin)
                    else
                        -- @other clothing function here
                        print('clothing is undefined :(')
                    end
                end

                currentClothing = {i = data.citizenid, d = data}
                Wait(150)

                TaskGoStraightToCoord(CreatedPeds['left'], Config['ped'].x, Config['ped'].y, Config['ped'].z - 1.0, 1.0, 8000, Config['ped'].w)
                Wait(1500)
                cb(true)
                loadAnimDict("amb@world_human_leaning@male@wall@back@foot_up@idle_a")
                TaskPlayAnim(CreatedPeds['left'], "amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", 2.0, 2.0, -1, 49, 0, false, false, false)
                DeletePed(CreatedPeds['default'])
                CreatedPeds['default'] = CreatedPeds['left']
                CreatedPeds['left'] = nil
            end, data.citizenid)
        end

        currentChar = selectedChar
    else
        ClearPedTasks(CreatedPeds['default'])
        TaskGoStraightToCoord(CreatedPeds['default'], Config['rightped'].x, Config['rightped'].y, Config['rightped'].z, 1.4, 8000, Config['rightped'].w)
        Wait(1500)
        
        cb(true)
        DeletePed(CreatedPeds['default'])
        CreatedPeds['default'] = nil
        currentChar = -1
    end
end)

RegisterNUICallback("create", function(data, cb)
    QBCore.Functions.TriggerCallback('qb-multicharacter:server:createCharacter', function(res)
        cb(res)

        if res then
            SetNuiFocus(false, false)
            DoScreenFadeOut(1000)
            Wait(1000)

            local ped = PlayerPedId()
            FreezeEntityPosition(ped, false)
            SetEntityVisible(ped, true, true)
            DestroyCam(cam, false)
            DestroyCam(cam2, false)
            DestroyCam(startCam, false)
            RenderScriptCams(false, true, 900, true, true)

            DeletePed(CreatedPeds['default'])
            CreatedPeds['default'] = nil
            currentChar = -1
        end
    end, data.char)
end)

RegisterNUICallback("select", function(data, cb)
    Citizen.Trace(json.encode(data))
    SetNuiFocus(false, false)

    Wait(700)
    DoScreenFadeOut(500)
    Wait(500)

    local ped = PlayerPedId()
    FreezeEntityPosition(ped, false)
    SetEntityVisible(ped, true, true)
    DestroyCam(cam, false)
    DestroyCam(cam2, false)
    DestroyCam(startCam, false)
    RenderScriptCams(false, true, 900, true, true)
    DeletePed(CreatedPeds['default'])
    CreatedPeds['default'] = nil
    currentChar = -1

    TriggerServerEvent('qb-multicharacter:server:spawnPlayer', data.citizenid)
end)

RegisterNUICallback("delete", function(data, cb)
    QBCore.Functions.TriggerCallback('qb-multicharacter:server:deleteCharacter', function(chars, max)
        DeletePed(CreatedPeds['default'])
        CreatedPeds = {}
        PlayerCharacters = {}
        currentChar = nil
        currentClothing = {}
        
        if #chars > 0 and chars[1] then
            QBCore.Functions.TriggerCallback('qb-multicharacter:server:getSkin', function(data)
                local model = tonumber(data.model)
    
                local model = tonumber(data.model)
                local loaded = loadModel(model)
                if loaded then
                    CreatedPeds['default'] = CreatePed(3, model, Config['ped'].x, Config['ped'].y, Config['ped'].z - 1.0, Config['ped'].w, false, false)
                    if CoreConfig.clothing_base == 'qb' then 
                        TriggerEvent(CoreConfig.clothing_name .. ':client:loadPlayerClothing', data.skin, CreatedPeds['default'])
                    elseif CoreConfig.clothing_base == 'raid' then
                        exports[CoreConfig.clothing_name]:SetPedMetadata(CreatedPeds['default'], data)
                    elseif CoreConfig.clothing_base == 'fivem-appearance' then
                        exports[CoreConfig.clothing_name]:setPedAppearance(CreatedPeds['default'], data.skin)
                    else
                        -- @other clothing function here
                        print('clothing is undefined :(')
                    end
                end

                currentClothing = {i = chars[1].citizenid, d = data}
    
                Wait(150)
                loadAnimDict("amb@world_human_leaning@male@wall@back@foot_up@idle_a")
                TaskPlayAnim(CreatedPeds['default'], "amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", 2.0, 2.0, -1, 49, 0, false, false, false)
            end, chars[1].citizenid)
        end
        SetModelAsNoLongerNeeded(model)
        
        Wait(200)
        SetNuiFocus(true, true)
        cb({characters = chars, max = max})
        currentChar = 1
        PlayerCharacters = chars
    end, data.citizenid)
end)

RegisterCommand('cnui', function()
    SetNuiFocus(false, false)
end)

function loadModel(model)
    RequestModel(model)
    for i = 1, 2500 do 
        if HasModelLoaded(model) then return true end
        RequestModel(model)
        Wait(1)
    end
    return false
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end 