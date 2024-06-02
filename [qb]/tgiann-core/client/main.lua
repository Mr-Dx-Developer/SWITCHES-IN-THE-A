local HasNuiFocus, IsFocusThreadRunning = false, false
RegisterNetEvent('tgiann-core:nui-focus')
AddEventHandler('tgiann-core:nui-focus', function(hasFocus, hasKeyboard, hasMouse, allControl)
    HasNuiFocus = hasFocus
    TriggerEvent("tgiann-main:focus", HasNuiFocus)
    if HasNuiFocus and not IsFocusThreadRunning then
        CreateThread(function ()
            while HasNuiFocus do
                if hasKeyboard and not allControl then
                    DisableAllControlActions(0)
                    EnableControlAction(0, 249, true)
                elseif hasKeyboard and allControl then
                    DisableControlAction(0, 24, true) -- disable attack
                    DisableControlAction(0, 25, true) -- disable aim
                    DisableControlAction(0, 1, true) -- LookLeftRight
                    DisableControlAction(0, 2, true) -- LookUpDown
                end

                if not hasKeyboard and hasMouse then
                    DisableControlAction(0, 1, true)
                    DisableControlAction(0, 2, true)
                elseif hasKeyboard and not hasMouse then
                    EnableControlAction(0, 1, true)
                    EnableControlAction(0, 2, true)
                end

                Wait(0)
            end
        end)
    end
end)

RegisterNUICallback("uiLoaded", function(data, cb)
    cb(langs[config.lang].js)
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then return end
    while GetResourceState(resourceName) ~= "started" do Wait(100) end
    Wait(1000)
    TriggerEvent("tgiCore:Client:OnPlayerLoaded", PlayerData)
end)

if config.customDeadReviveEvent.active then
    AddEventHandler(config.customDeadReviveEvent.deadEvent, function(data)
        TriggerEvent("tgiCore:playerdead", data ~= nil and data or true)
    end)
    AddEventHandler(config.customDeadReviveEvent.reviveEvent, function(data)
        TriggerEvent("tgiCore:playerdead", data ~= nil and data or false)
    end)
end