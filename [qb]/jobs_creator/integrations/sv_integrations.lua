-- You can edit the events on the right side if you for any reason don't use the default event name

EXTERNAL_EVENTS_NAMES = {
    ["esx:getSharedObject"] = nil, -- This is nil because it will be found automatically, change it to your one ONLY in the case it can't be found
    
    ["esx_society:registerSociety"] = "esx_society:registerSociety",
    ["esx_society:getSociety"] = "esx_society:getSociety",
    
    ["esx_addonaccount:getSharedAccount"] = "esx_addonaccount:getSharedAccount",

    ["esx_datastore:getSharedDataStore"] = "esx_datastore:getSharedDataStore",
    ["esx_datastore:getDataStore"] = "esx_datastore:getDataStore",

    ["esx_ambulancejob:revive"] = "esx_ambulancejob:revive",
    ["esx_ambulancejob:heal"] = "esx_ambulancejob:heal",
}

-- Skips or not if an item exists (useful with inventories that doesn't save items in database or in ESX.Items table, example ox_inventory)
SKIP_ITEM_EXISTS_CHECK = false

--[[
    Default duty status on join for QBCore
    true = on duty
    false = off duty
    nil = use qbcore default
]]
DEFAULT_DUTY_STATUS = true