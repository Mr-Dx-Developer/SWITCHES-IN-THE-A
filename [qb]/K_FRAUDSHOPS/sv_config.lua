KonfigSV = {}



---Banker
KonfigSV.SetCheckSellPrice = false --set to false to enable random sell price or a number to have a set price
--example KonfigSV.SetCheckSellPrice = 1000 -- $1000
KonfigSV.CheckSellMin = 500
KonfigSV.CheckSellMax = 2250

KonfigSV.PoliceAlert = true -- enable or disable alerts to police you can change the chances in server.lua line 7

function Notify(message)
    TriggerClientEvent('esx:showNotification', source, message)
end