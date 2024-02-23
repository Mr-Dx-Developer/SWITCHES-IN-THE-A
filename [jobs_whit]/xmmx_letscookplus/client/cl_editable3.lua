CreateThread(function()
	if Shop.enableShop then
		local pedModel = Shop.PedModel
		RequestModel(pedModel)
		while not HasModelLoaded(pedModel) do Wait(10) end
		for i = 1, #Shop.PedCoords do
			local coords = Shop.PedCoords[i].coords
			local heading = Shop.PedCoords[i].heading
			local ped = CreatePed(0, pedModel, coords.x, coords.y, coords.z - 1, false, false)
			SetEntityHeading(ped, heading)
			TaskStartScenarioInPlace(ped, Shop.Scenario, true)
			FreezeEntityPosition(ped, true)
			SetEntityInvincible(ped, true)
			SetBlockingOfNonTemporaryEvents(ped, true)
            if Config.Target == "qb-target" then
                exports['qb-target']:AddTargetEntity(ped, {
                    options = {
                        {
                            type = "client",
                            event = "xmmx_letscookplus:OpenShop",
                            icon = "fas fa-shopping-cart",
                            label = Locales[Config.Language].targetinfo["shop_label"],
                            shop = Shop.Stock,
                            shopname = "letscook",
                        }
                    },
                    distance = Config.Distance
                })
            elseif Config.Target == "qtarget" then
                exports['qtarget']:AddTargetEntity(ped, {
                    options = {
                        {
                            type = "client",
                            event = "xmmx_letscookplus:OpenShop",
                            icon = "fas fa-shopping-cart",
                            label = Locales[Config.Language].targetinfo["shop_label"],
                            shop = Shop.Stock,
                            shopname = "letscook",
                        }
                    },
                    distance = Config.Distance
                })
            elseif Config.Target == "ox_target" then
                exports.ox_target:addSphereZone({
                    coords = coords,
                    radius = 1,
                    debug = Config.Debug,
                    options = {
                        {
                            type = "client",
                            event = "xmmx_letscookplus:OpenShop",
                            icon = "fas fa-shopping-cart",
                            label = Locales[Config.Language].targetinfo["shop_label"],
                            shop = Shop.Stock,
                            shopname = "letscook",
                            distance = Config.Distance,
                        },
                    }
                })
            end
		end
	end
end)

RegisterNetEvent('xmmx_letscookplus:OpenShop', function(data)
	if Config.Inventory == "ox" then  
		exports.ox_inventory:openInventory('shop', { type = "letscook" })
    elseif Config.Inventory == "qb" then
		TriggerServerEvent("inventory:server:OpenInventory", "shop", "letscook", data.shop)
    elseif Config.Inventory == "qs" then
		TriggerServerEvent("inventory:server:OpenInventory", "shop", "letscook", data.shop)
	elseif Config.Inventory == "esx" then
        -- ESX Devs can add their custom shop events here
        -- TriggerServerEvent("inventory:server:OpenInventory", "shop", "letscook", data.shop) -- works with qs-inventory for ESX
        print('^1[XMMX-DEBUG] ^4Add custom ESX Shop event in xmmx_letscookplus/client/cl_shops.lua')
    end
end)

function shopBlip(coords, label, sprite, display, scale, color)
    local blip = AddBlipForCoord(coords)
    SetBlipAsShortRange(blip, true)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, color)
    SetBlipScale(blip, scale)
    SetBlipDisplay(blip, display)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)
    return blip
end

CreateThread(function()
    if Shop.enableBlip then
        for i=1, #Shop.blips do
            local blip = Shop.blips[i]
            shopBlip(blip.coords, blip.label, blip.sprite, blip.display, blip.scale, blip.color)
        end
    end
end)