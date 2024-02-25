Citizen.CreateThread(function()
    if Config.Weather.script == 'auto' then
        if GetResourceState('qb-weathersync') == 'started' or GetResourceState('qb-weathersync') == 'starting' then
            Config.Weather.script = 'qb-weathersync'
            return
        end
        if GetResourceState('cd_easytime') == 'started' or GetResourceState('cd_easytime') == 'starting' then
            Config.Weather.script = 'cd_easytime'
            return
        end
        if GetResourceState('vSync') == 'started' or GetResourceState('vSync') == 'starting' then
            Config.Weather.script = 'vSync'
            return
        end
        print('Unable to identify weather sync script! Please configure weather sync script in modules/weather')
    end
end)

AddEventHandler('ak47_qb_housing:pausesync', function(pause, time)
    if Config.Weather.script == 'cd_easytime' then
        TriggerEvent('cd_easytime:PauseSync', pause, time)
        if not pause then
            TriggerServerEvent('cd_easytime:SyncMe')
        end
    elseif Config.Weather.script == 'vSync' then
        TriggerEvent('vSync:toggle', pause)
    elseif Config.Weather.script == 'qb-weathersync' then
        if pause then
            TriggerEvent('qb-weathersync:client:DisableSync')
        else
            TriggerEvent('qb-weathersync:client:EnableSync')
        end
    end
end)

function getClock()
    local hour = GetClockHours()
    if hour > 20 or hour < 5 then
        return Config.Weather.nighttime
    else
        return Config.Weather.daytime
    end
end

function SetInteriorTime(time)
    if not DoorCam and Config.Weather.script ~= 'qb-weathersync' then
        NetworkOverrideClockTime(time, 0, 0)
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist(Config.Weather.defaultweather)
        SetWeatherTypeNow(Config.Weather.defaultweather)
        SetWeatherTypeNowPersist(Config.Weather.defaultweather)
    end
end