local QBCore = exports['qb-core']:GetCoreObject()
local   IsHoldingDoor = false
local   DoneWithDoors = false
local   DoneWithExtras = false
local   BrokenDoors = 0
local   CurrentPart = ""
local   enginePart = false
local   seat1Part = false
local   seat2Part = false
local   exaustPart = false
local   DonWithAll = false
local   EndMission = false

local function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end

DrawText3Ds = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

CreateThread(function()
    for k, v in pairs(ChopBlip) do
        if v.showBlip then
            local chop = AddBlipForCoord(ChopBlip[k].pos.x, ChopBlip[k].pos.y, ChopBlip[k].pos.z)
            SetBlipSprite (chop, 380)
            SetBlipDisplay(chop, 4)
            SetBlipScale  (chop, 0.95)
            SetBlipAsShortRange(chop, true)
            SetBlipColour(chop, 38)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(ChopBlip[k].label)
            EndTextCommandSetBlipName(chop)
        end
    end
end)

Citizen.CreateThread(function()
    exports['qb-target']:AddBoxZone("scrapyard", vector3(2403.68, 3127.8, 48.15), 0.8, 0.6, {
        name="scrapyard",
        heading=334,
        --debugPoly=true,
        minZ=45.15,
        maxZ=49.15
    }, {
            options = {
                {
                    type = "client",
                    event = "qb-chop:client:GetCooldown",
                    icon = "fas fa-sign-in-alt",
                    label = "Disassemble a car",
                },
            },
        distance = 2.5
    })
end)

RegisterNetEvent("qb-chop:client:GetCooldown", function()
    QBCore.Functions.TriggerCallback('qb-chop:server:getcooldown', function(cooldown)
        if cooldown == 0 then
            QBCore.Functions.TriggerCallback('qb-chop:server:setcooldown', function(oskar)
                if oskar == 0 then
                    TriggerEvent("qb-chop:client:Chopstart")
                end
            end, Config.CooldownTime)
        else
            QBCore.Functions.Notify('Come back in' .. math.floor(cooldown / 58 /59).. ' hours.', "primary")
        end
    end)
end)


RegisterNetEvent("qb-chop:client:Chopstart", function()
    CurrentCarPos = Config.ChopingLocations["Positions"][math.random(1,4)].spawn

    local vehicleInTheWay = IsAnyVehicleNearPoint(CurrentCarPos.x, CurrentCarPos.y, CurrentCarPos.z, 2.0)
    local model = Config.VehicleModel
    QBCore.Functions.Notify("You started the mission, go to the car and start demolish the car.", "success", 4500)

    if vehicleInTheWay then
        QBCore.Functions.Notify("Vehicle is in the way, try again.", "error", 4500)
    else
        EndMission = true 
        QBCore.Functions.SpawnVehicle(model, function(veh)
            SetVehicleEngineHealth(veh, 0)
            for i = 0, 5 do
                Wait(500)
                SetVehicleDoorOpen(veh, i, true, true)
            end

            for k, v in pairs(Config.ChopingLocations["Positions"]) do
                if v.spawn == CurrentCarPos then 
                    currentPos = v.label
                    TeblePos = v.TeblePos
                end
            end 

            local TableProp = CreateObject(GetHashKey(Config.TebleModel), TeblePos.x, TeblePos.y, TeblePos.z, 1, 1, 0)
            PlaceObjectOnGroundProperly(TableProp)
            FreezeEntityPosition(TableProp)
            SetEntityAsMissionEntity(TableProp)

            for k, v in pairs(Config.DoorTextPos[currentPos]) do
                CreateThread(function()
                    while true do 
                        sleep = 1000
                        local player = PlayerPedId()
                        local Pos = GetEntityCoords(player)
                        currentDoor = Config.Labels[k].label
                        id = Config.Labels[k].id
                        if DoneWithDoors == false then 
                            if #(Pos - vector3(v.x, v.y, v.z)) < 1.0 then 
                                sleep = 0
                                DrawText3Ds(v.x, v.y, v.z, "~y~[E] " ..currentDoor)
                                if IsControlJustReleased(0, 38) then
                                    RemoveDoorFromCar(veh, currentDoor, id)
                                end
                            end 
                        end
                        Wait(sleep)
                    end 
                end)
            end
            for k, v in pairs(Config.ExtraTextPos[currentPos]) do
                CreateThread(function()
                    while true do 
                        sleep = 1000
                        local player = PlayerPedId()
                        local Pos = GetEntityCoords(player)
                        currentExtra = Config.Labels[k].label
                        extraDoing = Config.Labels[k].doing
                        prop = Config.Labels[k].prop
                        if enginePart == true and seat1Part == true and seat2Part == true and exaustPart == true then
                            DoneWithExtras = true 
                            
                            if DonWithAll then 
                                DeleteEntity(veh)
                                DeleteEntity(TableProp)
                            end
                        end
                        if DoneWithDoors == true and DoneWithExtras == false then 
                            if #(Pos - vector3(v.x, v.y, v.z)) < 1.0 then ---- parts 
                                sleep = 0
                                DrawText3Ds(v.x, v.y, v.z, "~y~[E]" .. currentExtra)
                                if IsControlJustReleased(0, 38) then
                                    RemoveOtherPartsFromCar(veh, currentExtra, prop, extraDoing)
                                end
                            end
                        end
                        Wait(sleep)
                    end
                end)
            end
            CreateThread(function()
                while true do 
                    sleep = 1000
                    local player = PlayerPedId()
                    local Pos = GetEntityCoords(player)
                    if DoneWithDoors == false or DoneWithExtras == false or DonWithAll == false then
                        if #(Pos - vector3(TeblePos.x, TeblePos.y, TeblePos.z)) < 2.0 then 
                            sleep = 0
                            DrawText3Ds(TeblePos.x, TeblePos.y, TeblePos.z +0.5, "~y~[E]")
                            if IsControlJustReleased(0, 38) then
                                if IsHoldingDoor then   
                                    distroyPart()
                                end
                            end
                        end
                    end
                    Wait(sleep)
                end 
            end)
        end, CurrentCarPos, true)
    end
end)


function RemoveDoorFromCar(veh, door, id)
    local player = PlayerPedId()
    brokenDoor = IsVehicleDoorDamaged(veh, id)
    
    if brokenDoor == 1 then
        QBCore.Functions.Notify("You have allready removed this part.", "error", 4500)
    else
        QBCore.Functions.Progressbar("Removeing", "Removeing "..door , 6000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = nil,
            anim = nil,
            flags = 0,
            task = Config.RemoveAnimation,
        }, {}, {},function() -- Done
            CurrentPart = Config.DoorModel
            BrokenDoors = BrokenDoors + 1
            if BrokenDoors == 6 then 
                DoneWithDoors = true
            end
           
            SetVehicleDoorBroken(veh, id, true) --WORLD_HUMAN_HAMMERING
            local doorProp = CreateObject(GetHashKey(Config.DoorModel), 1.0, 1.0, 1.0, 1, 1, 0)
            if DoesEntityExist(doorProp) then
				ClearPedTasks(player)
				loadAnimDict(Config.DoorAnimationDict)
				TaskPlayAnim((player), Config.DoorAnimationDict, Config.DoorAnimation,4.0, 1.0, -1,49,0, 0, 0, 0)
				AttachEntityToEntity(doorProp,player, 28422, 0.0, 0.5, -0.05, 0.0, 0.0, 0.0, 1, 1, 0, true, 2, 1)
                IsHoldingDoor = true 
            end
        end)
    end
end

function RemoveOtherPartsFromCar(veh, extra, prop, doing)
    local player = PlayerPedId()

    if doing == "engine" and enginePart == false then 
        QBCore.Functions.Progressbar("Removeing", "Removeing "..extra , 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = Config.RemoveAnimationDict,
            anim = Config.RemoveAnimation,
            flags = 0,
            task = nil,
        }, {}, {},function() -- Done
            local doorProp = CreateObject(GetHashKey(prop), 1.0, 1.0, 1.0, 1, 1, 0)
            enginePart = true
            CurrentPart = prop
            if DoesEntityExist(doorProp) then
                ClearPedTasks(player)
                loadAnimDict(Config.DoorAnimationDict)
                TaskPlayAnim((player), Config.DoorAnimationDict, Config.DoorAnimation,4.0, 1.0, -1,49,0, 0, 0, 0)
                AttachEntityToEntity(doorProp,player, 28422, 0.0, 0.5, -0.05, 0.0, 0.0, 0.0, 1, 1, 0, true, 2, 1)
                IsHoldingDoor = true 
            end
        end)

    elseif doing == "seat1" and seat1Part == false then 
        QBCore.Functions.Progressbar("Removeing", "Removeing "..extra , 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = Config.RemoveAnimationDict,
            anim = Config.RemoveAnimation,
            flags = 0,
            task = nil,
        }, {}, {},function() -- Done
            local doorProp = CreateObject(GetHashKey(prop), 1.0, 1.0, 1.0, 1, 1, 0)
            seat1Part = true
            CurrentPart = prop
            if DoesEntityExist(doorProp) then
                ClearPedTasks(player)
                loadAnimDict(Config.DoorAnimationDict)
                TaskPlayAnim((player), Config.DoorAnimationDict, Config.DoorAnimation,4.0, 1.0, -1,49,0, 0, 0, 0)
                AttachEntityToEntity(doorProp,player, 28422, 0.0, 0.5, -0.05, 0.0, 0.0, 0.0, 1, 1, 0, true, 2, 1)
                IsHoldingDoor = true 
            end
        end)

    elseif doing == "seat2" and seat2Part == false then 
        QBCore.Functions.Progressbar("Removeing", "Removeing "..extra , 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = Config.RemoveAnimationDict,
            anim = Config.RemoveAnimation,
            flags = 0,
            task = nil,
        }, {}, {},function() -- Done
            local doorProp = CreateObject(GetHashKey(prop), 1.0, 1.0, 1.0, 1, 1, 0)
            seat2Part = true
            CurrentPart = prop
            if DoesEntityExist(doorProp) then
                ClearPedTasks(player)
                loadAnimDict(Config.DoorAnimationDict)
                TaskPlayAnim((player), Config.DoorAnimationDict, Config.DoorAnimation,4.0, 1.0, -1,49,0, 0, 0, 0)
                AttachEntityToEntity(doorProp,player, 28422, 0.0, 0.5, -0.05, 0.0, 0.0, 0.0, 1, 1, 0, true, 2, 1)
                IsHoldingDoor = true 
            end
        end)
    elseif doing == "exaust" and exaustPart == false then 
        QBCore.Functions.Progressbar("Removeing", "Removeing "..extra , 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = Config.RemoveAnimationDict,
            anim = Config.RemoveAnimation,
            flags = 0,
            task = nil,
        }, {}, {},function() -- Done
            local doorProp = CreateObject(GetHashKey(prop), 1.0, 1.0, 1.0, 1, 1, 0)
            exaustPart = true
            CurrentPart = prop
            if DoesEntityExist(doorProp) then
                ClearPedTasks(player)
                loadAnimDict(Config.DoorAnimationDict)
                TaskPlayAnim((player), Config.DoorAnimationDict, Config.DoorAnimation,4.0, 1.0, -1,49,0, 0, 0, 0)
                AttachEntityToEntity(doorProp,player, 28422, 0.0, 0.5, -0.05, 0.0, 0.0, 0.0, 1, 1, 0, true, 2, 1)
                 IsHoldingDoor = true 
            end
        end)
    elseif enginePart == true or seat1part == true or seat2part == true or exaustPart == true then 
        QBCore.Functions.Notify("You have allready removed this part.", "error", 4500)
    end
end

function distroyPart()
    IsHoldingDoor = false
    local player = PlayerPedId()
    local Pos = GetEntityCoords(player)
    local RemoveDoor = GetClosestObjectOfType(Pos.x, Pos.y, Pos.z, 2.0, CurrentPart, 0, 0, 0)
    DeleteEntity(RemoveDoor)
    ClearPedTasks(player)
    local doorOnTable = CreateObject(GetHashKey(CurrentPart), TeblePos.x, TeblePos.y, TeblePos.z -0.2, 1, 1, 0)
    QBCore.Functions.Progressbar("Demolishing", "Demolishing Part..." , 6000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.DemolishingAnimationDict,
        anim = Config.DemolishingAnimation,
        flags = 0,
        task = nil,
    }, {}, {},function()
        ClearPedTasks(player)
        DeleteEntity(doorOnTable)
        TriggerServerEvent("qb-chop:server:getReward")
        if DoneWithExtras then 
            DonWithAll = true 
            QBCore.Functions.Notify("You are done with all parts.", "error", 4500)
        end
    end)
end