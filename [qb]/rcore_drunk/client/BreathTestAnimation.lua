-------------------------------------------------
-- Variables
-------------------------------------------------
local tookAlreadyTest = false

-------------------------------------------------
-- Function list
-------------------------------------------------
function PlayBreathAnimation(IsFromSomeone)
    if IsFromSomeone then
        tookAlreadyTest = false
        Animation.Play("give")
        Wait(1500)
    end

    Animation.Play("smoke3")
    Wait(4000)

    if IsFromSomeone then
        Animation.Play("give")
        Wait(1500)
        Animation.RemoveProps()
        tookAlreadyTest = true
    else
        Animation.Play("pockethide")
        Wait(1500)
        Animation.RemoveProps()
    end
end

-------------------------------------------------
-- Event list
-------------------------------------------------
RegisterNetEvent(TriggerName("AskPlayerForTest"), function(initialPlayer)
    DisplayConfirmNotification()
    CreateThread(function()
        while true do
            Wait(1000)
            if tookAlreadyTest then
                break
            end

            if #(GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(initialPlayer))) - GetEntityCoords(PlayerPedId())) > 15 then
                HideConfirmNotification()
                break
            end
        end
    end)
end)

RegisterNetEvent(TriggerName("TakeSelfTest"), function()
    PlayBreathAnimation(false)
    ShowTesterWithValues(GetPlayerDrunkPercentage(), GetPlayerDrunkLevel())
end)

RegisterNetEvent(TriggerName("ShowResultTest"), function(drunk, level)
    ShowTesterWithValues(drunk, level)
end)

RegisterNetEvent(TriggerName("PlayerDeclinedTest"), function()
    ResetTaggedPlayerVariables()
end)

RegisterNetEvent(TriggerName("PlayerGiveBreathTest"), function(type, targetID)
    ResetTaggedPlayerVariables()
    if type == "take" then
        RotatePlayerTowardsCoords(GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(targetID))))
        Wait(1200)
        PlayBreathAnimation(true)

        TriggerServerEvent(TriggerName("ShowResultTest"), targetID, GetPlayerDrunkPercentage(), GetPlayerDrunkLevel())
    end

    if type == "give" then
        RotatePlayerTowardsCoords(GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(targetID))))
        Wait(1000)
        Animation.Play("give")
        Wait(1500 + 4000)
        Animation.Play("give")
        Wait(1500)
        Animation.Play("pockethide")
    end
end)

-------------------------------------------------
-- Register key list
-------------------------------------------------
function AcceptDrunkTest()
    if AcceptTestAction then
        TriggerServerEvent(TriggerName("AcceptTestAction"))
    end

    if not PlayingMiniGame and MinigameAcceptedAction then
        TriggerServerEvent(TriggerName("MinigameAcceptedAction"))
    end

    if not NotifForAccept then
        HideConfirmNotification()
    end
end

RegisterKey(AcceptDrunkTest, "accept_test_action_Y", "accept action", "Y")
RegisterKey(AcceptDrunkTest, "accept_test_action_Z", "accept action", "Z")

RegisterKey(function()
    if AcceptTestAction then
        TriggerServerEvent(TriggerName("DenyTestAction"))
    end

    if not PlayingMiniGame and MinigameAcceptedAction then
        TriggerServerEvent(TriggerName("MinigameDenyTestAction"))
    end

    NotifForAccept = false
    HideConfirmNotification()
end, "deny_test_action", "decline action", "N")
