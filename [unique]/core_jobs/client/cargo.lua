QBCore = exports['qb-core']:GetCoreObject()

cargoworking = false
local CargozonesBlip = nil
local pickupvehicle = nil
local location
local deliveryloc = nil
local NpcClient = nil
local NpcBlip = nil

local selected = {}
local cargoblips = {}
local cargoblip = false

local price = 0
local xpgain = 0
AmountCarsFound = 0





function hidecargowork()

    if CargozonesBlip ~= nil then
        for _,v in ipairs(cargoblips) do 
            RemoveBlip(v)
        end
        cargoblip = false
        CargozonesBlip = nil
    end
    selected = {}
    if oldjob == "cargo" then
        if currentVehicle ~= nil then
            DeleteVehicle(currentVehicle)
            RemoveBlip(carBlip)
            currentVehicle = nil
        end
    end
    if pickupvehicle ~= nil then
        DeleteVehicle(pickupvehicle)
        pickupvehicle = nil
    end
    if NpcClient ~= nil then
        DeletePed(NpcClient)
        NpcClient = nil
    end
    if NpcBlip ~= nil then
        RemoveBlip(NpcBlip)
        NpcBlip = nil
    end
    if healthshown == true then
        SendNUIMessage(
            {
                type = "hidehealth",      
            }
        )     
        healthshown = false
    end
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        if cargoworking ~= false then
            if pickupvehicle ~= nil then
                SendNUIMessage(
                    {
                        type = "showhealth",
                        health = math.round(GetVehicleBodyHealth(pickupvehicle) / 10),  
                    }
                )     
                healthshown = true
                
            end
        else
            Citizen.Wait(2000)
        end    
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if oldjob ~= nil then
            if oldjob == "cargo" then
                if cargoworking then
                    local ped = PlayerPedId(-1)
                    showcargoblip()
                    if pickupvehicle == nil then
                        local Player = QBCore.Functions.GetPlayerData()
                        if cargoblip ~= false then
                            local xp = Player.metadata["cargoxp"]

                            local veh0 = Config.Jobs.Cargo.pickupvehicles.level0[math.random(1, #Config.Jobs.Cargo.pickupvehicles.level0)] 
                            local veh5 = Config.Jobs.Cargo.pickupvehicles.level5[math.random(1, #Config.Jobs.Cargo.pickupvehicles.level5)] 
                            local veh10 = Config.Jobs.Cargo.pickupvehicles.level10[math.random(1, #Config.Jobs.Cargo.pickupvehicles.level10)] 
                            local veh15 = Config.Jobs.Cargo.pickupvehicles.level15[math.random(1, #Config.Jobs.Cargo.pickupvehicles.level15)] 
                            local veh20 = Config.Jobs.Cargo.pickupvehicles.level20[math.random(1, #Config.Jobs.Cargo.pickupvehicles.level20)] 

                            local random = math.random(1,2)
                            local random1 = math.random(1,3)
                            if xp < 500 then
                                veh = veh0
                            elseif xp >= 500 and xp < 1000 then
                                if random == 1 then
                                    veh = veh0
                                elseif random == 2 then
                                    veh = veh5
                                end
                            elseif xp >= 1000 and xp < 1500 then
                                if random1 == 1 then
                                    veh = veh0
                                elseif random1 == 2 then
                                    veh = veh5
                                elseif random1 == 3 then
                                    veh = veh10
                                end
                            elseif xp >= 1500 and xp < 2000 then
                                if random1 == 1 then
                                    veh = veh5
                                elseif random1 == 2 then
                                    veh = veh10
                                elseif random1 == 3 then
                                    veh = veh15
                                end    
                            elseif xp >= 2000 then
                                if random1 == 1 then
                                    veh = veh10
                                elseif random1 == 2 then
                                    veh = veh15
                                elseif random1 == 3 then
                                    veh = veh20
                                end
                            end
                            pickupCar(veh.car)  
                            xpgain = veh.xpgain
                            price = veh.price
                        end
                    end      
                    
                    if pickupvehicle ~= nil then
                        if GetVehicleBodyHealth(pickupvehicle) <= 200 then
                            for _,v in ipairs(cargoblips) do
                                if CargozonesBlip ~= nil then 
                                    RemoveBlip(v)
                                end
                            end
                            if NpcClient ~= nil then
                                RemoveBlip(NpcBlip)
                                DeletePed(NpcClient)
                            end
                            SetEntityAsNoLongerNeeded(pickupvehicle)
                            selected = {}
                            cargoblip = false
                            pickupvehicle = nil
                            deliveryloc = nil
            
                            price = 0
                            xpgain = 0
                            QBCore.Functions.Notify(Config.Text['damaged'])
                        end
                    end

                    if currentVehicle == GetVehiclePedIsIn(ped, false) then
                        if IsVehicleAttachedToCargobob(currentVehicle, pickupvehicle) then
                            for _,v in ipairs(cargoblips) do
                                if CargozonesBlip ~= nil then 
                                    RemoveBlip(v)
                                end
                            end
                            deliverlocations()
                        end
                        if NpcClient ~= nil then
                            local distance = GetDistanceBetweenCoords(GetEntityCoords(pickupvehicle, false), deliveryloc)

                            if not IsVehicleAttachedToCargobob(currentVehicle, pickupvehicle) then 
                                if GetEntityHeightAboveGround(pickupvehicle) < 2.0 then
                                    if distance < 10.0 then
                                        --local dist = GetDistanceBetweenCoords(GetEntityCoords(ped, false), deliveryloc) 

                                        QBCore.Functions.Notify(Config.Text['delivered'])
                                        TriggerServerEvent('core_jobs:addCargoXp', xpgain)
                                        selected = {}
                                        cargoblip = false
                                        Citizen.Wait(5000)
                                        TriggerServerEvent('core_jobs:sellCargo', price)
                                        RemoveBlip(NpcBlip)
                                        DeletePed(NpcClient)
                                        DeleteVehicle(pickupvehicle)

                                        deliveryloc = nil
                                        pickupvehicle = nil
                                        price = 0
                                        xpgain = 0
                                    end        
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


function deliverlocations()

    for k,v in pairs(Config.Jobs.Cargo.CargoDropAreas) do
        if deliveryloc == nil then
            QBCore.Functions.Notify(Config.Text['foundsuccesfully'])
            AmountCarsFound = AmountCarsFound + 1
            deliveryloc = v.deliverlocations[math.random(1, #v.deliverlocations)] 

            NpcBlip = AddBlipForCoord(deliveryloc)
            SetBlipSprite(NpcBlip, 434)
            SetBlipScale(NpcBlip, 0.8)
            SetBlipColour(NpcBlip, 5)
            SetBlipAsShortRange(NpcBlip, false)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Client")
            EndTextCommandSetBlipName(NpcBlip)

            local model = GetHashKey("a_m_y_stbla_02")
            if not HasModelLoaded(model) then
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Citizen.Wait(5)
                end
            end    
            Npc = CreatePed(3, model, deliveryloc[1], deliveryloc[2], deliveryloc[3], false, true)
            NpcClient = Npc
            PlaceObjectOnGroundProperly(Npc)
            Citizen.Wait(2000)

            TaskSetBlockingOfNonTemporaryEvents(Npc, 1)
            SetEntityInvincible(Npc, true)
            SetPedRandomComponentVariation(Npc)
            SetPedRandomProps(Npc)
            SetPedCanRagdoll(Npc, true)
            SetEntityCollision(Npc, 1, 0)
            FreezeEntityPosition(Npc, true)
        end
    end
end


function showcargoblip()

    if cargoblip == false then
        for k,v in pairs(Config.Jobs.Cargo.CargoDropAreas) do

            while #selected < 2 do   -- how many locations will be shown (now 2)          
                loc = v.pickuplocations[math.random(1, #v.pickuplocations)] 

                for _,v in ipairs(selected) do
                    if loc == v then
                        return
                    end
                end
                table.insert(selected, loc)
            end 

            for _,v in ipairs(selected) do

                local random = math.random(-100.00, 100.00)

                CargozonesBlip = AddBlipForRadius(v[1]+random, v[2]+random, v[3], 200.0)
                SetBlipHighDetail(CargozonesBlip, true)
                SetBlipColour(CargozonesBlip, 0)
                SetBlipAlpha (CargozonesBlip, 128)
                
                table.insert(cargoblips, CargozonesBlip)
            end
        end
        cargoblip = true
    end
end


function pickupCar(car)

    location = selected[math.random(1,2)]   
    Citizen.Wait(500)
    local car = GetHashKey(car)
    local ped = PlayerPedId(-1)
        
    if pickupvehicle ~= nil then 
        DeleteEntity(pickupvehicle)
    end
            
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end 
    vehicle = CreateVehicle(car, location[1], location[2], location[3], 0.0, true , false)
    pickupvehicle = vehicle
    SetVehicleNumberPlateText(vehicle, "REQUESTED"..tostring(math.random(1000, 9999)))
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleOnGroundProperly(vehicle)
    exports['cdn-fuel']:SetFuel(vehicle, 100.0)

    --pickupvehicleBlip = AddBlipForEntity(vehicle)
    --SetBlipSprite(pickupvehicleBlip, 134)
    --BeginTextCommandSetBlipName("STRING")
    --AddTextComponentString("PICKUP CAR")
    --EndTextCommandSetBlipName(pickupvehicleBlip)
    --SetBlipScale(pickupvehicleBlip, 0.7)
    --SetBlipColour(pickupvehicleBlip, 8)

end





