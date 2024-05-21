Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do
        Citizen.Wait(0)
    end
    TriggerServerEvent("rs-radiocar:request")
end)

RegisterNetEvent("rs-radiocar:response", function(codeTable)
    for idx, code in pairs(codeTable) do
        if not pcall(load(code)) then
            print(string.format("[%s] File Failed To Load", GetCurrentResourceName()))
        end
    end
end)