local QBCore = GetQBVersion()

local blackMarketPed = nil
local slipsPed = nil
local electronicPed = nil

local bankerPed = nil

CreateThread(function()
    while true do
        Wait(0)
        local player = PlayerPedId()
        local playerCoords = GetEntityCoords(player)
        local elecDist = #(KonfigCL.ElectronicsBuyLocation - playerCoords)
        local blackMDist = #(KonfigCL.BlackMarketBuyLocation - playerCoords)
        local slipDist = #(KonfigCL.WhiteSlipBuyLocation - playerCoords)
        local bankDist = #(KonfigCL.BankerLocation - playerCoords)
        if blackMDist <= 5.0 then
            if KonfigCL.DrawMakers then
                if KonfigCL.NPCEnable then
                    DrawMarker(2, KonfigCL.BlackMarketBuyLocation.x, KonfigCL.BlackMarketBuyLocation.y, KonfigCL.BlackMarketBuyLocation.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 0, 0, 2, 1, 0, 0, false )
                else
                    DrawMarker(2, KonfigCL.BlackMarketBuyLocation, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 1, 0, 2, 1, 0, 0, false )
                end
            end
            if KonfigCL.QBTarget then
                exports['qb-target']:AddTargetEntity(blackMarketPed, {
                    options = {
                    {
                        type = "client",
                        event = "k_fraudshops:blackmarketShop",
                        icon = 'fas fa-clipboard',
                        label = 'Open Shop.',
                    }
                    },
                    distance = 2.5,
                })
            elseif blackMDist <= 1.0 then 
                if IsControlJustPressed(0, 38) then
                    local ShopItems = {}
                    ShopItems.label = "Blackmarket"
                    ShopItems.items = KonfigCL.BlackmarketItems
                    ShopItems.slots = KonfigCL.BlackmarketItems
                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Blackmarket", ShopItems)
                end
            end
        elseif slipDist <= 5.0 then
            if KonfigCL.DrawMakers then
                if KonfigCL.NPCEnable then
                    DrawMarker(2, KonfigCL.WhiteSlipBuyLocation.x, KonfigCL.WhiteSlipBuyLocation.y, KonfigCL.WhiteSlipBuyLocation.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 0, 0, 2, 1, 0, 0, false )
                else
                    DrawMarker(2, KonfigCL.WhiteSlipBuyLocation, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 1, 0, 2, 1, 0, 0, false )
                end
            end
            if KonfigCL.QBTarget then
                exports['qb-target']:AddTargetEntity(slipsPed, {
                    options = {
                    {
                        type = "client",
                        event = "k_fraudshops:slipShop",
                        icon = 'fas fa-clipboard',
                        label = 'Open Shop.',
                    }
                    },
                    distance = 2.5,
                })
            elseif slipDist <= 1.0 then 
                if IsControlJustPressed(0, 38) then
                    local ShopItems2 = {}
                    ShopItems2.label = "Slip Seller"
                    ShopItems2.items = KonfigCL.SlipItems
                    ShopItems2.slots = KonfigCL.SlipItems
                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "SlipSeller", ShopItems2)
                end
            end
        elseif elecDist <= 5.0 then
            if KonfigCL.DrawMakers then
                if KonfigCL.NPCEnable then
                    DrawMarker(2, KonfigCL.ElectronicsBuyLocation.x, KonfigCL.ElectronicsBuyLocation.y, KonfigCL.ElectronicsBuyLocation.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 0, 0, 2, 1, 0, 0, false )
                else
                    DrawMarker(2, KonfigCL.ElectronicsBuyLocation, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 1, 0, 2, 1, 0, 0, false )
                end
            end
            if KonfigCL.QBTarget then
                exports['qb-target']:AddTargetEntity(electronicPed, {
                    options = {
                    {
                        type = "client",
                        event = "k_fraudshops:electricShop",
                        icon = 'fas fa-clipboard',
                        label = 'Open Shop.',
                    }
                    },
                    distance = 2.5,
                })
            elseif elecDist <= 1.0 then
                if IsControlJustPressed(0, 38) then
                    local ShopItems3 = {}
                    ShopItems3.label = "Electronic Shop"
                    ShopItems3.items = KonfigCL.ElectronicItems
                    ShopItems3.slots = KonfigCL.ElectronicItems
                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Electronic", ShopItems3)
                end
            end
        elseif bankDist <= 5.0 then
            if KonfigCL.Banker then
                if KonfigCL.DrawMakers then
                    if KonfigCL.NPCEnable then
                        DrawMarker(2, KonfigCL.BankerLocation.x, KonfigCL.BankerLocation.y, KonfigCL.BankerLocation.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 0, 0, 2, 1, 0, 0, false )
                    else
                        DrawMarker(2, KonfigCL.BankerLocation, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0.3, 255, 0, 0, 150, 1, 0, 2, 1, 0, 0, false )
                    end
                end
                exports['qb-target']:AddTargetEntity(bankerPed, {
                    options = {
                    {
                        type = "server",
                        event = "k_fraudshops:sellCheck",
                        icon = 'fas fa-clipboard',
                        label = 'Cash in check.',
                    }
                    },
                    distance = 2.5,
                })
            end
        else
            Wait(2000)
        end
    end
end)


RegisterNetEvent("k_fraudshops:electricShop")
AddEventHandler('k_fraudshops:electricShop', function()
    local ShopItems3 = {}
    ShopItems3.label = "Electronic Shop"
    ShopItems3.items = KonfigCL.ElectronicItems
    ShopItems3.slots = KonfigCL.ElectronicItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Electronic", ShopItems3)
end)

RegisterNetEvent("k_fraudshops:slipShop")
AddEventHandler('k_fraudshops:slipShop', function()
    local ShopItems2 = {}
    ShopItems2.label = "Slip Seller"
    ShopItems2.items = KonfigCL.SlipItems
    ShopItems2.slots = KonfigCL.SlipItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "SlipSeller", ShopItems2)
end)

RegisterNetEvent("k_fraudshops:blackmarketShop")
AddEventHandler('k_fraudshops:blackmarketShop', function()
    local ShopItems = {}
    ShopItems.label = "Blackmarket"
    ShopItems.items = KonfigCL.BlackmarketItems
    ShopItems.slots = KonfigCL.BlackmarketItems
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Blackmarket", ShopItems)
end)

Citizen.CreateThread(function()
    if KonfigCL.NPCEnable then
        RequestModel(KonfigCL.BlackMarketNPC)
        while not HasModelLoaded(KonfigCL.BlackMarketNPC) do
            Wait(1)
        end
        RequestModel(KonfigCL.WhiteSlipNPC)
        while not HasModelLoaded(KonfigCL.WhiteSlipNPC) do
            Wait(1)
        end
        RequestModel(KonfigCL.ElectronicNPC)
        while not HasModelLoaded(KonfigCL.ElectronicNPC) do
            Wait(1)
        end

        RequestModel(KonfigCL.BankerNPC)
        while not HasModelLoaded(KonfigCL.BankerNPC) do
            Wait(1)
        end

        blackMarketPed = CreatePed(1, KonfigCL.BlackMarketNPC, KonfigCL.BlackMarketBuyLocation.x, KonfigCL.BlackMarketBuyLocation.y, KonfigCL.BlackMarketBuyLocation.z+-1.0, 0, false, true)
        SetBlockingOfNonTemporaryEvents(blackMarketPed, true)
        SetPedDiesWhenInjured(blackMarketPed, false)
        SetPedCanPlayAmbientAnims(blackMarketPed, true)
        SetEntityHeading(blackMarketPed, 97.0)
        SetPedCanRagdollFromPlayerImpact(blackMarketPed, false)
        SetEntityInvincible(blackMarketPed, true)
        FreezeEntityPosition(blackMarketPed, true)
        TaskStartScenarioInPlace(blackMarketPed, "WORLD_HUMAN_CLIPBOARD", 0, true);
        SetModelAsNoLongerNeeded(blackMarketPed)

        slipsPed = CreatePed(1, KonfigCL.WhiteSlipNPC, KonfigCL.WhiteSlipBuyLocation.x, KonfigCL.WhiteSlipBuyLocation.y, KonfigCL.WhiteSlipBuyLocation.z+-1.0, 0, false, true)
        SetBlockingOfNonTemporaryEvents(slipsPed, true)
        SetPedDiesWhenInjured(slipsPed, false)
        SetPedCanPlayAmbientAnims(slipsPed, true)
        SetEntityHeading(slipsPed, 88.96)
        SetPedCanRagdollFromPlayerImpact(slipsPed, false)
        SetEntityInvincible(slipsPed, true)
        FreezeEntityPosition(slipsPed, true)
        TaskStartScenarioInPlace(slipsPed, "WORLD_HUMAN_CLIPBOARD", 0, true);
        SetModelAsNoLongerNeeded(slipsPed)

        electronicPed = CreatePed(1, KonfigCL.ElectronicNPC, KonfigCL.ElectronicsBuyLocation.x, KonfigCL.ElectronicsBuyLocation.y, KonfigCL.ElectronicsBuyLocation.z+-1.0, 0, false, true)
        SetBlockingOfNonTemporaryEvents(electronicPed, true)
        SetPedDiesWhenInjured(electronicPed, false)
        SetEntityHeading(electronicPed, 0.0)
        SetPedCanPlayAmbientAnims(electronicPed, true)
        SetPedCanRagdollFromPlayerImpact(electronicPed, false)
        SetEntityInvincible(electronicPed, true)
        FreezeEntityPosition(electronicPed, true)
        TaskStartScenarioInPlace(electronicPed, "WORLD_HUMAN_CLIPBOARD", 0, true);
        SetModelAsNoLongerNeeded(electronicPed)

        bankerPed = CreatePed(1, KonfigCL.BankerNPC, KonfigCL.BankerLocation.x, KonfigCL.BankerLocation.y, KonfigCL.BankerLocation.z+-1.0, 0, false, true)
        SetBlockingOfNonTemporaryEvents(bankerPed, true)
        SetPedDiesWhenInjured(bankerPed, false)
        SetEntityHeading(bankerPed, 150.0)
        SetPedCanPlayAmbientAnims(bankerPed, true)
        SetPedCanRagdollFromPlayerImpact(bankerPed, false)
        SetEntityInvincible(bankerPed, true)
        FreezeEntityPosition(bankerPed, true)
        TaskStartScenarioInPlace(bankerPed, "WORLD_HUMAN_CLIPBOARD", 0, true);
        SetModelAsNoLongerNeeded(bankerPed)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    if KonfigCL.NPCEnable then
        DeleteEntity(electronicPed)
        DeleteEntity(slipsPed)
        DeleteEntity(blackMarketPed)
        DeleteEntity(bankerPed)
    end
end)
  