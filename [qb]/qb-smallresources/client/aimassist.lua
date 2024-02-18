CreateThread(function()
    while true do
        Wait(500)
        local gamepad = GetLastInputMethod(2)
        if not gamepad then
           SetPlayerTargetingMode(3)
        else
            Wait(2000)
        end
    end
end)