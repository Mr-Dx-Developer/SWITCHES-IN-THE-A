QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}

Citizen.CreateThread(function()
    while QBCore == nil do
        Citizen.Wait(1000)
    end
    while QBCore.Functions == nil do
        Citizen.Wait(100)
    end
    while QBCore.Functions.GetPlayerData() == nil do
        Citizen.Wait(100)
    end
    PlayerData = QBCore.Functions.GetPlayerData()
    createBlip()
end)

function createBlip()
    local coords = Config.Blip.pos
    local radius = Config.Blip.radius + 0.00
    local blipRd = AddBlipForRadius(coords, radius)
    SetBlipHighDetail(blipRd, true)
    SetBlipColour(blipRd, Config.Blip.color)
    SetBlipAlpha (blipRd, 128)
    SetBlipAsShortRange(blipRd, true)
    local blip = AddBlipForCoord(coords)
    SetBlipHighDetail(blip, true)
    SetBlipSprite (blip, Config.Blip.id)
    SetBlipScale  (blip, Config.Blip.size)
    SetBlipColour (blip, Config.Blip.color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Blip.name)
    EndTextCommandSetBlipName(blip)
end

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('ak47_qb_hookahlounge:notify')
AddEventHandler('ak47_qb_hookahlounge:notify', function(msg)
    QBCore.Functions.Notify(msg)
end)

RegisterNetEvent('ak47_qb_hookahlounge:progress')
AddEventHandler('ak47_qb_hookahlounge:progress', function(msg, time)
    QBCore.Functions.Progressbar(msg, msg, time, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done

    end, function()

    end)
end)

local effectRunning = false
AddEventHandler('ak47_qb_hookahlounge:smoke', function()
    TriggerServerEvent('hud:server:RelieveStress', math.random(3, 8))
    if not effectRunning then
        effectRunning = true
        SetTimecycleModifierStrength(0.0)
        SetTimecycleModifier('spectator5')
        SetPedMotionBlur(PlayerPedId(), true)
        Citizen.Wait(1000)
        SetTimecycleModifierStrength(0.1)
        Citizen.Wait(1000)
        SetTimecycleModifierStrength(0.2)
        Citizen.Wait(1000)
        SetTimecycleModifierStrength(0.3)
        Citizen.Wait(1000)
        SetTimecycleModifierStrength(0.4)
        Citizen.Wait(1000)
        SetTimecycleModifierStrength(0.5)
        Citizen.Wait(1000)
        ShakeGameplayCam('DRUNK_SHAKE', 2.5)
        Citizen.Wait(3000)
        RequestClipSet('MOVE_M@DRUNK@SLIGHTLYDRUNK')
        while not HasClipSetLoaded('MOVE_M@DRUNK@SLIGHTLYDRUNK') do
            Citizen.Wait(0)
        end
        while inSession do
            SetPedMovementClipset(PlayerPedId(), 'MOVE_M@DRUNK@SLIGHTLYDRUNK', true)
            Citizen.Wait(1000)
        end
        effectRunning = false
        SetTimecycleModifierStrength(0.4)
        Citizen.Wait(3000)
        SetTimecycleModifierStrength(0.3)
        Citizen.Wait(4000)
        SetTimecycleModifierStrength(0.2)
        Citizen.Wait(5000)
        SetTimecycleModifierStrength(0.1)
        Citizen.Wait(6000)
        ClearTimecycleModifier()
        ShakeGameplayCam('DRUNK_SHAKE', 0.0)
        SetPedMotionBlur(PlayerPedId(), false)
        ResetPedMovementClipset(PlayerPedId(), 0)
    end
end)

function playAnim(dir, anim, blendIn, blendOut, duration, flag, playbackRate)
    local playerPed = PlayerPedId()
    RequestAnimDict(dir)
    while not HasAnimDictLoaded(dir) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(playerPed, dir, anim, blendIn + 0.0, blendOut + 0.0, duration, flag, playbackRate, 0, 0, 0)
end

function drawMarker(type, posX, posY, posZ, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, r, g, b, a, bobUpAndDown, faceCamera, p19, rotate, textureDict, textureDict, textureDict)
    DrawMarker(type, posX, posY, posZ, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, r, g, b, a, bobUpAndDown, faceCamera, p19, rotate, textureDict, textureDict, textureDict)
end

function tofloat(value)
    return tonumber(string.format("%.2f", value))
end

function ShowHelpNotification(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

function DrawText3D(coords, text, size, font)
    local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local camCoords      = GetGameplayCamCoords()
    local dist           = GetDistanceBetweenCoords(camCoords, coords.x, coords.y, coords.z, true)
    local size           = size

    if size == nil then
        size = 1
    end

    local scale = (size / dist) * 2
    local fov   = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(font)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(x, y)
    end
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

deleteObject = function(object)
    SetEntityAsMissionEntity(object, false, true)
    DeleteObject(object)
end