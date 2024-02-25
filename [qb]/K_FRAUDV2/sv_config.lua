KonfigSV = {}

KonfigSV.RequireJob = false
KonfigSV.Jobs = {-- You can add as many as you like
    'scammer',
    --'mechanic',
}

function Notify(message)
    TriggerClientEvent('esx:showNotification', source, message)
end

function CustomItemAddExploitChecks(source, item, amount)
    -- add your own anti exploit techniques 
    --print(item, amount, source)
    return true -- return true to continue (return false to not give the player the item)
end

function DropExploiter(source, item, amount)
    --print(source, item, amount)
    DropPlayer(source, 'Exploiting')
end
