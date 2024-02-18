QBCore = exports['qb-core']:GetCoreObject()

oldjob = nil
local newjob = nil
local Thunterduty = false
local Fisherduty = false
local Cargoduty = false
local Scrapduty = false
local injobclothes = false        
currentVehicle = nil
local vehiclePrice 
local xp
local NpcSpawned = false
local working = false


local handsdrawable = nil
local handstexture = nil
local handspalette = nil
local shirtdrawable = nil
local shirttexture = nil
local shirtpalette = nil
local topdrawable = nil
local toptexture = nil
local toppalette = nil
local pantsdrawable = nil
local pantstexture = nil
local pantspalette = nil
local shoesdrawable = nil
local shoestexture = nil
local shoespalette = nil


Citizen.CreateThread(function()

    while QBCore.Functions.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    oldjob = QBCore.Functions.GetPlayerData().job.name
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)

        if oldjob ~= nil then
            newjob = QBCore.Functions.GetPlayerData().job.name
            if oldjob ~= newjob then
                oldjob = newjob
                if newjob ~= "thunter" then
                    thunterworking = false
                    Thunterduty = false
                    hidethunterwork()
                end
                if newjob ~= "fisher" then
                    fisherworking = false
                    Fisherduty = false
                    hidefisherwork() 
                end
                if newjob ~= "cargo" then
                    cargoworking = false
                    Cargoduty = false
                    hidecargowork()
                end
                if newjob ~= "scrap" then
                    scrapworking = false
                    Scrapduty = false
                    hidescrapwork()
                end
            end

            local Player = QBCore.Functions.GetPlayerData()
            if oldjob == "thunter" then
                jobcoords = Config.Jobscoords.Thuntercoords.coords
                jobtext = Config.Text['thunter-holo']
                xp = Player.metadata["thunterxp"]  
                returncoords = Config.Jobs.TreasureJob.vehiclemenu.returnvehicle                
            elseif oldjob == "fisher" then
                jobcoords = Config.Jobscoords.Fishercoords.coords
                jobtext = Config.Text['fisher-holo']
                xp = Player.metadata["fisherxp"]
                returncoords = Config.Jobs.Fisher.boatmenu.returnvehicle           
            elseif oldjob == "cargo" then
                jobcoords = Config.Jobscoords.Cargocoords.coords
                jobtext = Config.Text['cargo-holo']
                xp = Player.metadata["cargoxp"] 
                returncoords = Config.Jobs.Cargo.chopermenu.returnvehicle                 
            elseif oldjob == "scrap" then
                jobcoords = Config.Jobscoords.ScrapMinercoords.coords
                jobtext = Config.Text['scrap-holo']
                xp = Player.metadata["scrapxp"]  
                returncoords = Config.Jobs.ScrapMiner.vehiclemenu.returnvehicle                
            end
        end
    end
end)




--- Main Menu
local display = false
function SetDisplay(bool)

    display = bool
    SetNuiFocus(bool, bool)
    TriggerScreenblurFadeIn(500)
    SendNUIMessage({
        firstname = QBCore.Functions.GetPlayerData().charinfo.firstname,
        lastname = QBCore.Functions.GetPlayerData().charinfo.lastname,
        job = QBCore.Functions.GetPlayerData().job.name,
        level = xp,
        type="show",
        config = Config,
        gender = QBCore.Functions.GetPlayerData().charinfo.gender,
    })       
end

-- On duty 
RegisterNUICallback('onduty', function(data)
    if oldjob == "fisher" then
        working = fisherworking 
    elseif oldjob == "thunter" then
        working = thunterworking
    elseif oldjob == "cargo" then
        working = cargoworking
    elseif oldjob == "scrap" then
        working = scrapworking
    end
    
    if injobclothes ~= true and working ~= true then
        QBCore.Functions.Notify(Config.Text['notwearing']) 
    end
    local vehiclehealth = GetVehicleBodyHealth(currentVehicle)
    if vehiclehealth == 0 then
        currentVehicle = nil
    end
    if currentVehicle ~= nil and working ~= false then
        QBCore.Functions.Notify(Config.Text['firstreturn']) 
    end  
    if injobclothes ~= false and working ~= true then
        QBCore.Functions.Notify(Config.Text['onduty']) 
        if oldjob == "fisher" then
            showfisherblips()
            Fisherduty = true
            fisherworking = true
        elseif oldjob == "thunter" then
            Thunterduty = true
            thunterworking = true
        elseif oldjob == "cargo" then
            Cargoduty = true
            cargoworking = true
        elseif oldjob == "scrap" then
            Scrapduty = true
            scrapworking = true
        end
    end
    if currentVehicle == nil and working ~= false then
        QBCore.Functions.Notify(Config.Text['offduty'])  
        ReturnClothes()
        if oldjob == "fisher" then
            Fisherduty = false
            fisherworking = false
            hidefisherwork()
        elseif oldjob == "thunter" then
            Thunterduty = false
            thunterworking = false
            hidethunterwork()
        elseif oldjob == "cargo" then
            Cargoduty = false
            cargoworking = false
            hidecargowork()
        elseif oldjob == "scrap" then
            Scrapduty = false
            scrapworking = false
            hidescrapwork()
        end
    end  
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)

        if display ~= false then
            SendNUIMessage(
                {   
                    type="changecolor",
                    thunterduty = Thunterduty,
                    fisherduty = Fisherduty,
                    cargoduty = Cargoduty,
                    scrapduty = Scrapduty,
                }
            )
        else
            Citizen.Wait(800)
        end
    end
end)


--local playerclothes = {}
--function insert(...)
 --   for k, v in pairs({...}) do
 --       playerclothes[k] = v
--    end
--end
--insert(1,2) -- {[1] = 1, [2] = 2} is added to playerclothes[k]

--for k,v in pairs(playerclothes) do
    --  print(k,v)
    -- SetPedComponentVariation(ped, 3, handsdrawable, handstexture, handspalette)
--end
--insert(handsdrawable, handstexture, handspalette, shirtdrawable, shirttexture, shirtpalette, topdrawable, toptexture, toppalette, pantsdrawable, pantstexture, pantspalette, shoesdrawable, shoestexture, shoespalette)

--playerclothes = {} 
--print(playerclothes)

function ReturnClothes()
    local ped = PlayerPedId(-1)

    if pedclothes == true then
        SetPedComponentVariation(ped, 3, handsdrawable, handstexture, handspalette)
        SetPedComponentVariation(ped, 8, shirtdrawable, shirttexture, shirtpalette)
        SetPedComponentVariation(ped, 11, topdrawable, toptexture, toppalette)
        SetPedComponentVariation(ped, 4, pantsdrawable, pantstexture, pantspalette)
        SetPedComponentVariation(ped, 6, shoesdrawable, shoestexture, shoespalette)
        handsdrawable = nil
        handstexture = nil
        handspalette = nil
        shirtdrawable = nil
        shirttexture = nil
        shirtpalette = nil
        topdrawable = nil
        toptexture = nil
        toppalette = nil
        pantsdrawable = nil
        pantstexture = nil
        pantspalette = nil
        shoesdrawable = nil
        shoestexture = nil
        shoespalette = nil
        pedclothes = false
        injobclothes = false 

        QBCore.Functions.Notify("You have changed to Personal Clothes!")
    end
end


RegisterNUICallback('selectClothes', function(data)

    local choice = data["choice"]
    local ped = PlayerPedId(-1)
    local gender = QBCore.Functions.GetPlayerData().charinfo.gender

    if injobclothes == false then
        handsdrawable = GetPedDrawableVariation(ped, 3)
        shirtdrawable = GetPedDrawableVariation(ped, 8)
        topdrawable = GetPedDrawableVariation(ped, 11)
        pantsdrawable = GetPedDrawableVariation(ped, 4)
        shoesdrawable = GetPedDrawableVariation(ped, 6)
    
        handstexture = GetPedTextureVariation(ped, 3)
        shirttexture = GetPedTextureVariation(ped, 8)
        toptexture = GetPedTextureVariation(ped, 11)
        pantstexture = GetPedTextureVariation(ped, 4)
        shoestexture = GetPedTextureVariation(ped, 6)

        handspalette = GetPedPaletteVariation(ped, 3)
        shirtpalette = GetPedPaletteVariation(ped, 8)
        toppalette = GetPedPaletteVariation(ped, 11)
        pantspalette = GetPedPaletteVariation(ped, 4)
        shoespalette = GetPedPaletteVariation(ped, 6)

        pedclothes = true
    end

    if oldjob == "thunter" then
        cfg = Config.Jobs.TreasureJob.clothingmenu
    elseif oldjob == "fisher" then
        cfg = Config.Jobs.Fisher.clothingmenu
    elseif oldjob == "scrap" then
        cfg = Config.Jobs.ScrapMiner.clothingmenu
    elseif oldjob == "cargo" then
        cfg = Config.Jobs.Cargo.clothingmenu
    end

    if pedclothes == true then
        for k,v in pairs(cfg) do
            if choice == "ManUniform" or choice == "WomenUniform" then
                if gender == 0 then
                    SetPedComponentVariation(ped, v.ManUniform.HandsComponent, v.ManUniform.HandsDrawable, v.ManUniform.HandsTexture, 0)
                    SetPedComponentVariation(ped, v.ManUniform.UndershirtComponent, v.ManUniform.UndershirtDrawable, v.ManUniform.UndershirtTexture, 0)
                    SetPedComponentVariation(ped, v.ManUniform.TopComponent, v.ManUniform.TopDrawable, v.ManUniform.TopTexture, 0)
                    SetPedComponentVariation(ped, v.ManUniform.PantsComponent, v.ManUniform.PantsDrawable, v.ManUniform.PantsTexture, 0)
                    SetPedComponentVariation(ped, v.ManUniform.ShoesComponent, v.ManUniform.ShoesDrawable, v.ManUniform.ShoesTexture, 0)
                elseif gender == 1 then
                    SetPedComponentVariation(ped, v.WomenUniform.HandsComponent, v.WomenUniform.HandsDrawable, v.WomenUniform.HandsTexture, 0)
                    SetPedComponentVariation(ped, v.WomenUniform.UndershirtComponent, v.WomenUniform.UndershirtDrawable, v.WomenUniform.UndershirtTexture, 0)
                    SetPedComponentVariation(ped, v.WomenUniform.TopComponent, v.WomenUniform.TopDrawable, v.WomenUniform.TopTexture, 0)
                    SetPedComponentVariation(ped, v.WomenUniform.PantsComponent, v.WomenUniform.PantsDrawable, v.WomenUniform.PantsTexture, 0)
                    SetPedComponentVariation(ped, v.WomenUniform.ShoesComponent, v.WomenUniform.ShoesDrawable, v.WomenUniform.ShoesTexture, 0)
                end
            elseif choice == "ManUniform2" or choice == "WomenUniform2" then
                if gender == 0 then
                    SetPedComponentVariation(ped, v.ManUniform2.HandsComponent, v.ManUniform2.HandsDrawable, v.ManUniform2.HandsTexture, 0)
                    SetPedComponentVariation(ped, v.ManUniform2.UndershirtComponent, v.ManUniform2.UndershirtDrawable, v.ManUniform2.UndershirtTexture, 0)
                    SetPedComponentVariation(ped, v.ManUniform2.TopComponent, v.ManUniform2.TopDrawable, v.ManUniform2.TopTexture, 0)
                    SetPedComponentVariation(ped, v.ManUniform2.PantsComponent, v.ManUniform2.PantsDrawable, v.ManUniform2.PantsTexture, 0)
                    SetPedComponentVariation(ped, v.ManUniform2.ShoesComponent, v.ManUniform2.ShoesDrawable, v.ManUniform2.ShoesTexture, 0)
                elseif gender == 1 then
                    SetPedComponentVariation(ped, v.WomenUniform2.HandsComponent, v.WomenUniform2.HandsDrawable, v.WomenUniform2.HandsTexture, 0)
                    SetPedComponentVariation(ped, v.WomenUniform2.UndershirtComponent, v.WomenUniform2.UndershirtDrawable, v.WomenUniform2.UndershirtTexture, 0)
                    SetPedComponentVariation(ped, v.WomenUniform2.TopComponent, v.WomenUniform2.TopDrawable, v.WomenUniform2.TopTexture, 0)
                    SetPedComponentVariation(ped, v.WomenUniform2.PantsComponent, v.WomenUniform2.PantsDrawable, v.WomenUniform2.PantsTexture, 0)
                    SetPedComponentVariation(ped, v.WomenUniform2.ShoesComponent, v.WomenUniform2.ShoesDrawable, v.WomenUniform2.ShoesTexture, 0)
                end
            elseif choice == "ManUniform3" or choice == "WomenUniform3" then
                if gender == 0 then
                    SetPedComponentVariation(ped, v.ManUniform3.HandsComponent, v.ManUniform3.HandsDrawable, v.ManUniform3.HandsTexture, 0)
                    SetPedComponentVariation(ped, v.ManUniform3.UndershirtComponent, v.ManUniform3.UndershirtDrawable, v.ManUniform3.UndershirtTexture, 0)
                    SetPedComponentVariation(ped, v.ManUniform3.TopComponent, v.ManUniform3.TopDrawable, v.ManUniform3.TopTexture, 0)
                    SetPedComponentVariation(ped, v.ManUniform3.PantsComponent, v.ManUniform3.PantsDrawable, v.ManUniform3.PantsTexture, 0)
                    SetPedComponentVariation(ped, v.ManUniform3.ShoesComponent, v.ManUniform3.ShoesDrawable, v.ManUniform3.ShoesTexture, 0)
                elseif gender == 1 then
                    SetPedComponentVariation(ped, v.WomenUniform3.HandsComponent, v.WomenUniform3.HandsDrawable, v.WomenUniform3.HandsTexture, 0)
                    SetPedComponentVariation(ped, v.WomenUniform3.UndershirtComponent, v.WomenUniform3.UndershirtDrawable, v.WomenUniform3.UndershirtTexture, 0)
                    SetPedComponentVariation(ped, v.WomenUniform3.TopComponent, v.WomenUniform3.TopDrawable, v.WomenUniform3.TopTexture, 0)
                    SetPedComponentVariation(ped, v.WomenUniform3.PantsComponent, v.WomenUniform3.PantsDrawable, v.WomenUniform3.PantsTexture, 0)
                    SetPedComponentVariation(ped, v.WomenUniform3.ShoesComponent, v.WomenUniform3.ShoesDrawable, v.WomenUniform3.ShoesTexture, 0)
                end
            end
        end

        injobclothes = true
        QBCore.Functions.Notify("You have changed to Job Clothes!")
    end
end)


RegisterNUICallback('selectVehicle', function(data)

    local car = data["vehicle"]
    local price = data["price"]
    local ped = PlayerPedId(-1)

    QBCore.Functions.TriggerCallback('core_jobs:getMoney', function(cash)
        if GetVehiclePedIsIn(ped, false) == 0 then
            if cash >= tonumber(price) then 
                closeMenuFull() 
                spawnCar(car)
                vehiclePrice = price
                TriggerServerEvent('core_jobs:selectVehicle', car, price)
            else
                QBCore.Functions.Notify(Config.Text['missingmoney'])
            end
        else 
            QBCore.Functions.Notify(Config.Text['invehicle'])
        end
    end)
end)    

RegisterNUICallback('showTasks', function(data)

    local task = data["tasks"]
    local getxp = data["xpgain"]
    local reward = data["reward"]
    local AmountToFind = data["AmountToFind"]

    local ped = PlayerPedId(-1)

    if GetVehiclePedIsIn(ped, false) == 0 then
        if oldjob == "thunter" then
            if AmountToFind <= AmountChestsFound then
                TriggerServerEvent('core_jobs:addThunterRewards', getxp, reward)
                QBCore.Functions.Notify('You have completed the task!')
                AmountChestsFound = 0
            else
                QBCore.Functions.Notify('You found: [' ..AmountChestsFound.. ' / ' ..AmountToFind.. ']')
            end
        elseif oldjob == "fisher" then
            if AmountToFind <= AmountFishFound then
                TriggerServerEvent('core_jobs:addFisherRewards', getxp, reward)
                QBCore.Functions.Notify('You have completed the task!')
                AmountFishFound = 0
            else
                QBCore.Functions.Notify('You catched: [' ..AmountFishFound.. ' / ' ..AmountToFind.. ']')
            end
        elseif oldjob == "cargo" then
            if AmountToFind <= AmountCarsFound then
                TriggerServerEvent('core_jobs:addCargoRewards', getxp, reward)
                QBCore.Functions.Notify('You have completed the task!')
                AmountCarsFound = 0
            else
                QBCore.Functions.Notify('You found: [' ..AmountCarsFound.. ' / ' ..AmountToFind.. ']')
            end
        elseif oldjob == "scrap" then 
            if AmountToFind <= AmountBatteryFound then
                TriggerServerEvent('core_jobs:addScrapRewards', getxp, reward)
                QBCore.Functions.Notify('You have completed the task!')
                AmountBatteryFound = 0
            else
                QBCore.Functions.Notify('You found: [' ..AmountBatteryFound.. ' / ' ..AmountToFind..']')
            end
        end
    else 
        QBCore.Functions.Notify(Config.Text['invehicle'])
    end
end)    



-- Threads

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
    
        if oldjob ~= nil then
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(), false), jobcoords)               
            if distance < 10.0 then
                if distance < 5.0 then 
                    DrawText3D(jobcoords[1], jobcoords[2], jobcoords[3], jobtext)
                    if (IsControlJustReleased(0, 38) and distance < 2.0) then
                        if display == false then                 
                            SetDisplay(true)
                        end
                    end
                end
            else 
                Citizen.Wait(1000)
            end    
        end
    end
end)

drawtext = true

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        for k,v in pairs(Config.SellingPoints) do
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(), false), v.coords)  
            if distance < 10.0 then 
                if drawtext == true then
                    DrawText3D(v.coords[1], v.coords[2], v.coords[3], v.text)
                    if (IsControlJustReleased(0, 38) and distance < 2.0) then 
                        if oldjob == "thunter" then 
                            TriggerServerEvent('core_jobs:sellGold')
                        elseif oldjob == "fisher" then
                            TriggerServerEvent('core_jobs:sellFish', PriceCatched)
                            PriceCatched = 0
                            AmountCatched = 0
                        elseif oldjob == "scrap" then
                            addBattery()  
                        end
                    end
                end
            end 
        end 
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if oldjob ~= nil then

            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(), false), returncoords)
            if distance < 20.0 then 
                DrawText3D(returncoords[1], returncoords[2], returncoords[3], Config.Text['returncar'])
                if (IsControlJustReleased(0, 38) and distance < 5.0) then                   
                    returnVehicle()
                end
            else
                Citizen.Wait(1500)
            end
        end
    end
end)

/*Citizen.CreateThread(function()
    for k,v in pairs(Config.SellingPoints) do
        local model = GetHashKey(v.NpcModel)
        if not HasModelLoaded(model) then
            RequestModel(model)
            while not HasModelLoaded(model) do
                Citizen.Wait(5)
            end
        end    
        Npc = CreatePed(3, model, v.coords[1], v.coords[2], v.coords[3]-1.0, false, true)
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
end)*/

Citizen.CreateThread(function()
    for k,v in pairs(Config.Jobscoords) do
        local blip = AddBlipForCoord(v.coords)
        SetBlipSprite(blip, v.BlipSprite)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, v.BlipColor)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.BlipText)
        EndTextCommandSetBlipName(blip)
    end 
    for k,v in pairs(Config.SellingPoints) do
        local blip = AddBlipForCoord(v.coords)
        SetBlipSprite(blip, v.BlipSprite)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, v.BlipColor)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.BlipText)
        EndTextCommandSetBlipName(blip)
    end   
end)

Citizen.CreateThread(function()

    local coordx = Config.SellingPoints.ScrapMining.coords[1]
    local coordy = Config.SellingPoints.ScrapMining.coords[2]
    local coordz = Config.SellingPoints.ScrapMining.coords[3]
    local coordw = Config.SellingPoints.ScrapMining.coords[4]


    local generators = {"prop_elecbox_14"} --chesttypes table
    if #generators < 2 then--repeat until 1 chest is spawned
            
        RequestModel("prop_elecbox_14")
        while not HasModelLoaded("prop_elecbox_14") or not HasCollisionForModelLoaded("prop_elecbox_14") do
            Wait(1)
        end					             
        generator = CreateObject(GetHashKey("prop_elecbox_14"),coordx - 1.0,coordy + 0.2 , coordz - 1.0, true, false, true)--object example
        SetEntityAsMissionEntity(generator, true, true)--for it to don't be delete if too far from players
        SetEntityHeading(generator, coordw)
    end
end)  

-- Functions

function spawnCar(car)

    local car = GetHashKey(car)
    local ped = PlayerPedId(-1)


    if currentVehicle ~= nil then 
        DeleteEntity(currentVehicle)
    end
    if carBlip ~= nil then
        RemoveBlip(carBlip)
    end
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end 

    if oldjob == "thunter" then
        local x,y,z = table.unpack(Config.Jobs.TreasureJob.vehiclemenu.spawnvehicle)
        vehicle = CreateVehicle(car, x, y, z, 0.0, true , false)
        SetVehicleNumberPlateText(vehicle, "THUNTER"..tostring(math.random(1000, 9999)))
        carBlip = AddBlipForEntity(vehicle)
        SetBlipSprite(carBlip, 225)
    elseif oldjob == "fisher" then
        local x,y,z = table.unpack(Config.Jobs.Fisher.boatmenu.spawnvehicle)
        vehicle = CreateVehicle(car, x, y, z, 0.0, true , false)
        SetVehicleNumberPlateText(vehicle, "FISHER"..tostring(math.random(1000, 9999)))
        carBlip = AddBlipForEntity(vehicle)
        SetBlipSprite(carBlip, 427)
    elseif oldjob == "cargo" then
        local x,y,z = table.unpack(Config.Jobs.Cargo.chopermenu.spawnvehicle)
        vehicle = CreateVehicle(car, x, y, z, 0.0, true , false)
        SetVehicleNumberPlateText(vehicle, "CARGO"..tostring(math.random(1000, 9999)))
        carBlip = AddBlipForEntity(vehicle)
        SetBlipSprite(carBlip, 481)
    elseif oldjob == "scrap" then
        local x,y,z = table.unpack(Config.Jobs.ScrapMiner.vehiclemenu.spawnvehicle)
        vehicle = CreateVehicle(car, x, y, z, 0.0, true , false)
        SetVehicleNumberPlateText(vehicle, "SMINER"..tostring(math.random(1000, 9999)))
        carBlip = AddBlipForEntity(vehicle)
        SetBlipSprite(carBlip, 225)
    end
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Job Vehicle")
    EndTextCommandSetBlipName(carBlip)
    SetBlipScale(carBlip, 0.7)
    SetBlipColour(carBlip, 8)
    currentVehicle = vehicle    
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleOnGroundProperly(vehicle)
    exports['cdn-fuel']:SetFuel(vehicle, 100.0)
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
end

function returnVehicle()
    local ped = PlayerPedId(-1)
    if currentVehicle ~= nil then
        local vehiclehealth = GetVehicleBodyHealth(currentVehicle)
        if vehiclehealth > 0 then
            if IsPedInAnyVehicle(ped, false) then
                if GetVehiclePedIsIn(ped, false) == currentVehicle then
                    SetEntityAsNoLongerNeeded(currentVehicle)
                    DeleteEntity(currentVehicle)
                    currentVehicle = nil
                    TriggerServerEvent('core_jobs:returnVehicle', vehiclePrice)
                else
                    QBCore.Functions.Notify(Config.Text['notjobcar'])
                end
            else
                QBCore.Functions.Notify(Config.Text['notinsidevehicle'])
            end
        else
            currentVehicle = nil
        end
    else
        QBCore.Functions.Notify(Config.Text['noworkcar'])
    end  
end

function closeMenuFull()
    display = false
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(500)
    SendNUIMessage({
        type="hide",
    })
end

RegisterNUICallback("close", function(data)
    display = false
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(500)    
end)

function notify(str)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(str)
    EndTextCommandThefeedPostTicker(true, false)
end  

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local scale = ((1 / dist) * 2) * (1 / GetGameplayCamFov()) * 100
    if onScreen then
        SetTextColour(255, 255, 255, 255)
        SetTextScale(0.0 * scale, 0.7 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextCentre(true)
        SetTextDropshadow(1, 1, 1, 1, 255)
        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.55 * scale, 4)
        local width = EndTextCommandGetWidth(4)
        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
    end
end

function EnsureAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end
local previousAnim = nil
function StopAnim(ped)
    if previousAnim then
        StopEntityAnim(ped, previousAnim[2], previousAnim[1], true)
        previousAnim = nil
    end
end
function PlayAnimFlags(ped, dict, anim, flags)
    StopAnim(ped)
    EnsureAnimDict(dict)
    local len = GetAnimDuration(dict, anim)
    TaskPlayAnim(ped, dict, anim, 1.0, -1.0, len, flags, 1, 0, 0, 0)
    previousAnim = {dict, anim}
end

function PlayAnimUpper(ped, dict, anim)
    PlayAnimFlags(ped, dict, anim, 49)
end
function PlayAnim(ped, dict, anim)
    PlayAnimFlags(ped, dict, anim, 0)
end

function AttachEntityToPed(prop,bone_ID,x,y,z,RotX,RotY,RotZ)
    local ped = PlayerPedId()
	BoneID = GetPedBoneIndex(ped, bone_ID)
	obj = CreateObject(GetHashKey(prop),  1729.73,  6403.90,  34.56,  true,  true,  true)
	vX,vY,vZ = table.unpack(GetEntityCoords(ped))
	xRot, yRot, zRot = table.unpack(GetEntityRotation(ped,2))
	AttachEntityToEntity(obj,  ped,  BoneID, x,y,z, RotX,RotY,RotZ,  false, false, false, false, 2, true)
	return obj
end




