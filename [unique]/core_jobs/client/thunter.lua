QBCore = exports['qb-core']:GetCoreObject()

thunterworking = false
local GenerateLocation = false
local LastTaskLocation = nil
local CurrentTaskLocation = nil
local TaskLocationBlip = nil
local ChestLocationBlip = nil
local chest
local Radius = Config.Jobs.TreasureJob.Radius
AmountChestsFound = 0






function ChestOpening()
    local ped = PlayerPedId()
    PlayAnim(ped, "amb@world_human_gardener_plant@male@enter", "enter")
    Wait(100)
    while IsEntityPlayingAnim(ped, "amb@world_human_gardener_plant@male@enter", "enter", 3) do
        Wait(0)
    end
    PlayAnim(ped, "amb@world_human_gardener_plant@male@base", "base")
    Wait(100)
    while IsEntityPlayingAnim(ped, "amb@world_human_gardener_plant@male@base", "base", 3) do
        Wait(0)
    end
    if cb then cb() end
    PlayAnim(ped, "amb@world_human_gardener_plant@male@exit", "exit")
    Wait(100)
    while IsEntityPlayingAnim(ped, "amb@world_human_gardener_plant@male@exit", "exit", 3) do
        Wait(0)
    end
end




function hidethunterwork()

    if TaskLocationBlip ~= nil then 
        RemoveBlip(TaskLocationBlip)
        TaskLocationBlip = nil
    end
    if oldjob == "thunter" then
        if currentVehicle ~= nil then
            DeleteVehicle(currentVehicle)
            RemoveBlip(carBlip)
            currentVehicle = nil
        end
    end
    if chest ~= nil then
        SetEntityAsNoLongerNeeded(chest)
        DeleteEntity(chest)
    end  
    GenerateLocation = false
    LastTaskLocation = nil
    CurrentTaskLocation = nil
    TaskLocationBlip = nil
end



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if oldjob ~= nil then
            if oldjob == "thunter" then
                if thunterworking then
                    showthunterblips()
                    GenerateLocation = true

                    if GenerateLocation == true then

                        local ped = PlayerPedId()
                        local distance = GetDistanceBetweenCoords(GetEntityCoords(ped, false), CurrentChestLocation) 

                        if distance < 4.0 then 
                            DrawText3D(CurrentChestLocation[1],CurrentChestLocation[2],CurrentChestLocation[3] + 0.3, Config.Text['nearchest'])
                            if IsControlJustReleased(0, 38) then
                                if GetVehiclePedIsIn(ped, false) == 0 then

                                    QBCore.Functions.Notify(Config.Text["opening"])
                                    ChestOpening()

                                    DeleteEntity(chest)

                                    RequestModel("xm_prop_x17_chest_open")
                                    while not HasModelLoaded("xm_prop_x17_chest_open") or not HasCollisionForModelLoaded("xm_prop_x17_chest_open") do
                                        Wait(1)
                                    end					        
                                    openchest = CreateObject(GetHashKey("xm_prop_x17_chest_open"),CurrentChestLocation[1],CurrentChestLocation[2],CurrentChestLocation[3],true, false, true)--object example
                                    SetEntityAsNoLongerNeeded(openchest)

                                    local random = math.random(1, 100)
                                    if random ~= nil then
                                        found = random
                                    else
                                        found = nil
                                    end
                                        
                                    if found ~= nil then
                                        if found >= 90 then
                                            lootfound = "nothing"
                                            QBCore.Functions.Notify(Config.Text['foundnothing'])
                                        elseif found < 90 and found >= 30 then
                                            lootfound = "goldchain"
                                            QBCore.Functions.Notify(Config.Text['foundchain'])
                                        elseif found < 30 and found >= 3 then
                                            lootfound = "goldbar"
                                            QBCore.Functions.Notify(Config.Text['foundbar'])
                                        elseif found < 3 then
                                            lootfound = "diamond_ring"
                                            QBCore.Functions.Notify(Config.Text['foundring'])
                                        end  
                                    end

                                    for k,v in pairs(Config.Jobs.TreasureJob.items) do
                                        if k == lootfound then
                                            AmountChestsFound = AmountChestsFound + 1
                                            xpfound = v.xpgain
                                            TriggerServerEvent('core_jobs:addGold', lootfound) 
                                            TriggerServerEvent('core_jobs:addXp', xpfound)
                                        end
                                    end
                                    GenerateLocation = false
                                else
                                    QBCore.Functions.Notify(Config.Text['insidevehicle'])
                                end
                            end   
                        end   
                    end
                else
                    Citizen.Wait(2000)
                end
            end
        end
    end
end)


function showthunterblips()

    if GenerateLocation == false then
        
        CurrentTaskLocation = math.random(1, #Config.Jobs.TreasureJob.TaskZones)
        if LastTaskLocation ~= nil then
            while LastTaskLocation == CurrentTaskLocation do
                CurrentTaskLocation = math.random(1, #Config.Jobs.TreasureJob.TaskZones)
                Citizen.Wait(1)
            end
        end            
        if TaskLocationBlip ~= nil then 
            RemoveBlip(TaskLocationBlip)
        end
        TaskLocationBlip = AddBlipForRadius(Config.Jobs.TreasureJob.TaskZones[CurrentTaskLocation][1], Config.Jobs.TreasureJob.TaskZones[CurrentTaskLocation][2], Config.Jobs.TreasureJob.TaskZones[CurrentTaskLocation][3], Radius)
        SetBlipHighDetail(TaskLocationBlip, true)
        SetBlipColour(TaskLocationBlip, 0)
        SetBlipAlpha (TaskLocationBlip, 128)

        LastTaskLocation = CurrentTaskLocation
        for e,q in pairs(Config.Jobs.TreasureJob.ChestZones) do

            CurrentChestLocation = q[CurrentTaskLocation][math.random(1, #q[CurrentTaskLocation])]
                
        end   
        --if ChestLocationBlip ~= nil then 
         --   RemoveBlip(ChestLocationBlip)
        --end
        --ChestLocationBlip = AddBlipForCoord(CurrentChestLocation[1], CurrentChestLocation[2], CurrentChestLocation[3])
        --SetBlipHighDetail(ChestLocationBlip, true)
        --SetBlipColour(ChestLocationBlip, 46)
        --SetBlipSprite(ChestLocationBlip, 66)
        --SetBlipScale(ChestLocationBlip, 0.9)
        --BeginTextCommandSetBlipName("STRING")
        --AddTextComponentString("Treasure Chest")
        --EndTextCommandSetBlipName(ChestLocationBlip)

        local chesttypes = {"xm_prop_x17_chest_closed"} --chesttypes table
        if #chesttypes < 2 then--repeat until 1 chest is spawned

            RequestModel("xm_prop_x17_chest_closed")
            while not HasModelLoaded("xm_prop_x17_chest_closed") or not HasCollisionForModelLoaded("xm_prop_x17_chest_closed") do
                Wait(1)
            end					             
            chest = CreateObject(GetHashKey("xm_prop_x17_chest_closed"),CurrentChestLocation[1],CurrentChestLocation[2],CurrentChestLocation[3],true, false, true)--object example
            SetEntityAsMissionEntity(chest, true, true)--for it to don't be delete if too far from players                                      
        end  
    end
end