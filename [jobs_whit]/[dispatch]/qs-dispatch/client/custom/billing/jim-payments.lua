if Config.Billing ~= "jim-payments" then
    return
end

function CreateBill(amount, text)
    WarningPrint('Jim payments does not compatible with create invoice system, you can try create it and send in our community discord.')
end