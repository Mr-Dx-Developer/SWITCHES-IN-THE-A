if Config.Billing ~= "codeM-billing" then
    return
end
function CreateBill(amount, text)
    TriggerServerCallback("qs-dispatch:server:codeMBilling:CreateBill", function(data)
        DebugPrint(data)
    end, {
        amount = amount,
        text = text
    })
end