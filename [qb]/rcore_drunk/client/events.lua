if not Config.DisableDeathDetection then
    AddEventHandler('baseevents:onPlayerDied', function(killedBy, pos)
        SetBlockingStatusForDrunk(true)
    end)

    AddEventHandler('playerSpawned', function()
        SetBlockingStatusForDrunk(false)
    end)

    CreateThread(function()
        local switchMe = false
        while true do
            Wait(100)
            if GetEntityHealth(PlayerPedId()) == 0 then
                if not switchMe then
                    switchMe = true
                    SetBlockingStatusForDrunk(true)
                end
            else
                if switchMe then
                    switchMe = false
                    SetBlockingStatusForDrunk(false)
                end
            end
        end
    end)
end