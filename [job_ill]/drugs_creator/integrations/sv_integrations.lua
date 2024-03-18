-- You can edit the events on the right side if you for any reason don't use the default event name

EXTERNAL_EVENTS_NAMES = {
    ["esx:getSharedObject"] = nil, -- This is nil because it will be found automatically, change it to your one ONLY in the case it can't be found    
}

-- If you use different names for police job, you can add/change it here, all jobs here will be used for police features (example: the alerts)
POLICE_JOBS_NAMES = {
    ["police"] = true,
    ["fbi"] = true
}

-- Skips or not if an item exists (useful with inventories that doesn't save items in database or in ESX.Items table, example ox_inventory)
SKIP_ITEM_EXISTS_CHECK = false

-- Force inventory refresh or not. Set to true if NPC selling is not working properly
FORCE_INVENTORY_REFRESH = true

--[[
    You can edit this function if you want to add second jobs or anything like that (editing this function is down to you)
    If you edit this, you WILL have also to edit the function in cl_integrations.lua file
]]
function IsPlayerJobAllowed(playerId, allowedJobs)
    if(not allowedJobs) then return true end
    
    local playerJob = Framework.getPlayerJobName(playerId)

    if(allowedJobs[playerJob] == true) then
        return true
    elseif(allowedJobs[playerJob]) then
        local playerJobGrade = tostring( Framework.getPlayerJobGrade(playerId) )

        return allowedJobs[playerJob] and allowedJobs[playerJob][playerJobGrade]
    else
        return false
    end
end