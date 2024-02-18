Config = {}

-- Shops = "liquorshop" ,  "ltd" , "24/7"
--- Categories drinks, foods, tools

Config.items = {
    [1] = {
        price = 3,
        name = "Coffee",
        itemscode = "coffee",
        category = "drinks",
        shop = "24/7"
    },
    [2] = {
        price = 12,
        name = "Sprunk",
        itemscode = "sprunk",
        category = "drinks",
        shop = "24/7"
    },
    [3] = {
        price = 9,
        name = "Orange Juice",
        itemscode = "orangotang",
        category = "drinks",
        shop = "24/7"
    },
    [4] = {
        price = 2,
        name = "Bottled Water",
        itemscode = "water",
        category = "drinks",
        shop = "24/7"
    },
    [5] = {
        price = 10,
        name = "Cola",
        itemscode = "ecola",
        category = "drinks",
        shop = "24/7"
    },

}

Config.Framework = "newqb" -- esx, newqb, oldqb
Config.InteractionHandler = "qb-target" -- qb-target, bt-target, drawtext, custom
Config.Locale = {
    ["NOT_ENOUGH_MONEY"] = {
        text = "You don't have enough money",
        type = "error"
    },
    ["HELLO"] = {
        text = "Hello"
    },
    ["WELCOME"] = {
        text = "Welcome to"
    },
    ["DRINKS"] = {
        text = "Drinks"
    },
    ["TOOLS"] = {
      text = "Tool"
    },
    ["FOODS"] = {
        text = "Food"
    },
    ["SHOP_NOW"] = {
        text = "Buy"
    },
    ["MY_CART"] = {
        text = "Basket"
    },
    ["TOTAL"] = {
        text = "Total"
    },
    ["CURRENCY"] = {
        text = "$"
    },
    ["PAY_WITH_CASH"] = {
        text = "Pay with cash"
    },
    ["PAY_WITH_CREDIT_CARD"] = {
        text = "Pay by card"
    },
}

Config.NotifyHandler = function(text, type, isClient, src)
    if isClient then
        if Config.Framework == "esx" then
            ESX.ShowNotification(text)
        elseif Config.Framework == "newqb" or Config.Framework == "oldqb"  then
            exports['okokNotify']:Alert('Machine', text, 3000, 'info', true)
        end
    else
        if Config.Framework == "esx" then
            TriggerServerCallback("esx:showNotification", src, text)
        elseif Config.Framework == "newqb" or Config.Framework == "oldqb"  then
            TriggerClientEvent('okokNotify:Alert', src, 'Title', text, 3000, 'info', true)
        end
    end
end


Config.GetFrameWork = function()
    local object = nil
    if Config.Framework == "esx" then
        while object == nil do
            TriggerEvent('esx:getSharedObject', function(obj) object = obj end)
            Citizen.Wait(0)
        end
    end
    if Config.Framework == "newqb" then
        object = exports["qb-core"]:GetCoreObject()
    end
    if Config.Framework == "oldqb" then
        while object == nil do
            TriggerEvent('QBCore:GetObject', function(obj) object = obj end)
            Citizen.Wait(200)
        end
    end
    return object
end