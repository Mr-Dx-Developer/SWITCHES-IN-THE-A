--- client side

local hold = false
local progress = 0

RegisterNetEvent('qb-restart:server')
AddEventHandler('qb-restart:server', function(newhold)
    hold = newhold
end)

RegisterNetEvent('qb-restart:server')
AddEventHandler('qb-restart:server', function()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "alert", 0.75)
    TriggerServerEvent('qb-weathersync:server:setWeather', 'THUNDER')
    TriggerServerEvent('qb-weathersync:server:toggleBlackout')
    TriggerEvent('hospital:client:Revive')
end)



RegisterNetEvent('qb-restart:server')
AddEventHandler('qb-restart:server', function()
    while progress < 3000 do
        progress = progress + 1
        Wait(3000)
        if progress == 100 then
            progress = "Time done"
            TriggerServerEvent('restart:server')
            break
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if hold == true then
            DrawText2(" ~w~ Server Restarting in [ ~r~".. progress .. "%~w~ ]", 0.015 ,0.)
        end
    end
end)

function DrawText2(text)
    SetTextFont(8)
    SetTextProportional(1)
    SetTextScale(1.0, 0.5)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.43, 0.03)
end