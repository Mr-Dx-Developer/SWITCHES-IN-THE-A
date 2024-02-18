if Config.Billing ~= "okokBilling" then
    return
end

function CreateBill(amount, text)
    TriggerServerEvent("okokBilling:CreateCustomInvoice", GetPlayerServerId(PlayerId()), tonumber(amount), text, 'Traffic Radar', 'police', 'Police') -- if you using okokBilling you can uncomment this line
end