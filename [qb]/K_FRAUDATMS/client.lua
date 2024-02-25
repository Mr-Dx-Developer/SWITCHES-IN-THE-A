local nearATM = nil


local inUse = false
local HasItem = false
RegisterCommand("insertcc", function(source, args, rawCommand)
    local nearATM = FindNearATM() 
    if not inUse then
        if nearATM then
            TriggerServerEvent('k_fraudatms:hasCard')
        end
    end
end, false)

RegisterNetEvent("k_fraud2:atmEvent")--
AddEventHandler('k_fraud2:atmEvent', function()-- not used for anything but you can use it and add it to where ever you like
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_ATM", -1, 1)
    inUse = true
    Wait(5000)
    local pedCoords = GetEntityCoords(playerPed)
    TriggerServerEvent('k_fraudatms:enterATM', pedCoords) -- i dare you to try exploit it :) stinky cheaters
    Wait(1000)
    ClearPedTasks(playerPed)
    inUse = false
end)




function Draw3DText(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end


function FindNearATM()
    
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    for k, v in pairs(KonfigCL.ATMModels) do
        print(v)
        local model = GetHashKey(v)
        entity = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 1.0, model, false, false, false)
        if entity ~= 0 then
            hidden = false
            return entity
        end
    end
end
