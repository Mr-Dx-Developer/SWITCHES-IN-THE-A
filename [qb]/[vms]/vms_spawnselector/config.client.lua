RegisterNetEvent("vms_spawnselector:WeatherSync")
AddEventHandler("vms_spawnselector:WeatherSync", function(boolean)
    if boolean then
        Wait(150)
        if Config.WeatherSync == 'cd_easytime' then
            TriggerEvent('cd_easytime:PauseSync', true)
        elseif Config.WeatherSync == 'qb-weathersync' then
            TriggerEvent('qb-weathersync:client:DisableSync')
        elseif Config.WeatherSync == 'vSync' then
            TriggerEvent('vSync:toggle', false)
            Wait(100)
            TriggerEvent('vSync:updateWeather', Config.Weather, false)
        end
        Wait(50)
        NetworkOverrideClockTime(Config.Time.hour, Config.Time.minutes, 0)
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist(Config.Weather)
        SetWeatherTypeNow(Config.Weather)
        SetWeatherTypeNowPersist(Config.Weather)
    else
        Wait(150)
        if Config.WeatherSync == 'cd_easytime' then
            TriggerEvent('cd_easytime:PauseSync', false)
        elseif Config.WeatherSync == 'qb-weathersync' then
            TriggerEvent('qb-weathersync:client:EnableSync')
        elseif Config.WeatherSync == 'vSync' then
            TriggerEvent('vSync:toggle', true)
            Wait(100)
            TriggerServerEvent('vSync:requestSync')
        end
    end
end)