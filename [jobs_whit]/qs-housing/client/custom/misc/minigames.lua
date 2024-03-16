local RamsDone = 0

local function DoRamAnimation(bool)
    local ped = PlayerPedId()
    local dict = 'missheistfbi3b_ig7'
    local anim = 'lift_fibagent_loop'

    if bool then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(1)
        end
        TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, 1, -1, false, false, false)
    else
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(1)
        end
        TaskPlayAnim(ped, dict, 'exit', 8.0, 8.0, -1, 1, -1, false, false, false)
    end
end

local function LockpickDoorAnim(time)
    time = time / 1000
    loadAnimDict('veh@break_in@0h@p_m_one@')
    TaskPlayAnim(PlayerPedId(), 'veh@break_in@0h@p_m_one@', 'low_force_entry_ds', 3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), 'veh@break_in@0h@p_m_one@', 'low_force_entry_ds', 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Wait(2000)
            time = time - 2
            TriggerServerEvent('qs-storerobbery:server:takeMoney', currentRegister, false)
            if time <= 0 then
                openingDoor = false
                StopAnimTask(PlayerPedId(), 'veh@break_in@0h@p_m_one@', 'low_force_entry_ds', 1.0)
            end
        end
    end)
end

local function lockpick(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = 'ui',
        toggle = bool,
    })
    SetCursorLocation(0.5, 0.2)
    uiOpen = bool
end

local function lockpickFinish(success)
    if success then
        Robbing = true
        openingDoor = false
        SendTextMessage(Lang('HOUSING_NOTIFICATION_OPEN_THE_DOOR'), 'success')
        if Config.Houses[closesthouse].mlo == false then
            TriggerEvent('housing:client:EnterHouse')
        end
    else
        if math.random(1, 100) < Config.LockpickBrokenChance then
            TriggerServerEvent('housing:server:removeLockpick', Config.RobberyItem, 1)
            SendTextMessage(Lang('HOUSING_NOTIFICATION_LOCKPICK_BROKEN'))
        end
        openingDoor = false
        SendTextMessage(Lang('HOUSING_NOTIFICATION_TRY_AGAIN_LOCKPICK'), 'error')
    end
end

RegisterNetEvent('housing:client:lockpicking')
AddEventHandler('housing:client:lockpicking', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    if closesthouse ~= nil then
        TriggerServerCallback('housing:server:policeOnDuty', function(police)
            PoliceCount = police
            if PoliceCount >= Config.RequiredCops then
                local dist = GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true)
                if Config.Houses[closesthouse].IsRaming == nil then
                    Config.Houses[closesthouse].IsRaming = false
                end

                if dist < 1 then
                    if Config.Houses[closesthouse].locked then
                        if not Config.Houses[closesthouse].IsRaming then
                            local lockpickTime = 30000
                            LockpickDoorAnim(lockpickTime)
                            TriggerEvent('lockpick:client:openLockpick', lockpickFinish) -- Minigame
                            if math.random(1, 100) < 50 then                             -- 50% change to call cops.
                                TriggerServerEvent('housing:server:notifyCops', pos)
                            end
                        else
                            SendTextMessage(Lang('HOUSING_NOTIFICATION_INVASION_ALERT'), 'inform')
                        end
                    else
                        SendTextMessage(Lang('HOUSING_NOTIFICATION_HOUSE_IS_OPEN'), 'inform')
                    end
                else
                    SendTextMessage(Lang('HOUSING_NOTIFICATION_NO_HOUSES_NEARBY'), 'error')
                end
            else
                SendTextMessage(Lang('HOUSING_NOTIFICATION_NO_POLICES'), 'error')
            end
        end)
    else
        SendTextMessage(Lang('HOUSING_NOTIFICATION_NO_HOUSES_NEARBY'), 'error')
    end
end)

RegisterNetEvent('housing:client:raidInvasion')
AddEventHandler('housing:client:raidInvasion', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local Skillbar = exports['skillbar']:GetSkillbarObject()

    if closesthouse ~= nil then
        local dist = GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true)
        if Config.Houses[closesthouse].IsRaming == nil then
            Config.Houses[closesthouse].IsRaming = false
        end

        if dist < 1 then
            if Config.Houses[closesthouse].locked then
                if not Config.Houses[closesthouse].IsRaming then
                    DoRamAnimation(true)
                    Skillbar.Start({
                        duration = math.random(5000, 10000),
                        pos = math.random(10, 30),
                        width = math.random(10, 20),
                    }, function()
                        if RamsDone + 1 >= Config.RamsNeeded then
                            Robbing = true
                            if Config.Houses[closesthouse].mlo == false then
                                TriggerEvent('housing:client:EnterHouse')
                            end
                            TriggerServerEvent('housing:server:raidInvasionOpen', closesthouse)
                            SendTextMessage(Lang('HOUSING_NOTIFICATION_OPEN_THE_DOOR'), 'success')
                            DoRamAnimation(false)
                        else
                            DoRamAnimation(true)
                            Skillbar.Repeat({
                                duration = math.random(500, 1000),
                                pos = math.random(10, 30),
                                width = math.random(5, 12),
                            })
                            RamsDone = RamsDone + 1
                        end
                    end, function()
                        RamsDone = 0
                        SendTextMessage(Lang('HOUSING_NOTIFICATION_TRY_AGAIN'), 'error')
                        DoRamAnimation(false)
                    end)
                else
                    SendTextMessage(Lang('HOUSING_NOTIFICATION_INVASION_ALERT'), 'inform')
                end
            else
                SendTextMessage(Lang('HOUSING_NOTIFICATION_HOUSE_IS_OPEN'), 'inform')
            end
        else
            SendTextMessage(Lang('HOUSING_NOTIFICATION_NO_HOUSES_NEARBY'), 'error')
        end
    else
        SendTextMessage(Lang('HOUSING_NOTIFICATION_NO_HOUSES_NEARBY'), 'error')
    end
end)
