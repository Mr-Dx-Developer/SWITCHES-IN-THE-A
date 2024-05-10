function SoundDoorOpen()
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'houses_door_open', 0.25)
end

function SoundDoorClose()
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'houses_door_open', 0.25)
end

function SoundDorrBell()
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'doorbell', 0.1)
end
