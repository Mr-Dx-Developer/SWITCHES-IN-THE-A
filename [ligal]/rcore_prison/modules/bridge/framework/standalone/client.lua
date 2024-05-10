AddEventHandler('playerSpawned', function()
    local ped = PlayerPedId()
    local time = GetGameTimer()

    while (not HasCollisionLoadedAroundEntity(ped) and (GetGameTimer() - time) < 5000) do
        Wait(0)
    end

    SetTimeout(1000, function()
        TriggerServerEvent('rcore_prison:requestInternalLoad')
    end)
end)