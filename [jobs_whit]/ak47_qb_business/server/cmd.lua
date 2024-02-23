QBCore.Commands.Add('refill', 'Refill Stock', {}, false, function(source, args)
    if Config.Shop[args[1]] then
        if tonumber(args[2]) then
            refillShop(args[1], tonumber(args[2]))
        else
            TriggerClientEvent('ak47_qb_business:notify', source, 'Must be number!')
        end
    else
        TriggerClientEvent('ak47_qb_business:notify', source, 'Invalid job name!')
    end
end, 'admin')

QBCore.Commands.Add('setprice', 'Set Stock Price', {}, false, function(source, args)
    if Config.Shop[args[1]] then
        if tonumber(args[2]) then
            setPrice(args[1], tonumber(args[2]))
        else
            TriggerClientEvent('ak47_qb_business:notify', source, 'Must be number!')
        end
    else
        TriggerClientEvent('ak47_qb_business:notify', source, 'Invalid job name!')
    end
end, 'admin')

QBCore.Commands.Add('refill-item', 'Refill Stock Item', {}, false, function(source, args)
    if Config.Shop[args[1]] then
        if GetItemLabel(args[2]) then
            if tonumber(args[3]) then
                refillShopItem(args[1], args[2], tonumber(args[3]))
            else
                TriggerClientEvent('ak47_qb_business:notify', source, 'Must be number!')
            end
        else
            TriggerClientEvent('ak47_qb_business:notify', source, 'Invalid item!')
        end
    else
        TriggerClientEvent('ak47_qb_business:notify', source, 'Invalid job name!')
    end
end, 'admin')

QBCore.Commands.Add('setprice-item', 'Set Item Price', {}, false, function(source, args)
    if Config.Shop[args[1]] then
        if GetItemLabel(args[2]) then
            if tonumber(args[3]) then
                setPriceItem(args[1], args[2], tonumber(args[3]))
            else
                TriggerClientEvent('ak47_qb_business:notify', source, 'Must be number!')
            end
        else
            TriggerClientEvent('ak47_qb_business:notify', source, 'Invalid item!')
        end
    else
        TriggerClientEvent('ak47_qb_business:notify', source, 'Invalid job name!')
    end
end, 'admin')
