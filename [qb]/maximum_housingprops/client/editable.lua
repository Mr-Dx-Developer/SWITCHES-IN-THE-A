if Config.ClearPeds.Active then 

    local clearAreaCoords = Config.ClearPeds.Coords
    local radius = Config.ClearPeds.Radius

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(100)
            ClearAreaOfPeds(clearAreaCoords.x, clearAreaCoords.y, clearAreaCoords.z, radius, 1)
        end
    end)
end

function TargetObject(prop)
    if Config.TargetSystem == "qb" then

        exports["qb-target"]:AddTargetEntity(prop, {
            options = {
                {
                    icon = "fas fa-hands",
                    label = "Remove Object",
                    action = function()
                        TriggerEvent("maximum_housingprops:CheckPropData", prop)
                    end,
                },
            },
            distance = Config.TargetDistance,
        })

    elseif Config.TargetSystem == "qt" then 

        exports["qtarget"]:AddTargetEntity(prop, {
            options = {
                {
                    icon = "fas fa-hands",
                    label = "Remove Object",
                    action = function()
                        TriggerEvent("maximum_housingprops:CheckPropData", prop)
                    end,
                },
            },
            distance = Config.TargetDistance,
        })

    elseif Config.TargetSystem == "ox" then

        local options = {
            icon = "fas fa-hands",
            label = "Remove Object",
            onSelect = function()
                TriggerEvent("maximum_housingprops:CheckPropData", prop)
            end,
            distance = Config.TargetDistance,
        } 

        exports.ox_target:addLocalEntity(prop, options)

    elseif Config.TargetSystem == "custom" then
        -- Add your custom target system here 
        print("[MAXIMUM] - Configure your target system in maximum_housingprops/client/editable.lua")

    end
end

-- Configure additional event to trigger here once inside the studio (not the lobby).
-- Can set NetworkOverrideClockTime(23, 0, 0) in qb-weathersync/client/client.lua, 
-- or PauseSync.time = 23 in cd_easytime/client/client.lua in event: cd_easytime:PauseSync,
-- to give studio interior a darker effect when entering the zone.
-- Else, configure your own events and triggers here. (Don't forget to re-enable below.)

function InStudio()
    Wait(150)
    if Config.Core == "qb" then
        TriggerEvent('qb-weathersync:client:DisableSync') -- QBCore
    elseif Config.Core == "esx" then 
        TriggerEvent('cd_easytime:PauseSync', true)     -- cd_easytime
    else
        print("[MAXIMUM] Configure your weather sync event in maximum_housingprops/client/editable.lua")
    end
end

function OutStudio()
    Wait(150)
    if Config.Core == "qb" then
        TriggerEvent('qb-weathersync:client:EnableSync') -- qb-weathersync.
    elseif Config.Core == "esx" then 
        TriggerEvent('cd_easytime:PauseSync', false)     -- cd_easytime.
    else
        print("[MAXIMUM] Configure your weather sync event in maximum_housingprops/client/editable.lua")
    end
end


function RegisterPlayerLoadedEvent()
    if Config.Core == "qb" then
        RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
            PlayerData = QBCore.Functions.GetPlayerData()
            TriggerServerEvent("maximum_housingprops:server:loadPropsNew")
            TriggerEvent("maximum_housingprops:Init") -- Initializes the zones on player load.
        end)
    elseif Config.Core == "esx" then
        RegisterNetEvent('esx:playerLoaded', function(xPlayer)
            ESX.PlayerData = xPlayer
            TriggerServerEvent("maximum_housingprops:server:loadPropsNew")
            TriggerEvent("maximum_housingprops:Init") -- Initializes the zones on player load.
        end)
    elseif Config.Core == "custom" then 
        -- Configure your Player Loaded event here!
        TriggerEvent("maximum_housingprops:Init") -- Initializes the zones on player load.
        print("[MAXIMUM] Configure your Player Loaded event in maximum_housingprops/client/editable.lua")
    end
end

RegisterPlayerLoadedEvent() -- CallS the function to register the appropriate event


RegisterCommand("housingprops", function()
    -- Can add your own job checks here before triggering the function.
    -- Option to make menu only available in configured zones in config.
    StudioProps()
end)

RegisterKeyMapping(Config.Controls.command, "Open Maximum Housing Props Menu", 'keyboard', Config.Controls.menuKey)