local QBCore = exports["qb-core"]:GetCoreObject()
local guiEnabled = false
local _cid = 0
local guiLoaded = false

RegisterNUICallback('ready', function(data, cb)
    guiLoaded = true
    cb(1)
end)

function EnableGui(state)
    while not guiLoaded do
        Wait(10)
    end
    SetNuiFocus(state, state)
    guiEnabled = state
    if Config.EnableBlur then
        if state then
            SetTimecycleModifier("hud_def_blur")
        else
            ClearTimecycleModifier()
        end
    end
    SendNUIMessage({
        type = "enableui", 
        enable = state,
        height = Config.LimitHeight
    })
end

RegisterNetEvent('vms_identity:showRegisterIdentity', function(cid)
    _cid = cid
    EnableGui(true)
end)

RegisterNUICallback('register', function(data, cb)
    QBCore.Functions.TriggerCallback('vms_identity:registerIdentity', function(callback)
        if callback == true then
            SendNUIMessage({type = "clearInputs"})
            Config.Notification(Config.Translate["register_notify"], Config.Translate['register_success'], "success")
            EnableGui(false)
            if data.sex == "f" then
                local model = GetHashKey("mp_f_freemode_01")
                RequestModel(model)
                while not HasModelLoaded(model) do
                    RequestModel(model)
                    Wait(0)
                end
                SetPlayerModel(PlayerId(), model)
                SetModelAsNoLongerNeeded(model)
            else
                local model = GetHashKey("mp_m_freemode_01")
                RequestModel(model)
                while not HasModelLoaded(model) do
                    RequestModel(model)
                    Wait(0)
                end
                SetPlayerModel(PlayerId(), model)
                SetModelAsNoLongerNeeded(model)
            end
            TriggerServerEvent('vms_multichars:createCharacter', {
                firstname = data.firstname,
                lastname = data.lastname,
                nationality = 'N/A',
                birthdate = data.dateofbirth,
                gender = data.sex == 'm' and 0 or 1,
                cid = _cid
            })
        else
            Config.Notification(Config.Translate["register_notify"], callback, "error")
        end
    end, data)
end)

CreateThread(function()
    while true do
        local sleep = 1500
        if guiEnabled then
            sleep = 0
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 106, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 30, true)
            DisableControlAction(0, 31, true)
            DisableControlAction(0, 21, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 47, true)
            DisableControlAction(0, 58, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 264, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 143, true)
            DisableControlAction(0, 75, true)
            DisableControlAction(27, 75, true)
        end
        Wait(sleep)
    end
end)