
KonfigCL = {}

KonfigCL.NPCEnable = true
KonfigCL.Banker = true -- enable/disable banker
KonfigCL.WhiteSlipNPC = "a_m_m_farmer_01"
KonfigCL.BlackMarketNPC = "a_m_m_socenlat_01"
KonfigCL.ElectronicNPC = "a_m_y_soucent_01"
KonfigCL.BankerNPC = "u_m_m_bankman"

--items to sell to banker

--[[ 
KonfigCL.ElectronicsBuyLocation = vector3(-658.8, -854.79, 24.51)
KonfigCL.BlackMarketBuyLocation = vector3(-173.93, -1265.92, 32.6)
KonfigCL.WhiteSlipBuyLocation = vector3(1220.66, -1270.55, 35.36)
 ]]
KonfigCL.ElectronicsBuyLocation = vector3(0.0, 0.0, 0.0)
KonfigCL.BlackMarketBuyLocation = vector3(0.0, 0.0, 0.0)
KonfigCL.WhiteSlipBuyLocation = vector3(0.0, 0.0, 0.0)

KonfigCL.BankerLocation = vector3(252.949462890625,208.07473754882812,106.2835693359375)

KonfigCL.QBTarget = true

KonfigCL.DrawMakers = true -- draw markers on locations ^^


KonfigCL.BlackmarketItems = {
    [1] = {
        name = "skimmer",
        price = 5000,
        amount = 1,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "blankcard",
        price = 400,
        amount = 10,
        info = {},
        type = "item",
        slot = 2,
    },
    [3] = {
        name = "infousb",
        price = 600,
        amount = 10,
        info = {},
        type = "item",
        slot = 3,
    },
    [4] = {
        name = "stolencard",
        price = 600,
        amount = 10,
        info = {},
        type = "item",
        slot = 4,
    },
}

KonfigCL.SlipItems = {
    [1] = {
        name = "whiteslip",
        price = 500,
        amount = 10,
        info = {},
        type = "item",
        slot = 1,
    },
}

KonfigCL.ElectronicItems = {
    [1] = {
        name = "printer",
        price = 100,
        amount = 1,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "generator",
        price = 1250,
        amount = 1,
        info = {},
        type = "item",
        slot = 2,
    },
    [3] = {
        name = "laptop2",
        price = 750,
        amount = 1,
        info = {},
        type = "item",
        slot = 3,
    },
}



local QBCore = GetQBVersion()
function Notify(message)
    QBCore.Functions.Notify(message)
end
