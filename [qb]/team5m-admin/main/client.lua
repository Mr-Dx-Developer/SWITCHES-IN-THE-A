local currentAdminPlayers = {}
local visibleAdmins = {}
local closeAdmins = {}



local lastVehicle = nil
local targetTicket = nil
local driftSleep = 3000

local playerGodMode = false
local playerInvisible = false
local noclipActive = false
local dutyStatus = false
local godMode = false
local driftmode = false
local loaded = false


if Config.framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()
else
    QBCore = exports['qb-core']:GetCoreObject()
end

-- General
RegisterCommand(Config.command, function ()
    updateIdentifier()
    local admin = false
    if Config.framework == "esx" then
        ESX.TriggerServerCallback('team5m-admin:getIdentifier', function(data)
            for k,v in pairs(Config.Admins) do
                if Config.Admins[k].identifier == data then
                    admin = true
                end
            end
            if admin then
                load()
                SetNuiFocus(true, true)
                SendNUIMessage({
                    type = "open"
                }) 
            else
                notify('notAdmin')
            end
        end)
    else
        QBCore.Functions.TriggerCallback('team5m-admin:getIdentifier', function(data)
            for k,v in pairs(Config.Admins) do
                if Config.Admins[k].identifier == data then
                    admin = true
                end
            end
            if admin then
                load()
                SetNuiFocus(true, true)
                SendNUIMessage({
                    type = "open"
                }) 
            else
                notify('notAdmin')
            end
        end)
    end
end)

RegisterKeyMapping('admin', 'Admin Menu', 'keyboard', Config.key)

function checkAdmin()
    if Config.framework == "esx" then
        ESX.TriggerServerCallback('team5m-admin:getIdentifier', function(data)
            for k,v in pairs(Config.Admins) do
                local info = Config.Admins[k]
                if info.identifier == data then
                    return true
                end
            end
        end)
        return false
    else
        QBCore.Functions.TriggerCallback('team5m-admin:getIdentifier', function(data)
            for k,v in pairs(Config.Admins) do
                local info = Config.Admins[k]
                if info.identifier == data then
                    return true
                end
            end
        end)
        return false
    end
end

-- Functions
function load()
    loadLanguage()
    loadPersonal()
    loadPlayers()
    loadVehicle()
    loadWeapon()
    loadSupport()
end

function loadLanguage()
    if not loaded then
        SendNUIMessage({
            type = "loadLanguage",
            language = Config.Locale[Config.language],
        })
        for k,v in pairs(Config.Locale[Config.language]) do
            SendNUIMessage({
                type = "updateLanguage",
                id = k,
                text = v
            })
        end
        loadAdminChat()
        loaded = true
    end
end

function getDuty()
    if dutyStatus then
        return true
    else
        notify('dutyNotify')
    end
end

function draw3DText(pos, text, options)
    options = options or {}
    local color = options.color or { r = 255, g = 255, b = 255, a = 255 }
    local scaleOption = options.size or 0.8

    local camCoords = GetGameplayCamCoords()
    local dist = #(camCoords - pos)
    local scale = (scaleOption / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scaleMultiplier = scale * fov
    SetDrawOrigin(pos.x, pos.y, pos.z, 0);
    SetTextProportional(0)
    SetTextScale(0.0 * scaleMultiplier, 0.55 * scaleMultiplier)
    SetTextColour(color.r, color.g, color.b, color.a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

function loadPersonal()
    if Config.framework == "esx" then
        ESX.TriggerServerCallback('team5m-admin:getPersonal', function(data)
            SendNUIMessage({
                type = "updatePersonal",
                data = data
            })
        end)
    else
        QBCore.Functions.TriggerCallback('team5m-admin:getPersonal', function(data)
            SendNUIMessage({
                type = "updatePersonal",
                data = data
            })
        end)
    end
end

function loadPlayers()
    if Config.framework == "esx" then
        ESX.TriggerServerCallback('team5m-admin:getPlayers', function(data)
            for k,v in pairs(data) do
                SendNUIMessage({
                    type = "addPlayer",
                    id = k,
                    name = v.name,
                    image = v.image
                })
            end
        end)
    else
        QBCore.Functions.TriggerCallback('team5m-admin:getPlayers', function(data)
            for k,v in pairs(data) do
                SendNUIMessage({
                    type = "addPlayer",
                    id = k,
                    name = v.name,
                    image = v.image
                })
            end
        end)
    end
end

function loadVehicle()
    local name, model
    local currentVehicle = GetVehiclePedIsIn(PlayerPedId())
    local license = GetVehicleNumberPlateText(currentVehicle)
    if currentVehicle ~= 0 then
        local decode
        if Config.framework == "esx" then
            decode = ESX.Game.GetVehicleProperties(currentVehicle)
        else
            decode = QBCore.Functions.GetVehicleProperties(currentVehicle) 
        end
        model = GetDisplayNameFromVehicleModel(decode.model)
        
        if GetLabelText(model) == 'NULL' then
            name = model
        else
            name = GetLabelText(model)
        end
    else
        name = getMessage('notFound')
        license = getMessage('notFound')
    end

    SendNUIMessage({
        type = "updateVehicle",
        model = model,
        label = name,
        license = license
    })
end

function invisible()
    SetEntityVisible(PlayerPedId(), not playerInvisible)
    while playerInvisible do
        Citizen.Wait(0)
        SetEntityLocallyVisible(PlayerPedId())
    end
end

function playerGod()
    if playerGodMode then
        SetEntityInvincible(PlayerPedId(), true)
        SetPlayerInvincible(PlayerId(), true)
        SetPedCanRagdoll(PlayerPedId(), false)
        ClearPedBloodDamage(PlayerPedId())
        ResetPedVisibleDamage(PlayerPedId())
        ClearPedLastWeaponDamage(PlayerPedId())
        SetEntityProofs(PlayerPedId(), true, true, true, true, true, true, true, true)
        SetEntityCanBeDamaged(PlayerPedId(), false)
    else
        SetEntityInvincible(PlayerPedId(), false)
		SetPlayerInvincible(PlayerId(), false)
		SetPedCanRagdoll(PlayerPedId(), true)
		ClearPedLastWeaponDamage(PlayerPedId())
		SetEntityProofs(PlayerPedId(), false, false, false, false, false, false, false, false)
		SetEntityCanBeDamaged(PlayerPedId(), true)
    end
end

function godmode(vehicle, value)
    if value then
        SetEntityInvincible(vehicle, true)
        SetEntityProofs(vehicle, true, true, true, true, true, true, true, true)
        SetVehicleTyresCanBurst(vehicle, false)
        SetVehicleCanBreak(vehicle, false)
        SetVehicleCanBeVisiblyDamaged(vehicle, false)
        SetEntityCanBeDamaged(vehicle, false)
        SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
        SetFlyThroughWindscreenParams(999, 1.0, 1.0, 1.0)
    else
        SetEntityInvincible(vehicle, false)
        SetEntityProofs(vehicle, false, false, false, false, false, false, false, false)
        SetVehicleTyresCanBurst(vehicle, true)
        SetVehicleCanBreak(vehicle, true)
        SetVehicleCanBeVisiblyDamaged(vehicle, true)
        SetEntityCanBeDamaged(vehicle, true)
        SetVehicleExplodesOnHighExplosionDamage(vehicle, true)
        SetFlyThroughWindscreenParams(999, 1.0, 1.0, 1.0)
    end
end

function inVehicle()
    local currentVehicle = GetVehiclePedIsIn(PlayerPedId())
    if currentVehicle ~= 0 then
        return true
    else
        notify('inVehicle')
        return false
    end
end

function loadWeapon()
    local myWeapon = GetSelectedPedWeapon(PlayerPedId())
    local info = getWeaponData(myWeapon)

    SendNUIMessage({
        type = "updateWeapon",
        name = info.name,
        label = info.label
    })

    for k,v in pairs(Config.weapons) do
        local info = Config.weapons[k]
        SendNUIMessage({
            type = "addWeapon",
            name = info.name,
            label = info.label
        })
    end
end

function getWeaponData(weapon)
    for k,v in pairs(Config.weapons) do
        local info = Config.weapons[k]
        if weapon == GetHashKey(info.name) then
            return info
        end
    end
    info = {
        name = "none",
        label = getMessage('notFound'),
    }
    return info
end

function loadAdminChat()
    if Config.framework == "esx" then
        ESX.TriggerServerCallback('team5m-admin:getChat', function(data)
            for k,v in pairs(data.chat) do
                SendNUIMessage({
                    type = "addMessage",
                    data = data.chat[k],
                    identifier = data.identifier
                })
            end
        end)
    else
        QBCore.Functions.TriggerCallback('team5m-admin:getChat', function(data)
            for k,v in pairs(data.chat) do
                SendNUIMessage({
                    type = "addMessage",
                    data = data.chat[k],
                    identifier = data.identifier
                })
            end
        end)
    end
end


-- Events
RegisterNetEvent('team5m-admin:getScreenShot')
AddEventHandler('team5m-admin:getScreenShot', function (targetID, webhook)
    exports['screenshot-basic']:requestScreenshotUpload(webhook, "files[]", function(data)
    local resp = json.decode(data)
        TriggerServerEvent('team5m-admin:sendScreenShot', targetID, resp.attachments[1].proxy_url)
    end)
end)

RegisterNetEvent('team5m-admin:sendScreenShot')
AddEventHandler('team5m-admin:sendScreenShot', function (image)
    SendNUIMessage({
        type = "showImage",
        image = image
    })
end)

RegisterNetEvent('team5m-admin:sendMessage')
AddEventHandler('team5m-admin:sendMessage', function (data)
    SendNUIMessage({
        type = "addMessage",
        data = data
    })
end)

RegisterNetEvent('team5m-admin:removeTag')
AddEventHandler('team5m-admin:removeTag', function(id)
    if closeAdmins[id] then
        closeAdmins[id] = nil
    end
    if visibleAdmins[id] then
        visibleAdmins[id] = nil
    end
end)

RegisterNetEvent('team5m-admin:getTeleportCoord')
AddEventHandler('team5m-admin:getTeleportCoord', function (id)
    TriggerServerEvent('team5m-admin:getTeleportCoord', GetEntityCoords(PlayerPedId()), id)
end)

RegisterNetEvent('team5m-admin:teleport')
AddEventHandler('team5m-admin:teleport', function (coords)
    SetEntityCoords(PlayerPedId(), coords)
end)

RegisterNetEvent('team5m-admin:announcement')
AddEventHandler('team5m-admin:announcement', function (text, delay)
    announce(text, 60000*delay)
end)

RegisterNetEvent('team5m-admin:updateTags')
AddEventHandler('team5m-admin:updateTags', function(admins)
    currentAdminPlayers = admins
end)

RegisterNetEvent('team5m-admin:clearObjects')
AddEventHandler('team5m-admin:clearObjects', function ()
    ClearAreaOfObjects(GetEntityCoords(PlayerPedId()), 500.0)
end)

RegisterNetEvent('team5m-admin:clearPeds')
AddEventHandler('team5m-admin:clearPeds', function ()
    ClearAreaOfPeds(GetEntityCoords(PlayerPedId()), 500.0)
end)

RegisterNetEvent('team5m-admin:giveWeaponPlayer')
AddEventHandler('team5m-admin:giveWeaponPlayer', function (weapon)
    notify('getWeapon', weapon)
end)

RegisterNetEvent('team5m-admin:deleteWeaponPlayer')
AddEventHandler('team5m-admin:deleteWeaponPlayer', function (weapon)
    notify('deleteWeapon', weapon)
end)

RegisterNetEvent('team5m-admin:giveArmor')
AddEventHandler('team5m-admin:giveArmor', function ()
    SetPedArmour(PlayerPedId(), 100.0)
    notify('armor')
end)

RegisterNetEvent('team5m-admin:heal')
AddEventHandler('team5m-admin:heal', function()
    SetEntityHealth(PlayerPedId(), 200.0)
    notify('heal')
end)

RegisterNetEvent('team5m-admin:giveBankMoney')
AddEventHandler('team5m-admin:giveBankMoney', function (money)
    notify('getBankMoney', money)
end)

RegisterNetEvent('team5m-admin:giveBlackMoney')
AddEventHandler('team5m-admin:giveBlackMoney', function (money)
    notify('getBlackMoney', money)
end)

RegisterNetEvent('team5m-admin:giveItem')
AddEventHandler('team5m-admin:giveItem', function (name, amount)
    notify('getItem', name.."("..amount.."x)")
end)

RegisterNetEvent('team5m-admin:giveWeapon')
AddEventHandler('team5m-admin:giveWeapon', function (name)
    notify('getWeapon', name)
end)

RegisterNetEvent('team5m-admin:bring')
AddEventHandler('team5m-admin:bring', function (coords)
    SetEntityCoords(PlayerPedId(), coords)
end)

RegisterNetEvent('team5m-admin:warn')
AddEventHandler('team5m-admin:warn', function (reason)
    notify('getWarn', reason)
end)

RegisterNetEvent('team5m-admin:updateWarn')
AddEventHandler('team5m-admin:updateWarn', function (warn)
    SendNUIMessage({
        type = "updateWarn",
        warn = warn
    })
end)

RegisterNetEvent('team5m-admin:freeze')
AddEventHandler('team5m-admin:freeze', function ()
    local freezeStatus = IsEntityPositionFrozen(PlayerPedId())

    if freezeStatus then
        FreezeEntityPosition(PlayerPedId(), false)
        notify('unfreeze')
    else
        FreezeEntityPosition(PlayerPedId(), true)
        notify('freeze')
    end
end)


-- CallBacks
RegisterNUICallback('exit', function(data)
    SetNuiFocus(false, false)
    targetTicket = nil
end)

RegisterNUICallback('updateDuty', function(data)
    dutyStatus = not dutyStatus

    SendNUIMessage({
        type = "updateDuty",
        value = dutyStatus
    })
end)

RegisterNUICallback('announcement', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:announcement', data.text, data.delay)
    end
end)

RegisterNUICallback('addTag', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:addTag', data.value)
        notify('success')
    end
end)

RegisterNUICallback('reviveAll', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:reviveAll')
        notify('success')
    end
end)

RegisterNUICallback('allKick', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:allKick', data.reason)
        notify('kickAllNotify')
    end
end)

local spectateStatus = false

RegisterNUICallback('spectate', function(data)
    local duty = getDuty()
    if duty then
        if not spectateStatus then
            spectate(tonumber(data.id))
            spectateStatus = true
        else
            resetNormalCamera()
            spectateStatus = false
        end
    end
end)

RegisterNUICallback('deleteVehicles', function(data)
    local duty = getDuty()
    if duty then
	    TriggerServerEvent('team5m-admin:deleteVehicles')
    end
end)

RegisterNUICallback('clearObjects', function(data)
    local duty = getDuty()
    if duty then
	    TriggerServerEvent('team5m-admin:clearObjects')
    end
end)

RegisterNUICallback('clearPeds', function(data)
    local duty = getDuty()
    if duty then
	    TriggerServerEvent('team5m-admin:clearPeds')
    end
end)

RegisterNUICallback('loadPlayer', function(data)
    if Config.framework == "esx" then
        ESX.TriggerServerCallback('team5m-admin:getPlayerInfo', function(data)
            SendNUIMessage({
                type = "loadPlayer",
                data = data
            })
        end, data.id)
    else
        QBCore.Functions.TriggerCallback('team5m-admin:getPlayerInfo', function(data)
            SendNUIMessage({
                type = "loadPlayer",
                data = data
            })
        end, data.id) 
    end
end)

RegisterNUICallback('revive', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:revive', data.id)
        notify('success')
    end
end)

RegisterNUICallback('ban', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:ban', data.id, data.reason)
        notify('success')
    end
end)

RegisterNUICallback('heal', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:heal', data.id)
        notify('success')
    end
end)

RegisterNUICallback('freeze', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:freeze', data.id)
        notify('success')
    end
end)

RegisterNUICallback('screenshot', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:getScreenShot', data.id)
        notify('success')
    end
end)

RegisterNUICallback('giveArmor', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:giveArmor', data.id)
        notify('success')
    end
end)

RegisterNUICallback('giveBankMoney', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:giveBankMoney', data.id, data.value)
        notify('success')
    end
end)

RegisterNUICallback('giveBlackMoney', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:giveBlackMoney', data.id, data.value)
        notify('success')
    end
end)

RegisterNUICallback('teleport', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:teleport', data.id)
        notify('success')
    end
end)

RegisterNUICallback('giveItem', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:giveItem', data.id, data.name, data.amount)
        notify('success')
    end
end)

RegisterNUICallback('bring', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:bring', data.id, GetEntityCoords(PlayerPedId()))
        notify('success')
    end
end)

RegisterNUICallback('giveWeapon', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:giveWeapon', data.id, data.name)
        notify('success')
    end
end)

RegisterNUICallback('warn', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:giveWarn', data.id, data.reason)
        notify('success')
    end
end)

RegisterNUICallback('openInventory', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:openInventory', data.id)
        notify('success')
    end
end)

RegisterNUICallback('kick', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:kick', data.id, data.reason)
        notify('success')
    end
end)

RegisterNUICallback('deleteVehicle', function()
    local duty = getDuty()
    local inVeh = inVehicle()
    if inVeh and duty then
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        if Config.framework == "esx" then
            ESX.Game.DeleteVehicle(vehicle)
        else
            QBCore.Functions.DeleteVehicle(vehicle)
        end
        notify('success')
    end
end)

RegisterNUICallback('repairCar', function()
    local duty = getDuty()
    local inVeh = inVehicle()
    if inVeh and duty then
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleUndriveable(vehicle, false)
        SetVehicleEngineOn(vehicle, true, true)
        notify('success')
    end
end)

RegisterNUICallback('spawnVehicle', function(data)
    local duty = getDuty()
    if duty then
        local model = GetHashKey(data.model)
        RequestModel(model)

        while not HasModelLoaded(model) do
            Citizen.Wait(1)
        end
        
        local vehicle = CreateVehicle(model, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), 1)
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        notify('success')
    end
    Citizen.Wait(500)
    loadVehicle()
end)

RegisterNUICallback('flipVehicle', function(data)
    local duty = getDuty()
    local inVeh = inVehicle()
    if inVeh and duty then
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        local carCoords = GetEntityRotation(vehicle, 2)
        SetEntityRotation(vehicle, carCoords[1], 0, carCoords[3], 2, true)
        SetVehicleOnGroundProperly(vehicle)
        notify('success')
    end
end)

RegisterNUICallback('vehGod', function(data)
    local duty = getDuty()
    local inVeh = inVehicle()
    if inVeh and duty then
        godMode = not godMode
        SendNUIMessage({
            type = "updateVehGod",
            value = godMode
        })
        notify('success')
    end
end)

RegisterNUICallback('addVehicle', function(data)
    local duty = getDuty()
    if duty then
        local model = GetHashKey(data.model)
        RequestModel(model)

        while not HasModelLoaded(model) do
            Citizen.Wait(1)
        end
        
        local vehicle = CreateVehicle(model, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), 1)
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        local vehicleProps
        if Config.framework == "esx" then
            vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
        else
            vehicleProps = QBCore.Functions.GetVehicleProperties(vehicle)
        end
        TriggerServerEvent('team5m-admin:addVehicle', vehicleProps)
        notify('success')
    end
end)

RegisterNUICallback('deletePlayerVehicle', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:deleteVehicle', data.plate)
        notify('success')
    end
end)

RegisterNUICallback('drift', function()
    local duty = getDuty()
    local inVeh = inVehicle()
    if inVeh and duty then
        driftmode = not driftmode

        if driftmode then
            notify('driftOn')
            driftSleep = 1
        else
            notify('driftOff')
            driftSleep = 3000
        end
        SendNUIMessage({
            type = "updateDrift",
            drift = driftmode
        })
    end
end)

RegisterNUICallback('playerGod', function(data)
    local duty = getDuty()
    if duty then
        playerGodMode = not playerGodMode
        SendNUIMessage({
            type = "updatePlayerGod",
            value = playerGodMode
        })
        playerGod()
        notify('success')
    end
end)

RegisterNUICallback('invisible', function(data)
    local duty = getDuty()
    if duty then
        playerInvisible = not playerInvisible
        SendNUIMessage({
            type = "updateInvisible",
            value = playerInvisible
        })
        notify('success')
        invisible()
    end
end)

RegisterNUICallback('getCoords', function(data)
    local duty = getDuty()
    if duty then
        local coords = GetEntityCoords(PlayerPedId())
        SendNUIMessage({
            type = "copyCoord",
            coord = "vector3("..coords.x..","..coords.y..","..coords.z..")"
        })
        notify('success')
    end
end)

RegisterNUICallback('changeJob', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:changeJob', data.name, data.grade)
        notify('success')
    end
end)

RegisterNUICallback('noclip', function(data)
    local duty = getDuty()
    if duty then
        noclipActive = not noclipActive
        notify('success')
        activeNoclip()
    end
end)

RegisterNUICallback('deleteWeapon', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:deleteWeaponPlayer', data.id, data.weapon)
        notify('success')
    end
end)

RegisterNUICallback('giveWeaponPlayer', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:giveWeaponPlayer', data.id, data.weapon)
        notify('success')
    end
end)

RegisterNUICallback('deleteWeaponPlayer', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:deleteWeaponPlayer', data.id, data.weapon)
        notify('success')
    end
end)

RegisterNUICallback('addComponents', function(data)
    local duty = getDuty()
    if duty then
        local myWeapon = GetSelectedPedWeapon(PlayerPedId())
        local info = getWeaponData(myWeapon)
        if info.components then
            for k,v in pairs(info.components) do
                GiveWeaponComponentToPed(PlayerPedId(), myWeapon, v)  
            end
        end
        notify('success')
    end
end)

RegisterNUICallback('spawnWeapon', function(data)
    local duty = getDuty()
    if duty then
        TriggerServerEvent('team5m-admin:spawnWeapon', data.weapon)
        notify('success')
    end
end)

RegisterNUICallback('sendMessage', function(data)
    TriggerServerEvent('team5m-admin:sendMessage', data.message)
end)


local InSpectatorMode, ShowInfos = false, false
local TargetSpectate, LastPosition, cam
local polarAngleDeg = 0
local azimuthAngleDeg = 90
local radius = -3.5

function polar3DToWorld3D(entityPosition, radius, polarAngleDeg, azimuthAngleDeg)
	-- convert degrees to radians
	local polarAngleRad   = polarAngleDeg   * math.pi / 180.0
	local azimuthAngleRad = azimuthAngleDeg * math.pi / 180.0

	local pos = {
		x = entityPosition.x + radius * (math.sin(azimuthAngleRad) * math.cos(polarAngleRad)),
		y = entityPosition.y - radius * (math.sin(azimuthAngleRad) * math.sin(polarAngleRad)),
		z = entityPosition.z - radius * math.cos(azimuthAngleRad)
	}

	return pos
end

function spectate(target)
    if Config.framework == "esx" then
        ESX.TriggerServerCallback('esx:getPlayerData', function(player)
            if not InSpectatorMode then
                LastPosition = GetEntityCoords(PlayerPedId())
            end

            local playerPed = PlayerPedId()

            SetEntityCollision(playerPed, false, false)
            SetEntityVisible(playerPed, false)

            PlayerData = player

            if ShowInfos then
                SendNUIMessage({
                    type = 'infos',
                    data = PlayerData
                })	
            end

            Citizen.CreateThread(function()
                if not DoesCamExist(cam) then
                    cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
                end

                SetCamActive(cam, true)
                RenderScriptCams(true, false, 0, true, true)

                InSpectatorMode = true
                TargetSpectate  = target
            end)
        end, target)
    end
end

Citizen.CreateThread(function()

    while true do

      Wait(0)

      if InSpectatorMode then

          local targetPlayerId = GetPlayerFromServerId(TargetSpectate)
          local playerPed	  = PlayerPedId()
          local targetPed	  = GetPlayerPed(targetPlayerId)
          local coords	 = GetEntityCoords(targetPed)

          for i=0, 32, 1 do
              if i ~= PlayerId() then
                  local otherPlayerPed = GetPlayerPed(i)
                  SetEntityNoCollisionEntity(playerPed,  otherPlayerPed,  true)
              end
          end

          if IsControlPressed(2, 241) then
              radius = radius + 2.0
          end

          if IsControlPressed(2, 242) then
              radius = radius - 2.0
          end

          if radius > -1 then
              radius = -1
          end

          local xMagnitude = GetDisabledControlNormal(0, 1)
          local yMagnitude = GetDisabledControlNormal(0, 2)

          polarAngleDeg = polarAngleDeg + xMagnitude * 10

          if polarAngleDeg >= 360 then
              polarAngleDeg = 0
          end

          azimuthAngleDeg = azimuthAngleDeg + yMagnitude * 10

          if azimuthAngleDeg >= 360 then
              azimuthAngleDeg = 0
          end

          local nextCamLocation = polar3DToWorld3D(coords, radius, polarAngleDeg, azimuthAngleDeg)

          SetCamCoord(cam,  nextCamLocation.x,  nextCamLocation.y,  nextCamLocation.z)
          PointCamAtEntity(cam,  targetPed)
          SetEntityCoords(playerPed,  coords.x, coords.y, coords.z + 10)

      end
  end
end)

function resetNormalCamera()
	InSpectatorMode = false
	TargetSpectate  = nil
	local playerPed = PlayerPedId()

	SetCamActive(cam, false)
	RenderScriptCams(false, false, 0, true, true)

	SetEntityCollision(playerPed, true, true)
	SetEntityVisible(playerPed, true)
	SetEntityCoords(playerPed, LastPosition.x, LastPosition.y, LastPosition.z)
end

function getPlayersList()
    if Config.framework == "esx" then
        local players = ESX.Game.GetPlayers()
        local data = {}

        for i=1, #players, 1 do

            local _data = {
                id = GetPlayerServerId(players[i]),
                name = GetPlayerName(players[i])
            }
            table.insert(data, _data)
        end

        return data
    else
        local players = QBCore.Functions.GetPlayers()
        local data = {}

        for i=1, #players, 1 do

            local _data = {
                id = GetPlayerServerId(players[i]),
                name = GetPlayerName(players[i])
            }
            table.insert(data, _data)
        end

        return data
    end
end




-- Citizen Threads
Citizen.CreateThread(function()
    while true do
        Wait(500)
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        for k, v in pairs(currentAdminPlayers) do
            local playerServerID = GetPlayerFromServerId(v.source)
            if playerServerID ~= -1 then
                local adminPed = GetPlayerPed(playerServerID)
                local adminCoords = GetEntityCoords(adminPed)
                local distance = #(adminCoords - pedCoords)
                if distance < 40 then
                    visibleAdmins[v.source] = v
                else
                    visibleAdmins[v.source] = nil
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(500)
        closeAdmins = {}
        for k, v in pairs(visibleAdmins) do
            local playerServerID = GetPlayerFromServerId(v.source)
            if playerServerID ~= -1 then
                local adminPed = GetPlayerPed(playerServerID)
                closeAdmins[playerServerID] = {
                    ped = adminPed,
                    label = v.info.tagColor..v.info.tagLabel,
                    source = v.source,
                    self = v.source == GetPlayerServerId(PlayerId()),
                }
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        if next(closeAdmins) ~= nil then
            for k, v in pairs(closeAdmins) do
                if v.label then
                    if v.self then
                        draw3DText(GetEntityCoords(v.ped) + vector3(0, 0, 1.2), v.label, {
                            size = 0.8
                        })
                    end
                end
            end
        else
            Wait(1000)
        end
    end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(driftSleep)
		if IsControlJustPressed(1, 118) then

			driftmode = not driftmode
		end
		if driftmode then
			if IsPedInAnyVehicle(GetPed(), false) then
				CarSpeed = GetEntitySpeed(GetCar()) * 3.6
				if GetPedInVehicleSeat(GetCar(), -1) == GetPed() then
					if CarSpeed <= 200.0 then  
						if IsControlPressed(1, 21) then
							SetVehicleReduceGrip(GetCar(), true)
						else
							SetVehicleReduceGrip(GetCar(), false)
						end
					end
				end
			end
		end
	end
end)
-- Function
function GetPed() return PlayerPedId() end
function GetCar() return GetVehiclePedIsIn(PlayerPedId(),false) end




Citizen.CreateThread(function()
    while true do
        if godMode then
            local vehicle = GetVehiclePedIsIn(PlayerPedId())
            if vehicle ~= 0 then
                if not lastVehicle then
                    lastVehicle = vehicle
                    godmode(lastVehicle, true)
                end
            else
                if lastVehicle then
                    godmode(lastVehicle, false)
                    lastVehicle = nil
                end
            end
        else
            if lastVehicle then
                godmode(lastVehicle, false)
                lastVehicle = nil
            end
        end
        Citizen.Wait(1000)
    end
end)


config = {
    speeds = {
        { label = "verySlow", speed = 0},
        { label = "slow", speed = 0.5},
        { label = "normal", speed = 2},
        { label = "fast", speed = 4},
        { label = "veryFast", speed = 6},
        { label = "extremelyFast", speed = 10},
        { label = "extremelyFast2", speed = 20},
        { label = "maxSpeed", speed = 25}
    },
}

index = 1

function activeNoclip()
    if noclipActive then
        buttons = setupScaleform("instructional_buttons")
        currentSpeed = config.speeds[index].speed

        if IsPedInAnyVehicle(PlayerPedId(), false) then
            noclipEntity = GetVehiclePedIsIn(PlayerPedId(), false)
        else
            noclipEntity = PlayerPedId()
        end

        SetEntityCollision(noclipEntity, not noclipActive, not noclipActive)
        FreezeEntityPosition(noclipEntity, noclipActive)
        SetEntityInvincible(noclipEntity, noclipActive)
        SetVehicleRadioEnabled(noclipEntity, not noclipActive)

        while noclipActive do
            Citizen.Wait(1)
            DrawScaleformMovieFullscreen(buttons)

            local yoff = 0.0
            local zoff = 0.0

            if IsControlJustPressed(1, Config.noclipControls["changeSpeed"]) then
                if index ~= 8 then
                    index = index+1
                    currentSpeed = config.speeds[index].speed
                else
                    currentSpeed = config.speeds[1].speed
                    index = 1
                end
                setupScaleform("instructional_buttons")
            end
                
                DisableControls()

            if IsDisabledControlPressed(0, Config.noclipControls["goForward"]) then
                yoff = 0.5
            end
            
            if IsDisabledControlPressed(0, Config.noclipControls["goBackward"]) then
                yoff = -0.5
            end
            
            if IsDisabledControlPressed(0, Config.noclipControls["turnLeft"]) then
                SetEntityHeading(noclipEntity, GetEntityHeading(noclipEntity)+3)
            end
            
            if IsDisabledControlPressed(0, Config.noclipControls["turnRight"]) then
                SetEntityHeading(noclipEntity, GetEntityHeading(noclipEntity)-3)
            end
            
            if IsDisabledControlPressed(0, Config.noclipControls["goUp"]) then
                zoff = 0.2
            end
            
            if IsDisabledControlPressed(0, Config.noclipControls["goDown"]) then
                zoff = -0.2
            end
            
            local newPos = GetOffsetFromEntityInWorldCoords(noclipEntity, 0.0, yoff * (currentSpeed + 0.3), zoff * (currentSpeed + 0.3))
            local heading = GetEntityHeading(noclipEntity)
            SetEntityVelocity(noclipEntity, 0.0, 0.0, 0.0)
            SetEntityRotation(noclipEntity, 0.0, 0.0, 0.0, 0, false)
            SetEntityHeading(noclipEntity, heading)
            SetEntityCoordsNoOffset(noclipEntity, newPos.x, newPos.y, newPos.z, noclipActive, noclipActive, noclipActive)
        end
    else
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            noclipEntity = GetVehiclePedIsIn(PlayerPedId(), false)
        else
            noclipEntity = PlayerPedId()
        end
        
        SetEntityCollision(noclipEntity, not noclipActive, not noclipActive)
        FreezeEntityPosition(noclipEntity, noclipActive)
        SetEntityInvincible(noclipEntity, noclipActive)
        SetVehicleRadioEnabled(noclipEntity, not noclipActive)
    end
end

function ButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function Button(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function setupScaleform(scaleform)

    local scaleform = RequestScaleformMovie(scaleform)

    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(1)
    end

    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(5)

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(4)
    Button(GetControlInstructionalButton(2, Config.noclipControls["goUp"], true))
    ButtonMessage(getMessage("goUp"))
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(3)
    Button(GetControlInstructionalButton(2, Config.noclipControls["goDown"], true))
    ButtonMessage(getMessage("goDown"))
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(2)
    Button(GetControlInstructionalButton(1, Config.noclipControls["turnRight"], true))
    Button(GetControlInstructionalButton(1, Config.noclipControls["turnLeft"], true))
    ButtonMessage(getMessage("turn"))
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    Button(GetControlInstructionalButton(1, Config.noclipControls["goBackward"], true))
    Button(GetControlInstructionalButton(1, Config.noclipControls["goForward"], true))
    ButtonMessage(getMessage("go"))
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    Button(GetControlInstructionalButton(2, Config.noclipControls["changeSpeed"], true))
    ButtonMessage(getMessage("changeSpeed").." ("..getMessage(config.speeds[index].label)..")")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()
    return scaleform
end

function DisableControls()
    DisableControlAction(0, 30, true)
    DisableControlAction(0, 31, true)
    DisableControlAction(0, 32, true)
    DisableControlAction(0, 33, true)
    DisableControlAction(0, 34, true)
    DisableControlAction(0, 35, true)
    DisableControlAction(0, 266, true)
    DisableControlAction(0, 267, true)
    DisableControlAction(0, 268, true)
    DisableControlAction(0, 269, true)
    DisableControlAction(0, 44, true)
    DisableControlAction(0, 20, true)
    DisableControlAction(0, 74, true)
end

-- ticket
Citizen.CreateThread(function()
    for k,v in pairs(Config.supportCommands) do
        RegisterCommand(v, function ()
            createTicket()
        end)
    end
end)

function createTicket()
    loadLanguage()
    if Config.framework == "esx" then
        ESX.TriggerServerCallback('team5m-admin:checkTicket', function(id)
            if not id then
                updateIdentifier()
                loadTicket()
                SendNUIMessage({
                    type = "createTicket"
                })
                SetNuiFocus(true, true)
            else
                openTicket(id)
            end
        end)
    else
        QBCore.Functions.TriggerCallback('team5m-admin:checkTicket', function(id)
            if not id then
                updateIdentifier()
                loadTicket()
                SendNUIMessage({
                    type = "createTicket"
                })
                SetNuiFocus(true, true)
            else
                openTicket(id)
            end
        end)
    end
end

function loadTicket()
    for k,v in pairs(Config.supportCategories) do
        SendNUIMessage({
            type = "addSupportCategory",
            name = v
        })
    end
end

RegisterNUICallback('createTicket', function(data)
    TriggerServerEvent('team5m-admin:createTicket', data.category, data.title)
    SetNuiFocus(false, false)
end)

RegisterNUICallback('openTicket', function(data)
    openTicket(data.id)
end)

function openTicket(id)
    if Config.framework == "esx" then
        ESX.TriggerServerCallback('team5m-admin:getTicket', function(data)
            for k,v in pairs(data) do
                SendNUIMessage({
                    type = "addTicketMessage",
                    message = v["message"],
                    messageID = k,
                    image = v["image"],
                    name = v["name"],
                    rank = v["rank"],
                    identifier = v["identifier"]
                })
            end
        end, id)
    else
        QBCore.Functions.TriggerCallback('team5m-admin:getTicket', function(data)
            for k,v in pairs(data) do
                SendNUIMessage({
                    type = "addTicketMessage",
                    message = v["message"],
                    messageID = k,
                    image = v["image"],
                    name = v["name"],
                    rank = v["rank"],
                    identifier = v["identifier"]
                })
            end
        end, id)
    end
    SendNUIMessage({
        type = "openTicketMessage",
        text = getMessage('ticket').." - #"..id,
        id = id
    })
    targetTicket = id
    SetNuiFocus(true, true)
end

RegisterNetEvent('team5m-admin:updateTicketMessage')
AddEventHandler('team5m-admin:updateTicketMessage', function (data, id)
    if tonumber(targetTicket) == tonumber(id) then
        SendNUIMessage({type = "resetTicketMessage"})
        for k,v in pairs(data) do
            SendNUIMessage({
                type = "addTicketMessage",
                message = v["message"],
                messageID = k,
                image = v["image"],
                name = v["name"],
                rank = v["rank"],
                identifier = v["identifier"]
            })
        end
    end
end)

RegisterNetEvent('team5m-admin:openTicket')
AddEventHandler('team5m-admin:openTicket', function (id)
    openTicket(id)      
end)

RegisterNetEvent('team5m-admin:updateTickets')
AddEventHandler('team5m-admin:updateTickets', function (tickets)
    SendNUIMessage({type = "resetTicket"})
    for k,v in pairs(tickets) do
        local info = tickets[k]
        SendNUIMessage({
            type = "AddTicket",
            name = info.name,
            category = info.category,
            image = info.image,
            id = k,
            closed = info.closed
        })
    end
end)

RegisterNetEvent('team5m-admin:closeTicket')
AddEventHandler('team5m-admin:closeTicket', function (id)
    if targetTicket == id then
        SendNUIMessage({
            type = "closeTicket"
        })
    end
end)

function loadSupport()
    TriggerServerEvent('team5m-admin:updateTickets')
end

RegisterNUICallback('sendTicketMessage', function(data)
    TriggerServerEvent('team5m-admin:sendTicketMessage', data.message, targetTicket)
end)

RegisterNUICallback('endTicket', function(data)
    TriggerServerEvent('team5m-admin:closeTicket', data.id)
end)

RegisterNUICallback('inviteTicket', function(data)
    TriggerServerEvent('team5m-admin:inviteTicket', data.id, targetTicket)
end)

RegisterNetEvent('team5m-admin:inviteTicket')
AddEventHandler('team5m-admin:inviteTicket', function (id)
    targetTicket = tonumber(id)
    openTicket(targetTicket)
end)

function updateIdentifier()
    if Config.framework == "esx" then
        ESX.TriggerServerCallback('team5m-admin:getIdentifier', function(data)
            SendNUIMessage({
                type = "updateIdentifier",
                identifier = data
            })
        end)
    else
        QBCore.Functions.TriggerCallback('team5m-admin:getIdentifier', function(data)
            SendNUIMessage({
                type = "updateIdentifier",
                identifier = data
            })
        end)
    end
end


RegisterNetEvent('team5m-admin:deleteVehicles')
AddEventHandler('team5m-admin:deleteVehicles', function ()
    local gameVehicles = QBCore.Functions.GetVehicles()
    for _, vehicle in ipairs(gameVehicles) do
         if DoesEntityExist(vehicle) then
          QBCore.Functions.DeleteVehicle(vehicle)
         end
    end
end)