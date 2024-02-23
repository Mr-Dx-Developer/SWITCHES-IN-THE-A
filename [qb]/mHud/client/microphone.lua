function setMicrophoneSettings(type, value)
    nuiMessage("SET_MICROPHONE_SETTINGS", {
        type = type,
        value = value
    })
end

local micIsOn = true
local firstCheck = true
if Config.Voice == 'mumble' or Config.Voice == 'pma' then
    RegisterNetEvent('pma-voice:setTalkingMode')
    AddEventHandler('pma-voice:setTalkingMode', function(voiceMode)
        setMicrophoneSettings('mic_level', voiceMode)
    end)

    RegisterNetEvent("mumble:SetVoiceData")
    AddEventHandler("mumble:SetVoiceData", function(player, key, value)
        if GetPlayerServerId(NetworkGetEntityOwner(playerPed)) == player and key == 'mode' then
            setMicrophoneSettings('mic_level', value)             
        end
    end)

    local checkTalkStatus = false
    CreateThread(function()

        while true do
            if NetworkIsPlayerTalking(PlayerId()) then
                if not checkTalkStatus then
                    checkTalkStatus = true
                    setMicrophoneSettings('isTalking', true)             
                end
            else
                if checkTalkStatus then
                    checkTalkStatus = false
                    setMicrophoneSettings('isTalking', false)                 
                end
            end
            Wait(800)
        end
    end)

    CreateThread(function()
        while true do
            
            if not MumbleIsConnected() then
                if micIsOn or firstCheck then
                    micIsOn = false
                    firstCheck = false                 
                    setMicrophoneSettings('isMuted', true)             

                end
            else
                if not micIsOn or firstCheck then
                    micIsOn = true
                    firstCheck = false                 
                    setMicrophoneSettings('isMuted', false)             
                end
            end
            Wait(2000)
        end
    end)
else
    RegisterNetEvent('SaltyChat_VoiceRangeChanged')
    AddEventHandler('SaltyChat_VoiceRangeChanged', function(voiceRange, index, availableVoiceRanges)
        setMicrophoneSettings('mic_level', index+1)             
    end)

    RegisterNetEvent('SaltyChat_TalkStateChanged')
    AddEventHandler('SaltyChat_TalkStateChanged', function(isTalking)
        setMicrophoneSettings('isTalking', isTalking)             
    
    end)

    RegisterNetEvent('SaltyChat_PluginStateChanged')
    AddEventHandler('SaltyChat_PluginStateChanged', function(state)
        if state == 0 or state == -1 then
            setMicrophoneSettings('isMuted', true)             
        elseif state == 2 then
            setMicrophoneSettings('isMuted', false)             
        end
    end)

    RegisterNetEvent('SaltyChat_MicStateChanged')
    AddEventHandler('SaltyChat_MicStateChanged', function(isMicrophoneMuted)

        if isMicrophoneMuted then
            setMicrophoneSettings('isMuted', true)             
        else
            setMicrophoneSettings('isMuted', false)             
        end
   end)
end