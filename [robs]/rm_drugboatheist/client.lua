GrabCash = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s'
    },
    ['animations'] = {
        {'enter', 'enter_bag'},
        {'grab', 'grab_bag', 'grab_cash'},
        {'exit', 'exit_bag'},
    },
    ['scenes'] = {},
    ['scenesObjects'] = {}
}
DrugBoatHeist = {
    ['startPeds'] = {}
}
LootSync = {
    ['drugs'] = {}
}
tables = {}
drugs = {}
guardPeds = {}

ESX, QBCore = nil, nil
Citizen.CreateThread(function()
    if Config['DrugBoatHeist']['framework']['name'] == 'ESX' then
        while ESX == nil do
            TriggerEvent(Config['DrugBoatHeist']['framework']['eventName'], function(library) 
                ESX = library 
            end)
            Citizen.Wait(1)
        end
    elseif Config['DrugBoatHeist']['framework']['name'] == 'QB' then
        while not QBCore do
            pcall(function() QBCore =  exports[Config['DrugBoatHeist']['framework']['scriptName']]:GetCoreObject() end)
            if not QBCore then
                pcall(function() QBCore =  exports[Config['DrugBoatHeist']['framework']['scriptName']]:GetSharedObject() end)
            end
            if not QBCore then
                TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            end
            Citizen.Wait(1)
        end
    end
    for k, v in pairs(Config['DrugBoatHeist']['startHeist']['peds']) do
        loadModel(v['ped'])
        DrugBoatHeist['startPeds'][k] = CreatePed(4, GetHashKey(v['ped']), v['pos']['x'], v['pos']['y'], v['pos']['z'] - 0.95, v['heading'], false, true)
        FreezeEntityPosition(DrugBoatHeist['startPeds'][k], true)
        SetEntityInvincible(DrugBoatHeist['startPeds'][k], true)
        SetBlockingOfNonTemporaryEvents(DrugBoatHeist['startPeds'][k], true)
    end
end)

function TriggerCallback(cbName, cb, data)
    if Config['DrugBoatHeist']['framework']['name'] == 'ESX' then
        ESX.TriggerServerCallback(cbName, function(data)
            if cb then cb(data) else return data end
        end, data)
    elseif Config['DrugBoatHeist']['framework']['name'] == 'QB' then
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
        local startDist = #(pedCo - Config['DrugBoatHeist']['startHeist']['pos'])
        if startDist <= 2.0 then
            sleep = 1
            ShowHelpNotification(Strings['e_start'])
            if IsControlJustPressed(0, 38) then
                StartHeist()
            end
        end
        Citizen.Wait(sleep)
    end
end)

function StartHeist()
    TriggerCallback('drugboatheist:server:checkPoliceCount', function(data)
        if data['status'] then
            TriggerCallback('drugboatheist:server:checkTime', function(data)
                if data['status'] then
                    ShowNotification(Strings['start_heist'])
                    ShowNotification(Strings['start_heist2'])
                    spawnConfig = Config['DrugBoatSetup']['boatLocations'][math.random(#Config['DrugBoatSetup']['boatLocations'])]
                    TriggerServerEvent('drugboatheist:server:spawnBoat', spawnConfig)
                    drugBoatBlip = addBlip(spawnConfig['pos'], 410, 70, Strings['drugboat_blip'])
                end
            end)
        end
    end)
end

RegisterNetEvent('drugboatheist:client:setupBoat')
AddEventHandler('drugboatheist:client:setupBoat', function(cfg, netId)
    while true do
        local ped = PlayerPedId()
        local pedCo = GetEntityCoords(ped)
        local dist = #(pedCo - cfg['pos'])
        if dist <= 100.0 then
            entity = NetworkGetEntityFromNetworkId(netId)
            if entity ~= 0 then
                break
            end
        end
        Wait(1)
    end
    TriggerServerEvent('drugboatheist:server:policeAlert', cfg['pos'])
    local ped = PlayerPedId()
    SetPedRelationshipGroupHash(ped, GetHashKey('PLAYER'))
    AddRelationshipGroup('GuardPeds')
    for k, v in pairs(Config['DrugBoatSetup']['guards']['peds']) do
        npcCo = GetOffsetFromEntityInWorldCoords(entity, v['offset'])
        loadModel(v['model'])
        guardPeds[k] = CreatePed(4, v['model'], npcCo, 1, 1, 0)
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
        GiveWeaponToPed(guardPeds[k], GetHashKey(Config['DrugBoatSetup']['guards']['weapon']), 255, false, false)
        SetPedRandomComponentVariation(guardPeds[k], 0)
        SetPedRandomProps(guardPeds[k])
        Wait(100)
    end
    SetRelationshipBetweenGroups(0, GetHashKey("GuardPeds"), GetHashKey("GuardPeds"))
	SetRelationshipBetweenGroups(5, GetHashKey("GuardPeds"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("GuardPeds"))
    Wait(500)
    for k, v in pairs(Config['DrugBoatSetup']['drugs']) do
        loadModel('h4_prop_h4_table_isl_01a')
        loadModel('h4_prop_h4_coke_stack_01a')
        loadModel('h4_prop_h4_weed_stack_01a')
        tables[k] = CreateObject(GetHashKey('h4_prop_h4_table_isl_01a'), GetOffsetFromEntityInWorldCoords(entity, v['offset']), 1, 1, 0)
        SetEntityHeading(tables[k], GetEntityHeading(entity) + v['heading'])
        if v['type'] == 'coke' then
            drugs[k] = CreateObject(GetHashKey('h4_prop_h4_coke_stack_01a'), GetOffsetFromEntityInWorldCoords(tables[k], vector3(0.051086, -0.151552, 0.945132)), 1, 1, 0)
            SetEntityHeading(drugs[k], GetEntityHeading(entity) + v['heading'])
        elseif v['type'] == 'weed' then
            drugs[k] = CreateObject(GetHashKey('h4_prop_h4_weed_stack_01a'), GetOffsetFromEntityInWorldCoords(tables[k], vector3(0.051086, -0.151552, 0.945132)), 1, 1, 0)
            SetEntityHeading(drugs[k], GetEntityHeading(entity) + v['heading'])
        end
        Wait(100)
    end
end)

RegisterNetEvent('drugboatheist:client:sync')
AddEventHandler('drugboatheist:client:sync', function(type, index)
    if type == 'drugs' then
        LootSync['drugs'][index] = true
    elseif type == 'deleteObject' then
        local entity =  NetworkGetEntityFromNetworkId(index)
        DeleteObject(entity)
    end
end)

RegisterNetEvent('drugboatheist:client:mainLoop')
AddEventHandler('drugboatheist:client:mainLoop', function(cfg, netId)
    mainLoop = true
    while mainLoop do
        local ped = PlayerPedId()
        local pedCo = GetEntityCoords(ped)
        local dist = #(pedCo - cfg['pos'])
        
        if dist <= 100.0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            if DoesEntityExist(entity) then
                for k, v in pairs(Config['DrugBoatSetup']['drugs']) do
                    if not LootSync['drugs'][k] then
                        local dist = #(pedCo - GetOffsetFromEntityInWorldCoords(entity, v['offset']))
                        if dist <= 1.5 and not busy then
                            ShowHelpNotification(Strings['grab'])
                            if IsControlJustPressed(0, 38) then
                                GrabDrugs(k, v['type'])
                            end
                        end
                    end
                end
            end
        else
            if robber then
                Outside()
                break
            end
        end
        Wait(1)
    end
end)

function GrabDrugs(index, type)
    if Config['DrugBoatSetup']['drugs'][index]['type'] == 'coke' then
        rewardIndex = 2
    else
        rewardIndex = 1
    end
    TriggerCallback('drugboatheist:server:hasItem', function(data)
        if data['status'] then
            busy = true
            robber = true
            TriggerServerEvent('drugboatheist:server:sync', 'drugs', index)
            local ped = PlayerPedId()
            local pedCo, pedRotation = GetEntityCoords(ped), GetEntityRotation(ped)
            local animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@'
            local stackModel = type
            
            if stackModel == 'coke' then
                stackModel = GetHashKey('h4_prop_h4_coke_stack_01a')
            elseif stackModel == 'weed' then 
                stackModel = GetHashKey('h4_prop_h4_weed_stack_01a')
            end
            
            loadAnimDict(animDict)
            loadModel('hei_p_m_bag_var22_arm_s')
            bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pedCo, 1, 1, 0)
            sceneObject = GetClosestObjectOfType(pedCo, 2.0, stackModel, 0, 0, 0)
            SetEntityCollision(bag, 0, 0)

            scenePos = GetEntityCoords(sceneObject)
            sceneRot = GetEntityRotation(sceneObject)

            for i = 1, #GrabCash['animations'] do
                GrabCash['scenes'][i] = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.0)
                NetworkAddPedToSynchronisedScene(ped, GrabCash['scenes'][i], animDict, GrabCash['animations'][i][1], 4.0, -4.0, 1033, 49, 1000.0, 0)
                NetworkAddEntityToSynchronisedScene(bag, GrabCash['scenes'][i], animDict, GrabCash['animations'][i][2], 1.0, -1.0, 1148846080)
                if i == 2 then
                    NetworkAddEntityToSynchronisedScene(sceneObject, GrabCash['scenes'][i], animDict, GrabCash['animations'][i][3], 1.0, -1.0, 1148846080)
                end
            end

            SetEntityCoords(ped, GetEntityCoords(sceneObject))
            NetworkStartSynchronisedScene(GrabCash['scenes'][1])
            Wait(2000)
            SetEntityCoords(ped, GetEntityCoords(sceneObject))
            NetworkStartSynchronisedScene(GrabCash['scenes'][2])
            Wait(13000)
            if Config['DrugBoatSetup']['drugs'][index]['type'] == 'coke' then
                TriggerServerEvent('drugboatheist:server:rewardItem', Config['DrugBoatHeist']['rewardItems'][2]['itemName'], Config['DrugBoatHeist']['rewardItems'][2]['count'], 'item')
            elseif Config['DrugBoatSetup']['drugs'][index]['type'] == 'weed' then
                TriggerServerEvent('drugboatheist:server:rewardItem', Config['DrugBoatHeist']['rewardItems'][1]['itemName'], Config['DrugBoatHeist']['rewardItems'][1]['count'], 'item')
            end
            DeleteObject(sceneObject)
            DeleteObject(bag)
            TaskPlayAnim(ped, animDict, "exit", 1.0, 1.0, -1, 49, 1, false, false, false)
            Wait(1000)

            ClearPedTasks(ped)
            busy = false
        else
            if data['label'] == 'Not space!' then
                ShowNotification(Strings['not_enough'])
            else
                ShowNotification(Strings['need_this'] .. data['label'])
            end
        end
    end, {itemName = Config['DrugBoatHeist']['requiredItems'][1], rewardItem = Config['DrugBoatHeist']['rewardItems'][rewardIndex]['itemName'], rewardCount = Config['DrugBoatHeist']['rewardItems'][rewardIndex]['count']})
end

RegisterNetEvent('drugboatheist:client:resetHeist')
AddEventHandler('drugboatheist:client:resetHeist', function()
    mainLoop = false
    LootSync = {
        ['drugs'] = {}
    }
    tables = {}
    drugs = {}
    guardPeds = {}
end)

function Outside()
    if robber then
        robber = false
        ShowNotification(Strings['deliver_to_buyer'])
        loadModel('baller')
        RemoveBlip(drugBoatBlip)
        buyerBlip = addBlip(Config['DrugBoatHeist']['finishHeist']['buyerPos'], 500, 0, Strings['buyer_blip'])
        buyerVehicle = CreateVehicle(GetHashKey('baller'), Config['DrugBoatHeist']['finishHeist']['buyerPos'].xy + 3.0, Config['DrugBoatHeist']['finishHeist']['buyerPos'].z, 269.4, 0, 0)
        while true do
            local ped = PlayerPedId()
            local pedCo = GetEntityCoords(ped)
            local dist = #(pedCo - Config['DrugBoatHeist']['finishHeist']['buyerPos'])

            if dist <= 15.0 then
                PlayCutscene('hs3f_all_drp2', Config['DrugBoatHeist']['finishHeist']['buyerPos'])
                DeleteVehicle(buyerVehicle)
                RemoveBlip(buyerBlip)
                TriggerServerEvent('drugboatheist:server:sellRewardItems')
                break
            end
            Wait(1)
        end
    end
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
    TriggerServerEvent('drugboatheist:server:sync', 'deleteObject', NetworkGetNetworkIdFromEntity(entity))
end