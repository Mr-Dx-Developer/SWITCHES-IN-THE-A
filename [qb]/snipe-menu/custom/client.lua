RegisterNUICallback("custom-clicked", function(_, cb)
    print("Custom button clicked")
end)

RegisterNUICallback("customfetchurl", function(_, cb)
    local p = promise.new()
    TriggerCallback("snipe-menu:server:fetchPlayerListCustom", function(data)
        p:resolve(data)
    end)
    local data = Citizen.Await(p)
    print(json.encode(data)) -- check how this data looks in your f8 console
    cb(data)
end)

RegisterNUICallback("customfetchurl2", function(_, cb)
    local returnData = {"value1", "value2"}
    cb(returnData)
end)

RegisterNUICallback("customPanelSubmit", function(data, cb)
    print("Custom panel submitted", json.encode(data))
    cb("ok")
end)