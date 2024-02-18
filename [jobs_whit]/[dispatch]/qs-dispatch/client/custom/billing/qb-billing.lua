if Config.Billing ~= "okokBilling" then
    return
end

function CreateBill(amount, text)
    -- TriggerServerEvent("okokBilling:CreateCustomInvoice", GetPlayerServerId(PlayerId()), tonumber(amount), text, 'Traffic Radar', 'police', 'Police')                                                                                                          -- if you using okokBilling you can uncomment this line


    -- receiverid = the player receiving the invoice
    -- ammount = amount of the invoice to be paid
    -- isSociety = always use true, you may get failures if you set it to false
    -- isAlreadyPayed = if false, the invoice must be paid, if true, the invoice is already paid, but remains as payment history.
    -- giveitem = true if you want to give the invoice item, false if you don't.
    -- questToGiveitem = True asks the player if he wants to receive it, false only delivers the invoice or not and does not ask the player
    -- customSocietyName = you can set a custom name to the company, or set it to nil
    TriggerServerEvent('qs-billing:server:CreateInvoice', GetPlayerServerId(PlayerId()), 'Traffic Radar', text, tonumber(amount), true, false, false, false, 'society_police')
end
