local currectSpawnPoint = nil
local lastSpawnPoint = nil
local cam, cameraOffset = nil

if Config.Core == "ESX" then
    ESX = Config.CoreExport()
elseif Config.Core == "QB-Core" then
    QBCore = Config.CoreExport()
end

RegisterNUICallback("change", function(data)
    if cam and data.direction then
        lastSpawnPoint = currectSpawnPoint
        if data.direction == "left" then
            currectSpawnPoint = currectSpawnPoint - 1
            if not Config.Spawns[currectSpawnPoint] then
                currectSpawnPoint = #Config.Spawns
            end
        elseif data.direction == "right" then
            currectSpawnPoint = currectSpawnPoint + 1
            if not Config.Spawns[currectSpawnPoint] then
                currectSpawnPoint = 1
            end
        end
        DoScreenFadeOut(250)
        while not IsScreenFadedOut() do
            Citizen.Wait(5)
        end
        SetEntityCoords(PlayerPedId(), Config.Spawns[currectSpawnPoint].spawnCoords.x, Config.Spawns[currectSpawnPoint].spawnCoords.y, Config.Spawns[currectSpawnPoint].spawnCoords.z)
        SetCamCoord(cam, Config.Spawns[currectSpawnPoint].camCoords.x, Config.Spawns[currectSpawnPoint].camCoords.y, Config.Spawns[currectSpawnPoint].camCoords.z)
        PointCamAtCoord(cam, Config.Spawns[currectSpawnPoint].spawnCoords.x, Config.Spawns[currectSpawnPoint].spawnCoords.y, Config.Spawns[currectSpawnPoint].spawnCoords.z)
        Citizen.Wait(150)
        DoScreenFadeIn(250)
        SendNUIMessage({
            action = 'change',
            label = Config.Spawns[currectSpawnPoint].label,
            address = Config.Spawns[currectSpawnPoint].address
        })
    end
end)

RegisterNUICallback("select", function(data)
    SelectSpawn(data.isLastPosition)
end)

function OpenSpawnSelector()
    if not DoesCamExist(cam) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    end
    TriggerEvent('vms_spawnselector:WeatherSync', true)
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityVisible(PlayerPedId(), false)
    currectSpawnPoint = 1
    lastSpawnPoint = currectSpawnPoint
    SetEntityCoords(PlayerPedId(), Config.Spawns[1].spawnCoords.x, Config.Spawns[1].spawnCoords.y, Config.Spawns[1].spawnCoords.z)
    SetCamCoord(cam, Config.Spawns[1].camCoords.x, Config.Spawns[1].camCoords.y, Config.Spawns[1].camCoords.z)
    PointCamAtCoord(cam, Config.Spawns[1].spawnCoords.x, Config.Spawns[1].spawnCoords.y, Config.Spawns[1].spawnCoords.z)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
    Config.Hud:Disable()
    SendNUIMessage({action = 'open'})
    SendNUIMessage({
        action = 'change',
        label = Config.Spawns[currectSpawnPoint].label,
        address = Config.Spawns[currectSpawnPoint].address
    })
    SetNuiFocus(true, true)
end

function SelectSpawn(isLastPosition)
    if isLastPosition then
        if Config.Core == "ESX" then
            ESX.TriggerServerCallback('vms_spawnselector:getLastPosition', function(spawnCoords)
                if spawnCoords then
                    SetCamCoord(cam, spawnCoords.x, spawnCoords.y, spawnCoords.z + 75.0)
                    PointCamAtCoord(cam, spawnCoords.x, spawnCoords.y, spawnCoords.z)
                    SetEntityCoords(PlayerPedId(), spawnCoords.x, spawnCoords.y, spawnCoords.z)
                    SetEntityHeading(PlayerPedId(), spawnCoords.w)
                    Citizen.Wait(150)
                    DestoryCams()
                end
            end)
        elseif Config.Core == "QB-Core" then
            QBCore.Functions.GetPlayerData(function(PlayerData)
                if PlayerData.position then
                    SetCamCoord(cam, PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + 75.0)
                    PointCamAtCoord(cam, PlayerData.position.x, PlayerData.position.y, PlayerData.position.z)
                    SetEntityCoords(PlayerPedId(), PlayerData.position.x, PlayerData.position.y, PlayerData.position.z)
                    SetEntityHeading(PlayerPedId(), PlayerData.position.a)
                    Citizen.Wait(150)
                    DestoryCams()
                end
            end)
        end
    else
        if Config.OnDeadOnlyLastPosition then
            if Config.Core == "ESX" then
                ESX.TriggerServerCallback('vms_spawnselector:getDeadStatus', function(isDead)
                    if isDead then
                        return Config.Notification(Config.Translate['cannot_spawn_on_dead'], 5000, 'error')
                    end
                    SetEntityCoords(PlayerPedId(), Config.Spawns[currectSpawnPoint].spawnCoords.x, Config.Spawns[currectSpawnPoint].spawnCoords.y, Config.Spawns[currectSpawnPoint].spawnCoords.z)
                    SetEntityHeading(PlayerPedId(), Config.Spawns[currectSpawnPoint].spawnCoords.w)
                    DestoryCams()
                end)
            elseif Config.Core == "QB-Core" then
                QBCore.Functions.GetPlayerData(function(PlayerData)
                    if PlayerData.metadata['isdead'] then
                        return Config.Notification(Config.Translate['cannot_spawn_on_dead'], 5000, 'error')
                    end
                    SetEntityCoords(PlayerPedId(), Config.Spawns[currectSpawnPoint].spawnCoords.x, Config.Spawns[currectSpawnPoint].spawnCoords.y, Config.Spawns[currectSpawnPoint].spawnCoords.z)
                    SetEntityHeading(PlayerPedId(), Config.Spawns[currectSpawnPoint].spawnCoords.w)
                    DestoryCams()
                end)
            end
        else
            SetEntityCoords(PlayerPedId(), Config.Spawns[currectSpawnPoint].spawnCoords.x, Config.Spawns[currectSpawnPoint].spawnCoords.y, Config.Spawns[currectSpawnPoint].spawnCoords.z)
            SetEntityHeading(PlayerPedId(), Config.Spawns[currectSpawnPoint].spawnCoords.w)
            DestoryCams()
        end
    end
end

function DestoryCams()
    SendNUIMessage({action = 'close'})
    Config.Hud:Enable()
    SetCamActive(cam, false)
    cam = nil
    RenderScriptCams(false, true, 2500, true, true)
    SetNuiFocus(false, false)
    SetEntityVisible(PlayerPedId(), true)
    FreezeEntityPosition(PlayerPedId(), false)
    TriggerEvent('vms_spawnselector:WeatherSync', false)
    if Config.Core == "QB-Core" then
        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
        TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
        TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
    end
end

RegisterNetEvent('vms_spawnselector:open')
AddEventHandler('vms_spawnselector:open', function()
    OpenSpawnSelector()
end)

RegisterNetEvent('vms_spawnselector:openSelector')
AddEventHandler('vms_spawnselector:openSelector', function()
    OpenSpawnSelector()
end)

exports('OpenSpawnSelector', OpenSpawnSelector)