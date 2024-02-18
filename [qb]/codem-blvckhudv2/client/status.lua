RegisterNetEvent("esx_status:onTick")
AddEventHandler("esx_status:onTick", function(data)
    for _,v in pairs(data) do
        if v.name == "hunger" then
            SendNUIMessage({
                type = "set_status",
                statustype = "hunger",
                value =  v.percent,
            })
        elseif v.name == "thirst" then
            SendNUIMessage({
                type = "set_status",
                statustype = "thirst",
                value =  v.percent,
            })
        end
    end
end)


Citizen.CreateThread(function()
    local ped = PlayerPedId()
    while true do
        Citizen.Wait(100)
        SetRadarZoom(1100)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        SetBigmapActive(false, false)
    end
end)

RegisterNetEvent('esx_status:update')
AddEventHandler('esx_status:update', function(data)
    for _,v in pairs(data) do
        if v.name == "hunger" then
            SendNUIMessage({
                type = "set_status",
                statustype = "hunger",
                value =  v.percent,
            })
        elseif v.name == "thirst" then
            SendNUIMessage({
                type = "set_status",
                statustype = "thirst",
                value =  v.percent,
            })
        end
    end
end)

RegisterNetEvent('ui:updateStatus')
AddEventHandler('ui:updateStatus', function(data)
    for _,v in pairs(data) do
        if v.name == "hunger" then
            SendNUIMessage({
                type = "set_status",
                statustype = "hunger",
                value =  v.percent,
            })
        elseif v.name == "thirst" then
            SendNUIMessage({
                type = "set_status",
                statustype = "thirst",
                value =  v.percent,
            })
        end
    end
end)

RegisterNetEvent('esx_customui:updateStatus')
AddEventHandler('esx_customui:updateStatus', function(data)
    for _,v in pairs(data) do
        if v.name == "hunger" then
            SendNUIMessage({
                type = "set_status",
                statustype = "hunger",
                value =  v.percent,
            })
        elseif v.name == "thirst" then
            SendNUIMessage({
                type = "set_status",
                statustype = "thirst",
                value =  v.percent,
            })
        end
    end
end)

RegisterNetEvent("hud:client:UpdateNeeds")
AddEventHandler("hud:client:UpdateNeeds", function(newHunger, newThirst)
    SendNUIMessage({
        type = "set_status",
        statustype = "hunger",
        value =  newHunger,
    })
    SendNUIMessage({
        type = "set_status",
        statustype = "thirst",
        value =  newThirst,
    })
end)

Citizen.CreateThread(function()
    if Config.Framework == "esx" then
        WaitPlayer()
        Citizen.Wait(2500)
        TriggerEvent('esx_status:getStatus', 'hunger', function(hunger)
            TriggerEvent('esx_status:getStatus', 'thirst', function(thirst)
                local myhunger = hunger.getPercent()
                local mythirst = thirst.getPercent()
                SendNUIMessage({
                    type = "set_status",
                    statustype = "hunger",
                    value =  myhunger,
                })
                SendNUIMessage({
                    type = "set_status",
                    statustype = "thirst",
                    value =  mythirst,
                })
            end)
        end)
    else
        WaitPlayer()
        local myhunger = frameworkObject.Functions.GetPlayerData().metadata["hunger"]
        local mythirst = frameworkObject.Functions.GetPlayerData().metadata["thirst"]
        Citizen.Wait(2500)
    
        SendNUIMessage({
            type = "set_status",
            statustype = "hunger",
            value =  myhunger,
        })
        SendNUIMessage({
            type = "set_status",
            statustype = "thirst",
            value =  mythirst,
        })

    end
    local playerPed = playerPed
    local health = GetEntityHealth(playerPed)
    local val = health-100

    if GetEntityModel(playerPed) == `mp_f_freemode_01` then
        val = (health+25)-100
    end
    SendNUIMessage({
        type = "set_status",
        statustype = "health",
        value = val,
    })
end)

local lastHealth = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1250)
        local playerPed = playerPed
        local health = GetEntityHealth(playerPed)
        if lastHealth ~= health then
            local val = health-100
            if GetEntityModel(playerPed) == `mp_f_freemode_01` then
                val = (health+25)-100
            end
            SendNUIMessage({
                type = "set_status",
                statustype = "health",
                value = val,
            })

            lastHealth = health
        end
    end
end)

RegisterNUICallback('ResetHudPositions', function()
    TriggerServerEvent('codem-blvckhudv2:UpdateData', "positionsData", {})

end)

RegisterNUICallback('hudselected', function(data)
    local hudtype = data.type
    local defaultAspectRatio = 1920/1080 -- Don't change this.
    local resolutionX, resolutionY = GetActiveScreenResolution()
    local aspectRatio = resolutionX/resolutionY
    local minimapOffset = 0
    if aspectRatio > defaultAspectRatio then
        minimapOffset = ((defaultAspectRatio-aspectRatio)/3.6)-0.008
    end
    TriggerServerEvent('codem-blvckhudv2:UpdateData', data.settingstype, data.val)
    if data.settingstype == "hud" then

        if data.val == "radial" then
            local playerPed = playerPed
            local armour = GetPedArmour(playerPed)
            SendNUIMessage({
                type = "armour_update",
                armour = armour,
            })
            if Config.Framework == "esx" then
    
            else
                local myhunger = frameworkObject.Functions.GetPlayerData().metadata["hunger"]
                local mythirst = frameworkObject.Functions.GetPlayerData().metadata["thirst"]
                SendNUIMessage({
                    type = "set_status",
                    statustype = "hunger",
                    value =  myhunger,
                })
                SendNUIMessage({
                    type = "set_status",
                    statustype = "thirst",
                    value =  mythirst,
                })
            end
        
    
            local health = GetEntityHealth(playerPed)
            local val = health-100
            if GetEntityModel(playerPed) == `mp_f_freemode_01` then
                val = (health+25)-100
            end
            SendNUIMessage({
                type = "set_status",
                statustype = "health",
                value = val,
            })
        end
    end
end)