QBCore = exports['qb-core']:GetCoreObject()

local playerLoaded = false

---- SKILLS INFO
local SkillPoints
local xp
local ownedskills
---
local ResetAvailable = true

---- DATABASE
local HaveAddHealth = false
local AddHP = 0

local HaveAddArmor = false
local AddArmor = 0

local HaveHealthRegen = false
local StartHPRegeneration = 0
local StopHPRegeneration = 0
local HealthRegenTime = 0

local HaveArmorRegen = false
local StartArmorRegeneration = 0
local StopArmorRegeneration = 0
local ArmorRegenTime = 0

local HaveAddSpeed = false
local HaveAddSwimSpeed = false

local HaveAddDrivingSpeed = false
local AddCarSpeed = 0
local CarSpeedModified = false

local HaveAddFlyingSpeed = false
local AddFlyingSpeed = 0
local FlyingSpeedModified = false

local HaveAddBoatSpeed = false
local AddBoatSpeed = 0
local BoatSpeedModified = false
----

local HaveShieldWall = false
local WallRechargeTime = 0
local WallStandingTime = 0
local wallwasplaced = false
local wallstanding = false
local wall

local HaveAddStaminaSprintTime = false
local AddStamina = 0
local RestoreStaminaPoint = 100.0

local HaveAddStaminaRecoveryTime = false
local AddStaminaRecovery = 0
local RecoveryStaminaPoint = 1.0

--- Timers for threads
local StartAddHPTimer = false
local StartAddArmorTimer = false
local StartHealthRegenTimer = false
local StartArmorRegenTimer = false
--

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    playerLoaded = false
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    playerLoaded = true

    Citizen.Wait(1000)
    ResetAvailable = true

    QBCore.Functions.TriggerCallback("core_skills:getAbilities", function(data)

        local ped = PlayerPedId()
        local pedId = PlayerId()

        for k, v in pairs(data) do

            if v.skill_name == "AddHealth" then

                AddHP = v.value1
                HaveAddHealth = true

            end
            if v.skill_name == "AddArmor" then

                AddArmor = v.value1
                HaveAddArmor = true

            end
            if v.skill_name == "AddHealthRegen" then

                StartHPRegeneration = v.value1
                StopHPRegeneration = v.value2
                HealthRegenTime = v.value3 * 1000
                HaveHealthRegen = true

            end
            if v.skill_name == "AddArmorRegen" then

                StartArmorRegeneration = v.value1
                StopArmorRegeneration = v.value2
                ArmorRegenTime = v.value3 * 1000
                HaveArmorRegen = true

            end
            if v.skill_name == "AddSpeed" then

                AddRunningSpeed(v.value1)
                HaveAddSpeed = true

            end
            if v.skill_name == "AddSwimmingSpeed" then

                AddSwimmingSpeed(v.value1)
                HaveAddSwimSpeed = true

            end
            if v.skill_name == "AddUnderWaterTime" then

                AddUnderWater(v.value1)
                HaveAddUnderWaterTime = true

            end
            if v.skill_name == "AddDrivingSpeed" then

                AddCarSpeed = v.value1
                HaveAddDrivingSpeed = true

            end
            if v.skill_name == "AddBoatSpeed" then

                AddBoatSpeed = v.value1
                HaveAddBoatSpeed = true

            end
            if v.skill_name == "AddShieldWall" then

                HaveShieldWall = true
                WallStandingTime = v.value1
                WallRechargeTime = v.value2

            end
            if v.skill_name == "AddStaminaSprint" then

                HaveAddStaminaSprintTime = true
                AddStamina = v.value1

            end
            if v.skill_name == "AddStaminaRecovery" then

                HaveAddStaminaRecoveryTime = true
                AddStaminaRecovery = v.value1

            end
        end
    end)
end)

RegisterNUICallback('RestoreDefault', function(data)
    local ped = PlayerPedId()

    TriggerServerEvent('core_skills:resetall')

    HaveAddHealth = false
    AddHP = 0
    HaveAddArmor = false
    AddArmor = 0
    HaveHealthRegen = false
    StartHPRegeneration = 0
    StopHPRegeneration = 0
    HealthRegenTime = 0
    HaveArmorRegen = false
    StartArmorRegeneration = 0
    StopArmorRegeneration = 0
    ArmorRegenTime = 0
    HaveAddSpeed = false
    HaveAddSwimSpeed = false
    HaveAddDrivingSpeed = false
    AddCarSpeed = 0
    CarSpeedModified = false
    HaveAddFlyingSpeed = false
    AddFlyingSpeed = 0
    FlyingSpeedModified = false
    HaveAddBoatSpeed = false
    AddBoatSpeed = 0
    BoatSpeedModified = false
    HaveShieldWall = false
    WallRechargeTime = 0
    WallStandingTime = 0
    wallwasplaced = false
    HaveAddStaminaSprintTime = false
    AddStamina = 0
    RestoreStaminaPoint = 100.0
    HaveAddStaminaRecoveryTime = false
    AddStaminaRecovery = 0
    RecoveryStaminaPoint = 1.0
    AddUnderWater(10)
    AddRunningSpeed(1.0)
    AddSwimmingSpeed(1.0)

    local Player = QBCore.Functions.GetPlayerData()

    ResetAvailable = false

end)

--- Main Menu
local display = false
function SetDisplay(bool)
    local Player = QBCore.Functions.GetPlayerData()

    display = bool
    SetNuiFocus(bool, bool)
    TriggerScreenblurFadeIn(500)

    QBCore.Functions.TriggerCallback("core_skills:getSkillsinfo", function(data)
        SkillPoints = data["skillpoints"]
        xp = data["skillxp"]
        Level = data["currentlevel"]
        needxp = data["nextlevel"]

        QBCore.Functions.TriggerCallback("core_skills:getSkills", function(skills)
            SendNUIMessage({
                firstname = QBCore.Functions.GetPlayerData().charinfo.firstname,
                lastname = QBCore.Functions.GetPlayerData().charinfo.lastname,
                job = QBCore.Functions.GetPlayerData().job.name,
                type = "show",
                config = Config,
                level = Level,
                totalxp = xp,
                needxp = needxp,
                oldpoints = SkillPoints,
                ownedskills = skills,
                Ravailable = ResetAvailable
            })
        end)
    end)
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    local playerPed = GetPlayerPed(-1)
    if playerPed ~= nil then
        playerLoaded = true
    end
end)

RegisterCommand('openSkillsUi', function()
    if display == false and playerLoaded then
        SetDisplay(true)
    end
end)

RegisterKeyMapping('openSkillsUi', 'Open skills window', 'keyboard', Config.KeyToOpenSkillMenu)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)

        if display == true and playerLoaded then
            Citizen.Wait(500)
            QBCore.Functions.TriggerCallback("core_skills:getSkills", function(skills)
                SendNUIMessage({

                    type = "newownedskill",
                    newownedskill = skills,
                    Ravailable = ResetAvailable

                })
            end)

        else
            Citizen.Wait(900)
        end
    end
end)

RegisterNetEvent('core_skills:earnedxp')
AddEventHandler('core_skills:earnedxp', function(earned)

    local Player = QBCore.Functions.GetPlayerData()

    QBCore.Functions.TriggerCallback("core_skills:getSkillsinfo", function(data)
        xp = data["skillxp"]
        nextlevel = data["nextlevel"]
        level = data["currentlevel"]

        QBCore.Functions.Notify('You have earned: ' .. earned .. ' Skill Experience!')

        if xp >= nextlevel then

            currentlevel = nextlevel
            nextlevel = math.ceil(100 + (currentlevel * ((Config.LevelingDifficulty + 100) * 0.01)))
            level = level + 1

            TriggerServerEvent('core_skills:addSkillsInfo', level, nextlevel, Config.SkillPointsPerLevel)

            SendNUIMessage({

                type = "shownotification",
                NotificationTimer = Config.NotificationTimeInSeconds * 1000,
                lvl = level,
                addedpoints = Config.SkillPointsPerLevel,
                experience = earned
            })
        end
    end)
end)

RegisterNUICallback('buySkill', function(data)

    local Skill = data["Skill"]
    local Purchase = data["Purchase"]
    local Player = QBCore.Functions.GetPlayerData()
    QBCore.Functions.TriggerCallback("core_skills:getSkillsinfo", function(data)
        SkillPoints = data["skillpoints"]
        if SkillPoints >= tonumber(Purchase) then
            for k, v in pairs(Config.Skills) do
                if Skill == k then
                    for e, q in pairs(v.SkillAbilities) do
                        local ped = PlayerPedId()
                        local pedId = PlayerId()

                        if e == "AddHealth" then

                            AddHP = q
                            HaveAddHealth = true
                            TriggerServerEvent('core_skills:saveAbilities', e, q)

                        end
                        if e == "AddArmor" then

                            AddArmor = q
                            HaveAddArmor = true
                            TriggerServerEvent('core_skills:saveAbilities', e, q)

                        end
                        if e == "AddHealthRegen" then
                            if HaveHealthRegen == true then
                                QBCore.Functions.TriggerCallback("core_skills:getAbilities", function(data)
                                    for k, v in pairs(data) do
                                        if v.skill_name == "AddHealthRegen" then

                                            if q.StartRegeneration == nil then
                                                StartHPRegeneration = v.value1
                                            else
                                                StartHPRegeneration = q.StartRegeneration
                                            end
                                            if q.StopRegeneration == nil then
                                                StopHPRegeneration = v.value2
                                            else
                                                StopHPRegeneration = q.StopRegeneration
                                            end
                                            if q.SpeedOfRegenerationInSeconds == nil then
                                                HealthRegenTime = v.value3
                                            else
                                                HealthRegenTime = q.SpeedOfRegenerationInSeconds * 1000
                                            end

                                            TriggerServerEvent('core_skills:saveAbilities', e, StartHPRegeneration,
                                                StopHPRegeneration, HealthRegenTime)
                                        end
                                    end
                                end)
                            else
                                StartHPRegeneration = q.StartRegeneration
                                StopHPRegeneration = q.StopRegeneration
                                HealthRegenTime = q.SpeedOfRegenerationInSeconds * 1000

                                HaveHealthRegen = true
                                TriggerServerEvent('core_skills:saveAbilities', e, StartHPRegeneration,
                                    StopHPRegeneration, HealthRegenTime)
                            end
                        end
                        if e == "AddArmorRegen" then

                            if HaveArmorRegen == true then
                                QBCore.Functions.TriggerCallback("core_skills:getAbilities", function(data)
                                    for k, v in pairs(data) do
                                        if v.skill_name == "AddArmorRegen" then

                                            if q.StartRegeneration == nil then
                                                StartArmorRegeneration = v.value1
                                            else
                                                StartArmorRegeneration = q.StartRegeneration
                                            end
                                            if q.StopRegeneration == nil then
                                                StopArmorRegeneration = v.value2
                                            else
                                                StopArmorRegeneration = q.StopRegeneration
                                            end
                                            if q.SpeedOfRegenerationInSeconds == nil then
                                                ArmorRegenTime = v.value3
                                            else
                                                ArmorRegenTime = q.SpeedOfRegenerationInSeconds * 1000
                                            end

                                            TriggerServerEvent('core_skills:saveAbilities', e, StartArmorRegeneration,
                                                StopArmorRegeneration, ArmorRegenTime)
                                        end
                                    end
                                end)
                            else
                                StartArmorRegeneration = q.StartRegeneration
                                StopArmorRegeneration = q.StopRegeneration
                                ArmorRegenTime = q.SpeedOfRegenerationInSeconds * 1000
                                HaveArmorRegen = true
                                TriggerServerEvent('core_skills:saveAbilities', e, StartArmorRegeneration,
                                    StopArmorRegeneration, ArmorRegenTime)
                            end

                        end
                        if e == "AddSpeed" then

                            AddRunningSpeed(q)
                            HaveAddSpeed = true
                            TriggerServerEvent('core_skills:saveAbilities', e, q)

                        end
                        if e == "AddSwimmingSpeed" then

                            AddSwimmingSpeed(q)
                            HaveAddSwimSpeed = true
                            TriggerServerEvent('core_skills:saveAbilities', e, q)

                        end
                        if e == "AddUnderWaterTime" then

                            AddUnderWater(q)
                            HaveAddUnderWaterTime = true
                            TriggerServerEvent('core_skills:saveAbilities', e, q)

                        end
                        if e == "AddDrivingSpeed" then

                            AddCarSpeed = q
                            HaveAddDrivingSpeed = true
                            TriggerServerEvent('core_skills:saveAbilities', e, q)

                        end
                        if e == "AddBoatSpeed" then

                            AddBoatSpeed = q
                            HaveAddBoatSpeed = true
                            TriggerServerEvent('core_skills:saveAbilities', e, q)

                        end
                        if e == "AddShieldWall" then

                            if HaveShieldWall == true then
                                QBCore.Functions.TriggerCallback("core_skills:getAbilities", function(data)
                                    for k, v in pairs(data) do
                                        if v.skill_name == "AddShieldWall" then

                                            if q.WallStandingTimeInSeconds == nil then
                                                WallStandingTime = v.value1
                                            else
                                                WallStandingTime = q.WallStandingTimeInSeconds
                                            end
                                            if q.WallRechargeTimeInSeconds == nil then
                                                WallRechargeTime = v.value2
                                            else
                                                WallRechargeTime = q.WallRechargeTimeInSeconds
                                            end

                                            TriggerServerEvent('core_skills:saveAbilities', e, WallStandingTime,
                                                WallRechargeTime)
                                        end
                                    end
                                end)
                            else
                                WallStandingTime = q.WallStandingTimeInSeconds
                                WallRechargeTime = q.WallRechargeTimeInSeconds
                                HaveShieldWall = true
                                TriggerServerEvent('core_skills:saveAbilities', e, WallStandingTime, WallRechargeTime)
                            end

                        end
                        if e == "AddStaminaSprint" then

                            HaveAddStaminaSprintTime = true
                            AddStamina = q
                            TriggerServerEvent('core_skills:saveAbilities', e, q)

                        end
                        if e == "AddStaminaRecovery" then

                            HaveAddStaminaRecoveryTime = true
                            AddStaminaRecovery = q
                            TriggerServerEvent('core_skills:saveAbilities', e, q)

                        end
                    end
                end
            end
            QBCore.Functions.Notify(Config.Text['enough'])
            TriggerServerEvent('core_skills:removepoints', Purchase)
            TriggerServerEvent('core_skills:saveSkills', Skill)

        else
            QBCore.Functions.Notify(Config.Text['notenough'])
        end
    end)
end)

-------- ADD HP START
RegisterCommand('addhp', function()
    if StartAddHPTimer == false then
        if HaveAddHealth == true then
            local ped = PlayerPedId()
            local maxhp = GetEntityMaxHealth(ped)
            local nowhp = GetEntityHealth(ped)
            if maxhp ~= nowhp then
                SetEntityHealth(ped, nowhp + AddHP)
                StartAddHPTimer = true
            else
                QBCore.Functions.Notify(Config.Text['fullhealth'])
            end
        else
            QBCore.Functions.Notify(Config.Text['notallowed'])
        end
    else
        QBCore.Functions.Notify(Config.Text['wait5minutes'])
    end
end)
local AddHPTimer = 0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if StartAddHPTimer == true and playerLoaded then

            Citizen.Wait(1000)

            AddHPTimer = AddHPTimer + 1
            if AddHPTimer == 300 then
                StartAddHPTimer = false
                AddHPTimer = 0
                QBCore.Functions.Notify(Config.Text['canuseaddhp'])
            end
        end
    end
end)
-- END

-------- ADD ARMOR START
RegisterCommand('addarmor', function()
    if StartAddArmorTimer == false then
        if HaveAddArmor == true then
            local ped = PlayerPedId()
            local nowarmor = GetPedArmour(ped)
            if nowarmor < 100 then
                SetPedArmour(ped, nowarmor + AddArmor)
                StartAddArmorTimer = true
            else
                QBCore.Functions.Notify(Config.Text['fullarmor'])
            end
        else
            QBCore.Functions.Notify(Config.Text['notallowed'])
        end
    else
        QBCore.Functions.Notify(Config.Text['wait5minutes'])
    end
end)
local AddArmorTimer = 0
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if StartAddArmorTimer == true and playerLoaded then

            Citizen.Wait(1000)

            AddArmorTimer = AddArmorTimer + 1
            if AddArmorTimer == 300 then
                StartAddArmorTimer = false
                AddArmorTimer = 0
                QBCore.Functions.Notify(Config.Text['canuseaddarmor'])
            end
        end
    end
end)
-- END

--- HEALTH REGENERATION
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if HaveHealthRegen == true and playerLoaded then
            local ped = PlayerPedId()
            local nowhp = GetEntityHealth(ped)
            if nowhp < StartHPRegeneration + 100 then
                StartHealthRegenTimer = true
            end
            if StartHealthRegenTimer == true then

                Citizen.Wait(HealthRegenTime)
                nowhp = GetEntityHealth(ped)
                if nowhp <= GetEntityMaxHealth(ped) then
                    SetEntityHealth(ped, nowhp + 1)
                end

                if nowhp >= StopHPRegeneration + 100 then
                    StartHealthRegenTimer = false
                end
            end
        else
            Citizen.Wait(1400)
        end
    end
end)
-- END

--- ARMOR REGENERATION
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if HaveArmorRegen == true and playerLoaded then
            local ped = PlayerPedId()
            local nowarmor = GetPedArmour(ped)
            if nowarmor < StartArmorRegeneration then
                StartArmorRegenTimer = true
            end
            if StartArmorRegenTimer == true then

                Citizen.Wait(ArmorRegenTime)
                nowarmor = GetPedArmour(ped)
                if nowarmor < 100 then
                    SetPedArmour(ped, nowarmor + 1)
                end

                if nowarmor >= StopArmorRegeneration then
                    StartArmorRegenTimer = false
                end
            end
        else
            Citizen.Wait(1300)
        end
    end
end)
-- END

--- CAR DRIVING SPEED
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        if HaveAddDrivingSpeed == true and playerLoaded then
            local ped = PlayerPedId()
            if GetVehiclePedIsIn(ped, false) ~= 0 then
                if IsThisModelACar(GetEntityModel(GetVehiclePedIsIn(ped, false))) == 1 then
                    if GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), -1) == ped then
                        if CarSpeedModified ~= true then
                            AddCarSpeed = math.floor(AddCarSpeed) + .0
                            ModifyVehicleTopSpeed(GetVehiclePedIsIn(ped, false), AddCarSpeed)
                            CarSpeedModified = true
                        end
                    end
                end
            elseif GetVehiclePedIsIn(ped, false) == 0 then
                if CarSpeedModified == true then
                    ModifyVehicleTopSpeed(GetVehiclePedIsIn(ped, true), 0.0)
                    CarSpeedModified = false
                end
            end
        else
            Citizen.Wait(1200)
        end
    end
end)
--- END

--- BOAT SPEED
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        if HaveAddBoatSpeed == true and playerLoaded then
            local ped = PlayerPedId()
            if GetVehiclePedIsIn(ped, false) ~= 0 then
                if IsThisModelABoat(GetEntityModel(GetVehiclePedIsIn(ped, false))) == 1 then
                    if GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), -1) == ped then
                        if BoatSpeedModified ~= true then
                            AddBoatSpeed = math.floor(AddBoatSpeed) + .0
                            ModifyVehicleTopSpeed(GetVehiclePedIsIn(ped, false), AddBoatSpeed)
                            BoatSpeedModified = true
                        end
                    end
                end
            elseif GetVehiclePedIsIn(ped, false) == 0 then
                if BoatSpeedModified == true then
                    ModifyVehicleTopSpeed(GetVehiclePedIsIn(ped, true), 0.0)
                    BoatSpeedModified = false
                end
            end
        else
            Citizen.Wait(1100)
        end
    end
end)
--- END

function AddRunningSpeed(speed)
    local pedId = PlayerId()

    SetRunSprintMultiplierForPlayer(pedId, tonumber(speed))
end

function AddSwimmingSpeed(speed)
    local pedId = PlayerId()

    SetSwimMultiplierForPlayer(pedId, tonumber(speed))
end

function AddUnderWater(underwater)
    local ped = PlayerPedId()
    SetPedMaxTimeUnderwater(ped, (underwater + .0))
end

--- Place defense wall
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if HaveShieldWall == true and playerLoaded then
            if wallstanding == false then
                if wallwasplaced == false then

                    if IsControlPressed(0, 21) and IsControlJustReleased(0, 137) then
                        local ped = PlayerPedId()
                        if GetVehiclePedIsIn(ped, false) == 0 then
                            if not IsPedSwimming(ped) then

                                PlayAnim(ped, "timetable@gardener@lawnmow@", "base")
                                Wait(100)
                                while IsEntityPlayingAnim(ped, "timetable@gardener@lawnmow@", "base", 3) do
                                    Wait(1000)
                                    StopAnim(ped)
                                end

                                local pedcoords = GetEntityCoords(ped, false)
                                local pedheading = GetEntityHeading(ped)

                                RequestModel("prop_tyre_wall_01b")
                                while not HasModelLoaded("prop_tyre_wall_01b") or
                                    not HasCollisionForModelLoaded("prop_tyre_wall_01b") do
                                    Wait(1)
                                end

                                if pedheading >= 260 then

                                    wall = CreateObject(GetHashKey("prop_tyre_wall_01b"), pedcoords[1] + 1.5,
                                        pedcoords[2] + 1.5, pedcoords[3], true, false, true) -- object example

                                elseif pedheading < 10 then

                                    wall = CreateObject(GetHashKey("prop_tyre_wall_01b"), pedcoords[1] + 1.5,
                                        pedcoords[2] + 1.5, pedcoords[3], true, false, true) -- object example

                                elseif pedheading >= 160 and pedheading < 260 then

                                    wall = CreateObject(GetHashKey("prop_tyre_wall_01b"), pedcoords[1] + 1.5,
                                        pedcoords[2] - 1.5, pedcoords[3], true, false, true) -- object example

                                elseif pedheading >= 100 and pedheading < 160 then

                                    wall = CreateObject(GetHashKey("prop_tyre_wall_01b"), pedcoords[1] - 1.5,
                                        pedcoords[2], pedcoords[3], true, false, true) -- object example

                                elseif pedheading > 10 and pedheading <= 100 then

                                    wall = CreateObject(GetHashKey("prop_tyre_wall_01b"), pedcoords[1] - 1.5,
                                        pedcoords[2], pedcoords[3], true, false, true) -- object example

                                end
                                SetEntityHeading(wall, pedheading)
                                PlaceObjectOnGroundProperly(wall)
                                SetEntityAsMissionEntity(wall)
                                wallwasplaced = true
                                wallstanding = true
                            end
                        end
                    end
                else
                    QBCore.Functions.Notify(Config.Text['wallrecharging'])
                    Citizen.Wait(WallRechargeTime * 1000)
                    wallwasplaced = false
                    QBCore.Functions.Notify(Config.Text['wallactive'])
                end
            else
                Citizen.Wait(WallStandingTime * 1000)
                DeleteEntity(wall)
                SetEntityAsNoLongerNeeded(wall)
                wallstanding = false
            end
        else
            Citizen.Wait(1000)
        end
    end
end)
--- END

--- MORE STAMINA
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if HaveAddStaminaSprintTime == true and playerLoaded then
            local ped = PlayerPedId()
            local pedId = PlayerId()
            local Stamina = math.floor(100 - GetPlayerSprintStaminaRemaining(pedId))

            if IsPedSprinting(ped) then

                if Stamina < RestoreStaminaPoint then

                    RestoreStaminaPoint = RestoreStaminaPoint - 10.0
                    SetPlayerStamina(pedId, Stamina + (AddStamina + .0))

                end
            end
        else
            Citizen.Wait(1400)
        end
    end
end)
--- END

--- STAMINA RECOVERY
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(700)

        if HaveAddStaminaRecoveryTime == true and playerLoaded then
            local ped = PlayerPedId()
            local pedId = PlayerId()
            local Stamina = math.floor(100 - GetPlayerSprintStaminaRemaining(pedId))

            if not IsPedSprinting(ped) then

                if Stamina > RestoreStaminaPoint then

                    RestoreStaminaPoint = RestoreStaminaPoint + 10.0
                    SetPlayerStamina(pedId, Stamina + (AddStaminaRecovery + .0))

                end
            end
        else
            Citizen.Wait(600)
        end
    end
end)
--- END

RegisterNUICallback('StartingSkill', function(data)

    local StartingSkillPoints = data["StartingSkillPoints"]
    local StartingSkillId = data["StartingSkillId"]
    TriggerServerEvent('core_skills:addpoints', StartingSkillPoints)
    TriggerServerEvent('core_skills:saveSkills', StartingSkillId)

end)

exports('AddExperienceClient', function(PlayerId, earned)
    TriggerServerEvent('core_skills:addExperianceEvent', PlayerId, earned)
end)

-- Citizen.CreateThread(function() ---- might be added later
--    while true do
--        Citizen.Wait(1)

-- if HaveAddTaserBullets == true then
--            local ped = PlayerPedId()
--            local pedId = PlayerId()
--            if IsPlayerFreeAiming(pedId) then
--                if IsPedShooting(ped) then
--                    local isped, bulletcoords = GetPedLastWeaponImpactCoord(ped)
--                    AddExplosion(bulletcoords[1], bulletcoords[2], bulletcoords[3], 79, 5.0, true, false, true)
-- if GetEntityPlayerIsFreeAimingAt(pedId) == 1 then
--                        print(bulletcoords)

--                        print("yes sir")
-- end
--                end
--            end
-- end  
--    end
-- end)

-- Citizen.CreateThread(function() ----- ????????????? idk 
--  while true do
--    Citizen.Wait(1)

--  if IsControlJustReleased(0, 22) then
--    local ped = PlayerPedId()
--  if IsEntityInAir(ped) == false then

--    SetEntityVelocity(ped, 0.0, 0.0, 7.5)
--  Citizen.Wait(1000)

-- end
-- end
-- end
-- end)

-- RegisterCommand("getdmg", function()
--    local ped = PlayerPedId()
--    local pedId = PlayerId()
--    local meleedmg = GetPlayerMeleeWeaponDamageModifier(pedId)
--    local gundmg = GetPlayerWeaponDamageModifier(pedId)
--    local vehicledmg = GetPlayerVehicleDamageModifier(pedId)
--    print("trankymo dmg:", meleedmg, "ginklu dmg:", gundmg, "kazkoks masinos dmg:", vehicledmg) 
-- end)

-- RegisterCommand("setdmg", function() 
--   local pedId = PlayerId()
--    SetPlayerMeleeWeaponDamageModifier(pedId, 0.3)
--    SetPlayerWeaponDamageModifier(pedId, 0.2)
-- end)

function closeMenuFull()
    display = false
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(500)
    SendNUIMessage({
        type = "hide"
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

