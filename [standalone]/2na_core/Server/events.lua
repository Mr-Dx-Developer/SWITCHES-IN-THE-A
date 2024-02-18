RegisterNetEvent("2na_core:Server:HandleCallback")
AddEventHandler("2na_core:Server:HandleCallback", function(name, payload)
    local source = source

    if TwoNa.Callbacks[name] then
        TwoNa.Callbacks[name](source, payload, function(cb) 
            TriggerClientEvent("2na_core:Client:HandleCallback", source, name, cb)
        end)
    end 
end)

AddEventHandler("onResourceStart", function(resourceName)
    if GetCurrentResourceName() == resourceName then 
        TwoNa.CheckUpdate()
    end 
end)