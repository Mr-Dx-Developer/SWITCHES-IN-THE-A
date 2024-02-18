RegisterNetEvent("codem-market:OpenMarketUI")
AddEventHandler("codem-market:OpenMarketUI", function()
    TriggerServerEvent('codem-market-server-checkmoney')
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "SET_DATA",
        item = Config.items,
        locales = Config.Locale,
    })
    SendNUIMessage({
        type = "SET_CURRENT_SHOP",
        shop = "24/7"
    })
end)

RegisterNUICallback('closepage',function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('itemsend',function(data)
    TriggerServerEvent('codem-market-server-checkmoney')
    for k,v in pairs(data.item) do 
       TriggerServerEvent('codem-market-server-addItem', v.itemCode,v.amount,v.price,data.bank)
    end
end)


RegisterNetEvent('codem-market-client-checkmoney')
AddEventHandler('codem-market-client-checkmoney', function(a,b,c)
    SendNUIMessage({
        type = "SET_MONEY",
        money = a,
        bank = b,
        name = c
    })
end)

RegisterNUICallback("PlayDropSound", function(data, cb)
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)