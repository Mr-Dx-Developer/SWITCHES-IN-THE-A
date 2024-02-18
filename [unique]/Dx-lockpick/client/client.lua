local dataReturn = nil 
local t = 0
local lockpickCallback = nil

dur = math.random(10,30)

RegisterNUICallback("complete", function()
    SetNuiFocus(false, false)
    dataReturn = true
    if lockpickCallback then
        lockpickCallback(dataReturn)
    end
end)

AddEventHandler('Dx-lockpick:client:openLockpick', function(callback)
    lockpickCallback = callback
    exports['Dx-lockpick']:LockPick(dur,"Car Robbery","You have 10 seconds to complete the minigame!")
end)

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
    dataReturn = false
    if lockpickCallback then
        lockpickCallback(dataReturn)
    end
end)

RegisterNUICallback("failed", function()
    SetNuiFocus(false, false)
    dataReturn = false
    if lockpickCallback then
        lockpickCallback(dataReturn)
    end
end)

function LockPick(duration, title, text)
    local result = nil

    SendNUIMessage({
        action = "MENU_OPEN",
        time = duration,
        title = title,
        text = text
    })
    SetNuiFocus(true, true)

    while true do 
        Wait(1000)
        t = t + 1
        
        if t == duration then
            return false
        end

        if dataReturn ~= nil then 
            return dataReturn
        end

    end

end

exports('LockPick', LockPick)

