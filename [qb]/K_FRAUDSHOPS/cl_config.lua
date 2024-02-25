
KonfigCL = {}

KonfigCL.NPCEnable = true
KonfigCL.Banker = true -- enable/disable banker
KonfigCL.WhiteSlipNPC = "a_m_m_farmer_01"
KonfigCL.BlackMarketNPC = "a_m_m_socenlat_01"
KonfigCL.ElectronicNPC = "ig_lifeinvad_01"
KonfigCL.BankerNPC = "u_m_m_bankman"

--items to sell to banker


KonfigCL.ElectronicsBuyLocation = vector4(-658.8, -854.79, 24.51, 0)
KonfigCL.BlackMarketBuyLocation = vector4(-173.93, -1265.92, 32.6, 97.0)
KonfigCL.WhiteSlipBuyLocation = vector4(1220.66, -1270.55, 35.36, 88.96)
KonfigCL.BankerLocation = vector4(248.85, 224.34, 106.29, 150.0)

KonfigCL.EyeTarget = true

KonfigCL.DrawMakers = false -- draw markers on peds 

--to edit item prices edit the below and server.lua
RegisterNetEvent("k_fraudshops:openBlackmarket")
AddEventHandler('k_fraudshops:openBlackmarket', function()
    TriggerEvent("nh-context:createMenu", {
        {
            header = "Blackmarket",
        },
        {
            header = "Skimmer",
            context = "$"..KonfigSH.Prices['Skimmer'],
            event = "k_fraudshops:itemPassthrough",
            args = {'skimmer'}
        },
        {
            header = "Blankcard",
            context = "$"..KonfigSH.Prices['Blankcard'],
            event = "k_fraudshops:itemPassthrough",
            args = {'blankcard'}
        },
        {
            header = "Info USB",
            context = "$"..KonfigSH.Prices['InfoUSB'],
            event = "k_fraudshops:itemPassthrough",
            args = {'infousb'}
        },
        {
            header = "Stolen Credit Card",
            context = "$"..KonfigSH.Prices['StolenCard'],
            event = "k_fraudshops:itemPassthrough",
            args = {'stolencard'}
        },
    })
end)



RegisterNetEvent("k_fraudshops:openSlips")
AddEventHandler('k_fraudshops:openSlips', function()
    TriggerEvent("nh-context:createMenu", {
        {
            header = "Paper Dealer",
        },
        {
            header = "White Slip",
            context = "$"..KonfigSH.Prices['WhiteSlip'],
            event = "k_fraudshops:itemPassthrough",
            args = {'whiteslip'}
        },
    })
end)



RegisterNetEvent("k_fraudshops:openDigitalDen")
AddEventHandler('k_fraudshops:openDigitalDen', function()
    TriggerEvent("nh-context:createMenu", {
        {
            header = "Digital Den",
        },
        {
            header = "Printer",
            context = "$"..KonfigSH.Prices['Printer'],
            event = "k_fraudshops:itemPassthrough",
            args = {'printer'}
        },
        {
            header = "Generator",
            context = "$"..KonfigSH.Prices['Generator'],
            event = "k_fraudshops:itemPassthrough",
            args = {'generator'}
        },
        {
            header = "Laptop",
            context = "$"..KonfigSH.Prices['Laptop'],
            event = "k_fraudshops:itemPassthrough",
            args = {'laptop2'}
        },
    })
end)


RegisterNetEvent("k_fraudshops:itemPassthrough", function(item)
    TriggerServerEvent('k_fraudshops:buyItem', item)
end)

function Notify(message)
    ESX.ShowNotification(message)
end


