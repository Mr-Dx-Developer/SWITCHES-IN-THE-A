local rampair = false
local trunkopen = false
local usedDetach = false
local rampapie = nil
local FrameworkSelected = ConfigTow.Framework and ConfigTow.Framework:lower() or nil
local ESX = nil
local QBCore = nil
local frmw = "Standalone"

if ConfigTow.WhitelistJobOnly then
    if (FrameworkSelected == "esx") then

        if (ConfigTow.FrameworkCore) then
            ESX = exports[ConfigTow.FrameworkCore]:getSharedObject()
            RegisterNetEvent('esx:playerLoaded')
            AddEventHandler('esx:playerLoaded', function(xPlayer)
                ESX.PlayerData = xPlayer
            end)

            RegisterNetEvent('esx:setJob')
            AddEventHandler('esx:setJob', function(job)
                ESX.PlayerData.job = playerJob
            end)
            frmw = "ESX"
            if (not ESX) then
                TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            end
        else
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            frmw = "ESX"
        end
        if (not ESX) then
            print('     ERROR: Invalid FrameworkCore! Pls fix it on Config!')
        end
    elseif (FrameworkSelected == "qb" or FrameworkSelected == "qb-core" or FrameworkSelected == "qbcore") then
        if (ConfigTow.FrameworkCore) then
            QBCore = exports[ConfigTow.FrameworkCore]:GetCoreObject()
            frmw = "QB"
        else
            print('     ERROR: Invalid FrameworkCore! Pls fix it on Config!')
        end
    elseif (FrameworkSelected == "standalone") then
        frmw = "Standalone"
    else
        print('     ERROR: Unknown Framework! Available: Standalone, ESX or QB!')
    end
end

RegisterCommand('rampadd', function ()
    if frmw == "QB" then
        if ConfigTow.WhitelistJobOnly then
            local playerJob = QBCore.Functions.GetPlayerData().job.name
            if not tableContains(ConfigTow.WhitelistJobs, playerJob) then
                QBCore.Functions.Notify(Config.texts.notJobAllowed, "error")
                return
            end
        end
    elseif frmw == "ESX" then
        if ConfigTow.WhitelistJobOnly then
                        playerData = ESX.GetPlayerData()
            local playerJob = playerData.job.name
            if not tableContains(ConfigTow.WhitelistJobs, playerJob) then
                drawNotification(Config.texts.notJobAllowed)
                return
            end
        end
    end
    local player = PlayerPedId()
    local playerCoords = GetEntityCoords(player)
    local radius = 5.0
    local vehicle = nil
    if IsAnyVehicleNearPoint(playerCoords, radius) then
        vehicle = getClosestVehicle(playerCoords)
        local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        drawNotification(""..Config.texts.tryingToAttach.."" .. vehicleName)
        if contains(vehicleName, ConfigTow.whitelist) then
            local vehicleCoords = GetEntityCoords(vehicle)
            for _, value in pairs(ConfigTow.offsets) do
                if vehicleName == value.model then
                    local ramp = CreateObject(RampHash, vector3(value.offset.x, value.offset.y, value.offset.z), true, false, false)
                    AttachEntityToEntity(ramp, vehicle, GetEntityBoneIndexByName(vehicle, 'chassis'), value.offset.x, value.offset.y, value.offset.z , 180.0, 180.0, 0.0, 0, 0, 1, 0, 0, 1)
                    drawNotification(Config.texts.rampAttached)
                    rampapie = vehicle
                    rampair = true
                end
            end
            return
        end
        drawNotification(Config.texts.canRampNotAttach)
        return
    end
end)

function tableContains(table, item)
    for _, value in pairs(table) do
        if value == item then
            return true
        end
    end
    return false
end

function isWhitelistedJob2()
    if frmw == "QB" then
        if ConfigTow.WhitelistJobOnly then
            while (QBCore.Functions.GetPlayerData() == nil or QBCore.Functions.GetPlayerData().job == nil or QBCore.Functions.GetPlayerData().job.name == nil) do
                Wait(100)
            end
                local playerJob = QBCore.Functions.GetPlayerData().job.name
                if not tableContains(ConfigTow.WhitelistJobs, playerJob) then
                    return false
                else
                    return true
                end
        end
    elseif frmw == "ESX" then
        if ConfigTow.WhitelistJobOnly then
            if ESX.PlayerData.job then
                playerData = ESX.GetPlayerData()
                local playerJob = playerData.job.name
                if not tableContains(ConfigTow.WhitelistJobs, playerJob) then
                    return false
                else
                    return true
                end
            else
                Wait(500)
            end
        end
    end
end

RegisterCommand('rampremove', function()
    if frmw == "QB" then
        if ConfigTow.WhitelistJobOnly then
            local playerJob = QBCore.Functions.GetPlayerData().job.name
            if not tableContains(ConfigTow.WhitelistJobs, playerJob) then
                QBCore.Functions.Notify(Config.texts.notJobAllowed, "error")
                return
            end
        end
    elseif frmw == "ESX" then
        if ConfigTow.WhitelistJobOnly then
                        playerData = ESX.GetPlayerData()
            local playerJob = playerData.job.name
            if not tableContains(ConfigTow.WhitelistJobs, playerJob) then
                drawNotification(Config.texts.notJobAllowed)
                return
            end
        end
    end
    local player = PlayerPedId()
    local playerCoords = GetEntityCoords(player)
    local object = nil
    if not IsPedInAnyVehicle(player, false) then
        object = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 10.0, `imp_prop_flatbed_ramp`, false, false, false)
        if DoesEntityExist(object) then
            SetEntityAsMissionEntity(object, true, true)
            DeleteObject(object)
            drawNotification(Config.texts.tranRampRemoved)
            rampair = false
            return
        end
    else
        drawNotification(Config.texts.getOutOfVehicle)
    end
end)

RegisterCommand('attach', function()
    if frmw == "QB" then
        if ConfigTow.WhitelistJobOnly then
            local playerJob = QBCore.Functions.GetPlayerData().job.name
            if not tableContains(ConfigTow.WhitelistJobs, playerJob) then
                QBCore.Functions.Notify(Config.texts.notJobAllowed, "error")
                return
            end
        end
    elseif frmw == "ESX" then
        if ConfigTow.WhitelistJobOnly then
                        playerData = ESX.GetPlayerData()
            local playerJob = playerData.job.name
            if not tableContains(ConfigTow.WhitelistJobs, playerJob) then
                drawNotification(Config.texts.notJobAllowed)
                return
            end
        end
    end
    local player = PlayerPedId()
    local vehicle = nil
    if IsPedInAnyVehicle(player, false) then
        vehicle = GetVehiclePedIsIn(player, false)
        if GetPedInVehicleSeat(vehicle, -1) == player then
            local vehicleCoords = GetEntityCoords(vehicle)
            local vehicleOffset = GetOffsetFromEntityInWorldCoords(vehicle, 1.0, 0.0, -2.5)
            local vehicleRotation = GetEntityRotation(vehicle, 2)
            local belowEntity = GetVehicleBelowMe(vehicleCoords, vehicleOffset)
            local vehicleBelowRotation = GetEntityRotation(belowEntity, 2)
            local vehicleBelowName = GetDisplayNameFromVehicleModel(GetEntityModel(belowEntity))
            local vehiclesOffset = GetOffsetFromEntityGivenWorldCoords(belowEntity, vehicleCoords)
            local vehiclePitch = vehicleRotation.x - vehicleBelowRotation.x
            local vehicleYaw = vehicleRotation.z - vehicleBelowRotation.z
    
            if contains(vehicleBelowName, ConfigTow.whitelist) then
                if not IsEntityAttached(vehicle) then
                    -- Rollback Update
                    for _, valueroll in pairs(ConfigTow.rollback) do
                        if vehicleBelowName == valueroll.model then
                            local boneIndex = GetEntityBoneIndexByName(belowEntity, valueroll.boneIndex)
                            local towOffset = GetWorldPositionOfEntityBone(belowEntity, boneIndex)
                            local towRot = GetEntityRotation(belowEntity, 1)
                            local vehicleHeightMin, vehicleHeightMax = GetModelDimensions(GetEntityModel(vehicle))
                            -- Check if there is already a vehicle in the specified coordinates
                            local vehicleInCoords = GetClosestVehicle(towOffset.x, towOffset.y, towOffset.z, 1.0, 0, 70)
                            if not DoesEntityExist(vehicleInCoords) then
                                    AttachEntityToEntity(vehicle, belowEntity, boneIndex, 0, valueroll.attachDistance, valueroll.attachHeight - vehicleHeightMin.z, 2.0, 0, 0, 1, 1, 1, 1, 0, 1)
                                    TriggerServerEvent('DLWINCH:RemoveRope', _g.firstEntity, _g.secondEntity)
                                return drawNotification(Config.texts.vehicleAttached)     
                            else
                                return drawNotification(Config.texts.alreadyAttached)                           
                            end
                        end
                    end
                    AttachEntityToEntity(vehicle, belowEntity, GetEntityBoneIndexByName(belowEntity, 'chassis'), vehiclesOffset, vehiclePitch, 0.0, vehicleYaw, false, false, true, false, 0, true)
                    TriggerServerEvent('DLWINCH:RemoveRope', _g.firstEntity, _g.secondEntity)
                    return drawNotification(Config.texts.vehicleAttached)
                end
                return drawNotification(Config.texts.vehicleAlreadyAttached)
            end
            return drawNotification(""..Config.texts.canNotAttach.."" .. vehicleBelowName)
        end
        return drawNotification(Config.texts.mustBeDriver)
    end
    drawNotification(Config.texts.notInCar)
    
end)



Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local speed = 1
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local player = PlayerPedId()
        local vehicle = nil
        local playerCoords = GetEntityCoords(player)
        local radius = 5.0
        local object = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 5.0, RampHash, false, 0, 0)
        if not DoesEntityExist(rampapie) and rampair then
            ExecuteCommand('rampremove')
            rampair = false
        end
            if IsPedInAnyVehicle(player, false) then
                sleep = 1000
                vehicle = GetVehiclePedIsIn(player, false)
                vehBlackList = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                if not contains(vehBlackList, ConfigTow.blacklist) then
                    if GetPedInVehicleSeat(vehicle, -1) == player then
                        local vehicleCoords = GetEntityCoords(vehicle)
                        local vehicleOffset = GetOffsetFromEntityInWorldCoords(vehicle, 1.0, 0.0, -2.5)
                        local vehicleRotation = GetEntityRotation(vehicle, 2)
                        local belowEntity = GetVehicleBelowMe(vehicleCoords, vehicleOffset)
                        local vehicleBelowRotation = GetEntityRotation(belowEntity, 2)
                        local vehicleBelowName = GetDisplayNameFromVehicleModel(GetEntityModel(belowEntity))
                        local vehiclesOffset = GetOffsetFromEntityGivenWorldCoords(belowEntity, vehicleCoords)
                        local vehiclePitch = vehicleRotation.x - vehicleBelowRotation.x
                        local vehicleYaw = vehicleRotation.z - vehicleBelowRotation.z
                        if contains(vehicleBelowName, ConfigTow.whitelist) then
                            -- Automatic Attach Update
                            if ConfigTow.AutomaticAttach then
                                if ConfigTow.WhitelistJobOnly then
                                    if isWhitelistedJob2() then
                                        if usedDetach then
                                        speed = 1.0
                                        else
                                        speed = GetEntitySpeed(vehicle) * 3.6
                                        end
                                        sleep = 0
                                        if speed < ConfigTow.MaxSpeedForAutomaticAttach then
                                            if not IsEntityAttached(vehicle) then
                                                ExecuteCommand('attach')
                                            end
                                            if ConfigTow.ShowAutomaticText then
                                            Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.showAttached)
                                            end
                                        elseif speed == 1 then
                                            if ConfigTow.ShowAutomaticText then
                                            Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.showDetached)
                                            end
                                        else
                                            if ConfigTow.ShowAutomaticText then
                                            Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, ""..Config.texts.showCarSpeed.." "..math.floor(speed).. " km/h")
                                            end
                                        end
                                        if IsControlJustPressed(0, 32) then
                                            if IsEntityAttached(vehicle) then
                                                ExecuteCommand('detach')
                                            end
                                        elseif IsControlJustPressed(0, 33) then
                                            if IsEntityAttached(vehicle) then
                                                ExecuteCommand('detach')
                                            end
                                        end
                                    end
                                else
                                    if usedDetach then
                                        speed = 1.0
                                        else
                                        speed = GetEntitySpeed(vehicle) * 3.6
                                        end
                                        sleep = 0
                                        if speed < ConfigTow.MaxSpeedForAutomaticAttach then
                                            if not IsEntityAttached(vehicle) then
                                                ExecuteCommand('attach')
                                            end
                                            if ConfigTow.ShowAutomaticText then
                                                if IsEntityAttached(vehicle) then
                                                Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.showAttached)
                                                end
                                            end
                                        elseif speed == 1 then
                                            if ConfigTow.ShowAutomaticText then
                                            Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.showDetached)
                                            end
                                        else
                                            if ConfigTow.ShowAutomaticText then
                                                Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, ""..Config.texts.showCarSpeed.." "..math.floor(speed).. " km/h")
                                            end
                                        end
                                        if IsControlJustPressed(0, 32) then
                                            if IsEntityAttached(vehicle) then
                                                ExecuteCommand('detach')
                                            end
                                        elseif IsControlJustPressed(0, 33) then
                                            if IsEntityAttached(vehicle) then
                                                ExecuteCommand('detach')
                                            end
                                        end
                                    end
                                -- Ends here
                            else
                                if ConfigTow.WhitelistJobOnly then
                                    if isWhitelistedJob2() then
                                        if not IsEntityAttached(vehicle) then
                                            sleep = 0
                                            Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.eAttach)
                                            if IsControlJustPressed(0, 46) then
                                                ExecuteCommand('attach')
                                            end
                                        elseif IsEntityAttached(vehicle) then
                                            sleep = 0
                                            Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.eDetach)
                                            if IsControlJustPressed(0, 46) then
                                            ExecuteCommand('detach')
                                            end
                                        end
                                    end
                                else
                                    if not IsEntityAttached(vehicle) then
                                        sleep = 0
                                        Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.eAttach)
                                        if IsControlJustPressed(0, 46) then
                                            ExecuteCommand('attach')
                                        end
                                    elseif IsEntityAttached(vehicle) then
                                        sleep = 0
                                        Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.eDetach)
                                        if IsControlJustPressed(0, 46) then
                                        ExecuteCommand('detach')
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if ConfigTow.WhitelistJobOnly then
                if isWhitelistedJob2() then
                    if IsAnyVehicleNearPoint(playerCoords, radius) then
                        vehicle = getClosestVehicle(playerCoords)
                        local vehicleCoords = GetEntityCoords(vehicle, true)
                        local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                        if contains(vehicleName, ConfigTow.whitelist) and rampair == false then
                            for _, value in pairs(ConfigTow.offsets) do
                                if vehicleName == value.model then
                                    if not IsPedInAnyVehicle(player, false) then
                                        sleep = 0
                                        if not value.hasRamp then
                                            Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.eAddRamp)
                                            if IsControlJustPressed(0, 46) then
                                                local vehicleCoords = GetEntityCoords(vehicle)
                                                local ramp = CreateObject(RampHash, vector3(value.offset.x, value.offset.y, value.offset.z), true, false, false)
                                                AttachEntityToEntity(ramp, vehicle, GetEntityBoneIndexByName(vehicle, 'chassis'), value.offset.x, value.offset.y, value.offset.z , 180.0, 180.0, 0.0, 0, 0, 1, 0, 0, 1)
                                                drawNotification(Config.texts.rampAttached)
                                                rampair = true
                                                rampapie = vehicle
                                            end
                                        else
                                            if trunkopen then
                                                Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.eCloseRamp)
                                                if IsControlJustPressed(0, 46) then
                                                    for _, value in pairs(ConfigTow.rampextra) do
                                                        if vehicleName == value.modelextra then
                                                                local extraID = value.extraID
                                                                SetVehicleExtra(vehicle, extraID, 1)
                                                                drawNotification(Config.texts.rampClosed)
                                                                trunkopen = false
                                                        else
                                                            SetVehicleDoorShut(vehicle, 5, true, true)
                                                            drawNotification(Config.texts.rampClosed)
                                                            trunkopen = false
                                                        end
                                                    end
                                                end        
                                            else
                                                Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.eOpenRamp)
                                                if IsControlJustPressed(0, 46) then
                                                    for _, value in pairs(ConfigTow.rampextra) do
                                                        if vehicleName == value.modelextra then
                                                            local extraID = value.extraID
                                                            SetVehicleExtra(vehicle, extraID, 0)
                                                            drawNotification(Config.texts.rampOpened)
                                                            trunkopen = true
                                                        else
                                                            SetVehicleDoorOpen(vehicle, 5, false, false)
                                                            drawNotification(Config.texts.rampOpened)
                                                            trunkopen = true
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            
                        elseif not IsPedInAnyVehicle(player, false) then
                            local player = PlayerPedId()
                            local playerCoords = GetEntityCoords(player)
                            local object = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 10.0, RampHash, false, 0, 0)
                                if GetHashKey(RampHash) == GetEntityModel(object) and rampair and contains(vehicleName, ConfigTow.whitelist) then
                                    sleep = 0
                                    Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.eRemoveRamp)
                                    if IsControlJustPressed(0, 46) then
                                        ExecuteCommand('rampremove')
                                        ExecuteCommand('rampremove')
                                        ExecuteCommand('rampremove')
                                        ExecuteCommand('rampremove')
                                        ExecuteCommand('rampremove')
                                        rampair = false
                                    end
                                end
                        end
                    end
                end
            else
                if IsAnyVehicleNearPoint(playerCoords, radius) then
                    vehicle = getClosestVehicle(playerCoords)
                    local vehicleCoords = GetEntityCoords(vehicle, true)
                    local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                    if contains(vehicleName, ConfigTow.whitelist) and rampair == false then
                        for _, value in pairs(ConfigTow.offsets) do
                            if vehicleName == value.model then
                                if not IsPedInAnyVehicle(player, false) then
                                    sleep = 0
                                    if not value.hasRamp then
                                        Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.eAddRamp)
                                        if IsControlJustPressed(0, 46) then
                                            local vehicleCoords = GetEntityCoords(vehicle)
                                            local ramp = CreateObject(RampHash, vector3(value.offset.x, value.offset.y, value.offset.z), true, false, false)
                                            AttachEntityToEntity(ramp, vehicle, GetEntityBoneIndexByName(vehicle, 'chassis'), value.offset.x, value.offset.y, value.offset.z , 180.0, 180.0, 0.0, 0, 0, 1, 0, 0, 1)
                                            drawNotification(Config.texts.rampAttached)
                                            rampair = true
                                            rampapie = vehicle
                                        end
                                    else
                                        if trunkopen then
                                            Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.eCloseRamp)
                                            if IsControlJustPressed(0, 46) then
                                                for _, value in pairs(ConfigTow.rampextra) do
                                                    if vehicleName == value.modelextra then
                                                            local extraID = value.extraID
                                                            SetVehicleExtra(vehicle, extraID, 1)
                                                            drawNotification(Config.texts.rampClosed)
                                                            trunkopen = false
                                                    else
                                                        SetVehicleDoorShut(vehicle, 5, true, true)
                                                        drawNotification(Config.texts.rampClosed)
                                                        trunkopen = false
                                                    end
                                                end
                                            end        
                                        else
                                            Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.eOpenRamp)
                                            if IsControlJustPressed(0, 46) then
                                                for _, value in pairs(ConfigTow.rampextra) do
                                                    if vehicleName == value.modelextra then
                                                        local extraID = value.extraID
                                                        SetVehicleExtra(vehicle, extraID, 0)
                                                        drawNotification(Config.texts.rampOpened)
                                                        trunkopen = true
                                                    else
                                                        SetVehicleDoorOpen(vehicle, 5, false, false)
                                                        drawNotification(Config.texts.rampOpened)
                                                        trunkopen = true
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        
                    elseif not IsPedInAnyVehicle(player, false) then
                        local player = PlayerPedId()
                        local playerCoords = GetEntityCoords(player)
                        local object = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 10.0, RampHash, false, 0, 0)
                            if GetHashKey(RampHash) == GetEntityModel(object) and rampair and contains(vehicleName, ConfigTow.whitelist) then
                                sleep = 0
                                Draw3DText(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1, Config.texts.eRemoveRamp)
                                if IsControlJustPressed(0, 46) then
                                    ExecuteCommand('rampremove')
                                    ExecuteCommand('rampremove')
                                    ExecuteCommand('rampremove')
                                    ExecuteCommand('rampremove')
                                    ExecuteCommand('rampremove')
                                    rampair = false
                                end
                            end
                    end
                end
            end
        Wait(sleep)
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
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
	ClearDrawOrigin()
end

RegisterCommand('detach', function()
    if frmw == "QB" then
        if ConfigTow.WhitelistJobOnly then
            local playerJob = QBCore.Functions.GetPlayerData().job.name
            if not tableContains(ConfigTow.WhitelistJobs, playerJob) then
                QBCore.Functions.Notify(Config.texts.notJobAllowed, "error")
                return
            end
        end
    elseif frmw == "ESX" then
        if ConfigTow.WhitelistJobOnly then
                        playerData = ESX.GetPlayerData()
            local playerJob = playerData.job.name
            if not tableContains(ConfigTow.WhitelistJobs, playerJob) then
                drawNotification(Config.texts.notJobAllowed)
                return
            end
        end
    end
    local player = PlayerPedId()
    local vehicle = nil
    if IsPedInAnyVehicle(player, false) then
        vehicle = GetVehiclePedIsIn(player, false)
        if GetPedInVehicleSeat(vehicle, -1) == player then
            if IsEntityAttached(vehicle) then
                DetachEntity(vehicle, false, true)
                if ConfigTow.AutomaticAttach then
                usedDetach = true
                drawNotification(Config.texts.vehicleDetached)
                Wait(ConfigTow.AutomaticAttachDelay*1000)
                usedDetach = false
                else
                    drawNotification(Config.texts.vehicleDetached)
                end
                return 
                
            else
                return drawNotification(Config.texts.vehicleNotAttached)
            end
        else
            return drawNotification(Config.texts.mustBeDriver)
        end
    else
        return drawNotification(Config.texts.notInCar)
    end
end)

function getClosestVehicle(coords)
    local ped = PlayerPedId()
    local vehicles = GetGamePool('CVehicle')
    local closestDistance = -1
    local closestVehicle = -1
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    for i = 1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local distance = #(vehicleCoords - coords)

        if closestDistance == -1 or closestDistance > distance then
            closestVehicle = vehicles[i]
            closestDistance = distance
        end
    end
    return closestVehicle, closestDistance
end

function GetVehicleBelowMe(cFrom, cTo) -- Function to get the vehicle under me
    local rayHandle = CastRayPointToPoint(cFrom.x, cFrom.y, cFrom.z, cTo.x, cTo.y, cTo.z, 10, PlayerPedId(), 0) -- Sends raycast under me
    local _, _, _, _, vehicle = GetRaycastResult(rayHandle) -- Stores the vehicle under me
    return vehicle -- Returns the vehicle under me
end

function contains(item, list)
    for _, value in ipairs(list) do
        if value == item then return true end
    end
    return false
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, false)
end


-- Register Events
RegisterNetEvent("DLWINCH:SetTowVehicle")
RegisterNetEvent("DLWINCH:FreeTowing")
RegisterNetEvent("DLWINCH:CreateRope")
RegisterNetEvent("DLWINCH:RemoveRope")
RegisterNetEvent("DLWINCH:LoadRopes")
RegisterNetEvent("DLWINCH:UpdateRopeLength")

-- Event handles
AddEventHandler("DLWINCH:SetTowVehicle", function(vehicle) SetTowVehicle(vehicle) end)
AddEventHandler("DLWINCH:FreeTowing", function() FreeTowing() end)
AddEventHandler("DLWINCH:CreateRope", function(netId1, netId2) CreateRopeEvent(netId1, netId2) end)
AddEventHandler("DLWINCH:RemoveRope", function(netId1, netId2) RemoveRopeEvent(netId1, netId2) end)
AddEventHandler("DLWINCH:LoadRopes", function(ropeList) LoadRopesEvent(ropeList) end)
AddEventHandler("DLWINCH:UpdateRopeLength", function(netId1, netId2, length) UpdateRopeLengthEvent(netId1, netId2, length) end)

-- Variables
_g = {
    isTowing   = false,
    length     = 0,
    ropeHandle = {},
}

-- Commands
local towTruckName = nil
RegisterCommand("winch", function(source, args, rawCommand)
    local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 10.0, 0, 127)
    if not towTruckName then
    towTruckName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    end
    if DoesEntityExist(vehicle) then
        local attachPosition = args[1]
        if attachPosition == "up" or attachPosition == "down" then
            if attachPosition == "up" then
                if towTruckName == "dl550mec" then
                    towBone="bonnet"
                    towCarBone = "glass"
                else
                    towBone="bonnet"
                    towCarBone = "bonnet"
                end
            else
                towBone="boot"
                towCarBone = "bonnet"
            end
            SetTowVehicle(vehicle, attachPosition)
        elseif attachPosition == "behind" then
            towBone="bonnet"
            towCarBone = "bumper_r"
            SetTowVehicle(vehicle, attachPosition)
        else
            SendNotification('error', Config.texts.invalidUsage)
        end
    else
        SendNotification("error", Config.texts.notNear)
    end
end, false)

TriggerEvent('chat:addSuggestion', '/winch', 'Winch a car on to a trailer', {
    { name="usage", help="up, down or behind" },
})

-- Functions
function SetTowVehicle(vehicle)
    DebugPrint("_g.isTowing: " .. (_g.isTowing and "true" or "false"))
    if not _g.isTowing and not _g.secondEntity then
        local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
        if vehicleName == "NULL" then
            vehicleName = (GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
        end
        if not _g.firstEntity then
            if IsVehicleCanTowing(vehicle) then
                _g.firstEntity = NetworkGetNetworkIdFromEntity(vehicle)
                SendNotification('default', string.format(Config.texts.towCarDone, vehicleName))
                isflatbed = vehicleName
            else
                SendNotification('error', Config.texts.notAllowed)
            end
        elseif not _g.secondEntity then
            if IsVehicleCanBeTowing(vehicle) and vehicle ~= NetworkGetEntityFromNetworkId(_g.firstEntity) then
                local distance = #(GetEntityCoords(vehicle) - GetEntityCoords(NetworkGetEntityFromNetworkId(_g.firstEntity)))
                if distance < Config.maxWinchDistance then
                    local pos1   = GetWorldPositionOfEntityBone(NetworkGetEntityFromNetworkId(_g.firstEntity), bone1)
                    local pos2   = GetWorldPositionOfEntityBone(vehicle, bone2)
                    _g.secondEntity = NetworkGetNetworkIdFromEntity(vehicle)
                    _g.isTowing     = true
                    if isflatbed == "Flatbed" then
                    _g.length       = #(pos1 - pos2) + 6
                    else
                    _g.length       = #(pos1 - pos2) + 1
                    end
                    SendNotification('default', string.format(Config.texts.towingDone, vehicleName))
                    TriggerServerEvent("DLWINCH:CreateRope", _g.firstEntity, _g.secondEntity)
                else
                    SendNotification('error', Config.texts.tooFarAway)
                end
            else
                SendNotification('error', Config.texts.notAllowed)
            end
        end
    else
        SendNotification('default', Config.texts.towRemoved)
        TriggerServerEvent("DLWINCH:RemoveRope", _g.firstEntity, _g.secondEntity)
        _g.isTowing     = false
        _g.firstEntity  = nil
        _g.secondEntity = nil
    end
end

function FreeTowing()
    if _g.isTowing then
        TriggerServerEvent("DLWINCH:RemoveRope", _g.firstEntity, _g.secondEntity)
        _g.isTowing     = false
        _g.firstEntity  = nil
        _g.secondEntity = nil
    end
end

function FindRopeByNetworkId(netId1, netId2)
    for id, rope in pairs(_g.ropeHandle) do
        if rope.netId1 == netId1 and rope.netId2 == netId2 then
            return rope
        end
    end
    return nil
end

function AttachRope(rope, entity1, entity2)
    local bone1  = GetEntityBoneIndexByName(entity1, towCarBone)
    local bone2  = GetEntityBoneIndexByName(entity2, towBone)
    local pos1   = GetWorldPositionOfEntityBone(entity1, bone1)
    local pos2   = GetWorldPositionOfEntityBone(entity2, bone2) - Config.towingOffset
    local length = #(pos1 - pos2)
    AttachEntitiesToRope(rope, entity1, entity2, pos1.x, pos1.y, pos1.z, pos2.x, pos2.y, pos2.z, length, false, false, nil, nil)
    StopRopeUnwindingFront(rope)
    StartRopeWinding(rope)
    RopeForceLength(rope, length)
end

function CreateRope(pos)
    RopeLoadTextures()
    local rope = AddRope(pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, Config.maxRopeLength, 1, Config.maxRopeLength, 0.25, 0.0, false, true, false, 5.0, false, 0)
    table.insert(_g.ropeHandle, {
        id = rope,
        index = #_g.ropeHandle + 1,
    })
    return #_g.ropeHandle
end

function RemoveRope(id)
    if DoesRopeExist(id) then
        StopRopeUnwindingFront(id)
        StopRopeWinding(id)
        RopeConvertToSimple(id)
        towTruckName = nil
    end
end

function IsVehicleCanTowing(vehicle)
    if not Config.allowNpcCar then
        if not DoesEntityExist(vehicle) or not NetworkGetEntityIsNetworked(vehicle) or not IsEntityAMissionEntity(vehicle) then
            return false
        end
    end
    return GetEntityBoneIndexByName(vehicle, towCarBone) ~= -1
end

function IsVehicleCanBeTowing(vehicle)
    if not Config.allowNpcCar then
        if not DoesEntityExist(vehicle) or not NetworkGetEntityIsNetworked(vehicle) or not IsEntityAMissionEntity(vehicle) then
            return false
        end
    end
    return GetEntityBoneIndexByName(vehicle, towBone) ~= -1
end

function CreateRopeEvent(netId1, netId2)
    if NetworkDoesNetworkIdExist(netId1) and NetworkDoesNetworkIdExist(netId2) then
        local entity1 = NetworkGetEntityFromNetworkId(netId1)
        local entity2 = NetworkGetEntityFromNetworkId(netId2)
        if IsVehicleCanTowing(entity1) and IsVehicleCanBeTowing(entity2) then
            local ropeIndex  = CreateRope(GetEntityCoords(entity1))
            local ropeHandle = _g.ropeHandle[ropeIndex].id
            _g.ropeHandle[ropeIndex].netId1 = netId1
            _g.ropeHandle[ropeIndex].netId2 = netId2
            AttachRope(ropeHandle, entity1, entity2)
        end
    end
end

function RemoveRopeEvent(netId1, netId2)
    local rope    = FindRopeByNetworkId(netId1, netId2)
    local entity1 = NetworkGetEntityFromNetworkId(netId1)
    local entity2 = NetworkGetEntityFromNetworkId(netId2)
    if rope then
        RemoveRope(rope.id)
        DetachRopeFromEntity(rope.id, entity1)
        DetachRopeFromEntity(rope.id, entity2)
        DeleteRope(rope.id)
        table.remove(_g.ropeHandle, rope.index)
        if _g.firstEntity == netId1 and _g.secondEntity == netId2 then
            _g.firstEntity  = nil
            _g.secondEntity = nil
            _g.isTowing     = false
        end
    end
end

function UpdateRopeLengthEvent(netId1, netId2, length)
    local rope    = FindRopeByNetworkId(netId1, netId2)
    local entity1 = NetworkGetEntityFromNetworkId(netId1)
    local entity2 = NetworkGetEntityFromNetworkId(netId2)
    DebugPrint("Updating rope length:", rope.id, rope.length, netId1, netId2, length)
    if rope then
        rope.length = length
        RopeForceLength(rope.id, length)
    end
end

function LoadRopesEvent(ropeList)
    for k, v in pairs(ropeList) do
        if not FindRopeByNetworkId(v.netId1, v.netId2) then
            TriggerEvent("DLWINCH:CreateRope", v.netId1, v.netId2)
        end
    end
end

function Draw2DText(x, y, size, text)
    SetTextFont(0)
    SetTextProportional(22)
    SetTextScale(size, size)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function SendNotification(theme, message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(true, false)
end

function DisplayHelpText(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end

function DebugPrint(...)
    if Config.debug then
        print(...)
    end
end

-- Main Thread
Citizen.CreateThread(function()
    -- Wait for game finish loading
    while not NetworkIsPlayerActive(PlayerId()) do
        Citizen.Wait(0)
    end
    -- Wait for 5s
    Citizen.Wait(5000)
    -- Load all created ropes
    TriggerServerEvent('DLWINCH:LoadRopes')
    -- Main thread loop
    while true do
        local sleepwinch = 1000
        if _g.isTowing then
            sleepwinch = 0
            -- Get entities and rope
            local firstEntity  = NetworkGetEntityFromNetworkId(_g.firstEntity)
            local secondEntity = NetworkGetEntityFromNetworkId(_g.secondEntity)
            local rope         = FindRopeByNetworkId(_g.firstEntity, _g.secondEntity)
            local distance     = #(GetEntityCoords(firstEntity) - GetEntityCoords(secondEntity))
            -- Check if entities exists and not too far
            if not DoesEntityExist(firstEntity) or not DoesEntityExist(secondEntity) or distance > Config.maxRopeLength * 2 then
                if rope then
                    _g.isTowing = false
                    SendNotification("error", Config.texts.ropeBroken)
                    TriggerServerEvent('DLWINCH:RemoveRope', _g.firstEntity, _g.secondEntity)
                end
            -- Check if car too fast
            elseif GetEntitySpeed(firstEntity) > Config.brokenSpeed then
                if rope then
                    _g.isTowing = false
                    SendNotification("error", Config.texts.carTooFast)
                    TriggerServerEvent('DLWINCH:RemoveRope', _g.firstEntity, _g.secondEntity)
                end
            else
                -- Check rope length
                if _g.length > Config.maxRopeLength then
                    _g.length = Config.maxRopeLength
                end
                SetVehicleHandbrake(secondEntity, false)
            end
            -- Reduce rope length
            if IsControlPressed(0, Config.reduceLength) then
                _g.length = _g.length - Config.lengthTick
                if _g.length < Config.minRopeLength then
                    _g.length = Config.minRopeLength
                end
                if rope then
                    StopRopeWinding(rope.id)
                    StartRopeUnwindingFront(rope.id)
                    RopeForceLength(rope.id, _g.length)
                end
            elseif IsControlJustReleased(0, Config.reduceLength) then
                if rope then
                    StopRopeUnwindingFront(rope.id)
                    StopRopeWinding(rope.id)
                    RopeConvertToSimple(rope.id)
                end
            -- Increase rope length
            elseif IsControlPressed(0, Config.addLength) then
                _g.length = _g.length + Config.lengthTick
                if _g.length > Config.maxRopeLength then
                    _g.length = Config.maxRopeLength
                end
                if rope then
                    StopRopeUnwindingFront(rope.id)
                    StartRopeWinding(rope.id)
                    RopeForceLength(rope.id, _g.length)
                end
            elseif IsControlJustReleased(0, Config.addLength) then
                if rope then
                    StopRopeUnwindingFront(rope.id)
                    StopRopeWinding(rope.id)
                    RopeConvertToSimple(rope.id)
                end
            -- All keys released
            else
                if rope then
                    StopRopeUnwindingFront(rope.id)
                    StartRopeWinding(rope.id)
                    RopeConvertToSimple(rope.id)
                end
            end
            -- Towing status
            if Config.displayStatus then
                local vehicleName1 = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(firstEntity)))
                local vehicleName2 = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(secondEntity)))
                DisplayHelpText(Config.texts.helpNotice2)
                Draw2DText(0.84, 0.93, 0.3, string.format(Config.texts.towCarName, vehicleName1))
                Draw2DText(0.84, 0.95, 0.3, string.format(Config.texts.towingName, vehicleName2))
                Draw2DText(0.84, 0.97, 0.3, string.format(Config.texts.ropeLength, _g.length))
            end
        end
        if _g.firstEntity and not _g.secondEntity then
            sleepwinch = 0
            DisplayHelpText(Config.texts.helpNotice)
            if IsControlJustPressed(0, 194) then
                _g.firstEntity = nil
            end
        end
        if Config.debug then
            sleepwinch = 0
            Draw2DText(0.5, 0.15, 0.4, "isTowing: " .. (_g.isTowing and "true" or "false"))
            Draw2DText(0.5, 0.20, 0.4, "Length: " .. _g.length)
        end
        if _g.ropeHandle then
            sleepwinch = 0
            for _, rope in pairs(_g.ropeHandle) do
                if DoesEntityExist(NetworkGetEntityFromNetworkId(rope.netId1)) and DoesEntityExist(NetworkGetEntityFromNetworkId(rope.netId2)) then
                    if _g.firstEntity ~= rope.netId1 and _g.secondEntity ~= rope.netId2 and rope.length then
                        StopRopeUnwindingFront(rope.id)
                        StartRopeWinding(rope.id)
                        RopeForceLength(rope.id, rope.length)
                        RopeConvertToSimple(rope.id)
                    end
                end
            end
        end
        Wait(sleepwinch)
    end
end)

Citizen.CreateThread(function()
    local lastLength = 0
    while true do
        Wait(500)
        if _g.ropeHandle then
            local newTable = {}
            for _, rope in pairs(_g.ropeHandle) do
                if DoesEntityExist(NetworkGetEntityFromNetworkId(rope.netId1)) and DoesEntityExist(NetworkGetEntityFromNetworkId(rope.netId2)) then
                    if _g.firstEntity ~= rope.netId1 and _g.secondEntity ~= rope.netId2 and rope.length then
                        RopeForceLength(rope.id, rope.length)
                    end
                    table.insert(newTable, rope)
                else
                    RemoveRope(rope.id)
                    DetachRopeFromEntity(rope.id, NetworkGetEntityFromNetworkId(rope.netId1))
                    DetachRopeFromEntity(rope.id, NetworkGetEntityFromNetworkId(rope.netId2))
                    DeleteRope(rope.id)
                end
            end
            _g.ropeHandle = newTable
        end
        -- Update rope length
        if _g.isTowing and _g.firstEntity and _g.secondEntity then
            if _g.length and _g.length ~= lastLength then
                DebugPrint("Update rope length to server")
                TriggerServerEvent("DLWINCH:UpdateRopeLength", _g.firstEntity, _g.secondEntity, _g.length)
                lastLength = _g.length
            end
        end
    end
end)
