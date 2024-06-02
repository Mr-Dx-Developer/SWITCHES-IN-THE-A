-- This function is responsible for drawing all the 3d texts ('Press [E] to take off the wheel' e.g)
function Draw3DText(coords, textInput, fontId, scaleX)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, coords, true)
    local scale = (1 / dist) * 20
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    SetTextScale(scaleX * scale, scaleX * scale)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(coords, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

-- This function is responsible for all the tooltips displayed on top right of the screen, you could
-- replace it with a custom notification etc.
function Notify(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    EndTextCommandDisplayHelp(0, 0, 0, -1)
end

RegisterNetEvent('kq_priv_islands:notify')
AddEventHandler('kq_priv_islands:notify', function(message)
    Notify(message)
end)


RegisterCommand(Config.isleCommand or 'isle', function(source, args)
    OpenManagementUI()
end)


if Config.shopCommand.enabled then
    RegisterCommand(Config.shopCommand.command or 'isleShop', function(source, args)
        OpenPurchaseUI()
    end)
end

-- This function is responsible for all the tooltips displayed on top right of the screen, you could
-- replace it with a custom notification etc.
function ShowUIPopup(title, message, buttonText)
    SendNUIMessage({
        event = 'popup',
        title = title,
        message = message,
        buttonText = buttonText or L('OKAY'),
    })
    SetNuiFocus(true, true)
end

RegisterNetEvent('kq_priv_islands:client:popup')
AddEventHandler('kq_priv_islands:client:popup', function(title, message, buttonText)
    ShowUIPopup(title, message, buttonText)
end)

function Debug(message)
    if Config.debug then
        print(message)
    end
end

function CreateIslandBlip(coords, blipData, label)
    local blip = AddBlipForCoord(coords)

    SetBlipSprite(blip, blipData.sprite)
    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, blipData.color)
    SetBlipAlpha(blip, 255)
    SetBlipScale(blip, blipData.scale)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)
    SetBlipAsShortRange(blip, true)

    return blip
end


function DisableInputs()
    -- https://docs.fivem.net/docs/game-references/controls/#controls
    local inputs = {14, 15, 16, 17, 21, 23, 24, 25, 44, 45, 140, 141, 142, 143, 261, 262, 263, 264}
    
    for k, input in pairs(inputs) do
        DisableControlAction(0, input, true)
    end
end

-- Keybinds display
buttons = nil
keybinds = {}

function AddKeybindDisplay(key, label)
    buttons = nil
    
    table.insert(keybinds, {
        key = '~' .. key .. '~',
        label = label,
    })
    
    buttons = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
    while not HasScaleformMovieLoaded(buttons) do
        Wait(0)
    end
    
    BeginScaleformMovieMethod(buttons, "CLEAR_ALL")
    EndScaleformMovieMethod()
    
    for k, keybind in pairs(keybinds) do
        BeginScaleformMovieMethod(buttons, "SET_DATA_SLOT")
        ScaleformMovieMethodAddParamInt(k - 1)
        ScaleformMovieMethodAddParamPlayerNameString(keybind.key)
        PushScaleformMovieMethodParameterString(keybind.label)
        EndScaleformMovieMethod()
    end
    
    BeginScaleformMovieMethod(buttons, "DRAW_INSTRUCTIONAL_BUTTONS")
    EndScaleformMovieMethod()
end

function ClearKeybinds()
    buttons = nil
    keybinds = {}
end


Citizen.CreateThread(function()
    while true do
        local sleep = 500

        if buttons ~= nil then
            sleep = 1
            DrawScaleformMovieFullscreen(buttons, 255, 255, 255, 255, 0)
        end
        Citizen.Wait(sleep)
    end
end)



-- This function gets called for each vehicle that gets spawned (mainly in the garages or docks)
function AfterVehicleSpawn(vehicle)

end

--- EXPORTED FUNCTIONS
-- Function: IsIslandOwned(island_name)
-- Returns: boolean
--
-- Function: DoesPlayerOwnAnyIslands(player_src)
-- Returns: boolean, island_name
--
-- Function: IsIslandOwnedByPlayer(player_src, island_name)
-- Returns: boolean

-- Use example: local isOwner = exports['kq_priv_islands']:IsIslandOwnedByPlayer(1, 'isla_de_la_luna')
