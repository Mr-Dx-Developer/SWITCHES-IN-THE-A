if Config.Billing ~= "jaksam-billing-ui" then
    return
end

function getBills(a, cb, data)
    MySQL.Async.fetchAll(
    "SELECT * FROM billing WHERE receiver_identifier = @identifier AND target IN (@society1, @society2) ORDER BY id DESC LIMIT 100;",
        {
            ['@identifier'] = data.identifier,
            ['@society1'] = GetJobName(a) or '',
            ['@society2'] = 'society_' .. GetJobName(a)

        }, function(results)
        local bills = {}
        for key, value in ipairs(results) do
            table.insert(
                bills,
                {
                    ["author_name"] = value["sender"] or 'Not defined',       -- value["row_name of author name in your SQL"]
                    ["timestamp"] = value["date"] or os.time(os.date("!*t")), -- value["row_name of timestamp in your SQL"]
                    ["status"] = value["status"] or 'unpayed',                -- value["row_name of status in your SQL"]
                    ["item"] = value["item"] or 'Not defined',                -- value["row_name of item/text in your SQL"]
                }
            )
        end
        DebugPrint(bills)
        cb(bills)
    end)
end

RegisterServerCallback("qs-dispatch:server:getBills", getBills)
