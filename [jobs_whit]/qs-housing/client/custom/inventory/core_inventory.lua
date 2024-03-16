--[[
    Here you have the configuration of stashes, you can modify it or even
    create your own! In case your inventory is not here, you can ask the
    creator to create a file following this example and add it!
]]

if Config.Inventory ~= 'core_inventory' then
    return
end

function HousingStash(id, other, mlo)
    TriggerServerEvent('core_inventory:server:openInventory', id, 'stash')
end

--[[
    Furniture stash system, choose your own weight and slots!
]]

ObjectStash = {}
