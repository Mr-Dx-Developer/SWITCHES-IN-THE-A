QBCore = nil
PlayerData = {}

Citizen.CreateThread(function()
    while QBCore == nil do
        QBCore = exports['qb-core']:GetCoreObject()
        Citizen.Wait(1000)
    end
    while QBCore.Functions == nil do
        Citizen.Wait(0)
    end
    while QBCore.Functions.GetPlayerData() == nil do
        Citizen.Wait(0)
    end
    PlayerData = QBCore.Functions.GetPlayerData()
    createBlip()
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px, py, pz) - vector3(x, y, z))
    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0 * scale, 0.35 * scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function createBlip()
    for i, v in pairs(Config.Shop) do
        if v.blip.enable then
            local coords = v.boss_action
            local radius = v.blip.radius + 0.00
            local blipRd = AddBlipForRadius(coords, radius)
            SetBlipHighDetail(blipRd, true)
            SetBlipColour(blipRd, v.blip.radius_color)
            SetBlipAlpha (blipRd, 128)
            SetBlipAsShortRange(blipRd, true)
            local blip = AddBlipForCoord(coords)
            SetBlipHighDetail(blip, true)
            SetBlipSprite (blip, v.blip.sprite)
            SetBlipScale (blip, v.blip.size)
            SetBlipColour (blip, v.blip.color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.blip.name)
            EndTextCommandSetBlipName(blip)
        end
    end
end

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('ak47_qb_business:notify')
AddEventHandler('ak47_qb_business:notify', function(msg)
    QBCore.Functions.Notify(msg)
end)

RegisterNetEvent('ak47_qb_business:progress')
AddEventHandler('ak47_qb_business:progress', function(msg, time)
    QBCore.Functions.Progressbar(msg, msg, time, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done

    end, function()

    end)
end)

SpawnLocalObject = function(object, coords, cb)
    SpawnObject(object, coords, cb, false)
end

SpawnLocalObject = function(object, coords, cb, networked)
    local model = type(object) == 'number' and object or GetHashKey(object)
    local vector = type(coords) == "vector3" and coords or vec(coords.x, coords.y, coords.z)
    Citizen.CreateThread(function()
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(4)
        end
        local obj = CreateObject(model, vector.xyz, false, false, true)
        if cb then
            cb(obj)
        end
    end)
end

function playAnimProcess(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

function ShowHelpNotification(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

function LocalInput(text, number, windows)
    AddTextEntry("FMMC_MPM_NA", text)
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", windows or "", "", "", "", number or 30)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
    local result = GetOnscreenKeyboardResult()
        return result
    end
end
