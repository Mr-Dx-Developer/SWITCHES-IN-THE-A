--[[
    Configurable company system, you can create multiple files
    and adapt them to your company system, these are the ones we recommend
    that we bring by default, but you can integrate others.

    Enable Config.Debug to be able to see the log inside DebugPrint.
]]

if Config.Society ~= 'ap-government' then
    return
end

function buyHouseSocietyMoney(src, societyName, societyPaid)
    DebugPrint('Society system, id: ' .. src .. ', society name: ' .. societyName .. ', Paid: ' .. societyPaid)
    exports['ap-government']:chargeCityTax(src, 'Housing', societyPaid, 'bank')
end
