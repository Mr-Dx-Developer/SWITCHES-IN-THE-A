if Config.Billing ~= "jim-payments" then
    return
end

function getBills(a, cb, data)
    local invoices = MySQL.Sync.fetchAll("SELECT * FROM phone_invoices WHERE citizenid = ?", {data.identifier})
    if invoices[1] ~= nil then
        local bills = {}

        for _, value in pairs(invoices) do
            table.insert(
                bills,
                {
                    ["author_name"] = value["sender"] or 'Not defined', -- value["row_name of author name in your SQL"]
                    ["timestamp"] = 'N/A', -- value["row_name of timestamp in your SQL"]
                    ["status"] = 'N/A', -- value["row_name of status in your SQL"]
                    ["item"] = (value["amount"] or '0') .. '$', -- value["row_name of item/text in your SQL"]
                }
            )
        end
        DebugPrint(bills)
        WarningPrint('Jim payments does not full compatible  with get invoice system with data (status, timestamp, item(text)), you can try create it and send in our community discord.')
        cb(bills)
    else
        cb({})
    end
end
RegisterServerCallback("qs-dispatch:server:getBills", getBills)
