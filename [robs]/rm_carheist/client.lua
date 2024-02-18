cars = {}
MoneyStacks = {
    ['objects'] = {
        'p_ld_heist_bag_s_1',
        'p_csh_strap_01_s'
    },
    ['animations'] = {
        {'enter', 'enter_bag', 'enter_strap'},
        {'loop', 'loop_bag', 'loop_strap'},
        {'exit', 'exit_bag', 'exit_strap'},
    },
    ['scenes'] = {},
    ['sceneObjects'] = {}
}
LaptopAnimation = {
    ['objects'] = {
        'hei_prop_hst_laptop',
    },
    ['animations'] = {
        {'hack_enter', 'hack_enter_bag', 'hack_enter_laptop', 'hack_enter_card'},
        {'hack_loop', 'hack_loop_bag', 'hack_loop_laptop', 'hack_loop_card'},
        {'hack_exit', 'hack_exit_bag', 'hack_exit_laptop', 'hack_exit_card'}
    },
    ['scenes'] = {},
    ['sceneObjects'] = {}
}
GrabCash = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s'
    },
    ['animations'] = {
        {'enter', 'enter_bag'},
        {'grab', 'grab_bag', 'grab_cash'},
        {'grab_idle', 'grab_idle_bag'},
        {'exit', 'exit_bag'},
    },
    ['scenes'] = {},
    ['scenesObjects'] = {}
}
HeistSync = {
    ['stacks'] = {},
    ['moneyStacks'] = {},
    ['cars'] = {}
}
CarHeist = {
    ['startPeds'] = {}
}
ESX, QBCore = nil, nil
Citizen.CreateThread(function()
    if Config['CarHeist']['framework']['name'] == 'ESX' then
        while ESX == nil do
            TriggerEvent(Config['CarHeist']['framework']['eventName'], function(library) 
                ESX = library 
            end)
            Citizen.Wait(1)
        end
    elseif Config['CarHeist']['framework']['name'] == 'QB' then
        while not QBCore do
            pcall(function() QBCore =  exports[Config['CarHeist']['framework']['scriptName']]:GetCoreObject() end)
            if not QBCore then
                pcall(function() QBCore =  exports[Config['CarHeist']['framework']['scriptName']]:GetSharedObject() end)
            end
            if not QBCore then
                TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            end
            Citizen.Wait(1)
        end
    end
    for k, v in pairs(Config['CarHeist']['startHeist']['peds']) do
        loadModel(v['ped'])
        CarHeist['startPeds'][k] = CreatePed(4, GetHashKey(v['ped']), v['pos']['x'], v['pos']['y'], v['pos']['z'] - 0.95, v['heading'], false, true)
        FreezeEntityPosition(CarHeist['startPeds'][k], true)
        SetEntityInvincible(CarHeist['startPeds'][k], true)
        SetBlockingOfNonTemporaryEvents(CarHeist['startPeds'][k], true)
    end
end)

function TriggerCallback(cbName, cb, data)
    if Config['CarHeist']['framework']['name'] == 'ESX' then
        ESX.TriggerServerCallback(cbName, function(data)
            if cb then cb(data) else return data end
        end, data)
    elseif Config['CarHeist']['framework']['name'] == 'QB' then
        QBCore.Functions.TriggerCallback(cbName, function(data)
            if cb then cb(data) else return data end
        end, data)
    end
end

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pedCo = GetEntityCoords(ped)
        local sleep = 1000
        local startDist = #(pedCo - Config['CarHeist']['startHeist']['pos'])
        if startDist <= 2.0 then
            sleep = 1
            ShowHelpNotification(Strings['e_start'])
            if IsControlJustPressed(0, 38) then
                StartCarHeist()
            end
        end
        Citizen.Wait(sleep)
    end
end)

function StartCarHeist()
    TriggerCallback('carheist:server:checkPoliceCount', function(data)
        if data['status'] then
            TriggerCallback('carheist:server:checkTime', function(data)
                if data['status'] then
                    ShowNotification(Strings['start_heist'])
                    ShowNotification(Strings['start_heist2'])
                    carsBlip = addBlip(Config['CarSetup']['main'], 90, 0, Strings['airport_blip'])
                    SetupCarHeist()
                end
            end)
        end
    end)
end

stacks = {}
lootTables = {}
loots = {}
guardPeds = {}
function SetupCarHeist()
    TriggerServerEvent('carheist:server:spawnCars')
    while true do
        local ped = PlayerPedId()
        local pedCo = GetEntityCoords(ped)
        local dist = #(pedCo - Config['CarSetup']['main'])
        if dist <= 250.0 then
            break
        end
        Wait(1)
    end
    local ped = PlayerPedId()
    SetPedRelationshipGroupHash(ped, GetHashKey('PLAYER'))
    AddRelationshipGroup('GuardPeds')
    for k, v in pairs(Config['CarSetup']['guards']['peds']) do
        loadModel(v['model'])
        guardPeds[k] = CreatePed(4, v['model'], v['coords'], 1, 1, 0)
        SetEntityHeading(guardPeds[k], v['heading'])
        NetworkRegisterEntityAsNetworked(guardPeds[k])
        networkID = NetworkGetNetworkIdFromEntity(guardPeds[k])
        SetNetworkIdCanMigrate(networkID, true)
        SetNetworkIdExistsOnAllMachines(networkID, true)
        SetEntityAsMissionEntity(guardPeds[k])
        SetEntityVisible(guardPeds[k], true)
        SetPedRelationshipGroupHash(guardPeds[k], GetHashKey("GuardPeds"))
        SetPedAccuracy(guardPeds[k], 50)
        SetPedArmour(guardPeds[k], 100)
        SetPedCanSwitchWeapon(guardPeds[k], true)
        SetPedDropsWeaponsWhenDead(guardPeds[k], false)
		SetPedFleeAttributes(guardPeds[k], 0, false)
        GiveWeaponToPed(guardPeds[k], GetHashKey(Config['CarSetup']['guards']['weapon']), 255, false, false)
        SetPedRandomComponentVariation(guardPeds[k], 0)
        SetPedRandomProps(guardPeds[k])
        SetPedCombatAttributes(guardPeds[k], 46, true)
        SetPedAlertness(guardPeds[k], 3)
        TaskGuardCurrentPosition(guardPeds[k], 25.0, 25.0, 1)
        Wait(50)
    end
    SetRelationshipBetweenGroups(0, GetHashKey("PLAYER"), GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(0, GetHashKey("GuardPeds"), GetHashKey("GuardPeds"))
	SetRelationshipBetweenGroups(5, GetHashKey("GuardPeds"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("GuardPeds"))
    Wait(500)
    loadModel('prop_cash_crate_01')
    for k, v in pairs(Config['CarSetup']['moneyStacks']) do
        stacks[k] = CreateObject(GetHashKey('prop_cash_crate_01'), v['scenePos'], 1, 1, 0)
        SetEntityCollision(stacks[k], false, false)
        SetEntityRotation(stacks[k], v['sceneRot'])
        FreezeEntityPosition(stacks[k], true)
        Wait(100)
    end
    loadModel('ch_prop_ch_service_trolley_01a')
    for k, v in pairs(Config['CarSetup']['tables']) do
        if v['type'] == 'money' then
            lootModel = 'h4_prop_h4_cash_stack_01a'
        elseif v['type'] == 'gold' then
            lootModel = 'h4_prop_h4_gold_stack_01a'
        elseif v['type'] == 'weed' then
            lootModel = 'h4_prop_h4_weed_stack_01a'
        elseif v['type'] == 'coke' then
            lootModel = 'h4_prop_h4_coke_stack_01a'
        end
        loadModel(lootModel)
        lootTables[k] = CreateObject(GetHashKey('ch_prop_ch_service_trolley_01a'), v['coords'], 1, 1, 0)
        SetEntityCollision(lootTables[k], false, false)
        SetEntityHeading(lootTables[k], v['heading'])
        FreezeEntityPosition(lootTables[k], true)
        loots[k] = CreateObject(GetHashKey(lootModel), GetOffsetFromEntityInWorldCoords(lootTables[k], vector3(0.001086, -0.051552, 0.995132)), 1, 1, 0)
        SetEntityHeading(loots[k], GetEntityHeading(lootTables[k]))
        Wait(100)
    end
    TriggerServerEvent('carheist:server:sync', 'mainLoop')
    TriggerServerEvent('carheist:server:policeAlert', Config['CarSetup']['main'])
end

function checkVehicleLock(vehicle)
    for k, v in pairs(cars['plate']) do
        if GetVehicleNumberPlateText(vehicle) == v then
            if cars['lock'][k] then
                return 2
            else
                return 1
            end
        end
    end
end

RegisterNetEvent('carheist:client:sync')
AddEventHandler('carheist:client:sync', function(type, args)
    if type == 'getServerTables' then
        cars = args[1]
        if args[2] then
            Citizen.CreateThread(function()
                while true do
                    local ped = PlayerPedId()
                    local pedCo = GetEntityCoords(ped)
                    local mainDist = #(pedCo - Config['CarSetup']['main'])
                    if mainDist <= 150.0 then
                        plane = NetworkGetEntityFromNetworkId(args[2])
                        if plane ~= 0 then
                            if mainDist <= 100.0 then
                                SetVehicleDoorOpen(plane, 2, false, true)
                                SetVehicleDoorOpen(plane, 3, false, true)
                                break
                            end
                        end
                    end
                    Citizen.Wait(1)
                end
            end)
        end
    elseif type == 'heistSync' then
        HeistSync[args[1]][args[2]] = not HeistSync[args[1]][args[2]]
    elseif type == 'mainLoop' then
        mainLoop = true
        Citizen.CreateThread(function()
            while mainLoop do
                local ped = PlayerPedId()
                local pedCo = GetEntityCoords(ped)
                local mainDist = #(pedCo - Config['CarSetup']['main'])
                local tryVehicle = GetVehiclePedIsTryingToEnter(ped)
                if mainDist <= 100.0 then
                    if tryVehicle ~= 0 then
                        if checkVehicleLock(tryVehicle) == 2 then
                            SetVehicleDoorsLocked(tryVehicle, 2)
                        elseif checkVehicleLock(tryVehicle) == 1 then
                            SetVehicleDoorsLocked(tryVehicle, 1)
                        end
                    end
                end
                if mainDist >= 250.0 and robber then
                    Outside()
                    break
                end
                for k, v in pairs(Config['CarSetup']['cars']) do
                    if v['model'] ~= 'tr2' or v['model'] ~= 'hauler'or v['model'] ~= 'cargoplane' then
                        local dist = #(pedCo - v['coords'])
                        if dist <= 1.7 and not HeistSync['cars'][k] and not busy then
                            ShowHelpNotification(Strings['hack_car'].. firstToUpper(GetDisplayNameFromVehicleModel(GetHashKey(v['model'])):lower()))
                            if IsControlJustPressed(0, 38) then
                                Hacking(k)
                            end
                        end
                    end
                end
                for k, v in pairs(Config['CarSetup']['tables']) do
                    local dist = #(pedCo - v['coords'])
                    if dist <= 1.4 and not HeistSync['stacks'][k] and not busy then
                        sleep = 1
                        ShowHelpNotification(Strings['grab_stack'])
                        if IsControlJustPressed(0, 38) then
                            GrabStacks(k)
                        end
                    end
                end
                for k, v in pairs(Config['CarSetup']['moneyStacks']) do
                    local dist = #(pedCo - v['scenePos'])
                    if dist <= 1.4 and not HeistSync['moneyStacks'][k] and not busy then
                        sleep = 1
                        ShowHelpNotification(Strings['grab_money'])
                        if IsControlJustPressed(0, 38) then
                            GrabMoneyStacks(k)
                        end
                    end
                end
                Citizen.Wait(1)
            end
        end)
    elseif type == 'delete' then
        local entity =  NetworkGetEntityFromNetworkId(args[1])
        DeleteObject(entity)
    elseif type == 'resetHeist' then
        mainLoop = false
        HeistSync = {
            ['stacks'] = {},
            ['artifacts'] = {},
        }
        lootTables = {}
        loots = {}
        stacks = {}
        guardPeds = {}
        ClearArea(Config['CarSetup']['main'], 50.0)
    end
end)

function checkVehicle(vehicle)
    for k, v in pairs(cars['plate']) do
        if GetVehicleNumberPlateText(vehicle) == v then
            return true
        end
    end
end

function Outside()
    if robber then
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        RemoveBlip(carsBlip)
        buyerBlip = addBlip(Config['CarHeist']['finishHeist']['buyerPos'], 500, 0, Strings['buyer_blip'])
        if checkVehicle(vehicle) and GetPedInVehicleSeat(vehicle, -1) == ped then
            ShowNotification(Strings['deliver_to_buyer_with_car'])
            robber = false
            while true do
                local ped = PlayerPedId()
                local pedCo = GetEntityCoords(ped)
                local vehicle = GetVehiclePedIsIn(ped, false)
                local dist = #(pedCo - Config['CarSetup']['dealerScene']['start']['coords'])
                if dist <= 2.0 and vehicle ~= 0 then
                    if checkVehicle(vehicle) then
                        break
                    end
                end
                Wait(1)
            end
            cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
            camCoords = Config['CarSetup']['dealerScene']['cam']['coords']
            SetCamActive(cam, true)
            RenderScriptCams(true, true, 1000, true, false)
            SetCamCoord(cam, camCoords)
            SetCamRot(cam, Config['CarSetup']['dealerScene']['cam']['rotation'])

            vehicle = GetVehiclePedIsIn(ped, false)
            vehiclePlate = GetVehicleNumberPlateText(vehicle)
            SetEntityCoords(vehicle, Config['CarSetup']['dealerScene']['start']['coords'])
            SetEntityHeading(vehicle, Config['CarSetup']['dealerScene']['start']['heading'])
            _TaskVehicleDriveToCoord(ped, vehicle, Config['CarSetup']['dealerScene']['finish'], 7.0, 0, GetEntityModel(vehicle), 786603, 1.0, true)
            for k, v in pairs(cars['plate']) do
                if vehiclePlate == v then
                    index = k
                end
            end
            TriggerServerEvent('carheist:server:deleteVehicle', index)
            RenderScriptCams(false, true, 1000, 1, 0)
            DestroyCam(cam, false)
            TriggerServerEvent('carheist:server:sellRewardItems', index)
            RemoveBlip(buyerBlip)
        else
            ShowNotification(Strings['deliver_to_buyer'])
            robber = false
            RemoveBlip(carsBlip)
            while true do
                local ped = PlayerPedId()
                local pedCo = GetEntityCoords(ped)
                local dist = #(pedCo - Config['CarHeist']['finishHeist']['buyerPos'])

                if dist <= 15.0 then
                    PlayCutscene('hs3f_all_drp3', Config['CarHeist']['finishHeist']['buyerPos'])
                    DeleteVehicle(buyerVehicle)
                    RemoveBlip(buyerBlip)
                    TriggerServerEvent('carheist:server:sellRewardItems')
                    break
                end
                Wait(1)
            end
        end
    end
end

function _TaskVehicleDriveToCoord(ped, vehicle, x, y, z, speed, p6, vehicleModel, drivingMode, stopRange, p10)
    TaskVehicleDriveToCoord(ped, vehicle, x, y, z, speed, p6, vehicleModel, drivingMode, stopRange, p10)

    while GetScriptTaskStatus(ped, 0x93A5526E) ~= 7 do
        Wait(0)
    end

    return true
end

function Hacking(index)
    TriggerCallback('carheist:server:hasItem', function(data)
        if data['status'] then
            if Config['CarHeist']['removeLaptopItem'] then
                TriggerServerEvent('carheist:server:removeItem', Config['CarHeist']['requiredItems'][2])
            end
            local ped = PlayerPedId()
            local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
            local animDict = 'anim@heists@ornate_bank@hack'
            TriggerServerEvent('carheist:server:sync', 'heistSync', {'cars', index})
            busy = true
            robber = true

            scenePos = GetEntityCoords(ped)
            sceneRot = GetEntityRotation(ped)

            for k, v in pairs(LaptopAnimation['objects']) do
                loadModel(v)
                LaptopAnimation['sceneObjects'][k] = CreateObject(GetHashKey(v), pedCo, 1, 1, 0)
            end

            for i =1, #LaptopAnimation['animations'] do
                LaptopAnimation['scenes'][i] = NetworkCreateSynchronisedScene(scenePos.xy, scenePos.z + 0.4, sceneRot, 2, true, false, 1065353216, 0, 1.3)
                NetworkAddPedToSynchronisedScene(ped, LaptopAnimation['scenes'][i], animDict, LaptopAnimation['animations'][i][1], 1.5, -4.0, 1, 16, 1148846080, 0)
                NetworkAddEntityToSynchronisedScene(LaptopAnimation['sceneObjects'][1], LaptopAnimation['scenes'][i], animDict, LaptopAnimation['animations'][i][3], 4.0, -8.0, 1)
            end

            NetworkStartSynchronisedScene(LaptopAnimation['scenes'][2])
            Wait(3000)
            StartHotwire(function(status)
                if status then
                    TriggerEvent('carheist:client:giveVehicleKey', cars['plate'][index])
                    TriggerServerEvent('carheist:server:lockVehicle', index)
                else
                    TriggerServerEvent('carheist:server:sync', 'heistSync', {'cars', index})
                end
            end)
            DeleteObject(LaptopAnimation['sceneObjects'][1])
            busy = false
        else
            ShowNotification(Strings['need_this'] .. data['label'])
        end
    end, {itemName = Config['CarHeist']['requiredItems'][2]})
end

function GrabStacks(index)
    TriggerCallback('carheist:server:hasItem', function(data)
        if data['status'] then
            busy = true
            robber = true
            local ped = PlayerPedId()
            local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
            local animDict
            local stackModel

            TriggerServerEvent('carheist:server:sync', 'heistSync', {'stacks', index})
            local stackType = Config['CarSetup']['tables'][index]['type']
            animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@'
            if stackType == 'money' then
                stackModel = GetHashKey('h4_prop_h4_cash_stack_01a')
            elseif stackType == 'coke' then
                stackModel = GetHashKey('h4_prop_h4_coke_stack_01a')
            elseif stackType == 'weed' then
                stackModel = GetHashKey('h4_prop_h4_weed_stack_01a')
            elseif stackType == 'gold' then
                stackModel = GetHashKey('h4_prop_h4_gold_stack_01a')
                animDict = 'anim@scripted@heist@ig1_table_grab@gold@male@'
            end
            
            loadAnimDict(animDict)
            loadModel(stackModel)
            loadModel('hei_p_m_bag_var22_arm_s')
            bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCo, 1, 1, 0)
            SetEntityCollision(bag, false, false)
            sceneObject = GetClosestObjectOfType(pedCo, 3.0, stackModel, 0, 0, 0)
            NetworkRequestControlOfEntity(sceneObject)
            scenePos = GetEntityCoords(sceneObject)
            sceneRot = GetEntityRotation(sceneObject)

            for i = 1, #GrabCash['animations'] do
                GrabCash['scenes'][i] = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.0)
                NetworkAddPedToSynchronisedScene(ped, GrabCash['scenes'][i], animDict, GrabCash['animations'][i][1], 4.0, -4.0, 1033, 0, 1000.0, 0)
                NetworkAddEntityToSynchronisedScene(bag, GrabCash['scenes'][i], animDict, GrabCash['animations'][i][2], 1.0, -1.0, 1148846080)
                if i == 2 then
                    if stackModel == -180074230 then
                        NetworkAddEntityToSynchronisedScene(sceneObject, GrabCash['scenes'][i], animDict, 'grab_gold', 1.0, -1.0, 1148846080)
                    else
                        NetworkAddEntityToSynchronisedScene(sceneObject, GrabCash['scenes'][i], animDict, GrabCash['animations'][i][3], 1.0, -1.0, 1148846080)
                    end
                end
            end

            SetEntityCoords(ped, GetEntityCoords(sceneObject))
            SetPedComponentVariation(ped, 5, 0, 0, 0)
            NetworkStartSynchronisedScene(GrabCash['scenes'][1])
            Wait(GetAnimDuration(animDict, 'enter') * 1000)
            SetEntityCoords(ped, GetEntityCoords(sceneObject))
            NetworkStartSynchronisedScene(GrabCash['scenes'][2])
            Wait(GetAnimDuration(animDict, 'grab') * 1000)
            DeleteObjectSync(sceneObject)
            if stackType == 'gold' then
                TriggerServerEvent('carheist:server:rewardItem', Config['CarHeist']['rewardItems'][1]['itemName'], Config['CarHeist']['rewardItems'][1]['count'], 'item')
            elseif stackType == 'coke' then
                TriggerServerEvent('carheist:server:rewardItem', Config['CarHeist']['rewardItems'][2]['itemName'], Config['CarHeist']['rewardItems'][2]['count'], 'item')
            elseif stackType == 'weed' then
                TriggerServerEvent('carheist:server:rewardItem', Config['CarHeist']['rewardItems'][3]['itemName'], Config['CarHeist']['rewardItems'][3]['count'], 'item')
            elseif stackType == 'money' then
                TriggerServerEvent('carheist:server:rewardItem', 'nil', Config['CarHeist']['rewardMoneys']['stacks'](), 'money')
            end
            TaskPlayAnim(ped, animDict, "exit", 1.0, 1.0, -1, 49, 1, false, false, false)
            Wait(1000)
            SetPedComponentVariation(ped, 5, 45, 0, 0)

            DeleteObject(bag)
            ClearPedTasks(ped)
            busy = false
        else
            ShowNotification(Strings['need_this'] .. data['label'])
        end
    end, {itemName = Config['CarHeist']['requiredItems'][1]})
end

function GrabMoneyStacks(index)
    TriggerCallback('carheist:server:hasItem', function(data)
        if data['status'] then
            busy = true
            robber = true
            TriggerServerEvent('carheist:server:sync', 'heistSync', {'moneyStacks', index})
            local ped = PlayerPedId()
            local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
            local animDict = 'anim@heists@money_grab@duffel'

            for k, v in pairs(MoneyStacks['objects']) do
                loadModel(v)
                MoneyStacks['sceneObjects'][k] = CreateObject(GetHashKey(v), pedCo, 1, 1, 0)
                SetEntityCollision(MoneyStacks['sceneObjects'][k], false, false)
            end
            
            sceneObject = GetClosestObjectOfType(pedCo, 2.0, GetHashKey('prop_cash_crate_01'), 0, 0, 0)
            scenePos = GetEntityCoords(sceneObject)
            sceneRot = GetEntityRotation(sceneObject)
            NetworkRequestControlOfEntity(sceneObject)
            
            cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
            camOffset = vector3(-0.029938, 2.228577, 0.703409)
            SetCamActive(cam, true)
            RenderScriptCams(true, true, 1500, true, false)
            SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(sceneObject, camOffset))
            SetCamRot(cam, vector3(0.0, 0.0, GetEntityHeading(sceneObject) + 180))

            for i = 1, #MoneyStacks['animations'] do
                if i == 1 then
                    MoneyStacks['scenes'][i] = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.0)
                else
                    MoneyStacks['scenes'][i] = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, false, true, 1065353216, 0, 1.0)
                end
                NetworkAddPedToSynchronisedScene(ped, MoneyStacks['scenes'][i], animDict, MoneyStacks['animations'][i][1], 1.5, -4.0, 1, 16, 1148846080, 0)
                NetworkAddEntityToSynchronisedScene(MoneyStacks['sceneObjects'][1], MoneyStacks['scenes'][i], animDict, MoneyStacks['animations'][i][2], 1000.0, -8.0, 1)
                NetworkAddEntityToSynchronisedScene(MoneyStacks['sceneObjects'][2], MoneyStacks['scenes'][i], animDict, MoneyStacks['animations'][i][3], 4.0, -8.0, 1)
            end

            SetPedComponentVariation(ped, 5, 0, 0, 0)
            SetEntityCoords(ped, GetEntityCoords(sceneObject))
            NetworkStartSynchronisedScene(MoneyStacks['scenes'][1])
            Wait(GetAnimDuration(animDict, 'enter') * 1000)
            SetEntityCoords(ped, GetEntityCoords(sceneObject))
            NetworkStartSynchronisedScene(MoneyStacks['scenes'][2])
            Wait(500)
            money1 = CreateObject(GetHashKey('hei_prop_heist_cash_pile'), pedCo, 1, 1, 0)
            money2 = CreateObject(GetHashKey('hei_prop_heist_cash_pile'), pedCo, 1, 1, 0)
            AttachEntityToEntity(money1, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
            AttachEntityToEntity(money2, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -21.0, 0, 1, 1, 1, 0, 1)
            Wait(10000)
            DeleteObject(money1)
            DeleteObject(money2)
            DeleteObjectSync(sceneObject)
            NetworkStartSynchronisedScene(MoneyStacks['scenes'][3])
            Wait(GetAnimDuration(animDict, 'exit') * 1000 - 1000)
            TriggerServerEvent('carheist:server:rewardItem', 'nil', Config['CarHeist']['rewardMoneys']['stacks'](), 'money')
            SetPedComponentVariation(ped, 5, 45, 0, 0)
            ClearPedTasks(ped)
            DeleteObject(MoneyStacks['sceneObjects'][1])
            DeleteObject(MoneyStacks['sceneObjects'][2])
            RenderScriptCams(false, true, 1500, true, false)
            DestroyCam(cam, false)
            busy = false
        else
            ShowNotification(Strings['need_this'] .. data['label'])
        end
    end, {itemName = Config['CarHeist']['requiredItems'][1]})
end

--Thanks to d0p3t
function PlayCutscene(cut, coords)
    while not HasThisCutsceneLoaded(cut) do 
        RequestCutscene(cut, 8)
        Wait(0) 
    end
    CreateCutscene(false, coords)
    Finish(coords)
    RemoveCutscene()
    DoScreenFadeIn(500)
end

function CreateCutscene(change, coords)
    local ped = PlayerPedId()
        
    local clone = ClonePedEx(ped, 0.0, false, true, 1)
    local clone2 = ClonePedEx(ped, 0.0, false, true, 1)
    local clone3 = ClonePedEx(ped, 0.0, false, true, 1)
    local clone4 = ClonePedEx(ped, 0.0, false, true, 1)
    local clone5 = ClonePedEx(ped, 0.0, false, true, 1)

    SetBlockingOfNonTemporaryEvents(clone, true)
    SetEntityVisible(clone, false, false)
    SetEntityInvincible(clone, true)
    SetEntityCollision(clone, false, false)
    FreezeEntityPosition(clone, true)
    SetPedHelmet(clone, false)
    RemovePedHelmet(clone, true)
    
    if change then
        SetCutsceneEntityStreamingFlags('MP_2', 0, 1)
        RegisterEntityForCutscene(ped, 'MP_2', 0, GetEntityModel(ped), 64)
        
        SetCutsceneEntityStreamingFlags('MP_1', 0, 1)
        RegisterEntityForCutscene(clone2, 'MP_1', 0, GetEntityModel(clone2), 64)
    else
        SetCutsceneEntityStreamingFlags('MP_1', 0, 1)
        RegisterEntityForCutscene(ped, 'MP_1', 0, GetEntityModel(ped), 64)

        SetCutsceneEntityStreamingFlags('MP_2', 0, 1)
        RegisterEntityForCutscene(clone2, 'MP_2', 0, GetEntityModel(clone2), 64)
    end

    SetCutsceneEntityStreamingFlags('MP_3', 0, 1)
    RegisterEntityForCutscene(clone3, 'MP_3', 0, GetEntityModel(clone3), 64)
    
    SetCutsceneEntityStreamingFlags('MP_4', 0, 1)
    RegisterEntityForCutscene(clone4, 'MP_4', 0, GetEntityModel(clone4), 64)
    
    SetCutsceneEntityStreamingFlags('MP_5', 0, 1)
    RegisterEntityForCutscene(clone5, 'MP_5', 0, GetEntityModel(clone5), 64)
    
    Wait(10)
    if coords then
        StartCutsceneAtCoords(coords, 0)
    else
        StartCutscene(0)
    end
    Wait(10)
    ClonePedToTarget(clone, ped)
    Wait(10)
    DeleteEntity(clone)
    DeleteEntity(clone2)
    DeleteEntity(clone3)
    DeleteEntity(clone4)
    DeleteEntity(clone5)
    Wait(50)
    DoScreenFadeIn(250)
end

function Finish(coords)
    if coords then
        local tripped = false
        repeat
            Wait(0)
            if (GetCutsceneTotalDuration() - GetCutsceneTime() <= 250) then
            DoScreenFadeOut(250)
            tripped = true
            end
        until not IsCutscenePlaying()
        if (not tripped) then
            DoScreenFadeOut(100)
            Wait(150)
        end
        return
    else
        Wait(18500)
        StopCutsceneImmediately()
    end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function loadPtfxAsset(dict)
    while not HasNamedPtfxAssetLoaded(dict) do
        RequestNamedPtfxAsset(dict)
        Citizen.Wait(50)
	end
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(50)
    end
end

function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

function addBlip(coords, sprite, colour, text)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipScale(blip, 0.8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
    return blip
end

function DeleteObjectSync(entity)
    TriggerServerEvent('carheist:server:sync', 'delete', {NetworkGetNetworkIdFromEntity(entity)})
end