if Config.Billing ~= "jaksam-billing-ui" then
    return
end

function CreateBill(amount, text)
    TriggerServerEvent("billing_ui:sendBill", GetPlayerServerId(PlayerId()), 'society_police', text, amount)
end
