AddEventHandler('rcore_prison:client:heartbeat', function(actionType, data)
    local actionType = actionType
    local session = data

    if actionType == 'GYM' then
        local exerciseName = session?.exerciseName
        local percentage = session?.percent
    end
end)
