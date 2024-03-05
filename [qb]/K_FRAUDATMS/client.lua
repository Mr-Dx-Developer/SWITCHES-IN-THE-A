local QBCore = GetQBVersion()

local nearATM = nil


local inUse = false
local HasItem = false
CreateThread(function()
    if KonfigCL.UseInteractionATM then
        CreateThread(function()
            while true do
                Wait(0)
                local nearATM = FindNearATM()
                if HasItem then
                    if nearATM then
                        local playerPed = PlayerPedId()
                        local playerCoords = GetEntityCoords(playerPed)
                        local atmCoords = GetEntityCoords(nearATM)
                        local atmDist = #(playerCoords - atmCoords)
                        if atmDist <= 1.5 then
                            local forwardx = GetEntityForwardX(nearATM)
                            local forward   = GetEntityForwardVector(nearATM)
                            local x, y, z   = table.unpack(atmCoords + forward * 0.1 )
                            if not inUse then
                                Draw3DText(x, y, z+1.20, '[E] Insert Card')
                                if IsControlJustPressed(0, 38) then
                                    TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_ATM", -1, 1)
                                    inUse = true
                                    Wait(5000)
                                    TriggerServerEvent('k_fraudatms:enterATM') -- i dare you to try exploit it :) stinky cheaters
                                    Wait(1000)
                                    inUse = false
                                    ClearPedTasks(playerPed)
                                end
                            end
                        end
                    else
                        Wait(2000)
                    end
                else
                    Wait(2000)
                end
            end
        end)
        
        CreateThread(function()
            while true do
                Wait(0)
                if QBCore.Functions.HasItem(KonfigSH.ClonedItem) then
                    HasItem = true
                else
                    HasItem = false
                    Wait(1000)
                end
            end
        end)
    else
        RegisterCommand("insertcc", function(source, args, rawCommand)
            local nearATM = FindNearATM() 
            if not inUse then
                if nearATM then
                    if QBCore.Functions.HasItem(KonfigSH.ClonedItem) then
                        local playerPed = PlayerPedId()
                        TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_ATM", -1, 1)
                        inUse = true
                        Wait(5000)
                        TriggerServerEvent('k_fraudatms:enterATM') -- i dare you to try exploit it :) stinky cheaters
                        Wait(1000)
                        ClearPedTasks(playerPed)
                        inUse = false
                    end
                end
            end
        end, false)
    end
end)

RegisterNetEvent("k_fraud2:atmEvent")--
AddEventHandler('k_fraud2:atmEvent', function()-- not used for anything but you can use it and add it to where ever you like
    if QBCore.Functions.HasItem(KonfigSH.ClonedItem) then
        TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_ATM", -1, 1)
        Wait(5000)
        TriggerServerEvent('k_fraudatms:enterATM') -- i dare you to try exploit it :) stinky cheaters
        Wait(1000)
        ClearPedTasks(playerPed)
    end
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
        local model = GetHashKey(v)
        entity = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 1.0, model, false, false, false)
        if entity ~= 0 then
            hidden = false
            return entity
        end
    end
end
