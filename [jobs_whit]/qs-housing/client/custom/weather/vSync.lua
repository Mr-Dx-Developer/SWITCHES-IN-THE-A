--[[
    Here you have the weather tyme configuration, you can modify it or even
    create your own! In case your inventory is not here, you can ask the
    creator to create a file following this example and add it!
]]

if Config.Weather ~= 'vSync' then
    return
end

RegisterNetEvent('housing:client:weatherSync')
AddEventHandler('housing:client:weatherSync', function(bool)
    local hour = GetClockHours()
    if bool then
        Wait(150)
        if hour >= 6 and hour <= 20 then
            TriggerEvent('vSync:updateWeather', 'EXTRASUNNY', false)
            TriggerEvent('vSync:toggle', false)
            TriggerEvent('vvSync:updateTime', 12, 0, true)
            if Config.RemoveRain then SetRainLevel(0.0) end
            ClearOverrideWeather()
            ClearWeatherTypePersist()
            DebugPrint('El tiempo cambió a DESPEJADO porque estás dentro.')
        else
            TriggerEvent('vSync:updateWeather', 'EXTRASUNNY', false)
            TriggerEvent('vSync:toggle', false)
            TriggerEvent('vvSync:updateTime', 0, 0, true)
            if Config.RemoveRain then SetRainLevel(0.0) end
            ClearOverrideWeather()
            ClearWeatherTypePersist()
            DebugPrint('El tiempo cambió a DESPEJADO porque estás dentro.')
        end
    else
        Wait(150)
        TriggerEvent('vSync:toggle', true)
        TriggerServerEvent('vSync:requestSync')
        DebugPrint('El tiempo se sincronizó al salir del interior.')
    end
end)
