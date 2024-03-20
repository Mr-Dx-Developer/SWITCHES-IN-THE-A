Framework:Core()

function QBLogs(data)
    if not Config.QBLogs then return end
    if data.src == nil then return end
    if data.type == 'joinleave' then
        if data.status ~= nil and data.status == 'loaded' then
            TriggerEvent(
                "qb-log:server:CreateLog",
                data.type,
                "Loaded",
                "green",
                "**".. GetPlayerName(data.src) .. "** (<@"..(QBCore.Functions.GetIdentifier(data.src, 'discord'):gsub("discord:", "") or "unknown").."> |  ||"  ..(QBCore.Functions.GetIdentifier(data.src, 'ip') or 'undefined') ..  "|| | " ..(QBCore.Functions.GetIdentifier(data.src, 'license') or 'undefined') .." | " ..data.citizenid.." | "..data.src..") loaded.."
            )
        else
            TriggerEvent(
                'qb-log:server:CreateLog',
                data.type,
                'Character Deleted',
                'red',
                '**' .. GetPlayerName(data.src) .. '** ' .. data.license .. ' deleted **' .. data.citizenid .. '**..'
            )
        end
    elseif data.type == 'anticheat' then
        TriggerEvent(
            'qb-log:server:CreateLog',
            data.type,
            'Anti-Cheat',
            'white',
            GetPlayerName(data.src) .. ' Has Been Dropped For Character Deletion Exploit', true
        )
    end
end
