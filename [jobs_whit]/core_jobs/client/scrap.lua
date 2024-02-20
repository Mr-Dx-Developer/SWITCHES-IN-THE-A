QBCore = exports['qb-core']:GetCoreObject()



local CurrentSearchLocation = nil
local LastSearchLocation = nil
local SearchLocationBlip = nil
local CurrentBatteryLocation = nil
local scrapblip = false
local generate = false
local AmountFound = 0
local xpgain = nil
local AmountCanFind = nil
local price = nil
local batteriesplaced = false
scrapworking = false
AmountBatteryFound = 0




function hidescrapwork()

    if SearchLocationBlip ~= nil then 
        RemoveBlip(SearchLocationBlip)
        SearchLocationBlip = nil
        scrapblip = false
    end

    if oldjob == "scrap" then
        if currentVehicle ~= nil then
            DeleteVehicle(currentVehicle)
            RemoveBlip(carBlip)
            currentVehicle = nil
        end
    end
    if batteryshown == true then
        SendNUIMessage(
            {
                type = "hidebattery",      
            }
        ) 
        batteryshown = false
    end
    CurrentSearchLocation = nil
    LastSearchLocation = nil
    SearchLocationBlip = nil
    drawtext = true
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        if scrapworking ~= false then
            if generate ~= false then
                SendNUIMessage(
                    {
                        type = "showbattery",
                        found = AmountFound,  
                        needfind = AmountCanFind,      
                    }
                )  
                batteryshown = true      
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
            if oldjob == "scrap" then
                local ped = PlayerPedId()
                if scrapworking then
                    showscrapblips() 
                    generategain()
                    local dist = GetDistanceBetweenCoords(GetEntityCoords(ped, false), CurrentBatteryLocation) 
                    if dist < 5.0 then
                        DrawText3D(CurrentBatteryLocation[1], CurrentBatteryLocation[2], CurrentBatteryLocation[3], Config.Text["search"])
                        if IsControlJustReleased(0, 38) then
                            if GetVehiclePedIsIn(ped, false) == 0 then

                                if AmountFound < AmountCanFind then

                                    QBCore.Functions.Notify(Config.Text["searching"])
                                    BatterySearch()

                                    chance = math.random(1, 100)                                    
                                    if chance < 90 then
                                        AmountFound = AmountFound + 1
                                        AmountBatteryFound = AmountBatteryFound + 1
                                        TriggerServerEvent('core_jobs:addScrapXp', xpgain)
                                        QBCore.Functions.Notify(Config.Text["foundbattery"])
                                    else
                                        QBCore.Functions.Notify(Config.Text["foundnothing"])
                                    end
                                    
                                    generate = false
                                    scrapblip = false
                                else
                                    QBCore.Functions.Notify(Config.Text["cantmore"])
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

local time = 0
local timepassed = 60
local minute = 60

function addBattery()

    local Player = QBCore.Functions.GetPlayerData()
    local xp = Player.metadata["scrapxp"]
    if batteriesplaced == false then
           
        if AmountFound == Config.Jobs.ScrapMiner.GainPerMinute.level0.AmountCanPlace then
            price = Config.Jobs.ScrapMiner.GainPerMinute.level0.price
            AmountFound = AmountFound - AmountFound

            drawtext = false
            QBCore.Functions.Notify(Config.Text['minerworking'])
            batteriesplaced = true
        elseif AmountFound == Config.Jobs.ScrapMiner.GainPerMinute.level5.AmountCanPlace then
            price = Config.Jobs.ScrapMiner.GainPerMinute.level5.price
            AmountFound = AmountFound - AmountFound

            drawtext = false
            QBCore.Functions.Notify(Config.Text['minerworking'])
            batteriesplaced = true
        elseif AmountFound == Config.Jobs.ScrapMiner.GainPerMinute.level10.AmountCanPlace then
            price = Config.Jobs.ScrapMiner.GainPerMinute.level10.price
            AmountFound = AmountFound - AmountFound

            drawtext = false
            QBCore.Functions.Notify(Config.Text['minerworking'])
            batteriesplaced = true    
        elseif AmountFound == Config.Jobs.ScrapMiner.GainPerMinute.level15.AmountCanPlace then
            price = Config.Jobs.ScrapMiner.GainPerMinute.level15.price
            AmountFound = AmountFound - AmountFound

            drawtext = false
            QBCore.Functions.Notify(Config.Text['minerworking'])
            batteriesplaced = true

        elseif AmountFound == Config.Jobs.ScrapMiner.GainPerMinute.level20.AmountCanPlace then
            price = Config.Jobs.ScrapMiner.GainPerMinute.level20.price
            AmountFound = AmountFound - AmountFound

            drawtext = false
            QBCore.Functions.Notify(Config.Text['minerworking'])
            batteriesplaced = true
        else
            QBCore.Functions.Notify(Config.Text['notenough'])
        end                    
    end
end

Citizen.CreateThread(function()

    while true do
        Citizen.Wait(1)

        if drawtext == false then
            local coordx = Config.SellingPoints.ScrapMining.coords[1]
            local coordy = Config.SellingPoints.ScrapMining.coords[2]
            local coordz = Config.SellingPoints.ScrapMining.coords[3]
            local coords = Config.SellingPoints.ScrapMining.coords
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(-1), false), coords)               

            if time < minute then
                if distance < 15.0 then
                    DrawText3D(coordx + 1.0, coordy, coordz + 0.70, 'Generating [~g~$'..price..'~w~ / ~o~1:00~w~]')
                    DrawText3D(coordx + 1.0, coordy, coordz + 0.50, '[~o~0:'..time..'~w~] / [~o~5:00~w~]')
                end
            elseif time >= minute then
                showminutes = math.floor(time / minute)
                showseconds = time - (showminutes * 60)
                if distance < 15.0 then
                    DrawText3D(coordx + 1.0, coordy, coordz + 0.70, 'Generating [~g~$'..price..'~w~ / ~o~1:00~w~]')
                    DrawText3D(coordx + 1.0, coordy, coordz + 0.50, '[~o~'..showminutes..':'..showseconds..'~w~] / [~o~5:00~w~]')
                end    
            end
        else
            Citizen.Wait(1000)
        end
    end
end)


Citizen.CreateThread(function()

    while true do
        Citizen.Wait(1)
        if batteriesplaced == true then

            Citizen.Wait(1000)

            time = time + 1

            if time == timepassed then
                TriggerServerEvent('core_jobs:sellScrap', price) 
                
                QBCore.Functions.Notify('You earnd $'..price)
                timepassed = timepassed + 60
                if time == 300 then
                    timepassed = 60
                    time = 0
                    QBCore.Functions.Notify(Config.Text['neednew'])
                    batteriesplaced = false
                    drawtext = true
                end
            end
        else
            Citizen.Wait(1000)
        end
    end  
end)


function generategain()

    if generate == false then
        local Player = QBCore.Functions.GetPlayerData()
        local xp = Player.metadata["scrapxp"]
            if xp < 500 then
                xpgain = Config.Jobs.ScrapMiner.GainPerMinute.level0.xpgain
                AmountCanFind = Config.Jobs.ScrapMiner.GainPerMinute.level0.AmountCanPlace
            elseif xp >= 500 and xp < 1000 then
                xpgain = Config.Jobs.ScrapMiner.GainPerMinute.level5.xpgain
                AmountCanFind = Config.Jobs.ScrapMiner.GainPerMinute.level5.AmountCanPlace
            elseif xp >= 1000 and xp < 1500 then
                xpgain = Config.Jobs.ScrapMiner.GainPerMinute.level10.xpgain
                AmountCanFind = Config.Jobs.ScrapMiner.GainPerMinute.level10.AmountCanPlace
            elseif xp >= 1500 and xp < 2000 then
                xpgain = Config.Jobs.ScrapMiner.GainPerMinute.level15.xpgain
                AmountCanFind = Config.Jobs.ScrapMiner.GainPerMinute.level15.AmountCanPlace
            elseif xp >= 2000 then
                xpgain = Config.Jobs.ScrapMiner.GainPerMinute.level20.xpgain
                AmountCanFind = Config.Jobs.ScrapMiner.GainPerMinute.level20.AmountCanPlace
            end
        generate = true
    end
end


function showscrapblips()

    if scrapblip == false then
        CurrentSearchLocation = math.random(1, #Config.Jobs.ScrapMiner.ScrapSearchAreas)
        if LastSearchLocation ~= nil then
            while LastSearchLocation == CurrentSearchLocation do
                CurrentSearchLocation = math.random(1, #Config.Jobs.ScrapMiner.ScrapSearchAreas)
            end
        end   
        if SearchLocationBlip ~= nil then 
            RemoveBlip(SearchLocationBlip)
        end

        SearchLocationBlip = AddBlipForRadius(Config.Jobs.ScrapMiner.ScrapSearchAreas[CurrentSearchLocation][1], Config.Jobs.ScrapMiner.ScrapSearchAreas[CurrentSearchLocation][2], Config.Jobs.ScrapMiner.ScrapSearchAreas[CurrentSearchLocation][3],  50.0)
        SetBlipHighDetail(SearchLocationBlip, true)
        SetBlipColour(SearchLocationBlip, 0)
        SetBlipAlpha (SearchLocationBlip, 128)

        LastSearchLocation = CurrentSearchLocation
        for e,q in pairs(Config.Jobs.ScrapMiner.BatterySearchAreas) do

            CurrentBatteryLocation = q[CurrentSearchLocation][math.random(1, #q[CurrentSearchLocation])]

        end
        --if BatteryLocationBlip ~= nil then 
        --    RemoveBlip(BatteryLocationBlip)
        --end
        --BatteryLocationBlip = AddBlipForCoord(CurrentBatteryLocation[1], CurrentBatteryLocation[2], CurrentBatteryLocation[3])
        --SetBlipHighDetail(BatteryLocationBlip, true)
        --SetBlipColour(BatteryLocationBlip, 46)
        --SetBlipSprite(BatteryLocationBlip, 66)
        --SetBlipScale(BatteryLocationBlip, 0.9)
        --BeginTextCommandSetBlipName("STRING")
        --AddTextComponentString("BATTERY")
        --EndTextCommandSetBlipName(BatteryLocationBlip)

        scrapblip = true
    end
end



function BatterySearch()
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

