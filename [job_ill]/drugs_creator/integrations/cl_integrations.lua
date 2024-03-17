EXTERNAL_EVENTS_NAMES = {
    ["esx:getSharedObject"] = nil, -- This is nil because it will be found automatically, change it to your one ONLY in the case it can't be found
}

-- Ped models that WON'T be used for NPC selling
BLACKLISTED_PEDS_MODELS = {
    --[[
        Some examples:
        
        [ GetHashKey("a_m_o_tramp_01") ] = true,
        [ GetHashKey("csb_rashcosvki") ] = true,
        [ GetHashKey("csb_stripper_02") ] = true,
    ]]
}

--[[
    You can edit this function if you want to add second jobs or anything like that (editing this function is down to you)
    If you edit this, you WILL have also to edit the function in sv_integrations.lua file
]]
function isJobAllowed(allowedJobs)
    if(not allowedJobs) then return true end

    local playerJob = Framework.getPlayerJob()

    if(allowedJobs[playerJob] == true) then
        return true
    elseif(allowedJobs[playerJob]) then
        local playerJobGrade = tostring( Framework.getPlayerJobGrade() )

        return allowedJobs[playerJob] and allowedJobs[playerJob][playerJobGrade]
    else
        return false
    end
end

-- Set to true if you want players to be able to sell to gangster ped models
CAN_SELL_TO_GANGSTERS = false

-- How many seconds the blip for police alerts will remain in the map
BLIP_TIME_AFTER_POLICE_ALERT = 120

-- Punish players who try to cancel the exit animation of drugs fields by ragdolling them and making them to waste more time
PUNISH_PLAYERS_TRYING_TO_ESCAPE_ANIMATION = false

--[[
    Default progressbar color (must be a hex code). Examples:
    "#0fffef" - Light blue
    "#ff0f0f" - Red
    "#0f0fff" - Blue
]]
DEFAULT_PROGRESSBAR_COLOR = "#47ff33"

-- Models of peds that can be used with the command to spawn and sell drugs to ped, especially useful in a server without NPCs
AVAILABLE_PEDS_FOR_SELLING = {"a_m_m_bevhills_02", "ig_car3guy1", "u_f_y_comjane", "ig_davenorton", "csb_reporter"}