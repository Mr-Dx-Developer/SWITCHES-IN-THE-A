RegisterNetEvent(TriggerName("SetStatusPlayer"), function(label)
    TriggerClientEvent(TriggerName("SetStatusPlayer"), -1, source, label)
end)