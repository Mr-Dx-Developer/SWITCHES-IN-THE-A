KonfigSV = {}

KonfigSV.SaleLogsWebhook = "" --Insert discord webhook between ""

KonfigSV.SetAmount = false --set to false to use random amount vv

----- requires above to false
KonfigSV.CardMaxAmount = 1500 
KonfigSV.CardMinAmount = 100 
-----------------------------


function Notify(message)
    TriggerClientEvent('esx:showNotification', source, message)
end