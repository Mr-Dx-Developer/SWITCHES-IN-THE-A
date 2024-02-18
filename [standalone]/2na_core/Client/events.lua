RegisterNetEvent("2na_core:Client:HandleCallback")
AddEventHandler("2na_core:Client:HandleCallback", function(name, data) 
    if TwoNa.Callbacks[name] then
        TwoNa.Callbacks[name](data) 
        TwoNa.Callbacks[name] = nil 
    end
end)

RegisterNetEvent("2na_core:getSharedObject")
AddEventHandler("2na_core:getSharedObject", function(cb)
    if cb and type(cb) == 'function' then 
        cb(TwoNa)
    end 
end)
