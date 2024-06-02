-- Configure this According to your needs --

WEATHER_TYPES = {
    { hash = -1750463879, name = "CLEAR"},
    { hash = 916995460, name = "CLOUDS"},
    { hash = -1530260698, name = "EXTRASUNNY"},
    { hash = -1148613331, name = "OVERCAST"},
    { hash = 1420204096, name = "RAIN"},
    { hash = -1233681761, name = "THUNDER"},
    { hash = -1368164796, name = "SNOW"},
    { hash = -1429616491, name = "XMAS"},
    -- Add more weather types as needed --
}

-- Fetch Vehicle Fuel --
function GetVehicleFuel(veh)
    local curFuel
    -- curFuel = exports['LegacyFuel']:GetFuel(veh)
    curFuel = GetVehicleFuelLevel(veh)
    return curFuel
end

-- Open Map --
function openMap()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1)
end

-- Actions From AI --
function vehicleDoor(action)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
    if action == 'all' then
        for door = 0, 7 do
            if not IsVehicleDoorDamaged(vehicle, door) then
                SetVehicleDoorOpen(vehicle, door, false, false)
            end
        end
    elseif action == 'closeall' then
        for door = 0, 7 do
            if not IsVehicleDoorDamaged(vehicle, door) then
                SetVehicleDoorShut(vehicle, door, false)
            end
        end
    elseif type(action) == 'number' then
        local doorIndex = tonumber(action)
        local isDoorOpen = GetVehicleDoorAngleRatio(vehicle, doorIndex) > 0.1
        if isDoorOpen then
            SetVehicleDoorShut(vehicle, doorIndex, false)
        else
            SetVehicleDoorOpen(vehicle, doorIndex, false, false)
        end
    elseif action == 'engineOn' then
        SetVehicleEngineOn(vehicle, true, false, true)
    elseif action == 'engineOff' then
        SetVehicleEngineOn(vehicle, false, false, true)
    end
end



if CodeStudio.Main.UseWithCommand.Enable then
    RegisterCommand(CodeStudio.Main.UseWithCommand.Options.Command, function()
        TriggerEvent('cs:carPlay:openUI')
    end)
    if CodeStudio.Main.UseWithCommand.Options.OpenWithKeybind then
        RegisterKeyMapping(CodeStudio.Main.UseWithCommand.Options.Command, 'Open Car Play' , 'keyboard', CodeStudio.Main.UseWithCommand.Options.Keybind)
    end
end


function InstallRadio(plate, install)
    -- Add a progress bar or mini-game if you want --
    TriggerServerEvent('cs:carplay:addInstall', plate, install)

    -- Optional ox_lib progressbar method --

    -- progText = 'Installing'
    -- if not install then
    --     progText = 'Uninstalling'
    -- end
    -- ExecuteCommand('e mechanic4')
    -- if lib.progressBar({
    --     duration = 5000,
    --     label = progText..' Car Play System',
    --     useWhileDead = false,
    --     canCancel = true,
    --     disable = {
    --         move = true,
    --         combat = true
    --     },
    -- }) then
    --     LocalPlayer.state.invBusy = false
    --     ExecuteCommand('e c')
    --     TriggerServerEvent('cs:carplay:addInstall', plate, install)
    -- else
    --     LocalPlayer.state.invBusy = false
    --     ExecuteCommand('e c')
    -- end
end


function Notification(msg, state)
    -- Add Your Notification Event Here

    SetNotificationTextEntry('STRING')
    AddTextComponentString(msg)
    DrawNotification(0,1)

    -- Examples --

    -- [CodeStudio Notification] --

    -- exports['cs_notification']:Notify({  -- https://codestudio.tebex.io/package/5680775
    --     type = state,  
    --     title = 'Car Play',
    --     description = msg
    -- })

    -- [QBCore Notification] --

    --TriggerEvent('QBCore:Notify', msg, state)

    -- [ESX Notification] --

    --TriggerEvent('esx:showNotification', msg, state)
end
