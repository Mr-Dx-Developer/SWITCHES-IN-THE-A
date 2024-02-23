RegisterServerEvent("mHud:EjectPlayers")
AddEventHandler("mHud:EjectPlayers", function(table)
    for i=1, #table do
        if table[i] then
            if tonumber(table[i]) ~= 0 then
                TriggerClientEvent("mHud:EjectPlayer", table[i])
            end
        end
    end
end)