--[[
    Here you have the configuration of stashes, you can modify it or even
    create your own! In case your inventory is not here, you can ask the
    creator to create a file following this example and add it!
]]

if Config.Inventory ~= 'cheeza_inventory' then
    return
end

function HousingStash(id, other, mlo)
    if mlo then -- For MLO stashes
        TriggerEvent('inventory:openHouse', 'HouseStash', id, 'House', 50000)
    else
        TriggerEvent('inventory:openHouse', 'HouseStash', id, 'House', other.weight)
    end
end

--[[
    Furniture stash system, choose your own weight and slots!
]]

ObjectStash = {}
