VehicleNitrous = {}
local NitrousActivated = false
local NitrousBoost = 35.0
local Fxs = {}

function trim(value)
	if not value then return nil end
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

function nitroActive()
    nuiMessage("NITRO_ACTIVE")
end

function setNitroValue(value, plate)
    local CurrentVehicle = Vehicle
    if DoesEntityExist(CurrentVehicle) then
        local Plate = trim(GetVehicleNumberPlateText(CurrentVehicle))
        if Plate == plate then
            nuiMessage("SET_NITRO_VALUE", value)
        end
    end
end


RegisterNetEvent('mHud:LoadNitrous', function()
    local IsInVehicle = IsPedInAnyVehicle(PlayerPed)
    local ped = PlayerPed
    local veh = Vehicle

    if not NitrousActivated and DoesEntityExist(veh) then
        if IsInVehicle and not IsThisModelABike(GetEntityModel(Vehicle)) then
            if GetPedInVehicleSeat(veh, -1) == ped then
                Config.Notification(Config.Notifications["INSTALLING_NITRO"].message, Config.Notifications["INSTALLING_NITRO"].type)                    
                Wait(3000)
                if IsPedInAnyVehicle(PlayerPed) and GetPedInVehicleSeat(Vehicle, -1) == ped then
                    TriggerServerEvent("mHud:server:removeItem")
                    local Plate = trim(GetVehicleNumberPlateText(veh))
                    TriggerServerEvent('mHud:server:LoadNitrous', Plate)
                    Config.Notification(Config.Notifications["NITRO_INSTALLED"].message, Config.Notifications["NITRO_INSTALLED"].type)                                        
                else
                    Config.Notification(Config.Notifications["NOT_IN_VEHICLE"].message, Config.Notifications["NOT_IN_VEHICLE"].type)                    
                end
            else
                Config.Notification(Config.Notifications["SIT_DRIVER_SEAT"].message, Config.Notifications["SIT_DRIVER_SEAT"].type)                    
            end
        else
            Config.Notification(Config.Notifications["NOT_IN_VEHICLE"].message, Config.Notifications["NOT_IN_VEHICLE"].type)                    
        end
    else
        Config.Notification(Config.Notifications["HAS_ALREADY_NITRO"].message, Config.Notifications["HAS_ALREADY_NITRO"].type)                    
    end
end)


CreateThread(function()
    local spam = false
    while true do
        
        local CurrentVehicle = Vehicle
        if alreadyInVehicle and DoesEntityExist(CurrentVehicle) then
            local Plate = trim(GetVehicleNumberPlateText(CurrentVehicle))
            if VehicleNitrous[Plate] ~= nil then
                if VehicleNitrous[Plate].hasnitro then
                    if IsDisabledControlJustPressed(0, Config.NitroKey) and not spam and GetPedInVehicleSeat(CurrentVehicle, -1) == PlayerPed then
                        spam = true
                        CreateThread(function()
                            while spam do
                                Wait(1500)
                                spam = false
                            end
                        end)
                        SetVehicleEnginePowerMultiplier(CurrentVehicle, NitrousBoost)
                        SetVehicleEngineTorqueMultiplier(CurrentVehicle, NitrousBoost)
                        SetEntityMaxSpeed(CurrentVehicle, 999.0)
                        NitrousActivated = true
                        setNitroValue(VehicleNitrous[Plate].level, Plate)
                        CreateThread(function()
                            while NitrousActivated do
                                if VehicleNitrous[Plate].level - 1 ~= 0 then
                                    TriggerServerEvent('mHud:server:UpdateNitroLevel', Plate, (VehicleNitrous[Plate].level - 1))
                                else
                                    TriggerServerEvent('mHud:server:UnloadNitrous', Plate)
                                    NitrousActivated = false
                                    SetVehicleBoostActive(CurrentVehicle, 0)
                                    SetVehicleEnginePowerMultiplier(CurrentVehicle, 1.0)
                                    SetVehicleEngineTorqueMultiplier(CurrentVehicle, 1.0)
     
                                    StopScreenEffect("RaceTurbo")
                                    for index,_ in pairs(Fxs) do
                                        StopParticleFxLooped(Fxs[index], 1)
                                        TriggerServerEvent('mHud:server:StopSync', trim(GetVehicleNumberPlateText(CurrentVehicle)))
                                        Fxs[index] = nil
                                    end
                                end
                                nitroActive()
                                Wait(200)
                            end
                        end)
                    end

                    if IsDisabledControlJustReleased(0, Config.NitroKey) and GetPedInVehicleSeat(CurrentVehicle, -1) == PlayerPed then
                        if NitrousActivated then
                            local veh = Vehicle
                            SetVehicleBoostActive(veh, 0)
                            SetVehicleEnginePowerMultiplier(veh, 1.0)
                            SetVehicleEngineTorqueMultiplier(veh, 1.0)
                            for index,_ in pairs(Fxs) do
                                StopParticleFxLooped(Fxs[index], 1)
                                TriggerServerEvent('mHud:server:StopSync', trim(GetVehicleNumberPlateText(veh)))
                                Fxs[index] = nil
                            end
                            StopScreenEffect("RaceTurbo")
                            NitrousActivated = false
                        end
                    end
                end
            else
             
                StopScreenEffect("RaceTurbo")
            end
        else
          
            StopScreenEffect("RaceTurbo")
            Wait(1500)
        end
        Wait(3)
    end
end)

p_flame_location = {
	"exhaust",
	"exhaust_2",
	"exhaust_3",
	"exhaust_4",
	"exhaust_5",
	"exhaust_6",
	"exhaust_7",
	"exhaust_8",
	"exhaust_9",
	"exhaust_10",
	"exhaust_11",
	"exhaust_12",
	"exhaust_13",
	"exhaust_14",
	"exhaust_15",
	"exhaust_16",
}

ParticleDict = "veh_xs_vehicle_mods"
ParticleFx = "veh_nitrous"
ParticleSize = 1.4

CreateThread(function()
    while true do
        if NitrousActivated then
            local veh = Vehicle
            if veh ~= 0 and DoesEntityExist(veh) then
                TriggerServerEvent('mHud:server:SyncFlames', VehToNet(veh))
                SetVehicleBoostActive(veh, 1)
                StartScreenEffect("RaceTurbo", 0.0, 0)

                for _,bones in pairs(p_flame_location) do
                    if GetEntityBoneIndexByName(veh, bones) ~= -1 then
                        if Fxs[bones] == nil then
                            RequestNamedPtfxAsset(ParticleDict)
                            while not HasNamedPtfxAssetLoaded(ParticleDict) do
                                Wait(0)
                            end
                            SetPtfxAssetNextCall(ParticleDict)
                            UseParticleFxAssetNextCall(ParticleDict)
                            Fxs[bones] = StartParticleFxLoopedOnEntityBone(ParticleFx, veh, 0.0, -0.02, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(veh, bones), ParticleSize, 0.0, 0.0, 0.0)
                        end
                    end
                end
            end
        end
        Wait(100)
    end
end)

local NOSPFX = {}

RegisterNetEvent('mHud:client:SyncFlames', function(netid, nosid)
    local veh = NetToVeh(netid)
    if veh ~= 0 then
        local myid = GetPlayerServerId(PlayerId())
        if NOSPFX[trim(GetVehicleNumberPlateText(veh))] == nil then
            NOSPFX[trim(GetVehicleNumberPlateText(veh))] = {}
        end
        if myid ~= nosid then
            for _,bones in pairs(p_flame_location) do
                if NOSPFX[trim(GetVehicleNumberPlateText(veh))][bones] == nil then
                    NOSPFX[trim(GetVehicleNumberPlateText(veh))][bones] = {}
                end
                if GetEntityBoneIndexByName(veh, bones) ~= -1 then
                    if NOSPFX[trim(GetVehicleNumberPlateText(veh))][bones].pfx == nil then
                        RequestNamedPtfxAsset(ParticleDict)
                        while not HasNamedPtfxAssetLoaded(ParticleDict) do
                            Wait(0)
                        end
                        SetPtfxAssetNextCall(ParticleDict)
                        UseParticleFxAssetNextCall(ParticleDict)
                        NOSPFX[trim(GetVehicleNumberPlateText(veh))][bones].pfx = StartParticleFxLoopedOnEntityBone(ParticleFx, veh, 0.0, -0.05, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(veh, bones), ParticleSize, 0.0, 0.0, 0.0)

                    end
                end
            end
        end
    end
end)

RegisterNetEvent('mHud:client:StopSync', function(plate)
    if NOSPFX[plate] then
        for k, v in pairs(NOSPFX[plate]) do
            if v then
                StopParticleFxLooped(v.pfx, 1)
                NOSPFX[plate][k].pfx = nil
            end
        end
    end
end)

RegisterNetEvent('mHud:client:UpdateNitroLevel', function(Plate, level)
    VehicleNitrous[Plate].level = level
    setNitroValue(VehicleNitrous[Plate].level, Plate)

end)

RegisterNetEvent('mHud:client:LoadNitrous', function(Plate)
    VehicleNitrous[Plate] = {
        hasnitro = true,
        level = 100,
    }
    setNitroValue(VehicleNitrous[Plate].level, Plate)
  
 
end)

RegisterNetEvent('mHud:client:UnloadNitrous', function(Plate)
    VehicleNitrous[Plate] = nil
    local CurrentVehicle = Vehicle
    if DoesEntityExist(CurrentVehicle) then
        local CPlate = trim(GetVehicleNumberPlateText(CurrentVehicle))
        if CPlate == Plate then
            NitrousActivated = false
        end
        setNitroValue(0, Plate)
    end
end)