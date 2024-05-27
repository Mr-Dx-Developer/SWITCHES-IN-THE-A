-------------------------------------------------
-- Variables
-------------------------------------------------
local enabledTag = false
local lastEntity = nil

AcceptTestAction = false
MinigameAcceptedAction = false
-------------------------------------------------
-- Function list
-------------------------------------------------
function ResetTaggedPlayerVariables()
    enabledTag = false
    lastEntity = nil
end

function ShowTesterWithValues(drunk, level)
    SendNUIMessage({
        type = "slideTester",
    })

    SendNUIMessage({
        type = "edit_value",
        drunk = drunk,
        level = level,
    })

    Wait(3000)
    CanCloseTester = true
end

function CloseTesterUI()
    if CanCloseTester then
        CanCloseTester = false
        SendNUIMessage({
            type = "slideTester",
        })
    end
    NotifForAccept = false
end

function DisplayConfirmNotification()
    AcceptTestAction = true
    SendNUIMessage({
        type = "translation",
        div = "#officerText",
        text = _U("officer_test_request"),
    })

    SendNUIMessage({
        type = "showNotifTest",
    })
end

function HideConfirmNotification()
    SendNUIMessage({
        type = "hideNotifTest",
    })

    AcceptTestAction = false
    MinigameAcceptedAction = false
end

-------------------------------------------------
-- Thread list
-------------------------------------------------
CreateThread(function()
    while true do
        Wait(100)
        local ped = PlayerPedId()
        if not enabledTag then
            Wait(1000)
        else
            local retval, hit, endCoords, surfaceNormal, entityHit = CastRayCast(ped, 8, 10)

            if hit == 1 and lastEntity ~= entityHit then
                if IsPedAPlayer(entityHit) then
                    lastEntity = entityHit
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        if not lastEntity or not enabledTag then
            Wait(1000)
        else
            local pos = GetEntityCoords(lastEntity)
            if #(pos - GetEntityCoords(PlayerPedId())) > 10 then
                lastEntity = nil
            end
            DrawMarker(31, pos.x, pos.y, pos.z + 1.15, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 125, 125, 200, false, false, 0, true)
        end
    end
end)

-------------------------------------------------
-- Events
-------------------------------------------------
RegisterNetEvent(TriggerName("ResetPlayerState"), function()
    HideConfirmNotification()
end)

-------------------------------------------------
-- Commands
-------------------------------------------------
if Config.FrameworkType.Active ~= FrameworkType.CUSTOM then
    RegisterCommand("givetest", function()
        if IsPlayerAtJob(Config.WhitelistedJobsToTestBreath) then
            enabledTag = not enabledTag
            if lastEntity then
                TriggerServerEvent(TriggerName("ResetPlayerState"), GetPlayerServerId(NetworkGetEntityOwner(lastEntity)))
                lastEntity = nil
            end
            if enabledTag then
                TriggerEvent('chat:addMessage', { args = { "Just aim at player until you see above the player Wolf head if he is the one you want to test click left mouse to select him or right mouse to cancel the test" } })
            else
                TriggerEvent('chat:addMessage', { args = { "You do not want to give the breath test anymore... Did he paid well at least?" } })
            end
        end
    end, false)
end
-------------------------------------------------
-- Register key list
-------------------------------------------------
RegisterKey(function()
    if enabledTag then
        if lastEntity then
            enabledTag = false
            ClearPedTasksImmediately(PlayerPedId())
            TriggerServerEvent(TriggerName("PlayerGiveBreathTest"), GetPlayerServerId(NetworkGetEntityOwner(lastEntity)))
        end
    end
end, "tag_player_for_test", "Mouse left", "MOUSE_LEFT", "MOUSE_BUTTON")

RegisterKey(function()
    ResetTaggedPlayerVariables()
end, "remove_test_drunk", "Mouse right", "MOUSE_RIGHT", "MOUSE_BUTTON")

RegisterKey(CloseTesterUI, "closetesterui1", "will close ui", "escape")
RegisterKey(CloseTesterUI, "closetesterui2", "will close ui", "BACK")
