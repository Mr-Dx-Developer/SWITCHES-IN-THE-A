QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    CreateBlip()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        TriggerServerEvent('ak47_qb_moneywash:init')
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('ak47_qb_moneywash:init')
end)

RegisterNetEvent('ak47_qb_moneywash:notify', function(msg)
    ShowNotification(msg)
end)

function ShowNotification(msg)
    QBCore.Functions.Notify(msg)
end

function CreateBlip()
    for i, v in ipairs(Config.Blips) do
        local blip = AddBlipForCoord(v.pos)
        SetBlipHighDetail(blip, true)
        SetBlipSprite (blip, v.sprite)
        SetBlipScale (blip, v.size)
        SetBlipColour (blip, v.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.name)
        EndTextCommandSetBlipName(blip)
    end
end

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 215)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 280
    DrawRect(_x, _y + 0.0125, 0.025 + factor, 0.03, 0, 0, 0, 75)
end

function DrawText2Ds(x, y, text, scale)
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0.0, 0.0, 0.0, 0.0, 255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

SpawnLocalObject = function(object, coords, cb)
    local model = type(object) == 'number' and object or joaat(object)
    local vector = type(coords) == "vector3" and coords or vec(coords.x, coords.y, coords.z)
    CreateThread(function()
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
