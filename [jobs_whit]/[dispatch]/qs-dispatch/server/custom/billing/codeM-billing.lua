-- CREATE TABLE IF NOT EXISTS `codem_billing` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `identifier` char(50) DEFAULT NULL,
--   `name` char(50) DEFAULT NULL,
--   `targetidentifier` char(50) DEFAULT NULL,
--   `targetname` char(50) DEFAULT NULL,
--   `amount` char(50) DEFAULT NULL,
--   `invoicelabel` char(50) DEFAULT NULL,
--   `status` char(50) DEFAULT NULL,
--   `societyname` char(50) DEFAULT NULL,
--   `uniqueid` char(50) DEFAULT NULL,
--   `date` char(50) DEFAULT NULL,
--   `dateupdate` char(50) DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   UNIQUE KEY `uniqueid` (`uniqueid`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


if Config.Billing ~= "codeM-billing" then
    return
end

function getBills(source, cb, data)
    MySQL.Async.fetchAll(
        'SELECT * FROM codem_billing WHERE targetidentifier = @identifier AND societyname = @society1 OR societyname = @society2 ORDER BY id DESC LIMIT 100;',
        {
            ['@identifier'] = data.identifier,
            ['@society1'] = GetJobName(source) or '',
            ['@society2'] = 'society_' .. GetJobName(source),
        }, function(results)
            local bills = {}
            print(json.encode(results))
            for key, value in ipairs(results) do
                table.insert(
                    bills,
                    {
                        ["author_name"] = value["name"] or 'Not defined',
                        ["timestamp"] = value["date"] or os.time(os.date("!*t")),
                        ["status"] = value["status"],
                        ["item"] = value["label"] or 'Not defined',
                    }
                )
            end
            DebugPrint(bills)
            cb(bills)
        end)
end

RegisterServerCallback("qs-dispatch:server:getBills", getBills)


function CreateBill(source, cb, data)
    local pData = GetCharacterRPData(source)
    -- generate a unique id standalone dont use the identifier of the player
    local uniqueId = os.time(os.date("!*t"))
    local updateResult =
        MySQL.Sync.execute(
            'INSERT INTO codem_billing (identifier, name, targetidentifier, targetname, amount, invoicelabel, status, societyname, uniqueid, date, dateupdate) VALUES (?,?,?,?,?,?,?,?,?,NOW(),NOW())',
            { pData.identifier, pData?.firstName or '??', pData.identifier, pData?.firstName or '??', data.amount, data.text, 'unpaid', 'police', uniqueId })

    if (updateResult > 0) then
        cb(true)
        DebugPrint('Bill created')
    else
        cb(false)
        DebugPrint('Bill not created')
    end
end

RegisterServerCallback("qs-dispatch:server:codeMBilling:CreateBill", CreateBill)
