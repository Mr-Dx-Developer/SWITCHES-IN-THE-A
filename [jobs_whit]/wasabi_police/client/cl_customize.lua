-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end
local ESX = nil
if wsb.framework == 'esx' then ESX = exports['es_extended']:getSharedObject() end
----------------------------------------------------------------
-- Customize text ui, notifications, target and more with the --
-- "wasabi_bridge" dependency in the "customize" directory    --
-- "wasabi_bridge/customize/cl_customize.lua"                 --
----------------------------------------------------------------

--Send to jail
RegisterNetEvent('wasabi_police:sendToJail', function()
    if not wsb.hasGroup(Config.policeJobs) then return end
    local target, time

    if Config.Jail.input then
        local coords = GetEntityCoords(cache.ped)
        local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
        if not player then
            TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        else
            local input = lib.inputDialog(Strings.minutes_dialog, { Strings.minutes_dialog_field })
            if not input then return end
            local input1 = tonumber(input[1])
            if type(input1) ~= 'number' then return end
            local quantity = math.floor(input1)
            if quantity < 1 then
                TriggerEvent('wasabi_bridge:notify', Strings.invalid_amount, Strings.invalid_amount_desc, 'error')
            else
                target, time = GetPlayerServerId(player), quantity
            end
        end
    end
    if Config.Jail.jail == 'qb' then
        TriggerServerEvent('wasabi_police:qbPrisonJail', target, time)
    elseif Config.Jail.jail == 'rcore' then
        ExecuteCommand('jail ' .. target .. ' jailed ' .. time .. ' Sentenced')
    elseif Config.Jail.jail == 'tk_jail' then
        if wsb.framework == 'esx' then
            exports.esx_tk_jail:jail(target, time)
        elseif wsb.framework == 'qb' then
            exports.qb_tk_jail:jail(target, time)
        end
    elseif Config.Jail.jail == 'hd_jail' then
        TriggerServerEvent('HD_Jail:sendToJail', target, 'Prison', time, 'Sentenced', 'Police')
    elseif Config.Jail.jail == 'myPrison' then
        ExecuteCommand('jail')
    elseif Config.Jail.jail == 'qalle-jail' then
        TriggerServerEvent('esx-qalle-jail:jailPlayer', target, time, 'Sentenced')
    elseif Config.Jail.jail == 'plouffe' then
        exports.plouffe_jail:Set(target, time)
    elseif Config.Jail.jail == 'mx' then
        TriggerServerEvent('mx_jail:jailPlayer', target, time, target)
        TriggerServerEvent('mx_jail:setTime', target, time)
    elseif Config.Jail.jail == 'custom' then
        -- Custom logic here?
    end
end)

--Impound Vehicle
impoundSuccessful = function(vehicle)
    if not DoesEntityExist(vehicle) then return end
    SetEntityAsMissionEntity(vehicle, false, false)
    if Config.AdvancedParking then
        exports['AdvancedParking']:DeleteVehicleOnServer(vehicle, nil, nil)
    else
        DeleteVehicle(vehicle)
    end
    if not DoesEntityExist(vehicle) then
        TriggerEvent('wasabi_bridge:notify', Strings.success, Strings.car_impounded_desc, 'success')
    end
end

--Death check
deathCheck = function(serverId)
    serverId = serverId or GetPlayerServerId(PlayerId())
    local ped = GetPlayerPed(GetPlayerFromServerId(serverId)) or PlayerPedId()
    return Player(serverId).state.dead
        or IsPedFatallyInjured(ped)
        or IsEntityPlayingAnim(ped, 'dead', 'dead_a', 3)
        or IsEntityPlayingAnim(ped, 'mini@cpr@char_b@cpr_def', 'cpr_pumpchest_idle', 3)
end

--Search player
searchPlayer = function(player)
    if Config.inventory == 'ox' then
        exports.ox_inventory:openNearbyInventory()
    elseif Config.inventory == 'qs' or Config.inventory == 'qb' then
        TriggerServerEvent('inventory:server:OpenInventory', 'otherplayer', GetPlayerServerId(player))
    elseif Config.inventory == 'mf' then
        local identifier = lib.callback.await('wasabi_police:getIdentifier', 100, GetPlayerServerId(player))
        exports['mf-inventory']:openOtherInventory(identifier)
    elseif Config.inventory == 'cheeza' then
        TriggerEvent('inventory:openPlayerInventory', GetPlayerServerId(player), true)
    elseif Config.inventory == 'custom' then
        -- INSERT CUSTOM SEARCH PLAYER FOR YOUR INVENTORY
    end
end

exports('searchPlayer', searchPlayer)

DisableInventory = function(bool) -- Disable inventory when cuffed, enable when released
    if Config.Inventory ~= 'qs' then return end
    exports['qs-inventory']:setInventoryDisabled(bool)
end

--Change clothes(Cloakroom)
AddEventHandler('wasabi_police:changeClothes', function(data)
    if Config.skinScript == 'custom' then
        -- Place custom code here?
    else
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            if data == 'civ_wear' then
                if Config.skinScript == 'appearance' then
                    skin.sex = nil
                    exports['fivem-appearance']:setPlayerAppearance(skin)
                else
                    TriggerEvent('skinchanger:loadClothes', skin)
                end
            elseif skin.sex == 0 then
                TriggerEvent('skinchanger:loadClothes', skin, data.male)
            elseif skin.sex == 1 then
                TriggerEvent('skinchanger:loadClothes', skin, data.female)
            end
        end)
    end
end)

-- Billing event
AddEventHandler('wasabi_police:finePlayer', function()
    if not wsb.hasGroup(Config.policeJobs) then return end
    local hasJob, _grade = wsb.getGroup()
    local coords = GetEntityCoords(cache.ped)
    local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
    if not player then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
    else
        local jobLabel = wsb.playerData.job.label
        local targetId = GetPlayerServerId(player)
        if Config.billingSystem == 'okok' then
            TriggerEvent('okokBilling:ToggleCreateInvoice')
        else
            local input = lib.inputDialog(Strings.invoice_amount, { Strings.amount_invoice })
            if not input or not input[1] then return end
            local input1 = tonumber(input[1])
            if type(input1) ~= 'number' then return end
            local amount = math.floor(input1)
            if amount < 1 then
                TriggerEvent('wasabi_bridge:notify', Strings.invalid_entry, Strings.invalid_entry_desc, 'error')
            elseif Config.billingSystem == 'pefcl' then
                TriggerServerEvent('wasabi_police:billPlayer', targetId, wsb.playerData.job, amount)
            elseif Config.billingSystem == 'qb' then
                TriggerServerEvent('wasabi_police:qbBill', targetId, amount, wsb.playerData.job.name)
                local gender = Strings.mr
                if wsb.playerData.charinfo.gender == 1 then
                    gender = Strings.mrs
                end
                local charinfo = wsb.playerData.charinfo
                TriggerServerEvent('qb-phone:server:sendNewMail', {
                    sender = wsb.playerData.job.label,
                    subject = Strings.debt_collection,
                    message = (Strings.db_email):format(gender, charinfo.lastname, amount),
                    button = {}
                })
            elseif Config.billingSystem == 'esx' then
                TriggerServerEvent('esx_billing:sendBill', targetId, 'society_' .. hasJob, jobLabel, amount)
            else
                -- Replace this print with your billing system logic!
                print('^0[^3WARNING^0] No proper billing system selected in configuration!')
            end
        end
    end
end)

-- Job menu
openJobMenu = function()
    if not wsb.hasGroup(Config.policeJobs) then return end
    if not wsb.isOnDuty() then return end
    local _job, grade = wsb.hasGroup(Config.policeJobs)
    local jobLabel = Strings.police
    local Options = {}
    if Config.searchPlayers then
        Options[#Options + 1] = {
            title = Strings.search_player,
            description = Strings.search_player_desc,
            icon = 'magnifying-glass',
            arrow = false,
            event = 'wasabi_police:searchPlayer',
        }
    end
    Options[#Options + 1] = {
        title = Strings.check_id,
        description = Strings.check_id_desc,
        icon = 'id-card',
        arrow = true,
        event = 'wasabi_police:checkId',
    }
    if Config?.GrantWeaponLicenses?.enabled and tonumber(grade or 0) >= Config.GrantWeaponLicenses.minGrade then
        Options[#Options + 1] = {
            title = Strings.grant_license,
            description = Strings.grant_license_desc,
            icon = 'id-card',
            arrow = true,
            event = 'wasabi_police:grantLicense',
        }
    end
    if Config.Jail.enabled then
        Options[#Options + 1] = {
            title = Strings.jail_player,
            description = Strings.jail_player_desc,
            icon = 'lock',
            arrow = false,
            event = 'wasabi_police:sendToJail',
        }
    end
    Options[#Options + 1] = {
        title = Strings.handcuff_soft_player,
        description = Strings.handcuff_soft_player_desc,
        icon = 'hands-bound',
        arrow = false,
        args = { type = 'soft' },
        event = 'wasabi_police:handcuffPlayer',
    }
    Options[#Options + 1] = {
        title = Strings.handcuff_hard_player,
        description = Strings.handcuff_hard_player_desc,
        icon = 'hands-bound',
        arrow = false,
        args = { type = 'hard' },
        event = 'wasabi_police:handcuffPlayer',
    }
    Options[#Options + 1] = {
        title = Strings.escort_player,
        description = Strings.escort_player_desc,
        icon = 'hand-holding-hand',
        arrow = false,
        event = 'wasabi_police:escortPlayer',
    }
    if Config.GSR.enabled then
        Options[#Options + 1] = {
            title = Strings.gsr_test,
            description = Strings.gsr_test_desc,
            icon = 'gun',
            arrow = false,
            event = 'wasabi_police:gsrTest',
        }
    end
    Options[#Options + 1] = {
        title = Strings.put_in_vehicle,
        description = Strings.put_in_vehicle_desc,
        icon = 'arrow-right-to-bracket',
        arrow = false,
        event = 'wasabi_police:inVehiclePlayer',
    }
    Options[#Options + 1] = {
        title = Strings.take_out_vehicle,
        description = Strings.take_out_vehicle_desc,
        icon = 'arrow-right-from-bracket',
        arrow = false,
        event = 'wasabi_police:outVehiclePlayer',
    }
    Options[#Options + 1] = {
        title = Strings.vehicle_interactions,
        description = Strings.vehicle_interactions_desc,
        icon = 'car',
        arrow = true,
        event = 'wasabi_police:vehicleInteractions',
    }
    Options[#Options + 1] = {
        title = Strings.place_object,
        description = Strings.place_object_desc,
        icon = 'box',
        arrow = true,
        event = 'wasabi_police:placeObjects',
    }
    if Config.billingSystem then
        Options[#Options + 1] = {
            title = Strings.fines,
            description = Strings.fines_desc,
            icon = 'file-invoice',
            arrow = false,
            event = 'wasabi_police:finePlayer',
        }
    end
    if Config.MobileMenu.enabled then
        OpenMobileMenu('pd_job_menu', jobLabel, Options)
    else
        lib.registerContext({
            id = 'pd_job_menu',
            title = jobLabel,
            options = Options
        })
        lib.showContext('pd_job_menu')
    end
end
