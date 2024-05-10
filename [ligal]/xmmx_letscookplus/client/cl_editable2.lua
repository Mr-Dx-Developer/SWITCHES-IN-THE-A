-- Here you can set the players inventory state to prevent Item duping! (StateBag Useage)
-- If this causes issues with not being able to access inventory, comment out the line for your Framework.
function SetInvBusy(bool)
    if bool then
        if Config.Core == "qb" then 

            LocalPlayer.state:set("inv_busy", true, true) -- ex: if your core is "qb" comment out this line if you can't access inventory.

        elseif Config.Core == "esx" then 

            LocalPlayer.state:set('invBusy', true, false)

        end

    elseif not bool then
        if Config.Core == "qb" then 

            LocalPlayer.state:set("inv_busy", false, true)

        elseif Config.Core == "esx" then

            LocalPlayer.state:set('invBusy', false, false)

        end
    end
end

-- Here is where the item is returned to the player when the prop is picked up.
function removeItemBasedOnModel(model) 
    if     model == `prop_bbq_1`                    then itemToggle(true, "lc_grill", 1)
    elseif model == `prop_micro_01`                 then itemToggle(true, "lc_microwave", 1)
    elseif model == `prop_kitch_juicer`             then itemToggle(true, "lc_juicer", 1)
    elseif model == `prop_coffee_mac_02`            then itemToggle(true, "lc_coffee", 1)
    elseif model == `prop_griddle_01`               then itemToggle(true, "lc_griddle", 1)
    elseif model == `prop_foodprocess_01`           then itemToggle(true, "lc_processor", 1)
    elseif model == `prop_toaster_02`               then itemToggle(true, "lc_toaster", 1)
    elseif model == `prop_copper_pan`               then itemToggle(true, "lc_fryer", 1)
    elseif model == `prop_ff_counter_03`            then itemToggle(true, "lc_table", 1)
    elseif model == `apa_mp_h_stn_chairarm_26`      then itemToggle(true, "lc_chair", 1)
    elseif model == `prop_gazebo_03`                then itemToggle(true, "lc_gazebo", 1)
    elseif model == `prop_still`                    then itemToggle(true, "lc_still", 1)
    elseif model == `prop_hobo_stove_01`            then itemToggle(true, "lc_hobo", 1)
    elseif model == `prop_printer_02`               then itemToggle(true, "lc_printer", 1)
    elseif model == `sf_prop_sf_speaker_stand_01a`  then itemToggle(true, "lc_partybox", 1)
    elseif model == `prop_cooker_03`                then itemToggle(true, "lc_stove", 1)
    -- add additional models and items here. Follow above format.
    end
end

function ProgressConsume(label, time, success, failed, icon) -- Consumables
    SetInvBusy(true)
    if Config.Utils == "qb" then
        QBCore.Functions.Progressbar("lets_cooking", label, time, false, true, { 
            disableMovement = true, 
            disableCarMovement = false, 
            disableMouse = false, 
            disableCombat = false, 
        }, {}, {}, {}, function()
            ClearPedTasks(PlayerPedId())
            success()
        end, function()            
            ClearPedTasks(PlayerPedId())
            if Config.Notify == "qb" then
                QBCore.Functions.Notify(Locales[Config.Language].error["cancelled"], "error")
            elseif Config.Notify == "ox" then
                lib.notify({ title = '', description = Locales[Config.Language].error["cancelled"], type = "error", duration = 5000, style = { backgroundColor = '#000000a2', color = '#d6d6d6' }, icon = "ban", position = Config.Position, })
            end
            failed()
        end, icon)    
    elseif Config.Utils == "ox" then
        lib.progressBar({
            duration = time,
            label = label,
            useWhileDead = false,
            canCancel = false,
            disable = {car = true},
            anim = {},
            prop = {},
        })
        success()
    end
    SetInvBusy(false)
end

function ProgressCraft(label, time, dict, anim, flag, success, failed, icon) -- crafting
    SetInvBusy(true)
    if Config.Utils == "qb" then
        QBCore.Functions.Progressbar("lets_cooking", label, time, false, false, { 
            disableMovement = true, 
            disableCarMovement = false, 
            disableMouse = false, 
            disableCombat = false, 
        }, {
            animDict = dict, 
            anim = anim, 
            flags = flag, 
        }, {}, {}, function()
            ClearPedTasks(PlayerPedId())
            success()
        end, function()            
            ClearPedTasks(PlayerPedId())
            if Config.Notify == "qb" then
                QBCore.Functions.Notify(Locales[Config.Language].error["cancelled"], "error")
            elseif Config.Notify == "ox" then
                lib.notify({ title = '', description = Locales[Config.Language].error["cancelled"], type = "error", duration = 5000, style = { backgroundColor = '#000000a2', color = '#d6d6d6' }, icon = "ban", position = Config.Position, })
            end
            failed()
        end, icon)    
    elseif Config.Utils == "ox" then
        lib.progressBar({
            duration = time,
            label = label,
            useWhileDead = false,
            canCancel = false,
            disable = {car = true},
            anim = {
                dict = dict,
                clip = anim, 
                flag = flag,
                lockX = false,
                lockY = false,
                lockZ = false,
            },
            prop = {},
        })
        success()
    end
    SetInvBusy(false)
end

function CookMiniGameFunc()
    Wait(1500) -- added a delay for minigame to start
    local success = false

    exports['ps-ui']:Circle(function(result)
        success = result
    end, math.random(10, 15), math.random(15, 20)) -- 1st number is Circles, 2nd number is Time in seconds
    return success 
end

function MoonshineMGFunc()
    Wait(1500) -- added a delay for minigame to start
    local success = false

    exports['ps-ui']:Circle(function(result)
        success = result
    end, math.random(10, 15), math.random(15, 20))
    return success 
end

function CraftingMGFunc()
    Wait(1500) -- added a delay for minigame to start
    local success = false

    exports['ps-ui']:Circle(function(result)
        success = result
    end, math.random(10, 15), math.random(15, 20))
    return success  
end

-- If using the Dispatch system when making moonshine
RegisterNetEvent("xmmx_letscookplus:Dispatch", function()
    --- Add your Own police alerts here or uncomment below if installed ps-dispatch, check README.md.
    exports["ps-dispatch"]:CustomAlert({
        coords = GetEntityCoords(PlayerPedId()),
        message = "Illegal Moonshine Distillery",
        dispatchCode = "10-66",
        description = "Illegal Moonshining",
        radius = 50.0,
        sprite = 161,
        color = 48,
        scale = 1.5,
        length = 2,
    })
end)

-- Illegal Weapon Manufacturing Police Alerts
RegisterNetEvent("xmmx_letscookplus:Dispatch2", function()
    --- Add your Own police alerts here or uncomment below if installed ps-dispatch, check README.md.
    exports["ps-dispatch"]:CustomAlert({
        coords = GetEntityCoords(PlayerPedId()),
        message = "Illegal Weapons Manufacturing",
        dispatchCode = "10-66",
        description = "Illegal Manufacturing",
        radius = 50.0,
        sprite = 161,
        color = 48,
        scale = 1.5,
        length = 2,
    })
end)

