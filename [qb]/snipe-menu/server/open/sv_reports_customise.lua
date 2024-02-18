
RegisterNetEvent("snipe-menu:server:toggleReports", function()
    local src = source
    if not hideNoti[src] then
        hideNoti[src] = true
        ShowNotification(src, "You will no longer get report notifications", "error")
    else
        hideNoti[src] = nil
        ShowNotification(src, "You will now get report notifications", "success")
    end
end)

function GetPlayerGameIdentifier(playerId)
    if Config.Core == "QBCore" then
        local player = QBCore.Functions.GetPlayer(playerId)
        if player ~= nil then
            return player.PlayerData.citizenid
        else
            return "Unknown"
        end
    elseif Config.Core == "ESX" then
        local player = ESX.GetPlayerFromId(playerId)
        if player ~= nil then
            return player.identifier
        else
            return "Unknown"
        end
    else
        return "Unknown"
    end
end

RegisterNetEvent("snipe-menu:server:reportSent", function(data)
    local source = source
    local userName = GetPlayerName(source)
    local userChatInfo = {
        sender = userName,
        message = data,
        time = os.time()
    }
    if reports[userName] == nil then
        reports[userName] = {}
    end
    if not reports2[userName] or reports2[userName] ~= source then
        reports2[userName] = source
    end

    if not reports3[userName] then
        reports3[userName] = GetPlayerGameIdentifier(source)
    end
    SendLogs(source, "report", Config.Locales["report_sent"]..": "..data)
    table.insert(reports[userName], userChatInfo)
    for k, v in pairs(onlineAdmins) do
        if v and not hideNoti[k] then
            ShowNotification(k, Config.Locales["report_received_message"].." "..userName, "success")
            TriggerClientEvent("snipe-menu:client:showReportUnread", k)
        end
    end
end)

RegisterNetEvent("snipe-menu:server:adminReply", function(message, userName)
    local adminName = GetPlayerName(source)
    local adminChatInfo = {
        sender = adminName,
        message = message,
        time = os.time()
    }
    table.insert(reports[userName], adminChatInfo)
    SendLogs(source, "report",Config.Locales["report_replied"].." "..userName..": "..message)
    ShowNotification(reports2[userName], Config.Locales["admin_replied"], "success")
    TriggerClientEvent("snipe-menu:client:showReportUnread", reports2[userName])
end)

function ReportClosed(playerId, userName, closedBySrc)
    print("Report closed for "..userName.." ("..playerId..")")
    print("Report closed by "..GetPlayerName(closedBySrc).." ("..closedBySrc..")")
    -- This is trigered when the report is closed for player with playerId and userName
end