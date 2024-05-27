StatusPlayersLabel = {}
ClosestStatusPlayers = {}

if Config.EnablePlayer3DText then
    RegisterNetEvent(TriggerName("SetStatusPlayer"), function(id, drunkLabel)
        StatusPlayersLabel[id] = drunkLabel
    end)

    CreateThread(function()
        while true do
            Wait(1000)
            if LastDrunkLabel ~= GetDrunkLevelFor3DText() then
                LastDrunkLabel = GetDrunkLevelFor3DText()
                TriggerServerEvent(TriggerName("SetStatusPlayer"), LastDrunkLabel)
            end
        end
    end)

    CreateThread(function()
        while true do
            Wait(1000)
            ClosestStatusPlayers = {}
            for k, v in pairs(StatusPlayersLabel) do
                if GetPlayerFromServerId(k) ~= -1 then
                    if #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(k)))) < 10 then
                        table.insert(ClosestStatusPlayers, {
                            ID = k,
                            label = v,
                        })
                    end
                end
            end
        end
    end)

    CreateThread(function()
        while true do
            Wait(0)
            if #ClosestStatusPlayers ~= 0 then
                for k, v in pairs(ClosestStatusPlayers) do
                    local pos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(v.ID)))

                    Render3DText(pos + vector3(0, 0, 1), 0.3, 0.3, {
                        r = 255,
                        g = 255,
                        b = 255,
                        a = 255,
                    }, _U(v.label))
                end
            else
                Wait(1000)
            end
        end
    end)
end