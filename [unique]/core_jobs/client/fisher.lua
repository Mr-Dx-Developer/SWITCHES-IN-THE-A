QBCore = exports['qb-core']:GetCoreObject()




AmountCatched = 0
PriceCatched = 0

fisherworking = false
local FishzonesBlip = nil
local currentZone
local lastZone = false
local XpCatched = 0
local isfishing = false
local showzones = false
local fishblips = {}

AmountFishFound = 0
local giverewards = false
local animationstarted = false
local animationfinished = false
local time = 0





function showfisherblips()
    for k,v in pairs(Config.Jobs.Fisher.FishingAreas) do
        FishzonesBlip = AddBlipForRadius(v.Center, v.Size)
        SetBlipSprite(FishzonesBlip, 9)
        SetBlipAlpha (FishzonesBlip, 128)
        SetBlipColour(FishzonesBlip, 0)

        table.insert(fishblips, FishzonesBlip)
    end
end

  
function hidefisherwork()

    if showzones ~= false then 
        showzones = false
    end
    if FishzonesBlip ~= nil then
        for _,v in ipairs(fishblips) do
            RemoveBlip(v)    
        end
        FishzonesBlip = nil
    end
    if oldjob == "fisher" then
        if currentVehicle ~= nil then
            DeleteVehicle(currentVehicle)
            RemoveBlip(carBlip)
            currentVehicle = nil
        end
    end
    if bucketshown == true then
        SendNUIMessage(
            {
                type = "hidebucket",      
            }
        ) 
        bucketshown = false
    end
end




Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        if fisherworking ~= false then
            SendNUIMessage(
                {
                    type = "showbucket",
                    caught = AmountCatched,  
                    cancatch = 5,      
                }
            )    
            if lastZone ~= false then
                SendNUIMessage(
                {
                    type = "showbucket",
                    caught = AmountCatched,  
                    cancatch = lastZone.AmountCanCatch,  
                }
                )  
            end   
            bucketshown = true      
        else  
            Citizen.Wait(2000)
        end   
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        for k,v in pairs(Config.Jobs.Fisher.FishingAreas) do
            if showzones then
                if oldjob == "fisher" then
                    DrawMarker(v.marker, v.Center[1], v.Center[2], v.Center[3], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                    v.Size*2, v.Size*2, v.Size*0+3.0, v.rgba[1], v.rgba[2], v.rgba[3], v.rgba[4], false, true, 2, nil, nil, false)
                    if (GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(), false), v.Center) < v.Size+5.0) then 
                        DrawText3D(v.Center[1], v.Center[2], v.Center[3]+3.0, v.text)
                        DrawText3D(v.Center[1], v.Center[2], v.Center[3]+2.8, v.textlevel)
                    end
                end
            else
                Citizen.Wait(1000)
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if oldjob ~= nil then
            if oldjob == "fisher" then
                if fisherworking then
                    local zone = inZone()
                    if zone ~= false then
                        currentZone = zone
                    else
                        currentZone = false
                    end
                    showzones = true
                    if currentZone ~= false then
                        lastZone = currentZone
                        if IsControlJustReleased(0, 38) then
                            local ped = PlayerPedId()
                            if GetVehiclePedIsIn(ped, false) == 0 then
                                if not IsPedSwimming(ped) then 
                                    local player = QBCore.Functions.GetPlayerData()
                                    local xp = player.metadata['fisherxp']
                                    if xp >= currentZone.XP then
                                        if AmountCatched < currentZone.AmountCanCatch then

                                            isfishing = true
                                            QBCore.Functions.Notify(Config.Text['working'])
                                                                                    
                                        else
                                            QBCore.Functions.Notify(Config.Text['fullbucket'])
                                        end

                                    else
                                        QBCore.Functions.Notify(Config.Text['notxp'])
                                    end
                                else
                                    QBCore.Functions.Notify(Config.Text['swimming'])
                                end 
                            else
                                QBCore.Functions.Notify(Config.Text['insidevehicle'])
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



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)


        if isfishing then
            local ped = PlayerPedId()

            --Rod = AttachEntityToPed('prop_fishing_rod_01',60309, 0,0,0, 0,0,0)
            if animationstarted == false then
                FishingAnim()
            end
            
            if giverewards == true then

                --DeleteEntity(Rod)

                local random = math.random(1, 100)
                if random ~= nil then
                    catch = random
                else
                    catch = nil
                end
                
                if catch ~= nil then
                    if catch >= 70 then
                        fish = "nothing"
                        QBCore.Functions.Notify(Config.Text['caughtnothing'])
                    elseif catch < 70 and catch >= 20 then
                        fish = "fish"
                        QBCore.Functions.Notify(Config.Text['caughtfish'])
                    elseif catch < 20 and catch >= 3 then
                        fish = "shark"
                        QBCore.Functions.Notify(Config.Text['caughtshark'])
                    elseif catch < 3 then
                        fish = "goldfish"
                        QBCore.Functions.Notify(Config.Text['caughtgoldfish'])
                    end  
                end
                for k,v in pairs(Config.Jobs.Fisher.items) do
                    if k == fish then
                        if lastZone.AmountCanCatch >= AmountCatched + v.weight then
                            AmountFishFound = AmountFishFound + 1
                            AmountCatched = AmountCatched + v.weight
                            PriceCatched = PriceCatched + v.price
                            XpCatched = v.xpgain
                            TriggerServerEvent('core_jobs:addfishXp', XpCatched)
                        else
                            QBCore.Functions.Notify(Config.Text['tooheavy'])
                        end
                        isfishing = false
                        animationstarted = false
                        giverewards = false
                    end
                end
            end
        end
    end
end)




function inZone()
    local ped = GetPlayerPed(-1)
    local pedcoords = GetEntityCoords(ped)

    for __, z in ipairs(Config.Jobs.Fisher.FishingAreas) do
        if GetDistanceBetweenCoords(z.Center, pedcoords) <= z.Size then
            return z
        end
    end

    return false
end





function FishingAnim() --- vyksta 18 sec
    animationstarted = true
    local ped = PlayerPedId()
    Rod = AttachEntityToPed('prop_fishing_rod_01',60309, 0,0,0, 0,0,0)
    PlayAnim(ped, "amb@world_human_stand_fishing@base", "base")
    Wait(100)
    while IsEntityPlayingAnim(ped, "amb@world_human_stand_fishing@base", "base", 3) do
        Wait(0)
    end
    PlayAnim(ped, "amb@world_human_stand_fishing@idle_a", "idle_c")
    Wait(100)
    while IsEntityPlayingAnim(ped, "amb@world_human_stand_fishing@idle_a", "idle_c", 3) do
        Wait(0)
    end
    if cb then cb() end
    PlayAnim(ped, "amb@world_human_stand_fishing@base", "base")
    Wait(100)
    while IsEntityPlayingAnim(ped, "amb@world_human_stand_fishing@base", "base", 3) do
        Wait(0)
    end
    animationfinished = true
    DeleteEntity(Rod)
end



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if isfishing == true then
            Citizen.Wait(1000)

            time = time + 1

            if animationfinished == true then --- vyksta 18 sec animacija
                if time >= 17 then
                    animationfinished = false
                    giverewards = true
                    time = 0
                else
                    QBCore.Functions.Notify(Config.Text['interferedfisher'])
                    animationfinished = false
                    time = 0
                    isfishing = false
                    animationstarted = false
                end
            end
        end
    end
end)