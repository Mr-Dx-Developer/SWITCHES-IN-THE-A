INSTRUCT_NONE = 'none'
INSTRUCT_PLAY = 'play'
INSTRUCT_THROW = 'throw'

BasketballInstructional = nil
InstructionalState = INSTRUCT_NONE
WantedInstructionalState = nil

Citizen.CreateThread(function()
    local lastState = nil

    while true do
        if InstructionalState == INSTRUCT_NONE then
            Wait(1000)
        else
            Wait(0)
        end

        if InstructionalState and WantedInstructionalState == INSTRUCT_NONE then
            SetScaleformMovieAsNoLongerNeeded(BasketballInstructional)
            BasketballInstructional = nil
            InstructionalState = INSTRUCT_NONE
        elseif WantedInstructionalState == INSTRUCT_PLAY then
            if InstructionalState == INSTRUCT_THROW then
                SetScaleformMovieAsNoLongerNeeded(BasketballInstructional)
                BasketballInstructional = nil
                InstructionalState = STATE_NONE
            end

            if InstructionalState ~= INSTRUCT_PLAY then
                InstructionalState = INSTRUCT_PLAY
                BasketballInstructional = setupInstructionalPlayScaleform("instructional_buttons")
            end

            DrawScaleformMovieFullscreen(BasketballInstructional, 255, 255, 255, 255, 0)
        elseif WantedInstructionalState == INSTRUCT_THROW then
            if InstructionalState == INSTRUCT_PLAY then
                SetScaleformMovieAsNoLongerNeeded(BasketballInstructional)
                BasketballInstructional = nil
                InstructionalState = STATE_NONE
            end

            if InstructionalState ~= INSTRUCT_THROW then
                InstructionalState = INSTRUCT_THROW
                BasketballInstructional = setupInstructionalThrowScaleform("instructional_buttons")
            end

            DrawScaleformMovieFullscreen(BasketballInstructional, 255, 255, 255, 255, 0)
        end
    end
end)

-- Citizen.CreateThread(function()
--     while true do
--         Wait(500)

--         WantedInstructionalState = INSTRUCT_PLAY
--         Wait(500)
--         WantedInstructionalState = INSTRUCT_THROW
--     end
-- end)

function InstructionalButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function InstructionalButton(ControlButton)
    ScaleformMovieMethodAddParamPlayerNameString(ControlButton)
end

function setupInstructionalPlayScaleform(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end

    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    local keys = {}

    if TrickCanBNR then
        table.insert(keys, Config.Controls.TRICK_BNR)
    end

    if TrickCanSpin then
        table.insert(keys, Config.Controls.TRICK_SPIN)
    end

    table.insert(keys, Config.Controls.AIM_THROW)
    

    for idx, data in ipairs(keys) do
        PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
        PushScaleformMovieFunctionParameterInt(idx-1)
        InstructionalButton(GetControlInstructionalButton(0, data.key, true))
        if data.keyHold then
            InstructionalButton(GetControlInstructionalButton(0, data.keyHold, true))
        end
        InstructionalButtonMessage(data.label)
        PopScaleformMovieFunctionVoid()
    end

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

function setupInstructionalThrowScaleform(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end

    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    local keys = {
        Config.Controls.POWER_SPEED,
        Config.Controls.LOWER_POWER,
        Config.Controls.EXIT,
        Config.Controls.AIM_LOCK,
        Config.Controls.THROW,
    }
    

    for idx, data in ipairs(keys) do
        PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
        PushScaleformMovieFunctionParameterInt(idx-1)
        if data.keyHold then
            InstructionalButton(GetControlInstructionalButton(0, data.keyHold, true))
        end
        InstructionalButton(GetControlInstructionalButton(0, data.key, true))
        InstructionalButtonMessage(data.label)
        PopScaleformMovieFunctionVoid()
    end

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
