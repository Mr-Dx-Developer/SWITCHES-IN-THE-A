-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
Jobs, BossData, UserJobs = {}, {}, {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
    local loadData = lib.callback.await('wasabi_multijob:loadData', 3000)
    while not loadData do Wait(100) end
    Jobs = loadData.jobs
    if loadData?.userJobs then
        UserJobs = loadData.userJobs
    end
	CheckJob(ESX.PlayerData.job, false)
    ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
    CheckJob(job, true)
end)

RegisterNetEvent('wasabi_multijob:resourceRestart')
AddEventHandler('wasabi_multijob:resourceRestart', function()
	ESX.PlayerData = ESX.GetPlayerData()
    local loadData = lib.callback.await('wasabi_multijob:loadData', 3000)
    while not loadData do Wait(100) end
    Jobs = loadData.jobs
    if loadData?.userJobs then
        UserJobs = loadData.userJobs
    end
	CheckJob(ESX.PlayerData.job, false)
end)

if Config.openJobMenu.enabled then
    CreateThread(function()
        RegisterCommand(Config.openJobMenu.command, OpenJobMenu, false)
        if Config.openJobMenu.key then
            RegisterKeyMapping(Config.openJobMenu.command, Strings.keymap_text, 'keyboard', Config.openJobMenu.key)
        end
    end)
end

if Config.bossMenus.enabled then
    CreateThread(function()
        local textUI = {}
        while true do
            local sleep = 1500
            for i=1, #Config.bossMenus.locations do
                local coords = GetEntityCoords(cache.ped)
                local boss = Config.bossMenus.locations[i].coords
                local dist = #(coords - boss)
                if dist <= Config.bossMenus.distance and ESX.PlayerData.job.name == Config.bossMenus.locations[i].job and ESX.PlayerData.job.grade_name == 'boss' then
                    if not textUI[i] then
                        lib.showTextUI(Config.bossMenus.label)
                        textUI[i] = true
                    end
                    sleep = 0
                    if IsControlJustReleased(0, Config.bossMenus.key) then
                        OpenBossMenu(Config.bossMenus.locations[i].job, false, false)
                    end
                elseif dist > Config.bossMenus.distance and textUI[i] then
                    lib.hideTextUI()
                    textUI[i] = nil
                end
            end
            Wait(sleep)
        end
    end)
end

AddEventHandler('wasabi_multijob:fireEmployee', function(data)
    local confirmed = lib.alertDialog({
        header = Strings.delete_confirm,
        content = Strings.fire_confirm_desc,
        centered = true,
        cancel = true
    })
    if confirmed == 'confirm' then
        TriggerServerEvent('wasabi_multijob:fireEmployee', data)
        TriggerEvent('wasabi_multijob:notify', Strings.success, Strings.fired_desc, 'success')
        ManageEmployees(data.job, data.user.identifier)
    else
        TriggerEvent('wasabi_multijob:notify', Strings.cancelled, Strings.cancelled_desc, 'error')
        ManageEmployees(data.job)
    end
end)

AddEventHandler('wasabi_multijob:mainMenu', function(society)
	OpenBossMenu(society, false, false)
end)

AddEventHandler('wasabi_multijob:closeMenu', function()
	lib.hideContext(false)
end)

AddEventHandler('wasabi_multijob:manageFunds', function(society)
    ManageFunds(society)
end)

AddEventHandler('wasabi_multijob:depositFunds', function(job)
	DepositFunds(job)
end)

AddEventHandler('wasabi_multijob:withdrawalFunds', function(job)
	WithdrawalFunds(job)
end)

AddEventHandler('wasabi_multijob:manageEmployees', function(data)
    ManageEmployees(data)
end)


AddEventHandler('wasabi_multijob:editEmployee', function(data)
    EditEmployee(data)
end)

AddEventHandler('wasabi_multijob:editRank', function(data)
    EditRank(data)
end)

AddEventHandler('wasabi_multijob:giveBonus', function(data)
    GiveBonus(data)
end)

AddEventHandler('wasabi_multijob:setRank', function(data)
    SetRank(data)
end)

AddEventHandler('wasabi_multijob:hireEmployee', function(data)
    HireEmployee(data)
end)

AddEventHandler('wasabi_multijob:selectJobMenu', function(data)
    SelectJobMenu(data)
end)

AddEventHandler('wasabi_multijob:deleteJob', function(data)
    local confirmed = lib.alertDialog({
		header = Strings.delete_confirm,
		content = Strings.delete_confirm_desc,
		centered = true,
		cancel = true
	})
	if confirmed == 'confirm' then
		TriggerServerEvent('wasabi_multijob:deleteJob', data)
        TriggerEvent('wasabi_multijob:notify', Strings.deleted, Strings.deleted_desc, 'success')
	else
        TriggerEvent('wasabi_multijob:notify', Strings.cancelled, Strings.cancelled_desc, 'error')
	end
end)

AddEventHandler('wasabi_multijob:clockIn', function(data)
	if data.job == ESX.PlayerData.job.name then
        TriggerEvent('wasabi_multijob:notify', Strings.alr_clocked, Strings.alr_clocked_desc, 'error')
	else
		TriggerServerEvent('wasabi_multijob:ClockIn', data)
		OpenJobMenu()
	end
end)

AddEventHandler('wasabi_multijob:clockOut', function()
    TriggerServerEvent('wasabi_multijob:clockOut')
    TriggerEvent('wasabi_multijob:notify', Strings.clocked_out, Strings.clocked_out_desc, 'success')
end)
