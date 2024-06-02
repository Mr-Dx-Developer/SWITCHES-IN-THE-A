
RegisterNUICallback('ToggleDoors', function(data, cb)
    ToggleDoors()
    cb(true)
end)

function ToggleDoors()
    if Cooldown(2000) then
        TriggerServerEvent('kq_priv_islands:server:toggleDoors', CURRENT_ISLAND.name)
    end
end
